Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6128.1794231673296071714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yyliNkU1;
 spf=pass (domain: est.tech, ip: 52.101.65.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0I4a8uqJV93n2JJ7W4Q5EI+W5US0DgKy2qORs3/kfsW1oIqBZl9tPVifq7t8deoMlOEmeDEqHKstI0xIiaFzhrCVKRQl42+gIG5jMklFGjk0u+Dw9AzDk1Lp0VEBQl0EMZFA60uRO9hBoEjbBcgEL60y//nRbI1KjcKXwLdLji2cyjuYVpUMHp2TVq+/7OGhoFDZl5xjC6KFcAf6SeInsVf8N9KmIsjRgQb1tkly3XIpqY+X0R5EMYP/bcXKwnEU1AZxhbUB0+CFYWr3fVi/RF/NDAqSW70YH22g167U3wEEuWKXT+FP7gWxs4GRDIYkkqvk38gu5ZGZkGiAQw24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aXKC6/2o4+1ADntHA4NqU2C0oEnoS1rEGHDDDF572Q=;
 b=K/bz0JP/vYtv0NpNjB0yQE+FRSvZ2X0Izd+4UfI4gkAFdEPbMiBU0XFiZxRkJXPbjRCZujuR96k4B5duY/0CAN3pXov+Wcsy8mtRYVxMvrXrQSHLLxfd+/h2r70hZHKKGgfXlu+wDYuH5Ro3RLDxxNXYhNst9rHmahKJJiSotHUStK8EHILIKiRp43ZJT0v3U0D4dVbyOQqVu+xhIDgRw2UmjpHk1RyCfI3mW69DTSiFJeRWalY0xHZg1mBcL6EfQCbYZ5qu0bcDuXCSs51dSS5SMBIrZ/S3mscZvoZOWfCggjg/bT4hxegATsn3EWUtCUkUT02IpTzgEufBC9iIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aXKC6/2o4+1ADntHA4NqU2C0oEnoS1rEGHDDDF572Q=;
 b=yyliNkU16SbdOeLqTRrRuf2bwYveqK7+RG/GGMwwH03QwOoufZYyYJNHHJy2oyeGwn0x+VgQgTgV6UnUq5DIWUmWFrUVcZGELak+iZ/z5IsHNe4OT15TFMCLQTcqRamsdtbiz0pirfmT+TJZ9YLK2JwaxchenF92RVT0bJuTIQsFauFjgBi1zhe+hNmk6OrzbGJAuoLTS5qDup4Vzfn6IzXLBY+3/bnUr4IYleRJDPvPxYiotHL1eXnp8q4ahqxpF8I1LZBJc3+R1StdOnUv+YONZRlFZ8SEEraMPRqh2GiVIzb0GAfdmj5K2Iqs/SEp0xg9FdJ8LSW+wtMQaqbJmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0994.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:41:09 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/21] python3-uritools: Upgrade 6.1.5 -> 7.0.0
