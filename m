Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6122.1794231660299882387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vGinO6AG;
 spf=pass (domain: est.tech, ip: 52.101.69.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtVzkXeBQdtk2cwsavU24LWTdhVhxDT6U/M677ILH31TGgWSK0OY0zmLzT22ZCf98VAa6cHxCqfk7wP08shPs2IjEU6lHw0w2QsDZFinf7heV8g81E32Oy0LpafUuJdRUZQ7BvhyD0bzCknJe5w0sT/bTkqIo9zcpWccszdeQvOOex6auPIEKJJoIzx2ubtoaTEp1fQ/FxwEgz0XwmNIx2S+/PsBg6tV7laF/Pl8PzDMMLVa4sC5laZ9ziK72vZXg6R68X3FAM6tsLZ/kJzoYy7ga0CdmQylERMn28bLAt3Cp6uk8axtyRI+gyBZSNFJ3CoqpqQA1lUzdiCA/EppzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dl6f5lsR7baa9VKYkOur3etSqZKOAEmcTxO6bIrHNw=;
 b=Q5PXCOqbCOmP5m18BU9/p627uazC5XM5NhGRlHIYTXk7eEoBf/xnOsSfuBLS4WxZ/1dT+VRrvg+3VsmACkzOqHwEEY5sCsoIgL0HQYYg19fqJOcnEfpf0/5B7hQKzsYnNDjKbMd0s13Hh9oJuUWhb7JMm72r8IAtfYOxh7y5XehDEmRjoTuOf+K36GnrH0BWU1jrMJl1BHBSHVHVMQXtM2ws+3Ocg3hLXfaEshfMoJgFhPPqQIuLMBjb6idJeh7EXlm/IF69SMdRyiBxWU0h8+goKCjsSvQh8oszsv1uSpaQohxV0KnMMpi+Iw/U41Q/hcLsg8QrXgEpv2VbSUfGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dl6f5lsR7baa9VKYkOur3etSqZKOAEmcTxO6bIrHNw=;
 b=vGinO6AG/B6jWpuxDXoyKHclOeTISXyi4kYdTrD8sbhy32AE3xTHgqwFv2nhlBEhxZ56uBWTfNJJbtg3U3fbcBs98w2AYphw8zima9ZFX15slXMvFYZZxcEheKOIVmcEec8YleOP5sZQPNhM17PdZ3yQioXneefHlZkb4GJ3FXqD03PCuE5p+zt3HZAcV4uSv/cRNWMxYZOhnVfOykn9NA8caMmzWLlFQS8TLYyoCnEODAbg5yYA123OsbtDiApn/oXbyONrKqfwQFyIkZhsLkwFIUejEv8HycmOytAzgMrmF0ZhLFQN0f7G5bt1Z96e5OU6fFjcH85t6uowcYrB6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/21] gstreamer1.0-rtsp-server: Upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:27 +0100
