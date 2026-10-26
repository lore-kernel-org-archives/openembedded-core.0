Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40415.1793012274423355116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qgHOF7mZ;
 spf=pass (domain: est.tech, ip: 52.101.84.12, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFeuEX3ybFDPp3YYunWkhnEOi6rYh1cCu5HlOtKuRwnPXvkQRqUc3/tI3KThZh1QjWBx5C3Jx62R4Smm642P33sx/orZ1Heoke8ClZsIQ4sOnneMT6SgVOyWz6B+MbZcTHpmT+aa+LwrKdZhcT72KTgZ8WXuo9CbdRJItBTivHV3yHzpKfkdMYP8lFQctkpW3OcUp7qt7v05zDH2pUewXJ9qxIbw5Hoi6toznMlLcSvWZQcx5cLPhbHIuxRauraaA2LePm28Gr9cL+1rNXgUM6zAu2URhA+ZsGJA76SVZGiPStxCTYLBbx/ihZ947hQaKvQDb/u85xOZM9EbnaFFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=142KhEiFrGyMVJdvPK7tKfQbpKYab7BFPfLqjm1ybCA=;
 b=YTn52WyklkJYvEXyImgcq2pCzBMZ2o01rf1TLaeF3OPPOt6UUdHUnZSn5JNaRin+MRpenfEuEil1unbFZYKl8VeN9StEDuNbLnYfoOQaTwsnlbva3OtEOzBl6ZRHpriObfC/KtMaftHe2qURN0i04Qw1dxZRmsKDXvL5X0Qw9Jcog34m3HriWhpFKqLAbuvCNdG1uMBCponFD225NWQV0jp+K8KyVXXL/y/hf0IH0iziZF6XlBQ5zdjnhUsL6o6BCScSNgOeFa1PTTeGCXIB5Vn9cv3kSIXP7Gw8dZEhbO4pBYyc8Sd2EBvz+3rSxD8E3zAcUjWNIA3xJItcA9TqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=142KhEiFrGyMVJdvPK7tKfQbpKYab7BFPfLqjm1ybCA=;
 b=qgHOF7mZeHDKzwlqpe8DvlPHYLprwAxZByp1iPts2fkGGzUpNuSde3wdOSca6plKuPtgC4TIp/ITTOTy8L6hI4vYgjv7XQ6Hph0OnQLBV+ftqwhf2cUT5ew6+Umbtg8ExGi+l7WGE+uLfb8KvF5WtL7tDcdNYiuT3nNVO9cFVFbrF8AcIw+M1MK72FrgTR+rmfojiwappn5+MTfb80b59jtxcgQk1gz4PugV+T/SEPnGe9fUzPesS0oJCNsPPX1QEYQMytEAWz7Y6TYApddmJsO+/OD017Y2DWVqq28AHP5PIn/aIsR2wvOWObxRQv7XAh4OeYAEosjnbkG7cHv1CA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3174.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Mon, 26 Oct
 2026 10:57:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:57:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-pycryptodome: upgrade 3.24.1 -> 4.2.0
Date: Mon, 26 Oct 2026 11:57:45 +0100
Message-ID: <20261026105745.3438-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-11-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-11-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3174:EE_
X-MS-Office365-Filtering-Correlation-Id: b3aaba1c-d121-4b6c-9539-08df334ff841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261021123027099003|261022105027099003|261009223027099003|261022075727099003|56012099006|11063799006|10067099003|18002099003|6133799003|261021121427099003|22082099003;
X-Microsoft-Antispam-Message-Info: VXMmCeDGe6b6ShSvXEjmKkVMkxZmOp8igBy6pe17ySKVXs/8WUS3DBHjXJgsHFXI0QrBo0aTokom8AmppXGQ2rVC8qInptJUSPbDSbfS/isHciPjYY074557I2jFW8BD1bOXzerMnBnJ/9UCkNxw756FUzcWeqOyQ5/4mb7qnQXnsJCf4PcFGVvYGUn5CWqnPJVwR2soI4iPDwor3LJ4zwOl+qVn6D9RKT+BOAXOtcjZ+C0rfj2yxpCLk4PmIQC+k2d6/Iqs7oPHi20h93/L2PZHgVx9KYK/Z1HetFmFyxrGQecrkAab1VQhaDnN+GIFAAcKwF5JJqErsRZNxnGqe/VfMqM0ykY+Jy7ZRRWZgmUxePqY3ESkXc8OOrVLGh11oFGkjpWgpj3lpTVPa5BxUwL7gfwA/cFvgN/DUHqknsqs5vr1h2RI4zkTxNk7evKD1syVYZKhN9AI+vfDzktcfGW9umJSqZmyqfm1oJUlUbIYBwnl3zQp9sKbCxZV4tl+QhUBwAfM1JpLdJkV3TeRNLTRcpGdWgP5miBo+lF4cc8rKQpztoHT87Fkcm3eGLRr6rsKAcw6ayRq1JKIOuA0S+8S3BRAI71yZRbxZDkRPug=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021123027099003)(261022105027099003)(261009223027099003)(261022075727099003)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003)(261021121427099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Uvla0v+uhxC1jjuhkUEDyBfoqhCRbSow7KnZqGPN6gXsNJsLbOJ4YxNT6Rr?=
 =?us-ascii?Q?Sr1XtbbM8yOizuvw21qnjjUTneXeD17kawSMQjye7ETBoNQbMPAX/DCppHGr?=
 =?us-ascii?Q?LXERCstFTZel7z7jzPyAJDeprWGSmWExLa8ZgTqlagc4Vp0WZMii2nGvccWr?=
 =?us-ascii?Q?4zop8IPc+8OlekQueO0p+pidOcE8SLQkVsMc6HG3Ax8lifrHsbCVDQrGBNeP?=
 =?us-ascii?Q?nLlJc6o7PPqjiwqd1EiOo2dlS9M5Vr15YV4j8yzKs9Cw75K+r9e5f3OboV+b?=
 =?us-ascii?Q?cQwYG1WP03WAhn6lhTP3PvmU9rBgC9XYH9zr79pU3sQKlwfCkHrXKe/RYiPh?=
 =?us-ascii?Q?WoPyekX8kGk9QA7HjaAsBMpQ44BaGjSmJu7iLHYTTZ8Otsa6mxrIXt6juaEk?=
 =?us-ascii?Q?GZPrZsICv2k953VQK1hlnCLVC6b4hdtyelJ1+ePwfUpYe90VRBWzPdRQsg82?=
 =?us-ascii?Q?+NdlErSqRjjBcsXMJXByzG+tBz+4auCUJtXjVnKMiXGxqqdp5j57X696Itd6?=
 =?us-ascii?Q?UaTEtvtAa4OD9RC2gJFZyZJ53V/e6kQ8BLxMR4qk+AtLrdp2IHxuxGIzP3sE?=
 =?us-ascii?Q?erpRX0kczbumWNA7RuOStkXoo1N34+lkUFTP79dCUuGCJkrazklbAmmdYNpW?=
 =?us-ascii?Q?5RnqgUSk1JCsRLUZG3B2hJD1f5SLO35JDE8MCnCTXe3/nuzWSV3bmNu2I+zv?=
 =?us-ascii?Q?JlcmY6xUNVW4XU7KFKxWTsVZYiiazdDSEGGlz+9NA6NFBFGfEQAFlKY8PWRE?=
 =?us-ascii?Q?4J8/ee2JiQf7hL2Nrkcl9kGDt6CVKB/xIbpxCA0TfJ73k+PMrlTcWLRNgvus?=
 =?us-ascii?Q?WJTyn8r7Y2FRgNXwa/oGugui9WDngcqcAN81u2Qm9M2xAornXzEAnHphoJth?=
 =?us-ascii?Q?SBUTwxYurbM86K/kXrOKSU6hCHDF7hMyOzGmLD0NZmGwQT05xP8Qlb+RPh72?=
 =?us-ascii?Q?Sw+8JtOQmDedQlHCXF/6oDpf8hOxGZ/q6CWG4gBQpDz+czYUv5ov6lFHRRVG?=
 =?us-ascii?Q?xUaHEdk0UOIrM7ItY3+jzdgI+MaqSszbSA/t38jNSZmQDTBzWZrmAyGSpbar?=
 =?us-ascii?Q?HjQA5vO5Wv2D91YvSpLDMew/1DQx5RpkJvo72VQcWdolYbiIPPl8mNNzxVDF?=
 =?us-ascii?Q?mmWxUPOn088zoSamT3pbVHn2+X6pOC7SM0ErsTeBI8MlnyE/tFEBkAqcgbjs?=
 =?us-ascii?Q?lQx7kayv3xOcXXPbSZWQL556sRq33wjh9CGuPTKR4guui+GtgLIN+ysO4y7E?=
 =?us-ascii?Q?Ae6/b/9wlH4FMKS+vwPwxV2EdngSx7KX7/h0ICD6j9C2hhnXFXCcsARpktX9?=
 =?us-ascii?Q?q/Ic3L/7ANS6ppXvFN93mRO5r1/DASedHRo5lV+nlSt1zG3xp8dgYxAr9An0?=
 =?us-ascii?Q?7qjL5KngKVyy+GXS5DpqzQ4BOxxMgqn2WESB9SY++Oyh6lLxtHEGfTgDd3Hb?=
 =?us-ascii?Q?axckOV5zp90O3t8AdMrj91Qzdk95L487KMC7Bj4hBcXQtKLktR++a8/QoQ8w?=
 =?us-ascii?Q?ZYThOP8XN9rVJ0evNWst03p67WanPOL2KFZPA0GrzJAqtyg/jt2jr729X9+G?=
 =?us-ascii?Q?ZacvmPnoxfPRKIZNM6IZRdbCV5c9piSW8OmuBxCOgC14cbQLP95TkNkVpU3E?=
 =?us-ascii?Q?Sf/bEU1RWF4nf3Y9dQzULtfiBDpFPzsl+/jpTdjGUbBjaV8XSgxc9NuIrjXW?=
 =?us-ascii?Q?Jtzc8G1rX2ExPdybgXdN6VxCjfPzcU8zsOQa427ra8l6rSFSIbNy0PKrbW/U?=
 =?us-ascii?Q?msU4gmoyqw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b3aaba1c-d121-4b6c-9539-08df334ff841
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:57:47.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+MK3hYLt2WggZvdj3WwDEShY2zmEIe9XPsewJCI+t2B4U8Txu2l5M3fdiURIYv7hsw4NOFfuvaGkpLZbdo8hUDAuszx+fbcbOHJmQZCy90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248673
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://www.pycryptodome.org/src/changelog#october-2026
           https://github.com/Legrandin/pycryptodome/blob/v4.2.0/Changelog.=
rst#420-24-october-2026

License-Update: Update to license text [1], [2] and [3]

[1] https://github.com/Legrandin/pycryptodome/commit/65aa57f08db0afb1a3d388=
7164a0027654b55931
[2] https://github.com/Legrandin/pycryptodome/commit/43b28d7170ccebfc51c914=
8e723aa881fb32a1dc
[3] https://github.com/Legrandin/pycryptodome/commit/04a1ad1d286eb843ac62ab=
fc05ed58df99eaf27b

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
 - Fix patch Author from AUH

 meta/recipes-devtools/python/python-pycryptodome.inc            | 2 +-
 ...on3-pycryptodome_3.24.1.bb =3D> python3-pycryptodome_4.2.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.24.1.bb =3D> p=
ython3-pycryptodome_4.2.0.bb} (56%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/re=
cipes-devtools/python/python-pycryptodome.inc
index a0181874cd2..8f2b9025ddb 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "PyCryptodome is a self-contained Python pa=
ckage of low-level\
  cryptographic primitives."
 HOMEPAGE =3D "http://www.pycryptodome.org"
 LICENSE =3D "BSD-2-Clause AND Unlicense"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D29242a70410a4eeff488a28164e=
7ab93"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Da514b4a7ad24677ae50f3becb03=
404e3"
=20
 inherit pypi
=20
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb b/=
meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
index 0aa53559d67..13c572b7c89 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.2.0.bb
@@ -1,6 +1,6 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed1=
7b7fd7dca32bb3"
+SRC_URI[sha256sum] =3D "21d7fdba239d6ef863d3d08388801c683453a3bb4897c2b27f=
27847aad89bdf7"
=20
 CVE_PRODUCT =3D "pycryptodome:pycryptodome"
