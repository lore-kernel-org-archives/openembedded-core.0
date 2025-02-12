Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F06C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 11:06:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13174.1739358414148789561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 03:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4138ef1d53=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C9KhqT006594
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 03:06:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6hn2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 03:06:53 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 12 Feb 2025 03:06:50 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] webkitgtk: upgrade 2.46.5 -> 2.46.6
Date: Wed, 12 Feb 2025 11:06:29 +0000
Message-ID: <20250212110629.3446172-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: -pd4ec3nHyiMU2R-GNEH1XmR0PG4jUXm
X-Proofpoint-ORIG-GUID: -pd4ec3nHyiMU2R-GNEH1XmR0PG4jUXm
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ac80cd cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=RbZJXlvMX2_mMPPoKosA:9 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_03,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211224

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-24143, CVE-2025-24150, CVE-2025-24158 and
CVE-2025-24162

Drop 0001-Support-ICU-76.1-build.patch fix is part of upgrade.

Changelog:
==========
- Fix a crash when enabling Skia CPU rendering.
- Fix several crashes and rendering issues.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../0001-Support-ICU-76.1-build.patch         | 36 -------------------
 ...ebkitgtk_2.46.5.bb => webkitgtk_2.46.6.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.46.5.bb => webkitgtk_2.46.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
deleted file mode 100644
index 24f484e5e3..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8b0ff0f2e2882f200f1c21ec76fa679444cb1c43 Mon Sep 17 00:00:00 2001
-From: Jason Schonberg <schonm@gmail.com>
-Date: Wed, 20 Nov 2024 11:05:52 -0500
-Subject: [PATCH] Support ICU 76.1 build
-
-https://bugs.webkit.org/show_bug.cgi?id=282120
-
-Reviewed by Yusuke Suzuki.
-
-In ICU 76.1 an additional macro `U_SHOW_CPLUSPLUS_HEADER_API` was added to
-control visibility of the C++ API within ICU. Set this value to `0` since WebKit
-wants to only use the C API.
-
-* Source/WTF/wtf/Platform.h:
-
-Canonical link: https://commits.webkit.org/285727@main
-
-Upstream-Status: Backport [ from webkitgtk-2.47.1 https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7e7ea0 ]
-
-Signed-off-by: Jason Schonberg <schonm@gmail.com>
----
- Source/WTF/wtf/Platform.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 23070df2..51a8dce9 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -115,6 +115,7 @@
- /* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
- #define U_HIDE_DEPRECATED_API 1
- #define U_SHOW_CPLUSPLUS_API 0
-+#define U_SHOW_CPLUSPLUS_HEADER_API 0
- #ifdef __cplusplus
- #define UCHAR_TYPE char16_t
- #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
index 8c6ffdc8a7..d1f24bbbf7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
@@ -15,11 +15,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
-           file://0001-Support-ICU-76.1-build.patch \
            file://bmalloc-fix.patch \
            file://sys_futex.patch \
            "
-SRC_URI[sha256sum] = "bad4020bb0cfb3e740df3082c2d9cbf67cf4095596588a56aecdde6702137805"
+SRC_URI[sha256sum] = "f2b31de693220ba9bab76ce6ddfe5b0bfab2515cb2b0a70f3c54d4050766c32b"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.40.0


