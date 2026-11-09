Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6122.1794231660299882387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Db6PUPwb;
 spf=pass (domain: est.tech, ip: 52.101.69.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvbtgCvwrhEX5WQ7xVVhsgQESrupJrhw9rWn1Dv/kJB0roOHW21pqmATh1zuerelzBB9lnQQB540/aOSFV3LtlQfWEl3JFpHOCDa/trlZuvWFeLw0jjOgPWEwEfS9Y+AgJFLEQ79xj1N0S6vVNb8epC9WW4Ec5sm4ESFvYiV5i8JLrIAbmG0HTIarGzpuLZAS4U8EWFXjWqXfnP2vzLD6IGPCabauG5KsnlWHi9L6vjQ+vL5bftwMoIpXNEgtxAJWOC5VMuuyMxt4Nvz7ClExAa29S45IPU1SWc4qxYdS6UFuhOxbyuV1bcj6wd9dhrFDberHQpc8ng1w1joEIAmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D1p2Sf131//hRgBhrzP5/HKXrFcU/kCNRQlh2vH0RI=;
 b=Q7GgtrhB936gv4gh1QM81cvqd0xrSOfDf5oTdU0RhLsvfxnA9ZBgvCLfz86CvjEdZULXuSU5ADehi9oKPAAMWAUhxfIiZmr41r5R/++I/cStbpkqyTo+Yb3d8zNFfzu7PkZAohp6BWG0kqdFA4m6MGPbsjQjWTAlzLb6Vqk0PGbSk2O6iTVoKmFBlJ9uuQte964gB7S7TlJEgR8j1zJF4wobL12JPxH+kXPNZbXd86Xgiz4paZatS5yPvNw1wdCzdzP2IB2lyaFhIft8TDMEIJyPRR+NRYMfCocPAr61rTRYxpy8aqCHJ+BUWCIZQ3BvrswY5wRVA0+yNGfEbWjBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D1p2Sf131//hRgBhrzP5/HKXrFcU/kCNRQlh2vH0RI=;
 b=Db6PUPwb1Rvu6E10nQLiPSXCsuH8UKjcO+Y+JbXaIpnMm8VqvigNruNLbaILSJY+Ku2+plYCl4YOoJboR+ItevHhp6yeyYgJt/9mr089pu9++yl2K1qlds8hL9L05sXXkhey8jRESyEpTR4CT2tFPrElazJhHwn35G3/RZLsU1/UBGM3Vnu4kUpPj8NKxCRD0KjbKLYNYYgtTQumJcT8v6blymHlxKpeT3yyCdTC5858izBGge79IxO3Nva1ywJd1UbMANgHdI6t3wi49pJCIzJBt9La+ju6Sbt3e+3m8ZFs36TfKHxPYmqDTyFY01insEpltCvpt3xIvdS75P/Sxg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:56 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/21] gstreamer1.0-plugins-bad: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:25 +0100
