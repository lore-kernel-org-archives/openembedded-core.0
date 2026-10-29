Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7321.1793264049995771629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Jdksbpvh;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8/yzgluCIjjMCr6WtdX0UnYQGw3moai1DaFXuda7C5qRGa08YdT9PoBxZrVcJWFe6gCxDZBIjtTyv7uCV3tsgBHlrIRGbMqxJtqatCoaGWFBcgE0X6GqL6XOwKSD9+f4Z3Mxibpf6Ul7pMMM9rZhHEfOkgtY0jO8xPutSIjo7SE+34tR9ggLucIQLQNuC6p4n7UlTKLGRmGTSb2eanBYsW8k7yapBocCe1BimclZT5ah6Hp4yaZ74QrMYqX/adnPkENRvxZBdivLDtHy1gZeriz17/5YM17Hfi8vVDRm2MJ76R7wHEdq8lAGLD11hzV7hvlPmm86+OmfjUKllyDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLKZHmoal1dq4dkZ6xEDGE9u5UjraEWgurPKfozaC+w=;
 b=nzssjDJZUnaov7swaN7BcWV0DJgdt4h2ey+EtBO98T+NMuwaAD9t4az2xy1kkq/g/9cHFSPImDOxKZnqtHvQV0axvUeE+GVTOKDpciyLArILT7NhoSqOzKVgQ2C5nHPx13hU4dttCQr4a4r8W9wYA041Qpj9QPGxjyggh1nxWVV7WUgL3RzRUs6PafPzOzMw///ejnEXLX7vWv1P+Jkg/qokiLo59ggGFfrnuUc8sXGf9SiILRUFb4euBaVGw7kIEPRNz+IMg/jw5G0pe8Hhly0O0Ct7KXPzUZT6sCPmMskSUuzgV6FJuGXVe1RJlwigIo/HLNFrbB56n2fv2YaKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLKZHmoal1dq4dkZ6xEDGE9u5UjraEWgurPKfozaC+w=;
 b=JdksbpvhlPe/eo3266PxWtmJnqRFGIUgJ+9ue+PUoHx2rbQRD1n/Yt6q6Ab0IvKB7SxXCMDqtUkp4Qc3WOgkp7OIAkFMc7j6NTpjTvqsKunX44NZATL1qPXv+CejhT0dOB5EO9UlRq4bEF+CWKAPArlOXGJUcS94MeGKhsxzJAeAfGKPGgMJ+fK/aKqhyh+/xafeI4V4Ex834gPTBGgt/hXJpekNlvnG1F6/nSzHK7y+01ATm7mFhnsrNRVYzFjOTp7syXOnd11nJjD2eFJ1s4DmHnu5MfLubezqWIySeayA+AgH7tKIJoN0lCRGJOzPEzzAQA5u8uSgzrhcdf/YAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2605.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:54:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 08:54:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/3] openssl: Upgrade 4.0.3 -> 4.1.0 and dependencies update
