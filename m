Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122CACA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 14:50:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.16051.1757342998828659202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 07:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QpY3DhhW;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-622b4b14a75so5016466a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757342997; x=1757947797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEVGEgLVlueV6toeZeScat/NG164qiTdUz6DiySjq+A=;
        b=QpY3DhhWOcv7yhBCOK5ZuT39S6PDsgv9GAZaNAbSPMC2CPRbs7grHX2zos/VJ1PXDf
         usJ17mPp8oi5LexyWKrcBkAM9s7o8FP03s2yrNsBIOZQDWQ7wtak1uzAZ+02dvkY8B8r
         OZ1le4PfWgunofWVhjCGKKkFph3JD1Kjsl8xfWd6sH65nf1+XemVsJOLAvlGs0WY3AR3
         Qy1p7LCGVq8k0vTV1o1MrJ5o3C+DFZAzc+slSRzyya9s8XHakFd9Jp063IY+ZJMeJDH8
         8R2yYJLfynlFMzlDR5yTo7jf2cTPEHKkulq0b41rGA0Jlj42lSa5L0zknHAwtu7v0RuA
         kdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342997; x=1757947797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEVGEgLVlueV6toeZeScat/NG164qiTdUz6DiySjq+A=;
        b=SMTB8b3wUXdYdLy4DDXlZz7ZjNelFUdlzqgNqClHPbkDSNdAxqt9NztmN1o5YtfvNw
         IRc4KZVgQXG/7uU5B+CoFzyV5NaBPhira+Vg4fy/H+o56qM7y3tRb7YEwloUvDJTyic8
         FRFNS3FKclsg/CatvYg0WsKmdB9RO2tUDSfSHw6K7OtOnFKaJyAC5LCcccA5ddyR5oaS
         rCt2lRg3H9xRzVXH1kjULKrNPTfTDPVAtBn91m8KNE6E/Tcn9TseUyp4gLtkFrZDIEAw
         bM8lvffjgndNdqvXBbV52BUsQxcq8nmsBrD0W0hqBfDvykMdOetw5/6uIaEWdsjXXQZM
         uEkg==
X-Gm-Message-State: AOJu0Yx1KOJqb4ePOU/STj53PvmttY9+MIKfq/z0GsZaIl5ZpkiGTUdf
	Bcresyh6Y91diiJyAykLmzKMqhavvubIqPPiii0YAINXga9TC/34oIYVvsqZWA==
X-Gm-Gg: ASbGncut9aM+vO1nH/mweIYBcLX3shBZogz3wu06LO6APVkIAYjd/YZu9ZmbUpBoX05
	KcFiPDSeVxikQeFh3VA7+HEDRgdPshHgmYiTfGUU2AABCjneiM6TZ/FyqyBl9dLUy72SKjGEY1G
	867Eu0FYquNFbsohuVzHu0t+izfduEhME2FxVukYzmW4p5CXD+uWsqxtpVYfx+cjKFWyC/eovMS
	n1YSrtdNqwZHReCyz96igOPYXhrXpa2WjevkWCuVKooSZuVYNzlHe57UFxICwLulljEAf4bN8Sr
	bp2FtKtoAbl/48qCep+yqQ+Ed9hsOmoPM3mCZnfu9aSRwybyvf6ILD38qXlS/fPoJpxRHm4m253
	Ae/8B4J6o+VeYLlyJV0hucKKsSoyW5AY=
X-Google-Smtp-Source: AGHT+IE+wv4Y1AQ/mM6EX5laaFhSi9wi7Z+ow2Upy+nm3oa6mlQdJpoyVyrKc82YPImvOh2GDBXP+A==
X-Received: by 2002:a17:906:7d43:b0:b07:6457:13f0 with SMTP id a640c23a62f3a-b0764571477mr10940066b.9.1757342996767;
        Mon, 08 Sep 2025 07:49:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04148f95b5sm2079582766b.92.2025.09.08.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:49:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH] libassuan: don't search for gpgrt-config on build host
Date: Mon,  8 Sep 2025 16:49:55 +0200
Message-ID: <20250908144955.2615043-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223070

When another project uses the libassuan.m4 file to find libassuan details,
the macro first tries to execute the gpgrt-config executable if it can find
any in the PATH. However it also prepends the PATH with ${prefix}/bin, which
usually translates to /usr/bin - in case the build host has this executable
installed, then it is executed, and it shows warnings about mis-matched
architecture before pkg-config would be executed.

To avoid this, extend the existing patch to not prepend the PATH with the
build host path - the existing PATH should be good enough.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>

---
 .../libassuan-add-pkgconfig-support.patch     | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index 20361e8a99..5714e46b7e 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -1,3 +1,4 @@
+
 From 9d28122b7e7ae3f17364e1ab97355cf5eaf14cb8 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 7 Aug 2024 11:36:26 -0400
@@ -14,14 +15,30 @@ Refactor to apply on top of 3.0.1, including reformatting as an mbox for
 easier use.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+Remove $prefix/bin (/usr/bin) from search path to avoid executing gpgrt-config
+installed on the build system. At the very least it leads to warnings
+about mis-matched architectures in the config logs.
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
 ---
- src/libassuan.m4 | 81 ++----------------------------------------------
- 1 file changed, 3 insertions(+), 78 deletions(-)
+ src/libassuan.m4 | 83 +++---------------------------------------------
+ 1 file changed, 4 insertions(+), 79 deletions(-)
 
 diff --git a/src/libassuan.m4 b/src/libassuan.m4
-index 4d7da17..f4692ab 100644
+index 4d7da17..81b495a 100644
 --- a/src/libassuan.m4
 +++ b/src/libassuan.m4
+@@ -17,7 +17,7 @@ dnl (minimum pkg-config functionality, supporting cross build)
+ dnl
+ dnl _AM_PATH_GPGRT_CONFIG
+ AC_DEFUN([_AM_PATH_GPGRT_CONFIG],[dnl
+-  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
++  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$PATH])
+   if test "$GPGRT_CONFIG" != "no"; then
+     # Determine gpgrt_libdir
+     #
 @@ -103,27 +103,6 @@ dnl
  AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  [ AC_REQUIRE([AC_CANONICAL_HOST])dnl
@@ -136,6 +153,3 @@ index 4d7da17..f4692ab 100644
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBASSUAN_CFLAGS)
--- 
-2.43.0
-

