Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DFB96780DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 14:18:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 07 Sep 2017 07:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,358,1500966000"; d="scan'208";a="1215940127"
Received: from swold-mobl2.jf.intel.com ([10.24.10.46])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2017 07:18:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  7 Sep 2017 07:18:21 -0700
Message-Id: <20170907141821.30957-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] linux-yocto: Make LINUX_VERSION_EXTENSION weaker
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
X-List-Received-Date: Thu, 07 Sep 2017 14:18:21 -0000

This allows for other layers to override this variable in addition
to providing the distro or local.conf to override it.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index aec06c2427d..1b8ffd0c17e 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -49,7 +49,7 @@ KCONF_AUDIT_LEVEL ?= "1"
 KCONF_BSP_AUDIT_LEVEL ?= "0"
 KMETA_AUDIT ?= "yes"
 
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
+LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 
 # Pick up shared functions
 inherit kernel
-- 
2.13.5


