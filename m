Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39750.1793010720897209480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ge5oko2r;
 spf=pass (domain: est.tech, ip: 52.101.65.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqSswaDwtONTX7K0APjgnakz5CJ6tOLn6sBh5pQWfIWtCWE/noNKz3hgiumDjeE2rtzR2yRs08dABafmYffs/BImT2LmU4blDPOXwNBD+OU+ybTPGu/UvsNTOr9s8h1okOkPN9HOUd4b6cT/h17UsGc0hwOE64E+ZVRIv2xYeJKYFvbRwdCw+tS5Vm6OWxBKRgCv6tEBqOY2jAkhFqtN6ROidlBYjtZ/XLBagMl8JobehbGyF3oFrIkAwEBHYBz9SZ5GXIZuA6hcBs1dZiROb0OUfFKjVDO7kdvMbdNOFT0trnNzPWocbBj21c83qHjqE8VoKZzRs3jQnphCbfZRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6RJP0N+RpnRGs/CYbVYvgEjhLF3t7KIPNXYYPWu5iM=;
 b=x7grxatqucstXKwB7D6ZisxDATzjQ84pdjvDNEYWrwZlcT1jUUyAWguiXKmQ54qwcZ2r7+xfOAXAgny1fk6vN4pmvEBBdPs3eJBA40sixhjLG3e7vQ0jkqoRr8iiqulNrP5LZR58mdBUKuN6dSzkhcUkKKu7xucC5K+WiYmqEJmdd1VOcBDdW7JLFGgbEo2Y2OwOl5vFlVhxA4/dDudDI2wrnKTjvW/torFtCjdzEz1zXwgD+jaxBRXeWa84VfsX7vmJqXLL0oUJR3Ma78/K162gh2jZnyRy5pqK2/5DYIuvdRSwB8MobY4/A24fGUgJIwNFp/AB4MRrufB1gAAWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6RJP0N+RpnRGs/CYbVYvgEjhLF3t7KIPNXYYPWu5iM=;
 b=ge5oko2rwzpShp6geMKvKvHCJajzJJo2aYzRRTdlEMj/5P4JAvKnGk6fm8rr56fsY0zoKL9n+cQ9ooqWmBqImx12Aknc3+AGBnu1XmKGN2/aCf/tZ4wn5Yp8df82vkadgv03QF4pMga58fkj4qRcQflcGlFDUeJCQQKlUPW9SDa4JI5EKSE92RycP8TqP4gJlmpyaToPprSFSkNXYJ0UNd0Ri9V4IO91IlUOabk15ZpaX1dF0IwnXk4BT6gIG8Pasn9ZMRBhr5IZSMDR5xnGNB6sX0AmEgC62vTWTkApX+EkqJ7vIw+Oeocul+VMzIYediIO1NgpuZFy1szvmczo0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:58 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] python3-pycryptodome: upgrade 3.24.1 -> 4.2.0
