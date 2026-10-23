Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4916.1792754996519089873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tO8/t8zj;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeOk/ZaSLXFnOTuvOv5gpqM6qTy1oZefHWwgaePYFNwMSkqWY8S015ZOazgib6k2xK0FLaWSSGMKKzy+2hgMYZMtwKju9OXjVp+IYN+NuCADmisrcxClVJcn/Rrlg3LubNV/yGwiOPIywiyQl90Wfpd+nFuDhsPKQgQelwBiq/gBshsrUdyKZVjCtfgn5QTcKrAMm2zNM2I92ruL58Zm6LrM96icXT5IufJ83eHRNHxpl8UTcuZ7Roi1InHBRYHP/P5e9snP4dljJEqduXrgMvo8U+9nCgwzKM623uIqChpZ1QUV2EZu0fXXapBAtZtzc7mQ07zIMV1+TR2dPGRrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRFdQ+gcEIiRYoMZmt0PNffTaxDaQ0JPLwb/4ACokxo=;
 b=dAgPBdcs/qSi1s0a+Ok3TBT9ltRoW8zznqJeeNVTsTt5fxyHh2U3pRV1ZHKraRz4/Gjw+TJQ48FW+oJ1WO3Adxv2AXi64OHg5eobFesRpeqexyDd5Cg1lp6/P03ttQv5VQuPa8yhZqyygmu4cvhdwlOrzCJPuADrmN3FpQkeL4r87yAC2wsCHZ9UzYzOdAAh7ukIsE5llSmtU0a02lsocWfDR8+3rTl8lwbEEdCVa/ke/XWTKtb2hsaZhAKUnAXyvDH1i5mkDMKnhK1koYVe2BcEP1TTL6bGXqBZLpmJKsWyiMq+u5q4Yk9z/03v+VbUcDj81PCnx+M1fjmxNRedlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRFdQ+gcEIiRYoMZmt0PNffTaxDaQ0JPLwb/4ACokxo=;
 b=tO8/t8zjwMvOWJIGqXpgkbhWybLgQUqzBEt75KI64lRiCNJLxfJ+h3qRXqCsrbhk+ukb5sxH6tLx8Jtx2Ff0m2IjAe+K5u48T2Vl1WnM6kHAj3M0y2JvjvJNXUZegvF5oexuOgLkvmCkUysix8t8Yygp8HItJ7k/csHeJUch6nC+7q1RYs1PIXfOA379mMglUqnDtCOeO7oYjCPPgbIxgHJ6OQVnGa5B1IWvDvt8r2o83JOqJ1q7bs6JUuA2b2m8COygCsT7ZtyhotkqKFlx97tH9qYAvLYPLjEHI86kuv3D2w+PUnewiIOmj8EPj3H1pntbV+KTJc3seHGa1SosoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:29:57 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:29:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] harfbuzz: upgrade 14.6.0 -> 15.0.0
