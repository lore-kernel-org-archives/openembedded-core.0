Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3656.1792488590656545484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZVkSxPJE;
 spf=pass (domain: est.tech, ip: 52.101.65.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlZ0rmo9lv2DCvq8qskNvuq8ibgu//UQpJTJRz/d5zxoJkjgKMLrlanQ7GOBHeu6mhHpjoboRqvtzudUqjdJ3US0HT6ZyVKIy1VJRPnFuOrS1WVOkJaxbthx7JFK0IEwB6psHTgrusj1hei3vW0wjS5NERpOGh+QeXN5tWHzY8dBAYD3/8h6ScbV+NtVzzL3qndAagG+r1vcOiCMVJ33qAK8C3+HJCbRZ2ehum0xESa/74Bbd7wiNah0VqPLu5mw6LlbW5IJSZUDLLINJyQnqz7zelHEOhL8rdyrEsW4MuMimBRKNrXT4reND+akpOl+pKlHK02iMl+UuETbpRLfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/UU2IjZI9iMQxVpbaL+7SsE7tBECVMI8Sw6PcbyxiA=;
 b=TxWFqhLaJbdi+Bh+U9OPJ67B0jJSPBqzbswuVsrtqx7l/Nxh5MrARpIUYjZibJY2kmzEUhZdeZWdzCNlIy8fDXAmMWzKeR2/LrLdzHleLD4wwapZZQ+7e0doA0IKatlIRrEtSfuaNedIGTdvrZmK/Megb242RisuKBRcTb71VyO19/tIitEoKZ/CfXkp8JGuATV9f7CTCza2N+eY+6wuUP+n/RNfYFoDj1BpEUTuhI5ZA/Sa/fWVyrDDM04xoKKmM//pPmMZiIJ91MOzyFfH/j00Wee+DVQgEFE5AAEVntbXLtsQX4UE/zMe42P4PgyT+N6OOiLwCsPS4C/Ar/AEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/UU2IjZI9iMQxVpbaL+7SsE7tBECVMI8Sw6PcbyxiA=;
 b=ZVkSxPJEZ/kAZ34rRHW0j0DB8rC4QGxb8GRs/693WhuPGHn0wEEP2vKQH0acbqCISiTiGmXn6S4vzDx6QiiusA4cjjEy91ZXRySjj+uJSvJ6cMNjj6iIhQITDBbeUDH8qYgjFm4JTwmeDTIOvvfbtIwSNCtDKGuQYAznphX9gZyMW0hfUNBvhoQO3yNM2w3671l74zc4ppS5pV5vkaQ41FI9SHzRPNaorZYaTILIeHJPOPC2+gckQW6mkuDtH6HYraB5Q5jfwFWcyWAqFv4DxPiiFYJ89/I5/6d6LI+rNmfa5d8kAOFq2z3LbMcjmYLlPn5CJC65+Eqb4YWnrM5Fqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] libunistring: upgrade 1.4.2 -> 1.5
