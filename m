Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9U9d-0003Kg-13
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:20:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Apr 2011 20:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="417545542"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 11 Apr 2011 20:18:22 -0700
Message-Id: <8e625a63cef86324f710ce1ca3af36a512c2d2bb.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 00:58:46 +0800
Date: Tue, 12 Apr 2011 11:16:19 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 02/12] libxt: update from 1.0.9 to the latest version 1.1.1
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
X-List-Received-Date: Tue, 12 Apr 2011 03:20:37 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../xorg-lib/{libxt_1.0.9.bb => libxt_1.1.1.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.0.9.bb => libxt_1.1.1.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxt_1.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
index 63119ae..f06739f 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
@@ -13,7 +13,7 @@ independent of any particular user interface policy or style."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=917881a51be1013bee30d7f3f5ba9f55"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3239170e81427c5948287df07691f03f"
 
 
 DEPENDS += "libsm virtual/libx11 kbproto libxdmcp"
@@ -39,5 +39,5 @@ do_compile() {
 	oe_runmake
 }
 
-SRC_URI[md5sum] = "8a414f8f2327aaa616ca2dcac1f5d8c3"
-SRC_URI[sha256sum] = "eab91b594b801f7f07a20f936dda70a629028858cbcf541becf94f2786ae6b01"
+SRC_URI[md5sum] = "eb22c0a1f172b06b97a3f5ae89768412"
+SRC_URI[sha256sum] = "a2a1c29c684e3c9082cdb920b5aea802b179d19107b9ab2170fda07575559da7"
-- 
1.7.2



