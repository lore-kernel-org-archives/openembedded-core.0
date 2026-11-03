Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bo6tjDWQ;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1Ua1AVX6CfiqMgGokjIWENwgJ4YEo/wfbvXSWr7RYHWMOp9sGWcDYiRnSCX83d22t1lmHSYlbUxR/AxE9tds04DjEOJsi4MCpoa13spZijT2C9IccHuZ00yRskk8QAlNyCM5GR9Dv7gGT/2ve3hFVrjVpdQYon3DmYG9DcRVQ9GWNaYYI9hV6PvcW7CdnmtSfMWySApIujbyJU2GIXxA9QArfRQF3BTlOQlbPNvDczplFKtzO9SQDwAOccbKNMJjXBvMAF1Y7/pCz16nu/yF34/D1tA3qlR0YYdxBZGAZRNY4c9fuspFRe7wUoHKX3vt1rW3S15+eMPOTog57Qgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5RNpu7zMW21RCQxrDI7pG1Wlk4lkfMmrFlmH530kUk=;
 b=bRJ17Pkxh7dXjg0rhDSUoinHeS4z92uoQUtygHdApJES38rZRo9BQqFeCyaI935Ow9RTzPpzpp2tBuNuwVqLtzT9Pn1/0zWbQRyLbKTGoXKYU0ubBIJ1QHe7Yry/uUPLuyb01Vu5rP6nh6qeHAoUJhhq47vhG3Fk5C351ciyakIE45wmqNrkTZaOGHI+ejNWso3T8gt4EANfxe27jFx8209xfjTCrB0h6LE5iYa2lj7UT2/TN62tNayibkoVeZl5fUj47dGj0lG3KA/zpMIn7N3KG6HtkAUSQ9SebHaxReUgo4HCHEcr0DeCQl08MYUbN2mkiyUvjtvcX0SvVs4k+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5RNpu7zMW21RCQxrDI7pG1Wlk4lkfMmrFlmH530kUk=;
 b=bo6tjDWQj0tthrrAo9ImKJxPjIvWM1uqNSOe3IMtDf5OmPbBn+wT/hUs/kPV/xaY6o9udmN0ZI2j35UT87GdVawFbvQIMIXBFOa4uZn8+gNo30a9lKPm+smu1Wbca3r+dZYDRvIiM8pH2WE33sIMlh6wUbJe/DQHo2YpIryf5cUCtVJY2FPDGVVLt40DGby26ZllG8EdJN/7pKe9eR/O6sGZy0WPuI7aghzZa3ivQ9UeS4WY1PiFkpY4R0k428GfKFQVXT7qLuUs/90kQIFaDu/dE/4ZKipAw/wNkA832Fc5Wad2iEpquWBbysYqWXgbN7c7yV48nGqfwGXvwr8Xxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] python3-markupsafe: upgrade 3.0.3 -> 3.0.4
