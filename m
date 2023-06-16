Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF2BEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.264.1686926261287643432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xtIy75k+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b512309c86so6561535ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926260; x=1689518260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAFMAZJMj/0+rB1ZR0IIJbN6CoRGc8tqxYIWIPczjW4=;
        b=xtIy75k+01OwSKFMZLQRoIec0M0D0Fbx+b6hDAZ5sl+R2vcZTw9vt4vbaN744gch0l
         y7uESgsqEokHr1/prioayhbHb3nHeGu/c5m4U9/qzpCkw8WFozxDTLQir48pz+dHQgQY
         jxveo6/XKqgRYroS3sRkRAUogBJfR7WD2isDBDVQnXEEvsg+UFYSp/EDT+a6In6wdx6l
         B77tP19uxdbf4MQoekRCVYC5YnEFqjlJ1CUHG8/at9+NDczEAg2S3vxF+8+a3B7gwwIh
         JGUhhVcHh9mFGMygWABrBFqPubJTXqfx5c0peRGIAM+x727md0E1pURI+uZlKeHEubKm
         wEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926260; x=1689518260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAFMAZJMj/0+rB1ZR0IIJbN6CoRGc8tqxYIWIPczjW4=;
        b=XogCPVxPOqOITo2CIgvTj/OmHfU5jgCZSSdzTdFvhif2WzfgfLSxNYYeuY0BypuEjI
         qUBTik0tH5MX41ndIybBdmPxCEHP83lwgjcyjnrG9Gh2lAO7PZPyDcNKzYCFmIHuJq2m
         YA6PaW6T88fLIc1PeyIvm+/bcV8NeI5phkczWHkj7yLhMnzZn5lBfIF66gcXMWVLDmWn
         sy05Ye7RCvWSZOWnfL/z8VyJ5SVTpPG86EItiOCG3JUJsd1kydcmuT+n72tFnax7uoDS
         4tWwWpmXG6V0FnVcSEJHRpSrqAWx16P9XeJ/B97en2DvN2t5cXdt48v1hPqxEBxefvYo
         kBdw==
X-Gm-Message-State: AC+VfDwj/xTeOifoaR59SrC3+zG96HgG2vTqKuIWTaE0Ll6PEYwgFLki
	SaXBd5+nh6Qs6qlNnR22kdjuaSCtSyH7uL8CCXo=
X-Google-Smtp-Source: ACHHUZ7w8F8dkb/C8IFVaJyi6xHxv2Wvh6YP/YRVyV3/JUBSojD/9jBiJLevVuaj4fxPdDpZHGQPPw==
X-Received: by 2002:a17:902:ce88:b0:1af:b5af:367b with SMTP id f8-20020a170902ce8800b001afb5af367bmr10380124plg.29.1686926260193;
        Fri, 16 Jun 2023 07:37:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/24] minicom: remove unused patch files
Date: Fri, 16 Jun 2023 04:37:02 -1000
Message-Id: <4395c783e544de30f650459677055737148ea261.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183032

From: Martin Jansa <Martin.Jansa@gmail.com>

* they were removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=41f8760dd8a8ac388389bc17dbc5e0ae0f64bf57

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a0f28cd8d01f4faeedc1089e5d1e2dacc5b046f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...erfluous-global-variable-definitions.patch | 35 ----------------
 ...erfluous-global-variable-definitions.patch | 37 ----------------
 ...erfluous-global-variable-definitions.patch | 42 -------------------
 3 files changed, 114 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch

