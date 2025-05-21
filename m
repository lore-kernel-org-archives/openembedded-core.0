Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20BEC54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:09:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6056.1747814978926606441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236463a26=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5THDQ011938;
	Wed, 21 May 2025 01:09:33 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr9063-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 May 2025 01:09:33 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 01:09:15 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 01:09:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Peter.Marko@siemens.com>, <mathieu.dubois-briand@bootlin.com>,
        <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 3/5] man-pages: upgrade 6.13 -> 6.14
Date: Wed, 21 May 2025 16:09:23 +0800
Message-ID: <20250521080925.815334-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521080925.815334-1-hongxu.jia@windriver.com>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA3OSBTYWx0ZWRfX5PUgrHDtnmY3 fmlSx8VYWyh2c9DkCxi4ijOh1W3OLIZP9qZk5dRQqeCtTFaAGk6B3UgWvDNXKWoqKoaacK/MF/L pAGiHqYy9FvfgR42V94EJWz69whPBM4oJDGXOReD95c82o8/KnnHV+P+qcxZDYYi3eA6RxNZOEp
 D2Klr0LTWTWM2ikYreW6UFJLTDqU2C+gEevSgDB3p6zI19AI+EiF6LMApLsDXGfGm2H8VamBCxh ibprU27L5E2y7DGx8vChAK4FLLadxamKxqpWoKSjOvRVm7ZDyYMUj/wHZlyPXfP5HWgMdyCI0VQ GkfgCMxE6PJ/gEq0PVSVAL2DFxVIKclWsgjkB6EIWhT57BdqA8o+YWsUcqlxLEkArmw8WkNb9qt
 4eI6PdzWypXOhdZZKNoHzyJBFvEB+GDlB16/oB72zPhmYiIApEHp9KaKXu3yvpOw/WeKBL+a
X-Proofpoint-ORIG-GUID: tB-FTGL5STA_KL2XW4Z-hCWG3AMdRBa2
X-Proofpoint-GUID: tB-FTGL5STA_KL2XW4Z-hCWG3AMdRBa2
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682d8a3d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=z5HLka9z3RXT6Bu83WIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217003

See https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/Changes?h=man-pages-6.14
for changelog

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


