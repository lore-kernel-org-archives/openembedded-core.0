Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.11194.1595940587415046443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 05:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=c760x5B5;
 spf=pass (domain: burtonini.com, ip: 209.85.221.68, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f68.google.com with SMTP id r4so15208464wrx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDhNEwpDHbVoArggVgxSYYYpv40yRHm/Ronxds6jCTc=;
        b=c760x5B5fMVSu9bEsTaJ7vY5eTxIlYdPfrbYyEks/Sp71U+cBhgTpQS+9xJ/KDNOgL
         lc/soqvsTZEw4SLzP2bqnUkuuYx3KhgfFSCysbbQlV4nNG5EDUfOc8wvAe2ialSyM48u
         K/bINgFpp3HNxq+K0NJpAqXi67eX9dwtsYIilf3jyEqFOy1Lb022CEsEH7ASp8LaQ7p1
         1N7B1TtLa/WmWH4g7pwUkVI6F95DbbLJbkBRyeUncyq3FGkLYMjc+kaGT78vkOvmHM6s
         RqdfGCr6jCTYDl8vPv0/b0vx+AfQizM0cUPkol2g+fGK2+VdASUVl/f5t8FtXVnIEdr+
         JyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDhNEwpDHbVoArggVgxSYYYpv40yRHm/Ronxds6jCTc=;
        b=a4jOO5wYza+MS93pcQ3HQUWOGzI1hhxSo3Wkr2E7A1hWKKO0KmYYwpNiCJerTLAAE1
         ZiTckxo6v0X9IeIHhq2prwW1N/0u1Ua2lYwam6D6Kod7HkR2dPi6E9D58MJizGZWoqqB
         iH0sVpkMHXvvtQXhA6eYsoWl03PTYkg5lJrmoLL+40cm5/yOURyAimfWt9XnHV9DnjF3
         HKES7Uq/YWQj18a1v13KDdQlndsL8OzWwVQVRMpYjr4vhdZg9pjgIwTwYCEKPAQvkRQ/
         A07IJS/sZddp2Ann82G653XBkFVl4rTxiKVs8gJuLngiTAi0dZjQpvoJaU8pmrW8Dl5T
         LpyQ==
X-Gm-Message-State: AOAM530FWhEuic/xSBDjmxfQ9TGATr7ZTy3a+fBoC8m1YS9COA6+ffjM
	UxkQEIb9c0kjbApSwyyiHZUyqp6Yi40=
X-Google-Smtp-Source: ABdhPJzb/HRWhbS+rYvNK8pVWRJDnPGd2Yy4T9dUzdNHabnSUZDms1gPeZ3JREZct26JrzPjaBuPdg==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr23906080wrm.382.1595940585357;
        Tue, 28 Jul 2020 05:49:45 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id v67sm4337117wma.46.2020.07.28.05.49.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:49:44 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] popt: upgrade to 1.18
Date: Tue, 28 Jul 2020 13:49:43 +0100
Message-Id: <20200728124943.3876567-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

All our patches are upstreamed so drop them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../popt/popt/disable_tests.patch             | 21 ------------------
 .../popt/popt/pkgconfig_fix.patch             | 15 -------------
 .../popt/popt_fix_for_automake-1.12.patch     | 21 ------------------
 meta/recipes-support/popt/popt_1.16.bb        | 22 -------------------
 meta/recipes-support/popt/popt_1.18.bb        | 15 +++++++++++++
 5 files changed, 15 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-support/popt/popt/disable_tests.patch
 delete mode 100644 meta/recipes-support/popt/popt/pkgconfig_fix.patch
 delete mode 100644 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-support/popt/popt_1.16.bb
 create mode 100644 meta/recipes-support/popt/popt_1.18.bb

diff --git a/meta/recipes-support/popt/popt/disable_tests.patch b/meta/recipes-support/popt/popt/disable_tests.patch
deleted file mode 100644
index 016cf66a27..0000000000
--- a/meta/recipes-support/popt/popt/disable_tests.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Use of $(top_srcdir) in TESTS is an error which causes
-automake-1.13 to abort. Just remove tests.
-
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd popt-1.16/Makefile.am popt-1.16/Makefile.am
---- popt-1.16/Makefile.am	2010-05-04 23:55:54.000000000 +0300
-+++ popt-1.16/Makefile.am	2013-01-02 13:34:29.540361391 +0200
-@@ -34,11 +34,6 @@
-
- noinst_SCRIPTS = testit.sh
-
--TESTS_ENVIRONMENT = \
--test1="$(top_builddir)/test1"
--
--TESTS = $(top_srcdir)/testit.sh
--
- include_HEADERS = popt.h
-
- usrlibdir = $(libdir)
diff --git a/meta/recipes-support/popt/popt/pkgconfig_fix.patch b/meta/recipes-support/popt/popt/pkgconfig_fix.patch
deleted file mode 100644
index 0bddbf8c94..0000000000
--- a/meta/recipes-support/popt/popt/pkgconfig_fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Install the pkgconfig file into libdir.
-
---- popt-1.16.orig/Makefile.am	2012-04-26 13:42:54.021139813 +0800
-+++ popt-1.16/Makefile.am	2012-04-26 13:36:03.552096912 +0800
-@@ -47,7 +47,7 @@
- libpopt_la_SOURCES = popt.c poptparse.c poptconfig.c popthelp.c poptint.c
- libpopt_la_LDFLAGS = -no-undefined @LTLIBINTL@ @LTLIBICONV@
- 
--pkgconfigdir = $(prefix)/lib/pkgconfig
-+pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = popt.pc
- 
- if HAVE_LD_VERSION_SCRIPT
diff --git a/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch b/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
deleted file mode 100644
index 7d74aadffe..0000000000
--- a/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: pending
-
-This patch avoids this error with automake 1.12:
-
-| configure.ac:49: error: automatic de-ANSI-fication support has been removed
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: popt-1.16/configure.ac
-===================================================================
---- popt-1.16.orig/configure.ac
-+++ popt-1.16/configure.ac
-@@ -46,7 +46,6 @@ AC_GCC_TRADITIONAL
- AC_SYS_LARGEFILE
- 
- AC_ISC_POSIX
--AM_C_PROTOTYPES
- 
- AC_CHECK_HEADERS(float.h fnmatch.h glob.h langinfo.h libintl.h mcheck.h unistd.h)
- 
diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
deleted file mode 100644
index 27e49c2ca2..0000000000
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Library for parsing command line options"
-HOMEPAGE = "http://rpm5.org/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
-PR = "r3"
-
-DEPENDS = "virtual/libiconv"
-
-SRC_URI = "http://anduin.linuxfromscratch.org/BLFS/popt/popt-${PV}.tar.gz \
-           file://pkgconfig_fix.patch \
-           file://popt_fix_for_automake-1.12.patch \
-           file://disable_tests.patch \
-          "
-
-SRC_URI[md5sum] = "3743beefa3dd6247a73f8f7a32c14c33"
-SRC_URI[sha256sum] = "e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8"
-
-inherit autotools gettext
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-support/popt/popt_1.18.bb
new file mode 100644
index 0000000000..022ece5f47
--- /dev/null
+++ b/meta/recipes-support/popt/popt_1.18.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Library for parsing command line options"
+HOMEPAGE = "https://www.rpm.org/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
+
+DEPENDS = "virtual/libiconv"
+
+SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz"
+SRC_URI[sha256sum] = "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

