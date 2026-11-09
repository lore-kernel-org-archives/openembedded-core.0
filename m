Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6122.1794231660299882387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GDGO3lxv;
 spf=pass (domain: est.tech, ip: 52.101.69.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4oikT5hLw1bjDEq0z5vZ7WUFOK++eJCCHhu4RPDiNYHPvtQk9FX8F2Px4W7azHDe+HJaaoRP6nl5UWZNmFWopSYw0FnUyToQS1VW6TO1J8P1c64wN7u2oWXP6ErZwWIVXJ7ai/bgYweohH+cg1TQXDxfgD3LRrfD4LEl0n46T1IkaVT59TCRqMpCcW8QwXz56FGD1Z4vZdwJwOzRjrZlqCBm0pqtkhwootY9WOKhbjG3u3WzZZlJjnyZS9wuDcNDRrK+9glQirp+WlMbLpe9HDTdV+h6EwPVusXcyKmFvSAxo6XbBPE6hikj7on5yCIiQbI3ncdbJPh352SjDR3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXZd9OTc2eslt57+SpREPF3lJpyPypRmg1UeOiRzCfc=;
 b=eF6UYoNKVoehyhe/3k+b0n2HJ6Git9HZnrs4FEbYAa2yoViicmZANwyUM7OfRIxEX8zJg+KlAP4ELdCNA8+bL8lZfxgMRPi//ysU9aBeMEsRrJE4zapceRiE68/XzlwjgSrTKsaxeyoJG84I/JaI9e0+/IIjKJLn144DO/mAIhAGZX0sICouVMWmtOQgkV+n/du4rGRAw3+1ZRWcsgS+iqNx1N5WxUC8Mt3rLIpulK6cms0JeIfvCuVY7RLpXIOywpJNN7pry35nxSGOThNrs/fZ1UWRn0ujZ7NK+ETzIVPqJAO+J3rh+QA9rz5g73MHY+hrVcF/OXkQuJ5DXypjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXZd9OTc2eslt57+SpREPF3lJpyPypRmg1UeOiRzCfc=;
 b=GDGO3lxvxOjt1C+0n06ObVuwOX1aRTNbRUsEd40OFFshwg0YqpflSy9bWnACSD5I6T1gqN4XpacdTPQ/Ae+TmBVEML+I59soyuNfQCqgjVv4e1v9w3WQiNz9rgYtVPnNVl8sOFa8qlaf0soTf4So8+EsKLXzmfc/9S3SCDJZ4GlbtpX4O+ykAuv3TKbTOW204EHGhxSE8SwOFvRtX5CpJ3dH8jOEsbt6I0sXlq9pTAGigYCwrvQC2xdrLIy43bXzuglX9VAgwRVi49RZ4frEFBm6AAH6MIxGp/+gxvDZt5VdDwgteJoZ1CfFakk/dVK6+gaQoTPFZCM79BQ98594Tw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:54 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/21] gstreamer1.0-plugins-base: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:24 +0100
