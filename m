Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.25496.1588523204906121440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j189T7Mr;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id z6so6028868wml.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5hkNoHwWyechwL84slCxd9cNAWuDKfaQwev7LpU9R2w=;
        b=j189T7MrJyxHp+M3ZfnlrceOVUT8LBlYStz3LaAioZ086CPJxChR3ct+YMRJkrZBlV
         SCUQWA2uhjp+GpyMQldM6VMrR5MfgXfBGLRLNLp4VCwZvRpopZeQwp4aIOE8aiavdq/6
         u0/6me+YCWqMZRpq2bYTN9eiVm4wHKOHwdGbWsWQ4TNeuuRhBjSsg1EcKNyFSeKs7RhX
         G0L94Ku6Wqy7N0sZ3zneoRzhw44uBvUd2+OHNp7gnsRJ9u8mSqZy7+DmQdTaMuIJb8lf
         Hhri3ws4m/LtxOs+PwGLdQoA/J/U2Q/Xp67GHjerQyzMzjkUgEoVu2sUiG677Zev7hZH
         A6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5hkNoHwWyechwL84slCxd9cNAWuDKfaQwev7LpU9R2w=;
        b=hmlvHl4dO9mp9eCBIliV/l2m2g1WHLb4NErtVCpHMQYdzUo7Ts1GpXy5E0aDB903Y8
         +Eo18OL8j/5vXuKgrVbmp4K/6x6xEHz7pkCM0KLhiCqAniHz9SXRR3v9W2NnSRxKZXAT
         LUlBzKAaKMJ2OgZAfhTH6oIu69VGiKjJ41th+7trp7rHoGn7jqyThcUyOy+Q94B1Acrs
         LWn8oEI5anyvXa12MqHDAISPxDknAD/iS2wK1SxKIDrHLfRxqQl3Ib3ZPG2bbHXsmtky
         gtiZj90QIpZfAU2vmVoGaeRDgkTfb8Q707gG1u4/EBEThylbXv80Fo1KJadsUAptFxlM
         iE9w==
X-Gm-Message-State: AGi0Pub9Hgewy6o5JZCaOVBBL0XeKtmF/yb0rwhvGUq/9oN+Yq3y1knI
	VxvFRjW+tjq6LfpuCFaCoROsKipd
X-Google-Smtp-Source: APiQypLzyE4deh6VUNJipeboy+ZHWB6ZtppndwyZBC951CoHv5MzmOVhaJ+2vCLDWvHXePcvBTYpyQ==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr9855989wmz.43.1588523202781;
        Sun, 03 May 2020 09:26:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/17] libcap: update to 2.33
Date: Sun,  3 May 2020 18:25:57 +0200
Message-Id: <20200503162559.946-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch |  9 +++----
 ...hread_yield-with-standard-sched_yiel.patch | 24 +++++++++++++++++++
 .../libcap/{libcap_2.32.bb => libcap_2.33.bb} |  5 ++--
 3 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
 rename meta/recipes-support/libcap/{libcap_2.32.bb => libcap_2.33.bb} (90%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index e568cc47c5..5a0b25758c 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -1,4 +1,4 @@
-From 1179b423cce8d119b42cebfb3daa77c540fdca43 Mon Sep 17 00:00:00 2001
+From 99ff8da92cc1bdf150fecd1ecd0fa50794be0259 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -7,12 +7,13 @@ This fails on e.g. centos 7
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  tests/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index 7162cf0..6af47af 100644
+index f9cec56..dcd654f 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
 @@ -29,7 +29,7 @@ psx_test_wrap: psx_test.c $(DEPS)
@@ -22,5 +23,5 @@ index 7162cf0..6af47af 100644
 -	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
 +	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create
  
- clean:
- 	rm -f psx_test psx_test_wrap libcap_psx_test
+ run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
+ 	sudo ./libcap_launch_test
diff --git a/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch b/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
new file mode 100644
index 0000000000..848ceb2c0c
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch
@@ -0,0 +1,24 @@
+From a2c4cdb05d0e382101b13944c09c4375e8d7de5f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 31 Mar 2020 13:39:28 +0200
+Subject: [PATCH] psx.c: replace pthread_yield() with standard sched_yield()
+
+This was causing failures when building with musl C library in
+particular.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+diff --git a/libcap/psx.c b/libcap/psx.c
+index 04d250f..7e4ac10 100644
+--- a/libcap/psx.c
++++ b/libcap/psx.c
+@@ -533,7 +533,7 @@ long int __psx_syscall(long int syscall_nr, ...) {
+ 	if (!waiting) {
+ 	    break;
+ 	}
+-	pthread_yield();
++	sched_yield();
+     }
+ 
+     errno = restore_errno;
diff --git a/meta/recipes-support/libcap/libcap_2.32.bb b/meta/recipes-support/libcap/libcap_2.33.bb
similarity index 90%
rename from meta/recipes-support/libcap/libcap_2.32.bb
rename to meta/recipes-support/libcap/libcap_2.33.bb
index d78a58f7d2..bec492ca5f 100644
--- a/meta/recipes-support/libcap/libcap_2.32.bb
+++ b/meta/recipes-support/libcap/libcap_2.33.bb
@@ -11,9 +11,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
+           file://0004-psx.c-replace-pthread_yield-with-standard-sched_yiel.patch \
            "
-SRC_URI[md5sum] = "7416119c9fdcfd0e8dd190a432c668e9"
-SRC_URI[sha256sum] = "1005e3d227f2340ad1e3360ef8b69d15e3c72a29c09f4894d7aac038bd26e2be"
+SRC_URI[md5sum] = "dcc6220b4a9bf260050b20c07edcddf4"
+SRC_URI[sha256sum] = "08edeaba2757021aeec45c4eeec52566675e0e0f5d4f057284d729e04f2643d6"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.26.1

