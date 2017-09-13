Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 699A87867D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:56:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i131so1551445wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dgk8EeXTPbIHk8Cl9BLTeukW8ToFBvp4LeLc8fA/uKo=;
	b=Hvck4e0An0nFia+4BsIixgz1sG+8EW6HIr7t0qEQjjjuiz8DgdF79w3Xg7HAmlcWUl
	TUIkENAh2XsHFFO+qdfgUPmaRoQu8dmBWshTwE+J82aLqHl5MdQv9kRQoh5xwnbLLtIJ
	oczAbzTC3CqiJmseN6OOC3TDvOJGiCkymQand2HIteFpi2j4OaEv62D5wA7wKOdPwMTf
	vIhgX57RBqV47EyvpB/h+lvR2NhEKZETEo9hXY95TD+KYzbE9KVRPZAf3AgwqxPnP4Vw
	dkZas7LgqFeQiXYebkRPf/Rnjjarzevr0yj8Anpy/BEWPIxccusX4TXAoW+iCmclxI4S
	x01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dgk8EeXTPbIHk8Cl9BLTeukW8ToFBvp4LeLc8fA/uKo=;
	b=M09iqb4hTz+fMEcih+kfacefZr7y7F0NJ/KktpCiuLezvKEl2Z+jUUtQL9DNCwpuwe
	olEI+uVXLNrr3xTZQAVKltqJW1572ALkIvsF08S8Lb3ARomyUBNzt+or+WBFH+z5iUG1
	RPRFwL+6ody6jHXNemBtaTP1uRZfPQ6qNhwe+/tltia1X2bveuJ/1KOjY5AsZi/HE2Kz
	rPqnuCOo01258VvU4ZPACyoRcAGJ0Lc2NV34L5CxIRcTdeNU5a44xGfTMPAMWhzRtYXU
	EfVaMbkX+agF8y2qeQYdp39XEQKLhTQMN6RXIn9nNFeB51injKTG1+a8YVgpVlFwdxfG
	Xusg==
X-Gm-Message-State: AHPjjUi+6T3i0Llsah+BcaJuXmQn1tVHdaTR96XDKBdF+R6hCl3GWhcQ
	LzxmG6t9xHPKzNNXYFKEepVTKlbwpKHrEAWMVs0g+qeK
X-Google-Smtp-Source: AOwi7QADVhYminqcp76dmJZxWgAKXDZPHSspEwnRXlQAQeuxxc9rqxywk3AlyqHJtYZeVwZ3goc749ddBdDP3mg9wok=
X-Received: by 10.28.135.209 with SMTP id j200mr28589wmd.40.1505336188934;
	Wed, 13 Sep 2017 13:56:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Wed, 13 Sep 2017 13:55:58 -0700 (PDT)
In-Reply-To: <CAJTo0LbmEOd=9_W4ru7=1VUY1c0eyOmEzr3rFvwsXnC_ftA1-w@mail.gmail.com>
References: <20170905150847.32681-1-ross.burton@intel.com>
	<CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
	<CAJTo0LbmEOd=9_W4ru7=1VUY1c0eyOmEzr3rFvwsXnC_ftA1-w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Sep 2017 13:55:58 -0700
Message-ID: <CAKmqyKN-kxvENCrxR1bQ5Z7YDe5wO57GRgYZVmmy8-0eUOOicA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: recommend shared-mime-info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 20:56:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 1:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Can you share a log showing that?

This is the full log, so it's not just OpenSSL:

alistai@xsjalistai50:/scratch/alistai/yocto/oe-master/build (master)*$
SDKMACHINE="x86_64-mingw32" bitbake buildtools-tarball
Loading cache: 100%
|###################################################################################################|
Time: 0:00:00
Loaded 2759 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.35.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "ubuntu-17.04"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:de70799af1a8bfe2fac22b90401053275d4714ba"
meta-xilinx       = "master:74a0d90e52cca346d05a69bbd628c6ec9e49fbcb"
meta-oe
meta-python
meta-networking   = "master:8b991640f19f1d19b17db141c31bc56e26695a23"
meta-virtualization = "master:ba35378ce5e24f2bfcb85caa806774b873983d9f"
meta-mingw        = "master:52515d8bee445d728d5fe63bfcbca79b5d8ea250"

