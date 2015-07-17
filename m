Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB7165CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:17:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2015 07:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,496,1432623600"; d="scan'208";a="525955882"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2015 07:17:43 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 802136A4083;
	Fri, 17 Jul 2015 07:17:00 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 17:17:54 +0300
Message-Id: <1437142674-8167-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: Added skip condition to kernel module test
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
X-List-Received-Date: Fri, 17 Jul 2015 14:17:47 -0000

because it caused failures in core-image-lsb images.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/kernelmodule.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/kernelmodule.py b/meta/lib/oeqa/runtime/kernelmodule.py
index 2e81720..9318c28 100644
--- a/meta/lib/oeqa/runtime/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/kernelmodule.py
@@ -6,6 +6,8 @@ from oeqa.utils.decorators import *
 def setUpModule():
     if not oeRuntimeTest.hasFeature("tools-sdk"):
         skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+    if oeRuntimeTest.hasPackage("lsbtest"):
+        skipModule("Skipping because it's an LSB image.")
 
 
 class KernelModuleTest(oeRuntimeTest):
-- 
2.1.4


