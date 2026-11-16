Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1794827832949193272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OeSNWSDL;
 spf=pass (domain: est.tech, ip: 52.101.83.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWWqJRuXVXTz4PlLiySJgMKWuUf3iYqCSGQQ4Wfas/2TMrPBva5S5ckJ533E6Yo/kBfJELe/Q/KCQzFVlDYWnGaB8En8gW0AywhYmhde6WeDh4f+nDhXqXgW7umPcAQ9rPZ92/WKK1d/gnI4tMda15dsDvMOYROFIR5zxgb/lDRKQEMTscBxJsZN6Uj8mP3XiiasGHE6U2RUxpnxSSmHztcCHHojvqCK/qMhA1IdpYBQNtLszNEdBa0069Lh8UG1YF0SUp9QpxMQS8T+V//0agQP/8bFonRn3m4dvdo4V+piYoOe7C4Pn5XCbbu44GFb+T+/3Q//wJvVV4thF3Ifvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdGNASJFKVf+pp/FhajP4mjfWKrrVzGCHsWhGSeAbM0=;
 b=iZMhXRW6BHwRMqCglQaK/CwB70ZPYdVuQfqdEbslEbMccMQbZ/ew7uxVE8uWDcXMgd97amBDsNd7KOJa6uKl9joW6DxURgo2EUQVrNr7uEoQKKGCWiqZOoEcZRKJNGHS5qVTNu0pzDP8Rg5//vQ3dau0G9rypu75ZeWdYg0/zJUthDjF71My7dRXquXXmIaMW6fTP1gInuIH7M2S3b/i1UQr0f3+3BaCObAzUYpqdGKuVmpdWQuNT6b8SWgDAvd1S4CccLeE3rv3+J+OEen1/TGdHy4VoUjAFvFCVypgkvpssmX0T/v90CTB1fks5XF7HknClIeIFVB/21jxVokNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdGNASJFKVf+pp/FhajP4mjfWKrrVzGCHsWhGSeAbM0=;
 b=OeSNWSDLDnn8hYKpy4eXbPg/MQe4ih9GpmVi67BgP7WTzyguSEkXunlBkE4OC0cZohwOB8o1Y6dQSbcYDHc8lYW3G5SMI3Q0GYOf/4DSAB3FWt6c4tYMMbgpdNFHkvJBMOhZITf07hcWkaXRqYhXsdKieDafCxeuis/huav49LYGTUiqTGQtGg3QkMiSsr0BiVOguZd5sQ4Q1k/dd7hO0D+DSqTrKggiogu65WYaGVdUtXUvfT+1exfsyuk7gRfdVEE02jsD0rjXw/b5fIw5RANgKVTxF5iB+mz6nXFyfzbVwkaKQBMKlcYmMl7+jlsC9lzomspR0swZ3viTJOYq4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAVP189MB2617.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:17:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] python3-uv-build: upgrade 0.13.7 -> 0.13.8
