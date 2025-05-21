Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE65DC54EE3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.4702.1747808401879360977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LmrK+/Oc;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7310510b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808401; x=1748413201; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXIEUQtcb6CoD2t2U/i2mOaYSYZWbtYPnWwXiRI4ljA=;
        b=LmrK+/OcmFcuQ5OWMPWb84u/8ZrFzyWyxOMj/c4fbC54xWkU8L5+xEIWweKEaaItKo
         RKo4hKoBJGUU06USiv7PqY3uXI0AYopaE2uhaavoZeO2bdzwpj8oLcGrR9mtjMaim9iy
         EwfetnMHiTT/inVPLElYWwJveCtF3IGM8HPPRc/fK1eg/TFMTDvu6UKS2yHCp9XkUXCf
         ngEIcoL8BMc8f8E9tX7aQo2XZTGEK81QNbpqR3Hr0XfSLluJPpfRgcJuY4tAMhkoFqJ3
         1oKWOjBy5xvWtrX791R/oDXOchpMxrqXd+XfxgmfR+mfVc7y2atSLBL6263bU1LUo8X6
         15Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808401; x=1748413201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXIEUQtcb6CoD2t2U/i2mOaYSYZWbtYPnWwXiRI4ljA=;
        b=A5tf7vT4BCeHvf858rZ81R8wJF1xgJlVzhs7xEB7+wFTaoVRajDrMe8hTc8Lox94Qx
         4N3MqHJaLMA+C4D2ncZFF1IDBt46OBNYTs57N2XzC1+dvz4Od4u7/OV87x1FXk6Xd/nS
         RIZOplvkuNrqHHmGodUf7VbTGbjZHFgG3wJJv3++Cbrueuhxq83UCC8E0GBvKRgD3lHH
         CFCdkIMMMvIbbUHv3PdKogW/UkM6k6Rowjxj1dMCrz3EP/X6Fmu53yaB6Bd8nPWWsU9j
         hv8HWIXGoQNFbLaLAk0mJXz1098Oyhim+aVzgVmVDK5E545EhNpf5CsAEfjpTO3M1msb
         Mvew==
X-Gm-Message-State: AOJu0Yz+UskcTftaARFnd/pZahnZGoigNGl5MpSUugKWaLSr4zvzNxS2
	4ybHy1H3aLeErJFRl5SRnoyH57DsJdZHyjFZEYGGX0n2PQ0Beo5s/uPHvECeX5vF
X-Gm-Gg: ASbGncug+x0bya6Ue3odB+juCE/M1jBR/xgtY7tZ0FBp6GdUt+qAsjFApchD2UhRoAd
	uv0Zew4XtwaiihxXbcq/A79HZCC9dWcg0yXNVZsGokkiw2LlWYf3KMlIBPxL+nJ3VquFo+4+0Oj
	tgk3/hCjUzYMYzXToGtY22ajw+1MuOpO4ZRMvGRU9LTc7+6tR4WXgdg728iQw4N0XntjDh1JKvV
	BBpXr7cD/bvovyRYysWfUqkOi5pjiYCfer1G0u+woqDR8mS2QJyKTg43XyOQlUGa3/ocevqqj+O
	GjLHxkzu2L2olx7YPBN5DbQSNAmeS7c7MTk75S/+JE+ydJvMpY9ZSw==
X-Google-Smtp-Source: AGHT+IGiHRN0c5nDH2aN0HiWgFPy26QK1v7RugrhwejGBJvmflzUkav1sb+Hj8VG4mDUlrAKh68Pug==
X-Received: by 2002:a05:6a21:9988:b0:1f5:80a3:b008 with SMTP id adf61e73a8af0-216219b25c7mr33078852637.32.1747808401031;
        Tue, 20 May 2025 23:20:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:48 -0700
Subject: [PATCH v2 12/28] openssl: Link with libatomic on x86/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-12-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216980

Fixes

threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lock_free'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index fddc4dbc813cd06333d72c38852db14ef39d25c1..0f5c28dafa314e52c3497a2e571b572475806e04 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
@@ -53,6 +53,9 @@ EXTRA_OECONF:append:class-nativesdk = " --with-rand-seed=os,devrandom"
 EXTRA_OEMAKE:append:task-compile:class-native = ' OPENSSLDIR="/not/builtin" ENGINESDIR="/not/builtin" MODULESDIR="/not/builtin"'
 EXTRA_OEMAKE:append:task-compile:class-nativesdk = ' OPENSSLDIR="/not/builtin" ENGINESDIR="/not/builtin" MODULESDIR="/not/builtin"'
 
+#| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lock_free'
+EXTRA_OECONF:append:toolchain-clang:x86 = " -latomic"
+
 # This allows disabling deprecated or undesirable crypto algorithms.
 # The default is to trust upstream choices.
 DEPRECATED_CRYPTO_FLAGS ?= ""

-- 
2.49.0


