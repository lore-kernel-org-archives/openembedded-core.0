Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.32017.1597615648411414705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 15:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q3flUJ+R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id a5so13051283wrm.6
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 15:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k98jOEfJcaWv8kIlhK+sHYZu980IMSEish2cyo3sNiA=;
        b=Q3flUJ+RO1RHu+b2Rc/v43m9DqjdWBNnj47QyLQxuxeEtQZsPYpTWnumJd5SK0hulw
         F/lghGUWJeNx+m85sfZVtFL50J9QhN6Typw1ccVoNCk96HDSXm7VHupYeUYOqfuKzhCG
         tj6zIxzLZo9Zf7SqSnPfrR5LHtInnFtd+aOGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k98jOEfJcaWv8kIlhK+sHYZu980IMSEish2cyo3sNiA=;
        b=UOMtMgpqpjcgHDHc0gWfL5Bw0+k4Ho7UuTHayaCjiW47LRihdUX8kx+fkM2QFraNIj
         QMxJLSdJCwrV66CRE+dSkSYQ9sa7n+BRSHy/+LJ0cd/5iV3lj2IgtOCmQhw/8KCMgQE9
         l9Z/+lZByPXDgnpIIS71CDpMywTx314mvnQKMravMrulWuEQh5ZuHli0jUdCqWYW07lM
         K9AfMr0kSnxfb4EBkcp9pCorEP10lRlSS+yFEhpPgYT3I0QQJQjEs9CZO7A5mcUj4bm3
         VwqQ7c31CLm1UhUxFw0qhPCNlQchygmKWC5acz8/pakVEOgcB9niC+nqp9yKWNf74kCv
         qyHQ==
X-Gm-Message-State: AOAM531RGux47lbaDiwE8cKGplRyhIs+J7DZ1jPpIjmbNQWis4sQfAQA
	BdaBaWiw/VAiPzLF/exHq02QsnC/NwRPwCp7
X-Google-Smtp-Source: ABdhPJy3uBwqYWMCGbQanuEnxpmiXZctMT79T7CjF8M2kqxyVpiQmDcqD9EWKyEIfUzrB0MT4GFYuQ==
X-Received: by 2002:a5d:6a4a:: with SMTP id t10mr12912004wrw.360.1597615646537;
        Sun, 16 Aug 2020 15:07:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (7.e.3.0.f.1.f.7.3.a.7.d.2.4.9.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b942:d7a3:7f1f:3e7])
        by smtp.gmail.com with ESMTPSA id j5sm29164237wma.45.2020.08.16.15.07.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 15:07:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: upgrade 2.12.1 -> 2.12.2
Date: Sun, 16 Aug 2020 23:07:25 +0100
Message-Id: <20200816220725.1088168-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ents-ns-tp.h-Fix-build-with-musl-lib.patch | 43 -------------------
 ...-tools_2.12.1.bb => lttng-tools_2.12.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.1.bb => lttng-tools_2.12.2.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch
deleted file mode 100644
index a150d648ab5..00000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e5d94cf4882cc6516af52b794c6acb8e4d6469a3 Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
-Date: Mon, 18 May 2020 16:39:26 +0300
-Subject: [PATCH] tests: gen-ust-events-ns/tp.h: Fix build with musl libc
-
-Fix the following build error with musl libc:
-In file included from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:14,
-                 from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.c:10:
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |          ^~~~~
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |          ^~~~~
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |  ^~~~~~~
-../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
-   17 |  TP_ARGS(ino_t, ns_ino),
-      |  ^~~~~~~
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/161]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- tests/utils/testapp/gen-ust-events-ns/tp.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/utils/testapp/gen-ust-events-ns/tp.h b/tests/utils/testapp/gen-ust-events-ns/tp.h
-index 4dbfed5..e0ddb29 100644
---- a/tests/utils/testapp/gen-ust-events-ns/tp.h
-+++ b/tests/utils/testapp/gen-ust-events-ns/tp.h
-@@ -11,6 +11,7 @@
- #if !defined(_TRACEPOINT_TP_H) || defined(TRACEPOINT_HEADER_MULTI_READ)
- #define _TRACEPOINT_TP_H
- 
-+#include <sys/types.h>
- #include <lttng/tracepoint.h>
- 
- TRACEPOINT_EVENT(tp, tptest,
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.1.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index 094e33db71f..e9c8e18e222 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -33,10 +33,9 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://0001-tests-regression-disable-the-tools-live-tests.patch \
-           file://0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch \
            "
 
-SRC_URI[sha256sum] = "0de7afc1f40a5acbede933cdfd6cf47b32ff84d02e170a1321f7fc86141585b8"
+SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1

