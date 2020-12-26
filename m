Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.19194.1608974889024041364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SjFXbx8V;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id j16so5594435edr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YlefEaEmV2R64LE6GLKLYqicqDk9Sfm5DNkROBwsMBE=;
        b=SjFXbx8VZF6Fg8cEK556n02WZDkZs1SQgfB2RD+suhi3qRQ25l7gClXRKnuV1K0e+G
         0N2YISmwAY+0dfrE7hO8C7Vz651/NvgxvibErscu19wA2yhIdrR+j9NK5xQhSfkjcKaL
         Ol2o0zY/tG52oi4uyqDa3sN3DMgAU8W+Qhfv6b+AJVfycoxjtbSbtUAt/v7DhFJC/o0v
         DdvqTRigTeu3sDepLRz2extixVhEGroYPx2GW47WjXxigzUw8gDMQlPf+e3/dl9OqNRI
         z530O7Ye73R6KjwqXXDUWUYhDJPcTKGDqmDg7oXVKeQhiXftpyXP2BL6Z+ei0Ns1Ud8Q
         Smcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YlefEaEmV2R64LE6GLKLYqicqDk9Sfm5DNkROBwsMBE=;
        b=eIgBFvblnXXMjnRZzYaRhkS+zjOUZvYpQgU49s6AUEaw9Qerkwmw7hStI78HSDib29
         fBhvpbGkSTy56IEi/JDv0bai73VKJE709Tc8qKvKastiXf7WmWSXNxzAXNvQ13MselOI
         Eba38dgPSTwLK2J4ha4jhzhqgoXB6htIfXSSqpN7R9/pc0USlPqugICJon1/ZX4gAx22
         P2HK5nUfVu+nOIrw533hoIBdu3Lu576R2S4QWbPKhp8FPu+k76SM2q/EqbrgsRTLTHY7
         +5ZbACnu1vJfJ1KDH7v/la4RkvFeWrXF3i8sfBgz7CDBXNXpic03MIyG6Lv2PCCSBlXw
         7eFA==
X-Gm-Message-State: AOAM532HU+ud6H+yLEDuLvJlwCeHYQSipY24/e8s5ycQIm+Wc620Arxc
	8p7wmCB5c4BvfrnUISKZsNIX//hD8PA=
X-Google-Smtp-Source: ABdhPJwUZDb1sFKS1fV7Wf1j4Mb5uejmPm3RtXkZYkM6qPk42OUoPrrG7W7v1453S2eeh0xuJE2ypg==
X-Received: by 2002:a50:a692:: with SMTP id e18mr34205506edc.233.1608974887613;
        Sat, 26 Dec 2020 01:28:07 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:07 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/48] webkitgtk: upgrade 2.30.2 -> 2.30.4
Date: Sat, 26 Dec 2020 10:27:16 +0100
Message-Id: <20201226092732.52323-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...er-exposes-FALSE-and-TRUE-macros-by-.patch | 180 ------------------
 ...ebkitgtk_2.30.2.bb => webkitgtk_2.30.4.bb} |   3 +-
 2 files changed, 1 insertion(+), 182 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.2.bb => webkitgtk_2.30.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
