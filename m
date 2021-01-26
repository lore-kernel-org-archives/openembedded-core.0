Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.56])
 by mx.groups.io with SMTP id smtpd.web08.16454.1611684510368361463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 10:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=ngbXheLN;
 spf=pass (domain: outlook.com, ip: 40.92.51.56, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAOuwOYouqsA/iJPZotFuYjpYrDkGvEJgjkWPgnX5/bcfS8Vtt2jCc6vj1S6ctd1e9aUXpJMu+ywCB5gecj12COp2MTtGfukwU+rTzzVciXhTS2CkI98VbOmWc5EPkxb0QxoDjb9ohA5QBSl4mrek75QtegQtO/J08Gum78+CiQa2V/cVsq7fERn4HNcmDYNRQ+bBjWlhuWFt+mVMH5RJBGRXttvLatZbgXZNPqT9nBQIk5YpeL/Qw6aazTb8Whlt5+UayAJ7n6I8+k/M2XVERp+eTMCpswWzjGSjkB+ZyX0LrikgZAqr4JzpNInyT/277YHq+9OJ5Ovk8EbHd1wKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmsJg3TcxPa6mg+EFBchDdB+Glo6Crk7lMRi+4lshJA=;
 b=iPz02v4pmdBPWVhanBwo7C/8RJRQ0ChGLJjZA1ihx6erO8GCRhzR3kTncf+fmm9o2Fr1RalxcrBAzTfzLnHEo341qMXe6OFz1QIJEEg+AnOTzKLg8XxRiU/STjqpJhoHrYopgYmVvKUG6ArmnwXhNhNCCU3bki8DV6SihfY4f2+QbUd0U/s4mkZS7q1Ayj8daGtRstYmKPmvG2U3U9hy/F8QTLSAAV/N9pXeopW3ev47Eksy2eXbMuWBWoDd7saz+3031D97K6yBm2G8RKE9uhMDXniHwAnStFXLprJNmRADs3qn4ke1VKlXWfyugi6tAqxwHjlAav2k9ZE+muwzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmsJg3TcxPa6mg+EFBchDdB+Glo6Crk7lMRi+4lshJA=;
 b=ngbXheLNyuU179O72XjjpD2o0JwbWSE/ypoie04JLfPCKjSZKQ/hRs0i78whbAIJcn+3pWRgISe+BcaqzSqIwLcM1m5tDA4JjZZ0fHcNyrbgvQ/aKes1lryJYL1ERA6QmrVwRxjO0/U7uOD7nUFCNgj0UTsoGpbEstjxGsSSU0UZqEfVNcsbHfxjEIA2RkTAK99q4OuNZKn5cZzMi0yvsY2PxucAMsuebT6KZ82+ipMNfhw0DDYFvdKxRIh2xNcRWnNDOvhw5dpij11kvJ/KvoYVUa8W5i14qtbvDLla+5Qazd0VWtc0CzawRo1Z87KseI5xYGzKOIvsVj9fGGF4XQ==
Received: from DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::43) by
 DB8EUR06HT039.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::464)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 18:08:28 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::50) by DB8EUR06FT017.mail.protection.outlook.com
 (2a01:111:e400:fc35::113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Tue, 26 Jan 2021 18:08:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:4D7ADF85985708474746A2D5BC837EF95B6B7171C91F7FC8AD137ADE620FDEEF;UpperCasedChecksum:450BF5787F94E99CA4936E0A99B9D8C259B390348106FCF6B2ED0ADE36C16295;SizeAsReceived:7418;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c17:e937:d8cc:1970]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c17:e937:d8cc:1970%3]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 18:08:28 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2 3/3] oeqa: add tests for OETestPriority
