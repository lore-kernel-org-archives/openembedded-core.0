Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6114.1794231641841910133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Yg6iO4zB;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Blq8D7aBYh7npl8mUVMpvfu0wlLgxHKqLSEouHxODXH/M2WAnrvF6p/9pSBEXqPw/jWl8Om/oheZ/arW62R2UD6/xUFc0ejAJ4WcLNc+RVVql3VM5MIDY5aNiRPtQS2tZyDBpwZYA0irrYY2ynlhKvW6H9mXgzrdtYtrGj0uqnpgY38WPtWGwHbgschSB+khaQDCX1yRndQjG/fGNIe1W6vhNKzabA/i0YlGq9wd2+/52SYreD8e0SOkXZ3QcBtyKWDm7T64CKnk8eRWYItxBIzop5jEj0bZeg6XC/P5SJyfw55BcZnowRZ9YVvjAIRKtLUevxLz7jqcq/BKHIdYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx/wGIevtVw6v5SzQQ4fAca9vDBdZZ+fVDES7Nu2xQU=;
 b=ikm70FE3lcGRMLAzKbw9J+gN03pDOhDlJPsXxTfiGyCZk58k9PlEqdbab7j7/sCX++4BJmuDYbMssblYuIxvnq5dq353ciHQRRsxwmpQJo2jaqUOMrP11HrTVWZ/0AXZn5N1q52tpKPIEIJzbHcpFMckaTVA7bL8azQG3gpAtf/dJzPFM6l87sfHWsc6eA0JQcDwi1wTVjGoHwyqY08OfqW5QY/Px5qxy1sc4DUdka65DAE847xjlTbiAcHxEyJgB7jDUD0m1OkKxPv3FKV5wV+/H4HEcopnzqqlDAd1VgLlPhKrOQwijTmWwj3Yz2sop8GzdLQO2S15w3EirwhAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx/wGIevtVw6v5SzQQ4fAca9vDBdZZ+fVDES7Nu2xQU=;
 b=Yg6iO4zBq+zk2HqZrbFUlnUmKYbl9bdbu0gyZ5ujJoHtBTQ2DPINJ/lz1GbOhK86gQ7njAzichSaLmyijHBIrs5ejizh9P8z6WtkUQoqwrXI/DfFvNaEkoW1vXa62EcphPbt+VlOcE4gK8DJYYQqCM2zl+fto2bN+JHq9VjD9BiRhVq77jJG9b8QpKjG86hw0wSBFtdKR99El6pS4wlC+PmiEcj4s/TXMyCBdLF07jwyM4VibCmSVO3NrFIIAurQd5j9KvCgna49u3SBibvoPSGXd1dm5or7tlCuyJa2TzWCnNYxD4cKaW4/QVe8TrScbQ3/g65Zb7QGzdU/JyNU2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/21] libmodulemd: upgrade 2.15.3 -> 2.15.4
