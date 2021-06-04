Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.5863.1622798105694873304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JWPHk1iC;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id h24so13467598ejy.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wohOciiptwMFriJJxqRg2ILltBuql/o6M6dRK8uZ/7c=;
        b=JWPHk1iC6aKRqHsB2dFgkU4KCTY7Uj0IaLfhL1zFtecsHxm8huGeFL5MUzOb7Kkql9
         XEYhblWurwpeVvhs04zi5/s0gaJdUcU/a2ooRpHuCd/VI0ywgW2ud0+gKPjK8R0JKCqy
         tc+Tzhx5dWwzMwZt4PgDxu6Ii4sKRFWr5UqMZ+UqLTe0ru0nTzysGAECd7QqJowTbzUu
         je04FiPLDKXSqmEf/gaMPmhgo0E4rs7ZyK8Jfd9QPRjO7RcD4Tqul92dL3resP6KRcCE
         vg83IBYJtMKaM/v76qnYbrk71yp+aq3gmiihP/VRum4YmiYvKdHuW3m0BQZRB4lUE+Ou
         6ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wohOciiptwMFriJJxqRg2ILltBuql/o6M6dRK8uZ/7c=;
        b=HRiacBiMZq8KjkE0xwtq5T9rLo271tRMAI9MQZz5u1uFsoQ3I82tUnvZCpKrim13oH
         u7HdbN6Q9/V8lgzid+YOuHyZ64bvpcp8HqUEFwd2S7C+WL8HuEV83WjYSDf3WW69rJhq
         O/+3XbNZGhjM3+/CTgmq4ajA0YPDLl9soe8m0yVY/DI93F68INUjrrymlsXKzqxworgc
         nRKET3vLDfKWSc4dFUeDbDz95YYws6Xu+DJFkddmpKaIuJmAPUgNjeWVhOMiGGW0O5ff
         YPMM9Xte9FKrt6E+tDZLTeWlQX8ssNTYphjeFVB+Ibz0pvBLeAFBJhp18/5ZWLy1F2VS
         aXTw==
X-Gm-Message-State: AOAM530+0+mebOLTQAL3AT2jWnZbPzqfC9DD/3hTV9cVs/3QmztO9Mvn
	cVIv3Jex+eD8V8EYhro3V8b86WAYwJDZtA==
X-Google-Smtp-Source: ABdhPJxGieCFyg2agPLcuxZFF/NNQrr55T+pzaeTEYfxxtl+P74K2egIWMDl3Sg2qV8sdhWSeBYu8Q==
X-Received: by 2002:a17:907:7808:: with SMTP id la8mr1003668ejc.13.1622798104356;
        Fri, 04 Jun 2021 02:15:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/10] libcap: update 2.49 -> 2.50
Date: Fri,  4 Jun 2021 11:14:51 +0200
Message-Id: <20210604091458.1381144-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-tests-do-not-statically-link-a-test.patch | 20 +++++++++----------
 .../libcap/{libcap_2.49.bb => libcap_2.50.bb} |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.49.bb => libcap_2.50.bb} (95%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index d2653afb75..414e45a6f4 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -1,4 +1,4 @@
-From 6aa15fe548e5b1d6ca3b373779beb7521ea95ba9 Mon Sep 17 00:00:00 2001
+From 897900f3f9084c5542097851323bba3f2691df20 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 15 Jan 2020 17:16:28 +0100
 Subject: [PATCH] tests: do not statically link a test
@@ -7,26 +7,27 @@ This fails on e.g. centos 7
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  progs/Makefile | 2 +-
  tests/Makefile | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/progs/Makefile b/progs/Makefile
-index 1d7fc7a..37db8f7 100644
+index 289186e..071a285 100644
 --- a/progs/Makefile
 +++ b/progs/Makefile
-@@ -42,7 +42,7 @@ endif
- test: $(PROGS)
+@@ -49,7 +49,7 @@ capsh: capsh.c capshdoc.h.cf $(DEPS)
+ 	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
  
- tcapsh-static: capsh.c $(DEPS)
+ tcapsh-static: capsh.c capshdoc.h.cf $(DEPS)
 -	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS) --static
 +	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
  
  sudotest: test tcapsh-static
  	sudo $(LDPATH) ./quicktest.sh
 diff --git a/tests/Makefile b/tests/Makefile
-index 01f7589..094ec57 100644
+index 4a5f2f9..4266d86 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
 @@ -22,7 +22,7 @@ ifeq ($(PTHREADS),yes)
@@ -38,7 +39,7 @@ index 01f7589..094ec57 100644
  DEPS=../libcap/libcap.a
  ifeq ($(PTHREADS),yes)
  DEPS +=  ../libcap/libpsx.a
-@@ -106,7 +106,7 @@ noexploit: exploit.o $(DEPS)
+@@ -113,7 +113,7 @@ noexploit: exploit.o $(DEPS)
  
  # This one runs in a chroot with no shared library files.
  noop: noop.c
@@ -46,7 +47,4 @@ index 01f7589..094ec57 100644
 +	$(CC) $(CFLAGS) $< -o $@
  
  clean:
- 	rm -f psx_test libcap_psx_test libcap_launch_test *~
--- 
-2.17.1
-
+ 	rm -f psx_test libcap_psx_test libcap_launch_test uns_test *~
diff --git a/meta/recipes-support/libcap/libcap_2.49.bb b/meta/recipes-support/libcap/libcap_2.50.bb
similarity index 95%
rename from meta/recipes-support/libcap/libcap_2.49.bb
rename to meta/recipes-support/libcap/libcap_2.50.bb
index eb9fc5b4b3..15137f0ac0 100644
--- a/meta/recipes-support/libcap/libcap_2.49.bb
+++ b/meta/recipes-support/libcap/libcap_2.50.bb
@@ -14,7 +14,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "e98bc4d93645082ec787730b0fd1a712b38882465c505777de17c338831ee181"
+SRC_URI[sha256sum] = "47a57b8bd238b84c93c921a9b4ff82337551dbcb0cca071316aadf3e23b19261"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.31.1

