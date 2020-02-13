Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 382ED60B65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 13:36:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m10so7142217wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=umV/g/ZrpPsKyI0sKS3QjPy7alvLKnN0B+f7M3jMwo4=;
	b=fxHgipFPRnt2fHxPT5oVn8saAqct3twXBDDHuLPX2l773h7SW1yAHIMUmdOq1zvUUX
	DCP/9VxjFdkk4dhEKw4a7LA+idCM9FB1/FI1RUrAOo/RgwI29SK1L/1RCy/4C4itn3Hc
	MIShNDIYminADFcTwE2oFDU3FR8EGddM2X7f3rBFy7mygvO0TMtViztq++mqWp+CfYv3
	YK9ocjH38r1sjVUHPOl6mFRqp1SjNd2UNtD9WFKSgPcTZlFSc+xj5TdWj4SXrNGaDN9c
	A64VGBuAzXdfu6dvUMRwzP/FQ/UTZEaId1dQgiC0es6XHPHtL6UaWnYJdilFJnfOUgPi
	BEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=umV/g/ZrpPsKyI0sKS3QjPy7alvLKnN0B+f7M3jMwo4=;
	b=oTdccEsJPsE7SkY8y3nT96KTTXelYg1Y/F98DpLf+XgwWo0oJDfRk7N5mNYI5NSjsd
	T5mkN0WrGReM860upwVe3lBzgLIErZRItMUX/d/6CGCVbNBA5RtAxVcDalxOFypBO+77
	1/qPWtcR2crkaYFbf4200JBwaDyket1LI8s0s0LLTYJgH14fe9GUF4bi3wtXSjlQmBrT
	PoyJJRzMgAPn/HnY3FCkzpGKRVhUeNBeLuHd5PXjoHgsUlTJeJBvZ+O8cAdyTn2W06wh
	iDYvwe913batLoKafs4PWCj7JnHEBWrcYCFVmwVg1gX3lJsldTrRayg6PFsqacLPp8Js
	imEg==
X-Gm-Message-State: APjAAAVnSUwMV+Zr1m2cVsoCihURY1XMGIhcE3+bdj7oKyLqIFZv7d3y
	0Vx0nMTKUPU3ColNwuYeE3NCbNcQ
X-Google-Smtp-Source: APXvYqyrBYkJsTW73t9VmPpM272BX+fd4GW3ogFamM1P1Itivp5eUsXMhvdmXSWt4R2c9U9oiYajGw==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr5765582wmc.53.1581600993242; 
	Thu, 13 Feb 2020 05:36:33 -0800 (PST)
Received: from beaker.muppets.liwing.de (p4FE93807.dip0.t-ipconnect.de.
	[79.233.56.7]) by smtp.gmail.com with ESMTPSA id
	a198sm2980598wme.12.2020.02.13.05.36.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 05:36:32 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 14:36:16 +0100
Message-Id: <20200213133616.19507-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [RESEND PATCH v2] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Thu, 13 Feb 2020 13:36:33 -0000

Announcement: https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html

1) Remove upstream provided patches 0001-glob-Do-not-assume-glibc-glob-internals.patch
   and 0002-glob-Do-not-assume-glibc-glob-internals.patch.

2) License has been changed to GPLv3 only

3) Important bug-fix is
   * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html

