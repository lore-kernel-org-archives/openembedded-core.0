Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB466041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 10:44:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2013 03:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,750,1367996400"; d="scan'208";a="376958869"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.146])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2013 03:44:36 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 13:45:11 +0300
Message-Id: <1374835511-16971-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libpng : upgrade to 1.6.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jul 2013 10:44:37 -0000

upgrade from 1.6.2 -> 1.6.3

LICENSE and png.h checksum changed caused by
dates and release numbers.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb}    |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb} (64%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.2.bb b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
similarity index 64%
rename from meta/recipes-multimedia/libpng/libpng_1.6.2.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.3.bb
index 7a19313..11e735c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.2.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b7c6b3f443bd29d45da5575f36293606 \
-                    file://png.h;beginline=207;endline=321;md5=f8e34d28a077eca674b739ded0de063c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a42d0002ce5c11e4a529c29f78d13dd \
+                    file://png.h;beginline=207;endline=321;md5=de933190ded7f9d6c22110c8509ea85a"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
            file://0001-configure-lower-automake-requirement.patch \
           "
-SRC_URI[md5sum] = "9d838f6fca9948a9f360a0cc1b516d5f"
-SRC_URI[sha256sum] = "1c97a90bc22107e50f04f77a0115f4ec890d5c6a373ac4c560e8fb87259e92de"
+SRC_URI[md5sum] = "9307f8ab04f4be3c1889ffb504f0fe5c"
+SRC_URI[sha256sum] = "c5ecc0d38663b944a828145ed59cf15dfbad2217512875bc05ecf9b92afa0f45"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.9.5


