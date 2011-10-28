Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd78-00066Y-6v
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2011 20:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="68413047"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 27 Oct 2011 20:22:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:44 +0800
Message-Id: <bc381d62dcc98c68ffac5a1843d695fd8b95f543.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 05/11] libogg: upgrade to version 1.3.0
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:14 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../libogg/{libogg_1.2.2.bb => libogg_1.3.0.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.2.2.bb => libogg_1.3.0.bb} (81%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.2.2.bb b/meta/recipes-multimedia/libogg/libogg_1.3.0.bb
similarity index 81%
rename from meta/recipes-multimedia/libogg/libogg_1.2.2.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.0.bb
index 83454c8..fedaa6e 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.2.2.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.0.bb
@@ -13,7 +13,7 @@ PR = "r0"
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/libogg-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5a9fcabc9a1b7c6f1cd75ddc78f36c56"
-SRC_URI[sha256sum] = "ab000574bc26d5f01284f5b0f50e12dc761d035c429f2e9c70cb2a9487d8cfba"
+SRC_URI[md5sum] = "0a7eb40b86ac050db3a789ab65fe21c2"
+SRC_URI[sha256sum] = "a8de807631014615549d2356fd36641833b8288221cea214f8a72750efe93780"
 
 inherit autotools pkgconfig
-- 
1.7.1



