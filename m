Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6119.1794231652258866288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pG+S9ZNH;
 spf=pass (domain: est.tech, ip: 52.101.72.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDHctTkMSqngV/VvtvwsH5xK1AQuKojQSbAhL63su9xXNBy3psm55SVUg4JN01T+mHW+tn3ExTg5+l5kcgTpNhm/B25YLbMI+Ra2dNGnp97sT6qx9GDkZUSZfV8fAPUj9v97ZZgs7nSudyjeauFGxehJIrM8fF2jFwzrJsh9jfBAUDYMES80JcOa5UdjRJXC4Ashplf3fgBJ6h9ImNXhelMNkqk4rqlPUzofSpDxBGwXYdbzV7mw6gQAYP/Wt9dSR5kVUu5KDFBrRQfoTPy8IHMEj4jCFySH/tj30hmaYMWe8vy1gVG7iugag/NZKvV0GRC7cLkAc0iK2FfEC2XyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHTEPNwHD1LDlNT7AFjUdjM3G71CWTt/akJp/5fF8Sw=;
 b=vtMdr+xFwM2/R9KQTmyiiQw2KyLtISB9wHy9dPoOieJQg+ModbPtjPU1dHE4rxhzpP044+sWTBiQd6BXTReEYfuqfEjXb0zLmbOv1aO6Qy+mNFAZ2WD16B37tsgZHnDUNHbfKq49asH/QJJhKKAWcwdGpwR+3hby2C2M2A4ryxcM2GCNaReaAGWB1ykFrcryASkKEMSH7GirEaDbnPwMHJruNvPNBcO1FNK+Aou07JOy2i91hYRuWeB8v3rwDKFwSQtQDS/d1MQbelEGT+oH1Ri508fMOa7SAzlZidY82k5Mou5g3zRsign+VWXI5AafmDBg1oux4+Fd4O9cGv6jOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHTEPNwHD1LDlNT7AFjUdjM3G71CWTt/akJp/5fF8Sw=;
 b=pG+S9ZNHBGzsKKt2Qe+4TifStR+ME9Be1/g8nuo6wqwa+4WlUhWgXWeiy2esbHELZDEZsxl6wumyBnFPDR2P7Z29UxAxaOT3JC6/jjdklR30H7ygSARX2x6qiW/NAttSrZ4qwAWYEJsz0obpIkK/BqwuV6X6LGdmiHr2ry9jRx8jerEvWY3EtbrMtQ0+akPbPZOjeNByTt6DeTurkL5SN92q/Qfvdo927nxZNhBEWdH7DCzyJwtvaRdfwCS3p5GTHiEwQC3gB67/KTSkaEbtjWU7QMkd3p7MT04BhQasaAXZfPQeMOrUH+vybX1gUjxu2H4lExL2cYDuDtI7jZ2bNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/21] gst-examples: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:21 +0100
