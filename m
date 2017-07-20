Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 82E1478270
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 11:50:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jul 2017 04:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="1153440116"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2017 04:50:16 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 14A9C5808DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 04:50:15 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 14:51:01 +0300
Message-Id: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [morty][PATCH 1/2] libpng: move SRC_URI back to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Thu, 20 Jul 2017 11:50:16 -0000

Since GENTOO_MIRROR removes older binaries, move back to
SOURCEFORGE_MIRROR

[YOCTO #11554]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.24.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
index f91ab7f..4ee5983 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
                     file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
 DEPENDS = "zlib"
 
-SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
-          "
+LIBV = "16"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}/libpng-${PV}.tar.xz"
+
 SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
 SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
 
-- 
2.4.0


