Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nFb6huOH;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmA4fXk/VTXe1ub5DQIvH4qMliVv9u8fC8jz3fIRbCmbXExuvrUbj1qyangJNIVY0k3pi+Kl9jsrQUjRx2B/+cFZRoLxPYsjJJNaTFqQ5MTkmmSvBZ/3HJkzp99OueI5lZzl0z3osAMPBsLgYyct9h3mkiLgkyGELDdjuYBZijGcup/oozNXkMVLPCVHNesEgj6pk0yamPk6KrdorHfYoAlughQ3sfmZq4h7QtGYJeQs00f5DUM5pogyqM1QTG5lR2+nJ6/a1OVdE1+17RmAAc+Vld8PBtdV1/CW+Z7eNXFezizdp78Ey6XYTuJhqNKgZX76iRhFi87LXm4z3O71+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A50ruiUb95A1PL/GUBqHGwCM/Ix5he2AYkaFvlt7UjU=;
 b=Ow84gGLUx1pLS4IKyAYpQ1V4YQ2ecPOYJAngBPH74vgqyLJ+lvouV+Q2G9AgxBUd2Lc4hYzVDAygZUNyh9uIXZwVHrOiZlaGSou/eFFn6P9zvb89WjjXwcOKGdoKT/KeeGhbNDKMRIBP151ZW3e5/AYE+y76SnUYf7HvRuI+sT7KqvNVRoD9qRG1xXbUtqvzFTOWiP00OZ8DeWQeSI09t0en1YBci8h7rOgDl5boXVXx5CCl6aR/jWcOznOjg6uqEaSYWafWYpM1XVB3lJwtSzxrw4fo7FwSWuyBLTD4lJR/OgNK0vWKPuAhBJYSemmodO3ibM9rRJQNOoah74y6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A50ruiUb95A1PL/GUBqHGwCM/Ix5he2AYkaFvlt7UjU=;
 b=nFb6huOHCNgYyd755uapWo5UT84r9hdVlLq2VSR2EMTbJ/ZM28g3bdUz+4gBgvmz/OOZ0hWnUNltFX0bDKAnlDtMHnKC0e0mcQA+oFdzJaZM0K1rFuu0xvKvS5YEsXVL45Qpx0sSBk2lz+XgWPMzc407IXRW7fj+Zj3ZuwCpiOExxan4YI2LtrYy5TnCEmxUbtGkTp9MoJQ7icsxN3qh+VTzShSGm7Y5pk6XgUCakwA8nL9gtYe0lm18bUl0pbhHbFYTvH/la6wPqjiO9pa5hovk9nY84IE7t6xH7dTpApaKS2bIJa2IIw6bY1FhlfZLXvaC2uTtqbDurnN2RkfhLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:09 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] apr-util: upgrade 1.6.5 -> 1.6.6
