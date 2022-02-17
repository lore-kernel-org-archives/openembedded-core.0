Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D405CC43219
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:54 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.1762.1645114193946414451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fA/y5V1v;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a8so8432094ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rfp+DUgDGkIbmYVBFcHzdukpa3Fo5iXseyFtuvZNV84=;
        b=fA/y5V1vZsyO3n3tid6mU/4TAf4zZj0otqauhYYdSq7wMAPLHooCAJw8PLhLvhrUmq
         Ccpz4JpzwTTtyUHnU/y59tB/ERL+gV1IER4s/R8N+rTTCQbP2WNd9vFli7wQEvG5AeW7
         wMg4538qrBWdde1CrT2quCl30AydVM4s1DS9WOEQIrkgpdOGHZforuF7JrOfKE2w/NOd
         ejyyr77nDx5INm1Pdi8RGqPI32+2mueXxr9EieC/YqFAf1ZFttinwbHWzf7SrS4l26lO
         350YY0v7sygT8ZjJ/4MolyISvHw4vZ4hhQX3eJnysrC4OQ9qz2h1GeDZeraPuhQMTXk5
         Zj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rfp+DUgDGkIbmYVBFcHzdukpa3Fo5iXseyFtuvZNV84=;
        b=k4XQXprgNgtmzFjhe6GSuErA0TgE4g/UeVvTz3Ws2Hxh7hvXK0sfOgGrEn5iZ/vMIl
         z9E/DqatqO/vc9KniY2k/Io3Er4TBOAEOm9gDk5Y6SkTUNw1dUkaUdoFeG1ln79LizL9
         aZZnZOqRprZ4j2wjw45Wwr3kFSBgHTKNmR0eMzifbPxNtjHhGCxSgNqZjIV+8CP6wfxd
         q/o/jrCEv0dScLsnng3HZu3+KKeYwaZJT7CvWLpYd235EAqbxhrakOiYz4TatklgxW6d
         5gDbwbdg3yaSHgd0i6zcZNMO1mfaP5/nlxhq0tLq2CXdoB8MvGAAQfg1jWKjiqNuancg
         CvDw==
X-Gm-Message-State: AOAM530Uc4K4x2R9b1G52tEpb6URQ5oFr0M9e19fjFIibFF+X+s4jgqx
	l33UpNwfnw+Q7csz0V87qCTp9PqtNFg=
X-Google-Smtp-Source: 
 ABdhPJzL+ERuT6SPn3QMyIjsK/z5LqZWU3AYCo9tfK/1YWqysAraumyjrd7ewnhu17ICad4XV6zUyg==
X-Received: by 2002:a17:906:d977:b0:6ce:7097:b8ab with SMTP id
 rp23-20020a170906d97700b006ce7097b8abmr2810268ejb.766.1645114192425;
        Thu, 17 Feb 2022 08:09:52 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 06/28] webkitgtk: drop patch merged upstream
Date: Thu, 17 Feb 2022 17:09:17 +0100
Message-Id: <20220217160939.1424397-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161823

Portions of it were then further refactored upstream, leading
to some bits of the patch dropped and some re-applied on a
automated version upgrade.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkitgtk/musl-lower-stack-usage.patch    | 77 -------------------
 meta/recipes-sato/webkit/webkitgtk_2.34.5.bb  |  1 -
 2 files changed, 78 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