Date: Thu, 29 Oct 2026 09:53:58 +0100
Message-ID: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2605:EE_
X-MS-Office365-Filtering-Correlation-Id: 138d467c-9b62-4a7e-24cc-08df359a2e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|261009223027099003|261026121527099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|261021121427099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: TB77NWzR/bQoxCr7rTj6FDF/YoIoXG+7DxX8VFuzj58uDwMkGsWrIKqRAHMPUeTMyqMZwpFjcaxcLVOg1A+PyTKiUV1Mkf8k7Rzvj/w+7BSrBMDulyegcq2e3cGyh5+eAz0jN4u2K9LpvNh+whZxQfNRT8SsKNLenK3ESz6pKVA5nRHbWVv9NkQEw28MstWMg4rbEy3tTNR6nKRnllQCLGHTK2oSunhLtBuCAcojannXNO+tFfvUdm53xfIUvtGM6y+HuqZXW/LkBWo4QdeevDozHA7MO8ewR6ZdNN18CQDaiS6DBLW2wznoayY21tTEzYIPEafGMBOjAqPspHpmw2M1y67uVRRZoAbKlbyWZclLtq8agyH+x8fhiDvQmzuZq6tm5NTOSjwkokTXjERSEnPNIx6NPWsc3uJ5GytKSNfocF1c9gq9OCv00kS5HhZQqrI/CKQnnCT5keS684WRdie+BdXIv8arK/8h4ONSje2W0KezFkk/lkTvA8o1RmaAfZLXNP8W6I3ljiGMahHnMmTWLAOncvVUIw8IFW9uUEq7HCtqVA4wELy/0iHVt7HCN7Z+LKSesuzMWfxhyAd9ii7rP4qQd+w8UjGabFuNJ5eWIQey77BeRhhtrcJv26Tcz3BVggplDOvQFWbOPUDqvLUlXtP+OMssNWTKs02ZKyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021121427099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iMSq52wgnZ6LrP1b60RZbxEEeIcnc829swAoF3fv6z6E7gVknUKIeFQ9n49d?=
 =?us-ascii?Q?MfY74cqJf7rbmkJWpZkgMkVIkggLPsOXreCh+Zjp1L6SbKS6hPYAWHjnmU8W?=
 =?us-ascii?Q?5C0TTinAZ/I6qgR33R6NpD4JZCh6cB+CEr+s8ydlTrqJbOWMAVlmfzGaZiHe?=
 =?us-ascii?Q?q692Vvsz2Qp7YzcDZrX0LZ36c38CT3Z3qDV8TUzlxRCdLSWjghQPQU6KKKI7?=
 =?us-ascii?Q?OIIzBhxFZ3YDVVsHb0mqYZB264q6FFg+ejmHoVoyrUUnGbLqiTbYYqSmF1Pk?=
 =?us-ascii?Q?V4qAfTjHKFAnegpdJq86PoGFKZBJSec9cJxgPSGfYNsj0o4BjfYHteNtEcxb?=
 =?us-ascii?Q?mOLa/Di10HsSPsq52KejGW5RZZ7/RsMkLDbGurbwaM68czeIjvsS0YG3P6jY?=
 =?us-ascii?Q?2jusan1EnISeagfLQRqUGKwcxMl9j6BN+oQ4Xtd52FY9BDRfNCJK+nce53f9?=
 =?us-ascii?Q?xIca/wmDPknoB0Tg+WFOB2n48zj9cB+fgDRQ+7M0we18P0zJjDJST537Zky1?=
 =?us-ascii?Q?3fgfiRVHwb0vtnCw6g8RdP09H20Ycdo3NgdJS7jXLRY1zHfDP14d4yvgNeCN?=
 =?us-ascii?Q?3LNAvTm9tE3VLp3PNVdyLzITtcAuEzh8XebnHkr6F2iRJCV6EYLx7P3vPpAo?=
 =?us-ascii?Q?Db/8cLKcnndVYDvL/rrpbz6ATMT6pnFBEhBUV7q6dczKEGJaObVEvbGgKjD0?=
 =?us-ascii?Q?SESwqU5YTeZIsiahfu7zQcgrhluPMnhUM0f3cCcIder1NqAFhWTk+lKpAqUA?=
 =?us-ascii?Q?aR69Q7Df4XGCwweveadU4yLYAcwQVGZwqjonhYxn2/YVRf6AskO/0K0VTfg2?=
 =?us-ascii?Q?aRwFQWVA48QZUw/kq0PH2k2MxnqKl0sOy4xlA/TuGUAUwkIC6x3EdtTD7oOj?=
 =?us-ascii?Q?Uhek4Qr8/SiM8dvIw2KwJUk9G4cdDDHnx1TV6/Vh2e1NGD1cjQIxOWWAe2Pn?=
 =?us-ascii?Q?D0ftw4vRqclT66GbgnBLJvsRVjXxdB1IDVjCPllNjTj4oP0h8fvx41Cn3gVY?=
 =?us-ascii?Q?KFIXGjZ811/WJLajFm8EPLxbWD0Iqy8juLJVr7Bw66+Xztwb3sZcgyG0gpuZ?=
 =?us-ascii?Q?GNsE+BiK7rDcY2ItntXdXvVt7LwFKn/6qp//01oRRmaYoZDxW31WVYPjxhfS?=
 =?us-ascii?Q?WNLHsmQFx/6L2jnMLi1WIE9GLHw2rh6ryvV+wGHFf+4nQOpiB3PzINFCf2Tb?=
 =?us-ascii?Q?Yf9tZThafmKXELdcYUChkeqDIWoXWYkAEq2/kAHswSo1zAvxc3d5AfZ+eXrW?=
 =?us-ascii?Q?KAErnrfJIvRXnP7SX+Cjtb+pqV+Vk36YgQGfAyICuVomJ8WUFw6djspMRcT5?=
 =?us-ascii?Q?bd7r7WLnmvcPZLwCYiBn7/nvO1vDBGq+YkZRb+1otm0QhrNcHumcjFGpAduC?=
 =?us-ascii?Q?3qLP/Pk++jhSv4N1Ya4nKhv65wP79/Lm9WWXoJ1O2HQiS8pmTFDZBBvraMr4?=
 =?us-ascii?Q?KjKAa1c/kinWwbLDB0wd5ynuELQJbDWPBDaUPXdoWapTDfQ/db9zq7cooo9E?=
 =?us-ascii?Q?8teNE8Rlzx0oanjUAm18+IKZGIlydUH+AqYqLwP9si6EfwiX7DIn3c8IJs4Y?=
 =?us-ascii?Q?f6c5mENyX6N3QTnrIEHBROv04axOZp6OYa4iMvSLzIYHabqCETj6zmwkZGDp?=
 =?us-ascii?Q?afF6Pl9NcEyANEm96pPS/3/9U+topYBEGpl9dQZJ3PD4nTAVvhSzZE4JWtkD?=
 =?us-ascii?Q?UOq05OJCbYh2fMGQXRb/jt2jZyDnVAANYSsK5ttotWENITImTeTYTShroXT/?=
 =?us-ascii?Q?OJF2HYTvaw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 138d467c-9b62-4a7e-24cc-08df359a2e92
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:54:03.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPm8Fg8VmqjDK8ZpVpxgC+ZQutGSrSADLTykUT8I0k6TT/MfjkWMrTNjNXtz4e+wOw//yj2IZB1ie/Y0Tk85SzH+m3u1wHnLge1zZdeFI44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248910
Content-Type: text/plain; charset="utf-8"

