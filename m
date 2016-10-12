Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CDC42601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 17:06:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2016 10:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,336,1473145200"; d="scan'208";a="18963615"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.128.247])
	by orsmga005.jf.intel.com with ESMTP; 12 Oct 2016 10:06:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 12 Oct 2016 10:06:51 -0700
Message-Id: <1476292011-30711-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] x86-base: Update version to 4.8
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
X-List-Received-Date: Wed, 12 Oct 2016 17:06:58 -0000

This update will avoid confusion with other parts of OE-Core that
set the kernel version to 4.8 for qemux86* and genericx86*.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 5663145..479e89e 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -20,7 +20,7 @@ SERIAL_CONSOLE ?= "115200 ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "4.4%"
+PREFERRED_VERSION_linux-yocto ??= "4.8%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
-- 
2.7.4


