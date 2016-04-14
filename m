Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 46603605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 20:53:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 14 Apr 2016 13:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,485,1455004800"; d="scan'208";a="785112891"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga003.jf.intel.com with ESMTP; 14 Apr 2016 13:53:34 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 13:53:27 -0700
Message-Id: <1460667207-24797-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] zero out the rootfs_extra_space in initramfs images
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
X-List-Received-Date: Thu, 14 Apr 2016 20:53:38 -0000

Setting IMAGE_ROOTFS_EXTRA_SPACE impacts the initramfs images, results
in an error about INITRAMFS_MAXSIZE.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 1 +
 meta/recipes-extended/images/core-image-testmaster-initramfs.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index a26286e..8d7c0d2 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -17,5 +17,6 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
 BAD_RECOMMENDATIONS += "busybox-syslog"
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
index 563260d..ad1407c 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -16,4 +16,5 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
 BAD_RECOMMENDATIONS += "busybox-syslog"
-- 
2.8.0


