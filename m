Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.180.1630174387344857213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=m9OliVcs;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id b10so13539626ioq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PGXXpbQZoqYug7sI5rzZZlxF7r04OpXwOTZc+rJO7QA=;
        b=m9OliVcswtCiZfZIDkeB7sfZ6LNk2vyYATLL6mAfoBpf1kCyCgI7RzXn5kApeNGOn5
         c5C33EYoYUXwPHSSGgcHjivbOggZuA2J7Is3S40GxR9opvrdmRBwTERSDU8BMdGXE32z
         2OpKbqn2fw4FQQIlwd0AE836bYSe6qWWFzvGFSyzJZTYMCDk72xi7wb+5v6YSmHLVZyM
         o4M7SwbyoTuq5bY/wiSA32lrAr1gzGZa8+17G3ArHkDz/xygb1Fau8Bx/znYumQdc6z8
         vRivqN0HfsVXNL7YpHQcaTmLx3o1ksMrwREn50253NvmHLp1HrDAKnHYz0in7DGDsybB
         YLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PGXXpbQZoqYug7sI5rzZZlxF7r04OpXwOTZc+rJO7QA=;
        b=uecGi7I4bYNdWVAhq8KQ7zNBt/Wo6Rc71QG1UVSeP488zg6Mm/4pxHjA3BLXskkIRU
         GoGOzIrwB82WgOCmLjsAJEcDu/5ZtSTPKHs7gIgV9N+OV9AFPIG6OPW1wpkVBWFonj2k
         Q+lfxbUVyMix6mY2aXi1YcLQbUpopoNb/BsBhQcki8VIikP0WKMDyGVFOaZYx/Ft92Tk
         1+0bB/M7DnTKOEuGFcv20BztNhysTFfRxQG66qiUg04+RkkD2uRCmpZ520ipP/CM7Mhn
         UNlB2HeS6cKLaAD2dWN372xK2fjvsaiSJMO6/AzvMpvuAnbZhRQhmnLuUTjvw9Xqk7Wg
         m5cg==
X-Gm-Message-State: AOAM533yRZd+3LjDsLfHcz7fR4ddjkyRQ9ld3K5S+3jcgfLUfkFModiB
	r8JBzxm9a5b14zGdS5XR0Vu/zFdk2yDqdIeW
X-Google-Smtp-Source: ABdhPJzwfuJoUB/grZG0uasVA4wzpSqMUpvf+iPaSCTadmb2Nv4Qea4utXk/N28aQDL1e1yduhBLuw==
X-Received: by 2002:a5d:9653:: with SMTP id d19mr12069139ios.74.1630174385970;
        Sat, 28 Aug 2021 11:13:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/36] qemu: fix CVE-2021-20257
Date: Sat, 28 Aug 2021 08:11:03 -1000
Message-Id: <1317053b23e1a4c1e5c7331a97f248e042415bea.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: https://git.yoctoproject.org/git/poky
MR: 110290
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=5c1a29e6deec8f92ac43363bd72439aec7e27721
ChangeID: 7f301e939cf9d1fdb826ac47d1fc96430086a68e
Description:

(From OE-Core rev: 5b66ff7972951db973d12f3dae6ccecf3bc29e56)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 547ac986a74cfcae39b691ebb92aadc8436443ea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c1a29e6deec8f92ac43363bd72439aec7e27721)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20257.patch            | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e64a6b2cb2..1ddb373115 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,6 +71,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_8.patch \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
+           file://CVE-2021-20257.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
new file mode 100644
index 0000000000..7175b24e99
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
@@ -0,0 +1,55 @@
+From affdf476543405045c281a7c67d1eaedbcea8135 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:45:28 +0800
+Subject: [PATCH] e1000: fail early for evil descriptor
+
+During procss_tx_desc(), driver can try to chain data descriptor with
+legacy descriptor, when will lead underflow for the following
+calculation in process_tx_desc() for bytes:
+
+            if (tp->size + bytes > msh)
+                bytes = msh - tp->size;
+
+This will lead a infinite loop. So check and fail early if tp->size if
+greater or equal to msh.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [3de46e6fc489c52c9431a8a832ad8170a7569bd8]
+CVE: CVE-2021-20257
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/e1000.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/net/e1000.c b/hw/net/e1000.c
+index cf22c4f07..c3564c7ce 100644
+--- a/hw/net/e1000.c
++++ b/hw/net/e1000.c
+@@ -670,6 +670,9 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
+         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
+         do {
+             bytes = split_size;
++            if (tp->size >= msh) {
++                goto eop;
++            }
+             if (tp->size + bytes > msh)
+                 bytes = msh - tp->size;
+ 
+@@ -695,6 +698,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
+         tp->size += split_size;
+     }
+ 
++eop:
+     if (!(txd_lower & E1000_TXD_CMD_EOP))
+         return;
+     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
+-- 
+2.29.2
+
-- 
2.25.1

