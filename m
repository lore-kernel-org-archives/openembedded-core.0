Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigy-0005Ww-SP
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:36:24 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1AhotHouGDkgi6HnVUJhhZ3jBB2qVKmqt7zQeJhQ6y8=;
	b=waMHFRpBgIzOZ2S11ibtgMYjr1q73rzO6DQxDRimCh9o6nSCQ/si0a9gK2lL2bspJs
	4F60JE8VRfbjku8RR8lTdusrCvtLKnmeqdUCc8RcCMdaWRnOxyqiNue1H4GufqxPi0Ye
	MSpGGIZfdpx5orTzIR0iR8WiFG3iA4GJBR9Vk=
Received: by 10.204.155.74 with SMTP id r10mr3335575bkw.244.1317648654796;
	Mon, 03 Oct 2011 06:30:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm13234335bkt.5.2011.10.03.06.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:45 +0200
Message-Id: <ea127b6cb6037af8b73d90ee6609ead372482817.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 14/30] xserver-xf86: move patches to xserver-xf86-dri-lite-1.11.1 and use same directory from xserver-xf86-lite recipe
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
X-List-Received-Date: Mon, 03 Oct 2011 13:36:25 -0000

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
 .../fix_open_max_preprocessor_error.patch          |   15 ----------
 .../xserver-xf86-dri-lite/macro_tweak.patch        |   30 --------------------
 .../xserver-xf86-lite/crosscompile.patch           |   22 --------------
 .../xorg-xserver/xserver-xf86-lite_1.11.1.bb       |    2 +
 7 files changed, 3 insertions(+), 73 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xf86-dri-lite-1.11.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xf86-dri-lite-1.11.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xf86-dri-lite-1.11.1}/macro_tweak.patch (74%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/macro_tweak.patch
similarity index 74%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/macro_tweak.patch
index 2b75427..ec0eea6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/macro_tweak.patch
@@ -1,10 +1,5 @@
 This is the revised version of files/macro_tweak.patch for
-xorg-server 1.8.99.904.
-
-the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
-are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
-can be safely replace by this patch.
+xorg-server 1.8.99.904 and newer.
 
 Upstream-Status: Pending
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
deleted file mode 100644
index 9c33072..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
deleted file mode 100644
index 2b75427..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-This is the revised version of files/macro_tweak.patch for
-xorg-server 1.8.99.904.
-
-the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
index 0c1b0fd..e214dec 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
@@ -1,2 +1,4 @@
 require xserver-xf86-lite.inc
 require xserver-xf86-${PV}.inc
+
+FILESEXTRAPATHS_append := "${THISDIR}/xserver-xf86-dri-lite:${THISDIR}/xserver-xf86-dri-lite-${PV}:"
-- 
1.7.7



