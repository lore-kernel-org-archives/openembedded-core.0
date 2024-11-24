Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F43E6688D
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 12:14:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.65439.1732450444229430323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 04:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105836f25f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOC4Cel015355;
	Sun, 24 Nov 2024 12:14:00 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43361890hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 24 Nov 2024 12:14:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 24 Nov 2024 04:13:58 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 24 Nov 2024 04:13:58 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>
Subject: [PATCH v3 0/1] bootchart2: Several fixes
Date: Sun, 24 Nov 2024 04:13:57 -0800
Message-ID: <cover.1732450236.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 64H6dLgyVm5L1LRhzZL8LM0jcryMjlaN
X-Proofpoint-GUID: 64H6dLgyVm5L1LRhzZL8LM0jcryMjlaN
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=67431888 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=24AZYWMyAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=kMrFzMfSurviW0hpcEIA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-24_10,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=792 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411240107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207696

From: Robert Yang <liezhi.yang@windriver.com>

* V3
  - Fixed do_package error when usrmerge in DISTRO_FEATURES.

* V2: Fixed Ross' comments:
  - Add -n to gzip to make the resulting files reproducible, so we don't need to
    decompress them.
  
  - Makefile: Let bootchartd.conf use EARLY_PREFIX, so that bootchartd.conf can
    install to correct location.
  
  - Set MANDIR and DOCDIR to make the files install to correct location for
    bootchart2-native.

* V1
  Initial version

// Robert

The following changes since commit 5e0ff36e025f5e842fa90b8219b53257d65ea66a:

  lib/oe/sbom30: Prefix aliases with "http://spdx.org/spdxdocs/" (2024-11-23 14:28:29 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/bootchart2
  https://github.com/robertlinux/yocto/tree/rbt/bootchart2

Robert Yang (1):
  bootchart2: Several fixes

 ...efile-Let-bootchartd.conf-use-EARLY_.patch | 30 +++++++++++++++
 .../0002-Makefile-Add-n-to-gzip.patch         | 37 +++++++++++++++++++
 .../bootchart2/bootchart2_0.14.9.bb           | 12 ++++--
 3 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Makefile-Let-bootchartd.conf-use-EARLY_.patch
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0002-Makefile-Add-n-to-gzip.patch

-- 
2.44.1


