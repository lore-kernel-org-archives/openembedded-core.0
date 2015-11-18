Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 815D36612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:33:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Nov 2015 01:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853703768"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 01:33:59 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 704646A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:32:53 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:34:39 +0200
Message-Id: <1447839279-12119-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
References: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/6] libpng12: update to 1.2.54
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
X-List-Received-Date: Wed, 18 Nov 2015 09:33:58 -0000

1.2.53 -> 1.2.54

No updates in License.The license checksums changed
because of update in Copyright date and update of png.h

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng12_1.2.53.bb => libpng12_1.2.54.bb}             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.53.bb => libpng12_1.2.54.bb} (70%)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.54.bb
similarity index 70%
rename from meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.54.bb
index bf861a7..5f826ad 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.54.bb
@@ -2,8 +2,8 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bd2a7a13355fcca92ad83bdf7e296011 \
-                    file://png.h;beginline=322;endline=436;md5=caf9ee541234c663aeecdcfef2f79ae1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=74b5ed0e4da965adc6f2c00d8ec2bc81 \
+                    file://png.h;beginline=19;endline=109;md5=b59f5432223381017280e327e605bb9a"
 DEPENDS = "zlib"
 
 PN = "libpng12"
@@ -11,8 +11,8 @@ S = "${WORKDIR}/libpng-${PV}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "7d18a74e6fd2029aee76ccd00e00a9e6"
-SRC_URI[sha256sum] = "b45e49f689e7451bd576569e6a344f7e0d11c02ecbb797f4da0e431526765c0a"
+SRC_URI[md5sum] = "bbb7a7264f1c7d9c444fd16bf6f89832"
+SRC_URI[sha256sum] = "cf85516482780f2bc2c5b5073902f12b1519019d47bf473326c2018bdff1d272"
 
 BINCONFIG_GLOB = "${PN}-config"
 
-- 
2.4.0


