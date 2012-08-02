Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwuK1-0006ti-Lq
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 14:16:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2012 05:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176147496"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 02 Aug 2012 05:04:28 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 15:06:13 +0300
Message-Id: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 12:16:09 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../usbutils/{usbutils_0.91.bb => usbutils_006.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_0.91.bb => usbutils_006.bb} (80%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_006.bb
similarity index 80%
rename from meta/recipes-bsp/usbutils/usbutils_0.91.bb
rename to meta/recipes-bsp/usbutils/usbutils_006.bb
index abe807c..c1c9fc0 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_006.bb
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
+SRC_URI[md5sum] = "850790442f5eb487cdc7e35f8ee03e11"
+SRC_URI[sha256sum] = "553270b4030f0844cb70aed57e61c7f10a7ed6641c3bed20249201cec9bcf122"
 
 inherit autotools
 
 do_install_append() {
-	ln -s ../sbin/lsusb ${D}${bindir}/lsusb
 	# We only need the compressed copy, remove the uncompressed version
 	rm -f ${D}${datadir}/usb.ids
 }
-- 
1.7.9.5



