Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12351.1794579787284363502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=BA/kEWla;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.52, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50692e6c0aso19731166b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794579785; x=1795184585; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCF5gfZd6sUkjbRTj1SPhiThZb5DxQIOnFaQ8gb57kg=;
        b=BA/kEWlazLJw1b+yCS8CBmXs+7P1UEKv+aS6mBX3CErzybt84sJqBjB3l4T+IryPP4
         MUadwuKVD4yOGfH4xcpDWJ1W6vOmzv22v7aTQ85gdEQDnXSpgVynIhVHmFA/yW5otmBc
         s4md5Ph5+oFJTmxT7GEbhkOKgLc6FXtlcs8lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579785; x=1795184585;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCF5gfZd6sUkjbRTj1SPhiThZb5DxQIOnFaQ8gb57kg=;
        b=WWztE6lfLanbwC/+0eI7J+86ckH8ZK10KDJnrI0an+YovfgYDPCCeyJGY3LHSVQEIz
         ue5pJU/X+Byst9DrAu/iVrqlgz0VvaZ49tRGk+ZGVrfDJdd3isFIdIr+fXyMxKszbi9F
         cfzTLfzBu6lkzkqQux5pvDJNBIJGMXMk+9T1w19JT6BIA2sLldhw2TmLAXXSmeSccH9J
         MM/Uahm2/qYFLR0XAN0qykrUuXbvYC7BFcOLsoTmnuIUf9LProTVFZL4k0rwhZ2/cyxr
         66mCVavnaJ3mElDgYj06NcDDxhJbfahfQLYz5dLajbWpVCyy+RIoVw3BIUpWeQc4EixR
         2vUA==
X-Gm-Message-State: APuU4Z/JYXLg3+Z+8FUBXnuKygq3J9R+wGTf4XIHV5gD2AfcCOb+6Ut6
	P9uOz0labdchHQ6VFLZMQHcZJhLh8C9Nh2B756KiI5omsiB3+Mtje6LXRPBOa4AqQ5uXIv/8BGn
	NQtuzYK8=
X-Gm-Gg: AYBFou2wSh9cORKa01Iv5sZVYTd2s0GakZYloMAuc2otboqtf0Kf3xLzadDUDOyAHKK
	iEOK0Y2Xmjd7RqoBMOdH/CcTbxdHcG1ah9Jik+WqiJXkW9StiVFjkOTGUD347fWvmcOSHhyZ3Lr
	mVtxHG+AkkvVDLH5X8UDU1aqJrWknnpXcdzTAl8ChOfjK1MgdBvcgc6QqLx/FMNAZqCtoUzOf4X
	dIbm6Vd/dQpXBAcJJeDVHToazEasMXAoHpb6NlJ4aefziOCFmpnU79A0/XN5xxFHbTL/h4DP0+x
	/Hyk1QyXPaBFW6E8ozYDxytgAGeKblAeGHgJ1USTgmZwJwSApyooxuZ3eJZ69MeP2CfpDosL/6G
	oAGZnJ/RTw6f1GbzT5V3d7F/Jg5QOW16lG730JrkdcE1BPjTxuOel4gADFis/6pwtWuP+fklSw4
	MwFGi45WclQCppZw2uXKqeuuU9kTqjoZvRD60cXVVHOpIRp16B37tN2QN3vPge3N8EFCgzzh61k
	CvloDYfHkapnM0nptLq2lxnAMZbqaGlO0rd2LHM2nsVgveAJQ0n+3dl5CLtnj8I9TaEpUa1AJ5V
	xJKs32GrThk6sCRpo7JsZZVHLKitlugmuz4cCvFrnzkj2O9sDe+Jm71IITUinf2B5QUwzsOU95x
	cqqaS1ZK/CZ0K8AUMSrSgZMSEaHgIhyVKkRSZEMi0h23QO0jioNnCXftMRQ3MalZP+noSVluN3N
	pCCXVCCqdkaJV8ewtT2i2R7vWXrP7+CTjaRqXNRD5XWqvphlfKr8S1JfBXqrhjsl1+Uu4jSg38G
	rvE7cyHj4IY5z8=
X-Received: by 2002:a17:907:6eaa:b0:c4d:1768:48eb with SMTP id a640c23a62f3a-c50962f0b77mr417108266b.2.1794579785411;
        Fri, 13 Nov 2026 06:23:05 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.arnhem.chello.nl (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm104620666b.78.2026.11.13.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:23:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v14 5/5] dnf: bump to version 5.4.8.0
