Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDT-0001Zu-6g
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753321"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:23 -0700
Message-Id: <4d19b5f25b2a302d1f68414923615250d9ce1f48.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 36/50] libxdamage, libxft, libxrandr: Add missing dependency on virtual/libx11
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:18 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    4 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    4 ++--
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb  |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
index 81f90ba..f2b4eac 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
@@ -16,10 +16,10 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe101f30dd24134cf43146863241868"
 
-DEPENDS += "damageproto libxfixes"
+DEPENDS += "virtual/libx11 damageproto libxfixes"
 PROVIDES = "xdamage"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXdamage"
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 1a56702..33c8a1e 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -15,10 +15,10 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 
-DEPENDS += "libxrender freetype fontconfig"
+DEPENDS += "virtual/libx11 libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXft"
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
index 917fe20..616ac68 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
@@ -11,9 +11,9 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c5c132d3690478179d78ec3bf064584"
 
-DEPENDS += "randrproto libxrender libxext"
+DEPENDS += "virtual/libx11 randrproto libxrender libxext"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXrandr"
-- 
1.7.3.4



