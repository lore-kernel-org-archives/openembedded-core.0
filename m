Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5fdq-0004EC-5j
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Feb 2013 08:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652935"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:43 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:32 +0200
Message-Id: <a5e6ec62499b3a152be390f03b366c54cdad4105.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/7] xf86-input-synaptics: upgrade to 1.6.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2013 16:57:46 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.6.2.bb => xf86-input-synaptics_1.6.3.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.2.bb => xf86-input-synaptics_1.6.3.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.3.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.3.bb
index c28aff4..9ebdfef 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.3.bb
@@ -12,10 +12,10 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "9914022a173e3f0ccfe7137ab84f6133"
-SRC_URI[sha256sum] = "c3f7d6a085d480c352f030aeb43db2e5560d1468ed34be24d44a0fc3fda25920"
+SRC_URI[md5sum] = "3568930b0bda522e00272b64c0ca2ca2"
+SRC_URI[sha256sum] = "b40c9dbd5f743ff1eb2ac81a23b9676df72e76ed3fa6408de3f8a3a260248604"
 
 DEPENDS += "libxi mtdev"
 
-- 
1.7.9.5



