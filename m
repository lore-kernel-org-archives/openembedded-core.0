Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C16CD60068
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:17:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Jul 2017 08:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="1169131230"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2017 08:17:07 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 08:17:05 -0700
Message-Id: <20170706151705.9899-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] image_types: fix kernel target on elf's image dependencies
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
X-List-Received-Date: Thu, 06 Jul 2017 15:17:07 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Kernel recipes provides 'virtual/kernel' so remove the native part.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index a5f7e19dfe8..92e0f2c6d68 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -235,7 +235,7 @@ do_image_btrfs[depends] += "btrfs-tools-native:do_populate_sysroot"
 do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs-xz[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs-lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
-do_image_elf[depends] += "virtual/kernel-native:do_populate_sysroot mkelfimage-native:do_populate_sysroot"
+do_image_elf[depends] += "virtual/kernel:do_populate_sysroot mkelfimage-native:do_populate_sysroot"
 do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
-- 
2.12.0


