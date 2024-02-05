Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02261C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 09:01:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59241.1707123710322698889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 01:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J9dW6Cq1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2765499117=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415902nK002870
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 09:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=5b30e
	vakV7iuwblvdX6l69F/nKmDSjN+hHcl3J0laMQ=; b=J9dW6Cq1EpLpH/cs9pcIs
	K8Cxdw3jRPMPoz1x2MZufLLx+jl9JbJnMgZU6B7u5YTlWNrLRYEe5URxMO6Ea93p
	RYSYhXAdqZNeWqOAYscS8QNRLrG2hP60cTqF8mim2iaA1kAPIZ9poEy36bMaDluf
	sCQSBX6A0537Okcxp8YAUAyDo5Z1AHNVWntdRR0K5Uo+eSp4Z/ioc69FmH/E6q/3
	CGh2TmW2vt6HAQmBD1/Hocl2JZZKx/uF+1PpYmDA3HzSy3KrtWUO0wSoWTWQBGG6
	6mAEzi/AjqYBdIxc4MHuWcQwJy0yZ64E5ngD+18fHdq/myPDOZhmtS9YmjpzIibe
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs79m68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:01:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 01:01:48 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 01:01:48 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] meta: Upgrade gnu-config and strace
Date: Mon, 5 Feb 2024 01:01:46 -0800
Message-ID: <cover.1707123654.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IqX1x_oTsoLpHhw1xIsoT1266rCVONF1
X-Proofpoint-GUID: IqX1x_oTsoLpHhw1xIsoT1266rCVONF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 bulkscore=0 mlxlogscore=711 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194922

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 97b5d0c85af0b667854eea90ace0a8c2f51ecefe:

  rpm: add missing dependencies for packageconfig (2024-02-03 21:52:15 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (2):
  gnu-config: Update to latest version
  strace: Upgrade 6.6 -> 6.7

 .../gnu-config/gnu-config_git.bb              |  4 +-
 ...toconf-macro-to-detect-largefile-sup.patch |  7 +-
 ...001-strace-fix-reproducibilty-issues.patch | 10 ++-
 ...002-tests-Replace-off64_t-with-off_t.patch | 36 ++++++----
 .../strace/strace/Makefile-ptest.patch        |  8 +--
 .../strace/strace/ptest-spacesave.patch       |  6 +-
 .../strace/strace/skip-load.patch             |  8 ++-
 .../strace/strace/update-gawk-paths.patch     | 69 ++++++++++---------
 .../strace/{strace_6.6.bb => strace_6.7.bb}   |  4 +-
 9 files changed, 82 insertions(+), 70 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.6.bb => strace_6.7.bb} (93%)

-- 
2.43.0


