Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7384E606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:54:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2016 14:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="854814744"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.59])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:53:57 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:54:53 -0500
Message-Id: <1469656493-753-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V2] xorg-xserver: upgrade xserver version from 1.18.3 to 1.18.4
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
X-List-Received-Date: Wed, 27 Jul 2016 21:54:05 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

From version 1.18.3 to 1.18.4 modesetting driver has suffered several changes.
One of this changes allow mouse works as expected with xf86-video-modesetting
driver when system startup upon beaglebone.

[YOCTO #9828]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 .../xorg-xserver/{xserver-xorg_1.18.3.bb => xserver-xorg_1.18.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.3.bb => xserver-xorg_1.18.4.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.4.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.4.bb
index 27098f1..6700565 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.4.bb
@@ -1,8 +1,8 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://musl-arm-inb-outb.patch"
-SRC_URI[md5sum] = "043d720bf2472a65bb8f0daa97f83dfa"
-SRC_URI[sha256sum] = "ea739c22517cdbe2b5f7c0a5fd05fe8a10ac0629003e71c0c7862f4bb60142cd"
+SRC_URI[md5sum] = "d4842dfe3bd9a9d062f2fa1df9104a46"
+SRC_URI[sha256sum] = "278459b2c31d61a15655d95a72fb79930c480a6bb8cf9226e48a07df8b1d31c8"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.9.1


