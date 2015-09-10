Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0BD76EBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 14:26:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 10 Sep 2015 07:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,505,1437462000"; d="scan'208";a="766298265"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2015 07:26:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 22E626A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:25:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 17:26:33 +0300
Message-Id: <7ce9204b58f1217354e3d35b706fde7fb26a807b.1441889095.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441889095.git.ed.bartosh@linux.intel.com>
References: <cover.1441889095.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441889095.git.ed.bartosh@linux.intel.com>
References: <cover.1441889095.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/3] wic: use ext4 in wic-image-minimal.wks
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
X-List-Received-Date: Thu, 10 Sep 2015 14:26:42 -0000

ext4 is used in canned wks files, so let's use it here too
for the sake of consistency.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 29cd8f2..8f9be09 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -3,8 +3,8 @@
 # created from core-image-minimal and wic-image-minimal image recipes.
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext2 --label platform --align 1024
-part /core --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext2 --label core --align 1024
-part /backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext2 --label backup --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+part /core --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
+part /backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label backup --align 1024
 
 bootloader  --timeout=0  --append="rootwait console=tty0"
-- 
2.1.4


