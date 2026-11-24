Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24291.1795540694721029803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oQseUYYC;
 spf=pass (domain: est.tech, ip: 52.101.72.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJMniMHFE1hFx1wKJhgIFDUDs3esNFfRPmUt99+0dHDivMsLs6ZWk+E2bDL1x93M1mL6OYsH1lRMGMbWvW4K751RsvU6vJc90uZVkIpDnuYek6yiDEz8nPkb1EShtGrYOXXee6HSSSfQDOqm9VNqlb7Hl0aoQ5+DPc8Cpw2xuj2q7hXcvoqnNh5IAo7im12rzktrD8CD53KyM0imWb5KKkSacCODAFyuGcW6GiNUHZsVdlnEij+4agEHFVDtTqLqpz0SCUMNSZztJ3hbR5laKNInZ1gSjvz54dpZss6DlJUBC2QLX38M9H9+hfKKMukNNMYX7FS6dAWnFAJIsc09rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KliRxMImSCCC2STtHDZI5ImSJiAa4/vMqfSERb6sW2g=;
 b=Kx27Bt+OsCvh1fX/AFIwo9C70ZENFnbtPwePEEqlpZFkJfcOUp/qZLamWxBtYtOxSx3xAUpKw6aD2AlnJvQJQ0dBtbm5AmOSO2cyE63E9nSbWcm+RuXQIFMrulZUAp6L49H7YrciJJkRyMwtr9QimcPF5PRpcBNsiOZioyPURrOCcpigBIGmCEZ04KFHIJ6ZhBhtuX29KXvCfrsNusDgd2xw0B6NdpN6DYqpLTCRWO8+xshq5dmWiXFxZx4WLOc4/FFEVVujWd2CPxqyrRrN3JRmO+k+o/h6jcz97qUXy0VlNK+TEuKuo2v4CIKPZz7OFNMfeG3K+nE4lPwNVWJCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KliRxMImSCCC2STtHDZI5ImSJiAa4/vMqfSERb6sW2g=;
 b=oQseUYYCOzCl3MwcIyswQJ3BSaAv4tgFiWyD1DBbYgkM1aQOREZIJYMIeqyYqfAE9q0U/bL+odV4MMp1ikBuC02XacCWMLRp5nFU9HF9BrljCZZ8PtmXRomRofPAV+a/mTmKSKKizCE5HKG2wKA3GkQh4jrrCR7QBGq5knGhHbNVuoYuCbbjRqy5I9PCgWuPP6G/emBmayL3Atc2D+Izt9M4O0a7pyUmAAghjWsVM/VJ3wHnwe+qQ2eEoyKS+bTU6pdg7lddJB4WWvm3FArBTx9iLRV4QR5YeeyLmcfz6xefcyFDy4nQCHTJswJlbbhket89ct2711vbzdYWj5Ixjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11] Upgrades on 24th November
