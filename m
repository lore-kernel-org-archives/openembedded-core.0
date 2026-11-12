Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9981.1794477301257847548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 01:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zcAdyOAP;
 spf=pass (domain: est.tech, ip: 40.107.159.35, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jg4fbTxMGIvhnYB7Wj3E6era1HTTVCwE5E1O5Bf72m3Pd/axvut1vucSDdNipacTvYixTJMPEtFjZeJSPFV0fqMGXtAHEeiiB7iB3UpFTYxZUCAvAjVS9YIXFn0XtqlKmtKYLbKZgwO403UDVH2SKUBF3thWQKXkXNZOYOmkb97FDhTseM0Or7LTE5plZ3x9wzyzDUdeo4HHgsIK7b4D8oomU2xP/QSyqQ33DcVP8I0LN1eld4n6a2FPwb7AWlDa87wiCl3apVjyb0OdpRZhyoV+8/jr7RvbPHuwp2LATC7HMPiNyGVc+IA+bMQFdaNHgNxrD/nas6QDYRIb9STO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nkj6MH1/YctLP05J4spRSVFg2qxRSY0upONgJGzioLk=;
 b=pmmiy21PDiY1XrmbfrwStD3aAynOP6Fbvp63eJIfJfI/YI99E642x+5YzfgvgZtlRClmcKvMTetxb1WFM7zXfUz1z05cAKMFT5Ec/jjxT2gMoftcTHTFTxXpxBT9CXdWZVsvK5SEHAzeHtaIdM8IB9hKo5oTIV0oqACR76W/n6RMvXOX4weBlvgy5gSxfInvhRavwQ10FDoXoAIPHS2VE/lxFmInSza7hv8WN2DsdrmR4YHmk6JO/rVCRWt3H8hNkd6ZfWyxf1+9Vao6y0XIP/ZGXYuoem5vpqDWnDLghnzeKTnxLQB7Nthos0G7f6xphCBV5OfNFHX+P1uHVjggSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkj6MH1/YctLP05J4spRSVFg2qxRSY0upONgJGzioLk=;
 b=zcAdyOAPWbbyuCRwgm1seZO++nBhlQSVNVw8s2spnmw3cAatUfWTngBaMdTnh/WApGH3OzYgwenX3T8wbdHaFI9HoPjl/OSc7h5V+3RO37UCgL/CXidxrT7IPaPzBFbQsTJoi2azhccnWodsfO6V0J2Z7RzmuAM9HB9AwfOlKlBF1l2SF1ZbIQWibost0om0NfJ4cy79QQ4lhk8Ywa9hH8JvHPHuabEb4TgpivQ7LVDemCfmni2WQYsOxYENwY5IpufkJOwiIFt+4KSk+oGQdDaLnc91F2++ARDlUOQD4yq33Vpt/xWANp4B5hxs+0NDnRJ4Eesoq5++AvUKVLEyVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB2166.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 09:54:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 09:54:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] groff: Upgrade 1.24.2 -> 1.25.0
