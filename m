Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B8BEDEC0D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 04:54:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11606.1772600058990179062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 20:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oUpJono/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244BngF1927033;
	Wed, 4 Mar 2026 04:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xSGqQoa5s
	FUF+F6MN1xdIM4aIoF9+6A0aSHK6Dighrs=; b=oUpJono/6lZxp0glPbfBrj4ug
	NBdUf3ib8xSnuAUKiF14YkO5MCv2MFm/Bz9bwkCnRunu5xF7YwLDmrJ2b0bL+XHb
	0u8N/CCh4+/ZW+pq1MWcz8sVDRmbbkP1nhE3ior17UzOk46Ryq30cTyU8CMRLWqp
	839DxCUPYUGaEw8TNfIEn3y/zZpKQcGLNoMtV3BJxWqdiMWGB5QE2aaquYE/Vjl9
	KNghocG7IVN2AgKVxyBtwZtgI9mmkul5qY3ycb7j8cXTiIV3wEAdawcGqCLoTXOf
	SL9YEsRDkKXb30uc2sZVYMq0AVMKytgCcTjhAA4B69s3P47H+dhoP2xveLFww==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvmqyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Mar 2026 04:54:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Mar 2026 20:54:15 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Mar 2026 20:54:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 1/4] python3-setuptools: upgrade 80.9.0 -> 82.0.0
Date: Wed, 4 Mar 2026 12:54:10 +0800
Message-ID: <20260304045413.3265198-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5xmPNlCpo17akUJXp-7aklggy2p-nUBi
X-Proofpoint-ORIG-GUID: 5xmPNlCpo17akUJXp-7aklggy2p-nUBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzOSBTYWx0ZWRfX0sH0rLx4+6oq
 mSfmH6Vm2gudGvNGZPID3/mmWspzBjaby4WDhEbAjMrMBWtGzBlaUj6y+/tgMjakh/hn7Tv6iTF
 HAR4qddYaVhOPP2oSV4sMhKum/D63EbYdAWNfH9H0n15sgSiMrkZV/ISYvb/B3kWxnuZR850ETJ
 5BJB76iQEF69PSoz3rTe1SY07YGWCZ+DE8/Rwddi9JL3TiJLaoNxiA5NCIpHsizjv8lPGvJ8xXn
 f6Yw0YwcgAf/5PdbHPJYYw1l3VPOf6VZ6MbYwjbbzdsJInr3DSnbZNecL3qRcgwfISa8CoaQJ2B
 6vxERuV5gc0n0hqmmD/UE0UJ1qrLqLaeoSQDzZ74If3IfWIZR0L1oCy8M5FM5FeaGQ7oI+VFymu
 Ffrk52M3uV01nJmBS/+v4TZNTFTs9jruM3Dx/bRLnj9Id5BIAffhI9G+Ayb8qIxzw9LmH9+fovB
 j3waO3lDFpK6q7Ms7rw==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a7baf8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=dXvAoEkxAAAA:8 a=t7CeM3EgAAAA:8
 a=oVtzlKGHyP3OGEvHIPwA:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232346

Remove python3-pkg-resources

History v82.0.0 [1]:

Deprecations and Removals
- pkg_resources has been removed from Setuptools. Most common uses of pkg_resources have
  been superseded by the importlib.resources and importlib.metadata projects. Projects
  and environments relying on pkg_resources for namespace packages or other behavior
  should depend on older versions of setuptools. (#3085)

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ysconfig.py-make-it-possible-to-substite.patch |  2 +-
 ...ols_80.9.0.bb => python3-setuptools_82.0.0.bb} | 15 +--------------
 2 files changed, 2 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_80.9.0.bb => python3-setuptools_82.0.0.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 39153883b0..0fc5e3f134 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From e2eab8c254f16c461de25123f6859b8a18db5cd8 Mon Sep 17 00:00:00 2001
+From cb37237fd60689ccf999689ff60acabe8e1ec1de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
index 533d8ce3d4..40687ea7a3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
+SRC_URI[sha256sum] = "22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb"
 
 DEPENDS += "python3"
 
@@ -25,7 +25,6 @@ RDEPENDS:${PN} = "\
     python3-netserver \
     python3-numbers \
     python3-pickle \
-    python3-pkg-resources \
     python3-pkgutil \
     python3-plistlib \
     python3-shell \
@@ -38,18 +37,6 @@ RDEPENDS:${PN} = "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-# The pkg-resources module can be used by itself, without the package downloader
-# and easy_install. Ship it in a separate package so that it can be used by
-# minimal distributions.
-PACKAGES =+ "python3-pkg-resources "
-FILES:python3-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
-RDEPENDS:python3-pkg-resources = "\
-    python3-compression \
-    python3-email \
-    python3-plistlib \
-    python3-pprint \
-"
-
 # This used to use the bootstrap install which didn't compile. Until we bump the
 # tmpdir version we can't compile the native otherwise the sysroot unpack fails
 INSTALL_WHEEL_COMPILE_BYTECODE:class-native = "--no-compile-bytecode"
-- 
2.34.1


