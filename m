Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UP8Ie-0006aj-9l
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 11:23:47 +0200
Message-ID: <5162888A.90502@communistcode.co.uk>
Date: Mon, 08 Apr 2013 10:06:18 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
	<51628545.6050106@communistcode.co.uk>
In-Reply-To: <51628545.6050106@communistcode.co.uk>
Subject: Re: gcc-cross-initial Failure
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
X-List-Received-Date: Mon, 08 Apr 2013 09:23:55 -0000
X-Groupsio-MsgNum: 37540
Content-Type: multipart/mixed; boundary="------------090306080002080804080700"

--------------090306080002080804080700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/13 09:52, Jack Mitchell wrote:
> On 05/04/13 18:03, Khem Raj wrote:
>> On Apr 5, 2013, at 9:36 AM, Jack Mitchell <ml@communistcode.co.uk> 
>> wrote:
>>
>>> I build for the beaglebone and I changed them in line with your 
>>> default beaglebone build patch you posted a week or so ago. I think 
>>> it moved it form soft to hard float possibly...
>> yes do a clean build if possible
>
> Hi Khem,
>
> Clean build results in the same failure.
>
> Host GCC:
>
> Using built-in specs.
> COLLECT_GCC=gcc
> COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.0/lto-wrapper 
>
> Target: x86_64-unknown-linux-gnu
> Configured with: /build/src/gcc-4.8.0/configure --prefix=/usr 
> --libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man 
> --infodir=/usr/share/info --with-bugurl=https://bugs.archlinux.org/ 
> --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ 
> --enable-shared --enable-threads=posix --with-system-zlib 
> --enable-__cxa_atexit --disable-libunwind-exceptions 
> --enable-clocale=gnu --disable-libstdcxx-pch 
> --enable-gnu-unique-object --enable-linker-build-id 
> --enable-cloog-backend=isl --disable-cloog-version-check --enable-lto 
> --enable-gold --enable-ld=default --enable-plugin 
> --with-plugin-ld=ld.gold --with-linker-hash-style=gnu 
> --disable-install-libiberty --disable-multilib --disable-libssp 
> --disable-werror --enable-checking=release
> Thread model: posix
> gcc version 4.8.0 (GCC)
>
>
> Tune:
>
> DEFAULTTUNE_beaglebone = "cortexa8hf-neon"
>
> Cheers,
>

Ok, looks like it might have been fluke that it just failed when I 
changed tune, as it also fails with the old tune, please see attached.

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------090306080002080804080700
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.25230"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.25230"

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 8 ARCH_FLAGS_FOR_TARGET=3D -march=3Darmv7-a     -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/=
tmp/sysroots/beaglebone/usr/include all-gcc all-target-libgcc
mkdir -p -- ./intl
mkdir -p -- ./libdecnumber
mkdir -p -- ./libiberty
Configuring in ./intl
Configuring in ./libdecnumber
mkdir -p -- build-x86_64-linux/libiberty
Configuring in build-x86_64-linux/libiberty
Configuring in ./libiberty
mkdir -p -- ./fixincludes
Configuring in ./fixincludes
mkdir -p -- build-x86_64-linux/fixincludes
Configuring in build-x86_64-linux/fixincludes
configure: creating cache ../config.cache
configure: creating cache ./config.cache
checking whether make sets $(MAKE)... checking build system type... yes
checking for x86_64-linux-gcc... gcc
configure: loading cache ../config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo
checking for perl... perl
configure: creating cache ./config.cache
checking whether make sets $(MAKE)... x86_64-pc-linux-gnu
checking host system type... checking for C compiler default output file na=
me... yes
checking for a BSD-compatible install... /usr/bin/install -c
checking whether NLS is requested... no
configure: creating cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo
checking for msgfmt... configure: creating cache ./config.cache
x86_64-pc-linux-gnu
checking target system type... checking for perl... perl
checking build system type... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_6=
4-linux/usr/bin/msgfmt
checking for gmsgfmt... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linu=
x/usr/bin/msgfmt
checking for xgettext... arm-oecore-linux-gnueabi
checking for x86_64-linux-gcc... gcc
checking build system type... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroo=
ts/x86_64-linux/usr/bin/xgettext
x86_64-pc-linux-gnu
checking host system type... checking for msgmerge... /mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/bin/msgmerge
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc
checking for x86_64-linux-gcc... gcc
checking for C compiler default output file name...=20
checking for suffix of object files... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc
o
checking whether we are using the GNU C compiler... a.out
checking whether the C compiler works... x86_64-pc-linux-gnu
checking target system type... yes
checking for C compiler default output file name... checking whether we are=
 cross compiling... no
checking for suffix of executables... yes
checking whether gcc accepts -g... arm-oecore-linux-gnueabi
checking for x86_64-linux-gcc... gcc
checking for C compiler default output file name... checking for C compiler=
 default output file name...=20
checking for suffix of object files... yes
checking for gcc option to accept ISO C89... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... checking for C compiler default outpu=
t file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... o
checking whether we are using the GNU C compiler... none needed
checking for x86_64-linux-ranlib... ranlib

checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking whether gcc supports -W...=20
checking for suffix of object files...=20
checking for suffix of object files... checking for suffix of object files.=
.. a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes
checking whether gcc accepts -g... o
checking whether we are using the GNU C compiler... yes
o
checking whether we are using the GNU C compiler... o
checking whether we are using the GNU C compiler... checking whether gcc su=
pports -Wall...=20
checking for suffix of object files... yes
checking for gcc option to accept ISO C89... yes
checking whether gcc accepts -g... yes
checking whether gcc accepts -g... yes
o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... checking whether gcc supports -Wwrite-st=
rings... yes
checking whether gcc accepts -g... none needed
checking how to run the C preprocessor... gcc -E
yes
checking for gcc option to accept ISO C89... yes
checking for gcc option to accept ISO C89... yes
checking for gcc option to accept ISO C89... yes
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... yes
checking for gcc option to accept ISO C89... checking whether gcc supports =
-Wstrict-prototypes... /usr/bin/grep -E
checking for ANSI C header files... none needed
none needed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... checking bui=
ld system type... yes
checking whether gcc supports -Wmissing-prototypes... none needed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking how to run the C preprocessor... gcc -E
none needed
checking how to run the C preprocessor... gcc -E
x86_64-pc-linux-gnu
checking host system type... no
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... checking whether gcc su=
pports -W... yes
/usr/bin/grep
checking for egrep... x86_64-pc-linux-gnu
checking for x86_64-linux-ranlib... ranlib
checking for library containing strerror... /usr/bin/grep -E
checking for ANSI C header files... checking whether gcc supports -Wold-sty=
le-definition... yes
checking for sys/types.h... yes
checking whether gcc supports -Wall... yes
checking whether gcc supports -Wmissing-format-attribute... yes
checking whether gcc supports -W... yes
none required
checking how to run the C preprocessor... gcc -E
checking for sys/stat.h... yes
checking whether gcc supports -Wwrite-strings... checking for grep that han=
dles long lines and -e... checking whether gcc supports -Wcast-qual... yes
/usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... checking whether gcc supports -Wall... =
yes
checking whether gcc supports -Wc++-compat... yes
yes
yes
checking whether gcc supports -Wwrite-strings... checking for sys/types.h..=
. yes
checking for stdlib.h... checking whether gcc supports -pedantic -Wlong-lon=
g... yes
checking whether gcc supports -Wstrict-prototypes... yes
yes
checking how to run the C preprocessor... gcc -E
checking whether gcc supports -Wc++-compat... yes
yes
checking for sys/stat.h... yes
checking whether gcc supports -pedantic ... checking for grep that handles =
long lines and -e... checking for string.h... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking whether gcc supports -Wstrict-prototypes... yes
yes
checking for an ANSI C-conforming const... yes
checking for stdlib.h... checking for memory.h... yes
checking whether gcc and cc understand -c and -o together... yes
checking for inline... yes
checking whether gcc supports -pedantic ... inline
yes
checking for sys/types.h... checking for string.h... yes
yes
checking whether gcc and cc understand -c and -o together... yes
checking for strings.h... checking for sys/stat.h... yes
yes
checking for sys/types.h... checking for memory.h... yes
yes
yes
checking for stdlib.h... checking for an ANSI C-conforming const... checkin=
g for sys/stat.h... yes
yes
yes
yes
yes
checking for inline... checking for strings.h... checking for inttypes.h...=
 checking for stdlib.h... yes
checking for an ANSI C-conforming const... checking for string.h... inline
checking for grep that handles long lines and -e... yes
yes
/usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for inline... checking for string.h... yes
checking for inttypes.h... yes
inline
checking for grep that handles long lines and -e... checking for stdint.h..=
. checking for memory.h... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for memory.h... yes
yes
yes
checking for strings.h... checking for unistd.h... checking for stdint.h...=
 yes
yes
yes
checking for strings.h... checking for inttypes.h... yes
yes
checking minix/config.h usability... checking for sys/types.h... checking f=
or unistd.h... yes
yes
yes
checking for sys/stat.h... checking for inttypes.h... yes
no
checking minix/config.h presence... yes
yes
checking for stdint.h... checking for sys/types.h... checking for stdlib.h.=
.. checking minix/config.h usability... yes
checking for stdint.h... yes
no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for string.h... yes
yes
checking for sys/stat.h... checking for memory.h... yes
yes
checking for unistd.h... yes
no
checking minix/config.h presence... checking for unistd.h... checking for s=
trings.h... yes
checking for a sed that does not truncate output... checking for stdlib.h..=
. /usr/bin/sed
checking whether gcc supports -W... yes
yes
no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for string.h... yes
checking for inttypes.h... checking for off_t... checking ctype.h usability=
... yes
yes
checking for memory.h... yes
checking for a sed that does not truncate output... checking whether gcc su=
pports -Wall... /usr/bin/sed
yes
yes
checking for stdint.h... checking for strings.h... yes
yes
yes
checking ctype.h presence... checking whether gcc supports -Wwrite-strings.=
.. checking whether gcc supports -W... yes
checking for inttypes.h... checking for unistd.h... yes
yes
yes
yes
yes
checking for size_t... checking whether gcc supports -Wall... checking for =
stdint.h... checking whether gcc supports -Wstrict-prototypes... yes
checking whether byte ordering is bigendian... yes
checking for ctype.h... yes
checking stddef.h usability... checking for unistd.h... yes
yes
checking whether gcc supports -Wmissing-prototypes... yes
yes
checking stddef.h presence... checking whether gcc supports -Wwrite-strings=
... yes
checking for stddef.h... yes
yes
checking whether byte ordering is bigendian... checking whether gcc support=
s -Wold-style-definition... yes
no
checking for a BSD-compatible install... checking whether gcc supports -Wst=
rict-prototypes... yes
checking for working alloca.h... checking for string.h... (cached) yes
/usr/bin/install -c
checking stdio.h usability... checking for sys/file.h... yes
checking whether gcc supports -Wmissing-format-attribute... yes
yes
yes
checking for alloca... yes
checking whether gcc supports -Wmissing-prototypes... yes
checking stdio.h presence... checking whether gcc supports -Woverlength-str=
ings... checking for sys/param.h... no
checking for a BSD-compatible install... yes
checking for stdio.h... yes
looking for a compliant stdint.h in stdint.h, checking for uintmax_t... /us=
r/bin/install -c
yes
yes
yes
checking whether gcc supports -Wold-style-definition... checking whether gc=
c supports -pedantic -Wlong-long... checking for limits.h... checking for s=
ys/file.h... yes
yes
yes
checking for stdlib.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for sys/param.h... checking for malloc.h... checking for unistd.h.=
.. (cached) yes
yes
checking for getpagesize... yes
checking whether gcc supports -Wmissing-format-attribute... checking for AN=
SI C header files... (cached) yes
yes
yes
checking stddef.h usability... checking for limits.h... yes
checking for string.h... (cached) yes
checking whether gcc supports -Woverlength-strings... yes
checking for uintptr_t... yes
yes
checking for working mmap... yes
checking stddef.h presence... checking for unistd.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
yes
checking whether gcc supports -pedantic -Wlong-long... checking for malloc.=
h... checking for sys/time.h... yes
yes
checking for stddef.h... yes
checking for time.h... yes
yes
checking for int_least32_t... yes
yes
checking for ANSI C header files... (cached) yes
checking stddef.h usability... checking for sys/resource.h... checking for =
string.h... (cached) yes
checking for unistd.h... (cached) yes
checking for stdlib.h... (cached) yes
yes
checking whether we are using the GNU C Library 2.1 or newer... yes
checking for strings.h... (cached) yes
yes
checking stddef.h presence... checking for strings.h... (cached) yes
checking for sys/stat.h... (cached) yes
yes
checking for int_fast32_t... checking for sys/time.h... yes
checking whether integer division by zero raises SIGFPE... checking for sys=
/mman.h... checking for unistd.h... (cached) yes
yes
yes
checking for stddef.h... yes
checking fcntl.h usability... yes
checking for fcntl.h... checking for stdlib.h... (cached) yes
checking for time.h... yes
checking for strings.h... (cached) yes
yes
checking for unistd.h... (cached) yes
yes
checking for sys/resource.h... checking for uint64_t... checking for alloca=
.h... yes
checking fcntl.h presence... checking fcntl.h usability... yes
yes
checking for inttypes.h... yes
yes
checking for fcntl.h... yes
checking sys/file.h usability... checking for sys/pstat.h... yes
checking for stdint.h... yes
checking what to include in gstdint.h... yes
checking fcntl.h presence... stdint.h (already complete)
checking for an ANSI C-conforming const... no
checking for sys/stat.h... (cached) yes
checking for sys/sysmp.h... yes
checking for sys/mman.h... checking for unsigned long long... yes
checking for fcntl.h... yes
yes
checking sys/file.h presence... yes
checking for off_t... yes
checking for fcntl.h... checking sys/file.h usability... yes
checking for sys/file.h... yes
no
checking for sys/sysinfo.h... checking for sys/stat.h... (cached) yes
yes
checking for alloca.h... yes
checking for inttypes.h... checking for clearerr_unlocked... yes
yes
checking for sys/pstat.h... checking whether the inttypes.h PRIxNN macros a=
re broken... yes
checking sys/file.h presence... yes
no
checking for sys/sysmp.h... no
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... checking for feof_unlocked..=
. yes
checking for sys/file.h... yes
yes
checking size of int... no
checking for sys/sysinfo.h... checking for sys/stat.h... (cached) done
yes
checking for clearerr_unlocked... checking argz.h usability... yes
checking for ferror_unlocked... yes
4
checking size of long... yes
yes
yes
checking for feof_unlocked... checking for machine/hal_sysinfo.h... checkin=
g for machine/hal_sysinfo.h... checking for fflush_unlocked... no
checking for sys/table.h... yes
no
no
checking for sys/sysctl.h... checking for sys/table.h... 8
checking for ferror_unlocked... checking for ANSI C header files... yes
(cached) yes
checking for fgetc_unlocked... yes
checking build system type... checking for sys/systemcfg.h... no
no
checking for sys/sysctl.h... x86_64-pc-linux-gnu
checking host system type... yes
checking for stdint.h... (cached) yes
yes
checking for sys/systemcfg.h... yes
checking for fflush_unlocked... checking for stdio_ext.h... checking for fg=
ets_unlocked... no
checking for stdint.h... (cached) yes
yes
x86_64-pc-linux-gnu
checking target system type... checking for process.h... checking for stdio=
_ext.h... arm-oecore-linux-gnueabi
checking for decimal floating point... dpd
checking whether byte ordering is bigendian... yes
no
yes
checking for sys/prctl.h... checking for process.h... checking for fgetc_un=
locked... no
checking for sys/prctl.h... yes
checking for fileno_unlocked... yes
checking for fgets_unlocked... no
yes
yes
checking for fprintf_unlocked... checking for fileno_unlocked... configure:=
 updating cache ./config.cache