Date: Thu, 12 Nov 2026 10:54:51 +0100
Message-ID: <20261112095451.91069-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0175.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB2166:EE_
X-MS-Office365-Filtering-Correlation-Id: 25650287-b2b2-4754-adeb-08df40a2ffd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|3023799007|10067099003|261028144727099003|11063799006|261009221727099003|261022075727099003|261009221227099003|261021121427099003|261009220027099003|56012099006|261021123027099003|261009223327099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|260925021311599003|261102123227099003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: qmcXP7CYgYyZB5T59h5hKQctLnYNpCHVF9AKsJcCVT7MxIZ1J9qLIBN+ctHw6szV9bDpYBf4eejy6QL4W/8jOxRpG7pjLhEYeRhbn9buGfy8p1QjbIEdttS/3ORBj2ShNSq5Re22YvPwHN9Bme0QClv1SBd/vNFiJh4K2uZxYJ78ABoQRxqmGoFWrfe+vaaxtaH37HtKu0FU2hsg+ZdNaPhGMpI7iXBKNcoyfcLCu0c4hKA+tIi34mI50o0QC/9EvSUxCeVQxrTDrziZ0hjRAWQZreK017jetr8t5ufjEjeebN73zTl7eU6ccdifyQmMwb4ZnyATirxPXkM8TJjCWZEZSBQradkPXM8rmcOBzEYqC61FKZJx9+QhcJ3ioL68OV/a4fvVttI6H9FFxn4GCx/R4BrQ9DOhPbNTC1WUjawlwi0gXXHrpXNAQPGj/qYoRx4rdT+ksu2qGIKGkmk3wSXyHW56iry1Gvq1H1N65+A6pbb0BjHLoTkqV0pkx59IEuQnJ3M+CG8GCbmalyAIRV94OdHWlsGxgS12j6k75Rz+jbAPiA1hhxDiPtSTdU2LkyOIVy74dgKbIwVQTKDVc8+zmvWiAU/ngKqXeUU8wKmcoAMGufltYJuCLOjloTA/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(261028144727099003)(11063799006)(261009221727099003)(261022075727099003)(261009221227099003)(261021121427099003)(261009220027099003)(56012099006)(261021123027099003)(261009223327099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(260925021311599003)(261102123227099003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TJRTmXraiEN8/iwg3UJOuVVjI1d0xmZ5WbApmU6+8qhcl6gCtJ8rjTAhsc7O?=
 =?us-ascii?Q?hP48j2SqHQnm4XKdEUewqB+FOVLOPpoLTw+NNRjxtpIICqyU3QyWRXgh2Kxk?=
 =?us-ascii?Q?6cNlChhBFcAqKKSQSDwdfp9hS71sarIedfkzYVP6Lo4IxHyNOvFepRx0Ltmy?=
 =?us-ascii?Q?RhvNHDwcPGqOBvQ3PyEi1LnMpN001hGGuUUK4vFsByMpAr11wBGwp9vPnkKT?=
 =?us-ascii?Q?Ny7u3jRrtKhSuW8hJwKhGB2YiWsus/VFxkrn4KonsfJbUSkPjEITdvDJ9xU3?=
 =?us-ascii?Q?axGhRB4MVDipSYSQv/UHYi8QsXg5dUpKNJR7WSnNs80rZ+5Pa29NHpiV8poZ?=
 =?us-ascii?Q?V/uSjAXh6ebaq/eP9l9gtc1nZZI1KFm+exXiPSVgKQjilBPt5/T/01XFuXar?=
 =?us-ascii?Q?4BofWlDK6cR27JR+MUCqy1YET6/tIfWre1DwpI7R1fL6aexjRD0P0Ygu1tOn?=
 =?us-ascii?Q?sVXSR/ofVRiFZT6i6WHJKnZ/c/DhvvT9WjuTaXLI32YvIb5yA1HIunxylTkM?=
 =?us-ascii?Q?CH4Sg2/K0w8W+G8chRiPOXWWp+C4SvBcD8z96Ep66OgTw+uAfhYZ68Oz3TSH?=
 =?us-ascii?Q?TjHMsXwS2cmm2ZARahxGVEP5gU6fHKXcVu0J73yIdUZLWRps0UjIkmC0orrX?=
 =?us-ascii?Q?H/tqWtnM7VYdB5iDEFQPncx4uAGV7ViT89PZLs5m81esS9y7nm/ewd0tlVhC?=
 =?us-ascii?Q?B9q8vo9xu55gUu1A7DC0+AKwWGxNKob/4+tOQ9JwEEQcu8vZdt00gkY+LSfC?=
 =?us-ascii?Q?Y7CVJx+BD1dedU3bx4HD37uzzI9SCSQ2786Vv0kapQbgLQXIBtUQj0kMlt3v?=
 =?us-ascii?Q?zMqwqywyC95mBbswzkfYcC+EAu19Jftd5BG8nsv0jcb21tvZvxRW+TdvEpMq?=
 =?us-ascii?Q?6P8N5bR46zjDRxgehHFWVd+NO8VvaUVIA3FsHIsC5Z03triat1DWkt8qA06e?=
 =?us-ascii?Q?44P9ar5RX+9+HRtfWqv1KDiSpLo5wdMFsfr6PallATUChaiTPQ/Y6BDfGXbQ?=
 =?us-ascii?Q?okY0G647Bx0JP13VojJaOGR3VOXgLI+geLXy8Zd4gdRyQnjQwryTr2QkIBj/?=
 =?us-ascii?Q?ljruGlgXaGsOFbbDGOWRc6moi3jRSIcWlR325i5FE6MafECXBgvQIq2YfzGl?=
 =?us-ascii?Q?kf8yR6QDZNZDxKfqbroFy3sNzSsMGUDEWZt4dwW9uvhAIQkW721v+6QFLDlt?=
 =?us-ascii?Q?7vanGICCsZSfJRbS/JgkTNzNnUcD4ZFI4PNYyJkKshqBXAkH8a7Vnq8iT/lX?=
 =?us-ascii?Q?I7CsvwrJSOk1lyPnlMSnIVynLMY9uosENN6p8jxJdTgrUYanJBmWylpMYY1J?=
 =?us-ascii?Q?OQrhSlAKEq4eyfUQ8zJCEqc2uyuYxyLlxO+iG4o+fTqaKa647I8TAs1mzbdU?=
 =?us-ascii?Q?4WZqias97kRtku++09NVvlNnhNeBuluK930qYWKbxbhaMltghmw7815grl0M?=
 =?us-ascii?Q?OsZ3OwelosCFeILtOkTvlCBJ/LpWIngw/vwJMAYQVy55zyVNfBn4mGn3wrFN?=
 =?us-ascii?Q?N6tp9myL/zyDi85iRY4hC/2BaWrESgfUd1J398/2/o1YItb13RU8geKRr14Q?=
 =?us-ascii?Q?//7NHoJzyj8je2ZwdLTkGpTthPHs4m95QpfJZSjoDFpXUJfPxj7+gtdPBHIe?=
 =?us-ascii?Q?CvFaqSgnxLDCzcDb0whmg8C42iXWd9g6ERzxEhIsptyf6noDtJPbKWDCYtVq?=
 =?us-ascii?Q?JHIEHoK1M30HDaNCMgsMJueR44Xh0qVcJ7B9dHmTHpbv0Wn+O4tjFeKr4Sil?=
 =?us-ascii?Q?2txJGsu1gV6MiwSlx7NpB2GLzGThgJ4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 25650287-b2b2-4754-adeb-08df40a2ffd1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:54:53.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vp9INI7aIWO+E6KFfSCXS8GpWatF94Kk8OactqXazMeol6F2ErBZ+U4++adfVjw2fNUkDXfEoNIWBQcwIjKcHF7dQOrvZ/D4MDxS8IdB8tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 09:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250081
Content-Type: text/plain; charset="utf-8"

- Drop builddep.patch as fix is part of release
- Drop 0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch;
  fixed upstream (Savannah #68136, released in 1.24.1). gropdf's SubTag()
  no longer uses rand(), so the SOURCE_DATE_EPOCH srand() seed is obsolete.
- Refresh exisitng patches
- Fix cross-compilation of man pages by using native soelim and stripping b=
uild paths.
- Add GROFF_G patch to keep the "g" program prefix off in cross builds;
  it dropped plain nroff/troff and broke man-db (test_mandb).
  Upstream: Savannah #68901.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v3:
- Fix oe-selftest failure
Changes since v2:
 - Remove dropped patch
Changes since v1:
- Fix cross-compilation of man pages

 ...001-Make-manpages-mulitlib-identical.patch |  7 ++--
 ...groff-not-found-in-cross-compilation.patch | 15 +++----
 ...E_DATE_EPOCH-for-reproducible-builds.patch | 39 -------------------
 ..._G-don-t-prefix-when-troff-fails-to-.patch | 39 +++++++++++++++++++
 .../groff/files/build-less.patch              | 22 +++++++++--
 .../groff/files/builddep.patch                | 33 ----------------
 ...groff-not-search-fonts-on-build-host.patch | 13 ++++---
 .../{groff_1.24.2.bb =3D> groff_1.25.0.bb}      | 12 ++++--
 8 files changed, 82 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/0001-gropdf-use-SOURC=
E_DATE_EPOCH-for-reproducible-builds.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-m4-groff.m4-GROF=
F_G-don-t-prefix-when-troff-fails-to-.patch
 delete mode 100644 meta/recipes-extended/groff/files/builddep.patch
 rename meta/recipes-extended/groff/{groff_1.24.2.bb =3D> groff_1.25.0.bb} =
(87%)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-=
identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-muli=
tlib-identical.patch
index 6dc84c9062..093f447bc2 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identic=
al.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identic=
al.patch
@@ -1,20 +1,19 @@
-From aa1f37f1e0ff0dc0eeb199b52959e0deb275721e Mon Sep 17 00:00:00 2001
+From 3497a04ab9bf74f7d686ebbd3bc5997227083f6c Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
=20
 Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index f7ab410..7e1f3fb 100644
+index 32deb25..b74e100 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -891,7 +891,7 @@ SUFFIXES +=3D .man
+@@ -860,7 +860,7 @@ SUFFIXES +=3D .man
  	     -e "s|[@]PAGE[@]|\\\\%$(PAGE)|g" \
  	     -e "s|[@]PDFDOCDIR[@]|`echo $(pdfdocdir) | sed -f $(makevarescape)`=
|g" \
  	     -e "s|[@]PSPRINT[@]|`echo $(PSPRINT) | sed -f $(makevarescape)`|g" =
\
diff --git a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-no=
t-found-in-cross-compilation.patch b/meta/recipes-extended/groff/files/0001=
-groff-fix-test-groff-not-found-in-cross-compilation.patch
index e9214519e7..c1db0134f8 100644
--- a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found=
-in-cross-compilation.patch
+++ b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found=
-in-cross-compilation.patch
@@ -1,4 +1,4 @@
-From c0f835a59d7b33452f280c8a73c3214e0a3a3d9f Mon Sep 17 00:00:00 2001
+From f0dfb4b314893769659b25da145d602d1dd87499 Mon Sep 17 00:00:00 2001
 From: Zhang Peng <peng.zhang1.cn@windriver.com>
 Date: Fri, 6 Mar 2026 05:18:33 +0000
 Subject: [PATCH] groff: fix test-groff not found in cross-compilation
@@ -29,7 +29,7 @@ Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
  3 files changed, 8 insertions(+), 4 deletions(-)
=20
 diff --git a/contrib/mom/mom.am b/contrib/mom/mom.am
-index b99e869..120d3ee 100644
+index 98d1def..57a3b3e 100644
 --- a/contrib/mom/mom.am
 +++ b/contrib/mom/mom.am
 @@ -24,7 +24,7 @@ mom_srcdir =3D $(top_srcdir)/contrib/mom
@@ -42,12 +42,12 @@ index b99e869..120d3ee 100644
    GROFF_BIN_PATH=3D"$(GROFF_BIN_PATH)" \
    $(PDFMOMBIN) $(FFLAG) $(MFLAG) -M$(mom_srcdir) -K utf8 -p -e -t \
 diff --git a/doc/doc.am b/doc/doc.am
-index 6cf9db5..906a989 100644
+index 8220a5d..e159f70 100644
 --- a/doc/doc.am
 +++ b/doc/doc.am
-@@ -54,7 +54,7 @@ groffmanpagesoption =3D -P-e
- endif
-=20
+@@ -65,7 +65,7 @@ endif # HAVE_URW_FONTS
+ # Use this macro to render a document if it has forward internal
+ # references.
  DOC_PDFMOM =3D \
 -  GROFF_COMMAND=3Dtest-groff \
 +  GROFF_COMMAND=3D$(abs_top_builddir)/test-groff \
@@ -77,6 +77,3 @@ index a65898a..9c6a8b6 100644
 =20
 -exec $builddir/groff "$@"
 +exec $GROFF_BIN_PATH/groff "$@"
---=20
-2.51.2
-
diff --git a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_=
EPOCH-for-reproducible-builds.patch b/meta/recipes-extended/groff/files/000=
1-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
deleted file mode 100644
index 8ab3668edc..0000000000
--- a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-f=
or-reproducible-builds.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f28f0c4d8dfdfb1c173d21df6ffbe35448fada9f Mon Sep 17 00:00:00 2001
-From: Zhang Peng <peng.zhang1.cn@windriver.com>
-Date: Mon, 9 Mar 2026 20:10:00 +0800
-Subject: [PATCH] gropdf: use SOURCE_DATE_EPOCH for reproducible builds
-
-gropdf uses rand() to generate random font subset tags in SubTag().
-Without a deterministic seed, each build produces different PDF output.
-
-Initialize srand() with SOURCE_DATE_EPOCH when available to ensure
-reproducible builds.
-
-Upstream-Status: Submitted [https://savannah.gnu.org/bugs/?68136]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- src/devices/gropdf/gropdf.pl | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
-index f519a53..3a79b4c 100644
---- a/src/devices/gropdf/gropdf.pl
-+++ b/src/devices/gropdf/gropdf.pl
-@@ -30,6 +30,13 @@ use POSIX qw(mktime);
- use File::Spec;
- use File::Path;
-=20
-+# Initialize random seed for reproducible builds.
-+if (defined($ENV{SOURCE_DATE_EPOCH})) {
-+    srand($ENV{SOURCE_DATE_EPOCH});
-+} else {
-+    srand();
-+}
-+
- use constant
- {
-     WIDTH    =3D> 0,
---=20
-2.50.0
-
diff --git a/meta/recipes-extended/groff/files/0001-m4-groff.m4-GROFF_G-don=
-t-prefix-when-troff-fails-to-.patch b/meta/recipes-extended/groff/files/00=
01-m4-groff.m4-GROFF_G-don-t-prefix-when-troff-fails-to-.patch
new file mode 100644
index 0000000000..cbe5be2217
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-m4-groff.m4-GROFF_G-don-t-pref=
ix-when-troff-fails-to-.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 12 Nov 2026 09:00:00 +0000
+Subject: [PATCH] m4/groff.m4: Don't prefix when troff can't run.
+
+* m4/groff.m4 (GROFF_G): Apply the "g" command prefix only when the
+  troff on PATH runs and reports a non-GNU ".g" value, not whenever its
+  output differs from "1".  A troff that is installed but fails to run --
+  as the native groff does when cross compiling, lacking its device
+  files -- is no longer mistaken for a groff-incompatible troff.
+
+Continues commit 96b8274a90, 14 October.
+
+Upstream-Status: Submitted [https://savannah.gnu.org/bugs/index.php?68901]
+diff --git a/m4/groff.m4 b/m4/groff.m4
+index e16ff3d..7f41502 100644
+--- a/m4/groff.m4
++++ b/m4/groff.m4
+@@ -1065,11 +1065,14 @@ AC_DEFUN([GROFF_TMAC],
+ AC_DEFUN([GROFF_G], [
+   g=3D
+   AC_MSG_CHECKING([whether a groff-incompatible troff is installed])
+-  if test -n "`command -v troff`" \
+-    && test "`(echo .tm '|n(.g' | tr '|' '\\\\' | troff -z -i 2>&1) \
+-      2>/dev/null`" !=3D 1
++  if test -n "`command -v troff`"
+   then
+-    g=3Dg
++    troff_dotg=3D`(echo .tm '|n(.g' | tr '|' '\\\\' | troff -z -i 2>/dev/=
null) \
++      2>/dev/null`
++    if test -n "$troff_dotg" && test "$troff_dotg" !=3D 1
++    then
++      g=3Dg
++    fi
+   fi
+   if test "$g" =3D "g"
+   then
+--=20
+2.51.2
diff --git a/meta/recipes-extended/groff/files/build-less.patch b/meta/reci=
pes-extended/groff/files/build-less.patch
index dc560fbb30..62cd9f1718 100644
--- a/meta/recipes-extended/groff/files/build-less.patch
+++ b/meta/recipes-extended/groff/files/build-less.patch
@@ -1,12 +1,25 @@
+From d30928c7ee37eabf32075d88b1e6a406968651c2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 19 May 2026 15:15:07 +0100
+Subject: [PATCH] groff: build less in groff-native
+
 Build less bits of groff to save time and reduce random build
 failures from missing dependencies in this logic.
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.am | 15 ---------------
+ 1 file changed, 15 deletions(-)
=20
---- a/Makefile.am~	2026-05-15 13:23:08.000000000 +0100
-+++ b/Makefile.am	2026-05-15 13:29:17.053867035 +0100
-@@ -556,15 +556,0 @@
+diff --git a/Makefile.am b/Makefile.am
+index b74e100..9b5ecec 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -553,21 +553,6 @@ AM_CFLAGS =3D
+ include $(top_srcdir)/lib/gnulib.mk
+ include $(top_srcdir)/arch/mingw/mingw.am
+ include $(top_srcdir)/arch/misc/misc.am
 -include $(top_srcdir)/contrib/chem/chem.am
 -include $(top_srcdir)/contrib/eqn2graph/eqn2graph.am
 -include $(top_srcdir)/contrib/gdiffmk/gdiffmk.am
@@ -22,3 +35,6 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
 -include $(top_srcdir)/contrib/rfc1345/rfc1345.am
 -include $(top_srcdir)/contrib/sboxes/sboxes.am
 -include $(top_srcdir)/doc/doc.am
+ include $(top_srcdir)/font/devX100/devX100.am
+ include $(top_srcdir)/font/devX100-12/devX100-12.am
+ include $(top_srcdir)/font/devX75/devX75.am
diff --git a/meta/recipes-extended/groff/files/builddep.patch b/meta/recipe=
s-extended/groff/files/builddep.patch
deleted file mode 100644
index 71c23d60b5..0000000000
--- a/meta/recipes-extended/groff/files/builddep.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-[mom]: Fix example build dependencies
-
-We are seeing occasional failures for eqn being missing when building
-mom examples, e.g.:
-
-| groff-1.24.0/groff: error: couldn't exec eqn: Permission denied
-| pdfmom: fatal error: groff-1.24.0/test-groff exited with status 24
-| make[2]: *** [Makefile:19256: contrib/mom/examples/slide-demo.pdf] Error=
 1
-
-It may find eqn from the host system if installed too.
-
-Fix the build dependencies to add eqn, pic, tbl and preconv since a=20
-quick strace indicates them all being used here
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/groff.gi=
t/commit/?id=3D3f7d8ea20f91a8abf248fbf7ec73049cd8c3c9c2]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: groff-1.24.0/contrib/mom/mom.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- groff-1.24.0.orig/contrib/mom/mom.am
-+++ groff-1.24.0/contrib/mom/mom.am
-@@ -144,8 +144,8 @@ SUFFIXES +=3D .mom .pdf
- 	&& LC_ALL=3DC $(MOMPDFMOM) $< >$@
-=20
- $(MOMPROCESSEDEXAMPLEFILES): $(MOMNORMALFILES) \
--  test-groff groff troff gropdf pdfmom penguin.ps penguin.pdf \
--  font/devpdf/stamp tmac/pdf.tmac
-+  test-groff groff troff gropdf pdfmom eqn pic tbl preconv \
-+  penguin.ps penguin.pdf font/devpdf/stamp tmac/pdf.tmac
-=20
- penguin.ps:
- 	$(AM_V_at)cp $(mom_srcdir)/examples/penguin.ps $@
diff --git a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-bu=
ild-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-o=
n-build-host.patch
index 111dbd385e..b1e7a08cf3 100644
--- a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-hos=
t.patch
+++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-hos=
t.patch
@@ -1,7 +1,8 @@
-From eb16276c3e2e34aa2e57f6a0e68554657b90cd28 Mon Sep 17 00:00:00 2001
+From 6c2c062e9ccd4235a6262e1effbdd40ec7d35b25 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 11 May 2019 17:06:29 +0800
 Subject: [PATCH] groff searchs fonts which are provided by ghostscript on
+
  build host. It causes non-determinism issue. So not search font dirs on h=
ost.
=20
 Upstream-Status: Inappropriate [cross build specific]
@@ -13,25 +14,24 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
=20
 Rebase to 1.24.0
 Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
-
 ---
  font/devpdf/Foundry.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
-index e5aba65..5441734 100644
+index 56297fc..3a43aaa 100644
 --- a/font/devpdf/Foundry.in
 +++ b/font/devpdf/Foundry.in
-@@ -23,7 +23,7 @@
+@@ -21,7 +21,7 @@
 =20
  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  #Foundry|Name|Search path
--foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/urw-base35/:/usr/share=
/fonts/urw-base35:/opt/local/share/fonts/urw-fonts/:/usr/local/share/fonts/=
ghostscript/:/usr/share/fonts/type1/gsfonts/:/usr/share/fonts/type1/:/usr/s=
hare/fonts/default/Type1/adobestd35/:/usr/share/fonts/default/Type1/:/usr/s=
hare/ghostscript/Resource/Font
+-foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/urw-base35/:/usr/share=
/fonts/urw-base35:/opt/local/share/fonts/urw-fonts/:/usr/local/share/fonts/=
ghostscript/:/usr/share/fonts/type1/gsfonts/:/usr/share/fonts/type1/:/usr/s=
hare/fonts/default/Type1/adobestd35/:/usr/share/fonts/default/Type1/
 +foundry||(gs)
 =20
  # Enable the font description files for grops (generated from Adobe
  # foundry font files) to be used with gropdf.  afmtodit must not be
-@@ -79,7 +79,7 @@ EURO|N||||*../devps/freeeuro.pfa
+@@ -73,7 +73,7 @@ EURO|N||||*../devps/freeeuro.pfa
  # URW fonts are typically shipped with Ghostscript, but can be replaced.
 =20
  #Foundry|Name|Search path
@@ -39,3 +39,4 @@ index e5aba65..5441734 100644
 +foundry|U|(gs)
 =20
  # Define flags for afmtodit.
+=20
diff --git a/meta/recipes-extended/groff/groff_1.24.2.bb b/meta/recipes-ext=
ended/groff/groff_1.25.0.bb
similarity index 87%
rename from meta/recipes-extended/groff/groff_1.24.2.bb
rename to meta/recipes-extended/groff/groff_1.25.0.bb
index e13996500f..04001765ac 100644
--- a/meta/recipes-extended/groff/groff_1.24.2.bb
+++ b/meta/recipes-extended/groff/groff_1.25.0.bb
@@ -11,13 +11,12 @@ SRC_URI =3D "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://groff-not-search-fonts-on-build-host.patch \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-groff-fix-test-groff-not-found-in-cross-compilation=
.patch \
-           file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-build=
s.patch \
-           file://builddep.patch \
+           file://0001-m4-groff.m4-GROFF_G-don-t-prefix-when-troff-fails-t=
o-.patch \
            "
=20
 SRC_URI:append:class-native =3D "file://build-less.patch"
=20
-SRC_URI[sha256sum] =3D "f9c1efd5bebbe37fc6e1063db7473ce8df1e3e0be4ff0f43ce=
04fce57e9c5dd9"
+SRC_URI[sha256sum] =3D "24d103a07eb79e418963bce206c8771b649871f83bda2fd4c2=
e65529c1c56921"
=20
 DEPENDS =3D "bison-native groff-native"
 RDEPENDS:${PN} +=3D "perl sed"
@@ -27,7 +26,7 @@ inherit autotools-brokensep texinfo multilib_script pkgco=
nfig
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/gpinyin ${PN}:${bindir}/grog"
=20
 EXTRA_OECONF =3D "--without-x --with-urw-fonts-dir=3D/completely/bogus/dir=
/"
-EXTRA_OEMAKE:class-target =3D "GROFFBIN=3Dgroff GROFF_BIN_PATH=3D${STAGING=
_BINDIR_NATIVE}"
+EXTRA_OEMAKE:class-target =3D "GROFFBIN=3Dgroff GROFF_BIN_PATH=3D${STAGING=
_BINDIR_NATIVE} SOELIMBIN=3D${STAGING_BINDIR_NATIVE}/soelim"
=20
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'/usr/bin/env perl' ac_cv_pat=
h_BASH_PROG=3D'no' PAGE=3DA4"
=20
@@ -71,6 +70,11 @@ do_install:append() {
 	if [ -d ${D}${docdir}/${BP}/examples/hdtbl/ ]; then
 		sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/*.=
roff
 	fi
+
+	# Remove build paths from generated groff.7 for reproducibility.
+	if [ -f ${D}${mandir}/man7/groff.7 ]; then
+		sed -i -e 's:${S}/::g' ${D}${mandir}/man7/groff.7
+	fi
 }
=20
 do_install:append:class-native() {
