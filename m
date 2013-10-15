Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B98A6D141
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091187"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:14 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:00 +0300
Message-Id: <d32c3d6b74c1492d337696d52eddc62293ee447c.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 03/10] xauth: upgrade to 1.0.8
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:13 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb}    |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.7.bb b/meta/recipes-graphics/xorg-app/xauth_1.0.8.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-app/xauth_1.0.7.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.0.8.bb
index 9a5de54..a2da49e 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.0.8.bb
@@ -6,8 +6,7 @@ information used in connecting to the X server."
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
 DEPENDS += "libxau libxext libxmu"
-PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "cbcbd8f2156a53b609800bec4c6b6c0e"
-SRC_URI[sha256sum] = "84f78c08ebc6687e2e36c9ff1f5610988c6a03fc5bf51ef89aec4d155de3028d"
+SRC_URI[md5sum] = "50ee2ec0836c0186b05ec8fdcfd566d0"
+SRC_URI[sha256sum] = "a8696ae7a50c699d5fb3a41408b60d98843d19ea46e9f09e391cb98c8f7fd4f7"
-- 
1.7.9.5


