Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 01CBF601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 13:10:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2013 06:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1036,1363158000"; d="scan'208";a="343335613"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2013 06:09:56 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 16:11:28 +0300
Message-Id: <1373461888-12785-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libogg: upgrade to 1.3.1
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
X-List-Received-Date: Wed, 10 Jul 2013 13:10:19 -0000

- obsolete_automake_macros.patch no longer needed; removed;
already integrated in upstream;
- switched to tar.xz archive format.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libogg/libogg-1.3.0/obsolete_automake_macros.patch   |   14 --------------
 .../libogg/{libogg_1.3.0.bb => libogg_1.3.1.bb}          |   10 +++-------
 2 files changed, 3 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libogg/{libogg_1.3.0.bb => libogg_1.3.1.bb} (72%)

diff --git a/meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch b/meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch
deleted file mode 100644
index 6405b2b..0000000
--- a/meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted [https://trac.xiph.org/ticket/1921]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libogg-1.3.0/configure.in libogg-1.3.0/configure.in
---- libogg-1.3.0/configure.in	2011-08-04 20:11:08.000000000 +0300
-+++ libogg-1.3.0/configure.in	2013-01-03 06:23:03.334858696 +0200
-@@ -19,7 +19,7 @@
- AM_PROG_CC_C_O
-
- dnl config.h
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- dnl Set some options based on environment
diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.0.bb b/meta/recipes-multimedia/libogg/libogg_1.3.1.bb
similarity index 72%
rename from meta/recipes-multimedia/libogg/libogg_1.3.0.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.1.bb
index c6480e9..0c12e07 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.0.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.1.bb
@@ -9,13 +9,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://include/ogg/ogg.h;beginline=1;endline=11;md5=eda812856f13a3b1326eb8f020cc3b0b"
 
-PR = "r1"
+SRC_URI = "http://downloads.xiph.org/releases/ogg/libogg-${PV}.tar.xz"
 
-SRC_URI = "http://downloads.xiph.org/releases/ogg/libogg-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
-          "
-
-SRC_URI[md5sum] = "0a7eb40b86ac050db3a789ab65fe21c2"
-SRC_URI[sha256sum] = "a8de807631014615549d2356fd36641833b8288221cea214f8a72750efe93780"
+SRC_URI[md5sum] = "ca25d8da0ddfc8c6cbbf78d847a209fe"
+SRC_URI[sha256sum] = "3a5bad78d81afb78908326d11761c0fb1a0662ee7150b6ad587cc586838cdcfa"
 
 inherit autotools pkgconfig
-- 
1.7.10.4


