Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAE1C41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 03:26:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5274.1716953171946571004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 20:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=687902d2dc=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T3LL2J019476
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:26:11 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5kq86-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:26:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 20:26:09 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 20:26:09 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] git: 2.44.1 -> 2.45.1
Date: Tue, 28 May 2024 20:26:09 -0700
Message-ID: <e4dc6e0cf2fb6b47df663bea81fe0eb645ff23c9.1716953051.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716953051.git.liezhi.yang@windriver.com>
References: <cover.1716953051.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dh15BgqG6GyYscLqqqrwpxgf6IDSSkcG
X-Proofpoint-GUID: dh15BgqG6GyYscLqqqrwpxgf6IDSSkcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=904 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199982

From: Robert Yang <liezhi.yang@windriver.com>

Rebased 0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...mak.uname-do-not-force-RHEL-7-specific-build-.patch | 10 +++++++---
 .../git/{git_2.44.1.bb => git_2.45.1.bb}               |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.44.1.bb => git_2.45.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index d80d082ba3f..fc803c73c78 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -9,12 +9,16 @@ different flags than git builds on other host distros.
 Upstream-Status: Inappropriate [upstream needs to check compiler and component versions properly]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 
+Rebased for 2.45.1.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  config.mak.uname | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index 259d151..136ae3b 100644
+index a7607a5..251057e 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -64,10 +64,6 @@ ifeq ($(uname_S),Linux)
@@ -22,9 +26,9 @@ index 259d151..136ae3b 100644
  	HAVE_PLATFORM_PROCINFO = YesPlease
  	COMPAT_OBJS += compat/linux/procinfo.o
 -	# centos7/rhel7 provides gcc 4.8.5 and zlib 1.2.7.
--	ifneq ($(findstring .el7.,$(uname_R)),)
+-        ifneq ($(findstring .el7.,$(uname_R)),)
 -		BASIC_CFLAGS += -std=c99
--	endif
+-        endif
  endif
  ifeq ($(uname_S),GNU/kFreeBSD)
  	HAVE_ALLOCA_H = YesPlease
diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-devtools/git/git_2.45.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.1.bb
rename to meta/recipes-devtools/git/git_2.45.1.bb
index 53d67eb40a4..d1b3e6ad408 100644
--- a/meta/recipes-devtools/git/git_2.44.1.bb
+++ b/meta/recipes-devtools/git/git_2.45.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "118214bb8d7ba971a62741416e757562b8f5451cefc087a407e91857897c92cc"
+SRC_URI[tarball.sha256sum] = "10acb581993061e616be9c5674469335922025a666318e0748cb8306079fef24"
-- 
2.44.0


