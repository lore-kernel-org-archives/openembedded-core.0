Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EBAC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:50:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6631.1747817415781641634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236f77f38=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5THFF011938
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:50:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr91u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:50:15 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 01:49:57 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 01:49:57 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH 0/1] autotools.bbclass: Copy gettext/po/Makefile.in.in to all po/Makefile.in.in
Date: Wed, 21 May 2025 01:50:19 -0700
Message-ID: <cover.1747817251.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4NiBTYWx0ZWRfX7/K3HRCUT/pR XczgDnD7Qn+4hoa0cgyC6ES7r8UhYjGFaDz8X/1/Q58EpnGz0nRFSuq9g0IYkrjV/GiBpurYD8/ XmGSl4MhO+850i4aG5Dp7+kvM5eI4gwwSJvT/wLyCiTKCgC9wvJN347zzVf++fVxI+0gG4AGG5N
 IHOp2UMVKUmGuSxGPOdG0q4SUiDF0aLv7nmOimur8Qg2pnYq6bJUzZ2cTsqMm+9KFyeqZB0cYmP rdqmvzfy5jubHad9GsIsPLfAXTOpYxAKbckD8UVPd1svzRcvbXN2Dfcg7bSt2/6XG3kr8Ez9wJY QSMOJbBazAO1ohItwZqR3wNwEYZeyFRFoariyhJO/Tlw0RojtTIbqRAbRwpUfVXM5cBwkBkxIlY
 F1jU/9JZoIyHyku4+oxWKDEJMQmoS882HElX/7TVsnbpaCmULBagxSaqyZnX2s+7y0YcDA+6
X-Proofpoint-ORIG-GUID: HWgXs4NuxT_-OPHiQQ2Sqy9mKlqDgYot
X-Proofpoint-GUID: HWgXs4NuxT_-OPHiQQ2Sqy9mKlqDgYot
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682d93c7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=0zqyCUf-amiWpmOxnsoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=915
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217005

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit c7faf141592d1e2a5cab32a83f7e1498ee498d65:

  kernel-module-split: Allow for external conf files (2025-05-20 14:47:47 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/autotools
  https://github.com/robertlinux/yocto/tree/rbt/autotools

Robert Yang (1):
  autotools.bbclass: Copy gettext/po/Makefile.in.in to all
    po/Makefile.in.in

 meta/classes-recipe/autotools.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.49.0


