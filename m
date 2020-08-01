Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.4514.1596317034965727608
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ABirpquh;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id i26so21367359edv.4
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GXuGwHnJJyDyIx81sU41VO0Q4VcJ0SGGd3zkBIuJMBk=;
        b=ABirpquhuBIchccQpjzB7GkpkgG5nGf4BgMVkf0rHi8T8Wha59YFw+x0t/3t0D32LM
         z6BvkQ5/7iXyIIFTbb5k+B3vbl6LdYS3IjV4d/P/cMU9uH6DjuQpchcHg7mNnuvlrf0P
         KELa0ARd42n8atS3I2iubRWt80b9D25wAJWmxvtjyktMAlEs+FbXB4I8Vt4UranOTMDn
         lA1oFnn5xzTu9AiaMYcTgtVVOZDXzuXmdA5SSvFsaGxVaRkptH69erD67sYCZOZQ/PH2
         gHVLeM5pkxUXdSJQBCQmQMiUTX7pvCdnkueb0JAvMmAX9sw6uKYie28MiyDqBSB5QQup
         URew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GXuGwHnJJyDyIx81sU41VO0Q4VcJ0SGGd3zkBIuJMBk=;
        b=tQMEpdRn5erX16brLiTgjdeqy7FQi2rurREyCdP8N9WrKDCFsE3l8RY8Jv83hoIGeX
         B0Xpr+auWqRpcT7CzE5/sMPT+5GPZpk3rdCD8FHVIR6j/I2gwTdEg0ogTOXbFWwDQTDa
         /UAyZHH43ecdjuaWmQIdSD1aXw2AriQ5Y2MFXGhAcn2umhlYJ8Wd5DabqDdziwIZc7JB
         mwzn2kcPkhL1ZVbhavXyBuC2nvgJWEfa+KBS811lj3t+R6T9qBqrL0t1TL7TLbK6LlTH
         h0b0mHNWpTplbYMV/Pze+8Y0Fe9EeEEVn6m33bIKwEUjyWqCNwcNdlbeH8asvx5oNjnT
         njnA==
X-Gm-Message-State: AOAM533qNNy0YRukQT80oib4K/gX9s/xKg+b0NvDBWFGto8QE1em3m+A
	ElJeD+Hh+okad2yo8zr4U1vh8FK1iQs=
X-Google-Smtp-Source: ABdhPJz7jWUUgG7rtQDqIZ6it2mQQfQLkhhBdWZMyIlxkGkxEoDnw5uCBp5RjgNvcKuIYm+pC9fHTw==
X-Received: by 2002:a05:6402:2031:: with SMTP id ay17mr9328132edb.46.1596317033119;
        Sat, 01 Aug 2020 14:23:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:52 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/13] libcap: update 2.36 -> 2.41
Date: Sat,  1 Aug 2020 23:23:34 +0200
Message-Id: <20200801212335.14922-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-tests-do-not-statically-link-a-test.patch |  8 ++++----
 ...0002-tests-do-not-run-target-executables.patch | 15 ++++++---------
 .../libcap/{libcap_2.36.bb => libcap_2.41.bb}     |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.36.bb => libcap_2.41.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index 912f33f165..81fdd2a15c 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -1,4 +1,4 @@
-From 24d59c99bcba065f1f40f49f870a5f6483b4b078 Mon Sep 17 00:00:00 2001
+From e4fe6890e07821d60f01f000a95f7944f3d68139 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index f9cec56..aa0d09b 100644
+index 876a8b9..93a0e3a 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -29,23 +29,23 @@ psx_test_wrap: psx_test.c $(DEPS)
+@@ -26,23 +26,23 @@ psx_test: psx_test.c $(DEPS)
  run_libcap_psx_test: libcap_psx_test
  
  libcap_psx_test: libcap_psx_test.c $(DEPS)
@@ -43,4 +43,4 @@ index f9cec56..aa0d09b 100644
 +	$(CC) $(CFLAGS) $< -o $@
  
  clean:
- 	rm -f psx_test psx_test_wrap libcap_psx_test libcap_launch_test *~
+ 	rm -f psx_test libcap_psx_test libcap_launch_test *~
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 26d108c209..e8f1df98c1 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From 6309554225e05e76167eda4e0df383fb3d1a62c3 Mon Sep 17 00:00:00 2001
+From 5583b48c04d5bf50b56473d88d990c3f0bc45c14 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -7,23 +7,20 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- tests/Makefile | 3 ---
- 1 file changed, 3 deletions(-)
+ tests/Makefile | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index 95e4ca6..7162cf0 100644
+index bfedbc2..876a8b9 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -19,8 +19,6 @@ sudotest: test
+@@ -19,13 +19,11 @@ sudotest: test run_libcap_launch_test run_libcap_launch_test
  install: all
  
- run_psx_test: psx_test psx_test_wrap
+ run_psx_test: psx_test
 -	./psx_test
--	./psx_test_wrap
  
  psx_test: psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) -DNOWRAP $< -o $@ $(LIBPSXLIB)
-@@ -29,7 +27,6 @@ psx_test_wrap: psx_test.c $(DEPS)
  	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB) -Wl,-wrap,pthread_create
  
  run_libcap_psx_test: libcap_psx_test
diff --git a/meta/recipes-support/libcap/libcap_2.36.bb b/meta/recipes-support/libcap/libcap_2.41.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.36.bb
rename to meta/recipes-support/libcap/libcap_2.41.bb
index 2c98db6eeb..52d2f13e16 100644
--- a/meta/recipes-support/libcap/libcap_2.36.bb
+++ b/meta/recipes-support/libcap/libcap_2.41.bb
@@ -12,7 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "5048c849bdbbe24d2ca59463142cb279abec5edf3ab6731ab35a596bcf538a49"
+SRC_URI[sha256sum] = "880dac4f97795bf5bd0d77ae6476d8c6a854601eb0c461d5a5b91f07d8e60834"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.27.0

