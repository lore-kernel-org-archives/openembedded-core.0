Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD66FC369DE
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2767.1745634927494120046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNSp7Z2o;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2240b4de12bso46793645ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634927; x=1746239727; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=XNSp7Z2oi5LtCHxELXEZEl4Zjz5zPRKX3T1TZeVIytXLfmUv7r3BWAVdQpWf+9RpMs
         5SGcCXyaNE+gZhuQooD2pMQnllTqQkcJYQgSF0k6n9a364waQKvdR8f74D6ZWtpUvOG2
         WBwposYK3DMJAWkfggmYaeCOT5Tvh9fIYxHks9QLVAwCXN9DDXur3aggcSMwTSdU78Ow
         qKrZUegtoUTasQyKe8wZBF+TBZYCkGpAz5VA+qnuc4H/fQ1NIyhySypWJ2Xjhz6KE6oB
         QcNSqad3JR5HV8jYo+3Hw3ymChHzww0ZoH/Nxsmsdfdq4j6dK+EjUCXoNhrwpKVWaHxg
         zikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634927; x=1746239727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=psmpp+Rky9HIxijJh3fxIYh/+huwhpuEIarxYOK+DFvYy4Yfri/BcC+4cjdvFL+Ga8
         BvAN2tGSoeHMHveV/DuolTQosHSUXIT7ABV/ZoPwrvvdbZWR1S0+/zZFwImrP7LBRNZ6
         +VaBHiVK1uLfWCOhr9WRafoQJ3dxF6TuLXJqRyclNy/Munczlsv0n4b9sqsxCb3K1GRk
         +bRZQ1F0Wqa0gb/lbgAbQuv9hwQXik5IBeoU0uv+CkX5Wm2r+KLsd4Q/QQAcv5F3pJ2b
         fUDFY601lU5JLK4NJ8r1SUBMnW6I6Ax35fU9rRf/icG2ISWeiCmgOGiW8mlZyYrYhI6M
         ur4A==
X-Gm-Message-State: AOJu0YzAcqzRv6EbDqB51nKZ0CqvzTVtTf/6UouA21epdRBkTLGMaFBK
	Q2PO6Bk23u+iV83zZN5uWl8tESn/hVtO8FyT6QB9lqKVZ/k1iXIZoRX3wjtJ
X-Gm-Gg: ASbGncuKuMQ90qAt3FeVi7MUTp36yIW4UWPnK3DUQv99NfStmfqMDK+DriPklYGjmjZ
	M3B+UPDehvKX+jzDnezoRZSBubH7VzXDdbZSXzIeYoOy2qOQuunHK58saNTD3JTdWpTLaClL9Wl
	tTtgoSt4xaWwiLuYtWXL/Fi0XolD7EHETsTEKvChF8OPtPfMK1vnVoAu63tz6/bJR3awXaNZIDe
	7oUUx3CinIbYl8TO2xBrzbnlpojrGJUNySdVpSHCtYg0mKzZ8ub6XDkoA2O16mTsSRBjzognLtf
	1zmpLoDDDe2GUKBtxqnikBOwPy2tq1q3
X-Google-Smtp-Source: AGHT+IHR9NwXEvQWbItpPuT82t1x98nVMqRYvNZEz2Mxlz8VN282pqRfeVlvjzQW/NTIgY647M+WhQ==
X-Received: by 2002:a17:903:24e:b0:220:e023:8fa6 with SMTP id d9443c01a7336-22dc6a87a3bmr22007745ad.50.1745634926670;
        Fri, 25 Apr 2025 19:35:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:07 -0700
Subject: [PATCH v3 05/10] kernel-arch.bbclass: Do not use weak assignment
 for TOOLCHAIN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-5-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215504

If a distro sets TOOLCHAIN with ?= or = then it overrides this
too, however, we demand GCC to be in there due to KERNEL_CC etal
Make it hard assignment, it can still be overturned via a bbappend
in that case it is intentional to use non-gcc compiler for kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 749a266ea36c04fea34fd60d4b93d340db998936..7aea9cd3e8e3329412ddee07e2f3d43a7722ad5e 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -81,4 +81,4 @@ KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
 KERNEL_STRIP = "${HOST_PREFIX}strip"
-TOOLCHAIN ?= "gcc"
+TOOLCHAIN = "gcc"

-- 
2.49.0


