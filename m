Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39D4C3ABA5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.60662.1745875584361089433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGsp2YUK;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so4950130a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875584; x=1746480384; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKPuoPdFPfHETan9jQQ31byIUUcuTmrV0sJmnTbUXlA=;
        b=EGsp2YUKtAGSJAIIje1zo39j+zQMCuChw8EcyfO5s235aE+qFMtdmT+5nF1CpFjmCi
         HeNjj9DMLYuhmxdT6hYfS8PakQar1JbKQfUV22awYTWJpvSNN+qkXfxtj6q7J8okuoI5
         EOponC1xHQTE9xtRsXvQE6KB7CGzpokQMB+mEIGiIPPxXNtbosBNCzzV7oC9sSSCj4IR
         m+Ng5YzQmsOcPfEjgZD8UdiERC5NAI6ax6XJB2bKqgNfNKBH4gTuVn9Ws7xINhYHEj0V
         jwKYlF0NT848dWN0N6KxgjSKAY0Sh/Oy5/z9kLxwZmkKcESErUrme6L7+0xEwvbVdWU2
         f6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875584; x=1746480384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKPuoPdFPfHETan9jQQ31byIUUcuTmrV0sJmnTbUXlA=;
        b=BtY8qAil+WCVxBNzdieG9YoXX1dHfxGXo5UU3TOOfPxY+3bPnSiE74zvDyoE6lGRuV
         d+hz55eztpYpKh1kQpQQy5nSqTha26J02WxqyWlkJT7wjjcihB5z7XIPPKmgZUa26Kss
         9Prr/tWzOWQ+49XteGpNpVLAwqC5OuteH+pQX7pDNr4kkwq3y/067Tof9jxN5+IStrV1
         I3jlKYhSOXEm7fJ6mRrOMpgHjLIh3F4KMJ7Chgs4c1DuXyvPTjITMrGQ23nuzDqsfsHQ
         1IkrPOT2l5e1tS85mBLGE0bIu97zMQ0lk+CNUhB+csDDawZdG9E6Vw1zO+ppsEPJ+dji
         YY7A==
X-Gm-Message-State: AOJu0YzYpv0+zo2uDHrlh7YUdclkN5fKkqLWdgO6ZDV7MaRY0qexi7KY
	bv7nyM86YgGkVJ5RUchoX+/uMHcfi0zDCiCFJTqbwEuKMj3VhFEBe7zzHhrg
X-Gm-Gg: ASbGncunlD5KIzvhLw6hrEwjMY7AjRJJNRavs8w7uR2r2xFJj2ozNmHt7T3A65WydC2
	3eQosgNhv5lSmrND1T7HgDNljsrs74BIgDT8xXT/Q5p2d6xMUoOaaY28qTQxfJRhlmw7JZK9kcj
	I/fJhRFgnKifTezj2HM4hIDsPbbr9GqHdoW6Nlax65opE1b9rw7vkWWRJRGC34t91QM53T5N9mX
	TZ7pNHfPqn8hD+v/eVS8PS5dcNHYiN4zTE302ALKDZrgmUh5NNnnBpqS0UjqgaEgXq0FISsAfq1
	z8Y5P5itOAPbqOrBl5cozPZDmiuq+AFU+yVdKjioDoQ=
X-Google-Smtp-Source: AGHT+IE0lN/v2LG5SfWa3LbtuoslI7063KPvZ9bKw7yYmXiS/x93nuZvHe70PpeHFlg7zjq/sXAvlw==
X-Received: by 2002:a17:90b:2dcb:b0:305:2d27:7c9f with SMTP id 98e67ed59e1d1-30a23de918dmr464328a91.16.1745875583515;
        Mon, 28 Apr 2025 14:26:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:19 -0700
Subject: [PATCH v5 04/10] multilib.conf: Add llvm-project-source recipe to
 NON_MULTILIB_RECIPES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-4-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215638

llvm sourcebase is large and like gcc, it reuses same source tree to
build all recipes using clang+llvm sourcebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 0b32a62835cd34313eb244bf0d426c0ccfab26c6..86d1f8c144759712c22c15337f493bb75d63d618 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -25,4 +25,4 @@ APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--forc
 
 # These recipes don't need multilib variants, the ${BPN} PROVIDES/RPROVIDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source"

-- 
2.49.0


