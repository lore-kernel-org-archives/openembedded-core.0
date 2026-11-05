Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33253.1793881491094167127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 04:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EwZ0ypvt;
 spf=pass (domain: est.tech, ip: 52.101.83.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDMvOaBmDUcGgLilxMGjZYTdH8iob+el4cNwC4PyRfoKf+/3Iso4lJ1OQP9Yaal4GPnTa/OPWeQy9gC+QAFqj+SdaN3rNN/qh3odjypha6iZX8L6812bOSrSPSeE2pR7HDhkbgSaTT6VkHmhLjtswcvKme1aBXzpLbyzIxu68kcQLXWYeY/5honqXYeceZaSkxU6oXmkKg2es/+Qi6TPca6YOmyeWiaRBOBDf9sr3jXS8CvpUgZeubgF3mkWz2drcitt8yk/CwJIMwlVHKO2tMM8i9Zvx3e0Txmgj6bEb6/iW52x3tN4oyarOezn8Er8ySuAOVJhlZYk2hxwpeX9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXKFiv955Z/rEqiDRC3ie5Q0GH/Rp8PRKh5Ug0GN9QM=;
 b=yKulVDe0q+M2rC14A6/+n1Zhs5csrTEPiKBhXwYa6A0QxQBq6b/Ti7ELMhfX5vGPb7YFZfoT6i42cR2msNKeiMH/cqTjYvlc29rCeH9de2pZ2/UoSGKYpZgb9JEgJ2QPIQCKSfKpH4AWkLoJ7QrgKVygzuXgO3CNHyYaoAMTm2k55myiGPR2xvxUHOJlENRytvXnPAZ2o4z9uMrPmvR84NSE1mnuPAHEsAzMuwE9QYdRer/tNuzqmYgqM5wgXEW8J5l82/nX5OfKX6PnZJ16V1Fb0P11mU+TLVX/8gaO3H1dMXGSYW4arhcTlsBzD0GK4tH55KWYmiyNX2hft1ePHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXKFiv955Z/rEqiDRC3ie5Q0GH/Rp8PRKh5Ug0GN9QM=;
 b=EwZ0ypvt16iOeHpTtT5foYndRQub1Jj2VdHECkni98um4cHqs+Idy3ACezdybIrmOOj97hvc9NUnstxesyRyoi0hn+nLCLqnPne6JecdPsW/YZEVsEMBjseRNqln/G2XGcBhYXYH4qVsp4mkKFX23sRv5GsLA8mUVr4YOwNSR2dqi44zIG1lL8XiliJriKu6X9UI5viJEOI99ypAEwR3ByUrEvjwfs/5DGjto5YtnDkvCTyP8YQNWh/yZpsHLiH7Co094iPqdQ1TO76+3Esr59D2EMbVgMBZrsl8SWoDZUiGyjzBVV8NoYZJu20l/i8yz08cBCEQnTYmZA9+pIyZoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB2662.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:461::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:24:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:24:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 0/4] python3: Upgrade 3.14.10 -> 3.15.2
