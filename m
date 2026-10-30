Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8717.1793357086430159205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PZe3KvhU;
 spf=pass (domain: est.tech, ip: 40.107.159.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vI/nlOZ/SRQFgWGj9wDhPGXL1+0z4UCou6YFzeScLSkquryacjclvkNKmFVHye8PHb6FJAP6e2z4QgCm3rOlo+O0RR3RL0ZlH5FDCthkVqA793RyKlEM2f9CbqELJVPicy1vd5jjDoOVZ848amkVi1twQQfGp9VJ3ui7ftu6J9WoXqAoqlrIgl6QegJVLCfdqpPPIEH2ZnHLmpAFmWlDlkigNWPZ7kVBUaZbszPgQ0/Uf8v0LsLfL5mDOHwejGrf0wV1n++7w1n5PXDr/BQXJaC3j3d62ehSUC6YFLYz+bJRyIwoSiCbVyHfMcDAkrV5J5YKbniktzCldJ+vMv/9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPaSBo2v1tStd1U+DbXD1La8YmtYXkIKI9seT4NuUwU=;
 b=JXbPkqMtAU+8c2xfuaOOGKlkxBoCJuwgHNEnv8/xq8+n0TQ/xG9pb8lFDxso8TcpQ6Al+fOvEcs0io8rlbTimJ8Yx4pNUvs1EjqVvtZosJBDUEvEfHIueKwMuuNPzqHSrV/N84msiFUUMFljB3Mj6gjwDr221i2UZDKe4eCaoTpZmPvIdEhRPacvDthgiAI/8Po0dgMo2lYKDgrh9+et9z6kNY7CP7+uIExMm7qbXrz20REIQmw6l004anFVYS85oa/dUYUY4thYpH7khBNSyppAO+NsmMP99BMIvnnwvvtNsKaKojlyKHdrFpHDnPQd4Bc67xzI2cpxVxcw8jgMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPaSBo2v1tStd1U+DbXD1La8YmtYXkIKI9seT4NuUwU=;
 b=PZe3KvhU4nUMrLJFDJfuLWCgM+/aIOtLjaKkF0Q/WmCs9yuaPhXckQADFZVgC6VKhKp1QHWP+Bg3wYTEMT3u4v1wwLlusHJJ1yXdltzeLw8F6YRqIVbH9Ktf1FiQ2NH/c8UK6aIxsh6PyrOXKFAa6Ul9ao0e+gQQxjqVhvojXVU2cmmerjHs8tA9z4mg7Vpc9Zz+Ijfw0oXDU4lz/z1kdyrKF8SHYS3QBI4z6+9LIZDLu+01t5g9boKAPw39w0WXrZeD3IiViHpupdF/VgWSTr5t90en8yAX+qSa6BfLd1/1K/ACp/LV82+UQWEjHdDfxJ9hyYxf/U54UNXKXAzFJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] epiphany: upgrade 51.1 -> 51.2
