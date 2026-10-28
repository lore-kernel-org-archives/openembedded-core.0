Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37396.1793171037963472767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aiZMrcGG;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh0MaIWAmYGKTig9pKbKJFh4/5P05pvm5cKQyDt+QK5dA/Hm9qkqdF1Eq5/9szCf8vaDa6EwRw7zn1gdfSkuoz3fRW3rEr74L+B7lgoR7B/MXmpM7hwh6hb+jygyRWWTKdYCgwont6dSISnkSKRegroalv5zB+qyHdejSuEWvUQD3/Mqvr8c9RBeG+8xzTWZ7mWlvd8nqB/8lJeyURmoQGYBnGNwuk4Sa1rWBUAsqRemyK2hqbjbg65W4SFpsbNItm33iChod/WQ8Hhzme8J414EZTERmmcJ4T0BTWr2gLezuVHCvqFtBMMz68eHuLD5oGopLnHDRlyC0c3QLi4xVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDyN65DF/X6QTedSVtu27bVrQPhqJRiumbmlhqqeEPk=;
 b=XoRVoEq9mXzdHjYTm6xFAtsrjOJvDaJenkQ/6+p3C2b9tf4rs2Y+XWy3ufdyVa9t6WRfKSHqnQ3ZePSmdNlbUC/bZp3fEQMXOIvFl+FRSGkX3Oki9WBaygl3gW9JMY/gczvIelln+ZvHZS9M6ftIKSx+n8nLD82wP6qJylKQ/gQK3LMadHQ45QN+lcMHn6+VLoDDqkqkOrquEG/phFRXPGD+XttJ/pYYxpTPuvLtTpAYWG5tVplJvFjXRKUv/gR0jpnG51MLBNO1JViIxTMmXcflfQ9HH4vt2n+iJaR0811NaVmLt2f8HAUw19nUV6daQoJX0p63OnAKqC21A7cPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDyN65DF/X6QTedSVtu27bVrQPhqJRiumbmlhqqeEPk=;
 b=aiZMrcGGFu8Ay6cwwEdqgS9oYyjGDcSXpaszHlRMdE8PHKEz6bsicS6XPoUvkBvCXyq62NK/MxT4gmYKMkiz4GPGi/5ROigL+qQSwFbx5NLCs3VFeZv57gd5lgDAzqJCclc6/fRIE3q4MIauXMdp1tWWep9OV4NUvcgTjmVgmAaWIRHhBaa6cr6isF1RDORsxH4hX1mTMI33emI/rVNDd8bVHWIPmE3SVmGGtD/XpEhqRrzix9A+QP5M70nTXZvCuG+h1ACZwqx569MTuY9KedScyqg9F+DPsmTYstTXJSMN0rXR1/O8oxC/acqhXalPzRZaduQzdt5wHAljN9PX4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB3470.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:03:54 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:03:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] cmake,cmake-native: upgrade 4.4.4 -> 4.4.5
