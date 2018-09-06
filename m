Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id C1C07795DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:45 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id p52-v6so8434167eda.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mybiIN923vMYgRLSuqJatzCCTJxhIMDRgXn1Srma6XM=;
	b=ZHyzT9ynBoSB5H3FC40N2WscxtbiFR/XR6ch5Fu4oMzrXjIwvl2TjBD0d0GwUzqqxa
	Ad0IcBQso0QYZ1WiDHJL1W9MRWgCBEsIwM1Wm1eyfZ09m9qhfzuCBiLPjIQjLkuhYZ0U
	ANS26/N3OcHY3+zNphplK7CvfvgHpHoZE1XO4DVAr++1PGbtDhO+z5RDY8cPQk2tql9h
	+q34e8xv2emuRZ4Swsvykop01Wz58tKaLo1721SEjhySxGv1cU3/6lIPP+IkxsSq6B25
	SF0aqvK23nlBzCz1je86JbwDjq2HoFfmaYgozj+8JMv9TS+UasnvFlas5GNBQWohuyqe
	QhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mybiIN923vMYgRLSuqJatzCCTJxhIMDRgXn1Srma6XM=;
	b=P1hinPcPYBgs22AHw7+wubC843fawD0Ghnpg5syn0Yv+4dZ8QtUTTogWol4XUUADz8
	FGCnKIItd9YeBy48RuZURvB9aJO1gRzx3Jz0PR+R4XLMidreICwFQiD0MZokZzsbZ2S5
	0iPRDFNavvWMrkRZH3Q7FQWGilSyziz7lwtvkT9iNlhUgoOgYf0eCgSjpyErj7esdCJx
	ahnrf03fzODk6XDgu/qpDzMC1o9mYEsojH54RjhIrIYWVeTTJ88qwDpQMtkBjLE2AZ1D
	v2hfl6BWAE9TGOAHztyF51RBYOI6D88OmcV6beXgM7w6ejDB2KidOyXD645FEJ9sLwlw
	JLJw==
X-Gm-Message-State: APzg51Cagu1T2Se6ZGSHQzxbk0qfz91Iyhir5M+Gz6RdPuvfq33IZHYX
	VFnvXFPy1w8MWghOK3cNJwJQT0g7qFc=
X-Google-Smtp-Source: ANB0Vdapan2JtLHGVsDGpUFFIGQB41HXh1i3uJA2ad3Ix/Lj3jX5k9iJWNdD20t9x0qxL9uII0lu+w==
X-Received: by 2002:a50:b8c5:: with SMTP id
	l63-v6mr2739093ede.80.1536229785662; 
	Thu, 06 Sep 2018 03:29:45 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:15 +0200
Message-Id: <1536229770-29600-6-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 06/21] rpm: update to 4.14.2
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:46 -0000

Drop --disable-dbus option and patch: --disable-plugins is sufficient.

Drop upstreamed patches.

Drop a chunk of 0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch, as upstream fixed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...code-lib-rpm-as-the-installation-path-for.patch |  19 ++-
 ...t-the-PATH-environment-variable-before-ru.patch |  22 +--
 ...0001-Factor-out-and-unify-setting-CLOEXEC.patch | 148 --------------------
 .../0001-configure.ac-add-option-for-dbus.patch    |  42 ------
 .../files/0002-Optimize-rpmSetCloseOnExec.patch    | 100 -------------
 .../0003-rpmSetCloseOnExec-use-getrlimit.patch     |  53 -------
 ...c-remove-static-local-variables-from-buil.patch |  17 +--
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            | 154 ---------------------
 meta/recipes-devtools/rpm/rpm_4.14.2.bb            | 150 ++++++++++++++++++++
 9 files changed, 170 insertions(+), 535 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm_4.14.1.bb
 create mode 100644 meta/recipes-devtools/rpm/rpm_4.14.2.bb

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 5604cb9..82e7328 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,7 +1,7 @@
-From c82c19dc583843b1a975f2e3f2e151656a6f377c Mon Sep 17 00:00:00 2001
+From bd08eb0ae1312f347f49949481daa7c923752df2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
-Subject: [PATCH 06/14] Do not hardcode "lib/rpm" as the installation path for
+Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
  default configuration and macros.
 
 Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7155d9f00..21b95ae5f 100644
