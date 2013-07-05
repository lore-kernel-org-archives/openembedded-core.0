Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B26AA6B043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:30 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059518"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:31 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:27 +0300
Message-Id: <1aa086480334aca057e85fd714e30c9fada8a2a8.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 10/10] ethtool: Updated from 3.9 to 3.10
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:30 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.9.bb => ethtool_3.10.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.9.bb => ethtool_3.10.bb} (79%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.9.bb b/meta/recipes-extended/ethtool/ethtool_3.10.bb
similarity index 79%
rename from meta/recipes-extended/ethtool/ethtool_3.9.bb
rename to meta/recipes-extended/ethtool/ethtool_3.10.bb
index 4e18ea4..aa8b129 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.9.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e5942ca785b3893f53bed421260d9534"
-SRC_URI[sha256sum] = "5680005481820ba77bad8be62c0ec60bc108088f39b57448b39956bd3169f163"
+SRC_URI[md5sum] = "b41deb37143dfb86934a8f52cea853d2"
+SRC_URI[sha256sum] = "62f0a9cea954c32a2bdc2d2ece295fda5b915cfea56f5de97b997d8ebaae0381"
 
 inherit autotools
-- 
1.7.10.4


