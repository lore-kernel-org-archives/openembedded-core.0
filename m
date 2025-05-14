Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7386C3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:17:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.96724.1747207027398658189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 00:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72290b1e6d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E4oG1c014178
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:06 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8rpgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:06 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 00:17:03 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 00:17:03 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH 0/2] coreutils: Fix issues for ptest + single-binary
Date: Wed, 14 May 2025 00:17:02 -0700
Message-ID: <cover.1747206852.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aYR10hNwa3M_b_sa_jzgUuV-IVR-aToF
X-Proofpoint-ORIG-GUID: aYR10hNwa3M_b_sa_jzgUuV-IVR-aToF
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=68244372 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=r_3n9pMatl4q4EzWrvIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2MiBTYWx0ZWRfX52R93GPKBieO OGNnBF1DgLaYu6dmdeaP/ikq+XF4vuYkg6d25GOteVYpxLVie9rlqF4AlSLmPDKSjN6p4vwHCZO oTpzZ6LCfMgKBN0d7RSd03Ig+i4xPorZyFZ2Pq8EDvtmfbN3K4ymUha6XTa/9s6BUBwwqFlWSR1
 UsCjqm+vReiM7rtofyfJOWUmR6nEThSoMUqEreh8NAzz0VYG/M9oyUlo+KYjm73zuwqClVxHz62 HQeMxyPlKGsh0nXmWIqgTicSkkcm/VkDSdiFKdD2sLry6saTFdDAP/jcIQenb7pMF2wKlqWi6I4 db/fsUHEhquhhQzs36HAp4PfMbWDUA2AxWqRXJQ44PhaAc+M4GhsyYEtuwLS7yunPh9YpRo+fjj
 ZZitBxHR/u3Iq68JY0onM10BZQIWrXvXGcGV7oScHf4DnQMX+1NoThIR7CsxJ/HW9xgwNilI
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=602 priorityscore=1501
 clxscore=1011 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216479

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit c695edcc33ecd5bc01b5fc91ce08a87475a9ace9:

  linux/cve-exclusion: Update exclusions after kernel update (2025-05-13 10:32:39 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/cu
  https://github.com/robertlinux/yocto/tree/rbt/cu

Robert Yang (2):
  coreutils: Fix file-rdeps for single-binary
  coreutils: Drop 0001-local.mk-fix-cross-compiling-problem.patch

 ...local.mk-fix-cross-compiling-problem.patch | 26 -------------------
 meta/recipes-core/coreutils/coreutils_9.6.bb  | 12 ++++++---
 2 files changed, 8 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch

-- 
2.49.0


