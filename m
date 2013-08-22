Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 184DB6B3B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:54:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2013 14:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,936,1367996400"; d="scan'208";a="391839034"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2013 14:54:18 -0700
Message-ID: <5216888A.6050200@linux.intel.com>
Date: Thu, 22 Aug 2013 14:54:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
In-Reply-To: <39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: Upgrade to version 14
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
X-List-Received-Date: Thu, 22 Aug 2013 21:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2013 09:31 PM, Khem Raj wrote:
> The update is a requirement for systemd-206
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-kernel/kmod/kmod-native_git.bb        |  1 -
>   meta/recipes-kernel/kmod/kmod.inc                  |  9 ++++----
>   ...-man-page-generation-because-we-don-t-hav.patch | 26 ----------------------
>   .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        | 16 ++++++-------
>   meta/recipes-kernel/kmod/kmod_git.bb               |  3 +--
>   5 files changed, 13 insertions(+), 42 deletions(-)
>   delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
>

Did you build the native version?  I am seeing failures in MUT on the 
autobuilder. It did pass my "sniff" test on my 2 local world builds.

> | x86_64-linux-libtool: link: gcc -std=gnu99 -pipe -DANOTHER_BRICK_IN_THE -Wall -W -Wextra -Wno-inline -Wvla -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wnested-externs -Wchar-subscripts -Wtype-limits -Wuninitialized -fno-common -fdiagnostics-show-option -fvisibility=hidden -ffunction-sections -fdata-sections -isystem/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wl,--as-needed -Wl,--gc-sections -Wl,-rpath-link -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux
/usr/lib -Wl,-rpath-link -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/lib -Wl,-rpath -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o tools/test/kmod tools/kmod.o tools/lsmod.o tools/rmmod.o tools/insmod.o tools/modinfo.o tools/modprobe.o tools/depmod.o tools/log.o tools/static-nodes.o  -L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib -L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/lib libkmod/.libs/libkmod-util.a libkmod/.libs/libkmod-private.a
                        Nice ester egg                ^^^^^^^^^^^^^^^^
> | tools/kmod.o: In function `kmod_help':
> | kmod.c:(.text.kmod_help+0x27): undefined reference to `_Static_assert'
> | kmod.c:(.text.kmod_help+0x5c): undefined reference to `_Static_assert'
> | kmod.c:(.text.kmod_help+0x7f): undefined reference to `_Static_assert'
> | kmod.c:(.text.kmod_help+0xb9): undefined reference to `_Static_assert'
> | tools/kmod.o: In function `main':
> | kmod.c:(.text.main+0x5b): undefined reference to `_Static_assert'
> | tools/kmod.o:kmod.c:(.text.main+0x8c): more undefined references to `_Static_assert' follow
> | collect2: ld returned 1 exit status
> | make[2]: *** [tools/test/kmod] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | x86_64-linux-libtool: link: gcc -std=gnu99 -pipe -DANOTHER_BRICK_IN_THE -Wall -W -Wextra -Wno-inline -Wvla -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wnested-externs -Wchar-subscripts -Wtype-limits -Wuninitialized -fno-common -fdiagnostics-show-option -fvisibility=hidden -ffunction-sections -fdata-sections -isystem/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wl,--as-needed -Wl,--gc-sections -Wl,-rpath-link -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux
/usr/lib -Wl,-rpath-link -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/lib -Wl,-rpath -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o tools/.libs/kmod tools/kmod.o tools/lsmod.o tools/rmmod.o tools/insmod.o tools/modinfo.o tools/modprobe.o tools/depmod.o tools/log.o tools/static-nodes.o  -L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib -L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/lib libkmod/.libs/libkmod-util.a libkmod/.libs/libkmod.so -Wl,-rpath -Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib
> | tools/kmod.o: In function `kmod_help':
> | kmod.c:(.text.kmod_help+0x27): undefined reference to `_Static_assert'
> | kmod.c:(.text.kmod_help+0x5c): undefined reference to `_Static_assert'
> | kmod.c:(.text.kmod_help+0x7f): undefined reference to `_Static_assert'
> | kmod.c:(.text.kmod_help+0xb9): undefined reference to `_Static_assert'
> | tools/kmod.o: In function `main':
> | kmod.c:(.text.main+0x5b): undefined reference to `_Static_assert'
> | tools/kmod.o:kmod.c:(.text.main+0x8c): more undefined references to `_Static_assert' follow
> | collect2: ld returned 1 exit status
> | make[2]: *** [tools/kmod] Error 1


