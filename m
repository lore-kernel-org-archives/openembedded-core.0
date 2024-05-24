Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073CDC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:28:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12683.1716546516026084816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 03:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874198975=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O5bu33024382
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgppp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:35 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 03:28:34 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 03:28:33 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] Upgrade strace quilt and git
Date: Fri, 24 May 2024 03:28:26 -0700
Message-ID: <cover.1716543967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TlgUbBmcTXT6khAXaW84_Khbbp2Obw1J
X-Proofpoint-ORIG-GUID: TlgUbBmcTXT6khAXaW84_Khbbp2Obw1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=812 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199837

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 50f78cb9de68cd4317f34321dfdb06d72ce5d3c6:

  useradd-example: Fix S = WORKDIR reference (2024-05-23 11:25:27 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (3):
  strace: upgrade 6.8 -> 6.9
  quilt: 0.67 -> 0.68
  git: 2.44.0 -> 2.45.1

 ...-do-not-force-RHEL-7-specific-build-.patch |  10 +-
 .../git/{git_2.44.0.bb => git_2.45.1.bb}      |   2 +-
 ...lt-native_0.67.bb => quilt-native_0.68.bb} |   0
 meta/recipes-devtools/quilt/quilt.inc         |   5 +-
 ...t-Fix-a-race-condition-in-merge.test.patch |  48 ------
 .../quilt/quilt/faildiff-order.patch          |  41 -----
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ------------------
 .../quilt/{quilt_0.67.bb => quilt_0.68.bb}    |   0
 ...toconf-macro-to-detect-largefile-sup.patch |   6 +-
 ...001-strace-fix-reproducibilty-issues.patch |   9 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  35 +++--
 .../strace/strace/Makefile-ptest.patch        |   9 +-
 .../strace/strace/ptest-spacesave.patch       |   7 +-
 .../strace/strace/skip-load.patch             |   9 +-
 .../strace/strace/update-gawk-paths.patch     |  70 ++++-----
 .../strace/{strace_6.8.bb => strace_6.9.bb}   |   2 +-
 16 files changed, 85 insertions(+), 312 deletions(-)
 rename meta/recipes-devtools/git/{git_2.44.0.bb => git_2.45.1.bb} (98%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.67.bb => quilt-native_0.68.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 rename meta/recipes-devtools/quilt/{quilt_0.67.bb => quilt_0.68.bb} (100%)
 rename meta/recipes-devtools/strace/{strace_6.8.bb => strace_6.9.bb} (96%)

-- 
2.45.1