Message-ID: <20261109134034.74458-13-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f50dd1-beee-4381-2096-08df3e6714d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: xyhqbPzMncAYqRFTYhWiob2bzICScYwVWQvBFjCaoKAEbr1D34PI03FTiX9OrG/8g0jh2UyjHM0Zo41p03pyxTwN9t0WZ0N2dpVxYD1JpczeEOCcS7o+mfgOE6c3XPfVc2OWo1xhDjaZUH+j5fdvHIL3VhvfE+q8NnjcMQIo45tNRQ3vG3YSNLCK0gKusgIUZ8RYamgRzxgvNNACHnWZjoiNESSe0ZhBJJ/HDrVwMh1QjX5EylJxze9zCe1DaOesHYkJ208eoawZBP/6LiaEiGUiLgdq88ZZwxO13ldTEqqD2mxiYT5TGJ/x5Q4mGuwjFDwQu8/jOvd0ibMQudGnKwGMEXL/Pv9ksbYeG37nGEDLKxFJdpNelVEcGVU70egVjmB2/mzdX+F3/fh7/CVHiZYwTPuOpzDtagyxBGRbCNnMRBUtqCT1dY1Rw27Qzl1rGvPc3vgkzfKrBjLvpGPEPZwSBA4GNWkdDt/4Wje8fUufQBWeFIc1pJHcg9YT06h6NBeXPgGLUhDuk8c3wvNV7AA8vEK/sHokgSc1nmg6iZY35TIRZPjAsU45DNq5T87fVAcPKAO7ZGCTyawkp8nbPvXs+4VAb21l0lEoJhXw+20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8nfqovqAiSgya5Bg3MjNJu7B7LkQpy+QaAgZeYsbN9JGKFSMldZYPFUmL5ye?=
 =?us-ascii?Q?isLwP2jr30kMOR6x9IsiUwTFgMjQPcJO0F0qLZMAEncEmkfrEvtkU+Fjs0m9?=
 =?us-ascii?Q?ngKTRK5QjwBQocip1QlwBgeN5UOjA/l0BFkIuYuP5AC5U+6WIM0nfIx/txhP?=
 =?us-ascii?Q?wPYkuUDHWDTZBxEqg8gdxnHhR0gj6dB0AKu7mE46iGfv1yY3+roUdSdCSzUJ?=
 =?us-ascii?Q?IE8Ea1Jhy2FmBlBMRl19sK4ZjHxgG+caiuccwRwFsikCbatF+c0xxXzHZmUh?=
 =?us-ascii?Q?E4AZ9JC8nvl6FYubaqMd6HiXfdLXvs+2cHUN2K+TOwvMlY7zhhpo5G/Xxqci?=
 =?us-ascii?Q?Kc+pbcptLmRaqFGOTghs1nGHP9pIikHSNRN7js3R3qLoNzUx6C4DyEV/kfC6?=
 =?us-ascii?Q?GP0Nv73i+LFtZDBxdjf7uOBJVSjk9WYbmiBjO4xRLuC6BJQwT5CYSZeFS+4b?=
 =?us-ascii?Q?ilK09i/xOd14/w8xuSpmNQTQ9hage7Eaatq2sw0vxAwmv8G5oJCKUHDXsEA6?=
 =?us-ascii?Q?qU2K/k3elKTe96QkOJLNNMsMFyctcrGL63AB19nHfJUmSehZCiZPTc963RtQ?=
 =?us-ascii?Q?oW778lX5wlym/EsM16SFxd6IhDqm82MN0Lr0gKhYVZiw6/RBe1rmpEd4xyTu?=
 =?us-ascii?Q?obAk9QtJTxfFGNEwSlkdlwQU5rY/rRH3Gu7B1E29lGTiDzm77ZXuKfIYrvgX?=
 =?us-ascii?Q?LlzYiyv4xj4UleArxAtzDTUHWDB2uQjtVBxzD/1k8792OxI8QstBjJVdADB7?=
 =?us-ascii?Q?3yLvDLcOhO/lYuUMqjb6Jl2IbtwzI0TfQhbyvt89acBj/UiOqhwNlILntDb0?=
 =?us-ascii?Q?lvx5/p6K1mnVAfT6l3NQJE+BiG47OzQtaBILbHUDgjMrEQPHQ0RKLHwGiHEA?=
 =?us-ascii?Q?kf0bc5+SZZJqZoCNLkD3d9JYW/FuvpS7ftE6XfdE9SxRf19LUAS4xf4ddHWU?=
 =?us-ascii?Q?qD3B2/5U8fhr/dwH7W0aLErXAGpgrvn5Khwzi/dQVlgLB45x0skFyGOdbXFG?=
 =?us-ascii?Q?lPGStSvY1KTgmblEB0vr54uwEg36sx0xwHsEGUdlifH8MxWZBWKQIGGtPxT2?=
 =?us-ascii?Q?x+NDVW7dP01pyZ5jLvLIca0hOU7pBOQUfXxR+CBXlJcSeyZiqBBpryeX1I9x?=
 =?us-ascii?Q?ZM4jrwvgqltSRZMPvr0ZuVJKUEvXhEB48VVb2LuhBQYt58dzp7e841X/8bEK?=
 =?us-ascii?Q?Vr/jboutzBjq0zu1jBXn1KPTu+o3kbYfjwdxM/NvEo9Vnbg+Mbfx7njOaEGL?=
 =?us-ascii?Q?ScgNQWxK7utAAzsh6OWFML7/EZBwyMwD1qEiUo7/sSt8psfAMRdtGRw9Ca2F?=
 =?us-ascii?Q?T5HTEfU3UQQlaZpSuVhElKC+CnBbz6pxiWm8QtZksweqlDvfPAajwQRXRzO/?=
 =?us-ascii?Q?GFwI0HCf23xWjiTX2myuSdqaqsYvVX4iTphlEPyGaR4PbhFFOfSS5Qs8W+0V?=
 =?us-ascii?Q?vy+Tz5uRFckOuHl0sj0C0ffV1stuA5NZPhd55SeAsvkUhnoKor7agt0PLJ3d?=
 =?us-ascii?Q?jZsrra8mI0wvK7rNPSkjeUnPwvsNa85M2MfEumzp2fSZj9loXpmYQwyvqFzt?=
 =?us-ascii?Q?MlnWNW5lgGw98BEOzlifC2ULYEo2q+5Z2XoM4sHWdeCHAoKcmMNu8YSG8ofE?=
 =?us-ascii?Q?WZ5GScDbZyfTXSbnfPwziOacBPIVPL5gJw719NVM33Oko+flB+aFaDznbAI1?=
 =?us-ascii?Q?Wnljeet3MXvFhN/dZ96zGShl7a9RqpOSfj/HCfLEm3SnvTAGyv3DmbkfWYsQ?=
 =?us-ascii?Q?tboeXdlUxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f50dd1-beee-4381-2096-08df3e6714d7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:56.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb5MLgGAaCMInkygcR5/hjTeVdQSDDDJDASqoxEqyrm60shme7uLoxdXiPx9pa1IHo8ZnfZsdxyT46cXmfnGYWU1FYyL7M/JoFnunokgdRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249817
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9
- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...x-maybe-uninitialized-warnings-when-compiling-with.patch | 6 +++---
 .../0002-avoid-including-sys-poll.h-directly.patch          | 2 +-
 ...encv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...yland-handle-padded-buffers-in-wl_shm-buffer-creat.patch | 2 +-
 ...ins-bad_1.28.8.bb =3D> gstreamer1.0-plugins-bad_1.28.9.bb} | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.8.=
