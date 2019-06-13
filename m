Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 137851 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Jun 2019 14:02:04 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
	by mail.openembedded.org (Postfix) with ESMTP id C46807E988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2Yu9heWL6Fqt5hQ0QjRBApbcQft9O2837tSAHStLCQo=;
	b=e/r/FykYrEvVHfWf4oYbb4lTBi6hVlzjfP6On/jhlALf2IVgf7OM3AvST57SEvrXL50IM/B1W3AidVoiQi+lHmYbHm0cWzU2PTQ+7mVw8dRyjGV2H3gA6tYlaZG2qY+6JdMh3+48GyWERlUTsaUJC1SQx/h/VheQyO5Jgt9SOBo=
Received: from BL0PR02CA0101.namprd02.prod.outlook.com (2603:10b6:208:51::42)
	by BYAPR02MB4936.namprd02.prod.outlook.com (2603:10b6:a03:47::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.11;
	Thu, 13 Jun 2019 23:29:59 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by BL0PR02CA0101.outlook.office365.com
	(2603:10b6:208:51::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.15 via
	Frontend Transport; Thu, 13 Jun 2019 23:29:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
	via Frontend Transport; Thu, 13 Jun 2019 23:29:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hbZAL-0002WX-Kq
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Jun 2019 16:29:57 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hbZAG-0003fK-H6
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Jun 2019 16:29:52 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x5DNTnau007817; Thu, 13 Jun 2019 16:29:49 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hbZAD-0003eh-9Q; Thu, 13 Jun 2019 16:29:49 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 16:29:48 -0700
Message-Id: <1560468588-8378-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(199004)(189003)(2906002)(14444005)(36756003)(6916009)(478600001)(63266004)(107886003)(9786002)(72206003)(4326008)(70586007)(305945005)(2361001)(48376002)(70206006)(5660300002)(426003)(81156014)(47776003)(8676002)(50226002)(81166006)(2616005)(2351001)(36386004)(316002)(26005)(16586007)(476003)(54906003)(8936002)(486006)(106002)(44832011)(186003)(51416003)(7696005)(336012)(50466002)(77096007)(356004)(126002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4936; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d695c87-a571-409b-1e7f-08d6f0570c80
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(4709080)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:BYAPR02MB4936; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB4936:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4936E91CC2C2BCD064122F84AFEF0@BYAPR02MB4936.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0067A8BA2A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ec5Ev40skmoTAa+pN48VSgsWltv3+BGiMltcS1HhltchC6mqYSuevE5S9iJRSOctqa4HXgOVMtZ9fY7U0EjXrs47SGiCtauPeUdggWrenfQ6j9JRYEgQ5eNIlMC0nnb47VP9QKoHH09q/KUSkLELtO7mgQMayYXRuyebukkblbIknzES2jJnRr4R8idCljeEHtGEcTK4/12fPerGXaBID+WQ4JGbxcbrTX4VHvVYtgWSpMqp2HhM6i7QEByuh6CtYMjDQQfhepsRinnnZ7RrRSf+vp0F5H3TLX4r2oIjelnj4gj3UxFY3V5wL/Xszt+CkOeRnqxudbVB92CbNB81VxRooUfVBl0Gf+fu36OgrCARIRJbBK+5ANltn6fUNXopDA4TO96uzsVHZhGF59l5uP3wDPkP0ElvB+nAIeResvI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2019 23:29:58.0786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d695c87-a571-409b-1e7f-08d6f0570c80
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4936
Subject: [PATCH v2] devtool: build: Also run deploy for devtool build if applicable
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
X-List-Received-Date: Fri, 14 Jun 2019 14:02:05 -0000
Content-Type: text/plain

Right now `devtool build` runs populate_sysroot and packagedata tasks.
Adding deploy to this list, if the recipe has the deploy task, so that
the newly built artifacts are available in the deploy directory.
Applicable only for packages with deploy task, such as kernel.

[YOCTO#13382]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
v2: tested with oe-selftest, add deploy to build_tasks if deploy in __BBTASKS
---
 scripts/lib/devtool/build.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 7543398..935ffab 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -11,7 +11,8 @@ import bb
 import logging
 import argparse
 import tempfile
-from devtool import exec_build_env_command, check_workspace_recipe, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError
+from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
 
@@ -43,12 +44,22 @@ def _get_build_tasks(config):
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
     workspacepn = check_workspace_recipe(workspace, args.recipename, bbclassextend=True)
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, appends=True, filter_workspace=False)
+        if not rd:
+            return 1
+        deploytask = 'do_deploy' in rd.getVar('__BBTASKS')
+    finally:
+        tinfoil.shutdown()
 
     if args.clean:
         # use clean instead of cleansstate to avoid messing things up in eSDK
         build_tasks = ['do_clean']
     else:
         build_tasks = _get_build_tasks(config)
+        if deploytask:
+            build_tasks.append('do_deploy')
 
     bbappend = workspace[workspacepn]['bbappend']
     if args.disable_parallel_make:
-- 
2.7.4


