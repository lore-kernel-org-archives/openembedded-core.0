Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24291.1795540694721029803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aPszrdtT;
 spf=pass (domain: est.tech, ip: 52.101.72.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBOXIn/KyRCP8PJ3ApMG+BxeYEsE1nhzvYaKPGCia2XuE0vVTNtsPZWiR9yP8SI9xaj/NpXjjO17Pd0yYL381RaIFqWJY2vmC797nPZTyKM+sd5Pl5uf67zo+DExmClmRvoafn7K2LkKvDT4a3cSFdQatTI9GGlHge2Irsb0IxHFEXEjI4Hx61nnWYNMrKw50NfUmvcAhpV+yz3f8B1BQty4Vig2OhBEA0YXqmrvyP6tPnzHh3WoFLtNbi16+soOjOWfBxGP9Q4H3CvQl6mToqO0KgH4XtkL7DWUFjSRuvCBFYNfZSYkFFrCoOAdfZjwgQKKub+u0mlYdMegwKeOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fq7px9StqCkiVWPhbOoj0OftogV4QVTnFyhW9AX62x0=;
 b=ZxTpVZKUprbbR5W3hnOcACPufa1h3JMI6EPOXH0wGp9jm0pZRQex7CPWmPk/6+W7jKvcIjz8nWsRKFXbjsIzE5UFKHwxkF4lQJgIoRNSfmFxbL9ruvxKK/VgkNijwl1pyhg+8s6w6mKZ845gKVOu+99VLT244V/fiaWgadPAxPmrWDCYKXuf49ntVZszmDm/kU+mSQrfkiFgoiB98oriYoprM0zi3IINLhZf9SnNivPyUy1jsrR7lSKiKlU2pC2EbMSc/KNxlmMirMprgp4ka70Ss2gngOpjzBUwg+hvjQC4mJ1mfiS8ftLY+CkWbzU0kBIY+nxVOGbTLnklGJcZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq7px9StqCkiVWPhbOoj0OftogV4QVTnFyhW9AX62x0=;
 b=aPszrdtTOm+vw01+FXr1Phl83blSVBG4iocpYJWymNO6k5InuGSf6dC70u/cv2HyoS8SWGOwbnQUONgj0xJsT3H+SE+ctyz727RqkXYJOGwmY9unq7Fqze/vCff8Pqf6znxhfeVbTnt1o6Mdflh+gmr6Obw9nmy633o8ruZPHG7kr7RzN7ygm6PExipctU2+rYQPNA+pzPwpUF69SLGHLGyOa0fU3ANebi2olUEArxJnh3AasbGAc1Zo3OH2dF/+v2tJdb0mXuMlyDny2HfcHTdIzHucvUx7VK2A1u6nxFlOD+O2cB/BPQgGYGfvUNSkVXn4pO9r/367a6UZBdb8fQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] fastfloat: upgrade 8.3.2 -> 8.4.0
