Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UB9zw-0004HC-SI
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 21:22:38 +0100
Message-ID: <512FB8B3.2090500@communistcode.co.uk>
Date: Thu, 28 Feb 2013 20:06:11 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
	<CAHUNapSbpFDttimPKO9czY3NiV4x7kTZ8ysDgq2TuifnosH0Xw@mail.gmail.com>
	<CAMKF1srnzum61DyhW95LgX14HmOJxaVwvcz_y2iGXNime6FZkg@mail.gmail.com>
In-Reply-To: <CAMKF1srnzum61DyhW95LgX14HmOJxaVwvcz_y2iGXNime6FZkg@mail.gmail.com>
Subject: Re: [PATCH] gcc-4.7: Fix build with texinfo 5.0+
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
X-List-Received-Date: Thu, 28 Feb 2013 20:22:39 -0000
X-Groupsio-MsgNum: 36039
Content-Type: multipart/mixed; boundary="------------040909040200070804020101"

--------------040909040200070804020101
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2013 18:13, Khem Raj wrote:
> On Thu, Feb 28, 2013 at 10:09 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>> Maybe we should wait until the person who reported this issue has had
>> the time to test this fix and confirms it works before submitting it
>> for inclusion?
> yes thats the intention. Although in retrospect I should have put RFT
> in the subject.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Hi Khem,

If this is the patch you posted in the other thread it didn't work, I 
have attached the log to this mail also.

Cheers,

--------------040909040200070804020101
Content-Type: text/plain; charset=windows-1252;
 name="log.do_compile.23536"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.23536"

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 8 ARCH_FLAGS_FOR_TARGET=3D -march=3Darmv7-a     -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/=
tmp/sysroots/beaglebone/usr/include all-gcc all-target-libgcc
mkdir -p -- ./intl
mkdir -p -- ./libiberty
mkdir -p -- ./libdecnumber
mkdir -p -- build-x86_64-linux/fixincludes
Configuring in ./intl
Configuring in ./libiberty
mkdir -p -- build-x86_64-linux/libiberty
Configuring in build-x86_64-linux/fixincludes
mkdir -p -- ./fixincludes
Configuring in build-x86_64-linux/libiberty
Configuring in ./libdecnumber
Configuring in ./fixincludes
configure: creating cache ../config.cache
configure: loading cache ../config.cache
configure: creating cache ./config.cache
configure: creating cache ./config.cache
configure: creating cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo
checking whether make sets $(MAKE)... checking whether to enable maintainer=
-specific portions of Makefiles... no
checking for makeinfo... makeinfo
checking whether make sets $(MAKE)... configure: creating cache ./config.ca=
che
checking build system type... checking build system type... x86_64-pc-linux=
-gnu
checking host system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... yes
yes
checking for x86_64-linux-gcc... gcc
checking for a BSD-compatible install... x86_64-pc-linux-gnu
checking target system type... arm-oecore-linux-gnueabi
checking for x86_64-linux-gcc... gcc
/usr/bin/install -c
checking whether NLS is requested... no
checking for msgfmt... arm-oecore-linux-gnueabi
checking for x86_64-linux-gcc... gcc
checking for C compiler default output file name... checking for C compiler=
 default output file name... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64=
-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linu=
x/usr/bin/msgfmt
checking for C compiler default output file name... checking for xgettext..=
. /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-lin=
ux/usr/bin/msgmerge
a.out
checking whether the C compiler works... yes
checking for x86_64-linux-gcc... a.out
gcc
checking whether the C compiler works... checking whether we are cross comp=
iling... no
checking for suffix of executables... yes
checking whether we are cross compiling... no
checking for suffix of executables... checking for C compiler default outpu=
t file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...=20

checking for suffix of object files... checking for suffix of object files.=
.. a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... o
checking whether we are using the GNU C compiler...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g...=20
checking for suffix of object files... yes
checking whether gcc accepts -g... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... o
checking whether we are using the GNU C compiler... yes
checking for gcc option to accept ISO C89... yes
checking for gcc option to accept ISO C89... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for x86_64-linux-ranlib... ranlib
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking whether gcc supports -W... none needed
checking how to run the C preprocessor... gcc -E
none needed
checking how to run the C preprocessor... gcc -E
checking for perl... perl
yes
checking build system type... checking whether gcc supports -Wall... checki=
ng for perl... perl
none needed
x86_64-pc-linux-gnu
checking host system type... checking build system type... checking build s=
ystem type... yes
checking whether gcc supports -Wwrite-strings... x86_64-pc-linux-gnu
checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc
x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc
yes
x86_64-pc-linux-gnu
checking for x86_64-linux-ranlib... ranlib
checking for library containing strerror... checking whether gcc supports -=
Wstrict-prototypes... yes
checking whether gcc supports -Wmissing-prototypes... checking for C compil=
er default output file name... none required
checking how to run the C preprocessor... gcc -E
checking for C compiler default output file name... yes
checking whether gcc supports -Wold-style-definition... a.out
checking whether the C compiler works... checking for grep that handles lon=
g lines and -e... checking for grep that handles long lines and -e... yes
checking for grep that handles long lines and -e... checking whether we are=
 cross compiling... no
checking for suffix of executables... /usr/bin/grep
checking for egrep... /usr/bin/grep
checking for egrep... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... /usr/bin/grep -E
checking for ANSI C header files... /usr/bin/grep -E
checking for ANSI C header files... yes
a.out
checking whether the C compiler works... checking whether gcc supports -Wmi=
ssing-format-attribute... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes

checking for suffix of object files... checking whether gcc supports -Wcast=
-qual...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc supports -pedantic -Wlong-long... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking how to run the C preprocessor... gcc -E
yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... checking for grep that handles=
 long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for gcc option to accept ISO C89... none needed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... none needed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking how to run the C preprocessor... gcc -E
no
checking how to run the C preprocessor... gcc -E
checking whether gcc supports -W... checking whether gcc supports -W... yes
checking whether gcc supports -Wall... yes
checking whether gcc supports -Wall... yes
checking whether gcc supports -Wwrite-strings... yes
checking whether gcc supports -Wwrite-strings... yes
checking whether gcc supports -Wc++-compat... yes
checking whether gcc supports -Wc++-compat... yes
checking whether gcc supports -Wstrict-prototypes... yes
checking whether gcc supports -Wstrict-prototypes... yes
yes
yes
yes
checking for an ANSI C-conforming const... checking for sys/types.h... chec=
king for sys/types.h... yes
checking whether gcc supports -pedantic ... checking for sys/types.h... yes
checking whether gcc supports -pedantic ... yes
checking for inline... yes
checking whether gcc and cc understand -c and -o together... yes
yes
checking for sys/stat.h... yes
checking for sys/stat.h... inline
checking for sys/stat.h... checking for sys/types.h... yes
checking whether gcc and cc understand -c and -o together... yes
yes
checking for stdlib.h... checking for stdlib.h... yes
yes
checking for sys/stat.h... checking for stdlib.h... yes
checking for string.h... yes
yes
checking for stdlib.h... checking for string.h... yes
checking for string.h... yes
checking for an ANSI C-conforming const... yes
yes
checking for an ANSI C-conforming const... yes
checking for memory.h... yes
yes
yes
checking for inline... checking for string.h... checking for memory.h... ch=
ecking for memory.h... yes
checking for inline... inline
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... inline
checking for grep that handles long lines and -e... yes
/usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
yes
checking for memory.h... yes
checking for strings.h... checking for strings.h... checking for strings.h.=
.. yes
checking for strings.h... yes
yes
yes
checking for inttypes.h... checking for inttypes.h... checking for inttypes=
.h... yes
checking for inttypes.h... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for sys/types.h... yes
yes
checking for string.h... yes
checking for sys/stat.h... yes
yes
yes
checking for stdint.h... checking for stdint.h... checking for stdint.h... =
checking for stdint.h... yes
yes
checking for memory.h... checking for stdlib.h... yes
checking for strings.h... yes
yes
checking for string.h... yes
yes
checking for unistd.h... checking for unistd.h... yes
yes
checking for inttypes.h... yes
checking for unistd.h... checking for unistd.h... checking for memory.h... =
yes
checking for stdint.h... yes
checking for strings.h... yes
yes
checking for unistd.h... checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
yes
yes
yes
yes
yes
checking whether byte ordering is bigendian... checking minix/config.h usab=
ility... checking for off_t... checking minix/config.h usability... checkin=
g whether byte ordering is bigendian... checking ctype.h usability... no
checking minix/config.h presence... yes
checking ctype.h presence... no
checking minix/config.h presence... yes
checking for ctype.h... yes
no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... checking stddef.h u=
sability... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for size_t... yes
yes
checking stddef.h presence... checking for a sed that does not truncate out=
put... /usr/bin/sed
checking whether gcc supports -W... yes
checking for a sed that does not truncate output... /usr/bin/sed
yes
checking whether gcc supports -W... checking for stddef.h... yes
checking for string.h... (cached) yes
checking stdio.h usability... yes
checking whether gcc supports -Wall... yes
checking whether gcc supports -Wall... yes
checking whether gcc supports -Wwrite-strings... yes
yes
checking stdio.h presence... checking whether gcc supports -Wwrite-strings.=
.. yes
checking for stdio.h... yes
yes
checking for working alloca.h... yes
looking for a compliant stdint.h in stdint.h, checking for uintmax_t... che=
cking whether gcc supports -Wstrict-prototypes... yes
checking whether gcc supports -Wstrict-prototypes... no
checking for a BSD-compatible install... no
checking for a BSD-compatible install... /usr/bin/install -c
/usr/bin/install -c
checking for sys/file.h... yes
checking for sys/file.h... checking whether gcc supports -Wmissing-prototyp=
es... yes
checking whether gcc supports -Wmissing-prototypes... yes
checking for alloca... yes
checking for uintptr_t... yes
yes
yes
checking whether gcc supports -Wold-style-definition... checking for sys/pa=
ram.h... checking for sys/param.h... yes
checking whether gcc supports -Wold-style-definition... yes
checking for stdlib.h... (cached) yes
yes
yes
checking for limits.h... checking for unistd.h... (cached) yes
checking for limits.h... yes
checking for getpagesize... checking whether gcc supports -Wmissing-format-=
attribute... yes
yes
yes
yes
checking for int_least32_t... checking whether gcc supports -Wmissing-forma=
t-attribute... checking for stdlib.h... checking for stdlib.h... (cached) (=
cached) yes
yes
checking for malloc.h... checking for malloc.h... yes
yes
yes
yes
checking whether gcc supports -Woverlength-strings... checking for string.h=
... (cached) yes
checking whether gcc supports -Woverlength-strings... checking for string.h=
... (cached) yes
checking for unistd.h... (cached) yes
yes
checking for working mmap... checking for strings.h... (cached) yes
checking for unistd.h... (cached) yes
checking for strings.h... (cached) yes
checking for sys/time.h... yes
checking whether gcc supports -pedantic -Wlong-long... checking for sys/tim=
e.h... yes
checking for int_fast32_t... yes
checking whether gcc supports -pedantic -Wlong-long... yes
yes
checking for time.h... checking for time.h... yes
yes
checking for ANSI C header files... (cached) yes
yes
checking for ANSI C header files... (cached) yes
yes
checking stddef.h usability... checking for sys/resource.h... checking stdd=
ef.h usability... checking for sys/resource.h... yes
checking for sys/stat.h... (cached) yes
yes
checking for sys/mman.h... checking for sys/stat.h... (cached) yes
yes
checking for uint64_t... checking for sys/mman.h... yes
yes
checking stddef.h presence... checking for fcntl.h... yes
yes
yes
checking stddef.h presence... checking whether we are using the GNU C Libra=
ry 2.1 or newer... checking for fcntl.h... yes
checking for stddef.h... yes
yes
yes
checking whether integer division by zero raises SIGFPE... yes
checking for stddef.h... yes
checking for stdlib.h... (cached) yes
yes
checking for strings.h... (cached) yes
checking for alloca.h... checking for stdlib.h... (cached) yes
checking for alloca.h... checking for unistd.h... (cached) yes
checking for strings.h... (cached) yes
checking fcntl.h usability... yes
yes
checking for unistd.h... (cached) yes
yes
checking what to include in gstdint.h... stdint.h (already complete)
checking for sys/pstat.h... checking for sys/pstat.h... checking for an ANS=
I C-conforming const... checking fcntl.h usability... no
checking for sys/sysmp.h... no
checking for sys/sysmp.h... no
checking for sys/sysinfo.h... yes
yes
checking for off_t... checking for inttypes.h... no
yes
checking for sys/sysinfo.h... checking fcntl.h presence... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
yes
checking for stdint.h... yes
checking for fcntl.h... yes
checking sys/file.h usability... checking sys/file.h usability... yes
checking for unsigned long long... yes
checking sys/file.h presence... yes
yes
yes
checking sys/file.h presence... checking for sys/file.h... yes
checking size of int... checking for sys/stat.h... (cached) yes
yes
checking for sys/file.h... yes
checking for clearerr_unlocked... yes
checking for sys/stat.h... checking for inttypes.h... (cached) yes
checking for clearerr_unlocked... yes
checking whether the inttypes.h PRIxNN macros are broken... no
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... 4
checking size of long... yes
checking for shared library run path origin... yes
yes
checking for machine/hal_sysinfo.h... checking for machine/hal_sysinfo.h...=
 yes
