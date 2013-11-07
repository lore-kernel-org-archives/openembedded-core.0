Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id C357A6D5A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 12:06:15 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so416909wes.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 04:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=N0csixPNGdGbSPEzQD4oN9J6Rjl44zobRk2Zt346IbY=;
	b=fjdNMwQbt6Q0ZQ8bee3OxlfqXXgrf0QAL+0aqqq4+Zo4dlSfMZ4FWSSCiML/WcimY3
	ZGHIX2ZVgO2Zpioe2mlCeKmlVrDvP0hyaCThs+4seAp7tj7IpYHi79PeGmQH+78Ts+wc
	NpfN6SYketrCH+BlFbmLQeulcFhLLb2pXDCqfPjmdQq57aS0uL3Ls+cULOzTMmfUIQTY
	qkxw4VCRsSOxAoPO+M5OkkJq+lT2tz8a4xnYRItBSzDpLV2yJ2jGWNnO+Kfe52WoEIpq
	D0YKJCXfL7ObNq+ruSYdpOXg9v35nNiLM8F2z8xREKIWuoc2TJ7tTNnlfFERwOJWI+jp
	KCUQ==
X-Gm-Message-State: ALoCoQnC+wjTJOfod4hRgZSUS2LRURhbo3se3OLW6eQl7EGnGKzDdt9aT15pInP7GuTQhAfQS3fV
X-Received: by 10.194.237.99 with SMTP id vb3mr7261684wjc.28.1383825976133;
	Thu, 07 Nov 2013 04:06:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ev4sm20295846wib.7.2013.11.07.04.06.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 04:06:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 12:06:04 +0000
Message-Id: <1383825964-3795-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: upgrade to 1.14.4
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
X-List-Received-Date: Thu, 07 Nov 2013 12:06:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The xinerama and dixstruct patches are merged in 1.14.4, so drop them.

Also drop explicit PR statement.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-fix-segfaults-char-is-unsigned-for-ARM-a.patch |   39 --------------------
 .../xorg-xserver/xserver-xorg-1.14.0/aarch64.patch |   35 ------------------
 .../xserver-xorg-1.14.0/crosscompile.patch         |   22 -----------
 .../fix_compilation_when_not_using_xinerama.patch  |   21 -----------
 .../fix_open_max_preprocessor_error.patch          |   15 --------
 .../xserver-xorg-1.14.0/macro_tweak.patch          |   25 -------------
 .../xserver-xorg-1.14.0/mips64-compiler.patch      |   29 ---------------
 .../xorg-xserver/xserver-xorg/aarch64.patch        |   35 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg/crosscompile.patch   |   22 +++++++++++
 .../fix_open_max_preprocessor_error.patch          |   15 ++++++++
 .../xorg-xserver/xserver-xorg/macro_tweak.patch    |   25 +++++++++++++
 .../xserver-xorg/mips64-compiler.patch             |   29 +++++++++++++++
 .../xorg-xserver/xserver-xorg_1.14.0.bb            |   37 -------------------
 .../xorg-xserver/xserver-xorg_1.14.4.bb            |   33 +++++++++++++++++
 14 files changed, 159 insertions(+), 223 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/mips64-compiler.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch
