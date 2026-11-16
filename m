Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JizCn6rG;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1XyHfPfe1Vm3LP6RTvV8yEmte1TYkTmT0NHjlzLBFLusjiMbghBGYgBKL059I5VNKnVBUPGtB8t26T+HujSDRnOYu6BwOz4pQZrf++OyoxF/sPHu+IYrqodOLqMiHTyXdcqNi35KuAIcxP2EOFOBlx/IFOhhKdoFBIU/zmQJtmIAGUnNmuBzJHi/LCxQOJxbiM6WOcyx8qYHKB8XpXpyVTjRBWqZMPC0bNytBXkLwViTJK552vLI9DnsTmFsi1ZTCad9RM8+/++qLyyqx0C6RCgSHl+xvHAcaVsDW8vtAaDhF9khf9P2KATSENzeUTuOLle764AMNxTDtzb3n5oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VqLG/hTc8fOAgdAMqAw08UYEbSAhYx3g+kV6CZ7lLM=;
 b=PhejDO2053dXY/zCzcHzI6fApkJgyGBFQwr2EMB4io916mrv/di01Jo/DKyGjN7n3bBbyIaBxIIQkxJjRwhp56/RhpiFwHpBCWPxCfgixlW5BQ//Ykq7MoGY0kOIFpQXA/fMX1oKhvLJIwQf6xfGqQoWjvgQhoPSmydD11ge8rvDny9YfHxMVe/pnQY+cSGA2+fDZYha7DOVcMCaJW7IiS8S6k6p47QQYgLoz1CufoVYsWM//+TZFNHXvfRl9T3FGuvqkmVp8l5enNDsJ9ZmFrQCF1s+0k4JlOYmjubuHa4a0cCgj9oyE6Fz7J+zmG7X6zYR9ZkoO1TmqxV4sqPZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VqLG/hTc8fOAgdAMqAw08UYEbSAhYx3g+kV6CZ7lLM=;
 b=JizCn6rG+jghqZUWS9tMflE6MO4JciSzRtXQ3vOhivz8g9u6OYDFLJkMGAslS9LwaKvVIaAkVsFBqs18Wbs3xG35KgACwtE2apapNLN8Y2hLUk//QaDp5/6XECWuVIv8glGLGk5fb7VtBIgYgEVLsHUHvexSkBRu0oSvyYEdj6+2BBtDsk/LupaPVIL/9wJRkNXFiXaa51i3tIQQL5rFYI5Z41o3E6i0zRAocpRiLS0thiDMGLdvEWCdI7T9kErrB6oiFGLEAqOg9wow21jEchJ+RybDZLult5EKov2YwXi2xdt6FrCWQ3ZALXnu71kiMz83xhKe9/S4Evm9z5LNCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] python3-git: upgrade 3.2.0 -> 3.2.1
