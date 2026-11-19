Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15189.1795097628362383351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EXvJgNF4;
 spf=pass (domain: est.tech, ip: 52.101.70.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waeWeKOlAlR250e6dZyF9iGDhZ0aAEMy4f0YvKT0S5jGZus2/cGPRUsjO2a9LnmOSVUnHGmdR/URJYisOzVIrQPHy49W0PO3/0YlcjNYly9j/xJuPdnYDVVO/XnbaPZf2pKwio5+HwWKwekP2awUlUIDO1b0A2nicbay/8UqC3+l4xB0O0RYIl91aQtBcIJ1qoH4mgiN1+E2Rh/CzMijkySyaGrEhFhzX6V6jkOJZPcqtA1a+fgtZ4MYQXye+1t7vZotQzRoYcle+8Z7ROyTcoVl1r0XAGlQ99mJSnj22Lyus8X2+y8dsVDeOuLYdqz6AuDeuGcTmIvqxov3Xc86wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUsdKi1faOGL4I9iMT9NVD5P5VI+q1klmfyYPDoOYhs=;
 b=TQbSjck8MHF6OnVSLKnGMyRQukgHA3M4eqNX8IIhPUK/kwMdhga5MMAgI/liMcvTCrRtQudRlJZGgDsUPvBlWXy0mlWUMg1glqVqnNj6T1iPj1WkwWMJdBzGD+odPbKNn91rZjPTWmMWahV7iiDH88pTFKrPkfvDfEjCF2IHmcMlMBJLz4DT/geaHlVdTFlmsLO3yp+3vaIB5aqB8UJ/zLyeTQEXiAWykWj49mPPl9+4Et9KN/zSFs1ClU+HADFbaJY+WriR6eUbi/TS1zae+9ffxl1wK981SkHJD4XadnfX1MiK3IfgQGSvjtvUk79i6PI5pQn11OFOaH3W0/Ik3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUsdKi1faOGL4I9iMT9NVD5P5VI+q1klmfyYPDoOYhs=;
 b=EXvJgNF4tDbRJxEzT3MCXhVCq3Ur9HI2EecHRlgQWmriI7z1P2jTvViiIs/iyhRWKRSB1LegAw1uUwyNmJrsPbe6aHWVolzTO+OA0ViNnMqegs/tL/c3a8L6eFBCTH1UXKqK9br40C/h61JTgqASwAvugaoNUBQNn6aiAI67LCroCGfpivAlPQsGN7ANYiraa+gVp0eITdQMD+zGlN0mkLLXAfE4ZYd4KF/AnZutG4AqECXtt5LZTpGVw8DuaRdKiLYWHH+/SdtIP6HEAUcq8nTU/2Bjah7QOnjXX0VEMAv/WxChBROctekhgzocKEGZRBwh2aT4RI4w5+3TYuciDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AMBP189MB354107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:78c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 14:13:43 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] webkitgtk: Upgrade 2.54.2 -> 2.54.3
