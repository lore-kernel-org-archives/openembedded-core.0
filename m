Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BE5C369D8
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:18:05 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.20818.1745723820361561269
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLc1h9gC;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so2811884a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723820; x=1746328620; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=fLc1h9gCsvuwsKHDeZtBIFISrOFpml4L8ajm7D5EEhNE6yP/X4P8J9K3DuA38Ax3qK
         klG0uX1SmqZKdvIkq85nnv4bS59movZry98uF+JvT06EpqupH2NiN4psG+8NHYly2m4V
         E0B9o0sc22mdOBQgrw8auUiy6CA0/KnZfriulnctnt5CyoRbvnaeRwES+WxXMeDWIRPf
         0y1OSv/HlZigZ54/yy/Oy/hnjItsuedHJCbpa9Il4OQGgQQDACTXZadD/1/v7Qz7HVKQ
         NPDtwjU/qbUiIijA6+YSJhP2xgwlcT/NeP1wivwX+7hJKorCd3T9V5Zn1ZPmO65rRnqw
         aQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723820; x=1746328620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=kAhjlQERn4Ib84EuQqJ15UT/uSqG/20w4VHfvbM4XtRGV/SkSuLtpxJFxcaljzDqtR
         l+NVqvQLTRd5gUgjl5rrIuteqE8OXCuDacBydccy9LCx8rgQU+9B6f9OMQQZC95K5f7P
         1YOc2Pmv5dkSTHc3vsl+KUrCTAe1g8q5CsF+uAP7NWC41EmU5ufBoDTKHxdyu+ktX0/u
         aN2eK496hLq6bH0U9QNWqh9PxGys361hBzSUbL4fmdOaPTIhWjSrpeyKiQGHbJMHd0hF
         CHOJRHOaVn1EnNbidf4pUMAE/o2IIBhVCRXhlPgJBnXHxzCt2gdrTrY+TDXR6BMoOfQh
         Rvng==
X-Gm-Message-State: AOJu0YxJ4NLEHkSLWLQupGV7IEBze9pLUY7kWZLQMUZXLWfBiggdBahX
	5mgXCLqklVAEqBYGm7QCH5C15gGhw0FBlmyKb6YcKjdRM65kpeSE
X-Gm-Gg: ASbGncvitdiOOsi9FYp3RQw3tfVmshLxbUN7ZIgwAwQ5LpGEZdhx0l4BtcFO3SI3vq4
	4Bn1YCOniyX8DCoe9qQuTtas2eAEvaR3oY7cvLda4flF9lM1NWIuupFnrneTFZzSoTYfAGLKSfb
	bKImrExgUrVwGHbfAZHwgEaYD8r77Xym1gWLTo2VF7PkKdw0iErH3O66gQLDnPWdvXrJQoR3xrD
	ghm77EFvcVhkP/E1SVxg8x+srg6oRDl87jnlkoKj+wEEFXDlq/wWAVaDenXw1NkQ0bOIi5OhWe5
	jYPGvNQ4SjgTQbcwgwdPCMBMNUT5w0Ls
X-Google-Smtp-Source: AGHT+IEoyjy2WaywXoe620FBScjOtN/GP21De0kluIdgb+a+A4gwWghlWRn+4/pjg5VWwSScYGct2Q==
X-Received: by 2002:a17:90b:1c07:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-30a01317a49mr6456356a91.8.1745723819787;
        Sat, 26 Apr 2025 20:16:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:16:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:44 -0700
Subject: [PATCH v4 05/10] kernel-arch.bbclass: Do not use weak assignment
 for TOOLCHAIN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-5-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215536

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


