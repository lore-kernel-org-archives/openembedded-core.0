Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17AEC54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.4696.1747808395367492810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YvEAbty1;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399838db7fso6045960b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808394; x=1748413194; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcAksl6ffK20o79p233aXIhUKpPRCtQA0+GKUJsZeOE=;
        b=YvEAbty13R9tkDb4tvTfE+p7iqHy6ZCsaS5rDUg+t+AOt9S4cJbgqqD2Rm/9frHiyJ
         B4WLEKMUl/d1MwhP5ePotUeD/QACXUzrKSDz3+NNE+t6kHhZFtGbayP51WEInAZeas4M
         3sS49WTjcBZ7Gpvplf67hRDrlOhPYa4T7NA2VpDz/C290ece1Cd/ccN75EljxZKf0eeq
         658b3LYVnoFvHfYNSQ4WOfGO7r1DEaSzgWD6wP6OmqZiqs4i3aZH8V/YJ667pAFNYp4+
         PeFNPwYhIYsSIMoM7eaNdpNYkoA9/lz6ZPOtIp+crbcT7wNoGL3qAPzw9I7x6WFOwQo/
         5KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808394; x=1748413194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcAksl6ffK20o79p233aXIhUKpPRCtQA0+GKUJsZeOE=;
        b=TnkMdGUQmdsldkFVD69sorwqdXUhwDeYt6O3QI9DB6yVx+Tdpu/TgsTLgAQYUuXLi1
         QoUdF+KEStG+QO87lpDBZ1imzKT0Gpsv3tmu8Gx8weiE9cwBlz4l9Yoz8s3MTQoLruLj
         6h516jGInvIy37vBeZm45hxH4+SbL+eQugMq0nt3pswXJNoeMhfaZGjOJ92Bq2iLz7+g
         FRdxsBrrAM05p5iK8Xj6RbhMONJWL24f3SeCtlf8nf2jQpD1IACe/DK5OFCyhEKiyFqL
         i6zC1X6fupeLKplFOw/3PW4mRZRJXPLqLgkZ3FREugH8GvV8dWBFGAO+Ex/Nuvf0/u8s
         A6iQ==
X-Gm-Message-State: AOJu0Yy01eagSbx/WdqonlDQc7fOichmMXiiRZ3hYVjzzhoj17Zh7ZIR
	FKr11cu0vOPkJ0crWyDFjaeFV1RTag7+hAOQkHE4qO1TPsSlnAr8d7pFk6kl2aoW
X-Gm-Gg: ASbGnculj8ED/VUApdZ3a1/sLxk31IiBSCybrRhXYxVpO8M4rCprdHNtu27LV+rzqTh
	UTECcmr/+aRQPkQJVf6CeBrPDmMkCFKlB8sbj8+j3xXRMFezFNV5V6knzHODxjpM2mpnpeuBqkx
	OJrHvHqi7/Qv1xvZEjZbv2e2D+vUiFrSv9WR/h1gq6Mumt5x+Bs+Gh6mqfM2cXGUxrdgZtQtLFe
	bssjXNrlBm3zlVyj9+PzN1pD/P6spimbKR5e9J0ATpXeIKnXu3ML2+vEp4IspfwuuIhnKbqSCzn
	njIfzN6HWS2gvHmN6kSEkyyKV3tHF5qvqJaojHFKuOE=
X-Google-Smtp-Source: AGHT+IEZ1Qg0Vwi+GqCeT96glpYeyxipwPByYpwdslFvTe9mJB7jGiM3NOys7KFjTGpf2rWP4bZ2qw==
X-Received: by 2002:a05:6a00:3c89:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-742a9b16af5mr26207590b3a.11.1747808394312;
        Tue, 20 May 2025 23:19:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:40 -0700
Subject: [PATCH v2 04/28] clang: Add compiler-rt to default deps when using
 clang compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-4-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216972

This provides needed built-ins which clang uses along with libgcc
its not yet a full replacement for libgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/clang.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/clang.bbclass b/meta/classes/clang.bbclass
index ddf8f350f951744940893698188a1e6056edf7cc..f9cc74142438f1a85a55517c2846f1a72b9af9bf 100644
--- a/meta/classes/clang.bbclass
+++ b/meta/classes/clang.bbclass
@@ -24,6 +24,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
+BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"
+
 TCOVERRIDE = "toolchain-clang"
 
 TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"

-- 
2.49.0


