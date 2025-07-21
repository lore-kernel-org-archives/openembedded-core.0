Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF6C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:48:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41250.1753105679915882479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92971a342b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L6t2E21250193
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:47:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sttu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:47:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 21 Jul 2025 06:47:47 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 06:47:47 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] e2fsprogs: 1.47.1 -> 1.47.3
Date: Mon, 21 Jul 2025 06:47:59 -0700
Message-ID: <cover.1753105314.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX+omiho35CnHM
 vRcUcmucOJ4UyN2vHDkiBTDbuBHPyS3iOx7rCeZg6iHNnLGSSuHmmxAWTVIFBZg/XtCBpjWIh1x
 wU278bCzsrkyPL9Bd7Rhwaf/9KFyMpn2YuDxUeAJRqBv8WBImVy8Z+uVJ94/jy5hOKszEXBkt/C
 q1+MQ0FrzIuL4BjOr/KAFotXd/TT/6MvLEjjm6EBryF2dTrZYfXQs/BZghVsgaHDt8L+Qu93Chd
 Rv9d2gdXINDsOLtgy3BwFAUCyfL5+BkoJvnibbtXT2oFxZK6J9pmJ+MXBD5SkvQytNELooQDOCc
 6eUnX0ICyWgeYwm1mgvSxaifeuo2F238Ap8b7ZFvyRKddwGQjdDT3JzT9LVQzYEPf2/f+MPrn02
 me6n08TT
X-Proofpoint-ORIG-GUID: 4SXMD-frANZOv6JA2RRh2QdGl1exAFXE
X-Proofpoint-GUID: 4SXMD-frANZOv6JA2RRh2QdGl1exAFXE
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687e450f cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=cnvq_SE7bPevnhBV2u8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220695

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 134880baa4a971660e0800f70404d15c758fb7db:

  clang: remove obsolete 'terminfo' PACKAGECONFIG (2025-07-17 10:32:41 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/e2fsprogs
  https://github.com/robertlinux/yocto/tree/rbt/e2fsprogs

Robert Yang (1):
  e2fsprogs: 1.47.1 -> 1.47.3

 ...-libext2fs-fix-std-c23-build-failure.patch | 42 -------------------
 ...2fsprogs_1.47.1.bb => e2fsprogs_1.47.2.bb} |  8 ++--
 2 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.1.bb => e2fsprogs_1.47.2.bb} (96%)

-- 
2.49.0