Date: Fri, 13 Nov 2026 15:22:58 +0100
Message-ID: <20261113142259.1708386-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
References: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250175
Content-Type: text/plain; charset="utf-8"

Drop the two upstreamed patches

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0006-rename-stdout-stderr-members.patch   | 205 ------------------
 ...f5-offline-fix-build-without-systemd.patch |  35 ---
 .../dnf/{dnf_5.4.7.0.bb => dnf_5.4.8.0.bb}    |   4 +-
 3 files changed, 1 insertion(+), 243 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch
 rename meta/recipes-devtools/dnf/{dnf_5.4.7.0.bb => dnf_5.4.8.0.bb} (97%)

diff --git a/meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch b/meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch
deleted file mode 100644
index 68d1f33df3..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch
+++ /dev/null
@@ -1,205 +0,0 @@
-From 42a4a73832913ce018cdc0147805ae324abb47a0 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Tue, 3 Nov 2026 12:33:12 +0100
-Subject: [PATCH] libdnf5: subprocess: rename stdout/stderr members of
- CompletedProcess
-
-The C standard allows stdin, stdout and stderr to be defined as macros, which MUSL does:
-```
-  #define stdout (stdout)
-  #define stderr (stderr)
-```
-
-This breaks the build when cross-compiling on systems that use MUSL instead
-of glibc with the following error:
-  libdnf5/utils/bootc.cpp:44:74: error: expected unqualified-id before '(' token
-
-Rename the members to stdout_data and stderr_data to fix building against
-musl.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf5/pull/3024]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- libdnf5/utils/bootc.cpp                | 11 +++---
- libdnf5/utils/subprocess.cpp           |  4 +--
- libdnf5/utils/subprocess.hpp           |  4 +--
- test/libdnf5/utils/test_subprocess.cpp | 50 +++++++++++++-------------
- 4 files changed, 36 insertions(+), 33 deletions(-)
-
-diff --git a/libdnf5/utils/bootc.cpp b/libdnf5/utils/bootc.cpp
-index 0027e02887..305114f30b 100644
---- a/libdnf5/utils/bootc.cpp
-+++ b/libdnf5/utils/bootc.cpp
-@@ -41,7 +41,8 @@ std::unique_ptr<json_object, decltype(&json_object_put)> get_bootc_status() {
-     // Check whether command failed (non-zero exit code)
-     if (result.returncode != 0) {
-         // Command ran but failed; show stderr to user
--        std::string stderr_content(reinterpret_cast<const char *>(result.stderr.data()), result.stderr.size());
-+        std::string stderr_content(
-+            reinterpret_cast<const char *>(result.stderr_data.data()), result.stderr_data.size());
-         if (!stderr_content.empty()) {
-             throw libdnf5::RuntimeError(M_("Error checking bootc status: {}"), stderr_content);
-         } else {
-@@ -50,7 +51,7 @@ std::unique_ptr<json_object, decltype(&json_object_put)> get_bootc_status() {
-         }
-     }
- 
--    std::string stdout_content(reinterpret_cast<const char *>(result.stdout.data()), result.stdout.size());
-+    std::string stdout_content(reinterpret_cast<const char *>(result.stdout_data.data()), result.stdout_data.size());
-     std::unique_ptr<json_object, decltype(&json_object_put)> root(
-         json_tokener_parse(stdout_content.c_str()), json_object_put);
- 
-@@ -120,7 +121,8 @@ void make_usr_writable() {
-         // Set up transient overlay
-         const auto & result = subprocess::run("bootc", {"bootc", "usr-overlay", "--read-only"});
-         if (result.returncode != 0) {
--            std::string stderr_content(reinterpret_cast<const char *>(result.stderr.data()), result.stderr.size());
-+            std::string stderr_content(
-+                reinterpret_cast<const char *>(result.stderr_data.data()), result.stderr_data.size());
-             if (!stderr_content.empty()) {
-                 throw libdnf5::RuntimeError(M_("Error running `bootc usr-overlay --read-only`: {}"), stderr_content);
-             } else {
-@@ -139,7 +141,8 @@ void make_usr_writable() {
-     const auto & result = subprocess::run("mount", {"mount", "--options-source=disable", "-o", "remount,rw", "/usr"});
- 
-     if (result.returncode != 0) {
--        std::string stderr_content(reinterpret_cast<const char *>(result.stderr.data()), result.stderr.size());
-+        std::string stderr_content(
-+            reinterpret_cast<const char *>(result.stderr_data.data()), result.stderr_data.size());
-         throw libdnf5::RuntimeError(M_("Failed to remount /usr as read-write: {}"), stderr_content);
-     }
- }
-diff --git a/libdnf5/utils/subprocess.cpp b/libdnf5/utils/subprocess.cpp
-index 33299e0fec..3175d804f2 100644
---- a/libdnf5/utils/subprocess.cpp
-+++ b/libdnf5/utils/subprocess.cpp
-@@ -259,8 +259,8 @@ CompletedProcess run(const std::string & command, const std::vector<std::string>
- 
-     return CompletedProcess{
-         .returncode = returncode,
--        .stdout = stdout_bytes,
--        .stderr = stderr_bytes,
-+        .stdout_data = stdout_bytes,
-+        .stderr_data = stderr_bytes,
-     };
- }
- 
-diff --git a/libdnf5/utils/subprocess.hpp b/libdnf5/utils/subprocess.hpp
-index 7a5066ea30..73f3934bc4 100644
---- a/libdnf5/utils/subprocess.hpp
-+++ b/libdnf5/utils/subprocess.hpp
-@@ -11,8 +11,8 @@ namespace libdnf5::utils::subprocess {
- 
- struct CompletedProcess {
-     int returncode;
--    std::vector<std::byte> stdout;
--    std::vector<std::byte> stderr;
-+    std::vector<std::byte> stdout_data;
-+    std::vector<std::byte> stderr_data;
- };
- 
- /// @brief Run a command in a child process and wait for it to complete.
-diff --git a/test/libdnf5/utils/test_subprocess.cpp b/test/libdnf5/utils/test_subprocess.cpp
-index 20fdb7c52c..55084a2193 100644
---- a/test/libdnf5/utils/test_subprocess.cpp
-+++ b/test/libdnf5/utils/test_subprocess.cpp
-@@ -34,8 +34,8 @@ void UtilsSubprocessTest::test_stdout_capture() {
-         libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", "echo 'Hello, World!'"});
- 
-     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
--    CPPUNIT_ASSERT_EQUAL(std::string("Hello, World!\n"), bytes_to_string(result.stdout));
--    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr));
-+    CPPUNIT_ASSERT_EQUAL(std::string("Hello, World!\n"), bytes_to_string(result.stdout_data));
-+    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr_data));
- }
- 
- 
-@@ -45,8 +45,8 @@ void UtilsSubprocessTest::test_stderr_capture() {
-         libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", "echo 'Error message' >&2"});
- 
-     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
--    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout));
--    CPPUNIT_ASSERT_EQUAL(std::string("Error message\n"), bytes_to_string(result.stderr));
-+    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout_data));
-+    CPPUNIT_ASSERT_EQUAL(std::string("Error message\n"), bytes_to_string(result.stderr_data));
- }
- 
- 
-@@ -56,8 +56,8 @@ void UtilsSubprocessTest::test_stdout_and_stderr_capture() {
-         "/usr/bin/env", {"/usr/bin/env", "sh", "-c", "echo 'stdout line'; echo 'stderr line' >&2"});
- 
-     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
--    CPPUNIT_ASSERT_EQUAL(std::string("stdout line\n"), bytes_to_string(result.stdout));
--    CPPUNIT_ASSERT_EQUAL(std::string("stderr line\n"), bytes_to_string(result.stderr));
-+    CPPUNIT_ASSERT_EQUAL(std::string("stdout line\n"), bytes_to_string(result.stdout_data));
-+    CPPUNIT_ASSERT_EQUAL(std::string("stderr line\n"), bytes_to_string(result.stderr_data));
- }
- 
- 
-@@ -66,8 +66,8 @@ void UtilsSubprocessTest::test_exit_code_success() {
-     const auto result = libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", "exit 0"});
- 
-     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
--    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout));
--    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr));
-+    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout_data));
-+    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr_data));
- }
- 
- 
-@@ -97,17 +97,17 @@ void UtilsSubprocessTest::test_binary_data() {
-     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
- 
-     // Verify stdout contains the expected binary data
--    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(5), result.stdout.size());
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x00), result.stdout[0]);
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x01), result.stdout[1]);
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x02), result.stdout[2]);
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xff), result.stdout[3]);
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xfe), result.stdout[4]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(5), result.stdout_data.size());
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x00), result.stdout_data[0]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x01), result.stdout_data[1]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x02), result.stdout_data[2]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xff), result.stdout_data[3]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xfe), result.stdout_data[4]);
- 
-     // Verify stderr contains the expected binary data
--    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(2), result.stderr.size());
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x03), result.stderr[0]);
--    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x04), result.stderr[1]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(2), result.stderr_data.size());
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x03), result.stderr_data[0]);
-+    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x04), result.stderr_data[1]);
- }
- 
- 
-@@ -131,20 +131,20 @@ done
-     const auto result = libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", script});
- 
-     // The expected size is: 1000 × 100 bytes = 100,000 bytes per stream
--    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stdout.size());
--    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stderr.size());
-+    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stdout_data.size());
-+    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stderr_data.size());
- 
-     // Verify the command succeeded (didn't deadlock or error)
-     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
- 
-     // Verify the data is correct (should be all a's on stdout, b's on stderr)
-     // Check first few bytes (only if we have data)
--    if (result.stdout.size() > 0) {
--        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout[0]);
--        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout[100]);
-+    if (result.stdout_data.size() > 0) {
-+        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout_data[0]);
-+        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout_data[100]);
-     }
--    if (result.stderr.size() > 0) {
--        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr[0]);
--        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr[100]);
-+    if (result.stderr_data.size() > 0) {
-+        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr_data[0]);
-+        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr_data[100]);
-     }
- }
diff --git a/meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch b/meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch
deleted file mode 100644
index dba69d4bd9..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 81405407f84d87ebec7c3f9eeeaafaa148e9f462 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Fri, 6 Nov 2026 13:29:35 +0100
-Subject: [PATCH] dnf5: offline: fix build without systemd
-
-The plymouth argument of reboot() is only used when dnf5 is built with
-systemd support. Without it, the argument is unused and the build fails:
-
-  dnf5/commands/offline/offline.cpp:277:53: error: unused parameter
-  'plymouth' [-Werror=unused-parameter]
-
-Mark the argument as [[maybe_unused]].
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf5/pull/3030]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- dnf5/commands/offline/offline.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf5/commands/offline/offline.cpp b/dnf5/commands/offline/offline.cpp
-index 74123e2..f95ecdc 100644
---- a/dnf5/commands/offline/offline.cpp
-+++ b/dnf5/commands/offline/offline.cpp
-@@ -274,7 +274,7 @@ void invalidate_if_not_valid(libdnf5::offline::OfflineTransactionState & state,
-     }
- }
- 
--void reboot(bool poweroff = false, PlymouthOutput * plymouth = nullptr) {
-+void reboot(bool poweroff = false, [[maybe_unused]] PlymouthOutput * plymouth = nullptr) {
-     if (std::getenv("DNF_SYSTEM_UPGRADE_NO_REBOOT")) {
-         if (poweroff) {
-             std::cerr << "DNF_SYSTEM_UPGRADE_NO_REBOOT is set, not powering off." << std::endl;
--- 
-2.56.0
-
diff --git a/meta/recipes-devtools/dnf/dnf_5.4.7.0.bb b/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
similarity index 97%
rename from meta/recipes-devtools/dnf/dnf_5.4.7.0.bb
rename to meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
index d07b5e1f9f..2373114cd3 100644
--- a/meta/recipes-devtools/dnf/dnf_5.4.7.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
@@ -37,11 +37,9 @@ SRC_URI = "\
     file://0003-Do-not-hardcode-system_cachedir.patch \
     file://0004-add-support-for-gcc-12-and-below.patch \
     file://0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch \
-    file://0006-rename-stdout-stderr-members.patch \
-    file://0007-dnf5-offline-fix-build-without-systemd.patch \
 "
 SRC_URI:append:class-native = " file://0001-Do-not-hardcode-the-systemd-unit-directory.patch"
-SRCREV = "a42787112973edb4e5ba237d4fca6f878ac5f4c1"
+SRCREV = "01329a46d840894d9fac207f06ed5bc37e752612"
 
 inherit bash-completion cmake gettext pkgconfig siteinfo systemd
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3targetconfig', '', d)}
-- 
2.56.1

