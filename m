Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B81C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:17:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84479.1749554234340601812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8256183154=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6vdPB004642;
	Tue, 10 Jun 2025 04:17:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm2ngy-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Jun 2025 04:17:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 10 Jun 2025 04:17:04 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 10 Jun 2025 04:17:04 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>
Subject: [PATCH v2 2/2] automake: 1.17 -> 1.18
Date: Tue, 10 Jun 2025 04:17:03 -0700
Message-ID: <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749554012.git.liezhi.yang@windriver.com>
References: <cover.1749554012.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w0RwzeECk5DwnETL-6zBAZaTC17LbFe9
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68481436 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=uPfJ7zb3p7K3iDJ3W7kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NyBTYWx0ZWRfX2Aq8xJXsFDF2 d0Fc8iWhnkhBCc9XU8LtIxL0UTmG8EEkjRDVm/gq4z9bo2oCi13aiB9SF/7xqeIzRuM3lVZ8uNt yd+5o2CEfXgTPUUz5WPToBxGCSn+vgTZ7Bkke+YVQ0NHWxhYedROR1+Rtf9w8mG4pKcgTXAXdg9
 P9x4HJXgSjjKRDpXy5akJHtxJmxOpi6cN4OPcp7cbpzjwB3vG2VIc3nRctoPfyHLaipsJx3dC2J hqe1F5ZvO4QtABglWIVOMKvO2at9q2DORLxTN2+uxc4oOAznSq6/9W/AEBqGNGz199OpGlCr8Dv EIhZjFEuws/RNnh3vOhwqs5TU2MWetkojskxuH1aX5SfN26U7o5rmMozZ1GNYM1g9jjybc/VHq+
 jsLHm+K4WKCaD43yxd1XmuoZs3KAj6TIQHiTTtBCJNorUB7XZ/j5E7iz/P7DCL3KAE6hv671
X-Proofpoint-ORIG-GUID: w0RwzeECk5DwnETL-6zBAZaTC17LbFe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=895 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218344

From: Robert Yang <liezhi.yang@windriver.com>

* Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch, it is a
  warning not an error any more, so just drop it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...report-error-when-the-path-of-Perl-c.patch | 34 -------------------
 .../{automake_1.17.bb => automake_1.18.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
 rename meta/recipes-devtools/automake/{automake_1.17.bb => automake_1.18.bb} (85%)

diff --git a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
deleted file mode 100644
index 5a38feb16c..0000000000
--- a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4339a2298a2d486fb4636b72393499b59805edde Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 21 Nov 2024 14:54:37 +0800
-Subject: [PATCH] configure: don't report error when the path of Perl contains
- spaces or tabs
-
-In order to make setting PERL to "/usr/bin/env perl" works well, patch
-configure as upstream suggested, refer [1]. 
-
-[1] https://debbugs.gnu.org/cgi/bugreport.cgi?bug=74453
-
-Upstream-Status: Inappropriate [ oe-specific ]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 45bf85a..68d3c7d 100755
---- a/configure
-+++ b/configure
-@@ -3514,7 +3514,7 @@ case $PERL in
-    as_fn_error $? "perl not found" "$LINENO" 5
-    ;;
-  *' '* | *'	'*)
--  as_fn_error $? "The path to your Perl contains spaces or tabs.
-+  : as_fn_error $? "The path to your Perl contains spaces or tabs.
- This would cause build failures later or unusable programs.
- Please use a path without spaces and try again." "$LINENO" 5
-   ;;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recipes-devtools/automake/automake_1.18.bb
similarity index 85%
rename from meta/recipes-devtools/automake/automake_1.17.bb
rename to meta/recipes-devtools/automake/automake_1.18.bb
index 4cda04e47b..516d0a58d9 100644
--- a/meta/recipes-devtools/automake/automake_1.17.bb
+++ b/meta/recipes-devtools/automake/automake_1.18.bb
@@ -22,10 +22,9 @@ SRC_URI += "\
            file://0002-automake-Update-for-python.m4-to-respect-libdir.patch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
            file://0006-automake-Remove-delays-in-configure-scripts-using-au.patch \
-           file://0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch \
            "
 
-SRC_URI[sha256sum] = "397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd"
+SRC_URI[sha256sum] = "af6043a5d4b3beef0c48161f4a6936259321cd101a34c1ab0768328515626c8a"
 
 PERL = "${USRBINPATH}/perl"
 PERL:class-native = "${USRBINPATH}/env perl"
-- 
2.49.0


