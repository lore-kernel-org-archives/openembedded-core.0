Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 87952606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 06:55:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 06 Oct 2016 23:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,308,1473145200"; d="scan'208";a="1067304755"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2016 23:55:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id A55496A4080;
	Thu,  6 Oct 2016 23:55:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2016 09:30:09 +0300
Message-Id: <1475821809-12173-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] mkgummidisk.wks: update kernel command line
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
X-List-Received-Date: Fri, 07 Oct 2016 06:55:31 -0000

Used ttyS0 console.
Removed usage of ttyPCH0 (FRI2 leftover)
Decreased bootloader timeout to 5 seconds
Removed 'vmalloc=256MB snd-hda-intel.enable_msi=0' as it's not
needed for any of reference BSPs.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/mkgummidisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/mkgummidisk.wks b/scripts/lib/wic/canned-wks/mkgummidisk.wks
index 66a22f6..616d3ce 100644
--- a/scripts/lib/wic/canned-wks/mkgummidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkgummidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader  --timeout=10  --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
+bootloader  --timeout=5  --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
2.1.4


