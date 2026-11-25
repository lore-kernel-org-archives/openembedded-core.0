Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38981.1795600709737160541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pO0uQlmG;
 spf=pass (domain: est.tech, ip: 52.101.70.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB7IxLvHeKVClf0lVzVkVtRivzkEz/Gp+Y86Aa9CaMO0L/slaASJkaE1JvRElR3ndgFT+hzxnuOnHz5LagRsX5/bEx7F8acSRBc+62II3cc+Gi9sOH/4m/u/0tgW8c9iNiBFDeFjVAFAdTQpT4Cjt4bgaOcUiyrLh4pBoATyYvEpfiXW9hxRMpTyq2h7vWBLO/xRbbFPB5UYLg0CH0TiYHF+CFnUWTCHJ3Q8UP/km2ITwLCXw6FHnQZKNMf+AlEH07gxZ/tSQh1Y+5vs5BEn7+x5AqjfXiykHaSHDrcR2JWc190L0+E1cP3k8GizGETKT8H03Poz8giIe5xugCGB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbpKwUg0Zhn49Eu1jhnlAa9/3lIzIxLeL+xcHogNTO0=;
 b=RQl9s7axHJRuNYBsYcECVvxrRFUsnO6mWvxeWDvw6RAAmld2/WyEE6+zOMWq8uTFesS4emcmlNLMr7S0EOAm//QHtISCc+zritstfpM3Fdn4MRUpouN/fRaVvsuzJpl63a2BoWSqMRd5RDtUVoqWsYlj9rlo+lAUtZuI8bwZZxy5zjNt8JfnoI3vdbasVHkpjBNEddtm8TuoBSEPyz6ywy4KF3Mho2/ZrJvMnxZhkjGd3mRBhfOGWwKy063UIepkAGERdv1cixvVp7GbZ8EZQGoRxKPunz36oAaDizT4WPzyDOGA+rchT6HMSDfdkY7bRNzolMnVaZYZAojCE1+0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbpKwUg0Zhn49Eu1jhnlAa9/3lIzIxLeL+xcHogNTO0=;
 b=pO0uQlmGihoGlggVJ49Mda3InuuMocsJ+UMH2Vx/G3dkPaVUUSFXxYOzU9IYWXypqbB44ChnBC6ev0OB/CI/zym1tn9umbSxVIlUP5m3xZFZa3oxdsEHa8nE8LJWNDgu7Fkk7rvXP/iCN30ptZPSz38H9Hkfa5U2etWAJh9B9r5ADirpFOPBQ61pFBnIsZnnT0mXf+0R7m/U/1PIARtzt8pIoSDnsbkL+tmYsKNbo+ve9c9AQCKkd0UDqvTgrddHVTVVyP7oSqhRgz7NfaAm8XlzJZ250mSf9FVJvOYN7BlxMskc9S7Zd9EsW82yMaS82Xx/u1N7QtUzjgjsuTOF6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7PPF0645904BA.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::686) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:58:25 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:58:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] zstd: upgrade 1.5.7 -> 1.6.0