yes
checking for feof_unlocked... checking for feof_unlocked... no
no
checking for sys/table.h... checking for sys/table.h... done
no
no
checking for sys/sysctl.h... checking for sys/sysctl.h... checking argz.h u=
sability... yes
yes
8
checking for ANSI C header files... (cached) yes
checking for ferror_unlocked... checking for ferror_unlocked... yes
yes
checking build system type... checking for sys/systemcfg.h... checking for =
sys/systemcfg.h... no
no
x86_64-pc-linux-gnu
checking host system type... checking for stdint.h... (cached) yes
checking for stdint.h... (cached) yes
yes
checking for stdio_ext.h... checking for stdio_ext.h... checking for fflush=
_unlocked... yes
x86_64-pc-linux-gnu
checking target system type... checking for fflush_unlocked... arm-oecore-l=
inux-gnueabi
checking for decimal floating point... dpd
checking whether byte ordering is bigendian... yes
yes
yes
checking argz.h presence... checking for process.h... checking for process.=
h... yes
checking for argz.h... yes
yes
no
checking limits.h usability... checking for sys/prctl.h... no
checking for fgetc_unlocked... yes
checking for sys/prctl.h... checking for fgetc_unlocked... yes
checking limits.h presence... yes
checking for fgets_unlocked... yes
checking for limits.h... yes
yes
checking locale.h usability... no
checking for fgets_unlocked... yes
yes
checking for sys/wait.h that is POSIX.1 compatible... checking for sys/wait=
.h that is POSIX.1 compatible... configure: updating cache ./config.cache
yes
configure: creating ./config.status
checking for fileno_unlocked... yes
checking for fileno_unlocked... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether time.h and sys/time.h may both be included... yes
checking locale.h presence... yes
checking for fprintf_unlocked... yes
checking for locale.h... yes
yes
checking whether errno must be declared... yes
checking whether errno must be declared... checking nl_types.h usability...=
 yes
checking for fprintf_unlocked... no
checking size of int... no
checking size of int... config.status: creating Makefile
config.status: creating config.h
config.status: executing gstdint.h commands
no
checking for fputc_unlocked... yes
checking nl_types.h presence... no
checking for fputc_unlocked... yes
checking for nl_types.h... yes
checking malloc.h usability... 4
checking for a 64-bit type... 4
checking for a 64-bit type... yes
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/libdecnumber'
source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libdecnumber/decNumber.c' object=3D'decNumber.o' libtool=3Dno gcc  -I/mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber=
 -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-protot=
ypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -pedanti=
c -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/decNumber.c
source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libdecnumber/decContext.c' object=3D'decContext.o' libtool=3Dno gcc  -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumb=
er -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/in=
clude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prot=
otypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -pedan=
tic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shar=
ed/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/decContext.c
source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libdecnumber/dpd/decimal32.c' object=3D'decimal32.o' libtool=3Dno gcc  -I=
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnu=
mber -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/=
include -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-pr=
ototypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -ped=
antic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sh=
ared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/dpd/decimal32.c
yes
checking for fputs_unlocked... uint64_t
uint64_t
checking for intptr_t... checking for intptr_t... checking for fputs_unlock=
ed... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking stddef.h usability... yes
yes
checking for fread_unlocked... checking for fread_unlocked... yes
checking for uintptr_t... yes
checking stddef.h presence... yes
checking for stddef.h... yes
yes
checking for uintptr_t... yes
yes
checking for fwrite_unlocked... checking for fwrite_unlocked... source=3D'/=
mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnum=
ber/dpd/decimal64.c' object=3D'decimal64.o' libtool=3Dno gcc  -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber -I.  -=
isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2=
 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-=
long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/libdecnumber/dpd/decimal64.c
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for unistd.h... (cached) yes
source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libdecnumber/dpd/decimal128.c' object=3D'decimal128.o' libtool=3Dno gcc  =
-I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdec=
number -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/us=
r/include -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-=
prototypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -p=
edantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/dpd/decimal128.c
checking sys/param.h usability... yes
yes
checking for getchar_unlocked... checking for getchar_unlocked... yes
checking for ssize_t... yes
checking for ssize_t... yes
checking sys/param.h presence... yes
yes
checking for sys/param.h... yes
checking for getc_unlocked... yes
checking for feof_unlocked... checking for getc_unlocked... yes
yes
yes
checking for pid_t... yes
checking for putchar_unlocked... checking for putchar_unlocked... yes
checking for pid_t... checking for fgets_unlocked... yes
yes
yes
checking for putc_unlocked... checking for putc_unlocked... checking for ge=
tc_unlocked... yes
checking for library containing strerror... yes
yes
checking for getcwd... checking whether abort is declared... yes
yes
checking for library containing strerror... checking whether abort is decla=
red... none required
checking for asprintf... yes
checking for getegid... yes
checking whether asprintf is declared... none required
checking for asprintf... yes
yes
checking for atexit... checking whether asprintf is declared... yes
checking for geteuid... yes
yes
checking whether basename is declared... checking for atexit... yes
yes
checking for basename... checking whether basename is declared... yes
yes
checking for getgid... yes
checking whether errno is declared... checking for basename... yes
yes
checking whether errno is declared... checking for bcmp... yes
checking for getuid... no
checking whether vasprintf is declared... yes
checking for bcmp... no
yes
checking whether vasprintf is declared... checking for bcopy... yes
yes
checking for mempcpy... checking whether clearerr_unlocked is declared... y=
es
yes
checking for bcopy... checking whether clearerr_unlocked is declared... yes
checking for bsearch... yes
checking whether feof_unlocked is declared... yes
checking for munmap... yes
checking for bsearch... yes
checking whether feof_unlocked is declared... yes
checking for bzero... yes
checking whether ferror_unlocked is declared... yes
checking for putenv... yes
checking for bzero... yes
yes
checking whether ferror_unlocked is declared... checking for calloc... yes
yes
checking whether fflush_unlocked is declared... yes
checking for setenv... checking for calloc... yes
checking whether fflush_unlocked is declared... yes
checking for clock... yes
yes
yes
checking whether fgetc_unlocked is declared... checking for setlocale... ch=
ecking for clock... yes
checking whether fgetc_unlocked is declared... yes
checking for ffs... yes
yes
checking for stpcpy... checking for ffs... yes
checking whether fgets_unlocked is declared... yes
yes
checking whether fgets_unlocked is declared... checking for getcwd... yes
yes
checking for strcasecmp... checking for getcwd... yes
checking whether fileno_unlocked is declared... yes
yes
yes
checking for strdup... checking whether fileno_unlocked is declared... yes
checking for getpagesize... checking for getpagesize... yes
checking whether fprintf_unlocked is declared... yes
yes
checking for strtoul... checking for gettimeofday... yes
yes
checking whether fprintf_unlocked is declared... checking for gettimeofday.=
.. no
checking whether fputc_unlocked is declared... yes
yes
checking for tsearch... checking for index... yes
checking for index... no
checking whether fputc_unlocked is declared... yes
checking whether fputs_unlocked is declared... yes
checking for __argz_count... yes
checking for insque... yes
checking for insque... yes
yes
checking whether fread_unlocked is declared... checking whether fputs_unloc=
ked is declared... yes
checking for __argz_stringify... yes
checking for memchr... yes
yes
checking for memchr... checking whether fread_unlocked is declared... yes
yes
checking whether fwrite_unlocked is declared... checking for __argz_next...=
 yes
