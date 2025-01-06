Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72D5E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:02:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.54995.1736150535160655509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3101b0e108=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5067i3sX028109
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jan 2025 08:02:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xt70hk6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:02:14 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 6 Jan 2025 00:02:12 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 6 Jan 2025 00:02:12 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] fmt: 11.0.2 -> 11.1.1
Date: Mon, 6 Jan 2025 00:02:11 -0800
Message-ID: <cover.1736150475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Y2vOCKr78LV6M0_5TWoQRu-MSJ1gYi7b
X-Proofpoint-ORIG-GUID: Y2vOCKr78LV6M0_5TWoQRu-MSJ1gYi7b
X-Authority-Analysis: v=2.4 cv=T/l2T+KQ c=1 sm=1 tr=0 ts=677b8e06 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=n75kiiddQCLonNacur8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=651 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209421

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 06f72780010ea628ade2c3838a05c5966750cc2e:

  linux-yocto/6.12: update to v6.12.8 (2025-01-04 12:34:01 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/fmt
  https://github.com/robertlinux/yocto/tree/rbt/fmt

Robert Yang (1):
  fmt: 11.0.2 -> 11.1.1

 .../fmt/fmt/0001-Get-rid-of-std-copy.patch    | 52 -------------------
 .../fmt/{fmt_11.0.2.bb => fmt_11.1.1.bb}      |  6 +--
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
 rename meta/recipes-devtools/fmt/{fmt_11.0.2.bb => fmt_11.1.1.bb} (80%)

-- 
2.44.1


