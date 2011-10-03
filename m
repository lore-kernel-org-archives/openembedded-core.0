Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAii5-0005Ww-32
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:37:34 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wcz01tEo8y0rQqELRiwh2pHeDnboJiz/uID+TLuqZ1k=;
	b=eNxctc/OeWOnOeRRw3u/hhligEEOJTjD7DqLFBq5O9h5hJSQpAfqt+YqzTdkvvbXnc
	SMmPKG2CLJ+FnLvN26QDPN8aiUzTcZIOrbgTWhSWX9L5ZL/B87/r+ZEoKp17uSPhouoZ
	1HImegy90YUAQfBTamK2KkIC89H5lDC4dX/eE=
Received: by 10.204.130.65 with SMTP id r1mr9534690bks.312.1317648719925;
	Mon, 03 Oct 2011 06:31:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm13229144bkw.9.2011.10.03.06.31.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:31:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:53 +0200
Message-Id: <e370b21918b0c0656a7aac976b991176fc89eb6b.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 22/30] libx11-trim: move files for libx11-trim from libx11-1.3.4 to libx11-trim-1.3.4
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
X-List-Received-Date: Mon, 03 Oct 2011 13:43:00 -0000

* because there isn't libx11-1.3.4 recipe anymore
* remove older versions from libx11-trim directory
* notice that DESCRIPTION says xcb is disabled and EXTRA_OECONF has
  --with-xcb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{libx11 => libx11-diet-1.3}/X18NCMSstubs.diff  |    0
 .../fix-disable-xlocale.diff                       |    0
 .../fix-utf8-wrong-define.patch                    |    0
 .../include_fix.patch                              |    0
 .../makekeys_crosscompile.patch                    |    0
 .../nodolt.patch                                   |    0
 .../x11_disable_makekeys.patch                     |    0
 .../xorg-lib/libx11-trim/include_fix.patch         |   25 ----------------
 .../xorg-lib/libx11-trim/nodolt.patch              |   14 ---------
 .../libx11-trim/x11_disable_makekeys.patch         |   31 --------------------
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |    8 ++--
 11 files changed, 4 insertions(+), 74 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/X18NCMSstubs.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/fix-disable-xlocale.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/fix-utf8-wrong-define.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/include_fix.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/nodolt.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/x11_disable_makekeys.patch (100%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/X18NCMSstubs.diff
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.3/X18NCMSstubs.diff
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-disable-xlocale.diff
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-disable-xlocale.diff
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-utf8-wrong-define.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.3/fix-utf8-wrong-define.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-1.3.4/include_fix.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-1.3.4/makekeys_crosscompile.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-1.3.4/nodolt.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
deleted file mode 100644
index b3bcbab..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.ac |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- libX11-1.1.5.orig/configure.ac
-+++ libX11-1.1.5/configure.ac
-@@ -218,13 +218,13 @@ AC_SUBST(XDMCP_LIBS)
- AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
- 
- #
- # Find keysymdef.h
- #
--AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+ 	KEYSYMDEF=$withval, KEYSYMDEF="")
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
- fi
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
deleted file mode 100644
index cc05fdc..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libX11-1.2.1/configure.ac
-===================================================================
---- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
-+++ libX11-1.2.1/configure.ac	2009-07-02 14:08:01.000000000 +0100
-@@ -20,7 +20,6 @@
- 
- # Checks for programs.
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_CC
- XORG_CWARNFLAGS
- 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch
deleted file mode 100644
index 0445835..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- src/util/Makefile.am |   17 -----------------
- 1 file changed, 17 deletions(-)
-
-Index: libX11-1.2.1/src/util/Makefile.am
-===================================================================
---- libX11-1.2.1.orig/src/util/Makefile.am	2008-10-07 18:18:19.000000000 +0100
-+++ libX11-1.2.1/src/util/Makefile.am	2009-07-02 14:04:38.000000000 +0100
-@@ -1,20 +1,3 @@
- # $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
- 
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--CC = @CC_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
index 18cd10a..c505b24 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
@@ -9,9 +9,9 @@ PR = "r1"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
-SRC_URI += "file://../libx11-${PV}/x11_disable_makekeys.patch \
-            file://../libx11-${PV}/include_fix.patch \
-            file://../libx11-${PV}/nodolt.patch \
-            file://../libx11-${PV}/makekeys_crosscompile.patch"
+SRC_URI += "file://x11_disable_makekeys.patch \
+            file://include_fix.patch \
+            file://nodolt.patch \
+            file://makekeys_crosscompile.patch"
 
 EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-xcms --with-xcb"
-- 
1.7.7



