Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T0sBZ-0003tF-L3
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 12:47:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Aug 2012 03:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,759,1336374000"; d="scan'208";a="133579804"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2012 03:34:49 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 12:39:29 +0300
Message-Id: <1344850769-21131-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] ethtool: package update 3.4.1 -> 3.5
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
X-List-Received-Date: Mon, 13 Aug 2012 10:47:49 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../ethtool/{ethtool_3.4.1.bb => ethtool_3.5.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.4.1.bb => ethtool_3.5.bb} (79%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.4.1.bb b/meta/recipes-extended/ethtool/ethtool_3.5.bb
similarity index 79%
rename from meta/recipes-extended/ethtool/ethtool_3.4.1.bb
rename to meta/recipes-extended/ethtool/ethtool_3.5.bb
index 41ef330..b9caab6 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.4.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.5.bb
@@ -9,7 +9,7 @@ PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "25ccc0d717c37265042df4f7869485cb"
-SRC_URI[sha256sum] = "3b67484b255996432854cb07de8f7e42ba555cf8efeb4a0134eb7575f9eef2a8"
+SRC_URI[md5sum] = "f2dd81ecc515f25372503501f9b7ea1b"
+SRC_URI[sha256sum] = "e87e232ba927aecca5be565e7bea20c533ade97758b17e65b8941df35b3c6f59"
 
 inherit autotools
-- 
1.7.9.5



