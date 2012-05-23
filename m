Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWv-0003H0-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416779"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:32 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:08 +0300
Message-Id: <c302e6257346e42b88da0050cb0a99219a97d987.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 16/19] xf86-video-vesa: upgrade to 2.3.1
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
X-List-Received-Date: Wed, 23 May 2012 13:23:09 -0000

Also, licence checksum has changed because a new copyright line from
Red Hat has been added. The rest of licence file, however, is unchanged.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ideo-vesa_2.3.0.bb => xf86-video-vesa_2.3.1.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.0.bb => xf86-video-vesa_2.3.1.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.1.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.1.bb
index f0c0167..bc7fb2e 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.1.bb
@@ -1,6 +1,6 @@
 require xorg-driver-video.inc
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e5418e7a75e21268637984e70265e146"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a1f0610ebdc6f314a9fa5102a8c5c1b0"
 
 EXTRA_OECONF += "--disable-xvmc"
 
@@ -20,5 +20,5 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[md5sum] = "07fa32958aff9b463dd3af5481ef6626"
-SRC_URI[sha256sum] = "8ed85a0e94523539d81d5ae6639fa22ceb1c1e3baf89128915db65d4d2900d7a"
+SRC_URI[md5sum] = "02e6eacc2d1e07ac893b62481905d6f0"
+SRC_URI[sha256sum] = "e4a1038d5bc8884de461737f68f963651ef91137976388e1db4efc3991d01573"
-- 
1.7.9.5



