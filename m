Return-Path: <swee.aun.khor@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 98978700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 02:10:06 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 19:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,352,1491289200"; d="scan'208";a="88200375"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga004.jf.intel.com with ESMTP; 16 May 2017 19:10:07 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 11:59:12 -0700
Message-Id: <1494961152-150654-1-git-send-email-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-yocto: Use ??= to set LINUX_VERSION_EXTENSION
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
X-List-Received-Date: Wed, 17 May 2017 02:10:07 -0000

From: sweeaun <swee.aun.khor@intel.com>

Use ??= to set LINUX_VERSION_EXTENSION default value.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 637506a..1119f22 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -48,7 +48,7 @@ KCONF_AUDIT_LEVEL ?= "1"
 KCONF_BSP_AUDIT_LEVEL ?= "0"
 KMETA_AUDIT ?= "yes"
 
-LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
+LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 
 # Pick up shared functions
 inherit kernel
-- 
2.7.4


