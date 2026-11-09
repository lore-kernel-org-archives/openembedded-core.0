Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6125.1794231665512141146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eceUGqx2;
 spf=pass (domain: est.tech, ip: 52.101.69.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnEEiCExL1cpKqvKr/Aa2DBqEKdCjF7kz7TvVu+0VbhOIAH79e2w1tCo0b2HQr/9oag/ez/i8MAPoxk3r84ZvmazykYm6N4WADiXM/YQwFLEhO3J0+IfIWqxIt83lDreJRiShVOhw+R0r71wkPBTofu4GiCP32QjuCgHAnQoDRWJUMAxhkNoefbQkRRKMyKnS7vKEgx09nOhoSGxtXj3y6cZgkhzlUuSOQQlA0wp/7XcDORNFQvS8aZDYxBrjhjwBQRIrATRCVet5vIY1RPHdWgnTLHUL4eDcL89xALdkXTbfT4DM0KWvdPqollx+1yMdFTVr6KBNr43S84JWecq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G2gBfd7Mf1SGulw2Jib38HZ36iacdRCMRAzRAXHIMI=;
 b=umutVKsTe+YFzkElTzLl1+oTLrkK7LBU1Tv8i7HYudYnkGqsmtZKoMMdKmDnYvZnhcmhfJnJ46Tw0sF/on973WucXgtogIjhXPNiEympB2yOEmelh67AW/j0w3QgN7H/hoQ7PVGQCz/ZGz7h+eBlOweOs6oA0euBvzSePLjQOw7bIUdcoO8hwL1pNi/QGO420yL0yO0BDpi6Bh7HTlngfXRe4OV33h2hGVXauqUDG2q6m2rwux9R3mlfQvtYKz5V7yZ2flmB/MmQ7s+EuUssAdheLAJbMrhcqWOKGex65J9xpOg/Bak0aSTvkSZlqDIZOs7Ivv45EGfr773IZGigAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1G2gBfd7Mf1SGulw2Jib38HZ36iacdRCMRAzRAXHIMI=;
 b=eceUGqx2+n3vTDr7NTH80OLN2KWw2dQrA+lYR4Q24D5GgcjrkQp6DSW8WdIDvE1FccolMcdm7XQ3YjL0Oll//NDa2K/1xKabzukfa4uJUsO1ttgsPCFfFiaYH536AtTEDLgERwlDNRAkui/UjMYyFHF1QBmStY0JLNGz8Gi55zJXpVwm72zLG1FA6CvkTtVjQorwnX0htlt7f5vumZjeDhpon++b0GD1r399UjrOr5fyq1+84JGdunzJiofzKxhZwDpXCOImmMnWuv6CsGeTY2m91HHDvRbjwSgR0wSvoxbgmTrJhisb2tAcjm3Yd5oSOg9A3avbiPblpzjbErfLBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:41:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/21] desktop-file-utils: upgrade 0.28 -> 0.29
Date: Mon,  9 Nov 2026 14:40:30 +0100
Message-ID: <20261109134034.74458-18-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: dde2997f-86c8-41e1-342b-08df3e6719d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|14125299003|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: WzpbB0nb+YVinVgom6cRPIAgztAq0yt/pTZGJfEsalVxmgTc0SDMWgbp8ksS3w8ofZ39AJFuXx2gEHIM6VdCxv5oz15Q1nRDrXn1MHKLgHUlcvk6kjetPV3sDWUXVgrYF7qAreHB9ZXpWZAKRuQ+85S40qfwkKmUZbwonZ6S+nWXfK13HtbHaFLH6WlDkvjqeqTWw09sK+P58lHADvcVGVd/GUIL43KX9KG9g1U0BG0eF5d2EPZNESjm1URQ5zcpzNcjEU2/BJGMlJRK1++DvZG/4ex2Xq2GT8+/s0+EIUZbltdQGFxB+zo8hLOqIDiANHroxjuk0vg0BLndrYGPZM7Rcoe0ra2AEqSqjjO49KXq3R9urCbHKO/y/eN1jswOiSmNykGw8ht6yUXPXfI4XI1eeXXHmCr9nlxwkCra7YuTf5x1gIDPzDuCogAShsO0PeOhRrp3i/eGnVBPTtywNmvgv3OAT3CpSw10Gq8JWU2TdN0a6sB6IyKfLr+/gOshHXiXsfQqCOs6GxtQeGXrfJF89Xf8U819HY8+WwaJAbgAhdT8+8lUIkRQXoijEBtPORQcjsanqiJPa0fKv1C6hN6Fpd/QD29aRc7mmAZ9HBidLR3zofDcCQiG/bg+FxMLsKe0DecpOCkT/NB49qb+LzcTrWbrWl+ClgzLYhbW1C8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(14125299003)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TkuTh1ceSa6r/Cfy/+1XuA9Wl3RmPjdFm8Zb9dHMzccVN4xa046NKbLbqixP?=
 =?us-ascii?Q?Yvg3CrRih/OqnozSJCR2lTsrdxpeWbbya06SRz6YDAC/o3dkno60H6b9sdFC?=
 =?us-ascii?Q?3HCn88rfVqhvqRJBLfzYzfTqvU+xMDyOSFiz86WsmEaIzYawB2k0+tIV4WKV?=
 =?us-ascii?Q?SCWvw1h09tapkN1TXOc9oHqS8RWroUMauL+OtZJo9+8Llb7BdbbW8ykvilVM?=
 =?us-ascii?Q?+gyNypo/WHtDESVGbTSZltto+I2DMWvy1Nzb2ZApI5X9giVdj8wioiDE0xbo?=
 =?us-ascii?Q?iLyQ5jm4AqVkIuOHGi6DxmLxeI+riFQAz5TFv1I1wRuMQwltjbZmf2dUrOFc?=
 =?us-ascii?Q?T0EMDDRplbqNqa9ldQW008bD5tm6pQpDA7gsZAtlcpvi8AzH+VOPJDud2oCW?=
 =?us-ascii?Q?4egVaLEnr9OjM2bU/HETrGVBkkDXyulXEk/lEGH6feBcHuxl3RQQeNnfOPDy?=
 =?us-ascii?Q?S7gFCn1V+U/EZU2x1uPyJPbpKNPcfUnHtcU2jpH6lljJTFIUrPRSHxC/yjEe?=
 =?us-ascii?Q?+wq1Fi9e54mRq+O22DAVrVIC2HMIigYCFneInvIKjxb7sbr9ZKlHNNKwYJpn?=
 =?us-ascii?Q?NX5cCfYlE/dMS+M0opZ7Cb1C1ZMr3EmHODfvo8x+Nyz7vpraINu6/llMF/HJ?=
 =?us-ascii?Q?STuVHNqxyOWJAuDAAzPH+p5yDV/u/1Sbpzo3U5jAvNMi2BC6ciCKA4uoNy/t?=
 =?us-ascii?Q?eXTpWJ+S8dHLYVj68oZe+Rg/Ocpf3E1oVClZFzYlu7XralHWDqX3hVEsZQEi?=
 =?us-ascii?Q?9rw2SV//0wdE4E9N3wN9u7kfGGcn9PWDcAodYOsG/OoiDHU018vpansXh3Yw?=
 =?us-ascii?Q?9iEus+yX1pQsnwPlxtaxn1xZvevwil5s3ZXSzV6TJG1/5foaye9lic+dgnXi?=
 =?us-ascii?Q?dEWwCmwz+z1DlkYvpTrGyavRzzmphftbfzP/AeHwVmQkqV/VxEgmdhy3L3Wk?=
 =?us-ascii?Q?LhQ0PrPmWrj7brxvaeM28yyd7DdMVdTPH1FCw4lqgyTYOBZL9SoVl/zrjjTU?=
 =?us-ascii?Q?zBzKOKd9x+LPh1CbVzXLp+XQ2t6gwM/GOXt/vjm6nHBwvTInkLGxPL1xJhoW?=
 =?us-ascii?Q?HsD2ABpZjvT5i/Et7DArAdn2AJxoApPgqu8wcYTzayyKLlhS0qRprRFucO3x?=
 =?us-ascii?Q?L4SGAaeh6pbeZBruMsgT5c5byBF1vkDvfnCaJsW80zI7/dzqwuTptQWaatGl?=
 =?us-ascii?Q?RD6YGB4s91GSUzS4u8cNU4xQUxOJvwG4JAY8hNrP+G/X/dJ+JvLTh7p+znxh?=
 =?us-ascii?Q?6hyaFrDyYm75Kd8EFW8uDUfkYIlDn0UQpc/ZQnZYiYMdnA5UpG87mbS/KEpD?=
 =?us-ascii?Q?/5YVY8sVR9ZuBqqvIJSiOO0roGZvBSdGjh1HETEkHElPjlhppu6G1uCYOxfA?=
 =?us-ascii?Q?FLTOvk1kaIw6+BzY3bAGxIfB3ihfF5nSg45Dlob2SrLIgn0w3B3PLLbgoW0k?=
 =?us-ascii?Q?KC2x1tuRbUxMGZ0TR+mwSGTHCKL5gu4s+unDsLIjj9TheXYlaObem+870hHk?=
 =?us-ascii?Q?xwfVWnQgMmxJOFfnntyjtiwGakoS0CrejI0iZxsULmPtJtJ7iaNuw3aCENjj?=
 =?us-ascii?Q?IVntZda0RS1quuHS+jK0CL8+sEcWGviX3dCGhT49/yptgg2te9+2xEbtK9FE?=
 =?us-ascii?Q?t43Usx31uzMRu3mM3bwHQsUssgdCBFdFr/SJCDzobXQV9xJ/2VQTABUIzG47?=
 =?us-ascii?Q?Cu9TsVftw+vahA49AN9PKus0cQxUhXMWpTcnvucCPASncm15hUUl6U5YnPjE?=
 =?us-ascii?Q?zgG7tFTuOg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dde2997f-86c8-41e1-342b-08df3e6719d1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:04.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snqMyNU9dSv0/vp1CtddGi0W3OlRo60yG3N3uG/P8C5l/YtMJr6ihJHf7SP9Wo9DQ54aZIGMCVyXOgAyqPZ5Hzfh9nVJHLSlTtIKqvXVgW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249822

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 0.29
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 desktop-file-install
  - Add support for --add-keywords and --remove-keywords (fdo#78) (KlfJoat)=
.
  - Add --set-exec shortcut for setting the Exec key (JakobDev).

 desktop-file-validate
  - Require Exec key when DBusActivatable is unset (Ball=C3=B3 Gy=C3=B6rgy)=
.
  - Validate the Keywords key (KlfJoat).
  - Add Phosh to list of valid OnlyShowIn=3D environments (Sam Day).
  - Add new game categories (JakobDev).
  - Add HealthFitness category (JakobDev).

 update-desktop-database
  - Implement the intent cache from the intent-apps spec (Sebastian Wick).
  - Code cleanup and modernization (Sebastian Wick).

 misc
  - Manpage fixes (fdo#76, fdo#77) (KlfJoat).

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{desktop-file-utils_0.28.bb =3D> desktop-file-utils_0.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.28.b=
b =3D> desktop-file-utils_0.29.bb} (88%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.=
28.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb
similarity index 88%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.2=
8.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.=
bb
index 35537572fef..8e4138319a6 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
                     file://src/validator.c;beginline=3D4;endline=3D27;md5=
=3D281e1114ee6c486a1a0a4295986b9416"
=20
 SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar=
.xz"
-SRC_URI[sha256sum] =3D "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d82=
2df33594898a70"
+SRC_URI[sha256sum] =3D "661f225be4c667abc4962f075717db4252b63c84480f6d37b2=
6050d029da8fa0"
=20
 DEPENDS =3D "glib-2.0"
=20
