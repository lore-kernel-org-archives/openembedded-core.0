Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AF7366B026
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:20:14 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 03:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1019,1363158000"; d="scan'208";a="328132580"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2013 03:20:15 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 13:22:00 +0300
Message-Id: <f5a993c0efdd638f3fc20142e14d49605018aa34.1373278823.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
In-Reply-To: <cover.1373278823.git.radu.moisan@intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
Subject: [PATCH 5/9] libdmx: Upgrade to v1.1.3
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
X-List-Received-Date: Mon, 08 Jul 2013 10:20:15 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../xorg-lib/{libdmx_1.1.2.bb => libdmx_1.1.3.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libdmx_1.1.2.bb => libdmx_1.1.3.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.2.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libdmx_1.1.2.bb
rename to meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
index 9d876bb..5aef188 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
@@ -16,6 +16,6 @@ DEPENDS += "libxext dmxproto"
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "782ced3a9e754dfeb53a8a006a75eb1a"
-SRC_URI[sha256sum] = "a7870b648a8768d65432af76dd11581ff69f3955118540d5967eb1eef43838ba"
+SRC_URI[md5sum] = "ba983eba5a9f05d152a0725b8e863151"
+SRC_URI[sha256sum] = "c97da36d2e56a2d7b6e4f896241785acc95e97eb9557465fd66ba2a155a7b201"
 
-- 
1.7.9.5


