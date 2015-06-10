Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2B839609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 16:59:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2015 09:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="708687638"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2015 09:59:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 08A7F6A4005;
	Wed, 10 Jun 2015 09:58:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 18:05:48 +0300
Message-Id: <1433948748-3606-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] initramfs-live-install: Add gptdisk to initramfs
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
X-List-Received-Date: Wed, 10 Jun 2015 16:59:32 -0000

This is a part of the work to support partiion UUID in installer.
gptdisk is going to be used to get partition UUID.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb | 2 +-
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index b0994d7..f98ce25 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -5,7 +5,7 @@ SRC_URI = "file://init-install-efi.sh"
 
 PR = "r1"
 
-RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
+RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools gptfdisk"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 6241a90..bf24364 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -7,7 +7,7 @@ PR = "r9"
 
 S = "${WORKDIR}"
 
-RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
+RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs gptfdisk"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
-- 
2.1.4


