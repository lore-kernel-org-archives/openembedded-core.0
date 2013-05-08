Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5rL-0001dc-OY
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:01:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858753"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:29 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:57 +0300
Message-Id: <1368024119-4149-8-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 7/9] ethtool: Updated from 3.8 to 3.9
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
X-List-Received-Date: Wed, 08 May 2013 15:02:26 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.8.bb => ethtool_3.9.bb} |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.8.bb => ethtool_3.9.bb} (78%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.8.bb b/meta/recipes-extended/ethtool/ethtool_3.9.bb
similarity index 78%
rename from meta/recipes-extended/ethtool/ethtool_3.8.bb
rename to meta/recipes-extended/ethtool/ethtool_3.9.bb
index 3d84e70..4e18ea4 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.8.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.9.bb
@@ -5,11 +5,10 @@ SECTION = "console/network"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
-PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ddceef30c99cee26874798821e9d6ab8"
-SRC_URI[sha256sum] = "648e1c311567571f806389d85efaa063a8035e09529d0467c4ea97c9ece829d6"
+SRC_URI[md5sum] = "e5942ca785b3893f53bed421260d9534"
+SRC_URI[sha256sum] = "5680005481820ba77bad8be62c0ec60bc108088f39b57448b39956bd3169f163"
 
 inherit autotools
-- 
1.7.10.4



