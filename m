Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25270.1794827826394116264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=d4CtFhNz;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYW+b4epCEdvZRw76HFrOW7u2DvYwoNmKJ6BFpKUnK4mPapDWJrcbQjk4SNMR/dHrK4acaMol2DSzPK4foPuKeV+061XkQrotf5jU0ednbqLRtB1f8pgq8+6ZNEzDsPGA9Z5p8yae7nqCU4dllNO1Bw1ibXJYAZROFQW0arJt1Wl78QAaC5wpVtesBmdkrXazxRtGWG1ZWB05+lylIT0DKt5P90KZede7cd4Jsx3EdI7ocOKaxINT7nUoTuj98DypnelDTqolcsHWmPqywLURddfyaygY6nuJjAhsxP3Hvz5e8KFpMeE00v7JR4PaVTVKKKTk8lUGiC9FUkPz9+mTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+dftuhQOJoMjJ04HhiMLCMCPMx1DOmJmfBMb0XLUlM=;
 b=kFzKzhD9g4WA/gVWP0aQ8PwZnCWcNSpTD6Bdw6kLWSMo7r687hR+O6ZwXXHTVMa+uCDDWh5lXZEnR9T7B5qALtDV9KvtxFocq03yJGbbobMthUiI4DEzEFf9QQV3dq1P2wzC3EPofEGFQAH9EBbFjHWVxiQQEfXlCkvfcoEvEJpYpF6sBTJhvkSXt4kUgQwql9vIe+HWHPKiRMPFuhx8/TgiuV8sDSj9NFiiiO5H/M3SV3I946dtDMF5s9aTk0Vtd3hoi9QoyOHMOov7aZ/KYOZ0h/XiC82VBarQRpJcaZKqPm/2gLWppKz5+JVdkmJv7l/PPCx7icfNry6GOl/esw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+dftuhQOJoMjJ04HhiMLCMCPMx1DOmJmfBMb0XLUlM=;
 b=d4CtFhNzN3z1JId+TtyYogYAnFBkdxLAvWm55QkgjZnfnJa3UXZTDfStfVz6bUDwjP/iTayoCYRJ/Ypr3X6rSPAysF0mRFDnJJJ1k2AngdJJr9QzyYd3J/zpJySqxKyIJLm5xsK5u6Ivzu7ZTsAf3ht89Ou45U2DIvGvNfTRjP0ZkizpvhzCwJ3U0RxrknQrOKkA65Jt3lMTRFNHWdKXsyVL85TJ5SJ0NZ21E34MuYaTRssLF5xFD0bWXlRE09R4PEiQMcIaiU2gXWZ3jxku5wQ0aZgeykj64MHOgytrlqG1nTcUPfob8C7tiPqHv+jtdiUSEsT+1ADL5JriZE4CRQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1980.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:17:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] Upgrades on 16th November
