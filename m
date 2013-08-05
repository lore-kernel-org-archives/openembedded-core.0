Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F0D2B6B4EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:43:03 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Aug 2013 07:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="277913365"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2013 07:43:03 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 17:44:44 +0300
Message-Id: <1375713884-8528-4-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1375713884-8528-1-git-send-email-cristian.iorga@intel.com>
References: <1375713884-8528-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 4/4] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Mon, 05 Aug 2013 14:43:04 -0000

disable_graphite.patch updated.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/harfbuzz-0.9.17/disable_graphite.patch       | 15 ---------------
 .../harfbuzz/harfbuzz/disable_graphite.patch              | 15 +++++++++++++++
 .../harfbuzz/{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb}   |  7 ++-----
 3 files changed, 17 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/disable_graphite.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb} (85%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch b/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
deleted file mode 100644
index 49938ba..0000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd harfbuzz-0.9.10/configure.ac harfbuzz-0.9.10/configure.ac
---- harfbuzz-0.9.10/configure.ac	2013-01-03 08:08:51.000000000 +0200
-+++ harfbuzz-0.9.10/configure.ac	2013-01-09 08:18:04.812529418 +0200
-@@ -185,7 +185,7 @@
-
- dnl ==========================================================================
-
--PKG_CHECK_MODULES(GRAPHITE2, graphite2, have_graphite=true, have_graphite=false)
-+have_graphite=false
- if $have_graphite; then
-     AC_DEFINE(HAVE_GRAPHITE2, 1, [Have Graphite library])
- fi
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/disable_graphite.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/disable_graphite.patch
new file mode 100644
index 0000000..228ebb1
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/disable_graphite.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+Index: harfbuzz-0.9.19/configure.ac
+===================================================================
+--- harfbuzz-0.9.19.orig/configure.ac
++++ harfbuzz-0.9.19/configure.ac
+@@ -253,6 +253,7 @@ fi
+ if test "x$with_graphite2" = "xyes" -a "x$have_graphite2" != "xtrue"; then
+ 	AC_MSG_ERROR([graphite2 support requested but libgraphite2 not found])
+ fi
++have_graphite=false
+ if $have_graphite2; then
+     AC_DEFINE(HAVE_GRAPHITE2, 1, [Have Graphite2 library])
+ fi
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.17.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
similarity index 85%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.17.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
index 968d8a2..6128358 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.17.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.19.bb
@@ -13,14 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 
 SECTION = "libs"
 
-PR = "r0"
-
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2 \
            file://disable_graphite.patch \
 "
-
-SRC_URI[md5sum] = "c48827713e93539dc7285f9e86ffbdc5"
-SRC_URI[sha256sum] = "a4773003512035cb5c559de23e1d53f292bcb0212f023b540c4dc695b39690ed"
+SRC_URI[md5sum] = "9782581ee6ef972554772e84ca448131"
+SRC_URI[sha256sum] = "d2da0f060d47f6ad9de8c8781bb21fa4b9eae8ea1cd1e956b814095baa002f35"
 
 inherit autotools pkgconfig
 
-- 
1.8.1.2


