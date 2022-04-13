Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A39C4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.89])
 by mx.groups.io with SMTP id smtpd.web08.664.1649867656689394142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=gHZu7vUz;
 spf=pass (domain: outlook.com, ip: 40.92.73.89,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIGNtgxYYg68ufzBaUh19O+13LYfE1rk1VFJgmp/uorCPev+LJka/+8+m9AMPqClocUH8u4GlpCGldn7WAiqjyxq0jR7jJk8KrDhuPtruf+PqkTDOadomk1BJk78zuXHy15wN4/jzO9onWOdmerrfJn742VA7uLQqWE16Q6SktbAKXLFTU/D+0zU8NomoLPTK0iyOq4KKw+ep79nmKygVDs/QC9L7KUhkswnYvQ6N1YrlfiDD2XzlgQYi3AajkA0zXHrjbOc+Ctg6fhnfHn+e05ecYGcw6c3P4qvX9YY2YkNZmnbTbMDar6EehsGBmzPepZ+JeXVN19i0uvGLDZhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLIJyqKhyRe/jNBNafZUdC2o920AVR7LidtkXGv4Rfg=;
 b=G6pFlXHooFYgxcttm6QqfixDZaQ8GCrA70loXmNWAo0WDuncBF7CDRjoQ8HVTVb47/1VoXeTGDnr7uNtDmxxI1gwgiCDdOlxTJZ2Uk57etKY2fuh+6p1+I9RQRV95QdnBGANwRHvwSQTGVsrmOn17hTAJ4TmlWmV117W3RCb/Hwu/AUzK4hjNA1Z3i8CPD6q3GHyCNdkStQMeLBopDYl9iZQ3cBw4VBZRKceAfbFXBsjN1Isx91K1rm0P2BShdZgg4fnO6fU08pmizCPPMGU3oG5oBLvk2P7xODf8Ke8N6gHVtHziYFa6OxAwa88CFkc3xtwTUK5ytUO73mJ1ET8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLIJyqKhyRe/jNBNafZUdC2o920AVR7LidtkXGv4Rfg=;
 b=gHZu7vUz8HeW/+dv37P4nAEsGZAJyxOzd2YNVINP+ZBaiXWcwE6ewHmM5+OSo/WF39pmV915XBzg08sSSR7/qfWafRTiIL/V/z6xw4EFRiDiYXpZTg8Ts4UyS/6gXVreTPrDN7q3Lmf08ou4jO0lIhuGPn8PBAtseJDzBj8emHsZzOzTCQHgDBIGoUE83fZnTuDKFrF25WjfojkRfIb5zV7IMEN0SeJWMbVBg5vRmwIlRx32zgFsEQI4gMF6vXpERdFGitZZSO6+WzNHOh6eSRcwuYDkSFU39Md/wKfNIUa0KfQ8OZ8/4rRSZ0IyBlejP5Y7UNsQrubQjpeR0sUTjw==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by VI1PR0901MB1646.eurprd09.prod.outlook.com (2603:10a6:800:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 16:34:13 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 16:34:13 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] git: correct license
Date: Wed, 13 Apr 2022 18:33:54 +0200
Message-ID: 
 <HE1PR0902MB1801D263944083BC60D94282A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [DDlOPVFWdaxcExXmLSuKELDsuvjn3mh1CVyj8r93LrLA5vB9K0dB/3iT+tcKWaxB]
X-ClientProxiedBy: AS9PR06CA0771.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::26) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413163354.1924774-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d015f6-442f-48a4-e05a-08da1d6b7197
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPclnUwessPsblm/LR7cy4e6t4Pog9dcOS0wlkD7cu2FquNDAmvGj4SjxAp+YdTFoQbsdxBJ24DHYXe+tLEbopaa4cWGvrL4e9AJJsr3dIQcmp4IJ9IghimxusMEutvr4Efw2IWsBydRLLTXhnjnunjY2oWkJOiZIKEmUWYwS5nIc88rcA8mRx/MaY1tJe/XfsDBz0kXvy0ayhTkh4nweizV7h1fGSr8HMrUKM6m5c9kgZPDbmMiFnw1h3l4ZWGdfsvhHG1eBffgGMAOtkZ5iriCV5GQxGmxm8Ttsk4tNB7nuN1/UpqwZ9w8wZxpm4wtXeh0N5yDLNYdyBZU5btfgwDln0i909jPH8eetRYa1LcsFCXfQvnoUF4DaL09toqjQG90Srq8zTxfJw/Wo4+6SESMDmUzbAbCMFKK94MXDDhlQDBKHr6HMlAwvIH34Ee7Q2xBahrpNuu3nbelAQj9tznMmprLFi/i3TdgLWzIlpEUX5weoRrPiGs616BEqMC6uibzpYgaek+5frspNrIxCoRaMAtxyK9LGuLsLdAJ8h3COT5DN2XtCsUsLiaBLGpX5ENf+LqaTmyUJhA4x0RCAyCnVe94tAlYNuX5ou2RdPEbHxt7wsmXCKcvtraCcVe9hA527hxvtyt7vkEqYxNk/asY+ZW1L+VhDZ4vVrZHN81kpXkNqQ0n51FtU8xL6O+cQGKyLxy08NcvZeLOxvdL7g0gWj7+YuepIOHBMlnKBpXiozQdTLzLmvvEYxF2FCd6oMfE=
X-MS-TrafficTypeDiagnostic: VI1PR0901MB1646:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5qW0lTIeZkH/CxNs0eV5joApWHAE6VWqh00POLj+VZgOPGtjrzewMUOZEDmzbanhKOYgvF773iP3wV1j3Fq4PPx+bH6gdt3LqCxxTdqKJ8ErlfgT3ur+YSIABUOh6yNR7/gi97PptgPVIexVkDnICVgYFXn4cE0TMPoY7qtggO7AARoWMqAZMBmh+Adq104j3PArUsLCrlHsQWUpXZMxeoHaEEYwmB+DaqgZ/fTbJumitS3EPizZqWcEcLHXJYqoVs8n46TvENko98AwgqfuC/95INfX4d6Zzohn/RdlcziBqDt8Vcr6U03yrLyF7bBiZWHhl5Gtrpxb+QaDL1/THd1mI7KL0W7MPHBdq4n9giLGMquVUo1OYjkxcXldQ6wARcZu8PM4UQYoU4FzLr2XToACBYmrJ2UTIsUxUsL41738dUhPu202vUIC0cuEumkUBdRgQF5d8WifRlgCXCHB/7jDtGJJ3Jpz90/shBylFWmivTXUWKiov2+lJGulrUwiPENS4jwGlZJ4kRjb3XFKirLLPHnLl5EZ6nW/+UvyNbMli5uvjxwVvP0aulimZx0XInHjL8q1tsMlWYUzzG7itYjQALZi9BqypjXQ4xiKatfJLRW9n2kPRvY/8lZzqnXu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rPp/x6qLfVcwAKAPaFTSfcRYnumw+MvDIcvlSTXyjge83XBpuOvayFjWPSch?=
 =?us-ascii?Q?TikQ/jc/BNXG8AXgrjD7H/TBD/YVu+t6uzbr32tpVp1VoDa0uCNbG4Gum3BZ?=
 =?us-ascii?Q?064ALpMdCCnXnn7+v9iQylAhzZ7uXR7HFWIaZ5pILFReffVw/5G8E4BwrIXW?=
 =?us-ascii?Q?PwQ9X+fjHVnBDpXFZu0AYKDB0LNeivAiqUtu2bJRN9qRdNjSGti98QxMwBcU?=
 =?us-ascii?Q?807Nc4wihGj1h9vCD1qfuHaMbVT/nT+B+LxKJ6qYjKDVNoJlf8rCISYCzLCo?=
 =?us-ascii?Q?07bTRGFSJbcTAH9G8Jfp04p+w50B4VMOVtbtIwd4oL8Z67E60/mby9ZrzuaD?=
 =?us-ascii?Q?Hy2ezhY82SSFBM0s1I/d6j9bic2QoRWm269C3pLQJBDNH11JbUpWUsfnQ8ps?=
 =?us-ascii?Q?TCKY6foy2H370Qr2cdEG/fY7MgDpiURPhNJ42+Sar6W3gM+9nqR1Sjm1DL/0?=
 =?us-ascii?Q?0IQCOXHK4jyzAodkPd3ok/MBqBiugtI5KM4+ZkKCxQnEKhSuMN5CYCwrquMk?=
 =?us-ascii?Q?meHioIk5tFTD3ybyXuoEOiRyCpsWCZXO5sGFBz7B/pIoOKrlV75rsJAJNzrT?=
 =?us-ascii?Q?sZzGEDbHjLJKX3WTRch97XzWNT7VYus8sTab8aXa5iWTYRDrCGLT77d3UgMo?=
 =?us-ascii?Q?tk8I5RPo38RR4FMM28r+V5KDjIgO79NgPfEKfpSpl4uZeRwTl4zLdjqPQIWs?=
 =?us-ascii?Q?xWsjparqlys+mnkikutMQxW2jsDspEf890m3muMULnsi1Xt8mnivxkP8SX8V?=
 =?us-ascii?Q?szAri5sDLROJ6p4KuR183Pm0wsDlGgYtPiaBdmJ96pSa3nQwv9QkGK/WIPhM?=
 =?us-ascii?Q?+roDgBio2V3L71N6Pizgei378nI1L+bazIcvLKX92Qau9vnoi8b50io2CKnU?=
 =?us-ascii?Q?kztk1i3doY/tP7R7R/NbRICeXER3RkAiZ4nhLl2KbdstxUYTNoD0sXXwwnq6?=
 =?us-ascii?Q?2zrC6NQJAdSMbAqlGvzv+0wuv/PUrRNabQBj6f3+pQlZ/GPEnNYh7yNG5Cyz?=
 =?us-ascii?Q?yg+7AOErZ3OxitkspiowgUNwBc/7NYjyFRrQPJFpdI57Vh4V2bg0NugzADZl?=
 =?us-ascii?Q?uTKjp7VVMckNCD2JOpvenWXn+U11dB4/aXlgYbgACdfhrkyXDWxPGwc6Gp7I?=
 =?us-ascii?Q?3goLDn+Iqjwa98eMSsNySQXpHcnMooIXr66E/F7iGnQYir4R3Szyp/rPhrx3?=
 =?us-ascii?Q?SJZzJ8Si/MLLpVeIub/HL6FiEcO/ncXBhmUj5tm2kLD1IVaB/AAWQYuBy/1I?=
 =?us-ascii?Q?uBWeFuNrFhn8t/XF0oMXHTjkx2Kcl8Rw1cGwwbI2h23ptoatHj5vm2mTVhbs?=
 =?us-ascii?Q?t+7pQr1u/csb7DSRBnaH285pH70uGXYDp9QWBxQ7+3+tRCr9RqKoBmm7Xltk?=
 =?us-ascii?Q?vMrLJqfW1Xvxlz8RojMjvNsuBEzr+0zVdUFHvQ4Fx9hsGZOjO9r+PI+OHzVx?=
 =?us-ascii?Q?TNQfTeuCWB2NxW1ZA1CfJh4UcZm08Ied31eb09OiUrpebRo0JFczopwwudvW?=
 =?us-ascii?Q?mqG2hcdF0a6ZzSM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60d015f6-442f-48a4-e05a-08da1d6b7197
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 16:34:13.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0901MB1646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164341

