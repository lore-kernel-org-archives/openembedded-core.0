Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EA3D132DB
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:58:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59524.1730732310612903615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 06:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1038b6e100=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4E3qwm002003
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Nov 2024 14:58:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0hwwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:58:29 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:58:28 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:58:28 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] nfs-utils: 2.7.1 -> 2.8.1
Date: Mon, 4 Nov 2024 06:58:27 -0800
Message-ID: <cover.1730732225.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=6728e115 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=vmXmA9BC7FNlMBqrO6EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xIKwBI3zPMMlUc4tCFcKnJLAgHq6_M5J
X-Proofpoint-GUID: xIKwBI3zPMMlUc4tCFcKnJLAgHq6_M5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_12,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=624 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411040130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206686

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit db350fa7c3c33956fb652eef8aefebaf18ead841:

  python3-libarchive-c: Avoid using find_library python API (2024-11-04 14:33:43 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (1):
  nfs-utils: 2.7.1 -> 2.8.1

 ...de-junction.h-Define-macros-for-musl.patch | 46 -------------------
 ...t-junction-path.c-Fix-build-for-musl.patch | 35 --------------
 ...{nfs-utils_2.7.1.bb => nfs-utils_2.8.1.bb} |  6 +--
 3 files changed, 3 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-support-junction-path.c-Fix-build-for-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.7.1.bb => nfs-utils_2.8.1.bb} (95%)

-- 
2.25.1