Sau!


> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
> index 8cbcdf8..afa3ad0 100644
> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -4,7 +4,6 @@
>   require kmod.inc
>   inherit native
>
> -PR = "${INC_PR}.1"
>   SRC_URI += "file://fix-undefined-O_CLOEXEC.patch"
>
>   do_install_append (){
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
> index a780b6c..1728a4e 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -7,8 +7,6 @@ HOMEPAGE = "http://packages.profusion.mobi/kmod/"
>   LICENSE = "GPL-2.0+ & LGPL-2.1+"
>   LICENSE_libkmod = "LGPL-2.1+"
>   SECTION = "base"
> -PV = "9"
> -INC_PR = "r0"
>
>   DEPENDS += "pkgconfig-native"
>
> @@ -19,17 +17,18 @@ inherit autotools gtk-doc ptest
>
>   SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
>              file://depmod-search.conf \
> -           file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
>              file://run-ptest \
>              file://ptest.patch \
>             "
>
> -SRCREV = "62081c0f68905b22f375156d4532fd37fa5c8d33"
> +SRCREV = "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
> +# Lookout for PV bump too when SRCREV is changed
> +PV = "14"
>
>   S = "${WORKDIR}/git"
>
>   EXTRA_AUTORECONF += "--install --symlink"
> -EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools"
> +EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools --disable-manpages"
>
>   do_configure_prepend () {
>           gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
> diff --git a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch b/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
> deleted file mode 100644
> index 5361b84..0000000
> --- a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From ce6f0cabb65e67dd4d31e1e555db8bc6eaf435d3 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Fri, 24 Feb 2012 07:35:38 +0100
> -Subject: [PATCH] man: disable man page generation because we don't have
> - working xsltproc
> -
> -Upstream-Status: Inappropriate [build system specific change]
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Makefile.am |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 141c102..a8bdfd1 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,4 +1,4 @@
> --SUBDIRS = . libkmod/docs man
> -+SUBDIRS = . libkmod/docs
> -
> - DISTCLEAN_LOCAL_HOOKS =
> - EXTRA_DIST =
> ---
> -1.7.8.4
> -
> diff --git a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> index 3177e9a..0268216 100644
> --- a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> +++ b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> @@ -2,16 +2,16 @@ Upstream-Status: Not applicable
>
>   Index: git/libkmod/libkmod-private.h
>   ===================================================================
> ---- git.orig/libkmod/libkmod-private.h
> -+++ git/libkmod/libkmod-private.h
> -@@ -1,6 +1,10 @@
> - #ifndef _LIBKMOD_PRIVATE_H_
> - #define _LIBKMOD_PRIVATE_H_
> +--- git.orig/libkmod/libkmod-private.h	2013-08-21 10:07:51.000000000 -0700
> ++++ git/libkmod/libkmod-private.h	2013-08-21 14:34:04.558278849 -0700
> +@@ -9,6 +9,10 @@
> + #include "macro.h"
> + #include "libkmod.h"
>
>   +#ifndef O_CLOEXEC
>   +# define O_CLOEXEC 0
>   +#endif
>   +
> - #include <stdbool.h>
> - #include <stdio.h>
> - #include <syslog.h>
> + static _always_inline_ _printf_format_(2, 3) void
> + 	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
> +
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> index f92ff72..b07c06e 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -3,8 +3,7 @@
>
>   require kmod.inc
>
> -PR = "${INC_PR}.0"
> -PV = "9+git${SRCPV}"
> +PV_append = "+git${SRCPV}"
>
>   PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
>   RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
>

