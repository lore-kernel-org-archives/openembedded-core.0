Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A02760124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 19:30:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2016 12:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,558,1459839600"; d="scan'208";a="1009140629"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.12.103])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2016 12:30:35 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 20:30:32 +0100
Message-Id: <1467401433-2237-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] pseudo: drop recipe for old 1.6.7 version
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
X-List-Received-Date: Fri, 01 Jul 2016 19:30:36 -0000

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.6.7.bb | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.6.7.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.7.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.7.bb
deleted file mode 100644
index b8c20ad..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.7.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require pseudo.inc
-
-SRC_URI = " \
-    http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
-    file://fallback-passwd \
-    file://fallback-group \
-"
-
-SRC_URI[md5sum] = "4cd39502f9bd0e734dee80e08b28a5f1"
-SRC_URI[sha256sum] = "9f2caca5f1579a376a509cd81a81156fc208650add9f0af275da9e911f18f291"
-
-PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
-
-do_install_append_class-native () {
-	install -d ${D}${sysconfdir}
-	# The fallback files should never be modified
-	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
-}
-- 
2.7.4


