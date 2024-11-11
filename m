Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBD5E6781D
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 15:39:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.62251.1731339530699878559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 07:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045fc21af=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCTUob010713
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 07:38:50 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84psm1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 07:38:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 07:38:49 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 07:38:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] Fix race issues for parallel build
Date: Mon, 11 Nov 2024 07:38:48 -0800
Message-ID: <cover.1731339499.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6732250a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=F9nIy3veLlO3sOsph-QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iU-Zrmzk5sxeCe9GB_if6N1zYoS0NOOj
X-Proofpoint-GUID: iU-Zrmzk5sxeCe9GB_if6N1zYoS0NOOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=911 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411110128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 15:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206958

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 6e572580164d06e3af88fd607d9ef32a5e84166a:

  local.conf.sample: update IMAGE_FEATURES comments to remove debug-tweaks (2024-11-07 22:16:57 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/race
  https://github.com/robertlinux/yocto/tree/rbt/race

Robert Yang (1):
  Fix race issues for parallel build

 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch

-- 
2.44.1


