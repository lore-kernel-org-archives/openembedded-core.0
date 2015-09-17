Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 45FB877020
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2015 09:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,548,1437462000"; d="scan'208";a="807392998"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2015 09:20:24 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 11:20:15 -0500
Message-Id: <d6fe2afa0c925476905ba22781f1c1a057b403d6.1442503745.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <dc1b328b4e41695df96acac6ba73620a535d2ee1.1442503745.git.alejandro.joya.cruz@intel.com>
References: <dc1b328b4e41695df96acac6ba73620a535d2ee1.1442503745.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
References: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH 2/3] initramfs-framework: overwrite hardcoded dependency to virtual reference
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
X-List-Received-Date: Thu, 17 Sep 2015 16:20:24 -0000

This recipe have a hardcoded dependency to busybox, in order to be able to have a flexible selection,
instead of the hardcoded dependency,now is point to virtual reference anybox.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6c37b9a..0704cb1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS_${PN} += "busybox"
+RDEPENDS_${PN} += "virtual/anybox"
 
 PR = "r2"
 
-- 
2.1.0


