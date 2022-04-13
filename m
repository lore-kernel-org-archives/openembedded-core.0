Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B6DC35273
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.23])
 by mx.groups.io with SMTP id smtpd.web11.1120.1649869750700382414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=m3LFuPbY;
 spf=pass (domain: outlook.com, ip: 40.92.73.23,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehlcyLWolFoB+zQItPfBARbtPfZuEUSaKJj6igRYDK17EUXsHv0BH6pAj0gfZXSMFnyPpV54cRZBigzbitC5+gQ/h/RbGQTo1y7aBr3Xs8o1uetOtQR/jg1rx6Q757des8Wx8NigKa3P96urH+C6yvr5mZ1zmIF9G95nCtwdD8+sUV+ccbWMg0dFSpQT64eyJQSk5lzGUxKAHLD9dL06bFZAsjRXZEKcu7sWLaTkDwK595ZBnspIwnvVvZIS6BY+k8Z4zNPFWJ0jokhyJuvGhwcy29n65Ib1IQ4N80U+MDXXI+ck9uKOq1FAyyp6UCEIOqwMwsjpb1z2toALPCLe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul+0+nGa0/06avL4yFM3ic/LMFuMR4y+BOFAFaxsZPk=;
 b=mzrIZcM3oFNP8Jz46rbEC47Zr4QHFp+UAhgdH8boORwui4jRD8YzkyQuzmkunzcKzG/fk2YGgHnYh9uBDiysVWqw8DnbC672/VaxldrUEnPxRh/VucZ7rZ10D0uVL5HyeSIqaEgRsi2tS0c9fXlNulpkX/jQFicgHFFGa36SrVPE1bQXilTAI89FxaZhCo0EdzSm4xnIZsdz54hbhcX78k8v0sC6l1+V8ZMCM5X6EJ+1Aysm1pOhRBG+C+Iy4VtYG0bvfY1LsnYEM6pluWF41mJ4pGTFJYoB9j29cBp+jXthYL1iusxjo5I5dODHb53Zp2QUIRPBnOZmr1BfRPTFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul+0+nGa0/06avL4yFM3ic/LMFuMR4y+BOFAFaxsZPk=;
 b=m3LFuPbY/toFUwK6VtB2/+lsMGlQFQZ3y81gHP+vhZPyapeEPHUvZgjerYo/1JJ2F0rLxtvEOGBGmuLyfHZWBr/OdC7/sIJiN21MpUvyuiCHwNDsrnmFplRAxlni9UMP9+1rKGK2eS4DoK6OZu24XZX6JTEHz/PBIGH5ZMis6Ny5F/YGTLV1Vte6n/4ScOWgmrrBGES6+PjNyz4dapzPk7sdCsG5KUY66flFFph78YDotHph2+Uq7epMPweCiSt5N9L5RCHmNyIfBqLp5AX14lL0gmZFJKPR4tOPRoRbHcoTG0ekZvb8nHBkIRZ4dud15onCJ9Oy8y0Z1lAK/GeblA==
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
Subject: [PATCH 2/2] python3-pip: correct license
Date: Wed, 13 Apr 2022 19:08:49 +0200
Message-ID: 
 <HE1PR0902MB180172875D28475BCD03DE9EA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413170849.1969030-1-kweihmann@outlook.com>
References: <20220413170849.1969030-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [SMjZEXmQeLdJaG1XrJa6j4/tLG+qcJz1sz2rTZduqwSasKWbggRyd/zQ0v2dmMW8]
X-ClientProxiedBy: AS8PR07CA0037.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::9) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413170849.1969030-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ff55e83-2b38-46a8-3612-08da1d7051f8
X-MS-Exchange-SLBlob-MailProps: 
	citmFLqyTFR8bB3whAFXzAq+AsrPRwaYRRPo+GR7+MvHFZe1EbueqpwT1htSIPSIFMLSSzb8/JByte07m5VpWKCKbAmRBLjNm4+kKyWRyWYpqvKXhGHHxohLCh62T3x1HyMWLmrXzA4WmP0Ca7/UhXo4KV1NSim4yOaUq0Ymr6xrF90tpKr920dItEnaC50ZXm9YQnHGgZTUKuS1WT4U4wsrmyNmpPyq/J/InEWbs4+/TBjeY+sYIzLZarNfPbRjJO1EkoEqDSzMmAEiq0teGTot4e6Ezb0cDJ3Wzm+eDcapkrAw7j03mtNBXPxGaoR8jEwURdhulZ44toxmE4cCBIVJ88KAHbkvvAy30KeMmb6zGJJjffTw6pfjvazPbrBJWuIjPL97xsYGgQ4pn5wftAq6/RnC/SsO6O780ZdkEJhwLI2GnjCwC4GUZdSuf5rqns3dU2Tn891qTnKoWBTcEGWWY9UHW37BJZmAYnd/okHO08OAd4CDX/FRwfaNApueI+t7PZuudLksN/gHHCPyw7UpnmhRbrznQdC42t+7Ws7WSQUWRn1R321Gn993BaG3ZN98NgeNE4K8xykI+ilqQQNT9GkmZX6R7kWaV9+pyFdVU7ODkLo6xX3hRF6EV48uvS8k09J8mELHuvC8NM/1XMtPGLMf5SzTWuhsToiD2DLVnLhfkhzB99SNilACRWdSHy0K+l+MhSyjxAVpVs1rSE1LxZ58Vwki9ZTWYX8ecUVsdraJCVWsciD9MqLyM6zfhU4uoSOnCcEHsijgaLWdfLpO/oqETun6E2Z/RXYx0H8=