configure: creating ./config.status
no
yes
checking for fputc_unlocked... checking for fprintf_unlocked... yes
config.status: creating Makefile
checking for fputs_unlocked... no
checking for fputc_unlocked... config.status: creating config.h
config.status: executing gstdint.h commands
yes
checking argz.h presence... yes
checking for argz.h... yes
checking limits.h usability... yes
checking for fread_unlocked... yes
checking for fputs_unlocked... yes
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
checking limits.h presence... source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/decContext.c' object=3D'decCon=
text.o' libtool=3Dno gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libdecnumber -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tm=
p/sysroots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings -Wst=
rict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-forma=
t-attribute -Wcast-qual -pedantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0=
005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/o=
e-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/decCo=
ntext.c
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
checking for limits.h... yes
yes
checking locale.h usability... checking for fwrite_unlocked... yes
yes
yes
checking for sys/wait.h that is POSIX.1 compatible... checking for fread_un=
locked... checking for sys/wait.h that is POSIX.1 compatible... yes
yes
checking locale.h presence... checking for getchar_unlocked... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether time.h and sys/time.h may both be included... yes
yes
checking for locale.h... yes
source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libdecnumber/dpd/decimal64.c' object=3D'decimal64.o' libtool=3Dno gcc  -I=
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnu=
mber -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/=
include -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-pr=
ototypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -ped=
antic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sh=
ared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/dpd/decimal64.c
checking nl_types.h usability... yes
checking whether errno must be declared... checking for fwrite_unlocked... =
yes
source=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libdecnumber/dpd/decimal128.c' object=3D'decimal128.o' libtool=3Dno gcc  =
-I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libdec=
number -I.  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/us=
r/include -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-=
prototypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -p=
edantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/libdecnumber -I.  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/libdecnumber/dpd/decimal128.c
yes
checking whether errno must be declared... no
checking size of int... checking for getc_unlocked... no
checking size of int... yes
yes
checking for getchar_unlocked... checking for putchar_unlocked... 4
checking for a 64-bit type... 4
checking for a 64-bit type... uint64_t
checking for intptr_t... yes
yes
uint64_t
checking for intptr_t... checking for getc_unlocked... checking for putc_un=
locked... yes
yes
checking for putchar_unlocked... checking whether abort is declared... yes
checking for uintptr_t... yes
checking for uintptr_t... yes
yes
checking for putc_unlocked... checking whether asprintf is declared... yes
checking for ssize_t... yes
checking for ssize_t... yes
yes
checking whether abort is declared... checking whether basename is declared=
... yes
checking nl_types.h presence... yes
checking for nl_types.h... yes
yes
yes
yes
checking for pid_t... checking whether errno is declared... checking malloc=
.h usability... checking whether asprintf is declared... yes
checking for pid_t... yes
checking malloc.h presence... yes
checking for malloc.h... yes
yes
checking stddef.h usability... yes
checking whether basename is declared... checking for library containing st=
rerror... yes
checking for library containing strerror... yes
checking stddef.h presence... yes
yes
checking for stddef.h... yes
none required
checking for stdlib.h... (cached) yes
checking for asprintf... checking for string.h... (cached) yes
checking whether errno is declared... checking for unistd.h... (cached) yes
checking sys/param.h usability... none required
checking for asprintf... yes
checking for atexit... yes
checking sys/param.h presence... yes
yes
checking for sys/param.h... yes
checking for atexit... yes
checking for feof_unlocked... checking for basename... yes
yes
yes
checking for basename... checking for fgets_unlocked... checking for bcmp..=
. yes
yes
checking for getc_unlocked... checking for bcmp... yes
checking for bcopy... yes
checking for getcwd... yes
checking for bcopy... no
no
yes
yes
checking whether vasprintf is declared... checking whether vasprintf is dec=
lared... checking for bsearch... checking for getegid... yes
yes
checking for bsearch... checking whether clearerr_unlocked is declared... y=
es
yes
checking whether clearerr_unlocked is declared... checking for bzero... yes
yes
checking for bzero... checking for geteuid... yes
checking whether feof_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
yes
yes
yes
checking for calloc... checking whether ferror_unlocked is declared... chec=
king for calloc... yes
checking for getgid... checking whether ferror_unlocked is declared... yes
checking whether fflush_unlocked is declared... yes
yes
yes
checking for getuid... checking for clock... yes
checking whether fflush_unlocked is declared... checking whether fgetc_unlo=
cked is declared... yes
yes
checking for clock... checking for mempcpy... yes
yes
checking for ffs... yes
checking whether fgets_unlocked is declared... yes
checking whether fgetc_unlocked is declared... checking for ffs... yes
checking for munmap... yes
yes
checking for getcwd... yes
checking whether fileno_unlocked is declared... yes
checking whether fgets_unlocked is declared... checking for getcwd... yes
checking for putenv... yes
yes
yes
checking whether fprintf_unlocked is declared... checking whether fileno_un=
locked is declared... yes
yes
checking for getpagesize... checking for getpagesize... checking for setenv=
... no
yes
checking whether fputc_unlocked is declared... checking whether fprintf_unl=
ocked is declared... yes
yes
yes
checking for gettimeofday... checking for setlocale... checking for gettime=
ofday... no
yes
checking whether fputs_unlocked is declared... yes
yes
yes
checking whether fputc_unlocked is declared... checking for stpcpy... check=
ing for index... checking for index... yes
yes
checking whether fread_unlocked is declared... yes
rm -f libdecnumber.a
ar cru libdecnumber.a decNumber.o decContext.o decimal32.o decimal64.o deci=
mal128.o=20
yes
ranlib libdecnumber.a
checking for strcasecmp... yes
checking for insque... checking whether fputs_unlocked is declared... check=
ing for insque... yes
yes
yes
checking whether fwrite_unlocked is declared... checking for memchr... chec=
king for memchr... yes
yes
checking whether fread_unlocked is declared... checking for strdup... yes
yes
yes
checking for memcmp... checking whether getchar_unlocked is declared... che=
cking whether fwrite_unlocked is declared... yes
yes
checking for strtoul... checking for memcmp... yes
checking for memcpy... yes
yes
yes
checking whether getc_unlocked is declared... yes
checking whether getchar_unlocked is declared... checking for tsearch... ch=
ecking for memcpy... yes
checking for memmem... yes
checking whether putchar_unlocked is declared... yes
yes
checking whether getc_unlocked is declared... checking for __argz_count... =
yes
checking for memmem... yes
checking for memmove... yes
yes
checking whether putc_unlocked is declared... checking whether putchar_unlo=
cked is declared... yes
checking for __argz_stringify... yes
checking for memmove... yes
checking for mempcpy... yes
checking for an ANSI C-conforming const... yes
checking whether putc_unlocked is declared... yes
yes
checking sys/mman.h usability... checking for __argz_next... yes
checking for mempcpy... yes
checking for memset... yes
checking for an ANSI C-conforming const... yes
checking sys/mman.h presence... yes
yes
checking for sys/mman.h... yes
checking for mmap... checking for __fsetlocking... yes
yes
checking sys/mman.h usability... checking for memset... yes
checking for mkstemps... yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking for iconv... yes
checking sys/mman.h presence... yes
checking for mkstemps... yes
checking for sys/mman.h... yes
checking for mmap... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
yes
checking for putenv... make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR00=
05/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r1=
9/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/libdecnumber'
yes
checking for iconv declaration... yes
checking for putenv... configure: updating cache ../config.cache
yes
configure: creating ./config.status
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
install-shextern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesle=
ft, char * *outbuf, size_t *outbytesleft);
checking for nl_langinfo and CODESET... checking for random... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
yes
checking for random... yes
configure: updating cache ./config.cache
yes
checking for LC_MESSAGES... configure: creating ./config.status
checking for rename... yes
checking for rename... yes
yes
checking for bison... bison
checking version of bison... config.status: creating Makefile
2.7, ok
checking whether NLS is requested... no
checking for rindex... checking whether to use NLS... no
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
config.status: creating mkheaders.almost
config.status: creating config.h
yes
checking for rindex... config.status: creating Makefile
yes
configure: updating cache ./config.cache
config.status: creating mkheaders.almost
configure: creating ./config.status
checking for setenv... config.status: creating config.h
yes
checking for setenv... yes
checking for snprintf... yes
config.status: creating Makefile
checking for snprintf... config.status: creating config.intl
yes
config.status: creating config.h
checking for sigsetmask... config.status: executing default-1 commands
yes
checking for sigsetmask... yes
checking for stpcpy... Configuring in ./gcc
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/intl'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/intl'
yes
yes
checking for stpcpy... checking for stpncpy... yes
checking for stpncpy... yes
checking for strcasecmp... yes
checking for strcasecmp... yes
checking for strchr... yes
checking for strchr... yes
checking for strdup... configure: creating cache ./config.cache
yes
checking for strdup... checking build system type... yes
checking for strncasecmp... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... arm-oecore-linux-gnueabi
yes
checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking for strncasecmp... checking whether to place generated files in th=
e source directory... yes
no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for x86_64-linux-gcc... gcc
checking for strndup... checking for C compiler default output file name...=
 yes
yes
a.out
checking whether the C compiler works... yes
checking for strndup... checking whether we are cross compiling... no
checking for suffix of executables... checking for strrchr...=20
checking for suffix of object files... yes
checking for strstr... yes
o
checking whether we are using the GNU C compiler... checking for strrchr...=
 yes
checking whether gcc accepts -g... yes
checking for strtod... yes
yes
checking for gcc option to accept ISO C89... checking for strstr... none ne=
eded
checking whether gcc and cc understand -c and -o together... yes
checking for strtol... yes
checking for strtod... yes
checking for strtoul... yes
checking for strtol... yes
checking for strverscmp... yes
yes
checking for strtoul... checking whether we are using the GNU C++ compiler.=
.. yes
checking for tmpnam... yes
checking whether g++ accepts -g... yes
yes
checking for x86_64-linux-gnatbind... checking for strverscmp... no
checking for gnatbind... no
checking for x86_64-linux-gnatmake... no
checking for gnatmake... no
checking whether compiler driver understands Ada... no
checking how to run the C preprocessor... gcc -E
yes
checking for vasprintf... checking for grep that handles long lines and -e.=
.. /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for tmpnam... yes
checking for vfprintf... yes
checking for vasprintf... yes
checking for vprintf... yes
yes
checking for vfprintf... checking for sys/types.h... yes
yes
checking for sys/stat.h... checking for vsnprintf... yes
checking for vprintf... yes
checking for stdlib.h... yes
checking for vsprintf... yes
checking for string.h... yes
checking for vsnprintf... yes
yes
checking for memory.h... checking for waitpid... yes
checking for vsprintf... yes
checking for strings.h... yes
checking for setproctitle... yes
yes
checking for waitpid... checking for inttypes.h... yes
checking for stdint.h... no
checking whether alloca needs Cray hooks... no
checking stack direction for C alloca... yes
checking for setproctitle... yes
checking for unistd.h... -1
checking for vfork.h... no
checking for fork... no
checking whether alloca needs Cray hooks... no
checking stack direction for C alloca... yes
checking minix/config.h usability... yes
checking for vfork... -1
checking for vfork.h... no
checking minix/config.h presence... no
no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... checking for fork..=
. yes
checking for working fork... yes
checking how to run the C preprocessor... gcc -E
yes
checking for vfork... checking for inline... inline
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... yes
yes
checking for working vfork... (cached) yes
checking for _doprnt... checking for working fork... no
checking size of void *... no
checking for sys_errlist... yes
checking for working vfork... (cached) yes
checking for _doprnt... 8
checking size of short... yes
checking for sys_nerr... no
checking for sys_errlist... 2
checking size of int... yes
checking for sys_siglist... yes
checking for sys_nerr... yes
checking for external symbol _system_configuration... 4
checking size of long... yes
no
checking for sys_siglist... checking for __fsetlocking... yes
checking for external symbol _system_configuration... yes
8
checking for canonicalize_file_name... checking for long long... no
checking for __fsetlocking... yes
checking for dup3... yes
checking for canonicalize_file_name... yes
checking size of long long... yes
checking for getrlimit... yes
checking for dup3... yes
8
checking for __int64... checking for getrusage... yes
checking for getrlimit... no
checking for int8_t... yes
checking for getsysinfo... yes
checking for getrusage... no
checking for gettimeofday... (cached) yes
yes
checking for getsysinfo... checking for on_exit... yes
checking for int16_t... yes
no
checking for psignal... checking for gettimeofday... (cached) yes
checking for on_exit... yes
yes
checking for int32_t... checking for pstat_getdynamic... yes
checking for psignal... yes
no
checking for pstat_getstatic... checking for pstat_getdynamic... yes
checking for int64_t... no
no
checking for realpath... checking for pstat_getstatic... yes
no
checking for realpath... checking for setrlimit... yes
checking for long long int... yes
yes
checking for sbrk... checking for setrlimit... yes
checking for intmax_t... yes
checking for sbrk... yes
checking for spawnve... yes
no
checking for spawnve... checking for spawnvpe... yes
checking for intptr_t... no
no
checking for spawnvpe... checking for strerror... yes
checking for uint8_t... no
yes
checking for strerror... checking for strsignal... yes
checking for uint16_t... yes
yes
checking for strsignal... checking for sysconf... yes
checking for uint32_t... yes
checking for sysconf... yes
checking for sysctl... yes
checking for uint64_t... yes
yes
checking for sysctl... yes
checking for unsigned long long int... checking for sysmp... yes
checking for sysmp... yes
checking for uintmax_t... no
checking for table... no
no
checking for table... checking for times... yes
checking for uintptr_t... yes
checking for wait3... no
checking for times... yes
yes
checking for wait4... checking for wait3... yes
checking whether gcc supports -W... yes
checking whether gcc supports -Wall... yes
yes
checking for wait4... checking whether basename is declared... yes
checking whether gcc supports -Wnarrowing... yes
checking whether gcc supports -Wwrite-strings... yes
no
checking whether ffs is declared... checking whether basename is declared..=
. yes
checking whether gcc supports -Wcast-qual... yes
checking whether gcc supports -Wstrict-prototypes... no
yes
checking whether ffs is declared... checking whether asprintf is declared..=
. yes
checking whether gcc supports -Wmissing-prototypes... no
checking whether vasprintf is declared... yes
yes
checking whether gcc supports -Wmissing-format-attribute... checking whethe=
r asprintf is declared... yes
checking whether gcc supports -Wold-style-definition... no
checking whether snprintf is declared... no
checking whether vasprintf is declared... yes
checking whether gcc supports -Wc++-compat... yes
checking whether gcc supports -pedantic -Wlong-long -Wvariadic-macros -Wove=
rlength-strings... no
yes
checking whether snprintf is declared... checking whether vsnprintf is decl=
ared... yes
checking whether gcc supports -fno-exceptions... yes
checking whether gcc supports -fno-rtti... yes
yes
checking whether vsnprintf is declared... checking whether calloc is declar=
ed... yes
checking valgrind.h usability... yes
checking whether calloc is declared... yes
checking whether getenv is declared... no
checking valgrind.h presence... yes
no
checking for valgrind.h... no
checking whether getenv is declared... checking whether make sets $(MAKE)..=
. yes
yes
checking for gawk... gawk
checking whether ln -s works... checking whether getopt is declared... yes
checking whether ln works... yes
checking for x86_64-linux-ranlib... ranlib
checking for a BSD compatible install... /usr/bin/install -c
checking for cmp's capabilities... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo
checking for modern makeinfo... yes
checking for recent Pod::Man... yes
checking whether getopt is declared... yes
checking whether malloc is declared... yes
yes
yes
checking for flex... flex
checking for bison... bison
checking for nm... nm
checking for ar... ar
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... checking whe=
ther malloc is declared... checking whether realloc is declared... yes
checking whether string.h and strings.h may both be included... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
yes
checking whether sbrk is declared... checking whether realloc is declared..=
. yes
checking for limits.h... yes
checking for stddef.h... yes
checking whether sbrk is declared... yes
checking for string.h... (cached) yes
yes
checking for strings.h... (cached) yes
checking whether strverscmp is declared... checking for stdlib.h... (cached=
) yes
checking for time.h... yes
checking for iconv.h... yes
yes
checking whether strverscmp is declared... checking for fcntl.h... no
checking whether canonicalize_file_name must be declared... yes
checking for unistd.h... (cached) yes
checking for sys/file.h... no
yes
checking whether canonicalize_file_name must be declared... checking for sy=
s/time.h... yes
yes
checking for stdlib.h... (cached) yes
checking for sys/mman.h... yes
checking for unistd.h... (cached) yes
yes
checking for getpagesize... checking for stdlib.h... (cached) (cached) yes
yes
checking for working mmap... checking for sys/resource.h... checking for un=
istd.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... yes
checking for sys/param.h... yes
checking for sys/times.h... yes
checking for working strncmp... yes
checking for sys/stat.h... (cached) yes
checking for direct.h... yes
checking for working strncmp... no
checking for malloc.h... yes
checking for langinfo.h... yes
yes
checking for ldfcn.h... yes
no
checking for locale.h... yes
configure: updating cache ../config.cache
configure: creating ./config.status
checking for wchar.h... configure: updating cache ./config.cache
configure: creating ./config.status
yes
checking for thread.h... no
checking for pthread.h... yes
checking for CHAR_BIT... yes
checking whether byte ordering is bigendian... config.status: creating Make=
file
config.status: creating Makefile
config.status: creating testsuite/Makefile
config.status: creating testsuite/Makefile
config.status: creating config.h
config.status: executing default commands
config.status: creating config.h
no
checking how to run the C++ preprocessor... config.status: executing defaul=
t commands
g++ -E
checking for unordered_map... make[1]: Entering directory `/mnt/SSD/oe-r000=
5/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/=
4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/build-x86_6=
4-linux/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
  mkdir pic; \
else true; fi
mkdir -p -- ./libcpp
touch stamp-picdir
Configuring in ./libcpp
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/regex.c -o regex.o
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
  mkdir pic; \
else true; fi
touch stamp-picdir
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
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/libiberty/testsuite'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/libiberty/testsuite'
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/md5.c -o md5.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sha1.c -o pic/sha1.o; \
else true; fi
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sha1.c -o sha1.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/safe-ctype.c -o safe-ctype.=
o
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
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c: In function 'md5_finish_ctx':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:117:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
   *(md5_uint32 *) &ctx->buffer[bytes + pad] =3D SWAP (ctx->total[0] << 3);
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:118:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
   *(md5_uint32 *) &ctx->buffer[bytes + pad + 4] =3D SWAP ((ctx->total[1] <=
< 3) |
   ^
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
if [ x"" !=3D x ]; then \
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
no
checking for tr1/unordered_map... if [ x"" !=3D x ]; then \
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
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strsignal.c -o pic/strsi=
gnal.o; \
else true; fi
if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strsignal.c -o strsignal.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/argv.c -o argv.o
configure: creating cache ./config.cache
yes
checking for ext/hash_map... checking build system type... x86_64-pc-linux-=
gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... arm-oecore-linux-gnueabi
checking whether make sets $(MAKE)... yes
checking for a BSD-compatible install... /usr/bin/install -c
checking for x86_64-linux-gcc... gcc
if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/unlink-if-ordinary.c -o unl=
ink-if-ordinary.o
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
if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemdup.c -o xmemdup.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/concat.c -o pic/concat.o=
; \
else true; fi
checking for C compiler default output file name... if [ x"" !=3D x ]; then=
 \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/concat.c -o concat.o
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demint.c -o pic/cp-de=
mint.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/cp-demint.c -o cp-demint.o
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
a.out
checking whether the C compiler works... yes
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
checking whether we are cross compiling... no
checking for suffix of executables... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o pic/dyn-=
string.o; \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o dyn-string.=
o
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/setproctitle.c -o setprocti=
tle.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fdmatch.c -o fdmatch.o
if [ x"" !=3D x ]; then \
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/filename_cmp.c -o pic/fi=
lename_cmp.o; \
else true; fi
checking for suffix of object files... gcc -c -DHAVE_CONFIG_H -isystem/mnt/=
SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. =
-I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibe=
rty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -=
pedantic  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/libiberty/filename_cmp.c -o filename_cmp.o
o
checking whether we are using the GNU C compiler... if [ x"" !=3D x ]; then=
 \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/floatformat.c -o pic/flo=
atformat.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/floatformat.c -o floatforma=
t.o
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fnmatch.c -o fnmatch.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fopen_unlocked.c -o pic/=
fopen_unlocked.o; \
else true; fi
yes
checking whether gcc accepts -g... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/=
oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/=
../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -peda=
ntic  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/li=
biberty/fopen_unlocked.c -o fopen_unlocked.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt.c -o pic/getopt.o=
; \
else true; fi
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt.c -o getopt.o
yes
checking for collect2 libraries... (cached) none required
checking for library containing exc_resume... gcc -c -DHAVE_CONFIG_H -isyst=
em/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pip=
e  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-proto=
types -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/libiberty/getopt1.c -o getopt1.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o pic/getpwd.o=
; \
else true; fi
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o getpwd.o
yes
checking for gcc option to accept ISO C89... gcc -c -DHAVE_CONFIG_H -isyste=
m/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe=
  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-protot=
ypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/libiberty/getruntime.c -o getruntime.o
if [ x"" !=3D x ]; then \
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
if [ x"" !=3D x ]; then \
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
none needed
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
checking for library containing kstat_open... if [ x"" !=3D x ]; then \
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
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... if [ x"" !=3D x ]; then \
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
yes
checking for x86_64-linux-ranlib... ranlib
checking how to run the C preprocessor... gcc -E
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
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libiberty/md5.c: In function 'md5_finish_ctx':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:117:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
   *(md5_uint32 *) &ctx->buffer[bytes + pad] =3D SWAP (ctx->total[0] << 3);
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libibert=
y/md5.c:118:3: warning: dereferencing type-punned pointer will break strict=
-aliasing rules [-Wstrict-aliasing]
   *(md5_uint32 *) &ctx->buffer[bytes + pad + 4] =3D SWAP ((ctx->total[1] <=
< 3) |
   ^
no
checking for library containing ldexp... if [ x"" !=3D x ]; then \
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
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o pic/=
make-temp-file.o; \
else true; fi
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
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o make-te=
mp-file.o
none required
checking for inttypes.h... yes
checking for times... if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o objalloc.o
if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/obstack.c -o obstack.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/partition.c -o pic/parti=
tion.o; \
else true; fi
yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/partition.c -o partition.o
yes
checking for clock... checking for sys/types.h... if [ x"" !=3D x ]; then \
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/choose-temp.c -o pic/cho=
ose-temp.o; \
else true; fi
if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/choose-temp.c -o choose-tem=
p.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/concat.c -o concat.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/physmem.c -o pic/physmem=
.o; \
else true; fi
if [ x"" !=3D x ]; then \
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
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/physmem.c -o physmem.o
checking for sys/stat.h... checking for kill... yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-common.c -o pic/pex-=
common.o; \
else true; fi
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o pic/dyn-=
string.o; \
else true; fi
yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/dyn-string.c -o dyn-string.=
o
checking for getrlimit... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fdmatch.c -o pic/fdmatch=
.o; \
else true; fi
checking for stdlib.h... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/c=
coR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-=
r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include=
  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/fd=
match.c -o fdmatch.o
if [ x"" !=3D x ]; then \
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
yes
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/filename_cmp.c -o pic/fi=
lename_cmp.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/filename_cmp.c -o filename_=
cmp.o
checking for setrlimit... checking for string.h... if [ x"" !=3D x ]; then =
\
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pic/pex-un=
ix.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pex-unix.o
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
yes
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
checking for atoll... checking for memory.h... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt1.c -o pic/getopt1=
.o; \
else true; fi
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getopt1.c -o getopt1.o
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
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/getpwd.c -o getpwd.o
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hashtab.c -o pic/hashtab=
.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hashtab.c -o hashtab.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hex.c -o pic/hex.o; \
else true; fi
yes
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/hex.c -o hex.o
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lbasename.c -o pic/lbase=
name.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/lrealpath.c -o pic/lreal=
path.o; \
else true; fi
checking for strings.h... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/=
ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /mn=
t/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/l=
basename.c -o lbasename.o
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-coff.c -o =
pic/simple-object-coff.o; \
else true; fi
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/simple-object-coff.c -o sim=
ple-object-coff.o
checking for atoq... if [ x"" !=3D x ]; then \
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
yes
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/sort.c -o pic/sort.o; \
else true; fi
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
checking for inttypes.h... gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005=
/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/o=
e-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../inclu=
de  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/=
sort.c -o sort.o
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/spaces.c -o pic/spaces.o=
; \
else true; fi
no
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o pic/=
make-temp-file.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/splay-tree.c -o pic/spla=
y-tree.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o pic/objall=
oc.o; \
else true; fi
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/splay-tree.c -o splay-tree.=
o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/make-temp-file.c -o make-te=
mp-file.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/objalloc.c -o objalloc.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/stack-limit.c -o stack-limi=
t.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/spaces.c -o spaces.o
checking for sysconf... if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/obstack.c -o obstack.o
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
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pexecute.c -o pic/pexecu=
te.o; \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pexecute.c -o pexecute.o
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
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-one.c -o pic/pex-one=
.o; \
else true; fi
yes
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
checking for strsignal... if [ x"" !=3D x ]; then \
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
if [ x"" !=3D x ]; then \
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
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/pex-unix.c -o pex-unix.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/strsignal.c -o strsignal.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/timeval-utils.c -o timeval-=
utils.o
checking for stdint.h... if [ x"" !=3D x ]; then \
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
yes
if [ x"" !=3D x ]; then \
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
checking for getrusage... if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemdup.c -o pic/xmemdup=
.o; \
else true; fi
rm -f ./libiberty.a pic/./libiberty.a
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrdup.c -o pic/xstrdup=
.o; \
else true; fi
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
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrerror.c -o pic/xstre=
rror.o; \
else true; fi
if [ x"" !=3D x ]; then \
  gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrndup.c -o pic/xstrnd=
up.o; \
else true; fi
ranlib ./libiberty.a
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xmemdup.c -o xmemdup.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrdup.c -o xstrdup.o
yes
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
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrerror.c -o xstrerror.o
gcc -c -DHAVE_CONFIG_H -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe  -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-s=
hared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libiberty/xstrndup.c -o xstrndup.o
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/libiberty'
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
checking for unistd.h... yes
checking for nl_langinfo... rm -f ./libiberty.a pic/./libiberty.a
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
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/libiberty'
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixfixes.c
yes
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/server.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/procopen.c
yes
checking minix/config.h usability... make[1]: Entering directory `/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-i=
nitial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/buil=
d-x86_64-linux/fixincludes'
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixincl.c
checking for gettimeofday... gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_=
H -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
fixincludes -I../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4=
.7.2-r19/gcc-4.7.2/fixincludes/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/fixlib.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixopts.c
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
srcdir=3D"/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/fixincludes" /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/fixincludes/mkfixinc.sh arm-oecore-linux-gnueabi
yes
sed -e 's/@gcc_version@/4.7.2/' < mkheaders.almost > mkheadersT
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/server.c
checking for mbstowcs... mv -f mkheadersT mkheaders
no
checking minix/config.h presence... gcc -c -isystem/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -W -Wall -Wwrite-strings=
 -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-=
