Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFz-0003uu-3v
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:21 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:42 -0700
Message-Id: <6120cf003d616b12d150a49938dc7073b909d59e.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 13/30] usbutils: Update to 0.91
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
X-List-Received-Date: Wed, 18 May 2011 22:30:20 -0000

Also move the upstream location to kernel.org

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{usbutils_0.86.bb => usbutils_0.91.bb}         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_0.86.bb => usbutils_0.91.bb} (91%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_0.86.bb b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
similarity index 91%
rename from meta/recipes-bsp/usbutils/usbutils_0.86.bb
rename to meta/recipes-bsp/usbutils/usbutils_0.91.bb
index 239de24..db04253 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.86.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
@@ -11,7 +11,7 @@ DEPENDS = "libusb zlib"
 RDEPENDS_${PN} = "${PN}-ids"
 PR = "r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/linux-usb/usbutils-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "34979f675d2bcb3e1b45012fa830a53f"
 SRC_URI[sha256sum] = "b3b2bea6d2cd87660c8201a47071bf2a9889d8ed90c7203cc768b597799c12f4"
-- 
1.7.3.4



