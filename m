Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1U7lgI-0006GG-6P
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 12:48:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2013 03:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,695,1355126400"; d="scan'208";a="287603622"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.61])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2013 03:32:06 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 13:32:48 +0200
Message-Id: <1361273568-30066-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libpng : update to 1.60.0
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
X-List-Received-Date: Tue, 19 Feb 2013 11:48:23 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../libpng/{libpng_1.5.14.bb => libpng_1.6.0.bb}   |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.5.14.bb => libpng_1.6.0.bb} (50%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.14.bb b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
similarity index 50%
rename from meta/recipes-multimedia/libpng/libpng_1.5.14.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.0.bb
index b2b82d3..951e34a 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.5.14.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
@@ -3,17 +3,17 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=58c8238139ee86082f8d29eb89304241 \
-                    file://png.h;beginline=207;endline=321;md5=4f17771edaee8bb3c17a95d7faaa3681"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03b8ec701cb796c0ec84af22f884edef \
+                    file://png.h;beginline=207;endline=321;md5=e829cebefd08488ba5142ea5faea6821"
 DEPENDS = "zlib"
 PR = "r0"
-LIBV = "15"
+LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "94284b01d62ca43c5eb3f6702db08ed8"
-SRC_URI[sha256sum] = "1459488e1b58d3be1c798453cf40c522c05bd66b61156cd51f469f17dff87b54"
+SRC_URI[md5sum] = "3ee623b9a4d33bda7310a5124080b14d"
+SRC_URI[sha256sum] = "5e13c31321083b03956b5ff298bacffab7a7ad35c34c122acef314593944b97b"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.9.5



