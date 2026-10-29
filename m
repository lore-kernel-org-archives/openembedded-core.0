Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2507.1793308006453945072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 14:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BDssBuij;
 spf=pass (domain: est.tech, ip: 40.107.130.42, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr7Qkoyn2QS6dViUFww+aAmSStsOka7u36nqh/p5UMfWPWNgGL5SvTgqIMHrFeDAhm5B4+MY6DzynP4J2yU5w3I7RXMWI/ZmIborNWanP1jg/XzGpo8PYT0NoEtaXwKDyYobzTF5aSJfLeiWRCnSwDFG1lskK0h0Z2fxSpDWXpUsMMGP7muBVb3RcfAhutx7EaboaUjMSIdfmfcbRxoS5udIgAp0a0moBAzTvN4/Cl/aKeogEDug9pHB5T80xqys4WPzqyXjOKw9pceMJb5zC5q8K4pyWHzKAx6nsyirr04jfSekrZh9DgcsFS6F4GajzsJiigUhkHHgyQ7mb5+Txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5iAOdcWN0ec8U15NchnHDxCniqHwsAykAUvJnx5QHM=;
 b=iKRSTtjyQEePJMeglaKrkYUxyr6uwRQv9H4851P2jSNYA6H5T94io2F4Vj6fB9CjHZO7pATx+uZ5ZMlSp7w5VayE8dMJRhI4MKBp/AFdEbp+4OYDs+oPekx1v7wEi/sIbgIKjoXv6AhQdanDSw3rQJ/YuP2Tp6iFB9GHCZbleV3LBqHYwhiNgqdSEtW7mGAYTKzyoQTIBdFmZLpRS28sQE7Fn7lhfQy2Z8T73gOmMIsGHfheCAL4e2c2dPwqJMIc3gDQF8bma8RQZRXFZbfLEZ0s5RSRnKPuqeNW7DHyHBXSaZHnSKYu6qvIV65/6c6ZWrPE+8P0SHWrdJ48nn5t7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5iAOdcWN0ec8U15NchnHDxCniqHwsAykAUvJnx5QHM=;
 b=BDssBuijXVLQ5LKgcaK4KRjb38dBtOFmUxABzVQpfVj7gzKpf5z40vaNlVhhht7RXG+o1hiBsfvWnRPYMadRLjpPxTZq3t0IbSwdm0icsAaM8eqKGuolfcxQhx31Aq/cw/GL2EWk8k+1uFtGv1LZvQnOzwMpMIk6vU9uJiwLkp8TL9dl3Rn2MdrAiJt1Wr0cmq+N82eGcfYPDr9dbTJ+mAw/AdssDj+1ByFTfU6G0iB/cFEYrOBP5Rjou2LI1lkAidlVmiZgN5NNa9kARIPN5yMRigJaXwIFBXV3AGkM0uUsL0Aryt8uhtJ1ycT/pXyyDuXuHOz3HDXWuyWvfJ3LBA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVXP189MB2127.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 21:06:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 21:06:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/2] python3 upgrade to 3.15.2
