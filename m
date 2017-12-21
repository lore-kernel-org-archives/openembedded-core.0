Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C49D77867B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:56:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 16:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; 
   d="scan'208";a="4472568"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 20 Dec 2017 16:56:41 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:56:33 -0800
Message-Id: <20171221005637.34163-3-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171221005637.34163-1-california.l.sullivan@intel.com>
References: <20171221005637.34163-1-california.l.sullivan@intel.com>
Cc: akuster@mvista.com
Subject: [rocko][PATCH 2/6] initramfs-module-install-efi: update summary
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
X-List-Received-Date: Thu, 21 Dec 2017 00:56:39 -0000

Note that this is an installation option for EFI systems.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 366ddd22245a72df4c8e561761c6df8a6654bba6)
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 3d8c9e7ebb..24b53a8498 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "initramfs-framework module for installation option"
+SUMMARY = "initramfs-framework module for EFI installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
-- 
2.14.3


