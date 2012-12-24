Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iH-0003pg-FH
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:33:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440628"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:53 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:13 +0200
Message-Id: <c6507f4ec98da48013b3c26aa550018430e57cd7.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 01/15] ethtool: upgrade to 3.7
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
X-List-Received-Date: Mon, 24 Dec 2012 08:48:45 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.6.bb => ethtool_3.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.6.bb => ethtool_3.7.bb} (79%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.6.bb b/meta/recipes-extended/ethtool/ethtool_3.7.bb
similarity index 79%
rename from meta/recipes-extended/ethtool/ethtool_3.6.bb
rename to meta/recipes-extended/ethtool/ethtool_3.7.bb
index 576fca5..ad417fd 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.6.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.7.bb
@@ -9,7 +9,7 @@ PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1f4fb25590d26cb622bf3bf03413cfac"
-SRC_URI[sha256sum] = "a0305779bc35893cf4683a9cbc47bbd1d726a142ce2b34384ae3d87fa8e44891"
+SRC_URI[md5sum] = "dc4bfea23c9d966638284dded4306f61"
+SRC_URI[sha256sum] = "8ff82984ced622ef6be300972ce208f48cdc80e81e06f433ad68c45a3e073ddf"
 
 inherit autotools
-- 
1.7.11.7



