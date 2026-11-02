Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8234.1793606913428460224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 00:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=B7LZXWQq;
 spf=pass (domain: est.tech, ip: 52.101.70.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufhnjMFFd/Aiz/LfbVQhQUnPxrSAPShF7tcJQi11OyTgSX6Zk3D9Nnet7jgn4OQ/Ctf3hfBGe/YAhVnqr+XQjEQsWG3KOulrrOzAbG6HWxglv/u11OM6GlSH6uMz9axEIVq1DpPdzGJf+7TTbr+/I98naasQeOqdBwY2uUqS/Pk9lNoUVdngpWKI6lqa1ocXaBsF51C0qIaQgn+L42b0FZvXS4cQB5urigH/A8YP8hRcCMIMvb37Y/CRU/mh5YPqeq5888c5Nv2X2ou2TlGErXUU1j60vy0w5Hld+f3hTCljAUCnPUMCu6Ca0nff5NjT7sqM28BCgUqVfTJmV8HaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex84KnNSRotG4b+lkZq3eUZ3livbznUwAvbsdrrQwgk=;
 b=o5aTBfIGpmGn36fGy7qNkGmpz+Q1sHTct9aF5BuXYFfBSwSxDkLPa39fMQ/ef9ST0dVrRIkzSHtVfWFwOmfX5JR6hyuZHwFJmUHdbVyGf8I76r3eWdNqZpkIqHkrcMfJoLA0krE2QV/GMBic6GbEyCJTkwWrYfw6lrQUMB4TtTDb7lJzs7YTHopkawCCkpQQrE1fkMyzV73k8mXny60Nn1j7/BZ0JL3h8FDfUCkwYCyF2aocGib29WiYbDD0pLB26SdX/X3NTbIPpGD7Cgl95PlfPN0Ya0mI1x3gopLpAZmNNer99PMXBAt2re+RB9uDISb9tb+tfdJw3L4SkhX9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex84KnNSRotG4b+lkZq3eUZ3livbznUwAvbsdrrQwgk=;
 b=B7LZXWQqzTarPi0oKdWX5Vif/+2DaYf+WJvTheGlM9gZw/t14rDiEOGcxSMZ2vkhdO++RudHtdkcpAh8iK8dJfaa2vohWF/lvYrSA4ba9ztuvYV7UDVVKK2IRdakUUbHNTfMdn9OwdStsAevGAu74z9tVibnIbfpj6oxW+BJBG2H8ODzHilMhacEViTUIXO9aaksy7C3sFcyMzyoUym83kI5fmxY6mmLTjRziCMjygdvqV36wq6abEdo7Gv4rt8OuC8mrv4s8sq5u4YjanGBIOkiABIwEZ+qoheoJcytwBDeus7Pet6yKbzu9pyOZ3KTC7Bh+cJYijvyUuMogItxGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2290.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 08:08:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:08:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 1/3] python3-maturin: Add support for python 3.15.2