Date: Mon, 16 Nov 2026 12:16:48 +0100
Message-ID: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1980:EE_
X-MS-Office365-Filtering-Correlation-Id: c982e83f-5f8d-49cd-0a52-08df43d322ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: xZaIGpORHyfIg3fmv6zY4CCQiEOKNIxgbThRu1dYHCMIDFGLpPBcFvYTTwgz+Oy4Wz6C9Nmst22jCi/uGvOH7nKFpaOdDz8lh17U6q+M1OnLrUWeeYP6Ugg3DCJlOJFSJuzhRDjkUgqkFqruNXp3feYHDxUjvQk8AkJTI1jLLCFhBx25MGUY96YgZ+Y1nnLi/jo7he3SV8tjjN0CzsyrjRLgifvx+AuY9NnvKAJUCImne3JFzLzDobSRC/a6ZGcpWj7x5Dw89Fx4/IBr6ERvx5cUrVNaBCksOHGmHgORw9BC/WJ/tGTXRYfUpkBOgO8VTrf1fZ3f8btzX8D+YT+++DWwFSxrkLVquO4eSGh7y5uIZAogkL1rXYOUvkmrSwfZ/bjyxxDO4Tkyvknyov4avlGhqrRZ4UNtUd8nlfFNYuiKsU6qm76zHdRVLJHYgkY1nqZ81rXmR7X7FT8njuMiC8PFCo/ehId0Ce/pHPYEl4zvM2wvH2LKIsvOflyJLD8wvxdlbwZIJHTQKNtorwweulBWNobgmNRsVdRg0jU6F0vjBXHNpgWxd4ZlErkZSXBpLHrNbCPTyeUYQMetyBrjkhr0oiK5O+Fhe8++6L8HoqiBV1A5GKnpC4o8z+whZIFQbSC6j+lBtLX2Be6ANh4cIqfMgVq3LBBQAVggJONZAR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N41EoEAMFf8slQAdTlbAgDrF1VXdB1NMcvdeUNT37CjG6bEazzXlSxnesvc3?=
 =?us-ascii?Q?UljEX28LmdU4HZxJClRuY+Apj39bDF0Md/OwN4puDjYLSWoAYGhm52K1Za6s?=
 =?us-ascii?Q?ni7CM58W6/LhlUIsPqxEiyEU+8g2svnmZkL304jlKbEDMg6YmlyTFFcD8Bjx?=
 =?us-ascii?Q?E2FSWXunMc8BWNNyvVO57T8HpXrATu63q8erLOfYoDd13x1XXRf/pakNkeXk?=
 =?us-ascii?Q?3ZWkXjyCbXuf+vQoyjDPPE6mJis23QzbkPAV0K8Jn0r4mSY2vToA3tEmZo3S?=
 =?us-ascii?Q?Krf7gBZZn/uC3pWdciGzS8Lhqhj/Ewl990ZbSN6pkwE0X3BBseeQuMDncqLy?=
 =?us-ascii?Q?GhBHgLvWsqC3h3sjugD8MrtSH87MDJRHZuk/JYOxlUrNTfO7TIcxlazfrDRz?=
 =?us-ascii?Q?UTdz7ZwvCKBBYR9v7NdJqA4XTYwL9vZ64u6qFm8gIsqoyNNRwBMj4b9UCMSd?=
 =?us-ascii?Q?aQNGH+xVTnXrYf1+HXqEWcQBL/7u5Ndz1jTu5a+A8Sppxd2x9j5Qj7PuG1an?=
 =?us-ascii?Q?9xR+xUph72KnXlZq9ON5LNoDUxpG2Vktq+iVdnzKAq/ZHA1mBpULg6pbYN0h?=
 =?us-ascii?Q?MgoBqFRp1QORCIMyUjbks+w6E6Fx+8ZVbRnBf4qVpTpZOmEv0NqrPSEJZDd4?=
 =?us-ascii?Q?JA8V5mgIOnIiXeCxJYqFyH9CB7LYXPWgoNFBmR9otLoWdZtWKpYgIscpx8IN?=
 =?us-ascii?Q?Sw3cEyZd4GSn1DKYjfK0j5BwxS+5KCucf/7L3uQNamZXjApwuhKC9Lwpx9Qu?=
 =?us-ascii?Q?W/tZcWrWa/v3gl5y5p/A8m6OHrvNxUCHj7xQvxtHc9XEDPaJ1YGOiVCZ/JpZ?=
 =?us-ascii?Q?eUjnQHWaEaeZ5i/TKMbQAr+H5Aoly2qHLfJ9nYw7pyWYptcUoNIYUOao3P5w?=
 =?us-ascii?Q?waSw5fn8LgrKixUWu3+OWBUa77u0U8BY6OD61Pqf1kj8A7e2n0kwJxkKff0D?=
 =?us-ascii?Q?yUydQt+L5UsWoik7SZzQpmQ8CRqNqPVei7Qdvxup8YlMoObdvFyBZ9FpZOBu?=
 =?us-ascii?Q?9UdrhcdoOBzAcfsHpNx+iNMfqm/HmX1d2KVWp0nzccevaQS57xGNpD/k8Ia8?=
 =?us-ascii?Q?C2TvkRYfabPY40aXklbZ/A1RH+x90E57n229URWZjr9oW2JOQATv8wf3koKV?=
 =?us-ascii?Q?cvPkHmRIFNfSPXgynB1V1ZKbF4kUCsdBSiLz6GMM5JGKZu/RqiCeJN6ktx1F?=
 =?us-ascii?Q?EmawOjoem+b6ELlUJ7avug7JubaQwQmD4hKQO3fVmy7U2xHDwCezWBUHO6At?=
 =?us-ascii?Q?rwxnj/ZK5zhu2zkLiTjy7wHH8J97ZX38M9OOVuGjhOgjug4MQT/ozXDo00QG?=
 =?us-ascii?Q?aRfpKgePSVBuEEsq8uO/Q8L5YPw1Y8whv8N30Tr/JxPP/JbssVkFvFu+xPzm?=
 =?us-ascii?Q?N+BxNYvOFMCp8h0RjyXGvH1k7+IGDPEg/Y3PaJ2yBdPfSas9Ku6rbnHpzWtd?=
 =?us-ascii?Q?hHYI5qtjezLDBei+krvzCgv4tGKXLfICnPhZ3ZMg1N9Ci1pGd+tCkjOukWSb?=
 =?us-ascii?Q?FCcUiliXCZJdLnEMj7Gn5B7bztAxXtcTOfiIxvpZrqGv1Y7lYzL6rf4BLL8z?=
 =?us-ascii?Q?aUL1lkxuisHmFS/+T1/Gf8NTcdwdbjU80O0lOHuWg7UiruE89npuaZ+GcRjx?=
 =?us-ascii?Q?eo+4A+4o+oYtSErT8mZJt576PflHlNkk9A4oigGV2XxyMW1ZjJar9kDnRIr7?=
 =?us-ascii?Q?JwSXgg7KKOIF7MDDtGIqikbZpUIi/++ov8HehCdk6aP87cNDbZdutxcXhnkd?=
 =?us-ascii?Q?J2pABj3yFA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c982e83f-5f8d-49cd-0a52-08df43d322ad
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:01.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rAmbPa4VaFOXQruXUhs8NhbBNLyOBX/7ZKsHRzXX06aUXj8v0ThIG4XTz7bG8sH0+2yiYC7dKgCsQMxcjxv8f2TkYqF7+5I04rAJF6m12g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250328