format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_=
CONFIG_H -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/fixincludes -I../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/../include /mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/procopen.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixlib.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-str=
ings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/mnt/SSD/oe-r0005/cco=
R0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes -I../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixinclude=
s/../include /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/fixincludes/fixopts.c
yes
no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... gcc -isystem/mnt/SS=
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -L/mnt/=
SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0005=
/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/c=
coR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005=
/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/=
tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o fixincl fixincl.o fixtests.o fixfi=
xes.o server.o procopen.o fixlib.o fixopts.o ../libiberty/libiberty.a
checking for wcswidth... srcdir=3D"/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shar=
ed/gcc-4.7.2-r19/gcc-4.7.2/fixincludes" /bin/sh /mnt/SSD/oe-r0005/ccoR0005/=
tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/fixincludes/mkfixinc.sh arm-oecore-=
linux-gnueabi
sed -e 's/@gcc_version@/4.7.2/' < mkheaders.almost > mkheadersT
mv -f mkheadersT mkheaders
echo timestamp > full-stamp
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/fixincludes'
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
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... yes
checking for mmap... echo timestamp > full-stamp
no
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/build-x86_64-linux/fixincludes'
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking whether gcc supports -W... yes
checking whether gcc supports -Wall... yes
checking for setlocale... yes
checking whether gcc supports -Wnarrowing... yes
yes
checking whether gcc supports -Wwrite-strings... checking for clearerr_unlo=
cked... yes
checking whether gcc supports -Wmissing-format-attribute... yes
checking for feof_unlocked... yes
checking whether gcc supports -Wstrict-prototypes... yes
yes
checking for ferror_unlocked... checking whether gcc supports -Wmissing-pro=
totypes... yes
checking whether gcc supports -Wold-style-definition... yes
checking for fflush_unlocked... yes
checking whether gcc supports -Wc++-compat... yes
checking for fgetc_unlocked... yes
checking whether gcc supports -pedantic -Wlong-long... yes
checking whether gcc supports -fno-exceptions... yes
checking for fgets_unlocked... yes
checking whether gcc supports -fno-rtti... yes
yes
checking for fileno_unlocked... checking dependency style of gcc... yes
checking for fprintf_unlocked... gcc3
checking whether time.h and sys/time.h may both be included... no
checking for fputc_unlocked... yes
checking whether string.h and strings.h may both be included... yes
checking locale.h usability... yes
checking for fputs_unlocked... yes
checking locale.h presence... yes
checking for locale.h... yes
checking fcntl.h usability... yes
checking for fread_unlocked... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking limits.h usability... yes
checking for fwrite_unlocked... yes
checking limits.h presence... yes
checking for limits.h... yes
checking stddef.h usability... yes
checking for getchar_unlocked... yes
checking stddef.h presence... yes
checking for stddef.h... yes
yes
checking for getc_unlocked... checking for stdlib.h... (cached) yes
checking for strings.h... (cached) yes
checking for string.h... (cached) yes
checking sys/file.h usability... yes
checking for putchar_unlocked... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking for unistd.h... (cached) yes
yes
checking for putc_unlocked... checking whether byte ordering is bigendian..=
. yes
checking for madvise... no
checking for an ANSI C-conforming const... yes
yes
checking for inline... checking whether mbstowcs works... inline
checking for obstacks... yes
checking for ssize_t... yes
checking for off_t... yes
checking for caddr_t... yes
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
yes
checking for size_t... checking whether read-only mmap of a plain file work=
s... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking for pid_t... yes
checking for ssize_t... yes
checking for vfork.h... no
checking for fork... yes
yes
checking for uintptr_t... checking for vfork... yes
checking for working fork... yes
checking for ptrdiff_t... yes
checking for working vfork... (cached) yes
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... done
yes
checking whether struct tm is in sys/time.h or time.h... checking for iconv=
... time.h
checking size of int... yes
checking for iconv declaration... 4
checking size of long... install-shextern size_t iconv (iconv_t cd, char * =
*inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for LC_MESSAGES... yes
checking for nl_langinfo and CODESET... 8
yes
checking whether getenv is declared... checking for clearerr_unlocked... ye=
s
yes
checking whether atol is declared... checking for feof_unlocked... yes
checking for ferror_unlocked... yes
checking whether asprintf is declared... yes
checking for fflush_unlocked... yes
checking for fgetc_unlocked... yes
checking whether sbrk is declared... yes
yes
checking for fgets_unlocked... checking whether abort is declared... yes
checking for fileno_unlocked... yes
checking whether atof is declared... yes
checking for fprintf_unlocked... yes
checking whether getcwd is declared... no
checking for fputc_unlocked... yes
checking whether getwd is declared... yes
checking for fputs_unlocked... yes
checking whether strsignal is declared... yes
checking for fread_unlocked... yes
checking whether strstr is declared... yes
checking for fwrite_unlocked... yes
yes
checking for getchar_unlocked... checking whether stpcpy is declared... yes
yes
checking whether strverscmp is declared... checking for getc_unlocked... ye=
s
yes
checking whether errno is declared... checking for putchar_unlocked... yes
checking whether snprintf is declared... yes
checking for putc_unlocked... yes
checking whether vsnprintf is declared... yes
checking whether abort is declared... yes
checking whether vasprintf is declared... yes
checking whether asprintf is declared... yes
checking whether basename is declared... yes
checking whether malloc is declared... yes
checking whether errno is declared... yes
checking whether realloc is declared... no
checking whether getopt is declared... yes
checking whether calloc is declared... yes
checking whether vasprintf is declared... yes
checking whether free is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether basename is declared... yes
yes
checking whether feof_unlocked is declared... checking whether getopt is de=
clared... yes
checking whether ferror_unlocked is declared... no
checking whether clock is declared... yes
checking whether fflush_unlocked is declared... yes
checking whether getpagesize is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
yes
checking whether fileno_unlocked is declared... checking whether feof_unloc=
ked is declared... yes
checking whether fprintf_unlocked is declared... yes
checking whether ferror_unlocked is declared... no
checking whether fputc_unlocked is declared... yes
checking whether fputs_unlocked is declared... yes
checking whether fflush_unlocked is declared... yes
checking whether fread_unlocked is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
checking whether getchar_unlocked is declared... yes
yes
checking whether getc_unlocked is declared... checking whether fileno_unloc=
ked is declared... yes
yes
checking whether fprintf_unlocked is declared... checking whether putchar_u=
nlocked is declared... yes
checking whether putc_unlocked is declared... no
checking whether fputc_unlocked is declared... yes
checking for working alloca.h... yes
checking whether fputs_unlocked is declared... yes
checking for alloca... yes
checking whether fread_unlocked is declared... yes
checking for ANSI C header files... (cached) yes
checking for nl_langinfo and CODESET... yes
checking whether NLS is requested... no
checking for uchar...=20
checking for ld used by GCC... yes
ld
checking if the linker (ld) is GNU ld... checking whether fwrite_unlocked i=
s declared... yes
checking for shared library run path origin... done
checking for iconv... yes
checking whether getchar_unlocked is declared... yes
checking for iconv declaration... yes
install-shextern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesle=
ft, char * *outbuf, size_t *outbytesleft);
checking whether getc_unlocked is declared... configure: updating cache ./c=
onfig.cache
configure: creating ./config.status
yes
checking whether putchar_unlocked is declared... yes
checking whether putc_unlocked is declared... config.status: creating Makef=
ile
yes
checking whether getrlimit is declared... config.status: creating config.h
config.status: executing depdir commands
mkdir -p -- .deps
yes
checking whether setrlimit is declared... make[1]: Entering directory `/mnt=
/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cr=
oss-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi=
/libcpp'
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
checking whether getrusage is declared... echo "#define LOCALEDIR \"/mnt/SS=
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/share/locale\"" > localed=
ir.new
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/.=
./move-if-change localedir.new localedir.h
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
yes
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
checking whether ldgetname is declared... no
checking whether times is declared... gcc  -I/mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/oe-r=
0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -isys=
tem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pi=
pe -W -Wall -Wno-narrowing -Wwrite-strings -Wmissing-format-attribute -Wstr=
ict-prototypes -Wmissing-prototypes -Wold-style-definition -Wc++-compat -pe=
dantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -c -o mkdeps.o -MT mkdeps=
.o -MMD -MP -MF .deps/mkdeps.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/libcpp/mkdeps.c
yes
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
checking whether sigaltstack is declared... gcc  -I/mnt/SSD/oe-r0005/ccoR00=
05/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/c=
coR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SS=
D/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include =
 -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -=
O2 -pipe -W -Wall -Wno-narrowing -Wwrite-strings -Wmissing-format-attribute=
 -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wc++-comp=
at -pedantic -Wno-long-long  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/libcpp -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libcpp/../include -I/mnt/SSD/oe-r0005/ccoR0005/=
tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/include  -c -o symtab.o -MT =
symtab.o -MMD -MP -MF .deps/symtab.Tpo /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/symtab.c
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
yes
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
pp/include  -c -o init.o -MT init.o -MMD -MP -MF .deps/init.Tpo /mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libcpp/init.c
checking whether madvise is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for F_SETLKW... yes
checking if mkdir takes one argument... no
rm -f libcpp.a
ar cru libcpp.a charset.o directives.o directives-only.o errors.o expr.o fi=
les.o identifiers.o init.o lex.o line-map.o macro.o mkdeps.o pch.o symtab.o=
 traditional.o
ranlib libcpp.a
For  real value is=20
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/libcpp'
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
lsf=3D""; for f in $lsf; do \
    echo "#include \"$f\""; \
done | sed 's|/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/||' > tmp-specs.h
echo "#define BUILDING_GCC_PATCHLEVEL `echo 4.7.2 | sed -e 's/^[0-9]*\.[0-9=
]*\.\([0-9]*\)$/\1/'`" >> bversion.h
echo 'END_OF_BASE_TREE_CODES' >> tmp-all-tree.def
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-specs.h specs.h
echo '#include "c-family/c-common.def"' >> tmp-all-tree.def
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
echo "#define BUILDING_GCC_VERSION (BUILDING_GCC_MAJOR * 1000 + BUILDING_GC=
C_MINOR)" >> bversion.h
echo timestamp > s-specs
ltf=3D"/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/ada/gcc-interface/ada-tree.def /mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/gcc/cp/cp-tree.def /mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/java/java-tree.def /mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/objc/objc-tree.def"=
; for f in $ltf; do \
  echo "#include \"$f\""; \
done | sed 's|/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/||' >> tmp-all-tree.def
echo timestamp > s-bversion
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
echo timestamp > doc/gpl.7
perl /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../contrib/texi2pod.pl /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/doc/invoke.texi > gcc.pod
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
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-optionlist optionlist
echo timestamp > s-options
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genconst=
ants \
    build/genconstants.o build/read-md.o build/errors.o ../build-x86_64-lin=
ux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genmddep=
s \
    build/genmddeps.o build/read-md.o build/errors.o ../build-x86_64-linux/=
libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genmodes=
 \
    build/genmodes.o build/errors.o ../build-x86_64-linux/libiberty/libiber=
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/gengenrt=
l \
    build/gengenrtl.o build/errors.o ../build-x86_64-linux/libiberty/libibe=
rty.a
build/genhooks "Target Hook" \
				     > tmp-target-hooks-def.h
build/genhooks "C Target Hook" \
				     > tmp-c-target-hooks-def.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-target-hooks-def.h \
				     target-hooks-def.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-c-target-hooks-def.h \
				     c-family/c-target-hooks-def.h
echo timestamp > s-target-hooks-def-h
gawk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/opt-functions.awk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/opt-read.awk \
       -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/optc-save-gen.awk \
       -v header_name=3D"config.h system.h coretypes.h tm.h" < optionlist >=
 options-save.c
build/genhooks "Common Target Hook" \
				     > tmp-common-target-hooks-def.h
gawk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/opt-functions.awk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/opt-read.awk \
       -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/optc-gen.awk \
       -v header_name=3D"config.h system.h coretypes.h tm.h" < optionlist >=
 options.c
echo timestamp > s-c-target-hooks-def-h
build/genhooks -d \
		/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/do=
c/tm.texi.in > tmp-tm.texi
echo timestamp > doc/gcc.1
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-common-target-hooks-def.h \
				     common/common-target-hooks-def.h
