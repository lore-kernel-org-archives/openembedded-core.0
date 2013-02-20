Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U86xl-0007ch-ES
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 11:31:46 +0100
Message-ID: <5124A245.2080908@communistcode.co.uk>
Date: Wed, 20 Feb 2013 10:15:33 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Binutils failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 10:31:46 -0000
X-Groupsio-MsgNum: 35678
Content-Type: multipart/mixed; boundary="------------080605020408000706010306"

--------------080605020408000706010306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

My daily pull and build showed up a binutils failure today.

Please see attached.

Build Configuration:
BB_VERSION        = "1.17.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Unknown"
TARGET_SYS        = "arm-oecore-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "dblinux"
DISTRO_VERSION    = "1.0-20130220"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta              = "master:3a88e125abc079a9ec356d9c7fc539ac931a0617"
meta-ti           = "master:988829b7f61ed78ee6ce359c951ba156bc4b49db"
meta-dblinux      = "master:c1b200a3caad6abd5122aec1ea2cd5093914a6ed"
meta-webserver    = "master:61911b23099c2658186179504ded318c987b5276"
meta-db           = "master:8837405a14f0a596f9da5669dae541a24df97d28"

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------080605020408000706010306
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.21379"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_compile.21379"

DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 7
make[1]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi'
mkdir -p -- ./intl
make[1]: Nothing to be done for `all-target'.
Configuring in ./intl
mkdir -p -- ./libiberty
mkdir -p -- ./etc
Configuring in ./libiberty
Configuring in ./etc
configure: creating cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=5000000
configure: creating cache ./config.cache
checking for a BSD-compatible install... /usr/bin/install -c
configure: updating cache ./config.cache
configure: creating ./config.status
configure: creating cache ./config.cache
checking whether make sets $(MAKE)... yes
checking for a BSD-compatible install... /usr/bin/install -c
checking whether NLS is requested... yes
checking for msgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
config.status: creating Makefile
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... make[2]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/etc'
for f in standards.info configure.info; do \
  if test -f /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/etc/`echo $f | sed -e 's/.info$/.texi/'`; then \
    if make "MAKEINFO=makeinfo --split-size=5000000 --split-size=5000000" $f; then \
      true; \
    else \
      exit 1; \
    fi; \
  fi; \
done
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/etc'
make[3]: `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/etc/standards.info' is up to date.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/etc'
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/etc'
make[3]: `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/etc/configure.info' is up to date.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/etc'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/etc'

checking for suffix of object files... checking for perl... perl
checking build system type... o
checking whether we are using the GNU C compiler... x86_64-pc-linux-gnu
checking host system type... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... none needed
checking build system type... x86_64-pc-linux-gnu
checking host system type... checking for C compiler default output file name... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking for library containing strerror... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... none required
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking for an ANSI C-conforming const... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... yes
checking for inline... yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... inline
checking for sys/types.h... none needed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... yes
checking for sys/stat.h... 64
yes
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
checking for stdlib.h... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -W... checking for string.h... yes
yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -Wall... checking for memory.h... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -Wwrite-strings... yes
yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -Wc++-compat... checking for strings.h... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -Wstrict-prototypes... yes
checking for inttypes.h... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -pedantic ... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone and cc understand -c and -o together... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for off_t... yes
checking for size_t... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for working alloca.h... yes
yes
checking for alloca... checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
yes
checking for string.h... checking for stdlib.h... (cached) yes
yes
checking for unistd.h... (cached) yes
checking for getpagesize... checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for working mmap... no
yes
checking whether we are using the GNU C Library 2.1 or newer... yes
checking whether integer division by zero raises SIGFPE... guessing no
checking for inttypes.h... checking for stdint.h... yes
yes
checking for stdint.h... checking for unistd.h... yes
checking whether byte ordering is bigendian... yes
checking for unsigned long long... yes
checking for inttypes.h... yes
checking whether the inttypes.h PRIxNN macros are broken... no
checking for a BSD-compatible install... /usr/bin/install -c
checking for sys/file.h... no
checking for ld used by GCC... yes
arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... yes
checking for shared library run path origin... checking for sys/param.h... yes
done
checking for limits.h... checking argz.h usability... yes
checking for stdlib.h... (cached) yes
checking for malloc.h... yes
yes
checking argz.h presence... yes
checking for argz.h... yes
checking for string.h... (cached) yes
checking limits.h usability... checking for unistd.h... (cached) yes
checking for strings.h... (cached) yes
checking for sys/time.h... yes
checking for time.h... yes
checking limits.h presence... yes
checking for sys/resource.h... yes
checking for limits.h... yes
checking locale.h usability... yes
checking for sys/stat.h... (cached) yes
checking for sys/mman.h... yes
checking for fcntl.h... yes
checking locale.h presence... yes
checking for locale.h... yes
yes
checking nl_types.h usability... checking for alloca.h... yes
checking for sys/pstat.h... no
checking for sys/sysmp.h... no
checking for sys/sysinfo.h... yes
checking nl_types.h presence... yes
checking for nl_types.h... yes
yes
checking malloc.h usability... checking for machine/hal_sysinfo.h... no
checking for sys/table.h... no
checking for sys/sysctl.h... yes
checking for sys/systemcfg.h... yes
checking malloc.h presence... no
checking for stdint.h... (cached) yes
yes
checking for malloc.h... yes
checking for stdio_ext.h... checking stddef.h usability... yes
checking for process.h... no
checking for sys/prctl.h... yes
checking stddef.h presence... yes
yes
checking for stddef.h... yes
checking for sys/wait.h that is POSIX.1 compatible... checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for unistd.h... (cached) yes
checking sys/param.h usability... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether errno must be declared... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking for feof_unlocked... no
checking size of int... yes
checking for fgets_unlocked... yes
checking for getc_unlocked... yes
checking for getcwd... 4
checking for a 64-bit type... yes
checking for getegid... uint64_t
checking for intptr_t... yes
checking for geteuid... yes
checking for uintptr_t... yes
checking for getgid... yes
checking for getuid... yes
checking for ssize_t... yes
checking for mempcpy... yes
checking for pid_t... yes
checking for munmap... yes
yes
checking for library containing strerror... checking for putenv... none required
yes
checking for asprintf... checking for setenv... yes
checking for atexit... yes
yes
checking for setlocale... checking for basename... yes
checking for bcmp... yes
checking for stpcpy... yes
checking for bcopy... yes
checking for strcasecmp... yes
checking for bsearch... yes
yes
checking for strdup... checking for bzero... yes
yes
checking for strtoul... checking for calloc... yes
checking for tsearch... yes
checking for clock... yes
checking for __argz_count... yes
checking for ffs... yes
checking for __argz_stringify... yes
checking for getcwd... yes
checking for __argz_next... yes
checking for getpagesize... yes
checking for __fsetlocking... yes
checking for gettimeofday... yes
checking for iconv... yes
checking for index... yes
checking for iconv declaration... install-shextern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for nl_langinfo and CODESET... yes
checking for insque... yes
checking for LC_MESSAGES... yes
yes
checking for bison... bison
checking version of bison... checking for memchr... 2.7, ok
checking whether NLS is requested... yes
checking whether included gettext is requested... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
yes
checking for memcmp... configure: updating cache ./config.cache
configure: creating ./config.status
yes
checking for memcpy... yes
checking for memmem... yes
checking for memmove... config.status: creating Makefile
config.status: creating config.intl
config.status: creating config.h
yes
checking for mempcpy... config.status: executing default-1 commands
yes
checking for memset... mkdir -p -- ./binutils
Configuring in ./binutils
mkdir -p -- ./gas
Configuring in ./gas
make[2]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/intl'
mkdir -p -- ./gprof
mkdir -p -- ./ld
yes
Configuring in ./gprof
Configuring in ./ld
checking for mkstemps... yes
checking for putenv... yes
checking for random... yes
checking for rename... yes
checking for rindex... configure: creating cache ./config.cache
configure: creating cache ./config.cache
checking build system type... checking build system type... yes
x86_64-pc-linux-gnu
checking host system type... checking for setenv... configure: creating cache ./config.cache
arm-oecore-linux-gnueabi
checking target system type... x86_64-pc-linux-gnu
checking host system type... checking build system type... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
configure: creating cache ./config.cache
arm-oecore-linux-gnueabi
checking target system type... yes
x86_64-pc-linux-gnu
checking host system type... checking for snprintf... checking build system type... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking for C compiler default output file name... x86_64-pc-linux-gnu
checking host system type... arm-oecore-linux-gnueabi
checking target system type... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
yes
arm-oecore-linux-gnueabi
checking target system type... checking for C compiler default output file name... checking for sigsetmask... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... yes
a.out
checking whether the C compiler works... yes
checking for stpcpy... checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for C compiler default output file name... checking for suffix of object files... checking for C compiler default output file name... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... a.out
checking whether the C compiler works... yes
yes
checking whether we are cross compiling... yes
checking for suffix of executables... checking for stpncpy... o
checking whether we are using the GNU C compiler... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... 
checking for suffix of object files... 
checking for suffix of object files... yes
o
checking whether we are using the GNU C compiler... yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... checking for strcasecmp... o
checking whether we are using the GNU C compiler... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... none needed
checking for library containing strerror... yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... none needed
checking for library containing strerror... yes
checking for strchr... yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... none required
none needed
checking for library containing strerror... checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... none required
none needed
checking for library containing strerror... checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for strdup... none required
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... none required
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for strncasecmp... yes
checking for strndup... yes
checking for strrchr... yes
checking for strstr... yes
checking for strtod... yes
checking for strtol... yes
checking for strtoul... yes
checking for strverscmp... yes
checking for tmpnam... yes
checking for vasprintf... yes
checking for vfprintf... yes
checking for vprintf... yes
checking for vsnprintf... yes
checking for vsprintf... yes
checking for waitpid... yes
checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-strip
checking for a thread-safe mkdir -p... yes
/usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
yes
checking for style of include used by make... checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-strip
checking for a thread-safe mkdir -p... yes
/usr/bin/mkdir -p
GNU
checking for gawk... gawk
checking whether make sets $(MAKE)... checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-strip
checking for a thread-safe mkdir -p... checking dependency style of arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking for arm-oecore-linux-gnueabi-gcc... (cached) arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
/usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... checking for setproctitle... yes
yes
yes
checking for style of include used by make... checking for style of include used by make... GNU
checking dependency style of arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking for arm-oecore-linux-gnueabi-gcc... (cached) arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... (cached) yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... (cached) none needed
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
GNU
checking for style of include used by make... checking dependency style of arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking for arm-oecore-linux-gnueabi-gcc... (cached) arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... (cached) yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... (cached) none needed
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
GNU
checking dependency style of arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking whether to enable maintainer-specific portions of Makefiles... no
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
no
checking whether alloca needs Cray hooks... checking for grep that handles long lines and -e... checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... (cached) yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... (cached) /usr/bin/grep
none needed
checking for egrep... checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
/usr/bin/grep -E
checking for ANSI C header files... no
checking stack direction for C alloca... 0
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for grep that handles long lines and -e... checking for ANSI C header files... checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... /usr/bin/grep -E
checking for vfork.h... Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
checking for LC_MESSAGES... no
checking for fork... yes
checking for sys/types.h... yes
yes
checking for sys/types.h... checking for sys/types.h... yes
checking for arm-oecore-linux-gnueabi-gcc... (cached) arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
yes
yes
checking for sys/stat.h... checking for vfork... yes
yes
checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... (cached) yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... (cached) none needed
checking for sys/stat.h... yes
checking for sys/stat.h... checking whether we are using the GNU C++ compiler... yes
yes
yes
yes
checking whether arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... checking for working fork... cross
configure: WARNING: result yes guessed because of cross compilation
checking for working vfork... (cached) yes
checking for _doprnt... checking for stdlib.h... checking for stdlib.h... checking for stdlib.h... yes
yes
yes
checking dependency style of arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking for ANSI C header files... yes
checking for string.h... no
checking for sys_errlist... checking for string.h... checking for string.h... yes
yes
checking for memory.h... yes
checking for sys_nerr... yes
checking for memory.h... yes
checking for sys/types.h... yes
checking for memory.h... yes
checking for strings.h... yes
yes
yes
checking for strings.h... checking for strings.h... checking for sys_siglist... checking for sys/stat.h... yes
yes
checking for inttypes.h... yes
checking for inttypes.h... yes
checking for stdlib.h... checking for inttypes.h... yes
yes
checking for external symbol _system_configuration... yes
yes
yes
checking for stdint.h... checking for stdint.h... checking for string.h... no
checking for stdint.h... yes
yes
checking for __fsetlocking... checking for unistd.h... checking for memory.h... yes
yes
checking for unistd.h... yes
yes
yes
checking for unistd.h... checking minix/config.h usability... checking for strings.h... checking for canonicalize_file_name... yes
checking minix/config.h usability... yes
no
checking minix/config.h presence... yes
checking for inttypes.h... yes
checking minix/config.h usability... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... no
checking minix/config.h presence... checking for dup3... yes
no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking minix/config.h presence... checking for stdint.h... yes
checking for getrlimit... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... yes
64
checking how to print strings... printf
checking for a sed that does not truncate output... yes
yes
/usr/bin/sed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... checking for fgrep... checking for unistd.h... checking for getrusage... /usr/bin/grep -F
checking for ld used by arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... 64
yes
checking how to print strings... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... printf
checking for a sed that does not truncate output... yes
checking for BSD- or MS-compatible name lister (nm)... arm-oecore-linux-gnueabi-nm
checking the name lister (arm-oecore-linux-gnueabi-nm) interface... /usr/bin/sed
checking minix/config.h usability... checking for fgrep... /usr/bin/grep -F
checking for ld used by arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... 64
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... yes
/usr/bin/grep -F
checking for ld used by arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... no
checking minix/config.h presence... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... checking for getsysinfo... yes
checking for BSD- or MS-compatible name lister (nm)... arm-oecore-linux-gnueabi-nm
checking the name lister (arm-oecore-linux-gnueabi-nm) interface... 1572864
checking whether the shell understands some XSI constructs... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... yes
checking whether the shell understands "+="... yes
yes
checking for BSD- or MS-compatible name lister (nm)... arm-oecore-linux-gnueabi-nm
checking the name lister (arm-oecore-linux-gnueabi-nm) interface... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... checking how to convert x86_64-pc-linux-gnu file names to arm-oecore-linux-gnueabi format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for arm-oecore-linux-gnueabi-ld option to reload object files... -r
checking for arm-oecore-linux-gnueabi-objdump... arm-oecore-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-oecore-linux-gnueabi-dlltool... arm-oecore-linux-gnueabi-dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for archiver @FILE support... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... no
yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... 1572864
checking whether the shell understands some XSI constructs... checking for gettimeofday... (cached) yes
yes
yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-pc-linux-gnu file names to arm-oecore-linux-gnueabi format... checking for on_exit... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for arm-oecore-linux-gnueabi-ld option to reload object files... -r
checking for arm-oecore-linux-gnueabi-objdump... arm-oecore-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-oecore-linux-gnueabi-dlltool... arm-oecore-linux-gnueabi-dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for archiver @FILE support... @
checking for arm-oecore-linux-gnueabi-strip... (cached) arm-oecore-linux-gnueabi-strip
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking command to parse arm-oecore-linux-gnueabi-nm output from arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone object... checking how to convert x86_64-pc-linux-gnu file names to arm-oecore-linux-gnueabi format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for arm-oecore-linux-gnueabi-ld option to reload object files... -r
checking for arm-oecore-linux-gnueabi-objdump... arm-oecore-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-oecore-linux-gnueabi-dlltool... arm-oecore-linux-gnueabi-dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for archiver @FILE support... @
checking for arm-oecore-linux-gnueabi-strip... (cached) arm-oecore-linux-gnueabi-strip
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking command to parse arm-oecore-linux-gnueabi-nm output from arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone object... 64
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
yes
checking for fgrep... /usr/bin/grep -F
checking for ld used by arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... @
checking for arm-oecore-linux-gnueabi-strip... (cached) arm-oecore-linux-gnueabi-strip
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking command to parse arm-oecore-linux-gnueabi-nm output from arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone object... yes
checking for BSD- or MS-compatible name lister (nm)... arm-oecore-linux-gnueabi-nm
checking the name lister (arm-oecore-linux-gnueabi-nm) interface... checking for psignal... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... ok
checking for sysroot... 1572864
checking whether the shell understands some XSI constructs... ok
yes
checking whether the shell understands "+="... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
yes
checking for sysroot... checking for arm-oecore-linux-gnueabi-mt... no
checking for mt... no
checking if : is a manifest tool... yes
/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking for arm-oecore-linux-gnueabi-mt... no
checking for mt... no
checking if : is a manifest tool... checking how to convert x86_64-pc-linux-gnu file names to arm-oecore-linux-gnueabi format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for arm-oecore-linux-gnueabi-ld option to reload object files... -r
checking for arm-oecore-linux-gnueabi-objdump... arm-oecore-linux-gnueabi-objdump
no
checking how to recognize dependent libraries... pass_all
checking for arm-oecore-linux-gnueabi-dlltool... arm-oecore-linux-gnueabi-dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for archiver @FILE support... checking for dlfcn.h... no
checking for dlfcn.h... checking for pstat_getdynamic... yes
ok
checking for sysroot... checking for objdir... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking for arm-oecore-linux-gnueabi-mt... no
checking for mt... .libs
no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... @
checking for arm-oecore-linux-gnueabi-strip... (cached) arm-oecore-linux-gnueabi-strip
no
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking command to parse arm-oecore-linux-gnueabi-nm output from arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone object... .libs
checking for pstat_getstatic... yes
checking for objdir... .libs
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -fno-rtti -fno-exceptions... no
checking for realpath... checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -fno-rtti -fno-exceptions... no
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... ok
checking for sysroot... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking for arm-oecore-linux-gnueabi-mt... no
checking for mt... no
checking if : is a manifest tool... yes
no
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... no
checking for dlfcn.h... checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -fno-rtti -fno-exceptions... checking for setrlimit... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works... yes
checking for objdir... .libs
no
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... yes
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works... checking for sbrk... checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -fno-rtti -fno-exceptions... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... yes
no
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... checking for spawnve... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... no
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... checking for spawnvpe... yes
checking whether -lc should be explicitly linked in... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... yes
checking whether -lc should be explicitly linked in... no
no
checking dynamic linker characteristics... no
checking dynamic linker characteristics... checking for strerror... no
checking dynamic linker characteristics... yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
yes
checking for strsignal... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
checking for bison... yes
bison -y
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for flex... flex
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... checking lex output file root... lex.yy
checking lex library... Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
checking whether byte ordering is bigendian... yes
checking whether -lc should be explicitly linked in... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking for sysconf... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for setmode... no
checking dynamic linker characteristics... yes
checking for sysctl... no
checking whether NLS is requested... yes
checking for catalogs to be installed... no
yes
checking for sysmp... checking for bison... bison -y
checking for flex... flex
GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking lex output file root... lex.yy
checking lex library... checking how to run the C++ preprocessor... no
checking for table... arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -E
no
checking for times... yes
checking for ld used by arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... checking for wait3... yes
checking whether the arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... yes
yes
checking for wait4... yes
checking whether basename is declared... no
checking whether ffs is declared... checking for arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... yes
checking if arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works...  bg da de eo es fi fr ga id it ja ms nl pt_BR ro ru rw sr sv tr uk vi bg da de eo es fi fr ga id it ja ms nl pt_BR ro ru rw sr sv tr uk vi
checking whether NLS is requested... yes
checking for msgfmt... yes
/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking whether asprintf is declared... -lfl
checking whether yytext is a pointer... checking whether to enable maintainer-specific portions of Makefiles... no
checking sys/gmon_out.h usability... yes
checking sys/gmon_out.h presence... no
yes
checking for sys/gmon_out.h... yes
checking for a known getopt prototype in unistd.h... checking whether vasprintf is declared... yes
-lfl
checking whether yytext is a pointer... checking for library containing fabs... yes
checking if arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... no
checking whether snprintf is declared... yes
checking if arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether NLS is requested... yes
checking for catalogs to be installed... yes
checking whether vsnprintf is declared... yes
checking whether calloc is declared... yes
checking whether NLS is requested... yes
checking for catalogs to be installed... -lm
yes
checking whether getenv is declared... Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
configure: updating cache ./config.cache
yes
checking whether getopt is declared... configure: creating ./config.status
yes
 bg da es fi fr ga id it ja sv tr uk vi zh_CN zh_TW bg da es fi fr ga id it ja sv tr uk vi zh_CN zh_TW
checking whether NLS is requested... yes
checking whether NLS is requested... yes
checking for catalogs to be installed... checking for msgfmt... yes
/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking whether malloc is declared... checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking for bison... bison -y
checking for flex... flex
yes
checking lex output file root... lex.yy
checking lex library... checking whether realloc is declared...  es fi fr id ja ru rw tr es fi fr id ja ru rw tr
checking whether NLS is requested... yes
checking for msgfmt... yes
/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking whether sbrk is declared... checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking whether to enable maintainer-specific portions of Makefiles... no
checking for string.h... (cached) yes
yes
checking whether strverscmp is declared...  bg da es fi fr id it ja ro ru rw sk sv tr uk vi zh_CN zh_TW bg da es fi fr id it ja ro ru rw sk sv tr uk vi zh_CN zh_TW
checking whether NLS is requested... yes
checking for stdlib.h... (cached) yes
checking for msgfmt... checking for memory.h... (cached) yes
/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for strings.h... (cached) yes
checking for msgmerge... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
no
checking whether canonicalize_file_name must be declared... checking for unistd.h... (cached) yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for arm-oecore-linux-gnueabi-ranlib... (cached) arm-oecore-linux-gnueabi-ranlib
checking for build system executable suffix... no
checking errno.h usability... checking for string.h... (cached) yes
checking for strings.h... (cached) yes
yes
yes
checking errno.h presence... checking for stdlib.h... (cached) yes
checking for stdlib.h... (cached) yes
yes
checking for errno.h... yes
checking for unistd.h... (cached) yes
checking for unistd.h... (cached) yes
checking for sys/types.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... no
checking for working strncmp... yes
checking fcntl.h usability... checking limits.h usability... configure: updating cache ./config.cache
configure: creating ./config.status
yes
checking fcntl.h presence... yes
checking limits.h presence... yes
checking for fcntl.h... yes
yes
checking for limits.h... yes
checking sys/file.h usability... checking locale.h usability... yes
checking sys/file.h presence... yes
checking locale.h presence... yes
checking for locale.h... yes
yes
checking for sys/file.h... yes
checking time.h usability... checking limits.h usability... config.status: creating Makefile
yes
checking time.h presence... yes
checking for time.h... yes
config.status: creating testsuite/Makefile
yes
checking limits.h presence... checking for sys/stat.h... (cached) yes
yes
checking for limits.h... yes
-lfl
checking whether yytext is a pointer... checking whether string.h and strings.h may both be included... checking locale.h usability... config.status: creating config.h
config.status: executing default commands
yes
checking whether compiling a cross-assembler... no
checking for working alloca.h... yes
checking locale.h presence... yes
checking for locale.h... yes
checking sys/param.h usability... mkdir -p -- ./bfd
yes
checking for alloca... Configuring in ./bfd
mkdir -p -- ./opcodes
yes
checking sys/param.h presence... Configuring in ./opcodes
yes
checking for sys/param.h... yes
make[2]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/libiberty'
if [ x"-fPIC" != x ] && [ ! -d pic ]; then \
  mkdir pic; \
else true; fi
touch stamp-picdir
checking wchar.h usability... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/dwarfnames.c -o pic/dwarfnames.o; \
else true; fi
yes
checking for inline... yes
checking wchar.h presence... inline
checking for unlink... yes
checking for wchar.h... yes
checking for sys/wait.h that is POSIX.1 compatible... config.status: creating Makefile
yes
config.status: creating po/Makefile.in
yes
checking whether string.h and strings.h may both be included... checking for sbrk... config.status: creating gconfig.h
yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/dwarfnames.c -o dwarfnames.o
yes
checking for working alloca.h... checking whether to enable maintainer-specific portions of Makefiles... no
checking how to compare bootstrapped objects... config.status: executing depfiles commands
config.status: executing libtool commands
cmp --ignore-initial=16 $$f1 $$f2
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
yes
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
yes
checking for alloca... checking elf-hints.h usability... checking for setlocale... yes
checking for sbrk... yes
no
checking elf-hints.h presence... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/dyn-string.c -o pic/dyn-string.o; \
else true; fi
config.status: executing default-1 commands
configure: creating cache ./config.cache
checking for LC_MESSAGES... no
checking for elf-hints.h... no
checking limits.h usability... yes
checking build system type... config.status: creating po/POTFILES
checking for utimes... config.status: creating po/Makefile
yes
checking limits.h presence... x86_64-pc-linux-gnu
checking host system type... yes
checking for limits.h... yes
arm-oecore-linux-gnueabi
checking target system type... yes
checking for working assert macro... yes
checking locale.h usability... checking for setmode... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/dyn-string.c -o dyn-string.o
arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fdmatch.c -o pic/fdmatch.o; \
else true; fi
yes
checking locale.h presence... configure: creating cache ./config.cache
yes
checking for locale.h... yes
yes
checking whether declaration is required for errno... checking build system type... checking sys/param.h usability... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fdmatch.c -o fdmatch.o
no
checking for getc_unlocked... checking for C compiler default output file name... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fibheap.c -o pic/fibheap.o; \
else true; fi
yes
checking sys/param.h presence... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/filename_cmp.c -o pic/filename_cmp.o; \
else true; fi
x86_64-pc-linux-gnu
checking host system type... no
checking for a known getopt prototype in unistd.h... yes
checking for sys/param.h... yes
yes
arm-oecore-linux-gnueabi
checking target system type... checking fcntl.h usability... yes
checking whether declaration is required for environ... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/filename_cmp.c -o filename_cmp.o
checking for strcoll... arm-oecore-linux-gnueabi
checking for arm-oecore-linux-gnueabi-gcc... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/floatformat.c -o pic/floatformat.o; \
else true; fi
yes
checking fcntl.h presence... checking for C compiler default output file name... yes
checking for fcntl.h... yes
no
checking whether declaration is required for ffs... 
checking for suffix of object files... yes
checking for setlocale... o
checking whether we are using the GNU C compiler... checking sys/file.h usability... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fibheap.c -o fibheap.o
a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... yes
no
checking whether declaration is required for free... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/floatformat.c -o floatformat.o
yes
checking sys/file.h presence... 
checking for suffix of object files... checking for mkstemp... yes
checking for sys/file.h... yes
yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... checking sys/time.h usability... o
checking whether we are using the GNU C compiler... yes
checking for mkdtemp... no
checking whether declaration is required for malloc... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fnmatch.c -o pic/fnmatch.o; \
else true; fi
none needed
checking for library containing strerror... yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... yes
checking sys/time.h presence... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fnmatch.c -o fnmatch.o
yes
checking for sys/time.h... yes
yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fopen_unlocked.c -o pic/fopen_unlocked.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getopt.c -o pic/getopt.o; \
else true; fi
checking for sys/stat.h... (cached) yes
yes
checking for mbstate_t... none required
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getopt.c -o getopt.o
checking whether string.h and strings.h may both be included... none needed
checking for library containing strerror... no
checking whether declaration is required for sbrk... yes
checking for library containing frexp... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/fopen_unlocked.c -o fopen_unlocked.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getopt1.c -o pic/getopt1.o; \
else true; fi
yes
checking for glob... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getopt1.c -o getopt1.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getpwd.c -o pic/getpwd.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getruntime.c -o pic/getruntime.o; \
else true; fi
none required
no
checking whether declaration is required for strstr... checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... none required
checking for LC_MESSAGES... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getruntime.c -o getruntime.o
checking for mkstemp... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/getpwd.c -o getpwd.o
no
checking whether free is declared... yes
checking for time_t in time.h... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/hashtab.c -o pic/hashtab.o; \
else true; fi
yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/hex.c -o pic/hex.o; \
else true; fi
checking for realpath... yes
checking for time_t in sys/types.h... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/hex.c -o hex.o
checking whether getenv is declared... yes
checking for a known getopt prototype in unistd.h... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/lbasename.c -o pic/lbasename.o; \
else true; fi
yes
yes
yes
checking for utime.h... checking whether malloc is declared... checking for sbrk... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/lbasename.c -o lbasename.o
yes
checking whether fprintf is declared... yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/lrealpath.c -o pic/lrealpath.o; \
else true; fi
checking whether mempcpy is declared... yes
checking for setlocale... yes
checking whether stpcpy is declared... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/lrealpath.c -o lrealpath.o
yes
checking whether realloc is declared... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/hashtab.c -o hashtab.o
yes
checking whether strstr is declared... checking for waitpid... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/make-relative-prefix.c -o pic/make-relative-prefix.o; \
else true; fi
yes
yes
checking whether stpcpy is declared... checking whether sbrk is declared... yes
yes
yes
checking whether strstr is declared... checking whether getenv is declared... checking for open... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/make-relative-prefix.c -o make-relative-prefix.o
yes
yes
checking whether vsnprintf is declared... checking for lseek... yes
checking whether environ is declared... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/make-temp-file.c -o pic/make-temp-file.o; \
else true; fi
yes
checking for library containing zlibVersion... yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/objalloc.c -o pic/objalloc.o; \
else true; fi
checking for close... yes
yes
checking whether getc_unlocked is declared... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/make-temp-file.c -o make-temp-file.o
checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/objalloc.c -o objalloc.o
checking for dirent.h that defines DIR... yes
yes
checking whether snprintf is declared... yes
checking for library containing opendir... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/obstack.c -o pic/obstack.o; \
else true; fi
-lz
checking zlib.h usability... checking for style of include used by make... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/partition.c -o pic/partition.o; \
else true; fi
GNU
yes
yes
checking dependency style of arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-strip
checking for arm-oecore-linux-gnueabi-ranlib... checking for a thread-safe mkdir -p... arm-oecore-linux-gnueabi-ranlib
checking for arm-oecore-linux-gnueabi-gcc... (cached) arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
/usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/obstack.c -o obstack.o
yes
checking zlib.h presence... none required
checking for dlfcn.h... (cached) yes
checking for library containing dlopen... yes
checking for style of include used by make... GNU
checking whether vsnprintf is declared... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pexecute.c -o pic/pexecute.o; \
else true; fi
yes
checking for zlib.h... yes
checking for struct tm.tm_gmtoff in time.h... checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... (cached) yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/partition.c -o partition.o
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... (cached) none needed
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
checking dependency style of arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... none
checking for arm-oecore-linux-gnueabi-gcc... (cached) arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking whether we are using the GNU C compiler... (cached) yes
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone accepts -g... (cached) yes
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to accept ISO C89... (cached) none needed
checking how to run the C preprocessor... arm-oecore-linux-gnueabi-gcc -E --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pexecute.c -o pexecute.o
yes
checking for struct stat.st_mtim.tv_sec in sys/stat.h... yes
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... checking for library containing zlibVersion... /usr/bin/grep -E
checking for ANSI C header files... checking for grep that handles long lines and -e... yes
checking for struct stat.st_mtim.tv_nsec in sys/stat.h... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/physmem.c -o pic/physmem.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pex-common.c -o pic/pex-common.o; \
else true; fi
-ldl
yes
checking for dlopen... yes
yes
checking for sys/types.h... checking for sys/types.h... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/physmem.c -o physmem.o
-lz
checking zlib.h usability... yes
yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pex-one.c -o pic/pex-one.o; \
else true; fi
configure: updating cache ./config.cache
configure: creating ./config.status
checking for sys/stat.h... checking for sys/stat.h... yes
yes
checking zlib.h presence... checking for dlsym... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pex-one.c -o pex-one.o
yes
yes
checking for zlib.h... yes
checking iconv.h usability... checking for stdlib.h... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pex-unix.c -o pic/pex-unix.o; \
else true; fi
yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pex-common.c -o pex-common.o
checking for stdlib.h... yes
yes
checking for dlclose... yes
checking iconv.h presence... checking for string.h... yes
yes
checking for iconv.h... yes
checking for ld used by GCC... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... yes
checking for shared library run path origin... checking for string.h... yes
yes
checking for memory.h... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/pex-unix.c -o pex-unix.o
checking for .preinit_array/.init_array/.fini_array support... no
checking for a known getopt prototype in unistd.h... yes
yes
checking whether strstr is declared... done
yes
checking for memory.h... checking for iconv... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/safe-ctype.c -o pic/safe-ctype.o; \
else true; fi
checking for strings.h... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object.c -o pic/simple-object.o; \
else true; fi
yes
yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/safe-ctype.c -o safe-ctype.o
checking for strings.h... yes
checking whether free is declared... checking for inttypes.h... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object-coff.c -o pic/simple-object-coff.o; \
else true; fi
yes
checking for iconv declaration... yes
yes
checking for inttypes.h... install-shextern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
yes
checking whether sbrk is declared... checking for stdint.h... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object.c -o simple-object.o
yes
yes
yes
checking for stdint.h... checking whether getenv is declared... configure: updating cache ./config.cache
configure: creating ./config.status
checking for unistd.h... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object-coff.c -o simple-object-coff.o
yes
checking for unistd.h... yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object-elf.c -o pic/simple-object-elf.o; \
else true; fi
checking minix/config.h usability... checking whether environ is declared... no
checking minix/config.h presence... yes
checking minix/config.h usability... yes
checking for library containing zlibVersion... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
no
checking minix/config.h presence... checking for fgrep... /usr/bin/grep -F
checking for ld used by arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... arm-oecore-linux-gnueabi-nm
checking the name lister (arm-oecore-linux-gnueabi-nm) interface... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object-mach-o.c -o pic/simple-object-mach-o.o; \
else true; fi
-lz
checking zlib.h usability... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... yes
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ranlib
checking how to print strings... printf
checking for a sed that does not truncate output... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object-elf.c -o simple-object-elf.o
1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
/usr/bin/sed
yes
checking zlib.h presence... checking for fgrep... checking how to convert x86_64-pc-linux-gnu file names to arm-oecore-linux-gnueabi format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for arm-oecore-linux-gnueabi-ld option to reload object files... -r
checking for arm-oecore-linux-gnueabi-objdump... arm-oecore-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-oecore-linux-gnueabi-dlltool... arm-oecore-linux-gnueabi-dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for arm-oecore-linux-gnueabi-ar... (cached) arm-oecore-linux-gnueabi-ar
checking for archiver @FILE support... /usr/bin/grep -F
checking for ld used by arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone... yes
checking for zlib.h... yes
checking whether ANSI C string concatenation works... arm-oecore-linux-gnueabi-ld
checking if the linker (arm-oecore-linux-gnueabi-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... arm-oecore-linux-gnueabi-nm
checking the name lister (arm-oecore-linux-gnueabi-nm) interface... @
checking for arm-oecore-linux-gnueabi-strip... (cached) arm-oecore-linux-gnueabi-strip
checking for arm-oecore-linux-gnueabi-ranlib... (cached) arm-oecore-linux-gnueabi-ranlib
checking command to parse arm-oecore-linux-gnueabi-nm output from arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone object... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... yes
checking size of void *... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-pc-linux-gnu file names to arm-oecore-linux-gnueabi format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for arm-oecore-linux-gnueabi-ld option to reload object files... -r
checking for arm-oecore-linux-gnueabi-objdump... arm-oecore-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-oecore-linux-gnueabi-dlltool... arm-oecore-linux-gnueabi-dlltool
checking how to associate runtime and link libraries... printf %s\n
checking for arm-oecore-linux-gnueabi-ar... (cached) arm-oecore-linux-gnueabi-ar
checking for archiver @FILE support... @
checking for arm-oecore-linux-gnueabi-strip... (cached) arm-oecore-linux-gnueabi-strip
checking for arm-oecore-linux-gnueabi-ranlib... (cached) arm-oecore-linux-gnueabi-ranlib
checking command to parse arm-oecore-linux-gnueabi-nm output from arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone object... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/sort.c -o pic/sort.o; \
else true; fi
ok
checking for sysroot... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking for arm-oecore-linux-gnueabi-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/simple-object-mach-o.c -o simple-object-mach-o.o
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/sort.c -o sort.o
yes
ok
checking for objdir... .libs
checking for sysroot... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone
checking for arm-oecore-linux-gnueabi-mt... no
checking for mt... no
checking if : is a manifest tool... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/spaces.c -o pic/spaces.o; \
else true; fi
no
checking for dlfcn.h... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/spaces.c -o spaces.o
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -fno-rtti -fno-exceptions... yes
checking for objdir... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/splay-tree.c -o pic/splay-tree.o; \
else true; fi
.libs
no
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... 4
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/splay-tree.c -o splay-tree.o
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -fno-rtti -fno-exceptions... configure: updating cache ./config.cache
configure: creating ./config.status
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c -o pic/stack-limit.o; \
else true; fi
no
checking for arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone option to produce PIC... -fPIC -DPIC
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone PIC flag -fPIC -DPIC works... /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c: In function 'stack_limit_increase':
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c:53:27: warning: use of C99 long long integer constant [-Wlong-long]
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c:55:28: warning: use of C99 long long integer constant [-Wlong-long]
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c:58:28: warning: use of C99 long long integer constant [-Wlong-long]
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone static flag -static works... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c -o stack-limit.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/strerror.c -o pic/strerror.o; \
else true; fi
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c: In function 'stack_limit_increase':
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c:53:27: warning: use of C99 long long integer constant [-Wlong-long]
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c:55:28: warning: use of C99 long long integer constant [-Wlong-long]
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/stack-limit.c:58:28: warning: use of C99 long long integer constant [-Wlong-long]
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/strsignal.c -o pic/strsignal.o; \
else true; fi
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/strerror.c -o strerror.o
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/strsignal.c -o strsignal.o
yes
checking whether -lc should be explicitly linked in... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/timeval-utils.c -o pic/timeval-utils.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/unlink-if-ordinary.c -o pic/unlink-if-ordinary.o; \
else true; fi
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... config.status: creating .gdbinit
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/timeval-utils.c -o timeval-utils.o
config.status: creating Makefile
no
checking dynamic linker characteristics... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/unlink-if-ordinary.c -o unlink-if-ordinary.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xatexit.c -o pic/xatexit.o; \
else true; fi
config.status: creating doc/Makefile
yes
checking if arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -c -o file.o... (cached) yes
checking whether the arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone linker (arm-oecore-linux-gnueabi-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xexit.c -o pic/xexit.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xatexit.c -o xatexit.o
config.status: creating po/Makefile.in
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xmalloc.c -o pic/xmalloc.o; \
else true; fi
GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xexit.c -o xexit.o
no
checking dynamic linker characteristics... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xmemdup.c -o pic/xmemdup.o; \
else true; fi
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xmalloc.c -o xmalloc.o
no
checking for shl_load in -ldld... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xmemdup.c -o xmemdup.o
no
checking for dlopen... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xstrdup.c -o pic/xstrdup.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xstrerror.c -o pic/xstrerror.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xstrdup.c -o xstrdup.o
GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xstrerror.c -o xstrerror.o
yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xstrndup.c -o pic/xstrndup.o; \
else true; fi
no
checking for dlopen in -ldl... Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
checking whether arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone supports -Wmissing-field-initializers... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/setproctitle.c -o pic/setproctitle.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/xstrndup.c -o xstrndup.o
config.status: creating Makefile
config.status: executing default-1 commands
yes
checking whether a program can dlopen itself... cross
checking whether stripping libraries is possible... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether to install libbfd... yes
checking whether NLS is requested... yes
checking for catalogs to be installed... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/setproctitle.c -o setproctitle.o
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... config.status: creating doc/Makefile
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dwarfnames.o ./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-object-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-utils.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
config.status: creating po/POTFILES
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/libiberty/testsuite'
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/regex.c -o pic/regex.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/cplus-dem.c -o pic/cplus-dem.o; \
else true; fi
config.status: creating po/Makefile
config.status: creating po/Makefile.in
config.status: executing default commands
64
config.status: creating config.h
Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether to install libbfd... yes
checking whether NLS is requested... yes
checking for catalogs to be installed... config.status: executing depfiles commands
config.status: executing libtool commands
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/cp-demangle.c -o pic/cp-demangle.o; \
else true; fi
config.status: executing default-1 commands
config.status: creating po/POTFILES
 da de es fi fr ga id it nl pt_BR ro sv tr uk vi zh_CN da de es fi fr ga id it nl pt_BR ro sv tr uk vi zh_CN
checking whether NLS is requested... yes
config.status: creating po/Makefile
checking for msgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking for build system executable suffix... no
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/md5.c -o pic/md5.o; \
else true; fi
 da es fi fr id ja ro ru rw sv tr uk vi zh_CN da es fi fr id ja ro ru rw sv tr uk vi zh_CN
checking whether NLS is requested... yes
checking for stdlib.h... (cached) yes
checking for msgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for xgettext... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... checking limits.h usability... /mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking size of long long... yes
checking limits.h presence... yes
checking for limits.h... yes
checking whether string.h and strings.h may both be included... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/md5.c -o md5.o
yes
checking whether basename is declared... yes
checking whether stpcpy is declared... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/sha1.c -o pic/sha1.o; \
else true; fi
yes
checking linker --as-needed support... yes
checking for cos in -lm... yes
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/cplus-dem.c -o cplus-dem.o
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/sha1.c -o sha1.o
configure: updating cache ./config.cache
configure: creating ./config.status
8
checking size of void *... if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/alloca.c -o pic/alloca.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/alloca.c -o alloca.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/argv.c -o pic/argv.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/argv.c -o argv.o
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/cp-demangle.c -o cp-demangle.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/choose-temp.c -o pic/choose-temp.o; \
else true; fi
4
checking size of long... arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/choose-temp.c -o choose-temp.o
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/regex.c -o regex.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/concat.c -o pic/concat.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/concat.c -o concat.o
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/cp-demint.c -o pic/cp-demint.o; \
else true; fi
if [ x"-fPIC" != x ]; then \
  arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/crc32.c -o pic/crc32.o; \
else true; fi
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/crc32.c -o crc32.o
arm-oecore-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon  --sysroot=/mnt/SSD/oe-r0005/r0005/tmp/sysroots/beaglebone -c -DHAVE_CONFIG_H -O2 -pipe -g -feliminate-unused-debug-types  -I. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/libiberty/cp-demint.c -o cp-demint.o
config.status: creating Makefile
config.status: creating po/Makefile.in
config.status: creating config.h
4
checking for build system executable suffix... config.status: executing depfiles commands
config.status: executing libtool commands
no
checking alloca.h usability... yes
checking alloca.h presence... yes
checking for alloca.h... yes
checking stddef.h usability... yes
checking stddef.h presence... config.status: executing default-1 commands
yes
checking for stddef.h... yes
config.status: creating po/POTFILES
config.status: creating po/Makefile
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking time.h usability... yes
checking time.h presence... yes
checking for time.h... yes
checking for unistd.h... (cached) yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking sys/file.h usability... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for sys/stat.h... (cached) yes
config.status: creating Makefile
looking for a compliant stdint.h in stdint.h, checking for uintmax_t... config.status: creating po/Makefile.in
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
yes
checking for uintptr_t... yes
checking for int_least32_t... config.status: executing default-1 commands
config.status: creating po/POTFILES
config.status: creating po/Makefile
yes
checking for int_fast32_t... yes
checking for uint64_t... yes
checking what to include in bfd_stdint.h... stdint.h (already complete)
checking whether time.h and sys/time.h may both be included... yes
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking windows.h usability... no
checking windows.h presence... no
checking for windows.h... no
checking for dlfcn.h... (cached) yes
checking whether string.h and strings.h may both be included... yes
checking for fcntl... yes
checking for getpagesize... rm -f ./libiberty.a pic/./libiberty.a
arm-oecore-linux-gnueabi-ar rc ./libiberty.a \
  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dwarfnames.o ./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-object-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-utils.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ./setproctitle.o
arm-oecore-linux-gnueabi-ranlib ./libiberty.a
yes
checking for setitimer... if [ x"-fPIC" != x ]; then \
  cd pic; \
  arm-oecore-linux-gnueabi-ar rc ./libiberty.a \
    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dwarfnames.o ./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-object-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-utils.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ./setproctitle.o; \
  arm-oecore-linux-gnueabi-ranlib ./libiberty.a; \
  cd ..; \
else true; fi
make[2]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/libiberty'
yes
checking for sysconf... yes
checking for fdopen... yes
checking for getuid... yes
checking for getgid... yes
checking for fileno... yes
checking for strtoull... yes
checking whether basename is declared... yes
checking whether ftello is declared... yes
checking whether ftello64 is declared... yes
checking whether fseeko is declared... yes
checking whether fseeko64 is declared... yes
checking whether ffs is declared... yes
checking whether free is declared... yes
checking whether getenv is declared... yes
checking whether malloc is declared... yes
checking whether realloc is declared... yes
checking whether stpcpy is declared... yes
checking whether strstr is declared... yes
checking whether snprintf is declared... yes
checking whether vsnprintf is declared... yes
checking for library containing zlibVersion... -lz
checking zlib.h usability... yes
checking zlib.h presence... yes
checking for zlib.h... yes
checking sys/procfs.h usability... yes
checking sys/procfs.h presence... yes
checking for sys/procfs.h... yes
checking for prstatus_t in sys/procfs.h... yes
checking for prstatus32_t in sys/procfs.h... no
checking for prstatus_t.pr_who in sys/procfs.h... no
checking for prstatus32_t.pr_who in sys/procfs.h... no
checking for pstatus_t in sys/procfs.h... no
checking for pxstatus_t in sys/procfs.h... no
checking for pstatus32_t in sys/procfs.h... no
checking for prpsinfo_t in sys/procfs.h... yes
checking for prpsinfo_t.pr_pid in sys/procfs.h... yes
checking for prpsinfo32_t in sys/procfs.h... no
checking for prpsinfo32_t.pr_pid in sys/procfs.h... no
checking for psinfo_t in sys/procfs.h... no
checking for psinfo_t.pr_pid in sys/procfs.h... no
checking for psinfo32_t in sys/procfs.h... no
checking for psinfo32_t.pr_pid in sys/procfs.h... no
checking for lwpstatus_t in sys/procfs.h... no
checking for lwpxstatus_t in sys/procfs.h... no
checking for lwpstatus_t.pr_context in sys/procfs.h... no
checking for lwpstatus_t.pr_reg in sys/procfs.h... no
checking for lwpstatus_t.pr_fpreg in sys/procfs.h... no
checking for win32_pstatus_t in sys/procfs.h... no
checking linker --as-needed support... yes
checking for cos in -lm... yes
checking for ftello... yes
checking for ftello64... yes
checking for fseeko... yes
checking for fseeko64... yes
checking for fopen64... yes
checking size of off_t... 8
checking file_ptr type... BFD_HOST_64_BIT
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... no
checking for madvise... yes
checking for mprotect... yes
configure: updating cache ./config.cache
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating bfd-in3.h
config.status: creating po/Makefile.in
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default-1 commands
config.status: executing bfd_stdint.h commands
config.status: executing default commands
make[2]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd'
rm -f elf32-target.h
rm -f elf64-target.h
creating bfdver.h
sed -e s/NN/32/g < /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/elfxx-target.h > elf32-target.new
sed -e s/NN/64/g < /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/elfxx-target.h > elf64-target.new
rm -f targmatch.h
mv -f elf32-target.new elf32-target.h
sed -f /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/targmatch.sed < /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/config.bfd > targmatch.new
mv -f elf64-target.new elf64-target.h
Making info in doc
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/doc'
make chew
make[4]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/doc'
LD_LIBRARY_PATH= gcc -o chew.$$ -isystem/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -L/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/r0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 \
   -I.. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/.. -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/../../include -I/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/../../intl -I../../intl /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/chew.c; \
/bin/sh /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/../../move-if-change chew.$$ chew
mv -f targmatch.new targmatch.h
make[4]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/doc'
./chew -f /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/doc.str  </mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/../opncls.c >opncls.tmp
/bin/sh /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/../../move-if-change opncls.tmp opncls.texi
restore=: && backupdir=".am$$" && \
rm -rf $backupdir && mkdir $backupdir && \
if (makeinfo --split-size=5000000 --split-size=5000000 --version) >/dev/null 2>&1; then \
  for f in bfd.info bfd.info-[0-9] bfd.info-[0-9][0-9] bfd.i[0-9] bfd.i[0-9][0-9]; do \
    if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
  done; \
else :; fi && \
if makeinfo --split-size=5000000 --split-size=5000000   -I /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc \
 -o bfd.info `test -f 'bfd.texinfo' || echo '/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/'`bfd.texinfo; \
then \
  rc=0; \
else \
  rc=$?; \
  $restore $backupdir/* `echo "./bfd.info" | sed 's|[^/]*$||'`; \
fi; \
rm -rf $backupdir; exit $rc
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/bfd.texinfo:325: unknown command `colophon'
/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/doc/bfd.texinfo:336: unknown command `cygnus'
make[3]: *** [bfd.info] Error 1
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/doc'
Making info in po
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/po'
( if test 'x/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/po' != 'x.'; then \
    posrcprefix='/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/'; \
  else \
    posrcprefix="../"; \
  fi; \
  rm -f SRC-POTFILES-t SRC-POTFILES \
    && (sed -e '/^#/d' \
            -e '/^[ 	]*$/d' \
	    -e "s@.*@	$posrcprefix& \\\\@" < /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/po/SRC-POTFILES.in \
	| sed -e '$s/\\$//') > SRC-POTFILES-t \
    && chmod a-w SRC-POTFILES-t \
    && mv SRC-POTFILES-t SRC-POTFILES )
( rm -f BLD-POTFILES-t BLD-POTFILES \
    && (sed -e '/^#/d' \
            -e '/^[ 	]*$/d' \
	    -e "s@.*@	../& \\\\@" < /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/bfd/po/BLD-POTFILES.in \
	| sed -e '$s/\\$//') > BLD-POTFILES-t \
    && chmod a-w BLD-POTFILES-t \
    && mv BLD-POTFILES-t BLD-POTFILES )
cd .. \
  && CONFIG_FILES=po/Makefile.in:po/Make-in \
     CONFIG_HEADERS= /bin/sh ./config.status
config.status: creating po/Makefile.in
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default-1 commands
config.status: executing bfd_stdint.h commands
config.status: executing default commands
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/po'
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/po'
make[3]: Nothing to be done for `info'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd/po'
make[3]: Entering directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd'
make[3]: Nothing to be done for `info-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd'
make[2]: *** [info-recursive] Error 1
make[2]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi/bfd'
make[1]: *** [all-bfd] Error 2
make[1]: Leaving directory `/mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/binutils-2.23.1/build.arm-oecore-linux-gnueabi.arm-oecore-linux-gnueabi'
make: *** [all] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see /mnt/SSD/oe-r0005/r0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/binutils/2.23.1-r0/temp/log.do_compile.21379 for further information)

--------------080605020408000706010306--
