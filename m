Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8460E75799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 10:56:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2015 03:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,487,1432623600"; d="scan'208";a="765568308"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2015 03:56:37 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 13:56:45 +0300
Message-Id: <167fd22b6f87d9639c4f36e0efb5eaec83d2bb3b.1437043973.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1437043973.git.cristian.iorga@intel.com>
References: <cover.1437043973.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1437043973.git.cristian.iorga@intel.com>
References: <cover.1437043973.git.cristian.iorga@intel.com>
Subject: [PATCH v3 3/3] bitbake.conf: fix qemu user mode linux for qemuarm64
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
X-List-Received-Date: Thu, 16 Jul 2015 10:56:38 -0000

OLDEST_KERNEL is invalid for aarch64, it didn't exist
back in our current version. Use a more recent version
for aarch64 to allow user mode qemu to work correctly.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ee75c9b..730ab80 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -397,6 +397,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 ##################################################################
 
 OLDEST_KERNEL = "2.6.32"
+OLDEST_KERNEL_aarch64 = "3.14"
 STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
 STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
 
-- 
2.1.4


