Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8437.1792578628632303065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eS9+He4l;
 spf=pass (domain: est.tech, ip: 52.101.84.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmYnaFxkjrhKQBzbTWg3YlORYQCHKrAz5H6Qi3guT95mBIHZUZj2DrYcCzISFp+wz4fBV2t5CS6qNWMt/KSL1dmwt+Tik4NivVWm7DffAqy+wCxxZHIdenQXJywN4cWwdqbqkaUdacKCz//bY+byG8btfFCdS+MaMMueRWnFAau0T/XErv0LRuJShO3hGODgmgzCyRU1IZUqTa31Y6KcX/u+lbp9dMGwiPoFyJU3xcnscHy0E4dQaAAULECiPTt8UZAXPwmvb6oT7bZEWBLwmOQmJ99EZsdCeWcb2SIp5Lc0ZdKFY5crq0AyX29Ohdp4mdfaN/ThYaoCvv1n4Ivdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yI0Hh+gOyivXOtHeSNBYpqDgrYI5WXQ/Xl5/PF5Y+Lc=;
 b=lqGOvAjbPM6Pn4DTwsPcV6IxrpsHoAe3e/bU2Sd0D8zIdSGcrAF1ijo3IZaHqFQypCwYXND5KWGwiGcxn9m3Ky6Jbl5RbLqGnkGdPH1PSLcVXwblbt3Y5wtLLzdZoIp1tPiioWXBu/e6UbXMSCrFLiwmiyD5l1ERk2Ql4kd3k7tCxroAOGaiuIkPaYxTBKh/7Vr4Zi8qjvTG4naeKaP1oyyTYxMttJaHRfdy2cgid96WsX3Zr1i37Q32Aw3OFF5Pohw61wZwy7kfSEvBU/J4ryE4CWURdJDh+xfivIhrxwEekwv7T/evIBhJpjufq4qT7t47t0YEgz4a8u+m2UvnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yI0Hh+gOyivXOtHeSNBYpqDgrYI5WXQ/Xl5/PF5Y+Lc=;
 b=eS9+He4lqcMI5EcgOfQkzHblKgaFMPL7Yqg/j1Se8DegJjiFb5XM/+nAOKyxxvW4SCPwjFzd2DQfu9+nY1ckySkXjRISwnbiMaJYHBa7XkGtAFBcnWW8T+SB6jfogh/sfI+yfNZ0vJ0Wp1U3hGGsQ7VNSqXrnoTV+7iijQxIDILn5L1rF9eRohrNP9RhWzzqjyTUWTB+IyBo7E+6BWGl4wMe2sb4WAFYN7YXVUtHtYKacZYT/JGLsWahGre7vmN4rbgSFQDlB4b8tFj3VjdjT5s0PT1fD0Q3GTwzGxcPtNbbN1/BoAVkvc/iQQCrTYMmSVW/VEMs82wyMHKbPfRxfg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB3131.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:291::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:30:20 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 10:30:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] iproute2 upgrade and updates