Date: Fri, 30 Oct 2026 11:44:34 +0100
Message-ID: <20261030104439.18901-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bb0748-fe29-4e8a-eaaf-08df3672d186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FjSlWGVzZaWCP/Jh0RCpBuxi2D6eXQPof4jPB49q/L07Hm3HaZ150n+vV9Aurps4w6qVZp6XHKhcQpLic8sujRQwnhqfhJv6Iadnu4a9XaDVIpVR/Z1QMVSythBllbEVjgCB9GCk+DDxuzNzsy4rVdptCw5B8aOLvsaeixQCjJX00FgyO/Nz0L4icw2mL2vNhTLZYu0O3dH+HBKm/KUeKOdAi+xYI9CctWIkRnXiUQC1jF19DbW0BBWasLNLwn2oUQlKZrOTt2Ih0dWGzJKC8zbuXArvu12Nv46LneAsMw1XClEs7cZ5OG4q+CPdZDZhjNORzOOEcoAw71TsQQkt2d6PbtsUxCT7AzwQ1+/oANjGQajz/GyO51o8NV5kARMVPm1cgCoi/UEgbcEEthrTfdeHUwaS2Rn1S0x/pSEZ1IUXf7LEOl7iIwmWe4DjQNJnEv9IjDjGSMB02ap+8ZwLfBhxJSnGy0MQpx04B/yZJDaLMMricizuJqilwnRlTEZ9eNmzazp1sf57airUHGM9cZIajwBzGzsMKJXwHRzq/lwE7NlFpqSjFYmvFby4GnTTwAqKIf4r3ESO7bn+W0LxFfuUc2x924OfJG6p7E0uKIyABxdlB9Ojt3ySVsS+dv+79RX2V2R/9CMoCPOkxKje6SSfXBd+Tlkyl+LsN1/m2aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2iuB/S+KHxarKLXL4oa0M2g16CPtscfHX+/GRhQtcQ+hOKAAti48hjGGo3Q?=
 =?us-ascii?Q?B/h07ijqLf4POrKXoeFhZuRyP3zzJsJWMbpupnMYMw6zu080LLYgoGDcqv5z?=
 =?us-ascii?Q?tercdnEPjMO9lYEDTB1xwVH7CAdLB+t++iL7jFUDR7OtxGecCvvDIzkunnUE?=
 =?us-ascii?Q?gcWlBbMQLJDlFUzupMOspv39R55vLVfF0FZLSqD2tk7bsaeGtQJdRr4lSpKy?=
 =?us-ascii?Q?eVcJNeDiwYofufUh+h1pndbV13PgaCuKS0lJ1IqpeVH7143UQLTpUzyGSP+B?=
 =?us-ascii?Q?Mfko7mmA2oeAbdujojiuIvC+CSJcUBSiSI9/sC20/zpxaxcq/N37kkrxMDIN?=
 =?us-ascii?Q?jwvOjM2qvbbkqR9d0Du9y52OK4pAafrrdHwCbKb1K/dCQ8cR+cw2mW6LoJTN?=
 =?us-ascii?Q?1C3O2wKFxm5KiBX64k58PCJuxq7yjZaubuFW6mwZCZ0toocwNSh+dD5vW0O3?=
 =?us-ascii?Q?xppVI9gxXUQrK0YCZ/r31S12uzLh2JeU6dGNqFwqsqf5MX9pOP/T7gTRZdf9?=
 =?us-ascii?Q?E+uvdBQGnIXNYp14iMF6ULBnDLktw4lRPJpPSJUP9BwlA+OQvbWp0NrE2619?=
 =?us-ascii?Q?JPeab+FQ5pSTsEgbik0yKtEFJhmwsqNMAjCfGn1O/HHXPVT2Ouf51WeMzhi+?=
 =?us-ascii?Q?fN/pcHpc2Srsnxk8w/7Kyagqm29iqNE4eW9zQ3TxIqhJFRfB6LPhOE30hgoz?=
 =?us-ascii?Q?eN7C1S5BnJwhJiCYKcIWvh4t45Uvfl7jTSx5q4XZSwvtbQMQY22hARLuZvs0?=
 =?us-ascii?Q?BYyqiWetVb7wsqMDNq2vvRavsTfO3HX9wPac3ZpU8j3LfRfE4tCaJSNbs66I?=
 =?us-ascii?Q?+coSBKGkYYd++XZeH1iNM85Q3m4FKUrwvBdeGWIvFStwuNjWodYHU2cDUeEC?=
 =?us-ascii?Q?7jTtQPAtkPFg2z0zwGYKAwwadOtxaq68nJ7PD9Uor+lPxPthU2fa5Wo7SLPe?=
 =?us-ascii?Q?2XPpEnLDueZ7++7cuh5eVHFu95HuuTwD4IkCujKlg5jJvtP3Pexym23yvX77?=
 =?us-ascii?Q?pADM0YwdzMbEj9wgk6TJDHjiXuQo++VPbcf8ZkegmreXV5l0h6V0VReFGOi+?=
 =?us-ascii?Q?Fxe01bL3Si0O3fsNUVt/aNYW9gSLe4qTNbus4ehqbGmI3IP1uO+1yxcH1n9L?=
 =?us-ascii?Q?XqnNG0mfnxL9a+gQQzQRoRJVpHIvMVealT4nZgmD7lOsOnUNn5k+nMrmXn0s?=
 =?us-ascii?Q?GwGBKWHHPLfq7o789UkHA193WXTuQqgZmHkveMQlWukNqzJP4NUVeD5LM1lh?=
 =?us-ascii?Q?/o7fIftaGKi4lpuC0CF3QsAE2I+VReFg/7yncJqe7EsG8NUnpC20EWoHdO76?=
 =?us-ascii?Q?gyBH+rWche4C5vu19tKQdQtdGrzefqS/ITGyJC+rLri2OczIz4xsKMf0ru30?=
 =?us-ascii?Q?43L5kXCr4g7eML+FZLyWbHPOLYZqQ62m9vS2r6Q1PjT2vGuzsxc41RaMoyfJ?=
 =?us-ascii?Q?tyDc4jucTBUOfb+VVRy6dyqBgTpc9rqw5DXy3zfqVdUeAbXGdVoCBlypKMma?=
 =?us-ascii?Q?5CYBdLqHG21H9PFlxLxtMOCPWZQMLeE0YWK3gvLXRoZDjFCKasoc2osoq5xY?=
 =?us-ascii?Q?CRDhB3WEjWJrwSi2ImovNSzwrnCIO14iC0bOAZdcd5+P26lQJrxUbU9A1/Rv?=
 =?us-ascii?Q?AX3Dskxi8B+o295LStiRrQHduSQo82mM2QrXlKPP8UhH/OnwAWVptBLs9o95?=
 =?us-ascii?Q?DYL4eunPH0+WM9nw5TKtqH1qa+PljtpzASeZXUn7ZdOh2xlVqWK6KFiBKh54?=
 =?us-ascii?Q?I9rdSZ5+Uw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bb0748-fe29-4e8a-eaaf-08df3672d186
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:48.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m/gGjIj5y+22QiNoHDviDWan4YpwOGhr2aOZ6wl6qiDDeGoEjC/MyUd2qAjIcDWEh2Mgg6Ke+A+5vrGSflrcZlG02OGW11Abmch7NSY9Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249021

