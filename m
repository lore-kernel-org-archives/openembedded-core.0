Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9916FD3ABCE
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 16:20:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.63382.1731342039249466681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 08:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045fc21af=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABEqY9t017639
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:20:39 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t3w79tp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:20:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 08:20:29 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 08:20:29 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] bootchart2: Fix native build
Date: Mon, 11 Nov 2024 08:20:27 -0800
Message-ID: <cover.1731341964.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eCoU9QELgiVlJP0i5Jk1plfVMQ8Fiulf
X-Proofpoint-ORIG-GUID: eCoU9QELgiVlJP0i5Jk1plfVMQ8Fiulf
X-Authority-Analysis: v=2.4 cv=WY9eaFhX c=1 sm=1 tr=0 ts=67322ed6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=g_3A5a_kvFq8saUil-IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=745 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2411110134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 16:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206961

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 6e572580164d06e3af88fd607d9ef32a5e84166a:

  local.conf.sample: update IMAGE_FEATURES comments to remove debug-tweaks (2024-11-07 22:16:57 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/bootchart2
  https://github.com/robertlinux/yocto/tree/rbt/bootchart2

Robert Yang (1):
  bootchart2: Fix native build

 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.1


