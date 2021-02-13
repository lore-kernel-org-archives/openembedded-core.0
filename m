Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.986.1613177967616142554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jMm2UCej;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id v7so1403743wrr.12
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gbz0eDFSxhfe87qaBWEHENipbZRUVT1+u+RMKmixXn0=;
        b=jMm2UCeja7fetxkqaAvYUyeaPMxZ5vHB4krnlRMZlABt3vTPnR2QGPiZma9N9BfddT
         MIHEBIjcmLCcB8yU5p2naXLLLe6G6kYJncha96rWDEwixCvFPYG1Z10z5g4953Xrk4vF
         YiYQ+B0QR3RBLe1L/8zASj/pOFNu74wX3TE97jsAoSoG48kIFSiUIw86WwSwu8MUt01L
         ge/KtG4cWImjpHfRcJGnKsj+IInY0DHO9SbfmNrcuLSsTeXQPAh35NVWQnUKINWbNOhi
         yL5Olgsp0cz8HWUKUESPTsZoFAM2SMDXlrxrKawBd/a0o4QJabpBNyzaKsf7NfKEEsXE
         YoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gbz0eDFSxhfe87qaBWEHENipbZRUVT1+u+RMKmixXn0=;
        b=nj3RDivPNVNuPIZYqnzMjwqvMshs+q63ezKyIdoOrPw5yebdu0fKuN0xTVeVZi3PdG
         q/tCnPqSXPlFOlCo99ddk3T27qGT2lLbqzdO+ixRMf6ph6ejvPok9Ld46uzjdnFTQn1m
         3bxzBxGp7gClHHx2yw74NCRbovxrvG6i4d7i9/9WsJbSPyqdTA5YjfHwD65cijTzC9C0
         pDenMmEXkXfhIo0gzVxwjDeV6SX23NPrOzEZaXRMDHhG7VjmL/3/r1r/2hNBdN1DCNz+
         sHIeI3JeMsmZlzk/0PezY/zfuhJv6PIMT3NvU3YijqfEOsEtd5oGi/92JmelxXWbchvX
         K23A==
X-Gm-Message-State: AOAM532BN0pCLNRTq6YyVw46rJQSp4+evpvMMjJw6rzE/AbLedVs4FTs
	5u3y0Odjc+dgZ91sdGXcgtsEF9D3xWaNfg==
X-Google-Smtp-Source: ABdhPJyQjucEDPByNxnOJ1c5DX3wLJJMkVYyGXz5K/hNeY8spBmhrV/8yCVbxRYyUG6Yvw6Nd4OVqQ==
X-Received: by 2002:a5d:5246:: with SMTP id k6mr3698490wrc.7.1613177966234;
        Fri, 12 Feb 2021 16:59:26 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b15sm12259195wrr.47.2021.02.12.16.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:59:25 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/5] glslang: generate glslang pkg-config
Date: Sat, 13 Feb 2021 00:59:20 +0000
Message-Id: <20210213005922.180552-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210213005922.180552-1-quaresma.jose@gmail.com>
References: <20210213005922.180552-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- it will be useful for shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../0001-generate-glslang-pkg-config.patch    | 47 +++++++++++++++++++
 .../glslang/glslang_11.1.0.bb                 |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
new file mode 100644
index 0000000000..ef092f17a1
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -0,0 +1,47 @@
+From 6692611126b40d499c94bbcc8e29604560262072 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 7 Feb 2021 01:30:39 +0000
+Subject: [PATCH] generate glslang pkg-config
+
+Based on https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-compatibility.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
+---
+ glslang/CMakeLists.txt      |  2 ++
+ glslang/glslang.pc.cmake.in | 11 +++++++++++
+ 2 files changed, 13 insertions(+)
+ create mode 100644 glslang/glslang.pc.cmake.in
+
+diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
+index 1c7d22a2..10c1e841 100644
+--- a/glslang/CMakeLists.txt
++++ b/glslang/CMakeLists.txt
+@@ -209,6 +209,8 @@ if(ENABLE_GLSLANG_INSTALL)
+                 EXPORT  glslangTargets
+                 ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+     endif()
++    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
++    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+     install(EXPORT glslangTargets DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
+ 
+diff --git a/glslang/glslang.pc.cmake.in b/glslang/glslang.pc.cmake.in
+new file mode 100644
+index 00000000..64b6882d
+--- /dev/null
++++ b/glslang/glslang.pc.cmake.in
+@@ -0,0 +1,11 @@
++    prefix=@CMAKE_INSTALL_PREFIX@
++    exec_prefix=@CMAKE_INSTALL_PREFIX@
++    libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
++    includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
++    
++    Name: @PROJECT_NAME@
++    Description: OpenGL and OpenGL ES shader front end and validator
++    Requires:
++    Version: @GLSLANG_VERSION@
++    Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
++    Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
index fe21dbcf50..9b7c098743 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -9,7 +9,8 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
 SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
+           file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-- 
2.30.1