Date: Mon, 16 Nov 2026 12:16:54 +0100
Message-ID: <20261116111658.7745-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: d08989e3-7799-47a1-067f-08df43d3284e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: WIyBTWFsmFVp2eqa0M/KmeHb27fj5YwoXW2mslvaLvziBNsigB2n5uPEMa2+c8zYWbPWA7fF3NMIzVBVuj1UnHeRpI41dP9Ft+LgWyDzShRJFvg6zp/sRBDQZDOSqlO1SimYqQUvUUimJKerQZitfN6LIM+FToJQUaQC6o14XK812zYy1nH2FOZMOABU0ENGadd9uhCom61QGGdSzPqE8hfxf1HziB9v8SzWUZSKRms7B31IRb250DEwXpU4nM33TpadWuamjWdt3rYXLpaUzY16Du+MrhqSMLaOQ9nnmUufeAh2LD7BiQwndbA9U8QopicklcpLdiYmmqBntUSXTDOMx2LZ8bjCbvSNie/Do+jbOVAkCWbpEcesQ/6KqwMLxziMRQBE0gy8Su2UbMo/PWLb2VfiTYJW7+Qrz5o0NgdPKm9vy3hYM2TZmXbDz15RJ9VyQWNfnPdufH4cD1ph54w1kZ8yW8yYAoQljiQDzS2DykAzVKEVF423c7o7R5ZOIJwdji+0peZ7azKoDIhtSXBpTXcCsavm6O4uEi1T27ll6dRiYHhbmqLA60E2dwYj2y/9swWP1pIgQSr7l3HRAa8UIXR+W38fy7BvXRTT/N1B9CAW1hdHSmzveIOEo2+RgapobGRh/Mk+bdrXjujc/iS7vLVHmpNqtcT5i0mfs08=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvS3HrLT2EOsJwj4greEN8/WQcSLVFRforaGKrYFwS+IjpAQEk9KPVlrfXCb?=
 =?us-ascii?Q?Sl60M0mxfQLak1PfGWHTgow6h4FZswTBfxUK2ke3GuFmt1PNl0USpKl96+YF?=
 =?us-ascii?Q?UzBD2tb5+q0xQCQwkOwdq/YLdMh6Noy/haBtDD8QnloIdqiz4i9048DQw00P?=
 =?us-ascii?Q?hGt8YQDmxDRtWs5NqDY55TunfPSeVjpDrcOVrIXMNrq0txIM6JePWklnj2Qa?=
 =?us-ascii?Q?RWHqtCt96Qk3WomXUppHM7Gan7UT0e1RQmbPEpS/80Q1t9izSjgEDc+3/FHw?=
 =?us-ascii?Q?PLD2qaWZbuCJSHJrD/u4zixUfQec3xuEM22EvPNLf6lDEMc8a863TB2Vjnta?=
 =?us-ascii?Q?dxN7J8JGNJ7y++A+XOvPDx6P/y/ufwnkEPqVwhk912gNWv31HK1bLYwVISwg?=
 =?us-ascii?Q?cCYXeqcpjOe6aXD/JlePzQMfxkKHmr2AtRHILVU1NhFHsVKSLJOlBpYjSFYD?=
 =?us-ascii?Q?F3tuKmrzkZO5g6W0MnNyYAnOW6VNwRzz6vvvaM4F/Yq/eGaM9EzDpHmqNNht?=
 =?us-ascii?Q?s76g+s4tyT+yFv37oF9rUpqtxBbZtI7PxT/FuxmOD5nUZuuJ6jE08a9V3rC7?=
 =?us-ascii?Q?RyssrRvca2ZIKqLGBAbZD7pu8etKGX5m6fhGyyqsAKL+pZwNDeyrsXjJF/F1?=
 =?us-ascii?Q?yIlR5kF/jT1Hsqu1Z/rorekHYfCnYZTada3dStpVdJkY6lC31xIIX49UOduN?=
 =?us-ascii?Q?6ROaPhP2PPe5F0FaXZqjn2/VxKkLHLDG+HbUj2XsZjVsJFSbJvBRQQ+7y8Tt?=
 =?us-ascii?Q?cNjPUPihJDujy63hgy7JQ4I4lwbfY2Q0z8XVG3MZqqS7a1pmXnr9aVDnSks1?=
 =?us-ascii?Q?RjRFCHYKylyTF2XoNh8HRloYqxWsg1qwhHiTovkIdqLe+6WO5XoE1aEwrLFD?=
 =?us-ascii?Q?z37/1LSaZtLLsI2cFgU+XhUfKDVeU6Sg+ZVgtJ3xDzd85ZvgNYG2QyIXxsiT?=
 =?us-ascii?Q?2k7iJp5maCGlFnyAox7Of0rmGDv/+Sux2b3g+ElOUgBO7SC3+VuJ97tkDQMx?=
 =?us-ascii?Q?EUKl5MNge14eJ+8SFnjauDJfkWqWk5BbWMO8yZ8f7UKbUkySCoFzxioNV+Ob?=
 =?us-ascii?Q?e0+eoNmZaAB7/ZHGwcC1rmWIR0ov0eNWkuH9mPDI9qySs13sDjMiv3Q0j9GF?=
 =?us-ascii?Q?yPjSJIR8XGZHgHeJPXD2bPUMH7oJc6n8emRHi15iMLhC68vtz9M43WUCh136?=
 =?us-ascii?Q?uBTzUOqAlGHbRmzgUsJG8rYNhfLMMwUExY2NJ5ydQ856W7v4+MT8FcjFVCKU?=
 =?us-ascii?Q?VA/imA2aNX2v3KApLNLIzuM8CeBZa9vE4XARmHaNFWqwXpzH0hpwsya5bVtt?=
 =?us-ascii?Q?dE0LJSPW4BFFK96W0ANXMlcsI3XzzN9HIho92bQ/B/+ZLiwpGWWZUEPB7W3c?=
 =?us-ascii?Q?U8b62+9Dm2+7K3ZrYU/yTt/fM3KUc1BmThN54fokts/7QY7GfOhCjp/pIe+J?=
 =?us-ascii?Q?c5cnRaeh17RGIScWmGxGOGq8yy0jtQxf9UNAqlaCbmdXwCOd44+Kfc8muO+0?=
 =?us-ascii?Q?WFWPk5qFTADF+J6ENRIP6YCn9v3SzM1hza+xp4PGwOPUgMauGB9pGhXYCbx5?=
 =?us-ascii?Q?XmcugLDhge8s4ItBypZV4idu5V/0CAmGMBSyaQL2lTzeH9BncnCWOrmiSn0B?=
 =?us-ascii?Q?uA0c8w9/azcmG3iymG36Rv/YNh5roD5P35mH7+v5+KPH8mKheSDQiifptzLr?=
 =?us-ascii?Q?5sQvRvBw7QZ+2SKBZ5OPgMrqpQtbb9HOSen1Kf8PwqQL1RAG1+wFpicB9Wvy?=
 =?us-ascii?Q?hPghvC1k/w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d08989e3-7799-47a1-067f-08df43d3284e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:10.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzuDtpGnRMkjJ0MjiSAOmSRogIaNV+WU95+5s0rox19nzscnYaFPFXCviZ8k6SMYtccqZRmslvZF6M1m/DzskEvqt9QRUzDVXYAe8w7wR40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250334
Content-Type: text/plain; charset="utf-8"

Release Notes: https://github.com/gitpython-developers/GitPython/releases/t=
ag/3.2.1
CompareLog: https://github.com/gitpython-developers/GitPython/compare/3.2.0=
...3.2.1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-git_3.2.0.bb =3D> python3-git_3.2.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.2.0.bb =3D> python3-git=
_3.2.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.2.0.bb b/meta/recip=
es-devtools/python/python3-git_3.2.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.2.0.bb
rename to meta/recipes-devtools/python/python3-git_3.2.1.bb
index 990507fb76..cfa5f2b57a 100644
--- a/meta/recipes-devtools/python/python3-git_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-git_3.2.1.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT =3D "gitpython_project:gitpython"
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "fb92310af6844d96adc95ca066ed2e617c00e1dbd146a32662=
6c81e72e18cc2e"
+SRC_URI[sha256sum] =3D "0f1229ec5c057bdabdeeda8bda4f17bda679ab33dbccc00f24=
e6a480553c8613"
=20
 DEPENDS +=3D " python3-gitdb"
=20