Date: Mon,  9 Nov 2026 14:40:33 +0100
Message-ID: <20261109134034.74458-21-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0011.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0994:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec0e587-0004-4abf-b6a0-08df3e671c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: MD413ZlDap/SphuEnPYxJPARL47xYu70Msr7QH7u/QmTxkKwNvrf0z30g4G4VyF5O+niEbk+F/+i445iotjyqE7hZC3DSLNubCczMI7p1yiurUvuGKt/bdfGH8mtoxQ36Y3JuMMq6vuFl/7OEmSEbIf+1GTCvInvH4G1aamd0lwHZb+5Vb+6fGdS6j/apV5H9bQL8hgYXXJUsynNWPaJcC/tOdsRNDD7GTFx+SoTeHkrMHlF7y5B7Wi/3RBd4wQ+qsPmLvP9QF7ysx5L2kkIXRVXXoWlCu9n1CRh1TNtxYaQMrDguzd7SktEoYepir66JaE5B3+cb8B4ZYvywX3aBbhD6KDCeaCfp1Y5G/kKTecai8yYoPVsh1zlp4izQ2zaNDREU4Vaxx5hLCW4+UG1dfOzjNIMPXS3juGnFwMnVbwVW0j+2M+NE2FeTdzNH/9j3KWSGf2a4EXr6E8ogArb35nH9HqB+esVKJ1p1FoNk8RDpY5+m7sHVN9pdLMRO67OUdXJzOSPOYvVqneoa8PulqFLch5jbt/uNWMYk03i6skvKiT6Z15RQmiJH1rb5DAWsUymt5VNsMU6aDMGyDaC5haT1EPbiVMxZsoS6d/5rt/BPPp7mFn0L2q9vpwZwGwQr1kkQsTs2+LXIQ4at3b1cDhdMCnywggaXKQ2QNITDc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sVxy8oJQN7cC03dVZ6xYNPWDnTLzvtnp5j1jAuLgdvl2xXeY0/8S0gRzSslK?=
 =?us-ascii?Q?e4ccM3OIbQb9BkxOQAVOnmzixCbfT1//2SrkTuUP2LTK13kaubyriChKd4j2?=
 =?us-ascii?Q?QTnpkGV6lsEbS+kFRW+xT9FCRk9or9HLeVrvnXvC0pJdv7snIX2Ubttczqt2?=
 =?us-ascii?Q?oOrA+CEI37/SasBkPZTegNsOBW1Nx09xdaEVcBNMikdm1f6IvmCD1D+PHArw?=
 =?us-ascii?Q?pXI8cwJ8dqRlPK/xNdUKSm0KPq/W7Zj28eymM1RwvJAIL06FK3nl8C/ClzPx?=
 =?us-ascii?Q?Bfcos2XDVOvYtuiPPhn1gcaneCPLvk14ERWgTr3emeDVGiWnYsD+7wyiW8uX?=
 =?us-ascii?Q?J2tCi+/K5uSsVQb3SNb3GazM12Kjk5T62Z7IO0FHMLgHPKjM7HlGD9KP2c2Z?=
 =?us-ascii?Q?3WqgLc8NxbXUEG9i5sK9d5+hf/gKv9LQN33I/qm/xNTJRHutH+t6Ys2m7wd9?=
 =?us-ascii?Q?ttIcbV6sLQk5zpxiUAPWh1DLsaRTSBm7cdg+MsvgahYo/bnX0KzFgf3e4TWJ?=
 =?us-ascii?Q?tk969mDYKrTa0Ro1bhEB7bRY29W2WHykNxVE2QoICKC+lyfSqcxDuciGhdre?=
 =?us-ascii?Q?ELgrV+Adu3VtKFvkc2pCTHbdcEXJ/tcvvk6ZMifS5lVEy49xR7hrbJbDJ1+C?=
 =?us-ascii?Q?/k1bFgCBRRdullVcC6AQdtnjGwO7py5fsWFJPn6JqShNylaqYbjMKwESZz6s?=
 =?us-ascii?Q?nvruhLg/MaMPBayyxZ89+qRRg7fELZlt+dWx5k7GusHDw59NDWqE2T4kPoqU?=
 =?us-ascii?Q?U1bQ8B1smumbjD062HWWYFe063Ro+t+jy0RiIBPRZA7Nxp5JaDGjM3UijfeC?=
 =?us-ascii?Q?8jMRt1sRdEbCKI4SWaKkgjFAAkm7/xtwDwlugszagTzQAIKzz6X/t/ag2wA8?=
 =?us-ascii?Q?FTVjk3EbXnqkiF7rcvEfijA+7bvNAXSWFBDLYhgNHV2Wq1ZACj6/wBTYc2Nc?=
 =?us-ascii?Q?lP9mT2+0kHI2EKb2oRlZaw/hURtZbv22s7K29p2msSd9JkF0NM9cMXjUJ1cO?=
 =?us-ascii?Q?uHFtCPdFdhdSEip+e698aosGaV6pN68+hPaX/TokH8kljuDAR2hl7siySL35?=
 =?us-ascii?Q?at6XR4F3XLPlekCMcXkF+b8J1WkVfbfN2oTEcFiL1j1t9loBHw5WnkH50i9W?=
 =?us-ascii?Q?qFI4iw1Afk3xJSNucix/X3xEdcBn7SdLMSeHJ9Dv0VThH8VvgF/HzjkyOJcM?=
 =?us-ascii?Q?QkXvNTf5/9pvTtQOUuXX3QtPd3ToO1ulkEpvQDl/0kYxBvK3eSHP6LUJ9kk5?=
 =?us-ascii?Q?NoFkOYXA1LJvBGfh9hFUlpX5ckcubPNh796BOTSveHnORqC3hIPpquN/zhSf?=
 =?us-ascii?Q?YrBeeRXa4ksZK18J7Ko+0jxjB2NCmfLWwfU6fC/D1bl6sgWvKaNGggi0Ar4D?=
 =?us-ascii?Q?1Y2swIVT5szQP4L7wWxT/F6LRBCROfefFpzofYGKLm7UfJFJfRbLi5ZKctwO?=
 =?us-ascii?Q?mgeZa0TbGZs1WQyX8+OxjLwF7Q3CUhl55gyC8yY4VMVTNpHDLdybRw9FHXuH?=
 =?us-ascii?Q?KvU9D4yMr81xIeikaZ78AVS4lgjvcUwaUqytPY0pvye/OdD1ApdrnjqDcQ8J?=
 =?us-ascii?Q?DtaIfJZc/gG8D5yw6C2hA3B8OovkrVM1pCsss4wWmjTOPP8yC/jjCfZA9Q9p?=
 =?us-ascii?Q?3OL1RB4RXEnau5nv3dL8tvtgQts9yhqfiSYa3USZ5i9r9PxW2b0W2mJe41GS?=
 =?us-ascii?Q?qM9k4IYgfotCAij9xlgkIEexQDiyEzgJFvgpU9c7oJwoTNWP2dmK+Rde1NTS?=
 =?us-ascii?Q?oWUvrYKQFw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec0e587-0004-4abf-b6a0-08df3e671c8f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:09.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vpa0Ojakg+05bW9CHrJ7ZH/s85EKSSNkTP3U6MUQ8PwFIloHhYvwoQXT/Hv5rQfaAHpAskgoQwF0waiUwrRR/J8J2/oYJj4Q1qwaxVIb+gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0994
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249825
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/tkem/uritools/blob/master/CHANGELOG.rst#v700-=
2026-11-08

v7.0.0 (2026-11-08)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Drop Python 3.10 support (breaking change).

- Fix ``SplitResult.host`` for registered names consisting of digits
  only (potentially breaking change).

- ``uriencode()`` and ``uricompose()`` now raise ``TypeError`` on a
  wrong type instead of leaking ``AttributeError`` (potentially
  breaking change).

- Update build and test environment.
- Add support for Python 3.15.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-uritools_6.1.5.bb =3D> python3-uritools_7.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.5.bb =3D> python=
3-uritools_7.0.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.5.bb b/meta/=
recipes-devtools/python/python3-uritools_7.0.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.5.bb
rename to meta/recipes-devtools/python/python3-uritools_7.0.0.bb
index f886a3b38de..a19949c7211 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.5.bb
+++ b/meta/recipes-devtools/python/python3-uritools_7.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/tkem/uritools/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D079933dfba36eb60b5e3512ca0ab61a=
e"
=20
-SRC_URI[sha256sum] =3D "5a46002351b745a6910f24167abc1ba0a7f78818121fffb32d=
be1fc7767f462f"
+SRC_URI[sha256sum] =3D "110b773e3f8fbaebcdcbe1377d04e418b1985adf69deeca4ed=
569f3e328cbf48"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
