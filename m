Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05C2C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:55:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.35309.1701878109566298720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cjFoC1iF;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3333b46f26aso877640f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878107; x=1702482907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KI5LXXi4RfJLZw4K+nlcrLuOMY0H4AUQQE9LDO91Hus=;
        b=cjFoC1iFamgeooguRyxpmNYoX4GFjQQfXoDPT2+qThF+YXQ0YSXePHRkNuUmd+cPrr
         oR2ppB49GRNjQ8Q5LZuuOD07/dAVcTzRbO1Uv1AUancKs46es8Zg8OcZQeOrv3gfPEKq
         HOBa3J0WytQ1psg0DL77udkEhRggFDlhvNa/xNzAvKlDK/xJanjc8tU773ngaR86noDJ
         s8gb3NEBj2Qk7UY1YT82LFrYPKvkMbDXtvPTDWezFjWquFhBWZn887VSV8f5uvVsrgOC
         6zTwImwUkGVaGnlC1Fx+HOE0gzirlMR8BK9WNF1Zy/r7llWIZQD3jXHDg8twNBlH/n0o
         ryTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878107; x=1702482907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KI5LXXi4RfJLZw4K+nlcrLuOMY0H4AUQQE9LDO91Hus=;
        b=SwVUDP4bgul3tlRdbLxKhZkFD4yFwxpE+6idkdZPFg8Q82U4cL6740l718JQWcpiMq
         UL7b1e2SCJY9Q64LK2Gn5ER8EJRvYi4lDPGT94ZC5Ne+wD/xphoFurz04yW3Fd2vr1ot
         CqnR5hgqdD74//GSTciiGMSY8PEjGnXon8JyF1zqkTylrH5sfWC7od/DDAWR/QB7R6jW
         HiXwFF8RZsM/UDaacMLifCxmZQUUoRJkBb71ZF6wfcZ+ITJnbPKY9d3wLsk1rjzSSxG4
         YZY1ArNpC4YaA367n5zJDcd/mOYR0mSndiYto4zVosrxkRMF7UdWtn+T3c4+eC8rQkOG
         67rw==
X-Gm-Message-State: AOJu0Yyf7VVMWLiZ8UH2FqBaF5BsCWfbUYo/v19yZIbM0bRZPzyi4Flg
	KcS806IoqrEUSzlDtH4Q06dnfenV2m1PZcWchA0=
X-Google-Smtp-Source: AGHT+IGED5QOvoMRGZKfxI32ixlRrYmi6i6yf2lxwjo2jsWZZKOrSVN3nfqJniibmcVW+wOj6FMYHw==
X-Received: by 2002:adf:f7cd:0:b0:332:dc6e:ae0d with SMTP id a13-20020adff7cd000000b00332dc6eae0dmr671059wrq.24.1701878107291;
        Wed, 06 Dec 2023 07:55:07 -0800 (PST)
Received: from localhost ([165.225.81.67])
        by smtp.gmail.com with ESMTPSA id w3-20020adff9c3000000b0033344e2522dsm16636wrr.37.2023.12.06.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:55:06 -0800 (PST)
From: Massimiliano Minella <massimiliano.minella@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Massimiliano Minella <massimiliano.minella@se.com>
Subject: [OE-core][RESEND][PATCH] zstd: fix LICENSE statement
Date: Wed,  6 Dec 2023 16:55:01 +0100
Message-ID: <20231206155501.659356-1-massimiliano.minella@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 15:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191901

From: Massimiliano Minella <massimiliano.minella@se.com>

zstd is dual-licensed under BSD _OR_ GPLv2. License wording in the
README for v1.5.5 is misleading, but license headers in the code clearly
state that there is a choice between the two licenses.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 meta/recipes-extended/zstd/zstd_1.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
index 5c5fb5e734..2d72af50a4 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -5,7 +5,7 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
-- 
2.43.0


