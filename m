Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14290.1795701412551658694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Z79zgq2k;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqV1eF6ialOQ+jeYd4kK0R4Czt7IwPJe0nnXjP1EAZSZ7i7VyLraTUInmo5ucnvY5uVSuhZFFot0rc1VJN7/QF2D4cbsb8meyzI6IvplRn44Hit/LMSK+LXgj+F/Cgp2xbgJcYRVDs+Vhg872bOIRD7DSX5eSQzgBz8r1RIm9V0K63Mw/GtOKherpinNR6F7JJ40IIALhZbsnOND/aHu2ZYRFBRbdXKyBE8actQGzWwithfv2KxsNqhtL3MlrPDUsEYTydnzMbcTCn5y0rdDf/J2NLmskCMxY54AY35S3Fp5BuXGo7nO/CQDgMXstj+2u/e0Ggb6RoOWzvgPHF31NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtzGjetSbXIj2nX6WcaYyus95I1Za6/TPwRv1WAcwyk=;
 b=NLxuvkYCBoXBYO/bKt0LUhvH8n4QxaHnR0cxo29wHQpq96cZ8iXf6AOEinplMm2eHxukJYLhgCzHzXywkqpX2vrwNIFW6zHPng9882yMYuTSubwjZop3V0wejLK8U+jpsVkXNZB2Vfl5EATkX8NRMesfm7ioi9aQ8kIhjRVP0uUPbctskAK1mH8aYly3dGehEZ9QnR4BXV9juqeD02VF6SpOBpehiWWoYrovLMBZOgwGMkC4KXWEAi+ooIruCbJxRfHQdfV+J5NPydP+1lG7biWtQnu1coEqZKCaYMHFDq3Yqxf1pElpq77BhThOlk1WbIkk4ECJ4Me/gm5DdOW91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtzGjetSbXIj2nX6WcaYyus95I1Za6/TPwRv1WAcwyk=;
 b=Z79zgq2krs+5bWjfgsmz4VoSuZIFhvgORfVvd8jm4fzYS/Yk8F2PeRnB6cX43xEbmAE/xoPPw2jIMBNF/YQnvG/rKYT73WUJABdeHH82HdNMdkjnWrwRY9ZRaaNly2+LtXuhITvkPHvlFQGw3iv1qvXzVM5M37V7zYGEUsp8frJLO5hEba3CrDZEqirzXr8A1+2zGCII0/ji4rDBZoXja5MQZkP2FbSoYyHbHfYkrHQaB1tooBdojbzz5HzY3CShRUoaEfnHEMhRahl9AV4V9XssoOxU2zdi/c8OZUc0CcYL+sQvrSB45fG8pv3TfSjaiPvxwLzBKlumZyOdRlumsg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB1107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:56:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:56:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] glib-2.0, glib-2.0-initial: Upgrade 2.90.1 -> 2.90.2
