Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.13314.1589207976920887102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CCPkTM4v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id e6so7884139pjt.4
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8x6V9vDXrWhWPbiHxwihwMuVuESP57jsEc9tvJmhIsY=;
        b=CCPkTM4vuRG0hK31IDZSOeNOJI/CXmrbWg/zAQzCLgEX6md/8T0RNMj4zk6OEyYI4+
         l5vOGlkjSnpX26EH8/oEv+VZUrjsvSK/1Ewy7B+nqDcTATJ0/TjD9M34+vto52ovs3Ux
         aA4vP8K18+MNgOTH75Lwj4o6WXrXY7fEBXtswGq4V4j9U+Zgh0Xk/qWf7mg1WK9988+4
         b2R/PMoST8bq0fRD170pUefPBYKoKa+5RNLtLteU/hy+WCXUKfABu7wN3GpK9OQdnRMF
         RZ+s0TJ8gNRe+X3hPw1fhLEaHgi2g+3T2+uiclUfU5NCHWP6o9OUCYgOhgRsY6xgVy+r
         xmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8x6V9vDXrWhWPbiHxwihwMuVuESP57jsEc9tvJmhIsY=;
        b=plPJuzxP+qXHkxhD8Rbcd/8OgFgfeex0nRL2oHRgHIR44pYCb6C57wJpf6zv4Fy0s3
         A2Zkij43Erlv3cDeqbEaPBf/hRJC+x/NR3PAg6F3Kw3vDHXsn4rtDUub5+0Q/Yrn3pHO
         iziHdDkkMuIBQ50rDimzCtmXCUhsaiVIDfZyXv5X4PYW5SYUwcy9Ku2ikaiVMVAJjygr
         1Y3unR3SQoVxP5IXRu2EM48jDQi4IPyiSPXAJrNAtsIBLv3vNogM/k7CAqstgOn/ZzwV
         UYvgnoNvD/CF6PgGG1ReWyoTMqQC+L2a/mjVFcX3Z5nIcRlBlhNwq1xhbIzkKxByZzJw
         tZxA==
X-Gm-Message-State: AGi0PubpWz2LjmDN6bjMeGE2f80C85U9iLTsC9MZ5Aw2erLmSKcrS9wM
	L/ntwK9kGSQu0OEbVTmxige86DqqBzxpcg==
X-Google-Smtp-Source: APiQypKQ7KTOQhtB1LWFvI241xLNgETKZqaxXqkbGBMgXaGNzLjGr9UpYULj5asiw6PDBuh8lnV74g==
X-Received: by 2002:a17:90a:1aae:: with SMTP id p43mr22517327pjp.236.1589207975883;
        Mon, 11 May 2020 07:39:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 6sm9337202pfj.123.2020.05.11.07.39.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:39:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] musl: Remove spurious unused patch
Date: Mon, 11 May 2020 04:38:48 -1000
Message-Id: <2bd345826e23802ff3b9fcc77cdab88aee21d3ca.1589207495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589207495.git.steve@sakoman.com>
References: <cover.1589207495.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