4) Backward-incompatibilities:
   * Number signs (#) appearing inside a macro reference or function invocation
     no longer introduce comments and should not be escaped with backslashes
   * Previously appending using '+=' to an empty variable would result in a value
     starting with a space.  Now the initial space is only added if the variable
     already contains some value.  Similarly, appending an empty string does not
     add a trailing space.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/make/make.inc           |  4 +-
 ...b-Do-not-assume-glibc-glob-internals.patch | 70 -------------------
 ...b-Do-not-assume-glibc-glob-internals.patch | 38 ----------
 meta/recipes-devtools/make/make_4.2.1.bb      | 12 ----
 meta/recipes-devtools/make/make_4.3.bb        | 10 +++
 5 files changed, 11 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
 delete mode 100644 meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
 delete mode 100644 meta/recipes-devtools/make/make_4.2.1.bb
 create mode 100644 meta/recipes-devtools/make/make_4.3.bb

diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index b8905bc6d3..4142cf23d3 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -5,9 +5,7 @@ called the makefile, which lists each of the non-source files and how to compute
 HOMEPAGE = "http://www.gnu.org/software/make/"
 SECTION = "devel"
 
-SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
-           file://0001-glob-Do-not-assume-glibc-glob-internals.patch \
-           file://0002-glob-Do-not-assume-glibc-glob-internals.patch \
+SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.lz \
            "
 
 inherit autotools gettext pkgconfig texinfo
diff --git a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
deleted file mode 100644
index 2b6e4d40c3..0000000000
--- a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From c90a7dda6c572f79b8e78da44b6ebf8704edef65 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Sun, 24 Sep 2017 09:12:58 -0400
-Subject: [PATCH 1/2] glob: Do not assume glibc glob internals.
-
-It has been proposed that glibc glob start using gl_lstat,
-which the API allows it to do.  GNU 'make' should not get in
-the way of this.  See:
-https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
-
-* dir.c (local_lstat): New function, like local_stat.
-(dir_setup_glob): Use it to initialize gl_lstat too, as the API
-requires.
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- dir.c | 29 +++++++++++++++++++++++++++--
- 1 file changed, 27 insertions(+), 2 deletions(-)
-
-diff --git a/dir.c b/dir.c
-index f34bbf5..12eef30 100644
---- a/dir.c
-+++ b/dir.c
-@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)
- }
- #endif
- 
-+/* Similarly for lstat.  */
-+#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
-+# ifndef VMS
-+#  ifndef HAVE_SYS_STAT_H
-+int lstat (const char *path, struct stat *sbuf);
-+#  endif
-+# else
-+    /* We are done with the fake lstat.  Go back to the real lstat */
-+#   ifdef lstat
-+#     undef lstat
-+#   endif
-+# endif
-+# define local_lstat lstat
-+#elif defined(WINDOWS32)
-+/* Windows doesn't support lstat().  */
-+# define local_lstat local_stat
-+#else
-+static int
-+local_lstat (const char *path, struct stat *buf)
-+{
-+  int e;
-+  EINTRLOOP (e, lstat (path, buf));
-+  return e;
-+}
-+#endif
-+
- void
- dir_setup_glob (glob_t *gl)
- {
-   gl->gl_opendir = open_dirstream;
-   gl->gl_readdir = read_dirstream;
-   gl->gl_closedir = free;
-+  gl->gl_lstat = local_lstat;
-   gl->gl_stat = local_stat;
--  /* We don't bother setting gl_lstat, since glob never calls it.
--     The slot is only there for compatibility with 4.4 BSD.  */
- }
- 
- void
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch b/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
deleted file mode 100644
index d49acd9f6e..0000000000
--- a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9858702dbd1e137262c06765919937660879f63c Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Sun, 24 Sep 2017 09:12:58 -0400
-Subject: [PATCH 2/2] glob: Do not assume glibc glob internals.
-
-It has been proposed that glibc glob start using gl_lstat,
-which the API allows it to do.  GNU 'make' should not get in
-the way of this.  See:
-https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
-
-* dir.c (local_lstat): New function, like local_stat.
-(dir_setup_glob): Use it to initialize gl_lstat too, as the API
-requires.
----
-Upstream-Status: Backport
-
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 64ec870..e87901c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -399,10 +399,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], [make_cv_sys_gnu_glob],
- #include <glob.h>
- #include <fnmatch.h>
- 
--#define GLOB_INTERFACE_VERSION 1
- #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
- # include <gnu-versions.h>
--# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION
-+if _GNU_GLOB_INTERFACE_VERSION == 1 || _GNU_GLOB_INTERFACE_VERSION == 2
-    gnu glob
- # endif
- #endif],
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/make/make_4.2.1.bb b/meta/recipes-devtools/make/make_4.2.1.bb
deleted file mode 100644
index c6e6a0cd58..0000000000
--- a/meta/recipes-devtools/make/make_4.2.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "GPLv3 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
-require make.inc
-
-EXTRA_OECONF += "--without-guile"
-
-SRC_URI[md5sum] = "15b012617e7c44c0ed482721629577ac"
-SRC_URI[sha256sum] = "d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
new file mode 100644
index 0000000000..a3eb9d92f2
--- /dev/null
+++ b/meta/recipes-devtools/make/make_4.3.bb
@@ -0,0 +1,10 @@
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+require make.inc
+
+EXTRA_OECONF += "--without-guile"
+
+SRC_URI[md5sum] = "d5c40e7bd1e97a7404f5d3be982f479a"
+SRC_URI[sha256sum] = "de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


