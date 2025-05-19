Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008A0C3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46127.1747642208826040288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 01:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=723466fbd7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J70bMx005894
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:10:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46phe8sp1h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:10:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 19 May 2025 01:09:53 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 19 May 2025 01:09:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] man-pages: upgrade 6.13 -> 6.14
Date: Mon, 19 May 2025 16:09:59 +0800
Message-ID: <20250519081000.2298461-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519081000.2298461-1-hongxu.jia@windriver.com>
References: <20250519081000.2298461-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1kiyrF_mjB0P1e3MT_sa3OKeJzEctGZ9
X-Proofpoint-ORIG-GUID: 1kiyrF_mjB0P1e3MT_sa3OKeJzEctGZ9
X-Authority-Analysis: v=2.4 cv=arGyCTZV c=1 sm=1 tr=0 ts=682ae75f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=z5HLka9z3RXT6Bu83WIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA3NiBTYWx0ZWRfX/Rv1Qk3fsGJk mghsJsHK8ocCvtSB13uiRBcc//I1H1jx550Z3TjoenZTmbjIRgKeMJT8UEClc5VNaHRnhTNGFL/ +5MFDktmQp0darNU5W3AguDaKJfbf2aQKtjJruzhYLTk1ndiN30xES1BH1wovslQ/tbK1tj+cq8
 /VFst6w/+XIRQlfJPP9uXGlM65vw/Y06JzFIBVq7Umz9RU9WrhRjDjnFz8JXv3as9kATCSDsmwI sCukC4D/4NEtkk0Ka+bwwP158VGfqfoAJSNUqCP4QCookashDrzacZxvEE0IjBYjrokWrQNOSAo 4emc2cfnS783MkWT4kwPvqvVow7ZK9/X97juBtVKQGJNPHUVJjTJVuXKxrQ8TXji3XzlOMPIwgn
 Fq+IxPg+9+EfdL8c6xV/3Mj/syBviVO4GJY19GYDR2YevyiZFoFsSFenK4fHHtlsJtk11K/u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=822 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505190076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216824

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_6.13.bb => man-pages_6.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.13.bb => man-pages_6.14.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.13.bb b/meta/recipes-extended/man-pages/man-pages_6.14.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.13.bb
rename to meta/recipes-extended/man-pages/man-pages_6.14.bb
index a2e6a898432..92afff640d2 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.14.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "869a682be64ee634149f62b4bcbd8334fd1e400883181618d7164a43de6a3aa1"
+SRC_URI[sha256sum] = "a298963d8baf37fa5ecd2b07c803e1f29ab0476add405a7e263e5c63baf43588"
 
 inherit manpages lib_package
 
-- 
2.34.1


