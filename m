Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.3926.1603919188126514554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Df7AJzAN;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id p93so942755edd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hMQiuYlk/wvky7n6MWFda4bmm8vW2gPJVsPFiorzZlg=;
        b=Df7AJzANANdlerchYS45QdgD1Tf4Cy4C4dcBWcWqHOl1cSIyLV3fCU5hyH4EayQjnl
         rR2ST8KjRBDrL1QfjvEiRstuwKfv+xK3HKiLpU4EMHwBnvNXurq5pyvHHcuha80hFMxj
         fi+Tqq4xmr1mwcNUZXJhzJK/Yfb6nCi5H/KzGI0TF7uxSH2BHOS05z8tDqrD/cJXsmPX
         tMW2FwR7LaVIOoDSZyiMvw5YdsD+USED8SUSBVW07PXoa4O3+JrAYawicj7Q+NcnNWa+
         Hqnj0Yd9Xo4IEpIxnW8vgU01lhrAHtTJIeNlZT6OcXhrcJauilSacvaFPto687b9UoNd
         Ol4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hMQiuYlk/wvky7n6MWFda4bmm8vW2gPJVsPFiorzZlg=;
        b=nL9NFu0kZM7CpI48xqgvb1FV8+w+KVYwPDWrrB8UsgTIpiu9Yvj3nDcE3QkWScoVCn
         470aiGGQMTVro306XirH89zY4JUK1VLnybTH1+hlNXs3zpFZBJGRCdWswaP3jEp1SkMG
         QLh9OWh0wb+EUXrirhxazuHZigrFJBlcScVoFCVOtRFJLyqwXrYQRY3SvEDtvDwVlkrq
         oHbKNFeZPI85t5k/t/hqO38to5jqTZwbJJkRVZCy2YzCJkaI/KLqYbi7e27llCeqCcvB
         DQv70jgv6UycCjBOWMuBw2YpWV5eDZ2eIik4BZzfQl+x9RdY4KHGv1EdWfOcVLpJXG/k
         USiw==
X-Gm-Message-State: AOAM533JiheWa6cP0Kwdx2jwHTm8lq0QLh8tv+GG4xpqTYPI9nb24FhM
	RkxJ3LWMQ+gzCci5gr1umTzZzeeV35XFig==
X-Google-Smtp-Source: ABdhPJxiL6M9Gxg0TtT0NhCHzUXdaprQDj0AnQduwk6y9KmRizSz2fq+0Dh6QGjUU99xj8xZIt8h9g==
X-Received: by 2002:aa7:c683:: with SMTP id n3mr845770edq.146.1603919186440;
        Wed, 28 Oct 2020 14:06:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/33] libcap: update 2.43 -> 2.44
Date: Wed, 28 Oct 2020 22:05:48 +0100
Message-Id: <20201028210558.21070-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebase the patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch | 38 +++++++------------
 ...-tests-do-not-run-target-executables.patch | 14 +++----
 .../libcap/{libcap_2.43.bb => libcap_2.44.bb} |  2 +-
 3 files changed, 22 insertions(+), 32 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.43.bb => libcap_2.44.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index 81fdd2a15c..d9fd48a9db 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -1,4 +1,4 @@
-From e4fe6890e07821d60f01f000a95f7944f3d68139 Mon Sep 17 00:00:00 2001
+From 03e925f0d68bc51e1acf1ac2014a9c2452c664bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -9,35 +9,25 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- tests/Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ tests/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index 876a8b9..93a0e3a 100644
+index d569650..f5ca377 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -26,23 +26,23 @@ psx_test: psx_test.c $(DEPS)
- run_libcap_psx_test: libcap_psx_test
+@@ -11,7 +11,7 @@ ifeq ($(DYNAMIC),yes)
+ LDPATH = LD_LIBRARY_PATH=../libcap
+ DEPSBUILD = all
+ else
+-LDFLAGS += --static
++LDFLAGS += 
+ DEPSBUILD = libcap.a libpsx.a
+ endif
  
- libcap_psx_test: libcap_psx_test.c $(DEPS)
--	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
-+	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create
- 
- run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
- 	sudo ./libcap_launch_test
- 	sudo ./libcap_psx_launch_test
- 
- libcap_launch_test: libcap_launch_test.c $(DEPS)
--	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) --static
-+	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB)
- 
- # this varies only slightly from the above insofar as it currently
- # only links in the pthreads fork support. TODO() we need to change
- # the source to do something interesting with pthreads.
- libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
--	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
-+	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create
+@@ -51,7 +51,7 @@ libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
  
+ # This one runs in a chroot with no shared library files.
  noop: noop.c
 -	$(CC) $(CFLAGS) $< -o $@ --static
 +	$(CC) $(CFLAGS) $< -o $@
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index e8f1df98c1..bfce8e0547 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From 5583b48c04d5bf50b56473d88d990c3f0bc45c14 Mon Sep 17 00:00:00 2001
+From 7744c1f678f5226a151bc6b2a254a56835229d91 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -11,20 +11,20 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index bfedbc2..876a8b9 100644
+index 8956d5d..d569650 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -19,13 +19,11 @@ sudotest: test run_libcap_launch_test run_libcap_launch_test
+@@ -27,13 +27,11 @@ sudotest: test run_libcap_launch_test run_libcap_launch_test
  install: all
  
  run_psx_test: psx_test
--	./psx_test
+-	$(LDPATH) ./psx_test
  
  psx_test: psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB) -Wl,-wrap,pthread_create
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB)
  
  run_libcap_psx_test: libcap_psx_test
--	./libcap_psx_test
+-	$(LDPATH) ./libcap_psx_test
  
  libcap_psx_test: libcap_psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
diff --git a/meta/recipes-support/libcap/libcap_2.43.bb b/meta/recipes-support/libcap/libcap_2.44.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.43.bb
rename to meta/recipes-support/libcap/libcap_2.44.bb
index c712c25947..79875522d6 100644
--- a/meta/recipes-support/libcap/libcap_2.43.bb
+++ b/meta/recipes-support/libcap/libcap_2.44.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "512a0e5fc4c1e06d472a20da26aa96a9b9bf2a26b23f094f77f1b8da56cc427f"
+SRC_URI[sha256sum] = "92188359cd5be86e8e5bd3f6483ac6ce582264f912398937ef763def2205c8e1"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.29.0

