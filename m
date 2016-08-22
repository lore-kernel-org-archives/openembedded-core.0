Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7B9731E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984540"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:08 +0300
Message-Id: <e2adc43e2eb726f8cb87d15cccd7d14d06f122fc.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/9] fontconfig: Upgrade 2.12.0 -> 2.12.1
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:19 -0000

License text block moved, checksum remains same.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../fontconfig/{fontconfig_2.12.0.bb => fontconfig_2.12.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.0.bb => fontconfig_2.12.1.bb} (87%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
similarity index 87%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.12.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
index 373a241..115f558 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
@@ -14,7 +14,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1281;endline=1296;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1360;endline=1375;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
@@ -23,8 +23,8 @@ DEPENDS = "expat freetype zlib"
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[md5sum] = "d8b056231abcb6257db6dc6d745360b2"
-SRC_URI[sha256sum] = "fb10dee06097d8bc6c548ecfaaad5edd6db2d7805e0c9d783692c0a23e8b702d"
+SRC_URI[md5sum] = "ce55e525c37147eee14cc2de6cc09f6c"
+SRC_URI[sha256sum] = "a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292"
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
2.1.4


