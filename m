Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4947.1792755001978535880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oCgOjJcn;
 spf=pass (domain: est.tech, ip: 40.107.162.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSLN9qCs299kVwDYEZMtH6ouJuvdM76ypzv7ywUkOc/FPujc/2DG/wSS7NjXIw9jooe4zq/1J7HvMVWd3dV9jXe1vE6hugbLZN2DgMk1SnRtptWBZQngrJxK12Avvqb3VXTO0jqfhO4P4H0tVIhxflPQVxbCloXPq1gkbS4k67XnwHfsyCDGAe/4CPrhJ4qCQ80LwZOux8ZflRKUurhWC83UX/NfHsSB6M98WPBYhsN2jBPRy11vj7HDZ9mLsWENj36NN9O4CWzv/OYI4NCfSZ6xEVid0MMzW0DOK6XdcVy3gp+lTowCZMW086cYztSoyaa0/RuTSAJ5NlqnG7vncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd1iwoOPzJUl3ObeZo94Z+R2Jg4db/93SDraoFlzqGs=;
 b=KRWQoYRXVWTeOsK5TqxSRsAD/fXbjuleRVd1V2l6nqj06QQYmQsDL/lB5ztZNl6b7KqM89/GPFZjsVEPMCPUIKAxoEBOC3vWq7A0cf9J+ACjv3NYaiS4huqgmMy6fUP8mbOVZoFStqjY0ljO+S6CehLZylNdfW5hFrJnDSBRYnR9Jeis5f8irOcgh+S2S5JF2CA0uese5HyjGPq02QTJ3+vqSfod/0cAna3cQenaf0kcxzyBoMJEcgsE7bHXEjF7RFjXdc35bBSoBfMnVJUs2/1txNCQvlKLZqYiRqwt6Qq+ejB4IVzx5gWv+squUDThI89op1+V168QtZZNgwMRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd1iwoOPzJUl3ObeZo94Z+R2Jg4db/93SDraoFlzqGs=;
 b=oCgOjJcn+XCkqFJsqq7hDtj65f8DZXbJO+W8PHe0SUFBWTO9gbuZgO/rEcQb8t6CNOh6JhCSy8qoI4okdT+vfOQf32MPGzK5HKwnAQdN+aNiXbSHbZ0kaNWh6g3B3SosSB2MY7oRys9+ptO0Z5ENOq7vGgvmSRJ0YhVb5GOl2hGDIz2Yt6UZWQ/g51byjeaYrgsdvRFF/+csBBYA5TNot3WIVLIjE6lmO5ZTHpqy29hmJ9wJAuu/0vM1eieo7mzZst1Paye9ifDQwIOErJ36q1vW1esUy1+PfBbM4tsaGQRGNQyCgZ80DnTRqxqExStoraXu9NXf9FvWgZB6/CVRHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:30:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:30:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] icu: Upgrade 78.3 -> 79.1