Date: Thu, 29 Oct 2026 22:06:34 +0100
Message-ID: <20261029210636.16016-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVXP189MB2127:EE_
X-MS-Office365-Filtering-Correlation-Id: abea0393-f3bc-4c80-12ab-08df360085a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261009221727099003|261009221227099003|261009223327099003|261009220027099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: qrU4Wlsr50yQZZvXkYzKUYlLn7Z6rQALdDSNl78Jz3oswZWl9D2NpsJq1HArbeIj6s+sLRWSq87pt0iNf2eXuX5wLd23h+o2RXjTgJtm/mRzsrhQz6U4+5dn6+1e3Mvu8SBlBdACyDcx5mBw/YVHZCgvGjILa3biDbZPL8S+lb5UZDhZ8JP4Il+qUHTxcz5P4dWjJ0IIrfxsxZgj7WIQSRxr78AE5eTEOQVSLSJ8iSDFjVXDriaB8IsOmiCEHeL+xb9vHqYu4AQzPrMwlchvG1iah/nz8rJ/QDR/jmdtXjSrn3OtTr827Y+OQLUAzhGhcd8Qz7Ta04YrwAMYrD2tNYQLNKUqrmvtlcluJVaFA3NiDVka6S0AIQOgLk8GhtWCLPDZpmrPbFsm90L9bwuLhFtHdKvHOkZQQAk9kko8fxJPNNhV5NAQXQMD/p8cyQWBj3JiAlWZ83dShL/o7rN9FJzwJ98vZ5yxjlliGzgD5Le52eeOGso9a7Ma6p1NwBznRRnblxhJVVJMnFWvXj00q3ttVtIf1aYN+JBJoHDt3wvgz7xLMsJWL/pex+8WwzhPr2aKzEuzmjpu4IiKAMq1EssiKPMQlJeptCcDxEp45st9gQh5YbBl8UuHDK+Z5M+QZh7xSj54TWOeZmVZMjpzyXFOOvhnE3iw4wP9SxIiMaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009221727099003)(261009221227099003)(261009223327099003)(261009220027099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rAlkirEW06GfgGDO9h7zF69kJsG7hDZpJ77IN2v/9jl/Xc4hHiipZtseHd0q?=
 =?us-ascii?Q?HfOwYBR4Om3qQU/U9TPyNQ4/6mqiEAed4PhM3YIaJDH4vdQ5WsPkpwyL+Yri?=
 =?us-ascii?Q?GJHVsAS1CpUphg7bNjxU0FVZk9PKyVTp4586tPQW+ijyu7s7zjKPAl4iLtpl?=
 =?us-ascii?Q?v3dTmm1zlYRcDOMQ4kwjRFOTRtuM8S6P1wYo6L+HCo1f3tRsLkqhGHG/Lkk5?=
 =?us-ascii?Q?4fM2Qlq54MXH61zVK9kB7EvEATk9wmz3c3wC8HFmg1cg87BrqinZby42CYgo?=
 =?us-ascii?Q?AQN2uRm+9YNMdlO+PHl9VBWHQiB0w38DhGP1eSsT2Ga5LaefPkBHSI0KV3se?=
 =?us-ascii?Q?jyylaFe+kFVUi8yOts3flWEQVQeS4ETKukEap2aic4GaAK961j9tie2aYvCa?=
 =?us-ascii?Q?U8f2//GoZ7RWbUyiStiGpO6g8pUDrx00rTnKCDXTEOOk41zpzzxbJruDjcCi?=
 =?us-ascii?Q?HSS6HhUlP+iuf6fOimrmaGvgmrs0zJeFRPWSMk4EQwA8V6ashAbIGeuI8lnw?=
 =?us-ascii?Q?wyF6EV/KHde69fbRaZCXEtczh+iqozt3CKDjczSiLlFneYYokGMg28e6ZsNt?=
 =?us-ascii?Q?6Xie4TGiLUsCML17HPjcYSOHqVprOpPjmCdZVqKVWlERD8s/hP4XLSA7j6gZ?=
 =?us-ascii?Q?r9z+qaPpmuIEYx5oQ35A+HL8Ra4q/jwL6wLgV0uW8S7HOIKkSAYOodfzKh+L?=
 =?us-ascii?Q?KE8+e9Yolbv4+tfFyi1cr7wgTYc3AlbWBAr34FdCTeXbVnJvUjlQtEIZT7dV?=
 =?us-ascii?Q?Ixty6xWI+JwxAed1VkFsvSklzQ/B0EJCJuCUfhFTiZ9j4uMpI/jCOaQZop3K?=
 =?us-ascii?Q?sQTQR+ab3rjb9i8Fa+bSnnXHF2RAnwqvDaCwUy4BafUYrpnVLGIUm1Jw/zWB?=
 =?us-ascii?Q?BHPry3vAHLRS8XZfkFUuCqbH/ZnR7g7mITZrj6GLzus5aL8CFJVUX0fmvxb5?=
 =?us-ascii?Q?9TFZPcoD9XVQsitKBkIyBLXdAfBdHU/Uly1NbVNOSY+PkN3TjZFTz2hpNHo9?=
 =?us-ascii?Q?r2AeXEpJNC/fYoeT5LXi6FQc30w4yn5GxU2lvQbSor71+IxriLqCfWksCuVE?=
 =?us-ascii?Q?uuO/EfyH9TFP85jECygXVMfrMcsCwqCen1BQX8tite9whBKSuyFY4ba+LCMx?=
 =?us-ascii?Q?lNuvQwKG64STdiuRgTSZQsy8YTeBH1jnfbVynU5EeEPbo60PDwE8A/JHIjc2?=
 =?us-ascii?Q?jl4K/W4zJsY/tGOr7BvaxGVANT7sKkQMnRqkCii44LQEFyd8B9ExxH58E5py?=
 =?us-ascii?Q?P0nINE82gawis9jXF9nHcdQFUAm24ubmlnYFgHV3FPqrmWi9v2mSGx40RRA3?=
 =?us-ascii?Q?Wc/pBC92ZORZ6VC8e7R1TVtcBsBGfPNaAwjoVAzt0HIHyE/LMOWoLlpJuw7U?=
 =?us-ascii?Q?lD5cKw8XPBQqKHKZTHbzE5H7n5qTTxozcubg9h7jQ5S8P1pM2zUkXfNlWVdR?=
 =?us-ascii?Q?vwyJQSl5pEqJgL4iRNjj6+lOxpv5pzaIv2bBjzXUD1BYyh954AQF4o6luMrS?=
 =?us-ascii?Q?jh0IXjvl6AzGdmxXpSkeHH5FW9GWO7mgyy0Ai0+UDAwnUeAFLGzPlqEWjFO4?=
 =?us-ascii?Q?w7zpyns5PKcBIv3Zc+t7F8K3oqAxcMnHjmHzoYA2XMwBCU7M3wCRj2lGBOPO?=
 =?us-ascii?Q?Qst1QUNt+ezZggFE1RPqTLQqEU8CvSbvb9Z2Z1U7cCFniML7rFJSemvPD3sw?=
 =?us-ascii?Q?Mwy923TUj8KJ3q3DuSzOVgQMvL3tbbvd+FmZy+jJwkp+lSZ4nCuOsKtnmXz1?=
 =?us-ascii?Q?UfGnnwMnQg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: abea0393-f3bc-4c80-12ab-08df360085a2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 21:06:38.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79WBX2SXf7hgX7zFqAdJRfwJ8skfb8J/90hIhNtoNXagfGGlKJotWmKQE/O7/4oZEgyQbmQTbYbltJu09rmDaYNb/aOpy8sMESFBIca+Gh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 21:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248973
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (2):
  python3-maturin: Add support for python 3.15.2
  python3: Upgrade 3.14.10 -> 3.15.2

 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...1-Update-maximum-Python-PyPy-version.patch |  99 +++++++
 .../python/python3-maturin_1.15.0.bb          |   4 +-
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   6 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   6 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   6 +-
 ...clear-RUNSHARED-when-cross-compiling.patch |  46 ++++
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 254 ------------------
 ...st_is_python_process_non_python_subp.patch |  50 ++++
 .../0001-prefer-valid-entrypoints.patch       |   6 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 234 ----------------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  41 ---
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/python3-manifest.json      | 199 +++++---------
 .../python/python3/valid-dists.patch          | 164 -----------
 .../{python3_3.14.10.bb =3D> python3_3.15.2.bb} |  12 +-
 20 files changed, 301 insertions(+), 852 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Updat=
e-maximum-Python-PyPy-version.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-configure-cle=
ar-RUNSHARED-when-cross-compiling.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-160881-Fix=
-test_is_python_process_non_python_subp.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-gh-148292-Upd=
ate-_ssl._SSLSocket-for-OpenSSL-4.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0003-gh-148292-Rem=
ove-shutdown-test-in-test_ssl.test_got_eof.patch
 delete mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
 rename meta/recipes-devtools/python/{python3_3.14.10.bb =3D> python3_3.15.=
2.bb} (98%)

