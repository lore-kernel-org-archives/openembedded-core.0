Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75328C3DA6D
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.37991.1747603866917643092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jb1V53yd;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742af84818cso1668655b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603866; x=1748208666; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O3ZPz4Yw05qpFwMpkpS0G0XBbzTpMKSQ22fG76VZws=;
        b=jb1V53ydwRrxfrKsjmCNAr9tDYYEccd0ndFUpoZ9qjUVonOTqC2vCX/tyMZAqwG3/1
         9xcW3fY0TfLZCILJiDifPIhu7ihPPf8gEctuuNQCb2UaeojnQWfXz+szQ8cckFVR66K4
         8g8KvQ93JALq6v/enMDoz8MbS7D/AFX+L8NfJJNCt90XbMQbGh8U0MBu5DQ3uhLe8egx
         MIASYQMOBmnvk+splfP4lw0aGr0RdMuuQD5T6FFM04uXjpiwtp+Km1D/a5cMGSyHMwAs
         BHCWWP21HKqEcj8044IKNQfwxoCEsz8di0Nivne1dr4nnfYlwwyrAtxj9+mMLysDGkSI
         XxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603866; x=1748208666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O3ZPz4Yw05qpFwMpkpS0G0XBbzTpMKSQ22fG76VZws=;
        b=L2aRPqFd5gKgnooaRAh/5UA3YTF2owZe0TFGWSj8mgTyf4nQHTwTflxNADiCQ7ZPIN
         rRk/D+3zBEW7OkGRqdVARdz5OUK2QANWFZMftqj+yMqP7r8TZApR7rMPiBctmoFX5uCJ
         kKMLeQtTxoXcZf1YNvymQPfcTBn9noSL+Axt6mdsghpuxT8Aj6Y6PwVGkTZFXFaAq595
         7cqVLYHFsUf6Y+4mY293kxMGfKvtnwBeTHkF0b/dxdZmiK9oCgutILI00R7G/aOV0ps4
         oRpgzKdGBOWZxbYC+E2/w0vXxKAiCItAtaRb7qgUNjeU3CWGhNsI7FL26/7Bq7lRwXD1
         HOXw==
X-Gm-Message-State: AOJu0YzwI8g1wrcW0ihCf94QPF0/WB0XoxjZPme/V0X8i0rYDQ0iveRj
	yfF5hoFwVlAyTjSSs2MVhqkKUdAlaOjYtSyEwQbcD6agA3lOlkGDTxLEoJg3SO8w
X-Gm-Gg: ASbGncsczF6FvRHXqzusQv2QRnSKMwfHUsig+KlmjZIcunlNyZxxlFkUgplindKKYaM
	m1+Viptpg1CmEmH/ihpKGRM8Uc6d+uk885roprTm0v/sGwXaCz7HrV8D8MSezNzmSx9Un61W8Ax
	sKheCPgPu8Digb1kL4xblkUyoyLDL13WQRutgYZQ/lhF14hMRwysQJOEk15eby9vm5o13kD6u6v
	burIj4C+nkCn6q1YVJesF1waBYR1Hs3remwl06fl0PouMXiaVLDtxs4Xrd95gVQxxb/jcT3/Jkt
	EkSQ1icyFyFc0rcVOpWjyTAcdl7btGs0VZmKmLZxn94=
X-Google-Smtp-Source: AGHT+IGe44D5SIVpA15BUhJCSp+tMKOWt+s/ERauTiHpW3IT4O9GSouMYoxFtSEm+0ypHMeqJBT3aQ==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-216219344c4mr15270338637.20.1747603866102;
        Sun, 18 May 2025 14:31:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:55 -0700
Subject: [PATCH 20/21] vulkan-samples: Disable overriding-option as error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-20-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216804

Clang complains/warns about mixing -ffp-contract=fast and -ffp-model=precise
lower this to warning only, this does not impact code generation, we still
get the diagnostic messge but wont break the build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 554e6eb29022e763de755dd550464cbd986de61e..d709bf0de5b87a713da991255487be1a2e237218 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -33,4 +33,8 @@ EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
 # This needs to be specified explicitly to avoid xcb/xlib dependencies
 EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
 
+# Clang is fussy about incompatible options
+# x86_64-poky-linux-clang++: error: overriding '-ffp-model=precise' option with '-ffp-contract=fast' [-Werror,-Woverriding-option]
+CXXFLAGS:append:toolchain-clang:x86-64 = " -Wno-error=overriding-option"
+
 COMPATIBLE_HOST = "(aarch64|x86_64).*-linux"

-- 
2.49.0


