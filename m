Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AC0EDEC0B
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 04:54:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11613.1772600061919618723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 20:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QvMtSdub;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244ENuo3921402;
	Wed, 4 Mar 2026 04:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DWkhHv7r7XmidkaL6t27ByCMNyKcBtUSS8PbnoA6naE=; b=
	QvMtSdubob/PSOwTT3nwubkhq8Sr4eifAjGz4f/wkzGDBJDD/uukZJvFDatV+PLS
	Vy59OTwip/RXEdcRXDqtOjQPDCthxjeVOqgaBIzDJzT8ONQgXbPpvyCtAzlxBLnu
	ATD6Id7ZW8DKTWI8BI33bXb2Ys5hsk90oxOQvFxwvm5FvQbgn6SA+ILVMvqJBB9r
	ElDqAeMjRsW0DB5IY7mC0NxjLbI5eymAblxzD4Tg/23Fl7V/rercilijpqq+d5IP
	Dd6B899yfDYYWIIh4nzKm1zs2/3E0jJrwtEXr92PbHbuvhY9M4DPHbo/JA3J+vb7
	hxUXCku5kKFax8Juhx14UA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mmgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Mar 2026 04:54:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Mar 2026 20:54:18 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Mar 2026 20:54:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 4/4] python3-semantic-version: remove python3-pkg-resources from runtime depends
Date: Wed, 4 Mar 2026 12:54:13 +0800
Message-ID: <20260304045413.3265198-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304045413.3265198-1-hongxu.jia@windriver.com>
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a7bafb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=dXvAoEkxAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VXXJv6s23oOjpCapOVIA:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0oFQeDNRL01v7BkWsAl0ZSVflDwjl6yl
X-Proofpoint-ORIG-GUID: 0oFQeDNRL01v7BkWsAl0ZSVflDwjl6yl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzOSBTYWx0ZWRfX99PPPFRRWvn6
 +XkVVK6wXZsk03dmmJyLDaBmIASi31nDM4F+mG15bpy/C/WuS36oV1CNw+vQpgv74vqygoD8xAv
 0x72BqjIvr/HQkOUTwmkZZnUo9JaU88z1LHFDSNs2SLyd3PqWx4u47CzXhivohQAWD8Jg1Wr9fb
 Gd1PkXbtqvWENgg/qDCLQTdEVZeGulz2JD4ST0t6P41AWCwd0oGBgKGS1pA17+HVp+mSvu3WJ1u
 bsHtXl0U48Sgf/BuKmBUtTOiaas/wA1HoGoZKkWguQsyBIMA/6QHk44qyS0U/kpC3XLafEpXx1j
 4XTgQ+5UTYTFEiWove0vRE8JtJb56G4wPELnb03CWdoWJs6jXKQN2jlpSkB7iGsEcBEFiZqHnBn
 IAxnAIuGX+Ui9eFZfR1kmp79z34c+utDjF6shCaSFrTBecokPkKcUXeAaRiCZA21wEcgGdawD8Y
 pTQV+UbJnXK6gIl8XZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232347

Due to setuptools removes and deprecates pkg_resources in 82.0.0 [1],
python-semanticversion import `pkg_resources` conditionally for Python 3.8- [2],
because we have python 3.14+, then python3-pkg-resources is not necessary
for us, remove it from runtime depends

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
[2] https://github.com/rbarrois/python-semanticversion/commit/306fbe1b2222d218c62c2ddb32d91eeea8957951

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-semantic-version_2.10.0.bb                 | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 78763a911e..01eb75f10d 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -11,9 +11,5 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += " \
-    python3-pkg-resources \
-"
-
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


