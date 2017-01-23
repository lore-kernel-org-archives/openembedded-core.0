Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6E97319F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:58:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 23 Jan 2017 01:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="1086210969"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2017 01:58:41 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 590316A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 01:57:44 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 11:58:59 +0200
Message-Id: <1485165540-16646-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
References: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libpng: Upgrade 1.6.26 -> 1.6.28
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
X-List-Received-Date: Mon, 23 Jan 2017 09:58:41 -0000

This upgrade fixes the vulnerability: CVE-2016-10087

License file changes are due to updates in Package Version
and Copyright date. ie:
 'libpng version 1.6.28, January 5, 2017'

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.26.bb => libpng_1.6.28.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.26.bb => libpng_1.6.28.bb} (67%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.26.bb b/meta/recipes-multimedia/libpng/libpng_1.6.28.bb
similarity index 67%
rename from meta/recipes-multimedia/libpng/libpng_1.6.26.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.28.bb
index 8c1cb8c..9cb2967 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.28.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ce8d0bd8303802e5492f064ddddef0e7 \
-                    file://png.h;endline=149;md5=8cca27e71fd88e1fe1adad7d9e841b5f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=67d8837410863f9821bbd606536f0329 \
+                    file://png.h;endline=144;md5=abfa0497feb393b5842d3d82c1009520"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "faed9bb495d2e12dd0c9ec561ca60cd8"
-SRC_URI[sha256sum] = "266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9"
+SRC_URI[md5sum] = "425354f86c392318d31aedca71019372"
+SRC_URI[sha256sum] = "d8d3ec9de6b5db740fefac702c37ffcf96ae46cb17c18c1544635a3852f78f7a"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


