Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26B2C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4699.1747808398712841144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tup7/T7/;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c27df0daso3146551b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808398; x=1748413198; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptf9Pd1wAS/Hhn6E/sgUC0L8FIEDsCEt9oko0uNb1Kg=;
        b=Tup7/T7/8RlHJRwxO6Trh5y4LvOuoA3LOi0fdpB0jpsF0bHogvLDDsGz5WhLCYqYzt
         a+6Jwb+kO7zzPGzxdl8yAtwBoeFym19TjZ72AHcBZv12kZF/Sj3NCnrduIfNriKpcBvu
         V1lN0vUMPk0GTVfBMav/QR6KBkWtDZm6To+TJjtJQh5JyeXKfW2CmhkIjPGmyi/hR1v9
         0n+cCOpOjg9/teI6BMw3KKAGMsiipK9HG2aJmWPkfwVKOlwPdV/rTwz0ueWuJfKe+a9B
         eFwrqVSqkqgSzxK8uk5ogYguxe6s3ew2uNur0iDy5WizgwY4OOjiv7bNlOMFDeyUchfq
         K34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808398; x=1748413198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptf9Pd1wAS/Hhn6E/sgUC0L8FIEDsCEt9oko0uNb1Kg=;
        b=qeBvgVj5dpAv+/lymA1N66MXh/F8mmNaIQ0kiIuojZUeHAeq+4L8dEJYq2L67lHe0X
         4h82h9H4ky46l6jwjJHTUCSnowHufISfMFZ4a6/NBdnA2K3LCm8DVzYdY6feE3T2Ivzp
         4QoHpVG0gpiMWQCptYqwFYN0PxTqpNB1SKcFRGR7AVf7tMHpYx/J+zLbCS2O7k4sqipE
         iz+u48jDRjCbOeZ9lVmzOXpsRuJsQq+S6WFStQJSBCrclmqIYeilaAlvCl494xBQpOjy
         zYiSG5jkvirf7hqIhi2Ty6X+a4A7ir7eKfX/t3qLfRNhFVLnMquvkNqzwyd3X0bkAzgu
         n6CQ==
X-Gm-Message-State: AOJu0Yyuq9cOD8tEmCyziaVZtH0haHQf8AtSDO9nidYrjaT03YSU9mfW
	dbByD0qOPQtqY3Ba4Pd3xQFzSgMKcxQZLFVXXaoIgFDeIUvpmm2XZKLGrz0WTn8R
X-Gm-Gg: ASbGncuh95JxvXE6jlZY9FNTz3YcQpNltcQBv2Ucb9pzMzuR3xCA1cBbZc+sz6oAP1R
	sAgOAWkdayTrRyEe6n3S1masI4N+mfmkzG4LUqDEF4QnCYmIrfna4o78VeSJwyDesWg1OqGiVWH
	qmF3PrG3sXB1k5Mpmd49LroghvTDkLylSdpues9WlwR6jOE96nHOHfpf1bSZUSHP5lKHNXX/8kH
	omB1FGZoyZumf4dREwUJ3JR8LD0g1gTuxxoBHjtUuRVs/+1NNw+aKboZ3WQVF2zK0G738EUyKJw
	KcdQqJRN36idlUrfnfQRZx2Fkz0zOT/393WudN+OBsk=
X-Google-Smtp-Source: AGHT+IEANPKQ5PMWDtL6IkpXtmS8Ks3i8f/igQsNP+NG7WSgBKeyKbnk3V4q/Q0ijYagledPfui9Tg==
X-Received: by 2002:a05:6a21:3289:b0:215:df3d:d56 with SMTP id adf61e73a8af0-21621902575mr29701430637.21.1747808397881;
        Tue, 20 May 2025 23:19:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:44 -0700
Subject: [PATCH v2 08/28] libjpeg-turbo: Fix build on mips/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-8-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216976

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
index 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e08e47d953bf5773e19 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
@@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEA
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
+# <instantiation>:13:5: error: invalid token in expression
+# .if $17 != 0
+# ^
+CFLAGS:append:toolchain-clang:mipsarch = " -no-integrated-as"
+
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION:jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."

-- 
2.49.0


