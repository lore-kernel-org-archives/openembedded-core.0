Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76F446E4AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 17:00:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2013 09:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,496,1384329600"; d="scan'208";a="445121243"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2013 09:00:15 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2013 19:02:47 +0200
Message-Id: <6d1f676c1858ce9441cc0fde85b55cbdef4d5cd3.1387213322.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1387213322.git.cristian.iorga@intel.com>
References: <cover.1387213322.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1387213322.git.cristian.iorga@intel.com>
References: <cover.1387213322.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] libpcap: upgrade to 1.5.2
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
X-List-Received-Date: Mon, 16 Dec 2013 17:00:16 -0000

aclocal.patch was updated, still needed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap/aclocal.patch           | 8 ++++----
 .../libpcap/{libpcap_1.4.0.bb => libpcap_1.5.2.bb}                | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.4.0.bb => libpcap_1.5.2.bb} (80%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
index 469d122..2151982 100644
--- a/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
@@ -9,16 +9,16 @@ diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
  dnl
 -AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
 +AC_DEFUN([AC_LBL_C_INIT_BEFORE_CC],
-     [AC_PREREQ(2.50)
+ [
      AC_BEFORE([$0], [AC_LBL_C_INIT])
      AC_BEFORE([$0], [AC_PROG_CC])
 @@ -90,7 +90,7 @@
- dnl	ac_cv_lbl_gcc_vers
- dnl	LBL_CFLAGS
+ dnl     LDFLAGS
+ dnl     LBL_CFLAGS
  dnl
 -AC_DEFUN(AC_LBL_C_INIT,
 +AC_DEFUN([AC_LBL_C_INIT],
-     [AC_PREREQ(2.50)
+ [
      AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
      AC_BEFORE([$0], [AC_LBL_DEVEL])
 @@ -217,7 +217,7 @@
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.4.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.5.2.bb
similarity index 80%
rename from meta/recipes-connectivity/libpcap/libpcap_1.4.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.5.2.bb
index 75a540e..37cc141 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.4.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.5.2.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch \
            "
 
-SRC_URI[md5sum] = "56e88a5aabdd1e04414985ac24f7e76c"
-SRC_URI[sha256sum] = "7c6a2a4f71e8ab09804e6b4fb3aff998c5583108ac42c0e2967eee8e1dbc7406"
+SRC_URI[md5sum] = "33ba2f10f3a402cb5d34f5e2a904794a"
+SRC_URI[sha256sum] = "806d4ba23b126476d39a458ad1468f73dfe63c92f9586208f7e4e18c13e52ddd"
 
 #
 # make install doesn't cover the shared lib
-- 
1.8.3.2