Date: Tue, 26 Jan 2021 19:01:43 +0100
Message-ID: <AM9PR09MB46429A1D8C7464F162314C38A8BC0@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126180143.605303-1-kweihmann@outlook.com>
References: <20210126180143.605303-1-kweihmann@outlook.com>
X-TMN: [XPhc7MJeHWsTg1iVUpMaFnvJxVaKGmUr]
X-ClientProxiedBy: AM6P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210126180143.605303-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.86.85) by AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 18:08:28 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f0533072-24db-431a-6fc1-08d8c22561b4
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxLuW3rfWTFfNVlooeYgJyUE8DMEef5L2AZ/kYa/4WHl3QL3j6V1+zwez8j4QTDRF3QKGQ9be84bjcCM1By2eFChU9MEF9PGrpcuW3mv2zkYNw5cRHtJcQxr1nw7M4x8Pc+BXucxq4YwMU8V7dYEYcgsd5NQ5d050pWujRfIS5xejwIKE3ddgYLnvT9mZ839SJSSqz7QScBSIDiV1OEjiflpR0B4nneN0xns7lisCatzP2gQUP24B6riwBKt5IU12URvgonuXC+LK1JLL83AVt7vzPYFtUnMRnTKD4F5/dUlJyPHsEOXoQx/3EXd5SuIlGFR18iGl1Q2XIL+HcpUv7sMTcXa8MOoUm0XI9tfIsJAsVsDRTPcSDuE9HxRQ5Lwb5KueDXQ9FlaL3qf8fjN9NPrjfSWiTeJmJ3EozTYjQHqgHlWe65pHCwC20reCqqS3MfjETR0nNrGcQ5Hm5064qkGPIXRyn1BEmrOTdkx2rhIX+AGse8iaQ6yFaQNFeB2CstQFz12r9zfT7P4hpJNtGExXeT8HEavxTCia/RwQJ5g9OawG8rUvg6uXoMJXpLklTv+RbHmLWWiEG4szjzwCLosRVzj8+co2WdPNIwWpB1qAcEGtCuOLvH+0Af90QT9nZEGDJJq+M/RLgpkRcCBmVWKpJglR/GMBb7g6p0XE5n4Mwong3c4Ek4tysM+CjzvRvOmaPcq2Lo5osd7JJl2sqzVuB2uD6BUGZGm6hc36gHtg==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT039:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vovLoGwrOuuHEEN94L00SF0a3+eYoHwaYqZvnRSbOY0CHtcRIBGQ35MNbcre0c3ry/NZv6tc1JDlai15UxMtNUBWc/uTi3nJJe4ErsSQLAShtm2IXKfzahddz/elgqdtW4TsZCUglraHzWvyIHaWGN1VqZiScVZUQEv3Zk8Zr8Wm0FPO8lfyboJQuA75x2ebKfxnPzDdS1Mhtc3DXZx7/sDnE1RaSAnGSM2Zorb98ykpevu5DP6FG10v5Q6dw9gLiErpZNwgppSkRG8ZAMaNthqsOUsbxj5cBfLdf1WYCcvyfTyA84SmWbXPqtsfdkIi9+bASU47JtfKe1FKZEzB0fYQXzDLcdkpaXrCRlD8Zs+pp4T8BnBoE6m3LFa2bdAM
X-MS-Exchange-AntiSpam-MessageData: 
	RlvGfj21qnVhFDh/BcoQeHiJb0aJs7m0kpqWsGRPga7IZBsSDlQHlHUKpHxFTvxAguPeqG847km1mSmEZ42G5sdNBCOd6W3YQXc+zSMTE2gs2/3VIlaQ1fqnfmBmSy/C//WABDH/jA7dK+TW6XddOQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0533072-24db-431a-6fc1-08d8c22561b4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 18:08:28.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT039
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add test cases for the newly introduced test decorator OETestPriority

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/core/tests/cases/priority.py  | 61 +++++++++++++++
 meta/lib/oeqa/core/tests/test_decorators.py | 82 ++++++++++++++++++++-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/priority.py