Date: Mon, 16 Nov 2026 12:16:55 +0100
Message-ID: <20261116111658.7745-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAVP189MB2617:EE_
X-MS-Office365-Filtering-Correlation-Id: b63a6344-9d98-4fea-843a-08df43d3293c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|261021130227099003|261021121427099003|261021135927099003|261021123027099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003|261021133027099003|261102123227099003|261009220027099003|261026140227099003|261022105027099003|261022113327099003|261022075727099003|261026121527099003|261022115727099003|261026135527099003|261028144727099003|261026130827099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: x1CyqqPothLK4x/9eiOFeaQp6fOI4HuJ/6bn30r0mrdAco1x4Djesd7vt8XtGc2nuGSjs5uVh3gs1KnRi40QfMDo6Q9/CZZDKlj8+ikysHXMV3pCQTLF7sbVfCfqCaWMiAucaj016zeId1xvl+TXcVYtR1DD/ZZOXiqb3rE+JrKL+7sx0fxVWBCVbqK7drrmHarHk7R2kvM2oUP2PmAbdb34uD+AAvNI5X1wqnCIePLekqOzugCFZbYkDgSRAnUyMzpK113ulimNALswAS0Ibl/HuDBd0N/rUTkeDwfhW0DCnjoQsRBVzvKWyIohYKJ97eZxyt3Yd9geCVyVF5p4GpnEnYtBlMf6ZDZllZAGwSkF/MmdLVrw7eeNPekRaeEhtHyZrFYg6FBzIzzp6MyRmhQw/mUcM3SYvxBRii8y42l0YusyQdqLsqJBOSMiIbBhS7VtQqtb1zrioYjbO3gsS79Px24TMEorv+cfgHf0cPHmmnnN8YBHiviqGhQIXx8uwoLb1hn23Ays6Y4X/0S+pjhCdadOcN/wce6nK9KqnIC/NRiIP6/Sb/JqUKeEZ2zU4ZnCpLXdRR9TonjAHoPThSJ71DhzLh6fG0HAz8LuCILS08Df4O60MyA5V2IxilxIQJ04H4a0yASV0hz30/n+2eKTtAjveX3cZWQ73WdhSkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(261021130227099003)(261021121427099003)(261021135927099003)(261021123027099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003)(261021133027099003)(261102123227099003)(261009220027099003)(261026140227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261026121527099003)(261022115727099003)(261026135527099003)(261028144727099003)(261026130827099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0gSdAC7JslXcuqS3VrXPieqL/MRnqO7v2FWnecjLwu+QxOKRc6MS0HMHMd9?=
 =?us-ascii?Q?q0lZjDEWA/ujlwxeAPE4PrlUXGQVjCNM5BMW2N2Ub1KJwiYJDxwgSDHTSS1z?=
 =?us-ascii?Q?r3mw7pnl6gIpkoYDvtKLoCkl6/VSxI78zFbSjpADLBmWNeiXlxb/hNn52JvO?=
 =?us-ascii?Q?NR2qOMJj8R51M9lH5Kk2qpRI2Z1Q+UeE+toGyQspd9xh1n9fS8H0FszX8HIC?=
 =?us-ascii?Q?Om5ww4PXjBYJ0/BA/LaaT8+Sp6njs7G/W3S5J9W5obJzTPoGVkkzC3g5mGxq?=
 =?us-ascii?Q?+qxnwoxmN/ZW2rkeVr/VCXYlPWKJ25J/lY8SK13N41Z7/egR6it5lPf5KMeB?=
 =?us-ascii?Q?fJCm0BjdUrsVZm4RWMyVOsNbOBJIE1rYS/IBXpXrt7CclPtnj89sCB5qYKaF?=
 =?us-ascii?Q?GoiQLVW2GPM5Mo1sY3DloBCQKpBpuiLK+89MB+TXtzqFtYWHMTL18RF5pv5X?=
 =?us-ascii?Q?VHAeVFtE6XK+eQxNaWSM4KYbgIE/mNZR/CHKtHuG7tDo9OVC47dMSBXeB6rK?=
 =?us-ascii?Q?crITuYJbGx14T0rTyKa8xev2zXCEQcTdbBZ5r18ibslAEPpRnAy3/IDaI2wo?=
 =?us-ascii?Q?1KTDGSNdluMbBxBnazJEYIp6k4L+bPrCKmsVNtF52zd43WBDO2edJlSRpzAm?=
 =?us-ascii?Q?ExZGiUlpDkqXjiOOSyO0TAlZb/fSpEEJoL7u1gApAUpvPxMhw0rFn8Cpt2TD?=
 =?us-ascii?Q?mcCok0JqzjK69KP6yM+MzHN72cStEbK9iY9Lcbh/z/CCxIAYXNX6CueQ2BmF?=
 =?us-ascii?Q?scVDzn4/xT4N2HJc0xPCq/Ph6jn03FyISQkC/usUPS63DSwuRd1LIs7DqjQk?=
 =?us-ascii?Q?RQY7AVDF5eOZUk6Fwk1dXqBROH/hk9TK7mdfKrfPk8XrvnGa4oeSsVWJS5m+?=
 =?us-ascii?Q?RMABYvpoJ04QBArMXf2xS0LWljKcIyHi1EyOL1cNtv5kdk6aejzW/AXfp6xG?=
 =?us-ascii?Q?9jn9NdpcPmKJMkBO4jARoe/ga40y9fTz/T/7GhkhWx2YwcAizUrU2dUgciNX?=
 =?us-ascii?Q?b2ztlJ0nd5grEC1jig9ctilDZrbyGQ+DMsN1yDERh/nzVAIEcxZRIYnAyC+Y?=
 =?us-ascii?Q?/pDyrdcmbBeXHC4k0ySpLAqL71MbYB7n2nreQfFZRHXuOnu8vIv7WzmYq8DN?=
 =?us-ascii?Q?TTIsMwcuMtYo0fVlOB1gq2scqSbipoEmAqQ3ntQ4DCCQBGr+gpbak/BcmMua?=
 =?us-ascii?Q?A78QSfnyxAv2X+dhsbFKqDst+yOouj/gNJqlC1Oyn8FmSIboeRGa0w1+zd3i?=
 =?us-ascii?Q?d2+PjfEtAwlEytce7IsN45sBxyYXzWutIWbfdRVoC+8LEv4enEjNHRQ3E7U+?=
 =?us-ascii?Q?aOZuxL9ZH2jd1w3sdlCa5Tj4GXpm2Jg7YgG0pAB5neL/U8Wifwi+jqcrDB1H?=
 =?us-ascii?Q?E17JsTOBKHnawa8fttplqdoNM8fE1ylasJu+rpfxxjb1hwkKs/HNotQqL+yY?=
 =?us-ascii?Q?yhbh/Ht6tJrcrVoPv3W7rmGLfPY966+5cPqW45fzY6lXIQGOphCUi2OquX7B?=
 =?us-ascii?Q?7AXJH02PYrqQQHsfzlZEWGzJDEhh/OlDaByYARy619zad7ZsAhhUZjEG8+Rr?=
 =?us-ascii?Q?efuffo9eDiP63081R27AmLZVzNXKcv3RSWA21hUZ9YlOqxuPFMndDUQpQiNs?=
 =?us-ascii?Q?dS5G8V07Pofrz9puYwiyaFacko7nNFrnitUoPkfYHKtx5NZd9At8ITpXohjr?=
 =?us-ascii?Q?Qo1gJPBlxF4DxBuyRbvjhOjPrnT8e/GnNGvduT4lFHBSDiRnx2EsaqoTDwCD?=
 =?us-ascii?Q?4ihQj5laQA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b63a6344-9d98-4fea-843a-08df43d3293c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:12.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vNTrFwnQzA/G9yoUlwIz9LsPTcD+b3qEOTBg8RYRHAhA11cbcIX94ZtG9noRadHdu9VmC4c+afpxmNorjgTGiceKGIUdLg8Ji59d+YNbf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250335
Content-Type: text/plain; charset="utf-8"

Release: https://github.com/astral-sh/uv/blob/main/CHANGELOG.md#0138

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-uv-build-crates.inc        | 44 +++++++++----------
 ...d_0.13.7.bb =3D> python3-uv-build_0.13.8.bb} |  2 +-
 2 files changed, 23 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.7.bb =3D> pytho=
