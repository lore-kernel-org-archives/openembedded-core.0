Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2843A6FF72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:59:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 06 Oct 2016 03:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="887303616"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Oct 2016 04:00:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 296B76A4006;
	Thu,  6 Oct 2016 03:59:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 13:33:38 +0300
Message-Id: <0b7e31bc46a0744f34b27711915f0700e2ea20c0.1475749929.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
Cc: Saul Wold <saul.wold@intel.com>
Subject: [wic][PATCH 4/4] mkefidisk.wks: use MSDOS partition table
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
X-List-Received-Date: Thu, 06 Oct 2016 10:59:58 -0000

Stopped using GPT partition table in mkefidisk.wks as it's not
supported by all reference hardware.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/mkefidisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 73886ab..668ca92 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader --ptable gpt --timeout=10 --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
+bootloader --timeout=10 --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
-- 
2.1.4


