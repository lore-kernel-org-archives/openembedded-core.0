Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA49AC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2915.1742372176128042767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ccu6sW3B;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-226185948ffso60435995ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372175; x=1742976975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw+nhN2m+PmBymKP8ih20HDcg0YZZTYFFPYwaX9f/Zg=;
        b=ccu6sW3B725JnzFU3dnQxZbceeZ7NXlX+mzd/AhP5qDK0Nk/EGL5xB1iSO3KxIqmxf
         gez0PJcxko1eDadnwtGZW10gDXdZuLrnfBq6VKeLYDX+wIbOp331kVD4i+xGRnQeEdj1
         fRrRun0hiFJ4Ij1fYdLAvoQ6dhcqSKOHIwBnz25tSKG1j3qS+UG0pWrkYa72TSVJFmQK
         qZeaW1uB//NJISimrXUWNjUkDp/aErIM9/GY5cjN5ma6LTl0qApkfmax2vBGwcGbfeHn
         OKbbvSfJ3WX9PAnHdp/2RrY7DnW2WH/lhNrMUhVsXDiDKhaX6vFYzfAsuz0Ap9gdxT0N
         efSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372175; x=1742976975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qw+nhN2m+PmBymKP8ih20HDcg0YZZTYFFPYwaX9f/Zg=;
        b=l9QFuFZXtYycXCa667zmq2HfxWdGk1RFec/C3lPhgYDNz3VGNWhZUJbceVpb5gi558
         zTRwljY3aKiJPLxDfKUVtmNvZ7mK07bXTWLrPDXIWjcA3OsQlJOqkWnAp5IGFDY0UoHu
         tZ5XuVq7/aM8Ul9Cjz/ayeDyOaa1rYQ5xLDu5hO6ol2dwZZE3GEgBYldIlKX5BrOUEW/
         YK35XOKgMdwb3cj8RSiCQq7jr9UcdzuSeDOicAW1n8YjhfuprvWZLA1q0c2gktG7uOwr
         bHSSXdOlGFWLc0ZH+/NFPTg095/f/CaNhP4jkVLxgBTTAdoMskwyks3u1LU7XjRVMs42
         SBkg==
X-Gm-Message-State: AOJu0YyBDR702+4RXiVL+/3OVTqKWjAiUPTFkzlzgNr542xmYOOfnuic
	fXtQ05XJ74UIYUwfr6ob4Q2nlxFKIytSpMEmtsGM8rHIpusUCWIjCe5YOGgB
X-Gm-Gg: ASbGncveNCGIVn2QQXYQQejrbS2R1Po1nHp+JtKnau1kL6C6mJ8i0d4b9ejytMLsoBa
	3k9SBEepI8U6ALF+vkrTid2M+35t3UpoTsiR5tdkxUmqiu0w9aWVxsmVkte7/GdU98Fj/ueo3H9
	UnH84M2nNtn1cijRGLYng4p6LpYV/SoDdPZjg5JNooudXFthIV047vXiE7kXnkPdTq2zcROZ0ji
	2jxqmW4Tby5FN7KfSrGtMagJG0DUyN3+HtdhxPuRJR4jt2mrAnnCsbPsEBOoWXboXOFCjwJhQFc
	TQ0I/DY5Ryrgmz2HpDc6Ju9dgAK6pgNURJ6K
X-Google-Smtp-Source: AGHT+IFGM8BptkBUkzo4VUVDp9irF0ek6274EJkcDd3Zr8IueXFEYudDUA728uBE6TM4zX96/lDlmg==
X-Received: by 2002:a05:6a21:7002:b0:1f3:194b:30b0 with SMTP id adf61e73a8af0-1fbeae916aemr2993294637.5.1742372175283;
        Wed, 19 Mar 2025 01:16:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 02/27] webkitgtk: Fix build with clang-20
Date: Wed, 19 Mar 2025 01:15:30 -0700
Message-ID: <20250319081610.3536475-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213268

Backport the proposed patch to sync Enum traits header

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...or-no-matching-function-for-call-to-.patch | 77 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
new file mode 100644
index 00000000000..5b83d9e7eb2
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
@@ -0,0 +1,77 @@
+From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 2001
+From: Fujii Hironori <Hironori.Fujii@sony.com>
+Date: Tue, 18 Mar 2025 10:25:47 +0900
+Subject: [PATCH] EnumTraits.h: error: no matching function for call to
+ 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=289669
+
+Reviewed by NOBODY (OOPS!).
+
+Clang 20 couldn't compile EnumTraits.h.
+
+> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid explicitly-specified argument for template parameter 'V'
+
+An invalid enum value can't be specifed to the template parameter `V`.
+
+> template<auto V> constexpr std::span<const char> enumName()
+
+The upstream Magic Enum C++ has a template variable `is_enum_constexpr_static_cast_valid<E, V>` to check a enum value is valid.
+<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
+
+Imported the template variable.
+
+* Source/WTF/wtf/EnumTraits.h:
+(WTF::enumName):
+(WTF::makeEnumNames):
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42597]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.h
+index 0d33e39a..95e6318b 100644
+--- a/Source/WTF/wtf/EnumTraits.h
++++ b/Source/WTF/wtf/EnumTraits.h
+@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
+ #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
+ #endif
+ 
++#if COMPILER(CLANG) && __clang_major__ >= 16
++template <typename E, auto V, typename = void>
++inline constexpr bool isEnumConstexprStaticCastValid = false;
++template <typename E, auto V>
++inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void_t<std::integral_constant<E, static_cast<E>(V)>>> = true;
++#else
++template <typename, auto>
++inline constexpr bool isEnumConstexprStaticCastValid = true;
++#endif
++
+ template<typename E>
+ constexpr std::span<const char> enumTypeNameImpl()
+ {
+@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
+     return result;
+ }
+ 
++template<typename E, auto V>
++constexpr std::span<const char> enumName()
++{
++    if constexpr (isEnumConstexprStaticCastValid<E, V>)
++        return enumName<static_cast<E>(V)>();
++    else
++        return { };
++}
++
+ template<typename E>
+ constexpr std::underlying_type_t<E> enumNamesMin()
+ {
+@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<Is...>)
+ {
+     constexpr auto min = enumNamesMin<E>();
+     return std::array<std::span<const char>, sizeof...(Is)> {
+-        enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(Is) + min)>()...
++        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min>()...
+     };
+ }
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index cb4e09662f7..afd5dcdd8d8 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
+           file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

