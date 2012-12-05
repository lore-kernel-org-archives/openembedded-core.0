Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TgEge-000103-85
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:06:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 04:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="229266799"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 04:52:27 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 14:57:37 +0200
Message-Id: <d69418647adf8bc836c8880a4caa59076a8c498f.1354711738.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
Subject: [PATCH 3/4] u-boot-mkimage: upgrade to 2012.07
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
X-List-Received-Date: Wed, 05 Dec 2012 13:06:52 -0000

From: Constantin Musca <constantinx.musca@intel.com>

License checksum change due to README diff (only the
instructions have changed)

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 ...kimage_2011.06.bb => u-boot-mkimage_2012.07.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2011.06.bb => u-boot-mkimage_2012.07.bb} (71%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
similarity index 71%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
index 3ca0c2c..70bbd3f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "U-boot bootloader mkimage tool"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
 SECTION = "bootloader"
 
 PR = "r0"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
-SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
+SRC_URI[md5sum] = "15a087051d071d608000e138c39545d9"
+SRC_URI[sha256sum] = "e08e20a6979bfca6eebb9a2b0e42aa4416af3d796332fd63a3470495a089d496"
 
 S = "${WORKDIR}/u-boot-${PV}"
 
-- 
1.7.9.5



