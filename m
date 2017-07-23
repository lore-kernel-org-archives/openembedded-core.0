Return-Path: <wei.tee.ng@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6AC77EFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:03:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 24 Jul 2017 00:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,405,1496127600"; d="scan'208";a="1175799865"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2017 00:03:07 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 16:51:57 -0700
Message-Id: <7845bc41803435479389182bed1dfb5d410df24a.1500848692.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1500848692.git.wei.tee.ng@intel.com>
References: <cover.1500848692.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [PATCH 3/3] core-image-minimal-initramfs: use initramfs-framework by default
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
X-List-Received-Date: Mon, 24 Jul 2017 07:03:16 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Use the initramfs-framework for initialization by default due to
the modularity and expansibility.

[YOCTO #10987]

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 5794a25..c1f2855 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
 
-PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "initramfs-framework-base initramfs-module-udev initramfs-module-setup-live initramfs-module-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
2.7.4


