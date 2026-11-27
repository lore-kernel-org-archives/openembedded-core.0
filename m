Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14003.1795777374160616251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XGe9HIrh;
 spf=pass (domain: est.tech, ip: 52.101.72.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhB8K9csHJ28YW0F6NpT+0SPl9jHTz6FS50b+zJrlSRRaMx/XkAkWu+0Eu9DUO/rM97Ft+K/Iw8kkrfiB9+UzWHKi8Eygxchh21EhJl0YK3oB0S8ckp3xzB/oK0x3DhjMo8FNCuyf/3d+W5e99Poqz48V1JmUYC+ciOD+FhUXHcr9Jdkffl+gKWah6jThXXApSYxh7BZS7J/Gv5E6FPauhzTWG2yE2fLRYtC/LUzEkllYvWlBgF9UFd4DP9fWwuAklcjpO/tZT/dRX5LiTuDGu1cItzWv5wAJ4jybP23chwyiVt2zwplLdFsWUk9paBCDXfPL4ztwQ5EfMT+UPORCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEgIOpg/sTKwYfrnp5tKd5qWUts+7a2c242NOZXR464=;
 b=GZkHrzTkwITmgw1IIFI3ddTkLNQ9CUGbMjorpQ8gM8PqZUv2+EJR+SKxCw2ZZB/1WBMRQpVH1UqRs5o2XfuK+5ian8hWjTDKoOlE4kgpwD9WFUcNWYXctJk15ywe2BCp870QwTuFjkFwN4pAsf1fueJV3fpfEKVyUxfpRyM6zjAqmXmKGfJAdmcsuMAdyOH0u6NcuDPSdNSm6+uNhSKGzExKylvIEEIBCWi34uDgbGaGwgOc8vsuzpSJoQSsjQW6VIc1tmanSyNZ6PDpGLG5C7phrOBmwo2Fd5U/WsUKMPP7INqKTJJp1Rok5nuqe2//6DOaJ+jg3ZklrFA5eca6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEgIOpg/sTKwYfrnp5tKd5qWUts+7a2c242NOZXR464=;
 b=XGe9HIrhs8oZJPnFdyvxJzRaGawsx/jMwwQIghfe0jZATv3L2KDOjWEEBzLzEaDevZGgXeHO5Y1D/ZkJYLbLIDzQo4t2eRrAHVbI/h83TTr6UWARiFiZH+RXuMDeiYsGh8gUvP+IAgZEEkAe6n1MR89qjtti2QTlu5VS+cxBhlwgnhRfCs0lMli4bngOVSUfeJzcDgeejz0VC0sKlI+Bpako0kJi/etXy8O7AWLbPEhKs7BHM5BpK861CeGMGs3OLehPdxkWb9kxlTET6yOsEoGeBzgtcZu64ToyVtK+7JZKGIBup9XOjt8epG5kndqPt56zE6H4wljbtI6VrBt17g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2539.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:643::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:02:52 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 11:02:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libffi: upgrade 3.8.1 -> 3.8.2
Date: Fri, 27 Nov 2026 12:02:46 +0100
Message-ID: <20261127110246.512-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261127110246.512-1-jaipaul.cheernam@est.tech>
References: <20261127110246.512-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5cb252-f7bc-4b1a-fe9f-08df4c75fb1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: p00uQtK3b0Ft6w3aScwfXO/ezDBno9aTNtMVLz3tTC18SGDFaDbtm09NMOR9WRHH1+L6fx67btzudEaD0mDQOi36YYIcgNDHDbNm1kybUojmoAfMIp73LNZrvMJHvn568XIfkVxVKGEHwZlDhVEXigDsSh/gfo0WCNkMvNPbfSYQiIBqrRcgGCNtE66ywtUNrN7H5bPyMqBhkDZb9Ma+lGsVB76LACKeyOH4tW6xGnEx+ZL21Nxic7FCeLQtcu73BOj0EAL2WslPOQ3TH3XlWdNbASaGfJQBuVb8y7xw00uwWNLPLjA1OUtYHRtIvr0sWUPOpYelO9XbZ57hjJ+IIpFYWuPe6pMRkLHWqL4pL3aCbMRtSHbn9TrqihK+50g1tVw0otRhZ3t3cl878XwghlPd6PL85qO+3CoqgPsCv+UF+Aohdd+BoffTGmdbXlDYJs0eJpkAd/jUeM9pN5Vmr0aynNYpMQkXy6kwoxJ/ZF3zop67nx04RKlEEhwz7DAj6Y0svG/++65jztinZhqWgKl5p92jNVjiY4UR5l4DT0hG5hnYgjHZ6XJva9+HJSi37kbBYNj65n8Z5yzKS1n4elNJUKAa+gtwE50j5tgqu3q7dcakDGk8rUmuKqe0nv1eFrrkVp3saCFgLqjUb0/gxiMMY68GE4f8YWitMkXVmJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iCtM31jkZba+SK6tABwQ4QEanTb8HdmeFfh8rBLiH23jZ1h9SCffcxVI4zJx?=
 =?us-ascii?Q?gAxMxmu5LwpTBUWOykRR87eWipmvzQnaI989aGNX9bkK97y6ZNKELICNjUZo?=
 =?us-ascii?Q?3q5o9Ik40spfcPb42ZQ0P8RGnb32G4VEbT/Fc3uMkmDGq6NUrzTAhPMH83Ck?=
 =?us-ascii?Q?ECWoLPaIF8xW49jIIrJa4tcmtxW4asEiW3m8QWwHnBvbAPOtGM5UzCgMCbmj?=
 =?us-ascii?Q?VuGN8gCOvTxkiV+qeyOPQ8HcbaRYUly66P0IQ++QoxS+UhKw3069TCilDMUZ?=
 =?us-ascii?Q?rCZLKxKKxoS1wS2oDW4m2KWf/3Nw1AAE0+sY0N+qMg8YBEFD4wgoStyblfnR?=
 =?us-ascii?Q?XAHuqLQCoIUJWaCN1eJNnHlPG9KEIDDhnDnPirAnZH47REEuLaWF7fZki8HU?=
 =?us-ascii?Q?Vf0BwAWr1Ep+7uIg9FUPkVaajUuzfPC+vqx/8Ii53k1NYQdWwvm1NXNDQcbo?=
 =?us-ascii?Q?rDu9J2jojkTjHPDp+KSIMXqYqKK4FL2Ef7oQlozOlOHiIWxktPtZYSvy1+R8?=
 =?us-ascii?Q?K/z7s/iJFAK/i6oWTW2xDoOO/P/JJTI/ivNuHI2Oh/jj8968yhJX0qysriTQ?=
 =?us-ascii?Q?h3bQnczqeVrlRJKkp8WhAiRRfL7s7SyFcKePNgyDP8IBwvACd7cFVgDnd23n?=
 =?us-ascii?Q?mak39YEW4upkr73Vm+uLyYyYwJgdzgv50TvKqNnu+FbhzlgFF98mzsE4BtGs?=
 =?us-ascii?Q?UIWo5/y8o1GnPN8q6tyU+z8IE/JF7zbxq+t9cUY82bbU1gHD8KFcQMuawf89?=
 =?us-ascii?Q?VdtDB0Icj53dfUx4PFUJMsvinJ7KelKG0P7d6NJkdcoHWHBNbIwjczPYox3X?=
 =?us-ascii?Q?r6A/B80hrysOALEhgRPPNm16so1ef48Zr5nnFxAokVRUnmmYfC5IAbYeFsZc?=
 =?us-ascii?Q?VYDtu1SEkcxI0ln/WH535X3Qkss8m1ltEbnVy6CAZAgs0Yy2UTNWgmMyWHpn?=
 =?us-ascii?Q?viXLDZ3iNFq1oLs/lMQkWHlZVaImkwVnyk8XXGNlWDlBRwW2WAiv31jD/okN?=
 =?us-ascii?Q?VqTIk0MOgXqRoP3+jDro8ZMokpFu2UOEC/zFi+9yP4U+0VZDmTy+PZeC85bD?=
 =?us-ascii?Q?E/NBEQj27exmItqrPpgsDu9qvm0KLFaEivKjU+zZj+X/DgurhSuaZLatoTOn?=
 =?us-ascii?Q?Y83myFCMO0NBwBKf6fYc1GQ7lGVXpgcWnrpm1HI+7wdRbDIPEPI1pEq2/QOH?=
 =?us-ascii?Q?ALl/EJFw7EEu8xaOWbZH4PpIiU1A55K7aQpnroZvgFLe6zUi+t3JOQfFeZvc?=
 =?us-ascii?Q?2LDF1XVyKDRB/TQoHulRGSzvgs6cbqF0bPr+NvxDYswAPt/liCyHqwTqgIr5?=
 =?us-ascii?Q?AxypRc/4QIEcVLH5VP0E9Z2TbFTvw+fX+swEuAcEllI0+b1ozx27jffn4/2X?=
 =?us-ascii?Q?mf/V5iax5fUz74gk42qOW5YzWrHF3O6p1g7Bz2BxJrrX2kJM4Ucjz1GK4WyT?=
 =?us-ascii?Q?pkc30OzGcAs+ecvWkltgqXbeRCwVLN34KpvwMA3S36Ad8XA/gBUs8/PyOSrr?=
 =?us-ascii?Q?yCGbp08rBY+YnWyeSMwHTnpZz0w7fLPp58FB167R4c4iyfGnlbIQMUorA8ga?=
 =?us-ascii?Q?s/rP76t+6LWf348nP2qBYUMdUsLQC39qwVLn3prmxdvvf0FQkGO7/1SiGzom?=
 =?us-ascii?Q?UDutI4hzC+BSglKdyBVUjbVc9MUYkstePs5TPQXO3N+ShQk//WPubHnUPd9e?=
 =?us-ascii?Q?sFPViOGZvFukBO7IUIJ4+HoTb38oAg8emPMfbsX8bLD+krCqRMPcBKkmFaeH?=
 =?us-ascii?Q?XNRkl1p2Jw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5cb252-f7bc-4b1a-fe9f-08df4c75fb1d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:02:51.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a94vDz8Dyj+o/Xo147MCBQiw6XGBi6IncyQ/Gia2yaDTVZLPaOD3+dlShPdFVkHMq5yMrubNl94gpqpDD3Yk6RCyLwZ8YEtW77S3X61n7S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251374
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://github.com/libffi/libffi/releases/tag/v3.8.2

Release 3.8.2
ABI and argument-handling fixes for 3.8.2
Refuse signatures too large for libffi's counters and size fields
MIPS N32/N64: handle complex values that only partly fit in the FP register=
s
MIPS O32: give ffi_closure_O32 a 16-byte result slot
powerpc64 ELFv2: do not quadword-align float/double/IBM long double aggrega=
tes
Static trampolines: make the temporary code-table file immutable
RISC-V, LoongArch: one-float struct takes the integer convention once FPRs =
run
out
powerpc64 ELFv2: set FLAG_ARG_NEEDS_PSAVE only when an argument is in memor=
y
Pass by-value aggregates aligned beyond the stack alignment correctly
Reject vector types in the Win64 and CRIS ffi_prep_cif paths

loongarch: ignore return buffer for void calls
testsuite: use named fields, not arrays, in cls_struct_float_psave.c
SPARC64: fix the FP word mask for struct arguments in closures
testsuite: use __builtin_alloca in the over-aligned struct tests
SPARC64: keep SPARC_FLAG_FP_ARGS when ffi_call discards the result
testsuite: skip the over-aligned struct tests under MSVC
README: tighten the TBD changelog entries
README: correct the size-limit wording and the MIPS N32/N64 closure note
AIX: recompute struct alignment from the members on every layout pass
SPARC: allocate the scratch result for a NULL rvalue in ffi_call
README: cite the advisory for each TBD changelog entry
i386: give a struct argument 16-byte alignment only for an aligned member
i386: fix three raw-API bugs in ffi_raw_call and ffi_prep_raw_closure_loc
README: shorten the over-alignment changelog entry
aarch64: reserve 16 bytes per by-reference struct in the argument slab
loongarch: ignore return buffer for void calls

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-support/libffi/libffi/not-win32.patch            | 4 ++--
 .../libffi/{libffi_3.8.1.bb =3D> libffi_3.8.2.bb}               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.8.1.bb =3D> libffi_3.8.2.bb} =
(94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/reci=
pes-support/libffi/libffi/not-win32.patch
index e1a6b187f5a..880a65d2fe0 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 948a108c78f9030d1f1ea87af62ccd257da4b82b Mon Sep 17 00:00:00 2001
+From dc67387ff4383bbf0f77ea6a45779983ca525baf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,7 +20,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 63731dd..cd78322 100644
+index 2237b05..658b4ae 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -449,7 +449,7 @@ done
diff --git a/meta/recipes-support/libffi/libffi_3.8.1.bb b/meta/recipes-sup=
port/libffi/libffi_3.8.2.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.8.1.bb
rename to meta/recipes-support/libffi/libffi_3.8.2.bb
index 318cc7ef469..317bf8d938c 100644
--- a/meta/recipes-support/libffi/libffi_3.8.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.8.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5e9a8df556846b=
b3d1edec0d968a2311"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] =3D "81e879c094cc5ec3186c48510c6385ac6b3e866192e8bc71a3=
5245703757ee40"
+SRC_URI[sha256sum] =3D "a699fda2b090c4b46cb79cf60c4dacfce480eb05742c0de66a=
cf3af174a47f92"
=20
 EXTRA_OECONF =3D "--disable-builddir"
 EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
