Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C4FDD6D709
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417495"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:26 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:16 +0200
Message-Id: <7b7e2f1f2c529a2867a48e0ddfe78faf2b702c2f.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/7] diffstat: upgrade to 1.58
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:27 -0000

Adjusted aclocal.patch to apply correctly.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../diffstat/diffstat/aclocal.patch                |   11 ++++++-----
 .../{diffstat_1.57.bb => diffstat_1.58.bb}         |    4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.57.bb => diffstat_1.58.bb} (84%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
index 37e518f..ff18f1b 100644
--- a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
@@ -11,11 +11,11 @@ The original macro name (AC_ACVERSION) leads to this error:
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
 
-diff --git a/aclocal.m4 b/aclocal.m4
-index 144a074..fce6eba 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -13,15 +13,15 @@ dnl ------------------
+Index: diffstat-1.58/aclocal.m4
+===================================================================
+--- diffstat-1.58.orig/aclocal.m4	2013-10-29 01:43:23.000000000 +0200
++++ diffstat-1.58/aclocal.m4	2013-11-04 11:22:53.461562567 +0200
+@@ -13,16 +13,16 @@
  dnl Conditionally generate script according to whether we're using a given autoconf.
  dnl
  dnl $1 = version to compare against
@@ -25,6 +25,7 @@ index 144a074..fce6eba 100644
 +dnl $3 = code to use if AC_AUTOCONF_VERSION is older than $1.
  define([CF_ACVERSION_CHECK],
  [
+ ifdef([AC_ACVERSION], ,[m4_copy([m4_PACKAGE_VERSION],[AC_ACVERSION])])dnl
  ifdef([m4_version_compare],
 -[m4_if(m4_version_compare(m4_defn([AC_ACVERSION]), [$1]), -1, [$3], [$2])],
 +[m4_if(m4_version_compare(m4_defn([AC_AUTOCONF_VERSION]), [$1]), -1, [$3], [$2])],
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.57.bb b/meta/recipes-devtools/diffstat/diffstat_1.58.bb
similarity index 84%
rename from meta/recipes-devtools/diffstat/diffstat_1.57.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.58.bb
index c25005f..8f73bfc 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.57.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.58.bb
@@ -11,8 +11,8 @@ SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
            file://dirfix.patch \
            file://aclocal.patch"
 
-SRC_URI[md5sum] = "a70ae35e479ab91da7eb6023a4e9240a"
-SRC_URI[sha256sum] = "cb9845839d695f178d6b5458b08d3e04773e400f35c0c062c4c0102220fba1e6"
+SRC_URI[md5sum] = "6d6e13f7dcfe4db5da65c5175260ea47"
+SRC_URI[sha256sum] = "fad5135199c3b9aea132c5d45874248f4ce0ff35f61abb8d03c3b90258713793"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
1.7.9.5


