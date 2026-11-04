Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11732.1793806095137898374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ve34GhWm;
 spf=pass (domain: est.tech, ip: 40.107.130.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULViIQCNTvuw1TSiUXbnYXAecIjY1wuvCrnWkpFbDeH3TJ0arUYmgt6nyf7WQpty+dZwKKgrplSZ1q9FRv96awJSjkjIH7Gan1De5dGq1qDNg3PFQHD71Bwf1m2liyu3ChJSDqu2ClGy8DbALWxOil9ktpUK2yRGHivug9mwtj+nWnmQdZ0fE9uA+raUAiiGsT5Izb/ZncwQrqosN8Of4gVM16LxVX2KDFQ0IE9Bb6VRFSgopT/N68LusSJHUdMcRTu8i774lojYZ47VrspH/bCqmzu01gsuzbjRI+Xz5aZnlJYqkg/ib03q7EqdowYyVn0X2Dt6LkHtVsN1NkuG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1iXrOH1jHIHJSvxMh6sTNLBUess9CNMvuRDWhSGFik=;
 b=hbR0cbNZZ+kKW7LUFWBLAbC52m3Jh8oUzCS6lWc5xdTzrF6jeQ5y0mqTw6vU2IUWQ3KpYc42Jfjo4jbLOSpXebyOvdAX4dHBXwbC52cRPoqNytulxXcIwPbsx9F7uzXvblxBiIqHn6omZSxmlpHi9tcfPbmU6Cmu9r1/gIKHhtMWkYO+gufUzBoxYQYRygB1OAP39NtEkgHPicbAuuiF1O9wEwk3j79Zd779uowFt+/dUaR2g2323TRVh4t88bVJmur3Yug4zmwp1URYyQiyLS02xSXsykxiOuNkfV+YEg/wGNtiHZeuS1MVqErHvlzxiHcarIix6zreKtLMrCUZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1iXrOH1jHIHJSvxMh6sTNLBUess9CNMvuRDWhSGFik=;
 b=ve34GhWm1F7ju2JLyY1LVcR9W0SIVMbTRuliF2dHSLEoPGbKmYByYH3jiP0Kv3CH32//ROUQDgnqeWc3LjwbUyw6w30HJRZ+FxatzH11nVOqwvdqPYyyoecgF0kMyq7ij9/TS2d9Q9Ld4dKaR7AGsnKgbHRHsXoePcKudWFY03RX5kULCUQKU3aATBKLYaeHR0gz2rRboQtUDGLBz9YM+BVy6NasAp7plmBkQMopG6XiM5UVqwo7+ZuEFnrYTloUTfaMsscT/vFHkcv26/N9gSoNEPU3SKrh3V6JOMs+SL8L9c/mQ6dnBSL5oz0HW6a64ZyqzglmmU0GGJK9aohGeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0810.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 15:28:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 15:28:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 1/2] python3-setuptools: Upgrade 84.0.0 -> 84.2.1
Date: Wed,  4 Nov 2026 16:28:07 +0100
Message-ID: <20261104152808.47533-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0810:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b75b79-31d5-44ee-3bbf-08df3a883be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261022105027099003|261102123227099003|261026121527099003|261022075727099003|261026140227099003|261028144727099003|261021121427099003|261009221227099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: Yw9osgMPp43XCbQpWbbvPYlXo0PGCUoVmPRuqvqpptZ2AKQuXnMh3LQqcG4QQADNzufGhmw6WbTLZKwwairR3xY/dxuP0R7SUdMpn2K0EctLkH8V7pa8BKAAsqpP7xzfNSJR6jRpfFKJ+cysPXJnwQuGJra7jK8bdWufa2SxfIhzQv4gkTWVSYutsJg3M7s6gJLiBAv4cqLxNzHu/Hz63QfSxEyiiw4KcubO+4lo15eVeDDLwJI8ejdv2myLm6HOMfD7dhnWEMVAPgzPA2BkhzI5HPATzwPqtNDMe2xABDRoWWz16yjZNnVWEorpr1ZMJiRM5lytwsZaRcBzQLratFOWqbtBtQVdZl1ekT7iG0xmxzrB2Kv9DB5QjJdCJrbpN0J4Ct6A1Uhf6paQ1yLxRnzusFgib9eYVbNL1iE2x0tExgQM+rcFTO+SHFVvScqlH2pQxw3+sVxzvtQw1EqD1L8C3sFQz5CQ4BB8ukv1oS6n1LwFhZeyWAij/dagc2DzjsmPqyh2uEf3EwOi5s0czMnqZyhBZSpLLr6rnsHqO9o7Cnfi3GD6YXA3ESQnP3maeKIqPLbIPL6fW6yj+lb90epJgm3v+xJs0T4OEutUVHYAqUprn4zbrn8xPv+1C8lC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261022105027099003)(261102123227099003)(261026121527099003)(261022075727099003)(261026140227099003)(261028144727099003)(261021121427099003)(261009221227099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DL3uk2caMMK4B2OV6wu0oTrZoLtB63b4YvXSWgn3ECQYoM/OpqW5paXK5St2?=
 =?us-ascii?Q?QL/13u1J2O2DtPgrr71XLkiLCOEkrh8am8fkLuDf8yj/lHVJ4KdZSS33Mejl?=
 =?us-ascii?Q?5cYiyXb26Y3uT1md5b05noTjtsclB1uor18Te15h6u7dr8nHAJ7K6xaLkoP9?=
 =?us-ascii?Q?qAoGGYxLxv57fj21VQ+LF5pWcpdoRT9CgHSYElHwA8akY9lg98YLd+KA+Yxj?=
 =?us-ascii?Q?/z6S8X4t7Tzh7qN4ugtWAYHHTQocsbYKQ896ugqFG26hD+yafZFIFYNNW8Wq?=
 =?us-ascii?Q?kpiDgSPJSKJOKIrB9UxVq7F/dzayj3bNQf3T8JowmHy8scyQXOfmaUnGozC9?=
 =?us-ascii?Q?z7M7jRSP2o0EmAyneSV3BkAn2r0lpm+PvFIh2kS2Qceoxr64XreWDONNMnQ1?=
 =?us-ascii?Q?7coKihQEtY3mSzR3cl+HBYvqU8cT/USbnfNmfE5PQLKe/ohn4qGXB8PwceLF?=
 =?us-ascii?Q?fn2I1EEr+JwrmkKy9Xd0Nn5b85UltVVFWX9CmZObpyK4hTC5WAVj/mcmUQYn?=
 =?us-ascii?Q?hQ8TurAWOrnCSvTjhcr2mqW/h+M3UfIev4OrzIusbz1MS6yTebNoKTLALOMk?=
 =?us-ascii?Q?dV8n/4s68mo3MU+613eHurrgHSrybhwfs4QwuhYJuqjwiDPhCpTmdTt/Nh1V?=
 =?us-ascii?Q?dc/EsPvlBrzQib6zcLJjfQvvQXe1gcK0GTPBWkhSti+ndM6zd3F/g4jHKe9O?=
 =?us-ascii?Q?7ydha1CrIzC+sGta3mXDBALohBRg0mv92CEGjhMOoePbrJQ0wxWITgOQ8xUN?=
 =?us-ascii?Q?ZrPAtzkL8mQGykBu9panJlIERydiJ3ZGNqvABEusTzCaEEJEKjfYFd68QTSs?=
 =?us-ascii?Q?H3u001FTx3d9vNyIMO+vdfiCMEwsU/wnlYbsrS52H7zYYoz9wLEx/UiULAwF?=
 =?us-ascii?Q?DTqV71O7sxa1T+Lodx9RMT5gkSH87WmWtUP+TIHmukIAcZ+hgjDF2L90cunw?=
 =?us-ascii?Q?eQvHzqQCp5ume9NHfvzjehqltba2daLhxsNjMx8jvxaJ8Je/amR0A8HgX5NF?=
 =?us-ascii?Q?KddvXI/1Y/Sg4WCIETjFOJZjYSjF4MSd+qJPPSPD02o2B6FTqpzRKKJ6z9Tb?=
 =?us-ascii?Q?r6s/kiotRtAAACMyNnquPygLjQw7P4fXj8fN9HG1vmIL1GRli8vm2FaXC14d?=
 =?us-ascii?Q?SCJC3roqzR87/my1H0qbh5nFvUYF27Xbkmh2eGeDOtlpklfysmxNH922HV4U?=
 =?us-ascii?Q?BzZSvFSe01/+L6IcTfZ9YqC+VyTJqugHVeyDtj2EdqgxvNofUfWNC47skJ2l?=
 =?us-ascii?Q?SelCIt3IVjJSPfueqv0TsgfB4yuV2xzm9jX2SF9/2OWo5TkCNEYwAQq7x0cN?=
 =?us-ascii?Q?oeN2/MVxrfNrBKQZe+ZNTjInB3BPRdQvbYWtO7zDKlgWp3AhgUII20C6FUCD?=
 =?us-ascii?Q?RPBm5jF06B9DLlJLCQZZ1K9M8fzfZyStq5+7KvU2uG2S10TFoU2Y/XScEXg7?=
 =?us-ascii?Q?ux2nmY/P6l1H16x5qwb3E7sxeC+Daxluhgbjry/JwkKos9moViJEBRYsV6MQ?=
 =?us-ascii?Q?2IjOjaD9gQVQ+e9nW6A/+EWEJTFEi77DZAUzfxVdfStRxlmfUXXHTkvky3Wi?=
 =?us-ascii?Q?kA5hmiOhd7ylnftO5xcWciDMgFo1IDG2K0MGDnr/Yf0mHMnqhvQaPpt82qyN?=
 =?us-ascii?Q?pUZCZpsyWAcCKQpJv64APbmr2Myal3u04Ja2+JnGfR97YYS0ndVzx65NW5cZ?=
 =?us-ascii?Q?tvTyXBBRFdC10MzSN5+A23Z8TYRvReMgY27DEm/s29YtyMLtEAS62820DudX?=
 =?us-ascii?Q?KlKZJeiVIQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b75b79-31d5-44ee-3bbf-08df3a883be7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:28:10.6177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMKHzrcsaB0DO8UjMQCj+HNNFt3zdnkiMxAR5mWK9fxJbxjBllbwV8gbwvGXbs9uDA0yoEoYLkaKRvlhsrGqtd5q9YqEc5/uNc0rN2OjJYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0810
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249392
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://setuptools.pypa.io/en/stable/history.html#v84-2-1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ils-sysconfig.py-make-it-possible-to-substite.patch | 10 +++++-----
 ...tuptools_84.0.0.bb =3D> python3-setuptools_84.2.1.bb} |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_84.0.0.bb =3D> pyt=
