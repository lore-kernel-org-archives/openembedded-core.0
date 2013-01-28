Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4N-0003nW-BV
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:06 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769978"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:49 -0800
Message-Id: <ad0c5bf5119784a9b636756aeafe969175c842d7.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 02/13] rgb: Update to 1.0.5
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:14 -0000

Remove the backported automake patch, now fixed upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/rgb-1.0.4/obsolete_automake_macros.patch     | 15 ---------------
 .../xorg-app/{rgb_1.0.4.bb => rgb_1.0.5.bb}               |  8 +++-----
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-app/{rgb_1.0.4.bb => rgb_1.0.5.bb} (45%)

diff --git a/meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch b/meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
deleted file mode 100644
index 43ab68f..0000000
--- a/meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [fixed in development version]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd rgb-1.0.4/configure.ac rgb-1.0.4/configure.ac
---- rgb-1.0.4/configure.ac	2010-10-07 06:17:16.000000000 +0300
-+++ rgb-1.0.4/configure.ac	2013-01-11 08:04:23.767562150 +0200
-@@ -26,7 +26,7 @@
-	[https://bugs.freedesktop.org/enter_bug.cgi?product=xorg], [rgb])
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
- AM_MAINTAINER_MODE
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- # Require X.Org macros 1.8 or later for MAN_SUBSTS set by XORG_MANPAGE_SECTIONS
- m4_ifndef([XORG_MACROS_VERSION],
diff --git a/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb b/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb
similarity index 45%
rename from meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
rename to meta/recipes-graphics/xorg-app/rgb_1.0.5.bb
index 5f71787..602ee09 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb
@@ -2,11 +2,9 @@ require xorg-app-common.inc
 DEPENDS += " xproto util-macros"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
-SRC_URI += "file://obsolete_automake_macros.patch"
-
-SRC_URI[md5sum] = "35c6cccbf25a872bdd62bfcb1a73d951"
-SRC_URI[sha256sum] = "80887da011ad086fff88bfd16c6d9d5ac7da45ef1bc9d0c192a6f370423370f1"
+SRC_URI[md5sum] = "bcd820d967eaa51bd25b86c0ee682d4e"
+SRC_URI[sha256sum] = "8e936e648ffddce2e7184790efa15e4fa2bcb47f9da5469515d212c61bc8f857"
 
 FILES_${PN} += "${datadir}/X11"
-- 
1.8.0.2