Date: Wed, 25 Nov 2026 10:58:24 +0100
Message-ID: <20261125095824.79859-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-6-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-6-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7PPF0645904BA:EE_
X-MS-Office365-Filtering-Correlation-Id: d89e84d4-4676-44b4-6638-08df4adaa5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|261009223327099003|261009221727099003|261009220027099003|261009221227099003|261009223027099003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006|261102123227099003|261022075727099003|261028144727099003|261026140227099003|261022115727099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: s5CkdIUk2u1FPh+BHZvyhyxFXFutfsmWdNn2xWyhzykmQ5hDqPANBUYQIhq72EDppADq96gV14iHYONokuZXwluC4IHp/DtcPVU1nDgd9vELOf/GvIr+sGIYCds6za27ev/5EihEUBbrEJH8aaC4jmvc7RQ8EBhPXsfnIJVaaMcLOsCWz+wpPlxvHwUwRfElZnkM2hyN02RiWFe0DEYl2/7Xq6vPS0mkLi0gjiepftujPUd7eigMalEpXYQuU6enhReq1xG2eikg1xh2KSv0faKrVzPng//DCNx93m6xLErH42BY2l6rDIEyhAqZsE9GCC5HT/Tw+TQ9Zz1rr0OpmqNP/NTvivhrCR8hB9sGfPsEZtC5hiVvlKE0qGx6rmdH5xpjEeaOTbbcJI2Qc75+1g/Hip7EKzVhsm/cvrlBpaogdoAU6mRycrl+iMjFoGoWIqfJi+xbm8xJk9SByNN1rCTyRukJEePc5JouKADQK3g8hof/qNb0UDq2d9zYwBF5oGKr0q3OfeDZISu6g+G6L12yF7PNImgjtdqrgwb+/7jmnG7f3eI65ZodbwkX7tR3sn2hzP1iMkbG1nGnNk8rf84qEOJ92cNxsDEAxqdjIMOOfbmsz6IztThKsqQ/oAK6q3zLKCgplgNhvsJ6JGBq2NAkTY4L5JqTlb8DqVAhEJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261009223327099003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223027099003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022115727099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?57GduEtvH11l7O8Idsi6lPMfRFa84XvVwdMpWtYQW2VIRa8EEnh0O4Wm7p+s?=
 =?us-ascii?Q?A15hNL4PX1JAknFAiCmEPjaROs7MBFY7ZGipQHtMVBYsBMhHWPecZdko1iIy?=
 =?us-ascii?Q?A+/J+mdO+ci1BYNh4J9JDPTtVfw//TfnYngw0vGMKfE5eJ66Yami+WMFMiGo?=
 =?us-ascii?Q?nMcbQjuxgi+wzc4JSQOl89xRwRB9hevMLIM4lcj/TZDT6SgZV8ViIvh7NJXN?=
 =?us-ascii?Q?s1YVKDn1eZb8RoTdl+BHFQ1xQei11tS7MCBSk1ywoD1S9QffjF1VbngnJOWD?=
 =?us-ascii?Q?ZectfuNtx7bDKp9jxeGAPZQp7SDwAVwpQcwgk8Ij9tfUUrESdoWMgpo+Leny?=
 =?us-ascii?Q?da/EaXpHV9tSVoU0DVO7VQyKEM07Hj58EobDERTdNinanzuUthXsapDfpAkq?=
 =?us-ascii?Q?kAHVggC0B2WXjYabO+i5PJghEDcu+piGOyLSAtBMeYo8oOpw3z8z2VquYOu0?=
 =?us-ascii?Q?/UPDjO9bh4aLkdSJ6uLAvCCqCFtj5/qqFrWARrug7CX1BuOltEooMxt8lsae?=
 =?us-ascii?Q?6j0PQnbqNW74/s+54CWaz5B4TjqhHYdgbKdEp3bieh1G/WiSJgxoqzCQArLm?=
 =?us-ascii?Q?rFl/7OoE/xBtcG4DBbC29+DuQ/vbHezD56UtU6JeEBwSl2Mhh9rTfDMsPRbf?=
 =?us-ascii?Q?HSpwBAkAHfj3FbL8e71gsaA3HV1MqxouPaDoId8TnZp21psamoxZ/QaFhzcj?=
 =?us-ascii?Q?6IyZ8wygdVLqv7Czc/NRLaYSho2Xr7WXbYwXXJuL+fw0jzfZD9OhQRS1mYnl?=
 =?us-ascii?Q?XxSBFyxjGlcyW+y6cF7G1IeO4qYzWBKXGG2WS4iG5oGGmN0Bh4OnM6uuew9O?=
 =?us-ascii?Q?d3oJN5n6P89yRcx9Oi+QbiaIHxuy+jbnqpsvPfLDu5R/rWcGncuJFmUKI0Tf?=
 =?us-ascii?Q?twNYUOVJ+WU2GP43x/j25heW37XmVo/PjPCM6SospouLcCFqXHjmPYhSvZwa?=
 =?us-ascii?Q?9el28n/LjMztGgPc3jSnUKYy2GTitGi6dmjwGL+9jnOj3U8YpKk3Ce/TIscn?=
 =?us-ascii?Q?lUoD/Uj4TGZsmIR0JDNY3PmBBQPEZSPumQjFaO4P6GwptCRdJ8Xj8PKR2dgC?=
 =?us-ascii?Q?sXTX1J0glulNQMDrZonN4OIC7KjvgC8MRNYUKsyahy9NVpfksaH4x+TUZJeu?=
 =?us-ascii?Q?ig+eZQ9BlrkNpk0JnS0K86Eoc5plnOy7dNDN6oBAoVIbg5MznnYCJ15kxfaV?=
 =?us-ascii?Q?R+QCFMxyoUmPxthX6qNgDd3qsTONWutFgnEq/MRM38K27n8XpFFgDMZ40VBT?=
 =?us-ascii?Q?UYu8TfEjm5yDgmiIU5ahdmQQbksWMn1m+b6Y4oTjA3aauVtNjwa23+q9YQrG?=
 =?us-ascii?Q?uTjabfRvao8+5cDw4bVncaES5gJMw0eBaUEHCSXP1h4MwhrecM42PyUFPdKO?=
 =?us-ascii?Q?zW5eRHvzPc4Cl2OItGL+2MPwkwI8aUCBWR8hrgp+Piw1c7preE5XdnOYr17a?=
 =?us-ascii?Q?GqUmPE+WXUH0DFbYEqezvKUXlPeC16hS5NUwNUhQBA/PsN9YTq1k62Z5ILTa?=
 =?us-ascii?Q?Fc1fV481cBzrmkX/D7KG5+U0NsJUzNWyxD2F4DwuphRt2TaDoYA9dxr/YnUc?=
 =?us-ascii?Q?ZjGUJdQPINdNjf00vLNbExLQgiB41dp1UniVJE24JJGZ8If1PpmoeMTBJSHz?=
 =?us-ascii?Q?unbJR0Zbdi39h0dq3jJJgvTol/Zgfwwq0hYjjyy8xNPavzJgVl4avA/fBj02?=
 =?us-ascii?Q?l0eaTlSiGx4FeNhqmwzVojvIb/GPPLZTfRqXk8xcKxTp8mUA0gqsjrPWX4VK?=
 =?us-ascii?Q?X1WHgn/IvdDrbuZ5N4Rd7M0GyyyuIzo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d89e84d4-4676-44b4-6638-08df4adaa5ae
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:58:25.4520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m6LB7U9TN0pK/s7pyAOzOZn9OFV0otHnBhUVfy9YJs2OEHZ4+zxUCZfajoUDZSbVuvaMvDw5ZdkBweK0PDSWrxv1HmsY0tmxocldB7/hYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF0645904BA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251173
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/meta/zstd/releases/tag/v1.6.0

