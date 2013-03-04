Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UCWjr-0003BW-1K
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 15:51:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Mar 2013 06:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,779,1355126400"; d="scan'208";a="208571330"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Mar 2013 06:34:57 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 16:36:14 +0200
Message-Id: <1362407774-27299-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] ethtool: upgrade to 3.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 14:52:03 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.7.bb => ethtool_3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.7.bb => ethtool_3.8.bb} (79%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.7.bb b/meta/recipes-extended/ethtool/ethtool_3.8.bb
similarity index 79%
rename from meta/recipes-extended/ethtool/ethtool_3.7.bb
rename to meta/recipes-extended/ethtool/ethtool_3.8.bb
index e04f1c0..3d84e70 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.7.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.8.bb
@@ -9,7 +9,7 @@ PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dc4bfea23c9d966638284dded4306f61"
-SRC_URI[sha256sum] = "8ff82984ced622ef6be300972ce208f48cdc80e81e06f433ad68c45a3e073ddf"
+SRC_URI[md5sum] = "ddceef30c99cee26874798821e9d6ab8"
+SRC_URI[sha256sum] = "648e1c311567571f806389d85efaa063a8035e09529d0467c4ea97c9ece829d6"
 
 inherit autotools
-- 
1.7.11.7



