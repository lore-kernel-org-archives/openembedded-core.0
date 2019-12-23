Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	by mail.openembedded.org (Postfix) with ESMTP id 01FB17F7C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 07:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MVUPawjXYRWVnl8YnachJMfgh3J85tx+Wu/ZjuQdJNjPWBjJJAcV57yeaFiKtlfoRPObR0hqmAEXug3q2VrRCUbJyUvCwcwzEa3eC02d0IbevduBmzgAeNfYEANZqPM3oqA5msovjmxrurnBmrp4rYeilqb8hfgL94K6y9mjqJ79QCxmMgxByVadUtFJ7txP+v10bt2jCqNKMQMtk9UkTzM8Ys9Gkou8fsfkxcTlWdbFUWvWZUQWnqBuIXPkHLWiPN6EE5IZBb/l9YHeZHYhaM7N+PzWfaDECmVGlH5/pvKaFdfxkvCCldsc78j1liyayFp/BQnAuJ0P7bIAp7BBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y0XwKNUuo1xYln+UaUGmT6BRqyFygxDKKs0fMFV16WI=;
	b=XvgWtjHYxvKJLI8qj/eikancqbgThpv6l4PQmD2N/0EpjwixiYnQyvXLIglPF/Ysh4VxYAZHnPTa1GZhHKOjVvtdFToMNoOaRrRY+7UXYsKxdj4clrgri1OeHJ6ZPsFOmUuQwAKl005Mf01nCqlQylqfKYd9K6LpvqvxC37RBjirSqwcjaBJbzLiHJSs8oA49gmutblNZW9hSzxfxJzmPPYgQQUOd07qzCtNtCr+ubAhE9MF6LjWFSKzaJvZK/z5JFamLu9QW7q80e8lyuOGLCf/GeEFG1Ohdi6LEntwhau54gwwzC2kF2K6BhLgvptKGHFIcmO1ROUraNq7uSJGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y0XwKNUuo1xYln+UaUGmT6BRqyFygxDKKs0fMFV16WI=;
	b=a7ngFjXUyOeoHTCkqMwo3LqQYPRLGCbj0o9sV7Hi7Lkmnw7DvPqNwqS287w/CkYPiMbY1tmFNS16xVhN69+d40ousd4Gf3rMGOB2gFKiPkVX088DPTI3j7eIRr24ObBI8JdbZP+OPKlMlAvu8tzihJd9UiL9pbeRALxwphBlmaE=
Received: from BL0PR02CA0103.namprd02.prod.outlook.com (2603:10b6:208:51::44)
	by MWHPR0201MB3435.namprd02.prod.outlook.com (2603:10b6:301:7a::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14;
	Mon, 23 Dec 2019 07:11:30 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BL0PR02CA0103.outlook.office365.com
	(2603:10b6:208:51::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via
	Frontend Transport; Mon, 23 Dec 2019 07:11:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2559.14
	via Frontend Transport; Mon, 23 Dec 2019 07:11:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ijHsG-0003RR-MM for openembedded-core@lists.openembedded.org;
	Sun, 22 Dec 2019 23:11:28 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ijHsB-00076R-J7 for openembedded-core@lists.openembedded.org;
	Sun, 22 Dec 2019 23:11:23 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	xBN7BL77025359; Sun, 22 Dec 2019 23:11:21 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ijHs9-00076M-Bh; Sun, 22 Dec 2019 23:11:21 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Dec 2019 23:11:20 -0800
Message-Id: <1577085080-11425-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(15650500001)(9786002)(2906002)(478600001)(70206006)(356004)(70586007)(6916009)(107886003)(36756003)(5660300002)(81156014)(8936002)(4326008)(316002)(336012)(2616005)(426003)(26005)(7696005)(186003)(81166006)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3435;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb6c730-2941-4bcf-e264-08d78777551b
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3435:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3435E8425EA50AB9DA824C79B92E0@MWHPR0201MB3435.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 0260457E99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06Ec19j37Ne4/udsQ3pWx9DFGj4JtiA57FaGFYXg0kuwnTeqCFQbF9i5fr4zR9MXmYge5i2LcFvli2xGXjpIFgjd3BKgO70kvgUC+0hsdFj7zqDktwFKZfyg3Ncf5efdicQH4SJJ0ojuCBr1kTRYjzBdFdJNqsM2g3fG1/DjrZN5YADlUIgn2qVXtAP5lOaUkvI/aFfpZm5yFYSWfS4WeU3U1CJzW1eELJ7tNWS5Ehl0O1y4y7vevgWHktxfB06pba8oHYT1echJkEKiHeCk70Q/eNQ65IQCEV1YIk4uv3Kjq5OEiQSEoeiyhkCG7WFEGdJ3Qq2Xf3+4FpTr1O033hms+6yaF+E4CcsSneSUsl3uwcWodhD505kgwKAk1ncg3apeTDLzvSloBPHq62VoMPi+vV2YFn0R+7u7cMuZoiD9nCUyh+HXOiOyQrZc/6B7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 07:11:29.3672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb6c730-2941-4bcf-e264-08d78777551b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3435
Subject: [PATCH] feature-microblaze-versions.inc: Update MB to v11.0
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
X-List-Received-Date: Mon, 23 Dec 2019 07:11:31 -0000
Content-Type: text/plain

Update the Microblaze to v11.0

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/conf/machine/include/microblaze/feature-microblaze-versions.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 955674f..3221e2a 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -44,6 +44,7 @@ TUNEVALID[v9.4]  = "MicroBlaze version 9.4"
 TUNEVALID[v9.5]  = "MicroBlaze version 9.5"
 TUNEVALID[v9.6]  = "MicroBlaze version 9.6"
 TUNEVALID[v10.0] = "MicroBlaze version 10.0"
+TUNEVALID[v11.0] = "MicroBlaze version 11.0"
 
 # Version conflict matrix
 TUNECONFLICTS[v8.00] = ""
@@ -60,6 +61,7 @@ TUNECONFLICTS[v9.4]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3"
 TUNECONFLICTS[v9.5]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4"
 TUNECONFLICTS[v9.6]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5"
 TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
+TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
 
 # Version flags
 TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
-- 
2.7.4