Date: Mon,  9 Nov 2026 14:40:15 +0100
Message-ID: <20261109134034.74458-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0311.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: f892bc6f-df00-44b1-0969-08df3e670b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: +IjKDgF+4AiscD+IbV/VN2+hpTLtWcRONeCB81nXdXd1KWFPPMCQcjtjqjcS4LmSp8rbuleK+uwMGulSipjQCUGwjNVL9a9f5h/ykuI9hMkAKykDrVPFIHrK4CFLG9FtOPhDQjd2n0zSeGs2HYtD4TvEtNLqr+YrxYiSSsrITFzrroPg6O7WUXa3Fm+g+8nu+JpAxzDNTUzAh4xnQXX4w/uU7dlg4W7nYysbNnhU3dCGYalwO3l7MmOLeyg2hZJIwy3cRtxqHw8sv4DQYR87xwpNRkBwoTQreR5vN/ADBpgPNXQ9jiRbDBgFlFUWmVVypw3yYBheQID3qTZWnoP2mQm8oCU9u3hi1NkEwjrWT6d2Y2hZjqts9EtJlE7ckjvma4qa3d2+fTE1HaxSMN+VJuS4OXWe3j0TG8WTJCtgIQwYhZ4iphXb14C0UDdNya3qLopNfreRT2Jyb5+X2CySmw9IFfJeAyoCoTvO9xld8Jq86DJ4OtgUW4ixXu0v8jMcNaT5/ZkcBV3k1MuNh/Nu/d3V75YIZDI9Pfc2Znzscd4mcRVU90Yhxo7q0QHkw3tAUwbNCOuHQ++AOfYj2UEFBo5uKy4WnyxRkHJlHF8NkYwY2E5JIh+lpW8tuzr/RqeALUIP4GaEPoh0wWIbvBfvXOsGk2NNW7LuIe7pDjRWz8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8IQlrf4Po5dAhPXF32llxL9ehskT8CaElfGmcjjIvAWuHDRqALooPR34G5uW?=
 =?us-ascii?Q?JwOF2+dg7F4NQZbjv1O9iee+kNSlgjDn9APJfKJTs/7J8eYk7RxmwtYq4QYj?=
 =?us-ascii?Q?3zgDv4PH44MLMCvdMx5Vc2CTxqgHV8GTqDiNtBwT4GFtVsQkWZOCp67Ohsso?=
 =?us-ascii?Q?ewzrGJdS3cT7d81n7Gsrh68rPD5R8nwwZpJE+TXoxrtrEE49oEXVlcby0VXO?=
 =?us-ascii?Q?DXoZi+yjCpL4BkgMcR4ZXmO901R8u3Wg3lCoru2ODC5B8umPL9qNviDV4pU6?=
 =?us-ascii?Q?/Ax5HE30wk50htoZN2LUjhioZimnH4nru6pGM73h0MI6r6tVByiPy5c4TlIo?=
 =?us-ascii?Q?UAVdSDE+sQ8ExzmaL4c5EV+iaXOPnCpZ+AbzpLe1ucTNjEdX3wKazqu99PA3?=
 =?us-ascii?Q?TacK9O0n6tuBD1aqFuMCbWxoBAXqDLsPd8GllX9WFnhz5YUTIAcTzXhgx1PQ?=
 =?us-ascii?Q?ltwT6Gm24Czgrwvkir99O0F75Xkc/C9h12uwUPBn0NvNm2+A3m8OYjta8qSI?=
 =?us-ascii?Q?xdvubSUmZkZhESR0/cGCz8OPWtPmXxqMdy2ZSDSKjgpw5h9gmKuSRpfjhQbh?=
 =?us-ascii?Q?4OBXTa9ZWfQNj2kM59x2FFsO1yxg7wmuMCU875QZd4yEVDoCCxM3pzgZ9rf6?=
 =?us-ascii?Q?z6evFy4qgztVseU4YSLaV65axbWAY2zR38/NvWPiNDOEgCisdoGetaw2jaj2?=
 =?us-ascii?Q?MkuyJ5ullg7BwtOEBUew8R0quBiGetemRPVkbagPOMbcyigRaY6XQEwXvUTQ?=
 =?us-ascii?Q?8L6s5GsShYxo2pDj4OaEtp9xJ+P2BeksTstzCEKNPSypvCrqCUA068N6/ZN2?=
 =?us-ascii?Q?2DgzIEK4YZbUVlctHMrByz6QWgCNyLAAkYxKzxQcglPE1F6U3wXHr3FQdERo?=
 =?us-ascii?Q?3I2ZZUenyu0cjPJ8p7AI2OJi5tDnD4+Q2viQettKj/5L9LG8tAd3C3u8rwMi?=
 =?us-ascii?Q?0vwKTPAaO0ac3nyN6r3+O73eh2YW1R9qa/hUVcOW1Ml13/Uj7YHVnY55CcEg?=
 =?us-ascii?Q?GwXGXdOWNZikUoYrJL2NPSUmYsNveDNKMabPhZJdJuxT9qB7syCVELPA7uzz?=
 =?us-ascii?Q?tOG0ADofQbEZ/LYQ/SpmRfZ2uTgOtqIp0p7+ExJOcS3+uhxMPUEro2f3eEMp?=
 =?us-ascii?Q?AXlh6x8Zl4gMps+7WB7axxc0nwYdfHbEXYdDgi8bZJ3wqTnOZDzjRQazF3oI?=
 =?us-ascii?Q?X4kcHKH0zgUmkQVhjtYantCIny+Di0VDF/Mfvi+vOCqtHvx36wJ/l8oWFBP3?=
 =?us-ascii?Q?mfvT3fFrt8NI5dbCxHl/QDKw1A28mGAW3p7FydqfExpX5cEKR26Ye9Z0ymKJ?=
 =?us-ascii?Q?IGAiczdapEEj9i9Hbe7kqa0nlakw40XywCVdmMhaAGEa58hqgGgsBR41QDQZ?=
 =?us-ascii?Q?eTGZRaL+/vMwO0MItGWOqcfUCtp7pA8rNW5E0Fka6C8qoj5O5LO/OHlx0mgM?=
 =?us-ascii?Q?NURcomGUpqM83j3I/fUXW6fRpQF80V7MNaWUnwONdBlp2s8ltIUUfGLSqP2u?=
 =?us-ascii?Q?gmhas6t6x4A0wbli5Gh7wAc85DhPih/Jl/nJcBaBgErqoZK5nQ46oYeJuQW0?=
 =?us-ascii?Q?eFRDvVTvfFfyMateyzTKYIxeeTrtxSryUknye1W1D4T2kJL5EO4Te567CAFw?=
 =?us-ascii?Q?BC89OinLF7hmONiTFfgaDe0A0Sks6bAnitWV94lKZEEC7zMPiyMyE4xdHCQ7?=
 =?us-ascii?Q?i4wvbAIw4dD4YfGUk3cv5eeir4NewF/kMbC/lBLoch8XGl3d9aPqsf5BVid8?=
 =?us-ascii?Q?W56rlqfLfg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f892bc6f-df00-44b1-0969-08df3e670b1b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:40.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dp+ulgvbfTB9WFHwG2jeKg8s0f6o287KGml+cdvVS/04+pxDSux7sg05b17zxdY1+Bt0Lu989Yxi9nSVgC+dviBHAtkUmkqi1c/K//OUXOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249807