Message-ID: <20261109134034.74458-12-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2P251CA0010.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a812e2-7f8e-4ee1-3b27-08df3e6713c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: rQsPVmUkaRRRHL+0691QNLWG2wjNN8ClWiQVz48kSq2gUZks24sa9AHGyJpqRyVe/lynXzqbL+eTb8vnfmJM/41z1yJHFJfMY4PQjlBOr8vyeGeRA+CdBCWePxMOm234VXytXObbk01DWXh+idy7x87nHbahfD5XTVosC3hcmBG832zUWxXRnc6924+EiSgKoKHz8g860uiAY3QT97o9tIgBLRVp1bxi9tHVp1Vwn1cX1abFfSgJTsitDHkIdSgdtolU2Rqo+AUfQgP6Oz/MCDnsV6h8gkWE0pQdFrVKitDW8wKChB/lDnn+MvstfLYOx+zDpkeGetUnEaHhMaXDX6btoB0Q6dOhTwaOG2z6utn7+BofGuDKVRcQetzSKjhJpGzNK7oPDxksoIn3lKTEpBWiJqqM96bhIBVhuF0UaZs0eMaudd/KuKokkzpQMccTFU8jmH24xfXDGBPraNn7fzZzn+2fXmPo809dnFrIxrcoVR6NDmxuxXg7XjCVHhk/Wxy4qjfN5uRIrff4pHD+6H0lkkrN5phSf2sUJmCthAuctUsw60NRFYiJm7nwQcC+aj2JapIAdy/acrFeURp/urQSsERyYp+WMFbPColpKoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xZKLRbgDhlFHG+s7UqINLPBb9AFse3Gb/Gw9ruKnWifN1NJbgsnNXWFv/Tq/?=
 =?us-ascii?Q?XTeKKYWigeuq1vEJXJF8EdsR6jlMYbtrCWr1MPIK8N91zUQ58rAY95tzt4AO?=
 =?us-ascii?Q?4o8R+eh3ftkYp1WwfvDhR64dOXBBs7B+/TR5BI4eyUdCyvK2eD560CPSUt6N?=
 =?us-ascii?Q?dvOdvlng1GxzyMXQbTOd8Pf3ZQTqaihMsUX0cWUVCMrsxA07EcQKpootA4y4?=
 =?us-ascii?Q?AaNTYJFRq1peLSbIrDdDVXEw7LcQLIyfKdzsVVubGPlcbLjZmFhPN/lmJ2QS?=
 =?us-ascii?Q?zuUVaAqzqE+YOzMuqBLH1rPPnmAyNMGEonAZ4Xv3W3A9A7vriFnWdDgfrgiL?=
 =?us-ascii?Q?Xu4W5PMreVR4rxXM30kudOIBRm3EQ5y0o4DQnF8V6NaKDQwkvags/z3j+WNs?=
 =?us-ascii?Q?jeKYSK9VTTWOP2aSl2un3Yj9akNfIWaplpSpiXPSmVfM7xEFgxLNHNFHUQXB?=
 =?us-ascii?Q?7a5xrIq6/FkJNltOzEkXmzZIHZ3ny6glmuMrm12FI+jLlO6y+eskcUunmS0v?=
 =?us-ascii?Q?IN8nnPn/JsXJn1yTwZp8+Q/8luMTEAGR0bmdg25KUb8VHRKvjp0mucpB9R+W?=
 =?us-ascii?Q?4i3RMWK7x7JmOL6zaS75IZLY6UxmaeKaLwrZx81VliQj1VbNhx8VFtmbSVoD?=
 =?us-ascii?Q?l0/IyVKSMHQXAfhCrg19vCfEEoMzwmGrdhnEloMjmYupUX/QdwdqmS9N8zow?=
 =?us-ascii?Q?zCHeDUxyVjB2WX5i5IR6imHV1UtaPnJKplPCYigNDoNHVXYoPl3H05rX1BBT?=
 =?us-ascii?Q?QzyGNUcysmxPyp9TvjBC2tqR4w8Rlfz2ZOBpH+w9u3yilZWJr7Bd+OZHcI+b?=
 =?us-ascii?Q?vYUK6kTIZ8t1R8z/0v5PeglOBB3mS+lZUA7HnDpu0a+OhQR0dIfw8XGpb9NR?=
 =?us-ascii?Q?Gcy4imaC8IQuor/QzaDAXHUeoMR35dElc5HL8Hs50668Vn6GeSlH3VwU5fcB?=
 =?us-ascii?Q?YWuRcPrg8u6aQW8xsNUTqPwJKnTyOk3dqQBCSa4HbKGUDmxuvpBPOdHcYt3r?=
 =?us-ascii?Q?gEMWTHkyPWqa4zh05RgjJn/j4G+/22TI+k28TyRuOSPYwV/va9CKYhlXY3WD?=
 =?us-ascii?Q?Ufp2qbLIi5DC3TS4QOg3gBb9r8LZKhA6tuOJFenTL5nCln4xZgmxVEA/FZ0g?=
 =?us-ascii?Q?l+SohaKf1bOOswrA1diJzal5IQpe59ZovN4kztvjWGScBsQBgfz9D2itutTN?=
 =?us-ascii?Q?qRo+gGfjvmwtOMIGBc3NBk36zeTTxkbeWKUJPbdJAxclHdEFZPb6aVeZvGtV?=
 =?us-ascii?Q?X0YOEswdmzZqUABEHTKcoqctZKPMpia2dlm5alpDRooXqu7ITXobF1ZmpNek?=
 =?us-ascii?Q?RcMiUkylL6+aTYsuGSgWI2RS2fpHrfNeWIbX3M1jLPr2rXH90U8ZKZtqXYHV?=
 =?us-ascii?Q?qHDmGtNZuTBzXOrmQhAxRpDPBC6QSvNV08zHDFiBKa1dRm7y178jaG+8JrvT?=
 =?us-ascii?Q?Ag4bG7+8nLkH0sBLWepCI5vF+vGFGhysLMOpE7w3zQTskmDxulSf0majWmTH?=
 =?us-ascii?Q?c27i3AIa8GmZVFVZ3y8AU9oCMZhjTrG2T3lBxvrA42Q3Oqp92HEPlCaw6VC8?=
 =?us-ascii?Q?FbEo53yzgavOiTYRsF/E9wbJfcf6T+eYrvN20Pr6F3Rxi49Jx9lzAWW3UlU2?=
 =?us-ascii?Q?ZtBSPMIEDDv8rLeTxeKVh8IItXxjMLyOtkAiMwEvIhWlEdcc4Rbpco8EFdzS?=
 =?us-ascii?Q?uqQmyRb9MoMrivWnyha1PGu7NMfRT4fHowkCbERza/FG6lYLcTPdmMbWlmIn?=
 =?us-ascii?Q?tf7j6ocRgg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a812e2-7f8e-4ee1-3b27-08df3e6713c9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:54.5478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeLgHaIA88fyanNu9ExZ2JKfy4wgwuL7Uh8HgACDd9sHLvcdteRiK3MzCQLWvYH6x43a6yHQJ1M92h5RWBrsM3y6doVcFsIKBZ+JUf2l1Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249816
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9
- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch            | 2 +-
 ...ugins-base_1.28.8.bb =3D> gstreamer1.0-plugins-base_1.28.9.bb} | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.8=
