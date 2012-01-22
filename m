Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp249-00033r-1r
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:22:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jan 2012 10:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109668922"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2012 10:02:33 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:18 +0800
Message-Id: <5508508491b90ad0747c9aa4a9817274ea88d378.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 13/18] ofono: upgrade to 1.3
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
X-List-Received-Date: Sun, 22 Jan 2012 18:22:57 -0000

This patch is to upgrade ofono to 1.3 and the v1.3 ofono depends on mobile-broadband-provider-info.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
 .../ofono/{ofono_1.0.bb => ofono_1.3.bb}           |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.0.bb => ofono_1.3.bb} (66%)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index bf6f6a5..f6cd895 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 inherit autotools pkgconfig update-rc.d
 
-DEPENDS  = "dbus glib-2.0 udev ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
+DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.0.bb b/meta/recipes-connectivity/ofono/ofono_1.3.bb
similarity index 66%
rename from meta/recipes-connectivity/ofono/ofono_1.0.bb
rename to meta/recipes-connectivity/ofono/ofono_1.3.bb
index 276efdb..ed664a2 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.0.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.3.bb
@@ -10,5 +10,5 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
 "
 
-SRC_URI[md5sum] = "09a36c923c8c0f491899aa7eebe92193"
-SRC_URI[sha256sum] = "7733e1628fac6ef4d8aa3e536a5c284c3ba8e76277fc7e28b7e146c3c5ddebfa"
+SRC_URI[md5sum] = "dbe381b739c0e7830e6c075f81c8e168"
+SRC_URI[sha256sum] = "02a9f1f7c1b8eeb8868290d119fe5dc90b0b5c0b6199bed5293dc06a8bf7ebeb"
-- 
1.7.6



