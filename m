Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76964707AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:03:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 12:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,711,1400050800"; d="scan'208";a="573794773"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 12:02:44 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 14:02:40 -0500
Message-Id: <c870535e8d1001cfdde3da2cb1703011b51b0b8c.1406054327.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <0fd2a015fbbbfb2073e65154369bee2992b0d4b2.1406054327.git.tom.zanussi@linux.intel.com>
References: <0fd2a015fbbbfb2073e65154369bee2992b0d4b2.1406054327.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1406054327.git.tom.zanussi@linux.intel.com>
References: <cover.1406054327.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [for-daisy][PATCH 2/2] wic: Remove fstype from mkefidisk canned wks
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
X-List-Received-Date: Tue, 22 Jul 2014 19:03:35 -0000

The bootimg-efi plugin specifies the fstype internally, so remove it
from the partition definition.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/canned-wks/mkefidisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/image/canned-wks/mkefidisk.wks
index e976bc8..db86caa 100644
--- a/scripts/lib/image/canned-wks/mkefidisk.wks
+++ b/scripts/lib/image/canned-wks/mkefidisk.wks
@@ -2,7 +2,7 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
 
-part /boot --source bootimg-efi --ondisk sda --fstype=msdos --label msdos --active --align 1024
+part /boot --source bootimg-efi --ondisk sda --label msdos --active --align 1024
 
 part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
-- 
1.8.3.1


