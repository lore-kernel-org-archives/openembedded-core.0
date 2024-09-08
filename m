Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A076BE6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 13:31:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30025.1725802284977451977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 06:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99817c9fc0=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488DU8wA013600
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Sep 2024 06:31:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj448u1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 06:31:24 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 06:31:24 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 8 Sep 2024 06:31:23 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] nfs-utils: 2.6.4 -> 2.7.1
Date: Sun, 8 Sep 2024 06:31:22 -0700
Message-ID: <cover.1725802219.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Q-4veE_Z48LWypfZjubsY3avr_G_iR-Z
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66dda72c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=lfBobvIKnWbXqvnH0RIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Q-4veE_Z48LWypfZjubsY3avr_G_iR-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=703 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409080113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 13:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204299

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit c7c9f827e914b7c27856d995da553a2e41372321:

  recipes-bsp: usbutils: Fix usb-devices command using busybox (2024-09-07 07:31:16 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/nfs-utils
  https://github.com/robertlinux/yocto/tree/rbt/nfs-utils

Robert Yang (1):
  nfs-utils: 2.6.4 -> 2.7.1

 ...nclude-unistd.h-to-compile-with-musl.patch | 34 ------------
 ...de-junction.h-Define-macros-for-musl.patch | 46 ++++++++++++++++
 ...t-junction-path.c-Fix-build-for-musl.patch | 35 ++++++++++++
 ...locktest-Use-intmax_t-to-print-off_t.patch | 53 -------------------
 ...{nfs-utils_2.6.4.bb => nfs-utils_2.7.1.bb} |  8 +--
 5 files changed, 85 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.4.bb => nfs-utils_2.7.1.bb} (94%)

-- 
2.44.1