X-MS-TrafficTypeDiagnostic: DU2PR09MB5264:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q5AkcyunabHaNe8Q4vVF4dssQbjy2QHv8ifIUHDX8RXJXxgB0nUUj4rsBHkvC6m9NSuqA8qOyN3JSzFeurUsNTSkJo2f9kyfgzaFxTznsLnxY1O/FJP+KG1MuOASSNPxEUFES4a5G9mtc/8SYSigNCXl1xv28kDw8djHryf6CmxU0BYaWsnCGKo1El8OpThEn/FEuCAZoZAew+12uEdYsZIuA5TqCcW1J1XJ8dSGSpnL++K/ozKdqcDzX4jHQrrWSID1nr1fnuCpyeYw4hO5KYE3kUCgaJzxTXSpHza4wZA1mfMvBvx0N7LIyVvb8anhcZ3jKkOrt25GRV6zLMb0jrEMYM507042qQK5ui6Q2rfDRpWFHbUrCWwHR4W7+I7yRBk+7PmSsX66krP/j/Gcqon1P17UliWZTsdjfaaxeERqpTTR9+g/YVKpzz+bQzZgAwPzsJuxthfxl42pRqLhjF6Coag/iTiltACjfk3/kWzCmOAg6soire5SYccgf8eas4MS0rIY05+ONQmkPUKDatRaP2G8/xH9+g4dBRJwYmDlxR5n5h1DYBtb/486TfZ6h4gvAIAc6f5QFyukF1KXVjDE6phsZFR0H7Ey6gsDtMy863jXnQDR3YHsnZHOZQSA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9gbdTOlcBEPVDEJXOES+JTX8kYiqG4uVdpugCfobIVWbCSJqxg4wjJaCcRex?=
 =?us-ascii?Q?g1AnnJqZWajvZWJE7uihGTN7EhbJAaJZOE7ytVsvylPgaumu1O2+QmHxSMCU?=
 =?us-ascii?Q?ibPsYMB1K09/1Hwz9Kr5rgBGxPxKscMwdbNxIlipEDkUifJ3xGgHCr4b9VMa?=
 =?us-ascii?Q?S5JE9nWayOZjEF7F49Fi48HVuIKlTu8lz5gHBCCRsypXcxpwyiPeEhcbHGhL?=
 =?us-ascii?Q?6xHVXWSpa6RDirUDg3Bv2SXxV8ldQ4u/veYMMxhZeLu2uiAEUPzRunOnuNnv?=
 =?us-ascii?Q?zQaspC7YyziWBVO6Tl6G2Z/H34sioyXB3fXRajfDhdtH5nBa5viVT0ABADON?=
 =?us-ascii?Q?uaYEMw2gXX8KhnfWj8Pu7TROeMom185BtA8O1z088FB52UG1jOVy5j9cg15W?=
 =?us-ascii?Q?dRkSv5USQVpMP9VMH+a+p2Bj6UR9AoOQfxBDlT8Gz0FbXUFrqyLnS8W492gO?=
 =?us-ascii?Q?kapF/10K7cqHZ+Zeyor9gwJmZQXsEXYcq62lXYvOslg1jbPqyzraZ8cdWcwJ?=
 =?us-ascii?Q?UQ6SB3vC6Y+tlUxCHfeCm9HUEqWxbyP3lCbaqqyHU7wrZ5ATd9g5UgytwVAl?=
 =?us-ascii?Q?zIQA54jRgf4QagEBcjMV7mJcuTwTTyq9rQDBNa6SYvSYnrXOksrrUeJ8Qp9d?=
 =?us-ascii?Q?mZtBf/RYnKAQxRM0HiVcZn9KA/vmyvL278FsBSXUgky8utVEP3YHDcZfVW3u?=
 =?us-ascii?Q?VY6O+CcUoEfT12DDEA8WKVylO6Y3bv+0yy2bqEYNldbcvThqrsmlAb/WnJXo?=
 =?us-ascii?Q?Q+xIHE064SRKW10TfYcWGfu1R17frXP5zSDzJa5v3/j7mjxxg5xTbbxl/ImX?=
 =?us-ascii?Q?rI8+N+j3t4wggTlLXfoWMysBQRcbeyUBjKvqvXjOtebmf3Z+AM756msmpZU+?=
 =?us-ascii?Q?bSZusoU0IhCvAdqWNe0RvBIyg4qWA5NkfB9l0V8FQzXpi8ljBw4dFUUcsXgb?=
 =?us-ascii?Q?MbiiTuy8/8s/FKUtVdLyBr0oKKYUOUR20jr8/gIbaFcriLRnJ9ILNSrBGvf6?=
 =?us-ascii?Q?PfJsaYRmtQl26mhBkBP9lccKs8n3zvwx1/hcDhgFO1bKPE9niHzRcPROX0vX?=
 =?us-ascii?Q?GcXsBPDuXkfm9FfqS0fFForcE0IRr3QagXk91yIj90uZYszhYXd/tCQ/FXTa?=
 =?us-ascii?Q?T6Dbfz5wTQzGm5MFO4HPg0wk0SlIwCSduIcWRvTp/1OLIfU3BZHAwDd627DV?=
 =?us-ascii?Q?E3mIeu5zkVZs2IDTG0WIKGRF9COqFPHzjwJA881STXCM2xgyW+Dn691Zc4fx?=
 =?us-ascii?Q?tsiqSn4yq4IwJpjx5l9hzvLH5r84enUmDGPGMeKZGPH5qwBSvs0x3dhP2Iyh?=
 =?us-ascii?Q?Fk8apNayjCtcr1aRVe23tRRGUqYVQ9w09zd5Ejwt1uKT/TGeAaYHwrAMPxrR?=
 =?us-ascii?Q?0YeSclOrPTXgq5ijIIH0lLg/skm19VKX35+COI1YZdDyGq/onh6QGojj7wKq?=
 =?us-ascii?Q?6i661Quge/dtJPwYAkhdvjWG8aFSe7GJ3piUYh8VTzBJ8GfTsUHt5EqFgyNX?=
 =?us-ascii?Q?F83wJy93LqAM44k=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ff55e83-2b38-46a8-3612-08da1d7051f8
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 17:09:07.7766
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
 https://lists.openembedded.org/g/openembedded-core/message/164346

