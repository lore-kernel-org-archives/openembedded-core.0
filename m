Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A291E7582E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:11:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jun 2015 02:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="721242687"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2015 02:11:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3E3996A4083;
	Fri,  5 Jun 2015 02:10:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:17:14 +0300
Message-Id: <1433488636-4540-8-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 7/9] wic: Use partition UUID in directdisk-gpt
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
X-List-Received-Date: Fri, 05 Jun 2015 09:11:05 -0000

Used --use-uuid option for root partition in directdisk-gpt.wks
This is useful to have example of image with UUID support.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/canned-wks/directdisk-gpt.wks b/scripts/lib/image/canned-wks/directdisk-gpt.wks
index 76fda1f..2355259 100644
--- a/scripts/lib/image/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/image/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024 --use-uuid
 
 bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
 
-- 
2.1.4


