Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7677.1793602912913766359
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 23:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=e4BvkfnQ;
 spf=pass (domain: est.tech, ip: 40.107.159.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3AuoMV9/ft4v1mlx0aOXG6G1uj8bgQGNtSIn+2cxC5Q27dku9Z5uensHKM5sZlvWh91fyGUXC2hRguKKJY8CfgtMsggeK5cvzIkymnkrV7QLU7Z0CfOg8dovgNlOg3Nud2I3cVIsJwdiLGdvt6WP0srDWu/5mxgW1vbkrZC/GNPpg01zjTdhT18RRExHqX3Xt4EcYU91gmcI9HG6ufVrJg5pgkcm65UAK+V5lu8EHZh9xwffee+adQcLu9htRZf5T5UU4tCfjNu5a/7CbCqo+Dqcaa+E1gZo7U/bAw7B7pZEk8Kjcp98VMKTKGM6bEGE4+Q4siNX78gRUl51osQDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex84KnNSRotG4b+lkZq3eUZ3livbznUwAvbsdrrQwgk=;
 b=lGGyMLE++akTfAsy2+HB/tiduKsypHUKbCONgKRuExZySlPsB0CFjo0L2PyDnVrx/LPAM78e0zUxQOK9LswIEPGg/jvW+fNCwTje2hXURERCj072z0ToKYl1eyUyOH8Zrru1NlAUK6t8nxMB5IS/802xY4HeBePLl78vsyRhrnNkNT2zF3b6HBBaLoNTT/j90yCYxu6ziY7QmTr+w6Qani+fjPjBgAR4VZklsY84dwyqd1G8t+mwUr/ylyzic4Q2lSD0tfSHbCjCQMA/hp/1B6hu0NlF0nBZEm00ky7e1jIPEfXQkFHadJsXmtRqM7Fxp9NKfjAzZXMVO80OXWq8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex84KnNSRotG4b+lkZq3eUZ3livbznUwAvbsdrrQwgk=;
 b=e4BvkfnQAxrb4rLgF/sYVpdumt5uGFASEdaBUj06tdsAAwsyUM8eF5I/kRUT1h+kRm5jN/HOG83D3lQvbSFlyi8aPMBXW0dFJsyAWaRbNVcz4qB3krhFTWSUftWaxrClvnKYjJ3xRxhpz3r3gpL9tZRBlEXtuZqhi8XmkQ0hiwfpqi1S55YIc2M6SgSm8Q1TyKJrD5I0ierztgE/oig/V/olEn+UHPUH1LkprGcwmoZqOmWRliLf7nGQC+4L5qVoxScgmkRziM84pMUjVSkCekqLweTtk5gl0KgYVg5GMVypd6Sit7mNHfGG+ixZnKxC/PMwkiLCDzaHE5G9/qnMvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU2PPF8CEF58680.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:01:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 07:01:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/3] python3-maturin: Add support for python 3.15.2