Message-ID: <20261109134034.74458-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c00a05-4b01-47ed-7bd4-08df3e6710f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: iVc851qOt5dYpUvFr7RYapjjNycj6iaYs0VEE2vG6JRQdVB8UccNkHi24hFdCj0dP4TZnTD2/0+gEGEyknLp/T9XImJ/TIYy2kDvSL5jWS5PDBUpQZOetgt1Kb3bMD/+4DOBTvOt6VSr9L0hEW601xoZ9jDzXCLruiLX5YfTudb54xZbTcydcOImrtGqEgk3RapV7dFo20qJN71szGPncVo9ZmSL2QX2mkTtejX2wA3RjvunuMkr6xfaFayWuGu4eQK+spCV78dGJ0+aYrPz2LbQtSAa9wWL+dorYYqbYAx1+qTsr0NmHJ0GBou4EJeSLGOsN5ZazeiYNU6zqAa/teYffOOatxLcEiqx0gfqfurgE5/6hHjJ9GPK8cyyavU2hfNLpJmWs/oWTX8UI9TwgLtHHLJjoxI6bYbynXFvwJIh7hpMXoZBJ+Pea8APXcOAqjR9XDdvI94Tv+R5m9v6NutKJskFZndol7Fsd11Byh+lWX/oXA+jtpxgMZvX6KtUaGpu0UcVqvDCFo8raE9jY+sPJ9h+TPRX/YQMeDkgR2DP1O+W6Wkw1xXMDQIPFP3g8YxRXluez8dHYJbJVMW0sBF9AQy361gDFERLjRl5y7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GhKrjMp6qnrfU+ZAstg6gBTNUHP99PNAeUUdAyehDjtvekD6bkt42UCuc9l8?=
 =?us-ascii?Q?OtvHmKwMrMVBBN8UDrHzWce7bncCUU0vSD2knB4bXHEg8LxoNTsNhDkHuvCQ?=
 =?us-ascii?Q?MPh85yr2SMx0X12+zK3JGBl47JQULgD+RcPz07AKGCj+J7Zl2nFd8/M7+aRi?=
 =?us-ascii?Q?9SQb/CrkdZZ3wqAb+8OKEdcmjHqHJc3x8Y4/twxyePmFYEz44KIpCYpaFah4?=
 =?us-ascii?Q?PDksSstZDkWqOma/l4DcdKpIbjSPdsWvIURIVvyqlaXKjxBxe5GoQISKcFPn?=
 =?us-ascii?Q?IrnOPMRk0Vg/tnO28CDWaAHnCjI3wVqNlwsi+Rd8ZYHMbPaTV3d7W29QAtf1?=
 =?us-ascii?Q?+IvRMlQ5iP1WltLu6tK8XbZ87H4vw48rMHdWMizQEU19QCYMGrtH4lINkA03?=
 =?us-ascii?Q?XlNRzWMeXxMHuA7e2IbKfjjWKIHTS7P2p/bCgLvw+Qzzk+r2kwSu4ls/z55T?=
 =?us-ascii?Q?IaPuzrhrSL+olRvc4ycC7F4we3hrN6SWIcp0dxyLKrSfyzvd2cEafhvrGuBZ?=
 =?us-ascii?Q?JHPJ19V7p2NEAUheSOiK4C1OOx+qr0oAJTvJX461Qrmzppduxc4dJhlaGU4i?=
 =?us-ascii?Q?XRHMmQqVrZ2mPw4VAlyCPoMON9eRxEKIRStDc7ojrydHEopABVs7BuQrPsA/?=
 =?us-ascii?Q?0zsKm6cb5U+ZrsnKEqMcvbqYnFXmZ970po//z1qbM/8ZVS/xxcuzdXjk55UT?=
 =?us-ascii?Q?UXBO2Ib/m/Hz0Z4+w1JabxXHOtFrZefjVDAq3jqCxlY+w7pwEUvdBegzJQ/C?=
 =?us-ascii?Q?L0//2g/Pc/swp7w9xZxhjUoq4iwK+rLVmNyhyhfsT4PyzOk7N0fQtVwfY2zn?=
 =?us-ascii?Q?JRdyS7UyvBKgk7iwRd26rx+igziX6QMORHJ8DLdUYB9v09qRIofodAbVOBAi?=
 =?us-ascii?Q?0ysI7Gw8sjVhRCVv7Ja2quAkhkwTvtWHoKc+5hoLAOQDYUjY58KgoEkSHo8Q?=
 =?us-ascii?Q?y92eH2Vip1G2bBmrCvHTTcCuDTJsu32gX3UCZNjgJQNzrQdxO18BAm/4l0ix?=
 =?us-ascii?Q?F9IHAoeRo6rxum78QSerlfxngfCOwQbN50iPgeLTkqh8X4cWhIYcmDHenQdc?=
 =?us-ascii?Q?KIMuhjo5gmixT9myf0uZib7vwQEouR4d3AMUD9mm6/NP5A52C/DmCP+ykI0e?=
 =?us-ascii?Q?jk30QbzWzhldKjDfHSQf53QgmN8tLkc2UYTb2lrOPf5nepKo9IOByB+5QdKd?=
 =?us-ascii?Q?Acn8PuKSwt2LzWVSCxWEI2wlrqO5sdzVjHUBvQ13/kC4xw1JtAsO86mJKY/7?=
 =?us-ascii?Q?OVSzeBqH5/gUx0Zh4Z4LnRMQABPlpAXFejo2E5SI/et5bkZG3GlPhmMmAOQM?=
 =?us-ascii?Q?nTgVrH+KT+rjzSV92MTsgbqF99fJQRHxBmO+p+3b81aayiMj6U7J5T8qQdAt?=
 =?us-ascii?Q?LemrFrzIcUj7S2dr8hTjbxc61uLaPhsbMwzcuYqSv6SzQT1E6y+EuJDwyh4V?=
 =?us-ascii?Q?huDVLdCf9H4GvMi5dHA8KtDOEpARB3hG+viK4ipOjccurBeCNeb31Tjk+d+0?=
 =?us-ascii?Q?q6bnZPB6giMynVRkMVFXahY9wYmBG2BbNEUm2dKbYaR3zM0L8lKKlRy+xznP?=
 =?us-ascii?Q?+4lhnhCe6xVjLmKHQ77qsBWbnkEcdb19cHRJFigocnRZ9jotZdVd/+MI95cE?=
 =?us-ascii?Q?lNqRcG2Ru3XxEqvgWDYddYWFpA8tKUnvxxQGsTrpIIPZfgMcJypVGy4N5sAF?=
 =?us-ascii?Q?T6nuLb/q99CSiGMB4txGvnSj3u7v08aaAyfrLaWkMVavjePox1lMOW44LlQR?=
 =?us-ascii?Q?HWUYR5xIiQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c00a05-4b01-47ed-7bd4-08df3e6710f1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:49.7751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SAbyxdBFoL10QErENZCaE/pC893BOyigY/bszGLcRBZ2AQwBLU0yuWaPh2XAc6hWyASBLiDEdwaEskqBljbybo+l39AU4QaHtJQRzbItn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249813
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gst-examples/0001-Make-player-examples-installable.patch    | 2 +-
 ...0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch | 2 +-
 .../{gst-examples_1.28.8.bb =3D> gst-examples_1.28.9.bb}          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.8.bb =3D> gst-=
