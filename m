Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UapAN-0006yy-Uk
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 08:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999054"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:16 +0300
Message-Id: <17e59956b730ff0f9cf60f95da713f1dda92991d.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/8] xf86-input-mouse: upgrade to 1.9.0
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
X-List-Received-Date: Fri, 10 May 2013 15:23:32 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ut-mouse_1.8.1.bb => xf86-input-mouse_1.9.0.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.8.1.bb => xf86-input-mouse_1.9.0.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.8.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.0.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.8.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.0.bb
index 3b1dce4..aca958c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.0.bb
@@ -10,8 +10,6 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "f314c56e4ac6c8fc0cc2710892d5776e"
-SRC_URI[sha256sum] = "f5b97aac9aab8fa8b933e960631441ae23b18681c8bf3d5007c00da838f9c9c8"
+SRC_URI[md5sum] = "36b5b92000c4644f648b58a535e4ee73"
+SRC_URI[sha256sum] = "5d601e4bae53d5e9ead4ecd700f1beb5aeaf78b79e634c4aa381a9ce00276488"
 
-- 
1.7.9.5



