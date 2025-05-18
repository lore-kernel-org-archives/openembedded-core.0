Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70710C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.38003.1747603867706591800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ngnm51Y7;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7376e311086so4567271b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603867; x=1748208667; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgBQUj/CzWduXGBJ+O4XX0nBBY7jz/uYYfNIOyEdSRM=;
        b=Ngnm51Y7RDFoYmhp2El7W//mlOcf78g3wgoqTpXkmp6kyprmxhMzvnPlU01xdjZqR6
         aBblNpuuaxLzBD6exe7ZCXLgzAiE1GdNVQPdMKcZbhREfjJAZZSfkazX5ydNz/lM1aGk
         r+HM0NQvkDlOYN8x1SeBG90g5pbiv9AMimEgBuh8kkue/VSya4UPGIFyqCUfb+X9lGFm
         OuL1uiX46Lh1FvQ3l4PXw/az+UImJOr67vPZhpWtt60BVSaKBfI0CdOQjRcGN1kjU26H
         1Lq8YkBlkCXFr9q2xTANo18Jp6QP0mgVGR3oaKPejIlvBa/G1B4ZfFq/wQRxg03Rk+ka
         v6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603867; x=1748208667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgBQUj/CzWduXGBJ+O4XX0nBBY7jz/uYYfNIOyEdSRM=;
        b=GyiEK37Znb6rq+OIy5O3yhLmGuCaRFxGgkgG8cNpyNJWYKy2t/deDcOLWHXSQHsAY4
         qpGcz+ocEfVzcxH45UkvaPW92AE+siFreI3rQ4ZeoCG+z7976dSXwnRmL+hShmvYIbl3
         4TTFhxupbKUwJsltFvP5EaZkgH8HH9KvIP2egQ6tySTsRl+GH5N7QEADCJKE7jMR8aI9
         jNKeZvyv+/pbMKnTFSCfRSRwlVrEAv1BZOkdzjJtn1F4fiHZGXSMRtj3r76LKMnek5w9
         OTKIAWt+0V1JKrm5/r6HG6dNb7j2ErTBmDE+KIqpo1l5rYETKm1km5309WbW7CPGXZqY
         HBfA==
X-Gm-Message-State: AOJu0Yz0N8m8yh4UMh2OWo3ypCx3aAhJSp+bJsYN9jhDnLgC9ii+avYd
	z2IW3O/7FHKgvSYBr1gXsgVx1mcOqYfnNA4JvM0vfyPv7sQ+KrNSaaniba+rEsvQ
X-Gm-Gg: ASbGnct7PBeINQezD8pgE620Ouh7mDiLUeBwQwTv61jCh9g8hVy17jp08ZiQY3LqCGw
	aN9KAWXPl/DaspAkhT/8IA/52LEw90cxv00Z9CngYdnYZKmHoXp+yACM1L59WDirgIcjLav2Vf6
	ZwwlsIn34JWlQedPwsWK90RDynDgNSIJGQlGys8W0PiB4e/kSX1d/3IQnk+417HuVPcHBS3FFUM
	2GXS6Ep4TGSqfPDvOJqYhSfD/+HSvBhaCg3cF2gO6g/Xv2vJQd9UdYq/MU8869cXK/Lz7Bsxm7m
	qizUHtehhYHrMI9+OmxJWIYv9hbyPQx8ZkeDwzXuG8I=
X-Google-Smtp-Source: AGHT+IFL8z+tmw+NoZS35olA8BH0vAWnu5PHW1k7Ip3ANObi45oojfS9OMNQGK1A+l6FAtTqLWPdrQ==
X-Received: by 2002:a05:6a20:7f8c:b0:203:bb3b:5f1d with SMTP id adf61e73a8af0-21621882888mr17010114637.6.1747603866936;
        Sun, 18 May 2025 14:31:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:56 -0700
Subject: [PATCH 21/21] grub,grub-efi: Pin to using gcc on aarch64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-21-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216805

It needs porting to work with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index cec47ae860747df807695182878e88e4f798fe24..697252d22afa9dfa7833daf749363bb47b06d9e2 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -13,6 +13,11 @@ TOOLCHAIN:pn-libgcc = "gcc"
 TOOLCHAIN:pn-libgfortran = "gcc"
 TOOLCHAIN:pn-libssp-nonshared = "gcc"
 
+# | aarch64-poky-linux-clang: error: invalid argument '-mcmodel=large' only allowed with '-fno-pic'
+# see - https://bugs.gentoo.org/942843
+TOOLCHAIN:pn-grub:aarch64 = "gcc"
+TOOLCHAIN:pn-grub-efi:aarch64 = "gcc"
+
 #| ./ports/linux/pseudo_wrappers.c:80:14: error: use of unknown builtin '__builtin_apply' [-Wimplicit-function-declaration]
 #|         void *res = __builtin_apply((void (*)()) real_syscall, __builtin_apply_args(), sizeof(long) * 7);
 #|                     ^

-- 
2.49.0


