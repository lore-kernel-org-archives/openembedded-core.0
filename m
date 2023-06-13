Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49AAC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 12:46:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.12089.1686660397362753052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 05:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kJYm1dc2;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso36484985e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686660395; x=1689252395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9yaXgtGzCS49OEX5uTKlETy8xllLsz2XO0LqzC6X34=;
        b=kJYm1dc2sT/0BJ52nU78zcgzKn23osT2lvnt8uYLZH8T3ClDGLnMbhYE6jx++1UJab
         07DLJiYcKJVqUx6vcrjwKogGvnx7sp49hh7AZdysCfMuGa/91tMiTX26fdOr+oa6Na2S
         Fd0xVnT43xWrUSdi18v1tB0ypCeHAk8pmN9q+g2hh4t7NQhSZFUYFScaPYJGyuAb63c/
         8gciHkUeOYFvEouk/qAId70OuTkDYuTkpPxN4aLPDbqDPZRKkq7ao/OzGYfhJxT3KZIs
         Gzuz81/vdaXP6GU0isg1YCCQFXA9QccVRTb0lhApv1DNL9HVWmtpX2qOA5Pz7zy4ak2a
         U6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686660395; x=1689252395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9yaXgtGzCS49OEX5uTKlETy8xllLsz2XO0LqzC6X34=;
        b=KNpKukvC1sh1tuBVA+4NOluOgxyvDycs8ONz+SD9E8w8Ft2MfrwKwwkoab3oeeVT/u
         Cmn65ORlzGd8v/WJXsCG4qM5I9AkYYUsiKbviUYvpk+vMk2/lu9Htu3qQ2o+Iw85AwiM
         JYRFujsa7zntjIUS2wmLHIE1SreuczBtKXgy42g/0liUi5RFBev5uh3CNll9xrj+Ixsq
         auMjCvAe1H127u6zXDabCktQrZ7zXYrBN1YPv934mGwHMZtB2SFjcwruvPpTp7/F1gAR
         dlCOfv8XIWZhT4PKlWXt4IGsm9/vRUMVIqYqkzsZjG0T+GOJFP6CBfE1e3nXLJYgUgTE
         LaWQ==
X-Gm-Message-State: AC+VfDzICXiFXkeX0djXhcra47uFuRP3ty1M7rWWlKOxeEPy/472yNoa
	ixccogJWM3p9OJqbacp8d1EybVZhvQc=
X-Google-Smtp-Source: ACHHUZ6O4Jse6KPXFdkBQqHn6C1f27oYQWpxFNcZUxu7v/3sEcy9muSMnP6nesi9OhC+i+xhmyo7BA==
X-Received: by 2002:adf:dd41:0:b0:30f:c534:bbfe with SMTP id u1-20020adfdd41000000b0030fc534bbfemr3911245wrm.6.1686660395142;
        Tue, 13 Jun 2023 05:46:35 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0030ab5ebefa8sm15198299wrr.46.2023.06.13.05.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 05:46:34 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] eudev: Upgrade 3.2.11 -> 3.2.12
Date: Tue, 13 Jun 2023 13:46:20 +0100
Message-Id: <20230613124620.2059-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 12:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182714

Drop upstreamed remove dead g-i-r configuration.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...uild-Remove-dead-g-i-r-configuration.patch | 155 ------------------
 .../udev/{eudev_3.2.11.bb => eudev_3.2.12.bb} |   3 +-
 2 files changed, 1 insertion(+), 157 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch
 rename meta/recipes-core/udev/{eudev_3.2.11.bb => eudev_3.2.12.bb} (94%)

diff --git a/meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch b/meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch
deleted file mode 100644
index 2836f30c3adf..000000000000
--- a/meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 520c4d451efc488573746f169d8e47d5a131afc2 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Fri, 20 May 2022 09:35:08 +0100
-Subject: [PATCH] build: Remove dead g-i-r configuration
-
-g-i-r support was removed in 2015 as part of removal of Gobject libudev
-support, but the autoconf support wasn't removed but is dead.
-
-Fixes: 252150e181c5 ("src/gudev: remove Gobject libudev support.")
-Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/231]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@zuma.ai>
----
- configure.ac        | 12 ------
- m4/introspection.m4 | 96 ---------------------------------------------
- 2 files changed, 108 deletions(-)
- delete mode 100644 m4/introspection.m4
-
-diff --git a/configure.ac b/configure.ac
-index 85a524a618ae..987d5037ae77 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -183,17 +183,8 @@ AC_SUBST([udevrulesdir],[${udevlibexecdir}/rules.d])
- AC_SUBST([pkgconfiglibdir], [${libdir}/pkgconfig])
- AC_SUBST([sharepkgconfigdir],[${datadir}/pkgconfig])
- 
--# introspection paths
--AC_SUBST([girdir], [${datadir}/gir-1.0])
--AC_SUBST([typelibsdir], [${libdir}/girepository-1.0])
--
- AC_SUBST([rootrundir],[${with_rootrundir}])
- 
--# ------------------------------------------------------------------------------
--
--GOBJECT_INTROSPECTION_CHECK([1.31.1])
--AM_CONDITIONAL([HAVE_INTROSPECTION], [test "$enable_introspection" = "yes"])
--
- # ------------------------------------------------------------------------------
- AC_ARG_ENABLE([programs],
- 	AS_HELP_STRING([--disable-programs], [disable programs (udevd, udevadm and helpers)]),
-@@ -349,9 +340,6 @@ AC_MSG_RESULT([
- 
- 	pkgconfiglibdir:         ${libdir}/pkgconfig
- 	sharepkgconfigdir        ${datadir}/pkgconfig
--
--	girdir                   ${datadir}/gir-1.0
--	typelibsdir              ${libdir}/girepository-1.0
- ])
- 
- # ------------------------------------------------------------------------------
-diff --git a/m4/introspection.m4 b/m4/introspection.m4
-deleted file mode 100644
-index d89c3d907d9c..000000000000
---- a/m4/introspection.m4
-+++ /dev/null
-@@ -1,96 +0,0 @@
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
--	dnl Canonicalize enable_introspection
--	enable_introspection=$found_introspection
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
-2.35.1
-
diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.12.bb
similarity index 94%
rename from meta/recipes-core/udev/eudev_3.2.11.bb
rename to meta/recipes-core/udev/eudev_3.2.12.bb
index eba36c2f9175..572ccecafd0c 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.12.bb
@@ -12,10 +12,9 @@ PROVIDES = "udev"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
-           file://0001-build-Remove-dead-g-i-r-configuration.patch \
 "
 
-SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
+SRC_URI[sha256sum] = "ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5eacb9ad8"
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-- 
2.39.0