deleted file mode 100644
index 3a02253e5e..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 8d1c44a03c1870912991467f8d8cd8bb6f85efa5 Mon Sep 17 00:00:00 2001
-From: "stephan.szabo@sony.com" <stephan.szabo@sony.com>
-Date: Tue, 3 Nov 2020 20:06:15 +0000
-Subject: [PATCH] ICU 68.1 no longer exposes FALSE and TRUE macros by default
- https://bugs.webkit.org/show_bug.cgi?id=218522
-
-Reviewed by Don Olmstead.
-
-Source/WebCore:
-
-* platform/text/TextCodecICU.cpp: Replace use of TRUE with true
-
-Source/WebKit:
-
-* UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp: Replace FALSE with false
-
-Source/WTF:
-
-Replace uses of FALSE and TRUE with false and true.
-
-* wtf/text/icu/UTextProvider.h:
-* wtf/text/icu/UTextProviderLatin1.cpp:
-* wtf/text/icu/UTextProviderUTF16.cpp:
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-git-svn-id: https://svn.webkit.org/repository/webkit/trunk@269325 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- Source/WTF/wtf/text/icu/UTextProvider.h            |  8 ++++----
- Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp    | 14 +++++++-------
- Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp     |  4 ++--
- Source/WebCore/platform/text/TextCodecICU.cpp      |  2 +-
- .../DrawingAreaProxyCoordinatedGraphics.cpp        |  2 +-
- 5 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/Source/WTF/wtf/text/icu/UTextProvider.h b/Source/WTF/wtf/text/icu/UTextProvider.h
-index c8f28d6e..3c6fbeab 100644
---- a/Source/WTF/wtf/text/icu/UTextProvider.h
-+++ b/Source/WTF/wtf/text/icu/UTextProvider.h
-@@ -79,12 +79,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
-             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
-             ASSERT(offset < std::numeric_limits<int32_t>::max());
-             text->chunkOffset = offset < std::numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
--            isAccessible = TRUE;
-+            isAccessible = true;
-             return true;
-         }
-         if (nativeIndex >= nativeLength && text->chunkNativeLimit == nativeLength) {
-             text->chunkOffset = text->chunkLength;
--            isAccessible = FALSE;
-+            isAccessible = false;
-             return true;
-         }
-     } else {
-@@ -93,12 +93,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
-             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
-             ASSERT(offset < std::numeric_limits<int32_t>::max());
-             text->chunkOffset = offset < std::numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
--            isAccessible = TRUE;
-+            isAccessible = true;
-             return true;
-         }
-         if (nativeIndex <= 0 && !text->chunkNativeStart) {
-             text->chunkOffset = 0;
--            isAccessible = FALSE;
-+            isAccessible = false;
-             return true;
-         }
-     }
-diff --git a/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp b/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
-index 0a646b7f..49980f95 100644
---- a/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
-+++ b/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
-@@ -100,23 +100,23 @@ static UBool uTextLatin1Access(UText* uText, int64_t index, UBool forward)
-         if (index < uText->chunkNativeLimit && index >= uText->chunkNativeStart) {
-             // Already inside the buffer. Set the new offset.
-             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
--            return TRUE;
-+            return true;
-         }
-         if (index >= length && uText->chunkNativeLimit == length) {
-             // Off the end of the buffer, but we can't get it.
-             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
--            return FALSE;
-+            return false;
-         }
-     } else {
-         if (index <= uText->chunkNativeLimit && index > uText->chunkNativeStart) {
-             // Already inside the buffer. Set the new offset.
-             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
--            return TRUE;
-+            return true;
-         }
-         if (!index && !uText->chunkNativeStart) {
-             // Already at the beginning; can't go any farther.
-             uText->chunkOffset = 0;
--            return FALSE;
-+            return false;
-         }
-     }
-     
-@@ -144,7 +144,7 @@ static UBool uTextLatin1Access(UText* uText, int64_t index, UBool forward)
- 
-     uText->nativeIndexingLimit = uText->chunkLength;
- 
--    return TRUE;
-+    return true;
- }
- 
- static int32_t uTextLatin1Extract(UText* uText, int64_t start, int64_t limit, UChar* dest, int32_t destCapacity, UErrorCode* status)
-@@ -337,7 +337,7 @@ static int64_t uTextLatin1ContextAwareNativeLength(UText* text)
- static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeIndex, UBool forward)
- {
-     if (!text->context)
--        return FALSE;
-+        return false;
-     int64_t nativeLength = uTextLatin1ContextAwareNativeLength(text);
-     UBool isAccessible;
-     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
-@@ -357,7 +357,7 @@ static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeIndex, UBo
-         ASSERT(newContext == UTextProviderContext::PriorContext);
-         textLatin1ContextAwareSwitchToPriorContext(text, nativeIndex, nativeLength, forward);
-     }
--    return TRUE;
-+    return true;
- }
- 
- static int32_t uTextLatin1ContextAwareExtract(UText*, int64_t, int64_t, UChar*, int32_t, UErrorCode* errorCode)
-diff --git a/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp b/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
-index 69c8d091..9c3fa709 100644
---- a/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
-+++ b/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
-@@ -126,7 +126,7 @@ static inline int64_t uTextUTF16ContextAwareNativeLength(UText* text)
- static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIndex, UBool forward)
- {
-     if (!text->context)
--        return FALSE;
-+        return false;
-     int64_t nativeLength = uTextUTF16ContextAwareNativeLength(text);
-     UBool isAccessible;
-     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
-@@ -146,7 +146,7 @@ static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIndex, UBoo
-         ASSERT(newContext == UTextProviderContext::PriorContext);
-         textUTF16ContextAwareSwitchToPriorContext(text, nativeIndex, nativeLength, forward);
-     }
--    return TRUE;
-+    return true;
- }
- 
- static int32_t uTextUTF16ContextAwareExtract(UText*, int64_t, int64_t, UChar*, int32_t, UErrorCode* errorCode)
-diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
-index c2684939..e716a6fb 100644
---- a/Source/WebCore/platform/text/TextCodecICU.cpp
-+++ b/Source/WebCore/platform/text/TextCodecICU.cpp
-@@ -240,7 +240,7 @@ void TextCodecICU::createICUConverter() const
-     UErrorCode error = U_ZERO_ERROR;
-     m_converter = ICUConverterPtr { ucnv_open(m_canonicalConverterName, &error), ucnv_close };
-     if (m_converter)
--        ucnv_setFallback(m_converter.get(), TRUE);
-+        ucnv_setFallback(m_converter.get(), true);
- }
- 
- int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, const char*& source, const char* sourceLimit, int32_t* offsets, bool flush, UErrorCode& error)
-diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-index 61e3f605..5a51b9ec 100644
---- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-+++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-@@ -402,7 +402,7 @@ DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::~DrawingMonitor()
- int DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::webViewDrawCallback(DrawingAreaProxyCoordinatedGraphics::DrawingMonitor* monitor)
- {
-     monitor->didDraw();
--    return FALSE;
-+    return false;
- }
- 
- void DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::start(WTF::Function<void(CallbackBase::Error)>&& callback)
--- 
-2.25.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
index 31370f3239..a16a676d7a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
@@ -18,9 +18,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            file://include_xutil.patch \
-           file://0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch \
            "
-SRC_URI[sha256sum] = "c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa99f79dd71ad5682a"
+SRC_URI[sha256sum] = "d595a37c5001ff787266b155e303a5f2e5b48a6d466f2714c2f30c11392f7b24"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.29.2

