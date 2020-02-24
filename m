Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10929606F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:39:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so9665627wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=q+GZvQZJdh5znT0Oyv0TG0hnGBOHCvi6MN1jEAO2puk=;
	b=dOkRidLuwiiMk98ag9aUXCKNraMxN5AAK7M/bnY6ghTvf2tmt+96FQbhMWTpDI5qWp
	++gCi2T5kO8/Ie5EOgfPm67/Z64TC1JpvnV1CsxGIDYGAeuBLv7+i+Og8RKZv8htlPPY
	OvVD+9KN+Fky36gR3pNJcb7n/XOrqmPQKglMkYFEfS6BS+GRj9EbElj6KrP4ZjIV9AMo
	Mh8q1Fi/6ZUCi1JdyfiyIkKEEp7HiMWjEKLe1GySiPW4yBgfm6JTkLCIvIgABy7tUOw6
	E5yIe9H++J8AIgW3K9e7DJc4ziqR8YgRgKn/VuFcGuM9V2lH00mNgmjuleybTrA3HiTE
	SQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=q+GZvQZJdh5znT0Oyv0TG0hnGBOHCvi6MN1jEAO2puk=;
	b=JjeNXnBTGBQLr/UMmw920er2vJoJwn+Esw9nyo1vDn/8QTKBkwIJXBT8hyLcr61vpE
	brMjz9sjiIjyA76AfZDGuXolH7AFMBALOhjlirxawxOrlxYQ5y8z9AmAYWmK1C2P7tQT
	e3RwRhs9i80SwF3XlmbUUmwJmtboPDC9/XiC+L6tNPjsC13cxuAvqDSIcNMNsdFaqiFw
	C8XHCjTuiuqe0yzmVJfOBBpdl8RjxMm5tyanRTPuUhNIPtohdA99U0Dl0MBIvTryq3GA
	Kg1uEEDsFw5xMNeG8/1JbYGO9HrRyAqjr/1K0npwp6KS6mqVS+m7XEzYgWhAODEltAAz
	N6zw==
X-Gm-Message-State: APjAAAUGO1paEWId6qFhiRGulsioKw9gpLfogPyijeb2ZnzzH5OseTcA
	iEUa5qWZIdcRmafjwQpFOwBeTcJt
X-Google-Smtp-Source: APXvYqyRz6hWMQmFJYjB1ksKky2vKxSkbhbnin+qPwKAeWE6I4Nub5DLv6+AlRj4fMskOnn5VpXNmQ==
X-Received: by 2002:a1c:16:: with SMTP id 22mr22609867wma.8.1582555175611;
	Mon, 24 Feb 2020 06:39:35 -0800 (PST)
Received: from beaker.muppets.liwing.de (p4FE93807.dip0.t-ipconnect.de.
	[79.233.56.7]) by smtp.gmail.com with ESMTPSA id
	q6sm12500526wrf.67.2020.02.24.06.39.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 06:39:34 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 15:39:20 +0100
Message-Id: <20200224143920.19383-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH v3] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Mon, 24 Feb 2020 14:39:36 -0000

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

