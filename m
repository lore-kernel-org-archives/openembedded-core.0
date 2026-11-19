Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15436.1795097621061115589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pz84g1BD;
 spf=pass (domain: est.tech, ip: 52.101.65.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8bd4pYsrfM5FeLhKCZ6MddAWmzJBWGonn6nElPqEAGXg46DWg3ur7DRPgHvNhyS2zP4FSz3LvZ+J85RHwI07nnzj3HGg2LftYxzmJYMkbGNw3jV+KNQksbWRjgAPyHcA7Kh9FyNZYqqh9dQN/5Aieefp/SIVVNS6BPpCJuB3bp0103Cb1o9tylJAT0pNeFv+qPWNDmSeFfxC5VK6hidWoRZa0UN7XkmlTsocTpHsLjN7ezrUwc8u4JotRO+UJoXNZWh5m+JeVMZuBikixILMrTysJ5xh1VhIxPWrNoMFDDRb72oFJSiqBM0rOa4oyJMxoQyXmPfZTjqYHus6n9fpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q8VjjpHZqnB/p0XTvdPNWfE3EIwILADL7phNSWfBbQ=;
 b=SnaNLQjDlQeKPCuRECUhvW+h5e8F2xSuHw6AJL8ISia5oZG8iUEfenL36zDr5DZQKw/hHlrAyt/DmSyqGbctUdaTR25O62i4nyG/QUn9Q6+6ng3r2o7fRrwhcdMU6X6QfQZ0qVIqAc01cZLY7muOs6h3oBDdXYlj88A58lcODdoulIE1lQCku7jqiVcVfP4qBlWDLEdmG8CNF0D2xOoHn8dQvpMweC21Y/m3L13NVGhvKfGMreJnq5oh8xlApIWNMAdiay4IaKZ+n4RmFy7BJcg/TXcgp5zyFc11qfO6auRtRYYjfMtcIy5pFPpdSm1AphfckbF1H6XAvxA5ZCPVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q8VjjpHZqnB/p0XTvdPNWfE3EIwILADL7phNSWfBbQ=;
 b=pz84g1BDwOcx79DIY9jvKTJn+oNVid3xHyusOGrzTCoS1rHoWDnSFfvFtUPZcva2z0RBr4ir3CMfAa+hDXClxCZaPGl6b9pWywdvkBpgD9uFo165uHBSkVyc7llx4V9/KwNCyfBRrPxiGQ0Ujcozq376GkBB/TJ6OET8wddGh7SKCekYele3l1hacwbLlsdrTJOUfbg0d/FWh793gb/iiSlGf1KjRWMAaUiRmGIyVVTdlTw5Enc0q05083U8ovOzvDovvf9KqK3MBK7s4RGW26hnRqVm5e8thKpPpH4ICdqIHogmgaVMqrpS2JQygWc3DcxkdNmK7AMPbUvJa63UPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:42 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:42 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] gnutls: Upgrade 3.8.13 -> 3.18.14
