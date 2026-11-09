Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6126.1794231670284135098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=idqNK4sF;
 spf=pass (domain: est.tech, ip: 40.107.130.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipEaABdzOhMCKDME+omqeeu6/al764wN/l5hU0zvOecu8FrQQtaIVQd/emmO/zhvLA6TvM38QZHP6uZIicn2zcVqU7UJlcKVx/SLOQ3C4fadbR5h5uD7dqDD5gRreI1XzEi1Tfza8qU1fpqJjRcP5Wf///mlyJTrlRjwnkX8PqTl8bTGD/+GPOnBiVMs8dUz5fDWzFW2b0UT99gJ91bpofrVzc6vmMmTNgKQY8i1Ql9P5je3fXkFRFjiMm4mcUmyd8cLruZmI8hWm0V+w33Rfj/Wh/XJbc9Dy1/F8kpSvyS2w4N8fWi0X0IyUEzRnhyH/rLUfbAWfGTGWFdGiIqgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL9why/2jJ2fZDP6xsdpk11JoToS6ka8k9twAsbRi3I=;
 b=NFkNQC8fWJkCYcs4v9n5hvrKMiT2Eq57hiaO0/2phY3FJV+8nCAzZyIHHSJkwM4rKEjOTRXoIDGyJuPi50QiuxmduHB/zkARiH9caPc6BDlwzOkStyBWLn/FN4WkF8ZZnbxeIdOXDmWOKvvZa4aOTUKTCwfESrqCjorR7U+rDV6IaRYa4Iquhnzb7v5IfcO7keENJdeklLyedf5xfev/0CKNDWh7Ogcu7z6pAp1PuKnxJai0DqK7kc5Vq0ZsPD5btN8VYweyCgQc/V8gB//0pb+FNAp37bGYbVRKa5b4DDjthNg6bJN2LELVIx+s6ZQbUv1UeCV93oc9780Z1FgYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL9why/2jJ2fZDP6xsdpk11JoToS6ka8k9twAsbRi3I=;
 b=idqNK4sF5zoLDz3ClL1nXFhr31BRZK/zz/9Ye6+nANSTn5CzPZEDUzJ+qpBnc1IeZGsUT9TIFslmrMRMC6BmUcE+Ncot7xQf2f7CSxKz/1ZPbz0wyKxnh+xnek4XvaIOMVh92EpYoegnzLrMT7YTHbJrNiYn4F2DcHDJTP8owbE7CnzTtVGkbyf16E0qIhglW9rQUicCKrBD3xC+S7+VVFL6I3/LvA/kiz1Ev+Jx6hZSdWSIEuTzOZMre+vPbbAZCZBSRuJ8uh8UvNXFnVgmAZ+6EOAKEnPuzNZiroM3QCpH56lSnRWNq5rlAthGtxJPDNMHaYF5yGNVrPNj07CZlA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:41:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/21] python3-uritools: upgrade 6.1.3 -> 6.1.5
