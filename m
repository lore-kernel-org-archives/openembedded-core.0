Return-Path: <ckalluri@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9997DFBA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 19:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SOoUEY3DlOuRE5SVaGJYhxLfKdsVDitW9lGdcnT/y4E=;
	b=IcJc40IQHxdwF00m6TFrwn7bKpoqO3dIjS4veWuirKrZwPkJTzaW+tAgiNsJ2+venA6lXeKTXYlNoF8qQtjfx3pyHwPwoADHvV5bmXofpx/mfyvF98+DSPlV/wq8DCMf4GaQubuUGrPBWCzCe7mWiPzJrSoEgym+bm2CejxHPgE=
Received: from CY4PR02CA0030.namprd02.prod.outlook.com (2603:10b6:903:117::16)
	by DM6PR02MB6027.namprd02.prod.outlook.com (2603:10b6:5:1f5::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21;
	Wed, 8 May 2019 19:04:18 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by CY4PR02CA0030.outlook.office365.com
	(2603:10b6:903:117::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via
	Frontend Transport; Wed, 8 May 2019 19:04:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
	via Frontend Transport; Wed, 8 May 2019 19:04:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50358
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hORrV-0001BA-94
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2019 12:04:17 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hORrQ-0005Iv-4i
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2019 12:04:12 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hORrG-0005Gg-Ow; Wed, 08 May 2019 12:04:02 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2019 12:04:01 -0700
Message-ID: <1557342241-12116-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(199004)(189003)(77096007)(2351001)(63266004)(26005)(9786002)(14444005)(81166006)(476003)(126002)(81156014)(8936002)(2616005)(8676002)(2906002)(50226002)(486006)(6916009)(305945005)(50466002)(186003)(426003)(478600001)(48376002)(336012)(47776003)(356004)(4326008)(16586007)(316002)(70206006)(70586007)(51416003)(7696005)(106002)(36756003)(5660300002)(36386004)(107886003)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6027; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5effa11f-a259-48ed-ef1d-08d6d3e7f862
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:DM6PR02MB6027; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB6027:|DM6PR02MB6027:|DM6PR02MB6027:|DM6PR02MB6027:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB602757905D3E47CEF3F8044AB0320@DM6PR02MB6027.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /PzD2fxFR6I/9vZ5iaOYFsHnqODQmTs2HCG+hLFrxfgqiZLT+ZTPF6YgTS/XXCQIRITrQ8JI2GaoLGm5ZbqBx1hWop+zCCpNMKXUQzAY0rd5KcGtuugPZW3QUhNCaZoLptrq8v7o5dzohnttKQJliFrAEOp1on27D+3rpGb9Wg3UmGo5VWiI7jRk+4sOXPA8GUXIEoe7s4VIG6FmGGTG4UVKtAKFYPuJQc55154mCoQunqjbL6Exysf+Bvagi7UFZV5JMjsYzhC6CpYzA7kNf7SF33If6j9xh18lzjZSShNh3CEAVyoFpDNEP2GUPkRKSTsRktdbyRiXLfY7TKeeWXA+mZ6f3EVw726Uhfm0Dag9FuNQaz33RzCJ2NYSfVqAakrfA62QR/1OndTupEnVOUgMx53ed7y1xWV0BPHl3Tg=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 19:04:17.6302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5effa11f-a259-48ed-ef1d-08d6d3e7f862
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6027
X-OriginatorOrg: xilinx.com
Subject: [PATCH v2] run-postinsts: Fix full execution of scripts at first boot
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
X-List-Received-Date: Thu, 09 May 2019 19:01:51 -0000
Content-Type: text/plain

From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>

run-postinsts runs a given set of scripts during the first boot of the
device, when one of these scripts prints something to stdout (isnt
daemonized correctly), since stdout is not available at that time,
the script execution immediately returns with an error (exit_group()),
this error causes the script to terminate all threads within the process,
causing undesired behavior since the script might still had to execute
some other code.

Replace eval built-in with (), since () executes in a subshell,
even if one of the scripts exits, all threads of that process will only
be within that session, this ensures other scripts meant to be run are
still run afterwards.

[YOCTO #13266]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 95eff04..f84a7e1 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -67,7 +67,7 @@ exec_postinst_scriptlets() {
 		echo "Running postinst $i..."
 		[ "$POSTINST_LOGGING" = "1" ] && eval echo "Running postinst $i..." $append_log
 		if [ -x $i ]; then
-			eval sh -c $i $append_log
+			(sh -c $i $append_log)
 			rm $i
 		else
 			echo "ERROR: postinst $i failed."
-- 
2.7.4


