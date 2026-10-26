Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41958.1793018317395111317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 05:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=v7unoq9E;
 spf=pass (domain: est.tech, ip: 52.101.83.62, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0uJkWNFnPcryehbkVjmqPvPw4CTE3EjSHjCpcWf2Nu4oDdTC/3YXXMCGVwSgZCRXDbtaOUTctSicb3GGUOFn3XfRbMHboZB8PULsov0WEjHBS5kOJvuToiW1vouuPcexEItgSfafQ+RHSDoKL7h9IJxkMWDiKskiNQC1bk8wxru7ATOuR4kt5bj1wqaJSwThbOBJ79d7C3evPi2V+FGzgpSlwBBFC28kuw9CZZ+UfZqC8qXM8AxZ2AMv/TqeMyGijySHjTt3rQLIFmOlJlricA24ZkJViFBFo8WPCYAxjVGOWfI1CAS9Br+p+F0QvAYjtrddyjpOKQZaB3KfkBDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+w8BprMWisDwoNnbKdGxZDf3QP6L1NkJC893WePybw=;
 b=jdyZmIC1La6Ww8kpR/uzdfzhYQmaB92HxWm9xiMo2HSWQ/aaso7lSldD6V29cwQ8lpua7uyZCZUq7pdtkkdde32Sr6Ohz+rheKKeXa710pA92eha78hw7vV2ULzWzDrwM7FUYoA0BFo0wJIN6PoQq4ZnbsjUGlEnmyT2rMeZP7s14wA/a2w6fGLjfqoXGoZDggje94LNrG5962xxsFBM7s3K/gZrh+lab3yccRkRmIa9aFP7zoVJkfMu3ZxX3368G1uVQT1FqtKFlH3kjJoaP/oLMslybkFMykZ8UuWGiZ2BMP6/kdMH0xhDIITQi8wGcyUnAbu7mngKDHO4UUclqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+w8BprMWisDwoNnbKdGxZDf3QP6L1NkJC893WePybw=;
 b=v7unoq9EG4SH2XjCiBLnXi03ADB5VILKPvT6WecmiNTQuIXwxU93ODnn49Nv5UoJZq9xSBwuYbCYNFxXKIh0PoUx8G3TOydc/aXxWlet/R/D25zFTBijH9O77OLukOrTgwgiXhljo28kYBi1vId+WQ4KOUhC6OkoicUvj3W/k21iTEiKNtyluTWI3WpdUCyIaV3J/uDFl+QoNto5Q5IddqHHwaTzswAeDg+geJi5+gTNJcBQ9zTONCOCthL/1MwqRcCKTwfQyz215bBWZvo+YOAQp3eiLWq3gexRyOZ8JQmtcqf3oCWssXVoZappBliNspm3QlXGpezmpgE2BCSoPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV1P189MB2675.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:38:30 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:38:29 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] libsoup: ptest: reference upstream bug for skipped header-parsing-test
