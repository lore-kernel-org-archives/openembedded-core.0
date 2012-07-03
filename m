Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx7C-00036R-45
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373991"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:37 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:24 +0300
Message-Id: <1341298228-4412-8-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 07/10] xcb-util-wm: upgrade to 0.3.9
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
X-List-Received-Date: Tue, 03 Jul 2012 07:01:38 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} (74%)

diff --git a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
similarity index 74%
rename from meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb
rename to meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
index 91f9a81..4d57ec2 100644
--- a/meta/recipes-graphics/xcb/xcb-util-wm_0.3.8.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-wm_0.3.9.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM = "file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610
 					"
 PR = "r0"
 
-SRC_URI[md5sum] = "dda47289bc846a6a3e07824e9ec3aef8"
-SRC_URI[sha256sum] = "c557abbe4c7d45268f0541ee3d8f9a1a8799692fcc28aa33f39db93cc2e65007"
+SRC_URI[md5sum] = "c612aae7ffe2e70fe743efab9c5548e9"
+SRC_URI[sha256sum] = "038f9bdb917b1f6d98a164f57dfb32212a102d771ab6f03de49fef3786746030"
-- 
1.7.9.5



