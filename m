Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9U9d-0003Ki-R8
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:20:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2011 20:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="732076275"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2011 20:18:23 -0700
Message-Id: <9c161a84575ca8568c1b5ccf3d9d4cc851408528.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 00:59:58 +0800
Date: Tue, 12 Apr 2011 11:16:20 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 03/12] libxi: upgrade from 1.4.0 to the latest version 1.4.2
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
X-List-Received-Date: Tue, 12 Apr 2011 03:20:38 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Add --enable-specs=no to disable spec generation to work around the issue:
SEVERE: Error with opening URL 'http://docbook.sourceforge.net/release/images/draft.png': No route to host
Apr 11, 2011 4:06:18 PM org.apache.fop.fo.properties.CommonBorderPaddingBackground <init>
SEVERE: Background image not available: http://docbook.sourceforge.net/release/images/draft.png

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../xorg-lib/{libxi_1.4.0.bb => libxi_1.4.2.bb}    |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.0.bb => libxi_1.4.2.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.4.0.bb b/meta/recipes-graphics/xorg-lib/libxi_1.4.2.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxi_1.4.0.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.4.2.bb
index c7fb9d5..50ff426 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.4.2.bb
@@ -16,6 +16,7 @@ PE = "1"
 
 XORG_PN = "libXi"
 
+EXTRA_OECONF_append = " --enable-specs=no"
 
-SRC_URI[md5sum] = "4ccdfe866f94c99b9190d16ffcfb3bdc"
-SRC_URI[sha256sum] = "42efe95a08c7bd28bc913bf8c34ed026abcc62504307626fc5150ca360b93283"
+SRC_URI[md5sum] = "3d14f7bfc4a4335cf0144de9b67a5444"
+SRC_URI[sha256sum] = "272b8041efc0a0203fb0ba33481ddec989539aed862181b58c8c3e410e325691"
-- 
1.7.2



