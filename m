Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8DFC5479B
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.37988.1747603853705935577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbEebz/b;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74264d1832eso4941222b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603853; x=1748208653; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOyHThHvHqggC+GwHSWE6igXfqJsUERUx/5Jl3e/k1Y=;
        b=YbEebz/bwXV3EXQEcM9Cmh8mvk27g81BY0IKSamQmfUW/2Ra6u+xEhFkq1UJrV/Bn8
         QMBFMyF+kwMI+LrWk4hfqrtlmMYsK8RIS1SkTBtxtg8XKoneLAlTsrVYNyvFQj3cpSYF
         WS+VfGwyaayt6N53sid4h5ETzXa3qJgzNUxNclJVbeWQUtLiRY47LzxJtY+YfYgWvNne
         spaw33DwH08ebDPPXBafPlGaYCOqZyU0DtFquUeMCVP7s2q/yijWQu5kn1vZWHrcovMY
         ESWp2da09Wp/5u/PObTGtpTyQ8yIpnhr07yKy4tu9o+FTqAc24e57WwXsfSWVdn91j4y
         dY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603853; x=1748208653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOyHThHvHqggC+GwHSWE6igXfqJsUERUx/5Jl3e/k1Y=;
        b=Jw0mQ5WAdZhkLLviZdYK/YPY0yXzHHZ2HytHSjUFUshPR8jgFWElHe0hEMiDdL2Uc2
         asJ2KN2GfBLu2NZYnDSuAQDI6bO/vY3BhqirE21nMmhTL2aF9ZBbHDvACFMfFlAOMiRx
         1Du24iX6p8dTAjaAgElegl7mNQoUzlA5+Cywrq8WzagJyP0E/y4pzwZk+0pghnE71PcB
         9/bDR0wsnXw6VuXk0Rf/XwMlsGnMbMzMfQiE+nAbhE1qO90V6cfF2Yn3QW3crQNgVMY1
         A6CC7xKaPoeVFc93SmCBpwU3y5247XHTKc5rdDHagkGYCUFqJnzkL9cImHbUvmCH9Zze
         MRIA==
X-Gm-Message-State: AOJu0YypCfp3VC3HKpZQqBK0psKopnYykvXZl2W3OqenWu6Ifnu9DXG7
	vojwM46+NWK1otlDRqPyNFbNwKtzEQ6fsdGJ4d+NxJcyAAD7ygjAVFPV5PzXa6j9
X-Gm-Gg: ASbGncvUFp/uFY/0NVMCgtH01T10YcxpHSe1TSaax3WRZie+oZc/MhtYaoWsxIomGZx
	WS39rFuiMS2ARAA78RliJ6MkINElCU1Dkb96p7VrlnYCyp3MMWfLysLRCJFeHPimPV+bARgIuXr
	UyfNCBbLabK69nBe3fXhJ/D1cbh2Y+DqF87QepVnfwL6bpZQeIwgV9UeukfUjk9PMO4KYWpHNrw
	x5WMWZig37jgKJzKq4fbfLS9sABM9VWOXOv3CSYzaGgnYzK8RWyqmHlRmfuE6d4LD+uymc61VWt
	xR81qw5wzV91UnEyXXZKUpI493cW1QX2ffBaPD2aTWSsysWNU925OA==
X-Google-Smtp-Source: AGHT+IEYb1PUuuyn4HDRAQ4XC9Ygf6ovfF/3QRe8KzXhuWFHjZOKd0uaiiAnKSo6D3fEtIx1bITm3w==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:8cc8:9cc5 with SMTP id adf61e73a8af0-216219c7ff4mr18921438637.34.1747603852860;
        Sun, 18 May 2025 14:30:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:39 -0700
Subject: [PATCH 04/21] pulseaudio: Pin to use GCC compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-4-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216788

Inline assembly is not written in portable fashion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index 691570a7a9f28187a5c7f6d0a6ad80761c777e3d..943ecd39ebbd4f2189850393eec2d813aa0f0337 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -12,3 +12,8 @@ TOOLCHAIN:pn-libgcc-initial = "gcc"
 TOOLCHAIN:pn-libgcc = "gcc"
 TOOLCHAIN:pn-libgfortran = "gcc"
 TOOLCHAIN:pn-libssp-nonshared = "gcc"
+
+# mix_neon.c:179:9: error: invalid operand in inline asm: 'vld1.s32 ${0:h}, [$2]
+#      vld1.s32 ${1:h}, [$3] '
+TOOLCHAIN:pn-pulseaudio:armv7ve = "gcc"
+TOOLCHAIN:pn-pulseaudio:armv7a = "gcc"

-- 
2.49.0


