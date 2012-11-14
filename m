Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYZU5-0001WJ-C6
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 10:42:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Nov 2012 01:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,249,1352102400"; d="scan'208";a="217517404"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 14 Nov 2012 01:28:13 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 11:27:58 +0200
Message-Id: <751b75b754743ab11ca7dd33265323c99d6b7ebc.1352884713.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 01/12] xf86-video-vesa: upgrade to 2.3.2
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
X-List-Received-Date: Wed, 14 Nov 2012 09:42:13 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ideo-vesa_2.3.1.bb => xf86-video-vesa_2.3.2.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.1.bb => xf86-video-vesa_2.3.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
index bc7fb2e..0fc6b71 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
@@ -11,7 +11,7 @@ can drive most VESA-compatible video cards, but only makes use of the \
 basic standard VESA core that is common to these cards. The driver \
 supports depths 8, 15 16 and 24."
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
@@ -20,5 +20,5 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[md5sum] = "02e6eacc2d1e07ac893b62481905d6f0"
-SRC_URI[sha256sum] = "e4a1038d5bc8884de461737f68f963651ef91137976388e1db4efc3991d01573"
+SRC_URI[md5sum] = "3eddd393fba79550e012d717499d58ad"
+SRC_URI[sha256sum] = "144a17ffae3c86603ddc4ae33521a52813498ee1f8213faa662dc4a8d6490ee3"
-- 
1.7.9.5



