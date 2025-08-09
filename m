Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B093C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 19:14:13 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.12614.1754766849439032881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 12:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=McrEa2Td;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so4982076a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754766848; x=1755371648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezqXjaGoVPsjINRWVcykQIFSrCVft9L2hdXTMnvdqxg=;
        b=McrEa2TdVlI1KaswQk8ob+VkDakVOaxuxIJDKGWl/SCTh620CuaoWT1URuB1YnX4WU
         /q94zosWSSiw3sOnPXzcKKFyDU1zM3ksBDZTPDF2FrpBN320z8tu9LrwDkj07LkXinlh
         cTJ11rFnrnxmVJk/REA4vqRiChh7JkkgIVY9mW4wPmX+rV2u5NmFgFcCyr5vVJ5gAuqT
         f+gO5Os4zrHacUxaYhorbLNR9IzK/TeKs3RruDTCbS4DcdXydvn2UG21BS0aHAGC+x8o
         95hd5ryu3MUC/vYXkey6nt9SElZOTEa7Wn9ERwzL3xC//NJQ4tImZpI2EoIFl+pekJNq
         YoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754766848; x=1755371648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezqXjaGoVPsjINRWVcykQIFSrCVft9L2hdXTMnvdqxg=;
        b=PkRnXCFGsAkL1tA1o/jFEDNKdj03d84bgCJGQWLuAgMNmChlcuilrjaJZUpgRNMdsg
         KpFcUSBQGosAufZdaKomql699vLwW+KuQ0zZT3T92X0EC+yyvX3TRLvU+EiWqfvMYOJY
         7VV2epxrnpeCsrex0/HbEAB62KvO5gRU3LGG7SOikjqsEaofiqsqPTttqIHwHzkWUQaZ
         l4bjBsxCjWgFNZReXzET5304WAbOv287f8ASjMdqao+ker9zYlhGAuoOa048343GPjD/
         v5SVq8UtcHWfsNNTfP+gri/X/aZ07ig3eDxDL+rgqH/31xCCDtvNaN8PIaq31cPwtZS5
         SGTw==
X-Gm-Message-State: AOJu0YwB3+izoS/vLfRavVV/9aVSxSGTFZB6xM7nToup62rHSXbz6L+o
	c1pTzUbFd3riR5dPTdR3UkVKIuZyojyQ31uTcSBhdB9lfHAir+rhzkccjnDFhA==
X-Gm-Gg: ASbGncu4YDhrf2dm5mhKwUIEdQWTWD268PgWzKABiYvPZjrZHSjtCYcXRcLY7oWuMRJ
	hfaIMfnmO8YGEumKa73LWkN4ZYKMU2oCGFWXE9/eumb67jRgMG5JRnN0UeYY/ZVNz8Zt6HVIglG
	pnMojEtNzwKgYgIY8Umy2xh0HTRU4Lv/4vhEKWoCNMnahymnuIhE9u7N7BddJfpqo6jNDzl5Gf7
	sY39uWDBAEkDZ4ii1taKz2KwrkodQD3cJErWr2gmL5v0OySZCGzxj0nHmXYSpR+ARodps05DcmG
	CdqYAKwIaBazIjduLV2F5/7GNIv3S1Rhh8vVVLkPev7L5YJTJkqa0zl1U2/uXw7IbDnKgCqrRY1
	C7S/IkTqEPPBFMuV958Y=
X-Google-Smtp-Source: AGHT+IEad01AFFzAJl1vuK9QHhGl+59kZyoz/G3tQMdU1jb6NzLwc0GlNYjjFre7q7YN5kzQRLGmWA==
X-Received: by 2002:a05:6402:2551:b0:615:a231:e5c with SMTP id 4fb4d7f45d1cf-617e2b7090dmr4942705a12.6.1754766847480;
        Sat, 09 Aug 2025 12:14:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f15fa5sm15261780a12.14.2025.08.09.12.14.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 12:14:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] webkitgtk: fix compiling for 32-bit Arm
Date: Sat,  9 Aug 2025 21:14:06 +0200
Message-ID: <20250809191406.59132-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 19:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221688

When compiling for 32-bit Arm target, the compilation fails with the
following error:

| .../webkitgtk/2.48.5/sources/webkitgtk-2.48.5/Source/JavaScriptCore/offlineasm/ast.rb:1004:in 'Instruction#lowerDefault': Unhandled opcode addq at WebAssembly.asm:739 (due to WebAssembly.asm:739) (LoweringError)

Add backported patch to fix this error.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webkitgtk/fix-armv7-compilation.patch     | 32 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
new file mode 100644
index 0000000000..a857d55ae4
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
@@ -0,0 +1,32 @@
+From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
+From: Justin Michaud <jmichaud@igalia.com>
+Date: Wed, 6 Aug 2025 21:14:26 +0300
+Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv7
+ https://bugs.webkit.org/show_bug.cgi?id=296921
+
+Unreviewed build fix.
+
+* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
+  for sp on armv7
+
+Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999ecd5ee4ea3123f7e75634d2bc57f57ca7070]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
+index 1ac3e2accf3c..bd9041404eb1 100644
+--- a/Source/JavaScriptCore/llint/WebAssembly.asm
++++ b/Source/JavaScriptCore/llint/WebAssembly.asm
+@@ -736,7 +736,7 @@ if JSVALUE64
+     storep memoryBase, Callee[cfr]
+ else
+     loadp [sp], ws0
+-    addq 2 * SlotSize, sp
++    addp 2 * SlotSize, sp
+     storep ws0, Callee[cfr]
+ end
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
index 947996450d..35b8ee2a90 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://fix-armv7-compilation.patch \
            "
 SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
 

