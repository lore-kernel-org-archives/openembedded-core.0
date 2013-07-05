Return-Path: <radu.moisan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E2FC26B05B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 14:46:13 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2013 07:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1002,1363158000"; d="scan'208";a="264483380"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jul 2013 07:46:14 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 17:47:54 +0300
Message-Id: <3688a1eb962a71b76160ba6be2c3d0cd05da167f.1373035497.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373035496.git.radu.moisan@intel.com>
References: <cover.1373035496.git.radu.moisan@intel.com>
In-Reply-To: <cover.1373035496.git.radu.moisan@intel.com>
References: <cover.1373035496.git.radu.moisan@intel.com>
Subject: [PATCH 9/9] usbutils: Upgrade to v007
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 14:46:14 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../usbutils/{usbutils_006.bb => usbutils_007.bb}  |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_006.bb => usbutils_007.bb} (83%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_006.bb b/meta/recipes-bsp/usbutils/usbutils_007.bb
similarity index 83%
rename from meta/recipes-bsp/usbutils/usbutils_006.bb
rename to meta/recipes-bsp/usbutils/usbutils_007.bb
index c1c9fc0..45f829f 100644
--- a/meta/recipes-bsp/usbutils/usbutils_006.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_007.bb
@@ -7,14 +7,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb zlib"
-PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
            file://Fix-NULL-pointer-crash.patch"
 
-SRC_URI[md5sum] = "850790442f5eb487cdc7e35f8ee03e11"
-SRC_URI[sha256sum] = "553270b4030f0844cb70aed57e61c7f10a7ed6641c3bed20249201cec9bcf122"
+SRC_URI[md5sum] = "be6c42294be5c940f208190d3479d50c"
+SRC_URI[sha256sum] = "e65c234cadf7c81b6b1567c440e3b9b31b44f51c27df3e45741b88848d8b37d3"
 
 inherit autotools
 
-- 
1.7.9.5


