Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ud2of-0000so-1M
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 20:22:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2013 11:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,685,1363158000"; d="scan'208";a="242589285"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.48])
	by AZSMGA002.ch.intel.com with ESMTP; 16 May 2013 11:03:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 21:03:07 +0300
Message-Id: <d6eee18389b28817d98ba2bd55eb89768be3a0a8.1368727195.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1368727195.git.sgw@linux.intel.com>
References: <cover.1368727195.git.sgw@linux.intel.com>
In-Reply-To: <cover.1368727195.git.sgw@linux.intel.com>
References: <cover.1368727195.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] initrdscripts: Not let PR go backwards after revert
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 18:22:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb | 2 +-
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 8ad47d4..264931f 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install-efi.sh"
 
-PR = "r0"
+PR = "r1"
 
 RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 0f80f0e..3a8836d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-PR = "r8"
+PR = "r9"
 
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
 
-- 
1.8.0.2



