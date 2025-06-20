Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020D2C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 06:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1498.1750399773783970685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 23:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8266961c6e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4SERV015747
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 23:09:33 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c8729e6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 23:09:33 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Jun 2025 23:09:32 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Jun 2025 23:09:32 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] rpm: Update 0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
Date: Thu, 19 Jun 2025 23:09:31 -0700
Message-ID: <cover.1750399682.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NCBTYWx0ZWRfX72w4ChfXYUCe tviDgo4ZxtGxb1ljDgPx38ZC7paoJFbpNhCuK1UFL/Ubzsd/lnAJzd+28LF4Zo5XV9Y+BSE9mp6 1PD8F9MQcLXDm2K7EbI0A6S3q05OpE7VLaJ3cwy7hvh5+qmEHgBPxapYQvyLXrqv9Xj985gS4uR
 2GruAzc0EPaWpcYIujxmeY3I+5lclMPvWIILHUW8PGAiKXGCP7FA8fTnP1aLr37KiQQYUN+4QA6 xElm3FIwI2iC3ShQBpXOsy8BxnbCbzPnqeWIJM2VOoHJVhMsqTe253qRRokaUJOoBS1jxMxiGbN wRtRSDCR35j8Dh49H+li93MmLVDFknUeEi1kVizh/iUo/EkgDsWYQebJoGzk33kmpcvLyuvvv03
 enfVvTfcof/8kBha03A47ixOFPbchanEy/hUQRb3eYLrdqniwArX0QsIgZ2hkThtv+b3MoHy
X-Proofpoint-GUID: LBn03pO84n_MWA0yw-ISyIacQlD08yLG
X-Proofpoint-ORIG-GUID: LBn03pO84n_MWA0yw-ISyIacQlD08yLG
X-Authority-Analysis: v=2.4 cv=RpXFLDmK c=1 sm=1 tr=0 ts=6854fb1d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=kYsKIzRbQXSYOY98Ad0A:9 a=zgiPjhLxNE0A:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=850
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 06:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219100

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit c8ce6710d864d237fdf67d2c3d3aa0f0970a2a05:

  go: set status of CVE-2024-3566 (2025-06-19 21:59:39 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

Robert Yang (1):
  rpm: Update 0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch

 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

-- 
2.49.0


