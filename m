Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D69F06018C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 01:02:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jun 2016 18:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,453,1459839600"; d="scan'208";a="985196399"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2016 18:02:57 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 18:04:47 -0700
Message-Id: <1465607087-80595-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: saul.wold@intel.com
Subject: [PATCH] systemd-boot: Set COMPATIBLE_HOST in recipe
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
X-List-Received-Date: Sat, 11 Jun 2016 01:02:57 -0000

We apply the same setting in the existing gummiboot to
COMPATIBLE_HOST, so that it properly stops build for
unsupported architectures.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 meta/recipes-bsp/systemd-boot/systemd-boot.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot.bb b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
index 87e9871..0dc0fa3 100644
--- a/meta/recipes-bsp/systemd-boot/systemd-boot.bb
+++ b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
@@ -14,6 +14,7 @@ EXTRA_OECONF = " --enable-gnuefi \
 
 # Imported from gummiboot recipe
 TUNE_CCARGS_remove = "-mfpmath=sse"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
 
 do_compile() {
 	SYSTEMD_BOOT_EFI_ARCH="ia32"
-- 
2.7.4


