Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfN-0006RQ-NH
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907401"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:37 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:18 +0200
Message-Id: <6ade90a89b52f38a597d888041c99b2bb46c7c04.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/12] xf86-video-vesa: upgrade to 2.3.2
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



