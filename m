Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C3EC41535
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.23])
 by mx.groups.io with SMTP id smtpd.web11.1120.1649869750700382414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Jdtb2Cdv;
 spf=pass (domain: outlook.com, ip: 40.92.73.23,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmRjp+uMjihwQzOxRu3pSr0URfNNWXeqh0WNXKzP8j2fN/UNQ19tBeN+ZJyivIdI5H/E6KUITITdJ8UN/F6PBPoXXy9AYKNf5QNkOBYrCrjort36pqwWrkPHjJE24jTHSOJx8Arx9sGIq3qz461R/3kxfuo8GR5OqZLjcoMr8/1oU9rbKITN2mBAAVHUINcN76HB5UBEOY33h4yaYZnxyye8PTnbSam1F6hNdOVVYkPFbsUrE8p05GlV4737vb5+XUbcmY9KT+OIoGTnDDLW4QpTYz6VJzxj3Dyls7b6GK7yQleomQ3BKnkL1QoN4+CLEdtb4i+w3Z9oEFBsyhovsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cZ18a7EpJiRWU0k6MAEwUS8Kkmw004bAdcTq8n2cko=;
 b=Zl/hHwmk+/KlMoGcyfzbXzuWjqTOoI02p/m0+2LVGSt4su09Gq292AqsJc2Pz1Iy4KN3/V8S0OvHeb219wQmvwuBuHHnaXiIxduwX+Sy/xuS+1uDNFMXr+4kSmw4OIYejSt4qQ2I4+lGcF0pka70g3Tn6TmbjTsAp8TImdaD7gJ4lgXZm9hwmhZStip605jUmI2zxKZ+rm5dCJxmaHVBa7wg/DVr21TxVSKOQU7EwdlsxtcYtatAT7bvGlACHUN7ulpPeY/FyUn4sU8PocVEC+vM/MAvcVc/QVvUS81Oeo8HPyOEuVkqJJ51xNw3TIk/qIAWPI+SKXtSXPWf/Szqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cZ18a7EpJiRWU0k6MAEwUS8Kkmw004bAdcTq8n2cko=;
 b=Jdtb2CdvmvuhjhsemPcsHycG4ydiYSSQ1qjGLV/unDAi6tQXr6DAFojFoA+Ih6dPfjNQWoVEN9YYci/pxmnRW9crVtKpMOFHU8hULGDlj9J6PKYNb9QnARaYNaL4LuZbukoKy3gDeWMxPoGmnF3i79vrRhN2xaDgS6DLw7kP84E9hJXVNUpHskJG0Bx1sIRrSJct0nG1PTDjItSW8Fv08vff/uz6i4MkHLwqIbOfB+EJA7mmmopwn20Du5MrBM8VupxnAfufnrZuQ7GEk6gl2z95YRcBr+VfDEQPsBUuC/Cb3mkoftq7DHQTzARHi+ZKP25kC4KNLe4qteOSiNFClw==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by DU2PR09MB5264.eurprd09.prod.outlook.com (2603:10a6:10:239::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 17:09:07 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 17:09:07 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/2] ncurses: use COPYING file
Date: Wed, 13 Apr 2022 19:08:48 +0200
Message-ID: 
 <HE1PR0902MB18019A87B3863FB6ABCC662AA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [misE2w3wVMQo//VnBNCmFMY9XdDNm3YIkdMI8dBVdWX2VyVUtENrS/XNIAi1GCOl]
X-ClientProxiedBy: AS8PR07CA0037.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::9) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413170849.1969030-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21123910-3614-4d54-b302-08da1d705191
X-MS-Exchange-SLBlob-MailProps: 
	6rN1YWC+iUUh2cOq+DQcUfaIDPLB9lCFvHMW3D5S//BBUJxuKbEtHh9uyxJz7HW3ogiBZhFewB1If3mumizYb+7hCjBaJZ1bXfW1sHtU/Eig6JHf0M4gQ71SwJqbpHLFiz+OjuFCHrJKY3aE3BHxuNyhPWc/X3qT/j7WSxYcgF8/M4BsZsYKORRAZdveMTuYOe8EE2qeZOhB4tOCMvXI/XZYq+eyvCHlvCeeYAKabAApZAqXPrjxNmmNN3JKokGpT2lxIuE1gf5QR+cHUX0uE1a0cCgAM1GyZ0A4CWiWyXBOAmkSHGopepZCCIgNrlIh4B8hPyad/q8x26D2iJIb8Xlq0D803orIm36WebYkMxmK6Re2YwDb4uN/dkKufoUQfdkzaDufsJcFE16eKFBkOvGsKqR4Q8oJsbk8AlXTNqdh+3BXCRXvEMsq5jiQnaDoz2HLPDXrFI3cMHbe20Aodci0SOQ6gfwuD6AhRER7j8ybsZ8eROxLOozQ31IWhERZ4jfXXiZRI2X3tOi3zX2gVLqcTOUbA+ArvlA6qQa8IhUA4dIuDBPFlgT8pXj7HlT80G+WP+nEYCXD3VuD/Q3/n0mukTngYwWewMN8hqGz1+7BvRV/fp6g2s45L9zyEgRCFSRFdknKbxpMxwlG2tOqhdRhSwzbly0dULtKMsgX4N9YspFGP24JApJ3XaNLWuiTNQLgCxYn9zm0dynIfQkhmoL/B4OI7XEHjY9kEtCtpdbm0Bmko3yMYqo/ykfELKIweCF4KyH+oojhURpAbojpcyc+x9N0m8OmObMtHHPOdu+X3Fubr5U8sANHXmdwY5zL
X-MS-TrafficTypeDiagnostic: DU2PR09MB5264:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4KohiJWMcyy/8iMpVQ5ra0vSGqJ35SoBMrhbfgb5bFY+e30vrJS6g96iHqlayzS3Q4xifEcuncad+06Y1C1h6T5+NxdYcOVmKdFVv24QbwgcBDypVHwqdiW/YUld6VUAMiCrB4UHNMRJqKfk4v6vjVkmOmZNondlggJ4rLEdNuZtmU0ieHjDTsPoxR0LVFCKGYNyalm0N4o790cBnnmr1m/pBi4IUHtqkveRNA1LerWdPOZ1f49RxzmETlaxNgh1y6nP0t+WJk7LnED/H3LAFrbYrbspcxvhmjXpOBW4SpQ5qNjjvfm16FhOSVbnj6xNpAjjt5vpIBqvqp7LMwGeSYpwEw0L+PGyFqBMCjBIFCWQ+iz6yrSdr8qILyxvwYxunVFDAU+UH9ruPxX+9Tlz/S/7tNSNcheCuiNxPtcddLPOx5Oav0myxWRy+fHsdwGkwgziuG5JjPZtwcGRa4JVjBawUgtKM1rPCwnXA4NLQ0xuea/LW3RkNWjicEEk+jHSoes73iONnmHiJTVjuIcIcYA7IlzsWETpwxMCg3lmMB4fzA6qDizZjRuCcWYVDiTN+z0yZ7jBia63OaoDgEb1F5zmFJg2c962NaLc63vx6ZhXIqy6cRJ06vdRrCrSAf94
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9EINhUB6EEittOb5NDZpmC+8I4bqvNK/KcmmS0ftg9OJsyrXAF5r2mggGXr1?=
 =?us-ascii?Q?Rptc8v4WDOdD3NMUyTu7wj3tyNOhDWh4zexESSTg0B+7FSYTuX4ZmqtGMYP3?=
 =?us-ascii?Q?sYNb3kTnfqe/ub93regtIfGFCDFmVgJ8/9FvA9En4fOcfM2QtOquPNTKZc6p?=
 =?us-ascii?Q?hRAdkdCOrYt5IcZqg7RWSbUWbOhML4xI1wR8glMouGuxIx+veI9sf8ajqf0w?=
 =?us-ascii?Q?m0HVjeIZ1EVaVM63lE2VSPC0VgCmlhk/9vU+Ezx7JZMIzfQXaJEIaTmCy3N5?=
 =?us-ascii?Q?YJJQ6asMR/+z2tf7ZnOv1t4L7RG147G9xvbIcNQ8ziTrUQXxH5aN/x67tyF1?=
 =?us-ascii?Q?Yqv3aweNZ0KTgbd9/82xHeJOOC/+8wZIpX5RgA1sQ2FTdRMVvFSaUK1sjGWr?=
 =?us-ascii?Q?5hBI7YA5f+XvYngR1SAVeU5gf163QlqwVz+u0H4+oQK9UA3fQOw7goPhlrTz?=
 =?us-ascii?Q?HR4sJ91BXTmojl2eNZzDBmABDkhjOGpxIu48mCrvXyeG4ihAUtef1iZ/M22U?=
 =?us-ascii?Q?px81VVqr0jVz4z2XrWiqkEyUxoetWH4IjZImnG77jX1vpySfUP6APR0bJW9R?=
 =?us-ascii?Q?bbMQzaxR9cwfQDLsl8DmqwX9g11oi+nIk5TtEmvoIzs7tsWsES+ZXU2gQ5wt?=
 =?us-ascii?Q?HMZSh3jvC2No6FK+WZJhiiknFJP74BOKqsc3HDHYAA/blbidQ4hs3o5cpJ/d?=
 =?us-ascii?Q?v3NsYVHWRg2CG0tgy1wGxRpqASNBYJk40q78WGWzz3vEdtCI/CrfkrOpsnjj?=
 =?us-ascii?Q?Zz2a7KVxEzT32H18GkPu11e+Ep1Y5elTI4NpgM7AopCmXyiVhk6ezX76H+uY?=
 =?us-ascii?Q?vKsLMCzvZo8X9+bBejptwV3UOHhSD2ymcx5xtnuTO5nxilmMppEL6PbAVy+2?=
 =?us-ascii?Q?MCZLhD3kGBm3chjiofRHSqsusJCQvaHb5P+w+J6tGSkw6+zqrhUCaC4pVFHE?=
 =?us-ascii?Q?CeI89StWuQcx3CCAd5YA/FZ6Bt7c2fvrIy0BDPkVTcP9FoSHNNkuWWFAT0eb?=
 =?us-ascii?Q?006jCC6Jn7yCKWwI2qjYVtUUW0mZQhcgjxP0/eNFxEaSQjXaOyYVHeqfYr7V?=
 =?us-ascii?Q?7BfeyvlezgNbb3HG944dfJ0BhdEwsK119HsBAGyP5I38CspgqKNLwR9DPyzE?=
 =?us-ascii?Q?pp21gVh/F3XH90f5OidrfqxD2VAMwTmTOGM/FODQsAZRr/4iVAwDTEJsAxwy?=
 =?us-ascii?Q?5XQtct3WIxj1CNqtwivepIIyDhpfGMWYYf/s26lKhrpEHJVz2jnUipBuz4HJ?=
 =?us-ascii?Q?Igzd5whIG0KSSF/WpouG8UHaU3HDjTevG8jXUtqSrvHHN8UR7Ux9IMFaCG1z?=
 =?us-ascii?Q?zpZv02yVzPMbVleVcu3ozK5Kuv10huKpDmKjNwhc4sD1JBYXSIbsoZ8E5GFl?=
 =?us-ascii?Q?MbdKnY7k8QpG43nyzAN9BU5Ac31e+g8ivnk65/XvpP344c4WtsRmR/eiVGA5?=
 =?us-ascii?Q?l2GBlA0wNLzGKuXCre71cxG6xrqV4wOycIlt2P+GXnSYdVWB/qQW9cxGTl1K?=
 =?us-ascii?Q?uZeLuraEIVPMJsQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21123910-3614-4d54-b302-08da1d705191
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 17:09:07.1673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR09MB5264
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164345

which has the same info as the in-file header used in before

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncur=
ses/ncurses.inc
index a0ecd8a80b..8d374a1522 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "The New Curses library"
 DESCRIPTION =3D "SVr4 and XSI-Curses compatible curses library and terminf=
o tools including tic, infocmp, captoinfo. Supports color, multiple highlig=
hts, forms-drawing characters, and automatic recognition of keypad and func=
tion-key sequences. Extensions include resizable windows and mouse support =
on both xterm and Linux console using the gpm library."
 HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://ncurses/base/version.c;beginline=3D1;endline=
=3D27;md5=3D5526f2f3a29edc95538b368a4771edda"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df852913c5d988a5f5a2f1df7ba7ee89=
3"
 SECTION =3D "libs"
 DEPENDS =3D "ncurses-native"
 DEPENDS:class-native =3D ""
--=20
2.25.1


