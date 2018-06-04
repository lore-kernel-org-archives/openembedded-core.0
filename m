Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2233751B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:09:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5439MKw003780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:09:38 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:09:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:10 +0800
Message-ID: <3bfa680da3e444c49b7f3224d7836fc121f3c876.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] oeqa/runtime/cases/rpm.py: skip if rpm not available
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
X-List-Received-Date: Mon, 04 Jun 2018 03:09:47 -0000
Content-Type: text/plain

This test case should only run when rpm package is installed.
So skip it if rpm package is not installed. This fixes:

  RESULTS - rpm.RpmBasicTest.test_rpm_help - Testcase 1059: FAILED

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 05b94c7..84c59a6 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -16,6 +16,7 @@ class RpmBasicTest(OERuntimeTestCase):
             cls.skipTest('Tests require image to be build from rpm')
 
     @OETestID(960)
+    @OEHasPackage(['rpm'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_rpm_help(self):
         status, output = self.target.run('rpm --help')
-- 
1.9.1