n3-uv-build_0.13.8.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/met=
a/recipes-devtools/python/python3-uv-build-crates.inc
index d668493bd0..5354010b43 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -11,11 +11,11 @@ SRC_URI +=3D " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/archive-trait/0.0.15 \
+    crate://crates.io/archive-trait/0.0.16 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-mail-headers/0.0.1 \
-    crate://crates.io/astral-tokio-tar/0.7.0 \
+    crate://crates.io/astral-tokio-tar/0.7.1 \
     crate://crates.io/astral-version-ranges/0.2.3 \
     crate://crates.io/astral_async_zip/0.0.22 \
     crate://crates.io/async-compression/0.4.50 \
@@ -59,7 +59,7 @@ SRC_URI +=3D " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.18.0 \
+    crate://crates.io/either/1.19.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.8 \
@@ -103,7 +103,7 @@ SRC_URI +=3D " \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.2 \
-    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/indoc/2.0.8 \
     crate://crates.io/insta/1.49.0 \
     crate://crates.io/io-extras/0.19.0 \
     crate://crates.io/io-lifetimes/2.0.4 \
@@ -112,9 +112,9 @@ SRC_URI +=3D " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.37 \
+    crate://crates.io/jiff/0.2.38 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.37 \
+    crate://crates.io/jiff-static/0.2.38 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.1.0 \
     crate://crates.io/lazy_static/1.5.0 \