NEWS: https://gitlab.gnome.org/GNOME/epiphany/-/blob/51.2/NEWS

51.2 - October 29, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #2961 WebApp Epiphany Argument Injection with data URI (Michael Catanza=
ro)
  - #2966 Crash when restoring first pinned tab (grewal)
  - #2969 Making a tag with an empty name and removing it crashes GNOME Web
    (Arak)
  - #2971 Unresponsive page dialog reappears even after page became respons=
ive
    again (Adri=C3=A1n P=C3=A9rez de Castro)
  - #2972 HTML injection in Epiphany Reader mode (Fernando Munoz)
  - #2976 (CVE-2026-118598) Allowing a Clipboard or Website-Data-Access pro=
mpt
    grants camera AND microphone access (John Cardullo)
  - #2978 (CVE-2026-115683) TLS/SSL Error Page Bypass
    window.webkit.messageHandlers.tlsErrorPage (Michael Catanzaro)
  - #2981 Epiphany installs XPI extensions even when the Web Extensions fea=
ture
    is disabled (Fernando Munoz)
  - #2988 (CVE-2026-118599) XPI extraction allows hard-link targets -  TAR =
.xpi
    overwrites an existing user file (Fernando Munoz)
  - #2989 Epiphany loads installed WebExtensions when the feature is disabl=
ed
    (Fernando Munoz)
  - !2202 Do not focus location entry when opening web URIs (John Cardullo)
  - !2230 reader: Escape reading time before inserting it into the page (Mi=
chael
    Catanzaro)

* Translation updates:
  - Chinese (Taiwan) (Cheng-Chia Tseng)
  - Greek, Modern (1453-) (Efstathios Iosifidis)
  - Maori (Aidan Tuhoro-Bell)
  - Norwegian Bokm=C3=A5l (Kjartan Maraas)

- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../epiphany/{epiphany_51.1.bb =3D> epiphany_51.2.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.1.bb =3D> epiphany_51.2.bb=
} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.1.bb b/meta/recipes-gn=
ome/epiphany/epiphany_51.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_51.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.2.bb
index cf1f69dfd29..317477bc897 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.2.bb
@@ -32,7 +32,7 @@ SRC_URI +=3D "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "beb93b3b86b763092a1175b6e505789b7613071c0d=
c1ad56cac1979fe879e9dd"
+SRC_URI[archive.sha256sum] =3D "e45d93483d62beeb26b36b39fe2f8cb5511ffe6ddc=
cc7fedff55b1e3cc0a5c30"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disabl=
e-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson=
.build-disable-the-use-of-yelp.patch
index b697b5f6400..480d0ac0c03 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
@@ -1,4 +1,4 @@
-From 20c45cb379ee910b89175019388df1a63b01c0d4 Mon Sep 17 00:00:00 2001
+From fe7d60b87a1d42f130047701d55bf4e20715e6dd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/rec=
ipes-gnome/epiphany/files/distributor.patch
index 28a961323a0..0d858fa6376 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 82196d415819d517d8cba2142600be279e499540 Mon Sep 17 00:00:00 2001
+From de382c002231a61cb140cdd3e29d6190c853e54f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
=20
 diff --git a/meson.build b/meson.build
-index 65324e5..2e70ef0 100644
+index 767a34b..d4dccf6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() =3D=3D 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipe=
s-gnome/epiphany/files/migrator.patch
index 491ff35ea28..22f8755e7ff 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 84c26f054ab3520d06febc2e8a99502d2cff98cf Mon Sep 17 00:00:00 2001
+From 3dd7ad6d9540b722716064740d055bd2eb4dce1f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
