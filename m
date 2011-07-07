Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qey6k-0002V8-Dw
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:35:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 16:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="22846281"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.236])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 16:31:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:31:38 -0700
Message-Id: <5058763548021532f1b569c63fefd996c4748c1d.1310081443.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
Subject: [PATCH 6/8] usbutils: Add RDEPENDS on bash
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
X-List-Received-Date: Thu, 07 Jul 2011 23:35:46 -0000

[YOCTO #1214]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/usbutils/usbutils_0.91.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
index 5d605c5..c5420d0 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
@@ -7,8 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb zlib"
-RDEPENDS_${PN} = "${PN}-ids"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz"
 
@@ -26,3 +25,5 @@ do_install_append() {
 PACKAGES += "${PN}-ids"
 FILES_${PN} += "${datadir}/pkgconfig"
 FILES_${PN}-ids = "${datadir}/usb*"
+
+RDEPENDS_${PN} = "${PN}-ids bash"
-- 
1.7.3.4



