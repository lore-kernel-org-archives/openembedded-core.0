Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9112BC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3457.1637741317481067726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mcjxZ2Ii;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso4557721wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=de60cied5wgWYQyD85iFrzoHpr7UxHi7QsVyDoTqQXU=;
        b=mcjxZ2Iii8cltRrgj29CmkMSmvip/TczTqSUQuvug3bHcVsrgTmEvMl3LrP+RbpGrj
         ov8c3oNf4JjmdXxygo5aGscXRIY0DCARU/IXgrJJCYjR3sbixevUzKiYScioWhr3nGoz
         6SmS1j+Ea6twPvUlSUAjK4m/Qlh8wDV3vXPyIldKEMLGpChW7NbfvqL+nM7liZ1ejFvn
         wpRFlYCnX8dn8Y9j4GFZMH3hCGBGVCmpPEMjZgDnFCSLpMk35qaPng6R6wuQlinSi1+m
         HxeE8H7lVckE28Wp1/wwzTCdW7OrnuVGVMA6fRfOlMPd27wEDryknUdJF++fhgF+HRsV
         aGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=de60cied5wgWYQyD85iFrzoHpr7UxHi7QsVyDoTqQXU=;
        b=OYuYEf8CqGw6ZUqcQ3lyrGP9vImZVnrq2WaOaFRt58/wEQOk20YiTC8R1d8KThBDp6
         nxTWdeG4AR4FK5b67vY48RT1zFHXK0SrL6I+5pvqbCIm05y3XXH68mvQlVDG5YRdSCgu
         9a2/aDaw8XEj/Svxxi3BOrQ/2W5YfQiXg/w5SW8iwuqDhipTEcCRRnaf7eif/gGfIXPx
         34fUE2KWjTduxa1n22JdycdgJKhJfNCGerZ5uykqUTE0OIleJ7Ln1GukSUsJIFsidikX
         GX9RXpZcIZCtaIPuWpBPDmN01S5UecWlT1N4BrrXiRjZk6GgYsn4eaDMFx9bLh3FQC0i
         7PaQ==
X-Gm-Message-State: AOAM533mY+6Qpd6on6YbFffzSnEopQmb848obof4bkjTQ4G5gBYlrFf3
	Cj8A7Mn3sGWrMkRJNotu//rd4Jj3hVWx1A==
X-Google-Smtp-Source: 
 ABdhPJy5fmQELTS/nZWVeUukDKz39Oyoz8Y1Q/mK3hEdKtcExoaeOniCmAzAoR94ta8RL+xzojHjBQ==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id
 e10mr11816236wmq.176.1637741315970;
        Wed, 24 Nov 2021 00:08:35 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/21] ell: remove unneeded patch
Date: Wed, 24 Nov 2021 09:08:13 +0100
Message-Id: <20211124080828.530981-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158662

Upstream added internal implementation shortly after the patch was added.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ell/0001-pem.c-do-not-use-rawmemchr.patch | 27 -------------------
 meta/recipes-core/ell/ell_0.45.bb             |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch

diff --git a/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
deleted file mode 100644
index f0ce6f1364..0000000000
--- a/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 277e1eca67fcc23cb31be7b826d83a19d9b89bd2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 22 Dec 2020 10:30:54 +0000
-Subject: [PATCH] pem.c: do not use rawmemchr()
-
-This is a glibc-only function, and causes build failures with
-alternative libc implementations such as musl.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ell/pem.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ell/pem.c b/ell/pem.c
-index 790f2c2..237ae02 100644
---- a/ell/pem.c
-+++ b/ell/pem.c
-@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf, size_t buf_len,
- 
- 		/* Check that each header line has a key and a colon */
- 		while (start < end) {
--			const char *lf = rawmemchr(start, '\n');
-+			const char *lf = memchr(start, '\n', end - start);
- 			const char *colon = memchr(start, ':', lf - start);
- 
- 			if (!colon)
diff --git a/meta/recipes-core/ell/ell_0.45.bb b/meta/recipes-core/ell/ell_0.45.bb
index 8453720f42..64434c278c 100644
--- a/meta/recipes-core/ell/ell_0.45.bb
+++ b/meta/recipes-core/ell/ell_0.45.bb
@@ -15,7 +15,6 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
 SRC_URI[sha256sum] = "fedfcceee56eb63ab1eb98bf120a3cfbecee50bcd893874328c889f1b381e7d7"
 
-- 
2.20.1


