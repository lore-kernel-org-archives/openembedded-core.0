Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.15608.1631124091849813865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NajL5kUo;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso2191085wmi.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d3W44NlM4AsxFgbdRTVJU9+BWpSp195pne+5BD9Q0cM=;
        b=NajL5kUoekikqR/k8298yrtLxat3dMXRUre0VHYMGfgBVQw0hQql+1LSp7DDXxRZuw
         hWVyFGd66yc+qHsmoi8d0dOanMH3gG64FPprCRa5kQBkVxHHwbOoL+3qZv1hmOuoqRFl
         0sextP8qxpe2P3ow3bgi/NDOLlK9aFEdu949VeRmTrAaBO01yyDD406pHTs3rGdfFlOl
         KIvQKmCyFhVnLhhS1dTdV2fzf9vHnuKK1btnd77IH7iOH6cVZl+7sHkhalqlXjbvThgy
         vP+82+/qaueHtZA6ApCtHADq4ubtaR447h+doj15QA1WaAUnBUVUX0FrU2lb6r6o3B72
         SNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d3W44NlM4AsxFgbdRTVJU9+BWpSp195pne+5BD9Q0cM=;
        b=BzKAgeC6FPfAU5vPXXlYra5FKdGsVCkoFMgTyEwygNcbQsr2pM8tNenkusUyNnbmV/
         YDPXDDi1jOaeL+fi8/L06ek1dvEglZgqXc23yDY8SuPnek0UQUcVaO9umYE86wNUV57L
         eWdKUvmgaOxefoF1Crh49CrdAT910P/oNxMPoA9OQrMhb/cInzVjKBsPZrpdBvDyOipv
         Ivv1UhK2MRVDug3FqBVZNuGhH94l0fGuU8Mt9Crz+G6ZYH7ZpsG/TpYYPJe2dprSD7MT
         hCeD0KaMWS0q+BH7KFzVrHa/9v3JQpWBaicGAPeQAbmMWVHuVkcE/5D+rSMEvypzAlrN
         U5hQ==
X-Gm-Message-State: AOAM530flyfj0poZrpiYJem+Cnnngjbf9mRB0iQ9JGHhEjLqLwu1A/rQ
	cFgaAvjYG1/yDagt8ZeBexcpPu+sVcg=
X-Google-Smtp-Source: ABdhPJxFFCdSBUn0qgFHuilSn1se0Gxi4EtyoFjc/h7+uNCq/HX+0RiiQM8g8EhA92iMVb5RqKS/4g==
X-Received: by 2002:a05:600c:3b26:: with SMTP id m38mr4757846wms.155.1631124090482;
        Wed, 08 Sep 2021 11:01:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/26] libcap: update 2.51 -> 2.54
Date: Wed,  8 Sep 2021 20:01:01 +0200
Message-Id: <20210908180125.103473-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebase patches.

Delete 0001-tests-do-not-statically-link-a-test.patch as centos
builds are now using their own buildtools.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch | 52 -------------------
 ...-tests-do-not-run-target-executables.patch | 10 ++--
 .../libcap/{libcap_2.51.bb => libcap_2.54.bb} |  4 +-
 3 files changed, 7 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
 rename meta/recipes-support/libcap/{libcap_2.51.bb => libcap_2.54.bb} (92%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
deleted file mode 100644
index 55872aa8fa..0000000000
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 897900f3f9084c5542097851323bba3f2691df20 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 15 Jan 2020 17:16:28 +0100
-Subject: [PATCH] tests: do not statically link a test
-
-This fails on e.g. centos 7
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- progs/Makefile | 2 +-
- tests/Makefile | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/progs/Makefile b/progs/Makefile
-index 3e82862..48533f3 100644
---- a/progs/Makefile
-+++ b/progs/Makefile
-@@ -49,7 +49,7 @@ capsh: capsh.c capshdoc.h.cf $(DEPS)
- 	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
- 
- tcapsh-static: capsh.c capshdoc.h.cf $(DEPS)
--	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS) --static
-+	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
- 
- uns_test: ../tests/uns_test.c
- 	$(MAKE) -C ../tests uns_test
-diff --git a/tests/Makefile b/tests/Makefile
-index 4a5f2f9..4266d86 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -22,7 +22,7 @@ ifeq ($(PTHREADS),yes)
- DEPS += ../libcap/libpsx.so
- endif
- else
--LDFLAGS += --static
-+LDFLAGS +=
- DEPS=../libcap/libcap.a
- ifeq ($(PTHREADS),yes)
- DEPS +=  ../libcap/libpsx.a
-@@ -113,7 +113,7 @@ noexploit: exploit.o $(DEPS)
- 
- # This one runs in a chroot with no shared library files.
- noop: noop.c
--	$(CC) $(CFLAGS) $< -o $@ --static
-+	$(CC) $(CFLAGS) $< -o $@
- 
- clean:
- 	rm -f psx_test libcap_psx_test libcap_launch_test uns_test *~
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 69287152eb..0fe7295a5f 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From 652071e430d5eea758965176b7648e79ad404daa Mon Sep 17 00:00:00 2001
+From cc97f84469ee7b266977a20d9cfa63c52f821384 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -11,20 +11,20 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index fc39fee..3431df9 100644
+index d9ed248..2864f77 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -59,13 +59,11 @@ endif
+@@ -63,13 +63,11 @@ endif
  
  # unprivileged
  run_psx_test: psx_test
 -	./psx_test
  
  psx_test: psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LDFLAGS)
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LDFLAGS)
  
  run_libcap_psx_test: libcap_psx_test
 -	./libcap_psx_test
  
  libcap_psx_test: libcap_psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
diff --git a/meta/recipes-support/libcap/libcap_2.51.bb b/meta/recipes-support/libcap/libcap_2.54.bb
similarity index 92%
rename from meta/recipes-support/libcap/libcap_2.51.bb
rename to meta/recipes-support/libcap/libcap_2.54.bb
index c9c30fb05f..04362e7032 100644
--- a/meta/recipes-support/libcap/libcap_2.51.bb
+++ b/meta/recipes-support/libcap/libcap_2.54.bb
@@ -12,9 +12,8 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
-           file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "6609f3ab7aebcc8f9277f53a577c657d9f3056d1352ea623da7fd7c0f00890f9"
+SRC_URI[sha256sum] = "5091b24247999fd7a5e62bd9ac8bc761cda29f9baa0d1a2ca6a46f13891b4f0f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
@@ -42,6 +41,7 @@ do_compile() {
 		AR="${AR}" \
 		CC="${CC}" \
 		RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}" \
 		COPTS="${CFLAGS}" \
 		BUILD_COPTS="${BUILD_CFLAGS}"
 }
-- 
2.31.1