Date: Fri, 23 Oct 2026 13:29:49 +0200
Message-ID: <20261023112949.77631-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c537442-23a6-4ed2-20ff-08df30f8f98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|6133799003|10067099003|22082099003|18002099003|3023799007|261022115727099003|261021135927099003|261021123027099003|261009223027099003|261009223327099003|11063799006|261009221227099003|261009221727099003|260925021311599003|260925022911599003|261022105027099003|261009220027099003|260925021911599003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: pWeXClOXoEaUiBixG3rnKoz5VHCh4Gcmrq4/1n0KX9rPDp+azBbTbYOQFT1YGQ322s2xbPd8IH4jFr7yuFhRLp33WGD/ZXpHYIo0crnDaOCVUr7+vFn4xBhBy0KxbCg2e6ZL9aQ5G9+7PKkTiCgrx65YjOt9S+xYjqgSBlBd5q0uDUbf9cXnYidvYXaMwFWMkW+9PBIEHJNsAAlpo1fVewQ1b/pOi/Qzp8gacCHPec0U9+vh4PwBq0o0iosO042SoZtfF49yEDmauJH+ZGTUJFqXpT08xvY1vD08d/G40bwIzfZuf+fqpJfQ8ejxzRbmxZLFmX57AYN5bh9+dnwZ4AKscOyYuAKoP5qN+bJxTwko+c0loJYhPz/2Nj9Yjq9V8MW+KXCtLqXh43IULwhUXOexwiRULLDl0TiCTB7xHjz1MCzqGxtJ2ejKbTiM+AEgB34J0Zd6aF6o/FpbdqLaZuUzRds9O3m3g7OA10+ho4C9/mUCzBZcdASNyrqsBRMN1WYIYmqEk4fbVRGyCAT7CqKpxe8KuVC1Orz/VGpbzp6fxNTD9qMd8uSKaWGav/SV+ScEoaYC5uLzcIUc/w+WSs+kYCA71bPpo4zB7Tjt8sjP8K+dApY4yt8QXNt4BQs78x1Z/QcIiOdse/vR4C7aE+iqxNvpkecxWT/kyPJgQ+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(261022115727099003)(261021135927099003)(261021123027099003)(261009223027099003)(261009223327099003)(11063799006)(261009221227099003)(261009221727099003)(260925021311599003)(260925022911599003)(261022105027099003)(261009220027099003)(260925021911599003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s3adKiiu9wm9dglvSJbRRY4vZS2uD8AUI/Qkse3n6H10SH+m5+8RkcapkNmu?=
 =?us-ascii?Q?BJR1isjKDbCaj6CVflyLS4s0i7FzcdRCGDqoFXDGXq1ufD/qr4xJAYulSenK?=
 =?us-ascii?Q?Blmhptljxfy+RQuHQCrJhObTPVj1/mPN6J6826J4Ed1Hgj1PCUscu804hk6u?=
 =?us-ascii?Q?dD4eE/Fx9tHYr/ke3YsL8Fk3XbMmtF4rnqtg0tPcrcHQhxVm55zhivzD2YN3?=
 =?us-ascii?Q?pdAJxa+vRFZpx4pkAvET4fcBXZ2trRe8a99zQeyD9cXMbt9SMM5SUntiXDtO?=
 =?us-ascii?Q?Z4ExyMl61HS9opFLaJVE0w2hfwh3K29KF2IOcGKPLsamycw6Ka42wE0gdKYQ?=
 =?us-ascii?Q?czq+cvdJYhLytsNiQRsVPZyPPrY2UHsiV+PceDnxYq0jFe9e0ljiQh2dmx3N?=
 =?us-ascii?Q?s5z6J4NV9d8SmkvPRmA/QKUzBIhyoeq1rq2hoVXkhcN/BNpXIvRAVdfVusxW?=
 =?us-ascii?Q?VLqWq2GIVfYGFiwxuPRNhYKnFb3vUKbHKJFhPS8XzIrsIlR0o+pyyRJBt08g?=
 =?us-ascii?Q?VZO6/r8pW79rHKF+H/UKgJtwK45J1fqrVi3eFeYKpylGxvFebtFLOAcFZ6Lz?=
 =?us-ascii?Q?AHyLbbahVh8uYNdoZ+k4CVo2kJj3OdFeaHTpSsKcl9oRB/w6E0JChgUAzkQq?=
 =?us-ascii?Q?f0lr4HZMO43DE1VyeTU2hOew3T71771McKlibdo1NDVD3n9v0fAd8fiCuc9o?=
 =?us-ascii?Q?x6dzN/Yre8fTZ9ZVpVouPSlZLezdkTfWbXOuVVn7JojhE/AIZgWNoq6vm+0E?=
 =?us-ascii?Q?1LanrMMyyzNatB15056yOg5wWpuBMhq4vLd1CYOQ1wWPPUtiJ2Pa7zkjBhWP?=
 =?us-ascii?Q?ePGKsRmHMUY5leoZHgGPeIwiwwWCcopo5AVucwU+yQtewm6jcoFv7capVVBQ?=
 =?us-ascii?Q?3sql/MTuNOgS8dbJ50kANUAmkZD9pfpyGpsB2O2Lids0gm/kXWuBg8OjBgFd?=
 =?us-ascii?Q?c2CtHIxIcx/M+1FvwZNluiIQLb4AKuJFin0XsM4sbYpjNwnlgveT3njUnyZm?=
 =?us-ascii?Q?mA3U+aWjO11qNUcxImoAcrbhTsHk8DMOt+ZcJg7XbgZeMHeexwgpsuUcFfqT?=
 =?us-ascii?Q?noqn9v4k5PM7Tf5i5ghrDsip8A+NpPGpctagad902swXbZjVjKTcTW+Z3Pma?=
 =?us-ascii?Q?5Ntg2I3T7+wz64SZ3dRT1nWRuQErXe0UR/Bm6iCukZ6h9mToAkIH+HqTaBJQ?=
 =?us-ascii?Q?CFYfK9Nun9J2YlCTx39z2SpAYMnIfbGFsikSfLJ6MmNCLLb/JhssnLJNpfTL?=
 =?us-ascii?Q?SLsZIrv1iLa+KYkDxQ85tWobpj7nq5I3PV4n+2hdcDl1j+QrWyb7EIZtsU3Z?=
 =?us-ascii?Q?Z0ZD9ySLa/nbu47jm5TS2Wij/vHoCUZpSa1Pobj8/BUgG7hQoyVTtNdqGGhK?=
 =?us-ascii?Q?3ANp/BuzTRwXUJDvm+rvrNr0f14E3onWndUXLzzR8uE7/HHabSVSNKb250VJ?=
 =?us-ascii?Q?aorIGVqc6UVbU39QErye9tvDaJHA6Cw3BfSFO6V75m5N1A11OlM/OSDPjQ3B?=
 =?us-ascii?Q?Ogbm6t4ezTmZ/azwvNx61pJrc8dnyedlkePEhwbD5HPh5EjghyiR0u52qvMf?=
 =?us-ascii?Q?3zYP6b2+eZdfa0g1x4cvWcN95vLIBGDOeW/YqZbJ0eda9oVUK87T0s8hvur9?=
 =?us-ascii?Q?Wjwa8R31zp9y4bvNnJZ5gQr5m/hFPkPd6b0UEu4aGZ/bcC2kPYLyRlwaouEJ?=
 =?us-ascii?Q?fGwwxvieZj7Zd9HeZRtyROrROLvQC8w32DDh/jCvA1wJtIGgVfKx188DQVLe?=
 =?us-ascii?Q?4ZwlrB62ag=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c537442-23a6-4ed2-20ff-08df30f8f98c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:30:00.7879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: benBAdmmPmUiTfGMIqWQ4r86nD2bPORzupP3oSfdkzMSImrI6AR1I+0xiEgkkLn+a80uQjIEafMK0xVwNwvKAJtFPeR7aJsiJeNl1a3RB94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248547

Release: https://github.com/unicode-org/icu/releases/tag/release-79.1

- Refresh existing patches
- 0001-test-Add-support-ptest.patch updated for 79.1
- Drop copying of testdata as it is part of source now [1]
- Increase ptest QEMU memory to 4G: new 79.1 overflow test
  ICU-23537 allocates a ~2G buffer, which OOM-kills the test on
  the default 1G guest [2]

- ptest results (qemux86-64)
  995 tests passed, 0 failed, 0 skipped.

License-Update: Copyright years updated.

[1] https://github.com/unicode-org/icu/commit/a9fdce608194b080e1b1372e2ddb5=
3d98822a7ca
[2] https://github.com/unicode-org/icu/commit/d37a22cb9921a76268e325fdca7d3=
e70a6851191
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch |  2 +-
 ...nicodeStringTest-TestLargeMemory-on-.patch |  7 ++--
 ...tput-compatible-with-Automake-format.patch | 11 +++---
 .../icu/0001-icu-Added-armeb-support.patch    |  2 +-
 .../icu/icu/0001-test-Add-support-ptest.patch | 35 ++++++-------------
 .../icu/icu/mangle-build-tmp.patch            |  7 ++--
 .../icu/{icu_78.3.bb =3D> icu_79.1.bb}          |  7 ++--
 8 files changed, 26 insertions(+), 46 deletions(-)
 rename meta/recipes-support/icu/{icu_78.3.bb =3D> icu_79.1.bb} (95%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index 22bb23c0e73..99891ff8e00 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -49,6 +49,7 @@ QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
 QB_MEM:virtclass-mcextend-go =3D "-m 4096"
 QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
 QB_MEM:virtclass-mcextend-zstd =3D "-m 4096"
+QB_MEM:virtclass-mcextend-icu =3D "-m 4096"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Lin=
ux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux=
.patch
index c0e9e2806b4..a17e4a95631 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patc=
h
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patc=
h
@@ -1,4 +1,4 @@
-From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
+From 4438ec38c596c273095e114ab683c297c04ac00e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
diff --git a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeString=
Test-TestLargeMemory-on-.patch b/meta/recipes-support/icu/icu/0001-ICU-2312=
0-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
index 0bf1910d187..602d3270302 100644
--- a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-Te=
stLargeMemory-on-.patch
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-Te=
stLargeMemory-on-.patch
@@ -1,4 +1,4 @@
-From 4b3e6888c2aaba6465f1bc96f61b17a2513050f3 Mon Sep 17 00:00:00 2001
+From 9d3534a96511fb760fd5c50ce53f37c53874029f Mon Sep 17 00:00:00 2001
 From: David Seifert <soap@gentoo.org>
 Date: Sat, 21 Jun 2025 12:28:15 +0200
 Subject: [PATCH] ICU-23120 Mask UnicodeStringTest::TestLargeMemory on 32-b=
it
@@ -11,7 +11,7 @@ Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
-index 56976b3e3d2..26225f5b5b5 100644
+index 3f382c5..6049332 100644
 --- a/test/intltest/ustrtest.cpp
 +++ b/test/intltest/ustrtest.cpp
 @@ -2375,7 +2375,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppen=
dToSelf() {
@@ -23,6 +23,3 @@ index 56976b3e3d2..26225f5b5b5 100644
      if(quick) { return; }
      IcuTestErrorCode status(*this, "TestLargeMemory");
      constexpr uint32_t len =3D 2147483643;
---=20
-2.43.0
-
diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compati=
ble-with-Automake-format.patch b/meta/recipes-support/icu/icu/0001-Make-ICU=
-test-output-compatible-with-Automake-format.patch
index ab88803b36a..af75261f7a7 100644
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-wit=
h-Automake-format.patch
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-wit=
h-Automake-format.patch
@@ -1,4 +1,4 @@
-From 4779f798463d673dd74623979ec93141eb60d07a Mon Sep 17 00:00:00 2001
+From b315f37fd8c588632bcf01c43a191ab56a08fbed Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 21 Nov 2025 10:47:59 +0800
 Subject: [PATCH] Make ICU test output compatible with Automake format
@@ -22,7 +22,7 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.co=
m>
  3 files changed, 34 insertions(+), 2 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index da4f170..514fa0c 100644
+index ec84aae..7e036e1 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1103,6 +1103,21 @@ If set, it will REPLACE any automatic list of libra=
ries.],
@@ -54,10 +54,10 @@ index da4f170..514fa0c 100644
 +
 +
 diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 33829b0..bf3ef56 100644
+index f09da7b..9909266 100644
 --- a/test/intltest/intltest.cpp
 +++ b/test/intltest/intltest.cpp
-@@ -824,11 +824,19 @@ UBool IntlTest::runTestLoop( char* testname, char* p=
ar, char *baseName )
+@@ -828,11 +828,19 @@ UBool IntlTest::runTestLoop( char* testname, char* p=
ar, char *baseName )
              saveBaseLoc[0]=3D0; /* reset path */
             =20
              if (lastErrorCount =3D=3D errorCount) {
@@ -100,6 +100,3 @@ index 7634526..c2e11dd 100644
            if(!ON_LINE) { /* had some output */
              int spaces =3D FLAG_INDENT-(depth-1);
              log_testinfo_i("} %*s[OK] ", spaces, "---");
---=20
-2.34.1
-
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patc=
h b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index a25285fb541..f222045cf81 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
+From 0b3d2340ca2a88aeaa41dd2363584ee42930c42b Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
diff --git a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch=
 b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
index d9fd8e3e43c..9947a74008f 100644
--- a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -1,18 +1,21 @@
-From 783d9e0d3d7824fbca53c2c3a80e8e5e23eacc82 Mon Sep 17 00:00:00 2001
+From c3ce4ce9b23ec8e6f0966bca8edef6cf937bdc7b Mon Sep 17 00:00:00 2001
 From: Daisuke Yamane <yamane07ynct@gmail.com>
 Date: Tue, 1 Jul 2025 18:35:25 +0900
 Subject: [PATCH] test: Add support ptest
=20
 Upstream-Status: Inappropriate [oe-core specific]
=20
+Note: Updated for 79.1 - dropped the intltest.cpp hunk since upstream
+removed that code, kept the four Makefile.in changes.
+
 Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
- test/cintltst/Makefile.in  | 2 +-
- test/intltest/Makefile.in  | 2 +-
- test/intltest/intltest.cpp | 2 +-
- test/iotest/Makefile.in    | 2 +-
- test/letest/Makefile.in    | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
+ test/cintltst/Makefile.in | 2 +-
+ test/intltest/Makefile.in | 2 +-
+ test/iotest/Makefile.in   | 2 +-
+ test/letest/Makefile.in   | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/test/cintltst/Makefile.in b/test/cintltst/Makefile.in
 index 552a105..9cf3071 100644
@@ -28,7 +31,7 @@ index 552a105..9cf3071 100644
  LIBS =3D $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFA=
ULT_LIBS) $(LIB_M)
 =20
 diff --git a/test/intltest/Makefile.in b/test/intltest/Makefile.in
-index 5d4a03b..ca4e4cd 100644
+index 2e44831..d5bd240 100644
 --- a/test/intltest/Makefile.in
 +++ b/test/intltest/Makefile.in
 @@ -39,7 +39,7 @@ CPPFLAGS +=3D -DUNISTR_FROM_CHAR_EXPLICIT=3D -DUNISTR_FR=
OM_STRING_EXPLICIT=3D
@@ -40,19 +43,6 @@ index 5d4a03b..ca4e4cd 100644
  endif
  LIBS =3D $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUUC) $(LIBICUTOOLUTIL) $(DEFA=
ULT_LIBS) $(LIB_M) $(LIB_THREAD)
 =20
-diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 3806d0f..33829b0 100644
---- a/test/intltest/intltest.cpp
-+++ b/test/intltest/intltest.cpp
-@@ -1707,7 +1707,7 @@ static bool fileExists(const char* fileName) {
-  * Returns the path to icu/testdata/
-  */
- const char *IntlTest::getSharedTestData(UErrorCode& err) {
--#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING ".." U_FILE_SEP_=
STRING
-+#define SOURCE_TARBALL_TOP U_TOPSRCDIR U_FILE_SEP_STRING
- #define REPO_TOP SOURCE_TARBALL_TOP ".." U_FILE_SEP_STRING
- #define FILE_NAME U_FILE_SEP_STRING "message2" U_FILE_SEP_STRING "valid-t=
ests.json"
-     const char *srcDataDir =3D nullptr;
 diff --git a/test/iotest/Makefile.in b/test/iotest/Makefile.in
 index 16c510f..9eeff4b 100644
 --- a/test/iotest/Makefile.in
@@ -79,6 +69,3 @@ index 156c86f..555a820 100644
  LIBS =3D $(LIBICULX) $(LIBICUUC) $(LIBICUI18N) $(LIBCTESTFW) $(LIBICUTOOL=
UTIL) $(DEFAULT_LIBS) $(LIB_M) $(ICULEHB_LIBS)
 =20
  COMMONOBJECTS =3D SimpleFontInstance.o
---=20
-2.43.0
-
diff --git a/meta/recipes-support/icu/icu/mangle-build-tmp.patch b/meta/rec=
ipes-support/icu/icu/mangle-build-tmp.patch
index cf24e53b886..a2bce61c72c 100644
--- a/meta/recipes-support/icu/icu/mangle-build-tmp.patch
+++ b/meta/recipes-support/icu/icu/mangle-build-tmp.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From a729216a3fbc4d9eda9cbacd8b8dc6670c797978 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
 Date: Sat, 28 Mar 2026 20:29:53 +0100
 Subject: [PATCH] test/udatatst: Mangle /build/tmp
@@ -8,12 +8,11 @@ Content-Transfer-Encoding: 8bit
 This string matches $TMPDIR (in a kas-container) which triggers the QA
 check buildpaths:
=20
-ERROR: icu-78.2-r0 do_package_qa: QA Issue: File /usr/src/debug/icu/78.2/t=
est/cintltst/udatatst.c in package icu-src contains reference to TMPDIR [bu=
ildpaths]=20
+ERROR: icu-78.2-r0 do_package_qa: QA Issue: File /usr/src/debug/icu/78.2/t=
est/cintltst/udatatst.c in package icu-src contains reference to TMPDIR [bu=
ildpaths]
=20
 Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
----
 Upstream-Status: Inappropriate [This QA check collision of Yocto specific]
-
+---
  test/cintltst/udatatst.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
diff --git a/meta/recipes-support/icu/icu_78.3.bb b/meta/recipes-support/ic=
u/icu_79.1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_78.3.bb
rename to meta/recipes-support/icu/icu_79.1.bb
index c057505e3cc..a920c7f2e12 100644
--- a/meta/recipes-support/icu/icu_78.3.bb
+++ b/meta/recipes-support/icu/icu_79.1.bb
@@ -92,7 +92,7 @@ FILES:libicuio =3D "${libdir}/libicuio.so.*"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3De531a388be7c1df9a0fb7b4010c9=
c1d7"
+LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3Db2329a1b467abf456a6eb531b500=
0855"
=20
 ICU_PV =3D "${PV}"
 ICU_FOLDER =3D "${PV}"
@@ -117,8 +117,8 @@ SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
 SRC_URI:append:class-target =3D "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] =3D "3a2e7a47604ba702f345878308e6fefeca612ee895cf4=
a5f222e7955fabfe0c0"
-SRC_URI[data.sha256sum] =3D "9d8b3899096aeb83e4e21ef8a40fec9e03b28db18c484=
52efac882ce25a91e27"
+SRC_URI[code.sha256sum] =3D "06fa63ecb521048f8082f12ad988f6b678d90cbd88aaf=
ce24cbc94902b191d99"
+SRC_URI[data.sha256sum] =3D "b3a430009bb5fab77b1a4b98fab85cc8f887e26d4e416=
6121724298ae14d7224"
=20
 UPSTREAM_CHECK_REGEX =3D "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI =3D "https://github.com/unicode-org/icu/releases"
@@ -167,7 +167,6 @@ do_install_ptest() {
     cp -r ${S}/test/testdata ${D}/${PTEST_PATH}/test
     cp -r ${S}/data/unidata ${D}/${PTEST_PATH}/data/
     cp -r ${S}/data/sprep ${D}/${PTEST_PATH}/data/
-    cp -r ${S}/../testdata ${D}/${PTEST_PATH}/
     cp -r ${B}/test/testdata/out ${D}/${PTEST_PATH}/test/testdata
=20
     install -d ${D}${PTEST_PATH}/test/tests
