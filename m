Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14290.1795701412551658694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=esYayKh1;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQOYueU+Qs1wqXI0P3pl1N9c5WS54UUCc//A/UqoKU5pnj2j5kLZuet1hibtfB7+1LGRCt+2/XwDQuWx8Kxsf7kn5qYwbg0wef8GqvQByXBCUyl4oJGA82SJzJ3TdP34I99YnL40JklwCnMaTl2ebERPRCAk7Ea4bD/FMxacVLIDW8TR/AxNeuikDBa9TU5AqfGyaOVv/jCUbdSK25sOiG0TbSeXQm0/50ewMj+09hL2s9aRt13T3wlF6xU2L4YmzTY0EsRAi4lU9bL0eDSk+yvTKjuaOudNBGo1OQdN2PJK2T7yByFZ8rh2x3WPhu5DyzQ3Q9Ccw/xl3J5jVE0TJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBVvB72q1l4aiK1C6MXMByvjiY414h077nphFeRxD+s=;
 b=nzqhJ27zg57NwvwmSLlAsTnFyC0mxlA43S4oO2YLpS0r4DLwE1k0tA/FKiSXY+Yt0jFBgLlLobPlJ64EqlMdplGy3z0CvdZX110A+RBdOPtUxZ/xm55+f4pe1kAtjhC+RSEnVNs3hOfJbjDdLI1e61MCJ61emcZDZ665OJ/M+rHyboTwtqbJPqX4tuO+A2jXovkYWJ9D+d5Ki3vxeZWl/GRBLrp2shYOAWsC5yNiG8OxgAXvbT5snWkef49ImgoMQMriH+rmclaMb3anIryY1aOa3UKIpYa14TKEtqo1clvURfAKvi21lxnfvfJTjCDZvQXBo6iyCs5Pbtn0rCW0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBVvB72q1l4aiK1C6MXMByvjiY414h077nphFeRxD+s=;
 b=esYayKh1QG9hFNfYeRrdH3DPOCOSz5BepwAxKInp21ePbwT2Qcy3t1YJHQLeGZz4P/ef9wNxtZHWV0K5+CKFkq0aT0peAD5Wq206TlbuUtPUBfcPySOWlO42EnoRs2b8do/Vo9N0rZ+9r81S2dB7pxX7Ldq4eZtjGn0Jxo8ihJDeMEF8Tc70ks+MXxY5/sFNqEhA4SAaJDIhunuL5StlR4Ne5j6p6ukF6flQM9qBoXgVj0DhL7fyTFdnpS6AdSkSwHkOqeZYmyzWK5mhuW+hvZxfpN6315FayEWpfIsKA22Mw7qipln2fDwBiIHmXcCD8fKHzziJ7VWYuEZwbWnLLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB1107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:56:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:56:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] glib-2.0-initial,glib-2.0: upgrade 2.90.0 -> 2.90.1
