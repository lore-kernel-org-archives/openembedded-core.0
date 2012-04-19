Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL0Eg-0006o0-U0
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:53:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2012 15:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134590353"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2012 15:44:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Thu, 19 Apr 2012 15:44:17 -0700
Message-Id: <16d067da591e0664c4475c09d25d6b5f9861d5ea.1334875218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
Subject: [PATCH 03/10] xserver-kdrive: Add xkb to existing docs list
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
X-List-Received-Date: Thu, 19 Apr 2012 22:53:59 -0000

WARNING: For recipe xserver-kdrive, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/man
WARNING:   /usr/share/man/man5
WARNING:   /usr/share/man/man1
WARNING:   /usr/share/man/man1/Xephyr.1
WARNING:   /usr/share/man/man1/Xserver.1
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
1.7.7.6



