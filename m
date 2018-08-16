Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7353974601
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 04:12:07 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id w10-v6so1438859pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 21:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DM623naAdaIlsELnFLx33Z1sPguvjwJJ3uKVuqrVA60=;
	b=RdVHbo3qP4b6PwZpg4uloaJNsb4ZICACZ3e50muZFMc6uY1hhkuJnePctBKVYCz+3f
	TRAX8VfjQpB4WWIK4ALQujy/Biq8kp8PF43S6nDJCQTdy3z91hHSaa8XozdcUA6+4w42
	nsKqM5Ck0ke8RbkXv2fNkXhMl5sNZEgos8TV+8gCJCsQlaAHN+hwwkw0z+aDTImYza5Q
	Ked5DPLLZShRIvM1z7TzpZkmhbP+Q0aNCoifeP4/niGeLIQAYWzNuz/MRD8BBMVMvgYV
	MVfNN/1HBHbn0r7Vu6dv5eJzRWE7qTU83t5zak1Ki/JsyKJC5shi6YLrX1kw2eIslyHJ
	vMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DM623naAdaIlsELnFLx33Z1sPguvjwJJ3uKVuqrVA60=;
	b=N/NQbed2v2Oe0LuU8EpTI4hh7Gq3LRjOkXe4Hrg1KdChFEH/2neJK+tNGBSJvxWFRW
	7IIUBMNeVgrRj2THgrifVQ22sdpw1fvKfs8Exlju/vJaiRI6fhx0Is1jzGlZwvputG0Z
	BWoc5pxwzLSUgX8nWgJjoGDqpN44Ne6pp6sawvV6xjT7vZ472hlU8Py9IQq9YlT1+u3z
	KY7XK5Ww6V6jrkV3hCgX1o3FIWz/7P5uFIYics5lHuXkBYc20u5Tvi0j26Uo9dHAPxT0
	gMZfsZyS218oJGPWjyCUcRCBv0Qno6uG/UUWQLdp63pN1Db4FuOAk7xPcd/u3SxCQoZH
	KTaw==
X-Gm-Message-State: AOUpUlEJAmD5S5ChfD0ZtWRB/Q93KStHV5TO5X1fVK8GG8HJ6tz30LrV
	o/vaMeoGp+QTor11cjO+LdOeF03Y
X-Google-Smtp-Source: AA+uWPzYCAr2TYPK2v0H/zthdiCyoOyhwc5sPJd3GqEkmSzgRl69Xdiz8MQ/VUTTG7BJiT3IGXAzkg==
X-Received: by 2002:a63:d916:: with SMTP id
	r22-v6mr26991566pgg.381.1534392728079; 
	Wed, 15 Aug 2018 21:12:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	u9-v6sm47623075pfi.104.2018.08.15.21.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 21:12:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 21:12:00 -0700
Message-Id: <20180816041200.44366-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] llvm: Update to 6.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 04:12:07 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Drop an already applied patch

 ...able-generating-a-native-llvm-config.patch | 41 -------------------
 meta/recipes-devtools/llvm/llvm_git.bb        |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch b/meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch
deleted file mode 100644
index 2809e4c594..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7f7743ce233fcd735ec580c75270413493658aa6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Apr 2018 18:08:31 -0700
-Subject: [PATCH] Disable generating a native llvm-config
-
-OpenEmbedded already builds this as part of llvm-native
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/llvm-config/CMakeLists.txt | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/tools/llvm-config/CMakeLists.txt b/tools/llvm-config/CMakeLists.txt
-index 25f99cec978..c45e9b642a8 100644
---- a/tools/llvm-config/CMakeLists.txt
-+++ b/tools/llvm-config/CMakeLists.txt
-@@ -63,19 +63,3 @@ endif()
- 
- # Add the dependency on the generation step.
- add_file_dependencies(${CMAKE_CURRENT_SOURCE_DIR}/llvm-config.cpp ${BUILDVARIABLES_OBJPATH})
--
--if(CMAKE_CROSSCOMPILING)
--  set(${project}_LLVM_CONFIG_EXE "${LLVM_NATIVE_BUILD}/bin/llvm-config")
--  set(${project}_LLVM_CONFIG_EXE ${${project}_LLVM_CONFIG_EXE} PARENT_SCOPE)
--
--  add_custom_command(OUTPUT "${${project}_LLVM_CONFIG_EXE}"
--    COMMAND ${CMAKE_COMMAND} --build . --target llvm-config --config $<CONFIGURATION>
--    DEPENDS ${LLVM_NATIVE_BUILD}/CMakeCache.txt
--    WORKING_DIRECTORY ${LLVM_NATIVE_BUILD}
--    COMMENT "Building native llvm-config..."
--    USES_TERMINAL)
--  add_custom_target(${project}NativeLLVMConfig DEPENDS ${${project}_LLVM_CONFIG_EXE})
--  add_dependencies(${project}NativeLLVMConfig CONFIGURE_LLVM_NATIVE)
--
--  add_dependencies(llvm-config ${project}NativeLLVMConfig)
--endif(CMAKE_CROSSCOMPILING)
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cb3bba6fab..bb83012231 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,13 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "089d4c0c490687db6c75f1d074e99c4d42936a50"
+SRCREV = "5136df4d089a086b70d452160ad5451861269498"
 PV = "6.0"
 BRANCH = "release_60"
-PATCH_VERSION = "0"
+PATCH_VERSION = "1"
 SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};protocol=http \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
-           file://0001-Disable-generating-a-native-llvm-config.patch \
           "
 UPSTREAM_CHECK_COMMITS = "1"
 S = "${WORKDIR}/git"
-- 
2.18.0


