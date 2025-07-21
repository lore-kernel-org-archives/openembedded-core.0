Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8976AC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:52:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33113.1753073510779123138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92971a342b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L4hv9k1036248
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 21:51:50 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sc8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 21:51:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 20 Jul 2025 21:51:38 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 20 Jul 2025 21:51:38 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] gnu-config: Update to 20250709
Date: Sun, 20 Jul 2025 21:51:50 -0700
Message-ID: <cover.1753073349.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX9+l8OPhj1hHk
 /M1Kz6fuKjqhkp69QbQzKQQCqALLYcWl8BUjwzh5/4xusfr6BkEFPVmKIKsNLqH7HlACUzSFMI6
 yznY2sEj1/XgJnD3Zfs+FO7FcSvXv2YA+33L7AnyWhvx/+h/We0dYca67dXCQLUdCIgg0XaKsQR
 p94JVQCunXU9g7CYbwfeHNR8r5FRgTslaXWXZ+K9K0DHvD8b0eJgqvJ+zzDG5YzY3aIMNlHHxtP
 ejrtL9SZO1UabtloNPqxYPouenuP0IKpsgNefh6QqKf3PAZ/lbH/mM2++ouiuqrUBKT2ZLhbv/g
 JzAHze/oS7S004ZNBpKX9inXYdBsJdrEEtxEb0pOUpJBjJ01YsMP+88ETbt1hpV8f/xxvZhqH6C
 nGwjn1Kj
X-Proofpoint-ORIG-GUID: Wok5PG9uVefHbx_ESKchFDw6EMUCMPbj
X-Proofpoint-GUID: Wok5PG9uVefHbx_ESKchFDw6EMUCMPbj
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687dc766 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=BHRe_2UgjU9fV4ttWBsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 04:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220654

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 134880baa4a971660e0800f70404d15c758fb7db:

  clang: remove obsolete 'terminfo' PACKAGECONFIG (2025-07-17 10:32:41 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

Robert Yang (1):
  gnu-config: Update to 20250709

 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.49.0


