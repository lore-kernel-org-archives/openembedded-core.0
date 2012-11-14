Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYd7a-0002VG-8v
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 14:35:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 05:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,250,1352102400"; d="scan'208";a="219485878"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2012 05:21:18 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 15:21:02 +0200
Message-Id: <96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 04/12] xkeyboard-config: upgrade to 2.7
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
X-List-Received-Date: Wed, 14 Nov 2012 13:35:14 -0000

A couple of extra changes:
 * changed the SRC_URI to the new, valid, one
 * added dependency of gettext (do_qa_configure detected is needed)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...board-config_2.1.bb => xkeyboard-config_2.7.bb} |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.1.bb => xkeyboard-config_2.7.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
index 1b28208..96c6188 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
@@ -12,14 +12,14 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-confi
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
-SRC_URI = "http://people.freedesktop.org/~svu/xkeyboard-config-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6ce65480445fb2d9c071ad1f002a7675"
-SRC_URI[sha256sum] = "e293aa4b0dd259dbb4f0e7f56fdd95db5047d052c7b3b80922fe5663923a805d"
+SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "6ad7b43062f123eacf8ff0eb3a4e0678"
+SRC_URI[sha256sum] = "e43478a12fb0fe6757a7bad3a04fd3747ec53e53d5af22a9d9829dfb9aac8321"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native xkbcomp-native glib-2.0"
+DEPENDS = "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
 
-PR = "r2"
+PR = "r0"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg"
 
-- 
1.7.9.5