Date: Thu, 19 Nov 2026 15:13:30 +0100
Message-ID: <20261119141333.34492-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7fd938-6707-4da0-722e-08df464750d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|12006099003|261009223027099003|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006|261102123227099003|261102130727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: FAN3qOTtkj5oE0VMlUx4vVWBDZ9WngsKvT9I1YFc8YFF6oQ5u4Koz5GP3bVfBUuofNQI7LHgr+4lzP0V7MhRKMqSw7Jyk+mx2j3k+nOxGc8Oz44YZjVONvHY5Of9Onjfulbj3DutdzS+UBNRdrIeaeWXfF9K2EyYdRxnk8kwydFmtdGTPHFHHzJoaAzWgBBlQOmxifiEICbLkkt1Zr/6g7f+pOQUXgUnH5izKy7GP3ASpu20sSYQAUgV6/8MAAetYvFaQ3XC4jVwlyNu4frxAUZpQtxoXxZ/m7F9q3iG/S76rf0iUBriRiSyvz56KWrhblPZeOUxFMy5af3gy3N8TE3FwqP+SgjGMVU6hkokw7IFdZs22XWpNv+Aj77c+Z+Mfrt29b2JgZaBhRPV/9wsR4As34JD3FEIWSk682jr1u6kSbHooHGqThngGcCDHjPsO0tnSKNvpu6VAp7QeDHKGLlbWhqwB5mezowm8hi6tsANDF0+UOpH92nyqX22UAjKAX2tTYeI4zEtCDv4+gbd0707smz2ifs8UvolYJePXxQnWUEVT9tSEWR5mpqcF1SDKXb+wSpmiViHY2bgXW1YZr9RTswlZYAjsVr8p3AgrKe6plvgQLI1lYbFypSkcGOM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(12006099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261102123227099003)(261102130727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TPQ/IUWbh9EqkxZE1Zbvl1bpmGpX9YAhsLc1ZqvGvinLicXr/gyO0ZsG9o5/?=
 =?us-ascii?Q?ijvHGTMW5Qv5JIAhn+xwNaljr7k1toHlqMURrzfphGSVLH0qovw1gHKXtIIu?=
 =?us-ascii?Q?vTgIuxwcBJUNS0B4744P7vDMQ45uk49GOCW3B5nzfuuzmWr2eDG1HxY+Alq6?=
 =?us-ascii?Q?7JnRDh1uLIEJyUXP71fC+Ae289DnwU6oQEf+aK+idMMDrAFAJuLCtPh6k1sB?=
 =?us-ascii?Q?SPLqQnmQ1WGhVY2qZE1mdpC8katmjIci37BFSTLEmx6hp4/GDwPUs+sJsGJn?=
 =?us-ascii?Q?oetgqFyyztKPPuxJVkGT8uC4ckYjPstBdHUTxSeYi/rKCl9su4CxAKObdmIw?=
 =?us-ascii?Q?4Kb/uQ7lzWRzwu117kQ/rsPrUNSw//EERh5/JLX4yqX6XuCJ7TtHinf3WmlK?=
 =?us-ascii?Q?FQ8EuwHICFw3puN7SrTWMvrAszVt3s1IxiAN7qLBRati/nHIADXJd3KDGOgi?=
 =?us-ascii?Q?yUF+rhvGAYHWV+NE6Bt8ugBh5lH3QMY4baFMEnIv7PbCsAFuhoRaDBBjzjFz?=
 =?us-ascii?Q?4pSblQDK+B3Pe7sz1GTFUESlBUc5h2b0BaRIt8w8XYt8hVG0OTZjHW5RSaa1?=
 =?us-ascii?Q?uDKT0pdclsXCsxjpzFa0W9kuXrnDV/MOuVBSrZPju40zSRLYrxgawK2WnOEA?=
 =?us-ascii?Q?IrOK0Kzcoh8Pq/az5cLSPuy94B1GyE46S7x/8sfvfEJmMgQBnDkNL7obpEG2?=
 =?us-ascii?Q?5MLyy1liXz82H5Jpjkr8gCYyDxbOcxqmK88banQ0RjwKq7SWCm033K7O5ILH?=
 =?us-ascii?Q?RoLsMtO2S/xBXLTItc7S0ZTGaVq+672P9B707cypHYF0nMcevVkoLlxFKBsp?=
 =?us-ascii?Q?+UpQvf6b/dDhJNnPnIInkSKyxoCYhzxhVMZZGTM1XASOxeQgHzK8DEOjKCj3?=
 =?us-ascii?Q?ifOVvmfch93vkpnCC9CMXETUgtHjbev51RpV24zmOilZL8Rw4z15ZgIpHZWX?=
 =?us-ascii?Q?anQE7+Vp3TzNfc5eu8sshUBmwrseQjS+6qmnh0eqdMOBGrYyNhNZFG4/IatM?=
 =?us-ascii?Q?3xk3rrg7OKwgSQ0lyQmyoQBUj1ez1R45lw01c2GdsqSK5aY3Hpfd5bDDD9xL?=
 =?us-ascii?Q?XbZNPipjq1MXyL59voja14L5AFVjbho4y3Hc0LeRxfeTr0hX8VsMIkx2tOuX?=
 =?us-ascii?Q?UUs2bqYItXQnGkml2k3WvDGSZD8EqzdzrGbfzUjN7JSB8n1Pu+4TIzmF4mwl?=
 =?us-ascii?Q?LmQhxzFss+gNmsRJOjTwmzNTdKHNk16HfcnlanC7DJY1oIDK0lvQ9EnXoIdk?=
 =?us-ascii?Q?zcR+RyQyPxC/sbSDru/DnImjRSNNBwDVd7xm3+2tfBVTXNMldbwK4JOi0QRj?=
 =?us-ascii?Q?/0sR455Gx/EmSIFfbrD/XKzH1s55wVov95wFt4470do5GEWtz86qtTPHwo0W?=
 =?us-ascii?Q?Z/sHARpzq85iigO12P+WL7q6tUk0nBppgT9MNJ8+vJFdR/7UkIV7CUQuUn2O?=
 =?us-ascii?Q?ijFEbaIw238rvNTlpk3+pcx++RUgboceIeZYm0brI6ii24lF6D2ZBkaAih1b?=
 =?us-ascii?Q?0+T1M1Gc0yUEUOG/qPLhIJzQ+n8a1e8V101iEIOmZEnMxQGqZS3eTzZsKwza?=
 =?us-ascii?Q?sB1wnVOgNNWIsSsIXvCaFbqLw21mHIXoH/AjEG2XnN00ZQNvTuN8Ea3qChxi?=
 =?us-ascii?Q?LgiDrP4wjGaL598PEA82nka0Xgv1q/6e+boiXyDkF05tkjs05wlCTSSuodva?=
 =?us-ascii?Q?jN9sgngZ7+x+KBVCT8jlgnKnSY1uy58ov1E4aEIS4E5pImKkFm0WMuqd7SzV?=
 =?us-ascii?Q?Ss/vncOX1A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7fd938-6707-4da0-722e-08df464750d0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:42.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lDhaQTXO6gofVR3yLkgLgjWgH8xQlmeP+KxV1vpRBOH0gNvIs7AUKYhf+1+zedbOfDBXLRWS/t/gfyKVT9y9sTgLhadlTLbqetHJMyBpJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250676
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/gnutls/gnutls/blob/3.8.14/NEWS

CVEs fixed in this release
CVE-2026-127039 CVE-2026-127040 CVE-2026-127231

- drop two patches which are part of upstream now
  0001-tests-mini-dtls-framents-link-to-gnulib.patch
  0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
- Remove the read-only gtk-doc.m4 and pkg.m4 shipped in the 3.8.14
  tarball so aclocal can reinstall them, and fix the m4 cleanup to use
  ${S}.
- drop the libtasn1 PACKAGECONFIG and add libtasn1 to DEPENDS as upstream r=
emoved [1]

gnutls test summary:
--------------------
total: 393
pass : 378
fail : 0
skip : 15

[1] https://github.com/gnutls/gnutls/commit/2b6aab676db1f052d9f7ee9b05053df=
545b18715

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ile-should-be-excuted-in-target-envi.patch |  6 ++--
 ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 ---------------
 ...ust-list-fault-fix-issues-in-linking.patch | 31 -------------------
 .../gnutls/gnutls/Add-ptest-support.patch     | 18 +++++------
 .../gnutls/gnutls/arm_eabi.patch              |  2 +-
 .../{gnutls_3.8.13.bb =3D> gnutls_3.8.14.bb}    | 16 +++++-----
 6 files changed, 21 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls=
-framents-link-to-gnulib.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-tr=
ust-list-fault-fix-issues-in-linking.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.13.bb =3D> gnutls_3.8.14.bb=
} (88%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-sh=
ould-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0=
001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 0847dde8a9d..165cbcea23e 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be=
-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be=
-excuted-in-target-envi.patch
@@ -1,4 +1,4 @@
-From c4f6cb380471b5e5478ae6f7f8c5604a6a64ec1c Mon Sep 17 00:00:00 2001
+From f564b05747598c92655ef5bea7e49acc48cb447d Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Mon, 23 May 2022 10:44:43 +0900
 Subject: [PATCH] Creating .hmac file should be excuted in target environme=
nt,
@@ -11,10 +11,10 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/lib/Makefile.am b/lib/Makefile.am
-index a50d311..193ea19 100644
+index 2382952..f1f0d67 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -275,8 +275,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac
+@@ -267,8 +267,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac
 =20
  all-local: $(hmac_file)
 =20
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framen=
ts-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-min=
i-dtls-framents-link-to-gnulib.patch
deleted file mode 100644
index 7f999c4b22e..00000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link=
-to-gnulib.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Thu, 30 Apr 2026 13:08:01 +0200
-Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb6=
3c8df61d1480121a859f8c955f4910c01]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- tests/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f8797964d..1b27df751 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
- mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \
- 	-I$(top_srcdir)/gl	\
- 	-I$(top_builddir)/gl
-+mini_dtls_fragments_LDADD =3D $(LDADD) ../gl/libgnu.la
-=20
- if ENABLE_PKCS11
- if !WINDOWS
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-lis=
t-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/00=
01-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
deleted file mode 100644
index b15a05d5b63..00000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault=
-fix-issues-in-linking.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Thu, 7 May 2026 09:42:09 +0900
-Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
-
-This fixes the use of automake variables and also adds the linked mock
-library in .gitignore.
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-
-Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573a2=
a0e7473ab79c43a6d3ecb0ab68ce896dc]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- tests/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 1b27df751..f6a60a32b 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES =3D libpkcs11mock4.l=
a libutils.la
- pkcs11_os_locking_ok_LDADD =3D $(LDADD) $(LIBDL)
- pkcs11_long_label_DEPENDENCIES =3D libpkcs11mock4.la libutils.la
- pkcs11_long_label_LDADD =3D $(LDADD) $(LIBDL)
--pkcs11_trust_fault_DEPENDENCIES =3D libpkcs11mock5.la libutils.la
--pkcs11_trust_fault_LDADD =3D $(LDADD) $(LIBDL)
-+pkcs11_trust_list_fault_DEPENDENCIES =3D libpkcs11mock5.la libutils.la
-+pkcs11_trust_list_fault_LDADD =3D $(LDADD) $(LIBDL)
- endif
- endif
-=20
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/m=
eta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 8c867a5a400..b9454741737 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,4 +1,4 @@
-From 6abc86acecff5a30173eb78a971ec5b65f77e1de Mon Sep 17 00:00:00 2001
+From 6d524052b77e431902c8216e9964c6cb955feca6 Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
@@ -12,12 +12,12 @@ Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tec=
h>
  3 files changed, 11 insertions(+)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 843193f..816b09f 100644
