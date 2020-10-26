Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.11297.1603712354053692090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YF5OPd2v;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id h7so12061202wre.4
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/t6gKqtPDfOZJZaPZuD8glMhzQmhsYz11IVVbeO6EMU=;
        b=YF5OPd2vM8jve3UhQfl6NvTraLBpGpgfu1PV766tg/GbAhqZCGBV4d3nYtaG+8MvCx
         qJEcqzM0IUOU2/ImZiSBX8pY+3AYRQxuFgCh6ZHCLxKQeX+0UoIqI/jz4sYQaVu8mASq
         qv8FLpOm/yro4oCgcJ+698rVonsP+RoeGCu8y4N0TtYvyA7rZWuc+KWuHEZ/3b0UXhAa
         F2WRx7TPe5EMJzzKqAL1B9varUAojKN4S3dCxLiSM17pRhs2WKDv9jDFXm9miIOjYzfl
         mRtrPJ6v/chnJaEZ0h8AJn9pmKh9ZZJbYc+ZhMEF/HvfSFLPFi+QNuPUA+vI5N2r0Tq/
         0GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/t6gKqtPDfOZJZaPZuD8glMhzQmhsYz11IVVbeO6EMU=;
        b=SyRX1SuDekvvV3if6CSse5uhJql4eFBmVQwVngmfqiGUSc4KX692AD/wWY1Vg84zAk
         5LRsz8VN7Im3/qe1dO4mGqlv9BcN9wHcC0WCLk7qRcvv8KATqOu0nTBnzg63Fgv4nOoS
         ZR4onQY5XXMKK1Rl6B5UXWzLJm9xMlrmKoiluqqimg+Sm5BJ/NVKiOKiw+mBIYLP9+9Y
         2jTvwu55PAiPOPlqmm51jra4BcvYivq97dPTqTF+9PTPBoxmbYkHm0Z+SjgCNZotmWNy
         HzDAlhNs7tjpHSFDhVuHsc5OwbgIgp35AN/IFieXuqJwrpFpM7qx780s7dnYWevlyi54
         cvHA==
X-Gm-Message-State: AOAM531E2Po3px9M6lZlYgInKhVXXFQwJhwLH4lG3w4gJgV+bT7QWjlU
	6vGIR1/epL4Yt6PUldHeF9PPZYu27fD8DxsA
X-Google-Smtp-Source: ABdhPJwux0iNX2NZ0OXVzqi2l31b5lFuICO71ysWJfoTfPEyJr6u9hJcKOvFs6wQmwyr1QuIhWnpHw==
X-Received: by 2002:a5d:6a86:: with SMTP id s6mr17327920wru.344.1603712352169;
        Mon, 26 Oct 2020 04:39:12 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id d129sm20348493wmf.19.2020.10.26.04.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 04:39:11 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 1/6] spirv-tools: import from meta-oe to OE core
Date: Mon, 26 Oct 2020 11:39:01 +0000
Message-Id: <20201026113906.2217226-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
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
2.29.0

