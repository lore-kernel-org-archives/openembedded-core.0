Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.45505.1597677141577378563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sw8XXdxh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id t10so7661623plz.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+AtBM9NejlQsLsXE3Esek7CTorrUaoivhZdAZYztLjo=;
        b=sw8XXdxhfFPmMGanu8BVMcPNPhJpHWv3t1ouImIa7oyfAvk4y/dPiKZLQOCeiqhu9S
         DZZ+GxafQIQwv47SKGdQP9P6dWgp0d5Dmm8ve32ck9aYhy/csyV5i0IZTnKUmxxcLJfK
         NSaejd4oXI8eJBJBt0dn/PHvDhSZcUOBrhbsgqV4uWzv/PsULnsi51lHj1vjGP1t5iRo
         +7BtKX2v5KQWscGjmEOId3WMw5VUWth6cDGaNrALgKIUy9kRArPEptA1Dn2ce5omcj/m
         reFcTjWhDG2gYYbq3TH1uaXOWLAD3VbN7LJFCn4bCDpHd/FuHcKTkA+M1ANZp1PQuf9y
         1wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+AtBM9NejlQsLsXE3Esek7CTorrUaoivhZdAZYztLjo=;
        b=T4gcpqJ+FXdXhQIHDXQ6rPYlEpt/uKZRWUC9Kv5t+t+T9WRajMo9937Ka5XRC3XxIV
         7x2cmWRnTEmkC5a7kJSZMmVAOBjZ2HOHb+UBdlD7M3lR/XnGdtyK6sfcPdSEok+vFKXj
         YEa5j0znUhoyEr1SFSxSO/aIXJlpfYwUv3teENAL2vc7mBz4zR8k0oRvnTOwEg/VYP8e
         dZHSphxfi0/RjN1JyynWbPv5BOhHJJqMMeg3W4mXcKLkqiydSaJRKgSi6Fw/REEmqXB+
         Wz3OxZfQJFpufWVfHjr++ExEKK7V8pSxiH+VFyekzetu6Mgut2z1q/4v4hJQsFOds8hi
         8m8Q==
X-Gm-Message-State: AOAM533hMiPZCe3to4wIzZCyC+LMitHxujy6RomKuu2c4iDcKW+3DuFt
	5YJC8+vJ8v+xcaZPXMilVplPi7xCHbtbmhaL4yA=
X-Google-Smtp-Source: ABdhPJyufdk/g2cn8yErmpu/5RGZ0+FeRjVbMPXWnsCZyJwwzODwpJm/GHKLc++a/zLBwXnLCQnVKw==
X-Received: by 2002:a17:902:6b81:: with SMTP id p1mr11570052plk.183.1597677140589;
        Mon, 17 Aug 2020 08:12:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] linux-yocto-rt/5.4: update to rt32
Date: Mon, 17 Aug 2020 05:11:49 -1000
Message-Id: <7c4b2aa7f1b4d047a552072924fb97762d776803.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    2739bdb0bfa0 Linux 5.4.54-rt32
    0124e412ea96 Linux 5.4.52-rt31
    d85676a72421 Linux 5.4.49-rt30
    72bbd8083a44 Linux 5.4.48-rt29

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b21783c173594e5dac3c437e290b26643382c2e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ec0beeba76..6d3adb5dbd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "37478f8c6f336b271b26e783c14bcaf7fa8ca9a6"
-SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
+SRCREV_machine ?= "2739bdb0bfa0d9b423ffa940150e539c80bc0bfd"
+SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9881b09a9f..3cc8537973 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "58d322d637edd20fe24aadfdc0d621f63700c009"
 SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
+SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3829748269..7904850317 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
 SRCREV_machine_qemux86-64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
 SRCREV_machine_qemumips64 ?= "3a515b583c3efc896cafa4f7f1e784456a360f8f"
 SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
+SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

