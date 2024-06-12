Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82B2C27C75
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 05:33:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4363.1718170391163295672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 22:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6893383dff=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5Ho8W023619
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:10 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme963ed2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:10 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 22:32:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 22:32:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/2] ccache: 4.9.1 -> 4.10
Date: Tue, 11 Jun 2024 22:32:52 -0700
Message-ID: <cover.1718168026.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9z61Tb6AIRa3erC-vIxWs8KERpCjFNE7
X-Proofpoint-ORIG-GUID: 9z61Tb6AIRa3erC-vIxWs8KERpCjFNE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=745 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200562

From: Robert Yang <liezhi.yang@windriver.com>

* V2
  Add "License-Update:" tag

* V1
  The fmt is from meta-oe, will send a patch to remove it from meta-oe after
  this patch is merged.

The following changes since commit 07b4c7a2bd23f8645810e13439e814caaaf9cd94:

  linuxloader: add -armhf on arm only for TARGET_FPU 'hard' (2024-06-11 11:41:09 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/ccache
  https://github.com/robertlinux/yocto/tree/rbt/ccache

Robert Yang (2):
  ccache: 4.9.1 -> 4.10
  fmt: Add it from meta-oe for ccache 4.10

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../{ccache_4.9.1.bb => ccache_4.10.bb}       | 20 ++++++----
 .../0001-xxhash.h-Fix-build-with-gcc-12.patch | 37 -------------------
 meta/recipes-devtools/fmt/fmt_10.2.1.bb       | 16 ++++++++
 4 files changed, 30 insertions(+), 44 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.9.1.bb => ccache_4.10.bb} (44%)
 delete mode 100644 meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
 create mode 100644 meta/recipes-devtools/fmt/fmt_10.2.1.bb

-- 
2.45.1