Date: Tue, 20 Oct 2026 11:29:29 +0200
Message-ID: <20261020092931.4330-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: JN3P275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::11)
 To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: e845e6fc-635e-4573-1053-08df2e8caee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: FMkegNeEa3aTglvJ2BcZuOXD47N4j7e8cF+mnyln8TW62lk9JEF3ZHr0sXI2+eN4QQ1x/7bbKQOTKi/LcFbe+AQisTS2bw5C5HXsNVsD9hG5TzOUdlMp/0N0ngTBEsA9cEchH5sxa3uneCniMSdizn3owQQYqdkwLfwWIEAJ6SZyB3/gzhqo7XDtV6IOk8SLnVzTIgkbhJX2Twzy5ETwHo5yuIdcXfQa736M9BjitASkFkPH7Kg3K85SsvgLBUwFsgHrYcmZqG84GtA5brcGAlGU+14PPxWRUULCabNU5VLqCVACvd4e2sAPJVNiO/g4cy0hAv/KmIyjxhQMvh2mGgNrwLdYiNWcJrTqj6Sxj+W1/RazmEl8v+YFa00214UV/9EIHxSOTS8U2AAu9QhEyCG8gW1UzShXUXbz3GzWCmpjvJpG3D/thinA8MI/QxNy4Nmx0EkDTyxadPJNR3HVmcMPIQtVDKQbtz9tVmwUWfFis/mwqCxbosVc5oPYCIhH+4hddoqbYAhuE2FtWm5Nfr10B0ThxnamJNmHh+TR0EDHbm8scfPsWoB8R31hgW7Zq+ZomfBanOxUW/U2CaeajwWBdTw7fo2HHrO+iJ5/QcEHbt3JkB4cHAutBb6Kb9CnD9lAA3sIVEBal40SjbYiJeMBX111r1airoHP6B0Qypw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WszkJa8gY9TUQbycbqgSLrBZZhbdllJ2+d+s50CXgrnQWe4UOHZHnjW06EJU?=
 =?us-ascii?Q?21Eu1Ntr3NPufVwb8Mft5p5c5rC8M68iOeILkw78EFWiT54sKqPBpBZj9kOt?=
 =?us-ascii?Q?OTgVJvehLeEC14HDsI71+kVVDwKW2SiepdkON3RcEdhCzA44uJaEHHVzC/g7?=
 =?us-ascii?Q?PaOvStIdEN5JYSX1cJ9sS9wIZv9Jpc2IsqEKtcHJLVrldZgXcGwq2MePn5Hz?=
 =?us-ascii?Q?+8dMrp9rMQ+FoInbgn+EUjmI2PvVXXVfrLtLi/kZ/6X370E/i9sQhZivg3kA?=
 =?us-ascii?Q?E1IaKxcm8wWcLa5OXBefvli1wnx3A/y8DRAsSVuKndHlMcZV9Phm2rt/z4Za?=
 =?us-ascii?Q?bPq8Cf0lJKfwDE6fXsjHuuMgG+S+HGDR+43sSNBVh4ND9l3QVROZOkKmxZCk?=
 =?us-ascii?Q?+S2wRLiwc272OHIXjGQgPpxkl8/vxCLVimw5pKupd548bxLprzU43mRDcG4r?=
 =?us-ascii?Q?tj0+pQ086WmJ7bDv9Dze4uwafPFu7eSjDRPUVYW0cUqEtBlJ+EutHqNfPakI?=
 =?us-ascii?Q?rh47rjCRD20GGP9adEuiGK/0wKWGVSeH6JJOptY6wx9wQLidAeE4fRHnGh3t?=
 =?us-ascii?Q?OEJGGdhntSgLCcQGmGNnjVcc15T9EJlRpABxnjddJQZOtnccQYUmSTmN+cao?=
 =?us-ascii?Q?SUUVQtrCek/1LDGORkLsJp8YzSiv5HWUaF2c84KWVg+L8Bpafy0jnJ+fS8tu?=
 =?us-ascii?Q?edOWHn3zgUgD6XHS5r2XCELw/ufPGH6AufL0gFCO6hlGLVm6LDWoPagkMR2w?=
 =?us-ascii?Q?rfT71eNvHGOMDnLoN3EdhHw36ipP2t18mMcXztYAIrOLGib2OCNEDXt4mzmX?=
 =?us-ascii?Q?YRpHfY1yTNVyCb49Hde96+iOvd2uqLkQYzE2itv1cWQCkq5GI8O/BmvGwoTz?=
 =?us-ascii?Q?beXa/hizMgtRPDVUj1yB9K6iF6kCY3Q7lgO48HvWM4t0BahmZu5Sq5UKyz5H?=
 =?us-ascii?Q?CZu4uTHCUneCIwryXouR3W9XgY20TjkAZvpGVfqYCfrxCdcfDiIPw6lUPHOX?=
 =?us-ascii?Q?1Pv6OsDbZpDCahYMVmzbB7/O8UzZsLuVrpYpwKYTOzMHFGfvIeCJUx2ruv8O?=
 =?us-ascii?Q?imasPPfaRdpY4PUbJmhhsVWV+xSlKelQD+6+d+HuxrXwR5PCSDTkAn94VQ1W?=
 =?us-ascii?Q?gxQ94R88htIL72gwtCI/99usVSxANC1flflOBXn9cBvKzdboBip0AMMayciz?=
 =?us-ascii?Q?Pc8CZwQDayxDA+et1Ol3vI0u7VwDgvy1PggOzIOBAVPXvBzzsNZXjdTg1irD?=
 =?us-ascii?Q?g4pFtJpmnDDnVnEhLD3AVYXd2e4XTPq4IdBMecRXEaB83ld8RroUw7oI5+q3?=
 =?us-ascii?Q?3w5y6XFMuJAQySbMEVa+EocpgT/U9K3Fkm9acuEmOsR9WmmdIy/wRcR7KMUW?=
 =?us-ascii?Q?yefTu8FI4DM5OfA9ZmpZe2xeD8Te5EtSN7DfwHGt81JWZ7QPXQob/Zq3hOLS?=
 =?us-ascii?Q?uIv90ab0A4fmh3sC2kEavnrFbcpss6qfn5mjq2Lts7Nk7Fe7ClseyF/uDu3Q?=
 =?us-ascii?Q?B5uDIsamw9rL9OPajkbdeBYgBXKE8pxLEiSFPPYTxfvNmAy+oYH/sclJSmdk?=
 =?us-ascii?Q?GZgrIkr4f8BGZ17yohFddWc9DRoM724JR1cpT/UIz/UL/hm7TdyY4rn2p8GA?=
 =?us-ascii?Q?Qc76MvgZpjdXKGuYF/NO2OFdQnvJVok2YJYlPBpG7xzB6LHNZHGMaVaauu4B?=
 =?us-ascii?Q?sfwhnSFOopbJ7bTf+eYR4u9drT6HjQyMh7vSg1WlMb6PXI/r3DyExnkHB16a?=
 =?us-ascii?Q?fboL67ps0A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e845e6fc-635e-4573-1053-08df2e8caee4
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:47.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oJnzWK3URLyVj168z38l5v4M1gg7gnBXpKA1mGnEg98i3xcOnsF52P5mtXKMYpdRXIkmeiR/1Yw0biOdtHADMs3gzLUPObWXqAVBfR4spU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248262
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://lists.gnu.org/archive/html/info-gnu/2026-10/msg00000.=
html