Date: Tue, 24 Nov 2026 18:17:57 +0100
Message-ID: <20261124171807.74394-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: d57e03cc-f4b9-4018-11c9-08df4a4eea91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|260925022911599003|11063799006|260925021911599003|260925021311599003|261009223027099003|261102123227099003|261102124527099003|261026140227099003|261021123027099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: e/SYKvndxNxhKe7Or/35YBrJZy6aFrcYyAufJfUbX2qFF1vDCCMx6B6u8EUBZrvrse5V/Qk02PWOID0UTwBoEruOSHEoUPNbiOV4YeIlXppgTv/ljWfokpJFTpaUHibYfTMVZtncLgHHl3AVKsypBR0ScVBnFAZG78CPjy5si91+8mYUwnz+KRQ2CFHAOMfb8dz1Bfvgrw+LQ8OoG/LXTd18OaM4GvWcPeUQsbNwJhrgxzJVDcJKf3H59s2/eFpYsxR+mDyutlGic8jfN1B1ZTBlfxi65NJVQiunCo6XTAiGbB8JTuCd+C5NtYwX4AZ/BWIenNPO8QKo6uKrzzBN9gwCP4FKUMCTQodDxjEGvXJPE4fIcW2kqh2BCqkfCB+YBK9YXcbN6ZxamPpAR8n7GaAxqFn55kW0n6PlB0drQH6KXXgvZCiow24hjCFYP3PePMuFRy8UXj9IZHvQSpMGoG5M+d06v6XHbay+sp4BSZDrwOJ5iOa1Ik5bHRVW6GpkPBq2AJqeeRwEAS1Z94GHRHz/Q2XCLANiCEvhFDD8hOg1c269EZ1yvGZJcHiNj2fIMiq+FawfW0Tj2TnmgifcocWIle5piK2RoZyTWTWy9AQlEkk4wg15YnFO3mhWO0wcuwKJsklIv+2+DfO/LjKQKVFYr0l1BTJ5DKrNOgRSaqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(260925022911599003)(11063799006)(260925021911599003)(260925021311599003)(261009223027099003)(261102123227099003)(261102124527099003)(261026140227099003)(261021123027099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i1VPlAc8nY/jK+wxafBGVe2261CByRFzFhv4woPVs1sKoElxb2bWmg80hp5F?=
 =?us-ascii?Q?SV1z16Ac2MqcExOKDmEctl5F5pPDrVtnMXdYRbtqp2FykWxmecqoWHaeW59e?=
 =?us-ascii?Q?O9yEbClEur/8l2j6sJ82o3yrcleTFC7VHDtP4Oi07WCYOHzUEMc4KjYw23e/?=
 =?us-ascii?Q?oWQ+DzCdhdSQyR2+7kjAI16r3cpWCtJUgiozExHKcrhu5SFZAPkYspBEimqe?=
 =?us-ascii?Q?7h3tUtCQ9Ej55uatq0nWgyKZ74ZXQmm54nC6ftcKiwkHgIku0F5nbrifv30f?=
 =?us-ascii?Q?dqnIOMMvvDP9qnnker/dVIj5gsexupcufrsB4W1FRjpWKE8u48LP73+RbP8M?=
 =?us-ascii?Q?E60i0F8u3llOhIUCNrPdoT68ZtUtQCx4zYklTOPh1Q74fzR4TUBHeWUfnzvt?=
 =?us-ascii?Q?vB6Rc4QZOBCaBpKyoS+pb5BopOuqfq2Pcr9U3VIj/WQO6aygXyt0Tzbl7tD0?=
 =?us-ascii?Q?QczuiZlI2R623lildmSeUbsZ2SqdZgkFFqG4yXXlKOgZDkaaRbGXyDqE8yhO?=
 =?us-ascii?Q?iupTFC+DptB6oeeYa/WLOz/1i6+c5WxfMdgwtVmJEwqxbsywp+5WRm3HXafg?=
 =?us-ascii?Q?vVOQL4VbFp7HRtp3ziMULdpsmaJ2fD0s92Xsa1aFnllvaAZHjGiFTqFmEm34?=
 =?us-ascii?Q?Eit6uIZZeeEZfqd0H0Iq5Owtc9pFiAJbOLJ+nRYj9lxxLrS9LoJ0Q4LvsR3l?=
 =?us-ascii?Q?oR4jIVeYt3Rhy/FXYOcOogzE+VfsLcRwg9pVUSSA3krUnRA6UysEHpfGOU/S?=
 =?us-ascii?Q?iAKtFe2QW+9xTrpnezmwZWzxghOBpW+xu/DHicmmRqj1Pc2gLW/Z2JMF6ArS?=
 =?us-ascii?Q?I6tDXYH4w0g711micU1PBuaxWLOsIaMEx9/VueX3zJBWHRoZMOg2zCCFpIvn?=
 =?us-ascii?Q?JoWeyoQhXo6LO90uj48zkJvabjAEKhxjOOF7QOMxrUjVVQ8+KCQm+7mH5gPY?=
 =?us-ascii?Q?BDZD0Tm7rJvuRqi6cO5VSxilEJfku4/dLoSNoNJgJw1wXayTap/HYEUmI/JQ?=
 =?us-ascii?Q?zaOT1B+ypn6o/z2/SFXdJi6Wjab8GtVmLtI0JcAI+VZmjzcEe9xEq0g8BwhR?=
 =?us-ascii?Q?5C2PoW+p2NbXnDNvvMAHL3SwvmTEyMRNisnvvEjW1PBcBBIhBXZf8Fw20ZqP?=
 =?us-ascii?Q?01uq8BZYKyxLr80G72P6mBzAHKBuRRxRplDXIujtkcRAWcaoKbX/OeIrjx1q?=
 =?us-ascii?Q?LKWM522xVVHzuQCL3vVZ6L6kKxMK1/KQJoSQBOz8F0x3kkub8BSCSqqhkn6k?=
 =?us-ascii?Q?pyivyhm5X+nr+h7xPMVcAHuT2YuUIhzHGq5kCORkPh1B088PuGPdMDSAWl9q?=
 =?us-ascii?Q?djGgydZQgH91cyASkmbLwYvnnRtj2XXP3fL2Lv8xDuNlMPK3f8eQUghXQ4Ye?=
 =?us-ascii?Q?mfizA7/E291krucyYOloLXRndTTGxp1XkmuxcrtYKfst7QlJ7f79qVETg6/r?=
 =?us-ascii?Q?FzI42Plar3bGOGDFwCfHXLvyZibIybp6hm68iu/ETdlV6AmelqvyDxhEkOtD?=
 =?us-ascii?Q?Bb6ZbMS/5LIKghOV3sNGXDRZS6sTvRiXOPb+z90V5Mje1j3cxCAL07ASdpVB?=
 =?us-ascii?Q?ysuU3OIxFCjLhCUZbTngeQbPJdD0KPeDT0W4++tC5M1/FPyzY4PehFgyjo43?=
 =?us-ascii?Q?qhEfv7jMwMuCg198y0b//FxmObFLkSwBmFOHevt6rLXhyYB2Kkkt2rsK0lll?=
 =?us-ascii?Q?W1+gKZP3YeTgme+lAJ2HZY4d6YYWEtRRJg5io/GTl1UJBZA94pwMyZZfNTIp?=
 =?us-ascii?Q?JcLfuv6b5A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d57e03cc-f4b9-4018-11c9-08df4a4eea91
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:11.5148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/pt1AbgBlr0wgcpICROZTrx260s765VSuOIiLb1GjAVSW7xWBcB5ziZq19amcK6pVrOd8Mq/7oGYK5BGbdD3NtoBz6pykuMDIKhttyQHf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251053
Content-Type: text/plain; charset="utf-8"

Version 8.4.0
Merge pull request #440 from fastfloat/indeterminate-bigint
CI: run the Alpine workflow on ubuntu-24.04
Avoid zero-filling bigint buffers in the slow path (C++26 [[indeterminate]]=
)
Merge pull request #433 from fastfloat/benchmark-rounds-to-nearest
Benchmark fast_float with and without FASTFLOAT_ROUNDS_TO_NEAREST
Merge pull request #432 from fastfloat/rounds-to-nearest-macro
Add FASTFLOAT_ROUNDS_TO_NEAREST to skip the rounding-mode check
Version 8.3.3
Merge pull request #430 from CODER-7777/fix-427-unlikely-cxx20-ext-warning
Merge pull request #431 from aikhanjum/codex/fastfloat-correctness
Reject integer_times_pow10 arguments wider than 64 bits
Silence -Wc++20-extensions at the remaining [[unlikely]] sites (fixes #427)
Run clang-format
Merge pull request #426 from sahvx655-wq/power-negative-shift
Avoid right-shifting a negative value in detail::power()
Merge pull request #425 from fastfloat/fix-424-fixed-width-invalid
Leave std::float32_t/std::float64_t unmodified on invalid input (fixes #424=
)
Merge pull request #423 from sahvx655-wq/fuzz-coverage
extend fuzzer to wide char types, integer parsing and all formats

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../fastfloat/{fastfloat_8.3.2.bb =3D> fastfloat_8.4.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.2.bb =3D> fastfloat_=
8.4.0.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb b/meta/reci=
pes-devtools/fastfloat/fastfloat_8.4.0.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.4.0.bb
index db4312bfd9..11fc4889e0 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.4.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/fastfloat/fast_float.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3Dv${PV}"
=20
-SRCREV =3D "42f254836ee416ffcf2f4e6576260003ac33d48c"
+SRCREV =3D "517e6b8e008341fc4ebf80cc709d8b51610a888e"
=20
 inherit cmake
