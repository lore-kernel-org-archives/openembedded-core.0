Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5feJ-0004EY-HX
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2013 08:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652927"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:42 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:31 +0200
Message-Id: <aa5fe1556c5c0733364e447b45f72672f9919a32.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/7] xkeyboard-config: upgrade to 2.8
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
X-List-Received-Date: Wed, 13 Feb 2013 16:57:46 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...board-config_2.7.bb => xkeyboard-config_2.8.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.7.bb => xkeyboard-config_2.8.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
index 08d03a5..8ca2f6a 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.7.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6ad7b43062f123eacf8ff0eb3a4e0678"
-SRC_URI[sha256sum] = "e43478a12fb0fe6757a7bad3a04fd3747ec53e53d5af22a9d9829dfb9aac8321"
+SRC_URI[md5sum] = "e66d567d85a954d589c5723fb0e1f3dd"
+SRC_URI[sha256sum] = "4e1cf5468d488aaf320ddfd439e03cbda0b213550fd734026d23138e4b2078ae"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
-- 
1.7.9.5



