Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SARrI-0000KH-L5
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:10:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2012 13:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120144514"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.49])
	by orsmga001.jf.intel.com with ESMTP; 21 Mar 2012 13:01:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 13:01:17 -0700
Message-Id: <1332360077-17379-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] xserver-kdrive: Fix packaging warnings
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
X-List-Received-Date: Wed, 21 Mar 2012 20:10:12 -0000

WARNING: For recipe xserver-kdrive, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib
WARNING:   /usr/lib/xorg
WARNING:   /usr/lib/xorg/protocol.txt
WARNING:   /usr/share/X11
WARNING:   /usr/share/X11/xkb
WARNING:   /usr/share/X11/xkb/compiled
WARNING:   /usr/share/X11/xkb/compiled/README.compiled
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/xserver-kdrive.inc                |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
index 58dee27..d0bedd9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
@@ -49,7 +49,8 @@ DESCRIPTION_xserver-kdrive-smi = "X server from freedesktop.org, supporting Sili
 DESCRIPTION_xserver-kdrive-vesa = "X server from freedesktop.org, supporting any card with a VESA, VGA or even EGA BIOS. x86 hardware only"
 DESCRIPTION_xserver-kdrive-via = "X server from freedesktop.org, supporting VIA chipsets"
 
-FILES_${PN} += "${libdir}/xserver/SecurityPolicy"
+FILES_${PN} += "${libdir}/xserver/SecurityPolicy ${libdir}/xorg"
+FILES_${PN}-doc =  "${datadir}/X11/xkb"
 ALLOW_EMPTY_${PN} = "1"
 
 FILES_xserver-kdrive-fbdev = "${bindir}/Xfbdev"
-- 
1.7.7.6



