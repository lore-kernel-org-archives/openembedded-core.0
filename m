Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TG81c-0001m1-Jd
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:44:37 +0200
Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 05:31:47 -0700
Received: by mail-wg0-f41.google.com with SMTP id ds1so2597486wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 05:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=P2who7+1B+drPOjDu1Mia9td5esGa509MfeX/29AgdI=;
	b=Hn7YkpYzAg21lySujGRceA+/LlzGezcG0ZN5Tt7hvZhIEJ2SVW0ZfYVwqKwuCsX12C
	SK+SQC/U+CfYZf7DOy1vJGibYpldLBrOuzOKDMxrNuFuf3WbJcWx8SsWj/vwkA+qpwaD
	fmNK7Y+yC1Hany9gMOel9L4+BeEzO4Uhd/VUMXRYld/D5NhHLOKI0V7vkk22K4SwWylA
	+A/nnT2fBcR7OeXnddkyu0QFhyS3EMkp8Nuvr5/xHQJz3iTY0YzVX/LfQYE74vvAe7SI
	sz6QB68RCtAPziMjteoqBfol2MQYcxcHXIka9VugclwfC7UDJ9M3ZXx+jyleqZ0zVtss
	9QYQ==
Received: by 10.216.179.205 with SMTP id h55mr7669759wem.100.1348489907304;
	Mon, 24 Sep 2012 05:31:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m14sm7707534wie.8.2012.09.24.05.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 05:31:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 13:30:53 +0100
Message-Id: <1348489853-5239-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnkAs3/AHixgplyWc/+mlSpe4EBGDwW+9TRss9lnKT7I2p6fwh0CLzzniZfueY4QSIx5SA8
Subject: [PATCH] xserver-xorg: upgrade to 1.11.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 12:44:37 -0000

gcc-47-warning.patch was integrated, so drop.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xserver-xorg-1.11.2/crosscompile.patch         |   22 -------------
 .../fix_open_max_preprocessor_error.patch          |   15 ---------
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 --------------------
 .../xserver-xorg-1.11.2/macro_tweak.patch          |   25 ---------------
 .../xserver-xorg-1.11.2/mips64-compiler.patch      |   29 -----------------
 .../xserver-xorg-1.11.4/crosscompile.patch         |   22 +++++++++++++
 .../fix_open_max_preprocessor_error.patch          |   15 +++++++++
 .../xserver-xorg-1.11.4/macro_tweak.patch          |   25 +++++++++++++++
 .../xserver-xorg-1.11.4/mips64-compiler.patch      |   29 +++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.11.2.bb            |   13 --------
 .../xorg-xserver/xserver-xorg_1.11.4.bb            |   12 +++++++
 11 files changed, 103 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/configure.ac b/configure.ac
