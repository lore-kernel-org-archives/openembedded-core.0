Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E2BA779567
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:41:39 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j25-v6so3407946wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hv76uffxHkiR2+zLnTuaOgXhvUu4oXk0nAXdte1Fzr0=;
	b=Equ6Q+cdLzG+McZb1EqhkFxMBun6fTHIrWjjBVb3DK/0sR1EQKCk4UJa3qA0V6sogh
	R84sCsFCDeMAc8Xdj3TsBrDgzPF4SQLd8jOYPelj4gDe8Bnmmjw3ZmWSTLhMuPYqcULE
	nove275UB5coWpiufhT4iszyYOfg00ndLw9Z/HjR4alY83+NoVgpa3px6LqwihuY48JD
	Jb0giq9gDkiFPnNyRFHoN6A6qvmDz5ROtu21bCjQrE0+lD4ciH40Q4CstRX8M7dscFda
	IrrV205H6MXNRorUlyaK2yrnWUtQ/kRvYAueczM4S418lUdB70QUk+zn4KEXnGf4O965
	FsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hv76uffxHkiR2+zLnTuaOgXhvUu4oXk0nAXdte1Fzr0=;
	b=Rltq15unf9mk8xQogx2YOkD9m3ygOWiIHHyJLnyeW31V2x8oqQXI8bp1Lbxy/Gzit9
	lUqGotqlIwDh6EkupjGdL1XbUajmqdTlVDZ65gdjIs/4EMLE43p5fOVmpABWElT6ZBrj
	ACFXXfjXRv1G6prQR7eQy4o8rk9dkH1jnPHD+6izgoOGjCORsnYxVjj7GOC78nA3iBoz
	q1ylwhY24ErbNOk8FWI1BZwmPjNH27rH8p5/Buoxb42/1Rjocn6T2IRAmERJr6oyKedB
	xpY1+IQ+a7eIdPy6YJ8EmwLMvCw1h/Sf9XXkJI3ahJVL+qzmoZbm1n4XZ39Il0qbFi5N
	LOOA==
X-Gm-Message-State: APzg51DW6GZRbZI4fc7N9t3JmKanyvPV8oYSLvYKboFzdQyPIdyX3Ve0
	CzAgKbnjx05WrFjI/3FyFBDM3AD56XA=
X-Google-Smtp-Source: ANB0Vda4e+D2gQmf5a8cf5+qYM+S0CY7AlFHLKlDFcJ9XzIK4kWFSKMdXkVKwk/+m7HdiXBkI/XgoA==
X-Received: by 2002:a1c:ac1:: with SMTP id
	184-v6mr4679466wmk.119.1535722900200; 
	Fri, 31 Aug 2018 06:41:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h73-v6sm12602991wma.11.2018.08.31.06.41.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:41:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 14:41:36 +0100
Message-Id: <20180831134136.18889-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180831134136.18889-1-ross.burton@intel.com>
References: <20180831134136.18889-1-ross.burton@intel.com>
Subject: [PATCH 2/2] pango: upgrade
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
X-List-Received-Date: Fri, 31 Aug 2018 13:41:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...op-introspection-macros-from-acinclude.m4.patch | 120 ---------------------
 .../pango/{pango_1.40.14.bb => pango_1.42.4.bb}    |  11 +-
 2 files changed, 4 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
 rename meta/recipes-graphics/pango/{pango_1.40.14.bb => pango_1.42.4.bb} (85%)

diff --git a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
deleted file mode 100644
index 9e1626e9a0d..00000000000
--- a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 867a512eddbeb1899d3e7096df3da1dd0ce3e7b7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 23 Oct 2015 14:06:17 +0300
-Subject: [PATCH] Drop introspection macros from acinclude.m4
-
-They take precendence over our customized macros, and so
-introspection doesn't work correctly.
-
-Upstream-Status: Backport [upstream 5ccfe0]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- acinclude.m4 | 96 ------------------------------------------------------------
- 1 file changed, 96 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 8899c7c..48fd5d8 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -55,99 +55,3 @@ AC_DEFUN([JH_CHECK_XML_CATALOG],
- ])
- 
- 
--dnl REMOVE THIS WHEN introspection.m4 is widely available
--dnl
--dnl -*- mode: autoconf -*-
--dnl Copyright 2009 Johan Dahlin
--dnl
--dnl This file is free software; the author(s) gives unlimited
--dnl permission to copy and/or distribute it, with or without
--dnl modifications, as long as this notice is preserved.
--dnl
--
--# serial 1
--
--m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
--[
--    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
--    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
--    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
--
--    dnl enable/disable introspection
--    m4_if([$2], [require],
--    [dnl
--        enable_introspection=yes
--    ],[dnl
--        AC_ARG_ENABLE(introspection,
--                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
--                                 [Enable introspection for this build]),, 
--                                 [enable_introspection=auto])
--    ])dnl
--
--    AC_MSG_CHECKING([for gobject-introspection])
--
--    dnl presence/version checking
--    AS_CASE([$enable_introspection],
--    [no], [dnl
--        found_introspection="no (disabled, use --enable-introspection to enable)"
--    ],dnl
--    [yes],[dnl
--        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
--                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
--        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
--                         found_introspection=yes,
--                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
--    ],dnl
--    [auto],[dnl
--        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
--    ],dnl
--    [dnl	
--        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
--    ])dnl
--
--    AC_MSG_RESULT([$found_introspection])
--
--    INTROSPECTION_SCANNER=
--    INTROSPECTION_COMPILER=
--    INTROSPECTION_GENERATE=
--    INTROSPECTION_GIRDIR=
--    INTROSPECTION_TYPELIBDIR=
--    if test "x$found_introspection" = "xyes"; then
--       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
--       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
--       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
--       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
--       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
--       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
--    fi
--    AC_SUBST(INTROSPECTION_SCANNER)
--    AC_SUBST(INTROSPECTION_COMPILER)
--    AC_SUBST(INTROSPECTION_GENERATE)
--    AC_SUBST(INTROSPECTION_GIRDIR)
--    AC_SUBST(INTROSPECTION_TYPELIBDIR)
--    AC_SUBST(INTROSPECTION_CFLAGS)
--    AC_SUBST(INTROSPECTION_LIBS)
--    AC_SUBST(INTROSPECTION_MAKEFILE)
--
--    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
--])
--
--
--dnl Usage:
--dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
--
--AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
--[
--  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
--])
--
--dnl Usage:
--dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
--
--
--AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
--[
--  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
--])
--- 
-2.1.4
diff --git a/meta/recipes-graphics/pango/pango_1.40.14.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
similarity index 85%
rename from meta/recipes-graphics/pango/pango_1.40.14.bb
rename to meta/recipes-graphics/pango/pango_1.42.4.bb
index 3bd9c647161..e73fd28dfda 100644
--- a/meta/recipes-graphics/pango/pango_1.40.14.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -14,20 +14,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
-SRC_URI[archive.md5sum] = "18d7eb8d52e7e445e733c109ddaa7b78"
-SRC_URI[archive.sha256sum] = "90af1beaa7bf9e4c52db29ec251ec4fd0a8f2cc185d521ad1f88d01b3a6a17e3"
+SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
+SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
 
-DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
+DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
 
-EXTRA_OECONF = " \
-	        --disable-debug \
-	        "
+EXTRA_OECONF = "--disable-debug"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
-- 
2.11.0


