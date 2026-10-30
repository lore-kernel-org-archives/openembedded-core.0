Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8717.1793357086430159205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RFlBY+D+;
 spf=pass (domain: est.tech, ip: 40.107.159.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkyrchM0lr39pz3djoQ4x7wRlLrwlO329Zg6901L8JT24o/V88t9x8Qz9FoKbg4BWBOnjo1mhUxWMzr7XUkwk6z40qqLphbM2klInW17IRPhh7/uYZtzSuE5KDxbWWQ7n76Gv4e/MWWUryw5C7a6SLZvENzbbiKexm5hvxTrz8jgtfexvMcTexHmIMh1DwvMDIusspoPjWOym78IFyVpR59qL1JoEEnqMUHkqWyQx2h7+6hoNTUXpHh7dbBJ2X66o/qYFmK5rjvZRq/A4XkVcDMoSeZlVGMn3UGtQxg/m3JxI+ntlXn+Ckg+b+vScpCE/djaiBFDODxQncQTh34VIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4YAslMbIGiXQ7uLDjIFcC9ibL+pDRMPPRWWkBjgJjw=;
 b=kqg/JdwTGn74c4MIqxb4sAytc0Ppk2LLeBqGjJu6v+Yz2th4eZ/xkXR1hBhD7NerqCIEiEpfuCuizWNyD3osXxrLSNyBnP0NcczjkpHfki2Td+Yu35CccFmencxE0u1kxC5ErT/WCJe8/QeIJuvbBuU5G/Rpdz/6gG0OwZ5yMi07gIR4LSL8bCJd4h28Mpl2UNyDO9sfDV0iOHGZl2nuOZvDhi9D+HQffBI1HgX1Gk7edmMsfVK8uHzJI2eO2YJ3XeLWG8T9meFtZJPNe53kej81LuTSxRjo0nxOBt9btenKYdEeWENPcd6bP1HeoMau+PINkrNiPjzC/NEbulq5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4YAslMbIGiXQ7uLDjIFcC9ibL+pDRMPPRWWkBjgJjw=;
 b=RFlBY+D+Ibu9nR5I+20ydPOPnj76ao2GVQRCoENNB/zFoEO8zaWpvum7B0ORZi5yBEqNZPo+8OOPvchfCWX/Q/3qy0hLAMR7iLKW86t8kvZILeIOG6+3Xh7MstPGDD8apnFDk0QKQGKSUGymB/yg0+4xRDBuKn4y7LJGoijXSyZ8MNic5wtkiPpC5OdA1Eolqp66Rv9pMBOqmuRu5HK18mYVT8e0lv2OsquWs94pOYF49g28juHAAA4qFvo5DlUKjzPF4l5JPPvVjr3JUjCyLMMbhTEB+ze2fF9e+KoPvjocEmJoH8BdIQh3jbsOYv3qGvIwXw0lLM24i95xGaeyBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:41 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] Upgrades on 30th Oct