Date: Thu, 26 Nov 2026 14:56:45 +0100
Message-ID: <20261126135646.90796-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
References: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB1107:EE_
X-MS-Office365-Filtering-Correlation-Id: 828f9a93-95f2-4571-b4e4-08df4bc51f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|260925021911599003|260925022911599003|260925021311599003|56012099006|261021121427099003|261021123027099003|261021135927099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261009221227099003|261009220027099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: uPRHWtF7h+LqqLQDFPeQFZA2BDUBLET18XFWHtpjOSq1A/A+UiYeOBZHtfY25gF5DCsxohKSyQvNGbjsC5hu/Yy7DVipd2+P9ZUkEHWbvhes0wuo2itrheEkXiIPKfywy1EswiPjKJc3qMBSMnGRH1RI/AqD3E/pV7DdSVQqBbB/IUx8X+KH/Yoicz1eQKEbC+pxeifBFxPGANAK+xrzipw5b3MFo83Xm+z49KNh8zjeJgv0VoiVtFvBNTpJqKHOpRMFWZC4pR1gbJ00RhdL2VutvXcQKZ99XTLT/6wWz7gMlS+AAXOZN7Aim2yJ0W1MdmkmhIOuQiO6okk97Uvtj6JQpdpPqjNoU5f6qgeGoD7v96BXmS24EqU5kRp5bxP7Fb+uadOCkypKe26+NQ6SylSUAdcgpbKVMVsnk8A9CUlsQ0nQ/8m6gXNsAngJX7BPkETgPDpfdsfeWIQ1zswP03bDyP+8FiHSxaEWurzFc4DVEOlC35EgJi/4YsS6zr11JYF7k3Nx9H/70XgUEzVJ+2jO8I8gPFp+lq6cjqq1B1i1g+wJ5PrHnu56YEAjui08MpG/GwQ8ex5My+IQ/+tFHg3p+z1dgtJqREZfZpGfsyxZpIKqEUm8JITTnc0BaV3k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261021121427099003)(261021123027099003)(261021135927099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NiJHtnN3ApPS1b3F0HLGViehGTvcJx5VjXf/l2i/7LqMAnjLZfzp/2d8d525?=
 =?us-ascii?Q?AGdkiyrN7NLjbjZ55O4BzlKpIYd3+62zCom32F9ZNjpA0U6s2nmB+32KxAaE?=
 =?us-ascii?Q?v9bVpz+2bbS2TwICC/lkDm1gZzOtluKHS4RGr94DasGq7689Wyov5i478OMx?=
 =?us-ascii?Q?amm2dmrEzMJWVQsUpsWRFqLD22eJ1Yx+bJiKve4ztNL+JgyghAHTsy18nayz?=
 =?us-ascii?Q?aJQwfIOiN1ZKW04FuNlShkgzcoIG0mf3tv6tOv4SXbm94M/5BjfVn81rD6dG?=
 =?us-ascii?Q?aOSfouvKxUPOzV+S3nhSXHUejFM/IL7TiQabpzejfCIVDYQTNmsqTcDcr7Q/?=
 =?us-ascii?Q?oPSX8nB6izAma1zGRfhjZeEQ5sLKOnt+k5D9YpLa1Q1pu6CXE665XV8QHS/Q?=
 =?us-ascii?Q?GnR2z/tcWDkI/GT4gFzKGVe1vhHrJYfOUpFc/jDm4SAiVl7KHr1LXCLb5vqb?=
 =?us-ascii?Q?SqwjqBQ1wvURAW8C6pTi5DYV+Lv+SpOALV+Nk+ck1nXRbwv3zpov9kyVakVe?=
 =?us-ascii?Q?RSNQpp+G4h395WGz+tB4AiZM9WpVaCQpK9io2EkHAFQWD03/zzCrWgFsHiQB?=
 =?us-ascii?Q?Rp0Pajzo4pleYz0opWfi8M4W72E7dmXj6wGyVn447J3lGQ+Te85u1cI4HMCB?=
 =?us-ascii?Q?D00lAZWGx461DNG/x9Dj3V0GejG8K7cs5bGfVGPQrMqaUh2XdDaiWcQIubf1?=
 =?us-ascii?Q?Wy5EEQGbW5RvBgd6tRrioh70Q3482M3f1BFU/iJe6T2xniN38UyADYplOKrL?=
 =?us-ascii?Q?YywZTBoJIS4UYEDZdc+r3E+jEzpgDBgsIV4EAtA/X0x61IgJbSsgHExhGDvX?=
 =?us-ascii?Q?UCoQwhgmDi/CBXk8BQ3zG4zToGElapheWVA37pFvU/YtbWLNvvSNsx4IRhF4?=
 =?us-ascii?Q?uCDi+uouFPeut35UdY07Nm2zy5ogvv/YZgbAEsP0tHKKBitgiOSQW305ZpQ+?=
 =?us-ascii?Q?Gsnhw6hCfyPWsjehjKGgR5vsK/YrvlpSAkJxV/vNYD/jCwckxllFQnhk2+5n?=
 =?us-ascii?Q?uRGB8oxB0ftfClCR7whCGiFQsDrurmzQad4Qeb0st9x3VbawrPU4n8B+X5gc?=
 =?us-ascii?Q?Rsp5VR98tglnXbjg70jmX3qwtI0IGrTDW+qznKwcrOf2jTQEF++wCc7E1k4m?=
 =?us-ascii?Q?ppTGMIMS/lEpuNv4rElhmGYVM8uwjhdluwdajVfM+mE6OfrxpQLL1grAD0y8?=
 =?us-ascii?Q?UVDlw76KhqwvEBoi8sO0dei5hi8hO5MGN0vM3tJH1GLkCqs75Uno9IsZd9h0?=
 =?us-ascii?Q?/X4U77DRRuLU0OqVh/DPtZWgtPmMqI7/fRw2057RGSnfWhRn7/sv/gTW6Yab?=
 =?us-ascii?Q?hvHBFusS250DcYIhztRJhzy3qKNQ6rdP6CoV10ourJ4yPt5PXlpEL9bZG/8V?=
 =?us-ascii?Q?DE65r7ugav+8PneZSyO3ww+0FXLca2u+0/8lxDd1yYxebXElivtA2rNzNNWq?=
 =?us-ascii?Q?JXu4Lb5CSk7Z3POq9wstVzY4Rtv9PLjKS0kJ3PegS7yvT4hhD0w5phT7CLg5?=
 =?us-ascii?Q?mA71g2ROEhVID1e2jIDE/oZdkXKII72UzgQ0Fndio7bUMrfXzKduI0pzSSzQ?=
 =?us-ascii?Q?nT4vnvUZPE9xdEQrgifTWqGMzE9e8vbfraHG6RWgOmRAhORcKZLD+d2w9jJo?=
 =?us-ascii?Q?78WgqyUKXze5jLL4H/krA2ckCXYTJOYHfaAefGL6rVidHDKArZ0GeGihii4O?=
 =?us-ascii?Q?RlsNJKxnXhVMBRfEHx4WviZZ9pj5WTkpADkqLZLTdBjqvcEj8lExzuIe1EWV?=
 =?us-ascii?Q?t8ke+Yu6qQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 828f9a93-95f2-4571-b4e4-08df4bc51f28
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:56:51.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SgzU6NtzfF0EWtFI7bFWINTTLUF6caezMpyahv9tUkvZgURvV5IZr5Zq4qL9WImFq9x0101ngjBkogVSRGXh7lgLrJ7vp8hkurrkpIHKtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251305
Content-Type: text/plain; charset="utf-8"

Release Notes: https://gitlab.gnome.org/GNOME/glib/-/releases/2.90.1

Add 0001-girepository-Only-prepend-library-path-for-g-ir-scann.patch:
2.90.1 prepends built libraries to LD_LIBRARY_PATH for
g-ir-scanner, which breaks cross builds with:

    ImportError: /lib/x86_64-linux-gnu/libmount.so.1: version `MOUNT_2_40'
    not found (required by .../build/gio/libgio-2.0.so.0)

Reported upstream [1], fix submitted [2].

ptest summary:
SUMMARY: total=3D309; passed=3D308; skipped=3D1; failed=3D0; user=3D171.8s;=
 system=3D92.5s; maxrss=3D225724

[1] https://gitlab.gnome.org/GNOME/glib/-/work_items/4068
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5553

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...t-write-bindir-into-pkg-config-files.patch |  6 +--
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  6 +--
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  6 +--
 ...-prepend-library-path-for-g-ir-scann.patch | 50 +++++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  6 +--
 ...ot-enable-pidfd-features-on-native-g.patch |  6 +--
 ...dcode-python-path-into-various-tools.patch |  4 +-
 .../glib-2.0/files/relocate-modules.patch     |  6 +--
 .../files/skip-monotonic-time-similar.patch   |  6 +--
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.90.0.bb =3D> glib-2.0-initial_2.90.1.bb} |  0
 ...{glib-2.0_2.90.0.bb =3D> glib-2.0_2.90.1.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 15 files changed, 78 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-girepository-Only=
-prepend-library-path-for-g-ir-scann.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.90.0.bb =3D> glib-2.=
0-initial_2.90.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.90.0.bb =3D> glib-2.0_2.90.1=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index 41b2dfb5c4..8044ab17c9 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 2ccf2016cae7dad83cbc3f00e3fefa3ca16ae707 Mon Sep 17 00:00:00 2001
+From 4b5c716146a03001c0006731f974e578672aeb44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  2 files changed, 13 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index f9aa0c8..48ff2a5 100644
+index a158823..e3ce982 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -934,17 +934,18 @@ libgio_dep =3D declare_dependency(link_with : libgio=
,
+@@ -938,17 +938,18 @@ libgio_dep =3D declare_dependency(link_with : libgio=
,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index 2b1a2134c8..a442f74064 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From 8ec44223e9cdedc4ca5b0c2b806c02c215f07b45 Mon Sep 17 00:00:00 2001
+From f44ed0ae64f68713601ec0938c06fbb9f2b53101 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index 6968f725ed..a429e87e6a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From e18fd4c362b3e23ec10ac1c223ad9c5ee6b5993a Mon Sep 17 00:00:00 2001
+From 952e8c37edf7dd8005b2131701816e95c8ff2f3a Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index a3e6f18..f9aa0c8 100644
+index 7adfd0e..a158823 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1066,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+@@ -1070,7 +1070,7 @@ executable('gresource', 'gresource-tool.c',
 =20
  gio_querymodules =3D executable('gio-querymodules', 'gio-querymodules.c',=
 'giomodule-priv.c',
    install : true,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 022094bb17..0037094875 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From b920bbb775210dc81fff3e12260ee0cd9d4e6ef1 Mon Sep 17 00:00:00 2001
+From 57d827fcba6a97423d977b2df38d51187137b83a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 402859149a..52caedbdf7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From d15b734a85ff94c8b80ccb1ad22154741140152e Mon Sep 17 00:00:00 2001
+From 9f365868765590f37262e56719c692bc9f4b0808 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/tests/resources.c b/gio/tests/resources.c
-index ee9cee4..ff844c1 100644
+index decf921..4d5a466 100644
 --- a/gio/tests/resources.c
 +++ b/gio/tests/resources.c
-@@ -1196,7 +1196,7 @@ main (int   argc,
+@@ -1245,7 +1245,7 @@ main (int   argc,
    g_test_add_func ("/resource/automatic", test_resource_automatic);
    /* This only uses automatic resources too, so it tests the constructors=
 and destructors */
    g_test_add_func ("/resource/module", test_resource_module);
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-Only-prepen=
d-library-path-for-g-ir-scann.patch b/meta/recipes-core/glib-2.0/files/0001=
-girepository-Only-prepend-library-path-for-g-ir-scann.patch
new file mode 100644
index 0000000000..bc17de7c2a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-Only-prepend-libra=
ry-path-for-g-ir-scann.patch
@@ -0,0 +1,50 @@
+From dfed9685123057188acba0cf45d213b5e3616683 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 26 Nov 2026 10:06:40 +0000
+Subject: [PATCH] girepository: Only prepend library path for g-ir-scanner =
when
+ native
+
+g-ir-scanner runs on the build machine. When cross compiling, the
+libraries we just built are for the host machine, but share a soname
+with the build machine's, so the scanner's Python loads them instead
+and fails, for example:
+
+  ImportError: /lib/x86_64-linux-gnu/libmount.so.1: version `MOUNT_2_40'
+  not found (required by .../build/gio/libgio-2.0.so.0)
+
+Only set the library path for native builds.
+
+The native failure reported in the same issue is a Meson bug
+(mesonbuild/meson#16382) and is fixed there.
+
+Closes #4068
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/work_ite=
ms/4068]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ girepository/introspection/meson.build | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/girepository/introspection/meson.build b/girepository/introsp=
ection/meson.build
+index 4dc44aefa..3c1ab055a 100644
+--- a/girepository/introspection/meson.build
++++ b/girepository/introspection/meson.build
+@@ -22,9 +22,15 @@ gi_gen_env_variables =3D environment()
+ # Use currently built libraries to run g-ir-scanner and the various tools
+ # this may not happen if we don't set the library paths.
+ # FIXME: https://github.com/mesonbuild/meson/issues/16127
+-gi_gen_env_variables.prepend(glib_exec_var_library_path,
+-  fs.parent(libglib.full_path()), fs.parent(libgobject.full_path()),
+-  fs.parent(libgmodule.full_path()), fs.parent(libgio.full_path()))
++#
++# g-ir-scanner runs on the build machine, so when cross compiling the bui=
lt
++# libraries are for the wrong machine and must not be loaded by it.
++# See https://gitlab.gnome.org/GNOME/glib/-/issues/4068
++if not meson.is_cross_build()
++  gi_gen_env_variables.prepend(glib_exec_var_library_path,
++    fs.parent(libglib.full_path()), fs.parent(libgobject.full_path()),
++    fs.parent(libgmodule.full_path()), fs.parent(libgio.full_path()))
++endif
+=20
+ if 'address' in glib_sanitizers
+   gi_gen_env_variables.append('ASAN_OPTIONS',
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index bbb85c2355..49e32636e8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From ebb658f1387978e88eee317920c15fae59d11ba1 Mon Sep 17 00:00:00 2001
+From 5ae1bdd68b20143616e6b7db695562a1932a390d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 22ed181..87497b7 100644
+index efa7e89..00a12b6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2100,7 +2100,7 @@ atomicdefine =3D '''
+@@ -2101,7 +2101,7 @@ atomicdefine =3D '''
  # We know that we can always use real ("lock free") atomic operations wit=
h MSVC
  if cc.get_id() =3D=3D 'msvc' or cc.get_id() =3D=3D 'clang-cl' or cc.links=
(atomictest, name : 'atomic ops')
    have_atomic_lock_free =3D true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index abf45bd809..996d69f123 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From b4b512340934801a004b69d37c83846ca63afc34 Mon Sep 17 00:00:00 2001
+From 4db29a5bb384187ba438973f37783633eb6cf435 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 87497b7..6955b02 100644
+index 00a12b6..6c74707 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1095,7 +1095,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index 3ad5ab3f6d..d31bacce62 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From dedb9b25edc15c63c4068b87fb6ae2e205ab30da Mon Sep 17 00:00:00 2001
+From e0d4d304b62ea179fed8f9457ed5ff3f04fefd33 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -32,7 +32,7 @@ index 0578b74..56e8e2e 100755
  # pylint: disable=3Dtoo-many-lines, missing-docstring, invalid-name
 =20
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index f388714..37ed491 100755
+index 1f5a35a..d29e9a8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index d5d97f3a4a..1dccd77f82 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From c41b9b46ab9ada1c3a3e0d63ef1a0535a3c92457 Mon Sep 17 00:00:00 2001
+From e60b5c7f8cad49d23d42aa383721d6ab8aa7794e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
@@ -21,10 +21,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 18 insertions(+)
=20
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 7311775..abc2c79 100644
+index 4d09fe5..0b693d6 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1312,6 +1312,24 @@ get_gio_module_dir (void)
+@@ -1313,6 +1313,24 @@ get_gio_module_dir (void)
        module_dir =3D get_gio_module_dir_darwin ();
  #else
        module_dir =3D g_strdup (GIO_MODULE_DIR);
diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
index 9cb03bc65c..5fca8d172e 100644
--- a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -1,4 +1,4 @@
-From f663a6986d82001cc6f60c3625c3dc532651dcb1 Mon Sep 17 00:00:00 2001
+From d5fb9817e496d2fcbffc5a8e34158d79ad3795e9 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
 Date: Wed, 5 Aug 2026 08:00:00 +0000
 Subject: [PATCH] Skip /monotonic-time-ns/similar test
@@ -19,10 +19,10 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 1 deletion(-)
=20
 diff --git a/glib/tests/monotonic-time.c b/glib/tests/monotonic-time.c
-index 04ff898..dae0533 100644
+index b3d869e..c758a88 100644
 --- a/glib/tests/monotonic-time.c
 +++ b/glib/tests/monotonic-time.c
-@@ -153,7 +153,6 @@ main (int argc, char *argv[])
+@@ -159,7 +159,6 @@ main (int argc, char *argv[])
    g_test_add_func ("/monotonic-time-ns/increasing", test_increasing_ns);
    g_test_add_func ("/monotonic-time/usleep", test_usleep);
    g_test_add_func ("/monotonic-time-ns/usleep", test_usleep_ns);
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 86e2883a27..06c0edbd17 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 8f34800e6f3ad201b3fd6f6b333f32c45b2df591 Mon Sep 17 00:00:00 2001
+From 2b11ed949e43bf6026e43c6048137a2f28f8a9f3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.90.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.90.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.90.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 5ac6386494..dda09c59b6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,12 +236,13 @@ SRC_URI +=3D "file://run-ptest \
            file://skip-timeout.patch \
            file://skip-monotonic-time-similar.patch \
            file://0001-tests-gdbus-server-auth-Create-the-long-path-inside=
-.patch \
+           file://0001-girepository-Only-prepend-library-path-for-g-ir-sca=
nn.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "17d15cac2af80a33271127408e0abc2748eb297c59=
5c2a26409e81e14e7d1b8f"
+SRC_URI[archive.sha256sum] =3D "93c941aa17d5eb1d53fe838365f29a8b4e539c222a=
256d974ec8f30fc413e396"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
