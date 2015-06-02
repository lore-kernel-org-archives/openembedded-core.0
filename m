Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 53555757B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:56:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2015 08:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="704019189"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2015 08:56:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E73D06A4005;
	Tue,  2 Jun 2015 08:55:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:02:05 +0300
Message-Id: <1433253725-14089-8-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 7/7] wic: Test creation of directdisk image with GPT table
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
X-List-Received-Date: Tue, 02 Jun 2015 15:56:03 -0000

Added new wic testcase to the sute - creation of directdisk-gpt
image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index a2ce2cb..e97dd1d 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -73,3 +73,9 @@ class Wic(oeSelfTest):
                                    "-r tmp/work/qemux86-poky-linux/"
                                    "core-image-minimal/1.0-r0/rootfs").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    def test06_gpt_image(self):
+        """Test creation of core-image-minimal with gpt table"""
+        self.assertEqual(0, runCmd("wic create directdisk-gpt "
+                                   "--image-name core-image-minimal").status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
-- 
2.1.4


