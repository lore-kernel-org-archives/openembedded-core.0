Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RgdOD-0001Kz-CW
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:24:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Dec 2011 06:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90857120"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 30 Dec 2011 06:17:40 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:02 +0800
Message-Id: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 01/14] freetype: upgrade to 2.4.8
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
X-List-Received-Date: Fri, 30 Dec 2011 14:24:57 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.6.bb => freetype_2.4.8.bb}       |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.6 => freetype-2.4.8}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.6.bb => freetype_2.4.8.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.6/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.6/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.6.bb b/meta/recipes-graphics/freetype/freetype_2.4.8.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.4.6.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.8.bb
index f002103..bce01cf 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.6.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.8.bb
@@ -13,13 +13,13 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
 
 SECTION = "libs"
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "5e6510613f612809d2d7862592b92ab7"
-SRC_URI[sha256sum] = "24a4a57f3a6859887e91f90f93f754cfc7bf9ab9246a3a696435a0c6a7a1e92a"
+SRC_URI[md5sum] = "dbf2caca1d3afd410a29217a9809d397"
+SRC_URI[sha256sum] = "a9eb7da3875fcb2f022a9c280c01b94ae45ac83d8102838c05dce1277948fb71"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.6



