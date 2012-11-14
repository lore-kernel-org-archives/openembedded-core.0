Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYZU5-0001WH-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 10:42:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Nov 2012 01:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,249,1352102400"; d="scan'208";a="217517412"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 14 Nov 2012 01:28:15 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 11:27:59 +0200
Message-Id: <e5c8d5e35a85ccad7ab2c6ed99c21f1fc26642cc.1352884713.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 02/12] xf86-video-intel: upgrade to 2.20.12
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
X-List-Received-Date: Wed, 14 Nov 2012 09:42:14 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...intel_2.20.8.bb => xf86-video-intel_2.20.12.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.8.bb => xf86-video-intel_2.20.12.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.8.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.12.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.8.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.12.bb
index 3ac746f..09aa339 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.8.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.20.12.bb
@@ -9,7 +9,7 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 DEPENDS += "virtual/libx11 drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
@@ -23,5 +23,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "63a002ac596208dc6047289553b75262"
-SRC_URI[sha256sum] = "2a126b2bb93b8d9db5eef68f1496e83713fd51ac435a7fafc7a36ff9c7ca83e7"
+SRC_URI[md5sum] = "6d9565de03c167d8f621315476c20c73"
+SRC_URI[sha256sum] = "39e02b7f90a2665efe5483075f93b1c87d24f48070d5de783dd41e20d9eb0c7c"
-- 
1.7.9.5



