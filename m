Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9511.1793615273574902660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=avd9LwY8;
 spf=pass (domain: est.tech, ip: 40.107.162.9, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibtInN/Agth/8axA/efxttrmT+uVni4MaVudOfmo6utmSqOUiUd4eUEE4LrMGVGwypJQQcReagiFS+ltnEQk3vclZTcfw28j/TCyRuOsRg5H2V9zExpa6pU8s9EHUft0HjAq8O9JICYsDmQarLxoA9xWlI5VFaO9g+5EXumNuSCZ6EZXC74bdm0Oo62IqZns2loE5mUVBVUyDihJ7JtlQdk883gxwEaw4Fg2vAa0kiAvu6vfFgGY9VLDPLUWG0r3d9seFozLA+M+ANTZ2p4Ol/epT9xd+EjNRWHAVZ7x8cqHsoUWKzqNMKzKwEZykugsz6+jZhDx3gwOk/Fv7dKdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4mDBbir6196WBfKTe2FqKMniG3DO2p6ku8S1CjEVO8=;
 b=muSpqaeSmMDyANYdLtCuD6foJJ09p8TfjHZgkhP+L6Cqyegfiy1t1rKrEYQmiY5sEaW4o+Rlm0TF8x2935M7d1rj3qKjEwmxbJoKGqHgvitkYRLReq7zYy7Lh3x32Qi3K4MvTw0u1Pg/S2ESNHOvVE50KvNHVBEobHwhG55YL05Bb+nF9nrQ1Sad3GoDVlFzLh20IFxAzXMaxM6/IGWRGbJG/RT6QkfSCH8oRFnTPL1EZkTWQ2jxGCI8euTn2jY6QBwO3ea9/WgcplSWP4y1pE5wmH9bNxDvTds72KM1kj9jyNVBkchgOuOiOkB+uSUcw8PE47iUoqEOhaQvGkhyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4mDBbir6196WBfKTe2FqKMniG3DO2p6ku8S1CjEVO8=;
 b=avd9LwY8NHwv1lU9nao4K0ej7XkyCISIrgcJh7F9xsQHt1JF/VxX7YHGoF+6eXAAjzHYaQ73EhPRrvsVp37cbGjqk+iVQsm7tKonX8ZLXDr5Z/xN/F+11/lRfGiJ36zkSIbDOk+fpVZS5UMfM4KLCfAsH0Bl4jV8dleuUNckfXlvShQJnzy6Yq6GVVq0kbLTRx+p2M/wPM3oe0CX0xb3W0hCG6Ywu7rWUBxKU2pIHt6GXMp98JyUeWS8KQn9cuOn05NU8nTv2P72L2i6rDGD5y97V/kxDKmpNQkpex9iJplr2GWNRcz7Ge9tIPrPS3mIE7Znt/bUsWAXaB/ZDJTg6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVXP189MB3512.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:27:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:27:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] mtools: upgrade 4.0.49 -> 4.0.50
