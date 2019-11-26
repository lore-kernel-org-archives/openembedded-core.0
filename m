Return-Path: <ckalluri@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740079.outbound.protection.outlook.com [40.107.74.79])
	by mail.openembedded.org (Postfix) with ESMTP id 988FF7FC4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bL2ttpOHkipuSUS8Bp0Txbl1TlbEfJt5E/s9F/d4YNYIa3pQ7U34q1Oyu3U6rW1zJBzDctR7o+ey9TwnAfbA4fi7JjYTFfj9igOVZvP0SQlIIrGxnRt0mGruAoqfUhCmbfM78OFbJ5GE1VUaEEEkN0H/MWezfYvj1aWc5Wm1+SAoB9+t4yArQV0SAX1/vb2EqPZT2dGjoBMVeWUcqmpN80rSPbhQwDx5/18i5DXbVpJP3Qw9I/4NGg9R4pNkjNWxvu0nZwzyDj2VZJmDRasWBCS/QSGDrVJWRm2VqKOu0YEj3CfGfxabIvmyoyDRSTIjvqLqQKPXGh1fxOXjr8cM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gn5JJ+ENesRipEWJboyRCESp7DMhEcJiqADu0c3Sfdc=;
	b=b1t9r/9tudTWv6wNDscW0lsEFi4zFhLh7K4nOsM+RA2XnQUe/f9sfiFp5ChUkkXk/N1/EqXd1K2sDJRzNs/KKlBKEguuCSpzzSawbooflkRikvotSI3rBPCumqyzSRlEJ5b6rYgvHlcC5ee30FOS/lvMF6fAebozOQU3yfjYFyQ1fiT3mOVWfqMm641/4MNILu2QPn1BqgNxvXGClv6qVD5FCvJ//r/HOiJOKKrbwBF1yFUuXYEHJx+iaYBuw13AkPBvOZ7jyhhr5cQDyfIwgNQONbjP1KmDMnEDRedqowUdIZaeT51vFOc1vzdFhDrpYT3XoEv8nqVFKxeeYb7g2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gn5JJ+ENesRipEWJboyRCESp7DMhEcJiqADu0c3Sfdc=;
	b=jCH/MxLvoXLm4azRoAoxMIwfoPSyGQj+Eb40KIazKfKiL7rQP0py54uXGboZKw2yxPs3A8nXnshpMCQ5AdIKKIzdbKbk1Q2zF5+sdlGmFCm3p5hLXibA0qeoahWmWp9cwYzr+Yj40Uapfd223nk7rnpyEpPG5Bl9H5TLJEITuzg=