Date: Tue,  3 Nov 2026 10:27:54 +0100
Message-ID: <20261103092800.39286-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c003cdb-44cc-4bc2-8bda-08df398cc795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6oM+u6jKQmfPSwQ+CGsyqOcAE+AptvD3slzu8ceTDoLf5k3EljBu/hcFlnVsDiHUIfJMZFPjbwq6VYSQvaaAXoqfp86j1HYCy1YGLmlUEWc47zIBj9H1F84xtJWwsGtn+gMgw/W3EpM2T9Ty1/0loKkoh+NegOrtE+paiYda1QjOFv1Sbiskg2dehaMpM1dpCni+f2RcaWBMlyzvQSvseZ0vjNO/E6KSe1NAeuBidnwtylkCfXrSzlBVj2NADk1pNcZuyt6es4id0zPQ+eTUet7FbhVWhNrJH268seR/KDk9Nbgk8x5V9UUyjJ4alvSgkQK/KDaQsTMwiOr739vIelyfP9gjWhsTr8ac5yQSWI+ocnD0Zico3KiG4BCxh3uBr7dqhnE+7tOm6qkPrmvP/RbvDHlahvHpTHoyre4YC5Sw72zmc45OgnCyPCkAzCFg/F+xVFSlSneH3arFy0CDyBsUZ1GSe7AspjTzp+B9dEXc3qe0Ghi14116rXl+GwdZE6HYl67eGKwPZ3uW4096psK7q2IhQ/S2Y6QiFRNqrPD5sBpnKARvvYDDyQV4i7ij5/etc2blZi9tNZ9Fffm6cfxMefCtnlPqcmnJKxlF95FCNNkOOoc6akPJm+UCmTS7/N7sUT1XDHgzm7U5NufgoSy5ANg7mOsgGjipgavJszc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vXMqik7BpMCNzZ3tx3Ml1TN8aD4OzeBhRURH5Z8ahOwwdYrLT/5qRJVvzaaN?=
 =?us-ascii?Q?rBQT2NFBiuBjCBiiAFBWy1THsjxhUsYiD0GTJqdDzn6K8oaOAEovWexjTtQE?=
 =?us-ascii?Q?mhOtRiu5eH+6XNKmH59p5xurNX+jIAIqKooC62Y2VsChxQAHjZW/hu4E6Ewy?=
 =?us-ascii?Q?1vNALirK9sAqU+DHWcZyvbGmfgrIR+/gYSLdjNPp50tGP4wUysfBJg94Nsgo?=
 =?us-ascii?Q?wskiHi2tzWhBm2/mn2rCQHSfVa/fYBs217z5Qihutumm+Im+D8OSGjsvvjTD?=
 =?us-ascii?Q?dbWFuYNvb0/8pz/gtJ/egDW09nQSTrmEJQAzK5JLtB8nlLkvPHdRAFj5zP7V?=
 =?us-ascii?Q?b/wEd1C5FjQM7Oayl87cZysx6WsjIuVRIMSqBw4dqqC0Avblg3ig8cUwP5ui?=
 =?us-ascii?Q?pqsFhajpuAVTKlnNgUAV9jCIAi83q7sNqPrqvEOpNOeohzVgfk/5eN1nPeRO?=
 =?us-ascii?Q?m3vamCxd2VW0rxgfrY5GCqjDwkZqZyOPTmpuMPbDxLFQsRO795H8i9AAOEAZ?=
 =?us-ascii?Q?vv26xoItWOwEnsK/W1NXGkxDOytZPYya4IqGvhdTaKqw5ZGCfaNHz1/0XnhO?=
 =?us-ascii?Q?ECBlHq04MKuz39W15pFInSTypeScVFf2jWjiqILxPFrmtINySe8TSnzLH+NK?=
 =?us-ascii?Q?WCeT449l5TYJcM2+Baa4G5pee5u7WAa2AoYYfSWEvyDC2S+xaKqAiChXptrb?=
 =?us-ascii?Q?KDIxQZ2QnvH/wjAt3QHSBzI7XRGyamp6IkPgWcJbbWg/AZzr/bwdaIotsPg2?=
 =?us-ascii?Q?uioyDKbHWAfU3TjlTs1PE5TAwtncdEiKirAQNIgtyEOxlIkQwZ0jIF1hL/6G?=
 =?us-ascii?Q?tqt+XDc13J24sjMjjaCBuXdVqBymZcBDLLDVJUiw7df/ue8+bulORoKS/Py1?=
 =?us-ascii?Q?M5TXZOJkaop1Avg+qXOW8oWSMmE48N0eQnkPfU8GZjFjGK4/wqAiEpCzrfny?=
 =?us-ascii?Q?t04TkkvmZrxf3KMIdtauz5pbtBt6zjWYpEr3hb1ObHoj6gZxrHCZpxzc4+tf?=
 =?us-ascii?Q?TAVjw9N0Ua8qMKgFoh5UPBY+zp5d6HNRdCXxc2+0SNsL1eGmc+MPrYW255ot?=
 =?us-ascii?Q?gLaesPmHH0zOrOfHovz+bIrFsxO/onfgZgUqpNPNyBJnNl6Km3nzJSxqmApi?=
 =?us-ascii?Q?9jwyHDzpi05lNZsLJGjdCOlC49MpM6vz1DXjVYvZYgEXyMy4RY7wkbb0Cqps?=
 =?us-ascii?Q?3yECd7peaaK04eLodoxVTU5Z5WympDVT66RXBQkN2BK2T+vF1158/niultbI?=
 =?us-ascii?Q?vUOaLDmLUOuvlmT8xYTQ6edoxiQWdxHTLo6qhxMJl9H9Hp+EhejMuSq3DG7A?=
 =?us-ascii?Q?Q7nJft0cB44TwNudHQunKPsbsFxSuTiXiNoFU1hqGtXk9mhTNZrmjwWZfIZR?=
 =?us-ascii?Q?xXGDWEdVBXhHqnESBmO0HRdso7zJFM358/1t3O9G4GEpoQ96qh/kfbIMO6gF?=
 =?us-ascii?Q?6d8PTt/3oARzMNtGqj0Xh65x9LjKQrKOEuBPyJJTrXHIq6VDRBj32TOVGjHb?=
 =?us-ascii?Q?m9D9XvLrmo3CmHefj98rHh6oH5IopApFCpQh56rikUPymYgFKwQ9guks/zoW?=
 =?us-ascii?Q?9hZjUn5XJQe3crcnHY9wPq2UPJxrT98pp1tf2q/P0lCXhUiPylIAZq7yPv1j?=
 =?us-ascii?Q?NZ/x/B2MlT1WpJiVqZDL3gQGni7+aSgupijFXvATRPC2D5eun4jlkB6UMqv+?=
 =?us-ascii?Q?SP+yEKexiD49FEtwIemBV2TEpsdg17o45FVvmwk7NOLlapxQTyXdzM/8Qo2g?=
 =?us-ascii?Q?N2LqkcKuIA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c003cdb-44cc-4bc2-8bda-08df398cc795
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:11.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEebVx9VHhmi+vxjJ+G6KPYOU/sMWWF2WDMkf1COycFmObyyK+bNjFSxXhmMf4TNlUI4NazMMy45S0KwNN8pJvwRh/NYVxqSSoJGw4VIBq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249259
Content-Type: text/plain; charset="utf-8"

Version 3.0.4
-------------

Released 2026-10-02

-   Build Python 3.15, armv7l, ppc64le, Android, and iOS wheels.
-   Improve performance of ``striptags``. :issue:`521`

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...{python3-markupsafe_3.0.3.bb =3D> python3-markupsafe_3.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.3.bb =3D> pyth=
on3-markupsafe_3.0.4.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb b/met=
a/recipes-devtools/python/python3-markupsafe_3.0.4.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.4.bb
index 58c03766c6..63b9fb4801 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://github.com/mitsuhiko/markupsafe"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dffeffa59c90c9c4a033c7574f8f=
3fb75"
=20
-SRC_URI[sha256sum] =3D "722695808f4b6457b320fdc131280796bdceb04ab50fe1795c=
d540799ebe1698"
+SRC_URI[sha256sum] =3D "2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3e=
e119022518edd6"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
