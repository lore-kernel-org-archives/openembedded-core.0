Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 16B9F606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:55:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 05:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="994378731"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2016 05:54:15 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:54:06 +0300
Message-Id: <e4f6435fa5336071a27b08df0a0700a7ede10255.1468414127.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
References: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468414126.git.jussi.kukkonen@intel.com>
References: <cover.1468414126.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/7] freetype: Upgrade 2.6.3 -> 2.6.5
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
X-List-Received-Date: Wed, 13 Jul 2016 12:55:10 -0000

A new supposedly superior subpixel hinting mode was added and made
default in 2.6.4 but 2.6.5 reverts the default to "no hinting".

License checksum changes because of a copyright symbol change.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../freetype/{freetype_2.6.3.bb => freetype_2.6.5.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.6.3.bb => freetype_2.6.5.bb} (89%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.3.bb b/meta/recipes-graphics/freetype/freetype_2.6.5.bb
similarity index 89%
rename from meta/recipes-graphics/freetype/freetype_2.6.3.bb
rename to meta/recipes-graphics/freetype/freetype_2.6.5.bb
index bcd5044..b8cac1c 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.5.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "FreeType | GPLv2+"
 LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1 \
-                    file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
+                    file://docs/FTL.TXT;md5=13b25413274c9b3b09b63e4028216ff4 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "0037b25a8c090bc8a1218e867b32beb1"
-SRC_URI[sha256sum] = "371e707aa522acf5b15ce93f11183c725b8ed1ee8546d7b3af549863045863a2"
+SRC_URI[md5sum] = "6a386964e18ba28cb93370e57a19031b"
+SRC_URI[sha256sum] = "e20a6e1400798fd5e3d831dd821b61c35b1f9a6465d6b18a53a9df4cf441acf0"
 
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-- 
2.1.4


