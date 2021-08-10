Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.89])
 by mx.groups.io with SMTP id smtpd.web11.75.1628613680017244641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 09:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JxP/r78x;
 spf=pass (domain: arm.com, ip: 40.107.5.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91mNZza9w/88VHih091JPwgDxSyu5tbZhoIOh+Yx95E=;
 b=JxP/r78x+3Lt9hgJcq+4I4V2mL2goMW2ujOVG6sWOVaRQupSLHjIJAx4UXeOy5cztaQhjkNrB8iB50tk/oiUHQV0w/XBkYGOXChwv5JCNWJNKlzSgXMh2kpFxY/F22U4PK31niyYtuQfPMoXLsnmsPkPsrViDudHldrBedxci2c=
Received: from AM6P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::34)
 by AM6PR08MB4722.eurprd08.prod.outlook.com (2603:10a6:20b:c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 16:41:14 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::94) by AM6P192CA0021.outlook.office365.com
 (2603:10a6:209:83::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 10 Aug 2021 16:41:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 16:41:13 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101"); Tue, 10 Aug 2021 16:41:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0305cf6205ac8623
X-CR-MTA-TID: 64aa7808
Received: from f20f8fe924b3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D469A3C8-9833-42F4-875B-6E6E1444C9A3.1;
	Tue, 10 Aug 2021 16:41:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f20f8fe924b3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Aug 2021 16:41:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThvwgmVlfHYZX5AfUfY3rnhr7p0Fo5znY1aosDgBtm9YGsfzk2qJ6Lp7Nx19Anou2atyureqk37SOgDqfUrXw0bKJnjX0naAbQ0thBJvBIj0U5es9gRVA2xUiVuFGkyN6d55eFXSQh3ArrTjDOcqXoY7Wa5u6ozHPig1eWOFnzF/y4DM3UITddR25dnO+e4CZhGw0XXDeHuHcnZkodwARvNJlgFbky2JlONzKmx77CoDnoLPuRJE3/UqiCgm2JToGbVaqEw/qJ0YFh8xoHKvDOeMsRCrDCgNwm/yi5H4qBC2w1PI/ft1QC847HmUm9QBcdB+j1O3f0CQq1KxIuU5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91mNZza9w/88VHih091JPwgDxSyu5tbZhoIOh+Yx95E=;
 b=W/ZKJ+FyCWrkM4LPOE/S8wpClqWOJ4xNhGfMe23UKdKrGoQNW3lZ3kKsl7WdcqnT7oscwV225y61aUxN071XJJUY/7yIaDWxO9Hew9Wl/OjamNFfINw7Ly8/JesiAHKCXnh4S7IIUNQiLiJfh4/Sf0/JQQPiet8eB67ElEBDj+y5kRds/BDcN/CnntvbH0UIrjUzqZLRGbCItCfyhHoRym3quxhnpK6rCGwU5joPN71+YhGpkETuAvwtmpGE9zv0pkAPei3UfMetfuhqxlD+Bo3gHoyxjVh3DShH4Qm0RWLfDbmqirlgNpXbY+WnURvb2QQBXtJvrFul1lMr4bxV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91mNZza9w/88VHih091JPwgDxSyu5tbZhoIOh+Yx95E=;
 b=JxP/r78x+3Lt9hgJcq+4I4V2mL2goMW2ujOVG6sWOVaRQupSLHjIJAx4UXeOy5cztaQhjkNrB8iB50tk/oiUHQV0w/XBkYGOXChwv5JCNWJNKlzSgXMh2kpFxY/F22U4PK31niyYtuQfPMoXLsnmsPkPsrViDudHldrBedxci2c=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3687.eurprd08.prod.outlook.com (2603:10a6:20b:90::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Tue, 10 Aug
 2021 16:41:05 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433%4]) with mapi id 15.20.4394.017; Tue, 10 Aug 2021
 16:41:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] sstate: import errno module in sstate_package function