Date: Thu, 26 Nov 2026 14:56:46 +0100
Message-ID: <20261126135646.90796-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
References: <20261126135646.90796-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB1107:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ea6630-4f80-4405-98b8-08df4bc5201b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|260925021911599003|260925022911599003|260925021311599003|56012099006|261021121427099003|261021123027099003|261021135927099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261009221227099003|261009220027099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ctCI3mVW9ayuCiVguMNd29lG07p6jbrI3ZAwVJ0CQkuClO12yqsbsJ4UVVzlj4UyXmiFA8areKXrRR6tdMBLvDx5S29WgvpMG/DPZn2NPMrZs6fmK3uSy+kkmfjpiqHMoU7DSwRZSr20Zt1jcfLlVpuGAqOkXu0UV6/mVTzBWqrIhdiKQmCeUC4+dYDXRy9VCvpqaZ6Efd/nO/A78+6JKXM0tzPUh3SZsGNX4/Ec8tZYVkFa88RHizdd8BHzuPwJAjemWeaerkZCSx62T0J0NHMbUuZKOr90JJnoJutHIkGhJ7FF91a30TcwwX59ZylQE9tGH+Kt/P0flqX5TN92DRNHZVhe/PVeAoiYWlK3mv+Ij7CNRh5ecl7IndWVFpWPmvHymfUSCY6vS5kpYZN9xaZtV0q4CXlwRr81ziuaj1Ehlox3RogHh4TpI4Oo6fIkOBkSHytLGhAkBNpiGxuBPCxwHNlOitcT9DQI+t+He3za/Q8PZ9jqGGi150PxWusu2rFjvczoQrP344/hDGIuAXZU8kSukIwpRau1btYzXrukQb8xuejteaBDFrn9C7K3OOVZZELVOEEfp6OOJ9J29sb18gDm4cGd7gV63atRLwi8Zvs2Bt+43Ac+Zb2+C0dc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261021121427099003)(261021123027099003)(261021135927099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvFOLXu307tQr5a50A9zbOxac9nufKTBoPMjzBfGY6ZfQiKxQussLSY9l9UX?=
 =?us-ascii?Q?wfZWxn/xQqe9o8sTDlOPpvkvfC/bTQPjnIRmEmyn5fHX0KSHUKF4okjJAHFs?=
 =?us-ascii?Q?7+273yDDsH0yaeL9zIjVH1D5QBPm4DgoUi7yNo7BsKPpmAz9pnTCbIdlFRVf?=
 =?us-ascii?Q?cN3w2vL7nJx0l+TF7BXlaLQ3gyWqYITt3Wt/iOcVBxmiH+oosSYXGs+HN5JF?=
 =?us-ascii?Q?BNw80s9gQG18NLH2Z+u5/6SN851FCv2fgv+iKB9spzGP5RqN8xO6xA/fIe0N?=
 =?us-ascii?Q?3gHR3W5gayb9YVwz8mpev1jV5DRnzm0CLcarJ+oSkKZ3RfDN4tzbWW8GBJHO?=
 =?us-ascii?Q?fCyTPnaRWTOLUs5W1WcJXzQAhSiOnUrTTUO8JBo7gGAOtYnOctdv8TkbGjda?=
 =?us-ascii?Q?9+ZcoO5jlmO0AVcvl0I84L5Z+DfEGEsHrIl5VoEr4jOZXqgLkOHDeter11Ri?=
 =?us-ascii?Q?meJTbombyrElF/V0TjmbPozGj5MScYYUFcCqisDqvrwd8K0jKTSedM301Mh1?=
 =?us-ascii?Q?4VBpYPOffmm4xlBId5H5cfw0UhTYjawUtj4q+Vy13nUJ+A+cBwy3q8R3P8gH?=
 =?us-ascii?Q?dEabRVoqRuHSgwIFYrvzPCYqX8tO2QopDwwmHr6aK1SHboGcl9tSVAZJVB2E?=
 =?us-ascii?Q?vtPYi/IrbmtBcjinqV0yVWRTtXz0xK9BU4BGFgl5OkaqlCbfj2yRiO3sFwIg?=
 =?us-ascii?Q?Ibx2ZtWnLv+wesMAXQ4OGLDBe+F+TwOmQcWDV/Jml+WICeuvh63bB8eLacI+?=
 =?us-ascii?Q?SN87M6uHnNkCeeHgwxGvZOvQdjEOPsZF7q/UIU1yZeT2C2J0FJOoiWV0KwdV?=
 =?us-ascii?Q?foiLYeWPd5ci+lc1QHzPKMUYbn43PxZHE4eDi1FpKSPrUdGzaMM+QEdl9YLD?=
 =?us-ascii?Q?17d5rx0az5kBQ47uPuQTjXx3u326qohTdek2eEIM1KABWOuMjyuaJ/sv97Kx?=
 =?us-ascii?Q?7sytO6i+ZLwjGIDQohbb72lVnkxTDLNonIGrPLkKKEdzf9WSDDWc6rRSWFDp?=
 =?us-ascii?Q?ndejlOvxFY/HI+0u/UVKA1NMmiNv4DSRUoNVr7je+ppPyOaOYzEgdq0SiTY4?=
 =?us-ascii?Q?qp3BNCNBxBxGMVvwKQS7pyAet8c2x6Sv6If+LcU9mm1a1My4ycArtn9Ju1TJ?=
 =?us-ascii?Q?d2H85IGO1lBiZJimHgOGle4oRVuTIO07djZfNqOsP8G4WXD4VJpUWgcQzkOD?=
 =?us-ascii?Q?dUsaN4ziDyr8+MGsye1/g1tKuOLHrjgWyhfxU24krV6aWUxnpEJlRtGU/yPI?=
 =?us-ascii?Q?Z3eb2gDFdqFKxLp8nFoKh6jgu75QVyxsoOz5aE+GlDbhWsw6iZZJmtE6HdVO?=
 =?us-ascii?Q?KlpO8iyJiYZ0K7v1pYrXXpwLEewyE/dnz3+ihZ/+uOjubztK0XsEpGoYbi7y?=
 =?us-ascii?Q?+YOtMUhS1WAiHQdoF9XDy34V03s5YxbxTmFjp+FA7+pAJaDr6d9x8tmnYRHD?=
 =?us-ascii?Q?xAXHmc23qH9Xpw0oiX7D4oUwZ+8hC4yyKBLE4zSnpWRBeDpq6wgVAla8iqLL?=
 =?us-ascii?Q?jQR4mgWMHUdn4Ci/wYWSsXgoqD2RSJFikg30DBfGOowYti48XEQGp/WlHvvM?=
 =?us-ascii?Q?PkWP4dgJopJ1Q5ZYtUBHzAxr52JvqzHpUFiq0SMzB0NEoLnfkAIm7vCifkK+?=
 =?us-ascii?Q?VBuoQuCb084YLbiUbLTmB7U3qnVz4J+ovF7JiYVrIU1YSoQDpuDKuOsEg5AE?=
 =?us-ascii?Q?H+AlEHPz6+h0VRCbgLsczhWHWyqYti1Q/DifjSegRALU0ybGV6aDltHbzTmV?=
 =?us-ascii?Q?F2Jc3xV1MA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ea6630-4f80-4405-98b8-08df4bc5201b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:56:53.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b611VxY5BW12yRjwtwa5EOANlgGHijEUOD3YqDBxVgNx3E2XL2RMwFrhxEmvLH2ol9V6fYYwJp/oXhzPSYoaTJ4Z7QF3ozxNvCJGnypCPsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251306
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gitlab.gnome.org/GNOME/glib/-/releases/2.90.2

ptest Summary
SUMMARY: total=3D309; passed=3D308; skipped=3D1; failed=3D0; user=3D171.0s;=
 system=3D92.1s; maxrss=3D144524

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch      | 2 +-
 .../glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch    | 2 +-
 ...Remove-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...gio-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 ...irepository-Only-prepend-library-path-for-g-ir-scann.patch | 4 ++--
 .../files/0001-meson-Run-atomics-test-on-clang-as-well.patch  | 4 ++--
 ...meson.build-do-not-enable-pidfd-features-on-native-g.patch | 4 ++--
 .../0010-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch       | 2 +-
 .../glib-2.0/files/skip-monotonic-time-similar.patch          | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch           | 2 +-
 ...{glib-2.0-initial_2.90.1.bb =3D> glib-2.0-initial_2.90.2.bb} | 0
 .../glib-2.0/{glib-2.0_2.90.1.bb =3D> glib-2.0_2.90.2.bb}       | 0
 meta/recipes-core/glib-2.0/glib.inc                           | 2 +-
 15 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.90.1.bb =3D> glib-2.=
0-initial_2.90.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.90.1.bb =3D> glib-2.0_2.90.2=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index 8044ab17c9..a78f38abca 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 4b5c716146a03001c0006731f974e578672aeb44 Mon Sep 17 00:00:00 2001
+From 0033fbdc95e9d60ae14b6b4e3f6d73fa8a12418b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index a442f74064..11da164de3 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From f44ed0ae64f68713601ec0938c06fbb9f2b53101 Mon Sep 17 00:00:00 2001
+From f72a5af09b12f8c6174c1501ad733c7317d607c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index a429e87e6a..9e375f0649 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 952e8c37edf7dd8005b2131701816e95c8ff2f3a Mon Sep 17 00:00:00 2001
+From 149fed7d30536a4e24135fba045c52319c7ea98f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 0037094875..6335d5b92d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 57d827fcba6a97423d977b2df38d51187137b83a Mon Sep 17 00:00:00 2001
+From dead929dceca382d2b5bdb1e41fa4c3a20662995 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 52caedbdf7..27bff8f201 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 9f365868765590f37262e56719c692bc9f4b0808 Mon Sep 17 00:00:00 2001
+From bb673c6765b359663b56a6a4f0fedf59e1a486cb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-Only-prepen=
d-library-path-for-g-ir-scann.patch b/meta/recipes-core/glib-2.0/files/0001=
-girepository-Only-prepend-library-path-for-g-ir-scann.patch
index bc17de7c2a..dcdb1182eb 100644
--- a/meta/recipes-core/glib-2.0/files/0001-girepository-Only-prepend-libra=
ry-path-for-g-ir-scann.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-Only-prepend-libra=
ry-path-for-g-ir-scann.patch
@@ -1,4 +1,4 @@
-From dfed9685123057188acba0cf45d213b5e3616683 Mon Sep 17 00:00:00 2001
+From 4f7bb786ffe78798f280016af462f0848b7e3e47 Mon Sep 17 00:00:00 2001
 From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 Date: Thu, 26 Nov 2026 10:06:40 +0000
 Subject: [PATCH] girepository: Only prepend library path for g-ir-scanner =
when
@@ -26,7 +26,7 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tec=
h>
  1 file changed, 9 insertions(+), 3 deletions(-)
=20
 diff --git a/girepository/introspection/meson.build b/girepository/introsp=
ection/meson.build
-index 4dc44aefa..3c1ab055a 100644
+index 387aa13..e78c107 100644
 --- a/girepository/introspection/meson.build
 +++ b/girepository/introspection/meson.build
 @@ -22,9 +22,15 @@ gi_gen_env_variables =3D environment()
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 49e32636e8..c619f851bb 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From 5ae1bdd68b20143616e6b7db695562a1932a390d Mon Sep 17 00:00:00 2001
+From 848e07eebb615172cf6313ce9ffec4d6e5860fa0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index efa7e89..00a12b6 100644
+index 9f07362..2f081e3 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2101,7 +2101,7 @@ atomicdefine =3D '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 996d69f123..60796371d9 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 4db29a5bb384187ba438973f37783633eb6cf435 Mon Sep 17 00:00:00 2001
+From 91051ca15d974f50c627724b878718579f4d28c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 00a12b6..6c74707 100644
+index 2f081e3..5a66ed5 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1095,7 +1095,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index d31bacce62..c56e5b6d10 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From e0d4d304b62ea179fed8f9457ed5ff3f04fefd33 Mon Sep 17 00:00:00 2001
+From 15a922f474cb3fb8d0af9330f4de0a678317210c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 1dccd77f82..78e0bb8d85 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From e60b5c7f8cad49d23d42aa383721d6ab8aa7794e Mon Sep 17 00:00:00 2001
+From ee1792913173bbd7e45d51233d7524575056433f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
index 5fca8d172e..963a16788d 100644
--- a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -1,4 +1,4 @@
-From d5fb9817e496d2fcbffc5a8e34158d79ad3795e9 Mon Sep 17 00:00:00 2001
+From 58f4c46c4c136bd332d7d22a91d0f3981675534e Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
 Date: Wed, 5 Aug 2026 08:00:00 +0000
 Subject: [PATCH] Skip /monotonic-time-ns/similar test
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 06c0edbd17..8a45a49264 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 2b11ed949e43bf6026e43c6048137a2f28f8a9f3 Mon Sep 17 00:00:00 2001
+From b98356628b38897423eb554941445f036b466e6d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.1.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.90.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.90.1.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.90.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.90.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.90.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index dda09c59b6..844841e88e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -242,7 +242,7 @@ SRC_URI:append:class-native =3D " file://relocate-modul=
es.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "93c941aa17d5eb1d53fe838365f29a8b4e539c222a=
256d974ec8f30fc413e396"
+SRC_URI[archive.sha256sum] =3D "edf473b4f5ee70a31d2410622ee605dc4a2c8c46db=
c0ec53c9abbaf3960232fd"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
