Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2507.1793308006453945072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 14:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=soG8YGGb;
 spf=pass (domain: est.tech, ip: 40.107.130.42, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xW1jytVnQW82PuHbuei+ySCfgOdiFbe9jj8EouyxBP37ypNED0B2wxPV/UIK15PxbcDH/6sTrDsFWAEsxVvJG+V6L0WwbHasSqMEdgbZCli9MinVjXMFhHYANGnmHReE5V0g/ynTZ6khhqqTbOZI3gh5cot+cDkTTM0FwQI6gBB++t2rAW/mYqMCu/hMFDsSEwtISRE8NU7wXlkraZf0pe4RKWd+WH/85m8ESQC1FAJq/rFCH+etqlFBBbd3zyRrv1v/wEO1Nq17o3QdGyVXIVZngZtHaQMzHZHalRA2tk0JVfPCr9L1Pfo5s48lSZqZ3q/l6X91km2C9WCGeeg4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex84KnNSRotG4b+lkZq3eUZ3livbznUwAvbsdrrQwgk=;
 b=jeQxq0nTogbgZgV7SKUL7VXpy0m2COCplhvJyLWIovA3cLlK20nVYJs5mrYcAZpkB3GxPRW4wqYJnlND+REcxSb8YYWXR0PUtW+4Tp0x26uwH6nZuvAOdbRhL5qc2WuCcPyOjyuLW2XOHV/q7bzLNaOSciu8dL6z8IKPxhw/HsBiCGuqrysMgEusFMCYEvOd4TNYoNEG69X1RY6KXaeJlEP8+PYz21/bZ03KAAu7dm0/LrUPqfSbK8CGcOjvteond6GyD2veulbxpyCKUKXnZ23RBSq2wacYiYWnMoWuHOPBFrApDzJ8me/NhVjFaHik7K1tyrnFxrwL5fJHQzztqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex84KnNSRotG4b+lkZq3eUZ3livbznUwAvbsdrrQwgk=;
 b=soG8YGGbVl8h2JS2+/OTEuiHbrIX5YL5EIcENevmQJMYbIM//JzjNQ0j+JBfwoql6MUqZKrti852E5DVw69OspvctWlVX3KC+6D6Is/D5eOOBNH6TOOZnAjRrMiem8VMN2SKprpOdAFXQgZFIGyyIjT1P/f0y17oqQhdQ5iXNMlUFgFJjZI8BgUgNntK+DjPSNcfhM6OCrw4QJOIpkftpXo8miwjRGSh4ey8x7Gk492JjrMo3q/z6RGWTbo0cLdMY0QLToZwBmCtJmBf0pCO/gB53ljz3ibfUXuxid+zqwC/YjkdFA+ctmuc8GjHaglwxmyViWG1jceIKShm0jBy6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVXP189MB2127.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 21:06:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 21:06:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] python3-maturin: Add support for python 3.15.2
Date: Thu, 29 Oct 2026 22:06:35 +0100
Message-ID: <20261029210636.16016-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261029210636.16016-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261029210636.16016-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0469.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVXP189MB2127:EE_
X-MS-Office365-Filtering-Correlation-Id: 440947d7-3368-4f70-40c6-08df360086a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: DtEsLR3pw6Kaut5HvkZSeOjUAgytMG6jvcUSSagQOA3JtznbPOWLcddyNlkCEiuyRVEnBriXqKNB2vcQyLHPfghlyeqAURFmGac16xezAG++vY0WSGk0d/BnoLftZRNturkuu4cHvmv5J3iDE93yAaVfeTiMtTOl2AeOjgRPJndNxqopo/yBtQ5XmSlrs8eGWYvAxXKX9YohMZ5f1D3qYUDuHwnCm+d1cZvPmoMYkUUV4+vFMvzuBFOl6p4Qs2IPiI6usAuGqUA0ImHYl67kGvdXjP02MbmB9KEuSdlXPzbZ4/c2QhUlZQ3h5DxBGIy5w/iKqGNGDy98oGw8viAQZpmww+dE5Fbf6FryWafrDUHui2EtFzDOBB5ZZRIIU3zVipO/w0oWA4lFijCJdv/RDc1fCV1qKSUDqcytWK2adExd8/u2Hry2rWkUJKOh1nOgFDCcXWUik9zkuco8EFmrz0FP09Q2LWyWkG7OHvtiRJPInA66J0DTxcCwnnSgerAU0Kk1PncXBPKkn8zpsUCxDVqk6A5q24qJzGMDHYHn3+JvGLzarPkviPt0WLAuhngrVvmI7FKE5UE7oMo6xNiAGbQKtnSoIKcEDkDXz7K9qaLYSDy9Z2+NwOg/LICsMMlIspVucsAtdqvYkgTYVviqNInJb/WCum6hcFRo2QFgD6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKmrfjKu13EwsLkp8f7yo2RkSgUfSatyh5UrErlPsz/MdMJRsuKNiVgPCKg7?=
 =?us-ascii?Q?Dcc4lSL9AtEujtYYL5ShaHQAFDsp097RH377EwaE+VPIpAz2+OITgLsa6aRq?=
 =?us-ascii?Q?VzMN4IEv811ojsbAHugE9Bj+xtKJqun022ATrBgjRE2gMolbOSIONBfEhbmt?=
 =?us-ascii?Q?b1GQ2eltETg1ZSAfuU/H+3aGxyJWP+5nBtwdKkIhcYLd3keWgnv7VKjbkrb8?=
 =?us-ascii?Q?FRNGZ6sUaACY1GF61yzM4+NcVJ7krPjjtyPMJfzetf630TzudAg0DioXQF/w?=
 =?us-ascii?Q?weTGKAlZqoqqv5xstfxKwT0tMUX1P9vK9j93lrvhvCHY3P+2mQ5IzLvcKnnS?=
 =?us-ascii?Q?mbaOG2teQXAtMok8lqOHFc+82lQuit47t6g5FbOWmkTJs64aNmNRIwkWGoe0?=
 =?us-ascii?Q?4rJpLWrpundZUwmbRTVO8DlXh14YUEJ5MuxBL0GU23L/4o9vsTYaLiIKr8el?=
 =?us-ascii?Q?yd2iqjqW0AlCqNtSN7DzncU4Q4rQH/Sc5+iXTw+psH0oAoEhYWaZQrD/o3w3?=
 =?us-ascii?Q?Ab+lpi0iKxQyrPCGdy9GItKfLKIaGfapirA4yphiOLm0MKtwpHELwkB6t9ne?=
 =?us-ascii?Q?m/+FHqvr6bd6o3OuOCy6wHRE7CJp4Tu/vTl8ZsZNYipPhwHopmNVSWkIpQfM?=
 =?us-ascii?Q?RP5NisL/qlaRs44CGUAD7D9eUh/2x18IUnxX96HNm5ax6QsVsrF9wQ5Ydbf7?=
 =?us-ascii?Q?asCRYB3LgrQsiqVWGGNPeELckyp4JtygBMVrXKpTpUGSCvxSXJ1wF15YFvMq?=
 =?us-ascii?Q?y2Ancabu+02JxnjxaMBvB4MMdFyizwB/6qjmQ29pxWH/awzE1x64zK2K/HW0?=
 =?us-ascii?Q?yPPIEsPVcxxNgiCLzHNs6YuznkxhuF3hiNU+Qpkmbhy24D+MAj3fY/TfV5Ia?=
 =?us-ascii?Q?SQYh7D98R0jj8BG9Ji0VExI4+Jmw0p93VUGVWpvZ6sX0/K6JrQz3ZODOqhsl?=
 =?us-ascii?Q?lC6xPmzQ1mxHKfgbQMdxts/0gbDVwDlGfu1+6Ii755CrSg233PUS+bzR3v5w?=
 =?us-ascii?Q?S3EhlcDn25Y5+ds7s5GhYx/J1FUyMi5uqWqN5NRPzG1m8KA148JQe4lmXYh2?=
 =?us-ascii?Q?lBAFSIJD3Pi6b5P3cRpdVI0Ma5ze7jyi8N31NAqx5bHN5AXit7MY3QMtvkVp?=
 =?us-ascii?Q?TPKf0vH/SBKaZUaojZhiG6MNXbSWY9wm0JDU4cpGHNkxMqn3eN8eXiF/+NAb?=
 =?us-ascii?Q?7sWNLsMoIkzvcnKBxILlc+wwOx2eshB6EdAyFSaqxwPjWwajGDUqg0+a/ZVi?=
 =?us-ascii?Q?y39YkPYVWcVhhRFIyYesXz3fW9Kk/X/44Fi8j8hNZprDA42Eu6ezE1e8cptr?=
 =?us-ascii?Q?6e094P46ClV8T3D52/+2hF4IUCaLFFR6nt46jzJaL3hMd8i2IefimF51rbWG?=
 =?us-ascii?Q?QfUP0LVanbuSkUJcFpIaNy/fvE9r/qUjtkUuADszK7HBjbITacDJdk5RWrWl?=
 =?us-ascii?Q?8nfFzJDycYIQfLxBzw/LdoOBWdw0mF78BZaiBx00qyx0+ai98mr6DA8NTmL5?=
 =?us-ascii?Q?/FfgxGu/JoaQW8BeK75fOJgesDBehMtMy90VVRGyPGO53rU3O544nHDNm8g3?=
 =?us-ascii?Q?JcwBsJhzI9f6sYS4y8JLn2u1J3rSHrFVfvL0T3VXn/4oST2zTCj5EAaAwFWf?=
 =?us-ascii?Q?sF447sN60TKxOSsoAk8DPu4tHpOilEVSOLGF98zNrOhQ6c89pbBKnwRcKpEQ?=
 =?us-ascii?Q?cpjnhyAz9jU8PlMw77kl1oBXbVaqgRWvr5E+L2ogE3Luw+F95jc7hkCgIwo1?=
 =?us-ascii?Q?rUpNvUmaqw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 440947d7-3368-4f70-40c6-08df360086a2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 21:06:39.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfONTknRCYHSNj0i2noF7QSfPP5s6B5kPC8G3dL/Mq3B6Z8fkQT76u436O4xDFvFKrdORKUCelwSQHAKGElicNVrfUd96THCJNZ1KnWDZGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 21:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248972
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
