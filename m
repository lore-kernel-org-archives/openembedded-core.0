Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37402.1793171046344595740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zRIUQymS;
 spf=pass (domain: est.tech, ip: 40.107.162.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onb7kU2FTxb5tdNgJ1C78h69341z34+qlygWoJxIFcySZx6Gq+9bwZqaTDkrBWbtHXsKLOnLwZZ4VzXDdpQ6HHWlkHxNxv/BVgBYOXOrPtALbxoMR4i1+6cqg0SkRmDK/aHztJHNoY17jJlZk53XcWbeeucnbMQNL/+26VaWGnqJ4Fg99oB6BQwF/4fM1FDqv0Rw4wxQpPNULZGQWuRpMVDeAp87gzv4NXRdYnwveJ4IZw8cdavKZiLcewxU7v6O0+MGwITpL5+eGa+9aKNAVJLqCB9mR2oQbZ3LY78XcEoK8FlNhsAZ81B+7gZcJ0IdnbiFi/1ZiD2fXyHplSZXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CC/siwlqdF6pB7gI11vqx456gdtwJmYMrsESPheYpo=;
 b=Y56WTTPJodlEptrVZY4aaDGhm4fN6KaPq5eTDEZidYtsf1E+894HcI9Jr9gY8TtP9V+Avwpu4Da+Jf45G0ZyEqpNrjao5/rjk3SyEjIFyByerYkECd61iG8J7e69MwmJu8I0SwTneJ479W94O5rg+BzPCPtHSeaFC6uA9E1FqJ4HrtNxsLnx6CX7ZovV5t+NjbSVzLyqpTJQsZvhgAbuyImcR6kAmJRTBTMZhWies1aijny/OlRNXHvPlsCNeU2zTq8MUNwNt6nUKQ2Ngh8ko5VZjqW53Iof9Awuhyu7kUo5OBlivy87CKt1h5oCs8UCIgcka5s4crejyZFl36IAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CC/siwlqdF6pB7gI11vqx456gdtwJmYMrsESPheYpo=;
 b=zRIUQymS8H46LMYqKixwZP/E1PwJIa57ok3xydt9Nb/SM+LDaD7Y6vcm7ttu8WpZDfQyRKxGhbwBkUAQHPAbIA7lhZrSXwaEecOr6T7oOX/hqHOGLES9gAmV087b7ar4Bi5A2f8/ZwaXBqGTv6KwVrOJL7BOrDL2qP6FHVZArdm4yUNOlkACX6dh1wck1Y8EpOGQcmU3fA7mrS9mCDEeKQ1ibjaNYrw6sWCIW1wFyKwK5F9MmjH7egvf5GqSDMaQNtEMPa5oEwC50JzQgnd0ctP7o/Xl5A5L3euV3Wm3ewNUnJQMA52cIS5g25lDQ5tPyM54WjsazwTUFfiaRlxlDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2318.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 07:04:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:04:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] python3-flit-core: upgrade 3.12.0 -> 4.2.0