Content-Type: text/plain; charset="utf-8"

2.15.4      2026-11-06

Possibly incompatible fixes:
- Compressed YAML files which decompress to much are rejected
  (CVE-2026-92823). If libmodulemd is built with "rpmio" feature,
  modulemd_module_index_update_from_file() decompresses compressed input
  files. Small compressed files can decompress to very large data. Then
  processing the large data consumes unexpectedly large amount of memory. T=
his
  amplification of use of resources can be interpreted as a denial of servi=
ce.
  To avoid it, a limit for decompressed data was imposed. The limit is
  a maximum of 64 MiB and 64 times the compressed size of the input file. W=
hen
  the limit is reached, a Glib warning is emitted and
  modulemd_module_index_update_from_file() returns FALSE. This flaw was add=
ed
  with aad63a59ca02be2cc7afb6e6c8a0c3bd5a036dd6 commit ("Add helpers for
  reading compressed files") and first released in 2.8.0 version.

- Introduce a recursion limit for YAML documents (CVE-2026-92822). Parsing
  a modulemd document with "xmd" YAML tree with enormously nested nodes may
  exhaust all heap or stack memory when duplicating subdocuments in
  modulemd_yaml_parse_document_type_internal(). This is fixed by adding
  a "recursion_limit" build-time option defining a maximal depth of accepta=
ble
  YAML documents. Default is 64. This flaw was confirmed in current 2.15.3
  version and back to 1.4.0 version. Earlier versions might be affected as =
well.

Other fixes:
- Iterating over checksums in modulemd_module_stream_v2_emit_rpm_map() was
  fixed (CVE-2026-92824). When serializing a module index into a YAML strin=
g
  where a number of hash types was different from a number of hashes of
  a particular type in "rpm-map" modulemd-v2 YAML element, not all hashes w=
ere
  serialized or an invalid memory was read. This flaw was introduced with
  b5abf3bbedd211a403122fccfec192581e2bbe8f commit ("Add rpm-map to
  ModuleStreamV2") and first released in 2.2.0 version.
- Harden modulemd_module_add_translation() against null-pointer dereference=
s.
- Harden modulemd_module_add_obsoletes() against null-pointer dereferences.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{libmodulemd_2.15.3.bb =3D> libmodulemd_2.15.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.3.bb =3D> libmo=
dulemd_2.15.4.bb} (94%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb b/meta=
/recipes-devtools/libmodulemd/libmodulemd_2.15.4.bb
similarity index 94%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.4.bb
index 4627e534286..52558707b5d 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D25a3927bff3ee4f5=
b21bcb0ed3fcd6bb"
=20
 SRC_URI =3D "git://github.com/fedora-modularity/libmodulemd;protocol=3Dhtt=
ps;branch=3Dmain;tag=3D${PV}"
=20
-SRCREV =3D "a8f1c5b1243a8e844a276094007a2bbf8a13b40f"
+SRCREV =3D "2f75d47da15a4e4847c3deeb3101b58ad67a0723"
=20
 inherit meson gobject-introspection pkgconfig manpages
=20