Fix incompatibility issues between gnulib bundled with updated make fix issues
in w32 compat sources.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/make/make.inc           |  4 +-
 ...b-Do-not-assume-glibc-glob-internals.patch | 70 ----------------
 ...m4-restrict-AIX-specific-test-on-AIX.patch | 38 +++++++++
 ...rc-dir.c-fix-buffer-overflow-warning.patch | 41 ++++++++++
 ...b-Do-not-assume-glibc-glob-internals.patch | 38 ---------
 ...low-being-detected-by-importing-proj.patch | 33 ++++++++
 ...02-w32-compat-dirent.c-follow-header.patch | 36 +++++++++
 ...-posixfcn-fcntl-gnulib-make-emulated.patch | 79 +++++++++++++++++++
 meta/recipes-devtools/make/make_4.2.1.bb      | 12 ---
 meta/recipes-devtools/make/make_4.3.bb        | 18 +++++
 10 files changed, 246 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
 create mode 100644 meta/recipes-devtools/make/make/0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch
 create mode 100644 meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch
 delete mode 100644 meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
 create mode 100644 meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
 create mode 100644 meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch
 create mode 100644 meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
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
diff --git a/meta/recipes-devtools/make/make/0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch b/meta/recipes-devtools/make/make/0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch
new file mode 100644
index 0000000000..096bcfdf78
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch
@@ -0,0 +1,38 @@
+From 8309601775d9442416329a77f7dcfd8aa799e9a6 Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Fri, 21 Feb 2020 17:39:56 +0100
+Subject: [PATCH 1/2] m4/getloadavg.m4: restrict AIX specific test on AIX
+
+When cross compiling for a system without getloadavg, do not try add
+additional linker paths unless it's absolutely necessary.
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+Upstream-Status: Pending
+ m4/getloadavg.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
+index 3bd2a14..696c5de 100644
+--- a/m4/getloadavg.m4
++++ b/m4/getloadavg.m4
+@@ -42,6 +42,8 @@ AC_CHECK_FUNC([getloadavg], [],
+    fi
+ 
+    if test $gl_func_getloadavg_done = no; then
++     AS_CASE([$host_os],
++             [aix*], [
+      # There is a commonly available library for RS/6000 AIX.
+      # Since it is not a standard part of AIX, it might be installed locally.
+      gl_getloadavg_LIBS=$LIBS
+@@ -49,6 +51,7 @@ AC_CHECK_FUNC([getloadavg], [],
+      AC_CHECK_LIB([getloadavg], [getloadavg],
+                   [LIBS="-lgetloadavg $LIBS" gl_func_getloadavg_done=yes],
+                   [LIBS=$gl_getloadavg_LIBS])
++       ], [:])
+    fi
+ 
+    # Set up the replacement function if necessary.
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch b/meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch
new file mode 100644
index 0000000000..57970824f6
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch
@@ -0,0 +1,41 @@
+From cd7091a7d88306004ca98c5dafcc40f44589b105 Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Mon, 24 Feb 2020 10:52:21 +0100
+Subject: [PATCH 1/3] src/dir.c: fix buffer-overflow warning
+
+Fix compiler warning:
+	src/dir.c:1294:7: warning: 'strncpy' specified bound depends on the
+			  length of the source argument [-Wstringop-overflow=]
+
+The existing code assumes `path` will never exceed `MAXPATHLEN`. Also the
+size of the buffer is increased by 1 to hold a path with the length of
+`MAXPATHLEN` and trailing `0`.
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+Upstream-Status: Pending (https://savannah.gnu.org/bugs/?57888)
+
+ src/dir.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/dir.c b/src/dir.c
+index 862a18e..cad4c4a 100644
+--- a/src/dir.c
++++ b/src/dir.c
+@@ -1289,10 +1289,10 @@ local_stat (const char *path, struct stat *buf)
+   if (plen > 1 && path[plen - 1] == '.'
+       && (path[plen - 2] == '/' || path[plen - 2] == '\\'))
+     {
+-      char parent[MAXPATHLEN];
++      char parent[MAXPATHLEN+1];
+ 
+-      strncpy (parent, path, plen - 2);
+-      parent[plen - 2] = '\0';
++      strncpy (parent, path, MAXPATHLEN);
++      parent[MIN(plen - 2, MAXPATHLEN)] = '\0';
+       if (stat (parent, buf) < 0 || !_S_ISDIR (buf->st_mode))
+         return -1;
+     }
+-- 
+2.17.1
+
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
diff --git a/meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch b/meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
new file mode 100644
index 0000000000..b3d97f9a3a
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
@@ -0,0 +1,33 @@
+From fb8aaed3b040e589cd880fd714dda5ec00687217 Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Mon, 24 Feb 2020 12:10:06 +0100
+Subject: [PATCH 2/2] modules: fcntl: allow being detected by importing
+ projects
+
+GNU project `make` relies on gnulib but provides some own compatibility
+functions - including an `fcntl`, which fails on mingw.
+The intension of gnulib is providing these functions and being wider tested,
+but silently injecting a function opens battle of compatibility layers.
+
+So adding a hint into target `config.h` to allow deciding whether using
+an own compatibility implementation or not.
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+Upstream-Status: Pending
+
+ m4/gnulib-comp.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
+index 3ee0811..cf75541 100644
+--- a/m4/gnulib-comp.m4
++++ b/m4/gnulib-comp.m4
+@@ -147,6 +147,7 @@
+   gl_FUNC_FCNTL
+   if test $HAVE_FCNTL = 0 || test $REPLACE_FCNTL = 1; then
+     AC_LIBOBJ([fcntl])
++    AC_DEFINE(HAVE_GNULIB_FCNTL, 1, [Define to 1 if you have the `fcntl' function via gnulib.])
+   fi
+   gl_FCNTL_MODULE_INDICATOR([fcntl])
+   gl_FCNTL_H
diff --git a/meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch b/meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch
new file mode 100644
index 0000000000..9ecc44543e
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch
@@ -0,0 +1,36 @@
+From 4dd8b4f43aa0078707ad9a7932f4e137bc4383ed Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Mon, 24 Feb 2020 11:12:43 +0100
+Subject: [PATCH 2/3] w32: compat: dirent.c: follow header
+
+src/w32/include/dirent.h completely delegates to mingw dirent implementation,
+gnulib detects it as fine and completely usable - trust in that.
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+Upstream-Status: Pending (https://savannah.gnu.org/bugs/?57888)
+
+ src/w32/compat/dirent.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/w32/compat/dirent.c b/src/w32/compat/dirent.c
+index b8ec615..de80f72 100644
+--- a/src/w32/compat/dirent.c
++++ b/src/w32/compat/dirent.c
+@@ -23,7 +23,7 @@ this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #include <stdlib.h>
+ #include "dirent.h"
+ 
+-
++#ifndef __MINGW32__
+ DIR*
+ opendir(const char* pDirName)
+ {
+@@ -193,3 +193,4 @@ seekdir(DIR* pDir, long nPosition)
+ 
+         return;
+ }
++#endif  /* !__MINGW32__ */
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch b/meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
new file mode 100644
index 0000000000..70414c51f4
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
@@ -0,0 +1,79 @@
+From 3d074c8fca5fcf3e6b83d33788f35a8f1b3a44a2 Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Fri, 21 Feb 2020 19:29:49 +0100
+Subject: [PATCH 3/3] posixfcn: fcntl: gnulib > make-emulated
+
+Rate the fcntl emulation from gnulib higher than the own one.
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+Upstream-Status: Pending (https://savannah.gnu.org/bugs/?57888)
+
+ src/output.h              | 19 ++++++++++++++-----
+ src/w32/compat/posixfcn.c |  2 ++
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/src/output.h b/src/output.h
+index a506505..d3ce6b7 100644
+--- a/src/output.h
++++ b/src/output.h
+@@ -67,14 +67,21 @@ void output_dump (struct output *out);
+ 
+ # ifdef WINDOWS32
+ /* For emulations in w32/compat/posixfcn.c.  */
+-#  define F_GETFD 1
+-#  define F_SETLKW 2
++#  ifndef F_GETFD
++#   define F_GETFD 1
++#  endif
++#  ifndef F_SETLKW
++#   define F_SETLKW 2
++#  endif
+ /* Implementation note: None of the values of l_type below can be zero
+    -- they are compared with a static instance of the struct, so zero
+    means unknown/invalid, see w32/compat/posixfcn.c. */
+-#  define F_WRLCK 1
+-#  define F_UNLCK 2
+-
++#  ifndef F_WRLCK
++#   define F_WRLCK 1
++#  endif
++#  ifndef F_UNLCK
++#   define F_UNLCK 2
++#  endif
+ struct flock
+   {
+     short l_type;
+@@ -89,7 +96,9 @@ struct flock
+ typedef intptr_t sync_handle_t;
+ 
+ /* Public functions emulated/provided in posixfcn.c.  */
++#  ifndef HAVE_GNULIB_FCNTL
+ int fcntl (intptr_t fd, int cmd, ...);
++#  endif
+ intptr_t create_mutex (void);
+ int same_stream (FILE *f1, FILE *f2);
+ 
+diff --git a/src/w32/compat/posixfcn.c b/src/w32/compat/posixfcn.c
+index 975dfb7..d337b9c 100644
+--- a/src/w32/compat/posixfcn.c
++++ b/src/w32/compat/posixfcn.c
+@@ -29,6 +29,7 @@ this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ #ifndef NO_OUTPUT_SYNC
+ /* Support for OUTPUT_SYNC and related functionality.  */
+ 
++#ifndef HAVE_GNULIB_FCNTL
+ /* Emulation of fcntl that supports only F_GETFD and F_SETLKW.  */
+ int
+ fcntl (intptr_t fd, int cmd, ...)
+@@ -142,6 +143,7 @@ fcntl (intptr_t fd, int cmd, ...)
+         return -1;
+     }
+ }
++#endif /* GNULIB_TEST_FCNTL */
+ 
+ static intptr_t mutex_handle = -1;
+ 
+-- 
+2.17.1
+
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
index 0000000000..70caf0ae16
--- /dev/null
+++ b/meta/recipes-devtools/make/make_4.3.bb
@@ -0,0 +1,18 @@
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+require make.inc
+
+SRC_URI += "\
+	file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
+	file://0002-modules-fcntl-allow-being-detected-by-importing-proj.patch \
+	file://0001-src-dir.c-fix-buffer-overflow-warning.patch \
+	file://0002-w32-compat-dirent.c-follow-header.patch \
+	file://0003-posixfcn-fcntl-gnulib-make-emulated.patch \
+"
+
+EXTRA_OECONF += "--without-guile"
+
+SRC_URI[md5sum] = "d5c40e7bd1e97a7404f5d3be982f479a"
+SRC_URI[sha256sum] = "de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


