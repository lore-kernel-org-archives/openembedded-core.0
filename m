Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328CEC25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:28:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12685.1716546517748680930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 03:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874198975=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O5bu36024382
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:37 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgppp-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:36 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 03:28:34 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 03:28:34 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] git: 2.44.0 -> 2.45.1
Date: Fri, 24 May 2024 03:28:29 -0700
Message-ID: <dd0be4b86c6f2b2389b037b6f06b297a4acf2451.1716543967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1716543967.git.liezhi.yang@windriver.com>
References: <cover.1716543967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XKTTUBEukekUhQKi0A8wej1ntAEG8qpg
X-Proofpoint-ORIG-GUID: XKTTUBEukekUhQKi0A8wej1ntAEG8qpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=908 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199840

From: Robert Yang <liezhi.yang@windriver.com>

Rebased 0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...mak.uname-do-not-force-RHEL-7-specific-build-.patch | 10 +++++++---
 .../git/{git_2.44.0.bb => git_2.45.1.bb}               |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.44.0.bb => git_2.45.1.bb} (98%)

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
diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.45.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.0.bb
rename to meta/recipes-devtools/git/git_2.45.1.bb
index 78b00dd19f0..d1b3e6ad408 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.45.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f9e36f085458fe9688fbbe7846b8c4770b13d161fcd8953655f36b2b85f06b76"
+SRC_URI[tarball.sha256sum] = "10acb581993061e616be9c5674469335922025a666318e0748cb8306079fef24"
-- 
2.45.1


