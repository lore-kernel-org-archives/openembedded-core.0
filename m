Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADB9B78FD1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 01:37:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7M1b6GS021106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 18:37:06 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 21 Aug 2018 18:37:05 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2018 18:37:05 -0700
Message-ID: <20180822013705.22825-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH v2] Runtime selftest: hw breakpoint drops arm64, corrects syntax
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
X-List-Received-Date: Wed, 22 Aug 2018 01:37:05 -0000
Content-Type: text/plain

1. Improve syntax in skip test output.
2. Do not run the test for arm64 because commit 176e50fb177dc40e4
did exclude arm64.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index eb8713351a..0e00cdeeb6 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -166,9 +166,9 @@ class KSampleTest(KSample):
     def test_hw_breakpoint_example(self):
         # check arch
         status, output = self.target.run("uname -m")
-        result = ("x86" in output) or ("aarch64" in output)
+        result = "x86" in output
         if not result:
-            self.skipTest("the arch doesn't support hw breakpoint" % output)
+            self.skipTest("the arch %s doesn't support hw breakpoint" % output)
         # check config
         self.check_config("CONFIG_KALLSYMS_ALL")
         # make sure if module exists
-- 
2.11.0


