Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUY-0002Tq-A5
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:58:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119580416"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:49:13 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:50 +0800
Message-Id: <222c7167e9b3001c35a74c5a85f4e232bd87439b.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 53/60] libxfont: upgrade to 1.4.5
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
X-List-Received-Date: Fri, 16 Mar 2012 00:58:03 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxfont_1.4.4.bb => libxfont_1.4.5.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.4.bb => libxfont_1.4.5.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.5.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.4.5.bb
index 55d4e69..65a9f80 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.5.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc zlib"
 PROVIDES = "xfont"
 
-PR = "r2"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "f9942bc818d39094d7295b156a729393"
-SRC_URI[sha256sum] = "a2065f5f66882f7a9cb0eb674e16d284da48e449af443eda272e99832be8239a"
+SRC_URI[md5sum] = "6851da5dae0a6cf5f7c9b9e2b05dd3b4"
+SRC_URI[sha256sum] = "bbf96fb80b6b95cdb1dc968085082a6e668193a54cd9d6e2af669909c0cb7170"
-- 
1.7.6



