Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE04C41513
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 05:33:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4364.1718170392069844295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 22:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6893383dff=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5Ho8Y023619
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:11 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme963ed2-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 22:32:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 22:32:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] fmt: Add it from meta-oe for ccache 4.10
Date: Tue, 11 Jun 2024 22:32:54 -0700
Message-ID: <c45b0dfd57c10bf1a1ad528e48ca5e4dfa73ad76.1718168026.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718168026.git.liezhi.yang@windriver.com>
References: <cover.1718168026.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GxysNZfd-mFxlndWCv-0gh_Pgt0-s94C
X-Proofpoint-ORIG-GUID: GxysNZfd-mFxlndWCv-0gh_Pgt0-s94C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200564

From: Robert Yang <liezhi.yang@windriver.com>

It is required by ccache 4.10, from cmake/Dependencies.cmake:
find_package(Fmt 8.0.0 MODULE REQUIRED)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-devtools/fmt/fmt_10.2.1.bb  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/fmt/fmt_10.2.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2977ca54f1e..42599267c1c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -176,6 +176,7 @@ RECIPE_MAINTAINER:pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-fmt = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-font-util = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-fontconfig = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/fmt/fmt_10.2.1.bb b/meta/recipes-devtools/fmt/fmt_10.2.1.bb
new file mode 100644
index 00000000000..1437eb48034
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt_10.2.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "open-source formatting library for C++"
+DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
+HOMEPAGE = "https://fmt.dev"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
+
+SRC_URI = "git://github.com/fmtlib/fmt;branch=10.x;protocol=https"
+SRCREV = "e69e5f977d458f2650bb346dadf2ad30c5320281"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.45.1


