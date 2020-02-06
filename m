Return-Path: <JAEWON@xilinx.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	by mail.openembedded.org (Postfix) with ESMTP id C44BA60CEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 00:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Ria2A+n8PZcWPv4d8DpRagoVaRkTKWyIVdbeC8Q/QWYmYqeixbcvtEkLYlAfl9/egyFYSCHUOdmyKKZx7fTijULSrOBQ/6vhLLiyAYT5f+25DN65Wxv8+dL/9UmK0zZew5m27SGXxP/KDSPJZGyeOqNx2YIgyigZhgemtbr+ItQFIKrrzxcznZr40cskz/nla2IGCxCJ1f2/+fefJbVmfTsm5/hJDizdx7qe2E/s8XS1OZNIanUftJhCirqJwFDspVT2UOzxBjT+GlrLe26CPgOus/3+wXcnjnxDnFp6drhUpsm9J8Xmy5WIn2mCqQd7r+ZQoUKgYosnZcPpL8qA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kvExQje4lGlYyOqmU9emRaFi8QZD66GcEi+fH1Xm340=;
	b=BHQAo+tyhCcghIbAU8ut+hbsqp89H4HmkcMKXBnDxwoaLwrvD/8hlC7z+r4iKNVXMQvBdx14D7lVuoSGXr+yUPwDGo7QRoxRBcctoEpBlynTbyn2rU7T53VYJAez6VNudZ0Wj9amAj7T+9EYgVj5upcbl74vLwJCds455qzpQ3k9v7GzsSvEGBq9KwPOybC5TerbIHyOJofT9NdgXKoQHmDgajxVLTEH/Hz4rTATaWexfkbGsLT2FWyWoF4M7Xtz4U/j6HSedYR95LFyqwM2hhiFXjKcXyN2QjSAbkbp03xWyq/sWxxMHpPmrWHLXPWiKq5NBVWrd7EzQj1UPRHDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kvExQje4lGlYyOqmU9emRaFi8QZD66GcEi+fH1Xm340=;
	b=W7aac9G0KJlapGVA1IY09J3x3m/41Jd63xnU+gnyoQxknl/gh11/LDNrfnVuz8YQ+dlrcCstuXhtJ30ZXBJTc7Z6VyMq3nrIPW5kZ1kJq/FO80clT61OS/ph+SL4XVCwQExSJsXtw17rmc6r6z7z1mV5RDTcNwaTqWwHetpbsrs=
Received: from MWHPR02CA0002.namprd02.prod.outlook.com (2603:10b6:300:4b::12)
	by BN7PR02MB5043.namprd02.prod.outlook.com (2603:10b6:408:21::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21;
	Thu, 6 Feb 2020 00:57:40 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by MWHPR02CA0002.outlook.office365.com
	(2603:10b6:300:4b::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via
	Frontend Transport; Thu, 6 Feb 2020 00:57:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2707.21
	via Frontend Transport; Thu, 6 Feb 2020 00:57:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1izVUB-0008MY-Tg
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Feb 2020 16:57:39 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1izVU6-0001Pe-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Feb 2020 16:57:34 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	0160vUhJ020433; Wed, 5 Feb 2020 16:57:31 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1izVU2-0001P4-Qn; Wed, 05 Feb 2020 16:57:30 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 16:57:29 -0800
Message-Id: <1580950649-8807-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(44832011)(2616005)(478600001)(186003)(336012)(2906002)(316002)(4326008)(26005)(6916009)(426003)(36756003)(356004)(107886003)(9786002)(70206006)(5660300002)(8936002)(70586007)(54906003)(7696005)(81156014)(81166006)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5043; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d982d9-6789-464a-f639-08d7aa9f90ea
X-MS-TrafficTypeDiagnostic: BN7PR02MB5043:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5043FD48C94585BCCE4A5CF3AF1D0@BN7PR02MB5043.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-Forefront-PRVS: 0305463112
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrHqASrTxXsrB/G/xKgs93Qz+66kQAXZrU7YqAh67ubBGZDP+3075fw5YC72qZYrflUhwkOGW1673SLSJt2Z9E+jkIFDliCK/aUub8LVtdEyDeT4UTFs+k0YeZ1QM13TDuTxIdZZIPI3iESXe1nDkYfiySG8nP8Pkxs1HeJoFJtiEPzLBhGB7N13vgeiFTEVM1UvgHnDSemg09jSg6SlU0+LpmHteSx0Fy7ot5r8DzfjHwFC3pWTJAQR0bso0MhMVqKsjXl58+HI2espBXfF7VMhTRE14PY9dgjCDA1V5VOzBh8y4FEx3TWt52V219R94pDo6Mbg47YXlI+bB2aX1XDUeabbtjPO0m1YnKcn+s9C1VXPyxGtPlDbgsty2mT9uuiKD2Wer9lcWLSGbbEGxtJgSyXlfawwnAbICD2LZXb7u0TQ2yUY8cohcLBKzEx4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 00:57:40.2933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d982d9-6789-464a-f639-08d7aa9f90ea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5043
Cc: Mark Hatle <mark.hatle@xilinx.com>
Subject: [PATCH] sstate.bbclass: fix issue while handling long sstate filenames
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
X-List-Received-Date: Thu, 06 Feb 2020 00:57:41 -0000
Content-Type: text/plain

When moving to python3, divison using '/' now returns float instead of
an integer. In upstream commit b8025e972081b70960ffcbcbe43a7118041556a1
sstate filenames longer than the limit are changed to just include
necessary info + 3 fields just for information. The space left over
after the necessary info is divided into 3 for each of the fields.
Casting the outcome of that division to int to solve the following error
message:

avail = (254 - len(hash + "_" + taskname + extension) -
len(components[0]) - len(components[1]) - len(components[5]) -
len(components[6]) - 7) / 3
    >        components[2] = components[2][:avail]
             components[3] = components[3][:avail]
TypeError: slice indices must be integers or None or have an __index__
method

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index faa6470..53a6d06 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -20,7 +20,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
         components = spec.split(":")
         # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information
         # 7 is for the separators
-        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) / 3
+        avail = int((254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) / 3)
         components[2] = components[2][:avail]
         components[3] = components[3][:avail]
         components[4] = components[4][:avail]
-- 
2.7.4