hon3-setuptools_84.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutil=
s-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/p=
ython/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-s=
ubstite.patch
index f6313fb1a9..df9d5f77c3 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysco=
nfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysco=
nfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From fe651521b9d970a84432b37d2731932a4862deb2 Mon Sep 17 00:00:00 2001
+From dfebab446e3148e3ec170e06aa57b703a655f772 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
=20
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sy=
sconfig.py
-index 7ddc869..01a06af 100644
+index 4792b58..cf1fbc5 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool =3D False, pref=
ix: str | None =3D None) -> st
+@@ -133,6 +133,8 @@ def get_python_inc(plat_specific: bool =3D False, pref=
ix: str | None =3D None) -> st
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix =3D BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
@@ -32,7 +32,7 @@ index 7ddc869..01a06af 100644
      resolved_prefix =3D prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name !=3D posix
      os_name =3D "posix" if is_mingw() else os.name
-@@ -246,7 +248,13 @@ def get_python_lib(
+@@ -245,7 +247,13 @@ def get_python_lib(
 =20
      early_prefix =3D prefix
 =20
@@ -47,7 +47,7 @@ index 7ddc869..01a06af 100644
          if standard_lib:
              prefix =3D plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -261,7 +269,7 @@ def get_python_lib(
+@@ -260,7 +268,7 @@ def get_python_lib(
              # Pure Python
              libdir =3D "lib"
          implementation =3D 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb b/me=
ta/recipes-devtools/python/python3-setuptools_84.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
index 648b084a27..f2dd481835 100644
--- a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT =3D "python3-setuptools python:setuptools"
 SRC_URI +=3D " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substi=
te.patch"
=20
-SRC_URI[sha256sum] =3D "f4695c21257f0d9b537ec2692c941d02ee143b7cc127694134=
9a546573b2ef73"
+SRC_URI[sha256sum] =3D "3ff8b3b5492a0aa66960f4419365a86b84e013070d4313e4d4=
a6894f5d64d6bc"
=20
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