Received: from DM6PR02CA0087.namprd02.prod.outlook.com (2603:10b6:5:1f4::28)
	by CH2PR02MB6165.namprd02.prod.outlook.com (2603:10b6:610:7::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.22;
	Tue, 26 Nov 2019 19:43:43 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by DM6PR02CA0087.outlook.office365.com
	(2603:10b6:5:1f4::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via
	Frontend Transport; Tue, 26 Nov 2019 19:43:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
	via Frontend Transport; Tue, 26 Nov 2019 19:43:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iZgkQ-0000WH-Nb
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Nov 2019 11:43:42 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iZgkL-00075W-KK
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Nov 2019 11:43:37 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1iZgkB-00071D-Kt; Tue, 26 Nov 2019 11:43:27 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 11:43:26 -0800
Message-Id: <1574797406-21583-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574797406-21583-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1574797406-21583-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(26005)(6916009)(50466002)(48376002)(76176011)(107886003)(336012)(16586007)(9786002)(51416003)(316002)(426003)(47776003)(2616005)(11346002)(5660300002)(36386004)(81156014)(8936002)(7696005)(36756003)(81166006)(8676002)(2906002)(70206006)(70586007)(446003)(2361001)(14444005)(4326008)(106002)(2351001)(356004)(50226002)(478600001)(186003)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR02MB6165; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1782855-7467-4ea2-20b5-08d772a8f1d0
X-MS-TrafficTypeDiagnostic: CH2PR02MB6165:
X-Microsoft-Antispam-PRVS: <CH2PR02MB61654044CE4F271BBEDF2F0DB0450@CH2PR02MB6165.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0233768B38
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBh5TQj0CZ6ylXhnL3aLVhH6fL3QkuWOn0gtT4QZGED9kK8P9FG/sSY+A5S7VL7bw6ptXv82526CsaqcZ++DjP80xnO4gxt6s7DhA3Kgj1PgU9MRh+Hy4xaandTzsNrCrfBWYX+8cPQ6mrIKugbpQ3K84R2/UFR/WSlcG7QhYazCtoKUCrUnywQc4fE/oios7p+7gHs/1dVZCHG1f55Ggr9BKOj4y2k19hXMb3JshiudEBsAof2modrnwOJ8YQ2Z0occftarKNBZfM2IDRZlj1p9BjdEGRx2EDUw9w3RKFN/ApfCUofIu2TPG8Ua422v6JdRJX1eG1/jbp0I7OUlgyXYwsCwLzLigYPEN1AqIombaeXFdHMFDeS6vbkoiOZCJtXX7eZbkOb+Rb9lR9yghbPOM0OSYRv5WuyOLySPnr2ekZet6+mjiafZOkbJl1TD
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 19:43:43.1504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1782855-7467-4ea2-20b5-08d772a8f1d0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6165
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH 2/2] oeselftest: devtool reset --remove-work command
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
X-List-Received-Date: Tue, 26 Nov 2019 19:43:44 -0000
Content-Type: text/plain

Add oeselftest for devtool reset command. DevtoolResetTests class can be used
to test devtool reset command behaviour wrt to source directory in workspace.

The first test test_devtool_reset_package will verify if the source directory
is present for a package once the workspace is reset.

Example usage: oeselftest -r
devtool.DevtoolResetTests.test_devtool_reset_package

The second test test_devtool_reset_remove_work_package will verify if the
source directory is cleaned up during workspace reset.

Example usage: oeselftest -r
devtool.DevtoolResetTests.test_devtool_reset_remove_work_package

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 57e6662..f6093c0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1777,3 +1777,52 @@ class DevtoolUpgradeTests(DevtoolBase):
         #Step 4.5
         checkmodconfg = runCmd("grep %s %s" % (modconfopt, codeconfigfile))
         self.assertEqual(0,checkmodconfg.status,'Modification to configuration file failed')
+
+class DevtoolResetTests(DevtoolBase):
+    def test_devtool_reset_package(self):
+        """
+        Summary:        The purpose of this test case is to verify that
+                        devtool reset cleans the workspace without
+                        removing the source directory.
+        Dependencies:   NA
+        Steps:          1. Use devtool modify mdadm to extract source to workspace.
+                        2. Use devtool reset mdadm to verify that workspace is reset
+                        by clearing the sysroot and the append file. But source folder
+                        is not removed by default.
+        Expected:       devtool reset by default doesnt clean the source folder of the
+                        package and the user is forced to manual remove it.
+        """
+        # Extract a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        sourcedir=os.path.join(os.path.join(self.workspacedir,"sources"),"mdadm")
+        result = runCmd('devtool modify mdadm')
+        result = runCmd('devtool reset mdadm')
+        self.assertTrue('Leaving source tree', result.output)
+        self.assertExists(sourcedir,'the source directory is missing when it should be present')
+
+    def test_devtool_reset_remove_work_package(self):
+        """
+        Summary:        The purpose of this test case is to verify that
+                        devtool reset -r cleans the workspace as well as
+                        removes the source directory.
+        Dependencies:   NA
+        Steps:          1. Use devtool modify mdadm to extract source to workspace.
+                        2. Use devtool reset --remove-work mdadm to verify that workspace is reset
+                        by clearing the sysroot and the append file and source folder
+                        removed.
+        Expected:       devtool reset --remove-work will clean the source folder of the
+                        package along with the appendfile and sysroot.
+        """
+        # Extract a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        sourcedir=os.path.join(os.path.join(self.workspacedir,"sources"),"mdadm")
+        result = runCmd('devtool modify mdadm')
+        result = runCmd('devtool reset -r mdadm')
+        self.assertTrue('Removing source tree', result.output)
+        self.assertNotExists(sourcedir,'the source directory is present when it should have been removed')
-- 
2.7.4


