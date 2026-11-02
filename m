Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8234.1793606913428460224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 00:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=a4MtvBUd;
 spf=pass (domain: est.tech, ip: 52.101.70.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIg+Hvp2JnKFMFutJeZn8Qr5TkqD9+G1WfZfe2ek6fTJsZ54vl49WGtgFKOhTSi3yZ8uL0uS7bIhNr3dYdoimyu0+OFcXGvLTsNlDhqjCjafUNNcTO9lm/U5XR5cEIezb54/eQaH6Bkm08tMdqXdYSvE96lhTRHmUpOkicP5BqPxJE9bao+2RD/gpl5mrwZF1t9s4nZDiGG3vM2DuSzNlo6/ObbQUWKekuzfxrMrbEw0FjxfKqrvUnGW9dTxP0ZSNtJcSTPHygrs/lpwdjuM1SZFJB+w36x7PLMS/b7H46g3w/k7VzaD1rlbC6QQjqHwTDzRlvbqk6kqasNJin5vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWIMKBjqHmqvRFNS4Vj3g3N9XtPMVyLNrdNf4F7NOcY=;
 b=KmiJVZdrTX/P3mjzPEDr0yN0y1TfytTAspGQhkz5iKQQI7711ZODnhGdV/O7aTlF3NP4L4CtjDlI5i4O/Gk68mmzXiFhk9izuG2vCspqR9C878Q3unTS6BLfHpDVn62aFaEypbTJseAIMau5uIhvaCEY5fFNq/zSurhl+g78ngWVlfOwvHuU9+z9DQX8Z26JsYLFDMXKy3ehWpH3Poxn7qD3kUnglgFD+nSmP+FETXEoyQnnUKZWiU9CKqu5Et36Sk1pYi9ovLQuBxuzTOe9IXXnP/FBm86ZCkemg6LkQ5uRR0sH7SgnVcZTTcKYlTVOoswLNS/b2OlIOnEbOQeuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWIMKBjqHmqvRFNS4Vj3g3N9XtPMVyLNrdNf4F7NOcY=;
 b=a4MtvBUdtDgldNVxSYJjP9CE1IF7MbLpFiS1fBfSlY0Lp13DTa1VBjVHKGOcKSIiaOjPj0W/cGwJY7JCDlof3syBwiCtVGosHjO7dEcgogAvdJ0XOGSYBGteSGQCwq4CjxnVSe9oGBNkZemAA+JgHM1Opwn2J3iG4fYmkUtJk/rl1K+uUCcYh5y1XK5S9B0FPEih/IL79HRzLTVyEJh6l0/ORzbOQ7gA/HkdmidGePwsagVEPm0Q6ewLrwZH3L8ndQ4btW2WvAAKxZaHcBvTgV3y39kFd+pGs376i4LRLmLlExwkBUoqB6B9uNn8776x48OK4PP/xnFh0zg76m2MAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2290.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 08:08:25 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:08:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 0/3] python3: Upgrade to 3.15.2