checking for memcmp... yes
checking for memcmp... yes
checking whether fwrite_unlocked is declared... yes
checking whether getchar_unlocked is declared... yes
checking for __fsetlocking... yes
checking for memcpy... yes
checking for memcpy... yes
checking whether getchar_unlocked is declared... yes
yes
checking for iconv... checking whether getc_unlocked is declared... yes
checking for memmem... yes
checking for memmem... yes
checking whether getc_unlocked is declared... yes
yes
checking whether putchar_unlocked is declared... checking for memmove... ye=
s
yes
checking whether putchar_unlocked is declared... yes
checking for iconv declaration... checking for memmove... yes
checking whether putc_unlocked is declared... yes
install-shextern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesle=
ft, char * *outbuf, size_t *outbytesleft);
checking for mempcpy... yes
checking for nl_langinfo and CODESET... checking whether putc_unlocked is d=
eclared... yes
checking for mempcpy... yes
checking for an ANSI C-conforming const... yes
checking sys/mman.h usability... yes
checking for LC_MESSAGES... yes
yes
checking for an ANSI C-conforming const... checking for memset... yes
checking for memset... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for bison... bison
checking version of bison... yes
checking for sys/mman.h... yes
checking for mmap... 2.7, ok
checking whether NLS is requested... no
yes
checking whether to use NLS... no
yes
checking for aclocal... aclocal
checking for autoconf... checking for mkstemps... autoconf
checking for autoheader... autoheader
yes
checking sys/mman.h presence... checking for mkstemps... yes
checking for sys/mman.h... yes
checking for mmap... yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking for putenv... configure: updating cache ./config.cache
yes
configure: creating ./config.status
checking for putenv... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking for random... configure: updating cache ./config.cache
yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
configure: creating ./config.status
yes
checking for random... configure: updating cache ../config.cache
configure: creating ./config.status
yes
config.status: creating Makefile
checking for rename... yes
config.status: creating config.intl
checking for rename... config.status: creating config.h
config.status: executing default-1 commands
config.status: creating Makefile
yes
checking for rindex... yes
config.status: creating mkheaders.almost
checking for rindex... config.status: creating config.h
Configuring in ./gcc
config.status: creating Makefile
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/intl'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/intl'
config.status: creating mkheaders.almost
yes
config.status: creating config.h
yes
checking for setenv... checking for setenv... rm -f libdecnumber.a
ar cru libdecnumber.a decNumber.o decContext.o decimal32.o decimal64.o deci=
mal128.o=20
ranlib libdecnumber.a
yes
yes
checking for snprintf... checking for snprintf... make[1]: Leaving director=
y `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi=
/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-=
gnueabi/libdecnumber'
yes
yes
checking for sigsetmask... checking for sigsetmask... yes
yes
checking for stpcpy... checking for stpcpy... configure: creating cache ./c=
onfig.cache
yes
yes
checking for stpncpy... checking for stpncpy... checking build system type.=
.. x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... yes
yes
checking for strcasecmp... checking for strcasecmp... arm-oecore-linux-gnue=
abi
checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking whether to place generated files in the source directory... no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for x86_64-linux-gcc... gcc
checking for C compiler default output file name... yes
yes
checking for strchr... checking for strchr... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes
yes
checking for strdup... checking for strdup...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
yes
checking for strncasecmp... checking for strncasecmp... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... yes
yes
checking for strndup... checking for strndup... none needed
checking whether gcc and cc understand -c and -o together... yes
yes
checking for strrchr... checking for strrchr... yes
yes
checking for strstr... checking for strstr... yes
yes
checking for strtod... yes
checking for strtod... checking whether we are using the GNU C++ compiler..=
. yes
checking whether g++ accepts -g... yes
yes
checking for strtol... checking for strtol... yes
checking for x86_64-linux-gnatbind... no
checking for gnatbind... no
checking for x86_64-linux-gnatmake... no
checking for gnatmake... no
checking whether compiler driver understands Ada... no
checking how to run the C preprocessor... gcc -E
yes
yes
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... checking for strtoul... checking for strtoul... /usr/=
bin/grep -E
checking for ANSI C header files... yes
yes
checking for strverscmp... checking for strverscmp... yes
yes
checking for tmpnam... checking for tmpnam... yes
checking for sys/types.h... yes
yes
yes
checking for sys/stat.h... checking for vasprintf... checking for vasprintf=
... yes
checking for stdlib.h... yes
yes
checking for vfprintf... checking for vfprintf... yes
checking for string.h... yes
yes
checking for vprintf... checking for vprintf... yes
checking for memory.h... yes
yes
checking for vsnprintf... yes
checking for strings.h... checking for vsnprintf... yes
checking for inttypes.h... yes
checking for vsprintf... yes
checking for vsprintf... yes
checking for stdint.h... yes
checking for waitpid... yes
yes
checking for waitpid... checking for unistd.h... yes
yes
checking for setproctitle... yes
checking minix/config.h usability... checking for setproctitle... no
checking minix/config.h presence... no
checking whether alloca needs Cray hooks... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... no
checking whether alloca needs Cray hooks... no
checking stack direction for C alloca... no
checking stack direction for C alloca... yes
checking how to run the C preprocessor... gcc -E
-1
checking for vfork.h... -1
checking for vfork.h... checking for inline... no
checking for fork... no
checking for fork... inline
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking size of void *... yes
checking for vfork... yes
checking for vfork... yes
checking for working fork... yes
8
checking for working fork... checking size of short... yes
checking for working vfork... (cached) yes
checking for _doprnt... 2
checking size of int... yes
checking for working vfork... (cached) yes
checking for _doprnt... no
checking for sys_errlist... no
checking for sys_errlist... 4
checking size of long... yes
yes
checking for sys_nerr... checking for sys_nerr... 8
checking for long long... yes
yes
checking for sys_siglist... checking for sys_siglist... yes
yes
checking for external symbol _system_configuration... checking for external=
 symbol _system_configuration... no
no
yes
checking size of long long... checking for __fsetlocking... checking for __=
fsetlocking... yes
yes
checking for canonicalize_file_name... checking for canonicalize_file_name.=
.. 8
checking for __int64... yes
yes
checking for dup3... checking for dup3... no
checking for int8_t... yes
yes
checking for getrlimit... checking for getrlimit... yes
checking for int16_t... yes
yes
checking for getrusage... checking for getrusage... yes
yes
checking for getsysinfo... checking for getsysinfo... yes
checking for int32_t... no
no
checking for gettimeofday... checking for gettimeofday... (cached) (cached)=
 yes
yes
checking for on_exit... checking for on_exit... yes
checking for int64_t... yes
yes
checking for psignal... checking for psignal... yes
checking for pstat_getdynamic... yes
checking for pstat_getdynamic... yes
checking for long long int... no
checking for pstat_getstatic... no
checking for pstat_getstatic... no
checking for realpath... no
checking for realpath... yes
checking for intmax_t... yes
yes
checking for setrlimit... checking for setrlimit... yes
checking for intptr_t... yes
yes
checking for sbrk... checking for sbrk... yes
yes
checking for spawnve... checking for spawnve... yes
checking for uint8_t... yes
checking for uint16_t... no
no
checking for spawnvpe... checking for spawnvpe... yes
checking for uint32_t... no
no
checking for strerror... checking for strerror... yes
checking for uint64_t... yes
yes
checking for strsignal... checking for strsignal... yes
checking for unsigned long long int... yes
yes
checking for uintmax_t... yes
checking for sysconf... checking for sysconf... yes
yes
checking for sysctl... checking for sysctl... yes
checking for uintptr_t... yes
yes
checking for sysmp... checking for sysmp... no
no
checking for table... checking for table... yes
checking whether gcc supports -W... yes
checking whether gcc supports -Wall... no
no
checking for times... checking for times... yes
checking whether gcc supports -Wnarrowing... yes
yes
yes
checking whether gcc supports -Wwrite-strings... checking for wait3... chec=
king for wait3... yes
checking whether gcc supports -Wcast-qual... yes
yes
checking for wait4... checking for wait4... yes
checking whether gcc supports -Wstrict-prototypes... yes
checking whether gcc supports -Wmissing-prototypes... yes
yes
checking whether basename is declared... checking whether basename is decla=
red... yes
checking whether gcc supports -Wmissing-format-attribute... yes
checking whether gcc supports -Wold-style-definition... no
no
checking whether ffs is declared... checking whether ffs is declared... yes
checking whether gcc supports -Wc++-compat... yes
yes
checking whether asprintf is declared... yes
checking whether asprintf is declared... checking whether gcc supports -ped=
antic -Wlong-long -Wvariadic-macros -Woverlength-strings... yes
checking whether gcc supports -fno-exceptions... no
no
checking whether vasprintf is declared... checking whether vasprintf is dec=
lared... yes
checking whether gcc supports -fno-rtti... yes
checking valgrind.h usability... no
no
checking whether snprintf is declared... checking whether snprintf is decla=
red... no
checking valgrind.h presence... yes
yes
checking whether vsnprintf is declared... no
checking for valgrind.h... no
checking whether vsnprintf is declared... checking whether make sets $(MAKE=
)... yes
checking for gawk... gawk
checking whether ln -s works... yes
checking whether ln works... yes
checking for x86_64-linux-ranlib... ranlib
checking for a BSD compatible install... /usr/bin/install -c
checking for cmp's capabilities... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo
checking for modern makeinfo... yes
yes
checking whether calloc is declared... checking whether calloc is declared.=
.. yes
yes
checking whether getenv is declared... checking whether getenv is declared.=
.. yes
yes
checking whether getopt is declared... checking whether getopt is declared.=
.. yes
yes
checking whether malloc is declared... checking whether malloc is declared.=
.. yes
yes
checking whether realloc is declared... checking whether realloc is declare=
d... yes
checking for recent Pod::Man... yes
yes
checking whether sbrk is declared... checking whether sbrk is declared... y=
es
yes
checking whether strverscmp is declared... checking whether strverscmp is d=
eclared... no
checking whether canonicalize_file_name must be declared... no
checking whether canonicalize_file_name must be declared... yes
checking for stdlib.h... (cached) yes
yes
checking for unistd.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... checking for unistd.h... (cached) yes
yes
checking for flex... flex
checking for bison... bison
checking for nm... nm
checking for ar... ar
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... checking for=
 getpagesize... (cached) yes
checking for working mmap... yes
checking whether string.h and strings.h may both be included... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for working strncmp... yes
checking for working strncmp... yes
checking for limits.h... yes
checking for stddef.h... yes
yes
yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for time.h... configure: updating cache ./config.cache
yes
configure: creating ./config.status
checking for iconv.h... yes
checking for fcntl.h... yes
checking for unistd.h... (cached) yes
checking for sys/file.h... yes
checking for sys/time.h... yes
checking for sys/mman.h... configure: updating cache ../config.cache
config.status: creating Makefile
configure: creating ./config.status
yes
checking for sys/resource.h... config.status: creating testsuite/Makefile
yes
checking for sys/param.h... config.status: creating config.h
config.status: executing default commands
yes
checking for sys/times.h... yes
checking for sys/stat.h... (cached) yes
checking for direct.h... mkdir -p -- ./libcpp
Configuring in ./libcpp
no
config.status: creating Makefile
checking for malloc.h... make[1]: Entering directory `/mnt/SSD/oe-r0005/cco=
R0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2=
-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
  mkdir pic; \
