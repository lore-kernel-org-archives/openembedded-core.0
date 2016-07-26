Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCB7606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 23:37:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 26 Jul 2016 16:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,427,1464678000"; d="scan'208";a="740187333"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 16:37:18 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 16:39:20 -0700
Message-Id: <1469576360-214657-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: rename and amend systemd-boot wks file
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
X-List-Received-Date: Tue, 26 Jul 2016 23:37:41 -0000

Rename wks for systemd-boot per the suggestion from community.
Also amend description to distinguish it from others when
running "wic list images".

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 .../wic/canned-wks/{mksystemd-bootdisk.wks => systemd-bootdisk.wks}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename scripts/lib/wic/canned-wks/{mksystemd-bootdisk.wks => systemd-bootdisk.wks} (77%)

diff --git a/scripts/lib/wic/canned-wks/mksystemd-bootdisk.wks b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
similarity index 77%
rename from scripts/lib/wic/canned-wks/mksystemd-bootdisk.wks
rename to scripts/lib/wic/canned-wks/systemd-bootdisk.wks
index df706e8..d80189b 100644
--- a/scripts/lib/wic/canned-wks/mksystemd-bootdisk.wks
+++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
@@ -1,6 +1,6 @@
-# short-description: Create an EFI disk image
+# short-description: Create an EFI disk image with systemd-boot
 # long-description: Creates a partitioned EFI disk image that the user
-# can directly dd to boot media.
+# can directly dd to boot media. The selected bootloader is systemd-boot.
 
 part /boot --source bootimg-efi --sourceparams="loader=systemd-boot" --ondisk sda --label msdos --active --align 1024
 
-- 
2.7.4


