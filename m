Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id EDEC06B20C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 14:33:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Jul 2013 07:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,770,1367996400"; d="scan'208";a="274812945"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jul 2013 07:33:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 17:35:27 +0300
Message-Id: <1375108527-1498-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] iproute2: upgrade to v3.10.0
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
X-List-Received-Date: Mon, 29 Jul 2013 14:33:45 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/{iproute2_3.9.0.bb => iproute2_3.10.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.9.0.bb => iproute2_3.10.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
index 2bf3f2c..2220467 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.9.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch \
           "
 
-SRC_URI[md5sum] = "fd9db28e4f411a1e74de65c919ae590f"
-SRC_URI[sha256sum] = "16f027af432a05085813a2f859b7d42dafd29b8c035ead830d37565b7397592d"
+SRC_URI[md5sum] = "45fb5427fc723a0001c72b92c931ba02"
+SRC_URI[sha256sum] = "c4023d8d722a1ed673474ca0e5a2d61ebd747cc7001a91321757422d9074c97e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.8.1.2


