Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1156.1795710323678515132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uGp4Qcbw;
 spf=pass (domain: est.tech, ip: 52.101.70.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oW/ZwATWM7/KrIKfK1xPVs0p7wT91E22kCO6rofqiboq3yofNRe04qiAFBrpSXALT2TlYsgMBBF/PFDfmzjppDYWl0ylFMAkTtM3zWrIn/lOl/PKqpPweT1UF8DFUYFFA8mAuEaLTTYQBXcCEvMbvS1aJuVwey3Kmn5fAojwcudxSvM9CM40mc529sHyswK+xaOYqDd+VtEziDtbFgbUo/LOnWI2AS6e2NjWCHSQXf7Oc+WjEeIgj4hzNcby3fUBwvSNxmfh99EZlZ8+5wREwtHrlGL6jMzihZC9aXs9olJi8N/CLmB+y1r0/mTbsgrngIpp5NV01/SodGbgakl7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlQ+CC+GVf3b+h6FI7WIfqQ6P/BIeM8bkDFMSe5YRCE=;
 b=EWScE93S+oeScqrWZfiYuRioTLmT2KKz5mWvzumNh9m7xIx2ET+X1u9/pjP9tm/PwwWqi6s6cYRlaJegbLMWS8l98d0cWzhYERQ3TowfCOwYC0D++oEhiGcgQZkqLKz85vbguTp9a6a4NXcG2jyzfo5XokKlE+YDuFHymxsgg24nzA+Pm3lQkd5gcjABwWff48a3yWNALZLmtuwiaklMZsm6uDqvGkE/lWWpo5pyEnGP+kCRBxnnUEd3at5JjkvYhqoa459LTaKyJADT+LbSZao/DlaXwO+omM1D047wGqKlopOqnapsu2xn1YI77i3xEReY7Gs7uXHEcymUBa2TqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlQ+CC+GVf3b+h6FI7WIfqQ6P/BIeM8bkDFMSe5YRCE=;
 b=uGp4QcbwY/LX7BIHZvFHchZ9KDYqOOMst+JGnzMtn9nU8RAd2Bko6AqlkFReybKlky6GCqPGS2csPY/REMwRmxyTUu1lBoOFx2G4z2pj2ccfyx13lDtU1z0/iETD2TNk7jFbuHcgOCvtC/7vg8/coGx8fAR8jChtJ6wgs83mA1WCc43Ocu7l2FqOe4uGOvjX5z8A8YYp/nDlWFrycz1AqxSRSY/CuV9TxP3995aDKXpwvQzWU+TP5aqXJDxtW2cg3OWIBZkxl7SrdRGu8t+JzLo/AokpJyaC2iPa/QIvyOAmpu+ORj/RheyV75gwrddGxLPE91cNn0/SmEI2bpeVuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1834.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 16:25:19 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:25:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] libpcap ptest log fix and upgrade
