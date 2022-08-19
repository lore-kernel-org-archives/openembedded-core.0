Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B82C48BE4
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.468.1660894104506275551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SOpp1Pud;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso2058219wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5TGr5QjZblcNGnyp30Mq7ql3xiduN2oVWxEtywcYpjY=;
        b=SOpp1Pud24d00VjrgG+vqFc1RCFVjYY4d22hi/oIyHHbRjHDO3WAPegwhcLxZs7i/X
         E9tlHJVZCyWMItea/wdClflp95ZbTHrEkT6XQS0RZCLvFfCCHTpzzZlkB2gE1fvOpH4w
         P1z7eBuo4fWskp7WGj7oA5VBxcCI6lwfyZr0B3skA8eIUg8YFcnAX/2jrNDnv2DvM5G6
         svnMVOqkZSK3aG6Xk/N+3b+k+GBMCc3DrVk0zblYPoQRcttHUfPjHRGjlilxn/0zH/8V
         oQm/5CDbcVzE24M5HMZmNb8Tl8yUgDTGH9aaOylv7lpIvPAJYs5q7I+5sKH1Qp4fsYSU
         nBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5TGr5QjZblcNGnyp30Mq7ql3xiduN2oVWxEtywcYpjY=;
        b=iw5TlPchYAdmihretLrKs7Nglpeyp3lZLRYS/RgkTR43RyLtkdouwYLflCt5tZdMvc
         dnM4tUZRv789CLzi+Yul5EhLx1XfcWWdQJ+JOxYvPlF6uMdg5JXnxMCPqCXTbqXLE3sI
         WcbcogkIB8fvnDs0SsWLlrbOUG02NHFi3x8EbITPzphMO0LrUwjkmNpV+Qe51xMJiZ6y
         jPPzYFai3CHdxLttrYBImkw3fSrzR6QSPIwhGm6FwthdG1AT7HuBx9p5JffSR/RUyVMp
         0hfEkh67QYhF26uFZ0L0XtFrnrf09A05U4IFANYfHrwUD43khmNqP7LA5z7mxEessf0W
         ZLVw==
X-Gm-Message-State: ACgBeo3lcrdAvrQRe6bVQFLS3l2USQ3dWhrzdmvcYHnvPYdqix68d5Oq
	eUB31I4Yq//5uPA1pfloH+5OCvjsd6w=
X-Google-Smtp-Source: 
 AA6agR4of+aWPcIK7aRU64xJ0KqMKrgmcbKe2mNtU3ostM3CmkoZQ93gj7GJlMXS7ncTy1jN5zGspA==
X-Received: by 2002:a1c:19c2:0:b0:3a5:168e:a918 with SMTP id
 185-20020a1c19c2000000b003a5168ea918mr7133998wmz.31.1660894103026;
        Fri, 19 Aug 2022 00:28:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/42] python3-hatchling: update 1.6.0 -> 1.8.0
Date: Fri, 19 Aug 2022 09:27:25 +0200
Message-Id: <20220819072727.2236928-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169611

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-hatchling_1.6.0.bb => python3-hatchling_1.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.6.0.bb => python3-hatchling_1.8.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.6.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.8.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.6.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.8.0.bb
index e06bdf02ec..17a10eeb2d 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.8.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "bd6e8505de511ac4217ff50927f6d1845494608e401e63a62b830c31fb613544"
+SRC_URI[sha256sum] = "a4f982fdca0717d8c46bfe7b501302f90aaf2a5302845d550b49c8739681feb2"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.30.2


