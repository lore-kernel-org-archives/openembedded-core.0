Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9U9i-0003Ki-GW
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:20:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2011 20:18:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="627124000"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2011 20:18:30 -0700
Message-Id: <ed57c699c8d14ba215f715a027d30b22772a665e.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:06:59 +0800
Date: Tue, 12 Apr 2011 11:16:27 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 08/12] libpciaccess: upgrade from 0.12.0 to the latest version 0.12.1
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
X-List-Received-Date: Tue, 12 Apr 2011 03:20:43 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...bpciaccess_0.12.0.bb => libpciaccess_0.12.1.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.0.bb => libpciaccess_0.12.1.bb} (56%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.0.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.12.0.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
index d7417a2..b3091fd 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
@@ -6,11 +6,11 @@ PCI bus and devices in a platform-independant way."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aa44c26bc646c6c9d9619c73b94a6e31"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2c765efe1e0722c1badff5e54429b102"
 
 PR = "r0"
 
 DEPENDS += "xproto virtual/libx11"
 
-SRC_URI[md5sum] = "285e07976274572e1f1e68edee09b70a"
-SRC_URI[sha256sum] = "f6b3c00e1c0aab0729563115d3d798e14c9210b4e10fccb484efe1c5eae85657"
+SRC_URI[md5sum] = "d6363ee9f4df79f6fc47cba7c67b0d35"
+SRC_URI[sha256sum] = "cc47d7f0e48cf4eed972916b536fdc97788d7521915e3ae1cc92d540776d7344"
-- 
1.7.2