Date: Fri, 23 Oct 2026 13:29:47 +0200
Message-ID: <20261023112949.77631-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0222.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5359dc63-4569-4a10-1326-08df30f8f747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|10067099003|22082099003|18002099003|261021123027099003|261009223027099003|11063799006|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 0jS+fAhE2gADZpziI91eRQ2W7pBKVfoOLaiuix8B0dC19TI8o6aURwSJvC9E9JofF6/rbBGBAdHJQceurEYXVdWKJctfS739P++nzxoGZQhUMQHD/IkoS7ZdPHXSJxnH0GeJrqfbiyVuqMuBWZn85vTWaSzwqpi5Ybp7pncq98X3GyNgwwPnHw1b7fVAni9xY+vty5vtpJmExnZCkl11nFTTNaqD3aqXE4hg+dq6LEaYWomccvBFVJTnKeu0X73ONoI4RsvGFhOQV0QuFW6Xl6huRB2p/DM+73SfWy2cS2Hp0kVsm0zBtK7Ibx1nzWwRhw8iHuMkIFLMV2LGTsF47GnIk0j+ZlhmO0//8u0K1RClbeXzfqlrXoBqqJHWAMLDsdDtM9QWUuAwxm/CacsBEU6/nnR5qckGC2BCC/L3gZBljl/ZlL1bLeFo3LikilBt1kGB3shP+K6iut48yPyfB+Tqna6SEt3X+V+308C8ll0bVWng/+2pCscHTcwSaX7jf+1RqkD03w8phxBwkcgeQYiQcVRurfSr6E926KFNX41xqJSaMiv4RRXw7iOe7jmfD5gSVh2nBZcXyf4cxFoao+cnVtrmNv5Y2iWeWuyGH7BPIWMPp4O0TFiTlNd2m25mWFIemhB1tj6uVgH9Edt9asjiWGkYHvzAjc5Kwji0SOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(10067099003)(22082099003)(18002099003)(261021123027099003)(261009223027099003)(11063799006)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xdZ6ve5geChm0MRwzYRYwWk2ZUv69srjbbfPSfJ036v1Eh4pEz1RQEhGvI3W?=
 =?us-ascii?Q?ri0dRIO8UxxNvIlTsxxKbAenD3VI83BlLuPH55nSovaRncPzOkl2bm4fRK68?=
 =?us-ascii?Q?0eniGsy3OqTG9McZTdu4T4+hlAJzq/GJiZKWLQ8CagUOgrkKZgDXzhW8qHG/?=
 =?us-ascii?Q?1+KHHgfw2Gh2T50L4KQp8jmYXuIXv18Pr7cACI3HjXnkznci1VQ/hIh1xleX?=
 =?us-ascii?Q?NL2A98Lvodrm58I6xSMDWiPlVHZ9AE50kF5RWBWxxxWQhYK3kFVkCeyjbzs2?=
 =?us-ascii?Q?F20iN2Qet/S2D5SFl1zlO2Tm64/5wALdA0aVJZN2ToUDpHOnd3/1NIg0tf2i?=
 =?us-ascii?Q?o7oKqnq4zpqoUZvLwIhgUMEVbbM+vgJRwgKvh6sJy0lmowvwsqtmBOHpexFP?=
 =?us-ascii?Q?xkjwVk+QuT/MpUA2YFgBGsM9Vrq+zKxL6JtCVhFKC2cbgdRSUUOefowbPHzG?=
 =?us-ascii?Q?Df5C8xzOs3FaslFMYlqvGIggNX6SXjDk5/WKPg+Ofj08iINc5DZAhCLDCviV?=
 =?us-ascii?Q?Opb0y5D0eJgpnZ4GouGO5Mc0SAkNn+WC2pBkHX5SV8ou06wSXmI9VtxxE0Dc?=
 =?us-ascii?Q?6QkPHRBNAH/p62or3uXIOPaMCqD6d3pqsJRiueQXyrfNFCJx+UK+VVScqkhj?=
 =?us-ascii?Q?bPJHRatYdbqMoUJLQBFfhfztzK71oe7ylT0mKW5XCPg9b0BjX+zpl2lpPahX?=
 =?us-ascii?Q?nfuncnryyWMhvjwaHWMYSVLl7EBIvbJ//jqZbM/I+XloKje0ZkRlQQdguoaN?=
 =?us-ascii?Q?Zl724jzPOh0I0Dcf/ETOLz9fqjQI2jhmK4ykwe0mXNeiESa2H64olePPdDEv?=
 =?us-ascii?Q?rMp+I6XoWkLjyvprLfblAYnGy4SBJaZ9ikGpqrxvCu0CDYqQM9voPmodT5m/?=
 =?us-ascii?Q?+T+sl5sJgJlB5Hh0H4EownvREmfKmIcGLZCxtXjlqHP6pXP6GckuzmnGpOTZ?=
 =?us-ascii?Q?gnIM2nGUXfn3ZBUb+SYYdwizU1FXP9XFiCS1Ik1Q92SDQnahUBD7RBePLA11?=
 =?us-ascii?Q?HvYx/K6k1i6xKF2ORIVTTwHDRFZL0cdU2HrKPF+rZ1w+8BrO8e+TPW4vBpGL?=
 =?us-ascii?Q?v3kNO28wEgMlFh75W+IKoNSakr8CfoTsGSoIZnQzZl63tj/hOoIU+M974HOc?=
 =?us-ascii?Q?8BGD/R6v1SLQzqa2hL453R3JIb095DjLLyT/0mAgSmisO3KxbwmIYvyo5J9X?=
 =?us-ascii?Q?oHWGDLbrUxR6+Xg6+SGbe/3PV7a1S9bC7o19RxvWiseFPQ8SSD2pAVHd8tBx?=
 =?us-ascii?Q?HwVl7+0W4SGuIHMuOmD0R/+AYaIBRD7zCMakfD0PYXDLf6ATgojXOcuKpQsf?=
 =?us-ascii?Q?sz3PZ6Qd5WFmH+lfpNbDi/vL8DtzuYqKN4xw8rbYjSBrInwvyo6FRBGD6NYl?=
 =?us-ascii?Q?veX5iGcp2TJStosR9nsBER8yKp9/2Z0W78MXl4OizEmVfQQzbc/hWiV84v74?=
 =?us-ascii?Q?h21uwxZPwS24yd4ZXc/F2oolSxFDil+NDzzmeakzdW5narrnUXL5B6rKalW7?=
 =?us-ascii?Q?bt8xayHeFNCfajLq34zXna7/OjH+fAPmq0ThatRF0uumzOEM95af9YDNlsL9?=
 =?us-ascii?Q?j8CfgDREINOSPa+Sivmw5Gyes7GpTnR7jM0Z+onqyI5iwD3ay+IyTooYO+zL?=
 =?us-ascii?Q?IeZLJmwgQWKx5odSc5AxlmLkoTdGezYW81FSOYumNgtBCc3Nyaa0x00O7MaJ?=
 =?us-ascii?Q?tNVdFP8t4M1Jk90YVy5jQkfuMyqtt3A4X/087ikcBhsb77ZYQTfAlqhqnFBY?=
 =?us-ascii?Q?bf4plth7XQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5359dc63-4569-4a10-1326-08df30f8f747
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:29:56.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBel3lV+M8KJiQ1c1e1fsxNwe5bVAO+5UVZXioUvhA5a4q0+hxHMiZHcnziEOQhVQdWxfXcFwvwPt+DNG6qe0rANMts3hZ/HH/u6SRaX2Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248545
Content-Type: text/plain; charset="utf-8"

Overview of changes leading to 15.0.0
Thursday, October 22, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Support for the new tables and formats in the ISO Open Font Format (OFF) =
5th
  edition is now enabled by default:

- Deprecated API:
  -hb_font_set_face()

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../harfbuzz/{harfbuzz_14.6.0.bb =3D> harfbuzz_15.0.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.6.0.bb =3D> harfbuzz_15=
.0.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb b/meta/recip=
es-graphics/harfbuzz/harfbuzz_15.0.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
index 7ef0897a187..ec829e0a249 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a6=
7cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "d07a007327277708a2a73ae437887cdbaf282937f6d03ca546=
7723e9099af586"
+SRC_URI[sha256sum] =3D "968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec=
42d2a3be4a44df"
=20
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-r=
eleases
=20
