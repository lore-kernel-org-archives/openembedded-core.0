Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8986C7EE32
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.3588.1684914810011698390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Dq5eTOgg;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-94a342f7c4cso104245066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914808; x=1687506808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXoVOpmQ8WA49nFEcNg/M5FuNmnrNJhBGg8BPksj89w=;
        b=Dq5eTOggWPQCKUA+0ZyH0vA4lscFsr0+mTMZnkeUehZDtMxpKDePB9TI79VMMOuYFU
         0/Liu/NM35BqCzWvj9wBihKk60ZGvvRjLtgfWO0bk4zgr1ms5RIMKJ5n7j9S/cB9qveV
         Yzi3khVlABu1HBl7mPBe7DY0v2n9Ibk4B6QfB5DokzVHGvNiG/lOKFC0RFFcv4Q6MfjW
         WtWPh7r4TLGLulaK8e43VIByQASkRPTmzkk74+Hxq/p7GXwoG5fMPclO2duci5ixqM7F
         pUpdKtbSuQ3nKFoMvDlGP8lIZfRahXcsRCjTOtQ68Fb9Yvzu16tLQH7dWRIs0MNV7obh
         RyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914808; x=1687506808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXoVOpmQ8WA49nFEcNg/M5FuNmnrNJhBGg8BPksj89w=;
        b=TFhUktkzo2BN1jhhKogQAVByNREcOBKiCTkp+qSuof5PE8cRcGe3CSLL2YKypgpDhy
         9QvoXuQzyrd+xi1/6WXDCj8sJJq3sM9PngQjUG2E/bYS3CnaFvNAMAi4SAT+HXvGiavq
         14CsNkGtLaLzr/rGcqwVHjmOYl4P86/fpSPhvHU66DZoYcEIDFp6coXqDzgusUgJWjsd
         UblUtN0ThjMIhMXd1KdcTwo3tCZ8nHtsN4/wnPSCBm/xU7WBSGeqmXOG5KGZtjv+euHU
         GcOYm5Lvg0PDzlX4bGn7cfyg83kAig4aj0LMoAJc1dLt2Svxi/Qdt0CF8OqffVo33aIK
         Syxg==
X-Gm-Message-State: AC+VfDzgvFqfOy+I9LPySOoU0u5KBTJVP4AlF7upv286Je7QrSGcW6VH
	SOn1tR+kkb0EYE3GzijZN8QnvxUjbKI=
X-Google-Smtp-Source: ACHHUZ4VgFgUunhO+fClj825xJKnXWzs1bXgfpKbTgG0qjsM9jyvKNBRQJsTUDUDFwbS4HmPuSqlrw==
X-Received: by 2002:a17:907:1608:b0:973:8198:bbfb with SMTP id hb8-20020a170907160800b009738198bbfbmr1518699ejc.31.1684914808158;
        Wed, 24 May 2023 00:53:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w12-20020a170906130c00b00965b0eb7b0csm5396422ejb.103.2023.05.24.00.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] minicom: remove unused patch files
Date: Wed, 24 May 2023 09:53:17 +0200
Message-Id: <20230524075320.1086358-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
References: <20230524075320.1086358-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181664

* they were removed from SRC_URI in:
  https://git.openembedded.org/openembedded-core/commit/?id=41f8760dd8a8ac388389bc17dbc5e0ae0f64bf57

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.40.1