Initialising tasks: 100%
|##############################################################################################|
Time: 0:00:01
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: nativesdk-openssl-1.0.2l-r0 do_configure: Function failed:
do_configure (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-openssl/1.0.2l-r0/temp/log.do_configure.14481)
ERROR: Logfile of failure stored in:
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-openssl/1.0.2l-r0/temp/log.do_configure.14481
Log data follows:
| DEBUG: Executing shell function do_configure
| Usage: Configure [no-<cipher> ...] [enable-<cipher> ...]
[experimental-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx]
[no-hw-xxx|no-hw] [[no-]threads] [[no-]shared]
[[no-]zlib|zlib-dynamic] [no-asm] [no-dso] [no-krb5] [sctp] [386]
[--prefix=DIR] [--openssldir=OPENSSLDIR] [--with-xxx[=vvv]]
[--test-sanity] os/compiler[:flags]
|
| pick os/compiler from:
| BC-32 BS2000-OSD BSD-generic32 BSD-generic64 BSD-ia64 BSD-sparc64 BSD-sparcv8
| BSD-x86 BSD-x86-elf BSD-x86_64 Cygwin Cygwin-x86_64 DJGPP MPE/iX-gcc OS2-EMX
| OS390-Unix QNX6 QNX6-i386 ReliantUNIX SINIX SINIX-N UWIN VC-CE VC-WIN32
| VC-WIN64A VC-WIN64I aix-cc aix-gcc aix3-cc aix64-cc aix64-gcc android
| android-armv7 android-mips android-x86 aux3-gcc beos-x86-bone beos-x86-r5
| bsdi-elf-gcc cc cray-j90 cray-t3e darwin-i386-cc darwin-ppc-cc darwin64-ppc-cc
| darwin64-x86_64-cc debian-alpha debian-alpha-ev4 debian-alpha-ev5 debian-amd64
| debian-arm64 debian-armel debian-armhf debian-avr32 debian-hppa
| debian-hurd-i386 debian-i386 debian-i386-i486 debian-i386-i586
| debian-i386-i686/cmov debian-ia64 debian-kfreebsd-amd64 debian-kfreebsd-i386
| debian-m32r debian-m68k debian-mips debian-mips64 debian-mips64el
| debian-mipsel debian-mipsn32 debian-mipsn32el debian-netbsd-i386
| debian-netbsd-m68k debian-netbsd-sparc debian-openbsd-alpha
| debian-openbsd-i386 debian-openbsd-mips debian-or1k debian-powerpc
| debian-powerpcspe debian-ppc64 debian-ppc64el debian-s390 debian-s390x
| debian-sh3 debian-sh3eb debian-sh4 debian-sh4eb debian-sparc debian-sparc-v8
| debian-sparc-v9 debian-sparc64 debian-x32 dgux-R3-gcc dgux-R4-gcc
| dgux-R4-x86-gcc dist gcc hpux-cc hpux-gcc hpux-ia64-cc hpux-ia64-gcc
| hpux-parisc-cc hpux-parisc-cc-o4 hpux-parisc-gcc hpux-parisc1_1-cc
| hpux-parisc1_1-gcc hpux-parisc2-cc hpux-parisc2-gcc hpux64-ia64-cc
| hpux64-ia64-gcc hpux64-parisc2-cc hpux64-parisc2-gcc hurd-x86 iphoneos-cross
| irix-cc irix-gcc irix-mips3-cc irix-mips3-gcc irix64-mips4-cc irix64-mips4-gcc
| linux-aarch64 linux-alpha+bwx-ccc linux-alpha+bwx-gcc linux-alpha-ccc
| linux-alpha-gcc linux-aout linux-armv4 linux-avr32 linux-elf linux-elf-arm
| linux-elf-armeb linux-generic32 linux-generic64 linux-gnueabi-arm
| linux-gnueabi-armeb linux-ia32-icc linux-ia64 linux-ia64-icc linux-mips
| linux-mips32 linux-mips64 linux-mips64el linux-mipsel linux-musleabi-arm
| linux-musleabi-armeb linux-ppc linux-ppc64 linux-ppc64le linux-sparcv8
| linux-sparcv9 linux-x32 linux-x86_64 linux-x86_64-clang linux-x86_64-icc
| linux32-s390x linux64-mips64 linux64-s390x linux64-sparcv9 mingw mingw64
| ncr-scde netware-clib netware-clib-bsdsock netware-clib-bsdsock-gcc
| netware-clib-gcc netware-libc netware-libc-bsdsock netware-libc-bsdsock-gcc
| netware-libc-gcc newsos4-gcc nextstep nextstep3.3 osf1-alpha-cc osf1-alpha-gcc
| purify qnx4 rhapsody-ppc-cc sco5-cc sco5-gcc solaris-sparcv7-cc
| solaris-sparcv7-gcc solaris-sparcv8-cc solaris-sparcv8-gcc solaris-sparcv9-cc
| solaris-sparcv9-gcc solaris-x86-cc solaris-x86-gcc solaris64-sparcv9-cc
| solaris64-sparcv9-gcc solaris64-x86_64-cc solaris64-x86_64-gcc sunos-gcc
| tandem-c89 tru64-alpha-cc uClinux-dist uClinux-dist64 ultrix-cc ultrix-gcc
| unixware-2.0 unixware-2.1 unixware-7 unixware-7-gcc vos-gcc vxworks-mips
| vxworks-ppc405 vxworks-ppc60x vxworks-ppc750 vxworks-ppc750-debug
| vxworks-ppc860 vxworks-ppcgen vxworks-simlinux debug debug-BSD-x86-elf
| debug-VC-WIN32 debug-VC-WIN64A debug-VC-WIN64I debug-ben debug-ben-darwin64
| debug-ben-debug debug-ben-debug-64 debug-ben-debug-64-clang debug-ben-macos
| debug-ben-macos-gcc46 debug-ben-no-opt debug-ben-openbsd
| debug-ben-openbsd-debug debug-ben-strict debug-bodo debug-darwin-i386-cc
| debug-darwin-ppc-cc debug-darwin64-x86_64-cc debug-geoff32 debug-geoff64
| debug-levitte-linux-elf debug-levitte-linux-elf-extreme
| debug-levitte-linux-noasm debug-levitte-linux-noasm-extreme debug-linux-elf
| debug-linux-elf-noefence debug-linux-generic32 debug-linux-generic64
| debug-linux-ia32-aes debug-linux-pentium debug-linux-ppro debug-linux-x86_64
| debug-linux-x86_64-clang debug-rse debug-solaris-sparcv8-cc
| debug-solaris-sparcv8-gcc debug-solaris-sparcv9-cc debug-solaris-sparcv9-gcc
| debug-steve-opt debug-steve32 debug-steve64 debug-vos-gcc
|
| NOTE: If in doubt, on Unix-ish systems use './config'.
| Configuring for mingw32-x86_64
| WARNING: /scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-openssl/1.0.2l-r0/temp/run.do_configure.14481:1
exit 1 from 'perl ./Configure -no-ssl3 shared --prefix=$useprefix
--openssldir=/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib/ssl
--libdir=`basename
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib`
$target'
| ERROR: Function failed: do_configure (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-openssl/1.0.2l-r0/temp/log.do_configure.14481)
ERROR: Task (virtual:nativesdk:/scratch/alistai/yocto/oe-master/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb:do_configure)
failed with exit code '1'
ERROR: nativesdk-ncurses-6.0+20170715-r0 do_compile: oe_runmake failed
ERROR: nativesdk-ncurses-6.0+20170715-r0 do_compile: Function failed:
do_compile (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/temp/log.do_compile.14480)
ERROR: Logfile of failure stored in:
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/temp/log.do_compile.14480
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-mingw', 'bit-64',
'x86_64-mingw32', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 20 -C narrowc libs
| make: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/build/narrowc'
| cd include && make DESTDIR=""
RPATH_LIST="/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib"
libs
| make[1]: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/build/narrowc/include'
| make[1]: Nothing to be done for 'libs'.
| make[1]: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/build/narrowc/include'
| cd ncurses && make DESTDIR=""
RPATH_LIST="/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/lib"
libs
| make[1]: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/build/narrowc/ncurses'
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/access.c -o ../obj_s/access.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/add_tries.c -o ../obj_s/add_tries.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/alloc_ttype.c -o ../obj_s/alloc_ttype.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c ../ncurses/codes.c -o
../obj_s/codes.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../ncurses/comp_captab.c -o ../obj_s/comp_captab.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/comp_error.c -o ../obj_s/comp_error.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/comp_hash.c -o ../obj_s/comp_hash.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/db_iterator.c -o ../obj_s/db_iterator.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/doalloc.c -o ../obj_s/doalloc.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/entries.c -o ../obj_s/entries.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c ../ncurses/fallback.c
-o ../obj_s/fallback.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/free_ttype.c -o ../obj_s/free_ttype.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/getenv_num.c -o ../obj_s/getenv_num.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/home_terminfo.c -o ../obj_s/home_terminfo.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/init_keytry.c -o ../obj_s/init_keytry.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/lib_acs.c -o ../obj_s/lib_acs.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/lib_baudrate.c -o ../obj_s/lib_baudrate.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/lib_cur_term.c -o ../obj_s/lib_cur_term.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/lib_data.c -o ../obj_s/lib_data.o
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/recipe-sysroot
-DHAVE_CONFIG_H -I../ncurses -I. -I../../../git/ncurses -I../include
-I../../../git/ncurses/../include -D_XOPEN_SOURCE=500
-D_POSIX_C_SOURCE=199506L -D_FILE_OFFSET_BITS=64  -DNDEBUG
-DWINVER=0x0501 -DWIN32_LEAN_AND_MEAN -O2 -pipe --param
max-inline-insns-single=1200  -DUSE_TERMLIB -c
../../../git/ncurses/tinfo/lib_has_cap.c -o ../obj_s/lib_has_cap.o
| In file included from ../ncurses/codes.c:3:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1060: recipe for target '../obj_s/codes.o' failed
| make[1]: *** [../obj_s/codes.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| In file included from ../../../git/ncurses/tinfo/alloc_ttype.c:41:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| In file included from ../../../git/ncurses/tinfo/init_keytry.c:29:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1115: recipe for target '../obj_s/init_keytry.o' failed
| make[1]: *** [../obj_s/init_keytry.o] Error 1
| In file included from ../ncurses/comp_captab.c:11:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| In file included from ../ncurses/fallback.c:7:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1056: recipe for target '../obj_s/alloc_ttype.o' failed
| make[1]: *** [../obj_s/alloc_ttype.o] Error 1
| Makefile:1066: recipe for target '../obj_s/comp_captab.o' failed
| make[1]: *** [../obj_s/comp_captab.o] Error 1
| Makefile:1095: recipe for target '../obj_s/fallback.o' failed
| make[1]: *** [../obj_s/fallback.o] Error 1
| In file included from ../../../git/ncurses/tinfo/doalloc.c:40:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1086: recipe for target '../obj_s/doalloc.o' failed
| make[1]: *** [../obj_s/doalloc.o] Error 1
| In file included from ../../../git/ncurses/tinfo/entries.c:34:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1091: recipe for target '../obj_s/entries.o' failed
| make[1]: *** [../obj_s/entries.o] Error 1
| In file included from ../../../git/ncurses/tinfo/db_iterator.c:37:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1082: recipe for target '../obj_s/db_iterator.o' failed
| make[1]: *** [../obj_s/db_iterator.o] Error 1
| In file included from ../../../git/ncurses/tinfo/lib_acs.c:36:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1119: recipe for target '../obj_s/lib_acs.o' failed
| make[1]: *** [../obj_s/lib_acs.o] Error 1
| In file included from ../../../git/ncurses/tinfo/getenv_num.c:37:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| In file included from ../../../git/ncurses/tinfo/comp_hash.c:42:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| In file included from ../../../git/ncurses/tinfo/free_ttype.c:41:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1077: recipe for target '../obj_s/comp_hash.o' failed
| make[1]: *** [../obj_s/comp_hash.o] Error 1
| In file included from ../../../git/ncurses/tinfo/comp_error.c:40:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1100: recipe for target '../obj_s/free_ttype.o' failed
| make[1]: *** [../obj_s/free_ttype.o] Error 1
| Makefile:1071: recipe for target '../obj_s/comp_error.o' failed
| make[1]: *** [../obj_s/comp_error.o] Error 1
| Makefile:1104: recipe for target '../obj_s/getenv_num.o' failed
| make[1]: *** [../obj_s/getenv_num.o] Error 1
| In file included from ../../../git/ncurses/tinfo/lib_cur_term.c:39:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| In file included from ../../../git/ncurses/tinfo/home_terminfo.c:37:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1129: recipe for target '../obj_s/lib_cur_term.o' failed
| make[1]: *** [../obj_s/lib_cur_term.o] Error 1
| Makefile:1109: recipe for target '../obj_s/home_terminfo.o' failed
| make[1]: *** [../obj_s/home_terminfo.o] Error 1
| In file included from ../../../git/ncurses/tinfo/lib_has_cap.c:43:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| In file included from ../../../git/ncurses/tinfo/lib_data.c:43:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1137: recipe for target '../obj_s/lib_has_cap.o' failed
| make[1]: *** [../obj_s/lib_has_cap.o] Error 1
| In file included from ../../../git/ncurses/tinfo/lib_baudrate.c:40:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1133: recipe for target '../obj_s/lib_data.o' failed
| make[1]: *** [../obj_s/lib_data.o] Error 1
| Makefile:1124: recipe for target '../obj_s/lib_baudrate.o' failed
| make[1]: *** [../obj_s/lib_baudrate.o] Error 1
| In file included from ../../../git/ncurses/tinfo/add_tries.c:40:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1051: recipe for target '../obj_s/add_tries.o' failed
| make[1]: *** [../obj_s/add_tries.o] Error 1
| In file included from ../../../git/ncurses/tinfo/access.c:33:0:
| ../../../git/ncurses/curses.priv.h:115:10: fatal error: sys/poll.h:
No such file or directory
|  #include <sys/poll.h>
|           ^~~~~~~~~~~~
| compilation terminated.
| Makefile:1047: recipe for target '../obj_s/access.o' failed
| make[1]: *** [../obj_s/access.o] Error 1
| make[1]: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/build/narrowc/ncurses'
| Makefile:138: recipe for target 'libs' failed
| make: *** [libs] Error 2
| make: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/build/narrowc'
| ERROR: oe_runmake failed
| WARNING: /scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/temp/run.do_compile.14480:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-ncurses/6.0+20170715-r0/temp/log.do_compile.14480)
ERROR: Task (virtual:nativesdk:/scratch/alistai/yocto/oe-master/meta/recipes-core/ncurses/ncurses_6.0+20170715.bb:do_compile)
failed with exit code '1'
ERROR: nativesdk-db-1_5.3.28-r1 do_compile: oe_runmake failed
ERROR: nativesdk-db-1_5.3.28-r1 do_compile: Function failed:
do_compile (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/temp/log.do_compile.14483)
ERROR: Logfile of failure stored in:
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/temp/log.do_compile.14483
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 20 LIBTOOL=./x86_64-oesdk-mingw32-libtool
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/mutex/mut_tas.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/mutex/mut_pthread.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_compare.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_compress.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_conv.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_curadj.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_cursor.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_delete.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_method.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_open.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe  ../db-5.3.28/src/btree/bt_put.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe  ../db-5.3.28/src/btree/bt_rec.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_reclaim.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_recno.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_rsearch.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_search.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_split.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_stat.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_compact.c
| ./x86_64-oesdk-mingw32-libtool --tag=CC --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src   -O2 -pipe
../db-5.3.28/src/btree/bt_upgrade.c
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_curadj.c
 -DDLL_EXPORT -DPIC -o .libs/bt_curadj.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/btree/bt_compress.c  -DDLL_EXPORT -DPIC -o
