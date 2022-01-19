Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0227FC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4667.1642588894937164638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AHCYUGlU;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id p18so4457016wmg.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kc9vyXRBkPfOCLSa7dHiyVeyR2bxMuts0xdoxrpQ8jU=;
        b=AHCYUGlUqPO6sFekVTWD2/LwYmOm+q05XzlZ5JUlv/S6HloYAwgiM0hVvnGGyOscm4
         jYDAH2F/2oAoxP0ce5IusTrZWPKPj/ao1BRpTNhTqSUXeTNTR2WVqi41NtoLxaegPvCS
         dLexm/q4dvP89xcLfK9+1M2Py8zANAZJ6blePPOJshxhTN5uWBbYWaqpsC5vK7NQPwa0
         3MKA9THRq/o8yzpZCQ9CbH/sTxSTsECceOuft6/gArZkstJgb7F5efYzYqYVXOw7K2N1
         LJcGXv7qHDYCaGrMuu2Ak9HxPKrMbMdislduI3BhALda0BpuikLnIgsJRJF7bPUtt/+x
         K0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kc9vyXRBkPfOCLSa7dHiyVeyR2bxMuts0xdoxrpQ8jU=;
        b=mZ6gYvH1R03NS0Vl2c9md+zeG65AsbF9Vm5HYOUIWrjWJeEM0PyBB88Cw0xsmq36HJ
         WoM3h7j8kdqvQjo3tn/JpuuRuLDA9eAro/d3HhPo8x7djt1LjhunGRrC19K6+hqP4kea
         F5KSvg9emyvo7cHuxqKKes19+sBzKEo/oJLvsBepE16R0TIqGBUbq2ZuUTPdK5n+Jq8t
         Rsf6k12iBJRU3rI5JooIrvCRCKy6BMXZqnS4KBHwAGH295chP0DOimLZP6J3heqyEmMR
         G0umVfQwv+SIvcS340iA1rEW+hYKTskgCFkBgUphUKvjYFiSwycBjj2uXoaeYeYjQZBj
         4JIw==
X-Gm-Message-State: AOAM533HnvQKsVzQECgrRwsg5/zRKYMHdlyHuWlWSbAgFoIpCoOzYE/3
	CsbSi8opdDyYw4Is/U/Vlnv3jlTy9CA=
X-Google-Smtp-Source: 
 ABdhPJxeq/8An4E7AIPxJ9nYPdGnmF9RLE+z1QbMbMxMyjP1hQH/4Mwh/BTwiG+6VntjQ3hyQoU2fg==
X-Received: by 2002:a7b:c34b:: with SMTP id l11mr2952644wmj.56.1642588893528;
        Wed, 19 Jan 2022 02:41:33 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 11/39] libunistring: update 0.9.10 -> 1.0
Date: Wed, 19 Jan 2022 11:40:49 +0100
Message-Id: <20220119104117.2120127-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160702

Delete patches, as one is a backport, another patches code that upstream removed.

License-Update: license changed to gplv2+
https://git.savannah.gnu.org/gitweb/?p=libunistring.git;a=commitdiff;h=87f797a50b854a4a2231203c25adbcec4f0dcd05

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...IT_PACKAGE-work-with-Automake-1.16.4.patch | 57 -------------------
 ...charset_alias-when-building-for-musl.patch | 30 ----------
 ...nistring_0.9.10.bb => libunistring_1.0.bb} | 14 ++---
 3 files changed, 5 insertions(+), 96 deletions(-)
 delete mode 100644 meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch
 delete mode 100644 meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-support/libunistring/{libunistring_0.9.10.bb => libunistring_1.0.bb} (63%)

