Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F41AF772DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:43:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2016 09:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="875310306"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 09:43:34 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 329E46A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:31:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 17:32:48 +0200
Message-Id: <7363167c309a5d9b0ea56e74e2cb4185f594f05a.1454426922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 08/14] wic-image-minimal: change IMAGE_FSTYPES
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
X-List-Received-Date: Tue, 02 Feb 2016 17:43:37 -0000

Replaced wic.bz2 -> wic in IMAGE_FSTYPES.

wic-image-minimal is going to be booted in qemu and tested.
As runqemu doesn't support compressed images this recipe needs
to produce raw wic image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 95c7a9b..ced22c8 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -4,7 +4,7 @@ SRC_URI = "file://${FILE_DIRNAME}/${BPN}.wks"
 
 IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 
-IMAGE_FSTYPES = "wic.bz2"
+IMAGE_FSTYPES = "wic"
 RM_OLD_IMAGE = "1"
 
 DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native"
-- 
2.1.4