+index d04e475..893f750 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -197,6 +197,9 @@ dist-hook:
- distcheck-hook:
- 	@test -d "$(top_srcdir)/po/.reference" || { echo "PO files are not downl=
oaded; run ./bootstrap without --skip-po"; exit 1; }
+@@ -205,6 +205,9 @@ distcheck-hook:
+ 		$(MAKE) -C $(top_srcdir) abi-check-latest; \
+ 	fi
 =20
 +install-ptest:
 +	 $(MAKE) -C tests DESTDIR=3D$(DESTDIR)/tests $@
@@ -26,10 +26,10 @@ index 843193f..816b09f 100644
 =20
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index 1744813..efb9e34 100644
+index 2e51385..52d531d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1411,6 +1411,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
 =20
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
 =20
@@ -39,10 +39,10 @@ index 1744813..efb9e34 100644
 =20
  hw_features=3D
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 189d068..8430b05 100644
+index b55eaf0..e3713b2 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -745,6 +745,12 @@ SH_LOG_COMPILER =3D $(SHELL)
+@@ -693,6 +693,12 @@ SH_LOG_COMPILER =3D $(SHELL)
  AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
  LOG_COMPILER =3D $(LOG_VALGRIND)
 =20
diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recip=
es-support/gnutls/gnutls/arm_eabi.patch
index d493448aabc..859eeef4011 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -1,4 +1,4 @@
-From 46b3079095c5ceb0dc742785853bbaf288f325c6 Mon Sep 17 00:00:00 2001
+From 36ca2870a05f4aa75d22d54b00e01b3c4634c5a2 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Wed, 25 Jan 2017 13:52:59 -0800
 Subject: [PATCH] gnutls: account for ARM_EABI
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.14.bb
similarity index 88%
rename from meta/recipes-support/gnutls/gnutls_3.8.13.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.14.bb
index 88b6135bf1f..8dedb1db415 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.14.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D181;en=
dline=3D205;md5=3De159ff2a6e9cc
                     file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440464 =
\
                     file://COPYING.LESSERv2;md5=3D4bf661c1e3793e55c8d1051b=
c5e0ae21"
=20
-DEPENDS =3D "nettle gmp virtual/libiconv libunistring"
+DEPENDS =3D "nettle gmp virtual/libiconv libunistring libtasn1"
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"
=20
@@ -23,22 +23,19 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-env=
i.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking=
.patch \
-           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
=20
-SRC_URI[sha256sum] =3D "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e=
99a8b16ca9c97e"
+SRC_URI[sha256sum] =3D "7e2d258071f5db9620aa7ff34259331d004f7beafa3eb18560=
cfaf60acfbf02a"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
-PACKAGECONFIG ??=3D "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES',=
 'seccomp', d)}"
+PACKAGECONFIG ??=3D "libidn ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp=
', d)}"
 PACKAGECONFIG:append:class-native =3D " p11-kit"
=20
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
 PACKAGECONFIG[seccomp] =3D "--with-libseccomp-prefix=3D${STAGING_DIR_HOST}=
,ac_cv_libseccomp=3Dno,libseccomp"
 PACKAGECONFIG[libidn] =3D "--with-idn,--without-idn,libidn2"
-PACKAGECONFIG[libtasn1] =3D "--without-included-libtasn1,--with-included-l=
ibtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] =3D "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] =3D "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[fips] =3D "--enable-fips140-mode --with-libdl-prefix=3D${STA=
GING_DIR_HOST}"
@@ -60,9 +57,12 @@ EXTRA_OECONF =3D " \
 # Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
 export POSIX_SHELL =3D "${base_bindir}/sh"
=20
+# Regenerate bundled m4 files from the sysroot; since 3.8.14 some are
+# shipped read-only, which breaks aclocal.
 do_configure:prepend() {
-	for dir in . lib; do
-		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
+	for dir in ${S} ${S}/lib; do
+		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4 \
+		      ${dir}/m4/gtk-doc.m4 ${dir}/m4/pkg.m4
 	done
 }
=20
