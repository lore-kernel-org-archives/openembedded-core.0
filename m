Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10C966D13D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091193"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:15 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:01 +0300
Message-Id: <744c10b83453f4b091e8387e5c4e8ee53761048b.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 04/10] xf86-input-evdev: upgrade to 2.8.2
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:15 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ut-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.2.bb
index bc6c7fc..6cbe165 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.2.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev"
 
-SRC_URI[md5sum] = "cc1f59e22edfbc69daecf01e43a8dba3"
-SRC_URI[sha256sum] = "09f887e1ce6cdb92154035db9044e0795a5c80f1ffb9efc599aed9a9dc1ff539"
+SRC_URI[md5sum] = "be7f91905c41bb3c3a0eb54063c7e4bf"
+SRC_URI[sha256sum] = "750461749a83bdee7771592aa5c0db5e267b18d847078a4b8622f55b04797eb3"
-- 
1.7.9.5