@@ -203,8 +203,8 @@ SRC_URI +=3D " \
     crate://crates.io/syn/2.0.118 \
     crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar-codec/0.0.15 \
-    crate://crates.io/tar-framing/0.0.15 \
+    crate://crates.io/tar-codec/0.0.16 \
+    crate://crates.io/tar-framing/0.0.16 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
@@ -215,14 +215,14 @@ SRC_URI +=3D " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.53.1 \
+    crate://crates.io/tokio/1.53.2 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
     crate://crates.io/toml/1.1.6+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.15+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.3+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-core/0.1.36 \
@@ -238,7 +238,7 @@ SRC_URI +=3D " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.27.0 \
+    crate://crates.io/uuid/1.28.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -307,11 +307,11 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] =3D "52ce7f38b=
242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099abc=
a73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb889=
8808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] =3D "330a5ed07fa54e4702c9d6c4174f74427fc=
0ef6e214bbd677ae50a5099946470"
-SRC_URI[archive-trait-0.0.15.sha256sum] =3D "999bf88cc483664cab77700ca2fdf=
b0415a73412abe284ef5bc2319d00938e00"
+SRC_URI[archive-trait-0.0.16.sha256sum] =3D "0b5040ca935c09888e7dfb04383b4=
d62fa3571e25bc66b6f345b591e97958524"
 SRC_URI[arcstr-1.2.0.sha256sum] =3D "03918c3dbd7701a85c6b9887732e2921175f2=
6c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] =3D "d3fb67a6e08acf24fdeccbac2cb6ac43058=
25bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-mail-headers-0.0.1.sha256sum] =3D "dc019ecca82cfc91ffa31ab4=
ffe705aaa706399840a7152926b7eee736da410a"
-SRC_URI[astral-tokio-tar-0.7.0.sha256sum] =3D "6f2e989b33246fe9240d39accf4=
dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
+SRC_URI[astral-tokio-tar-0.7.1.sha256sum] =3D "821ed36daf7c40d00a7b62759f9=
833fb279fb7c87dd989ec0a4d626dcd8d1dca"
 SRC_URI[astral-version-ranges-0.2.3.sha256sum] =3D "b315acc4dc7f0d3ccdd557=
a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
 SRC_URI[astral_async_zip-0.0.22.sha256sum] =3D "0f8508d09c6bc6abd42767d1d4=
3c7702891691484875ce94f7997da1301d95e9"
 SRC_URI[async-compression-0.4.50.sha256sum] =3D "ee19bd99b43e3691acbad4e84=
0420a4881cea6c0b66a208125a824f8fd53f5a1"
@@ -355,7 +355,7 @@ SRC_URI[digest-0.11.3.sha256sum] =3D "f1dd6dbb584193794=
0781866fa1281a1ff7bd3bf8270
 SRC_URI[displaydoc-0.2.5.sha256sum] =3D "97369cbbc041bc366949bc74d34658d6c=
da5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] =3D "92773504d58c093f6de2459af4af33faa518c1=
3451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] =3D "d0881ea181b1df73ff77ffaaf9c7544ec=
c11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.18.0.sha256sum] =3D "252afb9ae5eaa683babdc6a068b3f5726eb1=
9e05070c731f9b2a23a7c3e8ed34"
+SRC_URI[either-1.19.0.sha256sum] =3D "0e9c71c2167ca323c882b99918929403426e=
2373ea17242ff5653e0d5e1058be"
 SRC_URI[encode_unicode-1.0.0.sha256sum] =3D "34aa73646ffb006b8f5147f3dc182=
bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780965a8=
c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.8.sha256sum] =3D "fba3fe847045ecff794b9c138293a=
80db914678c453ad63fbf0c6a9eb6e00b22"
@@ -399,7 +399,7 @@ SRC_URI[icu_provider-2.1.1.sha256sum] =3D "85962cf0ce02=
e1e0a629cc34e7ca3e373ce20dd
 SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994f6ddc501886a45c7d3d=
62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] =3D "3acae9609540aa318d1bc588455225f=
b2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.2.sha256sum] =3D "cc4e190f5d26ca7051642629da2c52fc03=
bde85a03197c99408dcd291734c855"
-SRC_URI[indoc-2.0.7.sha256sum] =3D "79cf5c93f93228cf8efb3ba362535fb11199ac=
548a09ce117c9b1adc3030d706"
+SRC_URI[indoc-2.0.8.sha256sum] =3D "a37b2691796cffeb8a8cd305ac66e65841559f=
147f4e63231d0eafa4db5384d1"
 SRC_URI[insta-1.49.0.sha256sum] =3D "b67d3d2e287e4b86c10b3f3b641033d1f89b7=
4bdb39d05f34952e2b9a6fe21cd"
 SRC_URI[io-extras-0.19.0.sha256sum] =3D "20fd6de4ccfcc187e38bc21cfa543cb5a=
302cb86a8b114eb7f0bf0dc9f8ac00f"
 SRC_URI[io-lifetimes-2.0.4.sha256sum] =3D "06432fb54d3be7964ecd3649233cddf=
80db2832f47fec34c01f65b3d9d774983"
@@ -408,9 +408,9 @@ SRC_URI[ipnet-2.12.0.sha256sum] =3D "d98f6fed1fde3f8c21=
bc40a1abb88dd75e67924f9cffc
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488aa=
bdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] =3D "92ecc6618181def0457392ccd0ee51198e065e=
016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.37.sha256sum] =3D "0ab1baf72f08796de0260609515130699b890a=
c25f30e610ad894bc5856cafdb"
+SRC_URI[jiff-0.2.38.sha256sum] =3D "b2b005715dcbeb0089a3c0dab99f2ff1cc3b25=
25323552703d648585d342a383"
 SRC_URI[jiff-core-0.1.0.sha256sum] =3D "7feca88439efe53da3754500c1851dedf3=
cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.37.sha256sum] =3D "378268a1116ad67ae6228701118ac9f=
491d78fda38a40a1f1a9e1348de6f7212"
+SRC_URI[jiff-static-0.2.38.sha256sum] =3D "2cc9817253cf7c7ee4684451bd327e8=
8d6f3658014e54a29198625590650695c"
 SRC_URI[js-sys-0.3.91.sha256sum] =3D "b49715b7073f385ba4bc528e5747d02e66cb=
39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.1.0.sha256sum] =3D "cde48f36530cbd91b65f050101e6c056d6e=
b743cea2a8f0f19beef69c6742ff8"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
@@ -499,8 +499,8 @@ SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2f=
cb837ea5d9e2628564b3b043a70
 SRC_URI[syn-2.0.118.sha256sum] =3D "1b9ae57f904213ebb649ce6895b8a66c66f020=
3b9319718f69a5612a065b1422"
 SRC_URI[syn-3.0.6.sha256sum] =3D "8593e8e72159ed2257d083c7a454a85cbf854f37=
a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-codec-0.0.15.sha256sum] =3D "b9dad615e50d181afea4bafea23dacb8e=
33ed52dde06503813570634b932d467"
-SRC_URI[tar-framing-0.0.15.sha256sum] =3D "563e8181b47c9cdcce569eae3ad431e=
ec71543d6269dd60c7bd2350f70bcd233"
+SRC_URI[tar-codec-0.0.16.sha256sum] =3D "6875ba507bbec6022500f46477159a03f=
07ebdffdb4ea043254974531df1dac2"
+SRC_URI[tar-framing-0.0.16.sha256sum] =3D "49727b1a300514960d425d0e741a7da=
3e693170f3db39de3180fdbbc07e542c5"
 SRC_URI[temp-env-0.3.6.sha256sum] =3D "96374855068f47402c3121c6eed88d29cb1=