Message-ID: <20261109134034.74458-15-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc48447-3712-46f2-3c43-08df3e6716e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ECdqjknxr9EYn/sZu247d7qxS2/BD+dEZ28Wxv/2Tikp3+nrdf9t3rFU2kcZEhzrGRnKNDGraxXNjRvNmCUL+NTZOr3RaN+aEC/CZjbKLgjczITn0LZ8/qWe+7C5CgJw6msVDYWJwk5nDFNk7PN/lAWa+KnyboQiugHbLQgllUohi7mjEwBFdKsT56dWIOVL58TpE2ZZaKlyBoXbvxn6lO1L36SdrBJhBWyq65xojJAA4pqX/JeHFG5/hmhHptehuinJLyEXJ9i83ktBMtyo7pK4VMhQhay+t11bhU/VUFLhcW8fcwG+52ajkrms9DesKKY2KheogxctY3D+rzq1FepVVup1+6JGfpkghXjhrGjD3sMFl2LdKYsEZBsEMXC/YoDdt53GhXRQTBF0O202EDHG4WP/zHjViWbl+ieBIPNZP4CB9KsGb5KtHqxji87axLRptNKG9qrw43iNSqpTxuwgezBKC8K09bIt4vdWpIzO0gjZpX0Ejr0GIqFT3yOlm83ezYJGtK/WGiDQtW1e6SDfJ0OeriVawJe2+uH3/jcbAbslDrUyUGImcpHrsP7Cp7nCrXkwhTvz3JkdJYJjD3eW/owBnYjOHgbTpucJ8CE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wIPKD9zpmmUvlhTMnLz3GwwXuW/0M/Lqk6v/AchB9brKyX47ETjQ4lPZy5mo?=
 =?us-ascii?Q?efhncWiG9mDKgi5fo76YTli9kRVlZRGSKi+raZQVXFiAp5tO12l/MWL7QTsQ?=
 =?us-ascii?Q?4jWeeTl8pdSYKjPsM1C3m4txG5gRTa0OHJIhvGiZkQVjqHCfVQeYwbMtAH9Y?=
 =?us-ascii?Q?CGHCrKOwbb8qDn7n5USSQkAhCNEDVQOD6AAF/uN1rrvxsEtAELNbIRq40cty?=
 =?us-ascii?Q?5hh+W37StDssG/zsEwsKaflU0DCnOEvbz0z/6hsjaNmSlyUzeN8n1jXkYzBG?=
 =?us-ascii?Q?vb34GDv9Ip8OO9NvTRTwWglL9f8WLiv83kIi6/p9zpKb7wlsWgXFm7SF+jrw?=
 =?us-ascii?Q?BvoaYKwlkrBAoatz0ISk9rH9606a3tHjREatT5Fc/9SpGf/xetg2oLg4ZErS?=
 =?us-ascii?Q?Gs6N1cDaV33cuJGnS/GfUMIQfffhcdguvycASkgs1N8szaJ8T43Dn8Vt5x7z?=
 =?us-ascii?Q?IGe91fTgRYdU5p10ZCxJeIzTIMaOQspToPYQ6TBkHz1G1HbLSA/Z/v9OWUj2?=
 =?us-ascii?Q?QC2amMTcol5abdXsEyedbt826fwbnHNGR14VxnMaAzp0naiaLtw/k5vAyrxW?=
 =?us-ascii?Q?0mG5+xN7L1nfKxXOeDLGYdlug9xF199WiFwQEuTiYThN/vIfIXUz7E6F0PHa?=
 =?us-ascii?Q?4aC/MYNzz3Zfg9IIeTn6kMZX5e6veAbtKMwKwxD2JZnXTDxUh3fpaVCoXrV7?=
 =?us-ascii?Q?b17eAjsJFyDBTU9gM9mLcgzcpxH6P/GWwoDPP+I7Y3i7v+wAloR9UGfnJXED?=
 =?us-ascii?Q?oHdgxnINxFzkchnBugnr9m0gqRoYAozRGqHwdg1quN03JG/+WDAd+xRBf0iR?=
 =?us-ascii?Q?i0yvkNJ/YpMqHbwdbyWNIoABL1+ejFfALJV4aUSznPjqASGu4G38BO432KHR?=
 =?us-ascii?Q?YagfTCipw1yHG2pgoFrGsGtgH19OKhSrlDG0iUJutaQQHGfEyJVGxrOVlC+4?=
 =?us-ascii?Q?ZFwa7KHrzRmBuFMNKRKycAnT+hSB7RDZpoUgpjNDYVpx+nn0U/qdtcVk2GZZ?=
 =?us-ascii?Q?zxkY9cwI8g2i58XAHD5jVgK1NbXeYWEzDF5+Keoh10BhJGz7IMDWLLgsLDJ7?=
 =?us-ascii?Q?lK5NExxQmSlJdf5cChsuwfUPDxgrSZwJ5amZYQ/unvlJu4EsyNJ4ztGnaYrp?=
 =?us-ascii?Q?8I5zlRFqEcoGBnjerkId/OhotF0QGFa+IWdXAEa19S/j1oB6B1CPPOfP5JIu?=
 =?us-ascii?Q?LrOmEdt44pNNB0JAntIZiL8gEh2sEcHqGwPIJUEjQmITE0jqOiR5mWoUt+2r?=
 =?us-ascii?Q?u4qdkcqcxTchcGLDFarm+4j80fqs4wjU25BLmuSxba2fCzXgFGe1UNZ46DO4?=
 =?us-ascii?Q?vS2Q5x3yJI287wttOAPZf0PzNzd0xhNLgZrKPaDFrSlepzE8aaHofY+ljLyj?=
 =?us-ascii?Q?VjXClLEoe2+Oj9dvVe4yx7dKIrK2oBz46TCM2BraoyR8oqnjGTHrFUDk85/K?=
 =?us-ascii?Q?i1q+qAG469UA+CFK9gAlcXpalsCzPa6OXJddo0enqN6VEA/Jl08I1AUpHP9T?=
 =?us-ascii?Q?KlP0OrsT1jjNQuUGVtKM9oOp53p8DrlSjd9JwvXcFafGsYzzMxXpsXijbTre?=
 =?us-ascii?Q?V/wy39Ssg9AKn/U44Tqcbe7j8ORHFiul/eRqw1uXfGtdWMj/g7yIE65I1LEk?=
 =?us-ascii?Q?vQLP4sBP1lvJIn1iwDn4enC45RlsM8OpfL/+E5Q29OiqW5RlJXEaZQ/1Kg72?=
 =?us-ascii?Q?n7lqJTPOBwPIDh/LWTNcBLU9cBPGKxvaYcv/ZXhpshgWrNjFzdPMVRrsPVGH?=
 =?us-ascii?Q?0tmlUfOgFw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc48447-3712-46f2-3c43-08df3e6716e7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:59.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4QIVLqK7qcl8TkSjT6Oywj6zXVbN1CYqDkVWvRwsiTH6bLAsZ9YgonXHo+w2f3eOPVxPc7O1+/yJomoCRLpII1LzpyF4F32Gn3EnqTbZtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249819
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...rtsp-server_1.28.8.bb =3D> gstreamer1.0-rtsp-server_1.28.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.8.=
bb =3D> gstreamer1.0-rtsp-server_1.28.9.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2=
8.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.=
bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28=
.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9=
.bb
index 36c3f2f9a80..b9db97451dd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.9.bb
@@ -10,7 +10,7 @@ PNREAL =3D "gst-rtsp-server"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "59181ed21a5bc0533fb4f77cb7bc6005d89365e834b0c1294a=
fb9ab5f7d96fe0"
+SRC_URI[sha256sum] =3D "b87ed564d857a226a3135bd2c42eae7b40eb64031cb9cbce12=
4722af92cc8b9d"
=20
 S =3D "${UNPACKDIR}/${PNREAL}-${PV}"
=20
