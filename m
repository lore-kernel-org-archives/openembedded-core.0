Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B1BA77404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:09:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 14:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="564474591"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2015 14:09:10 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 16:09:01 -0500
Message-Id: <1de7a63f37e433ea0fb2628aa265abe01569a405.1442610201.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
References: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
References: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH V2 1/3] core-mage-minimal-initramfs: replace dependency
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
X-List-Received-Date: Fri, 18 Sep 2015 21:09:13 -0000

This recipe have a hardcoded dependency to busybox, in order to be able to have a flexible selection,
instead of the hardcoded dependency,now is point to virtual reference.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 1f0fa95..50eca53 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
 
-PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi virtual/base-utils udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
2.1.0


