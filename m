Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuS-0002yu-KT
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125508"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:19 -0700
Message-Id: <515cbe565b684359ac9d8bd0fb523aa3d2f810e2.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 08/32] xserver-kdrive: Add xkb to existing docs list
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
X-List-Received-Date: Thu, 24 May 2012 21:49:31 -0000

From: Saul Wold <sgw@linux.intel.com>

WARNING: For recipe xserver-kdrive, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/man
WARNING:   /usr/share/man/man5
WARNING:   /usr/share/man/man1
WARNING:   /usr/share/man/man1/Xephyr.1
WARNING:   /usr/share/man/man1/Xserver.1
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
index d0bedd9..c4c2a9f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
@@ -50,7 +50,7 @@ DESCRIPTION_xserver-kdrive-vesa = "X server from freedesktop.org, supporting any
 DESCRIPTION_xserver-kdrive-via = "X server from freedesktop.org, supporting VIA chipsets"
 
 FILES_${PN} += "${libdir}/xserver/SecurityPolicy ${libdir}/xorg"
-FILES_${PN}-doc =  "${datadir}/X11/xkb"
+FILES_${PN}-doc +=  "${datadir}/X11/xkb"
 ALLOW_EMPTY_${PN} = "1"
 
 FILES_xserver-kdrive-fbdev = "${bindir}/Xfbdev"
-- 
1.7.9.5



