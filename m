Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5517DC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:07:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2880.1750748843901033938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 00:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=827078c8af=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5vnIe029254;
	Tue, 24 Jun 2025 07:07:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2jsu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Jun 2025 07:07:22 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 24 Jun 2025 00:07:20 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 24 Jun 2025 00:07:20 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [walnascar][PATCH 0/1] package_rpm.bbclass: Remove empty build directory
Date: Tue, 24 Jun 2025 00:07:20 -0700
Message-ID: <cover.1750748767.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA2MCBTYWx0ZWRfXyblBf0ssu+zl QqczElJARDDNUWAVMfI4c3ijAM7S7ZXotqEO+e4dDwsk1GjxG2sbaLa5c9eSmRq0p+7RVrZr6Cy hkjQ5moPBm7qnO4DeWlPT5BFL1AEzb9AmqH6rwCtaa+Nupz107HTUD5h82R0NnzllpdJ0L2GWGn
 QgVtZZKm5ARX+ytZFStPTtn2iPx8uUSlu4wHhdzNT8SwBIhvKFOm2x/1JkCQ77LEvbdJBFs2qwl V+NYR8CJGP/HHBK8c4WyOMu2/DbL3Vc1WHy6iyknH4cztV0Rjgkx2uZXMtqrC2WA7EPqAVeT7lE WCYOHRCdIXC+uLs4wOASomKghbEbSmomsbZhgVKXFkr89U4Dl8o4ko9mD3uRGxtIqXIG4qCDwMp
 tUzGhy6Z/7UpH5UbgtB6gfOynFrB0Jj8F1rjugReVPStrUZXBAdP2LKQVjYvJ0pDq+sFnhyP
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685a4eaa cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_uCJ1_vK1QYh_D865ZEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: O9AM0jSrcpGOw7t1fW_IpSBh35sOR7t6
X-Proofpoint-GUID: O9AM0jSrcpGOw7t1fW_IpSBh35sOR7t6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=866 mlxscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 07:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219230

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit fd79c20430ad5c540522ddbe72ef235379c628bd:

  tune-cortexr52: Remove aarch64 for ARM Cortex-R52 (2025-06-16 12:50:00 -0700)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/walnascar-rpm
  https://github.com/robertlinux/yocto/tree/rbt/walnascar-rpm

Robert Yang (1):
  package_rpm.bbclass: Remove empty build directory

 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.49.0


