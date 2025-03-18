Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EF1C35FFA
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2863.1742323126900806159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIJ4SukK;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so6681424a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323126; x=1742927926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw+nhN2m+PmBymKP8ih20HDcg0YZZTYFFPYwaX9f/Zg=;
        b=gIJ4SukKBtdMtTVyPdgyS8vWyzpUSBDU0G4J0KtM2cntCDL+53CwoL8yvpK6+XEXGQ
         RRLivq3QJHu200b7Of2pDeRNRPC7HwaNZQvW/MAT8fPFUqf7hgKTV71/JEzL0p+2Fdt3
         tJn2pkZ7vy4GyqQHayqY/h7MR4o/KliS/YUimUOY+bgUQxgp5zkxB+/ltx0V2i4baF/q
         mkaSACo8qDIA2g0rLf8m4Zg6mn/v6Jh5XjirpmAILxKYtlqImU9xvL15ptLv38zTutVj
         I+0o/c6qTJ0sVYZeo6a8IC5aXBoNHT8XFr2CDkWH6CvYL+xFSCmkQOtjSoeC5e7OMDOt
         CZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323126; x=1742927926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qw+nhN2m+PmBymKP8ih20HDcg0YZZTYFFPYwaX9f/Zg=;
        b=HbKOK9/1nExUhl+Cm3QUOx2CJBpoya4RTrt951MQn2pzMG01U29uHW6+q6VKCc0skn
         eObzMfT3xNjprq94UhvbUNxNJxTuyMY60K4B5gL8PQn/Lgjs6/yNtp9+Hogwdony7QoF
         brYjBeivvVCdvEOLj+SXAvet4oUso9t4gRznTc4gOyCzlW2EVwKjaizBP6WwR3wgF5Yf
         hhY4ww9cVB0XowUHBGCdfYXUA+mhiJzxpoulFZ8LzbIs/nFqoc4Vlas/APlk+1lNk/4s
         Br5dC5K38Ev01qrBYhAw6IyJ/xlXZf4p1SiViocKnsiGg9GKCVhbkijAa0BikT+ggmST
         1BvQ==
X-Gm-Message-State: AOJu0YzQs03k8H4GwjhJWawmbAQ+wkbpWrfuUheeSag+QtI1fWFT8l6e
	irXyToQfPE4IX5BzXCm2R2Ppc6qE6t3HwrKV+PUdYP3p4Mo9KWYMWaYpCSOH
X-Gm-Gg: ASbGncsMTZjOhO4a96Qnmyal4FibHJV+XycCQahzivIjCiVmZKS2pew3ntjHrH3/hzm
	QhC4ql91n/VGIhT5x5uuvclQpqNfqgb21H8x5AkG6zWn+VPNobAO4lDvke9o88AO9MUJhqBZoym
	csNn7Ni0ss+Bilnd/O1+7QFG35/0ouktFmxyWTwS60zF5+8w8i4J3F6x6gByWkIulfsttF+gqoq
	5SksDsZAi1Vqn+yX6ExVPWJcqR2cUajgzbS61u9ophHDVxzbe3ORV6PiiMTOlmJ3jhgUiQXdvTC
	qEeyHdls9nO4+mSpf5UVuksiA07ydZ4BbQw2
X-Google-Smtp-Source: AGHT+IFi/eR56MgY16Bkbg+NXVpMrE3Ilv0DUu3stxGKejeQFaGdVzL+9vM+FOlWEugs0yB1pcsNsA==
X-Received: by 2002:a17:90b:3811:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-301a5b093b5mr4630682a91.8.1742323125911;
        Tue, 18 Mar 2025 11:38:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 02/25] webkitgtk: Fix build with clang-20
Date: Tue, 18 Mar 2025 11:38:17 -0700
Message-ID: <20250318183842.2256284-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213228

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
 

