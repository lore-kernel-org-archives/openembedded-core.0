Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWv-0003Gz-MT
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416801"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:34 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:10 +0300
Message-Id: <f38d8ee057b1a658b95cd2c0e0cd0114c6d36684.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 18/19] xf86-input-synaptics: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 23 May 2012 13:23:10 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.5.0.bb => xf86-input-synaptics_1.6.1.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.5.0.bb => xf86-input-synaptics_1.6.1.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.1.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.1.bb
index 5e46567..8f2a7f2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.1.bb
@@ -12,10 +12,10 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "41ee749ecbfef98f7fba708cb2afae87"
-SRC_URI[sha256sum] = "95cc5399fc49c9a35b02c2272cd99b8438f4609b219278c66a79e74c916a1c4e"
+SRC_URI[md5sum] = "d10a7ee362d015975fbef11c6beaac97"
+SRC_URI[sha256sum] = "1ab1459ea340f371c40be7d6a780e43bdaa2d9799c1de21145e3b5808d0eab3c"
 
 DEPENDS += "libxi"
 
-- 
1.7.9.5