deleted file mode 100644
index 16f0489..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a095f5005be66c1b9747187e91e5332b0d8b106b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 16 Apr 2013 13:47:22 +0200
-Subject: [xserver 1.14/master] dixstruct.h: fix segfaults - char is unsigned
- for ARM and PowerPC architectures
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-see ARM related bug reports [1-3]
-
-Upstream-Status: Submitted [4]
-
-[1] https://github.com/archlinuxarm/PKGBUILDs/issues/446I
-[2] http://www.raspberrypi.org/phpBB3/viewtopic.php?t=38568&p=321673
-[3] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/037805.html
-[4] http://lists.x.org/archives/xorg-devel/2013-April/036010.html
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- include/dixstruct.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/dixstruct.h b/include/dixstruct.h
-index 6784819..aef822c 100644
---- a/include/dixstruct.h
-+++ b/include/dixstruct.h
-@@ -96,7 +96,7 @@ typedef struct _Client {
-     unsigned int clientGone:1;
-     unsigned int closeDownMode:2;
-     unsigned int clientState:2;
--    char smart_priority;
-+    signed char smart_priority;
-     short noClientException;      /* this client died or needs to be killed */
-     int priority;
-     ReplySwapPtr pSwapReplyFunc;
--- 
-1.7.6.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
deleted file mode 100644
index 045e24a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Subject: Add AArch64 support to xserver-xorg
-Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-lnx_video.c parts are not existing in 1.14 branch.
-
-Xserver was checked in AArch64 fastmodel (commercial one with graphics support).
-
-http://patchwork.freedesktop.org/patch/12785/
-
-Upstream-Status: Pending
-
----
- include/servermd.h                      |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
---- xorg-server-1.13.1.orig/include/servermd.h
-+++ xorg-server-1.13.1/include/servermd.h
-@@ -243,10 +243,17 @@ SOFTWARE.
- #define BITMAP_BIT_ORDER       LSBFirst
- #define GLYPHPADBYTES		4
- /* ???? */
- #endif                          /* AMD64 */
- 
-+#if defined(__aarch64__) || defined(aarch64) || defined(__aarch64)
-+#define IMAGE_BYTE_ORDER	MSBFirst
-+#define BITMAP_BIT_ORDER       MSBFirst
-+#define GLYPHPADBYTES		4
-+/* ???? */
-+#endif                          /* AArch64 */
-+
- #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
- 	defined(__alpha__) || defined(__alpha) || \
- 	defined(__i386__) || \
- 	defined(__s390x__) || defined(__s390__)
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/crosscompile.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
deleted file mode 100644
index f0c165d..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-fix compilation when not using xinerama
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: xorg-server-1.14.0/xfixes/xfixesint.h
-===================================================================
---- xorg-server-1.14.0.orig/xfixes/xfixesint.h	2012-07-10 09:06:41.000000000 +0300
-+++ xorg-server-1.14.0/xfixes/xfixesint.h	2013-03-11 15:01:07.019098531 +0200
-@@ -291,8 +291,10 @@
-  SProcXFixesDestroyPointerBarrier(ClientPtr client);
- 
- /* Xinerama */
-+#ifdef PANORAMIX
- extern int (*PanoramiXSaveXFixesVector[XFixesNumberRequests]) (ClientPtr);
- void PanoramiXFixesInit(void);
- void PanoramiXFixesReset(void);
-+#endif
- 
- #endif                          /* _XFIXESINT_H_ */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_open_max_preprocessor_error.patch
deleted file mode 100644
index 2f62972..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_open_max_preprocessor_error.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/macro_tweak.patch
deleted file mode 100644
index ec0eea6..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/macro_tweak.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/mips64-compiler.patch
deleted file mode 100644
index 168368e..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/mips64-compiler.patch
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
-Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
-===================================================================
---- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
-+++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
-@@ -101,6 +101,7 @@
- #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
- #if !defined(__arm__)
- #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
-+      && !defined(__mips64) \
-       && !(defined(__alpha__) && defined(linux)) \
-       && !(defined(__ia64__) && defined(linux)) \
- 
-@@ -721,7 +722,7 @@
- }
- 
- #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#ifdef __arm32__
-+#if defined (__arm32__) || defined (__mips64)
- #define PORT_SIZE long
- #else
- #define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch
new file mode 100644
index 0000000..045e24a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch
@@ -0,0 +1,35 @@
+Subject: Add AArch64 support to xserver-xorg
+Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+lnx_video.c parts are not existing in 1.14 branch.
+
+Xserver was checked in AArch64 fastmodel (commercial one with graphics support).
+
+http://patchwork.freedesktop.org/patch/12785/
+
+Upstream-Status: Pending
+
+---
+ include/servermd.h                      |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+--- xorg-server-1.13.1.orig/include/servermd.h
++++ xorg-server-1.13.1/include/servermd.h
+@@ -243,10 +243,17 @@ SOFTWARE.
+ #define BITMAP_BIT_ORDER       LSBFirst
+ #define GLYPHPADBYTES		4
+ /* ???? */
+ #endif                          /* AMD64 */
+ 
++#if defined(__aarch64__) || defined(aarch64) || defined(__aarch64)
++#define IMAGE_BYTE_ORDER	MSBFirst
++#define BITMAP_BIT_ORDER       MSBFirst
++#define GLYPHPADBYTES		4
++/* ???? */
++#endif                          /* AArch64 */
++
+ #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
+ 	defined(__alpha__) || defined(__alpha) || \
+ 	defined(__i386__) || \
+ 	defined(__s390x__) || defined(__s390__)
+ 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
new file mode 100644
index 0000000..2f98bb8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
new file mode 100644
index 0000000..2f62972
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
new file mode 100644
index 0000000..ec0eea6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
new file mode 100644
index 0000000..168368e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
@@ -0,0 +1,29 @@
+on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
+so we end up with incompatible conversion errors
+
+This patch choses the right values for mips64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
+===================================================================
+--- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
++++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
+@@ -101,6 +101,7 @@
+ #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
+ #if !defined(__arm__)
+ #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
++      && !defined(__mips64) \
+       && !(defined(__alpha__) && defined(linux)) \
+       && !(defined(__ia64__) && defined(linux)) \
+ 
+@@ -721,7 +722,7 @@
+ }
+ 
+ #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
+-#ifdef __arm32__
++#if defined (__arm32__) || defined (__mips64)
+ #define PORT_SIZE long
+ #else
+ #define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
deleted file mode 100644
index 8c573bd..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require xserver-xorg.inc
-
-# Misc build failure for master HEAD
-SRC_URI += "file://crosscompile.patch \
-            file://fix_open_max_preprocessor_error.patch \
-            file://mips64-compiler.patch \
-            file://aarch64.patch \
-            file://fix_compilation_when_not_using_xinerama.patch \
-            file://0001-dixstruct.h-fix-segfaults-char-is-unsigned-for-ARM-a.patch \
-           "
-
-SRC_URI[md5sum] = "86110278b784e279381b7f6f2295c508"
-SRC_URI[sha256sum] = "1f5107573252c26439fdd165481765a2c0964e02a2e9fab36e02414d08f30630"
-
-PR = "${INC_PR}.1"
-
-# These extensions are now integrated into the server, so declare the migration
-# path for in-place upgrades.
-
-RREPLACES_${PN} =  "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
-RPROVIDES_${PN} =  "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
-RCONFLICTS_${PN} = "${PN}-extension-dri \
-                    ${PN}-extension-dri2 \
-                    ${PN}-extension-record \
-                    ${PN}-extension-extmod \
-                    ${PN}-extension-dbe \
-                   "
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb
new file mode 100644
index 0000000..22b1f82
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb
@@ -0,0 +1,33 @@
+require xserver-xorg.inc
+
+# Misc build failure for master HEAD
+SRC_URI += "file://crosscompile.patch \
+            file://fix_open_max_preprocessor_error.patch \
+            file://mips64-compiler.patch \
+            file://aarch64.patch \
+           "
+
+SRC_URI[md5sum] = "9d68a30258c67faa3c036a4a85e8bf97"
+SRC_URI[sha256sum] = "608ccfaafb845f6e559884a30f946d365209172416710d687b190e9e1ff65dc3"
+
+# These extensions are now integrated into the server, so declare the migration
+# path for in-place upgrades.
+
+RREPLACES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RPROVIDES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RCONFLICTS_${PN} = "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
-- 
1.7.10.4


