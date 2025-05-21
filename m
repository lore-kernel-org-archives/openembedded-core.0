Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E81C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4716.1747808414858667245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5xxsFTF;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c5f3456fso2765286b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808414; x=1748413214; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toI2q6CLdyjgjqZj0SmMkLQGvZZEc1t4pVNHiboQ/8g=;
        b=A5xxsFTF/kAXPkepQWGBmITK0rsksn8AsPFT61MozvS+nuxlbc+hkfCEZ8yFho324R
         Vlm10CcJ//gboPJQ+/1gTsN+yuptG/LJy1D5+owq/nPHqqECCkqCn4CDjbAmhEiVWiRY
         bvxddw3APifREoG7Q6W5P0+h0FRzzaETGJ0gXbHqSam3oI46hFxedNqJUEzagwzU47BV
         pia6sE14w+8N9uFxpWVTwo85RmKvqo7k6lpjIpKB+VX33rJeJ9+v/t2lhlIDpSgY46B5
         KU3wR5zZudBjY3ttH2noyb4jaM9AD6WaM1rA8T1xv9GbGw/1jetzrZqp5jfG2GomYPkd
         shhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808414; x=1748413214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toI2q6CLdyjgjqZj0SmMkLQGvZZEc1t4pVNHiboQ/8g=;
        b=iTlcch6lbtLyXdyFTNePSMFa14AN41FRcQ2SD8lCPwa3MtLcEFiACgbHNAHCvRWRek
         +Q+1jou6os7dQOtR64O/6QDarZgfFDNKqo0Tvwl5aePgk7KbEqSQ/iHCAn1g4j7/YcrC
         gvcKP/HXR8ZUnqvnf2N47/mzdm+6bkV3VUGYwn6WDgEdfYjqGmN9UhIGyaWDXZ4UaBMt
         VO+Zf27bM0v0mUY5echZvyb5A4DVaH5CFeZafyhepWziQgap85ZgdU0QsM+te5bdkLHq
         W65uNtkzePz5Aavpbn239GJMRNk6Czntt+OVViCfPt0HuKam3JLH6kfHi02wLVOW5c5X
         uRuQ==
X-Gm-Message-State: AOJu0YzIwreW1EsS8siteJEIMs0e+OW5fw6Gkkp1lAV9HeQvJSl6Fke5
	CdN68caF9r/0dGoe+QKKuSJxACzD5svLVM5OT8v/+FnVdSDz3gDya6Zpa3UIryRa
X-Gm-Gg: ASbGncv4/PousgtuVfeaETJqeSc31UBN6jE7e6JxIStZWxksTtzQMoB2lIDf9Hjduyu
	Fw2Fuz6BDVIoQh6jh+Wfw0oqbII5Q2vX2DGksScD5PyAgd31A9fp+vr7k1DU/GaEFxREFJWQBs2
	AuXWOBcC661jF2LBKLnKDP7RmwAycw+GYzK6gkkaXLUR+DgBXR0A6c+gZ0gTzWGCy+bAzP/mYxr
	noMBsZB3R6hGZuK6pXHGjC5/qFCH2pBUpqFRRQuyCc9uoEXd8W1OaCu80LENVW1klYgiWQ2i24K
	/z1edfeaNFVaIQD7d5SmYSZXKwq5X8vaJCznsC0gXjs=
X-Google-Smtp-Source: AGHT+IHqoT8lS4Ho3Wyi0na2mmdStgPlxdzWJs0cM8DNPp5PL/F0dGjvbk8eErXLWf2Q9qGfBRffCA==
X-Received: by 2002:a05:6a20:6f07:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-21621a03267mr29780409637.39.1747808414039;
        Tue, 20 May 2025 23:20:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:20:03 -0700
Subject: [PATCH v2 27/28] systemd-boot: Use gcc on musl/arm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-27-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216995

clang does not support -mgeneral-regs-only option for arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_257.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_257.5.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
index 151e4a953735b524ed14a5ef5459dd037efdcdaf..f293a2f229374a48e17c574faf23620549ae35ac 100644
--- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
@@ -54,6 +54,9 @@ TUNE_CCARGS:remove = "-mfpmath=sse"
 
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
+# arm-poky-linux-musleabi-clang: error: unsupported option '-mgeneral-regs-only' for target 'arm-poky-linux-musleabi'
+TOOLCHAIN:libc-musl:arm = "gcc"
+
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 

-- 
2.49.0


