Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web08.13931.1619018734987388294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 08:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tcOFBQhM;
 spf=pass (domain: arm.com, ip: 40.107.20.47, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmKI1ANG2JfV/JaQ03dg6qP77I/YChL2AOySBpu73iA=;
 b=tcOFBQhMvvJwjvlpJFfiQm/ku8lf3nSalSslvHMoaK6pvNoQsyd71Npg4eZYhb5o/xIPBg/A1uWfQUd4GjTEdM8MTVStqyoCKfnqsfF9VSUTSOBkcNIRHLwYs86hOHkejPLvosWuvKcrgrQ+CN6NCmWvIvtFj0nTzR0bc7QK/gI=
Received: from AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9)
 by PAXPR08MB7154.eurprd08.prod.outlook.com (2603:10a6:102:207::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 21 Apr
 2021 15:25:32 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::c1) by AS8PR04CA0034.outlook.office365.com
 (2603:10a6:20b:312::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Wed, 21 Apr 2021 15:25:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 15:25:32 +0000
Received: ("Tessian outbound 47ca92dabae7:v90"); Wed, 21 Apr 2021 15:25:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 026f0b2b038c06b6
X-CR-MTA-TID: 64aa7808
Received: from c60fcff7c835.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8C5BA334-7213-461B-BE54-4244466E8321.1;
	Wed, 21 Apr 2021 15:25:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c60fcff7c835.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Apr 2021 15:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxj9h0abxhXrvFA7WrpWjf2CR2m1f+1w0A+6KS2n9UuN4c/2uBNIBCTLdb47TYqInTlNm8e5wE+nuiftKx6DkP2aPPLDTdT7rs76mKZSV9a0Ug8ZFJyCyhkJsjwojfl01VRjvzHSmm/G7jNSUF9FIvl+c1C6FbisfaH5SeF49TxLxQehniteu5t9OPAe0DzTmezdi7V8T3kpAOkhtwvEMPEMOeoJhqU5i/W3fhtlJ7Qlhw8PeMcNBI153AdKKppPN2eI+yNfPFYm5HRXfEVJ/YuSzBFj8bL140YUm2Bj+ghJn5A2tLgQ9GgqvyLs0soWrxjeQ7IPy9rzjSwRI3MBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmKI1ANG2JfV/JaQ03dg6qP77I/YChL2AOySBpu73iA=;
 b=L8cvoAj6B6LSdrNYq1GySLhzg5kJUBhSy1UJuODLef5FNBmPwq7VruZHhIY4RLl0PXQyIe4750VYqglYMR/TiVREUTW6LE5c6bT4Cbf4dd9oU6XlzCQKKXHVq6L80LO4oc3i9kiBs1lQ4ROfSAZ1o/KyslcGoCx5gb7VlAr/JZFmc2celKIBk2KOC2RNxtwJwOWGw43PxDV3do1SeTsPe1rzaHZQlO6qFiZ4fYFtDfKtG4MnR8+Zifl+18YTXZXmYXsN7N19cGeIWXsAZMdKVaEdUCEUMzVGRKJuA+x0sUPIoLsPewQ9Uxb9aAX/ccFGozTkee0mNqW1mt+FYTWPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmKI1ANG2JfV/JaQ03dg6qP77I/YChL2AOySBpu73iA=;
 b=tcOFBQhMvvJwjvlpJFfiQm/ku8lf3nSalSslvHMoaK6pvNoQsyd71Npg4eZYhb5o/xIPBg/A1uWfQUd4GjTEdM8MTVStqyoCKfnqsfF9VSUTSOBkcNIRHLwYs86hOHkejPLvosWuvKcrgrQ+CN6NCmWvIvtFj0nTzR0bc7QK/gI=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 15:25:24 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 15:25:24 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org,
	nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] oeqa/selftest/bblayers: Add test case for bitbake-layers layerindex-show-depends
