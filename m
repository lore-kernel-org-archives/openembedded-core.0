Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED427C87FCA
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 07:35:45 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.13078.1754206544358518322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 00:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nEVO9k3V;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso4286286a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 00:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754206542; x=1754811342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ua6DPVxgGD+7YV7WDmWAcZpFe4Ovdz56db6tYvGa53E=;
        b=nEVO9k3Vd0xeVV+hc4ZUquhpupHM9WoJyvtMahUZGNlR4/M9qry/lso5bEnyHO3A8I
         M5wxNRILAz0kgz2m9vW0BFIw5VD8YOJwJ5VZJORC3lHVkCPHEMVh4FaD7cy5BsxXBNNK
         VBt5y+bkXQ5l+V5/REM3dQFKPBCBvbHc38lycnmYV8nBswq19e39xnB/TkfGuSvpl1G6
         kK8yuYl+APbOlG3H4wrNf7Z/1e9N66El5rdv/tmC0zvcrc25nOdXkTW1GKqVYYdMaySf
         1dA7RyGCq5ZKMbd/NMmuIUH2tTR5lXF9sio+SrzOnwF8ijt1TfRxyb1n5rmx1ZK89UXM
         cy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754206542; x=1754811342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ua6DPVxgGD+7YV7WDmWAcZpFe4Ovdz56db6tYvGa53E=;
        b=BQBx9ppnj6gcF0/5jX4QOIL8dXdgEZcbXXNlTS6AMpq/5HlOIx3hah8DEfdUAjTvC7
         0cqGUY5aruNWDr60iMLa6kcKmSz60CmHtTkpuj+6zkveJKh29MBT7+DUhK8uwDCF6FAR
         0L42yNwR+VgazgNAqPNTRvBHfBTe2p6Y3FlARZFHj/TApUiAfXPuBskMAkPPRpztEPHd
         N9iKxX634XOBCPIKi+SZ1OD466iktaEZG3HvTObpmIPgIOJNAxfhqc+BGKjUE/XfZ8jt
         NW2SthajUlWVmS28oY99zAJMcYj6hUZOBJjmoY0Dylcw+conGEJbCYNJBGPI2R9v6zPg
         lYjA==
X-Gm-Message-State: AOJu0YzAsSt0+jS89HV8YYp0Rrqf2/fg4X8vl8SZN9MNGhl/IGvxKuQo
	qyzc7gN80g8smt7Kg3CxUfeX9hjncVzoTtg3/1s3gLFe5Db4NGXiVGuRPcRS9A==
X-Gm-Gg: ASbGnct5TzswPz26jpxXWBBlJfT2NOUIX0aW3M088zw9fYk0CUqRL2i26VPutpSAZru
	yApFplL8e0v0R+4X1eMmzBSCXCPpnI7NK5DHjwHD+y1Akf8PC8rWGfWgJ5L9I8Qu5giEQ29uyOW
	5Pe34KRLO8pU8owG0g+kSkuX/3WI23BSkowbPmmtl5dDsQtbthGjDiaSSxbSF6OREDYGfWAK4Xh
	mQg1jET6YmtLnOqIuRTsH8tNjT4RWB7l6kCa8H5ms4g0pE9+kG10bXiv5zLQc3gsqw1t73e671L
	tz2c1zR4cvU0LxNzBPhEnxtn7MmaE3kqJZVsEf/LUTZs9fN4vnplMqbgmQPcbeyZXEgG+bN8Swo
	v3ciKS8m2AK3bF3d9AdPAFlnCvFMXng==
X-Google-Smtp-Source: AGHT+IGsyDIBMuKWS3YVLafMJxWzCPiD9cVDEYCNilJ1RtuGvS1D8SiEp2aPjnIaqN+XznP+82Orpw==
X-Received: by 2002:a17:907:7fa8:b0:af1:428f:dcb2 with SMTP id a640c23a62f3a-af94015602cmr518998366b.35.1754206541997;
        Sun, 03 Aug 2025 00:35:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm549673066b.117.2025.08.03.00.35.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 00:35:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: upgrade 2.48.2 -> 2.48.5
Date: Sun,  3 Aug 2025 09:35:41 +0200
Message-ID: <20250803073541.2210769-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 07:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221406

Changelog:
2.48.5:
Fix several crashes.

2.48.4:
Improve emoji font selection with USE_SKIA=ON.
Improve playback of multimedia streams from blob URLs.
Fix the build with USE_SKIA_OPENTYPE_SVG=ON and USE_SYSPROF_CAPTURE=ON.
Fix the build on LoongArch with USE_SKIA=ON.
Fix crash when using a WebKitWebView widget in an offscreen window.
Fix several crashes and rendering issues.

2.48.3:
Fix a crash introduced by the new threaded rendering implementation using Skia API.
Improve rendering performance by recording layers once and replaying every dirty region in different worker threads.
Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=0.
Fix a reference cycle in webkitmediastreamsrc preventing its disposal.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...1-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch | 2 +-
 meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch        | 2 +-
 .../webkit/{webkitgtk_2.48.2.bb => webkitgtk_2.48.5.bb}         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.2.bb => webkitgtk_2.48.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 8376ee8472..f990384511 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -60,7 +60,7 @@ diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompile
 index f5ec0a55..dfd741e7 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -492,3 +492,10 @@ endif ()
+@@ -503,3 +503,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 82d20758c2..4b0cf364d8 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -24,7 +24,7 @@ diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaSc
 index 76c46889..500be433 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -334,8 +334,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
      UNUSED_VARIABLE(t2);
      UNUSED_VARIABLE(t3);
      UNUSED_VARIABLE(t5);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
index 75a39558db..947996450d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            "
-SRC_URI[sha256sum] = "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37"
+SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

