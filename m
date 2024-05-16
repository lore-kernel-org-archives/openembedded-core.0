Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7464C25B7F
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.11212.1715858817834492741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JX116qtI;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5727dc6d3edso3318580a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858816; x=1716463616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7Z56GisingUNnv47jmYPvP6/BmtkFcT8pxErIKyAAw=;
        b=JX116qtIkPvfIlGdWafe6Ejpip7Y23wGoBCrVFA8pyrJOaa95j8NJjOB2V6xE6foN0
         HlK9jy04sceJXwujUNFoEaQYx+zq2fGLFfvvcBiQ0OfIPsg4MvxDzbvNMLWwyAugVfGS
         X3iFAnYQx6Ls9BvZVOuCdQumXRmZUCn2F2fxXWhJseK2oLDGrTD5qjWxVg9TZI+pFLjB
         Jipoozk04qCpikBBkZuywW19ytNRoj6qJloc/PjfgILG03Y+3X1Evdb7ON6NrCjGPr0d
         4giadTGPJvTU4sEnPqejLpyo9cjG9ElrIPYLZsb093FqHWuIuUwomRQvbs0IddRDtnjp
         nwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858816; x=1716463616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7Z56GisingUNnv47jmYPvP6/BmtkFcT8pxErIKyAAw=;
        b=EjzwtlsLCaNbUFpIgEv26LtKV9yQ5jY1QBdV7WBXpfDKn9+u3lO9ueWSFBY40yk1Ed
         1RGDoxca9pTDoBVUoiHLIpGxBkh/go2K3nQBTQTAOth44jCBso7j5may57rYLOC1bT3c
         olC8zhPNmZGpPyae+KDoSkcp1KKhSa4WXuUIJrU0rTZopT6eC30kfrJJ/LtTvkmMABrN
         tKCsnLPEBnq6PJZMLXGSbTiqiLtg6NJjhpng+AarRtCEtWRKR9mxEBdr5UnKa1dkl9Wn
         iTVcfVEIcALHhinVxNPmtMTw2UGVZn2KPUbRFp5BVslXWIRh8oGIy7Y2Rd1FZyuS/Eeg
         tX9w==
X-Gm-Message-State: AOJu0YzBMSTcShXzNGx2L0wBlE/UBd4tSmuRjZGFaklbbMvqweXH+Gep
	7U0TOJgFR/N5HjFA7gpZIWbOId60xjC5fvfx1RKoDdh4A8WPt7LeE5c1pw==
X-Google-Smtp-Source: AGHT+IGCkbiUhVsQKtYiaSKxXoz0wqJoecbpcIN33TgW1wbnafJFT4QEvWAEKd/cPIz2kiJnog0lLQ==
X-Received: by 2002:a17:906:3589:b0:a59:a83b:d43d with SMTP id a640c23a62f3a-a5a2d53b13dmr1274785566b.16.1715858816257;
        Thu, 16 May 2024 04:26:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/13] gdb: remove unneeded 0006-resolve-restrict-keyword-conflict.patch
Date: Thu, 16 May 2024 13:26:34 +0200
Message-Id: <20240516112640.2145789-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199474

From: Alexander Kanavin <alex@linutronix.de>

Somewhere on the way the issue solved itself.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 -
 ...06-resolve-restrict-keyword-conflict.patch | 45 -------------------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 81ac441462a..c2fbcb2ac6b 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -10,7 +10,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0003-Dont-disable-libreadline.a-when-using-disable-static.patch \
            file://0004-use-asm-sgidefs.h.patch \
            file://0005-Change-order-of-CFLAGS.patch \
-           file://0006-resolve-restrict-keyword-conflict.patch \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
diff --git a/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
deleted file mode 100644
index 45388c5ac5a..00000000000
--- a/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 477f1b2049c7f940b8e8fda4ac396cfe322b269f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH] resolve restrict keyword conflict
-
-GCC detects that we call 'restrict' as param name in function
-signatures and complains since both params are called 'restrict'
-therefore we use __restrict to denote the C99 keywork
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gnulib/import/sys_time.in.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gnulib/import/sys_time.in.h b/gnulib/import/sys_time.in.h
-index 87db1a88745..e6b98c7e467 100644
---- a/gnulib/import/sys_time.in.h
-+++ b/gnulib/import/sys_time.in.h
-@@ -93,20 +93,20 @@ struct timeval
- #   define gettimeofday rpl_gettimeofday
- #  endif
- _GL_FUNCDECL_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- _GL_CXXALIAS_RPL (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict));
-+                  (struct timeval *__restrict, void *__restrict));
- # else
- #  if !@HAVE_GETTIMEOFDAY@
- _GL_FUNCDECL_SYS (gettimeofday, int,
--                  (struct timeval *restrict, void *restrict)
-+                  (struct timeval *__restrict, void *__restrict)
-                   _GL_ARG_NONNULL ((1)));
- #  endif
- /* Need to cast, because on glibc systems, by default, the second argument is
-                                                   struct timezone *.  */
- _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
--                       (struct timeval *restrict, void *restrict));
-+                       (struct timeval *__restrict, void *__restrict));
- # endif
- _GL_CXXALIASWARN (gettimeofday);
- # if defined __cplusplus && defined GNULIB_NAMESPACE
-- 
2.39.2


