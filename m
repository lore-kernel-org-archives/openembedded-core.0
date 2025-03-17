Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11787C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 10:23:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.49073.1742206994913041420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 03:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=517106346d=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H80Cux030305
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:23:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0t018-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:23:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 17 Mar 2025 03:23:12 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 17 Mar 2025 03:23:11 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] webkitgtk: 2.46.6 -> 2.48.0
Date: Mon, 17 Mar 2025 18:22:54 +0800
Message-ID: <20250317102255.318925-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZOV8weKzRE_S_pxfhftV5c1XsqyF-G0-
X-Proofpoint-GUID: ZOV8weKzRE_S_pxfhftV5c1XsqyF-G0-
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67d7f811 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=nvSNs5wfMz7mDmS1IlwA:9 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=746 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503170076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213066

From: Kai Kang <kai.kang@windriver.com>

Upgrade webkitgtk from 2.46.6 to 2.48.0:

* remove backported patch bmalloc-fix.patch
* update context of no-musttail-arm.patch
* add PACKAGECONFIG speech

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/webkitgtk/bmalloc-fix.patch        | 36 -------------------
 .../webkit/webkitgtk/no-musttail-arm.patch    | 14 +++++---
 ...ebkitgtk_2.46.6.bb => webkitgtk_2.48.0.bb} |  4 +--
 3 files changed, 11 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.46.6.bb => webkitgtk_2.48.0.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch b/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
deleted file mode 100644
index 37e0fdcbbdc..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6ab7d3f7d8d0d8e1ab401d0fb13f60bbc64279a2 Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <wiz@gatalith.at>
-Date: Thu, 7 Nov 2024 11:54:30 -0800
-Subject: [PATCH] bmalloc: Build problem in bmalloc when X11/X.h is in the same
- namespace https://bugs.webkit.org/show_bug.cgi?id=282693
-
-This avoids a build problem when the X11/X.h is included,
-which defines Success to '0'.
-
-Reviewed by Fujii Hironori.
-
-* Source/bmalloc/bmalloc/EligibilityResult.h:
-
-Canonical link: https://commits.webkit.org/286295@main
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/6ab7d3f7d8d0d8e1ab401d0fb13f60bbc64279a2]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Source/bmalloc/bmalloc/EligibilityResult.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Source/bmalloc/bmalloc/EligibilityResult.h b/Source/bmalloc/bmalloc/EligibilityResult.h
-index ead7dbb52c07a..48f9e5bfe8a80 100644
---- a/Source/bmalloc/bmalloc/EligibilityResult.h
-+++ b/Source/bmalloc/bmalloc/EligibilityResult.h
-@@ -29,6 +29,11 @@
- 
- #if !BUSE(LIBPAS)
- 
-+/* avoid conflict with symbol from X11 headers */
-+#ifdef Success
-+#undef Success
-+#endif
-+
- namespace bmalloc {
- 
- enum class EligibilityKind {
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index c98d8b7727b..367e6b8342a 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -11,20 +11,24 @@ this code is new in webkit 2.42[2] thats why we do not see the crash in older we
 
 Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update context for webkitgtk 2.48.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Source/WTF/wtf/Compiler.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index c01ed849..b69b1527 100644
+index 16e416d..68dd9a0 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -290,7 +290,7 @@
+@@ -293,7 +293,7 @@
  #if COMPILER(CLANG)
  #if __SIZEOF_POINTER__ == 8
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(__arm__)
+-#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
++#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
  #define MUST_TAIL_CALL [[clang::musttail]]
- #endif
+ #define HAVE_MUST_TAIL_CALL 1
  #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index d1f24bbbf70..cb4e09662f7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -15,10 +15,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
-           file://bmalloc-fix.patch \
            file://sys_futex.patch \
            "
-SRC_URI[sha256sum] = "f2b31de693220ba9bab76ce6ddfe5b0bfab2515cb2b0a70f3c54d4050766c32b"
+SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -81,6 +80,7 @@ PACKAGECONFIG[jpegxl] = "-DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
 PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
+PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
 
 EXTRA_OECMAKE = " \
                  -DPORT=GTK \
-- 
2.34.1


