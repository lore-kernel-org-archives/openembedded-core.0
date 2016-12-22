Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5159860111
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 19:11:58 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 22 Dec 2016 11:11:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,389,1477983600"; d="scan'208";a="42561059"
Received: from mavelasc-mobl.amr.corp.intel.com (HELO
	aehernan-MOBL1.amr.corp.intel.com) ([10.252.251.108])
	by orsmga004.jf.intel.com with ESMTP; 22 Dec 2016 11:11:56 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 13:11:54 -0600
Message-Id: <b6643e03bbb8e6c83cbd5f6c913f4d841f7ec45f.1482433885.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1482433885.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482433885.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] wic: Remove gummiboot test
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
X-List-Received-Date: Thu, 22 Dec 2016 19:12:01 -0000

Weve now migrated to systemd-boot, the gummiboot test on wic is no longer necessary

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3db00a6..49bbfe3 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -162,13 +162,6 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
-    @testcase(1349)
-    def test_mkgummidisk(self):
-        """Test creation of mkgummidisk image"""
-        cmd = "wic create mkgummidisk --image-name core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "mkgummidisk-*direct")))
-
     @testcase(1350)
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
-- 
2.10.1


