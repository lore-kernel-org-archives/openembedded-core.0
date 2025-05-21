Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F98C54EE3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.4714.1747808412186564863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfwivXTR;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c5f3456fso2765263b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808411; x=1748413211; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRqpb5xy/LZvqsXgKJY2IsHcqPYzAN9BvdSvXnuTg6E=;
        b=JfwivXTRbu+yYcxXycJiomvodspoPCn26gpxqdkW+8sn+m2qGm9MiO4/I4lihS4Oo2
         G5G1V1oG0qafa6OmLOAN7LDwmbzi/CbAtLmHJ14nI85BxqXQ4vBddc44YvQFcz+9ESTF
         shL1YMUVlEYQm3ZPRBRlIFwoTQNBw7E3z3eMJ6JIvmlsa2BRDQf6uL99k45RzB0MqyMs
         RsUukxv9/IpkRLtY3YHKGbzSPyD9uJkwYrQK+IgOsLwOlHHevhnt/DIVJZnRq+MPer6Q
         aVIgt9vN0FFfjANKxmDK/Rv1Kou7eD4D4ab7FYhA2Ff6XzwzXwQUPoVaO/nDqwMqllZi
         tocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808411; x=1748413211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRqpb5xy/LZvqsXgKJY2IsHcqPYzAN9BvdSvXnuTg6E=;
        b=Ya8barqfhGRKb6OZ0xr1/Hm6A5Db8bRY47K9qjc73sczyxH/euC4zK+fcecOdIaeVz
         0WTIXKn4VE5EXxLvv1Cj/VjS2nbNKJ6uFHZCDCrVgW5ajpWRhj7deoyu/pT/yUk9yFcl
         +pFoRYPWBSGNnPvy3KKRwvZhyxDhl2VzncguaVT2x680bISpT69GcWxXsYZQIEmPnC7S
         IdRMoYqnkkQKbG7cUbYzvuLBolbU1GG1ZITKRPpbE5HO6zeBgLhbOjdE2j2W6tpirtdS
         uRdQFiNYU6UV+Bn7WBhbnOXFxa/TDHDhTaxsksagHI8C1Y9RGqEWRsk7jPjgUTEhbaDi
         7ZuA==
X-Gm-Message-State: AOJu0YwM8CPxUt2QdCU5r8hVUOsNF0bfGZkDCKCXUv362/HXT7PUHW81
	rq+Lr7pGJyyQVIvA61z1tmGQ+LkVU8yiJW/KSgxWY8rSQ2HNnULzkjX/il6MW/0y
X-Gm-Gg: ASbGncvZcx2qiTN2bY3O39g1kq7a3KDUoqtXG4eaILdbqdEAdCsV46i24qBIS4LFohm
	+YlGxpjJsIVwaQMYkjbaUNYuuQ8054LtRX2rmLN1zojBriqQ3PYEEPzZ+qbFT+GPSF24U2FrMHw
	PEfvWMEbGe3ihR+lScb7NvtaeSGsI74jJ2s2KKDxbU334fzSujJEWbD3uMyPMEarEpanz4HI3mm
	31uBT3KOBH9m7QqWTifYai0OfdEONIeJPddnraQjjlLgBLVx+9qUz6uWvQZ3nbt/i98MRSd2CO/
	/BYkbzKW0OXoRKFGEgEP0FuXO/sb5wxVPjKoI8dSvBNC3lA6MMeTUA==
X-Google-Smtp-Source: AGHT+IEHGZUc3CG2gfe/spKibzdkiYEjCqFUeTjIdxapTvX1FQ21NryK7+cgG14mQPGWqHJ3L+NRTw==
X-Received: by 2002:a05:6a00:856:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-742a98b7f48mr31169084b3a.24.1747808411299;
        Tue, 20 May 2025 23:20:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:20:00 -0700
Subject: [PATCH v2 24/28] pulseaudio: Pin to use GCC compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-24-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216992

Inline assembly is not written in portable fashion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3c65aaee6e02cf417e3165c194353883c453aa00..695f4b676de8c7a642efd6b713f9a66d6d658de4 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -74,6 +74,11 @@ USE_NLS = "yes"
 # Helps tests for -msse fail on non-SSE architectures which is all non-x86
 TUNE_CCARGS:append:toolchain-clang = " -Werror=unused-command-line-argument"
 
+# mix_neon.c:179:9: error: invalid operand in inline asm: 'vld1.s32 ${0:h}, [$2]
+#      vld1.s32 ${1:h}, [$3] '
+TOOLCHAIN:armv7ve = "gcc"
+TOOLCHAIN:armv7a = "gcc"
+
 EXTRA_OEMESON = "\
 		-Dhal-compat=false \
 		-Dorc=disabled \

-- 
2.49.0


