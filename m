Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF296FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:51:58 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a140so57129551wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i02w0YpGDFErs4cCpoQ72+EVK1onx6/sPpdC1ufYGmE=;
	b=JiSvzKK6ROmFrp+UHb6KUVadGe7e4buhzOWRuIG84UmldXCFXx9fP8pty4h6jyFfz+
	7MU5ep+qiAjkZCNfRo0oX0rPX/dRp3A6z2/e9AC3j2RuqshsbsCKSAFYHrjOcNfzXSo8
	BA0+8npHqvElhJ7wVgfiWoV7TzcOZ9En9t8xr6slqSU/cR2dh4G55H82ZOpzJThVDfSn
	iH3at/NYrC0hxg1MQaP5CJq88L90/mpv7kQUQN6yY4IrR4aYzFjsVUbUSmK4kDlcrwlZ
	pOy1hq9EZBa4NHk9Sn4hBQf/YlK71JZtvWlLD7RuyKwZSg2zlyZQ9ceLGcs2Dhh1qPeO
	qAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i02w0YpGDFErs4cCpoQ72+EVK1onx6/sPpdC1ufYGmE=;
	b=ERJ/eTN/X3FLfkEMFpdUUwO3tDD6LFGOANwCTt8V3YLMSGcAt/h+sAvIYQNQQMapjE
	M5aYUMT9tHgAWqxEusCNxm4Glgk0jsLWtWyu1aC8wgNx5U17ohnv7D2H722EGfe4qlNf
	PT5A3jw1qAtPMyQGGPAjfTWsMHsbXdn57/L6lFGvSoL2jn9Jb67A0pzBTMqfIEZkIAh8
	eX9cgi/4Jdq5UCqaUrTEkk8EKDnptGQe6tbs4K60S9y9Lt58Vkm/Bl+nB0BadB2QYbjl
	TRa9Y+8HUgIe++frmoXNfiqkNUgYEfkAlglge0sOCSGgMX0496PYwQPPtWq5Bs39JDN9
	NBGQ==
X-Gm-Message-State: AD7BkJJJyfJevVOaprq1/Q7kIT/5oxJw1AuDrivzYWRMRsYR5Qr6+DZExsCS0QEhligiDetS
X-Received: by 10.28.104.131 with SMTP id d125mr23871403wmc.99.1460472719268; 
	Tue, 12 Apr 2016 07:51:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm23192722wme.9.2016.04.12.07.51.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 07:51:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:51:52 +0100
Message-Id: <1460472714-12605-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
References: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] rsync: don't install acinclude.m4
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
X-List-Received-Date: Tue, 12 Apr 2016 14:51:59 -0000

This acinclude.m4 was actually a stale copy of upstream's generated aclocal.m4.
This generates correctly now, so there isn't a need to install this by hand
anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rsync/files/acinclude.m4 | 95 --------------------------
 meta/recipes-devtools/rsync/rsync_3.1.2.bb     |  5 --
 2 files changed, 100 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/acinclude.m4