Date: Tue, 10 Aug 2021 17:40:51 +0100
Message-Id: <e6018e38af78238e5fe278a9e70a6a95c9f0680b.1628613577.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0037.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::25)
 To AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P123CA0037.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 16:41:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f53c965-bd06-491c-096b-08d95c1daac8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3687:|AM6PR08MB4722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4722056E99E6EF1DBD2424CF92F79@AM6PR08MB4722.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1g0fYU3Ey7IViGvgBEabOiVj0KDjZkDJMDa9Fd+2J1R7emyUrlxl58I29L1gZIwIrOYTY9dTZmFaJKNWAHYhObtMOEB4orCkE1LEG/gGvYiGLY0ZRkWk9bxMhiHICZ8QfrcmPKeFVCc76Z0ZoHCO2kxeFzaeT27FOt7QW+7kU00/C97ZhGAo8U2eD+GkFzM3YDc3I0RpS7VlW7/F5R0GR/IZpw3yv7nO/RFfQ+0qwQ3NMb9RpYWffjqEtYVc4Q/Eyh/RLba2uTZsNFfeam32TdwJRtzsk+evtRBuYHAjrJA6Ws3dFd3mnX8c4cRrYOt3KC4Cowu3uZh/EW8zXibTH8sn2/qqtP8ZLnC/IjOBucrF9/7zkgTWfsXAAhghvDMIbtQiclaaY1waALtU+Kc3d2yRsxvsHG8L4nqiYB9TD80I9qIKYl4mk+HPutBSJ/wWLw3Q1zczuFbl5GvI1l5gFYlq9SzxMhVrE9jghJdxHjz5RFOJ8frWC1m/cetBR0prRblFv9wy4O6DOPnN1p2e01o5ArAZCz0JL4Io1OPAC5s/TKMMrdeWbK1xpdoNIS4DhbEkie7d4mA8OjOlEgtCeV+bi66GEsCm1DvvFxOPPBZEjKBVeMciQ4IqPhpPNahRKUrH7PaHEoLKn6Vj7xHhzh/Bvcp7Pd9/W5+v9goQ+H6uVpccb8smolwqzL7A8Fz1M2n/l65iRLBpykNO8dONhQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(5660300002)(8936002)(6916009)(44832011)(316002)(66946007)(2906002)(8676002)(38350700002)(38100700002)(186003)(7696005)(36756003)(6486002)(956004)(66556008)(2616005)(508600001)(4744005)(52116002)(86362001)(4326008)(6666004)(66476007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?lF+rh2p/FKqyFYO2O7WA7xTxOfwO7m7WKdpXtjEnu2u1AzkotsIFzlnvlqCK?=
 =?us-ascii?Q?ZoqUdThsU6fT6bn9+jPl7PFZM0mplBTCwNH6EWY2ICzOronXy06Av72LSNta?=
 =?us-ascii?Q?6i7sc02tuL94JcRJ1EtS+Va91bVx5p746/lrICVt5GdbNgLNxlja571fIkOJ?=
 =?us-ascii?Q?nOHgp1ZRivXy393kSjT9hDBY1ugujTbPYM/G8nccm0iNoNSwJm7oLe7jJsax?=
 =?us-ascii?Q?uWZp63E4aLocNK7/ev6Dzp/g1NyENUV87nC3zIB5m4MqPDbQmCzdHB1H1dpu?=
 =?us-ascii?Q?27JuY1gOD60Rweh+rGbMWpn2pIUJzoIEQpHa8xTozyJkL1Lht0iUh7EJLpfp?=
 =?us-ascii?Q?bdP7vS82KQWrXolNRyMkngaZKP8oHBMZr3pDzdNKkRkD5ycmnTr4jJ2dCLeK?=
 =?us-ascii?Q?T7Ai3C+T1ATh8gQ6/yhYsAddOE/pSHPP5gsJ6ClWxzaaWaWSATsapV8h8C3C?=
 =?us-ascii?Q?eH1FJKdxSCJu3ciNNL52yE80HVbCG0CybKGXBEXotB/Ydy5xspgfhNe5Vzvc?=
 =?us-ascii?Q?GD6XBSB9WiyG6wTMP5tXw7mZcTlwDuGtRtE7UAtebSrX3zAa4Wmv5e5cHAir?=
 =?us-ascii?Q?V+9rDa4MZAsjC2hYcT7Y+cWtHSur++KN2X995oo54ISjKjzFJmQW9FOyxKoB?=
 =?us-ascii?Q?mJcwwubHh2BKxT3R4kq6hYF+gekyDXZc2J1kqWGZMMSOOYGT/sz5ozAjbEdf?=
 =?us-ascii?Q?mlk0beb4tna7KjKs90w6o2X1R0x4RORfK5j0zoD0fSNS+ZmVbgQRUcwW5bM0?=
 =?us-ascii?Q?5lTAAThpXEaw5RfxTfKfGxXrlSDFJavOKWLT2R1CwRuI68awfUVezZV7VOg0?=
 =?us-ascii?Q?U5Q0I4orHXZ0eFLVt1PqLGODEG+pcqfRN+Iz0dqGtTkf0/xizXqHUePsvC5C?=
 =?us-ascii?Q?nGZJsPVdv95PfOMAi/zLUOma7K41V9XWa7A9lHt+FlnfnPOCB/uMUR1FG4DK?=
 =?us-ascii?Q?xf91PXmO23UUGSkFIj52xX0A32HmJwAtsZ4qGas4Og+QIBirHOJisTm/UbJm?=
 =?us-ascii?Q?eW8iXBVrRd4bWDWfn4Uvrw2MAGeO2eamL3pUXKYSerNJ1+UwH34QCSwtOYCq?=
 =?us-ascii?Q?I3Hv9UYpRfJqjneplqDqQmcT0gUBhilq9MojqKQfzpFHGGPOdgnbFRg9BNBi?=
 =?us-ascii?Q?IGO/8NGOfY6EcThmSexFRtoXrI7fqf/FTVlNxZcPIApewBEmM0ZAFvAzIM4F?=
 =?us-ascii?Q?HKlzaFzerLNv60g0ykSoYmLiYWLcUMwun2+tO//DxaRkSDLYq/MytkhB3spo?=
 =?us-ascii?Q?C6EuCSZ3WR6byQN983SByHJmZhqy7KV65S3xIFAZWnpUPnAUDmggY6Pf7IDb?=
 =?us-ascii?Q?5U9sthREuTnoyBnGxSxLXaP1?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3687
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3f210b82-2a04-41ed-1f49-08d95c1da579
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rK1hl9RKgOwY2VD7P0FPPh3N8EtoD6JQ3p7draRPZwvj8/MSyP6SltdeN+Ra2vYzNDPiNKAW8QtPdbCA296RC7L2Kvh6rX0QHDOJ0O8fLsKR9f9v2Nws7SqF0FMogXQYCm6bS7Mhnk/h+XGJOHt2gWuXiO/pnfUSjgNwTwnGqFjYvlsVkWBD6fXk2fG2BSuMQN0nsgvQpFNRXndQFlYUt7KBEKrT89rTV3PAf2C/qQw9KvMboXkVqhr+ZgMtTKcvCcfNXl69QgP50RoTPO4yvUtrTOmnIohP+SjTxPDv+I4DBt7DIpTgGtCv1x6JxObCZPRIxQDwg6/VenMBSIk7xnZ4EKNT9CWPqeSQ5T3YmW9mxGP/tXxMzCDGnr+sdlZQTyBsygAyet6jaBi4TIoa4sWknniClUgZSVm4TYi1LRiXjnGd57aTgJZDTsVi9CE8IR1tvYk2ZCTrF/J17yFf40Ceg6lC1ZwDtW1DSultRCxZYGOxCCx8cxxM8h//LAtTU88IESR4YeNXDK/2j6tfrRN3sBGDpyIcFeAqO6cbagU5WpPJaNgIy5Xmod2Pkl7pWUlW/02snQh4ZAB1CyIa1CsRDeeY7kwTMk3RzikfTYBdVexh9Vr6FIfc8fQLip7sztVpDApWTuvwkjMQeZgbAxAmBPT8oX1cCybgaV6WCLzATlHznQtsK9IlYLtGFyfVXO4R9dw3p4DLgxkSU9LGFg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(346002)(396003)(46966006)(36840700001)(70586007)(336012)(4326008)(8936002)(356005)(26005)(2906002)(186003)(478600001)(83380400001)(82310400003)(70206006)(36756003)(44832011)(86362001)(4744005)(47076005)(81166007)(36860700001)(7696005)(6666004)(5660300002)(956004)(6486002)(316002)(6916009)(8676002)(2616005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 16:41:13.8159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f53c965-bd06-491c-096b-08d95c1daac8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4722
Content-Type: text/plain

The errno module is missing causing the following error message:
File: '/<...>/poky/meta/classes/sstate.bbclass', lineno: 708, function: sstate_package
     0704:        except PermissionError:
     0705:            pass
     0706:        except OSError as e:
     0707:            # Handle read-only file systems gracefully
 *** 0708:            if e.errno != errno.EROFS:
     0709:                raise e
     0710:
     0711:    return
     0712:
Exception: NameError: name 'errno' is not defined

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 554e401ee2..187cb04534 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -640,6 +640,7 @@ python sstate_hardcode_path () {
 
 def sstate_package(ss, d):
     import oe.path
+    import errno
 
     tmpdir = d.getVar('TMPDIR')
 
-- 
2.17.1

