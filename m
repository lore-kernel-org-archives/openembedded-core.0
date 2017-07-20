Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 06352782DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 11:50:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 04:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="880839338"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2017 04:50:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 6F866580130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 04:50:44 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 14:51:34 +0300
Message-Id: <1500551494-19244-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libpng: upgrade to 1.6.30
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
X-List-Received-Date: Thu, 20 Jul 2017 11:50:44 -0000

1.6.29 -> 1.6.30

No changes in License.The license checksums changed because of
update in Copyright dates in LICENSE and png.h files.

Since GENTOO_MIRROR also removes the older releases of libpng,
it makes sense to move back to the original SOURCEFORGE_MIRROR
and provide an additional MIRROR to the standard path of the
old binaries present in libpng project - "older-releases".

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.29.bb => libpng_1.6.30.bb}         | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.29.bb => libpng_1.6.30.bb} (53%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb b/meta/recipes-multimedia/libpng/libpng_1.6.30.bb
similarity index 53%
rename from meta/recipes-multimedia/libpng/libpng_1.6.29.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.30.bb
index 8a3056e..f9ff1a9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.30.bb
@@ -2,14 +2,17 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9acafc1325f8f8da80aeee94dbc1bda \
-                    file://png.h;endline=144;md5=0b2aa20c7ff55d9411108317df8ff0c9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2caf3f5970737a6a7b746d8a0d12105 \
+                    file://png.h;endline=144;md5=7c8feac6904795276e99304ac474f852"
 DEPENDS = "zlib"
+LIBV = "16"
 
-SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
-          "
-SRC_URI[md5sum] = "3245dbd76ea91e1437507357b858ec97"
-SRC_URI[sha256sum] = "4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz"
+
+MIRRORS += "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}"
+
+SRC_URI[md5sum] = "88a729d47eaf880d61a0ef90f4bd5e8f"
+SRC_URI[sha256sum] = "267c332ffff70cc599d3929207869f698798f1df143aa5f9597b007c14353666"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


