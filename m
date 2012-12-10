Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Thycz-00007W-DW
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 09:22:17 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Dec 2012 00:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,250,1355126400"; d="scan'208";a="178804523"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Dec 2012 00:07:45 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 10:08:11 +0200
Message-Id: <ffddd9ad81b3ff161bdce823a88fed21f75ebf2f.1355126594.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355126594.git.constantinx.musca@intel.com>
References: <cover.1355126594.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355126594.git.constantinx.musca@intel.com>
References: <cover.1355126594.git.constantinx.musca@intel.com>
Subject: [PATCH 1/3] libpng: enable nativesdk variant
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2012 08:22:17 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
index 62989bb..2a12a4c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
                     file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
 DEPENDS = "zlib"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
@@ -20,4 +20,4 @@ PACKAGES =+ "${PN}12"
 FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
 RPROVIDES_${PN}-dev += "${PN}12-dev"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.11.7



