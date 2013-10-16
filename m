Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D85AE6D087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 02:51:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Oct 2013 19:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,504,1378882800"; d="scan'208";a="393546431"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 15 Oct 2013 19:51:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 19:51:30 -0700
Message-Id: <1381891890-23822-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] busybox: Add depmod (adds 2240 bytes)
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
X-List-Received-Date: Wed, 16 Oct 2013 02:51:30 -0000

This will allow packages that update kernel modules to run correctly

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
index 4526121..f0e63c2 100644
--- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
@@ -504,7 +504,7 @@ CONFIG_LSMOD=y
 # CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
 CONFIG_MODPROBE=y
 # CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
-# CONFIG_DEPMOD is not set
+CONFIG_DEPMOD=y
 
 #
 # Options common to multiple modutils
-- 
1.8.3.1


