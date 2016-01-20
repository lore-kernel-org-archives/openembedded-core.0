Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 99F586E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 15:56:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 20 Jan 2016 07:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="885593117"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2016 07:56:48 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 082FB6A4002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:44:43 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 17:58:50 +0200
Message-Id: <1453305530-556-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1453305530-556-1-git-send-email-maxin.john@intel.com>
References: <1453305530-556-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] libpng12: upgrade to 1.2.56
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
X-List-Received-Date: Wed, 20 Jan 2016 15:56:52 -0000

1.2.55 -> 1.2.56

License file updates contain new dates and version. Update checksums
to reflect it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng12_1.2.55.bb => libpng12_1.2.56.bb}             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.55.bb => libpng12_1.2.56.bb} (73%)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.55.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
similarity index 73%
rename from meta/recipes-lsb4/libpng/libpng12_1.2.55.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
index 1afbeab..0ffee90 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.55.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
@@ -2,8 +2,8 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6150ae2da16b673fa759402d5fb7ef73 \
-                    file://png.h;beginline=19;endline=109;md5=96ec141aee7c75a15d77dbe249a71f93"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e7f289af309d98b46321d0f9892def16 \
+                    file://png.h;beginline=19;endline=109;md5=10c940148fe379a535b310c1c54e609c"
 DEPENDS = "zlib"
 
 PN = "libpng12"
@@ -11,8 +11,8 @@ S = "${WORKDIR}/libpng-${PV}"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "68ac486976e73fd164d54740bece57a2"
-SRC_URI[sha256sum] = "5e5227345676fabbba28558f4396514bb06a239eaf69adba12f3669a1650797e"
+SRC_URI[md5sum] = "868562bd1c58b76ed8703f135a2e439a"
+SRC_URI[sha256sum] = "24ce54581468b937734a6ecc86f7e121bc46a90d76a0d948dca08f32ee000dbe"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
 UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.4.0


