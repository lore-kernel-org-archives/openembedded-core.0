Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1USrYI-0000Jw-Lv
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 18:19:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Apr 2013 08:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,502,1363158000"; d="scan'208";a="297001012"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2013 09:01:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 19:01:34 +0300
Message-Id: <1366300894-32484-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] xserver-xf86-config: set DefaultDepth to 16 for qemumips
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
X-List-Received-Date: Thu, 18 Apr 2013 16:19:23 -0000

Apparently, the default qemumips color depth was set to 8 and the colors were not
displayed properly. cirrusfb driver doensn't seem to accept color depth
as a kernel parameter, so we have to do it here.

[YOCTO #4340]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xserver-xf86-config/qemumips/xorg.conf         |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
index 629ae21..e6c8b51 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
@@ -54,6 +54,7 @@ Section "Screen"
     Identifier    "Default Screen"
     Device        "Graphics Controller"
     Monitor        "Generic Monitor"
+    DefaultDepth  16
     SubSection "Display"
         Modes     "640x480"
     EndSubSection
-- 
1.7.9.5



