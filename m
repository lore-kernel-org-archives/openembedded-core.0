Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDE3C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.37990.1747603856951197962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=erJ4bVyQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3306059b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603856; x=1748208656; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL7VwSz+WYu5h0HCWTWs5u/A46iTK7Ac+WK3oanjawQ=;
        b=erJ4bVyQ5VOeezLRF1WOIp0j4H7y2ifknBJZnYb/1YAiS/OMF/RUX65f08jM2sdO1G
         DHYWr1PaueTmPIq3W9mh+oQBbdK17QeNu1citj8OAXRGWaPweJ3K+h/C4PXNPXq2eg+8
         jwPw9ZVrOX3GGeAJzX9lMJ1WFVbv8XbNgvW84ffjRgvH/96Vo386yEJGR8mrOsKUpbIZ
         aUXxYoKC52EvwiRMPNyc3mI4w/q5JiY/Jvu2uDv+K+uk+AV+AmdhHKsuyzBLYH5qq99k
         WlR7KjsTsV1vY/ls2WL1UVxeRClKQSSX3XG8aHgqNS9OMY7msu0jixqkGUQD6HS7wiJR
         V/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603856; x=1748208656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL7VwSz+WYu5h0HCWTWs5u/A46iTK7Ac+WK3oanjawQ=;
        b=GTg0ysQJ8dHBwQ2hDFU5GZFziVrGKMZZ1SVnrBXXI469OWmZVPOuV/kSTGbQeHtEVX
         DPgBxoIImFnWwsU4n+Q3G8AhhRwysXbW3u2zOOoTB5vn0wYBN2u/cnAaX83MXwqvX0S5
         MuqtI5KQCxsvKu0p+tgPqpzhj/3fy7XTqIDnmS1hakIhi2S7dOSLViMpGodzX+9EwR/F
         qFUQXYUXhbr9deBeJCgAHeDdyJ9f0GmeYDaPLlp3P4wZ1kRkZgDAPG1vN6l+b1RrLWNl
         Zk27AE3KmMgfT0TKeH6pGOHffb8xkng5BPYSfz4yCHuZFkzoHWrCZ74EB9JQYytm7aZL
         8Ytw==
X-Gm-Message-State: AOJu0Yw9oeh9p/coCSws+QbQrtUm2AVJknEcBjoNb5y/fSi2drz4I+v5
	FYUoT70DtpfQZF4FjtK393HjiHrX1cVTmVrvLONaa678mvU6J5Fc5tj6eLO1lLTg
X-Gm-Gg: ASbGnctH4j1U4/VdBcJqSzC9vgte+IG5Xsl8BcVksEx4hIJeLyJ2s5Oct5WPqWrRVD9
	P+IdoICQ4yzga2JoXp8bxG+jRIqbhAeGXaMBMCEXqh54+XzCUCs3o8E93FUpZVXV7iXmgF6gn16
	eXOIyo1GLNrQXcwuTSJAtRzMO61N2rlbQXdkvG+edMIW5xk7Snou9sJOi2tAJKNP06pv9qHLIO7
	P0g/oPy7S49a9fD2pc74osdZXDdTxErlWtQMR7dtv3bYad1EpdaNjKXX6I+prgqVukWGNJETf+q
	najwbsxbuqZfu2qPzDBj+roNKLhR31shf9TyQbwKEX737sggOU5MOQ==
X-Google-Smtp-Source: AGHT+IHI3hiB2DOvvM5X/EqneGG51EjlKFnQiXeNCDLXL87fAj/qG3zdRX67DPaAyI5O3lkbN7cu1Q==
X-Received: by 2002:a05:6a00:10c6:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-742a98b83efmr15509191b3a.21.1747603856153;
        Sun, 18 May 2025 14:30:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:43 -0700
Subject: [PATCH 08/21] rpm: Always use gcc compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-8-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216792

clang can build it ok but the openmp directives
get emitted with full paths into binaries [1] until
thats fixed in clang/openmp stick to gcc

[1] https://github.com/llvm/llvm-project/issues/82541
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index 943ecd39ebbd4f2189850393eec2d813aa0f0337..18208125dc2fee8acbde3abbd8faffb479e0a846 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -17,3 +17,7 @@ TOOLCHAIN:pn-libssp-nonshared = "gcc"
 #      vld1.s32 ${1:h}, [$3] '
 TOOLCHAIN:pn-pulseaudio:armv7ve = "gcc"
 TOOLCHAIN:pn-pulseaudio:armv7a = "gcc"
+
+# Clang results in a reproducibility issue
+# https://github.com/llvm/llvm-project/issues/82541
+TOOLCHAIN:pn-rpm = "gcc"

-- 
2.49.0