diff --git a/meta/lib/oeqa/core/tests/cases/priority.py b/meta/lib/oeqa/cor=
e/tests/cases/priority.py
new file mode 100644
index 0000000000..cb48eb0424
--- /dev/null
+++ b/meta/lib/oeqa/core/tests/cases/priority.py
@@ -0,0 +1,61 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.priority import OETestPriority
+from oeqa.core.decorator.depends import OETestDepends
+
+class PriorityTest(OETestCase):
+
+    @OETestPriority(0)
+    def testDependsBoundsLower(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+   =20
+    @OETestPriority(00)
+    def testDependsBoundsUpper(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestPriority(-1)
+    def testDependsBoundsLowerOff(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+   =20
+    @OETestPriority(100)
+    def testDependsBoundsUpperOff(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestPriority("abc")
+    def testDependsBoundsType(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestPriority(80)
+    def testPriority80(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestDepends(['testPriority80'])
+    def testPriority80plus(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestPriority(30)
+    def testPriority30(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestDepends(['testPriority30'])
+    @OETestPriority(25)
+    def testPriority25(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestDepends(['testPriority25'])
+    @OETestPriority(15)
+    def testPriority15(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    def testPriorityNoDepends(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    def testPriorityNoDepends2(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
+
+    @OETestDepends(['testPriorityNoDepends'])
+    def testPriorityDependsNoPrio(self):
+        self.assertTrue(True, msg=3D'How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/co=
re/tests/test_decorators.py
index b798bf7d33..5a81be1c68 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -11,7 +11,7 @@ import unittest
 from common import setup_sys_path, TestBase
 setup_sys_path()
=20
-from oeqa.core.exception import OEQADependency
+from oeqa.core.exception import OEQADependency, OEQAException
 from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames, getSui=
teCasesIDs
=20
 class TestTagDecorator(TestBase):
@@ -133,5 +133,85 @@ class TestTimeoutDecorator(TestBase):
         msg =3D "OETestTimeout didn't restore SIGALRM"
         self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=
=3Dmsg)
=20
+class TestPriorityDecorator(TestBase):
+    modules =3D ['priority']
+
+    def test_depends_bounds_lower(self):
+        tests =3D  ['priority.PriorityTest.testDependsBoundsLowerOff']
+        self.assertRaises(OEQAException, self._testLoader, modules=3Dself.=
modules, tests=3Dtests)
+
+    def test_depends_bounds_upper(self):
+        tests =3D  ['priority.PriorityTest.testDependsBoundsUpperOff']
+        self.assertRaises(OEQAException, self._testLoader, modules=3Dself.=
modules, tests=3Dtests)
+
+    def test_depends_bounds_type(self):
+        tests =3D  ['priority.PriorityTest.testDependsBoundsType']
+        self.assertRaises(OEQAException, self._testLoader, modules=3Dself.=
modules, tests=3Dtests)
+
+    def test_depends_bounds(self):
+        tests =3D  ['priority.PriorityTest.testDependsBoundsLower',
+                  'priority.PriorityTest.testDependsBoundsUpper',
+                 ]
+        try:
+            tc =3D self._testLoader(modules=3Dself.modules, tests=3Dtests)
+            test_loaded =3D getSuiteCasesIDs(tc.suites)
+
+            self.assertEquals(test_loaded, tests, msg=3D"Tests are loaded =
in the correct order")
+        except OEQAException as e:
+            self.fail(msg=3D"Exception while loaded test suite: %s" % e)
+
+    def test_depends_nodecorator(self):
+        tests =3D  [
+                  'priority.PriorityTest.testPriorityNoDepends',
+                  'priority.PriorityTest.testPriorityNoDepends2',
+                 ]
+        try:
+            tc =3D self._testLoader(modules=3Dself.modules, tests=3Dtests)
+            test_loaded =3D getSuiteCasesIDs(tc.suites)
+
+            self.assertEquals(test_loaded, tests, msg=3D"Tests are loaded =
in the correct order")
+        except OEQAException as e:
+            self.fail(msg=3D"Exception while loaded test suite: %s" % e)
+
+    def test_depends_nopriority(self):
+        tests =3D  [
+                  'priority.PriorityTest.testPriorityDependsNoPrio',
+                  'priority.PriorityTest.testPriorityNoDepends',
+                 ]
+        expected_order =3D  [
+                  'priority.PriorityTest.testPriorityNoDepends',
+                  'priority.PriorityTest.testPriorityDependsNoPrio',
+                 ]
+        try:
+            tc =3D self._testLoader(modules=3Dself.modules, tests=3Dtests)
+            test_loaded =3D getSuiteCasesIDs(tc.suites)
+
+            self.assertEquals(test_loaded, expected_order, msg=3D"Tests ar=
e loaded in the correct order")
+        except OEQAException as e:
+            self.fail(msg=3D"Exception while loaded test suite: %s" % e)
+
+    def test_depends_order(self):
+        tests =3D  [
+                  'priority.PriorityTest.testPriority15',
+                  'priority.PriorityTest.testPriority25',
+                  'priority.PriorityTest.testPriority30',
+                  'priority.PriorityTest.testPriority80',
+                  'priority.PriorityTest.testPriority80plus',
+                 ]
+        expected_order =3D [
+                  'priority.PriorityTest.testPriority30',
+                  'priority.PriorityTest.testPriority25',
+                  'priority.PriorityTest.testPriority15',
+                  'priority.PriorityTest.testPriority80',
+                  'priority.PriorityTest.testPriority80plus',
+                 ]
+        try:
+            tc =3D self._testLoader(modules=3Dself.modules, tests=3Dtests)
+            test_loaded =3D getSuiteCasesIDs(tc.suites)
+
+            self.assertEquals(test_loaded, expected_order, msg=3D"Tests ar=
e loaded in the correct order")
+        except OEQAException as e:
+            self.fail(msg=3D"Exception while loaded test suite: %s" % e)
+
 if __name__ =3D=3D '__main__':
     unittest.main()
--=20
2.25.1

