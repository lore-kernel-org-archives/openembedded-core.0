Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B8BECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:50 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.2176.1666901786417403665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SNCRNs0a;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id l11so3583290edb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBQvjZLPOkY79ELgO2NUHh6264OwRlSsAMHcyu/qIGk=;
        b=SNCRNs0aj/82p56gEkoHHC2V+xGKr3p7JkAk44PY8XEt48cdGcVYFRWBatM9X/U0+q
         YkAvGg31xCplC38RrVR8vzL6XbNXtdJ6lUMlqplvQXmPhOj6bXnvSZT2dXG7wzPj6i5W
         QdscQUkBkJQkSjzZVh2ODaJynvqwq8t1Lqwjg0NwhS95LQO3eGHyC9mmR8emD7dbagBh
         T6fCPx5IBQlVXRDgUcoX4FHgWNJQfpxi9y6OwLreJkMXjUAFds/YP04aS2I8nzOZtWuM
         aYwbxRTFtSTzt18nz29Snl7WpV/eu732WvCXnp1yNqQiiaw4K2VPCCE5l0op8T2NlT3A
         1nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBQvjZLPOkY79ELgO2NUHh6264OwRlSsAMHcyu/qIGk=;
        b=ivmauamTW5iOLaSsjE5z3ysuKHueIbrHqIiB5dLActiUcbPCnQkUpPFAaFJBwPMy7Z
         Bd8e4MKFsQrV0KvKvheMAB0PvmI4F4V4ha7jYe1Yqe7Cki1YPssplXjHuZ4aPo8FekLh
         NuImVHaTwYDYJz57k7k580oS/6ZNSBEgrUReenV7YODwqWdytHo9ILeVNxzm54Zr9by3
         1Cl9ey5kmZa9FlI6cSVPVcOSENZhqiJrqv7+mXC4ZtPcmKjOHk9xvTNFJKjbhsG5Ii99
         kdOILyxB3bZshDaitzcWvahXIZU8Ec+RLv/fTnDRnXeXGGnNgrNJRE30YSeE8KYUKCqF
         DagQ==
X-Gm-Message-State: ACrzQf2VznWP7P361SuY6qO2T0a+SPF4y6MGTw550KqCMFr2X/vDt7wT
	lAwNWNb1bg9uob7lSCg4jLQqNalkyohvTg==
X-Google-Smtp-Source: AMsMyM7GQq9uDE5PJghQ9YhOC87wzuwjomXSCfscPW6V045cObyMySrZjdgwcn7X4G7L5QkYuWbLaQ==
X-Received: by 2002:a17:907:2e0d:b0:78e:1d21:8001 with SMTP id ig13-20020a1709072e0d00b0078e1d218001mr42953020ejc.246.1666901788834;
        Thu, 27 Oct 2022 13:16:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/23] vulkan: update 1.3.216.0 -> 1.3.224.1
Date: Thu, 27 Oct 2022 22:15:56 +0200
Message-Id: <20221027201611.3644334-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172227

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-generate-glslang-pkg-config.patch    | 18 +++++-----
 ...lang_1.3.216.0.bb => glslang_1.3.224.1.bb} |  2 +-
 ....3.216.0.bb => spirv-headers_1.3.224.1.bb} |  0
 ...ult-copy-constructor-in-header.-4879.patch | 34 -------------------
 ..._1.3.216.0.bb => spirv-tools_1.3.224.1.bb} |  6 ++--
 ...3.216.0.bb => vulkan-headers_1.3.224.1.bb} |  2 +-
 ....3.216.0.bb => vulkan-loader_1.3.224.1.bb} |  4 +--
 ...1.3.216.0.bb => vulkan-tools_1.3.224.1.bb} |  2 +-
 8 files changed, 16 insertions(+), 52 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.216.0.bb => glslang_1.3.224.1.bb} (95%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.1.bb} (100%)
 delete mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.1.bb} (88%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.224.1.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.216.0.bb => vulkan-loader_1.3.224.1.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.216.0.bb => vulkan-tools_1.3.224.1.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index cddd330971..b1548c7343 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 6692611126b40d499c94bbcc8e29604560262072 Mon Sep 17 00:00:00 2001
+From 7161916f69ae257ce06d9c9bf25abf9709bc55cc Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -16,21 +16,21 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 1c7d22a2..10c1e841 100644
+index 45c9813a..cea13975 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -209,6 +209,8 @@ if(ENABLE_GLSLANG_INSTALL)
-                 EXPORT  glslangTargets
-                 ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-     endif()
+@@ -221,6 +221,8 @@ if(ENABLE_GLSLANG_INSTALL)
+         endif()
+     ")
+     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
  
-     install(EXPORT glslangTargets DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
- 
+     set(ALL_HEADERS
+         ${GLSLANG_HEADERS}
 diff --git a/glslang/glslang.pc.cmake.in b/glslang/glslang.pc.cmake.in
 new file mode 100644
-index 00000000..64b6882d
+index 00000000..948a0952
 --- /dev/null
 +++ b/glslang/glslang.pc.cmake.in
 @@ -0,0 +1,11 @@
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
index 69d9a0a84e..dd8df15fc7 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "adbf0d3106b26daa237b10b9bf72b1af7c31092d"
+SRCREV = "10423ec659d301a0ff2daac8bbf38980abf27590"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch b/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
deleted file mode 100644
index 044c366a75..0000000000
--- a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a90ccc240501bf3362b23f67771f65b7dec2ccf9 Mon Sep 17 00:00:00 2001
-From: Jamie Madill <jmadill@chromium.org>
-Date: Fri, 29 Jul 2022 14:26:37 -0400
-Subject: [PATCH] Remove default copy constructor in header. (#4879)
-
-A recent libc++ roll in Chrome warned of a deprecated copy. We're
-still looking if this is a bug in libc++ or a valid warning, but
-removing the redundant line is a safe workaround or fix in either
-case.
-
-See discussion in https://crrev.com/c/3791771
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/pull/4879]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- source/opt/merge_return_pass.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/source/opt/merge_return_pass.h b/source/opt/merge_return_pass.h
-index a35cf269..d15db2f6 100644
---- a/source/opt/merge_return_pass.h
-+++ b/source/opt/merge_return_pass.h
-@@ -118,8 +118,6 @@ class MergeReturnPass : public MemPass {
-     StructuredControlState(Instruction* break_merge, Instruction* merge)
-         : break_merge_(break_merge), current_merge_(merge) {}
- 
--    StructuredControlState(const StructuredControlState&) = default;
--
-     bool InBreakable() const { return break_merge_; }
-     bool InStructuredFlow() const { return CurrentMergeId() != 0; }
- 
--- 
-2.37.2
-
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
index fc1074d8b8..cfea28a6ef 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
@@ -7,10 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
-           file://0001-Remove-default-copy-constructor-in-header.-4879.patch \
-          "
+SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
index 5f7917ae82..8d34738ad7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
+SRCREV = "c896e2f920273bfee852da9cca2a356bc1c2031e"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
index 15a079879b..f24db87962 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.216;protocol=https"
-SRCREV = "322f7e3212b4fd9d70d7f48972963c83d24d06e4"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.224;protocol=https"
+SRCREV = "09afdf64210b11ec653a1001e013b5af4fce8559"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
index e26f4504f1..bed10afef1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
-SRCREV = "ef9db7a8ec52f6c56158d83f5d57ef388c1abec1"
+SRCREV = "497f232680b046db34ba9e9da065e6303a125851"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


