Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.12740.1588452992144308170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 13:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+LP676E;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id o18so1233814pgg.8
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XmRZMkjx25lbdH2B1CVwrx/WrGLmfSnAM8uv6dnUO/Y=;
        b=j+LP676EcrB2ytMJhNZpjDmR0UW9C/EVeIEuC2nPN3MJozyWcZCWCIu0kg2sLpok+u
         Q+gKnFVz2vkYO/j8NWyMxmhqGD30WJRQLTRteWJPQ70gtayFQIznrYXIpxKaMEvsP6Sg
         snXG9Ghx1kS5gEdzqowSMXAmoUYZh+EyPIgi/NrI0zljEg0XjrvI+HnjZ1eXL5GktCYS
         J7+SXvJoXhpKJM4RoZQg7UUP+sz9tULkiFqxJ7guBhjGvxvGB6yL80Kbsc07pbXjPzSH
         N6meZ2pzqdyO6E4Bamyo/1a5Fe7ZxnnWQmA9PxuOr7peZBy5EV3hQbGwsRFWV8Jz/s70
         fqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XmRZMkjx25lbdH2B1CVwrx/WrGLmfSnAM8uv6dnUO/Y=;
        b=o/DsBjJ8GXv28qTy5ELCSM1og/UIbqffcqWDXBaOQNQtQ7XtPFGNGS6PfixDMxmPDY
         nv6EHvLb8AUbDajjGwjdQTlE2bihCoux/AkQD9TsugPRCtelc8zhlId0tw8N/Vos+hjh
         heSYCp9GEY9AqE1P7T37eRCD/LlN6NH0qsH5wLPhfJwSkDNozhQWFa7jCPJdGz3XW4R6
         0l/QJ2D809BWVX6dd5jxLjLtXj2ImCeMDqOFV9VqDiofZXvBohp8eCpGvPQG7SVKDJh1
         igkhlmvASHrAzeWxMgZovLfTAy7KphNYKT/RI6IcC4bplL+zuYs0f8J6h3MI7TOXfmNY
         IOUw==
X-Gm-Message-State: AGi0PuYndwrvBW7kpfCdInhIVG5Bi6dHkK0WYV7JqdsLttq3nBjMM1bc
	B48V7d3LjR36oMmxTmKorXM8afTjVcQ=
X-Google-Smtp-Source: APiQypLeGPKNPLU0n+CIhCt4xA+JsClxcSo0cyAJPJfwTcZOvN3t9jSKnr6Q7toRfEez+1RYztdQMA==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr9607928pge.298.1588452991137;
        Sat, 02 May 2020 13:56:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b3aa])
        by smtp.gmail.com with ESMTPSA id h31sm2928656pjb.33.2020.05.02.13.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 13:56:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Remove spurious unused patch
Date: Sat,  2 May 2020 13:56:28 -0700
Message-Id: <20200502205628.3894716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...move-using-.end-directive-with-clang.patch | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch

diff --git a/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch b/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
deleted file mode 100644
index be79cb53f1..0000000000
--- a/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b6732f68848ecc8ff01054bf7aea70a241c37116 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 10 Apr 2020 11:23:39 -0700
-Subject: [PATCH] Remove using .end directive with clang
-
-Clang does not support this asm directive
-Fixes Issue #19
-
-Upstream-Status: Submitted [https://github.com/kaniini/libucontext/pull/20]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch/common/common-defs.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/arch/common/common-defs.h b/arch/common/common-defs.h
-index bf2fb8c..618116b 100644
---- a/arch/common/common-defs.h
-+++ b/arch/common/common-defs.h
-@@ -28,10 +28,13 @@
- 	ENT(__proc)					\
- __proc:							\
- 	SETUP_FRAME(__proc)
--
-+#ifdef __clang__
-+#define END(__proc)
-+#else
- #define END(__proc)					\
- 	.end	__proc;					\
- 	.size	__proc,.-__proc;
-+#endif
- 
- #define ALIAS(__alias, __real)				\
- 	.weak	__alias;				\
--- 
-2.26.0
-
-- 
2.26.2

