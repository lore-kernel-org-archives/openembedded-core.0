Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0567C4345F
	for <webhook@archiver.kernel.org>; Sat,  4 May 2024 14:41:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.14561.1714833703778003598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 May 2024 07:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SMF3rwDv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34db22374f3so426079f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 May 2024 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714833702; x=1715438502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcmIqMn4o79nM3+Koj8P7/iZG+ORZz6s5iVLNKOkP+M=;
        b=SMF3rwDvB9MRtxZv/rgzCBOqK2auZRuvr+kx0dZGZnM9M+irOBevouSkaYieqG6epn
         2+E/LMcC0kLCCeclcnDVo6Nl9GKiHdTMaAIxcbAQBSOiGZ6EsNTCKY1KtK6rq9jNxsqX
         6mSVu7z0YPciJxevYhpzAirHvlKX5R/lT/Stc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714833702; x=1715438502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcmIqMn4o79nM3+Koj8P7/iZG+ORZz6s5iVLNKOkP+M=;
        b=L2J3Y9yprDoEZjPkhFvNb2c5WLhgJyE7k3fNSEL0rtTeVKB0NSUWCqNXDvNl5mkUIC
         /6fsGNia8rl+Uy5kNEHaRaUF5UD5ezc5BOpwDdCBJJTFaBKlpuCSWhpXhe7iymRYcF1C
         9M7RhDvSuG188Rvk2oLxNRH17HD7BATnsFm4cAzBdBkOOBxY61lPbSW+K98LInrFON25
         YIYFwNTbs94S+UwKLPEALatsD3H4VO2JJ1E49tMs/RrxFp8LFwoZvig8Uz9cMXn06RSj
         Ak1+wwp8gNwyKZqKeZekf9awE1yxm5Ib8rBnp65MrTyjc8HAQSniSueO+NVcZbZQiWmJ
         5p/w==
X-Gm-Message-State: AOJu0YwjjHjvJmYDic9gQaaPIc8mLooOuqycnlSlgG7LFfPsIW/WAbdt
	9Be9f/5h9U0LZEi52pnKK4P/L716bTXfxiLAN9/kpKbLCCjgSEZtlfaeygizVN78km73DBm70fu
	COz8=
X-Google-Smtp-Source: AGHT+IH4cCmjnTsO9pPugxBbuzwr28oN5xwVnhwSOOY19VQHKzSzbodxwJxyjkcI8hr/U8XuDDFgAg==
X-Received: by 2002:a5d:4cd2:0:b0:34c:d17a:ab7c with SMTP id c18-20020a5d4cd2000000b0034cd17aab7cmr3976853wrt.29.1714833701745;
        Sat, 04 May 2024 07:41:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e198:3cac:cc91:1ed9])
        by smtp.gmail.com with ESMTPSA id h18-20020a056000001200b0034c78001f6asm6336762wrx.109.2024.05.04.07.41.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 07:41:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-custom: Fix comment override syntax
Date: Sat,  4 May 2024 15:41:40 +0100
Message-Id: <20240504144140.3570208-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 May 2024 14:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199013

The override format in a comment is incorrect, fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 9437240fcff..0879bb17b91 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -7,7 +7,7 @@ SUMMARY = "An example kernel recipe that uses the linux-yocto and oe-core"
 #   To use linux-yocto-custom in your layer, copy this recipe (optionally
 #   rename it as well) and modify it appropriately for your machine. i.e.:
 #
-#     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
+#     COMPATIBLE_MACHINE:yourmachine = "yourmachine"
 #
 #   You must also provide a Linux kernel configuration. The most direct
 #   method is to copy your .config to files/defconfig in your layer,
-- 
2.40.1


