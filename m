Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A26C87FCD
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 08:12:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14756.1753431146706488815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 01:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9301b4d876=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56P5a5U32865407
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 01:12:26 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4842xm84jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 01:12:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 25 Jul 2025 01:12:24 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 25 Jul 2025 01:12:22 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] git: upgrade 2.49.0 -> 2.49.1
Date: Fri, 25 Jul 2025 13:42:11 +0530
Message-ID: <20250725081211.2163635-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA2OSBTYWx0ZWRfX/E91PWJ/zirN
 rCoYhZHdL9fRQlQc0VkB1xhCCALBDuDTV7EFAfre8Vipiw9qn9CvJqYIzJ3kxVJhWws4nqmo+1n
 622SHf59ogi1xsBfHHT2gelu3E6UMyUCBoNUQPEdb0+0IuVCuXXmgBqneLAjjv7VOMR+LwL69hd
 gsh3wFaBmrlutYRXxXBa2ACtKuYh/MUolFPfzgkqFy7Y3iR31xSHfdpRXYQEpT1CxaVR2P0LW5N
 RP1tBYWEE2j5TBcEHiuh7M+zoTSocVxxG0R5+cpx5EJfeAQ5oMJLqsq2oKsYyAzHHGFEc3Lz5NN
 KgYISLvx5aGiKPOEC+XRYWSxiYa/aEB9wbyYCx+8bS58eWLPlKluRdzggHwvEuhFrIFsVesvaFB
 h7BOMUIY
X-Proofpoint-GUID: zy41VHHXF_44hXu7gJx6grRUo6yX2O4h
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=68833c6a cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=9l0yIatMPKDccmscLj0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zy41VHHXF_44hXu7gJx6grRUo6yX2O4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 08:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220900

Git v2.49.1 Release Notes
=========================
This release merges up the fixes that appear in v2.43.7, v2.44.4,
v2.45.4, v2.46.4, v2.47.3, and v2.48.2 to address the following CVEs:
CVE-2025-27613, CVE-2025-27614, CVE-2025-46334, CVE-2025-46835,
CVE-2025-48384, CVE-2025-48385, and CVE-2025-48386. See the release
notes for v2.43.7 for details.

It also contains some updates to various CI bits to work around and/or
to adjust to the deprecation of use of Ubuntu 20.04 GitHub Actions CI,
updates to to Fedora base image.

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.49.0.bb
rename to meta/recipes-devtools/git/git_2.49.1.bb
index 3538170d08..2b310ded7a 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.1.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f8047f572f665bebeb637fd5f14678f31b3ca5d2ff9a18f20bd925bd48f75d3c"
+SRC_URI[tarball.sha256sum] = "84a8383ffc77146133bc128a544450cf8ce5166cbea5056c98033d2f0c454794"
-- 
2.40.0


