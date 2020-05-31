Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.17613.1590940439405495651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sFVYIBW5;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id gl26so6842923ejb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gruhWEBEEeGnWfuSxYUkYgrb8WQdlSFIkWhyRhCxRU=;
        b=sFVYIBW5PWR3XC2IjiaY+eyj57oegSDX4U9vSLKUZkyIYYrBBxzImP0aIdiIWyk7PR
         ilqPaQT7McWBSqTnxiyu3IzdmpzdYvam1+T/3wM8mmYOlIEp/rVOA3hF4Ov/6E33oioj
         N9R5vnnU8rf1ZVadcDes5/UrjfPHuFAcy0zE+XOqPzNYjKqMCCsIkMUl9zdorpZu0EpP
         QfT/yvP7LkUElxtIDN7MfehtmoLDwJvY+lanZrEVGenSUxTXTD20xpY2tZhfhZ4a3II7
         ljwPHD9uBSVyA18qD+0BfYy0i1gLLExIOgbWc1d7WmpJUq+D28Bt+LjxeZ2pwo9u/y+H
         zkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gruhWEBEEeGnWfuSxYUkYgrb8WQdlSFIkWhyRhCxRU=;
        b=e6xVEhkF/BeorOZ6P/zArlbFz9ma8p+5/ZCWUHXg/d+izO8h4YpaEjI8iPoVry/3n/
         btdLVd/HlIsAPZD+aR6myzjdHPYwhRxGg6NSX7YkCY706JfsRcvcrst+TKmPaJ3awxg5
         qWOj2muxml8WG8w5GPz0WZ1bvSZlfiP2wiLl7Hm1NkNk9yj3vPV90yumdOwXDv3hdYV9
         k/M9HArtRFl8o4Di/Ce9C4LHJLd9pA6G+JPkgr8XDclUFH6GZdh//0Xp6VvJCtmUQiCi
         2AAq9l7+RO+tCQ7VUdk6L/9tMXmpl5BtPUDRO/Q9MGSS+kUiPreZCkG5u3VzbWMbZ5dj
         V0Fg==
X-Gm-Message-State: AOAM533iVNGEiUXqecw0sO7miqGdm4VgvogSILzxxWs1RbeNy7Wwegtm
	xbqf0a9ijUfBz9Ll+RZox/SYCphX
X-Google-Smtp-Source: ABdhPJzw4rAhcBAZ9ggqKRxjmL1kt/ugcYeiXf6Z4hY6NxAvsHFIGFcl4DNzOF6yIPCLPktaURK80A==
X-Received: by 2002:a17:906:fc13:: with SMTP id ov19mr4539211ejb.212.1590940437686;
        Sun, 31 May 2020 08:53:57 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/70] kmod: upgrade 26 -> 27
Date: Sun, 31 May 2020 17:52:19 +0200
Message-Id: <20200531155254.10283-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/kmod/kmod.inc             |  7 ++---
 .../kmod/0001-build-Stop-using-dolt.patch     | 28 -------------------
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 334453838e..b7c5cbef12 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -14,15 +14,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-SRCREV = "58133a96c894c043e48c74ddf0bfe8db90bac62f"
+SRCREV = "819a125ca756003dce2d11624035b7fb605a8e99"
 # Lookout for PV bump too when SRCREV is changed
-PV = "26"
+PV = "27"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
-           file://0001-build-Stop-using-dolt.patch \
            file://avoid_parallel_tests.patch \
-          "
+           "
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch b/meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch
deleted file mode 100644
index c915ad5e8a..0000000000
--- a/meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f8b8d7b330433511d19a936ddfc7b7d1af5490b5 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@kernel.org>
-Date: Wed, 20 Feb 2019 14:22:04 +0200
-Subject: build: Stop using dolt
-
-This does regress "make -12" from 0.7s to 0.9s on my
-Coffee Lake machine, but even on slower hardware this
-will not amount to a noticable slowdown.
-
-On the other hand using dolt can create problems for
-people doing cross-compilation, e.g. Yocto has two
-hacks just for dolt in kmod:
-https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/kmod/kmod.inc?id=a17abae00785c76cfffe5381a22fb2c86b982e82
-
-Signed-off-by: Adrian Bunk <bunk@kernel.org>
-Upstream-Status: Backport
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,7 +17,6 @@ AM_MAINTAINER_MODE([enable])
- AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
- AM_SILENT_RULES([yes])
- LT_INIT([disable-static pic-only])
--DOLT
- 
- AS_IF([test "x$enable_static" = "xyes"], [AC_MSG_ERROR([--enable-static is not supported by kmod])])
- AS_IF([test "x$enable_largefile" = "xno"], [AC_MSG_ERROR([--disable-largefile is not supported by kmod])])
-
-- 
2.26.2