-index b3b752c..600500b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
- dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
- dnl compiling, assume default font path uses standard FONTROOTDIR directories.
- DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
--if test "$cross_compiling" != yes; then
--	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
--		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
--		[case $host_os in
-+		case $host_os in
- 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
--		esac])
--fi
-+		esac
- AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
- 				[ FONTPATH="$withval" ],
- 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
deleted file mode 100644
index 2f62972..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/os/osdep.h
-===================================================================
---- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
-+++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
-@@ -92,7 +92,7 @@
-  * like sysconf(_SC_OPEN_MAX) is not supported.
-  */
- 
--#if OPEN_MAX <= 256
-+#if 0
- #define MAXSOCKS (OPEN_MAX - 1)
- #else
- #define MAXSOCKS 256
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
deleted file mode 100644
index ed4eaac..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-This patch fixes errors on powerpc like below
-
-| lnx_video.c: In function 'unmapVidMem':
-| lnx_video.c:472:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
-
-Its in 1.12 branch 
-
-http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.12-branch&id=eb3377ffb8a7baa26c9831e56ed782d48b28fa71
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
-===================================================================
---- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:32:34.186489019 -0700
-+++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:49:14.926537452 -0700
-@@ -469,11 +469,11 @@
- static void
- unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
- {
--    memType alignOff = (memType)Base 
--	- ((memType)Base & ~(getpagesize() - 1));
-+    uintptr_t alignOff = (uintptr_t)Base 
-+	- ((uintptr_t)Base & ~(getpagesize() - 1));
- 
--    DebugF("alignment offset: %lx\n",alignOff);
--    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
-+    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
-+    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
- }
- 
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
deleted file mode 100644
index ec0eea6..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-This is the revised version of files/macro_tweak.patch for
-xorg-server 1.8.99.904 and newer.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/xorg-server.m4 b/xorg-server.m4
-index bdecf62..040fdb8 100644
---- a/xorg-server.m4
-+++ b/xorg-server.m4
-@@ -28,10 +28,12 @@ dnl
- # Checks for the $1 define in xorg-server.h (from the sdk).  If it
- # is defined, then add $1 to $REQUIRED_MODULES.
- 
-+m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
-+
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
deleted file mode 100644
index e6bc95b..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
-so we end up with incompatible conversion errors
-
-This patch choses the right values for mips64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
-===================================================================
---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
-+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
-@@ -104,6 +104,7 @@
- 
- #  if !defined(__arm__)
- #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
-+      && !defined(__mips64) \
-       && !(defined(__alpha__) && defined(linux)) \
-       && !(defined(__ia64__) && defined(linux)) \
- 
-@@ -708,7 +709,7 @@
- }
- 
- #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#    ifdef __arm32__
-+#    if defined (__arm32__) || defined (__mips64)
- #     define PORT_SIZE long
- #    else
- #     define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
new file mode 100644
index 0000000..2f98bb8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/configure.ac b/configure.ac
+index b3b752c..600500b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
+ dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
+ dnl compiling, assume default font path uses standard FONTROOTDIR directories.
+ DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
+-if test "$cross_compiling" != yes; then
+-	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
+-		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
+-		[case $host_os in
++		case $host_os in
+ 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
+-		esac])
+-fi
++		esac
+ AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
+ 				[ FONTPATH="$withval" ],
+ 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
new file mode 100644
index 0000000..2f62972
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Index: git/os/osdep.h
+===================================================================
+--- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
++++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
+@@ -92,7 +92,7 @@
+  * like sysconf(_SC_OPEN_MAX) is not supported.
+  */
+ 
+-#if OPEN_MAX <= 256
++#if 0
+ #define MAXSOCKS (OPEN_MAX - 1)
+ #else
+ #define MAXSOCKS 256
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
new file mode 100644
index 0000000..ec0eea6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
@@ -0,0 +1,25 @@
+This is the revised version of files/macro_tweak.patch for
+xorg-server 1.8.99.904 and newer.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/xorg-server.m4 b/xorg-server.m4
+index bdecf62..040fdb8 100644
+--- a/xorg-server.m4
++++ b/xorg-server.m4
+@@ -28,10 +28,12 @@ dnl
+ # Checks for the $1 define in xorg-server.h (from the sdk).  If it
+ # is defined, then add $1 to $REQUIRED_MODULES.
+ 
++m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
++
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
new file mode 100644
index 0000000..e6bc95b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
@@ -0,0 +1,29 @@
+on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
+so we end up with incompatible conversion errors
+
+This patch choses the right values for mips64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
+===================================================================
+--- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
++++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
+@@ -104,6 +104,7 @@
+ 
+ #  if !defined(__arm__)
+ #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
++      && !defined(__mips64) \
+       && !(defined(__alpha__) && defined(linux)) \
+       && !(defined(__ia64__) && defined(linux)) \
+ 
+@@ -708,7 +709,7 @@
+ }
+ 
+ #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
+-#    ifdef __arm32__
++#    if defined (__arm32__) || defined (__mips64)
+ #     define PORT_SIZE long
+ #    else
+ #     define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
deleted file mode 100644
index c707567..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xserver-xorg.inc
-
-# Misc build failure for master HEAD
-SRC_URI += "file://crosscompile.patch \
-            file://fix_open_max_preprocessor_error.patch \
-            file://gcc-47-warning.patch \
-	    file://mips64-compiler.patch \
-           "
-
-SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
-SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
-
-PR = "r8"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
new file mode 100644
index 0000000..eced5df
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
@@ -0,0 +1,12 @@
+require xserver-xorg.inc
+
+# Misc build failure for master HEAD
+SRC_URI += "file://crosscompile.patch \
+            file://fix_open_max_preprocessor_error.patch \
+	    file://mips64-compiler.patch \
+           "
+
+SRC_URI[md5sum] = "256325e9b17dff479d92bed97f6b0adb"
+SRC_URI[sha256sum] = "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2893092500358a4366fc"
+
+PR = "r0"
-- 
1.7.10



