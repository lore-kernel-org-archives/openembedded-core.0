Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0604F6A9E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059460"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:21 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:21 +0300
Message-Id: <5fe056523a3c0aafc084f880ae57257cfff73646.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 04/10] libxi: Update from 1.7.1 to 1.7.2
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:21 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.1.bb => libxi_1.7.2.bb} |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.1.bb => libxi_1.7.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.2.bb
index da51fe1..0ae98e0 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.2.bb
@@ -14,9 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
 DEPENDS += "libxext inputproto libxfixes"
 
 PE = "1"
-PR = "r0"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "24d71afed1b86c60d4eb361628d7f47b"
-SRC_URI[sha256sum] = "e92adb6b69c53c51e05c1e65db97e23751b935a693000fb0606c11b88c0066c5"
+SRC_URI[md5sum] = "f4df3532b1af1dcc905d804f55b30b4a"
+SRC_URI[sha256sum] = "df24781dc63645e2b561cd0b20bd8a0e7aff02e426a8d2a7641159004d4cb20e"
-- 
1.7.10.4