Date: Mon,  2 Nov 2026 09:08:21 +0100
Message-ID: <20261102080823.31025-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102080823.31025-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261102080823.31025-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2290:EE_
X-MS-Office365-Filtering-Correlation-Id: d327e76f-da92-45c1-5d83-08df38b8795e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: lP2S4IhIYLefC6zHj6vM88JVsy2Zb76lR/1QeLRtDK45Yzo+hE0AIpqrmKdXECPzZr15WbR0zziJcckVwh8P7oyXhOctwapuEyh88nurzCyIzdB2LlDfTlhiA6nMftk4CDPplE7BY7rB/TxG4G/MoxPpsZ3kXXPqs7oP+lX+yygHXh+v1yFrbAzQKvDUK6ywIoQuQJoEwnXq4UaIsqhuzsQd1tyNK0Ot5MNeTvzz8Gg9f27PqOO/Rmqb/33GzU5VKJ5MphegEiZimDuVVcPC2Gjim/5IpFEc9OynDlQpEoToswmmoeC2r60oFhdRiSFCglu7wyglK52/pBJrLtuipk101j5CfSeilo3TdCrEPwoRCeajN1r/fM+CWcwyuo6i6U4mqUKRmqAwg3YTZzovL6mYZ352/ikWbor97bbF0c3FxkwC3Z8cu+FDlRJ81va3MM7ZSmVpXCIAzjXR2Nr0/OgGMOZhYRgPCpmXTizBTk3VFccRaKBpNMmYvDLnbN0ElQqw/QZnBak2FmbDIN0qWOWxdIqFUn+YUA5m58zJVFhK0XsZycfj1pjuocitLG7qS/DtRbpNRghc+qU3NeBYSRq5XMZHxWGxLZQ/ciZ6TeWEfu1VW2OWT+0BL4+JftBdFXR5ty0hhC9X24t55962i7AYKfXIQiPp+US8RSzqIuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hZ0WUBEkSFA241xXUr+ZuSKZ11LI7GRi+o8dlut5gaPK8ikVnTArLboggEe/?=
 =?us-ascii?Q?K42i4Kui0T5BwPfZQqtw0Ejp4LOFUYh0bQ1lJpUTToqjk5/ZCr+3e+VZiRSJ?=
 =?us-ascii?Q?4EqpErVR5wp9o+cxf2QGkoT/VZXu91awqLzq1dhGa61XmsgTvRkeCtKq+DD1?=
 =?us-ascii?Q?agdGgjQcMBJgk2z59XmFhqO2OII4K29r+fImn3lPAR/bkqGwIRenxPbbjZjN?=
 =?us-ascii?Q?oYHxjZfYJQN634LVlEhP5pKBDO2bUQ+CkRAtP8EINZj/0petOXjunllgeGvk?=
 =?us-ascii?Q?maVogEtP1oTTUCeFJuNPCKClfNwP7SSPcw/13Oy3O8nsioc07HxYMW4kWQqG?=
 =?us-ascii?Q?2Vu4YuTSqIBwbbWmmwWm2M/Qs4nXnytEY+mTTcOgUzCwsbs2UgZr8/Ad9PRc?=
 =?us-ascii?Q?gdb+8QY2KAxWMev2th/XKg9V/ZZ6VALqYdAi+J7OHNRbGFBDtJUHE40tuYN5?=
 =?us-ascii?Q?NteUVNwJHK2I3hNKAwiRvs7v1i4lBzDvMWSVe5xoNSKHHXIHIqZr9vUQVJ/v?=
 =?us-ascii?Q?+tTPVIhvvxS+2Bh+1Ywd/oFJqD2SJa0I4ojSN1bqPQQL26SCBuYr1kzspRnL?=
 =?us-ascii?Q?h3ERrPdEw0RhBdiN90QZ69rkoKAlZpF846g8wb61MZar8JP4nWt6aEgRRaKr?=
 =?us-ascii?Q?9E7FCCNJsT20aEwCdWzkY46mfE9FjiIt3DU9TrYfYjcj3NxD/xTDXVLYspqK?=
 =?us-ascii?Q?Qhy6BdvbvSApswWWZITzuPnT2NyTEt1/Rx5W+8CfVVSHVBUcY/+dtMAFCKM7?=
 =?us-ascii?Q?4kzh5XYJM61Ix9m4mxeGbECnrh3dVkTIetUsm7dSrnHzyMXB+Bdmxu062XNH?=
 =?us-ascii?Q?JLOcFxhVUelmG2qsvZpCTaFd6UyCh/D8sSNcKauyvcSWXbxXClkZKb6Ry/xI?=
 =?us-ascii?Q?s6HtHJLIYHSBJdgZp6U0p7oyqW5+DTdKtj6gQNAu5yNa3xs3d+H/Y/TQPoOc?=
 =?us-ascii?Q?dAU3/OGHt73dtZ36R+Ms6MEIKpJdaw0aVyIbDHvr7mUp4pBmW2pvL0hjlN7/?=
 =?us-ascii?Q?xb/OgK3zp/FkSVWY2XpIRLNb/aSi58b0w4ASAvSKD2OZnLIYYC+PTeP3xW8J?=
 =?us-ascii?Q?xpOA9Nz+Vl6LpQS15AcfvynbzIESQvzuUFSwNVE5WMGKClOogCOCYMESRqjU?=
 =?us-ascii?Q?pvwRU8gQGk+9YmFHcAoL4lfN8/QFIPD04MobNEGWtOx627UIv8/7vBcSdlot?=
 =?us-ascii?Q?GEjvxQwaY4njdhGdM/XjEg32PPYgRwsBUVJgIrXDyCFIpHQZeybmV3YSwh+q?=
 =?us-ascii?Q?muKiYMysG0dh6p0bjIFctL2ICEflR8KLZANYn6TNQYPoEkAg99gYvn6vAAXM?=
 =?us-ascii?Q?1TB197KcRGRpu7nAVDMLGElPnHpJYtX8G6Msb2NwrUUliR5C1Vfu0eRLZFI7?=
 =?us-ascii?Q?F11BKjovp5alejhKi6Np8EmFzlTw+0MN0kC3SzsfvedY0/7Twf0VSIpYBS1/?=
 =?us-ascii?Q?VXiZWO6k+V3VUfb9qmx2C+0kPklmjz5uPoDxFXzifDlHAdminfOaKjABWKrW?=
 =?us-ascii?Q?jScrZfddUSWslj77B7m+u4WFcif3K3f+s8bHQ8JBu3J/FE6jCgoRa0NMwc1W?=
 =?us-ascii?Q?T99Fn1qQAiv4xyM8taKQpeo8OMHR5zdL96xUteYLABzaK4VKEwevDXUrvA2m?=
 =?us-ascii?Q?VeELDazfZzGD+MWvXnpUwS6thfN0eMs3fvR77wzjoZXRSw7c8FuDxwslQfSv?=
 =?us-ascii?Q?CGUmmG4ppcWZGJWSM9c/Xw3Xgvg3X0PiFgRvoPRHIp6s5B3wfagh0+odwXLx?=
 =?us-ascii?Q?4rrDI2/6GA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d327e76f-da92-45c1-5d83-08df38b8795e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:08:27.3428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04QyWrdHd+DU5Tpnqg+GHX+R9aKqQMmQAtTJNvmOK5FV16Y9F1l84AYQQ6Dqg9swuGRyk6NTqe00sfAdyGNhanYwr+CVFsEsULGtZ9v+v2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 08:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249191
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
