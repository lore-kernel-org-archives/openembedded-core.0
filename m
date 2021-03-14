Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.5567.1615726435462625489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 05:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gs7KAzrp;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e9so4276010wrw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wVUnjkYFvyJy8ZTJK3xRTdhAsfh9y98nrFkMFDpgnhg=;
        b=gs7KAzrpgCm5dfu26SvofQYbKWiP4eEl0KzxLGbvk4h4/NqXM2Rlfhlmcz2jYF3iMG
         5MbWwZYkXV7wPMCKAHlLSMd1NYkDc36AkQ9Dx6lLlPv3w/2F3X98lTJe1hWHBswUFEY3
         AIao2UHocViWNS4QkXbsV93t0/Pm2FtwJTC4g36C0PWBvSyNGNeHFPL1nBklUQihlJHI
         tAbk/2G7gVT18VeDiuRho33+YgOxNnBHIVt8PIHTmtTk+ET4grfpoMBN7yNS5Ge8/UBb
         xkiZ1zQ2jNpMWARhVY9dIgEfbnuGhjsGHzHJpSzEA8O7B7iL6R5flmP8rF0emP/W8iyx
         x+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wVUnjkYFvyJy8ZTJK3xRTdhAsfh9y98nrFkMFDpgnhg=;
        b=ceJQHWpjgeFoPVXzzbq0dK63kAXnW9RfIMUXIx3tPvNpCcgNNRp9cHDSdI6UdRZHhB
         bWmickL1z/YaFmsHSfLW1jmJvART5hzxyaosOp+pZk9lAKCA2w4dAJhk9s7ozQEYaq5x
         5739skAvPRIasD/LbjJr6ov9zMbRkyFYGjY0LPgZsJHWgjZz8sKsbv/7Sn4bRSp7Iebm
         7GWkw+oXByO5E1xg7RsVrWxlzkMDjjzieTzZrnwhe7iAbTYFzc2TIjBUbRHtT5cahdLA
         ofTYTyTGuIpK6JfqJLrVPFdUhWr3nKy48vjU/cthm0xHWjDqwiQ8Yb6bMmBKWjgvniGQ
         6UmA==
X-Gm-Message-State: AOAM532zKsEg0z3oUcSqwPPauwWDPZWiZVgncVsOHmTi8KX1XJeV/IlQ
	TlQXcVU0/XKOnuoyN3XnsU6nsDjKeW/uMw==
X-Google-Smtp-Source: ABdhPJyut7zvBqT1wlUBXuDc3iARYMOZpGxBaYQ1bzFOHbhFHA+R+ZO3Qr7N1/NnKz7Q64lpeubXwQ==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr23206988wrt.192.1615726433608;
        Sun, 14 Mar 2021 05:53:53 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id s3sm8831727wmd.21.2021.03.14.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 05:53:53 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] spirv-tools: cleanup an old patch that is not used anymore
Date: Sun, 14 Mar 2021 12:53:44 +0000
Message-Id: <20210314125344.30018-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314125344.30018-1-quaresma.jose@gmail.com>
References: <20210314125344.30018-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch

diff --git a/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch b/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
deleted file mode 100644
index 5d37da8fe0..0000000000
--- a/meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From caf59c46ea5dc49e4dbf756c642b03e52c1b5468 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Dec 2019 07:02:24 -0800
-Subject: [PATCH] Respect CMAKE_INSTALL_LIBDIR in installed CMake files
-
-Upstream-Status: Submitted [https://github.com/google/effcee/pull/36]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt        | 1 +
- effcee/CMakeLists.txt | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
---- a/external/effcee/CMakeLists.txt
-+++ b/external/effcee/CMakeLists.txt
-@@ -27,6 +27,7 @@ endif()
- 
- include(cmake/setup_build.cmake)
- include(cmake/utils.cmake)
-+include(GNUInstallDirs)
- 
- add_subdirectory(third_party)
- add_subdirectory(effcee)
---- a/external/effcee/effcee/CMakeLists.txt
-+++ b/external/effcee/effcee/CMakeLists.txt
-@@ -14,8 +14,8 @@ install(
-   DESTINATION
-     include/effcee)
- install(TARGETS effcee
--  LIBRARY DESTINATION lib
--  ARCHIVE DESTINATION lib)
-+  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
- 
- if(EFFCEE_BUILD_TESTING)
-   add_executable(effcee-test
-- 
2.30.2