deleted file mode 100644
index d8d36fad6b..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 358a8f053c367aab7fba8ab059244e0530c7ff82 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Mar 2021 13:24:57 -0700
-Subject: [PATCH] reduce thread stack and heap usage for javascriptcore on musl
-
-default sizes for musl are smaller compared to glibc, this matches
-to musl defaults, avoid stack overflow crashes in jscore
-
-This is based on Alpine Linux's patch based on suggestion from
-https://bugs.webkit.org/show_bug.cgi?id=187485
-
-Real solution would entail more as the suggestions to increase
-stack size via -Wl,-z,stack-size=N does not work fully and also
-setting DEFAULT_THREAD_STACK_SIZE_IN_KB alone is not enough either
-
-This patch only changes behavior when using musl, the defaults for
-glibc in OE remains same
-
-Upstream-Status: Accepted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Source/JavaScriptCore/runtime/OptionsList.h | 18 +++++++++++++++---
- Source/WTF/wtf/Threading.h                  |  4 ++++
- 2 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/Source/JavaScriptCore/runtime/OptionsList.h b/Source/JavaScriptCore/runtime/OptionsList.h
-index a0c2170e..9e107af7 100644
---- a/Source/JavaScriptCore/runtime/OptionsList.h
-+++ b/Source/JavaScriptCore/runtime/OptionsList.h
-@@ -77,6 +77,18 @@ bool canUseWebAssemblyFastMemory();
- // On instantiation of the first VM instance, the Options will be write protected
- // and cannot be modified thereafter.
- 
-+#if OS(LINUX) && !defined(__GLIBC__)
-+// non-glibc options on linux ( musl )
-+constexpr unsigned jscMaxPerThreadStack = 128 * KB;
-+constexpr unsigned jscSoftReservedZoneSize = 32 * KB;
-+constexpr unsigned jscReservedZoneSize = 16 * KB;
-+#else
-+//default
-+constexpr unsigned jscMaxPerThreadStack = 4 * MB;
-+constexpr unsigned jscSoftReservedZoneSize = 128 * KB;
-+constexpr unsigned jscReservedZoneSize = 64 * KB;
-+#endif
-+
- #define FOR_EACH_JSC_OPTION(v)                                          \
-     v(Bool, useKernTCSM, defaultTCSMValue(), Normal, "Note: this needs to go before other options since they depend on this value.") \
-     v(Bool, validateOptions, false, Normal, "crashes if mis-typed JSC options were passed to the VM") \
-@@ -92,9 +104,9 @@ bool canUseWebAssemblyFastMemory();
-     \
-     v(Bool, reportMustSucceedExecutableAllocations, false, Normal, nullptr) \
-     \
--    v(Unsigned, maxPerThreadStackUsage, 5 * MB, Normal, "Max allowed stack usage by the VM") \
--    v(Unsigned, softReservedZoneSize, 128 * KB, Normal, "A buffer greater than reservedZoneSize that reserves space for stringifying exceptions.") \
--    v(Unsigned, reservedZoneSize, 64 * KB, Normal, "The amount of stack space we guarantee to our clients (and to interal VM code that does not call out to clients).") \
-+    v(Unsigned, maxPerThreadStackUsage, jscMaxPerThreadStack, Normal, "Max allowed stack usage by the VM") \
-+    v(Unsigned, softReservedZoneSize, jscSoftReservedZoneSize, Normal, "A buffer greater than reservedZoneSize that reserves space for stringifying exceptions.") \
-+    v(Unsigned, reservedZoneSize, jscReservedZoneSize, Normal, "The amount of stack space we guarantee to our clients (and to interal VM code that does not call out to clients).") \
-     \
-     v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a crash if we attempt to enter the VM when disallowed") \
-     v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
-diff --git a/Source/WTF/wtf/Threading.h b/Source/WTF/wtf/Threading.h
-index 178f9808..95ec5a85 100644
---- a/Source/WTF/wtf/Threading.h
-+++ b/Source/WTF/wtf/Threading.h
-@@ -67,6 +67,10 @@
- #undef None
- #endif
- 
-+#if OS(LINUX) && !defined(__GLIBC__)
-+#define DEFAULT_THREAD_STACK_SIZE_IN_KB 128
-+#endif
-+
- namespace WTF {
- 
- class AbstractLocker;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
index 227ac2bf72..e6362bedc3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
            file://reduce-memory-overheads.patch \
-           file://musl-lower-stack-usage.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            "
-- 
2.20.1