Date: Mon,  2 Nov 2026 08:01:41 +0100
Message-ID: <20261102070143.30639-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102070143.30639-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261102070143.30639-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU2PPF8CEF58680:EE_
X-MS-Office365-Filtering-Correlation-Id: 3410c990-4c7e-4219-7113-08df38af2940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ouRgBxK/hk8Wv5V4EfCd2t8DURzLywqryRR8vYkfeuNSB9r154hVG16bGH1wXW5nI8+EMdEArZ1CiUg4XR6f44roHY35b2hy1xZFk9sLaeF5i1YDhYFhGSKNYM/QTQ50bOVbBCwATLq78R2qjly35ClBKjaZFawCCU10IPSJw1bNKmm91c/MFl/V3f7WwZL8AGssrno2uczp0NceTSl54OgTwCKHsO9ZndLGOAjZNK3rpLdUsfxsxRz2L+zXdZj0vDJaPutSbgtqmD3OVpDd/iH08KcqRFbRJpfoiGrIKt3JIO20svE1HVXV0TPPDP+nabYRPK3Zv7Rwk9pWQYkuPAUQFYfZXO4pZUeX5YPx+Aip/UFUp7riOexQkL3Qmpy7r173l8+am7dzvYeuPb6JYAsw8lU/94uK3nxe73U9S/K+xKj8uRsvW7vFFRUC/KkI1fqTi8HnoJ3PZ/AGIGtTuKQz4k16gYn4dpOJob7j5/C7MG7Ed7hGzqgw1aUjcgl49UDQyTHIzldslOEg/pw5VI/c9hKy2exSRE2vid9gucWjyXEr9kWBWwIF5UFasU5rA4n/FoB4p/PX7yPszZKVo81chUDrKpwlALu2SLdba6jhLZSgoyxflFWZY42jOoXANr0iRGtCgapcmyEbhtR8yAh1C2VlGO2skcPIjtoxRNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YNRUiCx0Fbu6BItXCaOkJyoO5Yk1prpqc+s01zslyKy7QvqcF1qOeh9An+HK?=
 =?us-ascii?Q?/ZL5Uz6cBqf4raU73x8VHxvvdLMPIIBsyJih08lZO7NyuyuYl/D6UvUWBxbz?=
 =?us-ascii?Q?JzMSYR1FMzNpqRbNO8UGDaBKoaoVV4s75Mt9HWvtCAnCgBvob6UvGVNkb2dD?=
 =?us-ascii?Q?je8qcZSwtNCZQBCZc9IVaQHm5stzF+XTqXT2yPB4oCVDuBlPvenziAFcM95F?=
 =?us-ascii?Q?ydh5R+jW9BpdGinkKxDHy99rc0tQNC9rZjh021b/ETLy5Udk0J/EaFFyUhPI?=
 =?us-ascii?Q?X7pJnm1E6Rvi4wKvWLwAIahBFNBxgKHsCsYusuIBTINpPdajowiDf99ofM8D?=
 =?us-ascii?Q?jA7ZV34vS8iVxETbrKFHIaRUEZnZe/LGXkLUVGzfePXB6bKk9ZuejXWv8uzM?=
 =?us-ascii?Q?zmG3ITBg2gJ+GrwL4dc/uXCobcR92ylHnok2qQ8XvQ8BjUv1yV3Dg67+v64R?=
 =?us-ascii?Q?2Ugljdnk8uq7dJMoJr703igckm7EYnlFPGh5sG+VSVXzim9oJkQPKr+gHhSu?=
 =?us-ascii?Q?8m2Rs7TdKxsMHCwc9CEtyWLczS+SeD/ypwI5h8YH6UT41b1O9MZp8NNaXcva?=
 =?us-ascii?Q?cVuNBg5xtQueZbC1CXvqQn7ohlcrtIx6CxoYZ4QkOuVzvwOewCfmfiwnazSb?=
 =?us-ascii?Q?RtbZDMqG9PIx2si9Bjx6UKDHU0YR5ZlhijdLiQIRipF3L3dxoIYD0Qf3oqZP?=
 =?us-ascii?Q?Wmv5KpXnunDsnMUwm1wHt8TCptwIOwCtw8lPK1xs18pXB3OEADp4sKj/pPZq?=
 =?us-ascii?Q?UzMK78z/mW++GCAe3fiPPd6KGLE1U0Oeg91c3ASHp9dGw+9yx13ipsFv3TpY?=
 =?us-ascii?Q?uP7tV7xe8SIA/JCB+UPbtig2iLLQUhTVTviI6kf3ahhtH9oQMqtw59VdQHwG?=
 =?us-ascii?Q?TFhayAy6nfUYmg30tEry897+qzT31NGZE8to3BHimbY7Ek4Khw9SxME8ehQL?=
 =?us-ascii?Q?wewhIwiOwZLAtgooPbyGUR3i+yNN6cGLc0EKfTU6b5/dxzDGJgG0Ku6UiYoZ?=
 =?us-ascii?Q?Br25zZ8o4LlCMWftLUxgMs6p82U2lPlQNC6hoiLzzgnwT1cVvQfJlJSIIzGQ?=
 =?us-ascii?Q?MPGKxWNbpYoRnfdUCCii6u1iRGlyvz6ypOW2wHNdw4NvSeZMJshytapHEDmq?=
 =?us-ascii?Q?h+TwdumWgjec93d64zeKwiZqwmHG/GIUDd2QajoEBiThXDKUR2ixxYcHOeV/?=
 =?us-ascii?Q?NkG8feEChVvuZNRmUk8jYTWcLjukTGrCQiVXoKrdfaODXPctgd6NduV/Gqi8?=
 =?us-ascii?Q?POx8a+B5A3iVXDOtq/iMHJ4+ZeLopZ8xj3ul7NXUQ9p7Zi1moWZ1jNPpU3xM?=
 =?us-ascii?Q?TMLObs6Q4HI4And6BF7iVB8JIkY6WsTkwkPGep80h/EgjkeiizvSjEg9yPE5?=
 =?us-ascii?Q?Wn9O4Hd0NJrCVkuVhb3L9ailAv5zkgsCHAwvaEc93ZTRDlD65mCHyrOuyxEQ?=
 =?us-ascii?Q?malir0EAq2UrZrIbwveLp0An8ADg8PzbBGJtKbjchn4RRRBrXpGbIHtNmxYx?=
 =?us-ascii?Q?O0ejH9MyHOq5HUmObRQ0fVWyjsxTYu/HPkx4Iwvm7lJxDgQ37DgT0vp/7r+W?=
 =?us-ascii?Q?l74acZhhxk9CBVhvaOob+5YR+WZrOsSe0G46nKPLxO6rDqlmq1dEpYWGqhdc?=
 =?us-ascii?Q?YKHeLonJvVnccq8oC5WipxTFImZO2wqaiQKE/LM1lmhFLbvGEyV82nvwI/3/?=
 =?us-ascii?Q?IWfiW1/izQrXM4Y2cfJ53mTZQtO8D/yntu9aA/qv7iO60sxDrcJQ0plZzJZf?=
 =?us-ascii?Q?zPURs2ZM8Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3410c990-4c7e-4219-7113-08df38af2940
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:01:47.3670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ByR5lpaY2AjW/FMykCa9JUTXnZzIj4eqyaXhq1I7m1AETusytMNtBM24a5LhxaPkNN+hgOAbzPsIO07Yw3sqSIAAjt3MbOumC1mfPg/16Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF8CEF58680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249188
Content-Type: text/plain; charset="utf-8"

