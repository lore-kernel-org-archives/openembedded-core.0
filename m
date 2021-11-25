Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95D3C433FE
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 15:22:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13350.1637853757381706284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X3zpJa7f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso4895750wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZmD260IcjQUklPx2lFkYiS8F+mFUR8JDDqJ/Xs9cwPw=;
        b=X3zpJa7fe+IJgYy5jkVvUKkW9A5B6/zHYZdxbhQHKDChn8JXfXgWxmXN5Zs0KaISJ8
         BBQszRMsqNwUQuCCzx/HBrXFf8C4cWKL0Z6FW8a746cWL2grYa70PxDYQo0A6zD6S3GZ
         RNsk4BfPLvXc6vc5yAxwYlc+IVvXQVz/dmUgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZmD260IcjQUklPx2lFkYiS8F+mFUR8JDDqJ/Xs9cwPw=;
        b=onPkLwZaqVfvAIvsjv0/xXY39ed3I1rmeLH38N+hmd7RzEOJEagcgXpTBswVdDkOK6
         JWqbBHtIvjR5x7zfy8t88dOxPBY92zZ7bviq7Crg2FIc9quaZ4w6su23jV6hScfJxksA
         jwGGnacc3iBG+058OJgfqERH+qVCTifJapibsHuCjeQBdBrQcLA09UhKpfooParnn5pI
         PWAsFHDn6iZYINuwSRUcZRmkLV2aZLZvRfYA/lwrn3J0755mN/VC450+FLbgQ1SIOrkM
         y7lOFY/gPbWbWcBleNzsajkN0q+lnPvUtfS9L/WK9afuR39FmC6TgwGNZEAGeBlAgQ11
         R12g==
X-Gm-Message-State: AOAM533lrHSzdfQapZvHiKr8T9hgSD8VxY/foVnZ9xC/cVjvp43W9Coc
	wCZyBR9w46+zfvmjGyGYiBQUz0qE5upcIw==
X-Google-Smtp-Source: 
 ABdhPJw6U9VKZGyp0APUO9/wK2DL3xhPzB+V1zdETOQ+GqHdtKIBz34lrhbdsIIp10wHbU++vByMIQ==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr8071730wml.63.1637853755815;
        Thu, 25 Nov 2021 07:22:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6a3f:a87f:f605:c96b])
        by smtp.gmail.com with ESMTPSA id
 g13sm3222243wmk.37.2021.11.25.07.22.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:22:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gcc: Drop no longer needed patch
Date: Thu, 25 Nov 2021 15:22:33 +0000
Message-Id: <20211125152234.129463-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
References: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 15:22:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158781

This patch was mentioned upstream a long time ago:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47256

Changes from gcc 10 onward mean it is no longer needed as mentioned in the
above bug report. Drop the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
 .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    | 35 -------------------
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index baced2a4007..b4e4300c66b 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -34,7 +34,6 @@ SRC_URI = "\
            file://0002-gcc-poison-system-directories.patch \
            file://0004-64-bit-multilib-hack.patch \
            file://0005-optional-libstdc.patch \
-           file://0006-COLLECT_GCC_OPTIONS.patch \
            file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
            file://0009-cpp-honor-sysroot.patch \
            file://0010-MIPS64-Default-to-N64-ABI.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
deleted file mode 100644
index 265ca0e2187..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 127716a32a11ca2a6b3aac068054bfc69c4dcfd8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:16:28 +0400
-Subject: [PATCH] COLLECT_GCC_OPTIONS
-
-This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
-invoke collect2.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/gcc.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index be7630ffd8c..1bc45285384 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -5383,6 +5383,15 @@ set_collect_gcc_options (void)
- 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
- 
-   first_time = TRUE;
-+#ifdef HAVE_LD_SYSROOT
-+  if (target_system_root_changed && target_system_root)
-+    {
-+      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
-+      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
-+      obstack_grow (&collect_obstack, "'", 1);
-+      first_time = FALSE;
-+    }
-+#endif
-   for (i = 0; (int) i < n_switches; i++)
-     {
-       const char *const *args;
-- 
2.32.0


