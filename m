Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.10076.1620227954494775674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qFGTWVW8;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l4so3426662ejc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siRbpo0qY/CC7Iu6wTQ7qSfJI1yL7i0SuKyyjh0iqqI=;
        b=qFGTWVW8gKqE0xr0yA728KdZ8U/5mz4NE3DirEfIBKwlYstQVEab9s0Cs8SqhWy3mA
         ZFZvnD3tP5W660TqbIuGDTFF//mTrggp1QdZHQIQDMuuNHXw/ayGb6Qhtp1BdEJZLQLp
         kU/JL1Rr9OXyeBVpl8wpvZ46WQbWBJwHcxAOCQDFFzfyxVGnVjsCdBOqohU3nNL3krXr
         5qqOeOZR6ulXpfXop1ZF+rpbxZIXb/D+e4pzAvEi9FgkZXGsPz/kBuZs3WHQGSE30Y/S
         jQapLgQbraGYS/oW0t6gYUm9J3ZV+FAzWSASaGNrYz4IgmQW/4P0JfYngi4X7MxbRTaQ
         VS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siRbpo0qY/CC7Iu6wTQ7qSfJI1yL7i0SuKyyjh0iqqI=;
        b=F3vu+0Wemq9nQ+d/Q/H69w5Y6EEYotlyUPYxXrFufHdpMPJ3KvN7QhgDYCkNRWabro
         bOkpPUN1Zds4WZu1lIutFBAx5MeLM79ANpENPWD/uBj95SDYMant8L46yn0GLtHdb6dp
         gqYyELpEl2qcxmVbNhjPc9OsrzcN7YV2bW6fQQw32L4+p7DFAT9YxQ6LL/jVHwuM32bI
         RaJq2FWKpXUsLE91ZIC7ABzS2mpaZAtAlHY1VkxbP2LrwI4wOcPURFiJNiZ9QRBLRDyI
         icImMGu7TZLq597Z1SPnQEUO9GW4217n7QUxMIUX/EWA+3YSCfrMYsyeX1S+BhWsv82V
         E8tQ==
X-Gm-Message-State: AOAM532k5jUYv1Ca7VGXOJ6QnDxEeGoEjDslMX7Ip+kYwjFmci92xe6h
	Mc3RtXd217Y1yFJ6KC2w0Y/AZxh0jjsc5g==
X-Google-Smtp-Source: ABdhPJw1JQBDCpgfuS5p7/vqHb26AXZZ3fmK3rDtIcBSAGf8o2CR3rUwmMEoPJJqfOsgHZSNJweXqA==
X-Received: by 2002:a17:906:fb8e:: with SMTP id lr14mr22510869ejb.357.1620227952957;
        Wed, 05 May 2021 08:19:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/61] virglrenderer: update 0.8.2 -> 0.9.1
Date: Wed,  5 May 2021 17:18:10 +0200
Message-Id: <20210505151850.660512-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch,
issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d-libc-check-to-be-platform-OS-check.patch | 36 -------------------
 ...nderer_0.8.2.bb => virglrenderer_0.9.1.bb} |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.8.2.bb => virglrenderer_0.9.1.bb} (78%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch
deleted file mode 100644
index a0ac3aefdd..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3d30df8d8ccb919733b5339b2a82474305b83998 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Aug 2019 01:19:48 +0000
-Subject: [PATCH] gallium: Expand libc check to be platform OS check
-
-endianness on musl based systems can also be detected in same way as
-glibc, therefore check for __linux__ define instead of __GLIBC__
-
-Fixes build on musl/mips
-
-| ../../../../git/src/gallium/include/pipe/p_config.h:171:2: error: #error Unknown Endianness
-| #error Unknown Endianness
-|  ^~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/gallium/include/pipe/p_config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/include/pipe/p_config.h b/src/gallium/include/pipe/p_config.h
-index d603681..71cdf49 100644
---- a/src/gallium/include/pipe/p_config.h
-+++ b/src/gallium/include/pipe/p_config.h
-@@ -130,7 +130,7 @@
-  * Endian detection.
-  */
- 
--#ifdef __GLIBC__
-+#ifdef __linux__
- #include <endian.h>
- 
- #if __BYTE_ORDER == __LITTLE_ENDIAN
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
similarity index 78%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index 52821195d1..3991895823 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -9,9 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/libgl libepoxy"
-SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
-           file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
+SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
+SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
 
-- 
2.31.1

