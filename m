Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3FD6D092
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:21:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417468"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:22 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:12 +0200
Message-Id: <400897035a819988fc9e8cb9431cce89ee41c762.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/7] xf86-input-keyboard: upgrade to 1.8.0
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...board_1.7.0.bb => xf86-input-keyboard_1.8.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.7.0.bb => xf86-input-keyboard_1.8.0.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.0.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.7.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.0.bb
index 7e9e377..f138918 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.0.bb
@@ -9,5 +9,5 @@ core keyboard."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
-SRC_URI[md5sum] = "97387046c5a450ff78793d5da8e66d5e"
-SRC_URI[sha256sum] = "0cd5e2845149c7f0e19ec830c6914b7f3d154bff134ce84519e39f16ce65523c"
+SRC_URI[md5sum] = "ce936e219682bacf5a4a9c4ab940edb8"
+SRC_URI[sha256sum] = "41c51c4e0a87aad6a1c4973c68a8de23b61162d0223f4ab36c627c307830cb5b"
-- 
1.7.9.5


