Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31B1C54F2E
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.4701.1747808400322068170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3sJziGV;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73972a54919so6033218b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808399; x=1748413199; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lwvg6uu5H1sokq3hZo3+82CUfjebb7B5hToB9c7YHs0=;
        b=g3sJziGVXNFGRjkoU3p+iolNl9IvWo/RvrJR8d/cJb4y3RFO8gArsXScrXLiHkDFPw
         G3ragn3npixKf+xp8MQZmj3rM7U0X3UbmTgvvu7ZLZSVKFWVK90OgkFWWL+VQzr1GIDm
         /Ato3Nfqf8/Gn7oBJMr7UUNa95CvQ2up8nUEm4uvX9a5iCLK6G7W27sv3HK5a8Mw1an+
         xLy8J72dko89jIXJiNkNw/dnYi3AXOeZEy6x2uKaSoiJuksjuBKswAJF6dnTvqG2P6/U
         5L+UyQISfD9sCrcFMNVj1VnfW1Bk6FDx1zYtoZtar2lK/AXOFYqLMNi/pJRLXdYKMWZm
         ivSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808399; x=1748413199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lwvg6uu5H1sokq3hZo3+82CUfjebb7B5hToB9c7YHs0=;
        b=rZbRqrl5unoIIE2wfmlOmT5MXSKcrff2ntAlU2WsjBI8gdn5hgGwlorJCfL5rktMEM
         Rd3GMEvlRqCa/tDUFmGHEXTFufl65pP9YW2uFD4I0On5Er5PoQK1qQTD6Eb0LH7FJh5w
         0rCGPtGV5n3ddv69AN4XSe8GSJUAwpeRlf9yowZcHuNcTgVyO6j8BTX3IGhQA5FhzmZ9
         EV/219zVLqgdds8wHY6Vj97Zjb1yL/u2C66nrAMZP8Mj31ZifiOlhthY41z2A016g7Dx
         smyCBbj/FY4Ttu8o520lt0gQRW0bCGNa+KPKXlRSPNy9xxwOGc3y+3N1Due+Z77i7Lno
         7h5w==
X-Gm-Message-State: AOJu0Yzjr43WR2XuwoZISj9yt2QLTgxOc5tf/Ce06B7Mhcgtw87vOcaA
	QCXA5LtziGmQBtSE9s1FYNmhznQBPy+ZQwZ0bzGPZgvliMmEsTqJSFTwS0xB7bHV
X-Gm-Gg: ASbGnctQJFlrJy6FYTsNL2pIsl74H0fo/o8e0uGQmJD+klIq4Bb3DQCQn9GJwTQXKNZ
	4TVs/4WiuvQYr2ZGxuk7sjrRKy4MjOr9QnWQzM7/h15wuwvqLXGMWEwukgpdD/gT4yu01g8QZiS
	HV6cRiySFL1KFD+h3kkABvhTTSKjSa5zrCbujj4wIYbBxfDYAKuN5rcp0aRVzF3kyV9yv0M3tII
	7o9xOLLQtuROGTr3j/ACaE85Yd9atVYFKID7LeaLAprAADcVUKW4rKFevjzNHJo5VNGKD7s3NS5
	iDYagncZY2c8bKvGxsqIGhM/MPBRa/pVrJLIxDidqEE=
X-Google-Smtp-Source: AGHT+IFnox/5l7M7CBmWV2szpAuzwEvcXnBKlObcnkTa6UvDpziauSqohpwOxbcgfTnM31+4mghtaw==
X-Received: by 2002:a05:6a21:3289:b0:215:eafc:abd9 with SMTP id adf61e73a8af0-216218ca4bamr29710844637.14.1747808399490;
        Tue, 20 May 2025 23:19:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:46 -0700
Subject: [PATCH v2 10/28] systemd-boot: Remove -mfpmath=sse option from
 cflags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-10-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216978

EFI sources in systemd uses -mgeneral-regs-only which conflicts
with -mfpmath=sse specified by OE via tune arguments. It needs to
be removed, clang errors about it and fails the build

Fixes
error: the 'sse' unit is not supported with this instruction set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_257.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_257.5.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
index 6a50ac05aa9915982dca4649f7bda610cfbfa14b..151e4a953735b524ed14a5ef5459dd037efdcdaf 100644
--- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
@@ -47,6 +47,11 @@ FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
 RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
+# efi portions use -mgeneral-regs-only option which conflicts with SSE
+# especially clang throws errors about it
+# error: the 'sse' unit is not supported with this instruction set
+TUNE_CCARGS:remove = "-mfpmath=sse"
+
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"

-- 
2.49.0