+index 09af7c4..9bd6903 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1047,7 +1047,7 @@ else
+@@ -1055,7 +1055,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -27,10 +27,10 @@ index 7155d9f00..21b95ae5f 100644
  
  AC_SUBST(OBJDUMP)
 diff --git a/macros.in b/macros.in
-index d08624856..68a972f1e 100644
+index a3aa7a9..62cee5c 100644
 --- a/macros.in
 +++ b/macros.in
-@@ -954,7 +954,7 @@ package or when debugging this package.\
+@@ -970,7 +970,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -40,7 +40,7 @@ index d08624856..68a972f1e 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index 51225892d..e0c834d37 100644
+index 82c2d7c..6341b51 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,7 +55,4 @@ index 51225892d..e0c834d37 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 8:1:0
--- 
-2.15.1
-
+ rpm_version_info = 9:0:1
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index bf24d43..41cdf6e 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -1,25 +1,23 @@
-From ffb5301a8594140ad7a58bc0f2053be8ca2b2946 Mon Sep 17 00:00:00 2001
+From a674b9cc7af448d7c6748bc163bf37dc14a57f09 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Jan 2017 13:32:06 +0200
-Subject: [PATCH 1/2] Do not reset the PATH environment variable before running
+Subject: [PATCH] Do not reset the PATH environment variable before running
  scriptlets.
 
 We add lots of native stuff into it and scriptlets rely on that.
 
-Also need to remove the xx test later in the function since the
-value could now be used un-initialised.
-
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  lib/rpmscript.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 92f949fa2..7c1aa75a8 100644
+index 6a31e0d..2b0e438 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -201,7 +201,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+@@ -184,7 +184,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
  	if (ipath && ipath[5] != '%')
  	    path = ipath;
  
@@ -28,13 +26,3 @@ index 92f949fa2..7c1aa75a8 100644
  	free(ipath);
      }
  
