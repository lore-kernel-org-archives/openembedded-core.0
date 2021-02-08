Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.33753.1612781983346077995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rbzvx+On;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id q2so14388409eds.11
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLEzxEN4cD4mOrl3tOaU1cZp1Rs9ivcrXvfRYcMYMbI=;
        b=Rbzvx+OnZ4ryxQBTyfRSQmGddjmjIuNNyPOUqe4jI+VCyxyXoz+Z8cfuN2JmJc1Gmo
         dAxr4bynDEnKyYKPRZboh+1fajMk7Ngx3RgNIcA+3Lg4T/kNj8QjS3WPHryac7nBPTro
         TRrameCRuV9DWC2e0U8jHXfTHwsEp/W8GRBCmhhu04Yrv9dUn9zk9hievT4cJ1vvw3WA
         nbVZmdicbynlqVdN5pbEQMPgIf3ydOr/6YyyN7CppfIuxRljJBGUQwwyIdP4VS7LyQQX
         12HQiLDX01MnxfyVkOGYstQvRdzqlwstDh51QXDqv7H1zdfuRJSWhxrPUj8ytnA6jUky
         XBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLEzxEN4cD4mOrl3tOaU1cZp1Rs9ivcrXvfRYcMYMbI=;
        b=ZcZO4ERO1dIVM3FQU3bW9gTHkI4BKjD1KBJh1QGrzaUK5WZ9A0b4iEpA58QQN+d1sH
         xTpmBGBuieKJIfgp+fTJpA00/36EnAKowhJujp3D1DYJsT59vd8tr7R3yzo2WHpwqSlK
         Ouc/gEuFLsfo0DyhBZw26PwN03W/ty48wM++uHFWJ7IUSjEv6MFYlOD/8+CNVbWtZ+9n
         UPvpcSCFH4DofX/hFXAEtLLl6VHdYRwpy/5AxKLTtNeyA4nDbCEbngXvtLkYRBHTYDc/
         4KEIZ0RY1YMbF2B77YG5l7/7Jm0v3TM2ET+77E28eHUgQHoOCE6wB7w9LdLR71lkTYXS
         ac2Q==
X-Gm-Message-State: AOAM532DzmLqor+r9bdOJI+ZPBWpqcgk/wdo4ze/TqNHpYb5B7TjcWlH
	zeopAeH0AbKw9uroi/5kOSA/BiDjsrkKcQ==
X-Google-Smtp-Source: ABdhPJxcRcyOs59zfK7cO6MMR30q3t1h+fxZa+oadRCQcaDx0+gGvqTQNh/AosBdsmnMs9maus8y6Q==
X-Received: by 2002:a50:fe89:: with SMTP id d9mr6159449edt.57.1612781981801;
        Mon, 08 Feb 2021 02:59:41 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:41 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/12] vulkan-samples: update to latest revision
Date: Mon,  8 Feb 2021 11:59:25 +0100
Message-Id: <20210208105932.347925-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...inst-libatomic-if-no-built-in-atomic.patch | 117 ------------------
 .../vulkan/vulkan-samples_git.bb              |   3 +-
 2 files changed, 1 insertion(+), 119 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