Date: Mon,  2 Nov 2026 09:08:20 +0100
Message-ID: <20261102080823.31025-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0002.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2290:EE_
X-MS-Office365-Filtering-Correlation-Id: d4081220-fe6e-409b-4771-08df38b8784e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006|11063799006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261026121527099003|261009220027099003|261009223327099003|261009221727099003|261009221227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: cj3yObB8rURsTW4rMgZKOknBC2iN4/oCFwlQ95XIsuXq0DuxCVMCIWrdqqRepK+RIhM3t8/v/Qhfj3l1OMaYl0zs1F4evT4hnR3AtnwXUJqKZHKXFRehuBtkZ+T18/bv01XG78QBzP/tuSIgaIthHF3BlYnfNQFTGqURJQjOWuWwxiCRLvGukqXT8GSnl7voQ4YJqOpEvHZDHGKTxEQgE15SgnzlRn7oBJfJxjdrfhBtz6mKlbuRB0yJvcn7+x6eBuQV3WCIJHdQTDvS3yzu8L9u/iSx8/jU2NhqoCYkrQTBh1xyibfCFzkWHLgMljEc6J+Wk7JQUcH/UeUOMVaFinXXizdNGqHYh5S55WwTn5qWStQElP+lHRCzd/QdF1l8XfV0SoprbNCYltw7ELNIlZeOuu4Af7eumdfvsR7T+42m4LWJ7T4xYvSXJLrgsoqZAmZ9HLca68KvaEbKVAzWqJ6iR66FcdQWRN7kzYvWQl64ud4AG5tekO/ckQX3A6lEntYqnrFMfxOQeAlptyZcYTl2OTBkUJiTemDxUQabpoFE8TMZcZWaSSzSS0/i8kboQdex63kwkcc3eF1QkojaS7J5e0Hm7gvXGre1QWdDDWnHn0yWuXEDtRPjLnvLqNGc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261026121527099003)(261009220027099003)(261009223327099003)(261009221727099003)(261009221227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hods05oTihQI2sLfPDyIos13HiJrDj9Er48GQw79spiOhrdm5EqLje6Zc0ul?=
 =?us-ascii?Q?EYr6djRq7N+J8XOygTVaYwivXwEegtdG5irS/eKKQC51w3T35WL2vXkNIzrb?=
 =?us-ascii?Q?xupbrWDWk4lEU3uUo33TKuIaUXx9F0hM+7ambOwveMvfPLXB7chFX9UHGDjg?=
 =?us-ascii?Q?MjJvOLlA89cu2VU0iCNo541L3717sywKDxK7s2mPYpUmALLxfWHOdR4hFIYU?=
 =?us-ascii?Q?+afdbciwVsbVJS3pwD3sJ9CWsuwqwd9RmIsymBzDu6/V+rhrq1dO6P6NgbgH?=
 =?us-ascii?Q?UanQWe+eMZpdG5ewPtxbP16+YxOrgq0lk3Z2cY6F2LzqniwrOUpxSmSicOWH?=
 =?us-ascii?Q?mpcmx3bO6rk80HY2BUmcjD4qmUux4wqvQhGuFH2Syb/Nq+Gv89+9+g3jbRYk?=
 =?us-ascii?Q?fn5ve7Vhj5TV8GuYZar+kSJDvjIQslstoOSyPoIxJcJrip5kW5ecclAuwZwi?=
 =?us-ascii?Q?aPn294jrH/r7oBKv1PlS3zSG2d1qCI3soEFY0D02ihkLpJ03QjiqRETbVE/9?=
 =?us-ascii?Q?4I/PzBVx7QNZIuMwvkRuNiEqIaMN+68d/vrAazGEzfgt+xcKr1MasiGPv/th?=
 =?us-ascii?Q?cqSO2P5PtIGmdIFtaKOCnR5U+ZBrL2N10S4ivPrICFhYbj2msFpU3QgNfFpA?=
 =?us-ascii?Q?OG8sy+Wxi7Pp6dGR2jxQtfxUo1hoQrqlIvbVsnP8jID0AKwAerwUyrcdWf2z?=
 =?us-ascii?Q?RZif/PaHa0nY33rMcyEuHGkH3secdyspK21EowSNGqbgeKqb2AzH2dquz7A8?=
 =?us-ascii?Q?2l9Bq9euS0acwqA6d3WrtaCY6Mho53y2LzbMpsEWzwzxbBarDdPM4xPNcN85?=
 =?us-ascii?Q?A1RqU5JBopGdNru2HXcLqNAEN/b/NqTtcIWBa+zxPaqkCDCwBvNEzuTn/rIR?=
 =?us-ascii?Q?ED3nglV/F98KfUau/ISvsSEzgzM7zuCS82+l1QylU+q4t5IAHat16XZQG7F7?=
 =?us-ascii?Q?ZrJNUJRMN5c5vjlqZB0eaNYaNW/SLVH6095LCKZ8YvZi1fUn9eOtrcUCc1+p?=
 =?us-ascii?Q?gZYyUkwiKXwBHTmDPamYMJU4DxMSVCFCjorxwBGq6eCUUx2WWUzCzh7Kf2VL?=
 =?us-ascii?Q?mH8rqB45d+1/R6WyqCLdW6TX69mjZCXYOTMRoyXZ5yVnpWF98DHdIgwliZJN?=
 =?us-ascii?Q?2IGgoHUw77K8e7R9Almg5IPLUxL9fQwVsOohSokx8CA7JwAtGXxpit8oK5xx?=
 =?us-ascii?Q?hi+W9j1TMDA4sDtwyZYw9g574qV/3Pub1/bEL3qulooJopCJkWrSg7mOFxZA?=
 =?us-ascii?Q?4fON5kX9oQRrmhfp4jDG3stTWHa4D0MUqkA/ZsTjzVTPo5l8ZnOZ3FV6jOzr?=
 =?us-ascii?Q?sZjv1NeGIK1Y5B5m+tUFoV3wj+9Nb6KSbnB3WGA6zK7gmKhzsVu/8B0QL4mO?=
 =?us-ascii?Q?9Hqzk8a/pYRZq2IsKbibrHghtKP4SPjaKmn1pgKZwqYujB0KlomG5j+JvAan?=
 =?us-ascii?Q?HKsQ3jxH0E7UjcCef68hD7R2AG7x4P+utyqECaeVOvNt/eaauuDh/bp53u2Q?=
 =?us-ascii?Q?LnWkWT09EZceDKFZfU4oQ84+ULKZjhmBwdr5Wm91t0Om6wGQsocG7eAu71o6?=
 =?us-ascii?Q?hQaA6i+7Ovx0KHBVUKd3BTVjp1TWGSuoNYOoIa6bWI23sAr23K9MkH0WwMFP?=
 =?us-ascii?Q?wpSgKO7GUw4LIVZjOV0Azqa45JKD+uwHovpKQnZgYnceOybLMaFFD4zvGZQH?=
 =?us-ascii?Q?sy51zsPqPwVPHlMijVw9Vxr4R8OR62sBIJJ4EmytNKEgLvFPdC97aMZpMOVN?=
 =?us-ascii?Q?/BciR0CyGw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d4081220-fe6e-409b-4771-08df38b8784e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:08:25.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps28Zhqi866O6y0sWi9gQiaRcF3+KRUHCxzN5++Tg5T0U3K2Mt7PxFT8pTMpLIolqbU2sihwRMW6tcgPELudYD8WnTqc+Ta74VKZzlcto2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 08:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249192


python3-maturin: Add support for python 3.15.2 can be dropped if
https://lists.openembedded.org/g/openembedded-core/message/249174 merged be=
fore this series
python3-maturin 1.16.0 contains Update-maximum-Python-PyPy-version changes

Jaipaul Cheernam (3):
  python3-maturin: Add support for python 3.15.2
  python3-dbus: Upgrade 1.4.0 -> 1.5.1
  python3: Upgrade 3.14.10 -> 3.15.2

 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...n3-dbus_1.4.0.bb =3D> python3-dbus_1.5.1.bb} |  16 +-
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
 21 files changed, 311 insertions(+), 858 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.4.0.bb =3D> python3-db=
us_1.5.1.bb} (50%)
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

