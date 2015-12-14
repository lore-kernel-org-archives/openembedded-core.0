Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B510D605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:33:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Dec 2015 06:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="840816640"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2015 06:33:05 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 269E16A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:21:06 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 16:34:11 +0200
Message-Id: <1450103652-30181-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
References: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libpng12: Upgrade 1.2.54 -> 1.2.55
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
X-List-Received-Date: Mon, 14 Dec 2015 14:33:05 -0000

1.2.54 -> 1.2.55

No change in License.The license checksums changed because of update
in Copyright date.

Update SRC_URI to use GENTOO_MIRROR as SOURCEFORGE_MIRROR continue
to move around the release files.
[YOCTO #8739]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng12_1.2.54.bb => libpng12_1.2.55.bb}          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.54.bb => libpng12_1.2.55.bb} (66%)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.54.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.55.bb
similarity index 66%
rename from meta/recipes-lsb4/libpng/libpng12_1.2.54.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.55.bb
index 25f52db..1afbeab 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.54.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.55.bb
@@ -2,17 +2,17 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=74b5ed0e4da965adc6f2c00d8ec2bc81 \
-                    file://png.h;beginline=19;endline=109;md5=b59f5432223381017280e327e605bb9a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6150ae2da16b673fa759402d5fb7ef73 \
+                    file://png.h;beginline=19;endline=109;md5=96ec141aee7c75a15d77dbe249a71f93"
 DEPENDS = "zlib"
 
 PN = "libpng12"
 S = "${WORKDIR}/libpng-${PV}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
+SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bbb7a7264f1c7d9c444fd16bf6f89832"
-SRC_URI[sha256sum] = "cf85516482780f2bc2c5b5073902f12b1519019d47bf473326c2018bdff1d272"
+SRC_URI[md5sum] = "68ac486976e73fd164d54740bece57a2"
+SRC_URI[sha256sum] = "5e5227345676fabbba28558f4396514bb06a239eaf69adba12f3669a1650797e"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
 UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.4.0


