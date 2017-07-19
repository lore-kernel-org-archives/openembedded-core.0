Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0B88F78242
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 13:21:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 06:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="994712728"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 06:21:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 16:19:13 +0300
Message-Id: <d92def44edfc648ab9b186dc919453a9e6ed6432.1500470150.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/5] u-boot: Upgrade to 2017.07 release
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
X-List-Received-Date: Wed, 19 Jul 2017 13:21:47 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

This patch upgrades the U-Boot to the 2017.07 release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
similarity index 88%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
index 0e52f27df8c..f27989daa17 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
+SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.05.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.07.bb
-- 
2.13.2


