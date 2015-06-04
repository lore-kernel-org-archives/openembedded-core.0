Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAE0757AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:44:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2015 03:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="720634347"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 03:44:01 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:44:17 +0300
Message-Id: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433414236.git.jussi.kukkonen@intel.com>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] xf86-input-evdev: Upgrade 2.9.1 -> 2.9.2
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
X-List-Received-Date: Thu, 04 Jun 2015 10:44:21 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-evdev_2.9.1.bb => xf86-input-evdev_2.9.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.1.bb => xf86-input-evdev_2.9.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.2.bb
index 6d71ba8..66428df 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.2.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "8f73a98e32dccc9d054b54727cc4093f"
-SRC_URI[sha256sum] = "0ce30328adfeac90a6f4b508d992fb834d8e50b484b29d3d58cf6683fa8502f9"
+SRC_URI[md5sum] = "99eebf171e6c7bffc42d4fc430d47454"
+SRC_URI[sha256sum] = "792329b531afc6928ccda94e4b51a5520d4ddf8ef9a00890a5d0d31898acefec"
-- 
2.1.4


