Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BB83077A50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490704985; x=1522240985;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bLI/gHTN1PxU7ka1MPyQEu2U4/ZYZsA5rsHd7BpsWk8=;
	b=BsY+DxeDo8PKnxpcRgX1SRGe6auCHcZ9bmbI00F5xissev8vyh9GShbQ
	kwWM/iITE888megafbgy0Tp6QipgTQ==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="81858478"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2017 05:43:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BA1656A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:42:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:40:58 +0300
Message-Id: <4edfb7a785fb0a2b1e401ed3aec18a547e4c74d7.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/9] wic-tools: add btrfs-tools squashfs-tools to DEPENDS
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:03 -0000

Added btrfs-tools-native and squashfs-tools-native to DEPENDS as
wic uses these tools to support btrfs and squashfs filesystems.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-core/meta/wic-tools.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index bd4319a..cd494ec 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -2,7 +2,11 @@ SUMMARY = "A meta recipe to build native tools used by wic."
 
 LICENSE = "MIT"
 
-DEPENDS = "parted-native syslinux-native gptfdisk-native dosfstools-native mtools-native bmap-tools-native grub-efi-native cdrtools-native"
+DEPENDS = "\
+           parted-native syslinux-native gptfdisk-native dosfstools-native \
+           mtools-native bmap-tools-native grub-efi-native cdrtools-native \
+           btrfs-tools-native squashfs-tools-native \
+           "
 DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
 
-- 
2.1.4