bb =3D> gstreamer1.0-plugins-bad_1.28.9.bb} (99%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
1-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized=
-warnings-when-compiling-with.patch
index 92749fa1aa9..8d794995e97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-m=
aybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-m=
aybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 8dca97000e03e05b1bab63aa0bfd9df58dfc25af Mon Sep 17 00:00:00 2001
+From 47361b23b7e1add34cd53993654c686b332768a4 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,10 +11,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codec=
parsers/gstvc1parser.c
-index d91cc3f..c9058cd 100644
+index 30f5818..764dca3 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
-@@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, g=
size size,
+@@ -1746,7 +1746,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, g=
size size,
      GstVC1SeqLayer * seqlayer)
  {
    guint32 tmp;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
2-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patc=
h
index 897898e68b4..674ac87f034 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid=
-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid=
-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 1bc330b8c29888178d736b13744f004072be7558 Mon Sep 17 00:00:00 2001
+From b3bc02f6f6d6dfc4623f9065acdaae729363f9d2 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-=
opencv-data-dir-in-yocto-buil.patch
index 85da6c5161d..00673f82d5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From c867736716d52af0d27a540e51426ccd4b4576cf Mon Sep 17 00:00:00 2001
+From dca05b750039f9b80083d4bfc0dd2f379bfaa51e Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
5-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-b=
uffers-in-wl_shm-buffer-creat.patch
index 1aa6ffa5d75..f90cf549232 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayla=
nd-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayla=
nd-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From 05a5f586e0b216ad11bf1b37ed3d5f6633798d61 Mon Sep 17 00:00:00 2001
+From c83922f6cd39bee9bba2c1a54e478e36f05d8dd0 Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.=
bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28=
.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9=
.bb
index 614cc057c26..493acacb269 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-bui=
l.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-crea=
t.patch \
            "
-SRC_URI[sha256sum] =3D "670d888bde8242579b0d8e91f60cf337aa7be20ca7c315ebfb=
dd6e5a9218d104"
+SRC_URI[sha256sum] =3D "4a4e0b7bf84f868378c48f143a7ac3a98923b488a5b74f1a35=
ba46bc3c43f6b1"
=20
 S =3D "${UNPACKDIR}/gst-plugins-bad-${PV}"
=20
