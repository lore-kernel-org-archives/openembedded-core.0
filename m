Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8103A7D719
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 07:11:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2019 00:11:55 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 00:11:55 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 14:41:01 +0800
Message-Id: <1557297662-16300-4-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
References: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 3/4] wic: add new wic-installer.wks for wic based image installer
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
X-List-Received-Date: Wed, 08 May 2019 07:11:54 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/canned-wks/wic-installer.wks.in | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 scripts/lib/wic/canned-wks/wic-installer.wks.in

diff --git a/scripts/lib/wic/canned-wks/wic-installer.wks.in b/scripts/lib/wic/canned-wks/wic-installer.wks.in
new file mode 100644
index 0000000..a7b018d
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/wic-installer.wks.in
@@ -0,0 +1,7 @@
+# description: Create wic installable image
+
+part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,title=install,label=install-efi,initrd=${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}" --ondisk sda --label install --active --align 1024 --use-uuid
+
+part / --source installer-partition --ondisk sda --fstype=ext4 --label image --use-uuid
+
+bootloader --ptable gpt --timeout=5 --append="rootwait console=ttyS0,115200 console=tty0"
-- 
2.7.4


