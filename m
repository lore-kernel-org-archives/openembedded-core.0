Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224AFC25B79
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 05:51:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21429.1716789099452785708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 22:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5877b6f631=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R4qgB1017379
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 05:51:38 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5hhc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 05:51:38 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 22:51:37 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 22:51:37 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/1] quilt: 0.67 -> 0.68
Date: Sun, 26 May 2024 22:51:34 -0700
Message-ID: <cover.1716788929.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NMzWwkeI1-ZdVvQxB8DUiWROaBK4luha
X-Proofpoint-GUID: NMzWwkeI1-ZdVvQxB8DUiWROaBK4luha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=857 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405270046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 05:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199896

From: Robert Yang <liezhi.yang@windriver.com>

* V2
  Add coreutils to RDEPENDS:quilt-ptest to fix ptest error

* V1
  Initial version

The following changes since commit 1187a460c2608369df8de08fe52a5542e4ab6ecd:

  oe-build-perf-report: Add commit hash link to chart tooltip (2024-05-24 16:59:17 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/quilt
  https://github.com/robertlinux/yocto/tree/rbt/quilt

Robert Yang (1):
  quilt: 0.67 -> 0.68

 ...lt-native_0.67.bb => quilt-native_0.68.bb} |   0
 meta/recipes-devtools/quilt/quilt.inc         |   7 +-
 ...t-Fix-a-race-condition-in-merge.test.patch |  48 ------
 .../quilt/quilt/faildiff-order.patch          |  41 -----
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ------------------
 .../quilt/{quilt_0.67.bb => quilt_0.68.bb}    |   0
 6 files changed, 2 insertions(+), 238 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.67.bb => quilt-native_0.68.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 rename meta/recipes-devtools/quilt/{quilt_0.67.bb => quilt_0.68.bb} (100%)

-- 
2.45.1


