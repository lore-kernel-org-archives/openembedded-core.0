Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A873C6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:55:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 05:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="994378716"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2016 05:54:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:54:05 +0300
Message-Id: <450666be6359840a06620511c9845a8cd1eb640f.1468414127.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
References: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468414126.git.jussi.kukkonen@intel.com>
References: <cover.1468414126.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/7] fontconfig: Upgrade 2.11.95 -> 2.12.0
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

License unchanged, just moved by a few lines.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../fontconfig/{fontconfig_2.11.95.bb => fontconfig_2.12.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.95.bb => fontconfig_2.12.0.bb} (87%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.95.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.0.bb
similarity index 87%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.95.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.12.0.bb
index 5db4436..373a241 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.95.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.0.bb
@@ -14,7 +14,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1278;endline=1293;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1281;endline=1296;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
@@ -23,8 +23,8 @@ DEPENDS = "expat freetype zlib"
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[md5sum] = "da605e910d9c037f8886d65607b06920"
-SRC_URI[sha256sum] = "39da7704b348b3c9c83f449e9aa6e0e131ffe77e3533b68017f3b40a95d75a9c"
+SRC_URI[md5sum] = "d8b056231abcb6257db6dc6d745360b2"
+SRC_URI[sha256sum] = "fb10dee06097d8bc6c548ecfaaad5edd6db2d7805e0c9d783692c0a23e8b702d"
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
2.1.4