Date: Fri, 30 Oct 2026 11:44:30 +0100
Message-ID: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ecc7273-3628-41d7-5aed-08df3672cdb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: jEzldPd7eb0T5lvV+PIA/TP59JnrQb00IEmMGi2mzCCdB+fBCHpbSBuAkTKQnjJy3UypS8zqcdlJv2Z7luObfAOAN1UAY8CI1YK+z9O9Pn0PQhDKPBhdyNdnDJNT4tW7hXdDvmbMz/3jwi76C4Ems0nEdceLKRKi4uc2knjc3yi30S6FboIc9JddWO7cJfIkTw77g71/1SxsWnZOwzhQX2Pky4F84xsEdRLJoxXIQwRMcC2tEFmsXAYJEp0HBfgUE14SvsyESmAZoNQrrj8K1nrb5WxZFYDBMZEiUZU0z9Q5BcufZ9anvdaGenF00AeKtf4xLVrAWZi2mrdOIyDVhsOvsDx4vEOneDUn6HAdzyF9gFLJ25GLVbU/JLodpiZo0cNgVb+9AjnGAjVeNEj3WjT56gxRxikXJrYbolM4WrumCp3pBgJmxet4C9+e5iNarwmiPwt8BwNM+8ub6pHeQ+wDmoShm7in0sc/ZLB5EGTVhzc06BhVmIf3NvgBqZZkGib2U4Zr6dCXdY1EnJIS4p4zKVCJx72wymM9aJ/fb8yWMNz0CXfwXD35+9KCGzb4rZOAV0/ixyCv6PZg6uTXlSBb8LpBqRNieYFgOD8+5/iaAQL2dEYkzPr+2fDpXh5GCon7K4nZavrXnGui23emg8BvrSg/Bz5Wg9IDN2D/Kos=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I72ElFa6v6n18syJX0hG1SkUKuCqI2ebwSdsjs0WwjQUd8Vs2I1teAZWrq43?=
 =?us-ascii?Q?GlWVv+sCQgjyZC97NnA/2X2a9lQy5S5bGAChvGaVozoMYqQLcaDTwLrlPuvd?=
 =?us-ascii?Q?0N8IHdFanr5vJkkU7HrDYsPsZIqD1zwvFMjl7gZFQGQ+xAsAEUdut2JQJZV5?=
 =?us-ascii?Q?b6H9QcpHxRHMcmq50lPpTAAxP48nLzs4ADCm+ypiE3v7uifaPzvMBBQ/8NKo?=
 =?us-ascii?Q?8BkuwfuxSSX+LTKbBnHrHhI1zaKVfXo2koOO9otKicx15U353mArxpO5JqzP?=
 =?us-ascii?Q?AGizXrrwg0hGAnb/DDmdKBvC9rxgTvcGeKaM1Pto7YAZTGgRmEfLWOJwYMS7?=
 =?us-ascii?Q?cTQVhZpeMuMwS11u1D8hcKbEFR7Wmr7FcFxA5pLW5Iu6h26eyDlh+oUlZUls?=
 =?us-ascii?Q?9/AoeMTFtu8qPgyPaZo1zQnlwrmOJHSyojHmdPL7bh5027DjJNnW+PRGUKJa?=
 =?us-ascii?Q?x91JUG1fyP9KQ+0RqKy77wEW0VH22z46pYav3BPNdteQFgvmla/B5giUiUEH?=
 =?us-ascii?Q?fWljuY3qQiwYP7WE0+0XPb9nVKN+DlZ+n/nuxuOE36FZUlNEUlAy/nMMYCZ6?=
 =?us-ascii?Q?Rjy22eoiWHRXZ8Hj040+wqroAxmlvzpaPMOg5OFZaRX85y+NiZtoecrddsr1?=
 =?us-ascii?Q?YLEW8MN4DTRFfOt3EjAuipLBQ3bUbMlVkQBoEcdWgX7G4IqlvHMoc8qxRu4P?=
 =?us-ascii?Q?HbyXoyoFDj26XRixQkMfiuftSP3hEa1fNSkJokj9Fm8fofVBmqRNaBZud7hR?=
 =?us-ascii?Q?LEXuVE3ZIFpWfSvJ40yegz1bzInU2zqclm7JydSwOXeNBm865ABMyIeizRrv?=
 =?us-ascii?Q?iGG7J9hBV0RGtoFjh269Nre6g6fIk/mVj32ZvA6xILzczf+L25GDVNnqq6Ux?=
 =?us-ascii?Q?iLx4NMFLh+vwZucCzu2WtMkvTN69QMfSY6ri3PGXtb4As6Bq5GwPGD9opEK1?=
 =?us-ascii?Q?DpTWLbJivxxVGxCgxPa/aSXMcVLIb7qYpNhpAE8Jt6xdhGCE8P22FLQFk+nx?=
 =?us-ascii?Q?lc6inRGdSxhPVOEc6y6fvFIakjgR/PkZ3JrEAVkpwLnzIn8jF+Hxdp1+J9w4?=
 =?us-ascii?Q?iWNBkq5z+1D9R35/qhKOLN58vNEw3WMa0517GRowedltlVRgjaHaSFGt/ULp?=
 =?us-ascii?Q?46AM9XYLEo4szjY2EMGySMJYscXBe7Hdab6HTB/mLUh5lHK0hBElGT6cJRnp?=
 =?us-ascii?Q?Ory1ak2tSyW066a/jZBpNjMIIfkDLEeSbYVEDk62ZvakLcQfG9GR7dJryc4I?=
 =?us-ascii?Q?/lAdNPFbVir5er7OiEOiOJhElwaOXJ8kBwrn9rV+QnJAgNZlYfpuowwb5H9o?=
 =?us-ascii?Q?EWocb61GTiUPtuW1ZyTLAciazbBCiTrjuvMj5GPCsS+9qs+cL8z9NpHqtFqe?=
 =?us-ascii?Q?zF6IHqQWd+GBCCR+JIRjzlgWfeP/Oi0zh1s1Txk5EnDdfaXwrmCNyt6jelr4?=
 =?us-ascii?Q?I8N1r+5jBI8OE3typARXD5UDn8KdIfupFI3WCi5RhTztfAn0eTHW5DLGNggW?=
 =?us-ascii?Q?5++0iqZgfw4UUT0rESg6/De00Xl0kK/eWXEf0AL80eBHORaV6Qn4cZD108XY?=
 =?us-ascii?Q?VMFtERl2SUrKFXVwjOquo7uTleiQ9onzMnqzrxA++61uXrGUwnrL57t90Ism?=
 =?us-ascii?Q?l+4Dx/c/GGajHkTAcC15esrfBPlIk1JWBYeYbuWGxQwE1dLyK1JBHk3yHjKh?=
 =?us-ascii?Q?M5TEKZO5wt8x2QN4B4wRlRjvngfi4uvGj1nTmWw/mQmyd/zDMGVD0X/z2hIo?=
 =?us-ascii?Q?IPIfyhhHnw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecc7273-3628-41d7-5aed-08df3672cdb2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:41.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJpzyTygrwdpR3RC81Eb5cmN4ABh4JRDR0bwC1pGqNHre5irf1Ro+b4aE614R1T0t4cWtEL6JbCuGkseSNjUy3o6qDc+7ndlJIUABvb/isw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249017

