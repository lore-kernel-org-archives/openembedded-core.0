Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19054.1795531218039474643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 06:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=J1tmwuc1;
 spf=pass (domain: est.tech, ip: 52.101.84.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4rFxG0CGIncpL3eyswFNHn/0HoXTkUWhes1TbM2aUjBUAdHejk148Wc2Pz8llTEV0pbCixH1IamT8upXSH8hFkSnrlbtllVldE+2gggUoPkdIdE7wcHHbJz/vIuBgQ2+LStvWTxPpft//TZ6oVeXM1y6Dmx8dOne/rMaLjpOBub6Ql4hKUOlw1fYs6Qwy2VV/SsvP9XZjxL8C/1tSSnEgISl5dJCqkYeE1rY6AOSTMhzBbUitzbszQFwUmjhtVUPhJcJjcW3qG7IFZiDE5p2UYBHh6pRC+K+z8hMGy8UbIuisDcLB197jFaEhD91JZ3dfZkdi/U5M8sQ90LJBUoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhAr8lqSJFNNkwdQffXu/S1zClWILGWNOFJWCoV3+KA=;
 b=L7bO69g2q6b/bBHKDx45QcH0w1rVgam/meVdBmYoNh6lb+hzDjbEbTbsIHZUGuFmK7NKvflxMhh4V9RkNbvgb0Pbu3zgTL2bZaVGMS8guh9VoqK1G3T4ofXNp19hcWhwip+7iCBLrBBlcvM1YR4v7Bjkc3ffCSxyc8XiUY63iVKCO3G8is1jKTmA6etTFZyhPRXKcRKG67//NO9Mf6Es/hOh3fPIePZO7C6vlk4XI7IVCl7o7d6dZNeUxBxM/5S0fyUVqCMgRmutMB7sIjm/0plFY+G/qHARZ2BGTWAdR02vvUvSDK0vCMl82evvwrD6M/RiG3a1Qjc5UjhhEFV8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhAr8lqSJFNNkwdQffXu/S1zClWILGWNOFJWCoV3+KA=;
 b=J1tmwuc1ENnxPujxt1w9f+ZY/UWcU0/Z3Q/hw/B98owfBnQMmoiz3E9Rjf2VMdegZ3Q1AzQGD4N/zCKhYR/e0hm9Nmys9ntshnKBiuXTtgY8DlJqbYRGnZVycMnKLj8vYIWRmSKyLcNEBM55Woje1t1BLVQsFn5eKG9ukTo4OZ2xNG4RXo/qcy3STPjKWjlxZktYunARKN1OLu8g1Au02i5LMSu7+5sPVw/+fS64V9ZgcACq+NBwizvmYGQdjIWfzMtlX0qZiLvTGC6jYlfxJoQs36tx3KQ+yqPEHzjh8twR7P4WPASu6Pgfn9t8CjELjTxBDWLSIek4dvAyg+Gt2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB2651.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:24c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:40:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:40:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [blacksail][PATCH 0/3] binutils CVE backports for CVE-2026-90828, CVE-2026-91781 and CVE-2026-91782
Date: Tue, 24 Nov 2026 15:40:07 +0100
Message-ID: <20261124144010.72865-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0022.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB2651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9118b074-c2f5-4791-efdf-08df4a38d8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|261009223027099003|11063799006|56012099006|261021121427099003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: wfXr7j420xdWg5a86Bgpu6jEZkQJsjLJeqGDCoIgM//eZhRPuDreQcVvRJVGH5P4h8KkcCc3EjAMoCEA9St6vYGFQJdKMPVI5ig4N7+pKktpjbBsr8bT9NAVi4qmKQCh4hC6uunuylbQK/pHIV//ShrL4qvsnaKxyhb+xahECwe+mcehVzL48g9aOIiImSaRwDLycNcW+W4uthfKDflb7Mz8u9iWNch1C/ip5Ghf9t1bR7E1AOrKlQKT1xHofmGndY2xFW2pZRJu5YsqP+ihkwQlzbBVtPpL+r79JVl1S4U2aGlb84qu05yk1UDTg49e/MBTvHOMOjjO71mcfRiu0dS9ibTES8pFXq38vT9VsnW7aKtggMy8uC/dZJOIUQwUuA9IU1vTcLRGTcTFKcU+m9ClRnkCepSHwN7xE8rHqKOSIUBE6TFhHXdpf7WYmutig+8VgVHtHB+ro8a4epNRvn3pKAycouoDWz6fhzKIMCXDN1ydSlPMpaMJB5Tjw610m3IaIHZoDxatsTzn1iwXNNIg/NXGdo1oD5Vl49uEYu52YldiR9PoT5BcgNUFuC8S6Dtb4fXVwE4E2UKi6bGkvZ+9bM1TPuLXZVxHCW5WdwbVZDwM01bdPCQp9K2x0xmDa24HadbqaGfdoZDGS4voluRg3Zu1w8PogzCRA7eAKrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(261009223027099003)(11063799006)(56012099006)(261021121427099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nVqkRQJVMkQDYieaN8gWOav4YO3FslZcj02IqOXmYjukIaOD8VMRstzLHLIy?=
 =?us-ascii?Q?eyFQzPWb1xkEM69lYMGetgMePog54Gd+7n4Oyw2uLts5eaeewQSrK0rGMWEv?=
 =?us-ascii?Q?pMgGuiQvX7lhkXSVFCNiSVAcCLm2Fo1sGABE4EWdOyzo7t98TfSVkhCKQEpc?=
 =?us-ascii?Q?y9KQlDY7QaCmLBvYggciWJl7+Ls2oI21nBks3yyYsQF0sSIMtxaoaZh1d3CD?=
 =?us-ascii?Q?kiATsafPgEZ0eGKBBACenp863JMibJsa2CXMpTQnVdUffEoYVfo4OAGDn1J3?=
 =?us-ascii?Q?t3hpn6mjIUUyekZcbRkSSf2fcTBpOtal2Cy7VfjMJlY+H7X+Uol1sm3nuUOa?=
 =?us-ascii?Q?FYB4Thao8gChRFPUJ102+2vK/NjAkm3i+9SoHlZG1YMDrRvdK/low49jBR6O?=
 =?us-ascii?Q?qDjkqr/bCAIw5sRLjKI7hpSTI0XlsHc9o9bjBmocA8MmCO4hsxZZynZP1NnY?=
 =?us-ascii?Q?39Mon/hLj7L9pt1YCkVXNv7RXYBO/D4vDbYFfAsHEubyfgYxgQ8X4Y17s+xK?=
 =?us-ascii?Q?7k6QJuct/PHgR2+7smdmq3Ti19NbXguvfxAan5dM7XOPamqALTUAXRKfsOXF?=
 =?us-ascii?Q?gREfRJEdSNH+BtvtKOD1UdDEcr2rSnRm/47Cw/LjsWSZPXxq4tcQbMLL+B1U?=
 =?us-ascii?Q?1eEYst6nbcbhwXrzKaWUOgfsNSgc3WXjSgiaecar+9qN4dnonODfPu8ompMa?=
 =?us-ascii?Q?eJgJ2VeXV1Jz2QOT81ZWBRxJfZfmMoiciVrWlEpbGo8R/Z8unxIv0UEJElek?=
 =?us-ascii?Q?XuiO8H+aujuRlFSjAgae6Xq1SvKgrgO+/QbcbxcKimcOGo+h/h6xES0hRljA?=
 =?us-ascii?Q?WYpZEcwb9OIQA+f1UGUpV1SasusGIVRHIiKuOoHMYEEZMgoL24VocBkCjZwx?=
 =?us-ascii?Q?yFkAWUu5NpBPVl6kc7dh47Gyypx+vQ2MMUXsemCBPnSGwEqqFThXpydpHp0J?=
 =?us-ascii?Q?pZQWhvvJawMWGT34F6X2drHkcWbWkcbLJy+UFhPEu7DMgbGYKjXfF7G2ZPVY?=
 =?us-ascii?Q?PgAWj0INq5jkoLYxu/UQxOEfpTZZ+P1rHDB7qLiQ5WdIgvhy0Q3t7ZD/j0FX?=
 =?us-ascii?Q?2WI08BqLsZ+l4EfMqyigav6LNF4ovfvlb2GQqEuhXD2LQQitC8oHatrTcs8I?=
 =?us-ascii?Q?uDXp19zvxoBCgjH+oe67h7jfUskzbZ9/bN1iO2hZVxV0GgnJ9NfzOTW12hb3?=
 =?us-ascii?Q?7xPmJF+hBrzcGRLEXbiCFqamZ/mB8jwB9l2g7fiGaW6777EyTj6uQh9jS57W?=
 =?us-ascii?Q?cteaT7ok3xV7zZwdtJOPDAF5Yj17ymrSW4QVl6N/ABF5LH9K+GbjBbP8NZCB?=
 =?us-ascii?Q?UU+yN0lN8IbmxqhJlKxwAA7ZcAX+qXeN8Mnx1NXNCx09yuOpng4Oel1VVcCX?=
 =?us-ascii?Q?2lKRm9wAwL9rkxPB/+s6fYQhdE8UsTAH6aVKlV/zjZ2gcKq4naY+AXOdONq0?=
 =?us-ascii?Q?CmbtjGYr3dmG1sygrF+PToKOqosZDsOUFk6WJrewu6+rue9TEB1FvTJfs9PU?=
 =?us-ascii?Q?3NrjGDCGFPLUGaGkGtIjbEblayhyRDICyVScz/s0nUY79piRBLoemfT03Xxc?=
 =?us-ascii?Q?2Y/rfFHcNG328iV/z5nbXpCXNi9NcWgEGSCkTq5eAPu+L1ooglYD5n7vMnHX?=
 =?us-ascii?Q?xX9xzXcw7lo73DjZbz5hnjzKOJeRdFGnwjw3Okevtnr+EkoeNTwF3dFW/XzH?=
 =?us-ascii?Q?aQquU4MbYc1XGv1l14pNqlg7b8nMkjik8CRYBG8DIA215LNawH0dqKg3ht2R?=
 =?us-ascii?Q?iDVFU+FB6g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9118b074-c2f5-4791-efdf-08df4a38d8bd
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:40:12.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz8hz5+g8KYfAfC/Tb1/A0YUohSoKyDQu04iBDwEo8RFpDNBXxrlFgXiSPzwFLEFo5mt0hyIsMzZdsoYDMNR4U2MaVscgHF9kot3BQURWE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251036
Content-Type: text/plain; charset="utf-8"

Series cherry-pick from master

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

