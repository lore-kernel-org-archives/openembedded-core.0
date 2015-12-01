Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E19EF605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:51:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 09:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5628302"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 09:51:03 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:39:04 +0000
Message-Id: <41a6aca45571c0fe8eb13155e02c1d04b8681a43.1448961756.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 6/6] selftest/wic.py: Add test for custom bootloader config
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
X-List-Received-Date: Tue, 01 Dec 2015 17:51:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change just add anoher test to the wic module.
It will try to create a image with a custom bootloader
configuration. This test will use the example image
directdisk-bootloader-config to test the configfile
option for the bootloaders.

[YOCTO #8728]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index ea78e22..f4404bf 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -256,3 +256,11 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    #@testcase()
+    def test_directdisk_bootloader_config(self):
+        """Test creation of directdisk-bootloader-config image"""
+        image = "directdisk-bootloader-config"
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % image).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
1.8.4.5


