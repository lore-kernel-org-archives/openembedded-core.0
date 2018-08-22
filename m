Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1187459B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:25:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="65120016"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2018 03:25:33 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 265865802C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:32 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:23 +0300
Message-Id: <1534933645-30369-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
References: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/6] libpng: upgrade 1.6.34 -> 1.6.35
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
X-List-Received-Date: Wed, 22 Aug 2018 10:25:32 -0000

License-Update: copyright years updated

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.34.bb => libpng_1.6.35.bb}                | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.34.bb => libpng_1.6.35.bb} (72%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb b/meta/recipes-multimedia/libpng/libpng_1.6.35.bb
similarity index 72%
rename from meta/recipes-multimedia/libpng/libpng_1.6.34.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.35.bb
index e52d032..5ae0a91 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.35.bb
@@ -2,15 +2,16 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2db717a05a20e36f2fa673265bd31568 \
-                    file://png.h;endline=144;md5=3ac9fd250a8786ae581e34254bf79429"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4791381a76f106ac4699f6261c65ee29 \
+                    file://png.h;endline=144;md5=090ba5769782e8a1663a45fab1c2b36c \
+                    "
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "c05b6ca7190a5e387b78657dbe5536b2"
-SRC_URI[sha256sum] = "2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6"
+SRC_URI[md5sum] = "678b7e696a62a193ed3503b04bf449d6"
+SRC_URI[sha256sum] = "23912ec8c9584917ed9b09c5023465d71709dce089be503c7867fec68a93bcd7"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.4.0


