Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEEF7880B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914612"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:15 -0800
Message-Id: <20180226201216.33204-16-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 15/16] packagegroup-core-boot: add kernel for EFI systems
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
X-List-Received-Date: Mon, 26 Feb 2018 20:12:31 -0000

Previously this wasn't needed because the kernel was added at image
creation time to the boot partition. Now that the boot partition is
created from the /boot/ partition of the rootfs, it needs to be
installed there.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 0fcb8ba9193..76cd7fc4ebf 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -37,7 +37,7 @@ RDEPENDS_${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
-- 
2.14.3


