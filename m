Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25587C28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 04:59:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1782.1741669156049615750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 21:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165e225bd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B4fTXw021564
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:59:15 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8txv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:59:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Mar 2025 21:59:13 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Mar 2025 21:59:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] man-pages: 6.11 -> 6.13
Date: Tue, 11 Mar 2025 12:59:11 +0800
Message-ID: <20250311045911.3023271-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311045911.3023271-1-hongxu.jia@windriver.com>
References: <20250311045911.3023271-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UZOHu-7HPrigTjvbpALg7xrWJt6i70XK
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67cfc323 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=GBO-VVgQYJ-7CpALUlkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: UZOHu-7HPrigTjvbpALg7xrWJt6i70XK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=988 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503110031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212541

Changelog:
============
-  Build system:
   -  PDF book:
      -  Add support for UNIX V10 sources.
   -  Makefiles:
      -  Don't pass an escaped # to grep(1).  Use a trick to work with
         both new and old systems.  This fixes a regressions in the
         build system from man-pages-6.11, which was itself introduced
         while fixing a regression introduced in man-pages-6.10.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_6.12.bb => man-pages_6.13.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.12.bb => man-pages_6.13.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.12.bb b/meta/recipes-extended/man-pages/man-pages_6.13.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.12.bb
rename to meta/recipes-extended/man-pages/man-pages_6.13.bb
index 7c79e71704a..a2e6a898432 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.12.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.13.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "23c6817f89b481c8ae2232a523ce66c06e5cc5b41873bb6675318777155d6a89"
+SRC_URI[sha256sum] = "869a682be64ee634149f62b4bcbd8334fd1e400883181618d7164a43de6a3aa1"
 
 inherit manpages lib_package
 
-- 
2.34.1


