Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.60])
 by mx.groups.io with SMTP id smtpd.web10.11086.1609749081634372277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 00:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2Vbnz1cz;
 spf=pass (domain: arm.com, ip: 40.107.4.60, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QveejYbPE6ONz8Q5KUF4npbabicL/tiefQFs3Ozk8R4=;
 b=2Vbnz1czBjfAeYf8AwztB7cyryXliYwodJDLMNVHBlQPb9PAsYEtubJNjydh9FQ78cqhlUSCZkq7Jl7fTapb7CxtwAKVbYlMQZ9rRXOev5aSNv7PS7JzydpKr8i3wGMptmzaKz76RdgTAqVuHhE7lAlsx0ldJU2530l6Qn7ztb0=
Received: from DB6PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:6:2c::28) by
 VE1PR08MB5247.eurprd08.prod.outlook.com (2603:10a6:803:10d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Mon, 4 Jan
 2021 08:31:17 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::f5) by DB6PR07CA0114.outlook.office365.com
 (2603:10a6:6:2c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend
 Transport; Mon, 4 Jan 2021 08:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Mon, 4 Jan 2021 08:31:17 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71"); Mon, 04 Jan 2021 08:31:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 481a69137b738fb6
X-CR-MTA-TID: 64aa7808
Received: from 18bc18df7b04.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7567CAFE-7D9C-4BBD-9EE5-B4EC6DE275C1.1;
	Mon, 04 Jan 2021 08:31:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18bc18df7b04.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Jan 2021 08:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKxqwOU0I/riERP2DVALzUU9mAsDevDaVGs8p0drxWb979DHgg/BGGzOwT771d17byM+CBLnIIGpmMm9K9W8gOtvSc/1IM4+hqrIdCzzRCJ8qPljN2X8+J5lSKapH7G9vC4xqB4WvSvSCYkenBU9w0pjsx38dI886uYRnrl43YKECO6TloAZM5/4mVZLdTRn3wNVRFnQqWps4cuiEUwa8xnxgen1A7oSMwXixSTjLTgyVgPjWqP3JKlQvMMUC2eQB+ZXA6gKBZY12rpb+4sQhKBqCB30Uklax+e5NV4DuG4sV8R3bytjku7bxLCJwM1OLrw6McWO0YPklniKgS9Big==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QveejYbPE6ONz8Q5KUF4npbabicL/tiefQFs3Ozk8R4=;
 b=BJmTAQSPmJqhHf7hl93Xi20qivKKJ1dllXAI8zGv4ZzL+X5qyBzd/IJXZp60tiZ59wvN3YA1UhqWH3dU6KXjtmX+Y5nu2G5Imd8Uag+nsgCkUgA19Q52eO3z23nx4c9WYP0EZCINaoCNaDNhFW8Cwepcv7Gbzye009P7Blll+N4TZfl9IxzI4MPkuXwwFttMJuroi5DYjvEffImMVgwgtiX67loNaEufrNj26TnJfseFnFf3KPpRkRkoQ5DPjxZ4tVI7hKnPYjZFI7B2qsWBLIfYalgmUueYdlBPsl5hAd5OvBkENd/N2D9cVcMPInbeH72LjRgIckCBAskiNB1ESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QveejYbPE6ONz8Q5KUF4npbabicL/tiefQFs3Ozk8R4=;
 b=2Vbnz1czBjfAeYf8AwztB7cyryXliYwodJDLMNVHBlQPb9PAsYEtubJNjydh9FQ78cqhlUSCZkq7Jl7fTapb7CxtwAKVbYlMQZ9rRXOev5aSNv7PS7JzydpKr8i3wGMptmzaKz76RdgTAqVuHhE7lAlsx0ldJU2530l6Qn7ztb0=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4136.eurprd08.prod.outlook.com (2603:10a6:20b:a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 08:31:00 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 08:31:00 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
Date: Mon,  4 Jan 2021 08:30:43 +0000
Message-Id: <9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::24) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.49) by LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 08:30:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34748768-1c99-4c58-6cc3-08d8b08b1aef
X-MS-TrafficTypeDiagnostic: AM6PR08MB4136:|VE1PR08MB5247:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB524731CF7F3E0648BFE648CF92D20@VE1PR08MB5247.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:207;OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1rzXbCiNfBEYIU7cM9YjDdP4ZgPLK/FsKthLqpmrcAU+5xrH0j9QbNZ1RGccmOyf8A9RNJcVzxlBt5CX0I2qohvSTA+bynVDcOYLsAPoSOYuMnoQT25e/mMOVo4S3B7ISSWE1ZpsEA/D0Ofc1ao0VRvbKZb0EaOSGM9qSMQ4YpQk5Em5/x9hVFV0tnyCUwTRbNOiaLYWIHxgm4EzGdm1sUYUk64zCXaE7IrFV9HQwNpcNZsw2n9I5dqSUHP3cOrw2f6lMuGriTgRDY9QQ8NBP4sNyzPbSyKN4t21oTesOkgC1rCKMD3Q4dIUeadR/3rCKqlLozm8AfEIgAO5Fnrktn5KmW7F4FzZEdmb9nCHoP+7uXS9/PTwW0WHQCOkYbdASBvTmHu65XIUsw3vtbRJnnCL8q5hmlcTeMJPbDXSWDE5/IAtjiJ9aWODLUuDeN48
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(366004)(6666004)(36756003)(26005)(316002)(86362001)(6486002)(4326008)(2906002)(8676002)(8936002)(16526019)(6916009)(4744005)(186003)(66556008)(5660300002)(66476007)(52116002)(7696005)(66946007)(956004)(2616005)(478600001)(44832011)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?GHip2jlZDiOpROM/1lMpM5G4Yt5J9TgXWFjKdnkiIJxpZJUQgcsyPYPWZOsX?=
 =?us-ascii?Q?R5ZhoeZ+R9hMWGY1GqPAtNoPbZEam24cC74pAHt4v2TfUMDS8cdHZh1x5O5T?=
 =?us-ascii?Q?vqZQBZ5Xb3gXq/pHaUqC9qNWdt8qZPtIoirt4G20/axJUqRMF++yNEmTJd5u?=
 =?us-ascii?Q?wTpTqoNd0kurQ5V12XnusIBdr3RLsK9kujuuOmQ8z2DhPhbE+Ue5lmBcXvpE?=
 =?us-ascii?Q?beH66BnVmW4OSjKl5BuVW6ZGRYlOiU2weVAslQ+YWt4GAfQngQfcx8+57035?=
 =?us-ascii?Q?U1PujkxqjN2fLzAj30Hr6QeXCxoVO+KXoFv/k8r6aMvAOSJLSnnhhmtLK7pq?=
 =?us-ascii?Q?uhufDEyYoMh4LtCl3VFgK/CTrNFyql+yYjUvyOEBF7GQv6B2OjAsXpsD24cE?=
 =?us-ascii?Q?i1XasKrRqtveM0SYZLfwkwARLmwqMzyBlf6Ej/y1VmPnu6+POGBU1ofFEmJN?=
 =?us-ascii?Q?uUWAgAY3/VeGBWkmAXdxP9auXRUnJhpeuDYAEzi9XmySN/koli0kZOfOKm3K?=
 =?us-ascii?Q?/bSVyd6pXy+1yrIQ7pLwkEkZTrDOJE67qwuwbdpuPScAe/VxSFaySgnxgM7D?=
 =?us-ascii?Q?ggd3ic7WZpx56BiAgnJfOEuJyEJJMoA7tfjbAQNA/v8oHPQ5hrheAhiONNpV?=
 =?us-ascii?Q?M4B0dJLAcXCHBCoLhsBfqtmNKn/NLD+zcRbi1GVKh9X+Qmg9QdqWlOpFynSH?=
 =?us-ascii?Q?rI2JhgTxNKDS6LFyOq4w9W662kOdEjARkfB5BSNXNZocMPKB/rgEFVtULBAs?=
 =?us-ascii?Q?CYyXn2aUgkEhS4aszB0/cpHN2asVO2kY+aTZWBJCFjxaOoiDw5zXrJQXLWkC?=
 =?us-ascii?Q?bx4cVmPcONLZIuqO2r0TryNZh9HeT9ppZ7VCzNW5wgVr/DXlCsJ9lgYs5AvZ?=
 =?us-ascii?Q?rhqOvle5H3O1Yfs4QCxq9a4yC7iG+fRinUJF6KC2LJYodFv/DAmEjEmvMv+d?=
 =?us-ascii?Q?/JcjC+JVHoT5NBPOxF7aNbDzQgQ7BSiVVZo/6YRg2TAMOcEoRlcxbaPjAB+g?=
 =?us-ascii?Q?TiY0?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4136
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	766c11ee-6c90-4eee-d156-08d8b08b10c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qYHIjzH9nFlzLgVEMyEXZuzbrvl0BynCMh9trpPI6tPlS/8uZhzxFUZBmNvTOpZrYXVIYNgAFVtbYcJh6DdUqnUPtBGwwdYuzAuJjowqz//8f2Egl/QY22aNWNLV/+4ZhYRYBjpEuhw1vrIT5ME0urDGDYDZOeEgai8nENgZWDQ7gMhZRxDR6onXVrTUspSmCNM5+7C4cPgKUfRparZjC63IXDQfoR5/bLdTffx9ApBhKDzWxJcBNbtpbes5qzD8aRKzMU/ZT7e/SPt89CQtRGg9eXWsy2gmhg9w0UDsyZoqRkkJXbq6gGKgAcOGiuX0gRy5c3lWEo0UvNl+pSopjSzLpcCW/05rTeEP4/TtbNNgV/gch0h6F2zO9J5y0iVgTs1JCYQ+wPhKupj7y6b3nuTlYr0JFXuFTnYjxZyFL4fUI19jkE/VsPd8b8HZOK8D3ZvVbc8+mkzADUr2OBlX1lO+x5bLmVqntoMmj6NQcUU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(70206006)(16526019)(6916009)(70586007)(8936002)(47076005)(336012)(26005)(44832011)(5660300002)(2906002)(478600001)(4326008)(6666004)(6486002)(316002)(82310400003)(2616005)(7696005)(186003)(86362001)(82740400003)(81166007)(4744005)(8676002)(956004)(356005)(36756003)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 08:31:17.1701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34748768-1c99-4c58-6cc3-08d8b08b1aef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5247
Content-Type: text/plain

Since do_install is shipping files to /boot and ${sysconfdir}, we can include
these dirs to SYSROOT_DIRS and allow recipes which depend on u-boot to use its
installed artifacts from RECIPE_SYSROOT instead of DEPLOY_DIR_IMAGE.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 251178db33..c53bcd05cc 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -266,6 +266,8 @@ FILES_${PN}-env = " \
 "
 
 FILES_${PN} = "/boot ${datadir}"
+SYSROOT_DIRS += "/boot ${sysconfdir}"
+
 RDEPENDS_${PN} += "${PN}-env"
 
 do_deploy () {
-- 
2.17.1

