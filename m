Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwrYb-0002kx-MR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:19:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Aug 2012 02:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="201329320"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2012 02:07:05 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 12:08:50 +0300
Message-Id: <1343898530-11885-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] usbutils: Upgrade usbutils to upstream v002
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
X-List-Received-Date: Thu, 02 Aug 2012 09:19:01 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../usbutils/{usbutils_0.91.bb => usbutils_002.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_0.91.bb => usbutils_002.bb} (80%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_002.bb
similarity index 80%
rename from meta/recipes-bsp/usbutils/usbutils_0.91.bb
rename to meta/recipes-bsp/usbutils/usbutils_002.bb
index abe807c..c546acd 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_002.bb
@@ -7,19 +7,18 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb zlib"
-PR = "r5"
+PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
            file://Fix-NULL-pointer-crash.patch"
 
-SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"
-SRC_URI[sha256sum] = "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
+SRC_URI[md5sum] = "82decd82811458f0740cf2f715267d4d"
+SRC_URI[sha256sum] = "d75e4f26ee6fa2f94712edf124456cc409d00934c57771d41ccd5febf4538933"
 
 inherit autotools
 
 do_install_append() {
-	ln -s ../sbin/lsusb ${D}${bindir}/lsusb
 	# We only need the compressed copy, remove the uncompressed version
 	rm -f ${D}${datadir}/usb.ids
 }
-- 
1.7.9.5



