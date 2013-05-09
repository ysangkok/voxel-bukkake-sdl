#CC=gcc
CC=tcc
#CC=clang-3.2
#CFLAGS_DEBUG=-std=c99 -Wall -Wextra $(shell sdl-config --cflags) -DDEBUG
CFLAGS_DEBUG=-Wall -Wextra $(shell sdl-config --cflags) -DDEBUG
	
LDFLAGS_DEBUG=-ldl -lpthread -lm

debug: maind
	
maind: maind.o synthd.o dl_initd.o
	$(CC) -o $@ $^ $(LDFLAGS_DEBUG)

maind.o: main.c
	$(CC) $(CFLAGS_DEBUG) -c -o $@ $<

synthd.o: synth.c synth.h 
	$(CC) $(CFLAGS_DEBUG) -c -o $@ $<

playd.o: play.c play.h song.h
	$(CC) $(CFLAGS_DEBUG) -c -o $@ $<

dl_initd.o: dl_init.c dl_init.h 
	$(CC) $(CFLAGS_DEBUG) -c -o $@ $<

clean:
	rm -f *.o maind *~

.PHONY: clean

