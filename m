Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWv-0003H9-4x
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416789"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:09 +0300
Message-Id: <4908fca5face37d7bb1384dede11489148fdd93e.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 17/19] xf86-video-intel: upgrade to 2.19.0
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

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
index 637e11c..fe7408b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
@@ -22,5 +22,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "34f3987ffe86e30c57abc33b7f8030e9"
-SRC_URI[sha256sum] = "dce63e33ccfada39ef1e1e6768dfd8edd4c525670dfe56d1c42b2f9570039ffc"
+SRC_URI[md5sum] = "f397bddfc88d4c9b30b56526c1e02e8e"
+SRC_URI[sha256sum] = "32133d61b14ce3b45b83a60e4ed8eb75159259d708f056144250aaeabf16e4bc"
-- 
1.7.9.5



