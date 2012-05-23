Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWu-0003Gz-Vq
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416770"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:07 +0300
Message-Id: <14beddae4faf0eda31f98149fda2e199bf752cc1.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 15/19] xf86-input-mouse: upgrade to 1.7.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 13:23:09 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ut-mouse_1.7.1.bb => xf86-input-mouse_1.7.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.7.1.bb => xf86-input-mouse_1.7.2.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.2.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.2.bb
index e3215f9..9ff4563 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.2.bb
@@ -12,5 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=237eb1d1a602d29ef2af62d8fba60f19"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "13276d780b8ef3a82088f009185bf42b"
-SRC_URI[sha256sum] = "d2c5b4b9bf03f8f7ef7b37bab25197d3f99a4d889c61bb67a68df33ec2c2ff12"
+SRC_URI[md5sum] = "871c828b88e9c973f1457724b35576fb"
+SRC_URI[sha256sum] = "332b7357c18e6b9daba51c8ed48ce118e9b51fb5990b6a2a68637be62da7413b"
-- 
1.7.9.5



