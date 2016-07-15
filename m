Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AB78A6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:08:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 15 Jul 2016 05:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="1022325138"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2016 05:08:57 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 13B646A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:08:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:09:15 +0300
Message-Id: <1468584555-32117-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1468584555-32117-1-git-send-email-maxin.john@intel.com>
References: <1468584555-32117-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libpng: update to 1.6.23
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
X-List-Received-Date: Fri, 15 Jul 2016 12:09:00 -0000

1.6.22 -> 1.6.23

License files changes are due to updates in Copyright date and Version

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.22.bb => libpng_1.6.23.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.22.bb => libpng_1.6.23.bb} (66%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.22.bb b/meta/recipes-multimedia/libpng/libpng_1.6.23.bb
similarity index 66%
rename from meta/recipes-multimedia/libpng/libpng_1.6.22.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.23.bb
index 0d5722f..b2813e3 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.22.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.23.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=327e99f9f6299935eab27262a3d0d97c \
-                    file://png.h;endline=149;md5=5b1126380a15a28a275c88bf13fe39c8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a92bbf77565352659482e381075d19e3 \
+                    file://png.h;endline=149;md5=a0e24b62532fff585d25f060dd917236"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "f4ca54a3d945b8678fafed168c503f3b"
-SRC_URI[sha256sum] = "6b5a6ad5c5801ec4d24aacc87a0ed7b666cd586478174f69368a1d7747715226"
+SRC_URI[md5sum] = "9b320a05ed4db1f3f0865c8a951fd9aa"
+SRC_URI[sha256sum] = "6d921e7bdaec56e9f6594463ec1fe1981c3cd2d5fc925d3781e219b5349262f1"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


