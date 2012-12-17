Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkX1s-00046J-7V
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:30:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 01:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,299,1355126400"; d="scan'208";a="265311004"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 01:15:52 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:16:21 +0200
Message-Id: <5cb57a8114f39d051ba52610da47ea444ca93dec.1355732782.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
Subject: [PATCH 5/7] bluez: set correct udevdir
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
X-List-Received-Date: Mon, 17 Dec 2012 09:30:40 -0000

Fix the following warning:
WARNING: QA Issue: bluez4: Files/directories were installed but not shipped
  /lib/udev/hid2hci
  /lib/udev/.debug
  /lib/udev/.debug/hid2hci

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index f1a2fe7..8f5fa9d 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch"
@@ -22,7 +22,7 @@ ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
@@ -31,5 +31,5 @@ FILES_${PN}-dev += "\
 FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
-  ${base_libdir}/udev/.debug \
+  ${nonarch_base_libdir}/udev/.debug \
   "
-- 
1.7.11.7



