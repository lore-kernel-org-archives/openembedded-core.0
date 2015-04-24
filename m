Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 46F6D73D95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:49 +0000 (UTC)
Received: by pdea3 with SMTP id a3so36515673pde.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k9kW92i71FeLedzjtDMYqKbnvrk+0YRWD6AhLBDn5AU=;
	b=E48iSodSwaGBFi1aWRlmKi/yJa5haeNPVCq8HUqOy0HCHlo/4Wv0pK6xciK+mb1dMZ
	ONOI3m/88hs9lqibTIQpWKGzgraVz2fpohuqrfQyyfhSDV2YCD3ReNP6b87+l2L2CoDO
	ExRL2fb7xZecqS27skHM7OgFWgVFmoZe5DBwwcz8+MWulpokAfEbPBtZUzu93AbINhdX
	2oLO4TOrZe5YdkI9BtwTRH/WOQyt4WLYoGZeMD2EF1IXyXkhWNLhc/6CjNVCfHEWLlSr
	qpzl65w1O0AFK0WEJXp/yRG8+tCtTM2RqSNe738vyEmWhC/o8maV5qd2oFAoQSNycTZo
	h92Q==
X-Received: by 10.70.103.200 with SMTP id fy8mr2233460pdb.136.1429846550518;
	Thu, 23 Apr 2015 20:35:50 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:30 -0700
Message-Id: <b96329f80a7b2765f01135751a48dbac68af3253.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 12/14] pkgconfig: Upgrade to latest git tip
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:49 -0000

0.28 was released 2 years ago and bunch of patches
have gone in since. The commit rate is quite low
so its not a lot of churn to use. We have backports
for few bugs that are removed. Git version of recipe is removed too
since its no longer needed