(pod2man --center=3D"GNU" --release=3D"gcc-4.7.2" --date=3D2012-09-20 --sec=
tion=3D1 gcc.pod > doc/gcc.1.T$$ && \
	mv -f doc/gcc.1.T$$ doc/gcc.1) || \
	(rm -f doc/gcc.1.T$$ && exit 1)
echo timestamp > s-common-target-hooks-def-h
gawk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/opt-functions.awk -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/opt-read.awk \
       -f /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/opth-gen.awk \
       < optionlist > tmp-options.h
case `echo X|tr X '\101'` in \
  A) tr -d '\015' < tmp-tm.texi > tmp2-tm.texi ;; \
  *) tr -d '\r' < tmp-tm.texi > tmp2-tm.texi ;; \
esac
mv tmp2-tm.texi tmp-tm.texi
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-tm.texi tm.texi
build/genmddeps /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/config/arm/arm.md > tmp-mddeps
build/genmodes -h > tmp-modes.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-mddeps mddeps.mk
echo timestamp > s-mddeps
build/gengenrtl > tmp-genrtl.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-modes.h insn-modes.h
build/genmodes -m > tmp-min-modes.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-genrtl.h genrtl.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-min-modes.c min-insn-modes.c
echo timestamp > s-genrtl-h
echo timestamp > s-modes-h
echo timestamp > s-modes-m
build/genmodes > tmp-modes.c
build/genenums /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/config/arm/arm.md \
   > tmp-enums.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-modes.c insn-modes.c
echo timestamp > s-modes
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-enums.c insn-enums.c
build/genconstants /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/config/arm/arm.md \
   > tmp-constants.h
warning: multiple different help strings for I:
	-I <dir>.	Add <dir> to the end of the main source path
	-I <dir>	Add <dir> to the end of the main include path
warning: multiple different help strings for nostdinc:
	Do not look for source files in standard path
	Do not search standard system include directories (those specified with -i=
system will still be used)
echo timestamp > s-enums
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-constants.h insn-constants.h
echo timestamp > s-constants
if [ xinfo =3D xinfo ]; then \
	makeinfo --split-size=3D5000000 --no-split -I . -I /mnt/SSD/oe-r0005/ccoR0=
005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/doc \
		-I /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/doc/include -o doc/gccint.info /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/gcc/doc/gccint.texi; \
fi
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
	-o build/min-insn-modes.o min-insn-modes.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-options.h options.h
echo timestamp > s-options-h
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
	-o build/genflags.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/genflags.c
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
	-o build/read-rtl.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/read-rtl.c
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
	-o build/gensupport.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/gcc/gensupport.c
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
	-o build/print-rtl.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/print-rtl.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold=
-style-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild=
 -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -=
I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/bui=
ld -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnum=
ber    \
	-o build/genconditions.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/genconditions.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold=
-style-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild=
 -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -=
I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/bui=
ld -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnum=
ber    \
	-o build/genpreds.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/genpreds.c
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold=
-style-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild=
 -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -=
I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/bui=
ld -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnum=
ber    \
	-o build/gencheck.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/gencheck.c
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
	-o build/genattr.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/gcc/genattr.c
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
	-o build/genattr-common.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4=
.7.2-r19/gcc-4.7.2/gcc/genattr-common.c
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
	-o build/gencodes.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/gencodes.c
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
	-o build/genconfig.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/genconfig.c
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
	-o build/genautomata.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/genautomata.c
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
	-o build/genemit.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/gcc/genemit.c
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
	-o build/genextract.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/gcc/genextract.c
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
	-o build/genopinit.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/genopinit.c
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
	-o build/genoutput.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/genoutput.c
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
	-o build/genpeep.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/gcc/genpeep.c
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
	-o build/genrecog.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/genrecog.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-wrapper.c -o lto-wrapper.o
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/gengtype=
 \
    build/gengtype.o build/errors.o build/gengtype-lex.o build/gengtype-par=
se.o build/gengtype-state.o build/version.o ../build-x86_64-linux/libiberty=
/libiberty.a
gcc -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing -W=
write-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -L/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR0005=
/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/lib -Wl,-O1 -o build/gencheck \
    build/gencheck.o ../build-x86_64-linux/libiberty/libiberty.a
build/gengtype  \
                    -S /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/gcc -I gtyp-input.list -w tmp-gtype.state
build/gencheck > tmp-check.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-check.h tree-check.h
echo timestamp > s-check
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-gtype.state gtype.state
build/gengtype  \
                    -r gtype.state
echo timestamp > s-gtype
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
	-o build/genattrtab.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/gcc/genattrtab.c
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
	-o build/rtl.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/rtl.c
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
	-o build/ggc-none.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/ggc-none.c
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
	-o build/vec.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/vec.c
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genflags=
 \
    build/genflags.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-=
md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing -W=
write-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -L/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR0005=
/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/lib -Wl,-O1 -o build/genconditions \
    build/genconditions.o build/rtl.o build/read-rtl.o build/ggc-none.o bui=
ld/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/=
read-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing -W=
write-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -L/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR0005=
/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/=
sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/lib -Wl,-O1 -o build/genpreds \
    build/genpreds.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-=
md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genattr =
\
    build/genattr.o build/rtl.o build/read-rtl.o build/ggc-none.o build/vec=
.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-m=
d.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genattr-=
common \
    build/genattr-common.o build/rtl.o build/read-rtl.o build/ggc-none.o bu=
ild/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build=
/read-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/gencodes=
 \
    build/gencodes.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-=
md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genconfi=
g \
    build/genconfig.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read=
-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genemit =
\
    build/genemit.o build/rtl.o build/read-rtl.o build/ggc-none.o build/vec=
.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-m=
d.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genextra=
ct \
    build/genextract.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/rea=
d-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genopini=
t \
    build/genopinit.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read=
-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genoutpu=
t \
    build/genoutput.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read=
-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genpeep =
\
    build/genpeep.o build/rtl.o build/read-rtl.o build/ggc-none.o build/vec=
.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-m=
d.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
build/genpreds /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/config/arm/arm.md > tmp-preds.c
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genrecog=
 \
    build/genrecog.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/read-=
md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
build/genconditions /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/gcc/config/arm/arm.md > tmp-condmd.c
build/genpreds -h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/=
gcc-4.7.2/gcc/config/arm/arm.md > tmp-preds.h
build/genpreds -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/=
gcc-4.7.2/gcc/config/arm/arm.md > tmp-constrs.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-preds.c insn-preds.c
echo timestamp > s-preds
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-condmd.c build/gencondmd.c
echo timestamp > s-conditions
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-preds.h tm-preds.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-constrs.h tm-constrs.h
echo timestamp > s-preds-h
echo timestamp > s-constrs-h
gcc -c -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold=
-style-definition -Wc++-compat -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild=
 -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -=
I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/bui=
ld -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnum=
ber    \
	-o build/gencondmd.o build/gencondmd.c
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from build/gencondmd.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/gencondm=
d \
    build/gencondmd.o ../build-x86_64-linux/libiberty/libiberty.a
build/gencondmd > tmp-cond.md
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-cond.md insn-conditions.md
echo timestamp > s-condmd
build/genflags /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-flags.h
build/genattr /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-attr.h
build/genattr-common /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-attr-common.h
build/gencodes /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-codes.h
build/genconfig /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-config.h
build/genemit /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-emit.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-attr.h insn-attr.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-codes.h insn-codes.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-flags.h insn-flags.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-attr-common.h insn-attr-common.h
echo timestamp > s-flags
echo timestamp > s-attr
echo timestamp > s-attr-common
echo timestamp > s-codes
build/genextract /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-extract.c
build/genopinit /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-opinit.c
build/genoutput /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-output.c
build/genpeep /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-=
4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-peep.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-emit.c insn-emit.c
echo timestamp > s-emit
build/genrecog /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-recog.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-config.h insn-config.h
echo timestamp > s-config
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
	-o build/gcov-iov.o /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/gcov-iov.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-extract.c insn-extract.c
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-peep.c insn-peep.c
echo timestamp > s-extract
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-opinit.c insn-opinit.c
echo timestamp > s-peep
echo timestamp > s-opinit
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 \
	build/gcov-iov.o -o build/gcov-iov
build/gcov-iov '4.7.2' '' \
    > tmp-gcov-iov.h
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-gcov-iov.h gcov-iov.h
echo timestamp > s-iov
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-lang.c -o c-lang.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/stub-objc.c -o c-family/stub-objc.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/attribs.c -o attribs.o
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-recog.c insn-recog.c
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-errors.c -o c-errors.o
echo timestamp > s-recog
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-decl.c -o c-decl.o
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-output.c insn-output.c
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/stub-objc.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
echo timestamp > s-output
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-typeck.c -o c-typeck.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-convert.c -o c-convert.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-lang.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-errors.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/attribs.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-decl.c:35:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-aux-info.c -o c-aux-info.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-objc-common.c -o c-objc-common.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/c-parser.c -o c-parser.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-typeck.c:32:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-convert.c:31:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/tree-mudflap.c -o tree-mudflap.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-aux-info.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-objc-common.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-parser.c:44:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-common.c -o c-family/c-common.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-mudflap.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-cppbuiltin.c -o c-family/c-cppbuiltin.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-dump.c -o c-family/c-dump.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-common.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-format.c -o c-family/c-format.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-cppbuiltin.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-dump.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-gimplify.c -o c-family/c-gimplify.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-format.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-gimplify.c:31:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-lex.c -o c-family/c-lex.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-omp.c -o c-family/c-omp.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-lex.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -DTARGET_SYSTEM_ROOT=3D\"/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/beaglebone\" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/x86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  =
-W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wm=
issing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I=
. -Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tm=
p/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd=
 -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-opts.c -o c-family/c-opts.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-omp.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-opts.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -DHOST_MACHINE=3D\"x86_64-pc-linux-gnu\" -DTARGET=
_MACHINE=3D\"arm-oecore-linux-gnueabi\" -isystem/mnt/SSD/oe-r0005/ccoR0005/=
tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_=
STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-pro=
totypes -Wmissing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_=
CONFIG_H -I. -Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/g=
cc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libde=
cnumber/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/c-family/c-pch.c -o c-family/c-pch.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-ppoutput.c -o c-family/c-ppoutput.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-pragma.c -o c-family/c-pragma.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-pch.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-ppoutput.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-pragma.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-pretty-print.c -o c-family/c-pretty-print.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-semantics.c -o c-family/c-semantics.o
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes  -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -=
Ic-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/c-family -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/c-family/c-ada-spec.c -o c-family/c-ada-spec.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-pretty-print.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-semantics.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-ada-spec.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-share=
d/gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/=
mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../li=
bdecnumber/dpd -I../libdecnumber   \
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/arm-c.c
gcc -c  -DIN_GCC_FRONTEND -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x=
86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W =
-Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmiss=
ing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-var=
iadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   =
-DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR000=
5/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber=
/dpd -I../libdecnumber    \
  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/co=
nfig/default-c.c -o default-c.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/config/arm/arm-c.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/main.c -o main.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/c-family/c-target-def.h:20:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/config/default-c.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genattrt=
ab \
    build/genattrtab.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/rea=
d-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a
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
D/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o build/genautom=
ata \
    build/genautomata.o build/rtl.o build/read-rtl.o build/ggc-none.o build=
/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/re=
ad-md.o build/errors.o ../build-x86_64-linux/libiberty/libiberty.a -lm
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-emit.c -o insn-emit.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-extract.c -o insn-extract.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-modes.c -o insn-modes.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-opinit.c -o insn-opinit.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from insn-emit.c:10:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from insn-opinit.c:13:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-peep.c -o insn-peep.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from insn-peep.c:15:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-preds.c -o insn-preds.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-enums.c -o insn-enums.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ggc-page.c -o ggc-page.o
In file included from insn-preds.c:9:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/alias.c -o alias.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ggc-page.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/alias.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/alloc-pool.c -o alloc-pool.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/auto-inc-dec.c -o auto-inc-dec.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/bb-reorder.c -o bb-reorder.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/auto-inc-dec.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/bitmap.c -o bitmap.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfglayout.h:23,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/bb-reorder.c:77:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/bt-load.c -o bt-load.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/builtins.c -o builtins.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/bt-load.c:31:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/builtins.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/caller-save.c -o caller-save.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/caller-save.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/calls.c -o calls.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfg.c -o cfg.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/calls.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfg.c:52:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfganal.c -o cfganal.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgbuild.c -o cfgbuild.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfganal.c:30:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgbuild.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgcleanup.c -o cfgcleanup.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgexpand.c -o cfgexpand.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfghooks.c -o cfghooks.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfglayout.h:23,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgcleanup.c:51:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgexpand.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfghooks.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfglayout.c -o cfglayout.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfglayout.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgloop.c -o cfgloop.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgloopanal.c -o cfgloopanal.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgloop.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgloopanal.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgloopmanip.c -o cfgloopmanip.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cfgrtl.c -o cfgrtl.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgloopmanip.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgrtl.c:46:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cgraph.c -o cgraph.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cgraph.c:79:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cgraphbuild.c -o cgraphbuild.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cgraphbuild.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cgraphunit.c -o cgraphunit.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cgraphunit.c:113:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/combine.c -o combine.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/combine-stack-adj.c -o combine-stack-adj.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/compare-elim.c -o compare-elim.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/combine.c:83:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/combine-stack-adj.c:55:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/compare-elim.c:67:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/convert.c -o convert.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/coverage.c -o coverage.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/convert.c:30:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DGCC_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_6=
4-linux/usr/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/=
arm-oecore-linux-gnueabi/4.7.2/include\" -DFIXED_INCLUDE_DIR=3D\"/mnt/SSD/o=
e-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oecore-l=
inux-gnueabi.gcc-cross-initial/gcc/arm-oecore-linux-gnueabi/4.7.2/include-f=
ixed\" -DGPLUSPLUS_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/=
x86_64-linux/usr/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial=
/gcc/arm-oecore-linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi=
/include/c++/4.7.2\" -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D0 -DGPLUSPLUS_TO=
OL_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr=
/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/arm-oecore-=
linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi/include/c++/4.7=
.2/arm-oecore-linux-gnueabi\" -DGPLUSPLUS_BACKWARD_INCLUDE_DIR=3D\"/mnt/SSD=
/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oecore=
-linux-gnueabi.gcc-cross-initial/gcc/arm-oecore-linux-gnueabi/4.7.2/../../.=
./../../arm-oecore-linux-gnueabi/include/c++/4.7.2/backward\" -DLOCAL_INCLU=
DE_DIR=3D\"/usr/local/include\" -DCROSS_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/c=
coR0005/tmp/sysroots/beaglebone${sysroot_headers_suffix}/usr/include\" -DTO=
OL_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr=
/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/arm-oecore-=
linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi/include\" -DNAT=
IVE_SYSTEM_HEADER_DIR=3D\"/usr/include\" -DPREFIX=3D\"/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/\" -DSTANDARD_EXEC_PREFIX=3D\"/mnt/SSD/=
oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oecore-=
linux-gnueabi.gcc-cross-initial/gcc/\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/SSD/oe=
-r0005/ccoR0005/tmp/sysroots/beaglebone\" -DBASEVER=3D"\"4.7.2\"" -isystem/=
mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -=
DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-string=
s -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-att=
ribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-string=
s -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../lib=
cpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnumber    /mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/cppbuiltin.c =
-o cppbuiltin.o
gcc -c  -DGCC_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_6=
4-linux/usr/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/=
arm-oecore-linux-gnueabi/4.7.2/include\" -DFIXED_INCLUDE_DIR=3D\"/mnt/SSD/o=
e-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oecore-l=
inux-gnueabi.gcc-cross-initial/gcc/arm-oecore-linux-gnueabi/4.7.2/include-f=
ixed\" -DGPLUSPLUS_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/=
x86_64-linux/usr/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial=
/gcc/arm-oecore-linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi=
/include/c++/4.7.2\" -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D0 -DGPLUSPLUS_TO=
OL_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr=
/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/arm-oecore-=
linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi/include/c++/4.7=
.2/arm-oecore-linux-gnueabi\" -DGPLUSPLUS_BACKWARD_INCLUDE_DIR=3D\"/mnt/SSD=
/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oecore=
-linux-gnueabi.gcc-cross-initial/gcc/arm-oecore-linux-gnueabi/4.7.2/../../.=
./../../arm-oecore-linux-gnueabi/include/c++/4.7.2/backward\" -DLOCAL_INCLU=
DE_DIR=3D\"/usr/local/include\" -DCROSS_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/c=
coR0005/tmp/sysroots/beaglebone${sysroot_headers_suffix}/usr/include\" -DTO=
OL_INCLUDE_DIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr=
/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/arm-oecore-=
linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi/include\" -DNAT=
IVE_SYSTEM_HEADER_DIR=3D\"/usr/include\" -DPREFIX=3D\"/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/\" -DSTANDARD_EXEC_PREFIX=3D\"/mnt/SSD/=
oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-oecore-=
linux-gnueabi.gcc-cross-initial/gcc/\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/SSD/oe=
-r0005/ccoR0005/tmp/sysroots/beaglebone\" -isystem/mnt/SSD/oe-r0005/ccoR000=
5/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTOR=
Y_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-p=
rototypes -Wmissing-prototypes -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition=
 -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work=
