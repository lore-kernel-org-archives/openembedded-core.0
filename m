Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4938C77D4C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:54:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 03:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,322,1496127600"; d="scan'208";a="876375120"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2017 03:54:27 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 20:43:49 -0700
Message-Id: <f83b470f8c5628fea545a528b284acdee15e292d.1499394173.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499394173.git.swee.aun.khor@intel.com>
References: <cover.1499394173.git.swee.aun.khor@intel.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 10:54:27 -0000

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