Date: Mon,  9 Nov 2026 14:40:31 +0100
Message-ID: <20261109134034.74458-19-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0053.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: c30753b6-7267-469c-d453-08df3e671ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: VV3N65dMS/7TiQl0tOsDetpiGY2AFgcz+wBV05PqbeqK/xh1b8Bzybh0FZo6hJlnUYkRFzDoYczpxUYbgfPF4lsTkfF0kENqum5vFEj6BwsPrChCMjldVchAS7/CvAKy/SLlPhRXtCYTVhKIPmAsSUvJ2P8GZYRVA6h4FZ8FXVBoZBfdIsoMJyiYm2tsnLUqBp4ybCjxgtocixbJdC+BM4LW8n4PhEmjo1PNkqfl4XHQLZqBVrdjewaQq8VDT+r1poxezoY15LJPGk/4vkajHh1xanZ2LQsrEcb0OI0PCH8B3Z9lpZOZbUqvaaP3wKPIvebdQeX4SsvM10FveVgYAznBFDiEBE9lQVr2fvtX3mH+ZTbjNr7cGqjPoHMhw/SWhKRcOITPdLjxs7q2gRErD3uYM2FP0XihXuxCeF4n38Sp9lp5wBj9QrClFypbk+TAE1LMMC06G196KgS1sZNJcVa+nRDeWHNeXkfc/ohF/azBwFRwAkjyL4NopeYStCjulSOzce4Jx5qToJCIUmxnkEYnKLcjRtifK1IjJjst4nXv8dU+1jjazQkdQQrw8D1EhyuaM3oUZygpwM4X0D7KfzjDpYiWHR82MSFnLwZdbvcfpoH97xM/1hBVY9fKK9Cdb4i6DhjNnaN8Udh/724RQmx/v8wDe3hvNk74Nh/pb9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3GeyLSMXzYegKyz6Af/Vy0Jt9F9nKWpflMjMW+ou5xQtiyq5LX5eeGoHLNb?=
 =?us-ascii?Q?/36I1cLyYcpDdpAaxFQ2IoPgjDJvnudVtltgpK8ifNytAMrF32tLTRG/UQOd?=
 =?us-ascii?Q?gbQlnmQRYefJdzbH1Jk0Mw/1P5KNDGZ8hCyINjKXhSzyzmgbFY3p3CmIOCYV?=
 =?us-ascii?Q?Xq9SmF2OSMZHmZwRS4XkL76E2mf1XGz/GUQIjwEUdN6VxBZud+sYT6vitmBz?=
 =?us-ascii?Q?ZT6lRB1Wpola2R7tM0fv+WLorpT/oiFyKEBKoK4h7Zp3rOsgLytev8xkevaN?=
 =?us-ascii?Q?P/xEns5uY8iJp48Q6rupp7GjuF3ubu/CGSpe4AoKU+L6k65IRvCi9vU77aTt?=
 =?us-ascii?Q?kTrToTvpwi7idZxAjOEM1PPgrv6oGchtqVdkk/HfTOtucVrrFuBX5sW2PBT1?=
 =?us-ascii?Q?DlOmH/wbG/mgrgusqImCCUM740cRfQ+dc5T3NYA87IRS3yMh8/lz1vxQ+enL?=
 =?us-ascii?Q?mjqwQM5Hwi7jANjYrYeR1yuYSbHor7MecdVq0IWVG9awaYW5fzhcwfuG8jBT?=
 =?us-ascii?Q?osOTJG0c5gS6b8olszBUatEZpA0xFJHaRCPfe/Ue5b/92QYojIbQJwG5ZlSU?=
 =?us-ascii?Q?tTPP12D5W2893RI51QEg9HS7ZCCopj+63jJI1n/4ntboOU5d6kxpT+Ab67hV?=
 =?us-ascii?Q?zEExbYCXUarRqMv59p6L68IRXxZvkNq9+p+bkFv3iClonISDN0SG1MQ6x8Ws?=
 =?us-ascii?Q?oHSJy0m8TZOCZz0P8G8ji5guIbpG0G2/+dhmPOGjfncuq9R8/u8UrWKndZqf?=
 =?us-ascii?Q?MsbAv3wtYWMtHexwhT/0e8wJD5f3EqtiVv2/2vE0kNn1kOyr/mGkpW3GXJGV?=
 =?us-ascii?Q?Mk0v3jn3DehuT406eykMNWgjoDcqOYriXbJGKldgZEyWDCHeSEvAZzmy3PeH?=
 =?us-ascii?Q?pRUdL6C5xbs7UAFvbyL2+FILAJ0vGsccT8nxivCNNOX89/KhEFxFwHJDW+m7?=
 =?us-ascii?Q?+IrUsDQt9bA6VNeF7TBzWJ7C/DcjrkXq/KkW5FyxHE13L7yG/5oYbltxARjy?=
 =?us-ascii?Q?8ClHwy0r2mcsaHGGoobFr5roZuO9x5fhpdgkzYT1osBKEDSwfybtSF39deeu?=
 =?us-ascii?Q?BQPR2THrXnI8Xq8HvoLT2pRw+2tRiAxxQixMsCTqgfcIMcr+mUkVN3o/0bXp?=
 =?us-ascii?Q?87qq2vK6fyCigN+qsoqeI5h7qv85nP/fcbYTmq7jbwAQH7NoWGD2UK7hGeAW?=
 =?us-ascii?Q?Eu2wVd4mTctYzlkfQeHIl6YSSAPlV5f2RWJTGSabNP54kN+n52ecm0HF9IBA?=
 =?us-ascii?Q?sXrO1Vs8d4pqH0eP9x1R4kaEYCfk0MEAAI34zZndezkfbjMAf7WIiHEfb1Mu?=
 =?us-ascii?Q?qirU0Mexx/lQ0cLVazdcmbzhTbsicj5yWEBdgPt4tXOGdh9F77VF/RMIUC0c?=
 =?us-ascii?Q?eDdSQBIIwTzoqgJ6yZNx2tMjMaceS6JmL8oNQGs36sUtK6bAVZ5HnaBF7JDA?=
 =?us-ascii?Q?Yh7TRIoFYganBFt10vJ6ONIWqYvoABK714GJ0NgygauQvKkxNVBajMFwxx4S?=
 =?us-ascii?Q?V6l/0TUDevDy66ZCCUb6R3hbZbtdTvxY5Lp4PwSwWMTLjIO1aiMSKUTK/ABA?=
 =?us-ascii?Q?ox4Vhe2qQT3ykPjHPhFTTBQIf4b1qTeOG7bIbO0D++mE2h40kLORD/QHOe5o?=
 =?us-ascii?Q?rXRB+YdEtQDnhuDoMcxU4GnjLAWDDiBoKCy0c8PyQERfIkIHIaEQXkrwU9m0?=
 =?us-ascii?Q?xoICRYwYGbf0zu5Uo5rsvsvDN2nrTuuSJ5fhSU5gEyRZbHKpA0EBsD5BxUbD?=
 =?us-ascii?Q?ReAsySliUg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c30753b6-7267-469c-d453-08df3e671ac7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:06.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6LOolVY7wigJNyGMssSO/mFxp1mfdpiDgdEGdgpxpb1u7EwEU5BDo3Lgp05SKOMH+c+MX9n3tXgujznkA7L0DMmml/3xu5/6XGHz5djjTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249823
Content-Type: text/plain; charset="utf-8"

v6.1.5 (2026-11-07)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Bound ``uriencode()`` lookup table using ``functools.lru_cache()``.
- Minor code and test improvements.

v6.1.4 (2026-11-04)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-uritools_6.1.3.bb =3D> python3-uritools_6.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.3.bb =3D> python=
3-uritools_6.1.5.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb b/meta/=
recipes-devtools/python/python3-uritools_6.1.5.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.3.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.5.bb
index 47fddec0460..f886a3b38de 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/tkem/uritools/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D079933dfba36eb60b5e3512ca0ab61a=
e"
=20
-SRC_URI[sha256sum] =3D "3a498e7e85ef3249343d5710618d641a414da0fbae6d23053a=
da7976ee83ea5f"
+SRC_URI[sha256sum] =3D "5a46002351b745a6910f24167abc1ba0a7f78818121fffb32d=
be1fc7767f462f"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
