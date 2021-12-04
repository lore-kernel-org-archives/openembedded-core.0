Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16943C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.22671.1638602020079189105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f49bu2Y0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id t9so10514507wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9mhgemCzm6+ekPNUGpAxumnERRqNWHFDtt+/8pHK5w0=;
        b=f49bu2Y0LG317eSoFTYWhpD9nLFuO4gHKzSfcGadFVlZO9U3YXUHP5Qm3PivUBVAiD
         WhezYtbq+5OzCU6BF1D/Qli6mrChhX9Blsj+LJOsfUBnCMm2DJCZoMIJQ71sfU3AO/Si
         TjQUMHglWyLa/Jyk8pYVCtc1yyWGU6bfnneABGysaC1qKETF3h4OF5Rq2yV47vD93sTk
         Ir9gy7kK2FGToyz+lx4Bsl4s93ZT5Gif+SrVWULpeA1DVSaWCg6mj0zmdyA8PoOSB6Q5
         fh9NtNWSJaWgsGjdVbhpRxqIhaaSA/irFxqgyd13HsWF7BV7XrYABMe/YJEqevOhbAsC
         mNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9mhgemCzm6+ekPNUGpAxumnERRqNWHFDtt+/8pHK5w0=;
        b=WxXaztdnE7iDCbHIeNDYxv76cdpFAhNUptGDC/6rCFMuZzcUURGFFg9152oPB072iz
         19z/iiGuxAoZt4Yk2WvCxYJafBppcbhlOuF8HfpOKDQz5SYmYevZbp5IlYbBBjzXNWw8
         cmwwcT09v4E2BN3JTJ7z4A3FSR6zMeIiZfnfYhkfxlqgYaRDPFNqFewCHyqBF+e5HdNn
         HTv7+XLsq3Ic5+D9a0/t2tXGtWc30cVmJdVERgnLavfFHBwPhiKc/BR0dPycaMzAFCRF
         n4uIuMJ0cmMqjoZnWypZ9nRzENwak3OfH9rM264GRFbqGG6w/Lc8wOK7GTV3t8u7AM/E
         IN1w==
X-Gm-Message-State: AOAM530muXsEaxsGurlLIamyb4fakfh5olgFNwx8B064uJOeFqe/lAkl
	K44XE6iINroOBlIaKh8xtG5BfKm10HBOpA==
X-Google-Smtp-Source: 
 ABdhPJyh04qGHr9LjX5ELoDW5XxB9fce2P9v/5dWVwiGk/mfcoYtTjtRxZmeHxuMUErn8mIMOvOpCw==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr27038567wrv.146.1638602018726;
        Fri, 03 Dec 2021 23:13:38 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/26] kexec-tools: drop unneeded patch
Date: Sat,  4 Dec 2021 08:13:14 +0100
Message-Id: <20211204071323.2480163-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159164

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...xec-un-break-the-build-on-32-bit-x86.patch | 43 -------------------
 .../kexec/kexec-tools_2.0.23.bb               |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch b/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
deleted file mode 100644
index 36b0845f4a..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From bb6a26371d15473b380459ac4404bf330634b585 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 17:21:08 +0100
-Subject: [PATCH] kexec: un-break the build on 32 bit x86
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- kexec/arch/i386/Makefile    | 1 +
- kexec/arch/i386/kexec-x86.h | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/kexec/arch/i386/Makefile b/kexec/arch/i386/Makefile
-index f486103..5d560be 100644
---- a/kexec/arch/i386/Makefile
-+++ b/kexec/arch/i386/Makefile
-@@ -12,6 +12,7 @@ i386_KEXEC_SRCS += kexec/arch/i386/kexec-beoboot-x86.c
- i386_KEXEC_SRCS += kexec/arch/i386/kexec-nbi.c
- i386_KEXEC_SRCS += kexec/arch/i386/x86-linux-setup.c
- i386_KEXEC_SRCS += kexec/arch/i386/crashdump-x86.c
-+i386_KEXEC_SRCS += kexec/arch/i386/kexec-mb2-x86.c
- 
- dist += kexec/arch/i386/Makefile $(i386_KEXEC_SRCS)			\
- 	kexec/arch/i386/crashdump-x86.h					\
-diff --git a/kexec/arch/i386/kexec-x86.h b/kexec/arch/i386/kexec-x86.h
-index 0f941df..c423171 100644
---- a/kexec/arch/i386/kexec-x86.h
-+++ b/kexec/arch/i386/kexec-x86.h
-@@ -56,9 +56,13 @@ struct arch_options_t {
- };
- 
- int multiboot_x86_probe(const char *buf, off_t len);
-+int multiboot2_x86_probe(const char *buf, off_t len);
- int multiboot_x86_load(int argc, char **argv, const char *buf, off_t len,
- 	struct kexec_info *info);
-+int multiboot2_x86_load(int argc, char **argv, const char *buf, off_t len,
-+	struct kexec_info *info);
- void multiboot_x86_usage(void);
-+void multiboot2_x86_usage(void);
- 
- int multiboot2_x86_load(int argc, char **argv, const char *buf, off_t len,
- 			struct kexec_info *info);
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
index 22a9498a7b..066de99fad 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
@@ -17,7 +17,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0002-purgatory-Pass-r-directly-to-linker.patch \
            file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://0005-Disable-PIE-during-link.patch \
-           file://0007-kexec-un-break-the-build-on-32-bit-x86.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-- 
2.20.1


