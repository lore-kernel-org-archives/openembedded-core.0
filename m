Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E7621780B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 12:24:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 05:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="1155985902"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2017 05:23:52 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 86BB5580571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 05:23:51 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 15:24:54 +0300
Message-Id: <1501158294-20359-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libpng: upgrade to 1.6.31
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
X-List-Received-Date: Thu, 27 Jul 2017 12:24:05 -0000

1.6.31 fixes pngpriv.h to work around failure to compile
arm/filter_neon.S.This bug was introduced in libpng-1.6.30beta01

No changes in License.The license checksums changed because of
update in Copyright dates in LICENSE and png.h files.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.29.bb => libpng_1.6.31.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.29.bb => libpng_1.6.31.bb} (71%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb b/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
similarity index 71%
rename from meta/recipes-multimedia/libpng/libpng_1.6.29.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.31.bb
index be327ca..14679fb 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
@@ -2,15 +2,15 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9acafc1325f8f8da80aeee94dbc1bda \
-                    file://png.h;endline=144;md5=0b2aa20c7ff55d9411108317df8ff0c9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f21e4e1f795810b5ea491b333bc6ea1 \
+                    file://png.h;endline=144;md5=af300c419a45c53a8d2daa0b7d167a66"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "3245dbd76ea91e1437507357b858ec97"
-SRC_URI[sha256sum] = "4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239"
+SRC_URI[md5sum] = "1b34eab440263e32cfa39d19413fad54"
+SRC_URI[sha256sum] = "232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}"
 
-- 
2.4.0


