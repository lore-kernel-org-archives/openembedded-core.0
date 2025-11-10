Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E19CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 20:38:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1134.1762807075129788742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 12:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PM0mJY4m;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29586626fbeso30950285ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762807074; x=1763411874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALi/TvL7VQ5twcXZ8nnMcS3bMQ2UcXfJnN/+u7QZHC0=;
        b=PM0mJY4mrMi1+FqNKxucNKYVFQU+LvNrWcL4YYaY7Ixj6WxT0ka6KYbvPa3ATQx6EV
         Z1Mmq6MmRGTVp9G1+wZCpH5T5gVQrVwclGzgT32L2IwYejPQ2lag5GHb0Uo2YVNcuj5f
         SCK0vQl7SbqXG+cuIfFgqJdlMSphznOTXtbcGwJ9a7FYmsMxsnwzd7w3kBM584ygJ6ko
         xsBcr8q3mhqop/pYXQsfV5b3OVbiSgnqOwd5ZNqEBhxOHNWQXQG4DHSyFQ5w1X04ofNa
         WBTRxpK18POn2JFJ/ql2HX3CaK20dyPAKEac8xWDrBwCVsu3W1PvAFuXtWjW9QOoGhSW
         O7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762807074; x=1763411874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALi/TvL7VQ5twcXZ8nnMcS3bMQ2UcXfJnN/+u7QZHC0=;
        b=wUdWAGwQBS1wY26Y+PyfuFEAuiN3XMdcKbjnCvqCfIubBG9u/L4VbRPmPYalClxJ19
         e03HpUJ9j7ZtpQyPYS9AEEDMwwJIrsnIXqoJ3GIhseWUfB17/Z5JF/YEIiwvu1axq3BU
         OvF28bsj8+ryw/SsiqYg66fX9eWgpgqx/p5MKmzgmHfIY304cjOWd1M6goU6uZMnVK//
         JahoRm1fVjR0vOuyIAgLtJiDNNF8zmwUYaWzAdx6XZBUkIGw8ajzE6GeHSA+3O4GUJZr
         ajiKrnT9DeBZhRBr+oJoeOBJUBzAe/sh2inxWQdekbcZaVaaJO36H51vz7yjoVPJts6w
         VBHQ==
X-Gm-Message-State: AOJu0Yy5/hEsp28PNEDT5iPI2DpHtvwtCuxNd2t6awji+OjPYzxEQq/m
	RFqcG8JCDcq3aRVCA9OCWN5aS5zmj9GMlvVjHOcnPHTF50kmxxt442QdJl9TDqy2Fy4=
X-Gm-Gg: ASbGncuvSN+e8Z+OpT7Mn+wSmLNZwUTCjsY7Nx8gw1h+lKd0kbIIQXjRw15vl/nTT5d
	MzRKcg0/ks7zbSKd1JBYa+doaFi4fflPPdLA+2HwdsoQXK9aZmQY1GxX0xRgfoJyjUvW2uJk7cr
	WPwSYzgXeF9OC3bk9tHiUprq8MG35ecrD5JUrS1+UmT4MJOLtNTFtG+Zd+MO4YFZMz5dipbg6Bb
	ZGNloprIOE5cbT15QFn5Cw04EWSw6pMuFLM/dQREMCMMbWyzrzSHKruwVOWc4uXGE8RDNgmWu40
	lbGuHDGoYMz+d4fvlMhgrV9i+QdB8Yw4OFNERKjNnHssqlE82Wu21fIkdsfSd3sJDdNW0NsRALx
	r0fSZLghFpE9oFE4MgCR3e6jxQFL+pLW/88lKf3745jt5pQ59aBO72u0QzaZkUB+ZPR/efpnbwE
	4S0jUkafVTQ9GPc6n96QQcXUG1fuROG7Iu3svUpFG+V18apMz3rkqBR9JjefIJhL2q1CjssBgpc
	k0yp8ky2oM=
X-Google-Smtp-Source: AGHT+IEgH1cInXO3PvJIy4HKzK9bKpQKQaFkkCPOZdw5HOMiKbv3CRo95w0V7eapTX5Djx4aDVUluA==
X-Received: by 2002:a17:902:ce92:b0:250:643e:c947 with SMTP id d9443c01a7336-297e56bdf49mr120034375ad.28.1762807074203;
        Mon, 10 Nov 2025 12:37:54 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cc1907sm154868535ad.99.2025.11.10.12.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:37:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] virglrenderer: Fix build with glibc 2.43+
Date: Mon, 10 Nov 2025 12:37:51 -0800
Message-ID: <20251110203751.777801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 20:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226139

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.1.1.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
new file mode 100644
index 00000000000..1740d7605f8
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -0,0 +1,55 @@
+From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Fri, 7 Nov 2025 13:14:56 +1000
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Just fix up our use of it.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mesa/compat/c11/impl/threads_posix.c | 3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+--- a/src/mesa/compat/c11/threads_posix.h
++++ b/src/mesa/compat/c11/threads_posix.h
+@@ -51,7 +51,9 @@ Configuration macro:
+ #include <pthread.h>
+
+ /*---------------------------- macros ----------------------------*/
++#ifndef __once_flag_defined
+ #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
++#endif
+ #ifdef INIT_ONCE_STATIC_INIT
+ #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
+ #else
+@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+-
++#endif
+
+ /*
+ Implementation limits:
+@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
+
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ static inline void
+ call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
index 89dd25de70e..be4385ada61 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
 SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            "
 
 inherit meson pkgconfig features_check

