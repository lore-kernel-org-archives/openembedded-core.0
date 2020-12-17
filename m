Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web08.6446.1608204239452428885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 03:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VLPGVJXv;
 spf=pass (domain: arm.com, ip: 40.107.7.51, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3CkgvdLrvVuvEwKFh8mBfEEx7Y4jG69Zdn43RgUGA=;
 b=VLPGVJXvTtGKHzYX38rqJ7MTXFXaa0/yVoFFul87X2eh7OruItjnnO3yX+sfQtofskl4uL5XllF5SEtLOJGtjUJih1N53iHeqDmv+N7FibfT2Xgzq5eyAlyuTP93xPAufFtdSlSrTSz12JOrWhL3nWRIIZQHDUnXJ9jVmNFOy44=
Received: from AM6PR10CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::24)
 by AM6PR08MB4309.eurprd08.prod.outlook.com (2603:10a6:20b:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 17 Dec
 2020 11:23:56 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::84) by AM6PR10CA0047.outlook.office365.com
 (2603:10a6:209:80::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.25 via Frontend
 Transport; Thu, 17 Dec 2020 11:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Thu, 17 Dec 2020 11:23:55 +0000
Received: ("Tessian outbound 76bd5a04122f:v71"); Thu, 17 Dec 2020 11:23:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c22bcf6a28cfa8f
X-CR-MTA-TID: 64aa7808
Received: from f5d83499d69a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 701226B7-471F-445E-943F-4362043B9C95.1;
	Thu, 17 Dec 2020 11:23:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5d83499d69a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Dec 2020 11:23:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg8mQ68fxrBuSF+eSpjEkZ2gVqykFtcZ3EH8be+AH99IhNwjh3IaZhld8Xs1R5o95/pQhp43rXccjSUsdxJ3c2iswe3W3genv7KZGuzemmt+dszLWvP4CKdKx2lyvQJcp4FnHr4PmRSquWjVy8HHIHyVjsJqKLjWHjJYLgxjjb0XuypCdvUJlDsSqSZOY2DCmXmPYAs/pI1UTVBZGmOGrPYW+PC41qtJ0dv0XsArQ7fWL+2qkEGKxnFWiRjeiOZDx+HlJMH35xVrb4m6Dv3s5LlbWQ6u0wCG+2dwuk6TJdG1w68Mh5uZXJS47W06wUM5myM8N7bhDi7SdXCMNLe/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3CkgvdLrvVuvEwKFh8mBfEEx7Y4jG69Zdn43RgUGA=;
 b=LfJU3OE+UNi3jkMUvaiKHixyhG55FAUGOu3DDL81R2Zgj8tAOPUTv5LzuH4LQmw0EX+JItGUPeKdCP4cGhPXXSISR271CecJv7DiOSW40K3KzXX2Z0iBHHb+nnlAWcD48u+rScwHKAvQmH6k2ouEAIugGnxDXdNFCXZfmqHeE8wdHIfflE+ZYZqYXYjBucxXUZwGKVYVU0PpPTID6RQlPYF3Bdez1ixMVDwhVjwmHQbBODx4qfGAFlGWWAsy38OPnzzF7W4utTmFC1p5p4fjzOpSGgU5sDvoDgGzxv8fsM3YT+mNtMgWSxwDWEsgVpPK26HT+mdkY6t8sFTf8q59EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3CkgvdLrvVuvEwKFh8mBfEEx7Y4jG69Zdn43RgUGA=;
 b=VLPGVJXvTtGKHzYX38rqJ7MTXFXaa0/yVoFFul87X2eh7OruItjnnO3yX+sfQtofskl4uL5XllF5SEtLOJGtjUJih1N53iHeqDmv+N7FibfT2Xgzq5eyAlyuTP93xPAufFtdSlSrTSz12JOrWhL3nWRIIZQHDUnXJ9jVmNFOy44=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4659.eurprd08.prod.outlook.com (2603:10a6:20b:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 17 Dec
 2020 11:23:15 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 11:23:15 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] u-boot: set SYSROOT_DIRS to /boot and ${sysconfdir}
Date: Thu, 17 Dec 2020 11:23:01 +0000
Message-Id: <51459a27f768a62cab37aabf5a5253e2756a0644.1608204009.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO4P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::8) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO4P123CA0093.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 11:23:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24f8b4ae-f185-48ec-fb7c-08d8a27e3dcc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4659:|AM6PR08MB4309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB43098D298C35D5C1C8ACE2DE92C40@AM6PR08MB4309.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:207;OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1YHEE6hP9Jvl9SOV2wnEl8yTEQSqHvoTGNWTahAVuBfAug1QpoTyK20LNrskTxycT7YfyzmZ/v6xZ9/QhILOJHG0cZOaKS1UszFsBkmy6i1Z0/CPVgaiJv0l+7IpE2AGD4zQwOQjVi3IhQAmD4ozflCPHuNE/Ibw8P7UIz2HVDJFly6r+tWZFGHTNj4XZV/3d8/00iI0fMNUB5LTwlDuxNNyFSekV5fjakT8/YntZEqpGeQcz7E+zYKmtI19UeJrKZJeqzgE+mdwdP0Q2CB4/ui5FwQS30CD248DTG6CIxdELjUKHmAVCSqkZ1DqaIXra/rpXRHXsdbCczEuKWxAK3grTCSB0FRImbKPc9DEXZkDMHC8se7BZqt4KAjCKm1L
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(7696005)(186003)(16526019)(66946007)(6486002)(36756003)(44832011)(66476007)(66556008)(956004)(6666004)(8936002)(478600001)(86362001)(4744005)(26005)(6916009)(8676002)(316002)(5660300002)(2906002)(2616005)(4326008)(52116002)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?EZXG6ENd7oF+deRgmkVC408p5uju11cnl2uuamI7dJ9kVBeLmcEivMjqFquP?=
 =?us-ascii?Q?hn0ylMkbRRyk2/ghgmAN3bKkiIXK0n4zQoB+Umyo1M4foZk7FGTPu7gmgqzl?=
 =?us-ascii?Q?5ryQJQOyQUuV98VrvENba/5Cyag8puOtauaRaBuA/G7csD2SjZsJnpCOE0i/?=
 =?us-ascii?Q?7VGQGuxFt5spVCOHYjuuCo4elgahshVfIBTBtOEzTY8NDtxUqsMEx0fwpAF5?=
 =?us-ascii?Q?HFjAHndxykpSG87Aw5VbSfgF4aCgK3PV94avz1U7gPFbRf3qqSgJscqN10qw?=
 =?us-ascii?Q?OlYgDUSzk2RxZv+yKIMLR2FB/P2an3hY89LLGd9DW7/hXwgIk1687rlGokpM?=
 =?us-ascii?Q?k/gIGCUwFuW8UtwXGO6apsgFAv835rHClNCcJM23+O+WuOQjFKw6AhRfroj/?=
 =?us-ascii?Q?7GYFZjCHTmxOg/3UV/SQTGJ4NBcbXnzgARz4mb7+/cf8gSprJmDvy1Xsc1wI?=
 =?us-ascii?Q?fauqZEzkJ/HSU4pwaiDGwHIr+Qu+u0bQLQOfwtQgWair4LTpiw3nU1+EbkZL?=
 =?us-ascii?Q?n7YNmQ2Z1YFjEbqUf51Fl2EHGmwa/z1rRqmDwV8JVhqtn0TNzSRsBZnjVybh?=
 =?us-ascii?Q?I1+gcGPnoSoYvPlAGDYEfJH0Vm7InoFNWQXTSFy3h9TCmwXSXeSPTkZJYOwm?=
 =?us-ascii?Q?9y90qJ2Mk3Yrn6St5h2apct9QjgsdmTOzB5kPtgQ1owWK97wTUYc2tpwBW7w?=
 =?us-ascii?Q?sjPDc1gGypox+mNaAu13V2OTGeQWKFjSm9yNKbs3KC28R2okMF1nS/NVlh7C?=
 =?us-ascii?Q?T/Z5RKMxSBxv+NyfXWtLguDmhnvN48N8AbCE7mXUG45J+tx3TunrRrTBjKWL?=
 =?us-ascii?Q?3PPCNBurnboHtjCl6SY5P32QTY1o8ch7OjrYEZqRisgHllJVVEmFnzEhff2L?=
 =?us-ascii?Q?bfT01tKwhUN9lLuV2MK8O2Sh8CYl0CuPMfjs/zCKr7s2vVVvRchALCcZ1CRy?=
 =?us-ascii?Q?nlJsfX4Qp6uS/ynNks6nZwOOz4caOXxhzCTJC28gB3bqyO+By5sXG7nEaY+r?=
 =?us-ascii?Q?P3vJ?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4659
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c3a00679-9395-40a8-9cad-08d8a27e25cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9HCi8SIE/wQ0vqaS3cBoenoMdbeA45/nXL7nKHw+zsZGI5zjqc5biz4n4TLuB0w6f4AaVIf/Wf2jJG5EvmsE3wy27fh5vN+8rW1X6Q4inCJyY39HX9+0VAiTW8fQZNfT4/00l4AW9LGNYKoP6i1hDOlWbZv/pzGCQ/WQjHKX7lkmO2FlSAz913OOTCHJBejy0rjPJL+itpkeEP6u+5j4s5wQisjpqtDmno1mnlx7kaDCvu+u+ntmYHZP59nEeyEUyrPZH5N3Ed7aH5Q1/0C4e8xgcqIKB0dk/7iMze1R5pPGcF5PiP8LQ++hDeTHhRBFTPvuZjKprEIepZZ1OeZ6Ig3LAzA+3BvS+vGfqfcvGJUvIiDMlCiRc+4W34nZaqwFVIJ2RzA8fGotl0Akr/3Kjk1Znr61z2ervvgCx8cg2mWKHfO+zcMrdxzMYpIKMrbSItIFKjSPUtS6YuPxuh2EO/H3yxajc5rKKwVO44uUlYg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(47076004)(70586007)(4326008)(8676002)(82740400003)(316002)(70206006)(6486002)(82310400003)(86362001)(2906002)(7696005)(336012)(186003)(26005)(5660300002)(4744005)(8936002)(356005)(6666004)(478600001)(36756003)(956004)(2616005)(16526019)(81166007)(6916009)(44832011)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 11:23:55.8068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f8b4ae-f185-48ec-fb7c-08d8a27e3dcc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4309
Content-Type: text/plain

Since do_install is shipping files to /boot and ${sysconfdir}, we can set
SYSROOT_DIRS to these dirs and allow recipes which depend on u-boot to use its
installed artifacts from RECIPE_SYSROOT instead of DEPLOY_DIR_IMAGE.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 251178db33..6af0766571 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -266,6 +266,8 @@ FILES_${PN}-env = " \
 "
 
 FILES_${PN} = "/boot ${datadir}"
+SYSROOT_DIRS = "/boot ${sysconfdir}"
+
 RDEPENDS_${PN} += "${PN}-env"
 
 do_deploy () {
-- 
2.17.1

