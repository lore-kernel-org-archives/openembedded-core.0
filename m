Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QreR3-0005Vd-W3
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:13:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37688736"
Received: from unknown (HELO localhost) ([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: bruce.ashfield@windriver.com, tom.zanussi@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 16:08:20 -0700
Message-Id: <056c7c39be481014131b002efc2c349eb668b81a.1313092152.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
Subject: [PATCH 07/10] meta-rt: add an -rt-sdk image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 23:13:12 -0000

Add images including the SDK without the addition of the grapical environment or
packages.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta-rt/images/core-image-rt-sdk.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-rt/images/core-image-rt-sdk.bb

diff --git a/meta-rt/images/core-image-rt-sdk.bb b/meta-rt/images/core-image-rt-sdk.bb
new file mode 100644
index 0000000..6e98343
--- /dev/null
+++ b/meta-rt/images/core-image-rt-sdk.bb
@@ -0,0 +1,15 @@
+#
+# Copyright (C) 2011 Intel Corporation.
+#
+
+DESCRIPTION = "Real-Time Linux Image with SDK support"
+DEPENDS = "linux-yocto-rt"
+
+require recipes-core/images/core-image-minimal.bb
+
+IMAGE_FEATURES += "dev-pkgs tools-sdk"
+EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
+
+IMAGE_INSTALL += "rt-tests"
+
+LICENSE = "MIT"
-- 
1.7.6



