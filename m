Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0I-0000H7-Or
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 06:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="80652009"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2011 06:12:36 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:30 +0800
Message-Id: <7b66253699b50888fa21d9e79bc1d1e6898ff40a.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 4/8] libxfont: upgrade from 1.4.3 to 1.4.4
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
X-List-Received-Date: Wed, 30 Nov 2011 14:19:20 -0000

updated LIC_FILES_CHKSUM:
only Copyright holder change in COPYING -- no actual license change.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{libxfont_1.4.3.bb => libxfont_1.4.4.bb}       |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.3.bb => libxfont_1.4.4.bb} (62%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
similarity index 62%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
index 43a628e..8af0ac9 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
@@ -7,7 +7,7 @@ such as freetype)."
 require xorg-lib-common.inc
 
 LICENSE= "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=deeee1c29f32ca774cecf0c83b46bb5c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
 DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
 PROVIDES = "xfont"
@@ -15,11 +15,9 @@ PROVIDES = "xfont"
 PR = "r0"
 PE = "1"
 
-#SRC_URI += "file://no-scalable-crash.patch"
-
 XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "6fb689cfe13d8d9460f4abb5bd88588d"
-SRC_URI[sha256sum] = "f79245652901d20092092e942155d32b8dde15527637db3c09a1adc83672e9cc"
+SRC_URI[md5sum] = "f9942bc818d39094d7295b156a729393"
+SRC_URI[sha256sum] = "a2065f5f66882f7a9cb0eb674e16d284da48e449af443eda272e99832be8239a"
-- 
1.7.6



