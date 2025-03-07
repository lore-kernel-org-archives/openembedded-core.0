Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E32C282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 07:51:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6340.1741333875038087050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 23:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51617efc85=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5276K01T027548
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 23:51:14 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cs7u113-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 23:51:14 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Mar 2025 23:51:01 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 6 Mar 2025 23:51:01 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] minizip: Add new recipe
Date: Fri, 7 Mar 2025 15:51:00 +0800
Message-ID: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=DfbtqutW c=1 sm=1 tr=0 ts=67caa572 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=mdjDh3HbAAAA:8 a=fXms6y0vAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=QyXUC8HyAAAA:8
 a=AmFN4A9-ePsUM0OxjNgA:9 a=hjw_Cx-fSxMA:10 a=oWgShKPB4MB-ORB2x0Yq:22 a=c6Zb8eaUoX5VaqycxFvw:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 8CP1zs3C7mAG0qq2BpKdhjhR5-sRy0aQ
X-Proofpoint-ORIG-GUID: 8CP1zs3C7mAG0qq2BpKdhjhR5-sRy0aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_03,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 07:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212413

From: Mingli Yu <mingli.yu@windriver.com>

minizip [1] uses zlib [2] to support compressed archives.

minizip is not part of zlib, but is included in the zlib
distribution [1] as a third-party contribution in the contrib
directory.

[1] https://github.com/madler/zlib/tree/master/contrib/minizip
[2] https://github.com/madler/zlib/tree/master

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/distro/include/maintainers.inc   |  1 +
 meta/recipes-core/minizip/minizip_1.3.1.bb | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/minizip/minizip_1.3.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5515d46ca5..2bd2fbe3a5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -522,6 +522,7 @@ RECIPE_MAINTAINER:pn-meta-world-pkgdata = "Richard Purdie <richard.purdie@linuxf
 RECIPE_MAINTAINER:pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-mini-x-session = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-minicom = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-minizip = "Mingli Yu <mingli.yu@windriver.com>"
 RECIPE_MAINTAINER:pn-mkfontscale = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mmc-utils = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-mobile-broadband-provider-info = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-core/minizip/minizip_1.3.1.bb b/meta/recipes-core/minizip/minizip_1.3.1.bb
new file mode 100644
index 0000000000..c9c92ad6bd
--- /dev/null
+++ b/meta/recipes-core/minizip/minizip_1.3.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Minizip Compression Library"
+DESCRIPTION = "Minizip is a general-purpose, patent-free, lossless data compression \
+library which is used by many different programs."
+HOMEPAGE = "http://www.winimage.com/zLibDll/minizip.html"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=8eaa8535a3a1a2296b303f40f75385e7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "http://zlib.net/"
+
+S = "${WORKDIR}/zlib-${PV}/contrib/minizip"
+
+SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
+
+PACKAGECONFIG ??= "demos"
+PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
+
+DEPENDS = "zlib"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