Date: Tue,  3 Nov 2026 10:27:52 +0100
Message-ID: <20261103092800.39286-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 6446cb5f-c3da-4d74-563e-08df398cc571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|261022075727099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: lTIMG2onUqE3FLfW4atHBccXefgDLjfKAyndCnHcuviLuk3ACm1Vx41BbEglVslvzdSvvdoFnfXS9YzUw/rlNyiOLSR3tFxPgS51UTNXhpQYEWUHmtfx5ywEZf+KA4DmyFEPibPY9iFuyGoS6QhLYVhLrnTyOLJnZ4dNArMMTD7pjHF4bTEJJ4ZgeScfqMSYuxuKfn5M+Ss2uytWhH8NgqvHyIVjrDl7ZFN4xzyrFfkumhc7oLMVYY8M2Omer9fS+sUBGnoliOZMq/NJ78hDEFmDqKUzh11PzxQbUKMU4ZJ1dBjh5vjgT6GzafrGMS97NeG+B5dpYJmlhcPHSSxoIbdCp0Q2yE+mbgc4vGCkHZUAQ9D3S8tB5FGfQapxdff4QNDOzIV/3fUP3pQnWJh9ICZmw+KNfrDiouyBqWx7VlxjEsZ/LHDhIv7ZHGVbjpGRO912UHlyJu4ID8D5HZ882+BJorC1VgVALOEYRi1iR+u9tMKjZch8HNuRuQQ03MZTFCIOWBnKiX0zzt48pJA+LdaLukzw4zMSNy9bwp1qUdl5jmJcLgxyiz0ONHotkndnEiJd7XfudKQYWi6tGoe3GA5eq3ZZiQK2xRqz/wcsRREIyaPJ8Z43XG8JDPQgDmFG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(261022075727099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8xTvuCSfCmy1QPSxSb+oJG/Xb/N5VbidXfQ+qSerNinumXQ9oSMkMb9TMC1o?=
 =?us-ascii?Q?ZSAn1VaB0dsQx6qie/kT1ACScSiehcls6U0keMtIM3SgKt8xf6RBa5YbGQoh?=
 =?us-ascii?Q?zfgS2Mj+iuuY8CUK7vHcTyuRziHLOvEddhFZ2la9huBlaN6VqjsCyRekgghN?=
 =?us-ascii?Q?hCC5hDe3YRPf3lb6kEKRalUjBmxVfwLLc3A4++YYkU97N8TOvyqDwieWfOtT?=
 =?us-ascii?Q?Aqv0Yn226gAewB4CpauAIczgMowE2+bZEvCpnvq1C52IPn8u0nhpMiMkywmN?=
 =?us-ascii?Q?mMEcv2Dll/HuXqhm/uyBvOIqmP6XDMHOv+dJz9wH/HjowtyvAcAI8gIiYObr?=
 =?us-ascii?Q?CXTUto0tPhxkx3qCb1bGmB4uM2B3UATgtCQXvzHyGWecSl4mxPJKiTGnMmjJ?=
 =?us-ascii?Q?KuHFVEH9OprgbxinL8nl+DR7ESkbUswKpfXCpMmoNUfS1Ayp004ONxOsnV5X?=
 =?us-ascii?Q?wTutQzmODxjleDEZI4o55eJ1rGeHr14JZ56czd+Ua8Z4rOV/MfPhbnfEb8AG?=
 =?us-ascii?Q?Sj8zg2B2OuiVv5dwxg6ObQZq0LVNFIW+8/G3Ur8fPndU1GgSXYrn+ali373W?=
 =?us-ascii?Q?whuHU09uXpkchAWYRVZo0m6UAqAH2RlvoRvcpINmNG39z/SkVKlYOZIyCOPy?=
 =?us-ascii?Q?VEWRvClKVuG4evISPJ6eqFwdYmoyXOJTdZDaHjk2XY9kKrXx87hfNqP3MYQC?=
 =?us-ascii?Q?CjM/70gTuI49obCg/CvJZVOW9OTcWQ5lf7zjzK9N9xxuGhDvYTyqy6oSJ9N3?=
 =?us-ascii?Q?rp2WlfIVQpgp8CZesHK+I0VDK8qKrulQ+5grChmhuWWz2R13NVak319LIaly?=
 =?us-ascii?Q?1fskgKP4jFvZGtvtZZlGcMbmvoX3EssT5ACR+anQUw5GhrUfj38RVzQx2BYt?=
 =?us-ascii?Q?hYes2bIMyua3A/9aDR4lhIN+jVBLKGN1QezKj77k5lz1wpMZqtkSKvNhs9Iy?=
 =?us-ascii?Q?xCrndh6Xou1k1YEeyLlogvumdnJvuXLOS+G64fgpSA9+3yMn/hH4q7kkId2k?=
 =?us-ascii?Q?ksJblpwYolS2Q4005/2Pjz/wzUrqTBH/Y8cZ/EeeyZT3VSdkEL14SVJeCfpN?=
 =?us-ascii?Q?t5qTRJThE6hBTxBv71lH2wXxi7anpCOwzaRXAVUVnp6TIwLFXQ96r0uTXUbf?=
 =?us-ascii?Q?fs2D6l+z7VfP+ff6Xdfgvn0MF1LRqq8ILLNMeonG2KYNqLCCkXIPz1JIcvJN?=
 =?us-ascii?Q?6KADos5hx9NbOpo1JcaDaosyBRDAlCS64Dbkbu17+as2iyS0o7p/uZu4/1ql?=
 =?us-ascii?Q?qiq1OvZWO3MsoNQv5gq4n5tNlBaU2So0g6i1BnT0x/lzpVrwOO1H1aBZMYDq?=
 =?us-ascii?Q?Fzvv34Lu59WZ2VkR8tsbIODMhzikvO2xTKaz9EXMERwS7se7dFLlrYHAhsJE?=
 =?us-ascii?Q?XeTHJetI4ECE7gp9l2SWlA85W8sHoYxiMpk2qMvYQNKwb7Db4m/YUxY1ir9C?=
 =?us-ascii?Q?G5tBMCkvxK5omnOWwV0LhthHYXzycDfs8xme6ah1Z1aKmw4rGQhaGCpQJRKp?=
 =?us-ascii?Q?nY6kQdEi1NGn6fD1up8zyQ0A2WPA92T0LWOl1e8NJTjz36puBTHAPOOWLbwt?=
 =?us-ascii?Q?mzkJGwkLDredWm60Chq8ahzNNvu9MqmrUp9ljCfhJpGII0pMpj7XZlAXXZtf?=
 =?us-ascii?Q?cr0dNL7eXh4dosIoIU6y9HIMpoT1TZJKdNE16kVh7fU6EwtkFIt0sDBKklnb?=
 =?us-ascii?Q?PxVA+7nmGVcafyZpug+x4ViStleewnEE9N2Lw2vbsJKmGoR5d2XYhc7iiWud?=
 =?us-ascii?Q?4YzsqQQ7ig=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6446cb5f-c3da-4d74-563e-08df398cc571
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:08.2595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ybWX+1A+N3KcamIVt9hrLbGXkBJ1Se0dxUd3dMr8VWwaAGMNWEP/GTD2vpsJc+FqsadSvzjVS1miQ3bUoZsmNJntkk/g984Bqx/I2kaE7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249256
Content-Type: text/plain; charset="utf-8"

Changes with APR-util 1.6.6
  *) Fix crypto/apr_passwd.c compilation errors on older systems. PR 70283.

  *) Fix crashes in apr_crypto_get_block_key_types() with default cmake bui=
