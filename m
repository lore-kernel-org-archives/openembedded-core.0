Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5C46D141
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091203"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:17 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:03 +0300
Message-Id: <29e372ce0ec1d0f3dd834fceddba3350c22cb01f.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 06/10] xset: upgrade to 1.2.3
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb}      |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.2.bb b/meta/recipes-graphics/xorg-app/xset_1.2.3.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-app/xset_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.3.bb
index 7830019..f683b76 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.3.bb
@@ -8,13 +8,12 @@ preference options of the display."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bea81cc9827cdf1af0e12c2b8228cf8d"
 DEPENDS += "libxext libxxf86misc libxmu libxau"
-PR = "${INC_PR}.2"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "d44e0057d6722b25d5a314e82e0b7e7c"
-SRC_URI[sha256sum] = "61371c140030b8b05075a1378b34a4d7c438ed9159496a95f10782c6f4aec1e8"
+SRC_URI[md5sum] = "dcd227388b57487d543cab2fd7a602d7"
+SRC_URI[sha256sum] = "4382f4fb29b88647e13f3b4bc29263134270747fc159cfc5f7e3af23588c8063"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb --without-fontcache"
-- 
1.7.9.5


