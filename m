Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 49ABB77FED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 07:16:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 00:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="883305070"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2017 00:16:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1D308580941;
	Thu, 27 Jul 2017 00:16:45 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 09:54:04 +0300
Message-Id: <1501138444-14823-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic-tools: add dependency to e2fsprogs-native
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
X-List-Received-Date: Thu, 27 Jul 2017 07:16:48 -0000

Added e2fsprogs-native to the list of dependencies for wic-tools
as all fs-related utilities have to be in this list.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-core/meta/wic-tools.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index d908e48..428befe 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 DEPENDS = "\
            parted-native syslinux-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-efi-native cdrtools-native \
-           btrfs-tools-native squashfs-tools-native pseudo-native \
+           btrfs-tools-native squashfs-tools-native pseudo-native e2fsprogs-native \
            "
 DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
-- 
2.1.4