Date: Wed, 21 Apr 2021 16:25:15 +0100
Message-Id: <a1eb3c6673cc042fc4b0be33a9f2ce14ba80ca7f.1619018257.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21 via Frontend Transport; Wed, 21 Apr 2021 15:25:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65d03111-73b2-4b8a-d0cb-08d904d9b422
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|PAXPR08MB7154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB71542C451D605D9CDD99077192479@PAXPR08MB7154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vA5nTADww4HMWCZ/pmQlvgD48BSp3KTuCOEgxRlMGp1/TT6GkFhy7BDYZwIGZ9OdIpt2lQAfI6qSubsuRBtNr50Kc1Gq1EZ97gCCb1vX5sTCoUvg5wFU8WucWIstdHEZTYKMuDF+eWqSUtRK/QjcYNhzVVR9MReyMQbXopvmoUorNwtjwZ9fB1JAxDIPc5oYHedu/e2xfxtxMNxl5qJ/6Gi8rVVn7KpOJ+f88oiTrcLAE9CDVdfcvBLhCQtbwQdm5vXsqkFWZSGkHzn2v6GXvLIjMiKeOI5Ah24k/5cLWbTeZ4PF+NUA69sLebmXZd2y7sC0kak+fYAgiRKlfJIqjva4nqOuUjc4S2gT8M3M7tuKHUsZlPrrkxSoH3cysMkMJuxxAfhFToCCZrJdvcGk+bMdJniSKRzB6HxgSXBHY/qyQS8KfIAQsZZd2R3yznmgiE2YOt5dMDCMhVAejXjJqx2rWr6VwjK9/R9zbOgfvq3Nvky9OtOd6f/pahTNtwrW/KTmOIJGgfXV1VTSzrPJUPF0AubabWCJDuMQfrolAtQ1rbI/exHUAyozSCQy+YCXuzxxs9MIIVGzwn2xNSpMFIDWeoe5YzXOCUhpo8zP5cGmgC3NXi5xl5IaWSr/u64APOgLm1a3Ny2MxEBK3gLrD5/NCjJC97ucJVYzdwZbIPQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39840400004)(346002)(376002)(136003)(956004)(316002)(2616005)(66556008)(6916009)(4326008)(8676002)(26005)(6486002)(186003)(52116002)(7696005)(8936002)(16526019)(478600001)(66476007)(6666004)(86362001)(38100700002)(4744005)(66946007)(38350700002)(36756003)(5660300002)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?KZMjibgqLxE5Dt7IQqI9HDqWu3zfNFEqcWUvu4dWFmGzfKba3eC3NbACp9Qa?=
 =?us-ascii?Q?UzENsUCEz90hECB6yNBDP/1Ia6gfjiIpGyJAABW78KMhhI2Di0HbsrLbOx9U?=
 =?us-ascii?Q?GVvCFwhXBLZMSMsxH7m0Fa/JbS1GYbwhjU8WqMDWpku87kvxaVYrsQ62J5U4?=
 =?us-ascii?Q?h6HxWcb0iMHvUKev6CpG3UtRjHTFzVYXq9qMvNIQzjFudRjtJKcPsKMqSJbU?=
 =?us-ascii?Q?c5ohxvq70NxDEqNuEnh0IZPrOXHDT/qVbNln64mY9FmbHRenV3aClO2WV67w?=
 =?us-ascii?Q?g6D0UnsqnUCbkQ1oaEEz9PPSjgsFq6JI2XPZreTXqkpEMLSNEYa2ynUPBuNY?=
 =?us-ascii?Q?2Q1yOY5yUlCmR32oYXcj9pzWjCUeFvz9EyCLpJwiOOD3dNUEnFCoK9tjrUIj?=
 =?us-ascii?Q?Xn0HME6bLCAKvm/KColgds0kSwcnB1YRZKwZGWXXzR6iBg7Ie2z+i4R4n1r1?=
 =?us-ascii?Q?1SblFA2PfxpOTC5vWVKkAuMd0POQqyZAVF23C8mWDI7jcXB7fFUAmMom7GOp?=
 =?us-ascii?Q?18jmRC18f6WHlGqmA1xUDK74dWAGroup7X9Ofr6kP1FCpLJXFH2SNL8Gyv6s?=
 =?us-ascii?Q?E3QwUdDzmmj5x/ql95eTku8SWK+Kp1j4OVHf2APIMPtg1JJKMoHsGHXxPizw?=
 =?us-ascii?Q?YiRSnuwK1df3VGv5ECrc+OvhHbSIBSvyoXqYZOC87IvQSg8NaZ5Bfjm9fXQd?=
 =?us-ascii?Q?jYIjGb+9PsLXA0i/QnTdfR56ykgZ3KR/La7Ffr0TeLdYdn4KebpyuFE240Ol?=
 =?us-ascii?Q?FSLJk3sTlxNpEaWBU+std0NZ3ug39fX/usOqzgpkDRdE8mgOk2+Q7hcq8c/R?=
 =?us-ascii?Q?Gf3qu5+gyZl2ULDUlr8yjetpSvf/nSilS7y0CklUlmfG0pEcCGiRxZL/PszU?=
 =?us-ascii?Q?37S7WISrmfDnEglxjzLSurir1qprwbIkv5+eppEbbBhXGBiuFB8yyF0STM2h?=
 =?us-ascii?Q?/20ufoBBJnaGzHyAOD0RAyFuXDEV5m5MUGNSGTqrQzfMPJbcGFq+dypGkFdM?=
 =?us-ascii?Q?SjhjH9/f104Wqxu6K5b2NFh7Ofv+/vJMIHXjGfMxHggSE14yP1J6VcuDs3Kp?=
 =?us-ascii?Q?s9+2EBqZgOahXSBgLrm9Ixxf/pwMUhYGThPvHuDBvdiG73+LxWbSsqMINBFZ?=
 =?us-ascii?Q?rdlaTbzKuAMfhWu+2GfpPIwV6u6wQ/ZxjjVQsgwOKOz4mzYI48teFCA0vf4C?=
 =?us-ascii?Q?GuW6UBMubq04m34/yCosUEL/VxH+vAP3e2lwepz6io8tOiZsArJTZ6JhjJNA?=
 =?us-ascii?Q?FPHOgRp+8TQiFBo9PFXky0kjy0OIyANLb+JSy6RWlJZKu1dgXdNae4ZnLHgu?=
 =?us-ascii?Q?pYoTTP8nVONEnGvJVrlZEZBD?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e73e226a-7e99-4fca-ea90-08d904d9aeee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UkjQQMFhSgLg7FnU9MbvVbfY1wS0ray80HKwt697r0O4byp5Cztskl/++DG6YPhgytJZjR5OpnVu5JdYGe9iWUEgLvQGzftrbfZ3EUbE/ZIJN+kx2Kxd6Ue/L0EiAeroFG3bJAPpm5UpfWnzTdaKD6dQhpMxqbjVhtW7tcHcszcUasFW3v6kR28Td3B6M40xOQ11sD6OnlHp7W2ZMQ4b+7rRFRXKwWW3jMlyCuv1THBQvUiLK0Ua2vgEgw4SHKyTwC8vZDG2UmHAL6rJSa15l0eJnsgiB8tLLmuU3x4ijN8TPnxO9n+ur08vU7q1gUkjYS8JsrtBuQ7+z+6ZLpdoz5DtoiaoQhv4LuooCbLNY9b2OviE/P5Jz3jKtSYCPTAr/FHDllXqpCJSLM19bYPgJyHE9r1MrWiYt+SmzgyNCJRjP+kcKOvIcSQaNhXb/widkYRgdQVUYrGtpiphSR5UMHUkSySc4upRGppolQDP0cXuq2OQUDM7YkAA9RQiRAZca9k31gWgJujIUzTYBj0Tns11wkGlWV+mb8mLViax2oX1e+G0OxtfdEQhug+6rHJiQvoZkVfKRKYIU0q3ZeTV66M1v9Yht1JHQB9z8svWLoh7UqkrobdqqOnpHBurg1jW12fgr1RsDX2gWmUOLEDqwa5QCFw59b0oDw9puJ1KDeQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(36840700001)(46966006)(70206006)(2906002)(70586007)(6666004)(82310400003)(47076005)(44832011)(36860700001)(8676002)(4326008)(36756003)(956004)(186003)(6916009)(356005)(2616005)(81166007)(5660300002)(8936002)(16526019)(316002)(86362001)(6486002)(7696005)(4744005)(336012)(26005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 15:25:32.5391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d03111-73b2-4b8a-d0cb-08d904d9b422
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7154
Content-Type: text/plain

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index f131d9856c..7d74833f61 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -12,6 +12,11 @@ from oeqa.selftest.case import OESelftestTestCase
 
 class BitbakeLayers(OESelftestTestCase):
 
+    def test_bitbakelayers_layerindexshowdepends(self):
+        result = runCmd('bitbake-layers layerindex-show-depends meta-poky')
+        find_in_contents = re.search("openembedded-core", result.output)
+        self.assertTrue(find_in_contents, msg = "openembedded-core should have been listed at this step. bitbake-layers layerindex-show-depends meta-poky output: %s" % result.output)
+
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertIn('aspell', result.output)
-- 
2.17.1

