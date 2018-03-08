Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B73417897D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053700"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:32 +0200
Message-Id: <20180308181804.31261-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/42] libksba: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:56 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libksba/ksba-add-pkgconfig-support.patch       | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index d28dfd9ebeb..5afe6de923f 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -6,13 +6,13 @@ They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
-Index: libksba-1.3.0/Makefile.am
+Index: libksba-1.3.5/Makefile.am
 ===================================================================
---- libksba-1.3.0.orig/Makefile.am	2014-05-13 21:39:22.390385646 +0000
-+++ libksba-1.3.0/Makefile.am	2014-05-13 21:39:22.462385646 +0000
-@@ -21,6 +21,9 @@
+--- libksba-1.3.5.orig/Makefile.am
++++ libksba-1.3.5/Makefile.am
+@@ -20,6 +20,9 @@
+ 
  ACLOCAL_AMFLAGS = -I m4 -I gl/m4
- AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
  
 +pkgconfigdir = ${libdir}/pkgconfig
 +pkgconfig_DATA = ksba.pc
@@ -20,11 +20,11 @@ Index: libksba-1.3.0/Makefile.am
  # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
  GITLOG_TO_CHANGELOG=gitlog-to-changelog
  
-Index: libksba-1.3.0/configure.ac
+Index: libksba-1.3.5/configure.ac
 ===================================================================
---- libksba-1.3.0.orig/configure.ac	2014-05-13 21:39:22.390385646 +0000
-+++ libksba-1.3.0/configure.ac	2014-05-13 21:39:22.462385646 +0000
-@@ -400,6 +400,7 @@
+--- libksba-1.3.5.orig/configure.ac
++++ libksba-1.3.5/configure.ac
+@@ -414,6 +414,7 @@ gl/Makefile
  src/Makefile
  src/ksba-config
  src/versioninfo.rc
@@ -32,10 +32,10 @@ Index: libksba-1.3.0/configure.ac
  tests/Makefile
  doc/Makefile
  ])
-Index: libksba-1.3.0/ksba.pc.in
+Index: libksba-1.3.5/ksba.pc.in
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libksba-1.3.0/ksba.pc.in	2014-05-13 21:39:22.462385646 +0000
+--- /dev/null
++++ libksba-1.3.5/ksba.pc.in
 @@ -0,0 +1,17 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -54,11 +54,11 @@ Index: libksba-1.3.0/ksba.pc.in
 +Libs.private: -L${libdir} -lgpg-error
 +Cflags: -I${includedir}
 +
-Index: libksba-1.3.0/src/ksba.m4
+Index: libksba-1.3.5/src/ksba.m4
 ===================================================================
---- libksba-1.3.0.orig/src/ksba.m4	2014-05-13 21:39:22.390385646 +0000
-+++ libksba-1.3.0/src/ksba.m4	2014-05-13 21:49:03.650382696 +0000
-@@ -22,18 +22,7 @@
+--- libksba-1.3.5.orig/src/ksba.m4
++++ libksba-1.3.5/src/ksba.m4
+@@ -22,18 +22,7 @@ dnl with a changed API.
  dnl
  AC_DEFUN([AM_PATH_KSBA],
  [AC_REQUIRE([AC_CANONICAL_HOST])
@@ -77,7 +77,7 @@ Index: libksba-1.3.0/src/ksba.m4
    tmp=ifelse([$1], ,1:1.0.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_ksba_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -43,48 +32,13 @@
+@@ -43,48 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],
       min_ksba_version="$tmp"
    fi
  
@@ -129,7 +129,7 @@ Index: libksba-1.3.0/src/ksba.m4
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([KSBA API version])
             if test "$req_ksba_api" -eq "$tmp" ; then
-@@ -97,10 +51,8 @@
+@@ -97,10 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],
       fi
    fi
    if test $ok = yes; then
@@ -141,7 +141,7 @@ Index: libksba-1.3.0/src/ksba.m4
      if test x"$libksba_config_host" != xnone ; then
        if test x"$libksba_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -114,8 +66,6 @@
+@@ -114,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],
        fi
      fi
    else
-- 
2.16.1


