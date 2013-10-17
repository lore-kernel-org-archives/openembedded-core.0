Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F37286CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:22 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040005"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:24 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:11 +0300
Message-Id: <c24c8cd5ea808d6cc513883571fa28fbe7b044df.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/8] xmodmap: upgrade to 1.0.8
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:23 -0000

License file changed slightly with some years changes.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xmodmap_1.0.7.bb => xmodmap_1.0.8.bb}         |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.7.bb => xmodmap_1.0.8.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
index 573eecb..65a55e3 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
@@ -9,12 +9,11 @@ from the user's session startup script to configure the keyboard \
 according to personal tastes."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eef098b27f09d0ac39268df0cc2c00b5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
-PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI += "file://gnu-source.patch"
 
-SRC_URI[md5sum] = "d9b65f6881afe0d6d9863b30e1081bde"
-SRC_URI[sha256sum] = "ef22ede9c4a3c720da539292c6911515a8408e618e0dec6aa2196ee2153de4b5"
+SRC_URI[md5sum] = "5511da3361eea4eaa21427652c559e1c"
+SRC_URI[sha256sum] = "efe2e3c89858a2db3bdcf969f55f55d0af4f5007789198344de0595249a99fc3"
-- 
1.7.9.5