as described in src/pip/_vendor/README.rst pip ships plenty
of vendored copies of other python modules.
Correct the license of the resulting package and
reference all the vendor copy license files correctly

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 .../python/python3-pip_22.0.3.bb              | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/reci=
pes-devtools/python/python3-pip_22.0.3.bb
index ee3e578b2c..09a305edf8 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -1,8 +1,36 @@
 SUMMARY =3D "The PyPA recommended tool for installing Python packages"
 HOMEPAGE =3D "https://pypi.org/project/pip"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf95163b597008bb46db=
68030"
+LICENSE =3D "MIT & Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & P=
SF-2.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "\
+  file://LICENSE.txt;md5=3D63ec52baf95163b597008bb46db68030 \
+  file://src/pip/_vendor/cachecontrol/LICENSE.txt;md5=3D6572692148079ebbbd=
800be4b9f36c6d \
+  file://src/pip/_vendor/certifi/LICENSE;md5=3D67da0714c3f9471067b729eca6c=
9fbe8 \
+  file://src/pip/_vendor/chardet/LICENSE;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343 \
+  file://src/pip/_vendor/colorama/LICENSE.txt;md5=3Db4936429a56a652b84c5c0=
1280dcaa26 \
+  file://src/pip/_vendor/distlib/LICENSE.txt;md5=3Df6a11430d5cd6e2cd3832ee=
94f22ddfc \
+  file://src/pip/_vendor/distro.LICENSE;md5=3Dd2794c0df5b907fdace235a619d8=
0314 \
+  file://src/pip/_vendor/html5lib/LICENSE;md5=3D1ba5ada9e6fead1fdc32f43c9f=
10ba7c \
+  file://src/pip/_vendor/idna/LICENSE.md;md5=3D239668a7c6066d9e0c5382e9c8c=
6c0e1 \
+  file://src/pip/_vendor/msgpack/COPYING;md5=3Dcd9523181d9d4fbf7ffca52eaa2=
a5751 \
+  file://src/pip/_vendor/packaging/LICENSE;md5=3Dfaadaedca9251a90b205c9167=
578ce91 \
+  file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=3D2ee41112a44fe7014d=
ce33e26468ba93 \
+  file://src/pip/_vendor/pep517/LICENSE;md5=3Daad69c93f605003e3342b174d9b0=
708c \
+  file://src/pip/_vendor/pkg_resources/LICENSE;md5=3D9a33897f1bca1160d7aad=
3835152e158 \
+  file://src/pip/_vendor/platformdirs/LICENSE.txt;md5=3D282c970bb844954c85=
35dd6e9733db7f \
+  file://src/pip/_vendor/progress/LICENSE;md5=3D00ab78a4113b09aacf63d762a7=
bb9644 \
+  file://src/pip/_vendor/pygments/LICENSE;md5=3D98419e351433ac106a24e3ad43=
5930bc \
+  file://src/pip/_vendor/pyparsing/LICENSE;md5=3D657a566233888513e1f07ba13=
e2f47f1 \
+  file://src/pip/_vendor/requests/LICENSE;md5=3D34400b68072d710fecd0a2940a=
0d1658 \
+  file://src/pip/_vendor/resolvelib/LICENSE;md5=3D78e1c0248051c32a38a7f820=
c30bd7a5 \
+  file://src/pip/_vendor/rich/LICENSE;md5=3Db5f0b94fbc94f5ad9ae4efcf8a7783=
03 \
+  file://src/pip/_vendor/six.LICENSE;md5=3D43cfc9e4ac0e377acfb9b76f56b8415=
d \
+  file://src/pip/_vendor/tenacity/LICENSE;md5=3D175792518e4ac015ab6696d16c=
4f607e \
+  file://src/pip/_vendor/tomli/LICENSE;md5=3Daaaaf0879d17df0110d1aa8c8c9f4=
6f5 \
+  file://src/pip/_vendor/typing_extensions.LICENSE;md5=3D64fc2b30b67d0a842=
3c250e0386ed72f \
+  file://src/pip/_vendor/urllib3/LICENSE.txt;md5=3Dc2823cb995439c984fd62a9=
73d79815c \
+  file://src/pip/_vendor/webencodings/LICENSE;md5=3D81fb24cd7823cce23b69f7=
21993dce4d \
+"
=20
 inherit pypi python_setuptools_build_meta
=20
--=20
2.25.1