Date: Wed, 21 Oct 2026 12:30:15 +0200
Message-ID: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB3131:EE_
X-MS-Office365-Filtering-Correlation-Id: acb03eb3-6688-42d5-4da0-08df2f5e4ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|10067099003|261009221727099003|261009223027099003|261009223327099003|11063799006|261009220027099003|56012099006|261009221227099003;
X-Microsoft-Antispam-Message-Info: eajTg/nXua1TrzI8qNY9P7XOynvG7tFeCLY2lkb7Kx6en54M3oe0BpymWyfcNjbORhOxpZgFVsSPqht/aS068Wbe0nPi9IOlg0nRtTlEqhOaREU8bY6uUq15trOt97iAA2TyxYiED6Yts+a+ICPX0BXcQh3wTr+XUDXUZa+BKxWDX7MGwqoDkSMkq9pK2Zz+h1ScqeO7bVkJ+dbUS0ndFOWuvja/vtsyQSivcpnBBOkpLPt5y/2vdFSH8zsfiXCdOpKzxYTh9mtr2+N8GxmbZYVEJInD4kEnEgAAT5Y2dfqC7RqHAxv+S4JcJKVaidLj85rRstQlox6WieTZ6NWl+nlhvo5sDPbJiWHd+/ZPlOz+BLRKLhBrJ6UieLHxnuiurlw0xshB/JdzqJjZ3rrtnQInb5XwgNcCUmwjab/CLTLVBBkLvVEQfsfd7mexgPe644r6EAal6pZq6zHQswsejIDSB5vgdiDkyr0bT+/nM61FzuvAhkf9kdappcbB9b3/IGPRhVe99iuSZHXjPAGF+zTs3LEES+7m4Enl1aO1BrQ2LHkWsUqOyvmS0lDvTKbvjQQAHOuuFYcNjEZVIoSjc3xLgMq53ekd36xex4IHfNUCE7EpHLswlyyCqjGqno9lQ18BY3N3lx002TQ0zc+Gzx1P3ByEUIRz08xWSIZJ/Os=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(261009221727099003)(261009223027099003)(261009223327099003)(11063799006)(261009220027099003)(56012099006)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LEdoli/oS+hIhVuxMsDAetJ1aFmVjpwMKJcOU6ey9zsu9tl4UMAHLnfI9dsM?=
 =?us-ascii?Q?Mujlnu0F2Cm9u7BRd76wQsi4dkjGf3JbwpFcQVPcA2qwE5SivbfyGQLPfGwo?=
 =?us-ascii?Q?fdu1hx2DJXBRy03W+alZiton6uM2BeHzgRcxfsUNsBYmvskuZe2uY3Y5lm9O?=
 =?us-ascii?Q?V8F9Cfi5j5oVPkXhyiAQrYnVh51My7me/0G7tB4fpCZt1kI7LZbUZ/h2qVaI?=
 =?us-ascii?Q?ikst/3x5Gw7+JnTKTGeHgqmLVE9T65bEBR3vVE/VUCpFjVVsrPtSIlv7MSdh?=
 =?us-ascii?Q?Rd7Nxp+hcXsdlvlV7X+srck0ZVoMVP5900S7f908zvd82h4SrRoTR/shfy4j?=
 =?us-ascii?Q?N5qOJ0DKWNTNxoahxQWHr7KvT3mbNoFJ1d7SYYzmrVn1ObYgyA9yg+ZZV7BF?=
 =?us-ascii?Q?3icE5FwCYgSDNJpYrBKXq92vT7ZCzejGzznJJRnh27/PnlDQXwEvjTwPpmFn?=
 =?us-ascii?Q?zbhF5ovRhtzWg9XvNP0WN2acqld9XxyVEivd45t8b8OO+UVtUFc7xuzdx1k7?=
 =?us-ascii?Q?9385+YSbu7aIuG71fNs9yCVq6iskXZpx4lLgW+uVNjQOUn31rmbUmY54NyR4?=
 =?us-ascii?Q?49ZeMBPlIiln3IDJojcb1Qp8N3a1tU76m6xBVVt49iUBMr2JtVcALoplnd2Z?=
 =?us-ascii?Q?xsaq8RCuGdqaSp7xPtw1mHFF7RxZiTZ+DUKZCNma4UN0IWrg1aIlRCSrewbX?=
 =?us-ascii?Q?gznFnELeVFUGevbiPrnhfwHudLStA/4h7W4EJB5a5qshrqghdCvzoh/ppP0P?=
 =?us-ascii?Q?kpQQ27n8pruf1MRs3vhRtpqK8+yOY7pbhAb3lTkMDYokcN5ZqRq31wroVBrN?=
 =?us-ascii?Q?Nu/7UaMJ6QQUn2r7WUwemSMQSPzwTdv5Sj2b83UZ1fsiAFO3EXHtPYRoKvLw?=
 =?us-ascii?Q?BP9Z99sfkOXthbhZWdkL5nszw3gbMUlmkFu91OGNQatAFJYBSaBrEGve7mq3?=
 =?us-ascii?Q?GWw5wjYohWwBCskMzo2ed9mAjU4gigdpvCvpOxVAOhVXvSn1X9QwyLuUuIA8?=
 =?us-ascii?Q?FRi/f3l7JWxIj15cg8N9l9/hBP2y4j3R7iIYt1HJck/l6aaIWnR2iR4bw+yU?=
 =?us-ascii?Q?sNfX3i065L0HjRERY8GW9oSfgQjvB3c9nSZxnonJbwcOiQtxGFPTPC/GNVfr?=
 =?us-ascii?Q?8fY8Ie9g2/ZxyDup9hZZ0+ksbwUt9vCYf9XLy8oWWEgla+L4pYhb1ID4YPgO?=
 =?us-ascii?Q?SglTP01Hvnf515WXe8P6MuZAh49u3cmuMJV0Y3CUCt1pWdulJ20mVnd3E3aY?=
 =?us-ascii?Q?hIBbss7NOwBnOInedenrXzEePD7UwV3MgKGqZ5umzW3UyujYe60j6D5vF4GW?=
 =?us-ascii?Q?kyb0Ja2uRIFyjgD8TF/bNmvJbWdfTJBOESlYy5TUZ8tevfjxs5bsQr4mdmvG?=
 =?us-ascii?Q?tZ718U2a1Tiljv+hlRXpsTCOWM8fwhXzMahNuM+A/FmQMiy6VKb53h41TUuh?=
 =?us-ascii?Q?oPhwW6dP9uZlfqEt+HRCACprXHzK/MQxDDMBbDwr/sVBRwaPdNzhn9c7iHkJ?=
 =?us-ascii?Q?H92aSswx4egABWCfgDVUH5HAzhkwkLV7B4WF2T7qMJwrtsRIB9iv8FDuPnh9?=
 =?us-ascii?Q?S6bq05JReh2ufuAiLgYyiact97hMzJjHOWtQtP5yblwITZqJbTix8Kr2Z1OG?=
 =?us-ascii?Q?lXJRTunrY6GVe5enNIecVt1hwJccbk9poo17Id8+55/yaTWSBhISoB19iElw?=
 =?us-ascii?Q?4ImJFeIDtqUQTA83L8YmqHMUPftK9fnr4NRkydXk2A/q3x3iXFyMrT3kyNWp?=
 =?us-ascii?Q?3BZM+6Kt8g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: acb03eb3-6688-42d5-4da0-08df2f5e4ed0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:30:20.7450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b245byB2aUudDtcBhIC/j10UVGTz4mTrlkdAYBsuyL21YxPaMjz//rF0Ht1Cnp5+RfpI1DCNKMmhRrRbLDBIGT7bwnagP2zjb2+4xOlWZAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248387
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (3):
  iproute2: upgrade 7.2.0 -> 7.3.0
  iproute2: drop color.h musl patch
  iproute2: drop obsolete GCC-14 musl workaround

 ...nk.h-add-missing-include-for-htobe64.patch | 24 ------------------
 ...olor.h-add-missing-include-for-types.patch | 25 -------------------
 .../{iproute2_7.2.0.bb =3D> iproute2_7.3.0.bb}  |  6 +----
 3 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-includ=
e-libnetlink.h-add-missing-include-for-htobe64.patch
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-includ=
e-color.h-add-missing-include-for-types.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_7.2.0.bb =3D> iproute2=
_7.3.0.bb} (91%)

