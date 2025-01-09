Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11967E7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 02:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38829.1736390681577466951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 18:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3104e403b0=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5092cWqx019910
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jan 2025 02:44:40 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkha73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 02:44:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 8 Jan 2025 18:44:39 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 8 Jan 2025 18:44:38 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>, <changqing.li@windriver.com>
Subject: [scarthgap][PATCH 0/2] ovmf: update from edk2-stable202402 to edk2-stable202411
Date: Thu, 9 Jan 2025 10:44:35 +0800
Message-ID: <cover.1736388671.git.jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eCN5tlttdqc0lNOOWTh8yqLBiIPwSt2y
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=677f3818 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=XMw2-wrrX6MzS3T9XSkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: eCN5tlttdqc0lNOOWTh8yqLBiIPwSt2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_08,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=818
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 02:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209612

From: Jiaying Song <jiaying.song.cn@windriver.com>

Due to the invalid URL of gitsm, the do_fetch process failed. The upstream
fixed this issue by modifying the .gitmodules file in the edk2-stable202411
version. Therefore, an upgrade to edk2-stable202411 is required.

Upstream modification:https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701

Error log:
WARNING: ovmf-native-edk2-stable202402-r0 do_fetch: Failed to fetch URL gitsm://github.com/Zeex/subhook.git;protocol=https;name=UnitTestFrameworkPkg/Library/SubhookLib/subhook;subpath=UnitTestFrameworkPkg/Library/SubhookLib/subhook;nobranch=1;lfs=True;bareclone=1;nobranch=1, attempting MIRRORS if available

The following changes since commit 01423828248b75e1f5afe2e5959ccd971df875cd:

  rust: add reproducibility patch to eliminate host leakage (2024-12-19 05:36:59 -0800)

are available in the Git repository at:

  https://github.com/jiajia123-wind/yocto jia_oe-core_ovmf
  https://github.com/jiajia123-wind/yocto/tree/jia_oe-core_ovmf

Alexander Kanavin (1):
  ovmf: update 202408 -> 202411

Mikko Rapeli (1):
  ovmf: update from edk2-stable202402 to edk2-stable202408

 ...ential-UINT32-overflow-in-S3-ResumeC.patch | 51 -------------------
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 -------------
 ...ovmf-update-path-to-native-BaseTools.patch |  6 +--
 ...ile-adjust-to-build-in-under-bitbake.patch |  6 +--
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 34 ++++++-------
 .../ovmf/ovmf/0004-reproducible.patch         | 30 +++++------
 meta/recipes-core/ovmf/ovmf_git.bb            |  4 +-
 7 files changed, 40 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-ResumeC.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch

-- 
2.25.1


