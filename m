Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 82025 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Jun 2019 22:17:15 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF9D7E517
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=O3iHV2RtLAE7nGKE74LixxRv5wuCBPcSbyTTQTJr56U=;
	b=TSeCgMZPduLUESQ19HxMyco1ML3rUs7XzFuXddpJOClb01z6Ndi2qah0zGu10yfWWsDOqs9VE7ZGAcS5U7LWPcDYLJ/52XtCEaYFtXcEw2519nLj9xFM6cSEd4AgwkLvnysn3GmojsVIC3LXVIsAkvVEhOScxA0qeexIfSvv3sU=
Received: from BL0PR02CA0084.namprd02.prod.outlook.com (2603:10b6:208:51::25)
	by DM6PR02MB6234.namprd02.prod.outlook.com (2603:10b6:5:1d1::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12;
	Fri, 7 Jun 2019 22:17:14 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BL0PR02CA0084.outlook.office365.com
	(2603:10b6:208:51::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.14 via
	Frontend Transport; Fri, 7 Jun 2019 22:17:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
	via Frontend Transport; Fri, 7 Jun 2019 22:17:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:33243
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hZNAf-00020Y-S2
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Jun 2019 15:17:13 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hZNAa-0007ed-OT
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Jun 2019 15:17:08 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x57MH1v3013403; Fri, 7 Jun 2019 15:17:01 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hZNAT-0007Zk-84; Fri, 07 Jun 2019 15:17:01 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 15:17:01 -0700
Message-Id: <1559945821-18316-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(199004)(189003)(336012)(4744005)(81166006)(81156014)(2616005)(478600001)(6916009)(36756003)(126002)(4326008)(9786002)(44832011)(316002)(5660300002)(72206003)(107886003)(2351001)(50466002)(305945005)(36386004)(70586007)(50226002)(186003)(2361001)(16586007)(486006)(476003)(63266004)(48376002)(2906002)(47776003)(8676002)(26005)(77096007)(356004)(426003)(8936002)(51416003)(106002)(7696005)(70206006)(14444005)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6234; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c431d0ec-be08-492a-8968-08d6eb95e4f7
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:DM6PR02MB6234; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB6234:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB6234BE3A5739FD48D76A9274AF100@DM6PR02MB6234.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0061C35778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: l8w3X1LypBhhVpNE5ZHmxZAi+aqzJf2a3YTW8n48aszzvaqhJLBYtoc6YiOU8ThTmNbl9s2mHweCzHyyEX8uUBATnOiuCv8jVkQ12ZRbveZ0G8Ugk1g9yPOzHwsjqMrBInFKvfIq3qWxyXVTqZwR3LejE6G2BnIr5Tt3MCJoPHDjL0vf8bGZP4x+v19m6JBRm+OWjKXP0OR5/jt1v1+DDvh8Vm0qAce2RySKbehMR0JF8n7i6hJARDGv1xX9sq5gfMghLem6t97I7iiU8IDsZ6tyA+J/w1yoClRDwQA0QBru8GIHxZIWJD0V3oRCSp5CV2/9ica2d/Wx2Y3Sl2IVc8E44td1cQxPqKvk4kjuv162AzGZXK/bcNGKSoEqIyRH74EhUoCEROXHPjk6n9oJ6N6ubHlvZF/o+uB0jI1WUZQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2019 22:17:14.2465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c431d0ec-be08-492a-8968-08d6eb95e4f7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6234
Subject: [PATCH] devtool: build: add deploy to the tasks run for devtool build
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
X-List-Received-Date: Fri, 07 Jun 2019 22:17:15 -0000
Content-Type: text/plain

Right now `devtool build` runs populate_sysroot and packagedata tasks.
Adding deploy to this list so that the newly built artifacts are
available in the deploy directory.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>

[YOCTO #13382]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 scripts/lib/devtool/build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 7543398..aff5710 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -37,7 +37,7 @@ def _set_file_values(fn, values):
     return updated
 
 def _get_build_tasks(config):
-    tasks = config.get('Build', 'build_task', 'populate_sysroot,packagedata').split(',')
+    tasks = config.get('Build', 'build_task', 'deploy,populate_sysroot,packagedata').split(',')
     return ['do_%s' % task.strip() for task in tasks]
 
 def build(args, config, basepath, workspace):
-- 
2.7.4