examples_1.28.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-playe=
r-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-exampl=
es/0001-Make-player-examples-installable.patch
index ab5bc03de35..0d29fca0fd8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examp=
les-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examp=
les-installable.patch
@@ -1,4 +1,4 @@
-From 92694bd5103b3a6e655aad0fed9c0c2ccdc20e50 Mon Sep 17 00:00:00 2001
+From 7457c8c6e68673db5f059c8a3f2aad2b48d05f26 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-g=
tk-show-player-warnings-in-a-dialog-box.patch b/meta/recipes-multimedia/gst=
reamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.=
patch
index 60169dc944d..27755817d5d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show=
-player-warnings-in-a-dialog-box.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show=
-player-warnings-in-a-dialog-box.patch
@@ -1,4 +1,4 @@
-From 1ef021f661d6343eb2be7dfbd12f4033bb2b5cc7 Mon Sep 17 00:00:00 2001
+From 98ac96c420e22a226ca5ba4486ae89fcb35ddf87 Mon Sep 17 00:00:00 2001
 From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
 Date: Tue, 25 Aug 2026 11:03:34 +0200
 Subject: [PATCH] examples: gtk: show player warnings in a dialog box
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.8.bb b/met=
a/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.8.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
index f108e620373..dadca1d0d1b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.9.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/gstreamer/gstre=
amer.git;protocol=3Dhttps;b
            file://gst-player.desktop \
            "
=20
-SRCREV =3D "1b2a95a1b72787cda146b46df9605b168e5b683b"
+SRCREV =3D "3ced45da096032bdac8e0922faa492a079c3180e"
=20
 S =3D "${UNPACKDIR}/${BP}/subprojects/gst-examples"
=20
