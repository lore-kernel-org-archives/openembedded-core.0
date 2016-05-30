Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE4FB77267
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 15:20:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2016 08:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,390,1459839600"; d="scan'208";a="112918712"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 30 May 2016 08:20:30 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C1ABE6A4008
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 09:07:58 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 18:20:22 +0300
Message-Id: <1464621623-16991-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libpng: update to 1.6.22
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
X-List-Received-Date: Mon, 30 May 2016 15:20:31 -0000

1.6.21 -> 1.6.22

License files updates are not real license changes (updates in Copyright
date and Version)

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.21.bb => libpng_1.6.22.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.21.bb => libpng_1.6.22.bb} (66%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.21.bb b/meta/recipes-multimedia/libpng/libpng_1.6.22.bb
similarity index 66%
rename from meta/recipes-multimedia/libpng/libpng_1.6.21.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.22.bb
index 58cef1f..0d5722f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.21.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.22.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=06a1b6fde6d93170bb72201c8000bf3d \
-                    file://png.h;endline=112;md5=9a8b5f83e1e8046df672deab87f235be"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=327e99f9f6299935eab27262a3d0d97c \
+                    file://png.h;endline=149;md5=5b1126380a15a28a275c88bf13fe39c8"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "3bacb4728f6694a64ad9052769d6a4ce"
-SRC_URI[sha256sum] = "6c8f1849eb9264219bf5d703601e5abe92a58651ecae927a03d1a1aa15ee2083"
+SRC_URI[md5sum] = "f4ca54a3d945b8678fafed168c503f3b"
+SRC_URI[sha256sum] = "6b5a6ad5c5801ec4d24aacc87a0ed7b666cd586478174f69368a1d7747715226"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


