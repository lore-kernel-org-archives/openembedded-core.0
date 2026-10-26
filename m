Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40072.1793010714082523059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MkQhUGrR;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+SXnlPZt74NdWgvDicHzseJo09Uq+GI7xNhmF2J4WGjcLQksTpIjpqXoPQY9U6rLhGlPAvUVTlk+Apv59Cg2AGUofS4f1hIrSRddq4IfDd8E/rlXugHon7We/WNYlNxas/PC6F9jEkakGBv02DbGY31ayBWed2sRnu7GG3YQ6huGpCETNd1XvKOxpuYQ/QetT99sDZeej92Hkrp+DjWMok2Qwj8ShcDBdRMu7Pbajdv8zr5E8Nsz+SvDvGzxk8u3AObrA1GsSlXPdBiJfyDkTDu2QecjGp/ztPkfZy20t2puxFzsr8kY57U+qhfT/ktlrWMYwI8twLLc2oVPPCtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg+EieKoiNSOG7NiKRWajqd1eSs9YEdyTCM/B3jQCi0=;
 b=ys1yRGqH1o369rG11rIeK1oLZ6yrt6o/2CIv7hgESPfqNtotq0RPkchbovpC010d1ECKHIqDYtf14wmB5oHkFu0bsoQwBET2bx1kmVhUhbIe0+2p96drKlMfgiOzuF4W0ogEurUXnbnLa9BBubmKCDqEol9MvI5uvU+tm+CV4eAdreVWcW6ahrRFcXRSF+6mBsgm0zvWduPAJ9JNdbUg/SmosFCIfA/GgokPXM9yayg+m9VPy6LSjihUT3FCur7G6KTfd7sujwNtbhW/DGevVdXWaGTi1o7wn193rIZFDzb5AinXSfTJKProMc1lODkbadt7D1n47ZFZGLtEALla2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg+EieKoiNSOG7NiKRWajqd1eSs9YEdyTCM/B3jQCi0=;
 b=MkQhUGrRLn31XMMEDeQe84HeCA9hG7qbYYVqh5Q4hZzs/gaXJG0vN9KzPC3+wcX/wk8r94JkMbBb67PxNStOJc71lhXk+zMlW5daJjW0qX4rJFGGTt99NknFiu7C/yFDF7VcaUm3B/ovNfv2GPOYMfROUvhzulP26bO2IQvPhVFHMUAlIE4vpDLuG+i5oj6C3bptR9bxkhSDJ8b8vwSoLvlIWlUalklPvJSUpAhWZ1SGGRx2mui/1huz751b8sP9mACRuTUb0bTwSJ1nbvAMjYLmx+lBGEQum83c4S1jpxvRnC/eqTrNBSuP4HAQLsR3Wx9TbJZUaY7rpwGIiqpICA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:54 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] libslirp: upgrade 4.9.5 -> 4.9.6