-@@ -206,9 +206,7 @@ static void doScriptExec(ARGV_const_t ar
- 	/* XXX Don't mtrace into children. */
- 	unsetenv("MALLOC_CHECK_");
- 
--	if (xx == 0) {
- 	    xx = execv(argv[0], argv);
--	}
-     }
-     _exit(127); /* exit 127 for compatibility with bash(1) */
- }
diff --git a/meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch b/meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
deleted file mode 100644
index 6f440c6..0000000
--- a/meta/recipes-devtools/rpm/files/0001-Factor-out-and-unify-setting-CLOEXEC.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 9c3e5de3240554c8ea1b29d52eeadee4840fefac Mon Sep 17 00:00:00 2001
-From: Kir Kolyshkin <kolyshkin@gmail.com>
-Date: Tue, 29 May 2018 17:37:05 -0700
-Subject: [PATCH 1/3] Factor out and unify setting CLOEXEC
-
-Commit 7a7c31f5 ("Set FD_CLOEXEC on opened files before exec from
-lua script is called") copied the code that sets CLOEXEC flag on all
-possible file descriptors from lib/rpmscript.c to luaext/lposix.c,
-essentially creating two copies of the same code (modulo comments
-and the unused assignment).
-
-This commit moves the functionality into its own function, without
-any code modifications, using the version from luaext/lposix.c.
-
-Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
-Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/444]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- lib/rpmscript.c        | 18 ++----------------
- luaext/lposix.c        | 13 ++-----------
- rpmio/rpmio.c          | 16 ++++++++++++++++
- rpmio/rpmio_internal.h |  6 ++++++
- 4 files changed, 26 insertions(+), 27 deletions(-)
-
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 747385a5b..b4ccd3246 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
-@@ -3,7 +3,6 @@
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <errno.h>
--#include <unistd.h>
- 
- #include <rpm/rpmfileutil.h>
- #include <rpm/rpmmacro.h>
-@@ -14,6 +13,7 @@
- 
- #include "rpmio/rpmlua.h"
- #include "lib/rpmscript.h"
-+#include "rpmio/rpmio_internal.h"
- 
- #include "lib/rpmplugins.h"     /* rpm plugins hooks */
- 
-@@ -170,26 +170,12 @@ static const char * const SCRIPT_PATH = "PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr
- static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
- 			FD_t scriptFd, FD_t out)
- {
--    int flag;
--    int fdno;
-     int xx;
--    int open_max;
- 
-     /* SIGPIPE is ignored in rpm, reset to default for the scriptlet */
-     (void) signal(SIGPIPE, SIG_DFL);
- 
--    /* XXX Force FD_CLOEXEC on all inherited fdno's. */
--    open_max = sysconf(_SC_OPEN_MAX);
--    if (open_max == -1) {
--	open_max = 1024;
--    }
--    for (fdno = 3; fdno < open_max; fdno++) {
--	flag = fcntl(fdno, F_GETFD);
--	if (flag == -1 || (flag & FD_CLOEXEC))
--	    continue;
--	xx = fcntl(fdno, F_SETFD, FD_CLOEXEC);
--	/* XXX W2DO? debug msg for inheirited fdno w/o FD_CLOEXEC */
--    }
-+    rpmSetCloseOnExec();
- 
-     if (scriptFd != NULL) {
- 	int sfdno = Fileno(scriptFd);
-diff --git a/luaext/lposix.c b/luaext/lposix.c
-index 0a7c26c71..5d7ad3c87 100644
---- a/luaext/lposix.c
-+++ b/luaext/lposix.c
-@@ -27,6 +27,7 @@
- #include <unistd.h>
- #include <utime.h>
- #include <rpm/rpmutil.h>
-+#include "rpmio/rpmio_internal.h"
- 
- #define MYNAME		"posix"
- #define MYVERSION	MYNAME " library for " LUA_VERSION " / Nov 2003"
-@@ -335,21 +336,11 @@ static int Pexec(lua_State *L)			/** exec(path,[args]) */
- 	const char *path = luaL_checkstring(L, 1);
- 	int i,n=lua_gettop(L);
- 	char **argv;
--	int flag, fdno, open_max;
- 
- 	if (!have_forked)
- 	    return luaL_error(L, "exec not permitted in this context");
- 
--	open_max = sysconf(_SC_OPEN_MAX);
--	if (open_max == -1) {
--	    open_max = 1024;
--	}
--	for (fdno = 3; fdno < open_max; fdno++) {
--	    flag = fcntl(fdno, F_GETFD);
--	    if (flag == -1 || (flag & FD_CLOEXEC))
--		continue;
--	    fcntl(fdno, F_SETFD, FD_CLOEXEC);
--	}
-+	rpmSetCloseOnExec();
- 
- 	argv = malloc((n+1)*sizeof(char*));
- 	if (argv==NULL) return luaL_error(L,"not enough memory");
-diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
-index c7cbc32aa..ea111d2ec 100644
---- a/rpmio/rpmio.c
-+++ b/rpmio/rpmio.c
-@@ -1759,3 +1759,19 @@ DIGEST_CTX fdDupDigest(FD_t fd, int id)
- 
-     return ctx;
- }
-+
-+void rpmSetCloseOnExec(void)
-+{
-+	int flag, fdno, open_max;
-+
-+	open_max = sysconf(_SC_OPEN_MAX);
-+	if (open_max == -1) {
-+		open_max = 1024;
-+	}
-+	for (fdno = 3; fdno < open_max; fdno++) {
-+		flag = fcntl(fdno, F_GETFD);
-+		if (flag == -1 || (flag & FD_CLOEXEC))
-+			continue;
-+		fcntl(fdno, F_SETFD, FD_CLOEXEC);
-+	}
-+}
-diff --git a/rpmio/rpmio_internal.h b/rpmio/rpmio_internal.h
-index fbed183b0..370cbdc75 100644
---- a/rpmio/rpmio_internal.h
-+++ b/rpmio/rpmio_internal.h
-@@ -41,6 +41,12 @@ DIGEST_CTX fdDupDigest(FD_t fd, int id);
- int rpmioSlurp(const char * fn,
-                 uint8_t ** bp, ssize_t * blenp);
- 
-+/**
-+ * Set close-on-exec flag for all opened file descriptors, except
-+ * stdin/stdout/stderr.
-+ */
-+void rpmSetCloseOnExec(void);
-+
- #ifdef __cplusplus
- }
- #endif
diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch
deleted file mode 100644
index dc71d9b..0000000
--- a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dfb422c744fdc1838afc40b8e1f161bb46093d92 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Sun, 8 Apr 2018 12:06:42 +0800
-Subject: [PATCH] configure.ac: add option for dbus
-
-Add option for dbus so that users could choose to build with dbus
-or with no dbus.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- configure.ac | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4db15c7909..493f393d31 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -976,12 +976,15 @@ AS_IF([test "$enable_plugins" = yes],[
- ])
- AM_CONDITIONAL(ENABLE_PLUGINS,[test "$enable_plugins" = yes])
- 
--with_dbus=no
--AS_IF([test "$enable_plugins" != no],[
-+AC_ARG_WITH([dbus], [AS_HELP_STRING([--with-dbus], [build with dbus support])],
-+            [],
-+            [with_dbus=yes])
-+
-+AS_IF([test "$with_dbus" != no],[
-   PKG_CHECK_MODULES([DBUS],
-     [dbus-1 >= 1.3],
--    [AC_DEFINE(DBUS, 1, [Build with dbus support?]) with_dbus=yes],
--    [with_dbus=no])
-+    [AC_DEFINE(DBUS, 1, [Build with dbus support?])],
-+    [AC_MSG_ERROR([dbus not present (--without-dbus to disable)])])
-   AC_SUBST(DBUS_CFLAGS)
-   AC_SUBST(DBUS_LIBS)
- ])
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch b/meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
deleted file mode 100644
index a27f8e6..0000000
--- a/meta/recipes-devtools/rpm/files/0002-Optimize-rpmSetCloseOnExec.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 5e6f05cd8dad6c1ee6bd1e6e43f176976c9c3416 Mon Sep 17 00:00:00 2001
-From: Kir Kolyshkin <kolyshkin@gmail.com>
-Date: Tue, 29 May 2018 17:52:56 -0700
-Subject: [PATCH 2/3] Optimize rpmSetCloseOnExec
-
-In case maximum number of open files limit is set too high, both
-luaext/Pexec() and lib/doScriptExec() spend way too much time
-trying to set FD_CLOEXEC flag for all those file descriptors,
-resulting in severe increase of time it takes to execute say
-rpm or dnf.
-
-This becomes increasingly noticeable when running with e.g. under
-Docker, the reason being:
-
-> $ docker run fedora ulimit -n
-> 1048576
-
-One obvious fix is to use procfs to get the actual list of opened fds
-and iterate over it. My quick-n-dirty benchmark shows the /proc approach
-is about 10x faster than iterating through a list of just 1024 fds,
-so it's an improvement even for default ulimit values.
-
-Note that the old method is still used in case /proc is not available.
-
-While at it,
-
- 1. fix the function by making sure we modify (rather than set)
-    the existing flags. As the only known flag is FD_CLOEXEC,
-    this change is currently purely aesthetical, but in case
-    other flags will appear it will become a real bug fix.
-
- 2. get rid of magic number 3; use STDERR_FILENO
-
-Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
-
-Fixes #444
-
-Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/444]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- rpmio/rpmio.c | 43 ++++++++++++++++++++++++++++++++++---------
- 1 file changed, 34 insertions(+), 9 deletions(-)
-
-diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
-index ea111d2ec..55351c221 100644
---- a/rpmio/rpmio.c
-+++ b/rpmio/rpmio.c
-@@ -1760,18 +1760,43 @@ DIGEST_CTX fdDupDigest(FD_t fd, int id)
-     return ctx;
- }
- 
-+static void set_cloexec(int fd)
-+{
-+	int flags = fcntl(fd, F_GETFD);
-+
-+	if (flags == -1 || (flags & FD_CLOEXEC))
-+		return;
-+
-+	fcntl(fd, F_SETFD, flags | FD_CLOEXEC);
-+}
-+
- void rpmSetCloseOnExec(void)
- {
--	int flag, fdno, open_max;
-+	const int min_fd = STDERR_FILENO; /* don't touch stdin/out/err */
-+	int fd;
-+
-+	DIR *dir = opendir("/proc/self/fd");
-+	if (dir == NULL) { /* /proc not available */
-+		/* iterate over all possible fds, might be slow */
-+		int open_max = sysconf(_SC_OPEN_MAX);
-+		if (open_max == -1)
-+			open_max = 1024;
- 
--	open_max = sysconf(_SC_OPEN_MAX);
--	if (open_max == -1) {
--		open_max = 1024;
-+		for (fd = min_fd + 1; fd < open_max; fd++)
-+			set_cloexec(fd);
-+
-+		return;
- 	}
--	for (fdno = 3; fdno < open_max; fdno++) {
--		flag = fcntl(fdno, F_GETFD);
--		if (flag == -1 || (flag & FD_CLOEXEC))
--			continue;
--		fcntl(fdno, F_SETFD, FD_CLOEXEC);
-+
-+	/* iterate over fds obtained from /proc */
-+	struct dirent *entry;
-+	while ((entry = readdir(dir)) != NULL) {
-+		fd = atoi(entry->d_name);
-+		if (fd > min_fd)
-+			set_cloexec(fd);
- 	}
-+
-+	closedir(dir);
-+
-+	return;
- }
diff --git a/meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch b/meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch
deleted file mode 100644
index 389b41b..0000000
--- a/meta/recipes-devtools/rpm/files/0003-rpmSetCloseOnExec-use-getrlimit.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 307e28b4cb08b05bc044482058eeebc9f59bb9a9 Mon Sep 17 00:00:00 2001
-From: Kir Kolyshkin <kolyshkin@gmail.com>
-Date: Tue, 29 May 2018 18:09:27 -0700
-Subject: [PATCH 3/3] rpmSetCloseOnExec: use getrlimit()
-
-In case /proc is not available to get the actual list of opened fds,
-we fall back to iterating through the list of all possible fds.
-
-It is possible that during the course of the program execution the limit
-on number of open file descriptors might be lowered, so using the
-current limit, as returned by sysconf(_SC_OPEN_MAX), might omit some
-fds. Therefore, it is better to use rlim_max from the structure
-filled in by gertlimit(RLIMIT_NOFILE) to make sure we're checking
-all fds.
-
-This slows down the function, but only in the case /proc is not
-available, which should be rare in practice.
-
-Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
-Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/444]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- rpmio/rpmio.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
-index 55351c221..e051c9863 100644
---- a/rpmio/rpmio.c
-+++ b/rpmio/rpmio.c
-@@ -10,6 +10,7 @@
- #include <sys/personality.h>
- #endif
- #include <sys/utsname.h>
-+#include <sys/resource.h>
- 
- #include <rpm/rpmlog.h>
- #include <rpm/rpmmacro.h>
-@@ -1778,7 +1779,14 @@ void rpmSetCloseOnExec(void)
- 	DIR *dir = opendir("/proc/self/fd");
- 	if (dir == NULL) { /* /proc not available */
- 		/* iterate over all possible fds, might be slow */
--		int open_max = sysconf(_SC_OPEN_MAX);
-+		struct rlimit rl;
-+		int open_max;
-+
-+		if (getrlimit(RLIMIT_NOFILE, &rl) == 0 && rl.rlim_max != RLIM_INFINITY)
-+			open_max = rl.rlim_max;
-+		else
-+			open_max = sysconf(_SC_OPEN_MAX);
-+
- 		if (open_max == -1)
- 			open_max = 1024;
- 
diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
index 8989dce..652e30b 100644
--- a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
+++ b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
@@ -1,8 +1,8 @@
-From 8ce9fbab2990609bdace457e146160334e931c89 Mon Sep 17 00:00:00 2001
+From 792693bb90768cfde4898e8dd31ee1b5de803d2f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 8 Jun 2017 17:08:09 +0300
-Subject: [PATCH 14/15] build/pack.c: remove static local variables from
- buildHost() and getBuildTime()
+Subject: [PATCH] build/pack.c: remove static local variables from buildHost()
+ and getBuildTime()
 
 Their use is causing difficult to diagnoze data races when building multiple
 packages in parallel, and is a bad idea in general, as it also makes it more
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 74 insertions(+), 72 deletions(-)
 
 diff --git a/build/build.c b/build/build.c
-index 81152e53e..6001f9e52 100644
+index 13c3df2..b154f08 100644
 --- a/build/build.c
 +++ b/build/build.c
 @@ -6,6 +6,8 @@
@@ -99,7 +99,7 @@ index 81152e53e..6001f9e52 100644
  	if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
 -	    (rc = packageSources(spec, &cookie)))
 +	    (rc = packageSources(spec, &cookie, buildTime, host)))
