Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44726C36008
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.2956.1742372193781995215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VkYrPdqz;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2243803b776so14967875ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372193; x=1742976993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=VkYrPdqzUbSpxNf4mjbuqkgjCi8sWpkO9F6pF8U5thNnfyyjBHHeEiYl4Q/qMGDxEn
         GGutBXcOwW4+9pxvjjXSJtmvAtjZi4byKNo6bstE7sTL4/LRnL4nTdzsl6v1W5RL52Zx
         RU8tr/b1FHoqMctE/kNc3iR63OXcSriK12pZ604M4U+/Lhj8mlpLqSY3S6YRU1/mvAiA
         S+9zs6JhupXPMqaJGoHv9X1fD5f+2fBptITxT9R69TO/rR5njd36GVtAJfKG3MOVzVES
         PYxz7+gPgr2nrz82KlV9uoha+4KElKUe83YzPg60yF33G2cgD5nWZgVnDiPBtCgs+/oY
         a9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372193; x=1742976993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=DKLm9qZNAjxNyulVDmzrQysnNWnFRc/GHj+6lToGd8JF73e6dEgxdQ2phCMTGu0ab7
         a9Upe6YUwD0ZlaZbeWVLzagOp3obIiKGeWPzwoBUEzcU/c3FZwmHc/83GDWcp+8Y9Ofy
         ZC3JHRtYnD0BqhSrRFeqlU+sQ6Ro1VP57BauAXQgxi6bTzEHPNxstPy/l4PIPnryn95H
         JMfU48sNA5zUchVr6nEmUCc9zb0NJmCQQsti4d2FlXS1f6UScNLDhqjXH1Zkj+IvhXrg
         R8nLZbmHEg9FgUqEMNarfD4X9L6loj9WCyDA59fILEd+zR+B7OfozwJ5r5nS8a2z4w7x
         kcAA==
X-Gm-Message-State: AOJu0YxQ12zQLP8q3kYuP+FDV3YzzgrwEBir7Q4wK8bSekjveCL/+Lpe
	ZAzfnRVGx7f92mTAkhwjnmyuY9XYZ0ozDXqH3t65mFMiGTD3e/yoIYxU/b86
X-Gm-Gg: ASbGncul2H2ItHwqJFMzGyD0K9zb05NDMgDwwqKpfywZJ+otVkGpH6LeZgEWBszOlCt
	rU/vHq9yEnAYvuXePbIXg4zzQ0EB25uXcX0p39B+Rn/bDOzv4o09gRr8NkwWFAFs/5oHvfxpkMi
	uY+PquQv/+dc940lpLg7kTXSm+tJcLy0noW/mjq9uj6Bp3k8o1ZJuaUmAZabJGXzLC/GKFfU9ZR
	8EseeiaT9DixTETnz0MoaLX+iFfH4jnCqFQodwckN+lLcW2n1c0WZNfSRchJXmW+s/vSdirBOn0
	hyYOy+BSErwgo1/CNHfnV8tdbkCUIKqC4ynt
X-Google-Smtp-Source: AGHT+IFRi3dBt7ponL9sCmsqPjaPWMiwdbpnUzGAjnkLX22/BPSxrOu2YDSbLkJk4YmKWQot+uA6mA==
X-Received: by 2002:a05:6a21:3993:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-1fbed40be09mr3490889637.40.1742372192886;
        Wed, 19 Mar 2025 01:16:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 17/25] makedumpfile: Fix build with GCC-15
Date: Wed, 19 Mar 2025 01:15:51 -0700
Message-ID: <20250319081610.3536475-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213289

fix gcc-15 compiling error: too many arguments to function eppic_init

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-compiling-error-too-many-arguments-.patch | 43 +++++++++++++++++++
 .../makedumpfile/makedumpfile_1.7.6.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
new file mode 100644
index 00000000000..90f1b4038be
--- /dev/null
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
@@ -0,0 +1,43 @@
+From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
+From: Coiby Xu <coxu@redhat.com>
+Date: Thu, 23 Jan 2025 17:47:10 +0800
+Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments to function eppic_init
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2340813
+
+When building makekdumpfile against gcc-15, the following error is
+shown,
+
+    erase_info.c: In function ‘process_eppic_file’:
+    erase_info.c:2226:13: error: too many arguments to function ‘eppic_init’; expected 0, have 1
+     2226 |         if (eppic_init(&eppic_cb)) {
+          |             ^~~~~~~~~~ ~~~~~~~~~
+    make: *** [Makefile:109: erase_info.o] Error 1
+
+Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
+
+Signed-off-by: Coiby Xu <coxu@redhat.com>
+Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
+---
+ erase_info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/erase_info.c b/erase_info.c
+index cbe1681..af6bfae 100644
+--- a/erase_info.c
++++ b/erase_info.c
+@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
+ {
+ 	void *handle;
+ 	void (*eppic_load)(char *), (*eppic_unload)(char *);
+-	int (*eppic_init)();
++	int (*eppic_init)(struct call_back *);
+ 
+ 	/*
+ 	 * Dynamically load the eppic_makedumpfile.so library.
+-- 
+2.48.1
+
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
index 21847ece6b8..46be13e7d0f 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
@@ -26,6 +26,7 @@ FILES:${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch \
 "
 
 S = "${WORKDIR}/git"