diff --git a/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
deleted file mode 100644
index 01b23898e7..0000000000
--- a/meta/recipes-extended/minicom/minicom/0001-Drop-superfluous-global-variable-definitions.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b65152ebc03832972115e6d98e50cb6190d01793 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
-Date: Mon, 3 Feb 2020 13:18:13 +0100
-Subject: [PATCH 1/3] Drop superfluous global variable definitions
-
-The file minicom.c, by including the minicom.h header, already defines
-the global variables 'dial_user' and 'dial_pass'. The object file
-minicom.o is always linked to dial.o. Thus the definitions in dial.c
-can be dropped.
-
-This fixes linking with gcc 10 which uses -fno-common by default,
-disallowing multiple global variable definitions.
-
-Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/db269bba2a68fde03f5df45ac8372a8f1248ca96]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dial.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/dial.c b/src/dial.c
-index eada5ee..d9d481f 100644
---- a/src/dial.c
-+++ b/src/dial.c
-@@ -146,8 +146,6 @@ static int newtype;
- /* Access to ".dialdir" denied? */
- static int dendd = 0;
- static char *tagged;
--char *dial_user;
--char *dial_pass;
- 
- /* Change the baud rate.  Treat all characters in the given array as if
-  * they were key presses within the comm parameters dialog (C-A P) and
--- 
-2.24.1
-
diff --git a/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
deleted file mode 100644
index e86b470b7e..0000000000
--- a/meta/recipes-extended/minicom/minicom/0002-Drop-superfluous-global-variable-definitions.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 924bd2da3a00e030e29d82b74ef82900bd50b475 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
-Date: Mon, 3 Feb 2020 13:18:33 +0100
-Subject: [PATCH 2/3] Drop superfluous global variable definitions
-
-The only place where the EXTERN macro mechanism is used to define the
-global variables 'vt_outmap' and 'vt_inmap' is minicom.c (by defining
-an empty EXTERN macro and including the minicom.h header). The file
-vt100.c already defines these variables. The vt100.o object file is
-always linked to minicom.o. Thus it is safe not to define the
-variables in minicom.c and only declare them in the minicom.h header.
-
-This fixes linking with gcc 10 which uses -fno-common by default,
-disallowing multiple global variable definitions.
-
-Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/c69cad5b5dda85d361a3a0c1fddc65e933f26d11]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/minicom.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/minicom.h b/src/minicom.h
-index 061c013..0f9693b 100644
---- a/src/minicom.h
-+++ b/src/minicom.h
-@@ -141,7 +141,7 @@ EXTERN int sbcolor;     /* Status Bar Background Color */
- EXTERN int st_attr;	/* Status Bar attributes. */
- 
- /* jl 04.09.97 conversion tables */
--EXTERN unsigned char vt_outmap[256], vt_inmap[256];
-+extern unsigned char vt_outmap[256], vt_inmap[256];
- 
- /* MARK updated 02/17/95 - history buffer */
- EXTERN int num_hist_lines;  /* History buffer size */
--- 
-2.24.1
-
diff --git a/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch b/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
deleted file mode 100644
index 3225a0c32a..0000000000
--- a/meta/recipes-extended/minicom/minicom/0003-Drop-superfluous-global-variable-definitions.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a4fc603b3641d2efe31479116eb7ba66932901c7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Lyson=C4=9Bk?= <olysonek@redhat.com>
-Date: Mon, 3 Feb 2020 13:21:41 +0100
-Subject: [PATCH 3/3] Drop superfluous global variable definitions
-
-The only place where the EXTERN macro mechanism is used to define the
-global variables 'portfd_is_socket', 'portfd_is_connected' and
-'portfd_sock_addr' is minicom.c (by defining an empty EXTERN macro and
-including the minicom.h header). The source file sysdep1_s.c already
-defines these variables. The sysdep1_s.o object file is always linked
-to minicom.o. Thus it is safe to drop the definitions from minicom.c
-and only declare the variables in the minicom.h header.
-
-This fixes linking with gcc 10 which uses -fno-common by default,
-disallowing multiple global variable definitions.
-
-Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/c8382374c5d340aa4115d527aed76e876ee5456b]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/minicom.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/minicom.h b/src/minicom.h
-index 0f9693b..1e7cb8c 100644
---- a/src/minicom.h
-+++ b/src/minicom.h
-@@ -113,9 +113,9 @@ EXTERN char *dial_user;     /* Our username there */
- EXTERN char *dial_pass;     /* Our password */
- 
- #ifdef USE_SOCKET
--EXTERN int portfd_is_socket;	/* File descriptor is a unix socket */
--EXTERN int portfd_is_connected;	/* 1 if the socket is connected */
--EXTERN struct sockaddr_un portfd_sock_addr;	/* the unix socket address */
-+extern int portfd_is_socket;	/* File descriptor is a unix socket */
-+extern int portfd_is_connected;	/* 1 if the socket is connected */
-+extern struct sockaddr_un portfd_sock_addr;	/* the unix socket address */
- #define portfd_connected ((portfd_is_socket && !portfd_is_connected) \
-                            ? -1 : portfd)
- #else
--- 
-2.24.1
-
-- 
2.34.1


