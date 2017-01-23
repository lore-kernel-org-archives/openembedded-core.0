Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A703771E43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:58:44 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jan 2017 01:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="51517188"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 23 Jan 2017 01:58:44 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id E35766A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 01:57:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 11:59:00 +0200
Message-Id: <1485165540-16646-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
References: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] libpng12: Upgrade 1.2.56 -> 1.2.57
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
X-List-Received-Date: Mon, 23 Jan 2017 09:58:44 -0000

This upgrade fixes the vulnerability: CVE-2016-10087

License file changes are due to updates in Version and Copyright date. ie:
'libpng versions 1.0.7, July 1, 2000, through 1.2.57, December 29, 2016, are
 Copyright (c) 2000-2002, 2004, 2006-2016 Glenn Randers-Pehrson'

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng12_1.2.56.bb => libpng12_1.2.57.bb}             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.56.bb => libpng12_1.2.57.bb} (73%)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
similarity index 73%
rename from meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
index 10c350a..0d5a2c4 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
@@ -2,8 +2,8 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e7f289af309d98b46321d0f9892def16 \
-                    file://png.h;beginline=19;endline=109;md5=10c940148fe379a535b310c1c54e609c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=597b8a91994a3e27ae6aa79bf02677d9 \
+                    file://png.h;beginline=19;endline=109;md5=166406397718925b660f0033f7558ef7"
 DEPENDS = "zlib"
 
 PN = "libpng12"
@@ -11,8 +11,8 @@ S = "${WORKDIR}/libpng-${PV}"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "868562bd1c58b76ed8703f135a2e439a"
-SRC_URI[sha256sum] = "24ce54581468b937734a6ecc86f7e121bc46a90d76a0d948dca08f32ee000dbe"
+SRC_URI[md5sum] = "307052e5e8af97b82b17b64fb1b3677a"
+SRC_URI[sha256sum] = "0f4620e11fa283fedafb474427c8e96bf149511a1804bdc47350963ae5cf54d8"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
 UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.4.0


