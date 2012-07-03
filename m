Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx79-00036R-Tn
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373980"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:22 +0300
Message-Id: <1341298228-4412-6-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 05/10] ethtool: upgrade to 3.4.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:01:36 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb} (79%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.2.bb b/meta/recipes-extended/ethtool/ethtool_3.4.1.bb
similarity index 79%
rename from meta/recipes-extended/ethtool/ethtool_3.2.bb
rename to meta/recipes-extended/ethtool/ethtool_3.4.1.bb
index 31163d6..41ef330 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.4.1.bb
@@ -9,7 +9,7 @@ PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1c5ee419d4278569db1fca46981918a4"
-SRC_URI[sha256sum] = "c075ed390dddc99dfb4804f220214cb5e8eb7c0882694a36b05f6aaa883629d7"
+SRC_URI[md5sum] = "25ccc0d717c37265042df4f7869485cb"
+SRC_URI[sha256sum] = "3b67484b255996432854cb07de8f7e42ba555cf8efeb4a0134eb7575f9eef2a8"
 
 inherit autotools
-- 
1.7.9.5