by default git pulls in several code fragments not being licensed
under just GPL-2.0-only.
In fact obstack and poll are taken from glib, being licensed
under GPL-2.0-or-later - as this includes GPL-2.0-only, use this instead

Furthermore
reftable being BSD-3-Clause
sha1dc and inet_ntop being MIT
netmalloc being Bosst-1.0 aka BSL-1.0
regex being LGPL-2.1-or-later

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/git/git_2.35.1.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtool=
s/git/git_2.35.1.bb
index 47c2211864..f8756b6dec 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Distributed version control system"
 HOMEPAGE =3D "http://git-scm.com"
 DESCRIPTION =3D "Git is a free and open source distributed version control=
 system designed to handle everything from small to very large projects wit=
h speed and efficiency."
 SECTION =3D "console/utils"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or=
-later"
 DEPENDS =3D "openssl zlib"
=20
 PROVIDES:append:class-native =3D " git-replacement-native"
@@ -14,7 +14,16 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${=
PV}.tar.gz;name=3Dtarball \
=20
 S =3D "${WORKDIR}/git-${PV}"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e=
1"
+LIC_FILES_CHKSUM =3D "\
+	file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e1 \
+	file://reftable/LICENSE;md5=3D1a6424cafc4c9c88c689848e165af33b \
+	file://sha1dc/LICENSE.txt;md5=3D9bbe4c990a9e98ea4b98ef5d3bcb8a7a \
+	file://compat/nedmalloc/License.txt;md5=3De4224ccaecb14d942c71d31bef20d78=
c \
+	file://compat/inet_ntop.c;md5=3D76593c6f74e8ced5b24520175688d59b;endline=
=3D16 \
+	file://compat/obstack.h;md5=3D08ad25fee5428cd879ceef451ce3a22e;endline=3D=
18 \
+	file://compat/poll/poll.h;md5=3D9fc00170a53b8e3e52157c91ac688dd1;endline=
=3D19 \
+	file://compat/regex/regex.h;md5=3D30cc8af0e6f0f8a25acec6d8783bb763;beginl=
ine=3D4;endline=3D22 \
+"
=20
 CVE_PRODUCT =3D "git-scm:git"
=20
--=20
2.25.1