Prepare for 1.5 release.
build: In MSVC builds, use 'rc' instead of 'windres'.
Improve copyright statement in the Windows .rc file.
Update to Unicode version 18.0.0.
INSTALL.windows: Fix MSVC instructions.
build: Fix "make installcheck" failure in --disable-shared builds.
Add an LLM policy.
Upgrade to libtool 2.6.2.

License-Update: copyright years updated

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{libunistring_1.4.2.bb =3D> libunistring_1.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_1.4.2.bb =3D> libun=
istring_1.5.bb} (87%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.4.2.bb b/meta=
/recipes-support/libunistring/libunistring_1.5.bb
similarity index 87%
rename from meta/recipes-support/libunistring/libunistring_1.4.2.bb
rename to meta/recipes-support/libunistring/libunistring_1.5.bb
index d3bfe976c90..911c0ef76c7 100644
--- a/meta/recipes-support/libunistring/libunistring_1.4.2.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.5.bb
@@ -16,12 +16,12 @@ SECTION =3D "devel"
 LICENSE =3D "GPL-2.0-or-later OR LGPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D6a6a8e020838b23406c81b19c1d=
46df6 \
                     file://README;beginline=3D45;endline=3D65;md5=3D3a896a=
943b4da2c551e6be1af27eff8d \
-                    file://doc/libunistring.texi;md5=3D55cc91e1fe09c7aec78=
b6dc932202300 \
+                    file://doc/libunistring.texi;md5=3D573f97c426e27141583=
8c2d6e688d1b6 \
                     "
 DEPENDS =3D "gperf-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "e82664b170064e62331962126b259d452d53b227bb4a93ab20=
040d846fec01d8"
+SRC_URI[sha256sum] =3D "5b0ecd46cbf225375f20ab4056197e66a7ac590e2684c069af=
407ae3383c9d81"
=20
 inherit autotools texinfo
 BBCLASSEXTEND =3D "native nativesdk"
