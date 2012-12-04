Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tfosr-0007zW-HP
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:33:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 01:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="228661823"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 01:18:17 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:19:01 +0200
Message-Id: <18a5edebab7521f121c9542ad12c1c1369befbde.1354611254.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
Subject: [PATCH 1/5] ethtool: upgrade to 3.6
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
X-List-Received-Date: Tue, 04 Dec 2012 09:33:45 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.5.bb => ethtool_3.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.5.bb => ethtool_3.6.bb} (79%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.5.bb b/meta/recipes-extended/ethtool/ethtool_3.6.bb
similarity index 79%
rename from meta/recipes-extended/ethtool/ethtool_3.5.bb
rename to meta/recipes-extended/ethtool/ethtool_3.6.bb
index b9caab6..576fca5 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.5.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.6.bb
@@ -9,7 +9,7 @@ PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f2dd81ecc515f25372503501f9b7ea1b"
-SRC_URI[sha256sum] = "e87e232ba927aecca5be565e7bea20c533ade97758b17e65b8941df35b3c6f59"
+SRC_URI[md5sum] = "1f4fb25590d26cb622bf3bf03413cfac"
+SRC_URI[sha256sum] = "a0305779bc35893cf4683a9cbc47bbd1d726a142ce2b34384ae3d87fa8e44891"
 
 inherit autotools
-- 
1.7.11.7



