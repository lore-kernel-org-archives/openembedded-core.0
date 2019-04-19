Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 43154 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 20 Apr 2019 17:57:50 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
	by mail.openembedded.org (Postfix) with ESMTP id 707DF6C1C4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Apr 2019 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F+feXeeyVCur873973x3/pT2QW43TyKYyWZ1QqoMtkM=;
	b=MnAEq8mVgfcr7HRlGWMkZLvJWZAxz1lHLD+mRw6qUAWe08DMR/bPIH4QZcBLVciREcKtbL5x3y8f80ELsNNQsNmD11wtY9F07dojDUVagA+QQ61sP7gBH14t0gpjbJl7si8jQFQmvn42/POK+4elaQUi2a6ned3ABcMLtpsXvVw=
Received: from MWHPR0201CA0017.namprd02.prod.outlook.com
	(2603:10b6:301:74::30) by MWHPR02MB2687.namprd02.prod.outlook.com
	(2603:10b6:300:106::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1813.11;
	Fri, 19 Apr 2019 21:47:59 +0000
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by MWHPR0201CA0017.outlook.office365.com
	(2603:10b6:301:74::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.11 via
	Frontend Transport; Fri, 19 Apr 2019 21:47:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
	via Frontend Transport; Fri, 19 Apr 2019 21:47:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hHbMN-0006gv-53 for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2019 14:47:51 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hHbMI-0005mS-2H for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2019 14:47:46 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x3JLlfvF018637; Fri, 19 Apr 2019 14:47:41 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hHbMD-0005mC-Mi; Fri, 19 Apr 2019 14:47:41 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Apr 2019 14:47:40 -0700
Message-ID: <1555710460-29774-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(189003)(199004)(126002)(36756003)(7696005)(36386004)(476003)(186003)(6916009)(14444005)(426003)(48376002)(16586007)(70206006)(70586007)(47776003)(336012)(51416003)(2351001)(356004)(316002)(478600001)(81156014)(26005)(4326008)(2616005)(81166006)(50466002)(106002)(107886003)(486006)(8676002)(305945005)(8936002)(5660300002)(2906002)(77096007)(9786002)(63266004)(50226002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2687; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4e94e6-99b6-474a-1fed-08d6c510ac3e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:MWHPR02MB2687; 
X-MS-TrafficTypeDiagnostic: MWHPR02MB2687:|MWHPR02MB2687:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB268723E2C51C46B94644DD17AC270@MWHPR02MB2687.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0012E6D357
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pHVc0JcXpB16+jqGn5VcLDU0oKF0yofudkfzuNzY5P3FDioFP0s/SwC8EXPnzM92fMOZIIB3rqfDN4PyGd8CBpJSYlwsmn9CXQZsm++EuE0syPJWgp1zMOtJ9UrwteoM6S1VozSgjF/NT73Qw5bJcXtgOHCiooYJ+SjPnzPKtTZUoG7y/CiutUVXQOBG7/JQurFckKJuC4cDKT2fQSTiNLMLtyclozY+N2wNg/CFdwgi/I+eXu7ECOgOit7Yh+iggEa+sQAWuLtcoZVA4tXYiIeqmolLGJQggBpEWai3J/Uw8snDrYYIextlfUnpmzcXEk61fl8cyzrM/q/V4My0LTrVKibqLSWpWtoUdDi10a9aSj55hr+8LUA19EtjhRTW2vegGlnEtANdfER0thFrVoSOFsgaQhqEyVo/Vza54gg=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2019 21:47:51.7673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4e94e6-99b6-474a-1fed-08d6c510ac3e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2687
X-OriginatorOrg: xilinx.com
Subject: [PATCH] run-postinsts: Fix full execution of scripts at first boot
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
X-List-Received-Date: Sat, 20 Apr 2019 17:57:50 -0000
Content-Type: text/plain

run-postinsts runs a given set of scripts during the first boot of the
device, when one of these scripts prints something to stdout (isnt
daemonized correctly), since stdout is not available at that time,
the script execution immediately returns with an error (exit_group()),
this error causes the script to terminate all threads within the process,
causing undesired behavior since the script might still had to execute
some other code.

Replace eval built-in with $(), since $() executes in a different shell,
even if one of the scripts exits, all threads of that process will only
be within that session, this ensures other scripts meant to be run are
still run afterwards.

This was only required on the line that actually executes the scripts:
"eval sh -c $i $append_log", other replacements were put for consistency,
and generally, it is recommended to use $() instead of eval anyway.

[YOCTO #13266]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 95eff04..419796f 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -65,13 +65,13 @@ exec_postinst_scriptlets() {
 	for i in `ls $pi_dir`; do
 		i=$pi_dir/$i
 		echo "Running postinst $i..."
-		[ "$POSTINST_LOGGING" = "1" ] && eval echo "Running postinst $i..." $append_log
+		[ "$POSTINST_LOGGING" = "1" ] && $(echo "Running postinst $i..." $append_log)
 		if [ -x $i ]; then
-			eval sh -c $i $append_log
+			$(sh -c $i $append_log)
 			rm $i
 		else
 			echo "ERROR: postinst $i failed."
-			[ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
+			[ "$POSTINST_LOGGING" = "1" ] && $(echo "ERROR: postinst $i failed." $append_log)
 			remove_pi_dir=0
 		fi
 	done
@@ -81,11 +81,11 @@ remove_pi_dir=1
 if $pm_installed; then
 	case $pm in
 		"ipk")
-			eval opkg configure $append_log
+			$(opkg configure $append_log)
 			;;
 
 		"deb")
-			eval dpkg --configure -a $append_log
+			$(dpkg --configure -a $append_log)
 			;;
 	esac
 else
-- 
2.7.4


