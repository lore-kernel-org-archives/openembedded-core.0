Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB95719A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:07:52 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 19 Dec 2016 13:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,375,1477983600"; d="scan'208";a="44344163"
Received: from jairdeje-mobl1.amr.corp.intel.com (HELO
	jairdeje-mobl1.zpn.intel.com) ([10.219.128.79])
	by orsmga005.jf.intel.com with ESMTP; 19 Dec 2016 13:07:53 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:07:31 -0600
Message-Id: <245918f79d5c32a3727a14d6e52036d7d357d896.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [PATCH v2 1/4] selftest/wic: adding Testopia ID numbers to test cases missing it
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
X-List-Received-Date: Mon, 19 Dec 2016 21:07:53 -0000

The following test cases were assigned an ID number on Testopia:

1496 Test generation of .bmap file
1560 Test creation of systemd-bootdisk image
1561 Test creation of sdimage-bootpart image

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e652fad..8c7aefa 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -278,6 +278,7 @@ class Wic(oeSelfTest):
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
 
+    @testcase(1496)
     def test_bmap(self):
         """Test generation of .bmap file"""
         image = "directdisk"
@@ -286,6 +287,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
 
+    @testcase(1560)
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         image = "systemd-bootdisk"
@@ -293,6 +295,7 @@ class Wic(oeSelfTest):
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
+    @testcase(1561)
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         image = "sdimage-bootpart"
-- 
2.7.4


