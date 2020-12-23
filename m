Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.64])
 by mx.groups.io with SMTP id smtpd.web10.3804.1608690222459720131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 18:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kzQBL/TU;
 spf=pass (domain: windriver.com, ip: 40.107.237.64, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C32qBKGE0QUusIiXptH2AI2WKoe1GgkHNPdrOAYyoCCfoeNoYgEkl2xhR7jz0uKg+V+K8uYkSBMuHTvfIkRejnmOmTs/WD5zUgi2nvRmB5FX1t4f8S6nv48GjX02S32KNKD04TGim0US9E/MrJ7Hx5o/2AfrEanmVvJtxV0z3SG4TJJ6XG/3kGHlhStW1gUAe0iYAATIyO8YY1gxMRRoCxR+uApw9fTx1JAyhPuXVVg5QkBM73+GO6gzxIbSJYeis5VdG0sEDALt/0W5FgznH2KRfTou4d+mpVBaxAo2VeugPPbIleJSUFrbY2luDquzv2khgUdE0KAldSlCjzn9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPCBEPy5XAzV+Vd85dw/s0VEp7t0j50BXrmAnJ/dcqg=;
 b=M1urHxh6Mzzc+d2fDAM6UcK20I7A6JBrIBaiUYWPxSDCp/+N+rur+AXtUhJ3oL0cSl4MajwGqhdIHkZ6iHq3JDquyteAkMTog3t003u9ePMAfArPMGn3rJttyT1Q0tOnPjjay3y+TlKDGL4Zb0dF/R1cDxRm5vjQDAov50Nt3+zre+BFWWTnxJGBTm05JVAsb5xVML2qXofjSAfHGPCHOWfzR1MtP9qJVzu+ZpOZ50J7IwUst2ajAY98DEndCO+jNfSSBgFKPzwFgSVUutCuoLzyYH5PUxYIi2o1L3clZSblTqQ3hdDIAlVA5QxSaa/SJfSg+Pmg7EMzj6ESaDG3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPCBEPy5XAzV+Vd85dw/s0VEp7t0j50BXrmAnJ/dcqg=;
 b=kzQBL/TUOLqWju5MwRXzbUlvrnAXphvMc/burfS8uthZFgKzyjLmUNSX4EyTsXk4/SecGoLgzMqCyjXK7Qqijc6JkXKUU+CBGsAGYz4nWwaZtkVpnTq8V67P15Qvg2SAcH3NnR6aRjEsE4zTrFLDdoMMoad2PzMxlh2y1dCCphg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1264.namprd11.prod.outlook.com (2603:10b6:300:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Wed, 23 Dec
 2020 02:23:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 02:23:41 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libcap: update 2.45 -> 2.46
Date: Wed, 23 Dec 2020 10:23:25 +0800
Message-ID: <20201223022326.231003-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0186.apcprd02.prod.outlook.com (2603:1096:201:21::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 02:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 732095a0-0344-49f4-5651-08d8a6e9c389
X-MS-TrafficTypeDiagnostic: MWHPR11MB1264:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB12643A3705136888BA53F6FDF9DE0@MWHPR11MB1264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uYtNVTDmxJZR4pvG9Gekt97dcrdkFAgktrh4+YIByyePU00pIz7UAPImSKCXAvA77yIF/aZykyCsDUcoTuhXMV4O3py0pS7e8FVZORCn/qjc9mT2rbOBONhO0i20uRYJVv6SEAat+ftr9/IuhCSZPiAWinsFxkR9zI66GPd4Sb4Fcwdev7kblH83e1WtRczrrmac73hgyLSHYgmYpYfW4vtxWJsxgGDheAKYvwXSZOLeK5m7LDLWYcDMBzka6HYiHMkZCcZnq8EbRyQpmBLgxuTMiaXfMJd8PPhCIivYdUQvQKWz2lQyzdBT238DBEt+V0bhG0A9cwFr9aV5+kGFfbuA62FtEM53o3wanCSq6Qzj6pkrPP1ybX46SVQYu6QO6YXsenZiFYvwPURBcCcLcTVUGCXHstzl8/4d8f9QsnoIoiB2BBppbcW757dxqWOD7434LajMZxCppVw9ZMlZvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39840400004)(346002)(366004)(376002)(53546011)(44832011)(5660300002)(1076003)(956004)(2616005)(6506007)(186003)(16526019)(52116002)(6512007)(6666004)(2906002)(6486002)(26005)(8676002)(66556008)(66476007)(66946007)(15650500001)(83380400001)(478600001)(6916009)(36756003)(8936002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+5T9VpepkhFy0bl39xP9BcNvNRCZGr2MArAzD4o6cSUjqYCma/euwJOI7Tzy?=
 =?us-ascii?Q?EPoHLYQk0wgYVSmjDDQrBdHg9HcvDpDf2CR05RbfYcKN1eSv+pltMk3F0qrV?=
 =?us-ascii?Q?yNkSa4Lq2QFQRx2G7vlefiZ3Bm83AqUWvhb21sPWdN0htJYiUns6qFaqvbvP?=
 =?us-ascii?Q?skqE/sLlwMSkUm2eCDMuiLEi2xcbkaYA7hVlTMA33qsBgeutPUtnkVa3JTH+?=
 =?us-ascii?Q?IiTrHsWezNAJ+TRyPv3SyIGcAfyuvLfZQwWRUNYEFmsfV6wLVbyoW8KLs4gB?=
 =?us-ascii?Q?lig65W6rlZA7jFQWlW8Li1QA/0DHsjrZ3HR9W7MW3+xNVGpR0Du3S/cSJpJs?=
 =?us-ascii?Q?8Zbiur9LR2CMcbjFbyZJGCh+3BvF+3QD8z2um4Hr/zudxxLPxa4oSHqhW/wH?=
 =?us-ascii?Q?ir536hlLRxgGtvyl8HwT2V+fFy6Pn7xGU/CFi3WIu8YaNC0lbkqybUANBUhZ?=
 =?us-ascii?Q?U2fyAf9G7jhQk6qo0NX+rBE4YsxCiRQ8xe61UlGi3RSpnf0GMNWcwJ0MRE4K?=
 =?us-ascii?Q?ONGPgUshf0oA5/2OI2CdfcWHZIYn/L8KqjIf1uBc6JwIJHosF4AUTHAg00lR?=
 =?us-ascii?Q?ZPjTJkVJgYvp5G167WArdPnT+qlwHjt7rxygbny3EGiLiKDTqFo2eMxxLnTK?=
 =?us-ascii?Q?HYrFex+xE1o9yiw5wJ0oKXXryWUkSekNDOIypPPSEsEqpRQkth4/nOGJLHxV?=
 =?us-ascii?Q?IWu0XD8gUHa6FZ1YuX1XZ0m224grEY3TfFkxnsE4CVtHsT/2mZj2Xb5O3XRa?=
 =?us-ascii?Q?cxVMVj2QYjv5xMR0Ouc6SV6VtS6d55wuGprRdU07/d5UvuNYhrSfaQutCr8P?=
 =?us-ascii?Q?5FMyZCkHn9t6CfntXeRBJ3YNi099ePm17a176XV/XTcSM8oImMUaRcKbRgt2?=
 =?us-ascii?Q?42HUJzLx4f2TYpbBdeanYhFzu8zZpKcnvEy8L1Spgf2bY871ZmNA9V15bEe6?=
 =?us-ascii?Q?1mYR9nlWcJOoCoxpY81UR8jKuS8qyEdaxJ98OHIxOcRFJb53MaSvD/3AoY5Z?=
 =?us-ascii?Q?u89F?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 02:23:40.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 732095a0-0344-49f4-5651-08d8a6e9c389
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJ4jAXHvhfN1jthZHBZoUJ1unau4PglmxKXuE9bkFxv8SfjYrVoo+Ck4MGEqWJujk/9aI/6bAOtTiQkk8T/ygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1264
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Rebase 0001-tests-do-not-statically-link-a-test.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-tests-do-not-statically-link-a-test.patch     | 10 ++++++----
 .../libcap/{libcap_2.45.bb =3D> libcap_2.46.bb}          |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.45.bb =3D> libcap_2.46.bb} (9=
6%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically=
-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-st=
atically-link-a-test.patch
index 3c737b884e..d2653afb75 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a=
-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a=
-test.patch
@@ -1,4 +1,4 @@
-From c22c6c16362c7dbc8d6faea06edee5e07759c5fa Mon Sep 17 00:00:00 2001
+From 6aa15fe548e5b1d6ca3b373779beb7521ea95ba9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -7,7 +7,6 @@ This fails on e.g. centos 7
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  progs/Makefile | 2 +-
  tests/Makefile | 4 ++--
@@ -27,7 +26,7 @@ index 1d7fc7a..37db8f7 100644
  sudotest: test tcapsh-static
  	sudo $(LDPATH) ./quicktest.sh
 diff --git a/tests/Makefile b/tests/Makefile
-index 3431df9..727fb86 100644
+index 01f7589..094ec57 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
 @@ -22,7 +22,7 @@ ifeq ($(PTHREADS),yes)
@@ -36,7 +35,7 @@ index 3431df9..727fb86 100644
  else
 -LDFLAGS +=3D --static
 +LDFLAGS +=3D
- DEPS=3D../libcap/libcap.a ../progs/tcapsh-static
+ DEPS=3D../libcap/libcap.a
  ifeq ($(PTHREADS),yes)
  DEPS +=3D  ../libcap/libpsx.a
 @@ -106,7 +106,7 @@ noexploit: exploit.o $(DEPS)
@@ -48,3 +47,6 @@ index 3431df9..727fb86 100644
 =20
  clean:
  	rm -f psx_test libcap_psx_test libcap_launch_test *~
+--=20
+2.17.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.45.bb b/meta/recipes-supp=
ort/libcap/libcap_2.46.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.45.bb
rename to meta/recipes-support/libcap/libcap_2.46.bb
index 067ba32d99..605a738127 100644
--- a/meta/recipes-support/libcap/libcap_2.45.bb
+++ b/meta/recipes-support/libcap/libcap_2.46.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/linu=
x-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] =3D "d66639f765c0e10557666b00f519caf0bd07a95f867dddaee1=
31cd284fac3286"
+SRC_URI[sha256sum] =3D "4ed3d11413fa6c9667e49f819808fbb581cd8864b839f87d7c=
2a02c70f21d8b4"
=20
 UPSTREAM_CHECK_URI =3D "https://www.kernel.org/pub/linux/libs/security/lin=
ux-privs/${BPN}2/"
=20
--=20
2.25.1

