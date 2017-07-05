Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB14771EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:07:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="1148285525"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 00:07:17 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 16:56:34 -0700
Message-Id: <f7a8d29c06e3b41c3ff59856bf0449b2c2e214ef.1499127835.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499127835.git.swee.aun.khor@intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
Subject: [PATCH 3/7] gnu-efi: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 07:07:17 -0000

From: sweeaun <swee.aun.khor@intel.com>

To build 64-bit binaries for musl-x32.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
index d6f9f53..7346737 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
@@ -53,6 +53,7 @@ FILES_${PN} += "${libdir}/*.lds"
 
 # 64-bit binaries are expected for EFI when targeting X32
 INSANE_SKIP_${PN}-dev_append_linux-gnux32 = " arch"
+INSANE_SKIP_${PN}-dev_append_linux-muslx32 = " arch"
 
 BBCLASSEXTEND = "native"
 
-- 
2.7.4