Date: Mon, 26 Oct 2026 11:31:37 +0100
Message-ID: <20261026103138.3137-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c4966a-bbd3-438d-4066-08df334c5d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: XxI1jupdxw2xiTnUDx99XfY9crk73gfU2wogXwGDuGv7tlvsU0lYsqB49sBr60U5rPh1JB5wK0qFnkwmcSi4OOys212SBUyfDC1k5f2JJXV4cSFUPdFqrxLfTgAr7Druh4/RmF8I9SAho9mMXauBoJYgvt1ubXKDWSQ5bDhNKTONFda5s5R/mHP5vIfZrUDrHdCiIXrDuSw0zqxSvvW3dLCtmsgJE1n5YjQpZaYLoRcOoYRlFnHaQ+irNB8N2jZlOE53E/ipI1VOAhVd/0smbpryQvkxC5EYBBTbh0GGrB4VaVULPmxqdN/DkVxZjUewyWIAw2eb9eNGG1rNI0/K+QCjMoWhDm2F+GuHyOPQcOSvmc2Cwqu+QwyMJ6xMd9A55xNNLsD/18N8d7uxznDAx4hRrDZ/2vcdOS4g6KXS9cPtrq9bcEclddXg6VwrLms/wZGBryRXmLXm+l6XuzJXEawa5I86hOvbjjNTwQogo7V1VnmGEnWYxCKmxPQI7We0utElP5/XcdicqSTg7AY0lHnHcHGDIZIveyc4Jrqi/e3JuIT5dJ3iwC6WHKYBs80vmD5jNWG/p+/7j7LV5dajEeduw/ebGmgpzaVCgUQsCT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhTKr4LnLfYXgdZ7vND6uMeaTQatbwrlUJ6srh9ijdOrP5PaI6Shdu979KDX?=
 =?us-ascii?Q?wQq9M5y2f/cO6dU1CqjnYvwL/btmPKtgdTU0BsfpHd2Z2pIQrZKXpm7XyQkw?=
 =?us-ascii?Q?78VjBT5UzdD5yBvM3N9cIILXLc9vEkE6ih3rR4vOlXmd32uxd9q3VP2kFc5Z?=
 =?us-ascii?Q?PWdzzbZEBzaRpSiCdr7TS9GA1AT7gPMRtgpaw/ictk36ovIZAEwjPv9vQF+O?=
 =?us-ascii?Q?M53sk7OzJ3Bnu6IKJlSz7bQ/q+DNTffd8btxjDdtm6OFcsOQohMzPV7v0f2B?=
 =?us-ascii?Q?J74Vv8z0xymWdku1NNhJPQcQL+cSX+JKuHCq3/uOjHQ3aP7niDJpJCQ9Z903?=
 =?us-ascii?Q?Pzj+9mtFfnSSOTxNbtq30TWYBriuL+fJGbDL1PAH28uLPceZCoR/lqe/rTSQ?=
 =?us-ascii?Q?xAqvyNBXFe9ROiD++0Cd1F+QuWdSpjX0p3uwv4Me4YKH2ngQflpMgroFzyIS?=
 =?us-ascii?Q?/C8OHjngeV9SCB5TuBhgNfO+OEc1Miov/+X+NGlBk46XB9l3z88T5nQ8W9Tm?=
 =?us-ascii?Q?AhKc7Nazc/lZD6pUA6zRXtVAtsEOt/kup87chjcRoLW9NFbQmyNhrlCzmYAe?=
 =?us-ascii?Q?/l8N5B366K5Sq0DS8QkH8dlEWr7JZNKT+G921+j3ZewlTRbSK+sxaoCHJUw3?=
 =?us-ascii?Q?D0F2Vbos4YNhmonWNpjrd+87G4hWf/26v/2myFO4uU0x3nfrR1nQvJuU+1kC?=
 =?us-ascii?Q?QQE28Vhy4lD9ueFTdm1ZcWMHvRFlnqTOA6uRRg0cAwVSjeGk45krh2V4PYO+?=
 =?us-ascii?Q?G+JH1XzzMYY9qHaFidGpaO+kaBJpuQEfcXlfmS6Bsd47ri0Pt0LEjKaCY4kD?=
 =?us-ascii?Q?1IoyWGvJDvznwYYqbWGmxxV/HwH4YwZ7f1vB4mNMwF14psYf5kMZmQNUTKvB?=
 =?us-ascii?Q?fY8Nzn520i06FNkv451L9Pn4HoYePQgaAJ8IOJ/EwY9vyAZkEpo41A7/lxtl?=
 =?us-ascii?Q?A7Xj4q46BEFyPhD+Lz1Cwd29wJwJS2h10EoOUfncfwuspj6BHf2jelHdez03?=
 =?us-ascii?Q?vegS4ayA1+mpq36rhstflfmdiZ0NhCeJm41Ju9KTlhAkOlbULKpF8MKyx7A9?=
 =?us-ascii?Q?96AGMMGH1IFla+u6gEq7M5x1oKtUtO3no9Ms/7jskR07mnKtn3NeRQdpN6Ng?=
 =?us-ascii?Q?ja3CBAAFHxBCDIx/sKaFf2GZfgUxK+XjMRb9ofYY0dsNuAg5Vid8mmxw7PEv?=
 =?us-ascii?Q?fSszSqGDOyxGaCEHvDhkTyJgSRFve36laNQCSrqENCOFUDASTuORMEwGHPWm?=
 =?us-ascii?Q?v3jP39Dpqq2cfFzi+O6hLnTGyWaBWPLkOV+6Gi0bW+p0IScjhZogpZvpsCmz?=
 =?us-ascii?Q?HRhPHCysyVn9oqy3qWCx/PFzeX1ppCGoVgSGdHPxzxwAG8AWr4JIXYChRRdd?=
 =?us-ascii?Q?MY4r/y3gtnI6J/x79q2vrhez4DvYCIOs0Ctvjw9dRMILUtLTPqG4px4/I53e?=
 =?us-ascii?Q?Kg39/PD915zhi7jfpUr7CVoNzA8NeC7Mjo6rcmxiqkCaDSNETVwikErU/G+S?=
 =?us-ascii?Q?gOdQ1ZGq3wolPSD4Ei0+3GFWJWhZuc1NkMNwJLEPr9MTgcxSvipiCq58n7XF?=
 =?us-ascii?Q?sgJiZ84uoU74dRI3EM/sQzglorMCI338+YD86P7hrokN1JnrQtCGRW0skoFK?=
 =?us-ascii?Q?ZataNg6M3IvocR8ZB9AzVn08N6wH71rnKfRD78YblHOcQd6kvrsJJh9N3FwP?=
 =?us-ascii?Q?dzrTzUxI2Q+tG8grJLWcdWUbi8FdMEEEGmHbVfptjzOFp9bVATk9Hgnz8u8X?=
 =?us-ascii?Q?CLWsHEdtHw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c4966a-bbd3-438d-4066-08df334c5d18
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:58.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSbTlwiGKtRlKbyMAm8dzY+5Ieh6sfcX6GyqifBq1CxVvU3l0LENil/nUs3FyRt4GbjqxLbDNYGsKEJKg0E8DCn++O2g5XI1Xyj2YDwGgDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248670
Content-Type: text/plain; charset="utf-8"