Jaipaul Cheernam (10):
  libffi: upgrade 3.8.0 -> 3.8.1
  utfcpp: upgrade 4.2.1 -> 5.0.0
  dpkg: upgrade 1.23.11 -> 1.23.12
  diffoscope: upgrade 332 -> 339
  python3-numpy: upgrade 2.5.4 -> 2.5.5
  python3-git: upgrade 3.2.0 -> 3.2.1
  python3-uv-build: upgrade 0.13.7 -> 0.13.8
  gn: upgrade to latest revision
  p11-kit: upgrade 0.26.5 -> 0.26.6
  dbus: upgrade 1.16.2 -> 1.16.4

 .../dbus/{dbus_1.16.2.bb =3D> dbus_1.16.4.bb}   |  2 +-
 .../0001-Add-support-for-riscv32-CPU.patch    |  6 +--
 ...ild.c-ignore-return-of-1-from-tar-cf.patch |  8 ++--
 .../0001-dpkg-Support-muslx32-build.patch     |  6 +--
 ...-dirs.c-set_rootfs-was-not-checking-.patch |  4 +-
 .../0001-pkg-log.c-Add-missing-header.patch   | 29 ------------
 .../0001-script.c-avoid-use-of-chroot.patch   |  7 +--
 ...rs-kernel-version-which-has-characte.patch |  6 +--
 ...tion-doesn-t-work-properly-for-all-s.patch |  7 +--
 ...add-musleabi-to-known-target-tripets.patch |  6 +--
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch |  6 +--
 .../dpkg/dpkg/add_armeb_triplet_entry.patch   |  4 +-
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch |  4 +-
 meta/recipes-devtools/dpkg/dpkg/noman.patch   |  4 +-
 .../dpkg/dpkg/remove-tar-no-timestamp.patch   |  6 +--
 .../dpkg/{dpkg_1.23.11.bb =3D> dpkg_1.23.12.bb} |  3 +-
 meta/recipes-devtools/gn/gn_git.bb            |  3 +-
 ...hon3-git_3.2.0.bb =3D> python3-git_3.2.1.bb} |  2 +-
 ...-numpy_2.5.4.bb =3D> python3-numpy_2.5.5.bb} |  2 +-
 .../python/python3-uv-build-crates.inc        | 44 +++++++++----------
 ...d_0.13.7.bb =3D> python3-uv-build_0.13.8.bb} |  2 +-
 .../{diffoscope_332.bb =3D> diffoscope_339.bb}  |  2 +-
 .../libffi/libffi/not-win32.patch             |  6 +--
 .../{libffi_3.8.0.bb =3D> libffi_3.8.1.bb}      |  2 +-
 .../{p11-kit_0.26.5.bb =3D> p11-kit_0.26.6.bb}  |  2 +-
 .../{utfcpp_4.2.1.bb =3D> utfcpp_5.0.0.bb}      |  2 +-
 26 files changed, 70 insertions(+), 105 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.16.2.bb =3D> dbus_1.16.4.bb} (98%)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-miss=
ing-header.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.23.11.bb =3D> dpkg_1.23.12.bb} (=
90%)
 rename meta/recipes-devtools/python/{python3-git_3.2.0.bb =3D> python3-git=
_3.2.1.bb} (92%)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.4.bb =3D> python3-n=
umpy_2.5.5.bb} (97%)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.7.bb =3D> pytho=
n3-uv-build_0.13.8.bb} (92%)
 rename meta/recipes-support/diffoscope/{diffoscope_332.bb =3D> diffoscope_=
339.bb} (93%)
 rename meta/recipes-support/libffi/{libffi_3.8.0.bb =3D> libffi_3.8.1.bb} =
(94%)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.5.bb =3D> p11-kit_0.26.6=
.bb} (97%)
 rename meta/recipes-support/utfcpp/{utfcpp_4.2.1.bb =3D> utfcpp_5.0.0.bb} =
(94%)

