Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D6F5C75F1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:32:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2015 06:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="747783147"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2015 06:32:14 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 16:32:27 +0300
Message-Id: <8d629325268890527a2a939bbafe80e4abb0a1fb.1436966967.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436966967.git.cristian.iorga@intel.com>
References: <cover.1436966967.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1436966967.git.cristian.iorga@intel.com>
References: <cover.1436966967.git.cristian.iorga@intel.com>
Subject: [PATCH v2 3/3] bitbake.conf: fix qemu user mode linux for qemuarm64
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
X-List-Received-Date: Wed, 15 Jul 2015 13:32:15 -0000

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