diff --git a/meta/recipes-devtools/rsync/files/acinclude.m4 b/meta/recipes-devtools/rsync/files/acinclude.m4
deleted file mode 100644
index 735b41d..0000000
--- a/meta/recipes-devtools/rsync/files/acinclude.m4
+++ /dev/null
@@ -1,95 +0,0 @@
-dnl verbatim renamed from aclocal.m4 in rsync_3.0.7
-dnl 07/06/2010 - qhe
-
-dnl AC_VALIDATE_CACHE_SYSTEM_TYPE[(cmd)]
-dnl if the cache file is inconsistent with the current host,
-dnl target and build system types, execute CMD or print a default
-dnl error message.
-AC_DEFUN(AC_VALIDATE_CACHE_SYSTEM_TYPE, [
-    AC_REQUIRE([AC_CANONICAL_SYSTEM])
-    AC_MSG_CHECKING([config.cache system type])
-    if { test x"${ac_cv_host_system_type+set}" = x"set" &&
-         test x"$ac_cv_host_system_type" != x"$host"; } ||
-       { test x"${ac_cv_build_system_type+set}" = x"set" &&
-         test x"$ac_cv_build_system_type" != x"$build"; } ||
-       { test x"${ac_cv_target_system_type+set}" = x"set" &&
-         test x"$ac_cv_target_system_type" != x"$target"; }; then
-	AC_MSG_RESULT([different])
-	ifelse($#, 1, [$1],
-		[AC_MSG_ERROR(["you must remove config.cache and restart configure"])])
-    else
-	AC_MSG_RESULT([same])
-    fi
-    ac_cv_host_system_type="$host"
-    ac_cv_build_system_type="$build"
-    ac_cv_target_system_type="$target"
-])
-
-dnl Check for socklen_t: historically on BSD it is an int, and in
-dnl POSIX 1g it is a type of its own, but some platforms use different
-dnl types for the argument to getsockopt, getpeername, etc.  So we
-dnl have to test to find something that will work.
-
-dnl This is no good, because passing the wrong pointer on C compilers is
-dnl likely to only generate a warning, not an error.  We don't call this at
-dnl the moment.
-
-AC_DEFUN([TYPE_SOCKLEN_T],
-[
-   AC_CHECK_TYPE([socklen_t], ,[
-      AC_MSG_CHECKING([for socklen_t equivalent])
-      AC_CACHE_VAL([rsync_cv_socklen_t_equiv],
-      [
-         # Systems have either "struct sockaddr *" or
-         # "void *" as the second argument to getpeername
-         rsync_cv_socklen_t_equiv=
-         for arg2 in "struct sockaddr" void; do
-            for t in int size_t unsigned long "unsigned long"; do
-               AC_TRY_COMPILE([
-#include <sys/types.h>
-#include <sys/socket.h>
-
-                  int getpeername (int, $arg2 *, $t *);
-               ],[
-                  $t len;
-                  getpeername(0,0,&len);
-               ],[
-                  rsync_cv_socklen_t_equiv="$t"
-                  break
-               ])
-            done
-         done
-
-         if test "x$rsync_cv_socklen_t_equiv" = x; then
-            AC_MSG_ERROR([Cannot find a type to use in place of socklen_t])
-         fi
-      ])
-      AC_MSG_RESULT($rsync_cv_socklen_t_equiv)
-      AC_DEFINE_UNQUOTED(socklen_t, $rsync_cv_socklen_t_equiv,
-			[type to use in place of socklen_t if not defined])],
-      [#include <sys/types.h>
-#include <sys/socket.h>])
-])
-
-dnl AC_HAVE_TYPE(TYPE,INCLUDES)
-AC_DEFUN([AC_HAVE_TYPE], [
-AC_REQUIRE([AC_HEADER_STDC])
-cv=`echo "$1" | sed 'y%./+- %__p__%'`
-AC_MSG_CHECKING(for $1)
-AC_CACHE_VAL([ac_cv_type_$cv],
-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-AC_INCLUDES_DEFAULT
-$2]],
-[[$1 foo;]])],
-[eval "ac_cv_type_$cv=yes"],
-[eval "ac_cv_type_$cv=no"]))dnl
-ac_foo=`eval echo \\$ac_cv_type_$cv`
-AC_MSG_RESULT($ac_foo)
-if test "$ac_foo" = yes; then
-  ac_tr_hdr=HAVE_`echo $1 | sed 'y%abcdefghijklmnopqrstuvwxyz./- %ABCDEFGHIJKLMNOPQRSTUVWXYZ____%'`
-if false; then
-	AC_CHECK_TYPES($1)
-fi
-  AC_DEFINE_UNQUOTED($ac_tr_hdr, 1, [Define if you have type `$1'])
-fi
-])
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.2.bb b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
index 7237f43..5f4733f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
@@ -1,9 +1,5 @@
 require rsync.inc
 
-
-SRC_URI += "file://acinclude.m4 \
-"
-
 SRC_URI[md5sum] = "0f758d7e000c0f7f7d3792610fad70cb"
 SRC_URI[sha256sum] = "ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09c0a1c2"
 
@@ -15,7 +11,6 @@ PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
 # makefile checks the existence of configure.sh
 do_configure_prepend () {
 	rm -f ${S}/configure ${S}/configure.sh
-	cp -f ${WORKDIR}/acinclude.m4 ${S}/
 
 	# By default, if crosscompiling, rsync disables a number of
 	# capabilities, hardlinking symlinks and special files (i.e. devices)
-- 
2.8.0.rc3