- 		return rc;
+ 		goto exit;
  
  	if (((what & RPMBUILD_PACKAGEBINARY) && !test) &&
 -	    (rc = packageBinaries(spec, cookie, (didBuild == 0))))
@@ -116,7 +116,7 @@ index 81152e53e..6001f9e52 100644
      spec->rootDir = NULL;
      if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
 diff --git a/build/pack.c b/build/pack.c
-index df15876ff..17a4b0905 100644
+index df15876..17a4b09 100644
 --- a/build/pack.c
 +++ b/build/pack.c
 @@ -6,8 +6,6 @@
@@ -305,7 +305,7 @@ index df15876ff..17a4b0905 100644
  	/* Do check SRPM package if enabled */
  	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
 diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
-index 439b7d3b5..07e8338ad 100644
+index 439b7d3..07e8338 100644
 --- a/build/rpmbuild_internal.h
 +++ b/build/rpmbuild_internal.h
 @@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFlags pkgFlags);
@@ -334,6 +334,3 @@ index 439b7d3b5..07e8338ad 100644
  
  RPM_GNUC_INTERNAL
  int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
deleted file mode 100644
index e5e87d3..0000000
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ /dev/null
@@ -1,154 +0,0 @@
-SUMMARY = "The RPM package management system"
-DESCRIPTION = "The RPM Package Manager (RPM) is a powerful command line driven \
-package management system capable of installing, uninstalling, \
-verifying, querying, and updating software packages. Each software \
-package consists of an archive of files along with information about \
-the package like its version, a description, etc."
-
-SUMMARY_${PN}-dev = "Development files for manipulating RPM packages"
-DESCRIPTION_${PN}-dev = "This package contains the RPM C library and header files. These \
-development files will simplify the process of writing programs that \
-manipulate RPM packages and databases. These files are intended to \
-simplify the process of creating graphical package managers or any \
-other tools that need an intimate knowledge of RPM packages in order \
-to function."
-
-SUMMARY_python3-rpm = "Python bindings for apps which will manupulate RPM packages"
-DESCRIPTION_python3-rpm = "The python3-rpm package contains a module that permits applications \
-written in the Python programming language to use the interface \
-supplied by the RPM Package Manager libraries."
-
-HOMEPAGE = "http://www.rpm.org"
-
-# libraries are also LGPL - how to express this?
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
-
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
-           file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
-           file://0001-Do-not-read-config-files-from-HOME.patch \
-           file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
-           file://0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch \
-           file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch \
-           file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
-           file://0001-Fix-build-with-musl-C-library.patch \
-           file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
-           file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
-           file://0001-Split-binary-package-building-into-a-separate-functi.patch \
-           file://0002-Run-binary-package-creation-via-thread-pools.patch \
-           file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
-           file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
-           file://0001-perl-disable-auto-reqs.patch \
-           file://0001-configure.ac-add-option-for-dbus.patch \
-           file://0001-Factor-out-and-unify-setting-CLOEXEC.patch \
-           file://0002-Optimize-rpmSetCloseOnExec.patch \
-           file://0003-rpmSetCloseOnExec-use-getrlimit.patch \
-           "
-
-PE = "1"
-SRCREV = "bfee1410af51c1cc9724791fb8d985260a62102b"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
-DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
-
-inherit autotools gettext pkgconfig python3native
-export PYTHON_ABI
-
-# OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
-EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
-
-EXTRA_OECONF_append = " --without-lua --enable-python"
-EXTRA_OECONF_append_libc-musl = " --disable-nls"
-
-# --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-#
-# --localstatedir prevents rpm from writing its database to native sysroot when building images
-#
-# Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
-# Also disable plugins by default for native.
-EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
-EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
-
-BBCLASSEXTEND = "native nativesdk"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
-
-ASNEEDED = ""
-
-# Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
-# libmagic also has sysroot path contamination, so override it
-
-WRAPPER_TOOLS = " \
-   ${bindir}/rpm \
-   ${bindir}/rpm2archive \
-   ${bindir}/rpm2cpio \
-   ${bindir}/rpmbuild \
-   ${bindir}/rpmdb \
-   ${bindir}/rpmgraph \
-   ${bindir}/rpmkeys \
-   ${bindir}/rpmsign \
-   ${bindir}/rpmspec \
-   ${libdir}/rpm/rpmdeps \
-"
-
-do_install_append_class-native() {
-        for tool in ${WRAPPER_TOOLS}; do
-                create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                        RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
-                        MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-                        RPM_NO_CHROOT_FOR_SCRIPTS=1
-        done
-}
-
-do_install_append_class-nativesdk() {
-        for tool in ${WRAPPER_TOOLS}; do
-                create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
-                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
-                        RPM_NO_CHROOT_FOR_SCRIPTS=1
-        done
-
-        rm -rf ${D}/var
-}
-
-# Rpm's make install creates var/tmp which clashes with base-files packaging
-do_install_append_class-target() {
-    rm -rf ${D}/var
-}
-
-do_install_append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${libdir}/rpm/macros
-
-	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
-	    ${D}${libdir}/rpm/pythondistdeps.py \
-	    ${D}${libdir}/rpm/python-macro-helper
-}
-
-FILES_${PN} += "${libdir}/rpm-plugins/*.so \
-               "
-
-FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
-                    "
-
-PACKAGES += "python3-rpm"
-PROVIDES += "python3-rpm"
-FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
-
-# rpm 5.x was packaging the rpm build tools separately
-RPROVIDES_${PN} += "rpm-build"
-
-RDEPENDS_${PN} = "bash perl python3-core"
-
-PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
-
-# Do not specify a sysroot when compiling on a target.
-rpm_package_preprocess () {
-	sed -i -e 's:--sysroot[^ ]*::g' \
-	    ${PKGD}/${libdir}/rpm/macros
-}
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
new file mode 100644
index 0000000..46f8837
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
@@ -0,0 +1,150 @@
+SUMMARY = "The RPM package management system"
+DESCRIPTION = "The RPM Package Manager (RPM) is a powerful command line driven \
+package management system capable of installing, uninstalling, \
+verifying, querying, and updating software packages. Each software \
+package consists of an archive of files along with information about \
+the package like its version, a description, etc."
+
+SUMMARY_${PN}-dev = "Development files for manipulating RPM packages"
+DESCRIPTION_${PN}-dev = "This package contains the RPM C library and header files. These \
+development files will simplify the process of writing programs that \
+manipulate RPM packages and databases. These files are intended to \
+simplify the process of creating graphical package managers or any \
+other tools that need an intimate knowledge of RPM packages in order \
+to function."
+
+SUMMARY_python3-rpm = "Python bindings for apps which will manupulate RPM packages"
+DESCRIPTION_python3-rpm = "The python3-rpm package contains a module that permits applications \
+written in the Python programming language to use the interface \
+supplied by the RPM Package Manager libraries."
+
+HOMEPAGE = "http://www.rpm.org"
+
+# libraries are also LGPL - how to express this?
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
+
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
+           file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
+           file://0001-Do-not-read-config-files-from-HOME.patch \
+           file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
+           file://0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch \
+           file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch \
+           file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
+           file://0001-Fix-build-with-musl-C-library.patch \
+           file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
+           file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
+           file://0001-Split-binary-package-building-into-a-separate-functi.patch \
+           file://0002-Run-binary-package-creation-via-thread-pools.patch \
+           file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
+           file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
+           file://0001-perl-disable-auto-reqs.patch \
+           "
+
+PE = "1"
+SRCREV = "753f6941dc32e94047b7cfe713ddd604a810b4db"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
+
+inherit autotools gettext pkgconfig python3native
+export PYTHON_ABI
+
+# OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
+EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
+
+EXTRA_OECONF_append = " --without-lua --enable-python"
+EXTRA_OECONF_append_libc-musl = " --disable-nls"
+
+# --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
+#
+# --localstatedir prevents rpm from writing its database to native sysroot when building images
+#
+# Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
+# Also disable plugins by default for native.
+EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
+
+ASNEEDED = ""
+
+# Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
+# libmagic also has sysroot path contamination, so override it
+
+WRAPPER_TOOLS = " \
+   ${bindir}/rpm \
+   ${bindir}/rpm2archive \
+   ${bindir}/rpm2cpio \
+   ${bindir}/rpmbuild \
+   ${bindir}/rpmdb \
+   ${bindir}/rpmgraph \
+   ${bindir}/rpmkeys \
+   ${bindir}/rpmsign \
+   ${bindir}/rpmspec \
+   ${libdir}/rpm/rpmdeps \
+"
+
+do_install_append_class-native() {
+        for tool in ${WRAPPER_TOOLS}; do
+                create_wrapper ${D}$tool \
+                        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                        RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
+                        MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+                        RPM_NO_CHROOT_FOR_SCRIPTS=1
+        done
+}
+
+do_install_append_class-nativesdk() {
+        for tool in ${WRAPPER_TOOLS}; do
+                create_wrapper ${D}$tool \
+                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
+                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
+                        RPM_NO_CHROOT_FOR_SCRIPTS=1
+        done
+
+        rm -rf ${D}/var
+}
+
+# Rpm's make install creates var/tmp which clashes with base-files packaging
+do_install_append_class-target() {
+    rm -rf ${D}/var
+}
+
+do_install_append () {
+	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${libdir}/rpm/macros
+
+	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
+	    ${D}${libdir}/rpm/pythondistdeps.py \
+	    ${D}${libdir}/rpm/python-macro-helper
+}
+
+FILES_${PN} += "${libdir}/rpm-plugins/*.so \
+               "
+
+FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
+                    "
+
+PACKAGES += "python3-rpm"
+PROVIDES += "python3-rpm"
+FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
+
+# rpm 5.x was packaging the rpm build tools separately
+RPROVIDES_${PN} += "rpm-build"
+
+RDEPENDS_${PN} = "bash perl python3-core"
+
+PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
+
+# Do not specify a sysroot when compiling on a target.
+rpm_package_preprocess () {
+	sed -i -e 's:--sysroot[^ ]*::g' \
+	    ${PKGD}/${libdir}/rpm/macros
+}
-- 
2.7.4