lds
  on
     Windows. PR 70260.

- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-support/apr/apr-util/configfix.patch | 16 ++++++++++++----
 .../apr/{apr-util_1.6.5.bb =3D> apr-util_1.6.6.bb} |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.6.5.bb =3D> apr-util_1.6.6.bb}=
 (97%)

diff --git a/meta/recipes-support/apr/apr-util/configfix.patch b/meta/recip=
es-support/apr/apr-util/configfix.patch
index 4cc0ad79ae..5322e73d29 100644
--- a/meta/recipes-support/apr/apr-util/configfix.patch
+++ b/meta/recipes-support/apr/apr-util/configfix.patch
@@ -1,9 +1,17 @@
+From f05a53c7e957b215743359ff787eff3040f51e89 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <rpurdie@linux.intel.com>
+Date: Mon, 12 Jan 2009 17:34:52 +0000
+Subject: [PATCH] apr/apr-util: Fix some other config path gremlins breakin=
g
+
 Upstream-Status: Inappropriate [configuration]
+---
+ apu-config.in | 27 +--------------------------
+ 1 file changed, 1 insertion(+), 26 deletions(-)
=20
-Index: apr-util-1.3.4/apu-config.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- apr-util-1.3.4.orig/apu-config.in	2009-01-12 17:08:06.000000000 +0000
-+++ apr-util-1.3.4/apu-config.in	2009-01-12 17:09:00.000000000 +0000
+diff --git a/apu-config.in b/apu-config.in
+index 82109e5..12d9fca 100644
+--- a/apu-config.in
++++ b/apu-config.in
 @@ -139,14 +139,7 @@ while test $# -gt 0; do
      exit 0
      ;;
diff --git a/meta/recipes-support/apr/apr-util_1.6.5.bb b/meta/recipes-supp=
ort/apr/apr-util_1.6.6.bb
similarity index 97%
rename from meta/recipes-support/apr/apr-util_1.6.5.bb
rename to meta/recipes-support/apr/apr-util_1.6.6.bb
index ba1e3359ff..ebefffcd0d 100644
--- a/meta/recipes-support/apr/apr-util_1.6.5.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.6.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
=20
-SRC_URI[sha256sum] =3D "f43a1c8c79eef497a022ec6c99dddbdf57e42001da6ccbfae2=
59631ed5aa2805"
+SRC_URI[sha256sum] =3D "acd5f38440eda830e40c4fe35c2a6b8119493cfdba9c9d73d9=
85c317beb4e4f8"
=20
 EXTRA_OECONF =3D "--with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
