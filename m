Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2D373DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:51:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Aug 2015 06:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,746,1432623600"; d="scan'208";a="775302293"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2015 06:51:16 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 16:51:31 +0300
Message-Id: <1440510691-1159-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] iproute2: upgrade to 4.1.1
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
X-List-Received-Date: Tue, 25 Aug 2015 13:51:19 -0000

libelf is now a build dependency.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc                       | 2 +-
 .../iproute2/{iproute2_3.17.0.bb => iproute2_4.1.1.bb}                | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.17.0.bb => iproute2_4.1.1.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 09ea3d2..a53a4e6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
-DEPENDS = "flex-native bison-native iptables"
+DEPENDS = "flex-native bison-native iptables elfutils"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.17.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_3.17.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
index d12b33f..10db0ba 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.17.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
           "
-SRC_URI[md5sum] = "b741a02c6dda5818d18011d572874493"
-SRC_URI[sha256sum] = "09e406636e7598e46d5d4f7b928bf5db57049d65dbeb9a496005957ee16f6000"
+SRC_URI[md5sum] = "39290cb3a55d38dd8d10e19a3094109f"
+SRC_URI[sha256sum] = "73077a989efb934450bd655cbd9aaddaa747cb696c64d0c9a3323768a6a8e66f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.1.4