diff --git a/meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch b/meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch
deleted file mode 100644
index d8424f28d4..0000000000
--- a/meta/recipes-support/libunistring/libunistring/0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 15e4365267e316f15222b8bf9f0a7cd0db231e9c Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sun, 8 Aug 2021 01:58:42 +0200
-Subject: [PATCH] Make gl_INIT_PACKAGE work with Automake >= 1.16.4.
-
-Reported and analyzed by Nicole Mazzuca <mazzucan@outlook.com> in
-<https://lists.gnu.org/archive/html/bug-libunistring/2021-08/msg00002.html>.
-
-* m4/init-package-version.m4 (gl_INIT_PACKAGE): Use a new macro
-gl_INIT_EMPTY.
-(gl_INIT_DUMMY): Expand to empty in two steps, via a new macro
-gl_INIT_DUMMY2.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ChangeLog                  | 10 ++++++++++
- m4/init-package-version.m4 | 12 ++++++++----
- 2 files changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/m4/init-package-version.m4 b/m4/init-package-version.m4
-index f131a84..a26b1ab 100644
---- a/m4/init-package-version.m4
-+++ b/m4/init-package-version.m4
-@@ -1,5 +1,5 @@
--# init-package-version.m4 serial 1 (gettext-0.18)
--dnl Copyright (C) 1992-2009 Free Software Foundation, Inc.
-+# init-package-version.m4 serial 2
-+dnl Copyright (C) 1992-2021 Free Software Foundation, Inc.
- dnl This file is free software, distributed under the terms of the GNU
- dnl General Public License.  As a special exception to the GNU General
- dnl Public License, this file may be distributed as part of a program
-@@ -77,7 +77,7 @@ AC_DEFUN([gl_INIT_PACKAGE],
-             m4_bpatsubst(m4_dquote(
-                 m4_defn([AM_INIT_AUTOMAKE])),
-               [AC_PACKAGE_NAME], [gl_INIT_DUMMY])),
--          [AC_PACKAGE_TARNAME], [gl_INIT_DUMMY])),
-+          [AC_PACKAGE_TARNAME], [gl_INIT_EMPTY])),
-       [AC_PACKAGE_VERSION], [gl_INIT_DUMMY])
-     [AC_SUBST([PACKAGE], [$1])
-      AC_SUBST([VERSION], [$2])
-@@ -85,7 +85,11 @@ AC_DEFUN([gl_INIT_PACKAGE],
-   m4_define([AM_INIT_AUTOMAKE],
-     m4_defn([gl_RPL_INIT_AUTOMAKE]))
- ])
--m4_define([gl_INIT_DUMMY], [])
-+m4_define([gl_INIT_EMPTY], [])
-+dnl Automake 1.16.4 no longer accepts an empty value for gl_INIT_DUMMY.
-+dnl But a macro that later expands to empty works.
-+m4_define([gl_INIT_DUMMY], [gl_INIT_DUMMY2])
-+m4_define([gl_INIT_DUMMY2], [])
- AC_DEFUN([gl_RPL_INIT_AUTOMAKE], [
-   m4_ifval([$2],
-     [m4_fatal([After gl_INIT_PACKAGE, the two-argument form of AM_INIT_AUTOMAKE cannot be used.])])
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 2aeacb868e..0000000000
--- a/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libunistring-0.9.4/lib/Makefile.gnulib
-===================================================================
---- libunistring-0.9.4.orig/lib/Makefile.gnulib
-+++ libunistring-0.9.4/lib/Makefile.gnulib
-@@ -380,7 +380,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.10.bb b/meta/recipes-support/libunistring/libunistring_1.0.bb
similarity index 63%
rename from meta/recipes-support/libunistring/libunistring_0.9.10.bb
rename to meta/recipes-support/libunistring/libunistring_1.0.bb
index 0692bbcb44..31c84cb790 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.10.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.0.bb
@@ -13,19 +13,15 @@ DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
 
 HOMEPAGE = "http://www.gnu.org/software/libunistring/"
 SECTION = "devel"
-LICENSE = "LGPLv3+ | GPLv2"
+LICENSE = "LGPLv3+ | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-                    file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
-                    file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
+                    file://README;beginline=45;endline=65;md5=3a896a943b4da2c551e6be1af27eff8d \
+                    file://doc/libunistring.texi;md5=266e4297d7c18f197be3d9622ba99685 \
                    "
 DEPENDS = "gperf-native"
 
-SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://0001-Make-gl_INIT_PACKAGE-work-with-Automake-1.16.4.patch \
-"
-SRC_URI[md5sum] = "0d3274e9838396b12200f8b54ddaf43b"
-SRC_URI[sha256sum] = "a82e5b333339a88ea4608e4635479a1cfb2e01aafb925e1290b65710d43f610b"
+SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
+SRC_URI[sha256sum] = "3c0184c0e492d7c208ce31d25dd1d2c58f0c3ed6cbbe032c5b248cddad318544"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