Date: Tue, 24 Nov 2026 18:17:56 +0100
Message-ID: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0028.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: e53b103f-f86d-4cb3-69c4-08df4a4ee9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|6133799003|56012099006|11063799006|261021133027099003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022115727099003|261022075727099003|261026121527099003|261022105027099003|261021130227099003|261021135927099003|261026135527099003|261026130827099003|261028144727099003|261022113327099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: OxbDJhnkD2dTBEDMn5ysHYE2nXDGaoVDIv7tQsFUlEEgIsZStjXUV2F9O3hkrbyDJYWL/qzCA9dpQ7ll9UEdoY+iUrp279Y+eKplpqRUrZ0c38j2dDv4FpYUZoZWtdSAKDm5BQ/v6wBhpyFr9+JFzPaZNdoalQCTHX29zCwKRtY4y9noxrbxRDxFOnmj07XLOziTg0HQQ6jdflJ1iHNQqid1HN1NjM8uIQridw+I0yYltCoZrOWbbPiyxAuVbs3GYnquW196YUHt53CDr//4VPDQ09oscGG+RVAFL/RF2tL6xjDdVt8/5fpfA9jdoAuBVh8xcnkulgEVKXA0xhMcFmY3G13xJ6hk7qibqTpt+YjejRsVtTqYAFphSz5rh0T0YtbT5eid5/Et+La2D46EcMVt9gnidy3a1SJhQCSyEOH3PbsKq09NTDZjHAB4fKmZIYO8iMg6Uusbe26jzAxhzQEISqHmIdpej/T09Y5toPnOprlRG4SItg43AVljSUdcdtoE/7hqQNjE+lYlbYzJRxvRSh+LwpLPnz3TOy34la7LH3HAtfqOiESzdRKlwGAhNm8+orNZ7pYJ9Y0dIl7d/VXC6BTF0mHW08EopomCf9vgnHtTIU6S5dzJ/bCEcUReYfiIDyD4oYC2RJQfRaOv4RZqkabCLJhCgtavWn5vfhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(56012099006)(11063799006)(261021133027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022115727099003)(261022075727099003)(261026121527099003)(261022105027099003)(261021130227099003)(261021135927099003)(261026135527099003)(261026130827099003)(261028144727099003)(261022113327099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7HJr/TiUm/9MdeSbdKUFLFkaZOquv8Su3y3XdKRk2+1620Gr85N17ttPjsN?=
 =?us-ascii?Q?k+rHCQkyV5WpVvl5IhqheBCnH962t2TvPxq2wOseQOL6wN7wagzg4GzCGR4l?=
 =?us-ascii?Q?Uei1QdR0/Ld0yfz3nrd/TLogqRNXN0UJH27pnCG1H4I+KwUP4xj92+2nLgKv?=
 =?us-ascii?Q?+S+N+phNDIffdL06uFnLXoq1r+OBoiS3OkAAZGibECe1mgFebKNA0p9idO2k?=
 =?us-ascii?Q?1mNt7VZC/2mvwqGOnCgFDWkrC0bzvlWIjLQD62bM+hiY4ypn6Zc5i8b/ARlE?=
 =?us-ascii?Q?qj8XMXYR7ME2VR0z3uRHt5XpWPuYwG572UrkPjlcpGSP7vABRhEFXVmFTsM5?=
 =?us-ascii?Q?jC8QiWTqbTU/mr5Ql4JhqJoHk31cZiyDss4m2TKCjT9KThrhSycR0ARwhD3f?=
 =?us-ascii?Q?Lm5+DHLXvllZNqjgRthjaCvpRDneB40swmXowpeFYOhcXdASU3UznAv17/Uz?=
 =?us-ascii?Q?TY09yhx0tdUf29+b6c75uMJT2Gov31VEw2wzvMaCsnryI0mT29Ja0iZVZaaq?=
 =?us-ascii?Q?eO8Qb/m1GxnhV5cVUCb2HNDycZgfIKz44S3+nGc+shGgxPRNe6x5MIrJ8sEZ?=
 =?us-ascii?Q?IxADYJJndZPPUwdwN4jrWeujU25kl7uUWISNzen7bFoGDvL77Z+g9iDU9FrC?=
 =?us-ascii?Q?usBF/NwP/t/I4b3FF+y15RLnAQ41nvIbGfWtiJYRATyB8V+BB1UEOdJstsA1?=
 =?us-ascii?Q?fEl96mYGEnKBr9IqN5DU5jQaEBP/4u9STXYDme8d0aFp7SgDPjCkLq/7a5/V?=
 =?us-ascii?Q?3pBSOpO8RRQIroKjZn7egUpMrDtwzWgmIm1Po8V06IMajvln0Yidxxv4hTtA?=
 =?us-ascii?Q?erqYHSc3kR9jTAzvU8U2Lf6hfnEiG8IJIdgR4/7QH/JVFoBB3UvCxwoUOJNE?=
 =?us-ascii?Q?rgwbLe06IzlIhRSmIDytyKXroZXcVRjZ3ND6QoRTZezCiVZiXhkuOrW7B/GX?=
 =?us-ascii?Q?SmhrvITd1mEq/OHYXMEi/HydAiBYgKMf4+eeeC3U1xofQK7s3HdzouT64PUf?=
 =?us-ascii?Q?DmY8M11xsAls2cyVuT4/oG1sDgMv8K/Cb1nk6Xwj10Ofml2Yu9CXvXNQ7OHW?=
 =?us-ascii?Q?/2PpyFsjNjZ3tCs4c+pV/bYDYc6Z+CeMkd7DT1ubS1Ba1A3CIauhQZ7GCZE+?=
 =?us-ascii?Q?7X56l51cxVth0es5pCcSl56oyO4GPvUZJNfAX+KyFIr+5xCN7YQzp7XhT6F4?=
 =?us-ascii?Q?Q94XToivZ6ij7yApMQBQ/fo2G3CM3DUAP8r2bwYkWeKgEhgShxisal8RXxB7?=
 =?us-ascii?Q?kD0imm8sSTNF2pE4U1cMnyd4mAWcWvQ2qAqmOOTgyWDFGfIDTWV/vCrA3P7v?=
 =?us-ascii?Q?nJZ8KIi1L9Lr/62ssUTGWi1HbuQoOP1gB2sMT056binQbrDAw9tPL2CsbuBK?=
 =?us-ascii?Q?OTrfmk5XNz/0vVyOS4W6YQdMGrBnlYkaKQGCTKB6BZ+Yf1lUV0Lm60mZODy3?=
 =?us-ascii?Q?xoOXzk+S1cn8pRHFWaIzROpqoQXJQaUaWEK7kseYCiI78A4C6w9OP+tBTuOd?=
 =?us-ascii?Q?tQMME3DKeEhXRoT/o5Uawegvcz9Ket+dRDgkNE6Cb+GReZkz5h7B+F+kK/Y1?=
 =?us-ascii?Q?hda+J7/vpaO8Cd87qKVC9xHTb1vkI9N4/xpgDLd9c8/Mgi7sgmYL8SRzIxtF?=
 =?us-ascii?Q?DVTFQhrkwCrzBbpE9CWwMLaMIBucY3ZQpEot0edpWcw/P2xLH4LtAhV1qIo7?=
 =?us-ascii?Q?tvg485VaN3CSYsPNXSPlVwB57oMWmulXnzDlyJgQVyI1MCGOQHwXYGcS+UK5?=
 =?us-ascii?Q?xIn0LfC1vTJXkHR8cMbFzkrgkrabnnM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e53b103f-f86d-4cb3-69c4-08df4a4ee9a5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:09.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwBOGuAdSHKy4bt4qrZfgUVBB8So7Xw9GA/EjRzYtLQ5D5Yw860JXs1Ih0BICHe/k49scHlNEieUBpHoFO6U0ARogp2fWiAEQ8IUeZSzZsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251052

