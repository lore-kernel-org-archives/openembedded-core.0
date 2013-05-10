Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UapA2-0006yB-Dw
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 08:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999037"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:15 +0300
Message-Id: <d1e5a8863f166560358afc8a23945cc11f2b27ef.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/8] xf86-input-keyboard: upgrade to 1.7.0
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
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...board_1.6.2.bb => xf86-input-keyboard_1.7.0.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.6.2.bb => xf86-input-keyboard_1.7.0.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.7.0.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.7.0.bb
index b635499..7e9e377 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.7.0.bb
@@ -9,7 +9,5 @@ core keyboard."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ec2ea4c3faf5af15f2b3192d84252703"
-SRC_URI[sha256sum] = "76651a84f5031f7c6ecf075d55989c04a00689642579df6d1a1bee6d5c2e5f8a"
+SRC_URI[md5sum] = "97387046c5a450ff78793d5da8e66d5e"
+SRC_URI[sha256sum] = "0cd5e2845149c7f0e19ec830c6914b7f3d154bff134ce84519e39f16ce65523c"
-- 
1.7.9.5



