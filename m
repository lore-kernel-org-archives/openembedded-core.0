Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A1AD178327
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:00:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 11:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,429,1505804400"; d="scan'208";a="151540686"
Received: from swold-mobl2.jf.intel.com ([10.24.10.203])
	by orsmga004.jf.intel.com with ESMTP; 20 Nov 2017 11:00:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 20 Nov 2017 11:00:28 -0800
Message-Id: <20171120190028.24015-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH][morty] gnu-efi: Fix missing space in _append line
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
X-List-Received-Date: Mon, 20 Nov 2017 19:00:28 -0000

[YOCTO #12366]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---

This is only in Morty, so no master then backport option

 common/recipes-bsp/gnu-efi/gnu-efi_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/recipes-bsp/gnu-efi/gnu-efi_%.bbappend b/common/recipes-bsp/gnu-efi/gnu-efi_%.bbappend
index 1e9cfda..da08432 100644
--- a/common/recipes-bsp/gnu-efi/gnu-efi_%.bbappend
+++ b/common/recipes-bsp/gnu-efi/gnu-efi_%.bbappend
@@ -1,3 +1,3 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/gnu-efi:"
-SRC_URI_append_intel-x86-common = "file://0001-Add-GUID-for-SMBIOS-3-entry-point-structure.patch"
+SRC_URI_append_intel-x86-common = " file://0001-Add-GUID-for-SMBIOS-3-entry-point-structure.patch"
 PACKAGE_ARCH_intel-x86-common = "${INTEL_COMMON_PACKAGE_ARCH}"
-- 
2.13.5