Date: Mon, 26 Oct 2026 11:31:35 +0100
Message-ID: <20261026103138.3137-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f9e1ce-9c8e-48c2-666f-08df334c5afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 3Hi+vGIiTGAn70wMTzqyFO636W15sV//bI67SDtPdRt4vvdaw/XOIIdNxzjdbJ5NHQ1QnVXHNDqBmMs8BrgefZDbesuFTY+C5FbP/clxHB1xxa0fBQmOsCAhyZLCbQqr4lZr5StkWOf1DOgBKD3yO/RgLg4lHTMQjDi3RZqCK2lbrNyJxdnnr7B/p2IUenhKCKD/ctta1uuDtwTBuxP4j3ZFZwhRmCpXysHjCLE/sSuiSEAfcWdJDA+yZa5aMiBqHsnv5MJz1j8/x38VT0VVf3JTGmnGeGvZMIIT+ALyjX7CC+v1TzntL3O4hWsM/PvAXyRB1tPTNL0Uy/nukSWJALwotK+ssSMWiy8H8RGap3iBDknLnDj8FTpIcAFD19bHAblKTwkl4RgrQ/YTiFKssZVKh+vu7DT6RioPw7zcrUtvHsiXzOfXjYC9P/yAyrX8mtDXdVX5a7oWnaxUkj2ywuvgwYrVixoa1dQp1P4oh8EG15BuI0sigM5P2LEPCltMnfc1upmX/+0xcVf/xDbnfjfWpylDwrnqlaH0YSPp2/po7ruu23PUvIuBYqsmpaFnPCIaHkbhtwMdvnXVLQV/iUh0P3n6LA4I9VypM0IO3H0ACATnp9bJOD/+EOcukmoU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y4QkZJQAqXSJhiLLFi4SuFAYjaR/v+J4fB5WjOPdevDhrwkUqIjLu2DpGo4l?=
 =?us-ascii?Q?kZTLJ32VjAwwnmOPZzpu3KIi0kN4tENeQCpd3sH0xvd/w5eyxRcl5Rlmcxmo?=
 =?us-ascii?Q?o3HKF158RSByta8w7jc30RayNHeq9D70ehvY00zL12+zzrlHMasBEB+hzXbL?=
 =?us-ascii?Q?dPp1qqqbiHuLMt/jDNfAP0/3qPUGj2uVmkR/Gdf/o9uVUx6bk20oAwR4jM4L?=
 =?us-ascii?Q?kuBE8fxfzKDkZX+LLEMOupU/204+vOijQJgHjoHk6mxO//n3+eho0gZGfG8+?=
 =?us-ascii?Q?rRoumf2R6ccwNbgJjP+0MB1wZK+SdECU7jyYVIrA/g6hQ8WK14rbJNBLvVVY?=
 =?us-ascii?Q?ZgdY7ec6Nwf/EaZ75VzgwocxAIdzReleCkvb8DezSSeBbVXR/klIp99U2XzG?=
 =?us-ascii?Q?LA0Hl2XQPQ6e0gA5wZFOllQxEWjk0fNz7z2WkJOFqxo82QvxPLDLb1ISG+si?=
 =?us-ascii?Q?db5Nh4sO+OSRI8nG0k7v+0Z2Ru0eXIZSf/bMPXYRVS0K0hb1VnlSPxqxmeOJ?=
 =?us-ascii?Q?ohMpTEO7ycMpsa0M+Qvrf2VW94FzwQejMjRRreHydEuH1Bqx4x5KXFccMVXY?=
 =?us-ascii?Q?U0pWfT9rB1fXc3xhRvrskRxvdOQvF1RFWvoOOEfqLyuLOWsEURlUpXexeiTa?=
 =?us-ascii?Q?b7f/nHmt7SCa+vLOcs26hLNbKZtdIWCgA+0CXZ71iGisfcwsygglabLEYG/c?=
 =?us-ascii?Q?ff2/WVeNGmigjRdHwjQXUWRfSuCKdGzy1ARu/M/oG1KH/77GegTxLo4yh99J?=
 =?us-ascii?Q?J0XqOPKh3ssBo+qNgB1gVCdFRcs8OOrNZb1bUksAYK6dTi5K9wHK8LcvBu4H?=
 =?us-ascii?Q?dq7TzD2jjKsk3EwYStbCnB037Q0AX9vGCkUqHuQZKIOwZqHp87XGe1lHI18C?=
 =?us-ascii?Q?Nsx8A3NbRIWgA7Btkjr7AE9TnamXTuP89DNz9dl95IdORXwfp1PYOgDYRgg3?=
 =?us-ascii?Q?Y535Ey9VvwLMC1He3QCDGsYCQ1Wnau1gGna3DcxKKqcZZRC6NgfHnnGLp5MN?=
 =?us-ascii?Q?YxOQmESUruNokTUivaUUQfyHvphv8zVV3vNiv57+l+K7YEQorhyNysfB7KUC?=
 =?us-ascii?Q?Kb1KCU0SiKhGgPfKeIgbpU+tTQidy7D8WeocjkrvPEdQtkfCymVvTyLCYh9Z?=
 =?us-ascii?Q?D2QTdTJwo5QXPHqW/qShCRAkn/42e8eD5CKbnzJq3Scug79MsyuN2jQprclL?=
 =?us-ascii?Q?7FY3wFX4JcQgcsy068X5nO7FbDO6ZXmlhFDt+mriTCwK5mB3Qnyjb2zofCxX?=
 =?us-ascii?Q?CfKdHysEYoteThCKc5iJ72A9Umx3vHbdoFUyNwlEE/A5pXvUCydqdTqPLtZQ?=
 =?us-ascii?Q?0uoVl4QP3G7DHe08dZ2DYXlaSKJfUBJhfOlX7DSGPSb7NmTfpPeP8H+Vruay?=
 =?us-ascii?Q?22R+tVgpbb302OZiYKR3/LrAOsJIG8Rd3TXAW/tq+p8/aBAKsCyy4s+hCITa?=
 =?us-ascii?Q?MrL9YQvetFMZw3pMsiX85z+30WJ7xPXNsuiAHz6oChPeVH46f8fTXOYQwbBV?=
 =?us-ascii?Q?y5KAgermnhgSofcCIwUOV/VEIsM5WeS7ti8B0agYTlfDtyT5RSt6YxpBjmlN?=
 =?us-ascii?Q?af9dyl0NVwqpceDs39M4BKfj33bD5Y4IPu+z/SMxUJ7S8PMJP3iMRJwVnLVb?=
 =?us-ascii?Q?uNHF3dD++ckZRSlyg9nlNiTHqABe/GZ7TZdgQ6axn9zj4J/4AP4LxjKW1E0e?=
 =?us-ascii?Q?Ypi8MaExPgSBZWr8Lszo8yvHbp88eXbcbch+2Dt04in0G2M70tJjgAEARzLB?=
 =?us-ascii?Q?BDJyKePZbQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f9e1ce-9c8e-48c2-666f-08df334c5afc
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:54.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUj8e++OQtmZPBFdQ3PmS0niM330x78xmpjmhwWCDB8hyB0TVsQZ9hurkGu6hPNcMwSWVMm+mhlvoowFuCbKtGbzc97QzKfPk7vtu/Gj024=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248668
Content-Type: text/plain; charset="utf-8"

  - Fix Buffer Underflow in `tftp_handle_rrq()` When Handling Empty Filenam=