deleted file mode 100644
index 6c0fb60868..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From e20a5d13935a41a856e8f71c49f2cc9d81b1d92c Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 13 Nov 2020 17:07:00 +0800
-Subject: [PATCH] support link against libatomic if no built-in atomic exist
-
-fix error:
-| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
-| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `__atomic_load_8'
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/212]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- CMakeLists.txt                  |  1 +
- bldsys/cmake/check_atomic.cmake | 62 +++++++++++++++++++++++++++++++++
- framework/CMakeLists.txt        |  4 +++
- 3 files changed, 67 insertions(+)
- create mode 100644 bldsys/cmake/check_atomic.cmake
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e72e829..466f51d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -42,6 +42,7 @@ endmacro(vulkan_samples_pch)
- include(utils)
- include(global_options)
- include(sample_helper)
-+include(check_atomic)
- 
- # Add third party libraries
- add_subdirectory(third_party)
-diff --git a/bldsys/cmake/check_atomic.cmake b/bldsys/cmake/check_atomic.cmake
-new file mode 100644
-index 0000000..6b47a7a
---- /dev/null
-+++ b/bldsys/cmake/check_atomic.cmake
-@@ -0,0 +1,62 @@
-+# check weither need to link atomic library explicitly
-+INCLUDE(CheckCXXSourceCompiles)
-+INCLUDE(CheckLibraryExists)
-+
-+if(NOT DEFINED VULKAN_COMPILER_IS_GCC_COMPATIBLE)
-+  if(CMAKE_COMPILER_IS_GNUCXX)
-+    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON) 
-+  elseif( MSVC )
-+    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE OFF)
-+  elseif( "${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang" )
-+    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON) 
-+  elseif( "${CMAKE_CXX_COMPILER_ID}" MATCHES "Intel" )
-+    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON) 
-+  endif()
-+endif()
-+
-+# Sometimes linking against libatomic is required for atomic ops, if
-+# the platform doesn't support lock-free atomics.
-+
-+function(check_working_cxx_atomics varname)
-+  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
-+  set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} -std=c++11")
-+  CHECK_CXX_SOURCE_COMPILES("
-+#include <atomic>
-+std::atomic<int> x;
-+std::atomic<short> y;
-+std::atomic<char> z;
-+int main() {
-+  ++z;
-+  ++y;
-+  return ++x;
-+}
-+" ${varname})
-+  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
-+endfunction(check_working_cxx_atomics)
-+
-+function(check_working_cxx_atomics64 varname)
-+  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
-+  set(CMAKE_REQUIRED_FLAGS "-std=c++11 ${CMAKE_REQUIRED_FLAGS}")
-+  CHECK_CXX_SOURCE_COMPILES("
-+#include <atomic>
-+#include <cstdint>
-+std::atomic<uint64_t> x (0);
-+int main() {
-+  uint64_t i = x.load(std::memory_order_relaxed);
-+  (void)i;
-+  return 0;
-+}
-+" ${varname})
-+  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
-+endfunction(check_working_cxx_atomics64)
-+
-+set(NEED_LINK_ATOMIC  OFF CACHE BOOL "weither need to link against atomic library")
-+if(VULKAN_COMPILER_IS_GCC_COMPATIBLE)
-+    # check if non-64-bit atomics work without the library.
-+    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
-+    # check 64-bit atomics work without the library.
-+    check_working_cxx_atomics64(HAVE_CXX_ATOMICS64_WITHOUT_LIB)
-+    if (NOT HAVE_CXX_ATOMICS_WITHOUT_LIB OR NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB)
-+        set(NEED_LINK_ATOMIC  ON CACHE BOOL "weither need to link to atomic library" FORCE)
-+    endif()
-+endif()
-diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
-index bf26786..322526e 100644
---- a/framework/CMakeLists.txt
-+++ b/framework/CMakeLists.txt
-@@ -412,6 +412,10 @@ target_link_libraries(${PROJECT_NAME}
-     ctpl
-     docopt)
- 
-+if(${NEED_LINK_ATOMIC})
-+    target_link_libraries(${PROJECT_NAME} atomic)
-+endif()
-+
- # Link platform specific libraries
- if(ANDROID)
-     target_link_libraries(${PROJECT_NAME} log android native_app_glue)
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index a61dddeb3b..05b9e855d7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
-           file://0001-support-link-against-libatomic-if-no-built-in-atomic.patch \
            file://debugfix.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "fdc8fab1a520df5566de3eda7b526b24f04e6379"
+SRCREV = "524cdcd27005e7cd56e6694fa41e685519d7dbca"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.29.2

