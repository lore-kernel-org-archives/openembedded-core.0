Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDzK-00063d-6T
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:34 +0200
Received: by dyk17 with SMTP id 17so236438dyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=19daT9EwQXGwHHTQhTzsaGMDD6iuWNr4cBt8RucEFyc=;
	b=d83N09APDFQfO/pdHCrfNdjoNVYnMUZQByU22HROOJHYffnIpQs8k5I86nxsNcPtTy
	j8+IRGLnmvG0sWkJBFrC7a0pOE3d9Lj6M8a/DqUVJsGpenBUPeNTTKiRPIDt8VKTAlLU
	FvZsQRMIv2sNVbNGdq4IxaQHziN8NOEGgEa5M=
Received: by 10.223.63.75 with SMTP id a11mr11972255fai.9.1318007277134;
	Fri, 07 Oct 2011 10:07:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o22sm13614815fab.11.2011.10.07.10.07.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:13 +0200
Message-Id: <c34c086ff9373d54a5b2c9d282bc5f7c9ce72d44.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 18/31] xserver-xorg: move patches to xserver-xf86-dri-lite-1.11.1 and use same directory from xserver-xf86-lite recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:13:34 -0000

* FILESEXTRAPATHS needs to be in xserver-xf86-lite_1.11.1
  because in .inc we don't have ${PV} expanded yet
* crosscompile.patch macro_tweak.patch were identical
* fix_open_max_preprocessor_error.patch has only different header
  # $ diff xserver-xorg/fix_open_max_preprocessor_error.patch xserver-xorg-dri/fix_open_max_preprocessor_error.patch
  1c1
  < Upstream-Status: Pending
  ---
  > Upstream-Status: Inappropriate [embedded specific]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    7 +----
 .../xserver-xorg-lite/macro_tweak.patch            |   30 --------------------
 .../xorg-xserver/xserver-xorg-lite_1.11.1.bb       |    2 +
 .../xorg-xserver/xserver-xorg/crosscompile.patch   |   22 --------------
 .../fix_open_max_preprocessor_error.patch          |   15 ----------
 7 files changed, 3 insertions(+), 73 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-lite => xserver-xorg-1.11.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-lite => xserver-xorg-1.11.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg => xserver-xorg-1.11.1}/macro_tweak.patch (75%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch
similarity index 75%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch
index 2b32d4e..ec0eea6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch
@@ -1,10 +1,5 @@
 This is the revised version of files/macro_tweak.patch for
-xorg-server 1.8.99.904.
-
-the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
-are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
-can be safely replace by this patch.
+xorg-server 1.8.99.904 and newer.
 
 Upstream-Status: Pending
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
deleted file mode 100644
index 2b32d4e..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-This is the revised version of files/macro_tweak.patch for
-xorg-server 1.8.99.904.
-
-the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
-are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
-can be safely replace by this patch.
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
index 799b11a..ec29b21 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
@@ -1,2 +1,4 @@
 require xserver-xorg-lite.inc
 require xserver-xorg-${PV}.inc
+
+FILESEXTRAPATHS_append := "${THISDIR}/xserver-xorg:${THISDIR}/xserver-xorg-${PV}:"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
deleted file mode 100644
index 9c33072..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
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
-- 
1.7.7



