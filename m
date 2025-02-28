Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9005C282D0
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 20:32:15 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.4141.1740774732409358232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 12:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gmbZnCOS;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d1a428471fso19649345ab.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 12:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774731; x=1741379531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RtlGl5yu9nQNkLOxbER9Y2Rcv7UePtsOEiIXtyQ80A=;
        b=gmbZnCOSnNAvksYZo+V5o3R6XSTPFrpFpbRZFmIpaTc3vTXZx1W1jsTMvqhF2wN+CH
         /9fVunc++OjUrafP04BMNa1kkt458GSRp+BS20UXMWJ+AjtD1Fvi1dJLR77TARp0Rrmf
         TRxm8lAEuFOAyuVcwxgw8q1QEVWyfe4ZWWamnnhIcbhnysW2gydPy2G3G5xN0pJWkIW0
         FcISsR7Wajpa/UdIGTf/Ny6NB2zsVm2P9JOEa8y4iG3iZtkUbbkuaX0Os1TUFIWpDuCr
         Kwoor7kgHC0RhcUviRsSEttToUbA58t++R79o1BmPrufh0S5wBSldz545jl9NKQEZI3+
         GwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774731; x=1741379531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RtlGl5yu9nQNkLOxbER9Y2Rcv7UePtsOEiIXtyQ80A=;
        b=QFUKAoamlqzRSXU84nN5TcQTJ3FlXX9l8nInxIXWuScEjWTaEsN2raktpqq/pIGLWN
         fMiYztYtCgzrLE2BhgU9zB0K3NDU/DVpeM2ZTIsN26WoBG9pZLiQBmFd7DMBEa67Lz7v
         2OE03gQwCM+VW7WAOwnGg5HzY3sGkA8OggJyat9ulLm/402b4ZYpr89dG4UgWZwWTRvW
         oMRV8iam/Z4GWknLy+SYyzS6A1EUPF9dUilLvWLMh56OODmQ6CgA+xeT2SMUPgEA3b03
         ZRzLZXdpwmB77hcSs+vtB6L+zKgq/Rvn+CLEPFTGKFDtHp9y3F359gmaxhbGePz/gS+Y
         mwIg==
X-Gm-Message-State: AOJu0Yy1OyfT+YEYeIZ8uIhX+Zv59pJ/0CkFWMZ9WxosVUoldYowXdR8
	KB6j/q/hCRY4pVjkaXa187DEYdFipr69Rez6EWR7+euzIYYnZwLTRy0dkQ==
X-Gm-Gg: ASbGncvpLwXDnIf80VQemAAEXYcal//1gkZ2pTXcb8dsH0NeyWWVSKYpMajpRKOFKgN
	YgYPlhsa8OGr1XzaJ0v7Kh3wpFyvZvgxCb64qKduh/xMJ2O49OiZKpQQWW6+3V9Ga8mNmpKOa2X
	ENb1fecY3znDzKugjNTIvWDgfdVbjHDabGRPp1PNNSTXD8h2buO2Q9WFJSjYueT2rnS3jbTitT9
	dHnBS352omQLpruR7rn0Q8wcf1ab69/ici8dHm9+mxhh1oWU9qt60Pvcj6xQEJXOvnarXcfE5nB
	YymUYzg4Djz4XRX3qY8XzMjdfm3OIrVNQuY3QPCjJ/u2nIQX5XHTIbfenA==
X-Google-Smtp-Source: AGHT+IHWhUOI7mtnZNMpB9lU84fyjiyA+CINU80lMxhd5LNcQzKAj+7Hu/gnHYFJd9dQpd8mI95dRg==
X-Received: by 2002:a92:c68b:0:b0:3d3:f4fc:a291 with SMTP id e9e14a558f8ab-3d3f4fca3e2mr10248815ab.19.1740774731084;
        Fri, 28 Feb 2025 12:32:11 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f061c718d6sm1049005173.65.2025.02.28.12.32.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:32:10 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl-native(sdk): poision built in paths
Date: Fri, 28 Feb 2025 14:32:06 -0600
Message-ID: <20250228203206.1979714-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250228203206.1979714-1-danismostlikely@gmail.com>
References: <20250228203206.1979714-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 20:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212078

From: Dan McGregor <dan.mcgregor@usask.ca>

Long ago, in the OpenSSL 1.1 days changing CFLAGS worked to override
hard-coded paths in the OpenSSL libraries. Even as far back as
kirkstone this was no longer working.

Override make variables instead to poision the paths that get built
into the native (and nativesdk) libraries so they become relocatable
again.

While here, remove the -isystem<foo> compiler argument from the compiler
command line stored in the library, just like we already remove the
prefix-map and sysroot arguments.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...-sysroot-and-debug-prefix-map-from-co.patch | 18 +++++++++++-------
 .../openssl/openssl_3.4.1.bb                   |  4 ++--
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index b8672735abe..91a95d89290 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -30,23 +30,26 @@ Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- Configurations/unix-Makefile.tmpl | 12 +++++++++++-
+ Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
  crypto/build.info                 |  2 +-
- 2 files changed, 12 insertions(+), 2 deletions(-)
+ 2 files changed, 16 insertions(+), 2 deletions(-)
 
-Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
-===================================================================
---- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
-+++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
-@@ -502,13 +502,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 09303c4..011bda1 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -502,13 +502,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
 -# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
 +# *_Q variables are used for one thing only: to build up buildinf.h
  CPPFLAGS_Q={- $cppflags1 =~ s|([\\"])|\\$1|g;
++              $cppflags1 =~ s|-isystem/[^ ]+/usr/include||g;
                $cppflags2 =~ s|([\\"])|\\$1|g;
++              $cppflags2 =~ s|-isystem/[^ ]+/usr/include||g;
                $lib_cppflags =~ s|([\\"])|\\$1|g;
++              $lib_cppflags =~ s|-isystem/[^ ]+/usr/include||g;
                join(' ', $lib_cppflags || (), $cppflags2 || (),
                          $cppflags1 || ()) -}
  
@@ -54,6 +57,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
 +              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
 +              s|-fmacro-prefix-map=[^ ]+|-fmacro-prefix-map=|g;
 +              s|-ffile-prefix-map=[^ ]+|-ffile-prefix-map=|g;
++              s|-isystem/[^ ]+/usr/include ||g;
 +            }
 +            join(' ', @{$config{CFLAGS}}) -}
 +
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
index 1a054a36753..8da64aea6a3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
@@ -49,8 +49,8 @@ EXTRA_OECONF:append:class-native = " --with-rand-seed=os,devrandom"
 EXTRA_OECONF:append:class-nativesdk = " --with-rand-seed=os,devrandom"
 
 # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
-CFLAGS:append:class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-CFLAGS:append:class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
+EXTRA_OEMAKE:append:task-compile:class-native = ' OPENSSLDIR="/not/builtin" ENGINESDIR="/not/builtin" MODULESDIR="/not/builtin"'
+EXTRA_OEMAKE:append:task-compile:class-nativesdk = ' OPENSSLDIR="/not/builtin" ENGINESDIR="/not/builtin" MODULESDIR="/not/builtin"'
 
 # This allows disabling deprecated or undesirable crypto algorithms.
 # The default is to trust upstream choices.
-- 
2.47.0