.libs/bt_compress.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_conv.c
-DDLL_EXPORT -DPIC -o .libs/bt_conv.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_recno.c
-DDLL_EXPORT -DPIC -o .libs/bt_recno.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/btree/bt_compare.c  -DDLL_EXPORT -DPIC -o
.libs/bt_compare.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_open.c
-DDLL_EXPORT -DPIC -o .libs/bt_open.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/btree/bt_upgrade.c  -DDLL_EXPORT -DPIC -o
.libs/bt_upgrade.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/btree/bt_rsearch.c  -DDLL_EXPORT -DPIC -o
.libs/bt_rsearch.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_put.c
-DDLL_EXPORT -DPIC -o .libs/bt_put.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_delete.c
 -DDLL_EXPORT -DPIC -o .libs/bt_delete.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/mutex/mut_pthread.c  -DDLL_EXPORT -DPIC -o
.libs/mut_pthread.o
| In file included from ../db-5.3.28/src/btree/bt_curadj.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_rec.c
-DDLL_EXPORT -DPIC -o .libs/bt_rec.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/btree/bt_compact.c  -DDLL_EXPORT -DPIC -o
.libs/bt_compact.o
| Makefile:1855: recipe for target 'bt_curadj.lo' failed
| make: *** [bt_curadj.lo] Error 1
| make: *** Waiting for unfinished jobs....
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_method.c
 -DDLL_EXPORT -DPIC -o .libs/bt_method.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe
../db-5.3.28/src/btree/bt_reclaim.c  -DDLL_EXPORT -DPIC -o
.libs/bt_reclaim.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_stat.c
-DDLL_EXPORT -DPIC -o .libs/bt_stat.o
| In file included from ../db-5.3.28/src/btree/bt_recno.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_rsearch.c:43:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_compress.c:9:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1871: recipe for target 'bt_recno.lo' failed
| make: *** [bt_recno.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_compare.c:46:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_conv.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| In file included from ../db-5.3.28/src/btree/bt_open.c:46:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/mutex/mut_tas.c
-DDLL_EXPORT -DPIC -o .libs/mut_tas.o
| In file included from ../db-5.3.28/src/mutex/mut_pthread.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| compilation terminated.
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_put.c:46:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_delete.c:46:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_split.c
-DDLL_EXPORT -DPIC -o .libs/bt_split.o
| In file included from ../db-5.3.28/src/btree/bt_reclaim.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_cursor.c
 -DDLL_EXPORT -DPIC -o .libs/bt_cursor.o
| Makefile:2201: recipe for target 'mut_pthread.lo' failed
| make: *** [mut_pthread.lo] Error 1
| Makefile:1853: recipe for target 'bt_conv.lo' failed
| make: *** [bt_conv.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_rec.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1865: recipe for target 'bt_put.lo' failed
| make: *** [bt_put.lo] Error 1
| Makefile:1849: recipe for target 'bt_compare.lo' failed
| make: *** [bt_compare.lo] Error 1
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/recipe-sysroot
-c -I. -I../db-5.3.28/src -O2 -pipe ../db-5.3.28/src/btree/bt_search.c
 -DDLL_EXPORT -DPIC -o .libs/bt_search.o
| Makefile:1859: recipe for target 'bt_delete.lo' failed
| make: *** [bt_delete.lo] Error 1
| Makefile:1869: recipe for target 'bt_reclaim.lo' failed
| make: *** [bt_reclaim.lo] Error 1
| Makefile:1867: recipe for target 'bt_rec.lo' failed
| make: *** [bt_rec.lo] Error 1
| Makefile:1873: recipe for target 'bt_rsearch.lo' failed
| make: *** [bt_rsearch.lo] Error 1
| Makefile:1851: recipe for target 'bt_compress.lo' failed
| make: *** [bt_compress.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_upgrade.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1883: recipe for target 'bt_upgrade.lo' failed
| make: *** [bt_upgrade.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_stat.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_method.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1879: recipe for target 'bt_stat.lo' failed
| make: *** [bt_stat.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_compact.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1861: recipe for target 'bt_method.lo' failed
| make: *** [bt_method.lo] Error 1
| Makefile:1881: recipe for target 'bt_compact.lo' failed
| make: *** [bt_compact.lo] Error 1
| In file included from ../db-5.3.28/src/mutex/mut_tas.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1863: recipe for target 'bt_open.lo' failed
| make: *** [bt_open.lo] Error 1
| Makefile:2209: recipe for target 'mut_tas.lo' failed
| make: *** [mut_tas.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_cursor.c:11:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| In file included from ../db-5.3.28/src/btree/bt_split.c:43:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1857: recipe for target 'bt_cursor.lo' failed
| make: *** [bt_cursor.lo] Error 1
| Makefile:1877: recipe for target 'bt_split.lo' failed
| make: *** [bt_split.lo] Error 1
| In file included from ../db-5.3.28/src/btree/bt_search.c:46:0:
| ./db_int.h:45:10: fatal error: sys/uio.h: No such file or directory
|  #include <sys/uio.h>
|           ^~~~~~~~~~~
| compilation terminated.
| Makefile:1875: recipe for target 'bt_search.lo' failed
| make: *** [bt_search.lo] Error 1
| ERROR: oe_runmake failed
| WARNING: /scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/temp/run.do_compile.14483:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-db/1_5.3.28-r1/temp/log.do_compile.14483)
ERROR: nativesdk-gdbm-1.13-r0 do_compile: oe_runmake failed
ERROR: nativesdk-gdbm-1.13-r0 do_compile: Function failed: do_compile
(log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/temp/log.do_compile.14482)
ERROR: Logfile of failure stored in:
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/temp/log.do_compile.14482
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-mingw', 'bit-64',
'x86_64-mingw32', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 20
| make  all-recursive
| make[1]: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build'
| Making all in po
| make[2]: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build/po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build/po'
| Making all in src
| make[2]: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build/src'
| make  all-am
| make[3]: Entering directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build/src'
| ../x86_64-oesdk-mingw32-libtool  --tag=CC   --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbmdump.lo ../../gdbm-1.13/src/gdbmdump.c
| ../x86_64-oesdk-mingw32-libtool  --tag=CC   --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbmexp.lo ../../gdbm-1.13/src/gdbmexp.c
| ../x86_64-oesdk-mingw32-libtool  --tag=CC   --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbmload.lo ../../gdbm-1.13/src/gdbmload.c
| ../x86_64-oesdk-mingw32-libtool  --tag=CC   --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbmopen.lo ../../gdbm-1.13/src/gdbmopen.c
| ../x86_64-oesdk-mingw32-libtool  --tag=CC   --mode=compile
x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbmimp.lo ../../gdbm-1.13/src/gdbmimp.c
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbmtool.o ../../gdbm-1.13/src/gdbmtool.c
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o util.o ../../gdbm-1.13/src/util.c
| x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I..  -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
  -O2 -pipe -c -o gdbm_load.o ../../gdbm-1.13/src/gdbm_load.c
| ../../gdbm-1.13/src/gdbm_load.c:21:11: fatal error: pwd.h: No such
file or directory
|  # include <pwd.h>
|            ^~~~~~~
| compilation terminated.
| Makefile:701: recipe for target 'gdbm_load.o' failed
| make[3]: *** [gdbm_load.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| ../../gdbm-1.13/src/gdbmtool.c:25:10: fatal error: pwd.h: No such
file or directory
|  #include <pwd.h>
|           ^~~~~~~
| compilation terminated.
| Makefile:701: recipe for target 'gdbmtool.o' failed
| make[3]: *** [gdbmtool.o] Error 1
| ../../gdbm-1.13/src/util.c:19:10: fatal error: pwd.h: No such file
or directory
|  #include <pwd.h>
|           ^~~~~~~
| compilation terminated.
| Makefile:701: recipe for target 'util.o' failed
| make[3]: *** [util.o] Error 1
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I.. -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
-O2 -pipe -c ../../gdbm-1.13/src/gdbmopen.c  -DDLL_EXPORT -DPIC -o
.libs/gdbmopen.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I.. -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
-O2 -pipe -c ../../gdbm-1.13/src/gdbmimp.c  -DDLL_EXPORT -DPIC -o
.libs/gdbmimp.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I.. -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
-O2 -pipe -c ../../gdbm-1.13/src/gdbmexp.c  -DDLL_EXPORT -DPIC -o
.libs/gdbmexp.o
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I.. -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
-O2 -pipe -c ../../gdbm-1.13/src/gdbmload.c  -DDLL_EXPORT -DPIC -o
.libs/gdbmload.o
| ../../gdbm-1.13/src/gdbmimp.c:21:11: fatal error: arpa/inet.h: No
such file or directory
|  # include <arpa/inet.h>
|            ^~~~~~~~~~~~~
| compilation terminated.
| x86_64-oesdk-mingw32-libtool: compile:  x86_64-oesdk-mingw32-gcc
--sysroot=/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../gdbm-1.13/src -I.. -DIN_GDBM
-DLOCALEDIR=\"/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32/usr/share/locale\"
-O2 -pipe -c ../../gdbm-1.13/src/gdbmdump.c  -DDLL_EXPORT -DPIC -o
.libs/gdbmdump.o
| Makefile:715: recipe for target 'gdbmimp.lo' failed
| make[3]: *** [gdbmimp.lo] Error 1
| ../../gdbm-1.13/src/gdbmexp.c:22:11: fatal error: arpa/inet.h: No
such file or directory
|  # include <arpa/inet.h>
|            ^~~~~~~~~~~~~
| compilation terminated.
| Makefile:715: recipe for target 'gdbmexp.lo' failed
| make[3]: *** [gdbmexp.lo] Error 1
| ../../gdbm-1.13/src/gdbmopen.c:35:40: error: unknown type name
'blksize_t'; did you mean '_fsize_t'?
|  compute_directory_size (GDBM_FILE dbf, blksize_t block_size,
|                                         ^~~~~~~~~
|                                         _fsize_t
| ../../gdbm-1.13/src/gdbmopen.c: In function 'gdbm_fd_open':
| ../../gdbm-1.13/src/gdbmopen.c:189:7: warning: implicit declaration
of function 'compute_directory_size' [-Wimplicit-function-declaration]
|        compute_directory_size (dbf, block_size, &dir_size, &dir_bits);
|        ^~~~~~~~~~~~~~~~~~~~~~
| In file included from ../../gdbm-1.13/src/gdbmdefs.h:20:0,
|                  from ../../gdbm-1.13/src/gdbmopen.c:23:
| ../../gdbm-1.13/src/systems.h:78:29: warning: implicit declaration
of function 'sync' [-Wimplicit-function-declaration]
|  #  define __fsync(_dbf)   { sync(); sync(); }
|                              ^
| ../../gdbm-1.13/src/gdbmopen.c:308:7: note: in expansion of macro '__fsync'
|        __fsync (dbf);
|        ^~~~~~~
| ../../gdbm-1.13/src/gdbmload.c:21:11: fatal error: pwd.h: No such
file or directory
|  # include <pwd.h>
|            ^~~~~~~
| compilation terminated.
| ../../gdbm-1.13/src/gdbmdump.c:20:11: fatal error: pwd.h: No such
file or directory
|  # include <pwd.h>
|            ^~~~~~~
| compilation terminated.
| Makefile:715: recipe for target 'gdbmopen.lo' failed
| make[3]: *** [gdbmopen.lo] Error 1
| Makefile:715: recipe for target 'gdbmload.lo' failed
| make[3]: *** [gdbmload.lo] Error 1
| Makefile:715: recipe for target 'gdbmdump.lo' failed
| make[3]: *** [gdbmdump.lo] Error 1
| make[3]: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build/src'
| Makefile:487: recipe for target 'all' failed
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build/src'
| Makefile:458: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
'/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/build'
| Makefile:390: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: /scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/temp/run.do_compile.14482:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/x86_64-nativesdk-mingw32-oesdk-mingw32/nativesdk-gdbm/1.13-r0/temp/log.do_compile.14482)
ERROR: Task (virtual:nativesdk:/scratch/alistai/yocto/oe-master/meta/recipes-support/db/db_5.3.28.bb:do_compile)
failed with exit code '1'
ERROR: Task (virtual:nativesdk:/scratch/alistai/yocto/oe-master/meta/recipes-support/gdbm/gdbm_1.13.bb:do_compile)
failed with exit code '1'

Thanks,
Alistair

>
> On 13 September 2017 at 21:07, Alistair Francis <alistair23@gmail.com>
> wrote:
>>
>> On Tue, Sep 5, 2017 at 8:08 AM, Ross Burton <ross.burton@intel.com> wrote:
>> > Large portions of GIO are not that useful without the MIME database.
>> > Add a
>> > recommends to shared-mime-info so that GIO works out of the box, but can
>> > be
>> > removed (using BAD_RECOMMENDATIONS) if shared-mime-info is too large and
>> > isn't
>> > required.
>> >
>> > [ YOCTO #11792 ]
>> >
>> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> This patch breaks openSSL compilation when cross compiling with MinGW.
>>
>> Investigating the issue more at the moment.
>>
>> Thanks,
>> Alistair
>>
>> > ---
>> >  meta/recipes-core/glib-2.0/glib.inc | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-core/glib-2.0/glib.inc
>> > b/meta/recipes-core/glib-2.0/glib.inc
>> > index d6ef4dfc0b0..ce15ccefc39 100644
>> > --- a/meta/recipes-core/glib-2.0/glib.inc
>> > +++ b/meta/recipes-core/glib-2.0/glib.inc
>> > @@ -73,6 +73,8 @@ FILES_${PN}-codegen =
>> > "${datadir}/glib-2.0/codegen/*.py \
>> >                         ${bindir}/gdbus-codegen"
>> >  FILES_${PN}-utils = "${bindir}/*"
>> >
>> > +RRECOMMENDS_${PN} += "shared-mime-info"
>> > +
>> >  ARM_INSTRUCTION_SET_armv4 = "arm"
>> >  ARM_INSTRUCTION_SET_armv5 = "arm"
>> >  # Valgrind runtime detection works using hand-written assembly, which
>> > --
>> > 2.11.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

