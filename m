Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14963.1795015219320867461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=S+rYnwf3;
 spf=pass (domain: est.tech, ip: 40.107.159.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0+I07niPPZt1itC8QXwl485QoKNdjGiaSAv8dHLyWUNWrQxoQnlSXvsh0wV7urXxiIr9Bfmio72aTYFufjo1b3+tJu4VI+72DXp2HuBLQqKyXrL7fIKqxIB1xAJVAZ4Yf1RpzUKoXWLTbxELvadZpRVescfy5CyUOVpYpI9lAnSddPcLa37HgfqFBKRolJUIYPDwFUPoJHuwPe8lu2BGXtijr7UlZxzr0pF/uA7Brg3vzCWv+HBiryRv/ZRGc6U6oh6SC52G3ryTEwXvQ+DlY4lsa+h1qxGsIZc7/Ut9mQynNkBAZUZAULAPjxxLw41HXAzPSysbbeM8Ov7jsjV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OXcF+U/Bxczt8awX62Zhl45ZOO/B3M8TMpdya7sVVQ=;
 b=BNkzm7DvTuSw3WjhBLJkPdifgNFbDM3wADUn2XrWwHbfwHuHg8wV1oIgQwoDIXaZ/KvgatkQxWdvcGvrOZWd9q6sQ1ZYiBLTp8V3iki/qhRY06pb2dOvkHITItra23PErqikw0o5F8XNYEkYppticK7WZmPlLZqZiI4ygEEuh0Hc8bwBJ2pe+rSVYrNlM1RQkcstC1LLuDhs7nvEB7AJnIn9QdPH3wVvNbpuvC1sYqi0TlRnRetuCQiaMt+M+Ccihtt/VoSiDK4jpy2biEyeEK2FSlcKYjUWeMRePW1jNFUfUD/bmg12l34y/eqWTnRHSGY3uNmn0YUVOnZv5k5KMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OXcF+U/Bxczt8awX62Zhl45ZOO/B3M8TMpdya7sVVQ=;
 b=S+rYnwf3YeO43j2wk2R3GztR4kcOwS4xzSkwVdz/6AsKGokpDet74HHELdUW1ZXONgXQgK+cHlRnQBMsfhensERgY9JoeJekdeh9QPEu93ai0hC715wD6bKSIN67+p0cUn3KcfV2I7W6tpO7NHbDVXeofofJ9nUieax5pi5MC+Olq1H+zpHiuriQKX7owl0/cQhOzoaz3G9tWpc69AHge3YUuoB8Jck7tmpJ6fMnle+1+7lUrNKqheygMtB4tMDGRRLe6fCVkf/YQDo/6Oy92EhwrnweEYiaKeaEk7NVhuXwPjcK9QzHfqJ/0FQhqRquEAoiu1HlE1b4FrVoWhlwyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:20:13 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:20:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] binutils CVE fixes for CVE-2026-91781, CVE-2026-91782 and CVE-2026-90828
