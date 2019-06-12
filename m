Return-Path: <JAEWON@xilinx.com>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690067.outbound.protection.outlook.com [40.107.69.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBD57D70B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 01:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HyLmawdU4ZqEX7q+r/zCY1nvmIXdaa1acUlfS7SfCtk=;
	b=JhAa06e9pI4pYIgB+DuneMEtYRGIhd0vToPXMAdbk+xUN8TCct5aA4WoBTIx91T/40RTaYJTeBwR+Je+8sIUK/Ij7c4PHGbf5ZOvjft420/g+8lLEvlSYLKpBhvAIfKt9aNi+Nyhell5HZyrYXquYHPVpGgKcVGPDJF++yMwZOw=
Received: from BYAPR02CA0024.namprd02.prod.outlook.com (2603:10b6:a02:ee::37)
	by DM6PR02MB6236.namprd02.prod.outlook.com (2603:10b6:5:1d1::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.11;
	Wed, 12 Jun 2019 23:29:17 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by BYAPR02CA0024.outlook.office365.com
	(2603:10b6:a02:ee::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.15 via
	Frontend Transport; Wed, 12 Jun 2019 23:29:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
	via Frontend Transport; Wed, 12 Jun 2019 23:29:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hbCg7-0006T0-GT
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Jun 2019 16:29:15 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hbCg2-0001jX-Do
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Jun 2019 16:29:10 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x5CNT2Ln023452; Wed, 12 Jun 2019 16:29:02 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hbCfu-0001hw-Cb; Wed, 12 Jun 2019 16:29:02 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 16:29:01 -0700
Message-Id: <1560382141-25399-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(396003)(39850400004)(346002)(136003)(376002)(2980300002)(189003)(199004)(486006)(2616005)(14444005)(478600001)(6916009)(476003)(356004)(126002)(44832011)(48376002)(36386004)(50466002)(8676002)(336012)(426003)(81156014)(50226002)(81166006)(72206003)(2906002)(63266004)(16586007)(4326008)(316002)(305945005)(70586007)(70206006)(5660300002)(47776003)(36756003)(106002)(9786002)(2361001)(51416003)(8936002)(186003)(2351001)(107886003)(7696005)(26005)(77096007)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6236; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c56f117-c419-4517-526d-08d6ef8dc90f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(4709080)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:DM6PR02MB6236; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB6236:|DM6PR02MB6236:|DM6PR02MB6236:|DM6PR02MB6236:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB6236D2900070D01639970925AFEC0@DM6PR02MB6236.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0066D63CE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mFo89xnXViQL1O4tHNGXOACJ6igOWhNJopb6M35hdEjlhRKVUoL5Bo/s99Pbgs4iMKB6aeOswleJ2GSbB/1PUFsv5yPoN6rAu1GR4+BnXrekpxRGY8B+XsYMHHM6yLuoeZaZppyu6PL9N4HqUzXNKg2IJeqm/U8snWb5beNwVHHOomCQ5KBBqZsJ1G2+QOknX+ehUd0xoMTzZGnoYkrEHBMW6dKym5kSY34rA6N7cuX7zadFHLWh9I804ayRjdPOAPaePi2m5aPGChRNkmNHLcKX+3KVE5ZUGKyHW8uT2RmyYG6p6/F3vaYdnPql4WhbY6ceTVCvKFptbKs5HQejxR1E6b78ztEAebm9g19fn5lB3M+oRh7P3CKqNFYlcbyATfL3di+VER7mPTBqvvSDBnkDYk9DFzGjnHbMeE/BRjk=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2019 23:29:16.0434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c56f117-c419-4517-526d-08d6ef8dc90f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6236
X-OriginatorOrg: xilinx.com
Subject: [PATCH] devicetree.bbclass: Combine stderr into stdout to see actual dtc error
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
X-List-Received-Date: Thu, 13 Jun 2019 01:45:42 -0000
Content-Type: text/plain

Previously the subprocess command to run dtc was not properly displaying
the error on console. Combining stderr into stdout for the dtc subprocess
so the actual error can be seen on console without having to open the
do_compile log.

For example, previously on a dtc error, just the following stack trace
and dtc command was being shown on console:

File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:devicetree_do_compile(d)
     0003:
File:
function: devicetree_do_compile
     0127:            if not(os.path.isfile(dtspath)) or
not(dts.endswith(".dts") or devicetree_source_is_overlay(dtspath)):
     0128:                continue # skip non-.dts files and non-overlay
files
     0129:        except:
     0130:            continue # skip if can't determine if overlay
 *** 0131:        devicetree_compile(dtspath, includes, d)

    ...

Exception: subprocess.CalledProcessError: Command '['dtc', '-R', '8',
'-b', '0', '-p', '0x1000', '-i', '${INCLUDES}, '-o', 'system-top.dtb',
'-I', 'dts', '-O', 'dtb', 'system-top.dts.pp']' returned non-zero exit
status 1

with this patch, the actual error from the dtc command will be appended
like the following:

Subprocess output:
Error: Label or path not found
FATAL ERROR: Syntax error parsing input tree

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 meta/classes/devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 5c03e4b..d8779c7 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -116,7 +116,7 @@ def devicetree_compile(dtspath, includes, d):
     dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
     dtcargs += ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
     bb.note("Running {0}".format(" ".join(dtcargs)))
-    subprocess.run(dtcargs, check = True)
+    subprocess.run(dtcargs, check = True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
 
 python devicetree_do_compile() {
     includes = expand_includes("DT_INCLUDE", d)
-- 
2.7.4