-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005=
/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumb=
er -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../libdecnumber/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/cppdefault.c -o cppdefault.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/coverage.c:34:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cprop.c -o cprop.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cppbuiltin.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cse.c -o cse.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cprop.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cselib.c -o cselib.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cse.c:30:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cselib.c:34:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/data-streamer.c -o data-streamer.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-streamer.h:27:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/data-streamer.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/data-streamer.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/data-streamer-in.c -o data-streamer-in.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-streamer.h:27:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/data-streamer.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/data-streamer-in.c:27:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/data-streamer-out.c -o data-streamer-out.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dbxout.c -o dbxout.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-streamer.h:27:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/data-streamer.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/data-streamer-out.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dbgcnt.c -o dbgcnt.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dbxout.c:76:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dce.c -o dce.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ddg.c -o ddg.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dce.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/debug.c -o debug.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ddg.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/debug.c:23:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/df-core.c -o df-core.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/df-core.c:386:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/df-problems.c -o df-problems.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/df-problems.c:33:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/df-scan.c -o df-scan.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/df-scan.c:33:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dfp.c -o dfp.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dojump.c -o dojump.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dfp.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dojump.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dominance.c -o dominance.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dominance.c:43:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/domwalk.c -o domwalk.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/double-int.c -o double-int.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/domwalk.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/double-int.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dse.c -o dse.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dwarf2asm.c -o dwarf2asm.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dse.c:32:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dwarf2cfi.c -o dwarf2cfi.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dwarf2asm.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/dwarf2out.c -o dwarf2out.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dwarf2out.c:64:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/dwarf2cfi.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ebitmap.c -o ebitmap.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/emit-rtl.c -o emit-rtl.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/emit-rtl.c:43:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/et-forest.c -o et-forest.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/except.c -o except.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/except.c:119:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/explow.c -o explow.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat  -Wno-error -DHAVE_=
CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/expmed.c -o expmed.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/expr.c -o expr.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/explow.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expmed.c:31:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/final.c -o final.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/final.c:53:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expmed.c:30:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c: In function 'init_expmed':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:140:3: note: in expansion of macro 'XEXP'
   XEXP (&all.plus, 1) =3D &all.reg;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:147:3: note: in expansion of macro 'XEXP'
   XEXP (&all.mult, 1) =3D &all.reg;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:151:3: note: in expansion of macro 'XEXP'
   XEXP (&all.sdiv, 1) =3D &all.reg;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:155:3: note: in expansion of macro 'XEXP'
   XEXP (&all.udiv, 1) =3D &all.reg;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:159:3: note: in expansion of macro 'XEXP'
   XEXP (&all.sdiv_32, 1) =3D 32 < MAX_BITS_PER_WORD ? cint[32] : GEN_INT (=
32);
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:163:3: note: in expansion of macro 'XEXP'
   XEXP (&all.smod_32, 1) =3D XEXP (&all.sdiv_32, 1);
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:170:3: note: in expansion of macro 'XEXP'
   XEXP (&all.wide_mult, 1) =3D &all.zext;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:186:3: note: in expansion of macro 'XEXP'
   XEXP (&all.shift_add, 1) =3D &all.reg;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:190:3: note: in expansion of macro 'XEXP'
   XEXP (&all.shift_sub0, 1) =3D &all.reg;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:194:3: note: in expansion of macro 'XEXP'
   XEXP (&all.shift_sub1, 1) =3D &all.shift_mult;
   ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:237:8: note: in expansion of macro 'XEXP'
        XEXP (&all.wide_lshr, 1) =3D GEN_INT (GET_MODE_BITSIZE (mode));
        ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:252:8: note: in expansion of macro 'XEXP'
        XEXP (&all.shift, 1) =3D cint[m];
        ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:627:50: warning: array subscript is above array bounds [-Warray-bounds]
 #define RTL_CHECK2(RTX, N, C1, C2)  ((RTX)->u.fld[N])
                                                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/rtl.=
h:737:23: note: in expansion of macro 'RTL_CHECK2'
 #define XEXP(RTX, N) (RTL_CHECK2 (RTX, N, 'e', 'u').rt_rtx)
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/expm=
ed.c:253:8: note: in expansion of macro 'XEXP'
        XEXP (&all.shift_mult, 1) =3D pow2[m];
        ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/fixed-value.c -o fixed-value.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/fixed-value.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/fold-const.c -o fold-const.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/fold-const.c:50:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/function.c -o function.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.c:41:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/fwprop.c -o fwprop.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gcse.c -o gcse.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/fwprop.c:36:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gcse.c:145:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ggc-common.c -o ggc-common.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple.c -o gimple.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple-iterator.c -o gimple-iterator.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple-iterator.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple-fold.c -o gimple-fold.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple-low.c -o gimple-low.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple-fold.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple-pretty-print.c -o gimple-pretty-print.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple-low.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple-pretty-print.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple-streamer-in.c -o gimple-streamer-in.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimple-streamer-out.c -o gimple-streamer-out.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple-streamer-in.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimple-streamer-out.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gimplify.c -o gimplify.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/godump.c -o godump.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/godump.c:34:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/gimplify.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graph.c -o graph.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graph.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphds.c -o graphds.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite.c -o graphite.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-blocking.c -o graphite-blocking.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite.c:39:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-clast-to-gimple.c -o graphite-clast-to-gimple.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-blocking.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-cloog-util.c -o graphite-cloog-util.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-clast-to-gimple.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-dependences.c -o graphite-dependences.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-flattening.c -o graphite-flattening.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-dependences.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-interchange.c -o graphite-interchange.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-poly.c -o graphite-poly.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-flattening.c:24:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-interchange.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-poly.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-ppl.c -o graphite-ppl.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-scop-detection.c -o graphite-scop-detection.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/graphite-sese-to-poly.c -o graphite-sese-to-poly.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    gtype-desc.c -o gtype-desc.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/haifa-sched.c -o haifa-sched.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-sese-to-poly.c:24:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/graphite-scop-detection.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from gtype-desc.c:30:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/haifa-sched.c:136:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/hw-doloop.c -o hw-doloop.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/hwint.c -o hwint.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ifcvt.c -o ifcvt.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/hw-doloop.c:27:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ifcvt.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ree.c -o ree.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ree.c:223:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/incpath.c -o incpath.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/init-regs.c -o init-regs.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/integrate.c -o integrate.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/init-regs.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/internal-fn.c -o internal-fn.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/integrate.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-cp.c -o ipa-cp.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-split.c -o ipa-split.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/internal-fn.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-cp.c:107:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-split.c:81:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-inline.c -o ipa-inline.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-inline-analysis.c -o ipa-inline-analysis.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-inline-transform.c -o ipa-inline-transform.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-inline.c:97:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-inline-analysis.c:72:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-inline-transform.c:36:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-prop.c -o ipa-prop.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-prop.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-pure-const.c -o ipa-pure-const.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-reference.c -o ipa-reference.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-pure-const.c:39:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-ref.c -o ipa-ref.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa-utils.c -o ipa-utils.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-reference.c:44:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-ref.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa-utils.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ipa.c -o ipa.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira.c -o ira.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cgraph.h:27:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ipa.c:25:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira-build.c -o ira-build.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira.c:372:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira-build.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira-costs.c -o ira-costs.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira-conflicts.c -o ira-conflicts.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira-costs.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira-color.c -o ira-color.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira-conflicts.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira-emit.c -o ira-emit.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira-color.c:34:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ira-lives.c -o ira-lives.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira-emit.c:81:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/ira-lives.c:33:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/jump.c -o jump.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/langhooks.c -o langhooks.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/langhooks.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/jump.c:50:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lcm.c -o lcm.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lists.c -o lists.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/loop-doloop.c -o loop-doloop.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/loop-init.c -o loop-init.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/loop-invariant.c -o loop-invariant.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/loop-iv.c -o loop-iv.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lcm.c:62:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/loop-doloop.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/loop-unroll.c -o loop-unroll.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/loop-init.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/loop-invariant.c:46:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/loop-iv.c:58:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/loop-unswitch.c -o loop-unswitch.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/loop-unroll.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lower-subreg.c -o lower-subreg.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-cgraph.c -o lto-cgraph.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-streamer.c -o lto-streamer.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/loop-unswitch.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-streamer.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lower-subreg.c:34:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-cgraph.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-streamer-in.c -o lto-streamer-in.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-streamer-out.c -o lto-streamer-out.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-streamer-in.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-streamer-out.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-section-in.c -o lto-section-in.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-section-out.c -o lto-section-out.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-section-in.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-symtab.c -o lto-symtab.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-opts.c -o lto-opts.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-section-out.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-symtab.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-opts.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/lto-compress.c -o lto-compress.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/matrix-reorg.c -o matrix-reorg.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/lto-compress.c:30:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/mcf.c -o mcf.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/mode-switching.c -o mode-switching.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/modulo-sched.c -o modulo-sched.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/matrix-reorg.c:116:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/omega.c -o omega.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/omp-low.c -o omp-low.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/mcf.c:50:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/mode-switching.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/optabs.c -o optabs.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/modulo-sched.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    options-save.c -o options-save.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/opts-global.c -o opts-global.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/omega.c:37:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/omp-low.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/optabs.c:33:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/opts-global.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/passes.c -o passes.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/plugin.c -o plugin.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/passes.c:33:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/plugin.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/pointer-set.c -o pointer-set.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/postreload-gcse.c -o postreload-gcse.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/postreload.c -o postreload.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/postreload-gcse.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/postreload.c:34:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/predict.c -o predict.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/print-rtl.c -o print-rtl.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/print-tree.c -o print-tree.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/profile.c -o profile.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/predict.c:35:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/print-rtl.c:38:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/print-tree.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/profile.c:60:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/real.c -o real.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/realmpfr.c -o realmpfr.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/realmpfr.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/real.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/recog.c -o recog.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/recog.c:35:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/reg-stack.c -o reg-stack.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/reg-stack.c:158:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/regcprop.c -o regcprop.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/reginfo.c -o reginfo.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/regmove.c -o regmove.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/regcprop.c:31:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/reginfo.c:36:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/regmove.c:39:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/regrename.c -o regrename.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/regstat.c -o regstat.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/reload.c -o reload.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/regrename.c:31:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/regstat.c:34:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/reload.c:100:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/reload1.c -o reload1.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/reorg.c -o reorg.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/resource.c -o resource.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/rtl-error.c -o rtl-error.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/reload1.c:35:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/reorg.c:121:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/rtl.c -o rtl.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/resource.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/rtlanal.c -o rtlanal.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/rtlhooks.c -o rtlhooks.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sbitmap.c -o sbitmap.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/rtlhooks.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/rtlanal.c:37:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sbitmap.c:32:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sched-deps.c -o sched-deps.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sched-ebb.c -o sched-ebb.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sched-rgn.c -o sched-rgn.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sched-deps.c:35:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sched-vis.c -o sched-vis.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sched-ebb.c:33:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sched-rgn.c:57:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sdbout.c -o sdbout.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sched-vis.c:31:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sel-sched-ir.c -o sel-sched-ir.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sdbout.c:49:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sel-sched-dump.c -o sel-sched-dump.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sel-sched-ir.c:30:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sel-sched-dump.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sel-sched.c -o sel-sched.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sel-sched.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sese.c -o sese.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/sese.c:27:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/simplify-rtx.c -o simplify-rtx.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/simplify-rtx.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sparseset.c -o sparseset.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/sreal.c -o sreal.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/stack-ptr-mod.c -o stack-ptr-mod.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/statistics.c -o statistics.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/stmt.c -o stmt.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/stack-ptr-mod.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/statistics.c:29:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/stor-layout.c -o stor-layout.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/stmt.c:34:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/store-motion.c -o store-motion.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/stor-layout.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/store-motion.c:29:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/streamer-hooks.c -o streamer-hooks.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/streamer-hooks.h:26:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/streamer-hooks.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/stringpool.c -o stringpool.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/target-globals.c -o target-globals.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/stringpool.c:34:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/targhooks.c -o targhooks.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/target-globals.c:35:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/timevar.c -o timevar.o
gcc -c  -DTARGET_NAME=3D\"arm-oecore-linux-gnueabi\" -isystem/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCRO=
SS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual=
 -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attribute -pedan=
tic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style=
-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR=
0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR00=
05/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR00=
05/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  =
-I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/..=
/libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libdecnumber/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR=
0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/toplev.c -o toplev.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tracer.c -o tracer.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/trans-mem.c -o trans-mem.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/targhooks.c:56:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/toplev.c:33:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tracer.c:41:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/trans-mem.c:23:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-affine.c -o tree-affine.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-affine.c:23:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-call-cdce.c -o tree-call-cdce.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-cfg.c -o tree-cfg.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-cfgcleanup.c -o tree-cfgcleanup.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-chrec.c -o tree-chrec.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-call-cdce.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-cfg.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-cfgcleanup.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/cfgloop.h:24,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-chrec.c:31:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-complex.c -o tree-complex.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-data-ref.c -o tree-data-ref.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-complex.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-dfa.c -o tree-dfa.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-data-ref.c:81:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-dfa.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-diagnostic.c -o tree-diagnostic.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-diagnostic.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-dump.c -o tree-dump.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-eh.c -o tree-eh.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-dump.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-eh.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-emutls.c -o tree-emutls.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-if-conv.c -o tree-if-conv.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-inline.c -o tree-inline.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-into-ssa.c -o tree-into-ssa.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-emutls.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-if-conv.c:88:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-iterator.c -o tree-iterator.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-into-ssa.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-inline.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-iterator.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-loop-distribution.c -o tree-loop-distribution.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-nested.c -o tree-nested.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-loop-distribution.c:48:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-nested.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-nomudflap.c -o tree-nomudflap.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-nomudflap.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-nrv.c -o tree-nrv.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-object-size.c -o tree-object-size.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-optimize.c -o tree-optimize.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-outof-ssa.c -o tree-outof-ssa.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-nrv.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-parloops.c -o tree-parloops.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-object-size.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-optimize.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-outof-ssa.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-parloops.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-phinodes.c -o tree-phinodes.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-predcom.c -o tree-predcom.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-phinodes.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-pretty-print.c -o tree-pretty-print.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-predcom.c:192:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-profile.c -o tree-profile.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-pretty-print.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-profile.c:35:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-scalar-evolution.c -o tree-scalar-evolution.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-sra.c -o tree-sra.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-switch-conversion.c -o tree-switch-conversion.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-scalar-evolution.c:261:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-address.c -o tree-ssa-address.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-sra.c:79:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-switch-conversion.c:86:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-alias.c -o tree-ssa-alias.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-address.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-alias.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-ccp.c -o tree-ssa-ccp.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-coalesce.c -o tree-ssa-coalesce.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-copy.c -o tree-ssa-copy.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-ccp.c:117:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-coalesce.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-copy.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-copyrename.c -o tree-ssa-copyrename.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-dce.c -o tree-ssa-dce.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-dom.c -o tree-ssa-dom.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-copyrename.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-dse.c -o tree-ssa-dse.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-dce.c:51:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-dom.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-forwprop.c -o tree-ssa-forwprop.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-dse.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-forwprop.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-ifcombine.c -o tree-ssa-ifcombine.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-ifcombine.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-live.c -o tree-ssa-live.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-ch.c -o tree-ssa-loop-ch.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-live.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-ch.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-im.c -o tree-ssa-loop-im.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-ivcanon.c -o tree-ssa-loop-ivcanon.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-ivopts.c -o tree-ssa-loop-ivopts.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-im.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-ivopts.c:69:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-ivcanon.c:40:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-manip.c -o tree-ssa-loop-manip.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-manip.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-niter.c -o tree-ssa-loop-niter.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-prefetch.c -o tree-ssa-loop-prefetch.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-niter.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop-unswitch.c -o tree-ssa-loop-unswitch.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-loop.c -o tree-ssa-loop.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-prefetch.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop-unswitch.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-loop.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-math-opts.c -o tree-ssa-math-opts.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-operands.c -o tree-ssa-operands.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-math-opts.c:93:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-phiopt.c -o tree-ssa-phiopt.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-operands.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-phiprop.c -o tree-ssa-phiprop.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-phiprop.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-phiopt.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-pre.c -o tree-ssa-pre.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-propagate.c -o tree-ssa-propagate.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-pre.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-propagate.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-reassoc.c -o tree-ssa-reassoc.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-sccvn.c -o tree-ssa-sccvn.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-sink.c -o tree-ssa-sink.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-reassoc.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-sccvn.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-sink.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-strlen.c -o tree-ssa-strlen.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-structalias.c -o tree-ssa-structalias.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-flow.h:27,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-strlen.c:24:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-structalias.c:30:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-tail-merge.c -o tree-ssa-tail-merge.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-ter.c -o tree-ssa-ter.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-threadedge.c -o tree-ssa-threadedge.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-tail-merge.c:187:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-ter.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-threadedge.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-threadupdate.c -o tree-ssa-threadupdate.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-uncprop.c -o tree-ssa-uncprop.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-threadupdate.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa-uninit.c -o tree-ssa-uninit.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-uncprop.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssa.c -o tree-ssa.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa-uninit.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssa.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-ssanames.c -o tree-ssanames.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-stdarg.c -o tree-stdarg.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-streamer.c -o tree-streamer.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-streamer-in.c -o tree-streamer-in.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-ssanames.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-streamer-out.c -o tree-streamer-out.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-stdarg.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/streamer-hooks.h:26:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-streamer.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-streamer-in.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-streamer-out.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-tailcall.c -o tree-tailcall.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-generic.c -o tree-vect-generic.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-tailcall.c:25:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-patterns.c -o tree-vect-patterns.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-generic.c:24:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-data-refs.c -o tree-vect-data-refs.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-patterns.c:27:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-data-refs.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-stmts.c -o tree-vect-stmts.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-loop.c -o tree-vect-loop.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-loop-manip.c -o tree-vect-loop-manip.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vect-slp.c -o tree-vect-slp.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-stmts.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vectorizer.c -o tree-vectorizer.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-loop.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-loop-manip.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vect-slp.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vectorizer.c:63:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree-vrp.c -o tree-vrp.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tree.c -o tree.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree-vrp.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/tree.c:37:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/value-prof.c -o value-prof.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/value-prof.c:26:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/var-tracking.c -o var-tracking.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/var-tracking.c:94:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/varasm.c -o varasm.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/varasm.c:36:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/varpool.c -o varpool.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/varpool.c:26:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/vmsdbgout.c -o vmsdbgout.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/web.c -o web.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/basic-block.h:26,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/web.c:47:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/xcoffout.c -o xcoffout.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/xcoffout.c:30:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    \
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/arm/arm.c -o arm.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber   \
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/con=
fig/host-linux.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    \
  /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/co=
mmon/config/arm/arm-common.c -o arm-common.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/config/arm/arm.c:30:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc -c  -DPREFIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/u=
sr\" -DBASEVER=3D"\"4.7.2\"" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/x86_64-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  =
-W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wm=
issing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-=
variadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat=
   -DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4=
.7.2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4=
.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR=
0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD=
/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnum=
ber/dpd -I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc=
-4.7.2-r19/gcc-4.7.2/gcc/prefix.c -o prefix.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/params.c -o params.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/opts.c -o opts.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/opts-common.c -o opts-common.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    options.c -o options.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/vec.c -o vec.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/hooks.c -o hooks.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes  -=
Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -Icommon -I/mnt/SS=
D/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/common -I/mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../inclu=
de -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnumber    /m=
nt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/common=
/common-targhooks.c -o common/common-targhooks.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/diagnostic.c -o diagnostic.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/pretty-print.c -o pretty-print.o
gcc -c  -DLOCALEDIR=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linu=
x/usr/share/locale\" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64=
-linux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall=
 -Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-p=
rototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic=
-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   -DHAV=
E_CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp=
/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r000=
5/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd =
-I../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r=
19/gcc-4.7.2/gcc/intl.c -o intl.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/input.c -o input.o
gcc -c  -DBASEVER=3D"\"4.7.2\"" -DDATESTAMP=3D"\"\"" -DREVISION=3D"\"\"" -D=
DEVPHASE=3D"\"\"" -DPKGVERSION=3D"\"(GCC) \"" -DBUGURL=3D"\"<http://gcc.gnu=
.org/bugs.html>\"" -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -=
Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-pro=
totypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-m=
acros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_=
CONFIG_H -I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.=
7.2-r19/gcc-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I=
../libdecnumber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/version.c -o version.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gcov.c -o gcov.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gcov-dump.c -o gcov-dump.o
gcc -c  -DTARGET_MACHINE=3D\"arm-oecore-linux-gnueabi\" -DTARGET_SYSTEM_ROO=
T=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone\" -isystem/mnt/SSD=
/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC=
 -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-strings -Wcas=
t-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attribute =
-pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -Wold=
-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. -I. -I/mnt/SSD/oe-r000=
5/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/. -I/mnt/SSD/oe-r0005/=
ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../include -I/mnt/SSD/=
oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libcpp/inc=
lude  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnumber    /mnt/SSD/oe-r000=
5/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/collect2.c -o collec=
t2.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/collect2-aix.c -o collect2-aix.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/tlink.c -o tlink.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/ggc-none.c -o ggc-none.o
(SHLIB=3D'true'; \
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. =
-I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gc=
c -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/=
. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/=
../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/=
work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnumb=
er    \
  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=3D\"/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-=
oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DSTANDARD_LIBEXEC_PREFIX=3D\=
"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/libexec/armv7a-vf=
p-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DDEFAULT_TARGET_VERSI=
ON=3D\"4.7.2\" -DDEFAULT_TARGET_MACHINE=3D\"arm-oecore-linux-gnueabi\" -DST=
ANDARD_BINDIR_PREFIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-lin=
ux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/\" -DTOOL=
DIR_BASE_PREFIX=3D\"../../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/beaglebone\"  `test "X${SHLIB}" =3D "X" || test=
 "no" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` -DCONFIGURE_SPECS=3D"\"\=
"" \
  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/gcc.c -o gcc.o)
(SHLIB=3D'true'; \
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -I. =
-I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gc=
c -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/=
. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/=
../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gc=
c-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/tmp/=
work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecnumb=
er    \
  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=3D\"/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-=
oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DSTANDARD_LIBEXEC_PREFIX=3D\=
"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/libexec/armv7a-vf=
p-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/\" -DDEFAULT_TARGET_VERSI=
ON=3D\"4.7.2\" -DDEFAULT_TARGET_MACHINE=3D\"arm-oecore-linux-gnueabi\" -DST=
ANDARD_BINDIR_PREFIX=3D\"/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-lin=
ux/usr/bin/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/\" -DTOOL=
DIR_BASE_PREFIX=3D\"../../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/mnt/SSD/oe-=
r0005/ccoR0005/tmp/sysroots/beaglebone\"  `test "X${SHLIB}" =3D "X" || test=
 "no" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` -DCONFIGURE_SPECS=3D"\"\=
"" \
  -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/gccspec.c -o gccspec.o)
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/cppspec.c -o cppspec.o
build/genattrtab /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-attrtab.c
build/genautomata /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/=
gcc-4.7.2/gcc/config/arm/arm.md \
  insn-conditions.md > tmp-automata.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-output.c -o insn-output.o
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-recog.c -o insn-recog.o
rm -rf libcommon-target.a
ar rc libcommon-target.a arm-common.o prefix.o params.o opts.o opts-common.=
o options.o vec.o hooks.o common/common-targhooks.o
ranlib  libcommon-target.a
rm -rf libcommon.a
ar rc libcommon.a diagnostic.o pretty-print.o intl.o input.o version.o
ranlib  libcommon.a
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcov-dump.o \
	libcommon.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/=
libdecnumber.a  -o gcov-dump
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o Tcollect2 \
	collect2.o collect2-aix.o tlink.o vec.o ggc-none.o libcommon.a ../libcpp/l=
ibcpp.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a =20
mv -f Tcollect2 collect2
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o Tlto-wrapper \
    lto-wrapper.o ggc-none.o libcommon-target.a libcommon.a ../libcpp/libcp=
p.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a=20
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/expr.h:26,
                 from insn-output.c:11:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ar.o -o gcc-ar \
	libcommon.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/=
libdecnumber.a =20
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from insn-recog.c:10:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
mv -f Tlto-wrapper lto-wrapper
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-nm.o -o gcc-nm \
	libcommon.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/=
libdecnumber.a =20
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ranlib.o -o gcc-ranlib \
	libcommon.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/=
libdecnumber.a =20
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcov.o libcommon.a ../libcpp/libcp=
p.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a  -o gcov
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o xgcc gcc.o ggc-none.o \
  gccspec.o  libcommon-target.a \
   libcommon.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumbe=
r/libdecnumber.a=20
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o cpp gcc.o ggc-none.o \
  cppspec.o  libcommon-target.a \
   libcommon.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumbe=
r/libdecnumber.a=20
cp xgcc gcc-cross
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -dumpspecs > tmp-specs
mv tmp-specs specs
: > tmp-libgcc.mvars
echo GCC_CFLAGS =3D '-g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall =
-Wno-narrowing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-pr=
ototypes -Wold-style-definition  -isystem ./include ' >> tmp-libgcc.mvars
echo INHIBIT_LIBC_CFLAGS =3D '-Dinhibit_libc' >> tmp-libgcc.mvars
echo TARGET_SYSTEM_ROOT =3D '/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beagle=
bone' >> tmp-libgcc.mvars
mv tmp-libgcc.mvars libgcc.mvars
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-automata.c insn-automata.c
echo timestamp > s-automata
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-automata.c -o insn-automata.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from insn-automata.c:17:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-attrtab.c insn-attrtab.c
echo timestamp > s-attrtab
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    insn-attrtab.c -o insn-attrtab.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-=
r19/gcc-4.7.2/gcc/function.h:25:0,
                 from insn-attrtab.c:17:
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/tree=
.h:3273:11: warning: identifier 'thread_local' conflicts with C++ keyword [=
-Wc++-compat]
  unsigned thread_local : 1;
           ^
rm -rf libbackend.a
ar rc libbackend.a insn-attrtab.o insn-automata.o insn-emit.o insn-extract.=
o insn-modes.o insn-opinit.o insn-output.o insn-peep.o insn-preds.o insn-re=
cog.o insn-enums.o ggc-page.o alias.o alloc-pool.o auto-inc-dec.o bb-reorde=
r.o bitmap.o bt-load.o builtins.o caller-save.o calls.o cfg.o cfganal.o cfg=
build.o cfgcleanup.o cfgexpand.o cfghooks.o cfglayout.o cfgloop.o cfgloopan=
al.o cfgloopmanip.o cfgrtl.o cgraph.o cgraphbuild.o cgraphunit.o combine.o =
combine-stack-adj.o compare-elim.o convert.o coverage.o cppbuiltin.o cppdef=
ault.o cprop.o cse.o cselib.o data-streamer.o data-streamer-in.o data-strea=
mer-out.o dbxout.o dbgcnt.o dce.o ddg.o debug.o df-core.o df-problems.o df-=
scan.o dfp.o dojump.o dominance.o domwalk.o double-int.o dse.o dwarf2asm.o =
dwarf2cfi.o dwarf2out.o ebitmap.o emit-rtl.o et-forest.o except.o explow.o =
expmed.o expr.o final.o fixed-value.o fold-const.o function.o fwprop.o gcse=
.o ggc-common.o gimple.o gimple-iterator.o gimple-fold.o gimple-low.o gimpl=
e-pretty-print.o gimple-streamer-in.o gimple-streamer-out.o gimplify.o godu=
mp.o graph.o graphds.o graphite.o graphite-blocking.o graphite-clast-to-gim=
ple.o graphite-cloog-util.o graphite-dependences.o graphite-flattening.o gr=
aphite-interchange.o graphite-poly.o graphite-ppl.o graphite-scop-detection=
.o graphite-sese-to-poly.o gtype-desc.o haifa-sched.o hw-doloop.o hwint.o i=
fcvt.o ree.o incpath.o init-regs.o integrate.o internal-fn.o ipa-cp.o ipa-s=
plit.o ipa-inline.o ipa-inline-analysis.o ipa-inline-transform.o ipa-prop.o=
 ipa-pure-const.o ipa-reference.o ipa-ref.o ipa-utils.o ipa.o ira.o ira-bui=
ld.o ira-costs.o ira-conflicts.o ira-color.o ira-emit.o ira-lives.o jump.o =
langhooks.o lcm.o lists.o loop-doloop.o loop-init.o loop-invariant.o loop-i=
v.o loop-unroll.o loop-unswitch.o lower-subreg.o lto-cgraph.o lto-streamer.=
o lto-streamer-in.o lto-streamer-out.o lto-section-in.o lto-section-out.o l=
to-symtab.o lto-opts.o lto-compress.o matrix-reorg.o mcf.o mode-switching.o=
 modulo-sched.o omega.o omp-low.o optabs.o options-save.o opts-global.o pas=
ses.o plugin.o pointer-set.o postreload-gcse.o postreload.o predict.o print=
-rtl.o print-tree.o profile.o real.o realmpfr.o recog.o reg-stack.o regcpro=
p.o reginfo.o regmove.o regrename.o regstat.o reload.o reload1.o reorg.o re=
source.o rtl-error.o rtl.o rtlanal.o rtlhooks.o sbitmap.o sched-deps.o sche=
d-ebb.o sched-rgn.o sched-vis.o sdbout.o sel-sched-ir.o sel-sched-dump.o se=
l-sched.o sese.o simplify-rtx.o sparseset.o sreal.o stack-ptr-mod.o statist=
ics.o stmt.o stor-layout.o store-motion.o streamer-hooks.o stringpool.o tar=
get-globals.o targhooks.o timevar.o toplev.o tracer.o trans-mem.o tree-affi=
ne.o tree-call-cdce.o tree-cfg.o tree-cfgcleanup.o tree-chrec.o tree-comple=
x.o tree-data-ref.o tree-dfa.o tree-diagnostic.o tree-dump.o tree-eh.o tree=
-emutls.o tree-if-conv.o tree-inline.o tree-into-ssa.o tree-iterator.o tree=
-loop-distribution.o tree-nested.o tree-nomudflap.o tree-nrv.o tree-object-=
size.o tree-optimize.o tree-outof-ssa.o tree-parloops.o tree-phinodes.o tre=
e-predcom.o tree-pretty-print.o tree-profile.o tree-scalar-evolution.o tree=
-sra.o tree-switch-conversion.o tree-ssa-address.o tree-ssa-alias.o tree-ss=
a-ccp.o tree-ssa-coalesce.o tree-ssa-copy.o tree-ssa-copyrename.o tree-ssa-=
dce.o tree-ssa-dom.o tree-ssa-dse.o tree-ssa-forwprop.o tree-ssa-ifcombine.=
o tree-ssa-live.o tree-ssa-loop-ch.o tree-ssa-loop-im.o tree-ssa-loop-ivcan=
on.o tree-ssa-loop-ivopts.o tree-ssa-loop-manip.o tree-ssa-loop-niter.o tre=
e-ssa-loop-prefetch.o tree-ssa-loop-unswitch.o tree-ssa-loop.o tree-ssa-mat=
h-opts.o tree-ssa-operands.o tree-ssa-phiopt.o tree-ssa-phiprop.o tree-ssa-=
pre.o tree-ssa-propagate.o tree-ssa-reassoc.o tree-ssa-sccvn.o tree-ssa-sin=
k.o tree-ssa-strlen.o tree-ssa-structalias.o tree-ssa-tail-merge.o tree-ssa=
-ter.o tree-ssa-threadedge.o tree-ssa-threadupdate.o tree-ssa-uncprop.o tre=
e-ssa-uninit.o tree-ssa.o tree-ssanames.o tree-stdarg.o tree-streamer.o tre=
e-streamer-in.o tree-streamer-out.o tree-tailcall.o tree-vect-generic.o tre=
e-vect-patterns.o tree-vect-data-refs.o tree-vect-stmts.o tree-vect-loop.o =
tree-vect-loop-manip.o tree-vect-slp.o tree-vectorizer.o tree-vrp.o tree.o =
value-prof.o var-tracking.o varasm.o varpool.o vmsdbgout.o web.o xcoffout.o=
 arm.o  host-linux.o
ranlib  libbackend.a
build/genchecksum c-lang.o c-family/stub-objc.o attribs.o c-errors.o c-decl=
.o c-typeck.o c-convert.o c-aux-info.o c-objc-common.o c-parser.o tree-mudf=
lap.o c-family/c-common.o c-family/c-cppbuiltin.o c-family/c-dump.o c-famil=
y/c-format.o c-family/c-gimplify.o c-family/c-lex.o c-family/c-omp.o c-fami=
ly/c-opts.o c-family/c-pch.o c-family/c-ppoutput.o c-family/c-pragma.o c-fa=
mily/c-pretty-print.o c-family/c-semantics.o c-family/c-ada-spec.o arm-c.o =
default-c.o main.o  libbackend.a libcommon-target.a libcommon.a ../libcpp/l=
ibcpp.a ../libdecnumber/libdecnumber.a libcommon.a ../libcpp/libcpp.a ../li=
biberty/libiberty.a   ../libdecnumber/libdecnumber.a \
                     checksum-options > cc1-checksum.c.tmp && 		 \
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../m=
ove-if-change cc1-checksum.c.tmp cc1-checksum.c
gcc -c   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrow=
ing -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -W=
missing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno=
-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -=
I. -I. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/g=
cc/../include -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/gcc/../libcpp/include  -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared=
/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber -I/mnt/SSD/oe-r0005/ccoR0005/t=
mp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/../libdecnumber/dpd -I../libdecn=
umber    cc1-checksum.c -o cc1-checksum.o
gcc   -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing=
 -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-ov=
erlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -L/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/mnt/SSD/oe-r0=
005/ccoR0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/mnt/SSD/oe-r0005/cco=
R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o cc1 c-lang.o c-family/stub-objc=
.o attribs.o c-errors.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-objc=
-common.o c-parser.o tree-mudflap.o c-family/c-common.o c-family/c-cppbuilt=
in.o c-family/c-dump.o c-family/c-format.o c-family/c-gimplify.o c-family/c=
-lex.o c-family/c-omp.o c-family/c-opts.o c-family/c-pch.o c-family/c-ppout=
put.o c-family/c-pragma.o c-family/c-pretty-print.o c-family/c-semantics.o =
c-family/c-ada-spec.o arm-c.o default-c.o \
  cc1-checksum.o main.o  libbackend.a libcommon-target.a libcommon.a ../lib=
cpp/libcpp.a ../libdecnumber/libdecnumber.a libcommon.a ../libcpp/libcpp.a =
  ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a    -lmpc -lmpfr -=
lgmp   -lz
echo | /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnu=
eabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-li=
nux-gnueabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neo=
n-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-l=
inux.arm-oecore-linux-gnueabi/./gcc/ -E -dM - | \
  sed -n -e 's/^#define \([^_][a-zA-Z0-9_]*\).*/\1/p' \
	 -e 's/^#define \(_[^_A-Z][a-zA-Z0-9_]*\).*/\1/p' | \
  sort -u > tmp-macro_list
if /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi=
/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-=
gnueabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oe=
core-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux=
.arm-oecore-linux-gnueabi/./gcc/ -print-sysroot-headers-suffix > /dev/null =
2>&1; then \
  set -e; for ml in `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oe=
core-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux=
.arm-oecore-linux-gnueabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/=
armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/=
build.x86_64-linux.arm-oecore-linux-gnueabi/./gcc/ -print-multi-lib`; do \
    multi_dir=3D`echo ${ml} | sed -e 's/;.*$//'`; \
    flags=3D`echo ${ml} | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
    sfx=3D`/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux=
-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecor=
e-linux-gnueabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/./gcc/ ${flags} -print-sysroot-headers-su=
ffix`; \
    if [ "${multi_dir}" =3D "." ]; \
      then multi_dir=3D""; \
    else \
      multi_dir=3D/${multi_dir}; \
    fi; \
    echo "${sfx};${multi_dir}"; \
  done; \
else \
  echo ";"; \
fi > tmp-fixinc_list
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-fixinc_list fixinc_list
echo timestamp > s-fixinc_list
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/../move-if-change tmp-macro_list macro_list
echo timestamp > s-macro_list
rm -rf include-fixed; mkdir include-fixed
chmod a+rx include-fixed
if [ -d ../prev-gcc ]; then \
  cd ../prev-gcc && \
  make real-install-headers-tar DESTDIR=3D`pwd`/../gcc/ \
    libsubdir=3D. ; \
else \
  set -e; for ml in `cat fixinc_list`; do \
    sysroot_headers_suffix=3D`echo ${ml} | sed -e 's/;.*$//'`; \
    multi_dir=3D`echo ${ml} | sed -e 's/^[^;]*;//'`; \
    fix_dir=3Dinclude-fixed${multi_dir}; \
    if ! true && test ! -d `echo /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a=
-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.=
x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot${sysroot_headers_suffix}/u=
sr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`; then \
      echo The directory that should contain system headers does not exist:=
 >&2 ; \
      echo "  `echo /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oec=
ore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.=
arm-oecore-linux-gnueabi/tmpsysroot${sysroot_headers_suffix}/usr/include | =
sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`" >&2 ; \
      tooldir_sysinc=3D`echo "/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_6=
4-linux/usr/lib/armv7a-vfp-neon-oecore-linux-gnueabi.gcc-cross-initial/gcc/=
arm-oecore-linux-gnueabi/4.7.2/../../../../../arm-oecore-linux-gnueabi/sys-=
include" | sed -e :a -e "s,[^/]*/\.\.\/,," -e ta`; \
      if test "x`echo /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-o=
ecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linu=
x.arm-oecore-linux-gnueabi/tmpsysroot${sysroot_headers_suffix}/usr/include =
| sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`" =3D "x${tooldir_sysinc}"; \
      then sleep 1; else exit 1; fi; \
    fi; \
    /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/gcc/../mkinstalldirs ${fix_dir}; \
    chmod a+rx ${fix_dir} || true; \
    (TARGET_MACHINE=3D'arm-oecore-linux-gnueabi'; srcdir=3D`cd /mnt/SSD/oe-=
r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc; ${PWDCMD-pwd}`;=
 \
      SHELL=3D'/bin/sh'; MACRO_LIST=3D`${PWDCMD-pwd}`/macro_list ; \
      gcc_dir=3D`${PWDCMD-pwd}` ; \
      export TARGET_MACHINE srcdir SHELL MACRO_LIST && \
      cd ../build-x86_64-linux/fixincludes && \
      /bin/sh ./fixinc.sh "${gcc_dir}/${fix_dir}" \
        `echo /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-li=
nux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oe=
core-linux-gnueabi/tmpsysroot${sysroot_headers_suffix}/usr/include | sed -e=
 :a -e 's,[^/]*/\.\.\/,,' -e ta`  ); \
    rm -f ${fix_dir}/syslimits.h; \
    if [ -f ${fix_dir}/limits.h ]; then \
      mv ${fix_dir}/limits.h ${fix_dir}/syslimits.h; \
    else \
      cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2=
/gcc/gsyslimits.h ${fix_dir}/syslimits.h; \
    fi; \
    chmod a+r ${fix_dir}/syslimits.h; \
  done; \
fi
Fixing headers into /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oec=
ore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.=
arm-oecore-linux-gnueabi/gcc/include-fixed for arm-oecore-linux-gnueabi tar=
get
Forbidden identifiers: linux unix=20
Finding directories and links to directories
 Searching /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux=
-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecor=
e-linux-gnueabi/tmpsysroot/usr/include/.
 Searching /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux=
-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecor=
e-linux-gnueabi/tmpsysroot/usr/include/./linux
 Searching /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux=
-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecor=
e-linux-gnueabi/tmpsysroot/usr/include/./asm
 Searching /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux=
-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecor=
e-linux-gnueabi/tmpsysroot/usr/include/./asm-generic
Making symbolic directory links
Fixing directory /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore=
-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm=
-oecore-linux-gnueabi/tmpsysroot/usr/include into /mnt/SSD/oe-r0005/ccoR000=
5/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19=
/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/gcc/include-fixed
Fixing directory /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore=
-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm=
-oecore-linux-gnueabi/tmpsysroot/usr/include/linux into /mnt/SSD/oe-r0005/c=
coR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7=
.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/gcc/include-fi=
xed/root/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/include/linu=
x
Applying io_quotes_use            to linux/hsi/hsi_char.h
Applying io_quotes_use            to linux/mmc/ioctl.h
Applying io_quotes_use            to linux/raid/md_u.h
Applying io_quotes_use            to linux/spi/spidev.h
Applying io_quotes_use            to linux/usb/tmc.h
Applying machine_name             to linux/a.out.h
Fixed:  linux/a.out.h
Applying io_quotes_use            to linux/agpgart.h
Applying io_quotes_use            to linux/atmbr2684.h
Applying io_quotes_use            to linux/auto_fs.h
Applying io_quotes_use            to linux/auto_fs4.h
Applying io_quotes_use            to linux/blkpg.h
Applying io_quotes_use            to linux/cciss_ioctl.h
Applying io_quotes_use            to linux/cm4000_cs.h
Applying io_quotes_use            to linux/dm-ioctl.h
Applying io_quotes_use            to linux/dn.h
Applying io_quotes_use            to linux/fd.h
Applying io_quotes_use            to linux/fs.h
Applying io_quotes_use            to linux/gigaset_dev.h
Applying io_quotes_use            to linux/i2o-dev.h
Applying io_quotes_use            to linux/if_pppox.h
Applying io_quotes_use            to linux/input.h
Applying io_quotes_use            to linux/ipmi.h
Applying io_quotes_use            to linux/media.h
Applying io_quotes_use            to linux/mmtimer.h
Applying io_quotes_use            to linux/nbd.h
Applying io_quotes_use            to linux/omapfb.h
Applying io_quotes_def            to linux/pci_regs.h
Applying io_quotes_use            to linux/phantom.h
Applying io_quotes_use            to linux/pktcdvd.h
Applying io_quotes_use            to linux/ppdev.h
Applying io_quotes_def            to linux/ppp-comp.h
Applying io_quotes_use            to linux/ptp_clock.h
Applying io_quotes_use            to linux/random.h
Applying io_quotes_use            to linux/raw.h
Applying io_quotes_use            to linux/reiserfs_fs.h
Applying io_quotes_use            to linux/rfkill.h
Applying io_quotes_def            to linux/soundcard.h
Applying io_quotes_use            to linux/suspend_ioctls.h
Applying io_quotes_use            to linux/synclink.h
Applying io_quotes_use            to linux/uinput.h
Applying io_quotes_use            to linux/vfio.h
Applying io_quotes_use            to linux/vhost.h
Applying io_quotes_use            to linux/watchdog.h
Applying io_quotes_def            to linux/version.h
Fixing directory /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore=
-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm=
-oecore-linux-gnueabi/tmpsysroot/usr/include/asm into /mnt/SSD/oe-r0005/cco=
R0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2=
-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/gcc/include-fixe=
d/root/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/include/asm
Fixing directory /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore=
-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm=
-oecore-linux-gnueabi/tmpsysroot/usr/include/asm-generic into /mnt/SSD/oe-r=
0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initi=
al/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/gcc/incl=
ude-fixed/root/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/includ=
e/asm-generic
Cleaning up unneeded directories:
fixincludes is done
echo timestamp > stmp-fixinc
if [ -d include ] ; then true; else mkdir include; chmod a+rx include; fi
if [ -d include-fixed ] ; then true; else mkdir include-fixed; chmod a+rx i=
nclude-fixed; fi
for file in .. /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/gcc/ginclude/float.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/gcc/ginclude/iso646.h /mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/ginclude/stdarg.h /mnt/SSD/oe-r0005/c=
coR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/ginclude/stdbool.h /mnt=
/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/ginclude=
/stddef.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/ginclude/varargs.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7=
.2-r19/gcc-4.7.2/gcc/ginclude/stdfix.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/ginclude/stdnoreturn.h /mnt/SSD/oe-r0005=
/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/ginclude/stdalign.h /=
mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/confi=
g/arm/mmintrin.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/g=
cc-4.7.2/gcc/config/arm/arm_neon.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shar=
ed/gcc-4.7.2-r19/gcc-4.7.2/gcc/ginclude/unwind-arm-common.h; do \
  if [ X$file !=3D X.. ]; then \
    realfile=3D`echo $file | sed -e 's|.*/\([^/]*\)$|\1|'`; \
    echo timestamp > include/$realfile; \
    rm -f include/$realfile; \
    cp $file include; \
    chmod a+r include/$realfile; \
  fi; \
done
for file in .. ; do \
  if [ X$file !=3D X.. ]; then \
            mv include/$file include/x_$file; \
            echo "#include_next <$file>" >include/$file; \
            cat include/x_$file >>include/$file; \
            rm -f include/x_$file; \
    chmod a+r include/$file; \
  fi; \
done
for file in .. ; do \
  if [ X$file !=3D X.. ]; then \
    echo "#include_next <$file>" >>include/$file; \
    chmod a+r include/$file; \
  fi; \
done
rm -f include/stdint.h
if [ wrap =3D wrap ]; then \
  rm -f include/stdint-gcc.h; \
  cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/ginclude/stdint-gcc.h include/stdint-gcc.h; \
  chmod a+r include/stdint-gcc.h; \
  cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/ginclude/stdint-wrap.h include/stdint.h; \
  chmod a+r include/stdint.h; \
elif [ wrap =3D provide ]; then \
  cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc=
/ginclude/stdint-gcc.h include/stdint.h; \
  chmod a+r include/stdint.h; \
fi
set -e; for ml in `cat fixinc_list`; do \
  sysroot_headers_suffix=3D`echo ${ml} | sed -e 's/;.*$//'`; \
  multi_dir=3D`echo ${ml} | sed -e 's/^[^;]*;//'`; \
  fix_dir=3Dinclude-fixed${multi_dir}; \
  if [ -f `echo /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-=
linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-=
oecore-linux-gnueabi/tmpsysroot${sysroot_headers_suffix}/usr/include | sed =
-e :a -e 's,[^/]*/\.\.\/,,' -e ta`/limits.h ] ; then \
    cat /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/limitx.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4=
.7.2/gcc/glimits.h /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19=
/gcc-4.7.2/gcc/limity.h > tmp-xlimits.h; \
  else \
    cat /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
gcc/glimits.h > tmp-xlimits.h; \
  fi; \
  /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/../mkinstalldirs ${fix_dir}; \
  chmod a+rx ${fix_dir} || true; \
  /bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.=
2/gcc/../move-if-change \
    tmp-xlimits.h  tmp-limits.h; \
  rm -f ${fix_dir}/limits.h; \
  cp -p tmp-limits.h ${fix_dir}/limits.h; \
  chmod a+r ${fix_dir}/limits.h; \
done
rm -f include-fixed/README
cp /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/gcc/.=
./fixincludes/README-fixinc include-fixed/README
chmod a+r include-fixed/README
echo timestamp > stmp-int-hdrs
rm gcc.pod
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/gcc'
Checking multilib configuration for libgcc...
mkdir -p -- arm-oecore-linux-gnueabi/libgcc
Configuring in arm-oecore-linux-gnueabi/libgcc
configure: creating cache ./config.cache
checking build system type... x86_64-pc-linux-gnu
checking host system type... arm-oecore-linux-gnueabi
checking for --enable-version-specific-runtime-libs... no
checking for a BSD-compatible install... /usr/bin/install -c
checking for gawk... gawk
checking for arm-oecore-linux-gnueabi-ar... arm-oecore-linux-gnueabi-ar
checking for arm-oecore-linux-gnueabi-lipo... arm-oecore-linux-gnueabi-lipo
checking for arm-oecore-linux-gnueabi-nm... /mnt/SSD/oe-r0005/ccoR0005/tmp/=
work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4=
.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/./gcc/nm
checking for arm-oecore-linux-gnueabi-ranlib... arm-oecore-linux-gnueabi-ra=
nlib
checking for arm-oecore-linux-gnueabi-strip... arm-oecore-linux-gnueabi-str=
ip
checking whether ln -s works... yes
checking for arm-oecore-linux-gnueabi-gcc...  /mnt/SSD/oe-r0005/ccoR0005/tm=
p/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc=
-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/./gcc/xgcc -B/mnt/SSD/oe=
-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-ini=
tial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/./gcc/=
 -march=3Darmv7-a     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon  =
-isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone/usr/include -B/m=
nt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnu=
eabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oe=
core-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x8=
6_64-linux/usr/arm-oecore-linux-gnueabi/include -isystem /mnt/SSD/oe-r0005/=
ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/sys-include=
 --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-lin=
ux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oec=
ore-linux-gnueabi/tmpsysroot =20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether  /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/arm=
v7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/bui=
ld.x86_64-linux.arm-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthum=
b-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/cc=
oR0005/tmp/sysroots/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp=
/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r000=
5/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isy=
stem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-li=
nux-gnueabi/include -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64=
-linux/usr/arm-oecore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r00=
05/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial=
/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot=
   accepts -g... yes
checking for  /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-li=
nux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oe=
core-linux-gnueabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-=
vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x=
86_64-linux.arm-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-in=
terwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR00=
05/tmp/sysroots/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/cc=
oR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem=
 /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-=
gnueabi/include -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-lin=
ux/usr/arm-oecore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/c=
coR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7=
.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   o=
ption to accept ISO C89... none needed
checking how to run the C preprocessor... gcc -E
checking size of double... 8
checking size of long double... 8
checking whether decimal floating point is supported... no
checking whether fixed-point is supported... yes
checking whether to use setjmp/longjmp exceptions... no
checking if the linker (/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon=
-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-li=
nux.arm-oecore-linux-gnueabi/./gcc/collect-ld) is GNU ld... yes
checking for thread model used by GCC... single
checking whether assembler supports CFI directives... yes
checking for __attribute__((visibility("hidden")))... yes
checking whether the target assembler supports thread-local storage... yes
checking whether the thread-local storage support is from emutls... no
configure: updating cache ./config.cache
configure: creating ./config.status
config.status: creating Makefile
config.status: linking /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/enable-execute-stack-empty.c to enable-execute-stack.=
c
config.status: linking /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/config/arm/unwind-arm.h to unwind.h
config.status: linking /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/config/no-unwind.h to md-unwind-support.h
config.status: linking /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/config/arm/sfp-machine.h to sfp-machine.h
config.status: linking /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/gthr-single.h to gthr-default.h
config.status: executing default commands
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp=
-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_=
64-linux.arm-oecore-linux-gnueabi/arm-oecore-linux-gnueabi/libgcc'
# If this is the top-level multilib, build all the other
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _thumb1_case_sqi_s.o -M=
T _thumb1_case_sqi_s.o -MD -MP -MF _thumb1_case_sqi_s.dep -DSHARED -DL_thum=
b1_case_sqi -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
DEFINES=3D'' HEADERS=3D'/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libgcc/config/arm/bpabi-lib.h' \
	/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/=
mkheader.sh > tmp-libgcc_tm.h
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _thumb1_case_uqi_s.o -M=
T _thumb1_case_uqi_s.o -MD -MP -MF _thumb1_case_uqi_s.dep -DSHARED -DL_thum=
b1_case_uqi -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
# multilibs.
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _thumb1_case_shi_s.o -M=
T _thumb1_case_shi_s.o -MD -MP -MF _thumb1_case_shi_s.dep -DSHARED -DL_thum=
b1_case_shi -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _thumb1_case_uhi_s.o -M=
T _thumb1_case_uhi_s.o -MD -MP -MF _thumb1_case_uhi_s.dep -DSHARED -DL_thum=
b1_case_uhi -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _thumb1_case_si_s.o -MT=
 _thumb1_case_si_s.o -MD -MP -MF _thumb1_case_si_s.dep -DSHARED -DL_thumb1_=
case_si -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/bin/sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
libgcc/../move-if-change tmp-libgcc_tm.h libgcc_tm.h
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _udivsi3_s.o -MT _udivs=
i3_s.o -MD -MP -MF _udivsi3_s.dep -DSHARED -DL_udivsi3 -xassembler-with-cpp=
 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libg=
cc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _divsi3_s.o -MT _divsi3=
_s.o -MD -MP -MF _divsi3_s.dep -DSHARED -DL_divsi3 -xassembler-with-cpp -c =
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/c=
onfig/arm/lib1funcs.S
echo timestamp > libgcc_tm.stamp
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _umodsi3_s.o -MT _umods=
i3_s.o -MD -MP -MF _umodsi3_s.dep -DSHARED -DL_umodsi3 -xassembler-with-cpp=
 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libg=
cc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _modsi3_s.o -MT _modsi3=
_s.o -MD -MP -MF _modsi3_s.dep -DSHARED -DL_modsi3 -xassembler-with-cpp -c =
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/c=
onfig/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _bb_init_func_s.o -MT _=
bb_init_func_s.o -MD -MP -MF _bb_init_func_s.dep -DSHARED -DL_bb_init_func =
-xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _call_via_rX_s.o -MT _c=
all_via_rX_s.o -MD -MP -MF _call_via_rX_s.dep -DSHARED -DL_call_via_rX -xas=
sembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _interwork_call_via_rX_=
s.o -MT _interwork_call_via_rX_s.o -MD -MP -MF _interwork_call_via_rX_s.dep=
 -DSHARED -DL_interwork_call_via_rX -xassembler-with-cpp -c /mnt/SSD/oe-r00=
05/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1f=
uncs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _lshrdi3_s.o -MT _lshrd=
i3_s.o -MD -MP -MF _lshrdi3_s.dep -DSHARED -DL_lshrdi3 -xassembler-with-cpp=
 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libg=
cc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _ashrdi3_s.o -MT _ashrd=
i3_s.o -MD -MP -MF _ashrdi3_s.dep -DSHARED -DL_ashrdi3 -xassembler-with-cpp=
 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libg=
cc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _ashldi3_s.o -MT _ashld=
i3_s.o -MD -MP -MF _ashldi3_s.dep -DSHARED -DL_ashldi3 -xassembler-with-cpp=
 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libg=
cc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_negdf2_s.o -MT _ar=
m_negdf2_s.o -MD -MP -MF _arm_negdf2_s.dep -DSHARED -DL_arm_negdf2 -xassemb=
ler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_addsubdf3_s.o -MT =
_arm_addsubdf3_s.o -MD -MP -MF _arm_addsubdf3_s.dep -DSHARED -DL_arm_addsub=
df3 -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_muldivdf3_s.o -MT =
_arm_muldivdf3_s.o -MD -MP -MF _arm_muldivdf3_s.dep -DSHARED -DL_arm_muldiv=
df3 -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_cmpdf2_s.o -MT _ar=
m_cmpdf2_s.o -MD -MP -MF _arm_cmpdf2_s.dep -DSHARED -DL_arm_cmpdf2 -xassemb=
ler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_unorddf2_s.o -MT _=
arm_unorddf2_s.o -MD -MP -MF _arm_unorddf2_s.dep -DSHARED -DL_arm_unorddf2 =
-xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_fixdfsi_s.o -MT _a=
rm_fixdfsi_s.o -MD -MP -MF _arm_fixdfsi_s.dep -DSHARED -DL_arm_fixdfsi -xas=
sembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_fixunsdfsi_s.o -MT=
 _arm_fixunsdfsi_s.o -MD -MP -MF _arm_fixunsdfsi_s.dep -DSHARED -DL_arm_fix=
unsdfsi -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_truncdfsf2_s.o -MT=
 _arm_truncdfsf2_s.o -MD -MP -MF _arm_truncdfsf2_s.dep -DSHARED -DL_arm_tru=
ncdfsf2 -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_negsf2_s.o -MT _ar=
m_negsf2_s.o -MD -MP -MF _arm_negsf2_s.dep -DSHARED -DL_arm_negsf2 -xassemb=
ler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_addsubsf3_s.o -MT =
_arm_addsubsf3_s.o -MD -MP -MF _arm_addsubsf3_s.dep -DSHARED -DL_arm_addsub=
sf3 -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_muldivsf3_s.o -MT =
_arm_muldivsf3_s.o -MD -MP -MF _arm_muldivsf3_s.dep -DSHARED -DL_arm_muldiv=
sf3 -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_cmpsf2_s.o -MT _ar=
m_cmpsf2_s.o -MD -MP -MF _arm_cmpsf2_s.dep -DSHARED -DL_arm_cmpsf2 -xassemb=
ler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_unordsf2_s.o -MT _=
arm_unordsf2_s.o -MD -MP -MF _arm_unordsf2_s.dep -DSHARED -DL_arm_unordsf2 =
-xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.=
2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_fixsfsi_s.o -MT _a=
rm_fixsfsi_s.o -MD -MP -MF _arm_fixsfsi_s.dep -DSHARED -DL_arm_fixsfsi -xas=
sembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_fixunssfsi_s.o -MT=
 _arm_fixunssfsi_s.o -MD -MP -MF _arm_fixunssfsi_s.dep -DSHARED -DL_arm_fix=
unssfsi -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_floatdidf_s.o -MT =
_arm_floatdidf_s.o -MD -MP -MF _arm_floatdidf_s.dep -DSHARED -DL_arm_floatd=
idf -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_floatdisf_s.o -MT =
_arm_floatdisf_s.o -MD -MP -MF _arm_floatdisf_s.dep -DSHARED -DL_arm_floatd=
isf -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_floatundidf_s.o -M=
T _arm_floatundidf_s.o -MD -MP -MF _arm_floatundidf_s.dep -DSHARED -DL_arm_=
floatundidf -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _arm_floatundisf_s.o -M=
T _arm_floatundisf_s.o -MD -MP -MF _arm_floatundisf_s.dep -DSHARED -DL_arm_=
floatundisf -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-sha=
red/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _clzsi2_s.o -MT _clzsi2=
_s.o -MD -MP -MF _clzsi2_s.dep -DSHARED -DL_clzsi2 -xassembler-with-cpp -c =
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/c=
onfig/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _clzdi2_s.o -MT _clzdi2=
_s.o -MD -MP -MF _clzdi2_s.dep -DSHARED -DL_clzdi2 -xassembler-with-cpp -c =
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/c=
onfig/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _aeabi_lcmp_s.o -MT _ae=
abi_lcmp_s.o -MD -MP -MF _aeabi_lcmp_s.dep -DSHARED -DL_aeabi_lcmp -xassemb=
ler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gc=
c-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _aeabi_ulcmp_s.o -MT _a=
eabi_ulcmp_s.o -MD -MP -MF _aeabi_ulcmp_s.dep -DSHARED -DL_aeabi_ulcmp -xas=
sembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _aeabi_ldivmod_s.o -MT =
_aeabi_ldivmod_s.o -MD -MP -MF _aeabi_ldivmod_s.dep -DSHARED -DL_aeabi_ldiv=
mod -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-=
4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _aeabi_uldivmod_s.o -MT=
 _aeabi_uldivmod_s.o -MD -MP -MF _aeabi_uldivmod_s.dep -DSHARED -DL_aeabi_u=
ldivmod -xassembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/=
gcc-4.7.2-r19/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _dvmd_lnx_s.o -MT _dvmd=
_lnx_s.o -MD -MP -MF _dvmd_lnx_s.dep -DSHARED -DL_dvmd_lnx -xassembler-with=
-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/=
libgcc/config/arm/lib1funcs.S
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _clear_cache_s.o -MT _c=
lear_cache_s.o -MD -MP -MF _clear_cache_s.dep -DSHARED -DL_clear_cache -xas=
sembler-with-cpp -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r1=
9/gcc-4.7.2/libgcc/config/arm/lib1funcs.S
echo '#ifdef __ARM_ARCH_6M__' > addsf3.c
echo '#ifdef __ARM_ARCH_6M__' > divsf3.c
echo '#ifdef __ARM_ARCH_6M__' > eqsf2.c
echo '#ifdef __ARM_ARCH_6M__' > gesf2.c
echo '#include "soft-fp/addsf3.c"' >> addsf3.c
echo '#ifdef __ARM_ARCH_6M__' > lesf2.c
echo '#include "soft-fp/divsf3.c"' >> divsf3.c
echo '#ifdef __ARM_ARCH_6M__' > mulsf3.c
echo '#include "soft-fp/eqsf2.c"' >> eqsf2.c
echo '#include "soft-fp/gesf2.c"' >> gesf2.c
echo '#endif' >> addsf3.c
echo '#include "soft-fp/lesf2.c"' >> lesf2.c
echo '#endif' >> divsf3.c
echo '#include "soft-fp/mulsf3.c"' >> mulsf3.c
echo '#endif' >> eqsf2.c
echo '#endif' >> gesf2.c
echo '#endif' >> lesf2.c
echo '#endif' >> mulsf3.c
echo '#ifdef __ARM_ARCH_6M__' > negsf2.c
echo '#ifdef __ARM_ARCH_6M__' > subsf3.c
echo '#ifdef __ARM_ARCH_6M__' > unordsf2.c
echo '#ifdef __ARM_ARCH_6M__' > fixsfsi.c
echo '#include "soft-fp/negsf2.c"' >> negsf2.c
echo '#include "soft-fp/subsf3.c"' >> subsf3.c
echo '#ifdef __ARM_ARCH_6M__' > floatsisf.c
echo '#include "soft-fp/unordsf2.c"' >> unordsf2.c
echo '#include "soft-fp/fixsfsi.c"' >> fixsfsi.c
echo '#endif' >> negsf2.c
echo '#endif' >> subsf3.c
echo '#include "soft-fp/floatsisf.c"' >> floatsisf.c
echo '#endif' >> unordsf2.c
echo '#endif' >> fixsfsi.c
echo '#ifdef __ARM_ARCH_6M__' > floatunsisf.c
echo '#ifdef __ARM_ARCH_6M__' > adddf3.c
echo '#endif' >> floatsisf.c
echo '#ifdef __ARM_ARCH_6M__' > divdf3.c
echo '#ifdef __ARM_ARCH_6M__' > eqdf2.c
echo '#include "soft-fp/floatunsisf.c"' >> floatunsisf.c
echo '#include "soft-fp/adddf3.c"' >> adddf3.c
echo '#ifdef __ARM_ARCH_6M__' > gedf2.c
echo '#include "soft-fp/divdf3.c"' >> divdf3.c
echo '#include "soft-fp/eqdf2.c"' >> eqdf2.c
echo '#ifdef __ARM_ARCH_6M__' > ledf2.c
echo '#endif' >> floatunsisf.c
echo '#endif' >> adddf3.c
echo '#include "soft-fp/gedf2.c"' >> gedf2.c
echo '#ifdef __ARM_ARCH_6M__' > muldf3.c
echo '#ifdef __ARM_ARCH_6M__' > negdf2.c
echo '#endif' >> divdf3.c
echo '#endif' >> eqdf2.c
echo '#include "soft-fp/ledf2.c"' >> ledf2.c
echo '#endif' >> gedf2.c
echo '#ifdef __ARM_ARCH_6M__' > subdf3.c
echo '#include "soft-fp/muldf3.c"' >> muldf3.c
echo '#include "soft-fp/negdf2.c"' >> negdf2.c
echo '#endif' >> ledf2.c
echo '#include "soft-fp/subdf3.c"' >> subdf3.c
echo '#endif' >> muldf3.c
echo '#ifdef __ARM_ARCH_6M__' > unorddf2.c
echo '#ifdef __ARM_ARCH_6M__' > fixdfsi.c
echo '#endif' >> negdf2.c
echo '#endif' >> subdf3.c
echo '#ifdef __ARM_ARCH_6M__' > floatsidf.c
echo '#ifdef __ARM_ARCH_6M__' > floatunsidf.c
echo '#include "soft-fp/unorddf2.c"' >> unorddf2.c
echo '#include "soft-fp/fixdfsi.c"' >> fixdfsi.c
echo '#ifdef __ARM_ARCH_6M__' > extendsfdf2.c
echo '#include "soft-fp/floatsidf.c"' >> floatsidf.c
echo '#ifdef __ARM_ARCH_6M__' > truncdfsf2.c
echo '#include "soft-fp/floatunsidf.c"' >> floatunsidf.c
echo '#endif' >> unorddf2.c
echo '#endif' >> fixdfsi.c
echo '#include "soft-fp/extendsfdf2.c"' >> extendsfdf2.c
echo '#endif' >> floatsidf.c
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o libunwind_s.o -MT libun=
wind_s.o -MD -MP -MF libunwind_s.dep -DSHARED -c -xassembler-with-cpp /mnt/=
SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/config=
/arm/libunwind.S
echo '#include "soft-fp/truncdfsf2.c"' >> truncdfsf2.c
echo '#endif' >> floatunsidf.c
echo '#endif' >> extendsfdf2.c
dest=3D../.././gcc/include/tmp$$-unwind.h; \
cp unwind.h $dest; \
chmod a+r $dest; \
sh /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgc=
c/../move-if-change $dest ../.././gcc/include/unwind.h
echo '#endif' >> truncdfsf2.c
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _thumb1_case_sqi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$=
/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _thumb=
1_case_sqi.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _thumb1_case_uqi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$=
/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _thumb=
1_case_uqi.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _thumb1_case_shi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$=
/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _thumb=
1_case_shi.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _thumb1_case_uhi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$=
/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _thumb=
1_case_uhi.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _thumb1_case_si_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/=
 && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _thumb1=
_case_si.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _udivsi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 =
!~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _udivsi3.visT
mv -f _thumb1_case_sqi.visT _thumb1_case_sqi.vis
mv -f _thumb1_case_uqi.visT _thumb1_case_uqi.vis
mv -f _thumb1_case_shi.visT _thumb1_case_shi.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _divsi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 !=
~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _divsi3.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _umodsi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 =
!~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _umodsi3.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _modsi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 !=
~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _modsi3.visT
mv -f _thumb1_case_uhi.visT _thumb1_case_uhi.vis
mv -f _thumb1_case_si.visT _thumb1_case_si.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _bb_init_func_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &=
& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _bb_init_=
func.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _call_via_rX_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &&=
 $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _call_via_=
rX.visT
mv -f _udivsi3.visT _udivsi3.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _interwork_call_via_rX_s.o | gawk 'NF =3D=3D 3 && $2 !~ /=
^[UN]$/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > =
_interwork_call_via_rX.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _lshrdi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 =
!~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _lshrdi3.visT
mv -f _umodsi3.visT _umodsi3.vis
mv -f _divsi3.visT _divsi3.vis
mv -f _modsi3.visT _modsi3.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _ashrdi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 =
!~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _ashrdi3.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _ashldi3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 =
!~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _ashldi3.visT
mv -f _call_via_rX.visT _call_via_rX.vis
mv -f _interwork_call_via_rX.visT _interwork_call_via_rX.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_negdf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && =
$3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_negdf2=
.visT
mv -f _bb_init_func.visT _bb_init_func.vis
mv -f _lshrdi3.visT _lshrdi3.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_addsubdf3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_add=
subdf3.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_muldivdf3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_mul=
divdf3.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_cmpdf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && =
$3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_cmpdf2=
.visT
mv -f _ashrdi3.visT _ashrdi3.vis
mv -f _ashldi3.visT _ashldi3.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_unorddf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &=
& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_unor=
ddf2.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_fixdfsi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &&=
 $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_fixdf=
si.visT
mv -f _arm_negdf2.visT _arm_negdf2.vis
mv -f _arm_addsubdf3.visT _arm_addsubdf3.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_fixunsdfsi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/=
 && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_fi=
xunsdfsi.visT
mv -f _arm_muldivdf3.visT _arm_muldivdf3.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_truncdfsf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/=
 && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_tr=
uncdfsf2.visT
mv -f _arm_cmpdf2.visT _arm_cmpdf2.vis
mv -f _arm_unorddf2.visT _arm_unorddf2.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_negsf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && =
$3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_negsf2=
.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_addsubsf3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_add=
subsf3.visT
mv -f _arm_fixdfsi.visT _arm_fixdfsi.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_muldivsf3_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_mul=
divsf3.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_cmpsf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && =
$3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_cmpsf2=
.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_unordsf2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &=
& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_unor=
dsf2.visT
mv -f _arm_fixunsdfsi.visT _arm_fixunsdfsi.vis
mv -f _arm_truncdfsf2.visT _arm_truncdfsf2.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_fixsfsi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &&=
 $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_fixsf=
si.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_fixunssfsi_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/=
 && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_fi=
xunssfsi.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_floatdidf_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_flo=
atdidf.visT
mv -f _arm_addsubsf3.visT _arm_addsubsf3.vis
mv -f _arm_negsf2.visT _arm_negsf2.vis
mv -f _arm_cmpsf2.visT _arm_cmpsf2.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_floatdisf_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_flo=
atdisf.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_floatundidf_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$=
/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_f=
loatundidf.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _arm_floatundisf_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$=
/ && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _arm_f=
loatundisf.visT
mv -f _arm_muldivsf3.visT _arm_muldivsf3.vis
mv -f _arm_floatdidf.visT _arm_floatdidf.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _clzsi2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 !=
~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _clzsi2.visT
mv -f _arm_fixunssfsi.visT _arm_fixunssfsi.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _clzdi2_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3 !=
~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _clzdi2.visT
mv -f _arm_fixsfsi.visT _arm_fixsfsi.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _aeabi_lcmp_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && =
$3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _aeabi_lcmp=
.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _aeabi_ulcmp_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &&=
 $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _aeabi_ulc=
mp.visT
mv -f _arm_unordsf2.visT _arm_unordsf2.vis
mv -f _arm_floatdisf.visT _arm_floatdisf.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _aeabi_ldivmod_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ =
&& $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _aeabi_l=
divmod.visT
mv -f _arm_floatundidf.visT _arm_floatundidf.vis
mv -f _arm_floatundisf.visT _arm_floatundisf.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _aeabi_uldivmod_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/=
 && $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _aeabi_=
uldivmod.visT
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _dvmd_lnx_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ && $3=
 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _dvmd_lnx.vis=
T
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/nm -pg _clear_cache_s.o | gawk 'NF =3D=3D 3 && $2 !~ /^[UN]$/ &&=
 $3 !~ /.*_compat/ && $3 !~ /.*@.*/ { print "\t.hidden", $3 }' > _clear_cac=
he.visT
mv -f _clzsi2.visT _clzsi2.vis
mv -f _clzdi2.visT _clzdi2.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _muldi3.o -MT _muldi3.o=
 -MD -MP -MF _muldi3.dep -DL_muldi3 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -DHID=
E_EXPORTS
mv -f _aeabi_ulcmp.visT _aeabi_ulcmp.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _negdi2.o -MT _negdi2.o=
 -MD -MP -MF _negdi2.dep -DL_negdi2 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -DHID=
E_EXPORTS
mv -f _aeabi_lcmp.visT _aeabi_lcmp.vis
mv -f _aeabi_ldivmod.visT _aeabi_ldivmod.vis
mv -f _aeabi_uldivmod.visT _aeabi_uldivmod.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _cmpdi2.o -MT _cmpdi2.o=
 -MD -MP -MF _cmpdi2.dep -DL_cmpdi2 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-=
shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -DHID=
E_EXPORTS
mv -f _dvmd_lnx.visT _dvmd_lnx.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _ucmpdi2.o -MT _ucmpdi2=
.o -MD -MP -MF _ucmpdi2.dep -DL_ucmpdi2 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -=
DHIDE_EXPORTS
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _trampoline.o -MT _tram=
poline.o -MD -MP -MF _trampoline.dep -DL_trampoline -c /mnt/SSD/oe-r0005/cc=
oR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibilit=
y=3Dhidden -DHIDE_EXPORTS
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o __main.o -MT __main.o -=
MD -MP -MF __main.dep -DL__main -c /mnt/SSD/oe-r0005/ccoR0005/tmp/work-shar=
ed/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -DHIDE_EX=
PORTS
mv -f _clear_cache.visT _clear_cache.vis
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _absvsi2.o -MT _absvsi2=
.o -MD -MP -MF _absvsi2.dep -DL_absvsi2 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -=
DHIDE_EXPORTS
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/gc=
c-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.arm-oecore-linux-gnu=
eabi/./gcc/xgcc -B/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecor=
e-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_64-linux.ar=
m-oecore-linux-gnueabi/./gcc/ -march=3Darmv7-a     -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon  -isystem/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroot=
s/beaglebone/usr/include -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-l=
inux/usr/arm-oecore-linux-gnueabi/bin/ -B/mnt/SSD/oe-r0005/ccoR0005/tmp/sys=
roots/x86_64-linux/usr/arm-oecore-linux-gnueabi/lib/ -isystem /mnt/SSD/oe-r=
0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oecore-linux-gnueabi/includ=
e -isystem /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-linux/usr/arm-oec=
ore-linux-gnueabi/sys-include --sysroot=3D/mnt/SSD/oe-r0005/ccoR0005/tmp/wo=
rk/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7=
.2/build.x86_64-linux.arm-oecore-linux-gnueabi/tmpsysroot   -g -Os -O2  -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wno-narrowing -Wwrite-s=
trings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition  -isystem ./include   -fPIC -fno-inline -g -DIN_LIBGCC2 -fbuilding-=
libgcc -fno-stack-protector -Dinhibit_libc  -fPIC -fno-inline -I. -I. -I../=
.././gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7=
.2/libgcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.=
7.2/libgcc/. -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc=
-4.7.2/libgcc/../gcc -I/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2=
-r19/gcc-4.7.2/libgcc/../include  -DHAVE_CC_TLS  -o _absvdi2.o -MT _absvdi2=
.o -MD -MP -MF _absvdi2.dep -DL_absvdi2 -c /mnt/SSD/oe-r0005/ccoR0005/tmp/w=
ork-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/libgcc2.c -fvisibility=3Dhidden -=
DHIDE_EXPORTS
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/l=
ibgcc2.c: In function '__absvdi2':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work-shared/gcc-4.7.2-r19/gcc-4.7.2/libgcc/l=
ibgcc2.c:273:1: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[1]: *** [_absvdi2.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-=
neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/gcc-4.7.2/build.x86_6=
4-linux.arm-oecore-linux-gnueabi/arm-oecore-linux-gnueabi/libgcc'
make: *** [all-target-libgcc] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see /mnt/SSD/oe-r0005/ccoR0005/tmp/work=
/armv7a-vfp-neon-oecore-linux-gnueabi/gcc-cross-initial/4.7.2-r19/temp/log.=
do_compile.25230 for further information)

--------------090306080002080804080700--
