Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97A0C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 16:17:59 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.40])
 by mx.groups.io with SMTP id smtpd.web12.93996.1638375478760805240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=AOSmJIeI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.40,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeWR63c3S7tBVQpfHIVbA34ATwWGtyNVYUDik5xtRW8FEXkPdH30vBE0OJrpEGuc2aiMp+2ue7kMuu6cQROSqGQKaTBXOdAnimv/XnxnqaPssUyK7QqhkF0D06dZhdsyTE/XopbRowFDQxxHBv0FuWimkYizeNimUbCivzz/T4n3IbmL/pG46Cx0HVibAilp5JFdQqZsJ1GB4d1gwoB6itYH7jRrtoSiEkkVbcU25KAZqxLeGp/hjfyB46BUUgVqhJ/5JmBNG4/nVinX1bXDUO3Bf0Aqz/X0PPNitbVbTXt7m5OSCkrKqwycnNRPBaT3XMPjDtutmhELvRU2Amoo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/rX2fSy+2//o0BGopc4/dVwcDUKlVJmELA/F4Qe9D0=;
 b=LwCdbgRiztV1SpDCayto3MGgQSaGf5glbVQ6qwuFGYk3sEMT1AIh0FwMu8BK5Hst6ehxV0WVNF6aLz6yAk18Bgqag7lyjbH2UnqEBSR77SuQ3YsJVvTkcP7nMaZo+up+ScMWvJr33nesAtbnwTyRMnlG9Zpu/vJzTFdTiUkgA+WUYiwnJBGAW4CClV+lYL/NmkdzJ1ja1dD3/2n4GyFHqGh4F1DKTGZ/6bIYY4WJjBAdE6pFuNTTXIct8CVL7CxUIYEMHZN28i9PITU1OdaqulT5D7sQHMbfbzFpFKYS5nEDh4CJwazhvLsNkW39dE5ZimIXqARsbSFdZqqLOfKZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/rX2fSy+2//o0BGopc4/dVwcDUKlVJmELA/F4Qe9D0=;
 b=AOSmJIeI8ks8+D1HbJJsDEU8iJOjjP9R7VmED9xMig+NTzWQ6JstshLEA+YU8R3wMy2gQazQ8q0dGqgwLypt+y3vYLyrkIPL0cdchnBUugUCLZ/K4/V8aIWA8yGZTgWPsZ64U811vOHY6fW5xS0uERwpsSzIOUiBJfGYoM3lXIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4820.eurprd04.prod.outlook.com
 (2603:10a6:208:ce::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 16:17:56 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.015; Wed, 1 Dec 2021
 16:17:56 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] README.OE-Core.md: update URLs
