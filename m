Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A42C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 10:46:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12807.1748429172386372222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 03:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8243786c29=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA2frf007272
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 03:46:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm3n5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 03:46:11 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 28 May 2025 03:46:09 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: upgrade 2.48.1 -> 2.48.2
Date: Wed, 28 May 2025 16:15:43 +0530
Message-ID: <20250528104543.1389063-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6836e973 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=TtWqVQ85w8xvhG5bnAYA:9 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NCBTYWx0ZWRfXwnpUwpSxfg6x mdACAStyTKxbkOqJKo8qr+hA+9FDDK9VEs/DvC5aPSnW1MOMiArWM7Wa9dh3gIT5UoBxpKWTjRL RluKlmRFnd7kkZMMrtyk/tfURjT5+JeVlDctouCTlV53IgPt+W/0L68et67IeljELGsMVpf2vg5
 wcnyDoWkLtCpe6KOGqSDxWIfbcLZsTRTmEIQB3oY9o3XO3GycZezuT+waKV9qIIuy1r7RNTPPJS 4KsQsfCa4WdwLG8COIpr/5z+OFBU+OKEExZcuFE+OIZdvFznhsSV2AYiDNx/KTz4wT3xCv1V4Zl XDoQlC+JX8EvoQcMe6E6XeeRmlNUneH79Fc6X1vr3ibKUoC2jqH5lCW4E4Go92M4dfk1SZ/F/PV
 FIfiTqvPqtVwDzPyJlPMB8XsXu0AEWL0+urFu+eY/a6ZffoCcRj8WwR2OZEsb8W9JCrSjjCT
X-Proofpoint-ORIG-GUID: 6hxNK_NLX9IL2VqYLkvpyrEoahwi1_F8
X-Proofpoint-GUID: 6hxNK_NLX9IL2VqYLkvpyrEoahwi1_F8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=726 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 10:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217341

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-24223, CVE-2025-31204, CVE-2025-31205,
CVE-2025-31206, CVE-2025-31215 and CVE-2025-31257.

Changelog:
=========
- Enable CSS Overscroll Behavior by default.
- Change threaded rendering implementation to use Skia API 
instead of WebCore display list that is not thread safe.
- Fix rendering when device scale factor change comes before 
the web view geometry update.
- Fix network process crash on exit.
- Fix the build with ENABLE_RESOURCE_USAGE=OFF.
- Fix several crashes and rendering issues.

Drop fix-ftbfs-non-arm-non-x86.patch which is part of upgrade.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkitgtk/fix-ftbfs-non-arm-non-x86.patch | 31 -------------------
 ...ebkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
deleted file mode 100644
index 2381acb1b0..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Wed, 2 Apr 2025 15:01:55 -0500
-Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
- non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=287662
-
-Unreviewed stable branch build fix.
-
-* Source/WebCore/platform/audio/DenormalDisabler.cpp:
-
-Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653d020d9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-index 35715e663ce7e..44ba08a33d5d9 100644
---- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
-+++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
-     }
- }
- #else
--DenormalDisabler::DenormalDisabler() = default
-+DenormalDisabler::DenormalDisabler() = default;
- DenormalDisabler::~DenormalDisabler() = default;
- #endif
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
index 5b9846a6d6..c501f4df7d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
@@ -18,9 +18,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-ftbfs-non-arm-non-x86.patch \
            "
-SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
+SRC_URI[sha256sum] = "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.40.0


