ifneq ($(CROSS_COMPILE),)
CROSS-COMPILE:=$(CROSS_COMPILE)
endif
#CROSS-COMPILE:=/workspace/buildroot/buildroot-qemu_mips_malta_defconfig/output/host/usr/bin/mips-buildroot-linux-uclibc-
#CROSS-COMPILE:=/workspace/buildroot/buildroot-qemu_arm_vexpress_defconfig/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-
#CROSS-COMPILE:=/workspace/buildroot-git/qemu_mips64_malta/output/host/usr/bin/mips-gnu-linux-
CC:=$(CROSS-COMPILE)gcc
LD:=$(CROSS-COMPILE)ld

release: clean
	$(CC) -Wall -s QmiWwanCM.c GobiNetCM.c main.c MPQMUX.c QMIThread.c util.c udhcpc.c -o MeiG-CM -lpthread
debug: clean
	$(CC) -Wall -g QmiWwanCM.c GobiNetCM.c main.c MPQMUX.c QMIThread.c util.c udhcpc.c -o MeiG-CM -lpthread


install:
	@echo "Install MeiG-CM..."
	mkdir -p $(MAKE_ROOT_DIR)/usr/bin/
	install -m 755  MeiG-CM   $(MAKE_ROOT_DIR)/usr/bin/
	$(STRIP)   $(MAKE_ROOT_DIR)/usr/bin/MeiG-CM

uninstall:
	@echo "Uninstall mobistatus..."
	rm -rf $(MAKE_ROOT_DIR)/usr/bin/MeiG-CM

	
clean:
	rm -rf MeiG-CM