Date: Mon,  2 Nov 2026 11:27:40 +0100
Message-ID: <20261102102742.31991-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
References: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVXP189MB3512:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ec2c39-113f-4125-f838-08df38cbef65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|261009223027099003|261009221227099003|261009221727099003|261009220027099003|261009223327099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: +iLl98QKkHGzukJJpXWs581TAOeNobp3rN+0/H26EKxv3W/b9vX96hjzV/pWT2UJDhZbE//8dbQ2yAurUmbgegS/s07Ne+CEpnc5C5HLpHbbykOB1jMbAN36RqgOn/8rpicJSJ7F15uKTwsvydXyTNIBIQgIARQzcG3DCJA7Bjtd/zZFUdaFqiNORYVF8GMWnBoA2lzv7NfkccUsvTZPjKS9Bo3/UZhAskgTmTWmMUAR051cQX2S+MlPce/WRyPwm1s130z+08FSPhVTmXjegsJaxXhvpU71I71tR6hLTLNN0d2D07x2EBHyPb3+VcB2CBqcZoehe324/Gx6dsmi9znhon6m4BJHtnIYqhN3iUlh/TckfsRCHfMaDMSZb5TZnRvD+w8Qw8tfdeDEKXzV7+imqW6QXYkgr0jc5WOYAeGHnSeoGLC3DUE9mDlRKOjvrfEtHKAh6M9wPmIRFnCzJx2jHNBVryXudv8/lCuoTkb+WZYaufclCOqjXJcYuBUedwXoKT5HLEMcBHOSG9uvtaNe/OPJfOIJeMjxeodSSJ5BPYAG4vZvbybWDXbaE8VFj/KHQit74t+sdnBS730aswuRIjNPlvAb60ASxeMtMZi8KZ1Wc0Jj5c5QkLLWBWOGXLEegbz0vzMD2+zxTjOKCJAv4AvsYCtPZmlG2GLEjVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223327099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sN2Hwd4zUM8DUPlQGKoV8WUDPAsQnHE2kA6gdFpBtDfexUe6gVzBBNaXBR+y?=
 =?us-ascii?Q?X5O7hq4HujZ8YzZaR+5XHKm/60iprXUvkAivfz4ndJLYJIoLda0SVikmF5Zc?=
 =?us-ascii?Q?R3FWXE7jW//O680vuguAP2a5Hc17sEJJkT+Iapb2iCRH4A7xyF9DlGUNcLwI?=
 =?us-ascii?Q?1Hbh6270egfdqSbkaPssWxyfnP4uHbLU5KsvY1uMpmfdLp77BPfhGURyCdL8?=
 =?us-ascii?Q?O5VIBGLYKLcNi2TtZJ2ctEVa+ScWx53avjk8N08VFiYCsiA7Yo92K+VWkSQy?=
 =?us-ascii?Q?8cz3SjzfHQ0mINYCU+fDv/PcCBMAtlwG2ilDDbAOpnB7f8fhdIuJxlTvksfb?=
 =?us-ascii?Q?ZSYvWgohC/uD7DnS2CkwWX7v56h/WMwqWI9BQImvK0eukfm9OIP8G4A+DQJL?=
 =?us-ascii?Q?Nh9s+fXD0X0d85geglI/LRdwR/fxMs2XzYcN2ivL0FowywuB9ICURftUnVD+?=
 =?us-ascii?Q?OJNnUq6R6ZIcYa3yJn2cPHb9CYOjVWTiC30irwdu8dvnNKiRoc4Ma9nu2Mbt?=
 =?us-ascii?Q?Hsr6MJ/uAZS+qz0CMvwr+/OpjycRGTSoRn5/Bfkt7RTRLXha+VX7QdPFAsk6?=
 =?us-ascii?Q?Sgcyjec262WG9n1F7zfLxYf5epq/TTnTqSzWHZPnFRsiXqzndIbyerRN7VRX?=
 =?us-ascii?Q?ExtXgJ5dccDutH5MuE2dR7UL2aQSDgQgeChrSIV84afTuD4sNAxk1oYCEoXr?=
 =?us-ascii?Q?kFinxOA4171leQT6ZXvVWg4WDtprXtgMJNFf1VzUMenJ3LX6RbsPRY/vej+c?=
 =?us-ascii?Q?/f0y2qCltfhq4eZLcc1aDxL8kaHeLVILiEqQmk60UzRZUKOv3wDUu8cKFbv0?=
 =?us-ascii?Q?kuF1a0zjqmM5erR5U/6dUjkXJcEgY3MLUYAmjsvgamVkn6SpqD3/xTRVMR2V?=
 =?us-ascii?Q?egOujBpFkyq1w3q6SgKXV9bWZTskQcDpqK2KB5XC2sY+1HMcdnJDMCR2oOyQ?=
 =?us-ascii?Q?hWe+WI99KAmD+sMofOBcf+uME2JhcmqWIaiMGZwY4LEy5cDP5+dzrulZ0FDa?=
 =?us-ascii?Q?KPVpQxTQFdXFdw68Lf7qOfhkb/boCDtl/otKUQqmPiNDmRNoosjAcuSrD8Jn?=
 =?us-ascii?Q?5icK7Ya0osSVG9LMnxf8ylkwjK07oARf7dDcqYTsLR4L34qpABg2/+NpWBX4?=
 =?us-ascii?Q?87aWla3/MUjVtFj4qKia6zSBS3CorGxE/HKHC2xs3axdoliA5QYDusDnfIj+?=
 =?us-ascii?Q?B5tK3K+B7B4kmR+e8ywp71l/EZh0UQK3DBH+jh3f2+xMFs2dKo1uB55Jf2Ax?=
 =?us-ascii?Q?Ja9uw0zaRZzOTM0UkGjRSIoId4FbwO/JXU0EtPyK3mHL04otSAFfSxNVytSW?=
 =?us-ascii?Q?4TSmqWQCeOpsElQfrlyS+syPd9olpN+NiVyTQg7c5YLG6xj40ce7gnULbwjD?=
 =?us-ascii?Q?UewCBKDER/ZLY0sVYwDAgC8mnsM5nQ5Nnc3DCUAsqLI8KCt57Ya6LQpwJBHm?=
 =?us-ascii?Q?TF1hnGDB4jcho1cQ2ltPX7SvI8EX0sHK0QozXGRxOEpbkLvW6k8KrXIOwQsk?=
 =?us-ascii?Q?zALPngm8XEe6Xzbid0sw2kjZHZ4JSWbcvoQxyjNmwrQo6I9GOGCF0vB/2c+O?=
 =?us-ascii?Q?Fb7kPgmO2ksAcq6Ll29e+YpyNdsBkSHoey/5jJccDDCtg74DqFiWvscNV1l1?=
 =?us-ascii?Q?8shT6eFIHlsvvt+OYxsj/xf/0J+SKRHL0Sw3KlsIY+UcU6oOFBViF9z0rB4D?=
 =?us-ascii?Q?mZyaLMFJdRB5ZL9/lviUDtaJfL39oBQEQauYmQlFbNHdHQRiic9Ci3e8M/57?=
 =?us-ascii?Q?o6arGSMi1A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ec2c39-113f-4125-f838-08df38cbef65
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:27:45.7175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lU/KA0K+qBP1L6IGsCv0T0g31DHs2lmFHTM7DowaLjyaqB5kQSrS9VlmSi7/hEnibmjaS8yke8aXC0/QtG3jUHKeWi+uRIF9S5sjTFthiEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 10:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249200
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://lists.gnu.org/archive/html/info-mtools/2026-10/msg0000=
1.html

