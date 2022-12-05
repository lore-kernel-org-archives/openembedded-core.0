Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264BEC47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 09:52:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11602.1670233914980067520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 01:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9338dafb6d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B59nK2q014382
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 01:51:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6s81f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 01:51:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 5 Dec 2022 01:51:54 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 5 Dec 2022 01:51:53 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] packagegroup-core-x11-xserver: add opengl to REQUIRED_DISTRO_FEATURES
Date: Mon, 5 Dec 2022 17:51:51 +0800
Message-ID: <20221205095151.3820258-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
References: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c2r-un4vXPvxrMn0UcgHIEMRu3z0vpgc
X-Proofpoint-GUID: c2r-un4vXPvxrMn0UcgHIEMRu3z0vpgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=853 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212050079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 09:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174280

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing RPROVIDES 'xf86-video-vesa' (but /build/layers/oe-core/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb RDEPENDS on or otherwise requires it)
  xf86-video-vesa was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'xf86-video-vesa' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['xf86-video-vesa']
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-core-x11-xserver', 'xf86-video-vesa']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../packagegroups/packagegroup-core-x11-base.bb                 | 2 +-
 .../packagegroups/packagegroup-core-x11-xserver.bb              | 2 +-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb    | 2 +-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 0185c93354..042b8cb30e 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -4,7 +4,7 @@ PR = "r1"
 
 inherit packagegroup features_check
 # rdepends on matchbox-wm
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 RDEPENDS:${PN} = "\
     packagegroup-core-x11-xserver \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index 3bb308fbba..32cecfb8a1 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -9,7 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup features_check
 # rdepends on XSERVER
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 XSERVER ?= "xserver-xorg xf86-video-fbdev"
 XSERVERCODECS ?= ""
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 9ca058b38b..341a76a02b 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -5,7 +5,7 @@
 PR = "r40"
 
 inherit packagegroup features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 PACKAGES = "${PN} ${PN}-utils"
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 6866a4d738..aa850ce955 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -10,7 +10,7 @@ PR = "r33"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
 
-- 
2.25.1