e
    #100
  - Fix Echo Reply Length Desynchronization in `icmp_receive()` and
    `icmp6_receive()` #105
  - Reject martians
  - tftp: check actual available room

  - Fix memory leak of tftp_server_name #99
  - Fix Protocol Type Mismatch in `icmp6_receive()`: IPv4 `ICMP_UNREACH` Em=
itted
    as ICMPv6 #101
  - Fix Double Socket Descriptor Leak in `fork_exec()` on Argument Parsing
    Failure #102
  - Fix Socket Heap Memory & Buffer Leak in `slirp_state_load()` on
    Deserialization or Validation Failure #103
  - Avoid Non-Reentrant Static Variable in `tcp_emu()` #104
  - pingtest: use SLIRP_CONFIG_VERSION_MAX
  - icmp: preserve guest TTL and forward traceroute ICMP errors !166
  - dns: proxy DNS queries sent to the virtual gateway address !163
  - tftp: Drop TFTP_BLOCKSIZE_MAX

  - Fix bounds-check in processing OEM commands (CVE-2026-95507)
  - Fix bounds-check in dhcpv6 against MTU (CVE-2026-95508)
[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.6...master
[4.9.5]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...v4.=
9.6

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../slirp/{libslirp_4.9.5.bb =3D> libslirp_4.9.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.5.bb =3D> libslirp_4.=
9.6.bb} (92%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb b/meta/recip=
es-connectivity/slirp/libslirp_4.9.6.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
index d77121bf309..9d231f111d4 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df95a9bf4a7e411=
164fe843697ccda59e \
                     file://LICENSE;md5=3Dcfea6044642fd63b90ce9d79f5db64d9"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv${PV}"
-SRCREV =3D "390848f47391f412451b2d259d8527fabb51e5e3"
+SRCREV =3D "392af90207fc51dd9f9044ee9b1f963f3c851c2c"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 DEPENDS =3D "glib-2.0"