.bb =3D> gstreamer1.0-plugins-base_1.28.9.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
01-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-f=
rom-src-pad-when-query-caps.patch
index b01ec37fbb3..5e41992d58b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 40eaa1cd3e6609cf92f7e3caa70dced21a90f431 Mon Sep 17 00:00:00 2001
+From 09ed10895efd65740601a3f4d6f22484b722262c Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
02-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-pa=
rsing.patch
index 305e631a160..548f7c310e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 7cfd9f7e7fded0c02966564fd9d60062a618d19f Mon Sep 17 00:00:00 2001
+From 415e22761bb952ff8bc01a91621461f68407b07d Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
03-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-include=
d.patch
index 5ebd0cfe796..9348c20e3bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 95ed3557e398de576d18e8f9077b1c908838a83d Mon Sep 17 00:00:00 2001
+From 2d6669e7163322cccafd1ea0a6fae2eb7939b2f0 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.=
28.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
8.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
9.bb
index f7ce3d71f85..0f7044b7adc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] =3D "ade70e3381fcbb024f1f20aa9ede9b5654aeed39d5bd70b1a9=
8f53015e501117"
+SRC_URI[sha256sum] =3D "c1fda668b520e6aef763c0eb962c032c9fe52bce322e8b00c6=
9b4e9e847bddc1"
=20
 S =3D "${UNPACKDIR}/gst-plugins-base-${PV}"
=20
