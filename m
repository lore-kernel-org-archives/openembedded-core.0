Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfO-0006RQ-E4
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907404"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:38 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:19 +0200
Message-Id: <bfb6980d5392b612523fc926dabf042f365bc4d2.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/12] xf86-video-intel: upgrade to 2.20.12
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
X-List-Received-Date: Tue, 13 Nov 2012 12:32:34 -0000

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



