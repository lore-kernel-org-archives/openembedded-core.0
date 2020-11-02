Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.1169.1604335761725651727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RhcIa7p8;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id p5so19838789ejj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lqTQPpl36lUeLMAhWbWYyhftnRgoIxJs5yp33l/VedU=;
        b=RhcIa7p8VH+KL+gOTsfJQa0gF7hEUpIrqmNGIjKbnWIvNuc0z1iEBi0gfBgKkdLZJU
         xoJDLWb2Ofz9/6cJ66E81mbvdWO6Nnk6COYvk4y80hZTKZaJTWe2mMxVGMFblD4fzIgi
         TDo00vz0baHfmMe3yqXfj4gk//3Hm2Yw5dqbUQkVN0jqahsuOwg4/A7KItXta8zPYs9R
         2vV9HGFYQTlo+FPfjN7ztMr8EyEPlXtY5rrZsrn5BfdKbICrUZ38jfcGCL7Lzl1fYUeJ
         0L5GEQyb0Ye86/ONBWOhdq7GBqb0XGXwcbDsHd2KmBeTkKE0L/Meryu4UD49YNj/tWoa
         Dfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqTQPpl36lUeLMAhWbWYyhftnRgoIxJs5yp33l/VedU=;
        b=PsMRPp7SBzyl3wbvEHwIgZP4iqLrETR04oC7gcEiJFmHDCMr+HlLeC8z+PdRDH2usy
         xENfDzEUIoDo0yB/9DPuOQGOVpWva74AUKHSN2STvKXJ0GY88wddayvPn4y8V6sFc+UT
         X1U3FU3/i8qwoyeHMmahqwQ3N/5lJFRp4ufBlORwLxYRs4kRLPUcHeqelrghVoR5Q/Zu
         v+bQmtxR3WeMpaJeNsLeoVFcimbhWSR6HgITGs8dRlfJvhMYZd6PPNzbsWE14YNzTtOE
         kdeygCdwLT8EGvAV0VcUcBTYgQhxXIODoyZ6QjiPt8N8f0tfkGKpBRx2naMfBbNJLkUF
         pUVg==
X-Gm-Message-State: AOAM530qj/ORC7mJ0gzdsSb8FzUXyVVjtL97zen1PSb5bSbiEqizQ+11
	I2ZONt5AL3icpI6gAGAtwfrEDmms1iHSrg==
X-Google-Smtp-Source: ABdhPJxmaOiiTkI2/MInb6le7C7ZZLTZniS37QMrry9zU6jmitf/m04kVFD6gdWqffGz/rurQNKldw==
X-Received: by 2002:a17:906:6805:: with SMTP id k5mr16761362ejr.79.1604335759865;
        Mon, 02 Nov 2020 08:49:19 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:19 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/80] spirv-tools: upgrade 2019.5 -> 2020.5
Date: Mon,  2 Nov 2020 17:47:49 +0100
Message-Id: <20201102164907.27572-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-Avoid-pessimizing-std-move-3124.patch | 50 -------------------
 ...-tools_2019.5.bb => spirv-tools_2020.5.bb} |  5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
 rename meta/recipes-graphics/spir/{spirv-tools_2019.5.bb => spirv-tools_2020.5.bb} (89%)

diff --git a/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch b/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
deleted file mode 100644
index 9b48cdcd09..0000000000
--- a/meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4fffcd275b50d08b54b0411679ead98970651bad Mon Sep 17 00:00:00 2001
-From: David Neto <dneto@google.com>
-Date: Fri, 27 Dec 2019 12:05:58 -0500
-Subject: [PATCH] Avoid pessimizing std::move (#3124)
-
-Should fix a warning
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/8aa423930db37e37086665efcc55944d577c06e5]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/opt/pass_fixture.h | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/test/opt/pass_fixture.h b/test/opt/pass_fixture.h
-index 53fb206f..64c089d8 100644
---- a/test/opt/pass_fixture.h
-+++ b/test/opt/pass_fixture.h
-@@ -60,8 +60,7 @@ class PassTest : public TestT {
-   // from pass Process() function.
-   std::tuple<std::vector<uint32_t>, Pass::Status> OptimizeToBinary(
-       Pass* pass, const std::string& original, bool skip_nop) {
--    context_ =
--        std::move(BuildModule(env_, consumer_, original, assemble_options_));
-+    context_ = BuildModule(env_, consumer_, original, assemble_options_);
-     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
-                                   << original << std::endl;
-     if (!context()) {
-@@ -197,8 +196,7 @@ class PassTest : public TestT {
-   // messages.
-   template <typename PassT, typename... Args>
-   void SinglePassRunAndFail(const std::string& original, Args&&... args) {
--    context_ =
--        std::move(BuildModule(env_, consumer_, original, assemble_options_));
-+    context_ = BuildModule(env_, consumer_, original, assemble_options_);
-     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
-                                   << original << std::endl;
-     std::ostringstream errs;
-@@ -235,8 +233,7 @@ class PassTest : public TestT {
-   void RunAndCheck(const std::string& original, const std::string& expected) {
-     assert(manager_->NumPasses());
- 
--    context_ =
--        std::move(BuildModule(env_, nullptr, original, assemble_options_));
-+    context_ = BuildModule(env_, nullptr, original, assemble_options_);
-     ASSERT_NE(nullptr, context());
- 
-     context()->set_preserve_bindings(OptimizerOptions()->preserve_bindings_);
--- 
-2.24.1
-
diff --git a/meta/recipes-graphics/spir/spirv-tools_2019.5.bb b/meta/recipes-graphics/spir/spirv-tools_2020.5.bb
similarity index 89%
rename from meta/recipes-graphics/spir/spirv-tools_2019.5.bb
rename to meta/recipes-graphics/spir/spirv-tools_2020.5.bb
index 0b54706974..5e42987240 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2019.5.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.5.bb
@@ -14,10 +14,9 @@ SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
            git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
            git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
            file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch;destsuffix=${DEST_DIR}/effcee \
-           file://0001-Avoid-pessimizing-std-move-3124.patch \
 "
-SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
-SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
+SRCREV_spirv-tools = "b27e039c68dd9eb959bb9249fcb2c9a54841474b"
+SRCREV_spirv-headers = "3fdabd0da2932c276b25b9b4a988ba134eba1aa6"
 SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
 SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
 SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
-- 
2.29.0