Date: Thu, 26 Nov 2026 17:25:14 +0100
Message-ID: <20261126162516.93141-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
References: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1834:EE_
X-MS-Office365-Filtering-Correlation-Id: 32274e94-f98d-4553-4d3f-08df4bd9dc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|11063799006|56012099006|261021123027099003|261021121427099003|261028144727099003|261102123227099003|10067099003|261026140227099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: R4r5y3gvbV12CypYsCREpi9ZOyrCH+9bahEnZlJYWuPHO0dScCWBziwn0LiYy9/XGdZ6uC6im1ZUdFexhLozYrKJDoDF56fd3XZu4hpt4cNPE8B0eTk9T5eg7hcQ3Y2cLTKodRV+VkaiOg7e10yegRMKyKCXrGW+WDs7TXcJvaYeQyIbtBeULlo5fAAfYyFAwQfLH+6yB74FVGMNqDPyT32dNruFJGSxFKcxrTsmA//ClXYo0W63xbrfEQgT64Le41NdKIhyhSWXLF/Or1I71EilwsTWP62yjNb0EXaGqEhub1o297WUpNAzGlgdg677nx5+Sbp/9VloDCtrnagc6Hx3kpCfIX15UGWKoX0mlyLzZoDjyQHFqm6ESyy5i7+kZB13QneFTeqX7Wwj8jYKZsTSfeHPmO0WCvpGIO01Sz17h4f+QcztRgbqfXbU8fUqu3bgMtqW3sozhKreC/aKKY/tGyJF1vF55MVD96BR/pHTOWAu5AS5pQH8BLLWzv1Aj8eE+KtKS5d+vsjkxuGNnaueTQ3+HmK5OdGswfzxYONb1CtTBSNe0f1aka5D1ZwOFxywx8u3ZvdyCnuFDKSP9bnwMFe2fTNc18is1Bx1ljEm+YF4QoE73kKLPBvG8L5gvB6Zct3O8TwkHiOrxwwpQ5fzMuxt+wkxoIpLTiTFDbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(10067099003)(261026140227099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?490B8Q+S0WR+YcX94ixYO5TOZX+IgHO43UWjwoGqapNVrZuGqnHVQXPsAzAw?=
 =?us-ascii?Q?QllHFLvnBWLB4iXLXCYAs44fq4hZftLF4+NX20MnLaZTbcdpDUudL9e4B0A8?=
 =?us-ascii?Q?oan2OtqXgCa0JrwgKPazZt3Wh+7WRXQT2oaHxGZrXNlw1bim7WzpWU67TQGQ?=
 =?us-ascii?Q?YV0TvmnP378Cn2PDako0YGGwiCbaVnUC95z/3eSAn2XS9vkkcQE21CIVBC7L?=
 =?us-ascii?Q?VX0dk3bLkWM3MPUV4DFgtTQ9ybhK07R4Bce2MVK4mkx144S+Vmv2nHfZMxgP?=
 =?us-ascii?Q?/0AbGbCgIikYEHrDYrRIMJZp4KRDoqXjcDUGVzt7U8sjtSCUQfhPDjJrkwok?=
 =?us-ascii?Q?WH71wXUWA25oc+Ak/CrGPEnR0448+QcA2Yz1oafGBDXNq8hAasm7yNelEN30?=
 =?us-ascii?Q?cynhT+6l5G9bxO5bpN5pDqVOQXRrkZWMySZCjVutoZuSs9Evq2lF+AVzTcmC?=
 =?us-ascii?Q?9n378Pm6XQ5dl4FEDXkD/nhX9E0MykESCIQSIV6gWurr68LwyPjC7fNwxc+K?=
 =?us-ascii?Q?i94Te4q8Q8ck2mF+w6oE3JOT518LRBsqZYsOMve5ToLOUtL6EwvsidtladYD?=
 =?us-ascii?Q?9E3n7zES6UkB/WYGHO1bGmFX9AYuJ2fK32ZDpHdE6u0hcHzqkK6nhSJ3chu9?=
 =?us-ascii?Q?wCvqweU/dihKVlHYNtfgr9v2shTJGSs8q8H5uC+WROiSLg4Ua0WxFHElSFLf?=
 =?us-ascii?Q?ai3+nUEV0+eBBBziCNluh86XJRNYlMoghRe4kgMp8Hz4TLMWgjLr83ecsPM9?=
 =?us-ascii?Q?ruXNjHcKjbfTkfjSflIcfyVNsUNLL3dlO6LGuAg1DnCL7DuNajPqt85mxNLI?=
 =?us-ascii?Q?gfHdS9ncpHGtMlIo15IztrJk+gIExpIVwNCVAh2kgWZGPPVbPvoLkXtb5aTJ?=
 =?us-ascii?Q?qj0vzAjyz9TAIxUfGKdFmyvemH/rRyTYAx9qrpCqQyyzQHjtsDG2rPtTvGj3?=
 =?us-ascii?Q?JgEewCu3Wtdf8ggmEJgA7iTW9s6rT2cT3C0xdo5s6ApPOqpBCV5i6WwLmx7Q?=
 =?us-ascii?Q?tWzyZ93JjXT8nt0sIGILNk7YjqN4jaGe3a523dh2oFDaHegjkWYkk9G40suH?=
 =?us-ascii?Q?Iqf0+IBaFWlVtnu6GLCvU4No0CPmLl3L+ASyiaBan9oYgTHDzGs09CCgwZAD?=
 =?us-ascii?Q?+Z0tvLG3GApVEH4rRwZl02FItUWniX60JCDxWX/7BG9Z3IEbvd35aAp4hwJD?=
 =?us-ascii?Q?vsDSnM7OQjM9DRHmZ3G4FgwcDGQDNgDoMcFBzb7EdIvBlxJsRqHFvk9IMjoi?=
 =?us-ascii?Q?zG6f8JobOzE9BVtYlZj0cJ47s5dPjqMHetizpSnEyDP0R/YGD4p39KEmuc2n?=
 =?us-ascii?Q?7HOcegMjmT797J2Z08c6buuThnKi8cxExZGnuhNGSMnnijczgrA8qngce5jG?=
 =?us-ascii?Q?capW0mEMs1xuQdLj4xPP6NNG2wQBabkFSniuskrdHD0AvDa7487YDaTCrO5q?=
 =?us-ascii?Q?rTWaFWR7FEg+rOUhSmskzyp1xFHUvpG2QEVLS+9+n2eCP9mdvcDzEm4ryDz6?=
 =?us-ascii?Q?JfIlpJC3I1ckIYs5MlhawE91Wib22CQYdQNk5DyQxsHOjPzpzm2n/Ea+hyhI?=
 =?us-ascii?Q?UJQasYK6UwhPKW+C+GTjqvuDtOjmDeqEH7ASIicpbdGc9kORXT1NFseRTluT?=
 =?us-ascii?Q?SsyREe18u+GF1PARrBmpsc4dxDnTIZKiP808asZMsucyO9RZt1fbhX8/917u?=
 =?us-ascii?Q?W/T1Cs70FfJV7Oaf6T2462xaSADutTz/XjbD704eIqRT1LdpDp+oWQisOG3P?=
 =?us-ascii?Q?Sg5L5RdcqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 32274e94-f98d-4553-4d3f-08df4bd9dc5c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:25:18.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFx/HooWRW3GsIwJDopyy3RF4M3G+TOVWoMx8NjBpI7g2rXYWEF5a3pIN/jYqzeqEvRvlYkcq2AQmzmxbJYyt4NjW3w+0P0O+Kv7yi7MYBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251318
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (2):
  libpcap: show TESTrun errors in ptest log
  libpcap: upgrade 1.11.0 -> 1.11.1

 .../libpcap/files/run-ptest                   | 22 +++++--------------
 .../{libpcap_1.11.0.bb =3D> libpcap_1.11.1.bb}  |  5 +++--
 2 files changed, 9 insertions(+), 18 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.11.0.bb =3D> libpcap_1=
.11.1.bb} (92%)

