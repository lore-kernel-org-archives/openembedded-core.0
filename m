Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8FA7FD87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:47:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so3898381wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/RPOj+nWN0WuHSIx3qDjs4aKJ8E1VJD3rUHcYRjUa80=;
	b=PmQHGDsI5ycBjCCrJNvMcGT9ts5+cV1+qVOMWElrTVl+WCyzOT4s2R85o57O6vTuGO
	TKygDjsCLdqajUGZYfiKmx5Zzobfpm3rSIidGO3uWQTRXTtnbRWv5KU4LVuJnUaiBin6
	cHJAeiOhXJ6s4D+a230T0wJ8IPNp8smYDKB0oLIn4u3UDnFbmT80xAQgp2htr8d9aI81
	vWDcUZZuhehw8tj2hGo4uB9NeGqsx3MiQIPS+bx2Y/jUHExv/R+jZOJaaP/ATrEUqAdh
	8xBRNdMVn82rlNq1hehHFrg1/IYuU6WicaFcpPLOL+YkiOllODGdp3IK/niX1jBc46zv
	RcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/RPOj+nWN0WuHSIx3qDjs4aKJ8E1VJD3rUHcYRjUa80=;
	b=CycTkFxh9Sna94OuIqwKEBeyMOIWqv/S8BqFawW9nzOBF60VWV2wZtEz+hsgr3BLaL
	FybKq09D70BudeacuronVVsmeB7a3Pci7orylYrcMcfOBYVDwH1p8JSflRAQC3IpOChe
	Z8KYUqSPq+IEtE3C8GFWZJviIXdHywWIkwOiy5AI4mXc3QHtLHwZMOHK/sXeYzPnyXB5
	yR5maqTsQdQFKaCUS5g36e87zZ20ylGhf1RqzOmDe3qfE6JIcmwgXVRoCbDWc8ZWQfBb
	OZg6EshShvJljw/Wml9LxbDvEn+i8GPhYkmLk7DOPonnP72BYnE6n6S/pZv0uDxCQwrd
	f2eA==
X-Gm-Message-State: APjAAAU0xhm89/q3MlxrrvKos3D9VT8/viRhkMruQrVTrvNks+owEH6N
	Nfml1CA7w/LFren/xg7aQukQtR/zzVk=
X-Google-Smtp-Source: APXvYqyXPJOGYIV8WSeWzfPTzszpzpiFTMxT+UGmnrTszFiNmg8HzeZ+dWSnzG8/7hkFIYgrHiONDQ==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr5120979wmc.36.1579625260694; 
	Tue, 21 Jan 2020 08:47:40 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	m10sm53931770wrx.19.2020.01.21.08.47.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 08:47:40 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 17:47:33 +0100
Message-Id: <20200121164733.13892-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Tue, 21 Jan 2020 16:47:40 -0000

1) Remove upstream provided patches 0001-glob-Do-not-assume-glibc-glob-internals.patch
   and 0002-glob-Do-not-assume-glibc-glob-internals.patch.

2) License has been changed to GPLv3 only

3) Important bug-fix is
   * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html

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


