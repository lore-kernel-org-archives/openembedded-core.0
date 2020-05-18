Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.817.1589820587873556779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Fr6qxZ4i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id n15so1981046pfd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eFQmKOCQRQUfZhQDE3rYAKedfh4ZjwipievypltBv7s=;
        b=Fr6qxZ4i15f27PUXYZA6IHaM1XXaJVjO7oOx9+ID2Flix9rvQ3FZLfUb/IORLZeIxr
         JjtF3xl6cjeO3lIGoiSCjCz6ROz4qBJav47lr96x0IsNNDtMigIn46wGdpc+UDheO2DZ
         1b0TuDCxaLM9vlcWB8k3XmqV25pOjBR03DnNwDxAvLBzfFWm30Z8Qnp/dmFGxos/AOMH
         xzlaaODZCqPd99FtshzxmU1DLHQrEDdHakVjO8X++Xd8EYPEDKrjqt170G1RjkH8mHB/
         419uZjd5jWsrYB3SkUMOwAQgBV7QCbyimG8T/xcYx0wlSnnczc5P+Uzg7Y+x6dWMsqnN
         e0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eFQmKOCQRQUfZhQDE3rYAKedfh4ZjwipievypltBv7s=;
        b=KrUry2Rf8ew6dYjVhsouQ2VcUBcURkyoLwifjKjUKDpap5XEm+MIyJcsksGCsmbRHR
         wN34BOyy/rNvw5SuYLyD/CrZgmE98MjoVWqwMoHeLl+RvypKcnO91PlL9iEY6uHNW+pc
         bv2NrtTBya+gBCeEQC0ACIzdHm+zpLhoG0OcLUnnYuDqdRrybXCIpJNjBnLZZrqACdiy
         bVnWNgnVCwwctRoTKfr/CqegxvSQX9ybQzqU/lNop7DPYsMMdiX1PRbwnNv5Fc2wivjR
         irdQXytId7iG1cGPwDX1wMFP5p3gmG9qDG5kuJ4GQnTvRL7b4kZ6Si5m5qon3GIhg+1I
         Dgzg==
X-Gm-Message-State: AOAM531+u3hmozmXhuWd4dF3ml7bZ3dl8Y35nDjHgVVHn9lIcPIt9/M8
	sOf8Pmcd6vD8F6jcKFuOULaeMqbsUUnlDQ==
X-Google-Smtp-Source: ABdhPJytIzN/YGjt/7LD191IPlc8ilQm+GOPvZg6w5MXL3Q9wXKmWH8sg9O+9/j/Hy9HVlXCMWr5QQ==
X-Received: by 2002:a63:564e:: with SMTP id g14mr16212084pgm.63.1589820586924;
        Mon, 18 May 2020 09:49:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/19] pseudo: Fix enum typedef
Date: Mon, 18 May 2020 06:48:36 -1000
Message-Id: <2093769199ecc3d1e474bea5ec6e8b193f6f8ea3.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Jacob Kroon <jacob.kroon@gmail.com>

'pseudo_access_t' is a type, so use typedef.

Fixes building pseudo with gcc 10 where -fno-common is the default.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  | 31 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
new file mode 100644
index 0000000000..33d4ef3b2f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
@@ -0,0 +1,31 @@
+From a491aececfedf7313d29b80d626e0964fb533548 Mon Sep 17 00:00:00 2001
+From: Jacob Kroon <jacob.kroon@gmail.com>
+Date: Sun, 3 May 2020 06:24:03 +0200
+Subject: [PATCH] pseudo_ipc.h: Fix enum typedef
+
+'pseudo_access_t' is a type, so use typedef.
+
+Fixes building pseudo with gcc 10 where -fno-common is the default.
+
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/137758]
+---
+ pseudo_ipc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pseudo_ipc.h b/pseudo_ipc.h
+index caeae5c..d945257 100644
+--- a/pseudo_ipc.h
++++ b/pseudo_ipc.h
+@@ -29,7 +29,7 @@ typedef struct {
+ 	char path[];
+ } pseudo_msg_t;
+ 
+-enum {
++typedef enum {
+ 	PSA_EXEC = 1,
+ 	PSA_WRITE = (PSA_EXEC << 1),
+ 	PSA_READ = (PSA_WRITE << 1),
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a3049c5e6c..324ae9071f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
            file://seccomp.patch \
            file://0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch \
+           file://0001-pseudo_ipc.h-Fix-enum-typedef.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.17.1