Date: Thu,  5 Nov 2026 13:24:39 +0100
Message-ID: <20261105122443.53245-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB2662:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e18539d-bb78-4832-d5a9-08df3b37c68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|11063799006|56012099006|261009223027099003|261022105027099003|261021123027099003|261009223327099003|261009221727099003|261021121427099003|261009221227099003|261009220027099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: tjfiM+xNcNC9ZqI6adflkK44x1XLC4EpPhvqyWnc3zi44vkxDOYeuiyooTUJH9FCjm4oSeeLs+Eug6Ld/n7ArJsVk3/CVFrwQVouRYWqHKWW3hwNIlfAqqv8ymUwvnqu6qZFK9vQGQHwcd1JUMeGd7hyPQ26KGG/cWddvy2hC6nB1FtUMKOOxZuJsLV3/yE2x/2Fd7V1CR46obOcapS6Vht+c1UjTuo5KSP/254LP9EltWl5jd81uglzJVhjwC56cuuwpFkBkksoNrJpcDs+qxJm8D0yJXdztFKdyFyZ3YX5kyR05pH7NjX9aIhRSi98tkvef0sk53JB7TM3GHstazwNDP2BTRccs5piq6l7Z9rV8BN3GgsYx8m61py0+B9tMFHVH1jrXvnX7lrW42oFz+/9yhEtIfdfukbPAAf8Dwb3NhC7VZDmu3IggaFROJ/1gi7ajZ20gJMgT4C1y7bTiksafcW35R8gm36eebOQX56djb+g77rabzvE0+oo4KBZp1ft/aFPJdvVLePYJ9qwlnrQwS2+OIOwEwc3BUUvPQCPteWS/mBoH3NWIW+dlsI8IhaXrjk7vLLcgqbIGnCAkDVinBZQ129V6uyzd+Kr/uWN6MyHtjyda2ykrxadoeMjS70F6RZa3+m0fY6JtbMLBGm8oqv5PupF68hY8O/YbJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261009223327099003)(261009221727099003)(261021121427099003)(261009221227099003)(261009220027099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ner1KdRhYoPmnArQ2NuZ4B2N8QqUJAS2Ydl5KqgAdPBjhB00IjnbD2gBj/yg?=
 =?us-ascii?Q?kVvH8CvasbxSHoaUHJwl+RLCFvaxpxlN5/qW8uXSc0EN5gV1ICeRYsE4zWQz?=
 =?us-ascii?Q?I07K3EwwbA6MbkridVs2Sz8k3CBEg5lAoPOSXtjkjTBM571Mz3Hp+HX0vFqF?=
 =?us-ascii?Q?aELVGQMv2eHpBhxZv22XiPwENcEsvIwaAn4oSbloWCozInShw+z3k3Ruz1Ee?=
 =?us-ascii?Q?rTj1ueMKMlgONLvKpNH/XByXmobtUC90YNBMZxguASDdZiEUL7quy/K233RX?=
 =?us-ascii?Q?R8Pte8g8RmyfFNCWwoTWzEX1upgFPk4FfCsFL+9r8kWbFDbDVO33cgjeQCdh?=
 =?us-ascii?Q?YsZ2bRaHwObd81VizRcy7mn92Hb9Y0y/Vl94SRhToe3iJadOdKA4a0Sd5UgJ?=
 =?us-ascii?Q?d0XBv8wZQXpGyxcqSFEKf2Dz4IjMhRL7yObalLuhh4CSHTPTDKAzsu5qX2jY?=
 =?us-ascii?Q?d8J5A1OdRRI9lMVY8sYzjHAjWRGMfW+LuKlWjKaXctrjSHzG6Y3fuqnzf9m5?=
 =?us-ascii?Q?IqxffQJ1lOpx2SHXoYpByJMzWPkrwqTPf7u4nQSWsOSTo2YK8rmrf7+iF0r1?=
 =?us-ascii?Q?WEnIlNoggX1djfmrCrnsqndlXl4QDL/G0o2BG8/qsWOAVyTKcG7vUFzmaRFS?=
 =?us-ascii?Q?JveZ/izKjE/u8ppRl+9qP99Skpk5t+axVc+Jf0Gk6+rI46a/AZ/8oLsfcVDa?=
 =?us-ascii?Q?569Y24Rda0xnF5gQeGl/OC/vSrxo/HOQwAfsbdhurjKccVOveAvpBJ3WTOEt?=
 =?us-ascii?Q?FLkbKVNO2Xc19e1Ih238vK0UsYSnht+rQKLM0Q2IaoHC3A2rG8CxRWcFCN7K?=
 =?us-ascii?Q?+zjkxIICiSkjxeFtsBW6HsUW2i5zNuxLuIZ2hlYZM6U/HwEZM8Gm9A7Wvi+x?=
 =?us-ascii?Q?OZUEWHuej5jk3Hhh6DsvdSI5G6IkyBLkXMIucdExERp1m9awTta6MDTvCONo?=
 =?us-ascii?Q?r4GWJuf/II+y3hpztnAWsQ6AyFqXUrDxwFYZ7p8fuhhTKtRrvfOYBD+yOkFJ?=
 =?us-ascii?Q?xExf1WYJQ1THA7zty6MXovYGi17vfVWnOgfNQMxUX9SaLi6y698WHYc8HV3r?=
 =?us-ascii?Q?56iaOTikOYpnV59OGaaSuHiz/VdBiVjxLpAXtsWiHX5D4qpLk3Il5/OFUDsB?=
 =?us-ascii?Q?sbWmwg6763Rq1HYRlFFYBf9AZc8sS3xS3IZnRGDREwZVQCOo+dBsNkT9II2W?=
 =?us-ascii?Q?YjRMYXg5L69JfgNhfk47IBYZgOZwUWqeCwuC5imVbQwPRK24H2piWrhZRjQH?=
 =?us-ascii?Q?tkVcMj1cSiOxliaBROpbJVtWXwF5sPcx1b1ECdwSDrVz2debJgdMJy4hGvnV?=
 =?us-ascii?Q?Um4sUTtlpGHqnVmTmuLHyBrNWHy7XXerZ5XEh1owTfES2QLSf5Gs98TgZqi3?=
 =?us-ascii?Q?XeMNBxu2S3hi+Qkm5ZdVweDjkbD1HUOKLcMt43pF7gACWaCfrh8xJ2WbAY0q?=
 =?us-ascii?Q?+tUIvmIyxdl6iKTchnEuG2nMTn17782xHI0SoMmik0ChtBznOubmiKkwKetb?=
 =?us-ascii?Q?9ocm6jFBmPLPwKcjJJyoE05Jqo5BBEv7omRXlEAOTVtwRcWQ6btBMffTmmwO?=
 =?us-ascii?Q?NzopgOx6xKWqkNxhKB2fUoOKiLWZ9xyNkojg0L/A8AOKjOUcuQwgPIVF8MuG?=
 =?us-ascii?Q?KX4/27ykkasPi5T3Sb/10ofPgicKbEFWgTA9z/W8ftix3H2JQkES0Mh0Odgw?=
 =?us-ascii?Q?GQ5HvAtPj2aX8SMaP9xyQTEiPkJZo6ifWA0pLpc9uj0bTtNJjQ2hd+sxe8sA?=
 =?us-ascii?Q?R/UqSTBSqgWT99u9+wbbWB4hs+qK/6s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e18539d-bb78-4832-d5a9-08df3b37c68c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:24:45.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vd/5YFe8OFc8/KM4uYc6h/UopTkoJ/pAaIxAkndm5GzmaFcRm7q5C+CZA0kN7ntM7ByNBzmFnO5ecQtReIpQZ6H+l7ie1fIeXHGzHALTXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249544
Content-Type: text/plain; charset="utf-8"

Python3 upgrade need python3-dbus and python3-maturin upgrades also which a=
re already under review
so, please apply this series on that


Jaipaul Cheernam (4):
  systemtap: mark python3.stpm libpython patch as backport
  systemtap: use installer instead of pip for HelperSDT wheel
  python3-setuptools: Upgrade 84.0.0 -> 84.2.1
  python3: Upgrade 3.14.10 -> 3.15.2

 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...nfig.py-make-it-possible-to-substite.patch |  10 +-
 ...84.0.0.bb =3D> python3-setuptools_84.2.1.bb} |   2 +-
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   6 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   6 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   6 +-
 ...clear-RUNSHARED-when-cross-compiling.patch |  46 ++++
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 254 ------------------
 ...st_is_python_process_non_python_subp.patch |  50 ++++
 .../0001-prefer-valid-entrypoints.patch       |   6 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 ----------------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 ---
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/python3-manifest.json      | 199 +++++---------
 .../python/python3/valid-dists.patch          | 164 -----------
 .../{python3_3.14.10.bb =3D> python3_3.15.2.bb} |  12 +-
 ...-record-the-installed-libpython-path.patch |  41 ++-
 ...staller-instead-of-pip-for-helpersdt.patch |  48 ++++
 ...t-install-build-paths-with-the-wheel.patch |  61 -----
 .../recipes-kernel/systemtap/systemtap_5.6.bb |   4 +-
 24 files changed, 272 insertions(+), 944 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_84.0.0.bb =3D> pyt=
hon3-setuptools_84.2.1.bb} (94%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-configure-cle=
ar-RUNSHARED-when-cross-compiling.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-160881-Fix=
-test_is_python_process_non_python_subp.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch
 delete mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
 rename meta/recipes-devtools/python/{python3_3.14.10.bb =3D> python3_3.15.=
2.bb} (98%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-systemtap-=
use-installer-instead-of-pip-for-helpersdt.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0002-python-don=
-t-install-build-paths-with-the-wheel.patch