Date: Mon, 26 Oct 2026 13:38:24 +0100
Message-ID: <20261026123824.31771-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GV1P189MB2675:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5072e3-6769-442c-64ba-08df335e09df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261021121427099003|261022105027099003|261021123027099003|10067099003|56012099006|3023799007|18002099003|13003099007|11063799006;
X-Microsoft-Antispam-Message-Info: 7mW++4plXWKF0X828RGUt/JOtaGF5NBO8ScPpnexT3i6/nnQYiY9hsNITU46npTsXGmZxTK8bm6yCxAR09X0RZbruFwmW/bZjSFeZ9d4MLiVJVWYQiGmKTog/3lD0xHjCfgsbFVcVGUprASH5a4T25MDXBrg4EfM+BTuL0vJSHh/EvszQHvqlEilWFOImc1pv6dh5m6ZUq2VnO4LfDw/CQfExVn8o9WQtoPy5oRjVWI6MxcDji+PEF4r96/Z/f2VpgvlrkmMWhpNyl5vwYh3Fp8UrCkJYwmoXHvbiSm/WtrC7IfnXOVJudNoRvFznroxqnKyuKW6F3pABRI0x6gX1qAH9z5exH2ca60BwWMHIgSLgBZuEH6VTYKqmSX1vTAHE9xHogCJqLJutotdhl2wlAXzPKYZ0vr/eENw/azchTUpy3WT7KNSevShrPNx/Uq9/cn3u9KBAV8FuitaYg0p64ei/B7MnZDe1b5cYwHPP4nNnce+q9ngv4qGW+KOg7VYY4ExYJ9/GrZHNzJ5p0qaeWNiL7hGFHF+n93kJ48i4cQTl0O+6aRTqhAfCWd5feNqdz21UJO1SbFwyIQGOq4Sgt8VgDFy+fwNnc07uCYagi7LD0eODvCJ4OaOX17MkgEUtK5dwRmMiys1Ob6fPwUtgi+pGthQXA4glnSG+xTunss=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(56012099006)(3023799007)(18002099003)(13003099007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ql4nUT37L67McDH9T8uMjD3YGx9/UZmoeG/yG3xGgmUqu/Ip2fjKKYlGGQ2c?=
 =?us-ascii?Q?YdCQf0XIPqAXejhG8m8NuQKHAKvG0xI1g67A32I37r0ZZw14OVeVLm/LsZyf?=
 =?us-ascii?Q?D9ukhxNRTNgbemWCih9lQq2bkN+tp3XGQPCSRBy0yCoAqkpCq6odDLuvTquD?=
 =?us-ascii?Q?WsVom9Fb+L/jzPRQKpTIgfpkYxmh0Hex/P2RRb4deNdn71GWoRwJhr8rrony?=
 =?us-ascii?Q?GVg9t5T4yCab59zBXFxhd6FcQNhf6Vy/irceveYNfjIq1zN22terltBrAFt6?=
 =?us-ascii?Q?Nhk6VHrLNu/jIA3OaHx/eD6km+VmJflJheqlJETEby/jsB9JjYxL9T3eC/aw?=
 =?us-ascii?Q?1VyaXSz52JogBkgjEDEGo7eQp5Ev5vYWV1ysiL2udi5FdJErzNK1N9551Rqo?=
 =?us-ascii?Q?C6PnOvqLKf1iqkC1XbJp1+W9dqEN4VMGfdZ2mDII5p+jfeQ+3oHwfu5u1j0+?=
 =?us-ascii?Q?Dh7pFdd2uFSLOXyxiCQj15S/7MEOp235Ps227gwS2X5LLsU133l9aLsxbG8n?=
 =?us-ascii?Q?qiBev/fk0o/0nTSW1oLzom3p2fe2S59UHWrEgxHg7ShWhBEzi/jvEUPSyI0t?=
 =?us-ascii?Q?tyNG8gHBDnNXUcKVq+7zsGu/rOm7+DOrZulyOj1e/grDxdRV53iwA4vbi4Zz?=
 =?us-ascii?Q?pR7DJqARpKwaD+B7bJU8tkGyZ39dJGETIyz2FFTQsQxBQuSMOS7etE3wohb1?=
 =?us-ascii?Q?/JNU0YIPvPOgOTuwD3e9WDc8ylvV5OEO99NGp5xm9+a7onudUxHQ3tjR+3eq?=
 =?us-ascii?Q?LPtc0Ce2JzuGChKg0Jg4TawnhEf1MCnIJNVo/EfJKcJtyZ+vnfll+1ep2xYl?=
 =?us-ascii?Q?JuOO9TJECzrxNychFivIVuCHA5XwHPwn167L9rQIjA4R/SB/ExGnTRW7/DIe?=
 =?us-ascii?Q?UN3hLXhPGYbZGgA2hxRobVSUfTiVmTILv50p7QzplzJgBy1rtQv/cgXphBkm?=
 =?us-ascii?Q?9403lniwYiNgCK1zrX/BtmyQtFIPrFPutq+Ms3UFdSXwvRjz7Gb6VAM/3pHd?=
 =?us-ascii?Q?hLgqiUCXAjCmvmwzr+Lv4GFOTWMJx/FmrhwrpSK+5tT9YNBJs72T5wbWR1nD?=
 =?us-ascii?Q?bqoXFQsTqmWq0KwO+mKcGUYUqyZH6lzCO4iwlLvLByEbG0qEbw+h1Ilhhg+q?=
 =?us-ascii?Q?/ARP4ya6rCWYWqjBBwYdoor+WYazsBFgwiS3VxvuN+RFknhLZLbch4s6FuIu?=
 =?us-ascii?Q?uwiTvaT3AkaDl0Bfq1WgIudLdybejPZjqXdqDODYVTXbNrIHEGJAf8/c+fii?=
 =?us-ascii?Q?pSmicaEPIsoEPxoPcDepcF1TTRJHenXUnFp0yHV2jVdZosDM4xOvaoIB3QCG?=
 =?us-ascii?Q?QGSNZhvUmbXUtIP9I9B9Wc1x9xEXsen9IBPDrbnRKv01ccejzez4p2Rjbyvo?=
 =?us-ascii?Q?d4RQhSZPCtzZIONol79bp55iG+VhGUpNG4EoMjYo0zbautpt8SNX8sDxzfHi?=
 =?us-ascii?Q?dEi22coOU9KJomU0P8yq7NxWq6EDDdrfIrQLJ8agEvvSCG36ISM2cDrBN6fD?=
 =?us-ascii?Q?+6VVpgc3wm9n9yzkTbbeoFiJx9oknCzF/YouDJcE/5z8h7kS4vnu2R/GrmN9?=
 =?us-ascii?Q?k7XtYyNI7VolJOB5uylRTkocauvKEmcSFjrP6H/h2h109+8iHV0Rt8oytAi/?=
 =?us-ascii?Q?oOpcti9ldV7dlyJCzdXnwBVmoUSlr2Lg5flMon3MQOTtApkHs71TVUD8qSWQ?=
 =?us-ascii?Q?tRVq/i7l55yCzQhCiJuRJA0BsacnN61mN66wNjw4/F5+/CBMjTSAs1bLGv0o?=
 =?us-ascii?Q?69UdV/Lf+Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5072e3-6769-442c-64ba-08df335e09df
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:38:29.6125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29ufZEO3adfva24+NhYFlxgnmsU9mSdq+i4w54CSmlY4Wu6/C4/8Ev22CxKDjD+8ls94m05L4QaLU+6vMDzCmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 12:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248678
Content-Type: text/plain; charset="utf-8"

The header-parsing-test skip comment attributed the failure to glib,
but the abort is in libsoup's own parser: the /header-parsing/param-list
subtest fails because soup_header_parse_semi_param_list() returns one
parameter instead of three for a header with invalid-UTF-8 extended
(*=3D) parameters. Correct the comment and reference the upstream bug.

https://gitlab.gnome.org/GNOME/libsoup/-/work_items/560
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-support/libsoup/libsoup_3.8.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.8.0.bb
index 1ca40423f0..8f21f15c2c 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
@@ -45,9 +45,10 @@ GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
 # These tests abort under ptest and leave the binaries in place:
-# - header-parsing-test: a g_hash_table_size() assertion in
-#   do_param_list_tests() does not hold (returns one entry instead of thre=
e)
-#   with the current glib.
+# - header-parsing-test: the /header-parsing/param-list subtest aborts as
+#   soup_header_parse_semi_param_list() returns one parameter instead of
+#   three for a header with invalid-UTF-8 extended (*=3D) parameters:
+#   https://gitlab.gnome.org/GNOME/libsoup/-/work_items/560
 # - logger-test (long-invalid-body-length) and http2-body-stream-test
 #   (large_data) exercise multi-GiB allocations and are killed by the OOM
 #   killer on the memory-constrained ptest machines.
--=20
2.43.0

