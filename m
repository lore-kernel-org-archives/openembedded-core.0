Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DAB7C756C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:10:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Sep 2015 14:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="812638119"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2015 14:10:34 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 16:10:24 -0500
Message-Id: <5bbafaabb339559f9746aa81c3a3d7a53b3d8fda.1443128706.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
References: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
References: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH V3 1/3] core-image-minimal-initramfs: replace dependency
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
X-List-Received-Date: Thu, 24 Sep 2015 21:10:40 -0000

This recipe have a hardcoded dependency to busybox, in order to be able to have a flexible selection,
instead of the hardcoded dependency,now is point to virtual reference.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 1f0fa95..e2936ee 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
 
-PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi virtual/anybox udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
2.1.0


