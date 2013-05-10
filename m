Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UapAL-0006xk-Ob
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 08:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999082"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:32 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:17 +0300
Message-Id: <c83ec06106425031d1f2b6ffd02f0b05780564c2.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/8] xf86-input-synaptics: upgrade to 1.7.0
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
X-List-Received-Date: Fri, 10 May 2013 15:23:30 -0000

Licence checksum changed because RedHat adjusted the copyright years.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.6.3.bb => xf86-input-synaptics_1.7.0.bb} |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.3.bb => xf86-input-synaptics_1.7.0.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.0.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.0.bb
index 9ebdfef..72b4107 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.0.bb
@@ -10,12 +10,10 @@ operating in a compatibility mode emulating a standard mouse) can be \
 handled by the normal evdev or mouse drivers, this driver allows more \
 advanced features of the touchpad to become available."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "3568930b0bda522e00272b64c0ca2ca2"
-SRC_URI[sha256sum] = "b40c9dbd5f743ff1eb2ac81a23b9676df72e76ed3fa6408de3f8a3a260248604"
+SRC_URI[md5sum] = "5e4f232a18a1741e4c34895d28238f8d"
+SRC_URI[sha256sum] = "d6f1ad0b0653dddbe2e2db7e2f06c1860e491045e87a6577b63568d65e5d0f0e"
 
 DEPENDS += "libxi mtdev"
 
-- 
1.7.9.5