Date: Thu, 19 Nov 2026 15:13:31 +0100
Message-ID: <20261119141333.34492-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AMBP189MB354107:EE_
X-MS-Office365-Filtering-Correlation-Id: a02605b4-ae0d-41f4-6ff2-08df464751b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|11063799006|260925021311599003|260925022911599003|260925021911599003|261026121527099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221227099003|261009220027099003|261009223327099003|261009221727099003|12006099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: kzMaNxZmBGM1Mq80VP3+3J9/Zn3o63p17+qZsdN45N+/W1rI7Jbis3+a1s6sHz3qfooTXmb0OvatdwtpxSKp+HkOIeQXSCq4GDNz0ExmuPQ9U+KG5iXjA5syp1E6+pTDbgV2M2Z8JX12xaHN0K/81ZDYimZsWsC3jN1bLVrowiDIew/Abt6NtH3RVFxOO0rWaUq0aqIBpPBUStSgvvh/wC8Kv9osBdm4Yjd8+dl/T4c42qwFjFdMsGwEbFIH4KPcPWxKvyNnTyVS6UlyFt0MdATyVIK/BI42KUtisyqKnEYZ5SbLzDVfDX7qgDClbC348sQuo23klgbc6Yt3u8SRWuNE1i5R+PaA3cfywbPf1VpPTOvyMN15zAtJiMIyNVTLLVdRxTvQpWVpgdjTbwtNAgJUOE/2lgqhg6p90D4Mmf0280WmGqYwWfn3AuMVv3sf8HPnm7JR5LPcP/5B3aA4NzsgR6yMqAb+tRFrt/MUDeVILr2nFm/OrZRqhzuKNF8h6R3QBXBnqATkwDbDhSFZCZDgiGun5U79Bqo6WFaXntSnWZYoQMiCe0iJjaEQznmiacRf+DjHEYQAzIayDGgqlVw4S1zUWQ4M4eT03LyvpIHdhbx2Rj/myYxEdOJNkbwe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(261026121527099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221227099003)(261009220027099003)(261009223327099003)(261009221727099003)(12006099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0OdYaL67guKezEhNVZ6VMq0Gp3yxZdzxCWTPNv452Ogxvd8Op7S+6pX/wMFa?=
 =?us-ascii?Q?xeDvsLqo/wyocRNZfaEV5Mpr2N8qOKaiaBzzcYv5tF9cQ4FOEPE2TwuQZyrE?=
 =?us-ascii?Q?R0Ax4uiFNZDdLx7ZRJHvWlbEtbTUlVEVtlbqiB57EWjca/tpZcx5LBFO8ZWQ?=
 =?us-ascii?Q?hDUBulRc9hvrVxtGkW2zgEnA2Iqg+W+7K+TUg7bJdfXkBjHy4Fiv07ADekQR?=
 =?us-ascii?Q?bGCIDNd+hKePjedF3G8o4ln9JVdu8ZF24Cxp4qBO0t2q2IXLxRMmHg6Kavn0?=
 =?us-ascii?Q?K+cyZV3L5dghsG2dxp1mqqmNnFr36HudtAhLnYQqlO7Yph1Z2/Rs1KGJi5Yu?=
 =?us-ascii?Q?ZmMWfrbF2PR/pZpN1WH3QyqsyZO+uHhA15dd0+JdaL1crOB5LbZ/aVGVuY6v?=
 =?us-ascii?Q?JaU9jruKAMKDysITHg5YDgqeIFZwMpOHpNcvD9ZAAxt4D8Kaa+b3bPMbk2G5?=
 =?us-ascii?Q?4Zgvsti95To/Myng4pdCkyoxbNXvSdTkbrmNqVI4bR4nAKnivxFfUjlCcmFL?=
 =?us-ascii?Q?6kcvyKg5u2QjbkaRcCYPWecgwU1qGVFN5fy62wJEYYkC5DHfhQHnebZG4Y9G?=
 =?us-ascii?Q?fM+8bqk3zRSJf7id56RlHwtx89QgNC4NiUX2RyGhBOFf6kAu3kk8pRaClmZt?=
 =?us-ascii?Q?pWW5JuXZajU6qYWcpWUv57RLAiPvhkJ0vsDM0T4d/p0bJih2AoIHt6wFjYSq?=
 =?us-ascii?Q?A+QE6AsvcH5UVl53mVtUQ8uWwXCL8MNCQZvbZ3Z+wP4ePhkXNfvoSbfOSTPl?=
 =?us-ascii?Q?+NuhLT/CEroLc15+6q74wQ0EtyIfBPqUlnYaw3m/rjCF2Kicr6yq94bEtVn9?=
 =?us-ascii?Q?QiaNj/rqwasOvMgeQLBQtlhNJQiZXiNWkvqNaRfS+UFJOhX2y+CO3AXB2oep?=
 =?us-ascii?Q?sSZ1o7tcJ47AhLDt2rMpd/oYxBzajgkWfPXKPv2feO+5qFCbmx1hTy3qwPBi?=
 =?us-ascii?Q?jogEEvf3f2iHz/Y9qFnKt+uEexh9X40w60FtqCXowWVLdiCv+shQ/8QloveG?=
 =?us-ascii?Q?kGdtomMNf4SNTaHMYN0and/kS5xjzzUllu1RouLM6xw20/k2bulgVLMVpYBT?=
 =?us-ascii?Q?2LKW2w+qdYW5ZoDx2MsrTXdPrpCVXMKvXhy3hyDRjFqykr61pLlT93EKZ/6G?=
 =?us-ascii?Q?8cvVXbgCZdSsH9Y6W8n4BdmB/0nr/PyJ/JhmKBM9yZ+sk6tMUhCEeTgCWmjl?=
 =?us-ascii?Q?VVZjwEqZ35cVy9gjrnGb7ld8dxTibvvuXY7JmPlvqW4ydPV2CgYNi7zHBFJG?=
 =?us-ascii?Q?zwTrQ0TtMSz4eTOvRWPtl6QWdvQ/+yVNUDqYsUIaA3oaLi1DIt/ixpAekfvr?=
 =?us-ascii?Q?x0DW59wXfTiujrEQLHqnSkRimd7/lMrdj/zR5C6jlMHHGNFqDSoEP0vKmck7?=
 =?us-ascii?Q?ORz+wVYsxvv4gBUclMwz2es+BHa3eOvLWD45R5WAP7CeD6jvtJPMumDw9Jqn?=
 =?us-ascii?Q?V/LD81BzvihYlEHLnbVC5HxIf4H26lpoaUUbBanqVweI3XmFshxqoHEgIs3r?=
 =?us-ascii?Q?pz81/VzZoUZGG9ADVy5U7dkXH0kzM8bjqn710d8b+ktgSA3zQcKKpvMrLZhr?=
 =?us-ascii?Q?ScFxT5LpHdTGVGHo3cptiLIH/e1paRT95Zq2ixkYtsyqfJgcHatqauGNPkz4?=
 =?us-ascii?Q?CmAlwan172l1VHfCq5OsBxmtYDx7b5gU/J/NYgciGL13EPFU57CE+nnxbTww?=
 =?us-ascii?Q?TSlOY+WcKFhIi6wWEdiQYJagfoWBPuSKPGVEdAGJeRhbpbFsrDAbRZ5MPNKe?=
 =?us-ascii?Q?IIvY8hVfqA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a02605b4-ae0d-41f4-6ff2-08df464751b0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:43.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7qT3y+UfMuISy2MM9ItBc5o+uPjeROHcdSMlNdmzC9W8hSGNL658DWyuF9c6GrzMB+EdjuRsKNQDWUycUJNPImDECfc+GJGuULkqmSczFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB354107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250677
Content-Type: text/plain; charset="utf-8"

Release-Notes: https://www.webkitgtk.org/2026/11/18/webkitgtk2.54.3-release=
d.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...e-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch | 2 +-
 ...GObjectIntrospection.cmake-prefix-variables-obta.patch | 4 ++--
 ...ce-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch | 2 +-
 ...as-Do-not-include-stdatomic.h-from-C-translation.patch | 8 ++++----
 .../recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch | 2 +-
 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch  | 2 +-
 meta/recipes-sato/webkit/webkitgtk/sys_futex.patch        | 2 +-
 meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch  | 2 +-
 .../webkit/{webkitgtk_2.54.2.bb =3D> webkitgtk_2.54.3.bb}   | 2 +-
 9 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.54.2.bb =3D> webkitgtk_2.54.3=
.bb} (99%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-t=
o-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 243f5870bf0..5e1fb8b2652 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-contr=
ol-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-contr=
ol-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From bf74a02e45b3e147d912833a4ec6ba489a28344d Mon Sep 17 00:00:00 2001
+From 73f7316ee08a5369555e3e631d48ba6a5a01cf9e Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospecti=
on.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 37ad5ecb805..5a9be948362 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmak=
e-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmak=
e-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 1eb26767f3ce493e8fd4ecd7a0d3d8bb645a225b Mon Sep 17 00:00:00 2001
+From 773c76b7f22c213fd8b67dc6952c3c715973ee4d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index 8cf372f3..40471487 100644
+index a8a56fdd..572ca99c 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.=
cmake-do-not-set-include-dirs-.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
index d9d664bca4a..cabdd3dab15 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-d=
o-not-set-include-dirs-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-d=
o-not-set-include-dirs-.patch
@@ -1,4 +1,4 @@
-From 1899b9f2eadbe4f2cd5b4a68d0788e8a9f02cabb Mon Sep 17 00:00:00 2001
+From f4361f879eefd480197ba0210d102c2100a4c24b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 21 Jun 2026 22:57:24 +0200
 Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-libpas-Do-not-include-=
stdatomic.h-from-C-translation.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-libpas-Do-not-include-stdatomic.h-from-C-translation.patch
index f16900c378e..ef962bd742f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-libpas-Do-not-include-stdatom=
ic.h-from-C-translation.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-libpas-Do-not-include-stdatom=
ic.h-from-C-translation.patch
@@ -1,8 +1,8 @@
-From c018bf3bca4a42f9540e50e0f5080c38223c2ddf Mon Sep 17 00:00:00 2001
+From ed10e504c0a627769973d3078548bbd54ed750f9 Mon Sep 17 00:00:00 2001
 From: Pablo Saavedra <psaavedra@igalia.com>
 Date: Thu, 17 Sep 2026 12:05:38 +0200
-Subject: [PATCH] [libpas] Do not include <stdatomic.h> from C++ translatio=
n
- units https://bugs.webkit.org/show_bug.cgi?id=3D324345
+Subject: [PATCH] Do not include <stdatomic.h> from C++ translation units
+ https://bugs.webkit.org/show_bug.cgi?id=3D324345
=20
 Reviewed by NOBODY (OOPS!).
=20
@@ -42,7 +42,7 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tec=
h>
  1 file changed, 2 insertions(+)
=20
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils.h b/Source/bmalloc=
/libpas/src/libpas/pas_utils.h
-index 9626340809303..e781d8fb12c8d 100644
+index 433b26f0..49117c2f 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils.h
 @@ -42,7 +42,9 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/m=
eta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index a77db5668da..5d1687f0395 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,4 +1,4 @@
-From ae017d7bd4d98a28a4f89a4ca75493333172bd35 Mon Sep 17 00:00:00 2001
+From c9ef6dd13cbdc16b1ba50757451d631f572c723d Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
 Date: Fri, 19 Dec 2025 10:10:41 +0000
 Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/met=
a/recipes-sato/webkit/webkitgtk/reproducibility.patch
index c2e7961db33..9ca40a0ad3c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 5cbe3e7db8982078157de0d2bcc8e8bedf7d3c77 Mon Sep 17 00:00:00 2001
+From f0c2db534b2807465a36f6e23011dad9cf711da3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/reci=
pes-sato/webkit/webkitgtk/sys_futex.patch
index 1797d833037..decd5d0d5cb 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,4 +1,4 @@
-From addce4888885a925f7711efda729d94cea312fe0 Mon Sep 17 00:00:00 2001
+From d537da81bbec0c05e10525c0a29e0af9128c0ce4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 20:24:22 -0800
 Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit ti=
me_t
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/met=
a/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 84fc64ca1bc..2a59f3b2d94 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 8b7bb89d335163162fdc374f5a231273ae5b2f75 Mon Sep 17 00:00:00 2001
+From 668ee03b07f9d64b1e7eaefba6c74ed1975f7b7c Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =3D?UTF-8?q?LowLevelInterpreter.cpp:339:21:=3D20error:=3D=
20?=3D
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.54.3.bb
similarity index 99%
rename from meta/recipes-sato/webkit/webkitgtk_2.54.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.54.3.bb
index fe6713d641c..3270eaf3874 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.54.3.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-${=
PV}.tar.xz \
            file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs=
-.patch \
            file://0001-libpas-Do-not-include-stdatomic.h-from-C-translatio=
n.patch \
            "
-SRC_URI[sha256sum] =3D "a76345b391bef6211fb5ab6cfab2e86b285d18cda17cbb9ade=
595f1252b86065"
+SRC_URI[sha256sum] =3D "2779c1b46f88762e8400650271ba14452dc4e30b3705998155=
2d8b562b7d0862"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check up=
stream-version-is-even gi-docgen
=20
