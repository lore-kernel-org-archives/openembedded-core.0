Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF307C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 05:28:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7665.1746768483971995798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 22:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7224a177b0=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5494vj3O011664
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 05:28:03 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430p5v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 05:28:02 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 8 May 2025 22:27:59 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] webkitgtk: upgrade 2.48.0 -> 2.48.1
Date: Fri, 9 May 2025 05:27:39 +0000
Message-ID: <20250509052739.3638179-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681d9262 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8
 a=pGLkceISAAAA:8 a=z6gsHLkEAAAA:8 a=k564k9mrfE4Mj933L5AA:9 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: l3qGRNo4gGcn5rP4UH5GayLFnFJXsgq9
X-Proofpoint-ORIG-GUID: l3qGRNo4gGcn5rP4UH5GayLFnFJXsgq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1MCBTYWx0ZWRfX6hnAB5dpUDo3 yh0t0ZUOaOEwBE0mTOCx63d1vUbDfRO2CfJVVe6qrSIZ3tn5GyBio1SozP6655qK+ymcdP3fbY8 piu0bOtRoPFYefdsHRykb2mdVWSfDGmswCS+CzIxh568rgqMTi5jr9zjcvotQ4BrAf8KZE3Jn6n
 bUv1jaiAktp6HAH17ijBKHK3YvB3WcDAHhpdBGKEXkehH6swONfXTLPGYLOSm8LteljjOw0Ww2h DBO1MvN7MTkp7WE0N4r8TfGr1OBbuNNz9d7fc7tRYc2Z3b2fqFGFmpog9iM+XhSBKb0IfHcOR0h /42656pJ2hP25K9UXkWHFuTLdUGx4r37zPP2rZ6p80kWTTXLi3+FVJwycCNL0MrErkefbfY4jsF
 nN+Q3ai9pVHC1HKs+rr2OR5nKfAZSn4d8m3jPlm4HBHcG6TQq6/NWGTv0l+7xZ7i+QpK96Wk
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 05:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216185

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-54551, CVE-2025-24208, CVE-2025-24209,
CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427

Changelog:
=========
- Limit the data stored in session state.
- Remove the empty area below the title bar in Web Inspector when not docked.
- Fix the build with GST_DISABLE_GST_DEBUG.
- Fix the build with GStreamer < 1.20.
- Fix the build with video disabled.
- Fix the build with clang 20.

Drop 0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
and 0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
which are part of upgrade.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 ------------------
 ...or-no-matching-function-for-call-to-.patch | 77 -------------------
 ...ebkitgtk_2.48.0.bb => webkitgtk_2.48.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 155 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.0.bb => webkitgtk_2.48.1.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
deleted file mode 100644
index 5cbb1035b2..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 18 Mar 2025 07:39:01 -0700
-Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
- https://bugs.webkit.org/show_bug.cgi?id=289953
-
-    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
-    https://bugs.webkit.org/show_bug.cgi?id=289953
-
-    Reviewed by Alicia Boya Garcia.
-
-    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
-      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
-      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS.
-
-    Canonical link: https://commits.webkit.org/292304@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459]
-
-Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
-index f6cf5ee..3178674 100644
---- a/Source/cmake/OptionsCommon.cmake
-+++ b/Source/cmake/OptionsCommon.cmake
-@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
- ")
- check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP)
- if (CXX_STDLIB_IS_LIBCPP)
--    set(CXX_STDLIB_VARIANT "LIBCPP")
--    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
-+    set(CXX_STDLIB_TEST_SOURCE "
-+        #include <utility>
-+        #if _LIBCPP_VERSION >= 190000
-+        int main() { }
-+        #else
-+        #error libc++ is older than 19.x
-+        #endif
-+    ")
-+    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
-+    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
-+        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_EXTENSIVE)
-+    else ()
-+        set(CXX_STDLIB_VARIANT "LIBCPP <19")
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=1)
-+    endif ()
- else ()
-     set(CXX_STDLIB_TEST_SOURCE "
-     #include <utility>
-@@ -239,7 +253,7 @@ else ()
-     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_GLIBCXX)
-     if (CXX_STDLIB_IS_GLIBCXX)
-         set(CXX_STDLIB_VARIANT "GLIBCXX")
--        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=1)
-     endif ()
- endif ()
- message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
-@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
- 
- if (USE_CXX_STDLIB_ASSERTIONS)
-     if (CXX_STDLIB_ASSERTIONS_MACRO)
--        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=1")
--        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=1")
-+        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}")
-+        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
-     else ()
-         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined")
-     endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
deleted file mode 100644
index 5b83d9e7eb..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 2001
-From: Fujii Hironori <Hironori.Fujii@sony.com>
-Date: Tue, 18 Mar 2025 10:25:47 +0900
-Subject: [PATCH] EnumTraits.h: error: no matching function for call to
- 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=289669
-
-Reviewed by NOBODY (OOPS!).
-
-Clang 20 couldn't compile EnumTraits.h.
-
-> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid explicitly-specified argument for template parameter 'V'
-
-An invalid enum value can't be specifed to the template parameter `V`.
-
-> template<auto V> constexpr std::span<const char> enumName()
-
-The upstream Magic Enum C++ has a template variable `is_enum_constexpr_static_cast_valid<E, V>` to check a enum value is valid.
-<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
-
-Imported the template variable.
-
-* Source/WTF/wtf/EnumTraits.h:
-(WTF::enumName):
-(WTF::makeEnumNames):
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42597]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
- 1 file changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.h
-index 0d33e39a..95e6318b 100644
---- a/Source/WTF/wtf/EnumTraits.h
-+++ b/Source/WTF/wtf/EnumTraits.h
-@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
- #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
- #endif
- 
-+#if COMPILER(CLANG) && __clang_major__ >= 16
-+template <typename E, auto V, typename = void>
-+inline constexpr bool isEnumConstexprStaticCastValid = false;
-+template <typename E, auto V>
-+inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void_t<std::integral_constant<E, static_cast<E>(V)>>> = true;
-+#else
-+template <typename, auto>
-+inline constexpr bool isEnumConstexprStaticCastValid = true;
-+#endif
-+
- template<typename E>
- constexpr std::span<const char> enumTypeNameImpl()
- {
-@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
-     return result;
- }
- 
-+template<typename E, auto V>
-+constexpr std::span<const char> enumName()
-+{
-+    if constexpr (isEnumConstexprStaticCastValid<E, V>)
-+        return enumName<static_cast<E>(V)>();
-+    else
-+        return { };
-+}
-+
- template<typename E>
- constexpr std::underlying_type_t<E> enumNamesMin()
- {
-@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<Is...>)
- {
-     constexpr auto min = enumNamesMin<E>();
-     return std::array<std::span<const char>, sizeof...(Is)> {
--        enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(Is) + min)>()...
-+        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min>()...
-     };
- }
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 6eb80da1de..41fe8209ce 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -16,11 +16,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
-           file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
-           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            "
-SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
+SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.40.0


