Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09CA4757B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:56:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2015 08:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="704019178"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2015 08:56:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9826C6A4005;
	Tue,  2 Jun 2015 08:55:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:02:04 +0300
Message-Id: <1433253725-14089-7-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 6/7] wic: create directdisk-gpt.wks
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
X-List-Received-Date: Tue, 02 Jun 2015 15:56:02 -0000

directdisk-gpt is the same as directdisk with only one difference:
it uses GPT partition table.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

 create mode 100644 scripts/lib/image/canned-wks/directdisk-gpt.wks

diff --git a/scripts/lib/image/canned-wks/directdisk-gpt.wks b/scripts/lib/image/canned-wks/directdisk-gpt.wks
new file mode 100644
index 0000000..76fda1f
--- /dev/null
+++ b/scripts/lib/image/canned-wks/directdisk-gpt.wks
@@ -0,0 +1,10 @@
+# short-description: Create a 'pcbios' direct disk image
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly dd to boot media.
+
+
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+
+bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+
-- 
2.1.4