Jaipaul Cheernam (9):
  debugedit: upgrade 5.3 -> 5.4
  libslirp: upgrade 4.9.6 -> 4.9.7
  librepo: upgrade 1.21.2 -> 1.21.3
  epiphany: upgrade 51.1 -> 51.2
  qemu: Upgrade 11.1.2 -> 11.1.3
  libx11: upgrade 1.8.13 -> 1.8.14
  libxpm: Upgrade 3.5.19 -> 3.5.20
  libxrender: Upgrade 0.9.12 -> 0.9.13
  libxtst: Upgrade 1.2.5 -> 1.2.6

 .../slirp/{libslirp_4.9.6.bb =3D> libslirp_4.9.7.bb}  |  4 ++--
 .../{debugedit_5.3.bb =3D> debugedit_5.4.bb}          |  2 +-
 ...ac-do-not-check-for-executables-needed-onl.patch |  4 ++--
 .../0003-Makefile.am-do-not-update-manual.patch     |  2 +-
 ...-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch |  2 +-
 .../{librepo_1.21.2.bb =3D> librepo_1.21.3.bb}        |  4 ++--
 ...{qemu-native_11.1.2.bb =3D> qemu-native_11.1.3.bb} |  1 +
 ...ative_11.1.2.bb =3D> qemu-system-native_11.1.3.bb} |  1 +
 meta/recipes-devtools/qemu/qemu.inc                 |  2 +-
 ...ddition-environment-space-to-boot-loader-q.patch |  2 +-
 ...cv-extract-sfence_vma_allowed-from-helper_.patch |  9 +++------
 ...force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch |  2 +-
 .../qemu/0002-apic-fixup-fallthrough-to-PIC.patch   |  2 +-
 ...002-target-riscv-add-helper_tlb_flush_page.patch | 13 +++++--------
 ...cv-use-a-targeted-TLB-page-flush-for-sfenc.patch | 13 +++++--------
 ...004-qemu-Do-not-include-file-if-not-exists.patch |  4 ++--
 ...ome-user-space-mmap-tweaks-to-address-musl.patch |  2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch     |  2 +-
 ...n.build-use-relative-path-to-refer-to-file.patch |  6 +++---
 ..._SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...-configure-lookup-meson-exutable-from-PATH.patch |  2 +-
 ...e-pip-and-the-python-venv-aren-t-used-for-.patch |  2 +-
 .../qemu/{qemu_11.1.2.bb =3D> qemu_11.1.3.bb}         |  0
 .../epiphany/{epiphany_51.1.bb =3D> epiphany_51.2.bb} |  2 +-
 ...2-help-meson.build-disable-the-use-of-yelp.patch |  2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch |  4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch    |  2 +-
 .../xorg-lib/libx11/disable_tests.patch             |  2 +-
 .../xorg-lib/{libx11_1.8.13.bb =3D> libx11_1.8.14.bb} |  2 +-
 .../xorg-lib/{libxpm_3.5.19.bb =3D> libxpm_3.5.20.bb} |  2 +-
 .../{libxrender_0.9.12.bb =3D> libxrender_0.9.13.bb}  |  2 +-
 .../xorg-lib/{libxtst_1.2.5.bb =3D> libxtst_1.2.6.bb} |  2 +-
 32 files changed, 48 insertions(+), 55 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.6.bb =3D> libslirp_4.=
9.7.bb} (86%)
 rename meta/recipes-devtools/debugedit/{debugedit_5.3.bb =3D> debugedit_5.=
4.bb} (93%)
 rename meta/recipes-devtools/librepo/{librepo_1.21.2.bb =3D> librepo_1.21.=
3.bb} (87%)
 rename meta/recipes-devtools/qemu/{qemu-native_11.1.2.bb =3D> qemu-native_=
11.1.3.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.1.2.bb =3D> qemu-=
system-native_11.1.3.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu_11.1.2.bb =3D> qemu_11.1.3.bb} (10=
0%)
 rename meta/recipes-gnome/epiphany/{epiphany_51.1.bb =3D> epiphany_51.2.bb=
} (94%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.13.bb =3D> libx11_1.8.14=
.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.19.bb =3D> libxpm_3.5.20=
.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.12.bb =3D> libxrende=
r_0.9.13.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.5.bb =3D> libxtst_1.2.6=
.bb} (86%)

