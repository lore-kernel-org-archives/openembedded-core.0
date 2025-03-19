Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7F3C36005
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2936.1742372204967798065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1QhgWwT;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso124858855ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372204; x=1742977004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=b1QhgWwT2tOycZR71sxP9lDat1Uxk2KJnW2ISZqpQAi/GHRbH6Q847cdXukD1cIcmn
         EDp6uaQpZaxrZoWJd81pKedi1e8DtbH2LAm5VLIfxMy1siMbYpvUXpPduKVyDyVxPnrp
         s6jtR42s6UUdiVVNOOAu+DbLJPh25pr+xLV3a/jpxh73+todht0PQEy2b74iyrVl1K6M
         e5+w8za4Rqgqs0CT4uANqhyCo5NBAkLtZIU6XnuVGLrkUNILKvQ2FbBJr5idlrd+M/NY
         kD6Wk+sZZ4/LXNsIAN/WUeb/l9F3g5OSSfyo03nzrzTIQ3DlXqTywH1wdFBEMUcWBOu/
         HBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372204; x=1742977004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv+bQen5DRBu5hIKf2m9RCRKa9x4Vp2jKB+VM+8bOYY=;
        b=LTPpNwkwjTBWUXkUhINx5dFxppwDNmgiVDOFQa6j99pEh9McZIU+ctbQejzQBthpZe
         TVvf0ysMeXvCTdQE/cTeFNdcn/8DvAPqXwZ1sOCuoaA557XuGg1S4ZJxf2zqm5bOQIJZ
         +rsvoVC1Oc4p1SHgWFIxIGvc6/lASXZwbhOQi78uRV0/akJ6HWlsY7SEP8LQNmBF5X/O
         dQ01RE6AAibNouLpoChIwoKemr2CorX0kKjGFpFNY4WOU0IBx94U68JXfWwkjcjbDzuQ
         3lF8z+nRdnSWqwyfIE/pP1ClSY47vP700gdwXsYdnzKQCcei6haFLwfwfzzlSBtYfKtD
         XOew==
X-Gm-Message-State: AOJu0Yyp/CEwM8PDBRx0tMo4cH8vMCdvASNwnIU8/3lSENncdf4NPtHj
	bLyhtgWfa7lGJK/YVB12WTHRUZbztvzsSeFg69YiOe3qeFUiCfI86OtFXgd4
X-Gm-Gg: ASbGncvKzQxKwY8dEfC34hbgh5rfq1RtgzZkn6KRXuTyvi51GjYHq6lneyHOiYMWiE+
	I62/IdK61OhkLUfYrdW212gIJsojX0m4wXaEigm6rLe+0oOuh+IJGeeseUlAQCrH7ltLNG2jgtU
	TM+1KdON7tH2l7zDmcJ7aTEACPjiVFw+sgZ1VvtqSD84prpxFU/3/fxkSqUlQHOVi4GptntKxGr
	KfYUH9STpR/nFbM6Eukenyns4PxrWpi/ZRRMq0cIVDw/mXWECjaW2YaKjcOyuOsQEbID4SsNSgH
	DhRyNMdtCXw3DsweJe7ASuv2T5eQQjJ3wdpm
X-Google-Smtp-Source: AGHT+IGXy19lbMSUobYMWQcYs2MSOyyvyg46IyI0wafRrzWbm+dAZQZPTMDRmhMPNy+i+39ImGRW8w==
X-Received: by 2002:a05:6a00:3392:b0:736:d6da:8f9e with SMTP id d2e1a72fcca58-7376d4edab9mr3228701b3a.0.1742372204175;
        Wed, 19 Mar 2025 01:16:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 24/25] time: Fix build with musl
Date: Wed, 19 Mar 2025 01:16:05 -0700
Message-ID: <20250319081610.3536475-37-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213302

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-the-type-for-sighandler_t.patch  | 27 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch

diff --git a/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
new file mode 100644
index 00000000000..0f8bf6e03e0
--- /dev/null
+++ b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
@@ -0,0 +1,27 @@
+From cfef684e2c2c93c4a871d6c2a7af8f4c1b7c6741 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Mar 2025 09:29:58 -0700
+Subject: [PATCH] Fix the type for sighandler_t
+
+__sighandler_t is private interface in glibc so its
+better to not use it, as an aside fixes build with musl
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-03/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7ff29a4..82eb66a 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -728,7 +728,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  __sighandler_t interrupt_signal, quit_signal;
++  sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index d9e2d06b32d..366a64d8e5d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -16,6 +16,7 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
            file://time-1.9-Fix-compiling-with-GCC15.patch \
+           file://0001-Fix-the-type-for-sighandler_t.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"

