Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD58FE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 06:58:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29293.1735023509465104770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 22:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2088af2719=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO6SvwE015686
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 22:58:29 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub2ayn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 22:58:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 23 Dec 2024 22:58:28 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 23 Dec 2024 22:58:28 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] libx11-compose-data: Use CONFLICT_DISTRO_FEATURES to skip when x11
Date: Mon, 23 Dec 2024 22:58:27 -0800
Message-ID: <cover.1735023394.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676a5b94 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=I9-9lQK_aE0P4Jm-3p8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hbK4NlDt2zmo7X-wHShvVaPICK1cz_ER
X-Proofpoint-ORIG-GUID: hbK4NlDt2zmo7X-wHShvVaPICK1cz_ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412240055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 06:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209058

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 1a2afcd0773c5ec5946d1dfc27bde585c52a5724:

  base/features_check: Make PARSE_ALL_RECIPES and SOURCE_MIRROR_FETCH boolean (2024-12-23 11:41:13 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/x11
  https://github.com/robertlinux/yocto/tree/rbt/x11

Robert Yang (1):
  libx11-compose-data: Use CONFLICT_DISTRO_FEATURES to skip when x11

 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
2.44.1


