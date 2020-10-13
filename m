Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.803.1602610537125816464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E5MgayrW;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id g12so250536wrp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CliKoApzSySZSwxky5VScddvqVFC8M6dlJ7oNzjviuM=;
        b=E5MgayrWekZckPXBl6JjDJG1O1DfebfTkoRvM9quaAgp2xGxqqxaLqVX9a929KdR7/
         L8WDqRikfCY0RkWPDiryx6r5Er+NIZSksH4BuM+bDUu7tOomHZ6CDH/y8RiZRUehdOVG
         mrKVKqmf9DhkdkHfsXwBMco6P/GUtL3kMc4qPDn+1ywjJ/3s6/6aXHF+EA4L8qX1Bz80
         DKNOGM43/YYD/9JaD2BITzfo9eDwmfJ0xvEheogElpgsjCb4kK2vAqwfN67UkxQQG7yb
         q7rO07a+q2fXmqqWyGRc1DYeKHKEKpU/BuaIRVgZ3102a872V4I3G6G6fhDA33+8Q4RZ
         dttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CliKoApzSySZSwxky5VScddvqVFC8M6dlJ7oNzjviuM=;
        b=YbAepBCJyHrhTE+qJh36dOy1BOFxHFJGAsDDaX72GXX8q7IelZrWOo5w/Nqmyzfbyf
         mG0rH79ZQdDmoofjEhmOMdKH/XZpp+qMBzGIhXoKaMN+5ZioEDu6zrf0hv1rEfHNA6ar
         iMFHSDGGsvTlmXMsT/zgIBj2xfipNRf2DcZ7hrfrwaptDwAQfJd3M9RnMM1CcqNr8S4F
         2Jjv1kl8TSgE57KsYHnDrpcvjFpJsk7QPOLqK0qtI7R2CbMGRvH7VDBsKhC+mlDatnHm
         TMBaGvadjSmapqkMD7LmJllNO2PgqPWyxWEtcHxm4FrBFK68sJ05TbX+H676E5x6wIA6
         ysKg==
X-Gm-Message-State: AOAM530gzSIqYvN/FwC1plnXL/dTAEy6qvu5WSK065MCuPGJLQaEjNYU
	JZYjnXLMEMOqMJ8PG+ZorXL93R1NtdqBAA==
X-Google-Smtp-Source: ABdhPJyTEZPB9AEsstm5FqPaZcCbNApAToeyia0nQU/8QSft0qVx28lFAGz+FJc7mHx4f0QiUU5teQ==
X-Received: by 2002:adf:979c:: with SMTP id s28mr892881wrb.62.1602610535401;
        Tue, 13 Oct 2020 10:35:35 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w1sm297412wrp.95.2020.10.13.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:35:34 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/5] spirv-tools: import from meta-oe to OE core
Date: Tue, 13 Oct 2020 18:34:58 +0100
Message-Id: <20201013173502.2245733-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013173502.2245733-1-quaresma.jose@gmail.com>
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This receipe is needed to build the new shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++++++++++++++
 ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++
 meta/recipes-graphics/spir/spirv-tools_git.bb | 35 +++++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
 create mode 100644 meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
 create mode 100644 meta/recipes-graphics/spir/spirv-tools_git.bb

diff --git a/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch b/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
new file mode 100644
index 0000000000..9b48cdcd09
--- /dev/null
+++ b/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
@@ -0,0 +1,50 @@
+From 4fffcd275b50d08b54b0411679ead98970651bad Mon Sep 17 00:00:00 2001
+From: David Neto <dneto@google.com>
+Date: Fri, 27 Dec 2019 12:05:58 -0500
+Subject: [PATCH] Avoid pessimizing std::move (#3124)
+
+Should fix a warning
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/8aa423930db37e37086665efcc55944d577c06e5]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/opt/pass_fixture.h | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/test/opt/pass_fixture.h b/test/opt/pass_fixture.h
+index 53fb206f..64c089d8 100644
+--- a/test/opt/pass_fixture.h
++++ b/test/opt/pass_fixture.h
+@@ -60,8 +60,7 @@ class PassTest : public TestT {
+   // from pass Process() function.
+   std::tuple<std::vector<uint32_t>, Pass::Status> OptimizeToBinary(
+       Pass* pass, const std::string& original, bool skip_nop) {
+-    context_ =
+-        std::move(BuildModule(env_, consumer_, original, assemble_options_));
++    context_ = BuildModule(env_, consumer_, original, assemble_options_);
+     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
+                                   << original << std::endl;
+     if (!context()) {
+@@ -197,8 +196,7 @@ class PassTest : public TestT {
+   // messages.
+   template <typename PassT, typename... Args>
+   void SinglePassRunAndFail(const std::string& original, Args&&... args) {
+-    context_ =
+-        std::move(BuildModule(env_, consumer_, original, assemble_options_));
++    context_ = BuildModule(env_, consumer_, original, assemble_options_);
+     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
+                                   << original << std::endl;
+     std::ostringstream errs;
+@@ -235,8 +233,7 @@ class PassTest : public TestT {
+   void RunAndCheck(const std::string& original, const std::string& expected) {
+     assert(manager_->NumPasses());
+ 
+-    context_ =
+-        std::move(BuildModule(env_, nullptr, original, assemble_options_));
++    context_ = BuildModule(env_, nullptr, original, assemble_options_);
+     ASSERT_NE(nullptr, context());
+ 
+     context()->set_preserve_bindings(OptimizerOptions()->preserve_bindings_);
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch b/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
new file mode 100644
index 0000000000..5d37da8fe0
--- /dev/null
+++ b/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
@@ -0,0 +1,35 @@
+From caf59c46ea5dc49e4dbf756c642b03e52c1b5468 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Dec 2019 07:02:24 -0800
+Subject: [PATCH] Respect CMAKE_INSTALL_LIBDIR in installed CMake files
+
+Upstream-Status: Submitted [https://github.com/google/effcee/pull/36]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt        | 1 +
+ effcee/CMakeLists.txt | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+--- a/external/effcee/CMakeLists.txt
++++ b/external/effcee/CMakeLists.txt
+@@ -27,6 +27,7 @@ endif()
+ 
+ include(cmake/setup_build.cmake)
+ include(cmake/utils.cmake)
++include(GNUInstallDirs)
+ 
+ add_subdirectory(third_party)
+ add_subdirectory(effcee)
+--- a/external/effcee/effcee/CMakeLists.txt
++++ b/external/effcee/effcee/CMakeLists.txt
+@@ -14,8 +14,8 @@ install(
+   DESTINATION
+     include/effcee)
+ install(TARGETS effcee
+-  LIBRARY DESTINATION lib
+-  ARCHIVE DESTINATION lib)
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+ if(EFFCEE_BUILD_TESTING)
+   add_executable(effcee-test
diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
new file mode 100644
index 0000000000..8e8388e8d4
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -0,0 +1,35 @@
+SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
+processing SPIR-V modules"
+DESCRIPTION = "The project includes an assembler, binary module parser, \
+disassembler, validator, and optimizer for SPIR-V."
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "graphics"
+
+S = "${WORKDIR}/git"
+DEST_DIR = "${S}/external" 
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
+	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
+	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
+	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
+        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
+        file://0001-Avoid-pessimizing-std-move-3124.patch \
+"
+SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
+SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
+SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
+SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
+SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
+
+do_install_append() {
+	install -d ${D}/${includedir}/spirv
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+}
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*.so"
-- 
2.28.0