Backport the upstream fix which raises the maximum Python version to
3.15 and PyPy to 3.12

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...1-Update-maximum-Python-PyPy-version.patch | 99 +++++++++++++++++++
 .../python/python3-maturin_1.15.0.bb          |  4 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Updat=
e-maximum-Python-PyPy-version.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Update-maxim=
um-Python-PyPy-version.patch b/meta/recipes-devtools/python/python3-maturin=
/0001-Update-maximum-Python-PyPy-version.patch
new file mode 100644
index 00000000000..1c78bced287
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Update-maximum-Pyth=
on-PyPy-version.patch
@@ -0,0 +1,99 @@
+From 713a7088e1ca9f1fe71efd670826d6b77470c24d Mon Sep 17 00:00:00 2001
+From: messense <messense@icloud.com>
+Date: Thu, 29 Oct 2026 21:46:23 +0800
+Subject: [PATCH] Update maximum Python & PyPy version
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/3bec0a32=
ae2b67ad4fac0194f762f44141e51473]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/python_interpreter/discovery.rs | 12 ++++++++++++
+ src/python_interpreter/mod.rs       |  4 ++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/python_interpreter/discovery.rs b/src/python_interpreter/=
discovery.rs
+index e4bcb73..47548aa 100644
+--- a/src/python_interpreter/discovery.rs
++++ b/src/python_interpreter/discovery.rs
+@@ -708,10 +708,12 @@ mod tests {
+                 "CPython 3.12",
+                 "CPython 3.13",
+                 "CPython 3.14",
++                "CPython 3.15",
+                 "PyPy 3.8",
+                 "PyPy 3.9",
+                 "PyPy 3.10",
+                 "PyPy 3.11",
++                "PyPy 3.12",
+             ]
+         "#]];
+         expected.assert_debug_eq(&pythons);
+@@ -740,10 +742,13 @@ mod tests {
+                 "CPython 3.12",
+                 "CPython 3.13",
+                 "CPython 3.14",
++                "CPython 3.15",
+                 "CPython 3.14t",
++                "CPython 3.15t",
+                 "PyPy 3.9",
+                 "PyPy 3.10",
+                 "PyPy 3.11",
++                "PyPy 3.12",
+             ]
+         "#]];
+         expected.assert_debug_eq(&pythons);
+@@ -765,10 +770,12 @@ mod tests {
+                 "CPython 3.12",
+                 "CPython 3.13",
+                 "CPython 3.14",
++                "CPython 3.15",
+                 "PyPy 3.8",
+                 "PyPy 3.9",
+                 "PyPy 3.10",
+                 "PyPy 3.11",
++                "PyPy 3.12",
+             ]
+         "#]];
+         expected.assert_debug_eq(&pythons);
+@@ -788,8 +795,10 @@ mod tests {
+                 "CPython 3.12",
+                 "CPython 3.13",
+                 "CPython 3.14",
++                "CPython 3.15",
+                 "PyPy 3.10",
+                 "PyPy 3.11",
++                "PyPy 3.12",
+             ]
+         "#]];
+         expected.assert_debug_eq(&pythons);
+@@ -817,10 +826,13 @@ mod tests {
+                 "CPython 3.12",
+                 "CPython 3.13",
+                 "CPython 3.14",
++                "CPython 3.15",
+                 "CPython 3.14t",
++                "CPython 3.15t",
+                 "PyPy 3.9",
+                 "PyPy 3.10",
+                 "PyPy 3.11",
++                "PyPy 3.12",
+             ]
+         "#]];
+         expected.assert_debug_eq(&pythons);
+diff --git a/src/python_interpreter/mod.rs b/src/python_interpreter/mod.rs
+index dca016f..9dcdaf8 100644
+--- a/src/python_interpreter/mod.rs
++++ b/src/python_interpreter/mod.rs
+@@ -23,11 +23,11 @@ pub const MINIMUM_PYTHON_MINOR: usize =3D 7;
+ /// Minimum supported PyPy minor version.
+ pub const MINIMUM_PYPY_MINOR: usize =3D 8;
+ /// Be liberal here to include preview versions
+-pub const MAXIMUM_PYTHON_MINOR: usize =3D 14;
++pub const MAXIMUM_PYTHON_MINOR: usize =3D 15;
+ /// Minimum supported version for free-threaded CPython
+ pub const FREE_THREADED_MINIMUM_PYTHON_MINOR: usize =3D 14;
+ /// Maximum supported PyPy minor version.
+-pub const MAXIMUM_PYPY_MINOR: usize =3D 11;
++pub const MAXIMUM_PYPY_MINOR: usize =3D 12;
+=20
+ /// The kind of Python interpreter (CPython, PyPy, or GraalPy).
+ #[derive(Debug, Clone, Copy, Eq, PartialEq, Hash, serde::Deserialize, cla=
p::ValueEnum)]
diff --git a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb b/meta/=
recipes-devtools/python/python3-maturin_1.15.0.bb
index a29e29bda9e..e8c0b6a6ad1 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
@@ -5,7 +5,9 @@ LICENSE =3D "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM =3D "file://license-apache;md5=3D1836efb2eb779966696f473e=
e8540542 \
                     file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5c0=
797"
=20
-SRC_URI +=3D "file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch"
+SRC_URI +=3D "file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch \
+            file://0001-Update-maximum-Python-PyPy-version.patch \
+           "
=20
 SRC_URI[sha256sum] =3D "94b26cc8e8aba61a5f2099715fe640e18c5f678e9a500408b3=
8761263954228a"
=20
