Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16192759F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:07:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 01:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,624,1427785200"; d="scan'208";a="711766001"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2015 01:07:44 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 873B46A4005;
	Tue, 16 Jun 2015 01:07:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 09:13:45 +0300
Message-Id: <1434435234-4892-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2 02/11] initramfs-live-install: Add blkid to initramfs
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
X-List-Received-Date: Tue, 16 Jun 2015 08:07:49 -0000

Added util-linux-blkid to the list of dependencies of
initramfs-live-install and initramfs-live-install-efi.

This is a part of the work to support partiion UUID in installer.
blkid is going to be used to get partition and filesystem UUIDs.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index b0994d7..32c1fce 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -5,7 +5,7 @@ SRC_URI = "file://init-install-efi.sh"
 
 PR = "r1"
 
-RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
+RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 6241a90..88b3b30 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -7,7 +7,7 @@ PR = "r9"
 
 S = "${WORKDIR}"
 
-RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
+RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
-- 
2.1.4


