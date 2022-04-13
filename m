Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69822C54EC5
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.103])
 by mx.groups.io with SMTP id smtpd.web09.7799.1649864116604709527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=C1ZIDuuV;
 spf=pass (domain: outlook.com, ip: 40.92.65.103,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrbfVPeyLl4VTwM17vqe+VuzvGh/Y/i/hhZ5VvZokycR6pH+btteT7HNUKjHIuyyIZkT77/520tocwcxCTNboiqB+syxsGhEU4qY+b96TvKTuHiCGyeEBBpTWi8A+W8eldf9pm1sOfB80f61BPzXWTaRq+UHbj//NT1XBipIOqzpk+6PTdgpf1F2egMqxA3I6NsbsTS1OfTR4Jrx02r02vHNX2LVr84xt2HBFcMctRF4522no2wMIqh1H/tx3jtkOezTGeEMinbTCVh39gxk0NAwsmvVsQaIVVe5P1ebiM9tlXKMb3tvX3YOHSnQOc3dZfoBAXatuAdaUdB7eiPwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQc6dd/HooOc0/xP/9fgjAydOOSKz5u05/1y47Acu8U=;
 b=SiHykAOdX0p5aS2krPLdUQvOYUDJoUCyb2pGNNB+3DQeY5DhpLP06Gf9+0Iql/L9YuMjOACRj/FRVnvMX1yESX5VY/F3z+ZPFKh8IjAiWOXSPcsB8WtXNakux9+nIrUKN9DizKVV421Zq5UGM7p7MjO0WFAWgA3SIK8mXrGJLaSYuJH3jAiWhrIDwRVLIAVmnV06owB52F8OJmC0gP7RkDo8NOTlYWmvb+WD7Xn/1+TvHhKMFqg1CQEYY5rk6pc7yYgmkxnFgiJmYmumxY8WCKa67oSKcQ3sEstH8pB2AaeF5HTdOZAaCQEIrbypheEVGhFXUKNRLLlg13XKTAWh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQc6dd/HooOc0/xP/9fgjAydOOSKz5u05/1y47Acu8U=;
 b=C1ZIDuuVcuV7y1EllNPqlRxE1JZOxw5W6gNoxQxGC8OdFWkgt8yz1RlcQdtp1BEY53fI/WZBALtu5iPrfI9oFI5G90gnJczN4J6/cWspkHxPWhe6ezeGJ3liIF5G1SFdErOEJyfHZj1sOJSnQdKZBL6lZ16SvTq/SCHdkaAX1rcitZkYn+umyKZYoPr45CDf0X5dwvIXvsbxO/qNPPGdZ1+GTFz5MfudsZKbxmgB7Ml0WG16f12PGsOv3TBJKSSyxQKN7k7xHni1gbnblw5fqBweQTV+HsKDD0qz1OOQQThwbvwtqdRicvVPRF3u2b71lf/qz1J/dpQtZq/a9MsUMw==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by DB8PR09MB4294.eurprd09.prod.outlook.com (2603:10a6:10:15a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 15:35:13 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 15:35:13 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/3] libsdl2: fix license
Date: Wed, 13 Apr 2022 17:34:51 +0200
Message-ID: 
 <HE1PR0902MB1801AEF2F65E82C522F66FAAA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [eLL4IDgm6h4XBPaGqoQev7Nk187MY2y+oOh5CPubKaefDDGEikECSFT7Nmis7azQ]
X-ClientProxiedBy: AM5P194CA0014.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::24) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413153453.1765744-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58848b55-6022-47c7-6357-08da1d633313
X-MS-Exchange-SLBlob-MailProps: 
	6rN1YWC+iUUh2cOq+DQcUfaIDPLB9lCFjb9ljPnC153wtQ6MpWgZ6mz65X/04jA+bV9C7FTzK7ESZQn3eihAqb0ISvS2Ttci2v0poquMqLBX8iBCDsGXOk7DLgMCoNC/FOxZFarFPKWSXhzM63sYaiaf+qeFsUa3WETLL+reO9Y6UGQmVQ9yumRCjxhYp6VjaTfL9dFDZwe32bdfgfDBAWyGB4ITG8T+OZ6pkn4US/wRpOoJEj+KxXXd57vbxAUnYLirLe/65esWeBhfT6xnsqK+WNC8wiAgiC1DRzM26furObPfFwWWX78vpCp1XYFt3Q3kksyFC9fqjeMFzLeh/+KvNr8a1Lmfzmyc+Q3/JMZsRVicBSlaLn24JpimnUhlfafQ9Z6ZYYKp5ALQfKZon7FH5Wc3xJteJzIqHQtQdjE5B6fgtWmL9YR7s1MGDlKHY0A/O2DRTIac0k+ape6RxFs34zkw2o/wmsqjBDROgATPyvGAwUCrF/bibMZpYIDmdK+0AIkIRaLlwfLfy8Md2Wa84g0eV4EdYeKGdNzACCvWbhpg3zWfmhN72ldGwUp6yC95XEihTCItN+0T+HcuSj/UR4Z01zvoHDXzFXWqeyTWfQwYGM4Q3s5poXq1cAKr4Gm7mqhH0paCpd/L88uLCa8kZHeXmra8UbMNll1KuJsIWpNgsHlOaXd8OhfyqCuNVPP/SXZdFeRNKAuW2jYHnqBgXQ2T/l5PH+6feQEr6/N8A5n+1BkUzHQZdrGN0/OLC4SJswdhBTmiN74HhmejCEQKghfSvPvfJq3qI6Q8mWspYVPTp71cNscuLM/jikDX