Change-Id: I4b57db15320c76b1de5d26a733e60436663ff34a
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Strip-system-library-directories-reliably.patch |  30 --
 .../pkgconfig/pkgconfig-0.28/autofoo.patch         | 528 ---------------------
 .../pkgconfig-0.28/obsolete_automake_macros.patch  |  16 -
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   6 +-
 .../pkgconfig/pkgconfig/autofoo.patch              | 528 ---------------------
 .../fix-glib-configure-libtool-usage.patch         |   0
 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb  |  11 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  42 +-
 8 files changed, 8 insertions(+), 1153 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
 rename meta/recipes-devtools/pkgconfig/{pkgconfig-0.28 => pkgconfig}/fix-glib-configure-libtool-usage.patch (100%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch
deleted file mode 100644
index 84d0dd8..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport (will be in 0.29)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ce1a2416ce0f0bd9a8a8a5caaf7dad20cda4d47d Mon Sep 17 00:00:00 2001
-From: Andrew Oakley <aoakley@espial.com>
-Date: Tue, 29 Apr 2014 13:14:35 +0100
-Subject: [PATCH] Strip system library directories reliably
-
-This loop was changed from a while loop to a for loop in commit
-9bf6277b, but the iterator is now advanced twice each time round the
-loop.
----
- pkg.c |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/pkg.c b/pkg.c
-index 3697fec..c847c95 100644
---- a/pkg.c
-+++ b/pkg.c
-@@ -917,7 +917,6 @@ verify_package (Package *pkg)
-             }
-           system_dir_iter = system_dir_iter->next;
-         }
--      iter = iter->next;
-     }
-   g_list_free (system_directories);
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch
deleted file mode 100644
index 9853577..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch
+++ /dev/null
@@ -1,528 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- glib-1.2.10/acglib.m4    |   12 +-
- glib-1.2.10/configure.in |  212 ++++++++++++++++++++++++++++++------------------
- 2 files changed, 140 insertions(+), 84 deletions(-)
-
-Index: pkg-config-0.23/glib-1.2.10/acglib.m4
-===================================================================
---- pkg-config-0.23.orig/glib-1.2.10/acglib.m4	2008-01-16 22:52:24.000000000 +0000
-+++ pkg-config-0.23/glib-1.2.10/acglib.m4	2008-03-26 20:59:12.000000000 +0000
-@@ -10,7 +10,7 @@
- AC_DIVERT_POP()])])])
- 
- dnl GLIB_IF_VAR_EQ (ENV_VAR, VALUE [, EQUALS_ACTION] [, ELSE_ACTION])
--AC_DEFUN(GLIB_IF_VAR_EQ,[
-+AC_DEFUN([GLIB_IF_VAR_EQ],[
-         case "$[$1]" in
-         "[$2]"[)]
-                 [$3]
-@@ -21,7 +21,7 @@
-         esac
- ])
- dnl GLIB_STR_CONTAINS (SRC_STRING, SUB_STRING [, CONTAINS_ACTION] [, ELSE_ACTION])
--AC_DEFUN(GLIB_STR_CONTAINS,[
-+AC_DEFUN([GLIB_STR_CONTAINS],[
-         case "[$1]" in
-         *"[$2]"*[)]
-                 [$3]
-@@ -32,12 +32,12 @@
-         esac
- ])
- dnl GLIB_ADD_TO_VAR (ENV_VARIABLE, CHECK_STRING, ADD_STRING)
--AC_DEFUN(GLIB_ADD_TO_VAR,[
-+AC_DEFUN([GLIB_ADD_TO_VAR],[
-         GLIB_STR_CONTAINS($[$1], [$2], [$1]="$[$1]", [$1]="$[$1] [$3]")
- ])
- 
- dnl GLIB_SIZEOF (INCLUDES, TYPE, ALIAS [, CROSS-SIZE])
--AC_DEFUN(GLIB_SIZEOF,
-+AC_DEFUN([GLIB_SIZEOF],
- [changequote(<<, >>)dnl
- dnl The name to #define.
- define(<<AC_TYPE_NAME>>, translit(glib_sizeof_$3, [a-z *], [A-Z_P]))dnl
-@@ -62,7 +62,7 @@
- ])
- 
- dnl GLIB_BYTE_CONTENTS (INCLUDES, TYPE, ALIAS, N_BYTES, INITIALIZER)
--AC_DEFUN(GLIB_BYTE_CONTENTS,
-+AC_DEFUN([GLIB_BYTE_CONTENTS],
- [changequote(<<, >>)dnl
- dnl The name to #define.
- define(<<AC_TYPE_NAME>>, translit(glib_byte_contents_$3, [a-z *], [A-Z_P]))dnl
-@@ -92,7 +92,7 @@
- ])
- 
- dnl GLIB_SYSDEFS (INCLUDES, DEFS_LIST, OFILE [, PREFIX])
--AC_DEFUN(GLIB_SYSDEFS,
-+AC_DEFUN([GLIB_SYSDEFS],
- [glib_sysdefso="translit($3, [-_a-zA-Z0-9 *], [-_a-zA-Z0-9])"
- glib_sysdef_msg=`echo $2 | sed 's/:[[^ 	]]*//g'`
- if test "x`(echo '\n') 2>/dev/null`" != 'x\n'; then
-Index: pkg-config-0.23/glib-1.2.10/configure.in
-===================================================================
---- pkg-config-0.23.orig/glib-1.2.10/configure.in	2008-01-16 22:52:24.000000000 +0000
-+++ pkg-config-0.23/glib-1.2.10/configure.in	2008-03-26 20:59:12.000000000 +0000
-@@ -1,10 +1,11 @@
- dnl ***********************************
- dnl *** include special GLib macros ***
- dnl ***********************************
--builtin(include, acglib.m4)dnl
-+dnl no need, just use aclocal -I . --CL
-+dnl builtin(include, acglib.m4)dnl
- 
- # require autoconf 2.13
--AC_PREREQ(2.13)
-+AC_PREREQ(2.53)
- 
- # init autoconf (and check for presence of glist.c)
- AC_INIT(glist.c)
-@@ -13,11 +14,48 @@
- cflags_set=${CFLAGS+set}
- 
- # we rewrite this file
-+if test "x$cross_compiling" != "xyes"; then
- rm -f glibconfig-sysdefs.h
-+fi
-+
-+# config defines
-+
-+AH_TEMPLATE([ENABLE_MEM_CHECK],
-+	    [Define if enabling memory checking])
-+AH_TEMPLATE([ENABLE_MEM_PROFILE], [])
-+AH_TEMPLATE([GLIB_BINARY_AGE], [])
-+AH_TEMPLATE([GLIB_BYTE_CONTENTS_GMUTEX], [])
-+AH_TEMPLATE([GLIB_INTERFACE_AGE], [])
-+AH_TEMPLATE([GLIB_MAJOR_VERSION], [])
-+AH_TEMPLATE([GLIB_MINOR_VERSION], [])
-+AH_TEMPLATE([GLIB_MICRO_VERSION], [])
-+AH_TEMPLATE([GLIB_SIZEOF_GMUTEX], [])
-+AH_TEMPLATE([G_COMPILED_WITH_DEBUGGING], [])
-+AH_TEMPLATE([G_HAVE_INLINE], [])
-+AH_TEMPLATE([G_HAVE___INLINE], [])
-+AH_TEMPLATE([G_HAVE___INLINE__], [])
-+AH_TEMPLATE([G_THREAD_SOURCE], [])
-+AH_TEMPLATE([G_VA_COPY], [])
-+AH_TEMPLATE([G_VA_COPY_AS_ARRAY], [])
-+AH_TEMPLATE([HAVE_BROKEN_WCTYPE], [])
-+AH_TEMPLATE([HAVE_GETPWUID_R], [])
-+AH_TEMPLATE([HAVE_GETPWUID_R_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_COND_TIMEDWAIT_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_GETSPECIFIC_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX], [])
-+AH_TEMPLATE([HAVE_WCHAR_H], [])
-+AH_TEMPLATE([HAVE_WCTYPE_H], [])
-+AH_TEMPLATE([NO_FD_SET], [])
-+AH_TEMPLATE([NO_SYS_ERRLIST], [])
-+AH_TEMPLATE([NO_SYS_SIGLIST], [])
-+AH_TEMPLATE([NO_SYS_SIGLIST_DECL], [])
-+AH_TEMPLATE([REALLOC_0_WORKS], [])
-+
- 
- dnl we need to AC_DIVERT_PUSH/AC_DIVERT_POP these variable definitions so they
- dnl are available for $ac_help expansion (don't we all *love* autoconf?)
--GLIB_AC_DIVERT_BEFORE_HELP([
-+#AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)
-+#dnl
- #
- # The following version number definitions apply to GLib, GModule and GThread
- # as a whole, so if changes occoured in any of them, they are all
-@@ -38,7 +76,7 @@
- GLIB_BINARY_AGE=10
- GLIB_VERSION=$GLIB_MAJOR_VERSION.$GLIB_MINOR_VERSION.$GLIB_MICRO_VERSION
- dnl
--])
-+#AC_DIVERT_POP()dnl
- 
- AC_SUBST(GLIB_MAJOR_VERSION)
- AC_SUBST(GLIB_MINOR_VERSION)
-@@ -72,22 +110,20 @@
- AC_DEFINE_UNQUOTED(GLIB_BINARY_AGE, $GLIB_BINARY_AGE)
- 
- dnl Initialize libtool
--AC_PROG_LIBTOOL
-+AM_PROG_LIBTOOL
- 
- dnl Initialize maintainer mode
- AM_MAINTAINER_MODE
- 
--AC_CANONICAL_HOST
--
- dnl figure debugging default, prior to $ac_help setup
- dnl
--GLIB_AC_DIVERT_BEFORE_HELP([
-+#AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)dnl
- if test `expr $GLIB_MINOR_VERSION \% 2` = 1 ; then
- 	debug_default=yes
- else
- 	debug_default=minimum
- fi
--]) dnl
-+#AC_DIVERT_POP()dnl
- 
- dnl declare --enable-* args and collect ac_help strings
- AC_ARG_ENABLE(debug, [  --enable-debug=[no/minimum/yes] turn on debugging [default=$debug_default]],,enable_debug=$debug_default)
-@@ -194,7 +230,9 @@
-          CFLAGS=$glib_save_CFLAGS
-          AC_MSG_WARN(
-                 [No ANSI prototypes found in library. (-std1 didn't work.)])
-+	, AC_MSG_WARN([Skipping test due to crosscompilation])
-      )
-+     , AC_MSG_WARN([Skipping test due to crosscompilation])
- )
- LIBS=$glib_save_LIBS
- 
-@@ -336,7 +374,7 @@
- if test $gtk_ok = yes; then
-     AC_MSG_RESULT([yes, found in sys/types.h])
- else
--    AC_HEADER_EGREP(fd_set, sys/select.h, gtk_ok=yes)
-+    AC_HEADER_EGREP(fd_mask, sys/select.h, gtk_ok=yes)
-     if test $gtk_ok = yes; then
-         AC_DEFINE(HAVE_SYS_SELECT_H)
-         AC_MSG_RESULT([yes, found in sys/select.h])
-@@ -409,7 +447,7 @@
- 	glib_cv_sane_realloc=no
- 	,)
- ])
--if test x$glib_cv_sane_realloc = xyes; then
-+if test "x$glib_cv_sane_realloc" = "xyes"; then
- 	AC_DEFINE(REALLOC_0_WORKS)
- fi
- AC_MSG_RESULT($glib_cv_sane_realloc)
-@@ -487,7 +525,8 @@
- ])
- if test "x$glib_cv_va_copy" = "xyes"; then
-   AC_DEFINE(G_VA_COPY, va_copy)
--else if test "x$glib_cv___va_copy" = "xyes"; then
-+else
-+if test "x$glib_cv___va_copy" = "xyes"; then
-   AC_DEFINE(G_VA_COPY, __va_copy)
- fi
- fi
-@@ -496,6 +535,7 @@
- fi
- AC_MSG_RESULT($glib_cv_va_val_copy)
- 
-+AC_MSG_WARN([hi mom])
- 
- dnl ***********************
- dnl *** g_module checks ***
-@@ -507,23 +547,27 @@
- G_MODULE_BROKEN_RTLD_GLOBAL=0
- G_MODULE_HAVE_DLERROR=0
- dnl *** dlopen() and dlsym() in system libraries
-+AC_CHECK_FUNC(dlopen,[
-+	AC_CHECK_FUNC(dlsym,[
-+		G_MODULE_IMPL=G_MODULE_IMPL_DL
-+		],
-+	)],
-+)
- if test -z "$G_MODULE_IMPL"; then
--	AC_CHECK_FUNC(dlopen,
--		[AC_CHECK_FUNC(dlsym,
-+	AC_CHECK_FUNC(dlopen,[
-+		AC_CHECK_FUNC(dlsym,[
- 			G_MODULE_IMPL=G_MODULE_IMPL_DL
--		,)]
--	,)
--
-+		])],
-+	)
- fi
--
- dnl *** dlopen() and dlsym() in libdl
- if test -z "$G_MODULE_IMPL"; then
--	AC_CHECK_LIB(dl, dlopen,
--		[AC_CHECK_LIB(dl, dlsym,
-+	AC_CHECK_LIB(dl, dlopen,[
-+		AC_CHECK_LIB(dl, dlsym,[
- 			G_MODULE_LIBS=-ldl
- 			G_MODULE_IMPL=G_MODULE_IMPL_DL
--		,)]
--	,)
-+		])]
-+	)
- fi
- dnl *** shl_load() in libdld (HP-UX)
- if test -z "$G_MODULE_IMPL"; then
-@@ -633,6 +677,7 @@
- AC_SUBST(G_MODULE_NEED_USCORE)
- AC_SUBST(G_MODULE_BROKEN_RTLD_GLOBAL)
- AC_SUBST(GLIB_DEBUG_FLAGS)
-+AC_MSG_WARN([hi mom])
- 
- 
- dnl ***********************
-@@ -869,40 +914,50 @@
- 	fi
- 	if test x"$have_threads" = xposix; then
- 		LIBS="$LIBS $G_THREAD_LIBS"
--		AC_MSG_CHECKING(whether pthread_getspecific is posix like)
- 		# PCThreads has pthread_getspecific(pthread_key_t, void **);
--		AC_TRY_COMPILE([#include <pthread.h>],
--			[pthread_getspecific(0,NULL);],
--			[AC_MSG_RESULT(no)],
--			[AC_MSG_RESULT(yes)
--			AC_DEFINE(HAVE_PTHREAD_GETSPECIFIC_POSIX)])
--		AC_MSG_CHECKING(whether pthread_mutex_trylock is posix like)
-+		AC_CACHE_CHECK([whether pthread_getspecific is posix like],
-+			[glib_cv_sys_pthread_getspecific_posix], 
-+			AC_TRY_COMPILE([#include <pthread.h>],
-+				[pthread_getspecific(0,NULL);],
-+				[glib_cv_sys_pthread_getspecific_posix=no],
-+				[glib_cv_sys_pthread_getspecific_posix=yes])
-+		)
-+		if test x"$glib_cv_sys_pthread_getspecific_posix" = xyes; then
-+			AC_DEFINE(HAVE_PTHREAD_GETSPECIFIC_POSIX)
-+		fi
- 		# DCE Threads return 1 as success, posix 0. what a mess.
--		AC_TRY_RUN([#include <pthread.h>
--			pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
--			int main () { 
--			return !pthread_mutex_trylock (&mutex); }],
--			[AC_MSG_RESULT(no)],
--			[AC_MSG_RESULT(yes)
--			AC_DEFINE(HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX)])
--		AC_MSG_CHECKING(whether pthread_cond_timedwait is posix like)
-+		AC_CACHE_CHECK([whether pthread_mutex_trylock is posix like],
-+			[glib_cv_sys_pthread_mutex_trylock_posix], 
-+			AC_TRY_RUN([#include <pthread.h>
-+				pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
-+				int main () { 
-+				return !pthread_mutex_trylock (&mutex); }],
-+				[glib_cv_sys_pthread_mutex_trylock_posix=no],
-+				[glib_cv_sys_pthread_mutex_trylock_posix=yes])
-+		)
-+		if test x"$glib_cv_sys_pthread_mutex_trylock_posix" = xyes; then
-+			AC_DEFINE(HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX)
-+		fi
- 		# DCE Threads return -1 as failure, posix ETIMEDOUT.
--		AC_TRY_RUN([#include <pthread.h>
--			#include <sys/time.h>
--			int main () { 
--			pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
--			pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
--			struct timeval tval;
--			struct timespec tspec;
--			gettimeofday (&tval, NULL);
--			tspec.tv_sec = tval.tv_sec;
--			tspec.tv_nsec = 0;
--			pthread_mutex_lock (&mutex);
--			return pthread_cond_timedwait (&cond,&mutex,&tspec) 
--				!= -1;}],
--			[AC_MSG_RESULT(no)],
--			[AC_MSG_RESULT(yes)
--			AC_DEFINE(HAVE_PTHREAD_COND_TIMEDWAIT_POSIX)])
-+		AC_CACHE_CHECK([whether pthread_cond_timedwait is posix like],
-+			[glib_cv_sys_pthread_cond_timedwait_posix], 
-+			AC_TRY_RUN([#include <pthread.h>
-+				int main () { 
-+				pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
-+				pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
-+				struct timeval tval;
-+				struct timespec tspec;
-+				gettimeofday (&tval, NULL);
-+				tspec.tv_sec = tval.tv_sec;
-+				tspec.tv_nsec = 0;
-+				return pthread_cond_timedwait (&cond,&mutex,&tspec) 
-+					!= -1;}],
-+				[glib_cv_sys_pthread_cond_timedwait_posix=no],
-+				[glib_cv_sys_pthread_cond_timedwait_posix=yes])
-+		)
-+		if test x"$glib_cv_sys_pthread_cond_timedwait_posix" = xyes; then
-+			AC_DEFINE(HAVE_PTHREAD_COND_TIMEDWAIT_POSIX)
-+		fi
- 	fi
- 	LIBS="$glib_save_LIBS"
- 	CFLAGS="$glib_save_CFLAGS"
-@@ -946,13 +1001,14 @@
- dnl ****************************************
- dnl *** GLib POLL* compatibility defines ***
- dnl ****************************************
-+if test x"$cross_compiling" != xyes; then
- GLIB_SYSDEFS(
- [#include <sys/types.h>
- #include <sys/poll.h>],
- 	POLLIN:1 POLLOUT:4 POLLPRI:2 POLLERR:8 POLLHUP:16 POLLNVAL:32,
- 	glibconfig-sysdefs.h,
- 	=)
--
-+fi
- 
- dnl ******************************
- dnl *** output the whole stuff ***
-@@ -1005,7 +1061,7 @@
- 	  echo '#define GLIB_HAVE_SYS_POLL_H' >> $outfile
- 	fi
- 
--	cat >> $outfile <<_______EOF
-+	cat >> $outfile <<EOF
- 
- #ifdef __cplusplus
- extern "C" {
-@@ -1022,60 +1078,60 @@
- #define G_MINLONG	$glib_ml
- #define G_MAXLONG	$glib_Ml
- 
--_______EOF
-+EOF
- 
- 
- 	### this should always be true in a modern C/C++ compiler
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- typedef signed char gint8;
- typedef unsigned char guint8;
--_______EOF
-+EOF
- 
- 
- 	if test -n "$gint16"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- typedef signed $gint16 gint16;
- typedef unsigned $gint16 guint16;
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -n "$gint32"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- typedef signed $gint32 gint32;
- typedef unsigned $gint32 guint32;
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -n "$gint64"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- ${glib_warning_guard}#define G_HAVE_GINT64 1
- 
- ${glib_extension}typedef signed $gint64 gint64;
- ${glib_extension}typedef unsigned $gint64 guint64;
- 
- #define G_GINT64_CONSTANT(val)	$gint64_constant
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -z "$glib_unknown_void_p"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- 
- #define GPOINTER_TO_INT(p)	((gint)  ${glib_gpi_cast} (p))
- #define GPOINTER_TO_UINT(p)	((guint) ${glib_gpui_cast} (p))
- 
- #define GINT_TO_POINTER(i)	((gpointer) ${glib_gpi_cast} (i))
- #define GUINT_TO_POINTER(u)	((gpointer) ${glib_gpui_cast} (u))
--_______EOF
-+EOF
- 	else
- 	  echo '#error SIZEOF_VOID_P unknown - This should never happen' >>$outfile
- 	fi
- 
- 
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- $glib_atexit
- $glib_memmove
- $glib_defines
-@@ -1087,11 +1143,11 @@
- #else	/* !__cplusplus */
- $glib_inline
- #endif	/* !__cplusplus */
--_______EOF
-+EOF
- 
- 	echo >>$outfile
- 	if test x$g_mutex_has_default = xyes; then
--		cat >>$outfile <<_______EOF
-+		cat >>$outfile <<EOF
- $g_enable_threads_def G_THREADS_ENABLED
- #define G_THREADS_IMPL_$g_threads_impl_def
- typedef struct _GStaticMutex GStaticMutex;
-@@ -1109,15 +1165,15 @@
- #define	g_static_mutex_get_mutex(mutex) \
-   (g_thread_use_default_impl ? ((GMutex*) &((mutex)->aligned_pad_u)) : \
-    g_static_mutex_get_mutex_impl (&((mutex)->runtime_mutex)))
--_______EOF
-+EOF
- 	else
--		cat >>$outfile <<_______EOF
-+		cat >>$outfile <<EOF
- $g_enable_threads_def G_THREADS_ENABLED
- #define G_THREADS_IMPL_$g_threads_impl_def
- typedef struct _GMutex* GStaticMutex;
- #define G_STATIC_MUTEX_INIT NULL
- #define g_static_mutex_get_mutex(mutex) (g_static_mutex_get_mutex_impl (mutex))
--_______EOF
-+EOF
- 	fi
- 
- 	echo >>$outfile
-@@ -1126,15 +1182,15 @@
- 	  g_bit_sizes="$g_bit_sizes 64"
- 	fi
- 	for bits in $g_bit_sizes; do
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- #define GINT${bits}_TO_${g_bs_native}(val)	((gint${bits}) (val))
- #define GUINT${bits}_TO_${g_bs_native}(val)	((guint${bits}) (val))
- #define GINT${bits}_TO_${g_bs_alien}(val)	((gint${bits}) GUINT${bits}_SWAP_LE_BE (val))
- #define GUINT${bits}_TO_${g_bs_alien}(val)	(GUINT${bits}_SWAP_LE_BE (val))
--_______EOF
-+EOF
- 	done
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- #define GLONG_TO_LE(val)	((glong) GINT${glongbits}_TO_LE (val))
- #define GULONG_TO_LE(val)	((gulong) GUINT${glongbits}_TO_LE (val))
- #define GLONG_TO_BE(val)	((glong) GINT${glongbits}_TO_BE (val))
-@@ -1145,14 +1201,14 @@
- #define GUINT_TO_BE(val)	((guint) GUINT${gintbits}_TO_BE (val))
- #define G_BYTE_ORDER $g_byte_order
- 
--_______EOF
-+EOF
- 
- 	if test -r glibconfig-sysdefs.h; then
- 	  cat glibconfig-sysdefs.h >>$outfile
- 	fi
- 
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- 
- $glib_wc
- 
-@@ -1162,7 +1218,7 @@
- #endif /* __cplusplus */
- 
- #endif /* GLIBCONFIG_H */
--_______EOF
-+EOF
- 
- 
- 	if cmp -s $outfile glibconfig.h; then
-Index: pkg-config-0.23/glib-1.2.10/glib.m4
-===================================================================
---- pkg-config-0.23.orig/glib-1.2.10/glib.m4	2008-04-14 23:34:39.000000000 +0100
-+++ pkg-config-0.23/glib-1.2.10/glib.m4	2008-04-14 09:26:29.000000000 +0100
-@@ -5,7 +5,7 @@
- dnl Test for GLIB, and define GLIB_CFLAGS and GLIB_LIBS, if "gmodule" or 
- dnl gthread is specified in MODULES, pass to glib-config
- dnl
--AC_DEFUN(AM_PATH_GLIB,
-+AC_DEFUN([AM_PATH_GLIB],
- [dnl 
- dnl Get the cflags and libraries from the glib-config script
- dnl
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/obsolete_automake_macros.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/obsolete_automake_macros.patch
deleted file mode 100644
index 7d93b1c..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Remove obsolete AM_PROG_CC_STDC use as there's already modern equivalent,
-AC_PROG_CC, present.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pkg-config-0.28/glib/configure.ac pkg-config-0.28/glib/configure.ac
---- pkg-config-0.28/glib/configure.ac	2012-10-13 17:35:36.000000000 +0300
-+++ pkg-config-0.28/glib/configure.ac	2013-05-24 23:48:34.093415116 +0300
-@@ -288,7 +288,6 @@
- AM_CONDITIONAL(HAVE_CXX, [test "$CXX" != ""])
- AC_LANG_RESTORE
-
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
- AC_PROG_INSTALL
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index c4ada80..55ab5c4 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -12,9 +12,11 @@ DEPENDS = "glib-2.0"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
-SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz"
+SRCREV = "40342dd0ead05d457a2a4e692cf865f50033a709"
+PV = "0.28+git${SRCPV}"
+SRC_URI = "git://anongit.freedesktop.org/pkg-config"
 
-S = "${WORKDIR}/pkg-config-${PV}/"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
deleted file mode 100644
index 9853577..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
+++ /dev/null
@@ -1,528 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- glib-1.2.10/acglib.m4    |   12 +-
- glib-1.2.10/configure.in |  212 ++++++++++++++++++++++++++++++------------------
- 2 files changed, 140 insertions(+), 84 deletions(-)
-
-Index: pkg-config-0.23/glib-1.2.10/acglib.m4
-===================================================================
---- pkg-config-0.23.orig/glib-1.2.10/acglib.m4	2008-01-16 22:52:24.000000000 +0000
-+++ pkg-config-0.23/glib-1.2.10/acglib.m4	2008-03-26 20:59:12.000000000 +0000
-@@ -10,7 +10,7 @@
- AC_DIVERT_POP()])])])
- 
- dnl GLIB_IF_VAR_EQ (ENV_VAR, VALUE [, EQUALS_ACTION] [, ELSE_ACTION])
--AC_DEFUN(GLIB_IF_VAR_EQ,[
-+AC_DEFUN([GLIB_IF_VAR_EQ],[
-         case "$[$1]" in
-         "[$2]"[)]
-                 [$3]
-@@ -21,7 +21,7 @@
-         esac
- ])
- dnl GLIB_STR_CONTAINS (SRC_STRING, SUB_STRING [, CONTAINS_ACTION] [, ELSE_ACTION])
--AC_DEFUN(GLIB_STR_CONTAINS,[
-+AC_DEFUN([GLIB_STR_CONTAINS],[
-         case "[$1]" in
-         *"[$2]"*[)]
-                 [$3]
-@@ -32,12 +32,12 @@
-         esac
- ])
- dnl GLIB_ADD_TO_VAR (ENV_VARIABLE, CHECK_STRING, ADD_STRING)
--AC_DEFUN(GLIB_ADD_TO_VAR,[
-+AC_DEFUN([GLIB_ADD_TO_VAR],[
-         GLIB_STR_CONTAINS($[$1], [$2], [$1]="$[$1]", [$1]="$[$1] [$3]")
- ])
- 
- dnl GLIB_SIZEOF (INCLUDES, TYPE, ALIAS [, CROSS-SIZE])
--AC_DEFUN(GLIB_SIZEOF,
-+AC_DEFUN([GLIB_SIZEOF],
- [changequote(<<, >>)dnl
- dnl The name to #define.
- define(<<AC_TYPE_NAME>>, translit(glib_sizeof_$3, [a-z *], [A-Z_P]))dnl
-@@ -62,7 +62,7 @@
- ])
- 
- dnl GLIB_BYTE_CONTENTS (INCLUDES, TYPE, ALIAS, N_BYTES, INITIALIZER)
--AC_DEFUN(GLIB_BYTE_CONTENTS,
-+AC_DEFUN([GLIB_BYTE_CONTENTS],
- [changequote(<<, >>)dnl
- dnl The name to #define.
- define(<<AC_TYPE_NAME>>, translit(glib_byte_contents_$3, [a-z *], [A-Z_P]))dnl
-@@ -92,7 +92,7 @@
- ])
- 
- dnl GLIB_SYSDEFS (INCLUDES, DEFS_LIST, OFILE [, PREFIX])
--AC_DEFUN(GLIB_SYSDEFS,
-+AC_DEFUN([GLIB_SYSDEFS],
- [glib_sysdefso="translit($3, [-_a-zA-Z0-9 *], [-_a-zA-Z0-9])"
- glib_sysdef_msg=`echo $2 | sed 's/:[[^ 	]]*//g'`
- if test "x`(echo '\n') 2>/dev/null`" != 'x\n'; then
-Index: pkg-config-0.23/glib-1.2.10/configure.in
-===================================================================
---- pkg-config-0.23.orig/glib-1.2.10/configure.in	2008-01-16 22:52:24.000000000 +0000
-+++ pkg-config-0.23/glib-1.2.10/configure.in	2008-03-26 20:59:12.000000000 +0000
-@@ -1,10 +1,11 @@
- dnl ***********************************
- dnl *** include special GLib macros ***
- dnl ***********************************
--builtin(include, acglib.m4)dnl
-+dnl no need, just use aclocal -I . --CL
-+dnl builtin(include, acglib.m4)dnl
- 
- # require autoconf 2.13
--AC_PREREQ(2.13)
-+AC_PREREQ(2.53)
- 
- # init autoconf (and check for presence of glist.c)
- AC_INIT(glist.c)
-@@ -13,11 +14,48 @@
- cflags_set=${CFLAGS+set}
- 
- # we rewrite this file
-+if test "x$cross_compiling" != "xyes"; then
- rm -f glibconfig-sysdefs.h
-+fi
-+
-+# config defines
-+
-+AH_TEMPLATE([ENABLE_MEM_CHECK],
-+	    [Define if enabling memory checking])
-+AH_TEMPLATE([ENABLE_MEM_PROFILE], [])
-+AH_TEMPLATE([GLIB_BINARY_AGE], [])
-+AH_TEMPLATE([GLIB_BYTE_CONTENTS_GMUTEX], [])
-+AH_TEMPLATE([GLIB_INTERFACE_AGE], [])
-+AH_TEMPLATE([GLIB_MAJOR_VERSION], [])
-+AH_TEMPLATE([GLIB_MINOR_VERSION], [])
-+AH_TEMPLATE([GLIB_MICRO_VERSION], [])
-+AH_TEMPLATE([GLIB_SIZEOF_GMUTEX], [])
-+AH_TEMPLATE([G_COMPILED_WITH_DEBUGGING], [])
-+AH_TEMPLATE([G_HAVE_INLINE], [])
-+AH_TEMPLATE([G_HAVE___INLINE], [])
-+AH_TEMPLATE([G_HAVE___INLINE__], [])
-+AH_TEMPLATE([G_THREAD_SOURCE], [])
-+AH_TEMPLATE([G_VA_COPY], [])
-+AH_TEMPLATE([G_VA_COPY_AS_ARRAY], [])
-+AH_TEMPLATE([HAVE_BROKEN_WCTYPE], [])
-+AH_TEMPLATE([HAVE_GETPWUID_R], [])
-+AH_TEMPLATE([HAVE_GETPWUID_R_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_COND_TIMEDWAIT_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_GETSPECIFIC_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX], [])
-+AH_TEMPLATE([HAVE_WCHAR_H], [])
-+AH_TEMPLATE([HAVE_WCTYPE_H], [])
-+AH_TEMPLATE([NO_FD_SET], [])
-+AH_TEMPLATE([NO_SYS_ERRLIST], [])
-+AH_TEMPLATE([NO_SYS_SIGLIST], [])
-+AH_TEMPLATE([NO_SYS_SIGLIST_DECL], [])
-+AH_TEMPLATE([REALLOC_0_WORKS], [])
-+
- 
- dnl we need to AC_DIVERT_PUSH/AC_DIVERT_POP these variable definitions so they
- dnl are available for $ac_help expansion (don't we all *love* autoconf?)
--GLIB_AC_DIVERT_BEFORE_HELP([
-+#AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)
-+#dnl
- #
- # The following version number definitions apply to GLib, GModule and GThread
- # as a whole, so if changes occoured in any of them, they are all
-@@ -38,7 +76,7 @@
- GLIB_BINARY_AGE=10
- GLIB_VERSION=$GLIB_MAJOR_VERSION.$GLIB_MINOR_VERSION.$GLIB_MICRO_VERSION
- dnl
--])
-+#AC_DIVERT_POP()dnl
- 
- AC_SUBST(GLIB_MAJOR_VERSION)
- AC_SUBST(GLIB_MINOR_VERSION)
-@@ -72,22 +110,20 @@
- AC_DEFINE_UNQUOTED(GLIB_BINARY_AGE, $GLIB_BINARY_AGE)
- 
- dnl Initialize libtool
--AC_PROG_LIBTOOL
-+AM_PROG_LIBTOOL
- 
- dnl Initialize maintainer mode
- AM_MAINTAINER_MODE
- 
--AC_CANONICAL_HOST
--
- dnl figure debugging default, prior to $ac_help setup
- dnl
--GLIB_AC_DIVERT_BEFORE_HELP([
-+#AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)dnl
- if test `expr $GLIB_MINOR_VERSION \% 2` = 1 ; then
- 	debug_default=yes
- else
- 	debug_default=minimum
- fi
--]) dnl
-+#AC_DIVERT_POP()dnl
- 
- dnl declare --enable-* args and collect ac_help strings
- AC_ARG_ENABLE(debug, [  --enable-debug=[no/minimum/yes] turn on debugging [default=$debug_default]],,enable_debug=$debug_default)
-@@ -194,7 +230,9 @@
-          CFLAGS=$glib_save_CFLAGS
-          AC_MSG_WARN(
-                 [No ANSI prototypes found in library. (-std1 didn't work.)])
-+	, AC_MSG_WARN([Skipping test due to crosscompilation])
-      )
-+     , AC_MSG_WARN([Skipping test due to crosscompilation])
- )
- LIBS=$glib_save_LIBS
- 
-@@ -336,7 +374,7 @@
- if test $gtk_ok = yes; then
-     AC_MSG_RESULT([yes, found in sys/types.h])
- else
--    AC_HEADER_EGREP(fd_set, sys/select.h, gtk_ok=yes)
-+    AC_HEADER_EGREP(fd_mask, sys/select.h, gtk_ok=yes)
-     if test $gtk_ok = yes; then
-         AC_DEFINE(HAVE_SYS_SELECT_H)
-         AC_MSG_RESULT([yes, found in sys/select.h])
-@@ -409,7 +447,7 @@
- 	glib_cv_sane_realloc=no
- 	,)
- ])
--if test x$glib_cv_sane_realloc = xyes; then
-+if test "x$glib_cv_sane_realloc" = "xyes"; then
- 	AC_DEFINE(REALLOC_0_WORKS)
- fi
- AC_MSG_RESULT($glib_cv_sane_realloc)
-@@ -487,7 +525,8 @@
- ])
- if test "x$glib_cv_va_copy" = "xyes"; then
-   AC_DEFINE(G_VA_COPY, va_copy)
--else if test "x$glib_cv___va_copy" = "xyes"; then
-+else
-+if test "x$glib_cv___va_copy" = "xyes"; then
-   AC_DEFINE(G_VA_COPY, __va_copy)
- fi
- fi
-@@ -496,6 +535,7 @@
- fi
- AC_MSG_RESULT($glib_cv_va_val_copy)
- 
-+AC_MSG_WARN([hi mom])
- 
- dnl ***********************
- dnl *** g_module checks ***
-@@ -507,23 +547,27 @@
- G_MODULE_BROKEN_RTLD_GLOBAL=0
- G_MODULE_HAVE_DLERROR=0
- dnl *** dlopen() and dlsym() in system libraries
-+AC_CHECK_FUNC(dlopen,[
-+	AC_CHECK_FUNC(dlsym,[
-+		G_MODULE_IMPL=G_MODULE_IMPL_DL
-+		],
-+	)],
-+)
- if test -z "$G_MODULE_IMPL"; then
--	AC_CHECK_FUNC(dlopen,
--		[AC_CHECK_FUNC(dlsym,
-+	AC_CHECK_FUNC(dlopen,[
-+		AC_CHECK_FUNC(dlsym,[
- 			G_MODULE_IMPL=G_MODULE_IMPL_DL
--		,)]
--	,)
--
-+		])],
-+	)
- fi
--
- dnl *** dlopen() and dlsym() in libdl
- if test -z "$G_MODULE_IMPL"; then
--	AC_CHECK_LIB(dl, dlopen,
--		[AC_CHECK_LIB(dl, dlsym,
-+	AC_CHECK_LIB(dl, dlopen,[
-+		AC_CHECK_LIB(dl, dlsym,[
- 			G_MODULE_LIBS=-ldl
- 			G_MODULE_IMPL=G_MODULE_IMPL_DL
--		,)]
--	,)
-+		])]
-+	)
- fi
- dnl *** shl_load() in libdld (HP-UX)
- if test -z "$G_MODULE_IMPL"; then
-@@ -633,6 +677,7 @@
- AC_SUBST(G_MODULE_NEED_USCORE)
- AC_SUBST(G_MODULE_BROKEN_RTLD_GLOBAL)
- AC_SUBST(GLIB_DEBUG_FLAGS)
-+AC_MSG_WARN([hi mom])
- 
- 
- dnl ***********************
-@@ -869,40 +914,50 @@
- 	fi
- 	if test x"$have_threads" = xposix; then
- 		LIBS="$LIBS $G_THREAD_LIBS"
--		AC_MSG_CHECKING(whether pthread_getspecific is posix like)
- 		# PCThreads has pthread_getspecific(pthread_key_t, void **);
--		AC_TRY_COMPILE([#include <pthread.h>],
--			[pthread_getspecific(0,NULL);],
--			[AC_MSG_RESULT(no)],
--			[AC_MSG_RESULT(yes)
--			AC_DEFINE(HAVE_PTHREAD_GETSPECIFIC_POSIX)])
--		AC_MSG_CHECKING(whether pthread_mutex_trylock is posix like)
-+		AC_CACHE_CHECK([whether pthread_getspecific is posix like],
-+			[glib_cv_sys_pthread_getspecific_posix], 
-+			AC_TRY_COMPILE([#include <pthread.h>],
-+				[pthread_getspecific(0,NULL);],
-+				[glib_cv_sys_pthread_getspecific_posix=no],
-+				[glib_cv_sys_pthread_getspecific_posix=yes])
-+		)
-+		if test x"$glib_cv_sys_pthread_getspecific_posix" = xyes; then
-+			AC_DEFINE(HAVE_PTHREAD_GETSPECIFIC_POSIX)
-+		fi
- 		# DCE Threads return 1 as success, posix 0. what a mess.
--		AC_TRY_RUN([#include <pthread.h>
--			pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
--			int main () { 
--			return !pthread_mutex_trylock (&mutex); }],
--			[AC_MSG_RESULT(no)],
--			[AC_MSG_RESULT(yes)
--			AC_DEFINE(HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX)])
--		AC_MSG_CHECKING(whether pthread_cond_timedwait is posix like)
-+		AC_CACHE_CHECK([whether pthread_mutex_trylock is posix like],
-+			[glib_cv_sys_pthread_mutex_trylock_posix], 
-+			AC_TRY_RUN([#include <pthread.h>
-+				pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
-+				int main () { 
-+				return !pthread_mutex_trylock (&mutex); }],
-+				[glib_cv_sys_pthread_mutex_trylock_posix=no],
-+				[glib_cv_sys_pthread_mutex_trylock_posix=yes])
-+		)
-+		if test x"$glib_cv_sys_pthread_mutex_trylock_posix" = xyes; then
-+			AC_DEFINE(HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX)
-+		fi
- 		# DCE Threads return -1 as failure, posix ETIMEDOUT.
--		AC_TRY_RUN([#include <pthread.h>
--			#include <sys/time.h>
--			int main () { 
--			pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
--			pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
--			struct timeval tval;
--			struct timespec tspec;
--			gettimeofday (&tval, NULL);
--			tspec.tv_sec = tval.tv_sec;
--			tspec.tv_nsec = 0;
--			pthread_mutex_lock (&mutex);
--			return pthread_cond_timedwait (&cond,&mutex,&tspec) 
--				!= -1;}],
--			[AC_MSG_RESULT(no)],
--			[AC_MSG_RESULT(yes)
--			AC_DEFINE(HAVE_PTHREAD_COND_TIMEDWAIT_POSIX)])
-+		AC_CACHE_CHECK([whether pthread_cond_timedwait is posix like],
-+			[glib_cv_sys_pthread_cond_timedwait_posix], 
-+			AC_TRY_RUN([#include <pthread.h>
-+				int main () { 
-+				pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
-+				pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
-+				struct timeval tval;
-+				struct timespec tspec;
-+				gettimeofday (&tval, NULL);
-+				tspec.tv_sec = tval.tv_sec;
-+				tspec.tv_nsec = 0;
-+				return pthread_cond_timedwait (&cond,&mutex,&tspec) 
-+					!= -1;}],
-+				[glib_cv_sys_pthread_cond_timedwait_posix=no],
-+				[glib_cv_sys_pthread_cond_timedwait_posix=yes])
-+		)
-+		if test x"$glib_cv_sys_pthread_cond_timedwait_posix" = xyes; then
-+			AC_DEFINE(HAVE_PTHREAD_COND_TIMEDWAIT_POSIX)
-+		fi
- 	fi
- 	LIBS="$glib_save_LIBS"
- 	CFLAGS="$glib_save_CFLAGS"
-@@ -946,13 +1001,14 @@
- dnl ****************************************
- dnl *** GLib POLL* compatibility defines ***
- dnl ****************************************
-+if test x"$cross_compiling" != xyes; then
- GLIB_SYSDEFS(
- [#include <sys/types.h>
- #include <sys/poll.h>],
- 	POLLIN:1 POLLOUT:4 POLLPRI:2 POLLERR:8 POLLHUP:16 POLLNVAL:32,
- 	glibconfig-sysdefs.h,
- 	=)
--
-+fi
- 
- dnl ******************************
- dnl *** output the whole stuff ***
-@@ -1005,7 +1061,7 @@
- 	  echo '#define GLIB_HAVE_SYS_POLL_H' >> $outfile
- 	fi
- 
--	cat >> $outfile <<_______EOF
-+	cat >> $outfile <<EOF
- 
- #ifdef __cplusplus
- extern "C" {
-@@ -1022,60 +1078,60 @@
- #define G_MINLONG	$glib_ml
- #define G_MAXLONG	$glib_Ml
- 
--_______EOF
-+EOF
- 
- 
- 	### this should always be true in a modern C/C++ compiler
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- typedef signed char gint8;
- typedef unsigned char guint8;
--_______EOF
-+EOF
- 
- 
- 	if test -n "$gint16"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- typedef signed $gint16 gint16;
- typedef unsigned $gint16 guint16;
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -n "$gint32"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- typedef signed $gint32 gint32;
- typedef unsigned $gint32 guint32;
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -n "$gint64"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- ${glib_warning_guard}#define G_HAVE_GINT64 1
- 
- ${glib_extension}typedef signed $gint64 gint64;
- ${glib_extension}typedef unsigned $gint64 guint64;
- 
- #define G_GINT64_CONSTANT(val)	$gint64_constant
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -z "$glib_unknown_void_p"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- 
- #define GPOINTER_TO_INT(p)	((gint)  ${glib_gpi_cast} (p))
- #define GPOINTER_TO_UINT(p)	((guint) ${glib_gpui_cast} (p))
- 
- #define GINT_TO_POINTER(i)	((gpointer) ${glib_gpi_cast} (i))
- #define GUINT_TO_POINTER(u)	((gpointer) ${glib_gpui_cast} (u))
--_______EOF
-+EOF
- 	else
- 	  echo '#error SIZEOF_VOID_P unknown - This should never happen' >>$outfile
- 	fi
- 
- 
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- $glib_atexit
- $glib_memmove
- $glib_defines
-@@ -1087,11 +1143,11 @@
- #else	/* !__cplusplus */
- $glib_inline
- #endif	/* !__cplusplus */
--_______EOF
-+EOF
- 
- 	echo >>$outfile
- 	if test x$g_mutex_has_default = xyes; then
--		cat >>$outfile <<_______EOF
-+		cat >>$outfile <<EOF
- $g_enable_threads_def G_THREADS_ENABLED
- #define G_THREADS_IMPL_$g_threads_impl_def
- typedef struct _GStaticMutex GStaticMutex;
-@@ -1109,15 +1165,15 @@
- #define	g_static_mutex_get_mutex(mutex) \
-   (g_thread_use_default_impl ? ((GMutex*) &((mutex)->aligned_pad_u)) : \
-    g_static_mutex_get_mutex_impl (&((mutex)->runtime_mutex)))
--_______EOF
-+EOF
- 	else
--		cat >>$outfile <<_______EOF
-+		cat >>$outfile <<EOF
- $g_enable_threads_def G_THREADS_ENABLED
- #define G_THREADS_IMPL_$g_threads_impl_def
- typedef struct _GMutex* GStaticMutex;
- #define G_STATIC_MUTEX_INIT NULL
- #define g_static_mutex_get_mutex(mutex) (g_static_mutex_get_mutex_impl (mutex))
--_______EOF
-+EOF
- 	fi
- 
- 	echo >>$outfile
-@@ -1126,15 +1182,15 @@
- 	  g_bit_sizes="$g_bit_sizes 64"
- 	fi
- 	for bits in $g_bit_sizes; do
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- #define GINT${bits}_TO_${g_bs_native}(val)	((gint${bits}) (val))
- #define GUINT${bits}_TO_${g_bs_native}(val)	((guint${bits}) (val))
- #define GINT${bits}_TO_${g_bs_alien}(val)	((gint${bits}) GUINT${bits}_SWAP_LE_BE (val))
- #define GUINT${bits}_TO_${g_bs_alien}(val)	(GUINT${bits}_SWAP_LE_BE (val))
--_______EOF
-+EOF
- 	done
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- #define GLONG_TO_LE(val)	((glong) GINT${glongbits}_TO_LE (val))
- #define GULONG_TO_LE(val)	((gulong) GUINT${glongbits}_TO_LE (val))
- #define GLONG_TO_BE(val)	((glong) GINT${glongbits}_TO_BE (val))
-@@ -1145,14 +1201,14 @@
- #define GUINT_TO_BE(val)	((guint) GUINT${gintbits}_TO_BE (val))
- #define G_BYTE_ORDER $g_byte_order
- 
--_______EOF
-+EOF
- 
- 	if test -r glibconfig-sysdefs.h; then
- 	  cat glibconfig-sysdefs.h >>$outfile
- 	fi
- 
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- 
- $glib_wc
- 
-@@ -1162,7 +1218,7 @@
- #endif /* __cplusplus */
- 
- #endif /* GLIBCONFIG_H */
--_______EOF
-+EOF
- 
- 
- 	if cmp -s $outfile glibconfig.h; then
-Index: pkg-config-0.23/glib-1.2.10/glib.m4
-===================================================================
---- pkg-config-0.23.orig/glib-1.2.10/glib.m4	2008-04-14 23:34:39.000000000 +0100
-+++ pkg-config-0.23/glib-1.2.10/glib.m4	2008-04-14 09:26:29.000000000 +0100
-@@ -5,7 +5,7 @@
- dnl Test for GLIB, and define GLIB_CFLAGS and GLIB_LIBS, if "gmodule" or 
- dnl gthread is specified in MODULES, pass to glib-config
- dnl
--AC_DEFUN(AM_PATH_GLIB,
-+AC_DEFUN([AM_PATH_GLIB],
- [dnl 
- dnl Get the cflags and libraries from the glib-config script
- dnl
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
similarity index 100%
rename from meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch
rename to meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
deleted file mode 100644
index 57a22d4..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require pkgconfig.inc
-
-SRC_URI += " \
-            file://pkg-config-native.in \
-            file://fix-glib-configure-libtool-usage.patch \
-            file://obsolete_automake_macros.patch \
-            file://0001-Strip-system-library-directories-reliably.patch \
-           "
-
-SRC_URI[md5sum] = "aa3c86e67551adc3ac865160e34a2a0d"
-SRC_URI[sha256sum] = "6b6eb31c6ec4421174578652c7e141fdaae2dabad1021f420d8713206ac1f845"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index e420420..eaa511a 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -1,40 +1,6 @@
 require pkgconfig.inc
 
-SRC_URI = "git://anongit.freedesktop.org/pkg-config \
-           file://autofoo.patch"
-
-S = "${WORKDIR}/git/"
-
-SRCREV = "66d49f1375fec838bcd301bb4ca2ef76cee0e47c"
-PV = "0.23+git${SRCPV}"
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-
-# Can't do native version with git since git-native depends on pkgconfig-native
-BBCLASSEXTEND = "nativesdk"
-
-do_fixsource() {
-	# Adapted from autogen.sh
-	cd ${S}
-	tar -xvzf glib-1.2.10.tar.gz
-	
-	chmod +w `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e "s/lib_LTLIBRARIES/noinst_LTLIBRARIES/g" `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e "s/bin_SCRIPTS/noinst_SCRIPTS/g" `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e "s/include_HEADERS/noinst_HEADERS/g" `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e "s/glibnoinst_HEADERS/noinst_HEADERS/g" `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e 's/([a-zA-Z0-9]+)_DATA/noinst_DATA/g' `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e "s/info_TEXINFOS/noinst_TEXINFOS/g" `find glib-1.2.10 -name Makefile.am`
-	perl -p -i.bak -e "s/man_MANS/noinst_MANS/g" `find glib-1.2.10 -name Makefile.am`
-	
-	## patch gslist.c to have stable sort
-	perl -p -w -i.bak -e 's/if \(compare_func\(l1->data,l2->data\) < 0\)/if \(compare_func\(l1->data,l2->data\) <= 0\)/g' glib-1.2.10/gslist.c
-	
-	# Update random auto* files to actually have something which have a snowball's
-	# chance in a hot place of working with modern auto* tools.
-	
-	(cd glib-1.2.10 && for p in ../glib-patches/*.diff; do echo $p; patch -p1 < $p || exit 1; done ) || exit 1
-}
-
-addtask fixsource before do_patch after do_unpack
+SRC_URI += " \
+            file://pkg-config-native.in \
+            file://fix-glib-configure-libtool-usage.patch \
+           "
-- 
2.1.4


