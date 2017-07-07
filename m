Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 045F677DCA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 15:16:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 07 Jul 2017 08:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,323,1496127600"; d="scan'208";a="990415830"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 07 Jul 2017 08:16:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B61EF5803BE;
	Fri,  7 Jul 2017 08:16:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jul 2017 18:03:45 +0300
Message-Id: <1499439825-7812-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image_types: fix squashfs-lzo and squashfs-xz builds
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
X-List-Received-Date: Fri, 07 Jul 2017 15:16:12 -0000

Dependencies required for squashfs-lzo and squashfs-xz image builds were
assigned to do_image_squashfs-lzo and do_image_squashfs-xz. As these
tasks don't exist the dependencies were not installed and builds
were failing.

Correct task names for these image types are: do_image_squashfs_lzo and
do_image_squashfs_xz because '-' and '.' are replaced by '_' in all
do_image* task names.

[YOCTO #11760]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index a5f7e19..859a229 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -233,8 +233,8 @@ do_image_ext3[depends] += "e2fsprogs-native:do_populate_sysroot"
 do_image_ext4[depends] += "e2fsprogs-native:do_populate_sysroot"
 do_image_btrfs[depends] += "btrfs-tools-native:do_populate_sysroot"
 do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
-do_image_squashfs-xz[depends] += "squashfs-tools-native:do_populate_sysroot"
-do_image_squashfs-lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
+do_image_squashfs_xz[depends] += "squashfs-tools-native:do_populate_sysroot"
+do_image_squashfs_lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_elf[depends] += "virtual/kernel-native:do_populate_sysroot mkelfimage-native:do_populate_sysroot"
 do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
-- 
2.1.4