Date: Wed, 28 Oct 2026 08:03:47 +0100
Message-ID: <20261028070350.13243-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2318:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6d043a-c5e1-450d-6bf2-08df34c1a52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261009223027099003|261022105027099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: zHURK/68yoEBJezPzhZxmA8ynMyuDiGr1IIqzBMKcxPi09PiLBYaKra/FkBEdBB8ZcN2GhU3LMhJEMxhksDf8y7HUSkW2FTHdPASbbF6FdyyVVCTtDFFtZ43olvhobo36ou2tRRpy+klQbBYZRr1lvnipLWmi2VqoMAdEyxi4OmM4kr4w4bXfaXFI24mHageEIX6n4IRSQJA19ldtJwhnn/CVabZFNIgT2hqTHenvtRN2QPIGZEvsFluYpvwyD9ZN8iKU0POXeL5BXxTZ+eE8cPbJcPdR+1hbmWkOdtAwLWmgLMTfsJX/FFAWSpmXOYqyrYNXV4vMuuz0iA9XZaT/G1+7FE8b8r/j0ZXc2mp87wz2Z/tRCIvuzULuWJB7whwzsftqgq2mE4g66Jr5WqU0gpjohlRryZPTEJloN36ev8mxKpIC23ydL/GWM8T++ShdrjyXjlFbXKPU8JJl0VCezJNl0B0FrVI8Gr2p5hE0GFViaYrHJgM+6b2uERk8GFGQ7kKNJRav5g/QYd52sGP4rp1/SLGdsHLeUz1PN9lWbIFEoRUTCXvJawqMF8boeoZPoUECxC1KYhN76eemfHzI4Y6G7Q+aWspHP9uGZv0sjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oFblA3AQpwhj8xMl8z6PUqIK368PKRDcC6thA3cOYUJfB83HjT9U+Z0F2x4n?=
 =?us-ascii?Q?wNpTeL4JqXEQjCbQG5tl+2PXjsFRgR80NbY5BoE23eZaiEXVFLm2POZ2Bs9b?=
 =?us-ascii?Q?jSZ8UAJJU3fQU0MSa7pCD2qd6If/4ISVp34yZJ80eSgapO8QdFrhEyd4k4BF?=
 =?us-ascii?Q?HljN5wAmvUHp/u6TBMDQrvubp7q+NOiIO4ISVyhQDq2RqEUdscNrp3i9gbAF?=
 =?us-ascii?Q?dBgA/J1JYzeTKdJb4sJUJotlOJAl1ayBP3dkL0HTzG/jdcu7AQuNXbCTQJJ8?=
 =?us-ascii?Q?yZwQvlgZgWWWf5hKyywcx7K3Ugz1VYoklBKQn1Ev1iPIF5dUWL/iu/77U++T?=
 =?us-ascii?Q?A8jDsMe5yLYJCKV8MkEu2DyaNZoK7fnpu49xc7MXIkEc+3OVsYzWsCnCwWcD?=
 =?us-ascii?Q?WbhOLvlAMynJTs1bVPGK8R3t1pa6dPr6/UVwlhQUXpFs/Xij1YrQHD8RIy4K?=
 =?us-ascii?Q?TQfGpfPClBfs8Af0Zanemj377lP8//eOfzWuDAXelFgMEpeK1i6Ps+qiqvzh?=
 =?us-ascii?Q?bDA1vQ+TWnscQ4Qs5+rg95oGxP1/Ht5+BY1YLOKOmLWzOyAd9/H8Rn2p1CWx?=
 =?us-ascii?Q?AGzyKPKIuDogWc1V1AttFmNm4reXjbQ1oVPJv8qztK7VCImqwcpte9bCs1St?=
 =?us-ascii?Q?PvszpNJKFC8BT4gsax2cS4VATOik0ndJrTPif/RnXbNvdu2QnGshs/j/fGm9?=
 =?us-ascii?Q?ERTCvY+oPs9tkNjRmotoiuOz2+Nskdcxe5WKjB8nH1G5W+zJsHQ7NzNMwI+0?=
 =?us-ascii?Q?4pyIcc7hiHg7BKmMfUeVpTs1XIL9npqwDxpyzOFh5XlvfzoRC6dRJiYdWgda?=
 =?us-ascii?Q?HThNuMm02dvGKDil/gwExcinW0aFFmKrazcRe7ECP6kj9RvLPrXHGU/kALJU?=
 =?us-ascii?Q?sHxgiMg22WVSbWmFbqhYOZHzGuPcQ+X0YgVftVCKO+UQbpEGwPDJXl8hYW+4?=
 =?us-ascii?Q?W71wsMxT9y5a86aN38G2PRfygrMRwKBkfO45tBTW/wqZa4Y2nfllAozwsDBf?=
 =?us-ascii?Q?AShXmbKWPrXSQBlytzQ4y3GHnQitXb7la41YxuqSvKGPd4eq7ni2B5rn72Uk?=
 =?us-ascii?Q?rXDewy+HMrgoXxcAcD4XbzbZNIF+sLgBUj4vYzrxyZIzBvb2dO84XMKrZ3uY?=
 =?us-ascii?Q?Xz6sXi62T1V/st8fyYHUtkGBr9SndgS+7zKW/RX91lo+pGkHOz+Mu79+Enbp?=
 =?us-ascii?Q?EXrsL40c4ZU3dRaVjq5zTT/bqgfR+7QDtQowAVuQReOyQDeEfl6jdY20h/Gc?=
 =?us-ascii?Q?NzlRFplAuqUXMjUAmT1soyTtUa0feQjEvxgAPz3VR1DaxPz0DU0L+ShF5J3w?=
 =?us-ascii?Q?JZ8+EaqujAZY+L0/ut9auUwXIdfnbGJ/SdQyl0NGle1Kvf50XSPhT5lvk0gP?=
 =?us-ascii?Q?idjcJVEbLeYlip9xUv4IzBkHr+WkAA41YvPPmpOhMr2L18miVUCHcl68gobc?=
 =?us-ascii?Q?k9Y39vqueMkSay4vB7+wXbde9dso1mJagUQNMZzZ86wLgGUHzyPC4Q32F5/i?=
 =?us-ascii?Q?0ymoeLH1DA1TcWAsyADuNJ/oUsD3Da1o10m3cb+PZWpfEITigaAkMGE/dCz/?=
 =?us-ascii?Q?MbvL4mJWr/TXkul1h1JHdBQEFLG2oasm2TWWH4QOg9PwNZipy48LC9Te0S+1?=
 =?us-ascii?Q?ttbMjx4Kxj0EH0qWSpHURcNZ2braDSVEA5An/jakbK22ivS3DLKpnsmgrcGZ?=
 =?us-ascii?Q?gyUE4i7j2gClw/EBH//a0OaMdrbrctd7quIisK2MJVq4kX2kIj8klAy8gjrH?=
 =?us-ascii?Q?umBFFHuwEw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6d043a-c5e1-450d-6bf2-08df34c1a52d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:04:01.5726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYzLP8Ddvn2WxsXPWwJvq7xMJu0R60MhYJuJaWY7gCHYwusaoDJC7zGTk0LHHAMeElDAOS3cs5CCfez+x2xIbuUIqYo0ES2uPJYMOxDbNp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248789
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://flit.pypa.io/en/stable/history.html#version-4-2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-flit-core_3.12.0.bb =3D> python3-flit-core_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.12.0.bb =3D> pyth=
on3-flit-core_4.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb b/met=
a/recipes-devtools/python/python3-flit-core_4.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_4.2.0.bb
index 786906b4b4..5f490ca303 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_4.2.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER =3D "https://github.com/pypa/flit/issues"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a872983a882c694a8305f0=
8"
=20
-SRC_URI[sha256sum] =3D "18f63100d6f94385c6ed57a72073443e1a71a4acb433949161=
5d0f16d6ff01b2"
+SRC_URI[sha256sum] =3D "84e4e4d8fdd45ba2613800a3ebc6834de26d47ec9746efc371=
9f94181137b460"
=20
 inherit pypi python_flit_core
=20