Jaipaul Cheernam (11):
  fastfloat: upgrade 8.3.2 -> 8.4.0
  libconfig: upgrade 1.8.2 -> 1.8.3
  gtk4: upgrade 4.24.1 -> 4.24.2
  btrfs-tools: upgrade 7.1 -> 7.3
  zstd: upgrade 1.5.7 -> 1.6.0
  ovmf: upgrade edk2-stable202605 -> edk2-stable202611
  devtool: fix misleading error when srcrev is on no branch
  blueprint-compiler: upgrade 0.20.4 -> 0.22.2
  man-db: Upgrade 2.13.1 -> 2.13.3
  rxvt-unicode: upgrade 9.31 -> 9.32
  nfs-utils: upgrade 3.1.1 -> 3.2.1

 .../0004-Use-nogroup-for-nobody-group.patch   |   2 +-
 .../0005-find-OE-provided-Kerberos.patch      |   2 +-
 ...{nfs-utils_3.1.1.bb =3D> nfs-utils_3.2.1.bb} |   7 +-
 ...ovmf-update-path-to-native-BaseTools.patch |   2 +-
 ...ile-adjust-to-build-in-under-bitbake.patch |   2 +-
 .../ovmf/ovmf/0003-debug-prefix-map.patch     |  14 +-
 .../ovmf/ovmf/0004-reproducible.patch         |  10 +-
 ...sicLib-fix-memcpy-alias-prototype-fo.patch |  35 ---
 .../ovmf/ovmf/CVE-2026-111497_p1.patch        | 239 ------------------
 .../ovmf/ovmf/CVE-2026-111497_p2.patch        | 239 ------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |   7 +-
 ...y-to-specify-where-python-modules-ar.patch |   6 +-
 ...{btrfs-tools_7.1.bb =3D> btrfs-tools_7.3.bb} |   2 +-
 ...{fastfloat_8.3.2.bb =3D> fastfloat_8.4.0.bb} |   2 +-
 ...{libconfig_1.8.2.bb =3D> libconfig_1.8.3.bb} |   2 +-
 .../{man-db_2.13.1.bb =3D> man-db_2.13.3.bb}    |   8 +-
 ...std-max-level-when-memory-is-insuffi.patch |   4 +-
 .../zstd/{zstd_1.5.7.bb =3D> zstd_1.6.0.bb}     |   2 +-
 ...0.20.4.bb =3D> blueprint-compiler_0.22.2.bb} |   9 +-
 .../gtk+/{gtk4_4.24.1.bb =3D> gtk4_4.24.2.bb}   |   2 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    |   5 +-
 .../rxvt-unicode/rxvt-unicode/xwc.patch       |  19 +-
 ...t-unicode_9.31.bb =3D> rxvt-unicode_9.32.bb} |   2 +-
 scripts/lib/devtool/upgrade.py                |   3 +
 24 files changed, 63 insertions(+), 562 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_3.1.1.bb =3D> nfs-ut=
ils_3.2.1.bb} (95%)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib=
-fix-memcpy-alias-prototype-fo.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_7.1.bb =3D> btrfs-to=
ols_7.3.bb} (98%)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.2.bb =3D> fastfloat_=
8.4.0.bb} (90%)
 rename meta/recipes-extended/libconfig/{libconfig_1.8.2.bb =3D> libconfig_=
1.8.3.bb} (95%)
 rename meta/recipes-extended/man-db/{man-db_2.13.1.bb =3D> man-db_2.13.3.b=
b} (89%)
 rename meta/recipes-extended/zstd/{zstd_1.5.7.bb =3D> zstd_1.6.0.bb} (98%)
 rename meta/recipes-gnome/blueprint-compiler/{blueprint-compiler_0.20.4.bb=
 =3D> blueprint-compiler_0.22.2.bb} (75%)
 rename meta/recipes-gnome/gtk+/{gtk4_4.24.1.bb =3D> gtk4_4.24.2.bb} (98%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.31.bb =3D> rxvt-unic=
ode_9.32.bb} (71%)

