Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8855CC88E4A
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82.1788990824563150120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=W2OxYiKk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2026090921534207870998580002077a-c98jru@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026090921534207870998580002077a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3Yx3x2umf9CH+kpY6oCVjwemIhuPShIXJIfErmH3AwE=;
 b=W2OxYiKk18wMrBNU10kTN4pmZO7DOcEpQZwqAHt+tvsTKjl8x8BqXu24Ix84F+E61vE/J8
 61tn29o5ldhi4IZ4tGj15o1kvOID8w3fjokBrrjPbLIF83jiYZ+hxExkOhlvSUotCwKou0T8
 APoCVLDtgj+5XtP/NRzA4tkEH+sojPpu1iAFKidVkLhBQc+eLwKEdsrLj4XnRFr/UcEZc39b
 DyyshAtCWXxUkKI5UfeMMJiTnQCEoNBtbcsOvCWkPkdkRAs4ws/JVzxC1SxaMH2g8rShRH63
 v0AeFer/uDtz6EdXm8TSj4tUUO//2de/DZB22S8C5oYi/78q+97098jw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/15] cpp-example: update formatting and code style
Date: Wed,  9 Sep 2026 23:53:08 +0200
Message-ID: <20260909215337.89106-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245507

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Just run clang-format on the source files and add the .clang-format
configuration file.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/cpp/cpp-example.inc          |  1 +
 .../recipes-test/cpp/files/.clang-format      | 42 +++++++++++++++++++
 .../recipes-test/cpp/files/cpp-example.cpp    |  4 +-
 .../recipes-test/cpp/files/daemonize.cpp      |  2 +-
 .../recipes-test/cpp/files/daemonize.hpp      |  2 +-
 .../cpp/files/test-cpp-example.cpp            | 13 +++---
 6 files changed, 54 insertions(+), 10 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/.clang-format

diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 3934345f17..603040d123 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://config.h.in \
     file://cpp-example.service \
     file://cpp-example.init \
+    file://.clang-format \
     file://run-ptest \
 "
 
diff --git a/meta-selftest/recipes-test/cpp/files/.clang-format b/meta-selftest/recipes-test/cpp/files/.clang-format
new file mode 100644
index 0000000000..e22fadaee9
--- /dev/null
+++ b/meta-selftest/recipes-test/cpp/files/.clang-format
@@ -0,0 +1,42 @@
+---
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+BasedOnStyle: LLVM
+Language: Cpp
+Standard: c++17
+
+IndentWidth: 4
+UseTab: Never
+ColumnLimit: 100
+
+BreakBeforeBraces: Custom
+BraceWrapping:
+  AfterFunction: true
+  AfterClass: true
+  AfterStruct: true
+  AfterEnum: true
+  AfterUnion: true
+  AfterNamespace: false
+  AfterControlStatement: Never
+  BeforeElse: false
+  BeforeCatch: false
+  SplitEmptyFunction: false
+  SplitEmptyRecord: false
+AlwaysBreakAfterReturnType: None
+IndentCaseLabels: true
+NamespaceIndentation: None
+AccessModifierOffset: -4
+
+PointerAlignment: Right
+ReferenceAlignment: Right
+SpaceAfterCStyleCast: false
+SpaceBeforeParens: ControlStatements
+
+AllowShortFunctionsOnASingleLine: Empty
+AllowShortIfStatementsOnASingleLine: Never
+AllowShortLoopsOnASingleLine: false
+AllowShortBlocksOnASingleLine: Never
+
+SortIncludes: false
+IncludeBlocks: Preserve
diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
index f18911554c..af7a8c2d73 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.cpp
@@ -28,7 +28,7 @@ bool g_use_syslog = false;
 // Prints an informational message. Under systemd, stdout is already captured
 // by the journal. Otherwise, use stdout until daemonized (stdio is then
 // redirected to /dev/null), and syslog afterwards so messages aren't lost.
-void log_info(const std::string& msg)
+void log_info(const std::string &msg)
 {
 #ifndef WITH_SYSTEMD
     if (g_use_syslog) {
@@ -41,7 +41,7 @@ void log_info(const std::string& msg)
 
 } // namespace
 
-int main(int argc, char* argv[])
+int main(int argc, char *argv[])
 {
     bool endless_mode = false;
 #ifndef WITH_SYSTEMD
diff --git a/meta-selftest/recipes-test/cpp/files/daemonize.cpp b/meta-selftest/recipes-test/cpp/files/daemonize.cpp
index 7d91259bfa..e4752124f6 100644
--- a/meta-selftest/recipes-test/cpp/files/daemonize.cpp
+++ b/meta-selftest/recipes-test/cpp/files/daemonize.cpp
@@ -38,7 +38,7 @@ void daemonize()
     }
 }
 
-void write_pidfile(const std::string& path)
+void write_pidfile(const std::string &path)
 {
     std::ofstream pidfile(path, std::ios::trunc);
     pidfile << getpid() << std::endl;
diff --git a/meta-selftest/recipes-test/cpp/files/daemonize.hpp b/meta-selftest/recipes-test/cpp/files/daemonize.hpp
index 17d85d690a..d837836e02 100644
--- a/meta-selftest/recipes-test/cpp/files/daemonize.hpp
+++ b/meta-selftest/recipes-test/cpp/files/daemonize.hpp
@@ -20,7 +20,7 @@
 void daemonize();
 
 // Writes the current process's pid to the given path.
-void write_pidfile(const std::string& path);
+void write_pidfile(const std::string &path);
 
 // Permanently drops from root to the given group/user. Must run gid before
 // uid: once uid is dropped, the process no longer has permission to setgid.
diff --git a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
index e1909c3168..d8f2547e88 100644
--- a/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
+++ b/meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
@@ -1,8 +1,8 @@
 /*
-* Copyright OpenEmbedded Contributors
-*
-* SPDX-License-Identifier: MIT
-*/
+ * Copyright OpenEmbedded Contributors
+ *
+ * SPDX-License-Identifier: MIT
+ */
 
 #include "cpp-example-lib.hpp"
 
@@ -13,10 +13,11 @@
 #define FAIL_COMPARISON_STR ""
 #endif
 
-int main() {
+int main()
+{
     auto cpp_example = CppExample();
     auto ret_string = cpp_example.get_string();
-    if(0 == ret_string.compare(CppExample::test_string + FAIL_COMPARISON_STR)) {
+    if (0 == ret_string.compare(CppExample::test_string + FAIL_COMPARISON_STR)) {
         std::cout << "PASS: " << ret_string << " = " << CppExample::test_string << std::endl;
     } else {
         std::cout << "FAIL: " << ret_string << " != " << CppExample::test_string << std::endl;
-- 
2.55.0