Improvements since the 4.0.49 release are:
        - Fix CVE-2026-118384

- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 2 +-
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.49.bb =3D> mtools_4.0.50.bb}           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.49.bb =3D> mtools_4.0.50.b=
b} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/=
recipes-devtools/mtools/mtools/clang_UNUSED.patch
index ddf3706f511..3b975d5c40a 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6914c6e15cd15daf1dae81458e5346958c9d5449 Mon Sep 17 00:00:00 2001
+From 1e420800695fce8af0f2c93d3485646d0f50e93a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.=
patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 63992ac5471..2220295f844 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 16969d42ec6514883bcee87cc89b3e7864481d7e Mon Sep 17 00:00:00 2001
+From 8b7a818762eb2d87428e0e1dfe439456cc3e6e85 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/me=
ta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index fb7ba56eec7..682341af2bc 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
+From f487cd37a3fce9b2829e62f29347a06c75677a2e Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -10,7 +10,7 @@ Upstream-Status: Inappropriate [licensing]
  2 files changed, 33 insertions(+), 5 deletions(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 7b305b0..70c8c74 100644
+index d9cc6e3..1f8d93f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =3D
@@ -39,7 +39,7 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index 37f0d00..c93cfb5 100644
+index fa73f7b..c42a232 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.49.bb b/meta/recipes-d=
evtools/mtools/mtools_4.0.50.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.49.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.50.bb
index 294b2f37b28..0e3b754f1d2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.49.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.50.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc =3D "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] =3D "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f=
46f66a871ffc9f"
+SRC_URI[sha256sum] =3D "f3a58e6cfc2634b03c240442548e3b00103692357afc28e1e7=
104744dd6478b5"
=20
 SRC_URI =3D "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