Date: Wed, 28 Oct 2026 08:03:43 +0100
Message-ID: <20261028070350.13243-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0270.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::35) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: cb43bfc5-ec7b-4bfc-da26-08df34c1a0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006|261026140227099003|6133799003|12006099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: jHgBczpQUNelYcMPKJJt7XcuN3qyYhOFDgvtfxgF/eLzMpZXbxvMO/9Vyx8LCMJvikJIEXsTB1SQMVzl9pf+oCBXeX2T5CQyHy8WOl2W8d/HJgFknrw7Pr/aMnLCt58XHuWnTnOfPpIReHg8DrNJvvJY1LgE28KIZCwOHZFgWJs1MNUMv53BepNXdvs6yfmkZV/qg5C2wBnKh7OPezuyKICl4whdvhJjTUmSJf8mJRpUR2l8WuujtE45fo3qiy4foRPnAf2hDGfXK8JzDp/T2VMGJGCEfvKyb/i0KUMk8CA6WMRyVSM3WpSC5u9TNFtoRp+w+IE4edKj3YlW3SolVVJAHtNQQydMQ3dWB28k9AeMcAc6ALCM27bgLsUwI+puAyQKJILsI9h30jvaZf4aHtvjhqNkyYKLLgOAhAhwVn7K8a/n3O0xr9i86vfsKZBT23vCzbzHysu0OKU9DuV6iYdhLiFloeQXfjkqpOKtnQIFjyGKwFdm/NMIgci7e0+umgks4LWRBSRjawzpZCF9qpJoLkgnUQXwhVebkFUSePxEOZQQL9epH+3CYZ9ESNQCJckfNvmZ2rPdzA8DAGrp+eXxVCV0l7T0/Xwk1yCUD+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(12006099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CtvPBB2IqokxD7iXKcOQLmLTk7rB8/Ym5D5ydpCKDfFz2agafhwGHnFrh17e?=
 =?us-ascii?Q?oZQldhncklvKnskfDWGa4L5bgB31pfo/GXlfrrASjMak7bEM/rDfbcJAblnS?=
 =?us-ascii?Q?VlGNocsCzfVFg3NsYqysWdUFyjIyPQ56V7wAGUkqhhiz99wtPfo9rH272p2k?=
 =?us-ascii?Q?Ri9CY6uHQqTs2jFcAGFbhWmgm3IGxQ1pMrWT8GXCBG4sYBcrH8gv4cJgNkbu?=
 =?us-ascii?Q?CI+sha/B2y1ss2MwFGIiNNJudXW8+SbO1TO6hC4Zfa/6PJG/0OXBcrOZFuE9?=
 =?us-ascii?Q?bV6nqqY/uk9WLIFLeLu88Vsg7OhEEsQJIaTs7m2x3eT4v3MY6QS1A80Wr3eX?=
 =?us-ascii?Q?Q1UgwkpR4RPsrogZm9WkiK4ewg3GwrXp/JbK3zejVs7X82MfhQVR1Zeb6yoq?=
 =?us-ascii?Q?Rm/vWVLxNAH0g7Bq5Cijf9xjZ0maxJ/iY8fMf/3abK0mXW2Nq5PYeOtSkBbF?=
 =?us-ascii?Q?l5bMKLyPINAdERFeW+bUiwSUVtSXncfBhSc7ZPIMzkDJ2ovH9MrdKOeflAgq?=
 =?us-ascii?Q?3tZuSskSUwvpfRfVQvxQHnz3ObMc3ZZPhRTi1SBhdPE5QVsaOdK79TTVTO/i?=
 =?us-ascii?Q?62+C47kFoKtOcgn7vaKz6WUNH9AVW79+S8QuY3dukjD2rTxDdTs7Jy60Sxc6?=
 =?us-ascii?Q?F3CjzE7/FV+SmeiVcNZh++5iLIbCZUh5IkIDH1slRNNd+I566TpVj6jAR1vD?=
 =?us-ascii?Q?vK7uCubDXus3cZDldHMdmrY25SS+eRT8yxny4oT+bGS/Qp/C3NKN5xp3BZl2?=
 =?us-ascii?Q?+q1d5LaGiyOMcwJWKyL43es2SaQ3Jqzfrb0LJ5WtaEukZHcOZj7bG3xBFMHj?=
 =?us-ascii?Q?niQ//hhyUFQvJOp17YwgLUEKqufc8CBBmAkhaSaSPZ56DbwM6th4Np+1vUt1?=
 =?us-ascii?Q?qjG10jGaVLjEcwYxokQZqQzJXeBgPJuVh/oBr2BDmfmcgu+p40a+zwTA7JKr?=
 =?us-ascii?Q?bC47F97ckisTS+92CIgqYyKarTnJn1plfHKua0f5XEAE+yOWxy5a2LW19eEq?=
 =?us-ascii?Q?leMR4z5o8/H10oNL9PQLam/X5xpCar/ntL8vAeEk1zp6g2g/rKfX+h3p0PK1?=
 =?us-ascii?Q?CDbyCQORBR1g8/35Ziq5z8Nxt1awr62UWplynCJuRnSXEQnki670WaP5ESio?=
 =?us-ascii?Q?WHodbP/y5GsfSKcy8ISvjuVW59p0Kgpv3laryppSrfs/s/EAF//MbXQcvCs+?=
 =?us-ascii?Q?+lLIMYdU/JwHIC2uVijHXQmF1/8byFUpFZuHfYXwke0GXSaPDCnQGyIMC4Ae?=
 =?us-ascii?Q?vf5EtHnsBzMMjc0wS9zaR479YF+iME/WAbKSpdEvItsEnKMfdtmlsLwb4pXw?=
 =?us-ascii?Q?M+KfYVbQzq1FqbdLqLRkVfw0HJUuB72HtPMh2S1t7HVNymlQQKGiOku6NCWV?=
 =?us-ascii?Q?2VkGWbGSG7TuziwHbNoxcrxNQVmrnB9WpUGGLEdnFh8P+6iAnwem/JQc1HZ5?=
 =?us-ascii?Q?a+d3wNZcKzMcIvEctndnvbS+CLz+JHnQa1NOeLoTtITDW3qxY5EaTJwTC1MV?=
 =?us-ascii?Q?5AaGBgXxSvvEmPGQr1ys9O5ZJBjRyGA7pmQeEjMwqxVmIVvGICUJ1ju3dtPB?=
 =?us-ascii?Q?dM0ca+8IjEU08MszmZT+Gj5WzX+YdCeM+LG1hoN9muUNpg0zEf7ABAPi0nuH?=
 =?us-ascii?Q?TGWALgVjbXFcCbjn+U/bOy6XhVHq+KIaEQ4x6CRNPZl7qYfsMDlwIKL+hgqC?=
 =?us-ascii?Q?Yqvbyh950TpXMyNUsfag4hvnE6kn2Uhmfcl39+Ro0n0ZTEVhbPmAZZ4CZUQX?=
 =?us-ascii?Q?Qhx6EVBReA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cb43bfc5-ec7b-4bfc-da26-08df34c1a0c0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:03:54.1320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nA+93Bf4PgAjPzpRoUbLTJ3eoe0O3UII546gldzFN+s22n8iprcnfKA73ps5gly6hZWatpB9v/js65TeVnuMD6201h/jb78avUfHvH19yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248785
Content-Type: text/plain; charset="utf-8"

Release: https://gitlab.kitware.com/cmake/cmake/-/blob/master/Help/release/=
4.4.rst?ref_type=3Dheads#444-445

CompareLog: https://gitlab.kitware.com/cmake/cmake/-/compare/v4.4.4...v4.4.=
5

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../cmake/{cmake-native_4.4.4.bb =3D> cmake-native_4.4.5.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.4.bb =3D> cmake_4.4.5.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.4.bb =3D> cmake-nativ=
e_4.4.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.4.bb =3D> cmake_4.4.5.bb} (1=
00%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.4.bb b/meta/recip=
es-devtools/cmake/cmake-native_4.4.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc
index 4c73d99fcf..30294fd9b8 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split=
('.')[0:2])}"
 SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.t=
ar.gz \
            "
=20
-SRC_URI[sha256sum] =3D "bd24c30d80a7744ae84b845ff080cc8453b06c622ef0106656=
4108e9cefc44cf"
+SRC_URI[sha256sum] =3D "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309=
910288886e04e2"
=20
 UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.4.bb b/meta/recipes-devt=
ools/cmake/cmake_4.4.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.4.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.5.bb