Date: Wed,  1 Dec 2021 17:17:34 +0100
Message-ID: <20211201161734.3115386-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::40) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AM6P191CA0063.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::40) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 16:17:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d333de8d-fd1d-4898-5d1b-08d9b4e62273
X-MS-TrafficTypeDiagnostic: AM0PR04MB4820:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB4820231F72688C99E3C5CAE2C2689@AM0PR04MB4820.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YOMOnbeG3KJ7+N+esGwPMVPWBAnqdj8K8DFXoKJFqYuud6MH7Mz1RTPH8WV90fxSz79Ko+vCBeBMiHqHKjvEr6KkGMTSRYoEi7mHFj8QxqnMVCYdeFmfyGs36KNLFpsbv92LYuztg7keE3E1g2Yy7woVp7kFFBRUfOO42YeW5aBPCFwWYZUagWn8ZTl+Ec+LAwg3DXeU839StXI6kjsKOtSc0hfXwDSlPWSOaONlILONUqpAsHy1eL2OiPWtgcBtEw2s8zkqsjqbNKaOlyrTupFmWVYu8VopjJAp88pUD/gEpDEozXbLYnSlTQ1UL+cFi064MJPPdH9HPo8zxYBEP6fsMh3oAeQQwvaAOSkUN5AawH1Gn4TGth1OtjAaJ0ub/dqzbI+O9tHfqwc4b2bXsmyMeFq3V2OK2hRUGQeR8LhA9DwKJfwxnY8brOWJ+qZEZEDwaE4r5KtCvpgToZruz3Mj1fsR9Ib0Z7uhMhmGjReygKuOLfM2u84h6744tG9wASQmk08DPICSKGKXuxVso7upUVQZvESw769kkoJk9L0RKSn86IcR9Uv4BAX8ZXvot+YlcuaAzXhQL6PdomzHEnoGSVrr6gBcubL8kTrfrRT1yaCFLSlQcLQ7C6WR3a+e3LhsBMxz0EJBaHKHoOzPgwTCCQXmL/E3tcihLnAL+exe0XvzWlWE292nUzn24UIJukTxZ0UC3EqZTcn4MpcHh/lMy3BzEiC5HodC5w8FER9+Gvh/jVI3Isu2zbMdawTepS/BN7CXV57/eQ4g4L/nEJjlRkyBNy4iWIm5pVwbj/M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(8936002)(54906003)(956004)(38100700002)(6512007)(66476007)(26005)(44832011)(8676002)(36756003)(186003)(2616005)(6666004)(38350700002)(83380400001)(86362001)(4326008)(52116002)(5660300002)(966005)(66946007)(6506007)(508600001)(2906002)(1076003)(15650500001)(66556008)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qvrSbhviovqAU2DoVyqvTlio270XcU6FkyQyZBc/HMyuanl/lUHnxHo+82z2?=
 =?us-ascii?Q?NaGAVTUOb/TpvmQkZCIhhciTPX/CNqjsSC3DExjLujMcGWdx+Ien5wCEjv2t?=
 =?us-ascii?Q?owB35hIsUs3JqvqIIkxn2N/y2CQeG7Y8gwtCoFrDPk0sAU2QfxVlWRlel1IL?=
 =?us-ascii?Q?lzzlNHmXqJHbAUhCtqWFAa+ycrPgVaUZSY/RUYNcTyNj9dbTpWE7ia/BQd58?=
 =?us-ascii?Q?qO64Wz9PG1GfOAd25tLnNQ9jFtS83KsMyFoCOhoSxfOzINn1Q7qZ2mrx/aWu?=
 =?us-ascii?Q?Fx1NwM34rs9kHf4bx5hK9TPWsth5jK0g08xLC40BxdUqTDVULgnDlRl/Z8Jx?=
 =?us-ascii?Q?Jhxtj/Uhk7dCVFmescBYPuMAeYGh+JlzenPd0itfopgIQXcr3TWlCx22oU1m?=
 =?us-ascii?Q?JEmlLhZg+esVQh5YuecJSe6a4Mojo7ZWaGud32BJmGrbWiAH9yzer5E9cSGQ?=
 =?us-ascii?Q?xvMoXHKqWX9RL7MWmBDR/ceEoE6+rSyBxFvWs2eHru24H++rYxqBq1HuzYK3?=
 =?us-ascii?Q?kVKySH16/TDKkI97iqJsIoPEPrAUFyAv3FjGkjGh1Da4jUrEoaZjmomOu7G6?=
 =?us-ascii?Q?0hWrRoeMCW6iUKaMKuDObGApcUCZaWztEg+GxBb/wRq6v8t+z39HzZp96yd4?=
 =?us-ascii?Q?LuSXsJzWoqZdqmBAK9zjibXf/H1J6GOLrhvqDbTsvH6ubGzEu2kZS6PgPclP?=
 =?us-ascii?Q?a60oVXJrTrlcLm1BO7z+s6btBZjDaiDklL/c5KqEwDLE9gbZnmtteG1YpT46?=
 =?us-ascii?Q?yKAGen4LojqdK+Xy04P0yIvX5x18O8PEAIgiX6wufsnwe2CGCfvfXmhFhOAR?=
 =?us-ascii?Q?OnEmnijCUzr3UkqLqVaLsLeOGLUz2Na+44EIPk6iBbbwBmCXRt+BbD0czBO7?=
 =?us-ascii?Q?Cp5SpFlGkctuoxPVELG1Aw33dn9yHkKEJVesQkykWBRPBuADZIw3aL4wwSdj?=
 =?us-ascii?Q?tVxc2NYapQ1P+v2ROIdUcrKoh7XXGSR14uilMDdfZwPOPdDMPZN+wsYE1FoA?=
 =?us-ascii?Q?OwL7e/t7TBmoIpE7e4unzsnif67o35TnFeMlkSG2bFwEwVd3du8/P53vjD4U?=
 =?us-ascii?Q?xxfzUHVrISJpgjoFhYyx+NN5N1FD2MzpfSty6SNhNAMcVOaoZLM2dhj5IHeI?=
 =?us-ascii?Q?e1LW+7ocF7wYbmnhRxKQf27HnhsbOiUByUGpwrdntJfyKmc/gh7rHbgXe2dB?=
 =?us-ascii?Q?k/MvSOVQjodIb8dhjiGF1TAWQItSHm5/74NdqA5pEtEjjmiEhC1twW4GVzZ1?=
 =?us-ascii?Q?IkkoCRlMBAV7U5IXx4wElMNlQFfSZIfChIeThHBXTdroWcokS5GHJAELS81A?=
 =?us-ascii?Q?DmoI2TdvB2ZcIbDdO87XEZTeVGCb6r80xvQT6xXUX0OXXPwLCN4VakUesgEO?=
 =?us-ascii?Q?YS9SdSVB4NOY/4QePPS5SeUrs1L2ylEz2r/jpd/uCWFyFn1yF7NvTCxSEbTX?=
 =?us-ascii?Q?gAmf407vYOiKcTNv/eAlJBrygJkDduNkTaY8e3/tfNj4Ff633Inpa8i7ogfe?=
 =?us-ascii?Q?HjpXQWgeTVy9l0OFhix2zPl0EcE2kUjxBOJO7vwEkCTymGhtOWUpT6voK2w2?=
 =?us-ascii?Q?XfTVznKb2AVg9/7rMjOPLBMbqGcsMsr8R5GuocHdxvgy1E/LLCHsAbrbww3q?=
 =?us-ascii?Q?IPikt1XbilwnWZc3x0QGp0m3WBtffESrdp6XKR2/7VpBWes0eoqGzL8sJoyi?=
 =?us-ascii?Q?L1Z/0g8djK41y96OfrPlyfFVjA3Lut6MVrtnqMnaIu6pqFkUzea/t7WDTJ8U?=
 =?us-ascii?Q?YyQ8Y+L6aQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d333de8d-fd1d-4898-5d1b-08d9b4e62273
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:17:56.4198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P7JPfvZ/SsqUT+TFt6fYt8fFBrdtGjwoyOVY4s/SQ3UTcjNOq9Oe4nHTz5wfBNfI4C4Q67OPgRPElvBwQD2C6w5RzoetDNlp7yrUoR+lJ6E2WJMTCE9H2rreEKwqPexj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 16:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159044

Update URLs to what they actually redirect to.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 README.OE-Core.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 521916cd4f..2f2127fb03 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -6,24 +6,24 @@ of OpenEmbedded. It is distro-less (can build a functiona=
l image with
 DISTRO =3D "nodistro") and contains only emulated machine support.
=20
 For information about OpenEmbedded, see the OpenEmbedded website:
-    http://www.openembedded.org/
+    https://www.openembedded.org/
=20
 The Yocto Project has extensive documentation about OE including a referen=
ce manual
 which can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org/
=20
=20
 Contributing
 ------------
=20
 Please refer to
-http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
+https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
 for guidelines on how to submit patches.
=20
 Mailing list:
=20
-    http://lists.openembedded.org/mailman/listinfo/openembedded-core
+    https://lists.openembedded.org/g/openembedded-core
=20
 Source code:
=20
-    http://git.openembedded.org/openembedded-core/
+    https://git.openembedded.org/openembedded-core/
--=20
2.33.1


