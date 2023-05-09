Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E867C7EE30
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.39308.1683653042737769846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GzxhJP1X;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso1111977866b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653041; x=1686245041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiMIM5KmCQl26wRAiZ2dwdbghtAZZeroSE8ZqinXVtA=;
        b=GzxhJP1XU7DXzENs2Up1U6yq84fIeIrkO1pieTt3WVcSljxC+OyudiP3d86+juo+Te
         9Z+vXjXo40K7uXFyn407EkA9e4cgVNm2RBTTHFSWJJnUnJ4oaG16ort8qNoDqdiMmPa6
         xtGcwXwMd6iUR2sFs7y6tQgbTjfk2eQlZP1NXg0YGnd11haRRTFBfsBTnlIxFDX2bJDT
         Ur4de7CG9xI72YiIDXq+z13HmArF0RcmuOHBWIBZiNa87/K7i4Ca8o3u6EI6xBKQlcKc
         5MlFCmwigTb1X9pde1w0IYGMWv+aaMjROrjSVksghHLDekNN8EUkyFxti0UvC+9nMUeM
         gNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653041; x=1686245041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiMIM5KmCQl26wRAiZ2dwdbghtAZZeroSE8ZqinXVtA=;
        b=T3P9WRgPvLoudxr7xMmHF6mu0VXNxlzviA+YPnHC8laE3bjsUf+/aaMf2yzKNx0w1M
         QuWqCENGBCNRETO2ittvFI2wzQFn5PpJ5PDw4CJnHXt1UFHgvPhEvWLn9HqIvycOCMbn
         W+p0+h2APjlEC1i/x1+D2utTLZqoWycLk/qNnhv7bBBRdLK5f/hmosSAyYwGMG9TEVGq
         GUXB37iS8WjorXXIibAGRN/Qo+aOzArhTI7Az7SjYrnuYQ3DtTPdyiBCxSha3GldBLKm
         YzMaMnmdxC62JC2isAOMIOEAAnyP4a0nWoarRz5H3bJJX5+oNKHH8sqfymemot6ZJnA4
         hQBg==
X-Gm-Message-State: AC+VfDw8v5rM7CdJ6rhns8gp5LboBODOfjOi/Fz0jCn7lvfHQd2zawpB
	ru8DjlYa8qrK7Y5j3/4f0R/HeMsUHcA=
X-Google-Smtp-Source: ACHHUZ5xnXHwUBRWj7aSZVc6HiAA2E4h9f/AF+RZV/i3ae56PeYjEI39pyXssNA3ZsDx3jwMINIASA==
X-Received: by 2002:a17:907:9345:b0:958:4870:8d09 with SMTP id bv5-20020a170907934500b0095848708d09mr13367244ejc.37.1683653041206;
        Tue, 09 May 2023 10:24:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/27] cryptodev: remove unneeded patch
Date: Tue,  9 May 2023 19:23:36 +0200
Message-Id: <20230509172344.1516743-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181074

With 1.13 version the needed rules are available directly
upstream. This wasn't noticed in 1.12->1.13 patch rebase.

I verified that installed files are exactly same with and
without the patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cryptodev/cryptodev-tests_1.13.bb         |  7 +-
 ...and-install-rules-for-cryptodev-test.patch | 66 -------------------
 2 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
index c5414787966..458ad8ecf2a 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
@@ -5,14 +5,13 @@ SUMMARY = "A test suite for /dev/crypto device driver"
 DEPENDS += "openssl"
 
 SRC_URI += " \
-file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
-file://0001-tests-Makefile-do-not-use-Werror.patch \
-"
+           file://0001-tests-Makefile-do-not-use-Werror.patch \
+           "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
 
 do_compile() {
-	oe_runmake testprogs
+	oe_runmake tests
 }
 
 do_install() {
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
deleted file mode 100644
index 8c40e623890..00000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 3ba8ba9410464d0986bc6cc5ddb1819745af1eb2 Mon Sep 17 00:00:00 2001
-From: Yu Zongchun <b40527@freescale.com>
-Date: Sun, 28 Apr 2013 14:39:22 +0800
-Subject: [PATCH] Add the compile and install rules for cryptodev tests folder
-
-This is required to install the cryptodev tests folder to rootfs
-
-Signed-off-by: Yu Zongchun <b40527@freescale.com>
-
-Upstream-Status: Pending
-
----
- Makefile       | 6 ++++++
- tests/Makefile | 8 ++++++++
- 2 files changed, 14 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index d83aee6..3a750a1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -41,6 +41,9 @@ modules_install:
- install_tests: tests
- 	$(MAKE) -C tests install DESTDIR=$(PREFIX)
- 
-+install_tests:
-+	make -C tests install DESTDIR=$(PREFIX)
-+
- clean:
- 	$(MAKE) $(KERNEL_MAKE_OPTS) clean
- 	CFLAGS=$(CRYPTODEV_CFLAGS) KERNEL_DIR=$(KERNEL_DIR) $(MAKE) -C tests clean
-@@ -54,6 +57,9 @@ tests:
- 
- .PHONY: install modules_install tests install_tests
- 
-+testprogs:
-+	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
-+
- CPOPTS =
- ifneq ($(SHOW_TYPES),)
- CPOPTS += --show-types
-diff --git a/tests/Makefile b/tests/Makefile
-index 2502f32..2fb7a9a 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -23,6 +23,12 @@ bindir = $(execprefix)/bin
- 
- all: $(hostprogs)
- 
-+install:
-+	install -d  $(DESTDIR)/usr/bin/tests_cryptodev
-+	for bin in $(hostprogs); do \
-+		install -m 755 $${bin} $(DESTDIR)/usr/bin/tests_cryptodev/; \
-+	done
-+
- check: $(hostprogs)
- 	./cipher
- 	./hmac
-@@ -38,6 +44,8 @@ install:
- 		install -m 755 $$prog $(DESTDIR)/$(bindir); \
- 	done
- 
-+testprogs: $(hostprogs)
-+
- clean:
- 	rm -f *.o *~ $(hostprogs)
- 
-- 
2.30.2