de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] =3D "230a1b821ccbd75b185820a1f1ff7b=
14d21da1e442e22c0863ea5f08771a8874"
@@ -511,14 +511,14 @@ SRC_URI[thread_local-1.1.9.sha256sum] =3D "f60246a494=
4f24f6e018aa17cdeffb7818b7635
 SRC_URI[tinystr-0.8.2.sha256sum] =3D "42d3e9c45c09de15d06dd8acf5f4e0e399e8=
5927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] =3D "3e61e67053d25a4e82c844e8424039d9745=
781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b462=
b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.53.1.sha256sum] =3D "202caea871b69668250d242070849eb495be1=
78ed697a3e98aebce5bc81a0bed"
+SRC_URI[tokio-1.53.2.sha256sum] =3D "e95f91fcc7a621e8b030f6aa23c71fe9838ae=
2fb4d8118b75602a328f5144044"
 SRC_URI[tokio-macros-2.7.0.sha256sum] =3D "385a6cb71ab9ab790c5fe8d67f1645e=
6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] =3D "a3d06f0b082ba57c26b79407372e57=
cf2a1e28124f78e9479fe80322cf53420b"
 SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] =3D "920602543f0911ab71da12c50d59=
701da54c196d1a2bf5cb4b75667f137a406a"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] =3D "3165f65f62e28e0115a=
00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.15+spec-1.1.0.sha256sum] =3D "1340ea94a5856333492c9=
064b02c778b191dd2c853778d9609debdcdfea3a614"
 SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] =3D "baa693a8032d7e1cada7d=
0041e96126df243179ff061456783ac7f12bda4744c"
-SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] =3D "7d56353a2a665ad0f41a4=
21187180aab746c8c325620617ad883a99a1cbe66d2"
+SRC_URI[toml_writer-1.1.3+spec-1.1.0.sha256sum] =3D "06bdbd8cfc056b8d2e2e8=
5f29b56a3bdbecb527cef81eb39e3e7b98af4652770"
 SRC_URI[tracing-0.1.44.sha256sum] =3D "63e71662fa4b2a2c3a26f570f037eb95bb1=
f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D "7490cfa5ec96374656874065=
1ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-core-0.1.36.sha256sum] =3D "db97caf9d906fbde555dd62fa95ddb=
a9eecfd14cb388e4f491a66d74cd5fb79a"
@@ -534,7 +534,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] =3D "e9df2af067a7953e=
9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] =3D "ff67a8a4397373c3ef660812acab326822203501=
0ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.27.0.sha256sum] =3D "97277d36b9c3ace13e58fa6e753f8b0bbbf302=
a18dd193240d70f9e29681059a"
+SRC_URI[uuid-1.28.0.sha256sum] =3D "7cc1186384beb7dd8eedea376413fd65493728=
5ea6c9cfbb928dc3043ea4b606"
 SRC_URI[valuable-0.1.1.sha256sum] =3D "ba73ea9cf16a25df0c8caa16c51acb937d5=
712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f283853=
ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] =3D "231fdcd7ef3037e8330d8e17e61011a2c244126=
acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb b/meta=
/recipes-devtools/python/python3-uv-build_0.13.8.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
index 8974550c86..68ad48b1b8 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3D86d3f3a=
95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=3De23fadd6c=
eef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=3Def7a6027dc4c=
2389b9afad7e690274c7"
=20
-SRC_URI[sha256sum] =3D "c561c4fa00f64efd348bdbe3a01ade41bc9af99ba57d807cc7=
b2abdf73571366"
+SRC_URI[sha256sum] =3D "038c16dc60d63c336cb5364000e11068c79dd0142682fbd4ae=
3e5470c11fddc5"
=20
 require ${BPN}-crates.inc
=20
