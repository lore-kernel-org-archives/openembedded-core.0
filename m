Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E438BC3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 10:22:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11048.1746786152799856257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 03:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224ebccee=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54950Kou029334
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 03:22:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjxyd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:22:32 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 03:22:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 03:22:30 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  1/5] perlcross: 1.6 -> 1.6.2
Date: Fri, 9 May 2025 10:22:24 +0000
Message-ID: <20250509102228.3422688-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEwMCBTYWx0ZWRfX2i31PJoE3ANw hqCZPYrI2+aewh1mMbSnZXztxNq9nPWFca21UbC+EI9MbLYTWK5mQC5C05faHo9L4zBiOe0ytuL QkV6WM4oefwRMXQdMYCpZerjzOU9nTrncF3C5bBbu6ykdOQnBrdD+KwechDIEP+/MbgtyDgIAW+
 V9WiYQJNW0oQLzyBxAsTVkUTzKZCGR51WzNEO0XyJbb2whYWEwOtn4YzS2QNQwFC9UnRsWPqod4 GZYyckGGZ8tYOJb5fVxN9Sgea/6TATlgh9jYJoZQDlgqX2ZIq50eu70giyVdns/AXzZMUxeikZ4 GACfbm3W9qBgVfPZavFdUuhndVa/xCVI4rfW0F+wVT1Ykg5/KgaY6i0f0+QE09ADKFP/BYlnvvT
 xE5RcSrQO91O6LavIgqdjU8Bu0XIS0AXbe0DfK13U+qA26ZvZuvKF3dfr022d+kRZXewFPgK
X-Proofpoint-ORIG-GUID: x1rfK2n7pkdKLIn8tG8PkBSGnHOuad0b
X-Proofpoint-GUID: x1rfK2n7pkdKLIn8tG8PkBSGnHOuad0b
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681dd768 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=NTMw5P6yZUwW3rI8E4gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216192

From: Archana Polampalli <archana.polampalli@windriver.com>

Provide support for Perl 5.40.2

https://github.com/arsv/perl-cross/releases/tag/1.6.2

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 34d9236cab..42ba15a572 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
+SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.40.0


