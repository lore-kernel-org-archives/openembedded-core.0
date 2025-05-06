Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D003EC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 06:10:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.70511.1746511851460280809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 23:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yn7qgKWV;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c062b1f5so5319418b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 23:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746511850; x=1747116650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8nl3i3e8VYLjW/Ms6H1HpPFIzeLk81Oq6rHjS7nsVo=;
        b=Yn7qgKWVIeIm5asAVIs5DT84850+DYysjuwA2JlLCqCmVV1F4hwG+KXDA6KjDGpaa3
         4dy7yrIfROsD22HzV7aUvqTO9KjJ44SZZMeg+fwMy4M4DVd5Cvel3hvbm700ZfmGYPTh
         hXChxJhej4kyIhE0ePK48quAJl7DJ+9wGWLZeWXwjNmJnajp5Rku8JP3W5JR0TKBgZn0
         bTs9Zta9OMODS2vcs8rjc3nUJ5EeY7Ub5xhOcpFd7i7RMcBxjTHO+vgEiJBSifP+6TmY
         oWrbpzO/QHygpFCirAa8JqJHBc9gZJXkaSHpkVrnJDVLhsWxnOZWokBBpzQEsTcviDgF
         FCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746511850; x=1747116650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8nl3i3e8VYLjW/Ms6H1HpPFIzeLk81Oq6rHjS7nsVo=;
        b=JRkyt3MwP8M95l5MTPqACNRzdjm6gUZrUg3FPv4VKN1u4HLMC+ibgo/8wBSWzKadoB
         QGG7yWAY0O/G9wKeHIRWKlHkzGH4SM5fFzi1i+CDj7tAPLOGp4McN4udypjK7Mn4AKyP
         w0qkPHPrp/hM59jurKw5VuiHvmOzi302TPQEd342h8DwWB/VjBPLMQaAcZoRV/aeFFRP
         9Q3YQ5/NMg5CRvMIgZLECDLH3v6TEYJpKU/zY7YR0x454wBrbU7iMICQGnXaEMQkmTBJ
         0Lttpuexej0a9C+IaifExzoxSXNRpwZ6INMqh3YpGEGVsXJsPbK9HtZMYH8v6EnhbJqH
         KklA==
X-Gm-Message-State: AOJu0YzAMplz0w4RSD6yvb9shLm/cJ+htG1zxSDxmiU7a2JNKxxJ1nd9
	c8qnm+4CoizR0kdOYZBDTf3lVk99ZWFVOq6rpmJXPOEPbkTj3JndTIjxwFdC
X-Gm-Gg: ASbGnctfFxo6Kd/pgtfjU5pb6D1g+jPt8BtRHr0lXWqAn/tPwaVY2ceLKAVIPjWq/DN
	0/bBXC3DAWfgSJyfrbBox80Z1/SwwI9D32ZqOOcWKDl2H8HgvD/cW9cxI2uf02ghz9Y5x8CP/AX
	Krk3/5Y2Cl+2nuU6iEOSZpFWrVV67oOSRXF6kc/ZEJ3bKdtbyGHFviC81M1bFfqpe3mlvZ/qhvQ
	eRDo8FvKfuDPEeN35+O2rEhImo++NTcuKTy46H2Irzl3gksI4rze9Pu+jqcf7CekQFEqdw+saZZ
	RSXVpQCN+FMV99vjGa8/B00GaDzmvz1Z
X-Google-Smtp-Source: AGHT+IGzowQFpvH9UXbAgoFWTuVTk+5XVwU/WAyL+ogIyzTtFFA7XV9736R4Y0tB68tG2X4MMkuofA==
X-Received: by 2002:a05:6a00:ac0b:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-7406f1a610cmr15661164b3a.24.1746511850502;
        Mon, 05 May 2025 23:10:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7ad7asm8356433b3a.11.2025.05.05.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 23:10:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Enable riscv32
Date: Mon,  5 May 2025 23:10:48 -0700
Message-ID: <20250506061048.386052-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216031

Musl recipe points to recent tip of trunk (1.2.5+) where we now have riscv32
port merged [1], Enable riscv32 as supported arch for musl systems.

[1] https://git.musl-libc.org/cgit/musl/commit/?id=377c363fb5519a224682692004ecd3703c19df93

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 13f51bfde3c..ce45de2d234 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -25,9 +25,6 @@ MIPS_INSTRUCTION_SET = "mips"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4 = "arm"
 
-# 1.2.4 doesn't support riscv32
-COMPATIBLE_HOST:riscv32 = "null"
-
 # Enable out of tree build
 B = "${WORKDIR}/build"
 

