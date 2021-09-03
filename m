Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.4812.1630678301920033233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 07:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gm8OYlfH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so6709242otf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4Oy+yjmuOv8XixId/9CDJ2pOPYJfZTVmOm4w/XIhrW8=;
        b=gm8OYlfHzo7OXSK0nGLO+mEP2aLHzUu9SYDypUqzaU45AwBAjdVWI3QWKwn4nSVY85
         Aoee9FqGG9Y4tBliwrSFUhT7Ela2OoagqUE4pqGxm+9PNJOY5/g3KYBNb38GjdsU/KSC
         pMrhgtleg8Uonev2alfXuDhzmsb6LMrofAKVojJQiShZwuTigcHYXro76sFgEUqTnmRA
         AV0uuxIZeVjzXZcT0Isel6kReg1sN6yl+j+zOfvur9Igsy8QNZpxDAd65jE2UYAyTiLt
         vcUcvmopjeBxH87zKi8/FMMwKPd24q4+3Kui0AzMc90D6XuRplQceoJYA+IwvgxhBUvV
         +bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Oy+yjmuOv8XixId/9CDJ2pOPYJfZTVmOm4w/XIhrW8=;
        b=PZYcQQULE2Z2c2we7lWamB+k4xW7MnRP3adfiWxdIbJiyLDuMh/qivTi1uEAYagCia
         SVSHbaiJQpPiA+RZVtmBgN31rvOsecMZiWor25gftrqBgbOaq9FvcNp9KFfjcmH8AyZy
         BJ7iSfxWEl8eZ1cFBSTz377ATlafy5h3zHxtk4iVVkkL1ikgLBrKHNqo7pzWfuLp5l3S
         U6SsWR5IfrnPuWdYZ9hgslEv4Ywiy+ffhGp6iGcsKE5T0ZzGDMTTnqHVw5kmtAL2MNKI
         /qws2GSxF2GyGYmcgvy7gHJc6GQxh/rhAcDq6oleXXtSvEmCxsgOSrE0TzHchZGxPSgb
         mb3Q==
X-Gm-Message-State: AOAM532OdH9TgcG+teEOwd6ItvZ7MILcq5ax4lja9bOSj5dkm+NMjU3R
	uDmGkZI56BTHCMcGYj+r9S7GxmBHiTv41gD6
X-Google-Smtp-Source: ABdhPJwa4FjF7daKX2lPRiwfpH0iHvy5o18HXo35kiPR0zB9Z8u7AGBhCLqbSnVm9RxVmCCIfBlhyA==
X-Received: by 2002:a05:6830:2904:: with SMTP id z4mr3334358otu.121.1630678300802;
        Fri, 03 Sep 2021 07:11:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id u14sm998007oth.73.2021.09.03.07.11.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 07:11:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] lz4: Security Fix for CVE-2021-3520
Date: Fri,  3 Sep 2021 04:10:51 -1000
Message-Id: <00acbc19a48e2b03c910ff5dc62e51eda32bdf03.1630678081.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630678081.git.steve@sakoman.com>
References: <cover.1630678081.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://github.com/lz4/lz4
MR: 111604
Type: Security Fix
Disposition: Backport from https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
ChangeID: 58492f950164e75954a97cf084df6f9af3d88244
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lz4/files/CVE-2021-3520.patch             | 27 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.2.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2021-3520.patch b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
new file mode 100644
index 0000000000..5ac8f6691f
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
@@ -0,0 +1,27 @@
+From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
+From: Jasper Lievisse Adriaanse <j@jasper.la>
+Date: Fri, 26 Feb 2021 15:21:20 +0100
+Subject: [PATCH] Fix potential memory corruption with negative memmove() size
+
+Upstream-Status: Backport
+https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
+CVE: CVE-2021-3520
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/lz4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/lib/lz4.c
+===================================================================
+--- git.orig/lib/lz4.c
++++ git/lib/lz4.c
+@@ -1665,7 +1665,7 @@ LZ4_decompress_generic(
+                  const size_t dictSize         /* note : = 0 if noDict */
+                  )
+ {
+-    if (src == NULL) { return -1; }
++    if ((src == NULL) || (outputSize < 0)) { return -1; }
+ 
+     {   const BYTE* ip = (const BYTE*) src;
+         const BYTE* const iend = ip + srcSize;
diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 20719fcc58..546bed39b0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -14,6 +14,7 @@ SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
            file://run-ptest \
+           file://CVE-2021-3520.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-- 
2.25.1

