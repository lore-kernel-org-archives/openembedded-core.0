Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B78C021A7
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 07:14:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46029.1739776477328239107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 23:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4143913a06=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H5WcXu018496
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 23:14:37 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tuaq9a82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 23:14:36 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 16 Feb 2025 23:14:36 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 16 Feb 2025 23:14:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] man-pages: upgrade 6.9.1 -> 6.11
Date: Mon, 17 Feb 2025 15:14:32 +0800
Message-ID: <20250217071432.4144843-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217071432.4144843-1-hongxu.jia@windriver.com>
References: <20250217071432.4144843-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QLGSRhLL c=1 sm=1 tr=0 ts=67b2e1dc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=h3Hc2Dq96gfXVzXD3t0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kQu63Mi4ziP0uy0RhApZdrYDQ-vDzCdN
X-Proofpoint-ORIG-GUID: kQu63Mi4ziP0uy0RhApZdrYDQ-vDzCdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=872 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 07:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211518

1. Due to upstream commit [GNUmakefile: Require the user to specify
'-R' if their make(1) is too old][1], add option -R to make

2. Due to upstream commit [src/bin/pdfman, scripts/bash_aliases,
pdfman.1: Make pdfman a standalone program, and add a manual page][2],
inherit bbclass lib_package to use package ${PN}-bin to collect newly
added scripts and runtime depends on bash

[1] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=50c914d25b40ac6a4d63ce10ed146653098014a2
[2] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=ed9bc1e3277befd6e165270f14e458a5ec4074f1

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_6.9.1.bb => man-pages_6.11.bb}  | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.9.1.bb => man-pages_6.11.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.9.1.bb b/meta/recipes-extended/man-pages/man-pages_6.11.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.9.1.bb
rename to meta/recipes-extended/man-pages/man-pages_6.11.bb
index 8258874dd7..52a1fbda14 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.11.bb
@@ -20,9 +20,9 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "3ae3f8ad97487d2c1b14258231d97d03b4e569b915377f6dd4f6be7141c57ee0"
+SRC_URI[sha256sum] = "44c09f43ae7a0b327efef5285a30d56ecc5fd4a07056f77e806f6c65196ba7f3"
 
-inherit manpages
+inherit manpages lib_package
 
 MAN_PKG = "${PN}"
 
@@ -32,6 +32,7 @@ PACKAGECONFIG[manpages] = ""
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
+EXTRA_OEMAKE += "-R"
 do_install() {
         oe_runmake install prefix=${prefix} DESTDIR=${D}
         rm -rf ${D}${mandir}/man3/crypt.3
@@ -40,6 +41,10 @@ do_install() {
         rm -rf ${D}${mandir}/man5/passwd.5
 }
 
+RDEPENDS:${PN}-bin += " \
+    bash \
+"
+
 # Only deliveres man-pages so FILES:${PN} gets everything
 FILES:${PN}-doc = ""
 FILES:${PN} = "${mandir}/*"
-- 
2.34.1


