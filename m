Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7412171149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:23:18 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Aug 2014 08:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,412,1406617200"; d="scan'208";a="473225200"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.88])
	by azsmga001.ch.intel.com with ESMTP; 27 Aug 2014 08:22:50 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 18:22:26 +0300
Message-Id: <9204d5e33433e8673a8d89779dd320b04f160d3a.1409152907.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409152907.git.roxana.ciobanu@intel.com>
References: <cover.1409152907.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409152907.git.roxana.ciobanu@intel.com>
References: <cover.1409152907.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] ethtool: upgrade to 3.15
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
X-List-Received-Date: Wed, 27 Aug 2014 15:23:24 -0000

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.14.bb => ethtool_3.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.14.bb => ethtool_3.15.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.14.bb b/meta/recipes-extended/ethtool/ethtool_3.15.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_3.14.bb
rename to meta/recipes-extended/ethtool/ethtool_3.15.bb
index bc3b295..8cd10df 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.15.bb
@@ -12,8 +12,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://ethtool-uint.patch \
            "
 
-SRC_URI[md5sum] = "997e20c25c43ad5800f8ae3204455a8a"
-SRC_URI[sha256sum] = "b1a988d6e397bd9d5d73cfd64329f85121936a050174bbfe90f8701fd893a1df"
+SRC_URI[md5sum] = "7e94dd958bcd639aad2e5a752e108b24"
+SRC_URI[sha256sum] = "562e3cc675cf5b1ac655cd060f032943a2502d4d59e5f278f02aae92562ba261"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.9.1


