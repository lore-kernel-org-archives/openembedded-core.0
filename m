Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C53C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 06:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1499.1750399774284288678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 23:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8266961c6e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4UANL022928
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 23:09:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80s1duf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 23:09:33 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 19 Jun 2025 23:09:33 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Jun 2025 23:09:32 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] rpm: Update 0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
Date: Thu, 19 Jun 2025 23:09:32 -0700
Message-ID: <78dbb196cb743a93be89afbd46a2ec0e277e2d7a.1750399682.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750399682.git.liezhi.yang@windriver.com>
References: <cover.1750399682.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=edg9f6EH c=1 sm=1 tr=0 ts=6854fb1d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=6Sd-ObLmOBPbu3gRxgUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NCBTYWx0ZWRfX+h8kwjmltS+F 4fBZ6oW14AsEi89vwRx1nS/F3yFi82gIgkhEVpHE8IpUKTGm7+vujmuMgn22hBtdqqHNGB33Bom L8d8FqI9I0HP/HLQeKncMVRI54k76nQObbjL/CxocmccJ7LanJQ2nf1XAKYdmPFYFLYOK9g1vZJ
 fE5c4TJ68Fb2ynZnOHyiWRIeBoYjTmQEa3YvpqeoBuzcODIAQvHLjjXxwlMs1lvSpiAF+OvndFe 7RK6A3bDITivosQgwC+LxCc9ja4etWj9471OauG4DpIu6GE+DttA85Jzn1mgqbz7GcjD+XIjsCB 9DFBqzCHFv8aIWy/b04J1obI5poRfM8lEExyq5YomBo5aCqZD2nXpTWiWeurTbsOmnTo9eGm26v
 HIvG13cGO8Eh6eCjj9ZrXqGbqHVWbcRzUz7PhbRMs25wK0ft+11LW5dQqoUmr/vDKuGA+dZI
X-Proofpoint-GUID: -zVYp2BOF3l6Dwc_hF1j-jBdkpZ5kRHn
X-Proofpoint-ORIG-GUID: -zVYp2BOF3l6Dwc_hF1j-jBdkpZ5kRHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 06:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219101

From: Robert Yang <liezhi.yang@windriver.com>

The patch merged by upstream is different, so backport the one from upstream.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
index ed270a5704..412e1c146d 100644
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
@@ -1,18 +1,9 @@
-From 19f7ef341f19ac5594c7d0113f9eb8224934464a Mon Sep 17 00:00:00 2001
+From e14502834fe6a9c6c9a439401ac3d2c8fd979267 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 8 Jun 2025 00:19:06 -0700
-Subject: [PATCH] CMakeLists.txt: Fix checking for CFLAGS
+Date: Sun, 8 Jun 2025 00:36:38 -0700
+Subject: [PATCH] CMakeLists.txt: Improve checking for CFLAGS
 
-The previous code doesn't work because the check_c_compiler_flag() only ran
-once because 'found' is in CACHE, here is log:
--- Performing Test found
--- Performing Test found - Success
-
-That would result in:
-* All the flags are added when the first one works
-* None of the flags is added when the first one doesn't work
-
-We can use "unset(found CACHE)" to fix that, but the log is still not clear:
+The previous log wasn't clear:
 -- Performing Test found
 -- Performing Test found - Success
 -- Performing Test found
@@ -20,15 +11,15 @@ We can use "unset(found CACHE)" to fix that, but the log is still not clear:
 -- Performing Test found
 -- Performing Test found - Failed
 
-Use a new var SUPPORTS_${flag} will make it more clear:
--- Performing Test SUPPORTS_-fno-strict-overflow
--- Performing Test SUPPORTS_-fno-strict-overflow - Success
--- Performing Test SUPPORTS_-fno-delete-null-pointer-checks
--- Performing Test SUPPORTS_-fno-delete-null-pointer-checks - Success
--- Performing Test SUPPORTS_-fhardened
--- Performing Test SUPPORTS_-fhardened - Failed
+Use a new var compiler-supports${flag} will make it more clear:
+-- Performing Test compiler-supports-fno-strict-overflow
+-- Performing Test compiler-supports-fno-strict-overflow - Success
+-- Performing Test compiler-supports-fno-delete-null-pointer-checks
+-- Performing Test compiler-supports-fno-delete-null-pointer-checks - Success
+-- Performing Test compiler-supports-fhardened
+-- Performing Test compiler-supports-fhardened - Failed
 
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/3796]
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/e14502834fe6a9c6c9a439401ac3d2c8fd979267]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
@@ -36,7 +27,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08e3e5274..a7566ab5a 100644
+index 08e3e5274..f275c396b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -416,11 +416,10 @@ endif()
@@ -45,14 +36,11 @@ index 08e3e5274..a7566ab5a 100644
  foreach (flag -fno-strict-overflow -fno-delete-null-pointer-checks -fhardened)
 -	check_c_compiler_flag(${flag} found)
 -	if (found)
-+	check_c_compiler_flag(${flag} SUPPORTS_${flag})
-+	if (SUPPORTS_${flag})
++	check_c_compiler_flag(${flag} compiler-supports${flag})
++	if (compiler-supports${flag})
  		add_compile_options(${flag})
  	endif()
 -	unset(found)
  endforeach()
  
  # generated sources
--- 
-2.49.0
-
-- 
2.49.0


