Return-Path: <JAEWON@xilinx.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	by mail.openembedded.org (Postfix) with ESMTP id 8D96C60BF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 21:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=BNknP/Ef2I1YvSHSSMlo1ab5LvAp/JUVvok77UWh8WnI+B6J3vFtmE+njUlxxlE9JyPASST/a//CGhvevUh6DxndjOJK4x9xN5cNp0ecZx/P7i/isW+fobk4HkaA2tNtZCDcizqgEIg2e27riIfj0fO4YUVFqqB4phuiNml9V+VKSw4NL6xJcXxyqo8UnvPGPqiYnK/EM8xCDicWFJx5GMcqj/1mPH8XMA61PzMkWQng1dDDyB4CyJS5quggV6yjBSUmlZvQGPAUdmjP4ZgB9zSLkA0ANkBoDcaGbBOyxw4a4t6EEb3Z8zlDp2D/gWyGoJ1mm35YbENCKW+4G2XoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=755NqEYgPVqyO2BBHEfypbgZnLYfIGrRQA7OmuZ/7oI=;
	b=BjD3bphJW9TlOUrPsGqSDoDwANwo3EI+vdQABFunJmRKFc4Js75E6SXpMJseX/9FBUMX6cDv+CHQY6lCt+Cf7NFcQEhvsgPfCsL5VBFtPhLuWeHEyXFX5HIfJA4uz9gREqWo9vtYL4Wyekwz7Ll6rPNfmV/y/5Jr1bGYxy/D0esR+t1ScTGaFruVoPrw0JT+4cwxtkBxPFvTjdIPwC8OMVPDO2An3lFpQOwWWgh9Q1jrVUXMO0DjhEBj2kgiMImKCjdsKZu1Os9rG18aXKKAlodbYt+bnmixbkNBsKEGhC2uqAmbn29T4zdJ74BY0ZgUIX4nKkkLGGU799FGx3yDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=755NqEYgPVqyO2BBHEfypbgZnLYfIGrRQA7OmuZ/7oI=;
	b=Q2KZ6OLbISqTcSBlS2LxZZLxeRA2jYkvOnaogpj5ifKlQhl8xfANfmTovgBtfJC8d9fiLb6SlZeJviAfl4pci3j08f8xUE71IkMjaFbJUIhAOnQczDmSD4lgd0j6D+NbuzAV7btVMOsH8c3dMYKAtxhmIUCb88gdZHYZNB0EwHk=
Received: from CH2PR02CA0019.namprd02.prod.outlook.com (2603:10b6:610:4e::29)
	by SN6PR02MB4783.namprd02.prod.outlook.com (2603:10b6:805:9e::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23;
	Thu, 6 Feb 2020 21:45:24 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by CH2PR02CA0019.outlook.office365.com
	(2603:10b6:610:4e::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23 via
	Frontend Transport; Thu, 6 Feb 2020 21:45:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2707.21
	via Frontend Transport; Thu, 6 Feb 2020 21:45:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1izoxe-0007Pt-QB
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Feb 2020 13:45:22 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1izoxY-0000dc-Ua
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Feb 2020 13:45:16 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	016LjCr5018979; Thu, 6 Feb 2020 13:45:13 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1izoxT-0000bk-DJ; Thu, 06 Feb 2020 13:45:11 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 13:45:11 -0800
Message-Id: <1581025511-18119-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(70206006)(70586007)(356004)(2906002)(107886003)(2616005)(426003)(7696005)(44832011)(336012)(478600001)(54906003)(26005)(36756003)(4326008)(186003)(5660300002)(8676002)(81166006)(81156014)(8936002)(6916009)(316002)(9786002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4783; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1033aee9-1e78-4b2a-e612-08d7ab4ddebb
X-MS-TrafficTypeDiagnostic: SN6PR02MB4783:
X-Microsoft-Antispam-PRVS: <SN6PR02MB478324525294A15B34746BCBAF1D0@SN6PR02MB4783.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 0305463112
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDFKZsuXlG5w942wz5cdBARvPRIADJ3MbSkX5p3p+HqzfIcuIikaxcQAcn6DQogGIs36WwZmaKD5HaNPj4pc14XklpwkEs+MIijWGnWTLV2yBolAfkaaw+h+hrsraSwSvqGq22HC7k00EQRTnTpjJUWCeAcDcvyR3sNPViiu3lEXFsX0Dr3vSdycG6L0zwUVLN5ra4b5aa/73va/OejDsOZ4QHT0fM4RatkJ2T4x3WEZFnqgJI6xEc9Xj/KTT7q4iIwamXul/r1KCpWiFIysR60xArQZDzr/ELxynElAtp49MZRVzXzkvZUsFV9W+Xku3rXvrWoDT8nafQvibJXRUnOp0wghZ21VI7nKchKHSLii8i4+FF09UQtK0ag96jblN4EIbrZiaC0N+CM2UV89oVPKbrO6qgn5j7bVy3PmhcABwjL3DMh2xvMnwoTjKHI/
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 21:45:23.2621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1033aee9-1e78-4b2a-e612-08d7ab4ddebb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4783
Cc: Mark Hatle <mark.hatle@xilinx.com>
Subject: [PATCH v2] sstate.bbclass: fix issue while handling long sstate filenames
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
X-List-Received-Date: Thu, 06 Feb 2020 21:45:24 -0000
Content-Type: text/plain

When moving to python3, divison using '/' now returns float instead of
an integer. In upstream commit b8025e972081b70960ffcbcbe43a7118041556a1
sstate filenames longer than the limit are changed to just include
necessary info + 3 fields just for information. The space left over
after the necessary info is divided into 3 for each of the fields.
Using '//' instead to do the division to solve the following error
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
v2: used '//' instead of casting to int
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index faa6470..0beeb33 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -20,7 +20,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
         components = spec.split(":")
         # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information
         # 7 is for the separators
-        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) / 3
+        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) // 3
         components[2] = components[2][:avail]
         components[3] = components[3][:avail]
         components[4] = components[4][:avail]
-- 
2.7.4


