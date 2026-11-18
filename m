Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14971.1795015264024505490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Hr8Kdun+;
 spf=pass (domain: est.tech, ip: 40.107.159.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzrpXbY8atPzuVt4vQjzOFCyl+rmOYgNGVS8LXGjUyVRjzzvtL/EZxkxaFSFsb1sC8sBTQu2WI5CLAsX6gGjotgy8NmsYBCAxpo49Boo7ChG8Zh7p/mhmHd126OFA6tpx5Z636QWLv5j6v1hZ+TIhIR2SJOTeyt/fWtvhajpcqLHulnomMfa3/c00dasPHmVHQvg3XxvFdoNR5XyL1tdjIvPaEB3RgQq4l2wuHw3HrgLKMEEH/8fPP5APoN7jPIKfZjM4o9PzsN+QUhLRFFeLMddPKLtU1+hWwz9JEzS5fDARqSBtbtvNzv4RHZQrJslFx5pbbh2147DuXaILwAzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WjXuTyLvfx/dOvSJFumpSWeEEW1AuGwabfjkgbXp+s=;
 b=tqOhvh+/q0ACteydgcNdLZTw/vTEGBn3h1ym2qpl3TlzsBYE5RQ7sSD6doNT6NeL256JskbjAaZ6ggLBhZ5+gZsuuXQEe9LKYtyl2ZDeSn4VgZ+vX0gW9WzU32mmZ1u0lvw2T6aEjpzKnxuOH+az15gxNtlpVRdldp+o2JD3k8tu50nxZY45MqtQRrjKDIiub3xv27tmzJtGHw9L8xCgOTluIHMpwwmV9Nai5fma7ymORHZq17xNyQxhWRbCTV5R/LvAILvVOAmG5/gicWLuNZGqSQcmD3EV3MOv/RrYhgUX13zlvkzNXS2gFVNh2Cwm75qHfkKc46eByCIjoCrEEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WjXuTyLvfx/dOvSJFumpSWeEEW1AuGwabfjkgbXp+s=;
 b=Hr8Kdun+I8OIcO4P0BxWVMz7tEkqodR4X7IAvNzya4FlQBt62xkg2OtNx+FlTNTUWY+K/iZMPmcZr4Ok57KoRs7d5GJDwq1t3sqGABvyDL0j9fp/mtNFn6v/aCUEbq2aVrnrqcZPepDXDtIs7t/gxzwIsaxI8UKLsTKQEwvDErSKB1zvIB4TcflmqeQVkVMsypGzdjtkU3WHTJV1+yEmBaO8ta0IHSlWXbADXkxNrLpZ9POIqhXQaCyvf0lE5MYMiyIU+lcdmhyTmv/M3Qz9w25E3wFqvOQAzdBbDAgXhn+b8lbxamvnp9I1KVvKvG9hFiZUn3nafUgrXl+N0C4Zbw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:21:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:21:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 0/3] binutils CVE fixes for CVE-2026-91781, CVE-2026-91782 and CVE-2026-90828
