Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31C0860111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 11:13:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 01 Jul 2016 04:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="131860685"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2016 04:13:47 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A6F4D2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 04:13:42 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:13:11 +0300
Message-Id: <1467371591-12270-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/6] move directfb from oe-core
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
X-List-Received-Date: Fri, 01 Jul 2016 11:13:47 -0000

Remove the directfb recipe as we are moving directfb out of oe-core

[YOCTO #8489]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../configure.in-Fix-string-argument-syntax.patch  |  28 -----
 .../directfb/directfb-examples_1.7.0.bb            |  21 ----
 meta/recipes-graphics/directfb/directfb.inc        |  80 --------------
 ...direct-Aboid-usng-VLAs-and-printf-formats.patch |  61 -----------
 .../directfb/directfb/bashism.patch                |  18 ----
 .../directfb/directfb/compar_fn_t.patch            |  62 -----------
 .../directfb/directfb/configurefix.patch           |  60 -----------
 .../fix-client-gfx_state-initialisation.patch      |  38 -------
 .../directfb/directfb/fusion.patch                 |  36 -------
 .../directfb/directfb/union-sigval.patch           |  19 ----
 .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     | 116 ---------------------
 meta/recipes-graphics/directfb/directfb_1.7.7.bb   |   8 --
 12 files changed, 547 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
 delete mode 100644 meta/recipes-graphics/directfb/directfb.inc
 delete mode 100644 meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/bashism.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/configurefix.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fusion.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/union-sigval.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.7.7.bb

diff --git a/meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch b/meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
deleted file mode 100644
index 0717ea6..0000000
--- a/meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 88077ed156a714f32bb408f422278d61611ffd41 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Sat, 26 Jul 2014 16:57:46 -0300
-Subject: [PATCH] configure.in: Fix string argument syntax
-
-Upstream-Status: Submitted
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- configure.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index bfe1b82..e939bbd 100644
---- a/configure.in
-+++ b/configure.in
-@@ -65,7 +65,7 @@ fi)
- 
- DIRECTFB_REQUIRED_VERSION=1.4.14
- 
--PKG_CHECK_MODULES(DIRECTFB, directfb >= $DIRECTFB_REQUIRED_VERSION,[ WATER=`$PKG_CONFIG --variable=water directfb` ],
-+PKG_CHECK_MODULES([DIRECTFB], directfb >= $DIRECTFB_REQUIRED_VERSION,[ WATER=`$PKG_CONFIG --variable=water directfb` ],
- 	AC_MSG_ERROR([$DIRECTFB_PKG_ERRORS
- *** DirectFB $DIRECTFB_REQUIRED_VERSION or newer is required. The latest version
- *** of DirectFB is available from http://www.directfb.org/.]))
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
deleted file mode 100644
index 7907c5c..0000000
--- a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Example DirectFB applications"
-DESCRIPTION = "The DirectFB-examples package contains a set of simple DirectFB \
-      applications that can be used to test and demonstrate various DirectFB \
-      features"
-DEPENDS = "directfb"
-SECTION = "libs"
-LICENSE = "MIT"
-
-SRC_URI = " \
-           http://downloads.yoctoproject.org/mirror/sources/DirectFB-examples-${PV}.tar.gz \
-           file://configure.in-Fix-string-argument-syntax.patch \
-          "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
-
-S = "${WORKDIR}/DirectFB-examples-${PV}"
-
-inherit autotools pkgconfig
-
-SRC_URI[md5sum] = "8b60c867af295481c32a8c7fc5802307"
-SRC_URI[sha256sum] = "9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a"
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
deleted file mode 100644
index 46e0838..0000000
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ /dev/null
@@ -1,80 +0,0 @@
-SUMMARY = "Graphics abstraction library for the Linux Framebuffer Device"
-DESCRIPTION = "DirectFB is a thin library that provides developers \
-with hardware graphics acceleration, input device handling and \
-abstraction, an integrated windowing system with support for \
-translucent windows and multiple display layers on top of the \
-Linux framebuffer device."
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
-
-HOMEPAGE = "http://directfb.org"
-DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
-
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.gz \
-           file://configurefix.patch \
-           file://fusion.patch \
-           file://bashism.patch \
-           file://0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch \
-           file://compar_fn_t.patch \
-           file://union-sigval.patch \
-           file://use-PTHREAD_MUTEX_RECURSIVE.patch \
-           file://fix-client-gfx_state-initialisation.patch \
-          "
-
-S = "${WORKDIR}/DirectFB-${PV}"
-
-LDFLAGS_append =" -lts -lm"
-
-# Workaround for linking issues seen with armv7a + gold
-LDFLAGS_append_arm = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-
-BINCONFIG = "${bindir}/directfb-config"
-
-inherit autotools binconfig-disabled pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
-PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
-PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
-PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
-
-EXTRA_OECONF = "\
-  --with-gfxdrivers=none \
-  --enable-freetype=yes \
-  --enable-zlib \
-  --disable-imlib2 \
-  --disable-mesa \
-  --disable-sdl \
-  --disable-vnc \
-  --disable-x11 \
-"
-
-#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
-#this will cause directfb build failure on x86 arch, so filter out it.
-TARGET_CFLAGS_remove_x86 = "-fno-omit-frame-pointer"
-
-#PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
-#
-#python populate_packages_prepend () {
-#    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
-#    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-inputdrivers-%s', 'Directfb plugin for %s')
-#}
-
-# NOTE: monolithic packaging for now, should improve that eventually
-
-FILES_${PN}-dev += "\
-  ${bindir}/directfb-config \
-  ${libdir}/directfb-${RV}/systems/*.la \
-  ${libdir}/directfb-${RV}/inputdrivers/*.la \
-  ${libdir}/directfb-${RV}/interfaces/*/*.la \
-  ${libdir}/directfb-${RV}/wm/*.la \
-"
-
-FILES_${PN} += "\
-  ${libdir}/directfb-${RV}/systems/*.so \
-  ${libdir}/directfb-${RV}/inputdrivers/*.so \
-  ${libdir}/directfb-${RV}/interfaces/*/*.so \
-  ${libdir}/directfb-${RV}/wm/*.so \
-  ${datadir}/directfb-${PV} \
-"
diff --git a/meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch b/meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
deleted file mode 100644
index 76e0f75..0000000
--- a/meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f43ef44806ffb8e3b35d99070dde9b6cc1714d3d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Sep 2015 21:32:20 +0000
-Subject: [PATCH] gfx,direct: Aboid usng VLAs and printf formats
-
-VLAs are flagged by clang when using non-POD types, therefore replace
-the usage with alloca which is exact same allocation on stack
-
- __attribute__((__format__ (__printf__))) is not portable as used here
- therefore disable the check for clang here, we lose no functionality
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- lib/direct/util.h | 2 +-
- src/gfx/util.cpp  | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lib/direct/util.h b/lib/direct/util.h
-index 72941e9..8e7fa4a 100644
---- a/lib/direct/util.h
-+++ b/lib/direct/util.h
-@@ -98,7 +98,7 @@
- #define D_CONST_FUNC
- #endif
- 
--#if __GNUC__ >= 3
-+#if __GNUC__ >= 3 && !defined __clang__
- #define D_FORMAT_PRINTF(n)         __attribute__((__format__ (__printf__, n, n+1)))
- #define D_FORMAT_VPRINTF(n)        __attribute__((__format__ (__printf__, n, 0)))
- #else
-diff --git a/src/gfx/util.cpp b/src/gfx/util.cpp
-index 40032bc..d1015d4 100644
---- a/src/gfx/util.cpp
-+++ b/src/gfx/util.cpp
-@@ -294,8 +294,8 @@ dfb_gfx_copy_regions_stereo( CoreSurface           *source,
- {
-      unsigned int i, n = 0;
-      DFBRectangle rect = { 0, 0, source->config.size.w, source->config.size.h };
--     DFBRectangle rects[num];
--     DFBPoint     points[num];
-+     DFBRectangle *rects =  (DFBRectangle*)alloca( sizeof(struct DFBRectangle) * num);
-+     DFBPoint *points =  (DFBPoint*)alloca( sizeof(struct DFBPoint) * num);
- 
-      for (i=0; i<num; i++) {
-           DFB_REGION_ASSERT( &regions[i] );
-@@ -351,8 +351,8 @@ dfb_gfx_copy_regions_client( CoreSurface             *source,
- {
-      unsigned int             i, n = 0;
-      DFBRectangle             rect = { 0, 0, source->config.size.w, source->config.size.h };
--     DFBRectangle             rects[num];
--     DFBPoint                 points[num];
-+     DFBRectangle            *rects =  (DFBRectangle*)alloca( sizeof(struct DFBRectangle) * num);
-+     DFBPoint                *points =  (DFBPoint*)alloca( sizeof(struct DFBPoint) * num);
-      CoreGraphicsStateClient *client = _client ? _client : &StateClient::Get()->client;
-      CardState               *state  = client->state;
-      CardState                backup;
--- 
-2.5.1
-
diff --git a/meta/recipes-graphics/directfb/directfb/bashism.patch b/meta/recipes-graphics/directfb/directfb/bashism.patch
deleted file mode 100644
index 2ef4e93..0000000
--- a/meta/recipes-graphics/directfb/directfb/bashism.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-${x//y/} is a bash syntax. Replace with something dash compatible
-
-RP 2015/5/3
-Upstream-Status: Pending
-
-Index: DirectFB-1.7.7/configure.in
-===================================================================
---- DirectFB-1.7.7.orig/configure.in
-+++ DirectFB-1.7.7/configure.in
-@@ -2696,7 +2696,7 @@ AM_CONDITIONAL(BUILD_TOOLS, test "$with_
- AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
- 
- CFLAGS="$CFLAGS $DFB_INTERNAL_CFLAGS"
--CXXFLAGS="$CXXFLAGS ${CFLAGS//-Werror-implicit-function-declaration/}"
-+CXXFLAGS="$CXXFLAGS $(printf '%s\n' "$CFLAGS" | sed 's/-Werror-implicit-function-declaration//g')"
- DFB_LDFLAGS="$LDFLAGS $ZLIB_LIBS"
- 
- CFLAGS="$CFLAGS $CFLAGS_STD"
diff --git a/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch b/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
deleted file mode 100644
index ee4d900..0000000
--- a/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-test for __compar_fn_t and if not defined by libc then define it
-help make directfb compile with musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: DirectFB-1.7.7/configure.in
-===================================================================
---- DirectFB-1.7.7.orig/configure.in
-+++ DirectFB-1.7.7/configure.in
-@@ -112,6 +112,17 @@ AC_CHECK_SIZEOF(long)
- AC_CHECK_SIZEOF(long long)
- AC_CHECK_FUNCS(fork)
- 
-+AC_CACHE_CHECK([for compar_fn_t in stdlib.h],ccache_cv_COMPAR_FN_T, [
-+    AC_TRY_COMPILE(
-+        [#include <stdlib.h>],
-+        [void test_fn(void) { qsort(NULL, 0, 0, (__compar_fn_t)NULL); }],
-+        ccache_cv_COMPAR_FN_T=yes,
-+        ccache_cv_COMPAR_FN_T=no)])
-+if test x"$ccache_cv_COMPAR_FN_T" = x"yes"; then
-+   AC_DEFINE(HAVE_COMPAR_FN_T, 1,
-+             Define to 1 if you have the `__compar_fn_t' typedef.)
-+fi
-+
- AC_PATH_PROGS(PERL, perl5 perl)
- 
- AC_PATH_PROG(MAN2HTML, man2html, no)
-Index: DirectFB-1.7.7/inputdrivers/lirc/lirc.c
-===================================================================
---- DirectFB-1.7.7.orig/inputdrivers/lirc/lirc.c
-+++ DirectFB-1.7.7/inputdrivers/lirc/lirc.c
-@@ -59,6 +59,11 @@
- 
- #include <core/input_driver.h>
- 
-+#if HAVE_COMPAR_FN_T
-+#define COMPAR_FN_T __compar_fn_t
-+#else
-+typedef int (*COMPAR_FN_T)(const void *, const void *);
-+#endif
- 
- DFB_INPUT_DRIVER( lirc )
- 
-@@ -97,7 +102,7 @@ static DFBInputDeviceKeySymbol lirc_pars
-           qsort ( keynames,
-                   D_ARRAY_SIZE( keynames ),
-                   sizeof(keynames[0]),
--                  (__compar_fn_t) keynames_sort_compare );
-+                  (COMPAR_FN_T) keynames_sort_compare );
-           keynames_sorted = true;
-      }
- 
-@@ -124,7 +129,7 @@ static DFBInputDeviceKeySymbol lirc_pars
-                symbol_name = bsearch( name, keynames,
-                                       D_ARRAY_SIZE( keynames ),
-                                       sizeof(keynames[0]),
--                                      (__compar_fn_t) keynames_compare );
-+                                      (COMPAR_FN_T) keynames_compare );
-                if (symbol_name)
-                     return symbol_name->symbol;
-                break;
diff --git a/meta/recipes-graphics/directfb/directfb/configurefix.patch b/meta/recipes-graphics/directfb/directfb/configurefix.patch
deleted file mode 100644
index dd8c019..0000000
--- a/meta/recipes-graphics/directfb/directfb/configurefix.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Libtool needs these set correctly else we end up with pointless rpaths
-such as the QA warnings:
-
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfblayer contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbmaster contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/mkdgifft contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbdump contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbinput contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbfx contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack
 ages-split/directfb/usr/bin/dfbscreen contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/mkdgiff contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbinspector contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/mkdfiff contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbinfo contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbpenmount contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbg contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/libfusion-1.4.so.6 contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/libdirectfb-1.4.so.6.0.9 contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/libdirectfb-1.4.so.6 contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/libfusion-1.4.so.6.0.9 contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_fbdev.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_devmem.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_dummy.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvider/libidirectfbvideoprovider_v4l.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvider/libidirectfbvideoprovider_gif.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/ICoreResourceManager/libicoreresourcemanager_test.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_jpeg.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_png.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_dfiff.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_gif.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_dgiff.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/wm/libdirectfbwm_default.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_zytronic.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_penmount.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_linux_input.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_serialmouse.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_mutouch.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_tslib.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_joystick.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_sonypi.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_lirc.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_wm97xx_ts.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_ps2mouse.so contains probably-redundant RPATH /usr/lib
-WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_keyboard.so contains probably-redundant RPATH /usr/lib
-
-Upstream-Status: Pending
-
-RP 2012/03/16
-
-Index: DirectFB-1.4.15/configure.in
-===================================================================
---- DirectFB-1.4.15.orig/configure.in	2012-03-16 13:32:23.692402879 +0000
-+++ DirectFB-1.4.15/configure.in	2012-03-16 13:33:22.312400960 +0000
-@@ -97,13 +97,6 @@
- AC_CHECK_SIZEOF(long long)
- AC_CHECK_FUNCS(fork)
- 
--
--## Work around libstuhl during cross build...
--if test "$host" != "$build"; then
--  sys_lib_dlsearch_path_spec=""
--  sys_lib_search_path_spec=""
--fi
--
- AC_PATH_PROGS(PERL, perl5 perl)
- 
- AC_PATH_PROG(MAN2HTML, man2html, no)
diff --git a/meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch b/meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch
deleted file mode 100644
index 57a9b0d..0000000
--- a/meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8e53c0b9cedb62b82e2b7680d793d433b647ae20 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Mon, 13 Jun 2016 13:32:44 -0700
-Subject: [PATCH] fix client->gfx_state initialisation
-
-Shortly before the DirectFB 1.7.7 release, an optimisation was added
-to CoreGraphicsStateClient_Init() to avoid creating an extended
-Graphics State object if it will not later be required:
-
-  4d422fb Client: Create extended Graphics State object when needed for later usage
-
-Unfortunately the client->gfx_state variable used to track the
-extended Graphics State object is not initialised, which can lead to
-crashes etc due to creation of the Graphics State object erroneously
-being skipped.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- src/core/CoreGraphicsStateClient.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/core/CoreGraphicsStateClient.cpp b/src/core/CoreGraphicsStateClient.cpp
-index 5d46f0e..5007755 100644
---- a/src/core/CoreGraphicsStateClient.cpp
-+++ b/src/core/CoreGraphicsStateClient.cpp
-@@ -364,6 +364,7 @@ CoreGraphicsStateClient_Init( CoreGraphicsStateClient *client,
-      client->renderer  = NULL;
-      client->requestor = NULL;
-      client->throttle  = NULL;
-+     client->gfx_state = NULL;
- 
-      if (dfb_config->task_manager) {
-           if (dfb_config->call_nodirect) {
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/directfb/directfb/fusion.patch b/meta/recipes-graphics/directfb/directfb/fusion.patch
deleted file mode 100644
index 1f81a67..0000000
--- a/meta/recipes-graphics/directfb/directfb/fusion.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-directfb: Fix for hangs in direct_test, fusion_skirmish on exit
-
-Upstream-Status: Pending
-Signed-off-by: Lauren Post <lauren.post@freescale.com>
-
---- a/lib/fusion/fusion.c	2013-01-18 22:57:11.000000000 +0800
-+++ b/lib/fusion/fusion.c	2013-07-04 10:42:56.502699119 +0800
-@@ -2853,9 +2853,14 @@
-           direct_mutex_lock( &world->event_dispatcher_mutex );
- 
-           while (1) {
--               if (!world->event_dispatcher_buffers)
-+               if (!world->event_dispatcher_buffers){
-                     direct_waitqueue_wait( &world->event_dispatcher_cond, &world->event_dispatcher_mutex );
--
-+                    if (world->dispatch_stop) {
-+                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORING (dispatch_stop!)\n" );
-+                         direct_mutex_unlock( &world->event_dispatcher_mutex );
-+                         return NULL;
-+                    }
-+               }
-                buf = (FusionEventDispatcherBuffer *)world->event_dispatcher_buffers;
-                D_MAGIC_ASSERT( buf, FusionEventDispatcherBuffer );
- 
-@@ -2872,6 +2877,11 @@
- //D_INFO("waiting...\n");
-                     D_ASSERT( buf->read_pos == buf->write_pos );
-                     direct_waitqueue_wait( &world->event_dispatcher_cond, &world->event_dispatcher_mutex );
-+		      if (world->dispatch_stop) {
-+                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORING (dispatch_stop!)\n" );
-+                         direct_mutex_unlock( &world->event_dispatcher_mutex );
-+                         return NULL;
-+                    }
-                }
- 
-                buf = (FusionEventDispatcherBuffer *)world->event_dispatcher_buffers;
diff --git a/meta/recipes-graphics/directfb/directfb/union-sigval.patch b/meta/recipes-graphics/directfb/directfb/union-sigval.patch
deleted file mode 100644
index 29f45c7..0000000
--- a/meta/recipes-graphics/directfb/directfb/union-sigval.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-This patch is taken from gentoo musl overlay
-sigval_t is glibc only construct, we use a union of sigval
-which pretty much is same effect as sigval_t
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c
---- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c	2014-07-15 02:54:58.000000000 -0400
-+++ DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c	2015-07-18 16:55:35.077989166 -0400
-@@ -111,7 +111,7 @@
- void
- direct_trap( const char *domain, int sig )
- {
--     sigval_t val;
-+     union sigval val;
- 
-      if (direct_config->delay_trap_ms) {
-           D_LOG( Direct_Trap, VERBOSE, "NOT RAISING signal %d from %s, waiting for %dms... attach gdb --pid=%d\n", sig, domain, direct_config->delay_trap_ms, getpid() );
diff --git a/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch b/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
deleted file mode 100644
index ac48f68..0000000
--- a/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-Remove use of DIRECT_RECURSIVE_MUTEX_INITIALIZER its not portable
-use portable way to initialize recursive mutex using pthread_once() and direct_recursive_mutex_init()
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: DirectFB-1.7.7/lib/direct/os/linux/glibc/mutex.h
-===================================================================
---- DirectFB-1.7.7.orig/lib/direct/os/linux/glibc/mutex.h
-+++ DirectFB-1.7.7/lib/direct/os/linux/glibc/mutex.h
-@@ -46,7 +46,6 @@ struct __D_DirectMutex {
- /**********************************************************************************************************************/
- 
- #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
--#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
- 
- #endif
- 
-Index: DirectFB-1.7.7/lib/direct/trace.c
-===================================================================
---- DirectFB-1.7.7.orig/lib/direct/trace.c
-+++ DirectFB-1.7.7/lib/direct/trace.c
-@@ -89,8 +89,15 @@ struct __D_DirectTraceBuffer {
- /**************************************************************************************************/
- 
- static DirectLink  *buffers;
--static DirectMutex  buffers_lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(buffers_lock);
- 
-+static pthread_once_t buffers_lock_init_once = PTHREAD_ONCE_INIT;
-+static DirectMutex buffers_lock;
-+
-+static void
-+buffers_lock_init( void )
-+{
-+     direct_recursive_mutex_init(&buffers_lock);
-+}
- /**************************************************************************************************/
- 
- __dfb_no_instrument_function__
-@@ -113,6 +120,7 @@ get_trace_buffer( void )
- 
-           D_MAGIC_SET( buffer, DirectTraceBuffer );
- 
-+          pthread_once(&buffers_lock_init_once, buffers_lock_init);
-           direct_mutex_lock( &buffers_lock );
-           direct_list_append( &buffers, &buffer->link );
-           direct_mutex_unlock( &buffers_lock );
-@@ -138,8 +146,14 @@ typedef struct {
- } SymbolTable;
- 
- static DirectLink  *tables      = NULL;
--static DirectMutex  tables_lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(tables_lock);
-+static pthread_once_t tables_lock_init_once = PTHREAD_ONCE_INIT;
-+static DirectMutex tables_lock;
- 
-+static void
-+tables_lock_init( void )
-+{
-+     direct_recursive_mutex_init(&tabless_lock);
-+}
- 
- __dfb_no_instrument_function__
- static void
-@@ -370,6 +384,7 @@ direct_trace_lookup_symbol( const char *
-      Symbol      *symbol;
-      SymbolTable *table;
- 
-+     pthread_once(&tables_lock_init_once, tables_lock_init);
-      direct_mutex_lock( &tables_lock );
- 
-      table = find_table( filename );
-@@ -514,6 +529,7 @@ direct_trace_print_stacks()
-      DirectTraceBuffer *b;
-      DirectTraceBuffer *buffer = get_trace_buffer();
- 
-+     pthread_once(&buffers_lock_init_once, buffers_lock_init);
-      direct_mutex_lock( &buffers_lock );
- 
-      if (buffer && buffer->level)
-@@ -611,6 +627,7 @@ direct_trace_free_buffer( DirectTraceBuf
-      D_MAGIC_ASSERT( buffer, DirectTraceBuffer );
- 
-      if (buffer->thread) {
-+          pthread_once(&buffers_lock_init_once, buffers_lock_init);
-           direct_mutex_lock( &buffers_lock );
-           direct_list_remove( &buffers, &buffer->link );
-           direct_mutex_unlock( &buffers_lock );
-Index: DirectFB-1.7.7/src/directfb.c
-===================================================================
---- DirectFB-1.7.7.orig/src/directfb.c
-+++ DirectFB-1.7.7/src/directfb.c
-@@ -99,6 +99,15 @@ const unsigned int directfb_micro_versio
- const unsigned int directfb_binary_age    = DIRECTFB_BINARY_AGE;
- const unsigned int directfb_interface_age = DIRECTFB_INTERFACE_AGE;
- 
-+static pthread_once_t lock_init_once = PTHREAD_ONCE_INIT;
-+static DirectMutex lock;
-+
-+static void
-+lock_init( void )
-+{
-+     direct_recursive_mutex_init(&lock);
-+}
-+
- const char *
- DirectFBCheckVersion( unsigned int required_major,
-                       unsigned int required_minor,
-@@ -215,8 +224,7 @@ DirectFBCreate( IDirectFB **interface_pt
-      if (dfb_config->remote.host)
-           return CreateRemote( dfb_config->remote.host, dfb_config->remote.port, interface_ptr );
- 
--     static DirectMutex lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(lock);
--
-+     pthread_once(&lock_init_once, lock_init);
-      direct_mutex_lock( &lock );
- 
-      if (!dfb_config->no_singleton && idirectfb_singleton) {
diff --git a/meta/recipes-graphics/directfb/directfb_1.7.7.bb b/meta/recipes-graphics/directfb/directfb_1.7.7.bb
deleted file mode 100644
index c6c070e..0000000
--- a/meta/recipes-graphics/directfb/directfb_1.7.7.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require directfb.inc
-
-RV = "1.7-7"
-
-LEAD_SONAME = "libdirectfb-1.7.so.0"
-
-SRC_URI[md5sum] = "152cf1863b1a3a28aa1370e9053440bf"
-SRC_URI[sha256sum] = "b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3"
-- 
2.4.0