From: Upgrade Helper <auh@yoctoproject.org>

ChangeLog: https://www.pycryptodome.org/src/changelog#october-2026
           https://github.com/Legrandin/pycryptodome/blob/v4.2.0/Changelog.=
rst#420-24-october-2026

License-Update: Update to license text [1], [2] and [3]

[1] https://github.com/Legrandin/pycryptodome/commit/65aa57f08db0afb1a3d388=
7164a0027654b55931
[2] https://github.com/Legrandin/pycryptodome/commit/43b28d7170ccebfc51c914=
8e723aa881fb32a1dc
[3] https://github.com/Legrandin/pycryptodome/commit/04a1ad1d286eb843ac62ab=
fc05ed58df99eaf27b

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/python/python-pycryptodome.inc            | 2 +-
 ...on3-pycryptodome_3.24.1.bb =3D> python3-pycryptodome_4.2.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.24.1.bb =3D> p=
ython3-pycryptodome_4.2.0.bb} (56%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/re=
cipes-devtools/python/python-pycryptodome.inc
index a0181874cd2..8f2b9025ddb 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "PyCryptodome is a self-contained Python pa=
ckage of low-level\
  cryptographic primitives."
 HOMEPAGE =3D "http://www.pycryptodome.org"
 LICENSE =3D "BSD-2-Clause AND Unlicense"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D29242a70410a4eeff488a28164e=
7ab93"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Da514b4a7ad24677ae50f3becb03=
404e3"
=20
 inherit pypi
=20
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb b/=
meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
index 0aa53559d67..13c572b7c89 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
@@ -1,6 +1,6 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed1=
7b7fd7dca32bb3"
+SRC_URI[sha256sum] =3D "21d7fdba239d6ef863d3d08388801c683453a3bb4897c2b27f=
27847aad89bdf7"
=20
 CVE_PRODUCT =3D "pycryptodome:pycryptodome"