else true; fi
yes
config.status: creating testsuite/Makefile
checking for langinfo.h... touch stamp-picdir
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./=
argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dyn-string.o ./=
fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_=
unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./h=
ex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.=
o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-com=
mon.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-ob=
ject-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./space=
s.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-uti=
ls.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o .=
/xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/regex.c -o pic/regex.o; =
\
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cplus-dem.c -o pic/cplus=
-dem.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demangle.c -o pic/cp-=
demangle.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/regex.c -o regex.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cplus-dem.c -o cplus-dem.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demangle.c -o cp-demangl=
e.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/md5.c -o pic/md5.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/md5.c -o md5.o
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/libiberty/testsuite'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/libiberty/testsuite'
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sha1.c -o pic/sha1.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sha1.c -o sha1.o
yes
config.status: creating config.h
checking for ldfcn.h... config.status: executing default commands
no
checking for locale.h... /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/libiberty/md5.c: In function 'md5_finish_ctx':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:117:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:118:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
yes
checking for wchar.h... yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/alloca.c -o pic/alloca.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/alloca.c -o alloca.o
checking for thread.h... no
checking for pthread.h... make[1]: Entering directory `/mnt/SSD/oe-r0005/cc=
oR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.=
2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/build-x86_64-li=
nux/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
  mkdir pic; \
else true; fi
yes
checking for CHAR_BIT... touch stamp-picdir
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/safe-ctype.c -o pic/safe=
-ctype.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/safe-ctype.c -o safe-ctype.=
o
yes
checking whether byte ordering is bigendian... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object.c -o pic/s=
imple-object.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object.c -o simple-o=
bject.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-coff.c -o =
pic/simple-object-coff.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-coff.c -o sim=
ple-object-coff.o
no
configure: creating cache ./config.cache
checking how to run the C++ preprocessor... checking build system type... x=
86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... arm-oecore-linux-gnueabi
checking whether make sets $(MAKE)... yes
checking for a BSD-compatible install... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-elf.c -o p=
ic/simple-object-elf.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-elf.c -o simp=
le-object-elf.o
/usr/bin/install -c
checking for x86_64-linux-gcc... gcc
g++ -E
checking for C compiler default output file name... if [ x"" !=3D x ]; then=
 \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-mach-o.c -=
o pic/simple-object-mach-o.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-mach-o.c -o s=
imple-object-mach-o.o
checking for unordered_map... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...=20
checking for suffix of object files... no
checking for tr1/unordered_map... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/argv.c -o pic/argv.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/argv.c -o argv.o
o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/choose-temp.c -o pic/cho=
ose-temp.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/choose-temp.c -o choose-tem=
p.o
none needed
yes
checking for ext/hash_map... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/concat.c -o pic/concat.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/concat.c -o concat.o
checking whether we are using the GNU C++ compiler... if [ x"" !=3D x ]; th=
en \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demint.c -o pic/cp-de=
mint.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demint.c -o cp-demint.o
yes
checking whether g++ accepts -g... yes
checking for x86_64-linux-ranlib... ranlib
checking how to run the C preprocessor... gcc -E
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/crc32.c -o pic/crc32.o; =
\
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/crc32.c -o crc32.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o pic/dyn-=
string.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o dyn-string.=
o
checking for grep that handles long lines and -e... if [ x"" !=3D x ]; then=
 \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fdmatch.c -o pic/fdmatch=
.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sort.c -o pic/sort.o; \
else true; fi
/usr/bin/grep
checking for egrep... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR=
0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -=
W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SS=
D/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fdmat=
ch.c -o fdmatch.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sort.c -o sort.o
/usr/bin/grep -E
checking for ANSI C header files... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fibheap.c -o pic/fibheap=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fibheap.c -o fibheap.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/spaces.c -o pic/spaces.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/spaces.c -o spaces.o
yes
checking for collect2 libraries... (cached) none required
checking for library containing exc_resume... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/splay-tree.c -o pic/spla=
y-tree.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/splay-tree.c -o splay-tree.=
o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/stack-limit.c -o pic/sta=
ck-limit.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/stack-limit.c -o stack-limi=
t.o
yes
checking for sys/types.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strerror.c -o pic/strerr=
or.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strerror.c -o strerror.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strsignal.c -o pic/strsi=
gnal.o; \
else true; fi
yes
no
checking for library containing kstat_open... gcc -c -DHAVE_CONFIG_H -isyst=
em/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pip=
e  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-proto=
types -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/libiberty/strsignal.c -o strsignal.o
checking for sys/stat.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/filename_cmp.c -o pic/fi=
lename_cmp.o; \
else true; fi
yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/filename_cmp.c -o filename_=
cmp.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/timeval-utils.c -o pic/t=
imeval-utils.o; \
else true; fi
checking for stdlib.h... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/c=
coR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-=
r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include=
  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/ti=
meval-utils.c -o timeval-utils.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/floatformat.c -o pic/flo=
atformat.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fnmatch.c -o pic/fnmatch=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/floatformat.c -o floatforma=
t.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fnmatch.c -o fnmatch.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/unlink-if-ordinary.c -o =
pic/unlink-if-ordinary.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/unlink-if-ordinary.c -o unl=
ink-if-ordinary.o
yes
checking for string.h... no
checking for library containing ldexp... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fopen_unlocked.c -o pic/=
fopen_unlocked.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fopen_unlocked.c -o fopen_u=
nlocked.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xatexit.c -o pic/xatexit=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xatexit.c -o xatexit.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt.c -o pic/getopt.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt.c -o getopt.o
yes
checking for memory.h... none required
checking for inttypes.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xexit.c -o pic/xexit.o; =
\
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xexit.c -o xexit.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmalloc.c -o pic/xmalloc=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmalloc.c -o xmalloc.o
yes
yes
checking for times... checking for strings.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt1.c -o pic/getopt1=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt1.c -o getopt1.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o pic/getpwd.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o getpwd.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemdup.c -o pic/xmemdup=
.o; \
else true; fi
yes
checking for clock... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR=
0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -=
W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SS=
D/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemd=
up.c -o xmemdup.o
checking for inttypes.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrdup.c -o pic/xstrdup=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrdup.c -o xstrdup.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getruntime.c -o pic/getr=
untime.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getruntime.c -o getruntime.=
o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrerror.c -o pic/xstre=
rror.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrerror.c -o xstrerror.o
yes
yes
checking for kill... checking for stdint.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrndup.c -o pic/xstrnd=
up.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrndup.c -o xstrndup.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hashtab.c -o pic/hashtab=
.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/setproctitle.c -o pic/se=
tproctitle.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/setproctitle.c -o setprocti=
tle.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hashtab.c -o hashtab.o
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./=
argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dyn-string.o ./=
fdmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_=
unlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./h=
ex.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.=
o ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-com=
mon.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-ob=
ject-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./space=
s.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-uti=
ls.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o .=
/xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hex.c -o pic/hex.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hex.c -o hex.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lbasename.c -o pic/lbase=
name.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lbasename.c -o lbasename.o
yes
yes
checking for getrlimit... make[2]: Entering directory `/mnt/SSD/oe-r0005/cc=
oR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.=
2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/build-x86_64-li=
nux/libiberty/testsuite'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/libiberty/testsuite'
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/regex.c -o pic/regex.o; =
\
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/regex.c -o regex.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lrealpath.c -o pic/lreal=
path.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lrealpath.c -o lrealpath.o
checking for unistd.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cplus-dem.c -o pic/cplus=
-dem.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cplus-dem.c -o cplus-dem.o
yes
checking for setrlimit... yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-relative-prefix.c -=
o pic/make-relative-prefix.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-relative-prefix.c -o m=
ake-relative-prefix.o
checking minix/config.h usability... yes
checking for atoll... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for atoq... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... if [ x"" !=
=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demangle.c -o pic/cp-=
demangle.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demangle.c -o cp-demangl=
e.o
no
no
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking for sysconf... checking whether gcc supports -W... if [ x"" !=3D x=
 ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/md5.c -o pic/md5.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/md5.c -o md5.o
yes
checking whether gcc supports -Wall... yes
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c: In function 'md5_finish_ctx':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:117:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:118:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
checking for strsignal... yes
checking whether gcc supports -Wnarrowing... yes
yes
checking whether gcc supports -Wwrite-strings... checking for getrusage... =
yes
checking whether gcc supports -Wmissing-format-attribute... yes
yes
checking for nl_langinfo... checking whether gcc supports -Wstrict-prototyp=
es... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o pic/=
make-temp-file.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o make-te=
mp-file.o
yes
checking whether gcc supports -Wmissing-prototypes... if [ x"" !=3D x ]; th=
en \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o pic/objall=
oc.o; \
else true; fi
yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o objalloc.o
checking for gettimeofday... yes
checking whether gcc supports -Wold-style-definition... if [ x"" !=3D x ]; =
then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sha1.c -o pic/sha1.o; \
else true; fi
yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sha1.c -o sha1.o
checking whether gcc supports -Wc++-compat... yes
checking for mbstowcs... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/alloca.c -o pic/alloca.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/alloca.c -o alloca.o
yes
checking whether gcc supports -pedantic -Wlong-long... yes
yes
checking whether gcc supports -fno-exceptions... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/obstack.c -o pic/obstack=
.o; \
else true; fi
checking for wcswidth... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/c=
coR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-=
r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include=
  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/ob=
stack.c -o obstack.o
yes
checking whether gcc supports -fno-rtti... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/partition.c -o pic/parti=
tion.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/partition.c -o partition.o
yes
checking for mmap... yes
checking dependency style of gcc... yes
checking for setlocale... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/argv.c -o pic/argv.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/argv.c -o argv.o
gcc3
checking whether time.h and sys/time.h may both be included... yes
checking whether string.h and strings.h may both be included... yes
checking for clearerr_unlocked... yes
checking locale.h usability... yes
checking for feof_unlocked... yes
checking locale.h presence... yes
checking for locale.h... yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pexecute.c -o pic/pexecu=
te.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pexecute.c -o pexecute.o
checking fcntl.h usability... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/physmem.c -o pic/physmem=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/physmem.c -o physmem.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/choose-temp.c -o pic/cho=
ose-temp.o; \
else true; fi
checking for ferror_unlocked... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../=
include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedanti=
c  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libib=
erty/choose-temp.c -o choose-temp.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/concat.c -o pic/concat.o=
; \
else true; fi
yes
checking fcntl.h presence... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r00=
05/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../inc=
lude  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  =
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/concat.c -o concat.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-common.c -o pic/pex-=
common.o; \
else true; fi
yes
checking for fcntl.h... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/cc=
oR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include =
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex=
-common.c -o pex-common.o
yes
checking limits.h usability... yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-one.c -o pic/pex-one=
.o; \
else true; fi
checking for fflush_unlocked... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../=
include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedanti=
c  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libib=
erty/pex-one.c -o pex-one.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pic/pex-un=
ix.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pex-unix.o
yes
checking limits.h presence... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demint.c -o pic/cp-de=
mint.o; \
else true; fi
yes
checking for limits.h... yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demint.c -o cp-demint.o
yes
checking stddef.h usability... checking for fgetc_unlocked... yes
checking stddef.h presence... yes
yes
checking for stddef.h... yes
checking for fgets_unlocked... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/safe-ctype.c -o pic/safe=
-ctype.o; \
else true; fi
checking for stdlib.h... (cached) yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/safe-ctype.c -o safe-ctype.=
o
checking for strings.h... (cached) yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object.c -o pic/s=
imple-object.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object.c -o simple-o=
bject.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/crc32.c -o pic/crc32.o; =
\
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/crc32.c -o crc32.o
checking for string.h... (cached) yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-coff.c -o =
pic/simple-object-coff.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-coff.c -o sim=
ple-object-coff.o
yes
checking sys/file.h usability... checking for fileno_unlocked... if [ x"" !=
=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-elf.c -o p=
ic/simple-object-elf.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-elf.c -o simp=
le-object-elf.o
yes
checking sys/file.h presence... yes
yes
checking for sys/file.h... yes
checking for fprintf_unlocked... checking for unistd.h... (cached) yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-mach-o.c -=
o pic/simple-object-mach-o.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-mach-o.c -o s=
imple-object-mach-o.o
checking whether byte ordering is bigendian... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o pic/dyn-=
string.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o dyn-string.=
o
no
checking for fputc_unlocked... yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fdmatch.c -o pic/fdmatch=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fdmatch.c -o fdmatch.o
checking for fputs_unlocked... no
checking for an ANSI C-conforming const... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fibheap.c -o pic/fibheap=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fibheap.c -o fibheap.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/filename_cmp.c -o pic/fi=
lename_cmp.o; \
else true; fi
yes
checking for inline... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0=
005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/S=
SD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/file=
name_cmp.c -o filename_cmp.o
yes
checking for fread_unlocked... inline
checking for obstacks... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/floatformat.c -o pic/flo=
atformat.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sort.c -o pic/sort.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sort.c -o sort.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/floatformat.c -o floatforma=
t.o
yes
checking for fwrite_unlocked... yes
checking for off_t... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fnmatch.c -o pic/fnmatch=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fnmatch.c -o fnmatch.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fopen_unlocked.c -o pic/=
fopen_unlocked.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fopen_unlocked.c -o fopen_u=
nlocked.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt.c -o pic/getopt.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt.c -o getopt.o
yes
checking for getchar_unlocked... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/spaces.c -o pic/spaces.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/spaces.c -o spaces.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt1.c -o pic/getopt1=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt1.c -o getopt1.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/splay-tree.c -o pic/spla=
y-tree.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/splay-tree.c -o splay-tree.=
o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o pic/getpwd.o=
; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o getpwd.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getruntime.c -o pic/getr=
untime.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getruntime.c -o getruntime.=
o
yes
checking for size_t... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hashtab.c -o pic/hashtab=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hashtab.c -o hashtab.o
checking for getc_unlocked... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/stack-limit.c -o pic/sta=
ck-limit.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strerror.c -o pic/strerr=
or.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strerror.c -o strerror.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/stack-limit.c -o stack-limi=
t.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hex.c -o pic/hex.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hex.c -o hex.o
checking for putchar_unlocked... yes
checking for ssize_t... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lbasename.c -o pic/lbase=
name.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lbasename.c -o lbasename.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lrealpath.c -o pic/lreal=
path.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lrealpath.c -o lrealpath.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strsignal.c -o pic/strsi=
gnal.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strsignal.c -o strsignal.o
yes
checking for putc_unlocked... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/timeval-utils.c -o pic/t=
imeval-utils.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/timeval-utils.c -o timeval-=
utils.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/unlink-if-ordinary.c -o =
pic/unlink-if-ordinary.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/unlink-if-ordinary.c -o unl=
ink-if-ordinary.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-relative-prefix.c -=
o pic/make-relative-prefix.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-relative-prefix.c -o m=
ake-relative-prefix.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o pic/=
make-temp-file.o; \
else true; fi
checking for madvise... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/cc=
oR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include =
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/mak=
e-temp-file.c -o make-temp-file.o
yes
checking for uintptr_t... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xatexit.c -o pic/xatexit=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xatexit.c -o xatexit.o
yes
checking whether mbstowcs works... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xexit.c -o pic/xexit.o; =
\
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o pic/objall=
oc.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xexit.c -o xexit.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/obstack.c -o pic/obstack=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o objalloc.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/obstack.c -o obstack.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmalloc.c -o pic/xmalloc=
.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemdup.c -o pic/xmemdup=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmalloc.c -o xmalloc.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemdup.c -o xmemdup.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/partition.c -o pic/parti=
tion.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/partition.c -o partition.o
yes
checking for ssize_t... yes
checking for ptrdiff_t... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrdup.c -o pic/xstrdup=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrdup.c -o xstrdup.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrerror.c -o pic/xstre=
rror.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrerror.c -o xstrerror.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pexecute.c -o pic/pexecu=
te.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pexecute.c -o pexecute.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrndup.c -o pic/xstrnd=
up.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrndup.c -o xstrndup.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/setproctitle.c -o pic/se=
tproctitle.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/physmem.c -o pic/physmem=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/setproctitle.c -o setprocti=
tle.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/physmem.c -o physmem.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-common.c -o pic/pex-=
common.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-common.c -o pex-common.=
o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-one.c -o pic/pex-one=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-one.c -o pex-one.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pic/pex-un=
ix.o; \
else true; fi
rm -f ./libiberty.a pic/./libiberty.a
ar rc ./libiberty.a \
  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./arg=
v.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dyn-string.o ./fdm=
atch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unl=
ocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.=
o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o .=
/objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common=
.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-objec=
t-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces.o=
 ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-utils.=
o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xs=
trdup.o ./xstrerror.o ./xstrndup.o  ./setproctitle.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pex-unix.o
yes
checking whether struct tm is in sys/time.h or time.h... yes
checking for caddr_t... ranlib ./libiberty.a
if [ x"" !=3D x ]; then \
  cd pic; \
  ar rc ./libiberty.a \
    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./a=
rgv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dyn-string.o ./f=
dmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_u=
nlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./he=
x.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o=
 ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-comm=
on.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-obj=
ect-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces=
.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-util=
s.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./=
xstrdup.o ./xstrerror.o ./xstrndup.o  ./setproctitle.o; \
  ranlib ./libiberty.a; \
  cd ..; \
else true; fi
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/libiberty'
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/fixincludes'
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixincl.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixtests.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixfixes.c
time.h
checking size of int... yes
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/t=
mp/sysroots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings -Ws=
trict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-form=
at-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONF=
IG_H -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/fixincludes -I../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/fixincludes/../include /mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/server.c
4
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/procopen.c
checking size of long... gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-p=
rototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attr=
ibute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I=
. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixi=
ncludes -I../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/fixincludes/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/fixlib.c
yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking for pid_t... rm -f ./libiberty.a pic/./libiberty.a
ar rc ./libiberty.a \
  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./arg=
v.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dyn-string.o ./fdm=
atch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unl=
ocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.=
o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o .=
/objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common=
.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-objec=
t-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces.o=
 ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-utils.=
o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xs=
trdup.o ./xstrerror.o ./xstrndup.o  ./setproctitle.o
ranlib ./libiberty.a
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixopts.c
if [ x"" !=3D x ]; then \
  cd pic; \
  ar rc ./libiberty.a \
    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./a=
rgv.o ./choose-temp.o ./concat.o ./cp-demint.o ./crc32.o ./dyn-string.o ./f=
dmatch.o ./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_u=
nlocked.o ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./he=
x.o ./lbasename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o=
 ./objalloc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-comm=
on.o ./pex-one.o ./pex-unix.o ./safe-ctype.o ./simple-object.o ./simple-obj=
ect-coff.o ./simple-object-elf.o ./simple-object-mach-o.o ./sort.o ./spaces=
.o ./splay-tree.o ./stack-limit.o ./strerror.o ./strsignal.o ./timeval-util=
s.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./=
xstrdup.o ./xstrerror.o ./xstrndup.o  ./setproctitle.o; \
  ranlib ./libiberty.a; \
  cd ..; \
else true; fi
srcdir=3D"/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/fixincludes" /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/fixincludes/mkfixinc.sh arm-oecore-linux-gnueabi
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/libiberty'
sed -e 's/@gcc_version@/4.7.2/' < mkheaders.almost > mkheadersT
mv -f mkheadersT mkheaders
8
checking for clearerr_unlocked... make[1]: Entering directory `/mnt/SSD/oe-=
r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-init=
ial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/build-x=
86_64-linux/fixincludes'
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixincl.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixtests.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixfixes.c
yes
checking for vfork.h... gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-pr=
ototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attri=
bute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I.=
 -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixin=
cludes -I../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/fixincludes/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sh=
ared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/server.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/procopen.c
no
checking for fork... yes
checking for feof_unlocked... gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp=
/sysroots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings -Wstr=
ict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format=
-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG=
_H -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/fixincludes -I../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/fixincludes/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/fixlib.c
yes
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixopts.c
yes
srcdir=3D"/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/fixincludes" /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/fixincludes/mkfixinc.sh arm-oecore-linux-gnueabi
checking for vfork... checking for ferror_unlocked... sed -e 's/@gcc_versio=
n@/4.7.2/' < mkheaders.almost > mkheadersT
mv -f mkheadersT mkheaders
gcc -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib =
-L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,=
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-lin=
k,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/=
SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD=
/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o fixincl fixincl=
.o fixtests.o fixfixes.o server.o procopen.o fixlib.o fixopts.o ../libibert=
y/libiberty.a
yes
checking for working fork... yes
checking for fflush_unlocked... echo timestamp > full-stamp
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/fixincludes'
yes
yes
checking for working vfork... (cached) yes
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... checking for fgetc_unlocked... yes
checking for shared library run path origin... done
checking for iconv... yes
checking for fgets_unlocked... yes
checking for iconv declaration... yes
checking for fileno_unlocked... gcc -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/include -O2 -pipe -L/mnt/SSD/oe-r0005/ccoR0005/tm=
p/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86=
_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linu=
x/lib -Wl,-O1 -o fixincl fixincl.o fixtests.o fixfixes.o server.o procopen.=
o fixlib.o fixopts.o ../libiberty/libiberty.a
install-shextern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesle=
ft, char * *outbuf, size_t *outbytesleft);
checking for LC_MESSAGES... echo timestamp > full-stamp
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/fixincludes'
yes
yes
checking for nl_langinfo and CODESET... checking for fprintf_unlocked... ye=
s
checking whether getenv is declared... no
checking for fputc_unlocked... yes
yes
checking whether atol is declared... checking for fputs_unlocked... yes
yes
checking for fread_unlocked... checking whether asprintf is declared... yes
checking for fwrite_unlocked... yes
checking whether sbrk is declared... yes
checking for getchar_unlocked... yes
checking whether abort is declared... yes
checking for getc_unlocked... yes
checking whether atof is declared... yes
checking for putchar_unlocked... yes
checking whether getcwd is declared... yes
checking for putc_unlocked... yes
checking whether getwd is declared... yes
checking whether abort is declared... yes
checking whether strsignal is declared... yes
checking whether asprintf is declared... yes
checking whether strstr is declared... yes
checking whether basename is declared... yes
yes
checking whether stpcpy is declared... checking whether errno is declared..=
. no
checking whether getopt is declared... yes
checking whether strverscmp is declared... yes
checking whether vasprintf is declared... yes
checking whether errno is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether snprintf is declared... yes
checking whether feof_unlocked is declared... yes
checking whether vsnprintf is declared... yes
checking whether ferror_unlocked is declared... yes
checking whether vasprintf is declared... yes
checking whether fflush_unlocked is declared... yes
checking whether malloc is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether realloc is declared... yes
checking whether fgets_unlocked is declared... yes
yes
checking whether calloc is declared... checking whether fileno_unlocked is =
declared... yes
yes
checking whether fprintf_unlocked is declared... checking whether free is d=
eclared... no
checking whether fputc_unlocked is declared... yes
checking whether basename is declared... yes
checking whether fputs_unlocked is declared... yes
checking whether getopt is declared... yes
checking whether fread_unlocked is declared... no
checking whether clock is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether getpagesize is declared... yes
checking whether getchar_unlocked is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether getc_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
checking whether putchar_unlocked is declared... yes
checking whether ferror_unlocked is declared... yes
checking whether putc_unlocked is declared... yes
yes
checking for working alloca.h... checking whether fflush_unlocked is declar=
ed... yes
checking for alloca... yes
checking whether fgetc_unlocked is declared... yes
checking for ANSI C header files... (cached) yes
checking for nl_langinfo and CODESET... yes
checking whether fgets_unlocked is declared... yes
checking whether NLS is requested... no
checking for uchar...=20
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... yes
checking whether fileno_unlocked is declared... done
checking for iconv... yes
checking whether fprintf_unlocked is declared... yes
checking for iconv declaration... install-shextern size_t iconv (iconv_t cd=
, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft)=
;
no
checking whether fputc_unlocked is declared... configure: updating cache ./=
config.cache
configure: creating ./config.status
yes
checking whether fputs_unlocked is declared... yes
checking whether fread_unlocked is declared... config.status: creating Make=
file
config.status: creating config.h
config.status: executing depdir commands
mkdir -p -- .deps
yes
checking whether fwrite_unlocked is declared... make[1]: Entering directory=
 `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/=
gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-g=
nueabi/libcpp'
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o charset.o -MT charset.o -MMD -MP -MF .deps/charset.Tpo /m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/cha=
rset.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o directives.o -MT directives.o -MMD -MP -MF .deps/directiv=
es.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp/directives.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o directives-only.o -MT directives-only.o -MMD -MP -MF .dep=
s/directives-only.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/libcpp/directives-only.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o errors.o -MT errors.o -MMD -MP -MF .deps/errors.Tpo /mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/errors=
.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o expr.o -MT expr.o -MMD -MP -MF .deps/expr.Tpo /mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/expr.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o files.o -MT files.o -MMD -MP -MF .deps/files.Tpo /mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/files.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o identifiers.o -MT identifiers.o -MMD -MP -MF .deps/identi=
fiers.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libcpp/identifiers.c
yes
checking whether getchar_unlocked is declared... yes
checking whether getc_unlocked is declared... echo "#define LOCALEDIR \"/mn=
t/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/share/locale\"" > loc=
aledir.new
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/.=
./move-if-change localedir.new localedir.h
echo timestamp > localedir.hs
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o lex.o -MT lex.o -MMD -MP -MF .deps/lex.Tpo /mnt/SSD/oe-r0=
005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/lex.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o line-map.o -MT line-map.o -MMD -MP -MF .deps/line-map.Tpo=
 /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/=
line-map.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o macro.o -MT macro.o -MMD -MP -MF .deps/macro.Tpo /mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/macro.c
yes
checking whether putchar_unlocked is declared... yes
checking whether putc_unlocked is declared... yes
checking whether getrlimit is declared... yes
checking whether setrlimit is declared... gcc  -I/mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -=
isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2=
 -pipe -W -Wall -Wno-narrowing -Wwrite-strings -Wmissing-format-attribute -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wc++-compat=
 -pedantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -c -o mkdeps.o -MT mk=
deps.o -MMD -MP -MF .deps/mkdeps.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sh=
ared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/mkdeps.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o pch.o -MT pch.o -MMD -MP -MF .deps/pch.Tpo /mnt/SSD/oe-r0=
005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/pch.c
yes
checking whether getrusage is declared... yes
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o symtab.o -MT symtab.o -MMD -MP -MF .deps/symtab.Tpo /mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/symtab=
.c
gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/l=
ibcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libcpp/include  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysr=
oots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wno-narrowing -Wwrite-str=
ings -Wmissing-format-attribute -Wstrict-prototypes -Wmissing-prototypes -W=
old-style-definition -Wc++-compat -pedantic -Wno-long-long  -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../includ=
e -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libc=
pp/include  -c -o traditional.o -MT traditional.o -MMD -MP -MF .deps/tradit=
ional.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libcpp/traditional.c
checking whether ldgetname is declared... gcc  -I/mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -=
isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2=
 -pipe -W -Wall -Wno-narrowing -Wwrite-strings -Wmissing-format-attribute -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wc++-compat=
 -pedantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -c -o init.o -MT init=
.o -MMD -MP -MF .deps/init.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/libcpp/init.c
no
checking whether times is declared... yes
checking whether sigaltstack is declared... yes
checking whether madvise is declared... yes
checking for struct tms... yes
checking for clock_t... rm -f libcpp.a
ar cru libcpp.a charset.o directives.o directives-only.o errors.o expr.o fi=
les.o identifiers.o init.o lex.o line-map.o macro.o mkdeps.o pch.o symtab.o=
 traditional.o
ranlib libcpp.a
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/libcpp'
yes
checking for F_SETLKW... yes
checking if mkdir takes one argument... no
For  real value is=20
For  real value is=20
Using `/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/config/arm/arm.c' for machine-specific logic.
Using `/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/config/arm/arm.md' as machine description file.
Using the following target machine macro files:
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/dbxelf.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/elfos.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/gnu-user.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/linux.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/linux-android.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/glibc-stdint.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/elf.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/linux-gas.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/linux-elf.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/bpabi.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/linux-eabi.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/aout.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/arm.h
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/initfini-array.h
Using host-linux.o for host machine hooks.
checking whether NLS is requested... no
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... /usr/bin/grep -F
checking for ld used by gcc... ld
checking if the linker (ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+=3D"... yes
checking for ld option to reload object files... -r
checking for x86_64-linux-objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for x86_64-linux-ar... (cached) ar
checking for x86_64-linux-strip... strip
checking for x86_64-linux-ranlib... (cached) ranlib
checking command to parse nm output from gcc object... ok
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (ld -m elf_x86_64) supports shared librarie=
s... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... no
checking whether to build static libraries... yes
checking how to run the C++ preprocessor... g++ -E
checking for ld used by g++... ld -m elf_x86_64
checking if the linker (ld -m elf_x86_64) is GNU ld... yes
checking whether the g++ linker (ld -m elf_x86_64) supports shared librarie=
s... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes
checking if g++ static flag -static works... yes
checking if g++ supports -c -o file.o... yes
checking if g++ supports -c -o file.o... (cached) yes
checking whether the g++ linker (ld -m elf_x86_64) supports shared librarie=
s... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for arm-oecore-linux-gnueabi-as... /mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oeco=
re-linux-gnueabi-as
checking what assembler to use... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oecore-linux-g=
nueabi-as
checking for arm-oecore-linux-gnueabi-ld... /mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oeco=
re-linux-gnueabi-ld
checking whether we are using gold... no
checking what linker to use... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oecore-linux-gnue=
abi-ld
checking for arm-oecore-linux-gnueabi-nm... /mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oeco=
re-linux-gnueabi-nm
checking what nm to use... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oecore-linux-gnueabi-=
nm
checking for arm-oecore-linux-gnueabi-objdump... /mnt/SSD/oe-r0005/ccoR0005=
/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm=
-oecore-linux-gnueabi-objdump
checking what objdump to use... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86=
_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi/arm-oecore-linux-gnu=
eabi-objdump
checking for readelf... /usr/bin/readelf
checking what readelf to use... /usr/bin/readelf
checking assembler flags... =20
checking assembler for .balign and .p2align... yes
checking assembler for .p2align with maximum skip... yes
checking assembler for .literal16... no
checking assembler for working .subsection -1... yes
checking assembler for .weak... yes
checking assembler for .weakref... yes
checking assembler for .nsubspa comdat... no
checking assembler for .hidden... yes
checking linker for .hidden support... yes
checking linker read-only and read-write section mixing... read-write
checking for .preinit_array/.init_array/.fini_array support... checking cro=
ss compile... guessing... no
checking assembler for .sleb128 and .uleb128... yes
checking assembler for cfi directives... yes
checking assembler for working cfi advance... yes
checking assembler for cfi personality directive... yes
checking assembler for cfi sections directive... yes
checking assembler for eh_frame optimization... no
checking assembler for section merging support... yes
checking assembler for COMDAT group support (GNU as)... no
checking assembler for COMDAT group support (GNU as, %type)... yes
checking assembler for line table discriminator support... yes
checking assembler for thread-local storage support... yes
checking linker -Bstatic/-Bdynamic option... yes
checking linker --demangle support... yes
checking linker plugin support... 0
checking assembler for dwarf2 debug_line support... yes
checking assembler for buggy dwarf2 .file directive... no
checking assembler for --gdwarf2 option... yes
checking assembler for --gstabs option... yes
checking assembler for --debug-prefix-map option... yes
checking assembler for .lcomm with alignment... no
checking assembler for gnu_unique_object... yes
checking assembler for tolerance to line number 0... yes
checking linker PT_GNU_EH_FRAME support... yes
checking linker position independent executable support... yes
checking linker EH-compatible garbage collection of sections... no
checking linker EH garbage collection of sections bug... no
checking linker --as-needed support... yes
checking linker --build-id support... yes
checking linker *_sol2 emulation support... no
checking linker --sysroot support... yes
checking __stack_chk_fail in target C library... no
checking sys/sdt.h in the target C library... no
checking dl_iterate_phdr in target C library... unknown
Using ggc-page for garbage collection.
checking whether to enable maintainer-specific portions of Makefiles... no
Links are now set up to build a cross-compiler
 from x86_64-pc-linux-gnu to arm-oecore-linux-gnueabi.
configure: updating cache ./config.cache
configure: creating ./config.status
config.status: creating as
config.status: creating collect-ld
config.status: creating nm
config.status: creating Makefile
config.status: creating ada/gcc-interface/Makefile
config.status: creating ada/Makefile
config.status: creating auto-host.h
config.status: executing default commands
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/gcc'
TARGET_CPU_DEFAULT=3D"" \
HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"" \
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/mkconfig.sh config.h
TARGET_CPU_DEFAULT=3D"TARGET_CPU_generic" \
HEADERS=3D"options.h insn-constants.h config/dbxelf.h config/elfos.h config=
/gnu-user.h config/linux.h config/linux-android.h config/glibc-stdint.h con=
fig/arm/elf.h config/arm/linux-gas.h config/arm/linux-elf.h config/arm/bpab=
i.h config/arm/linux-eabi.h config/arm/aout.h config/arm/arm.h config/initf=
ini-array.h ./defaults.h" DEFINES=3D"LIBC_GLIBC=3D1 LIBC_UCLIBC=3D2 LIBC_BI=
ONIC=3D3 DEFAULT_LIBC=3DLIBC_GLIBC ANDROID_DEFAULT=3D0" \
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/mkconfig.sh tm.h
gawk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/opt-gather.awk /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/ada/gcc-interface/lang.opt /mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/fortran/lang.opt /mnt/SSD/oe-r0005/cc=
oR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/go/lang.opt /mnt/SSD/oe-=
r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/java/lang.opt /m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/lto/la=
ng.opt /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/c-family/c.opt /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/=
gcc-4.7.2/gcc/common.opt /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/config/arm/arm-tables.opt /mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/config/arm/arm.opt /mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/config/gnu-user.o=
pt /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/c=
onfig/linux.opt /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/config/linux-android.opt > tmp-optionlist
TARGET_CPU_DEFAULT=3D"" \
HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"" \
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/mkconfig.sh bconfig.h
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
-DBASEVER=3D"\"4.7.2\"" -DDATESTAMP=3D"\"\"" \
-DREVISION=3D"\"\"" \
-DDEVPHASE=3D"\"\"" -DPKGVERSION=3D"\"(GCC) \"" \
-DBUGURL=3D"\"<http://gcc.gnu.org/bugs.html>\"" -o build/version.o /mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/version.c
echo "#define BUILDING_GCC_MAJOR `echo 4.7.2 | sed -e 's/^\([0-9]*\).*$/\1/=
'`" > bversion.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-gi.list gtyp-input.list
TARGET_CPU_DEFAULT=3D"" \
HEADERS=3D"config/arm/arm-protos.h tm-preds.h" DEFINES=3D"" \
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/mkconfig.sh tm_p.h
rm -f tmp-all-tree.def
echo "#define BUILDING_GCC_MINOR `echo 4.7.2 | sed -e 's/^[0-9]*\.\([0-9]*\=
).*$/\1/'`" >> bversion.h
echo timestamp > s-gtyp-input
echo '#include "tree.def"' > tmp-all-tree.def
if test no =3D yes \
   || test -n ""; then \
  /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/genmultilib \
    "" \
    "" \
    "" \
    " *mthumb/*mfloat-abi=3Dhard*" \
    "" \
    "" \
    "" \
    "no" \
    > tmp-mlib.h; \
else \
  /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/genmultilib '' '' '' '' '' '' '' no \
    > tmp-mlib.h; \
fi
echo "#define BUILDING_GCC_PATCHLEVEL `echo 4.7.2 | sed -e 's/^[0-9]*\.[0-9=
]*\.\([0-9]*\)$/\1/'`" >> bversion.h
echo 'END_OF_BASE_TREE_CODES' >> tmp-all-tree.def
lsf=3D""; for f in $lsf; do \
    echo "#include \"$f\""; \
done | sed 's|/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/||' > tmp-specs.h
echo "#define BUILDING_GCC_VERSION (BUILDING_GCC_MAJOR * 1000 + BUILDING_GC=
C_MINOR)" >> bversion.h
echo '#include "c-family/c-common.def"' >> tmp-all-tree.def
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-specs.h specs.h
echo "gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/us=
r/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-nar=
rowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes=
 -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -=
Wno-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_=
H -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD=
/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/o=
e-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD=
/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r00=
05/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/=
ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1" > checksum-options.tmp \
&& /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/.=
./move-if-change checksum-options.tmp checksum-options
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-mlib.h multilib.h
echo timestamp > s-bversion
ltf=3D"/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/ada/gcc-interface/ada-tree.def /mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/gcc/cp/cp-tree.def /mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/java/java-tree.def /mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/objc/objc-tree.def"=
; for f in $ltf; do \
  echo "#include \"$f\""; \
done | sed 's|/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/||' >> tmp-all-tree.def
echo timestamp > s-specs
cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/g=
cc-ar.c gcc-nm.c
cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/g=
cc-ar.c gcc-ranlib.c
echo timestamp > s-mlib
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-all-tree.def all-tree.def
TARGET_CPU_DEFAULT=3D"" \
HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"USED_FOR_TARGET " \
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/mkconfig.sh tconfig.h
(echo "@set version-GCC 4.7.2"; \
 if [ "" =3D "experimental" ]; \
 then echo "@set DEVELOPMENT"; \
 else echo "@clear DEVELOPMENT"; \
 fi) > gcc-vers.texiT
echo timestamp > s-alltree
echo @set srcdir /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc >> gcc-vers.texiT
echo timestamp > gpl.pod
if [ -n "(GCC) " ]; then \
  echo "@set VERSION_PACKAGE (GCC) " >> gcc-vers.texiT; \
fi
perl /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../contrib/texi2pod.pl /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/doc/include/gpl_v3.texi > gpl.pod
echo "@set BUGURL @uref{http://gcc.gnu.org/bugs.html}" >> gcc-vers.texiT; \
mv -f gcc-vers.texiT gcc-vers.texi
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/genhooks.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/genhooks.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/genchecksum.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/genchecksum.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/genenums.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/genenums.c
gcc -c  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=
=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vf=
p-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DSTANDARD_LIBEXEC_PRE=
FIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/libexec/ar=
mv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DDEFAULT_TARGE=
T_VERSION=3D\"4.7.2\" -DDEFAULT_TARGET_MACHINE=3D\"arm-oecore-linux-gnueabi=
\" -DSTANDARD_BINDIR_PREFIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86=
_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/\"=
 -DTOOLDIR_BASE_PREFIX=3D\"../../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/=
SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\"  `test "X${SHLIB}" =3D "X" =
|| test "no" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` -DCONFIGURE_SPECS=
=3D"\"\"" -DTARGET_MACHINE=3D\"arm-oecore-linux-gnueabi\" -DTARGET_SYSTEM_R=
OOT=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\" -DPERSONALITY=
=3D\"ar\" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/=
include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narro=
wing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -=
Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wn=
o-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H =
-I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/=
tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdec=
number    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/gcc-ar.c -o gcc-ar.o
gcc -c  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=
=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vf=
p-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DSTANDARD_LIBEXEC_PRE=
FIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/libexec/ar=
mv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DDEFAULT_TARGE=
T_VERSION=3D\"4.7.2\" -DDEFAULT_TARGET_MACHINE=3D\"arm-oecore-linux-gnueabi=
\" -DSTANDARD_BINDIR_PREFIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86=
_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/\"=
 -DTOOLDIR_BASE_PREFIX=3D\"../../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/=
SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\"  `test "X${SHLIB}" =3D "X" =
|| test "no" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` -DCONFIGURE_SPECS=
=3D"\"\"" -DTARGET_MACHINE=3D\"arm-oecore-linux-gnueabi\" -DTARGET_SYSTEM_R=
OOT=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\" -DPERSONALITY=
=3D\"nm\" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/=
include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narro=
wing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -=
Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wn=
o-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H =
-I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/=
tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdec=
number    gcc-nm.c -o gcc-nm.o
gcc -c  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=
=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vf=
p-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DSTANDARD_LIBEXEC_PRE=
FIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/libexec/ar=
mv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DDEFAULT_TARGE=
T_VERSION=3D\"4.7.2\" -DDEFAULT_TARGET_MACHINE=3D\"arm-oecore-linux-gnueabi=
\" -DSTANDARD_BINDIR_PREFIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86=
_64-linux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/\"=
 -DTOOLDIR_BASE_PREFIX=3D\"../../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/=
SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\"  `test "X${SHLIB}" =3D "X" =
|| test "no" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` -DCONFIGURE_SPECS=
=3D"\"\"" -DTARGET_MACHINE=3D\"arm-oecore-linux-gnueabi\" -DTARGET_SYSTEM_R=
OOT=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\" -DPERSONALITY=
=3D\"ranlib\" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/=
usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-n=
arrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototyp=
es -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros=
 -Wno-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFI=
G_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0=
005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../li=
bdecnumber    gcc-ranlib.c -o gcc-ranlib.o
if [ xinfo =3D xinfo ]; then \
	makeinfo --split-size=3D5000000 --no-split -I . -I /mnt/SSD/oe-r0005/ccoR0=
005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc \
		-I /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/doc/include -o doc/cpp.info /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/gcc/doc/cpp.texi; \
fi
if [ xinfo =3D xinfo ]; then \
	makeinfo --split-size=3D5000000 --no-split -I . -I /mnt/SSD/oe-r0005/ccoR0=
005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc \
		-I /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/doc/include -o doc/gcc.info /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/gcc/doc/gcc.texi; \
fi
if [ xinfo =3D xinfo ]; then \
	makeinfo --split-size=3D5000000 --no-split -I /mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc \
		-I /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/doc/include -o doc/gccinstall.info /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/install.texi; \
fi
if [ xinfo =3D xinfo ]; then \
	makeinfo --split-size=3D5000000 --no-split -I . -I /mnt/SSD/oe-r0005/ccoR0=
005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc \
		-I /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/doc/include -o doc/cppinternals.info /mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/cppinternals.texi; \
fi
echo timestamp > gcc.pod
perl /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../contrib/texi2pod.pl /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/doc/invoke.texi > gcc.pod
echo timestamp > doc/gpl.7
(pod2man --center=3D"GNU" --release=3D"gcc-4.7.2" --date=3D2012-09-20 --sec=
tion=3D7 gpl.pod > doc/gpl.7.T$$ && \
	mv -f doc/gpl.7.T$$ doc/gpl.7) || \
	(rm -f doc/gpl.7.T$$ && exit 1)
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/genconstants.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/genconstants.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/read-md.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/gcc/read-md.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/errors.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/errors.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/genmddeps.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/genmddeps.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/genmodes.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/genmodes.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/gengenrtl.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gengenrtl.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-optionlist optionlist
echo timestamp > s-options
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/gengtype.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/gengtype.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat  -Wno-error -DHAVE_=
CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR00=
05/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SS=
D/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnu=
mber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../libdecnumber/dpd -I../libdecnumber    \
	-o build/gengtype-lex.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/gengtype-lex.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/gengtype-parse.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4=
.7.2-r19/gcc-4.7.2/gcc/gengtype-parse.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
DGENERATOR_FILE -I. -Ibuild -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/build -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wor=
k-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libd=
ecnumber/dpd -I../libdecnumber    \
	-o build/gengtype-state.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4=
.7.2-r19/gcc-4.7.2/gcc/gengtype-state.c
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -DGE=
NERATOR_FILE -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib=
 -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link=
,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-li=
nk,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt=
/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SS=
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genhooks=
 \
    build/genhooks.o build/errors.o ../build-x86_64-linux/libiberty/libiber=
ty.a
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -DGE=
NERATOR_FILE -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib=
 -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link=
,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-li=
nk,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt=
/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SS=
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/gencheck=
sum \
    build/genchecksum.o ../build-x86_64-linux/libiberty/libiberty.a
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -DGE=
NERATOR_FILE -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib=
 -L/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link=
,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-li=
nk,/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt=
/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SS=
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genenums=
 \
    build/genenums.o build/read-md.o build/errors.o ../build-x86_64-linux/l=
ibiberty/libiberty.a
build/genhooks "Common Target Hook" \
				     > tmp-common-target-hooks-def.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-common-target-hooks-def.h \
				     common/common-target-hooks-def.h
echo timestamp > s-common-target-hooks-def-h
build/genhooks -d \
		/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/do=
c/tm.texi.in > tmp-tm.texi
case `echo X|tr X '\101'` in \
  A) tr -d '\015' < tmp-tm.texi > tmp2-tm.texi ;; \
  *) tr -d '\r' < tmp-tm.texi > tmp2-tm.texi ;; \
esac
mv tmp2-tm.texi tmp-tm.texi
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-tm.texi tm.texi
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
cppopts.texi:806: @itemx must follow @item
echo timestamp > doc/gcc.1
make[1]: *** [doc/cpp.info] Error 1
make[1]: *** Waiting for unfinished jobs....
(pod2man --center=3D"GNU" --release=3D"gcc-4.7.2" --date=3D2012-09-20 --sec=
tion=3D1 gcc.pod > doc/gcc.1.T$$ && \
	mv -f doc/gcc.1.T$$ doc/gcc.1) || \
	(rm -f doc/gcc.1.T$$ && exit 1)
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3143: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3158: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3215: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3222: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3231: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3268: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3285: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3308: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3343: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3355: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3362: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3400: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3413: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3465: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3478: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3589: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3598: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3610: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3630: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3659: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3679: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3694: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3844: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3851: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3858: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3865: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3872: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3879: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3907: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3917: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3924: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3931: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3983: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:3990: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4089: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4096: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4108: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4124: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4130: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4137: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4143: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4150: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4156: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4162: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4169: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4175: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4182: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4190: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4196: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4202: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4213: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4334: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4349: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4411: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4427: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4437: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4462: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4469: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4476: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4484: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4492: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4527: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4537: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4553: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4571: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4583: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4640: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4657: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4667: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4676: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
install.texi:4722: warning: @anchor should not appear in @heading
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
gcc.texi:89: warning: @tex should only appear at a line beginning
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
gcc.texi:89: warning: @end should only appear at a line beginning
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
gcc.texi:91: warning: @tex should only appear at a line beginning
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
gcc.texi:91: warning: @end should only appear at a line beginning
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5191: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5339: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5343: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5354: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5358: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5403: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:5433: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
cppopts.texi:806: @itemx must follow @item
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:11361: warning: command @tie does not accept arguments
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:11371: warning: command @tie does not accept arguments
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:1018: warning: node next `Overall Options' in menu `C Dialect O=
ptions' and in sectioning `Invoking G++' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:1018: warning: node up `Overall Options' in menu `Option Summar=
y' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:1483: warning: node prev `C Dialect Options' in menu `Overall O=
ptions' and in sectioning `Invoking G++' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:1483: warning: node up `C Dialect Options' in menu `Option Summ=
ary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:1873: warning: node up `C++ Dialect Options' in menu `Option Su=
mmary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:2610: warning: node up `Objective-C and Objective-C++ Dialect O=
ptions' in menu `Option Summary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:2842: warning: node up `Language Independent Options' in menu `=
Option Summary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:2890: warning: node up `Warning Options' in menu `Option Summar=
y' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:4701: warning: node up `Debugging Options' in menu `Option Summ=
ary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:6117: warning: node up `Optimize Options' in menu `Option Summa=
ry' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:9285: warning: node up `Preprocessor Options' in menu `Option S=
ummary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:9323: warning: node up `Assembler Options' in menu `Option Summ=
ary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:9346: warning: node up `Link Options' in menu `Option Summary' =
and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:9602: warning: node up `Directory Options' in menu `Option Summ=
ary' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:9746: warning: node up `Spec Files' in menu `Option Summary' an=
d in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
invoke.texi:10305: warning: node up `Target Options' in menu `Option Summar=
y' and in sectioning `Invoking GCC' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
implement-c.texi:6: warning: node next `C Implementation' in menu `C Extens=
ions' and in sectioning `C++ Implementation' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
implement-cxx.texi:6: warning: node next `C++ Implementation' in menu `C++ =
Extensions' and in sectioning `C Extensions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
implement-cxx.texi:6: warning: node prev `C++ Implementation' in menu `C Ex=
tensions' and in sectioning `C Implementation' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:8: warning: node next `C Extensions' in menu `C++ Implementatio=
n' and in sectioning `C++ Extensions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:8: warning: node prev `C Extensions' in menu `C Implementation'=
 and in sectioning `C++ Implementation' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:772: warning: node next `Conditionals' in menu `Long Long' and =
in sectioning `__int128' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:810: warning: node next `__int128' in menu `Complex' and in sec=
tioning `Long Long' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:810: warning: node prev `__int128' in menu `Long Long' and in s=
ectioning `Conditionals' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:821: warning: node next `Long Long' in menu `__int128' and in s=
ectioning `Complex' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:821: warning: node prev `Long Long' in menu `Conditionals' and =
in sectioning `__int128' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:853: warning: node prev `Complex' in menu `__int128' and in sec=
tioning `Long Long' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1411: warning: node next `Zero Length' in menu `Variable Length=
' and in sectioning `Empty Structures' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1509: warning: node next `Empty Structures' in menu `Variadic M=
acros' and in sectioning `Variable Length' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1509: warning: node prev `Empty Structures' in menu `Variable L=
ength' and in sectioning `Zero Length' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1525: warning: node next `Variable Length' in menu `Empty Struc=
tures' and in sectioning `Variadic Macros' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1525: warning: node prev `Variable Length' in menu `Zero Length=
' and in sectioning `Empty Structures' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1606: warning: node prev `Variadic Macros' in menu `Empty Struc=
tures' and in sectioning `Variable Length' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1845: warning: node next `Designated Inits' in menu `Cast to Un=
ion' and in sectioning `Case Ranges' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1989: warning: node next `Case Ranges' in menu `Mixed Declarati=
ons' and in sectioning `Cast to Union' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:1989: warning: node prev `Case Ranges' in menu `Cast to Union' =
and in sectioning `Designated Inits' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:2026: warning: node next `Cast to Union' in menu `Case Ranges' =
and in sectioning `Mixed Declarations' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:2026: warning: node prev `Cast to Union' in menu `Designated In=
its' and in sectioning `Case Ranges' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:2067: warning: node prev `Mixed Declarations' in menu `Case Ran=
ges' and in sectioning `Cast to Union' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:10954: warning: node next `MIPS Loongson Built-in Functions' in=
 menu `Other MIPS Built-in Functions' and in sectioning `picoChip Built-in =
Functions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:11357: warning: node next `picoChip Built-in Functions' in menu=
 `PowerPC AltiVec/VSX Built-in Functions' and in sectioning `Other MIPS Bui=
lt-in Functions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:11357: warning: node prev `picoChip Built-in Functions' in menu=
 `Other MIPS Built-in Functions' and in sectioning `MIPS Loongson Built-in =
Functions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:11393: warning: node next `Other MIPS Built-in Functions' in me=
nu `picoChip Built-in Functions' and in sectioning `PowerPC AltiVec/VSX Bui=
lt-in Functions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:11393: warning: node prev `Other MIPS Built-in Functions' in me=
nu `MIPS Loongson Built-in Functions' and in sectioning `picoChip Built-in =
Functions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:11405: warning: node prev `PowerPC AltiVec/VSX Built-in Functio=
ns' in menu `picoChip Built-in Functions' and in sectioning `Other MIPS Bui=
lt-in Functions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
extend.texi:14866: warning: node prev `C++ Extensions' in menu `C++ Impleme=
ntation' and in sectioning `C Extensions' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
trouble.texi:7: warning: node next `Trouble' in menu `Service' and in secti=
oning `Bugs' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
trouble.texi:7: warning: node prev `Trouble' in menu `Bug Reporting' and in=
 sectioning `Gcov' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
trouble.texi:7: warning: node up `Trouble' in menu `Bugs' and in sectioning=
 `Top' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
service.texi:6: warning: node prev `Service' in menu `Trouble' and in secti=
oning `Bugs' differ
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/=
service.texi:6: warning: node up `Service' in menu `Bugs' and in sectioning=
 `Top' differ
make[1]: *** [doc/gcc.info] Error 1
rm gcc.pod
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/gcc'
make: *** [all-gcc] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see /mnt/SSD/oe-r0005/ccoR0005/tmp/work=
/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/temp/log.=
do_compile.23536 for further information)

--------------040909040200070804020101--
