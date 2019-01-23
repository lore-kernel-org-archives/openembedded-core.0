Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 711CB6B463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 07:15:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0N7Efkr029559
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 23:14:51 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 22 Jan 2019 23:14:30 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 02:14:28 -0500
Message-ID: <1548227668-41989-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] runtime/ksample.py: correct a syntax and perfect item about architecture
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
X-List-Received-Date: Wed, 23 Jan 2019 07:15:01 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 584d0fb..de2366a 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -105,7 +105,7 @@ class KSampleTest(KSample):
     # kprobe
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_kprobe_test(self):
-        self.check_arch("x86 ppc")
+        self.check_arch("x86_64 i686 ppc")
         index = ["kprobe", "kretprobe"]
         for i in index:
             self.kprobe_func(i)
@@ -173,9 +173,9 @@ class KSampleTest(KSample):
     def test_hw_breakpoint_example(self):
         # check arch
         status, output = self.target.run("uname -m")
-        result = ("x86" in output) or ("aarch64" in output)
+        result = ("x86_64" in output) or ("aarch64" in output)
         if not result:
-            self.skipTest("the arch doesn't support hw breakpoint" % output)
+            self.skipTest("the arch %s doesn't support hw breakpoint" % output)
         # check config
         self.check_config("CONFIG_KALLSYMS_ALL")
         # make sure if module exists
-- 
2.8.1


