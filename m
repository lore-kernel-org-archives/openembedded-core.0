Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 27D6A77187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 23:28:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so658339pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OM2521D5bhf0nX7LwKiFFcdqc2itv1KbQvyyhLkarYI=;
	b=vxwjBmMtU9Ua4EsINtgpbtuwwJVIh1f52x1C7s0ZqRtW/KWtqMVRSUNtLi4byYMcyE
	goSnxMhg2g9IlYOmFdD5IsZLvvAXhT07Fajom4PkOsX/HrohIC/LiJJma//B+lmtvnUS
	qmisljSPAoOfHQocwL8uBaI2Esdt4GQ1ys3hjWRjdZ+aW5W9WWY1L7pQKn0ZUOmlQWgI
	fHPA1oO57QsoVHDFbThpYS6v270tT7vw9eWTGSI+FThX1FGsM709OAFCZZ90y8jgg+sS
	cC00x9sEfkwXhdws+v9kQ6r6O1kg5ieawci2nDVsoWR+QD5phMtgYle39ccF0Xexy/UW
	9mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OM2521D5bhf0nX7LwKiFFcdqc2itv1KbQvyyhLkarYI=;
	b=Jb0iSDTFxIT1TWLcIpNrRd6cbeErF/zlsSuVAzGRPb5TQmNFEZkH043yffbdD2/JQw
	Q5+s1vV04zhznfTKI7/gjVPa+3jw+Q8hIkXFH2IMm+3rhK9yecfxUO3wOhVVdQEL8y/i
	ljCijsK6rC2ZCa95Ej0TXbvSuP2Zqzz2NuJydbNgOI08lJyoNrTDCy/cXVUJXTDVzRjY
	tq1SrE90h8n1rFW/hCpVB3et6lo/dll1gYAjlZc2sq9WSdVaAUQ2WW0rTsDSlhyJBA4e
	WykYkFscj7Pnq09/+7Cbji0r1AaHGaBgLmCtIzbgtTBCp41SR9NS8I0gH3ne02C/a2YY
	NjdA==
X-Gm-Message-State: AG10YOQ1K5leL07p6r4k6XV//BQ9ywL/qhPzPV94of2l8mtU2c8aYcmflPvbA6fTBnRJxw==
X-Received: by 10.98.9.75 with SMTP id e72mr45676110pfd.29.1453937327228;
	Wed, 27 Jan 2016 15:28:47 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h66sm11422372pfj.52.2016.01.27.15.28.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 15:28:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:28:34 -0800
Message-Id: <1453937316-1311-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] glib-2.0: refresh configure-libtool.patch
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
X-List-Received-Date: Wed, 27 Jan 2016 23:28:46 -0000

Refresh configure-libtool.patch to replace one more instance of
./libtool in configure.ac, first introduced in v2.31.20:

  https://git.gnome.org/browse/glib/commit/?id=59ee6dbc004adda8c4e4c8ff58bf21a9173eb99f

Fixes "./libtool: No such file or directory" warnings when running
configure:

 | ...
 | checking for dlsym in -ldl... yes
 | ../glib-2.46.2/configure: line 25481: ./libtool: No such file or directory
 | checking for RTLD_GLOBAL brokenness... (cached) yes
 | ...

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../glib-2.0/glib-2.0/configure-libtool.patch      | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
index 1d69a3f..aa5de27 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
@@ -1,4 +1,4 @@
-From 1c5718648d49e795efee91c220a2bf9386c184f2 Mon Sep 17 00:00:00 2001
+From e8740833336c59d6f616a1781b256e648e338c26 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 28 Apr 2012 18:24:50 +0200
 Subject: [PATCH] configure: use $host_alias-libtool instead of libtool
@@ -13,19 +13,20 @@ from PATH though
 
 Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
 Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
+Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure.ac |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ configure.ac | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a6478c6..9a93d60 100644
+index 1af90c5..f6b7a73 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1470,7 +1470,7 @@ if test x"$glib_native_win32" = xyes; then
+@@ -1378,7 +1378,7 @@ if test x"$glib_native_win32" = xyes; then
    G_MODULE_LDFLAGS=
  else
    export SED
@@ -34,7 +35,7 @@ index a6478c6..9a93d60 100644
  fi
  dnl G_MODULE_IMPL= don't reset, so cmd-line can override
  G_MODULE_NEED_USCORE=0
-@@ -1535,9 +1535,9 @@ if test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL"; then
+@@ -1427,13 +1427,13 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
  	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
  dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
  	echo "void glib_plugin_test(void) { }" > plugin.c
@@ -46,7 +47,12 @@ index a6478c6..9a93d60 100644
  		${LDFLAGS} -module -o plugin.la -export-dynamic \
  		-shrext ".o" -avoid-version plugin.lo \
  		-rpath /dont/care >/dev/null 2>&1
-@@ -1614,7 +1614,7 @@ fi
+-	eval `./libtool --config | grep ^objdir`
++	eval `./$host_alias-libtool --config | grep ^objdir`
+ 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
+ 		glib_cv_rtldglobal_broken,[
+ 		AC_TRY_RUN([
+@@ -1506,7 +1506,7 @@ fi
  
  AC_MSG_CHECKING(for the suffix of module shared libraries)
  export SED
@@ -56,5 +62,5 @@ index a6478c6..9a93d60 100644
  module=yes eval std_shrext=$shrext_cmds
  # chop the initial dot
 -- 
-1.7.8.6
+1.9.1
 
-- 
1.9.1