- add coreutils to ptest RDEPENDS , due to change [1]
  Add tests for determinism which uses dd and
  BusyBox dd in the image is built without FEATURE_DD_STATUS and prints usa=
ge

Ptest summary:
PASSED all 64 tests!
PASS: cli-tests

[1] https://github.com/meta/zstd/commit/b16d19351

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Fix commit message and ptest failures

 ...cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch | 4 ++--
 meta/recipes-extended/zstd/{zstd_1.5.7.bb =3D> zstd_1.6.0.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.7.bb =3D> zstd_1.6.0.bb} (98%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-l=
evel-when-memory-is-insuffi.patch b/meta/recipes-extended/zstd/zstd/0001-cl=
i-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
index d7559f7269b..6163201bf2f 100644
--- a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-wh=
en-memory-is-insuffi.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-wh=
en-memory-is-insuffi.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 5182d7671cb65346b55d3ff8eda6388f876a7431 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
 Date: Thu, 27 Aug 2026 12:00:00 +0000
 Subject: [PATCH] cli-tests: skip zstd --max level when memory is insuffici=
ent
@@ -15,7 +15,7 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/tests/cli-tests/compression/levels.sh b/tests/cli-tests/compr=
ession/levels.sh
-index b8230f2..7846d3e 100755
+index b8230f2a3..7846d3ec0 100755
 --- a/tests/cli-tests/compression/levels.sh
 +++ b/tests/cli-tests/compression/levels.sh
 @@ -16,8 +16,8 @@ zstd --fast=3D10 file -o file-f10.zst -q
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extend=
ed/zstd/zstd_1.6.0.bb
similarity index 98%
rename from meta/recipes-extended/zstd/zstd_1.5.7.bb
rename to meta/recipes-extended/zstd/zstd_1.6.0.bb
index 4c3b377c14c..a4a6acc435a 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3D=
release;protocol=3Dhttps;tag=3D
            file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuff=
i.patch \
            "
=20
-SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
+SRCREV =3D "916e8e70b33317d469a41ee837e47317807815c8"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 CVE_PRODUCT =3D "zstandard"