python3-cryptography and python3-pyopenssl changes works fine on 4.0.3 as w=
ell

Jaipaul Cheernam (3):
  python3-cryptography: backport InvalidTag fix for openssl 4.1.0
  python3-pyopenssl: Add patch to return None for TLS 1.3
  openssl: Upgrade 4.0.3 -> 4.1.0

 ...1-Configure-do-not-tweak-mips-cflags.patch |  6 +-
 ...sysroot-and-debug-prefix-map-from-co.patch | 14 ++--
 .../0001-extend-check_cwm-test-timeout.patch  |  2 +-
 .../{openssl_4.0.3.bb =3D> openssl_4.1.0.bb}    |  2 +-
 .../python/python3-cryptography.bb            |  1 +
 ...-on-AEAD-finalize-failure-regardless.patch | 53 +++++++++++++++
 ...m-master_key-for-TLS-1.3-connections.patch | 66 +++++++++++++++++++
 .../python/python3-pyopenssl_26.4.0.bb        |  1 +
 8 files changed, 133 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_4.0.3.bb =3D> openssl_4.=
1.0.bb} (99%)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-=
Raise-InvalidTag-on-AEAD-finalize-failure-regardless.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/0001-Ret=
urn-None-from-master_key-for-TLS-1.3-connections.patch

