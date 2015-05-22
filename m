Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4103C7422D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:26:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2015 06:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="730223255"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2015 06:26:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 16:26:53 +0300
Message-Id: <36dcbe8cccc91111d5ff4679505e4ee15cbc7a06.1432300539.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aaca1a960fe5eb5a6080256d2e99915a8d0e508f.1432300539.git.jussi.kukkonen@intel.com>
References: <aaca1a960fe5eb5a6080256d2e99915a8d0e508f.1432300539.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1432300539.git.jussi.kukkonen@intel.com>
References: <cover.1432300539.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] libpng: Upgrade 1.6.16 -> 1.6.17
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
X-List-Received-Date: Fri, 22 May 2015 13:26:49 -0000

License files changes are not actual license changes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libpng/{libpng_1.6.16.bb => libpng_1.6.17.bb}             | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.16.bb => libpng_1.6.17.bb} (62%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.16.bb b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
similarity index 62%
rename from meta/recipes-multimedia/libpng/libpng_1.6.16.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.17.bb
index a8677e8..00e5808 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.16.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
@@ -2,17 +2,16 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76dbddb73e547d9b3fa16909a98049c0 \
-                    file://png.h;endline=15;md5=fd8f7ae7b090a168a9e023d0a5d68a3e \
-                    file://png.h;beginline=229;endline=343;md5=44075eedf4763ada355d8f60ac3296c9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9b75399b72e4a8656cf3a6ddfc86d9a \
+                    file://png.h;endline=16;md5=cc9c2d1eafda17e1277a6f99a9fc29c4 \
+                    file://png.h;beginline=242;endline=356;md5=599316819d525dde2bfdf28fe3f323af"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
           "
-
-SRC_URI[md5sum] = "23b7286b5d4a86de950fd2ffc5cac742"
-SRC_URI[sha256sum] = "42f754df633e4e700544e5913cbe2fd4928bbfccdc07708a5cf84e59827fbe60"
+SRC_URI[md5sum] = "430a9b76b78533235cd4b9b26ce75c7e"
+SRC_URI[sha256sum] = "98507b55fbe5cd43c51981f2924e4671fd81fe35d52dc53357e20f2c77fa5dfd"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.1.4


