Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0F-0000H5-98
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:15 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 06:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81325194"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 06:12:33 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:28 +0800
Message-Id: <1e50f486faa8f8306cf8a785e45b225a640c812d.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 2/8] libxrandr: upgrade from 1.3.1 to the latest version 1.3.2
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
X-List-Received-Date: Wed, 30 Nov 2011 14:19:15 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{libxrandr_1.3.1.bb => libxrandr_1.3.2.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.1.bb => libxrandr_1.3.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
index 616ac68..7bc805f 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
@@ -13,12 +13,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4c5c132d3690478179d78ec3bf064584"
 
 DEPENDS += "virtual/libx11 randrproto libxrender libxext"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "7785c3f7cff2735c94657e8f87ed8ad3"
-SRC_URI[sha256sum] = "62bba708649c04cbbc2f5de910942a01cc727b27225bc06169af8a89b957c661"
+SRC_URI[md5sum] = "92473da2fccf5fac665be4fa4f2037fa"
+SRC_URI[sha256sum] = "7eaca216ab5233d7396119eb87c1989d350a3efead104d54b55f22cdd1d99b81"
-- 
1.7.6



