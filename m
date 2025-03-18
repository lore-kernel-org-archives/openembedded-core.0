Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34802C36001
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.4269.1742272732892303201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bxg4JRF1;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22398e09e39so110291835ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272732; x=1742877532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w3eOCY0iTx4w2fsjiphgRkY/cvjWY+/Ff0ZztKCC0w=;
        b=Bxg4JRF1eD3UnmiQ4TNsiShBd1cGV1qvVxUnrrADmPXl2LXZfMXDalnqinqDbBoE2J
         +Xn3fMuAxMFOUwuTnG0l8YaIuLkTHIM9m2eiHVjfc0Y1M6eb9VnXVY2wFZ2CawyAd3TS
         XGVjpj3zhLNHd1AbHPUkACPerOofJxr+uPbOYB0blMOLN8g4t8UM0/WF8JZmgQxG5z6i
         IDeHndJ2aqAkYOTg1jPT+fQmEo4LJp4fHjj46RyydBrHkv1apE+UC3Epg8dkq84Szkdc
         A2bpfwVPSskB2Mg2xmg+MYPUEEUVZHfm8Nl1ve62O12OoBEV0aLAqlNz1Bb0iG9fcbe9
         dnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272732; x=1742877532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7w3eOCY0iTx4w2fsjiphgRkY/cvjWY+/Ff0ZztKCC0w=;
        b=bpqyxwEjx08Owam22XWlqxLuzdYcbOwoA1/ZI37EVIcYWOC703HvNC+RMu7ZIqFE6N
         M6BDCP0akGCHTN2873DQ2GDYLJkWKZByZCL857QlUqaAi8rveik3Y0yKY/brKAwVLrHJ
         L5n9YTOm0CrtG5GrNKTa7322kFxHMDL1toUWNyFInlb30KTFzxRC4fbKl5CbemAHVEFM
         aG1fcLYFJbjmHmEhiYUML2KueHqH/9JVEjzLPxeR/pUBmOhw4QzF3wixrDvkc1rD2AxB
         NL0/LPucR4URlaJaW8jEgapkPLN0prZlsTo/i4PlAB1/JqucgvtccgwGWVwQRJlpK0lA
         1FcQ==
X-Gm-Message-State: AOJu0Yy3HrRZjw8OJy6iw7iRNnAeCPJwjL1eInfuKNsIkFTkCydmzJXL
	HWRX225WIPtCI+uRoBP9j12QZejUPO7Sp5NSKMwaBUQP/1fwZGkb1waZlFsi
X-Gm-Gg: ASbGncsY/ads54Mtpdx26MhD3wFZb0uojasP5IbYb/VOlwFlb1WhePD+dQ9LSngV+CD
	9YHuF+V5HfrqGAmymKNVejaCu6ES9v7EHUdk8bfbh0VdXoUdNDu9CzQndD9vV8/GcriRK0S444P
	SYr6zYuV/v6Y0FbxwFHESo/WQVrH2O1RJckG2Pdiwr7RGsEOjQ/o5ckte9ZGWtAmfCWE1T/ZDn2
	TEn/oNLyUz9/bqxSUK4ZmstUs7vpwm60brFjfj2g6k8CbiB+/xzIdWaD73JLGa6/DZXQOOABEhf
	5w4ZA5GAymZgWGKTsAfqIppqkzHWtSQzXUKo
X-Google-Smtp-Source: AGHT+IFogj7/3F6HKt2i1niZGZd6tq8pn0Jt+RPm4rpRfsaVylZr4tmHQPzz/+d1PhQqc49FDYhBIg==
X-Received: by 2002:a17:903:22c6:b0:224:216e:3342 with SMTP id d9443c01a7336-225e0b1092cmr198687955ad.43.1742272731987;
        Mon, 17 Mar 2025 21:38:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 03/24] webkitgtk: Fix build with clang-20
Date: Mon, 17 Mar 2025 21:38:23 -0700
Message-ID: <20250318043846.2422141-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213137

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
index ea16b23994e..7a1271910ac 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
+           file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

