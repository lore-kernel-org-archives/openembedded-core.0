Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 15AA678656
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 17:42:01 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2017 09:41:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,375,1505804400"; d="scan'208";a="148354364"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.182.183])
	by orsmga004.jf.intel.com with ESMTP; 10 Nov 2017 09:41:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 10 Nov 2017 09:41:32 -0800
Message-Id: <20171110174132.5812-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] linux-firmware: Remove iwlwifi-8000C-19 SRC_URI
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
X-List-Received-Date: Fri, 10 Nov 2017 17:42:02 -0000

Since it's been removed from the upstream repo and not fetchable
remove it here.  The newer firmware supports the device correctly.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 020c8579f8c..4828b6effb1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -184,11 +184,6 @@ PV = "0.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-# Some devices need a specific version, not the latest
-SRC_URI += "https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/linux-firmware.git/plain/iwlwifi-8000C-19.ucode;name=iwlwifi-19"
-
-SRC_URI[iwlwifi-19.md5sum] = "132fbaee36beec5e98714f0bd66f7a1d"
-SRC_URI[iwlwifi-19.sha256sum] = "2034470df64d323b827c4f2d4d0d55be2846b7360179b5574aa28ff77b6c9471"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
@@ -223,9 +218,6 @@ do_install() {
 
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
 	( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
-
-        # Copy the iwlwifi ucode
-        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}${nonarch_base_libdir}/firmware/
 }
 
 
-- 
2.13.5