Date: Wed, 18 Nov 2026 16:20:55 +0100
Message-ID: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0038.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b53554a-6328-4558-4c2e-08df45878d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: oTuE0woap9547bHqqfTKUreShvikYOOYpf05D5doXT8F9bORQk/DxVZ8jA1CXJWAUm69EvxLpP2KPnmUODXZ2QAvURvXDeFezCHNSdaEWy1bmqvVLiioGjEJ9kQRJEJXvHbsOmJGLKB4chzkzLgngHKw8qBezvgX1OKd1FHx3cEnNr59dbcKFG3TqGcskMz64XXHS9OK/MqNnX0C5l15d64PeXXitUXnOkCU1QwhYHoalrRYycqiKdIPvHygUllSEiIlCPLpXnozmXcBnoq6YiXHo1KiHotrshqrzkW0MPsgtd1qjcwPOIp2fvFT7sqhdM1hxF0YTAv9HzqArD1f7uTx0zZ5+Nkse739uF+GkLrtaZSc2JUaFhlz1JiRtVdEtbUBUie7O9nuyipz59f2UslOxch3ogNZJlbyslX4XzIRK/4r/NaPtAcBybtr/Y6bMknsDgc6K+aZoj6x2bLZ2uj/q9bWBiy5TdyMwmeF8XNCMiQR8goppn56W1Ed4EyyBAb8tvYHIBvZvHAAqDw1zdDPIvP7EZhwMXM/lXVR2p50Q7TyXrDU5lNUXhNFVQfb0kL5ND7IgZTLMYuvIsvbp/sr8ogXy5V1RHgVltK4AyGldVUMZOv9+5bOqcaqsmD6KAR7lMfX4bS2/YkiM7/9uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOijfW189M4szYiIjmurRv+3/rgdmTFhiuzS+A9M6SGwjfOub03oUp56JMGN?=
 =?us-ascii?Q?KaiSAZ5fo0WMFkVtxLktExvbHMkNr/GDF8IHl5a5fCzGh3uXVCowDTrH45tB?=
 =?us-ascii?Q?ci+pgfWVmn0pRqMXdtW8mtRijClMc/Ou70dVV89CdXApeaZbdbAfiMs32nD6?=
 =?us-ascii?Q?0smllvm1izAaS3AI1At3mZUdJPUSj6ZpCw2/rvJ511LwVLct6WZii/hlI8OK?=
 =?us-ascii?Q?65d7f+SJzrXSKuuYtGFGnXtv0XwTzt9ooOR2KNXdstcsmy5dj60LhcnlK1+3?=
 =?us-ascii?Q?6fTPv9HJ5gHiluVmUBowZ/ShSWurCWfPREbL4XMTn/0E0JnLEc0nw6A5/AXM?=
 =?us-ascii?Q?SW/fjs3agBupENqWibvbX8N2d7et2cHuNbMF1Z0xXyJWFbMLUqa+O4z03Qjb?=
 =?us-ascii?Q?VEFOinnEIE38KLzTmJCOOZ47YjJy1gFpUWvhBXfYP97Wf/yOwEOpAeJfJacj?=
 =?us-ascii?Q?WPt6lC6oeZpVvMZw/g+BWa9il6J3nqT9dJdT5nZBAp73zTQUjeRcb56ZLB5X?=
 =?us-ascii?Q?0r77+JHdWskD0NVxHcbwi6I7ClcTy3ywvOASwt5aiCqGZ7RTqNT2az1W4BAC?=
 =?us-ascii?Q?Ir5zOUjx5fX+FJtzLGXbavLB4SQHfQIWOtKwrKTYlBA0Xo/LMe+sHOhwYY4C?=
 =?us-ascii?Q?gOsqo/GMcu2df1hZgHBiEFuBXLBi1az2RSOkrcxU8kMm53RToN23qIeUIWVi?=
 =?us-ascii?Q?19dpZ58Scoh5ZxOIyKN5J3l9m1udUV6LDKHk3mFWk1rOUKGWBUWEeu3KUsVW?=
 =?us-ascii?Q?TzHUPppuIZOQqWk9E4aEFSG/joHP1ftdQfIB8LC0o+B9grzfe54HvV/T57Dq?=
 =?us-ascii?Q?jNzg/mhpOtNCKFfVwcEftb082ikmSnyeCLRE0CEx9JR9w727Rvb0K4S2Y1EG?=
 =?us-ascii?Q?QeZLUj3vxEBm3sHJQaH/xzkHd/xlSK+IrQkftdUqW/CYD1EFTGjLad7ubw2x?=
 =?us-ascii?Q?I2RrOQokx9eG41qmRn/EmS3skNd1u9Wkbe4Q+makkaWfqyLkbUERRjiNQeKk?=
 =?us-ascii?Q?oJwH84tVve/07QB85atWYKjPI2AAgY8teAOusrhT7/t9+u88aCJEBCM6TlQv?=
 =?us-ascii?Q?5FNAgbgwnztHmgrk1bH86Cq96qF4p5n6r2O3gQJRanCCoYkYjp7mSGjcd2UC?=
 =?us-ascii?Q?G0qQIOH1UQzR+odRl69fmCnfsjBuJIzy2BiPVeuwwQbTnxFRa+IXooU/VAzd?=
 =?us-ascii?Q?PrfDrIrVxuX7zrJIer0Dnv3EsLCl/4IcraLI5qzqhR/GA4tF0UslsLhxZ25v?=
 =?us-ascii?Q?VD4fd66fRXOqins57EhGxciezRDeQOf1UaEsCfvoAih4he/N1AhjUMjOgfn4?=
 =?us-ascii?Q?gufzvoEIhTjoXLQBYJ4JZHm0XtmqKQNC0PoUhNN1kYJRsnNLlv3iREtfBCwZ?=
 =?us-ascii?Q?nEKIZmBCJDKgXAzc9Ko+V3rxuL1Cl1WT7dG/v7Oo1sTeKuK4Qkb7qydEggn6?=
 =?us-ascii?Q?iEu1QEI9EhTBRbUYoUEnW3UY8cqBBRVg9TPyODWNaWrohvVEdkVANOauaX5N?=
 =?us-ascii?Q?EL+u4FdAIsHmy5YrahwKIfidLiVYm9WbLKDll9WLF6zzhQI3fenO6+wpdu6F?=
 =?us-ascii?Q?IEh63yMu7HhPbRP+0HaMSGffsKFZkRHupv+ZLJW1iQ7sEx3jbiucpaqlSTVd?=
 =?us-ascii?Q?v6QQlcjDSLd5eHpCRmaRsUyUGGDYLrTGiGIsAYOY1w9uQ1bzdZbgWldJg8qZ?=
 =?us-ascii?Q?Lc3jklGUHf39zc1ZGupdn/Z/55uH48Cbsm5lZEyHepg+pygSxRt/j1cKwDKq?=
 =?us-ascii?Q?pzRIxrlnaw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b53554a-6328-4558-4c2e-08df45878d0a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:21:00.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00WTaLtRPXRbdWDk9gwKvlO0BtjqQtPkEh5y/9dZWNE3y65vjPqr9sH5psUzhcJVsrp7U16jhfF3atQiSYGEcgjlTpFKe4z96ciOAJPr/gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250561
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (3):
  binutils: Patch CVE-2026-91781
  binutils: Patch for CVE-2026-90828
  binutils: Patch for CVE-2026-91782

 .../binutils/binutils-2.46.inc                |   7 +
 .../binutils/binutils/CVE-2026-90828.patch    |  29 ++
 .../binutils/binutils/CVE-2026-91781.patch    |  36 ++
 .../binutils/binutils/CVE-2026-91782-1.patch  |  79 ++++
 .../binutils/binutils/CVE-2026-91782-2.patch  | 423 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-91782-3.patch  | 129 ++++++
 .../binutils/binutils/CVE-2026-91782-4.patch  |  49 ++
 .../binutils/binutils/CVE-2026-91782-5.patch  |  67 +++
 8 files changed, 819 insertions(+)
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