Date: Wed, 18 Nov 2026 16:20:08 +0100
Message-ID: <20261118152011.24213-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5c913b-8713-47c5-1f4f-08df4587712c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: cBqqQIbLkhCdmjogx6/hpepCgew/Zz+6LFRjQREjeszcX0XZjxGgT9Iic1oA71fyC++H/SE6ysvNc9yHdYRUoW3i9C86QmML+oyAOK0AYCpGhNtyDnVPF4b289D9mXZXS5vyB+/lufGN4MFe2xS4AMkQHKmfA+uhP3k29SGDuMx5pZ316YWyQrEPFISV5U3J+4ceCojR5+Oz44gMTFuQ9fKJ3ZF5LMrsjCBO17DXhEkNsJQmZYs3LRTxy2zNeGambW+u+ztgGu7GRUAZu+jf1ILoHVyBYAS4xBpbSiyM0nvJ6W/eR4omTlO798NKwFm7jMECIHXk5J78Wj5Te4xROzzlkh/TsxTv5ZaKPRBSJVFZ90uRuOgICJ02CtPmwudwhuyA/l6dhlHAdY3h/Xtx220d5rMm4K8UaPdQjb/aTyZCQeGA95JugwhocqaJ1kBOSexZMtRozGEB+Jf3x+92/o73IQWoGzloBh62gVwqSnmat1FtD3PJCeICnHBwYeXJzGjd/n9vKQR6gmlqlsgTRL6KzceuBBzt7/pPLrwmZzTTDsRpP2JZ9i5hZX0xjzH3UiviI3k4NtZk72UyHUvu8JgAZkZY/v31lvn6VnErfq4PXrTindbxj+blcBSfzom236lrGGqGnf/3/Q0m1qr1ezrhwnVzoIFuhY+RQHaX6UI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YnTffenaY3Mh5R6WEAAaMOLe15ryEJqxoahO1MsK+wjJ58vc9wn4UZO4x4oU?=
 =?us-ascii?Q?6RMhdm26GU+H/4bK81+wSQvhUdnAFIgzVoCydLUfa6WmJzCwHWwrWg6i3g/U?=
 =?us-ascii?Q?AEW4NPHWM7FaC2Ii4MU4b/rdCKDUdYn0oq5X0aX63/enjg7Adk1Rwpbb5gcF?=
 =?us-ascii?Q?X8WXICprAq3PNIwmsQ4O72ihZZjh2bmuqdXP2alkJF3IJlp0Q4/pMXAJLm+j?=
 =?us-ascii?Q?sKxp1Yw66NhhwtlBA5n/juFNo0QXh+9rGP+DdBhMxksLXmCOmuo+MxOU3ffl?=
 =?us-ascii?Q?TisS9ukAF9ow897g+37gTr7x3Y8CtRC/9gy0VpJzZ4K4mUnLuOQbgApcj7YJ?=
 =?us-ascii?Q?Ijc38uK7cNGc25DHU20wPffqajfYHIjPs8izTHIoilCZ3LqWmkb4Cwxfkela?=
 =?us-ascii?Q?S1MFcLdsmlmuntCaMxu/lYgtVVh0jVhe8ct+svml4OY1vs1clif9hHPPwvDE?=
 =?us-ascii?Q?4GoWVFdP/4r+eRnHgU8o8Rnx5MfjDvSwIc/XyUzRL5zDAtehpuiyjiEd6YFk?=
 =?us-ascii?Q?7b82Na4ug7HiHGoZs0PvQf/xZFoDE0eNzaPvvolAVYbaWXtE3wSSA9cnKkXv?=
 =?us-ascii?Q?QPB2bNKzph9AVQOwL2RAZQ5Ged2h9Wu9+5KttScQCM3tPu3ewcjw8PTOV4sT?=
 =?us-ascii?Q?m/px3EGaJJ1uzmR8BuxdZoyOHyavYDPrXEphB7Y9EA1nX7gaD+GkDeu2dsbt?=
 =?us-ascii?Q?vsdS+qPsoMysZmviMJ5cZ/3RV9eIKDsKqTFebJJ90buZmL+/Z23XwJp+Shja?=
 =?us-ascii?Q?YtQlgRZDS3LB1N5Xsr3UxIxBjHKTbzZTaj3ZeVxbis0GlpqN29rzmXDhlqEC?=
 =?us-ascii?Q?h9e/yHkGVskU7tJ4entkZf3kGTVbbd+ldPIvz+l2MUl18Qko/cK+waKYQNXx?=
 =?us-ascii?Q?JNG1B2n5Bwh+NgdWoB2GVU3VCnlxDQzVuFGZUHHyEcjOxKni1K0b0ptt8XPK?=
 =?us-ascii?Q?mqf/JzC5EyGIIOZWPgke+hRD4Ci0zcJwHIR7X+lDtYyh1aRA14xqYBcuWDho?=
 =?us-ascii?Q?gJTpDeFzqW5amzsOs70K0XoNParTklnHorJKP52T8omNrRH1sBL5wqHzZd3H?=
 =?us-ascii?Q?9UPvAdu9Z75S/nf2RAiJOlJnwHBR9nsTs9DZkSCR4IZmIFHEIpwE4447KPsm?=
 =?us-ascii?Q?0K5SW5OIJp3Dx6hfC73+suIi6pUF8ykulOB+O4TaJRwi6vjbI8NnfIMJjOIS?=
 =?us-ascii?Q?AmdFa1A4Ec6PhMjk3Dt3yikh2lND1AEPIPE1edcqsMPTsc1XuXHaWV6JAHeZ?=
 =?us-ascii?Q?gNJ67AGvbPNeHVynS5MTgpW7PWPZamyQVvKObATmmkbaaSejBKfoEsL4TODZ?=
 =?us-ascii?Q?SknoAq01zC10ZARKAqQL7hUImizsEotdPSmdkVnXorbUz69+PODMrGiiwxMa?=
 =?us-ascii?Q?TsNkt3K0d68yEfytNcwvEpw2azPT+K3fT08ekM36aTV6u+1+2/S0BJexelQI?=
 =?us-ascii?Q?mcZys4Z/DMyy0+pMFcSu7qsnRl5edUu9OsdbA31rhxF/XZ2GxYkW57TszCPE?=
 =?us-ascii?Q?A3nHZAjqKAckLmAVbyghCI/u2l5PmdnMDI7YifTKmTv18f5Q4dDKn2m4CCTA?=
 =?us-ascii?Q?BVe0KGs4lzq2+8jFsfLDmLDHnZQrVJaQOlV6BTX6NuC6dG51jL/cjZ4El6na?=
 =?us-ascii?Q?Cbne5YE3pvH4+VNYSllmTlU15PvkVFwNBT0KxCRHygQxrsJ3L5qoW8H+2i9o?=
 =?us-ascii?Q?G/24BLx9MepQ/aUdlmJlR1wnkfCvuNO2CiwjCUknr1eVd58rdGmlgLu5afOt?=
 =?us-ascii?Q?QuwQHAbu4Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5c913b-8713-47c5-1f4f-08df4587712c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:20:13.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUXb+ntnWl+nS1S/4SAL5M1FwBUUIoLSkr5JPin3hXm4GpQfNT6kry2Ct/07NgaplqrzKPlDa2rJ88B6CVY87PrquTPHbM/+WAYR7m0gKQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250557
Content-Type: text/plain; charset="utf-8"

- Same patches will be backported to blacksail onces its merged to master

Jaipaul Cheernam (3):
  binutils: Patch CVE-2026-91781
  binutils: Patch for CVE-2026-90828
  binutils: Patch for CVE-2026-91782

 .../binutils/binutils-2.47.inc                |   7 +
 .../binutils/binutils/CVE-2026-90828.patch    |  29 ++
 .../binutils/binutils/CVE-2026-91781.patch    |  36 ++
 .../binutils/binutils/CVE-2026-91782-1.patch  |  80 ++++
 .../binutils/binutils/CVE-2026-91782-2.patch  | 424 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-91782-3.patch  | 130 ++++++
 .../binutils/binutils/CVE-2026-91782-4.patch  |  50 +++
 .../binutils/binutils/CVE-2026-91782-5.patch  |  65 +++
 8 files changed, 821 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91781.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
5.patch

