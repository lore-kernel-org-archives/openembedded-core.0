Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79631C25B78
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 03:26:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5273.1716953171466259427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 20:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=687902d2dc=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T3LL2I019476
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:26:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5kq86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:26:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 20:26:09 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 20:26:09 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/1] git: 2.44.1 -> 2.45.1
Date: Tue, 28 May 2024 20:26:08 -0700
Message-ID: <cover.1716953051.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ywil5GuNHZPX7Xs9fE8Ys7P2EruOwppC
X-Proofpoint-GUID: ywil5GuNHZPX7Xs9fE8Ys7P2EruOwppC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=754 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199981

From: Robert Yang <liezhi.yang@windriver.com>

* V2
  Rebased to latest master

* V1
  Initial version

// Robert

The following changes since commit aec96b5aec8d6b4a5ae8a719ca05bb727a6197cb:

  selftest/rust: correctly form the PATH environment variable (2024-05-28 15:08:59 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/git
  https://github.com/robertlinux/yocto/tree/rbt/git

Robert Yang (1):
  git: 2.44.1 -> 2.45.1

 ...mak.uname-do-not-force-RHEL-7-specific-build-.patch | 10 +++++++---
 .../git/{git_2.44.1.bb => git_2.45.1.bb}               |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.44.1.bb => git_2.45.1.bb} (98%)

-- 
2.44.0


