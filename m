Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F067DC001B1
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.17589.1687961613060969493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OQAFsFxD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b7f68f1c9eso34597295ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961612; x=1690553612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0X63zrnq7mgMX1ZoT+SDrJGVybAg7G9XMTzwceXOFI=;
        b=OQAFsFxD7YEY++eCcm/RL6KYiIcUw8bqF4jtX5S5R7DyRtUGKMgoRlj26oEAlH9NrN
         V0CMXRJ99iT5vkKaw67oLa9d1IxIWMVU/ZTpSd0/Y0QXAslvvojUfSmQVlK1r9OIItq4
         H6XELvjz4y4sXyGU6QSTp3Jh0xU2v/ofzw6LeI9Z/utTjCvHxHTqfmKtk2i2bvsDTs64
         tZuBJdzTsd9Fc9Vo8hbuOnqNMc7gjRJl79s7/10gWCMX5DZggmDMFFOmBzu5nrAJ023t
         kFnom+758Z1mAMPGKZZgbxqe3FJVhez9p5jPUoyCzo50rJcIevgDruI/TJuxaSHhbIKm
         tCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961612; x=1690553612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0X63zrnq7mgMX1ZoT+SDrJGVybAg7G9XMTzwceXOFI=;
        b=AeJAV14kZ3WlLa62So0BeCuj42b5phl5X1op2ppwKXyONw0CFXMzD91KPtWHOBf4Qe
         tPascxCh15bl0ljTtSQ2TRRHMZk8xPmBfmB1nyK6bE6PyoAAIzpVETkAnkauRdF9ijpy
         SCDuOy097Sswh5mMKseRyV8Bb0btaml97skA800SU9+0TDbsyOCV+eWh71Z94mJSqFnO
         DoHyWpz46XV9QsKA/fO3gByGJodXKxlX7cSa9C1iTjjSnQvY7LBcuPCSoJM9hRFoJiIf
         fR/ok826HnQ/tAhwv85/TzMK+UuQRJCNqFWJEtn//SIBRZ3aQ7o1xYUH5dBrL7ME3NjN
         sY8Q==
X-Gm-Message-State: AC+VfDzS28MbZeEmoMTg6bOJy9d2UoUQgsLgHfw2NtfD7HDnkJ6oeZH+
	Kbeg6u5zAmjliaWaS2qm2ROdpM3OY4RUrz9wiyAC9w==
X-Google-Smtp-Source: ACHHUZ5Qe7xHXdcuW9QAnYwGA+pm6mrBjuSGKsVHCX9vTHePeHWL0zt+++yrXNvRsFOPSS2P+O/TnQ==
X-Received: by 2002:a17:902:ce8a:b0:1b8:d4c:725 with SMTP id f10-20020a170902ce8a00b001b80d4c0725mr8561745plg.15.1687961611923;
        Wed, 28 Jun 2023 07:13:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/29] minicom: remove unused patch files
Date: Wed, 28 Jun 2023 04:12:43 -1000
Message-Id: <094d2341240fc09a91fea7bea1b3c51a08ad9817.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183573

From: Martin Jansa <Martin.Jansa@gmail.com>

* they were removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=41f8760dd8a8ac388389bc17dbc5e0ae0f64bf57

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a0f28cd8d01f4faeedc1089e5d1e2dacc5b046f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 4395c783e544de30f650459677055737148ea261)
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


