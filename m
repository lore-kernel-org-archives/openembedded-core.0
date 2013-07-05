Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B619E6A5C7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059495"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:26 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:24 +0300
Message-Id: <8b52c16611a1a2516e323a2fed401125091a9f44.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 07/10] libxrender: Updated from 0.9.7 to 0.9.8
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:25 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxrender_0.9.7.bb => libxrender_0.9.8.bb}         |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.7.bb => libxrender_0.9.8.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.7.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.7.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
index c4baba8..abd7767 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.8.bb
@@ -13,12 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8bc71986d3b9b3639f6dfd6fac8f196"
 
 DEPENDS += "virtual/libx11 renderproto xproto xdmcp"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "ee62f4c7f0f16ced4da63308963ccad2"
-SRC_URI[sha256sum] = "f9b46b93c9bc15d5745d193835ac9ba2a2b411878fad60c504bbb8f98492bbe6"
+SRC_URI[md5sum] = "2bd9a15fcf64d216e63b8d129e4f1f1c"
+SRC_URI[sha256sum] = "1d14b02f0060aec5d90dfdcf16a996f17002e515292906ed26e3dcbba0f4fc62"
-- 
1.7.10.4


