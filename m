Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2587E6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:29:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2016 14:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,353,1464678000"; d="scan'208";a="138057031"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.159])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2016 14:29:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 16:29:48 -0500
Message-Id: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/3] linux-yocto: Enable debug/printk.scc KERNEL_FEATURE on qemuall machines.
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
X-List-Received-Date: Tue, 12 Jul 2016 21:29:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are experimenting some issues in the Autobuilder infraestructure
possible due to high I/O loads, in order to provide more information
about intervals of times in printk enable by default debug/printk.scc
on qemu development images.

[YOCTO #9299]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0af9f8c..98a48ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -17,6 +17,8 @@ DEPENDS_append_nios2 = " libgcc"
 KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
+KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.1.4


