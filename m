Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B307DC36003
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7178.1742420542451726651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqDUAJdn;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225d66a4839so20273265ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420542; x=1743025342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=VqDUAJdnIt9z6uyONDwsgyVr/UwfSt5qvklsyhSLqWW+qm7Xss8LlA01/qBRQG0iEb
         rLT9iCpGhCRf8m1ava377cWt9kXeHuahAf+MTgjyMyjmT0EZmzPkUgAu7TiZfSLEUMcw
         YPJakGhF9zA+ZGJpWEzkLjEXwUFHDiZBk9AEa2alp6+7j2IrfjFdNainqlD6oRF2klDm
         +cO2biF8C2dOJvznrPeudZ1Bm/ZIVw1ysak8ynd86dm9v0ur4zoVDkliCHCUyzV/eogo
         K7E2jMfqw0ZLUJQT4qKfP8hxwZJXEKTtj2DOAOzZhUxrKY1OkAJWPc87+9SFSa8+Gd/6
         0wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420542; x=1743025342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=JHY8NlyNT1R47hUV76deoVMgRWUcqcc+jI8Qu/o2SXbKQqOIRDfRpGq8BMr4vGkr/y
         zaU+BRfMNReUafd0Ir1wmI8cTMgBvBHgM9lu7RovTEXx6wjRGbRrHuH5NU/YTbHFVm24
         YowJLDO7GQjRWMPN9QgfYgj2kutT+7CCMqnWlRnQaSnss5LR7GvelQ7FPAFEB9V+InY/
         oiHyjTARM1dh6+YSCRxG9ZxPEOPCwbhFuwrNMLGti52wsPaDkeuDad7AbbUDc1VLJnHR
         0TRFtl9ZAlWjuJ79DGPuQmO79qpJ6i5eKEJ9IhgolI0DNL5JBlbdI3sU23QBlRsCLVow
         W5pQ==
X-Gm-Message-State: AOJu0YxE6JGtlUZJuDQmTTFsZxWx1dSv/0C+YbGnD1mNwpHgiuXkcDVO
	UDdOyQbjo5mmJ3bUFTBEyiuvMt2wXgMaYaaqfqXMoIHbrT2GvQr5A7H6OP00
X-Gm-Gg: ASbGnctLf7wZYGAxrfU9rxMinWLji/jDiQq/slSn3wuy83PeYgiE6FCPqEVzlyPve8k
	AAxtq0hwK5XsFn8lxfzV5145iDh4OIUt4fo7AItsji/ojWQkdPg6sVnYd6tVMNFD186yn0sqjW/
	MzdAvsXBQtPcWhZx6tTYHp9/uhV3D7BG5u/sc4+xR2aG6QO81ikViJMeMphZrAQE9yNdBtqpU5Z
	Rvcc+PQFaQDUfXjrO9TJNZYSMHSeC5Z0ZHEOlYj4mO+rIm1ffJbemgBtl1mNDxwiFXa9e4+oRPx
	veHNuse7psj9BNxippT+ESsD4ta4NNsdrZwe
X-Google-Smtp-Source: AGHT+IEeHS1iUAlsvJI9hsayybSu4GrH9RZ+Vob244ZXC+/T2Ld27gh7Iu3ydbCwKmh4LwfhqOb7lQ==
X-Received: by 2002:a05:6a00:4fc7:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-7377a0d7478mr1808210b3a.5.1742420541496;
        Wed, 19 Mar 2025 14:42:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 5/9] time: Fix build with GCC 15
Date: Wed, 19 Mar 2025 14:42:08 -0700
Message-ID: <20250319214213.2505249-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213360

Initialize interrupt_signal and quit_signal with correct type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../time-1.9-Fix-compiling-with-GCC15.patch   | 33 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch

diff --git a/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
new file mode 100644
index 00000000000..76141aec18c
--- /dev/null
+++ b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
@@ -0,0 +1,33 @@
+From 831194f0be7733c99c7a2c69d9e9695b82e05010 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Poho=C5=99elsk=C3=BD?= <opohorel@redhat.com>
+Date: Thu, 30 Jan 2025 08:48:47 +0100
+Subject: [PATCH] time: fix compiling with GCC15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC15 complains about incompatible pointer type in run_command()
+Initialize interrupt_signal and quit_signal with correct type
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-01/msg00000.html]
+Signed-off-by: Ondřej Pohořelský <opohorel@redhat.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7b401bc..c8d7ab0 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -803,7 +803,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  sighandler interrupt_signal, quit_signal;
++  __sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
+-- 
+2.48.1
+
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 8364210e61c..d9e2d06b32d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -15,6 +15,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
+           file://time-1.9-Fix-compiling-with-GCC15.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"

