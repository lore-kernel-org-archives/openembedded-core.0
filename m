Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C64C860053
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:02:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5152Esn007159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:02:30 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 22:02:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2018 13:03:06 +0800
Message-ID: <e7a25c397e3a25495a14a402d342a33aca5123ab.1527829100.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527829099.git.Qi.Chen@windriver.com>
References: <cover.1527829099.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 01 Jun 2018 05:02:38 -0000
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


