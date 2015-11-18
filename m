Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E94F1601B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:34:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2015 01:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="602416870"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Nov 2015 01:33:58 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3BDD06A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:32:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:34:38 +0200
Message-Id: <1447839279-12119-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
References: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/6] libpng: update to 1.6.19
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
X-List-Received-Date: Wed, 18 Nov 2015 09:34:07 -0000

1.6.17 -> 1.6.19

No changes in License.The license checksums changed because of update
in Copyright dates and other restructuring in png.h

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.17.bb => libpng_1.6.19.bb}              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.17.bb => libpng_1.6.19.bb} (62%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb b/meta/recipes-multimedia/libpng/libpng_1.6.19.bb
similarity index 62%
rename from meta/recipes-multimedia/libpng/libpng_1.6.17.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.19.bb
index 00e5808..214f9d3 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.19.bb
@@ -2,16 +2,16 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b9b75399b72e4a8656cf3a6ddfc86d9a \
-                    file://png.h;endline=16;md5=cc9c2d1eafda17e1277a6f99a9fc29c4 \
-                    file://png.h;beginline=242;endline=356;md5=599316819d525dde2bfdf28fe3f323af"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=586a8dac4d039e74af7b68ff2bc5fc41 \
+                    file://png.h;endline=17;md5=a38a64f8b5cf0ea4e2d4c2cb47150151 \
+                    file://png.h;beginline=19;endline=111;md5=d3e773acb87d7a35863203538167a776"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "430a9b76b78533235cd4b9b26ce75c7e"
-SRC_URI[sha256sum] = "98507b55fbe5cd43c51981f2924e4671fd81fe35d52dc53357e20f2c77fa5dfd"
+SRC_URI[md5sum] = "1e6a458429e850fc93c1f3b6dc00a48f"
+SRC_URI[sha256sum] = "311c5657f53516986c67713c946f616483e3cdb52b8b2ee26711be74e8ac35e8"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