X-MS-TrafficTypeDiagnostic: DB8PR09MB4294:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	USEfj2aLLfmI6fo6l3PraLFMS+9uUhSqAQMS5ljNHBM4NKHsv/xEmop//DU+LixkxkZwX0+q15aNBjcG5yBWjQKg1EuRcnJaIXRW8ggRlV/TrsJoz3i5jsbWg8ACfwFsh2qR1j+RUUYbJ58QoGCdOa8gUs9AcoEhqZtz0iO3szuNRAHqk+rA2se0vEOszGleXRLtcwtpkBVsxR7l/fPoAn5ZKUPT/IgXhnIRDFoJqg9MDqNh41X3w4o7rwt2Lp5u9ZYN6XWHuHsX1kRYc5+iUbxcVuYS3MxlKPo5VJjEYGfgF1H/W1qiYf09J77rS8abKiyQ0CR/Ne8WI4Ju1ck8H8yD4iXBeSL4mcNP7C+eSgMpKfBL5SOH7n5oDp5BHiL2Vfka4/uX/LfizO3RxTcYnwxgf39kRmYxSnMxpX7qGBewEC3BjlF3IyB+1M/tU3uwET2/NEuHW1Wv7uKS2UhCkx/9Y36nrujOXwdYeJh5UyYEnXnEPublJkAphrynvBTDKjjQeN/uQgi1Zs1zXI4DfXokmIjO21sAPb7dYvV+/uJglUXd08vcMD+gHejWjYYwrCf92LFMmNQAgCqrNy5OUG3vzdsALxZkFjocBI9CikvkN49Ghg0/q2oYSvYNI78J
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mwBCyMdLjittyUQ9hzEZ9s7eqO8hZI9CycPsA2nk3U6VhG9M6jnNg3B3/XtV?=
 =?us-ascii?Q?Ub1hmKK83msP9EKHfjv6mFxZIcYhfB6GLGU9QdVnwcvBrcz0XE3gz9z1b8Ki?=
 =?us-ascii?Q?N04WkX/c3YLZj61X/eiS/1reJkIk/sI4SUDMHni91YEmO6Jh/dwssVzH54lo?=
 =?us-ascii?Q?D3PDdLdqPS1WMJ8AjuPaWMrdify4CWpbv7SI8v3Rf2+g25p551gdKUJEHytq?=
 =?us-ascii?Q?oIUUHMLvpDzbLeQuvBOgTQ/AGWI52C1ubqHSkmsp8H/dZyHvzi+d11MLs32r?=
 =?us-ascii?Q?Lh2wBglgdYScqtMn1mZMh8M1vZ29U/xxWSfqxSw195bYbCHAnw3hNOgJwHQ3?=
 =?us-ascii?Q?pjdMpT51Dl3PpkUCdsW3YUF5cqQq3802C+QAyqZKfAIz+9fnSp5u6nlPEYiq?=
 =?us-ascii?Q?W7lrDM1CwmOsgF9ETa4Q8cGtAkz9/8uwJFojVZm92TPgKJiDGBEfIgyUseBT?=
 =?us-ascii?Q?wF6v8vde44SKytVdUfz1WXg1OY2mf1SFhv+GKQ3d8o2xDlKNUMtRWcDNj4Kw?=
 =?us-ascii?Q?FOXsky9wJDGLbMTYOpqnVJVGophXgceOPdReNTf7EonJX1OWPez56hNHQ2ky?=
 =?us-ascii?Q?u+VW8OHRtrsSS2N90y4wdF2kNfMCZW9p2LAdhyCltwlduZpyeFInEKf5TjCq?=
 =?us-ascii?Q?VoUZ6P8YQRUpOk7mih7nh0TxAkkjgs9KqBfXYzVd4QkKlFW9guGJLxlqOnKF?=
 =?us-ascii?Q?xABELSXSOLESFpgbkfYkRAuHZHDIf7q52d1BFYqee5eJIzXFpAu4WqFjED0T?=
 =?us-ascii?Q?93sVRfTgsO76OvTPZKWPBvydnRYUlMD1u9T2cplqwHZl5eVbndM8ofOw8xHH?=
 =?us-ascii?Q?IPz8jWMhBAsPSCtAPNjV6r2pzvL4KL58VLyK4TDxiBaCFa/sq4zcgMJ8viuz?=
 =?us-ascii?Q?EOqn97hYb9s96iKF+hKYe+kJCxXvDU3b2mTy/cDHS0twtjGTaowYlWaRcBgF?=
 =?us-ascii?Q?+8KtVUiLnH022NVj7K6AmZ2V8PCzQxnUD81x67CI0Ebqk9Nau1wfl/3ZB/T8?=
 =?us-ascii?Q?42VT2Jzma9SgNi6jgAuHkkKkIL6ZxKMY/z5peKUURRUGstsSBA5EwsHARBsK?=
 =?us-ascii?Q?U5a3b8biJsFDAUwdoAgzq0kd/81zhRG79jXGRrj2HfXs1O/Ysz6Gje6VwmhO?=
 =?us-ascii?Q?N+6ExxLZyJ8q2F5fzFvGoSWiw/OXRhehZk/f+tQAej4sZe2MT8xJdkXbAbY5?=
 =?us-ascii?Q?YzD8TatqhhHetWVoTJU32TexqFCKIMemDr7MZ1gCOI3WYpLHnZKiGF0/I8Wr?=
 =?us-ascii?Q?edpuLccJoIFR9iBsG0kU0O6tmutrzPvuw8I4zVIgXiskCCuqU5nBJbYhat/c?=
 =?us-ascii?Q?gBHAcNgjQBpCF2IfSYahGnICcrXcMT31g5Im4/ny+49hSSx8JMYbEMfQmQPf?=
 =?us-ascii?Q?NYjHTUanRHn2hkIVT+Vm9wZiXgLE+fXsKkI3IwjV88L6dNx875gsqMHwUAYz?=
 =?us-ascii?Q?KLGapZXTweomr2IZiZwqk378u9SxK1h0Fx4QZ0ZiC1Ekf8kbFrx5kVbvGfWU?=
 =?us-ascii?Q?Pax6iQc5uXoS5GU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58848b55-6022-47c7-6357-08da1d633313
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 15:35:13.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164333

by default libsdl2 is build with code from src/video/yuv2rgb, which
is licensed under BSD-2-Clause.
Additional by default hidapi is build, which is licensed under
GPL3 | BSD-2-Clause | HIDAPI license, pick the least restrictive
and best matching BSD-2-Clause.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes=
-graphics/libsdl2/libsdl2_2.0.20.bb
index 4ba22c1fe6..c1c827af79 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -7,8 +7,13 @@ BUGTRACKER =3D "http://bugzilla.libsdl.org/"
=20
 SECTION =3D "libs"
=20
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D68a088513da90254b2fbe664f42=
af315"
+LICENSE =3D "Zlib & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "\
+    file://LICENSE.txt;md5=3D68a088513da90254b2fbe664f42af315 \
+    file://src/hidapi/LICENSE.txt;md5=3D7c3949a631240cb6c31c50f3eb696077 \
+    file://src/hidapi/LICENSE-bsd.txt;md5=3Db5fa085ce0926bb50d0621620a8236=
1f \
+    file://src/video/yuv2rgb/LICENSE;md5=3D79f8f3418d91531e05f0fc94ca67e07=
1 \
+"
=20
 # arm-neon adds MIT license
 LICENSE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '& =
MIT', '', d)}"
--=20
2.25.1


