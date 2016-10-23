Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A3A6B71BC6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2016 04:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="1074428588"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2016 04:29:27 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 57B1F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:54 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:57 +0300
Message-Id: <1477222197-3698-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 10/10] libpng: Upgrade 1.6.24 -> 1.6.25
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:27 -0000

License file changes are due to updates in Version and Copyright date

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.24.bb => libpng_1.6.26.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.24.bb => libpng_1.6.26.bb} (67%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
similarity index 67%
rename from meta/recipes-multimedia/libpng/libpng_1.6.24.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.26.bb
index f91ab7f..8c1cb8c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
-                    file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ce8d0bd8303802e5492f064ddddef0e7 \
+                    file://png.h;endline=149;md5=8cca27e71fd88e1fe1adad7d9e841b5f"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
-SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
+SRC_URI[md5sum] = "faed9bb495d2e12dd0c9ec561ca60cd8"
+SRC_URI[sha256sum] = "266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


