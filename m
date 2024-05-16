Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863D3C25B7B
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:26:57 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.11098.1715858816582188300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJYlIbgr;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a0168c75so333138166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858815; x=1716463615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMwM35sL15JbkmcfStKtPQ7tzSRunKEJUBZM1d6AQUI=;
        b=fJYlIbgr8PIoDY+zenygg2KkJiya88/2SnNdIcrTUhYbNWt5ugimggSFzTjYAvT6Hd
         V3EQIAHurO8i+JnYksNjuQBdUC+b30yckuYDXyHTIGGNDoS4E+Rf15IxSuZ/gSjn6SOp
         KuPR3RolJ97uUvETmvY3Mnh7dSDf5oH65JFlDEUuubriac8WAbnw6qgMJ6wODWWGqr08
         1CgAeOG1K62Na/b1VC5jsvgc/oeaWcDxhHBa8yG67UBdJeynxgmQ7M85gqR533sTGL+w
         1Q0S1MOmETo1KxPdmo1PA3ExAR3Uw8zg5oV+soGkHndGD0l0Z3/AjhTgTpP7qZoGP5ga
         CNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858815; x=1716463615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMwM35sL15JbkmcfStKtPQ7tzSRunKEJUBZM1d6AQUI=;
        b=KyI7dYSZ1dQQ8U10iiBmSEIw/JaH42GGwwtNEXSvUejm5Haie5BE5pq+QFtCoFH3Ss
         4q+NL7oyU5vRMUIke6DcAakVNMo3w31Yi5cHrbbZ5hQ9rUvTXMItIWxsao2NofUskKCz
         jqNQjTeaefwfWtxlKzqjpzNTaQ0yLYHnAlxO4E22Dd7kcWfrvsVx2euOULoWeyaTuzbZ
         lo8qtWWQvZjrZuhdd84IwB694333vdyx602SdfcOp9giGKqdpHP4B5Bf0PRG3P+j0z0F
         s6A7RjQC1WrYaenrNPlYmINU27JPwh0qfyTh5S7szyNgwv/GnIQfFPByILcY4saczqKb
         hUgQ==
X-Gm-Message-State: AOJu0Yw01drbf+QCCPWhmgCfBEV8TlJOxMQPsFS/moq6b2dyQEOfKdHb
	W0nouxp2+5L/tlMFOU6n0ZxaHlcp7M49G3Mdn8Uu4aEKVHjnfxqmtxp2hA==
X-Google-Smtp-Source: AGHT+IHQB8WQhkeYY4+xeCfSbCPeBt1PLDYuzE2jsqNePaYq2H1mnOfvS+iE8sWvflqvooJfOF8yuA==
X-Received: by 2002:a17:906:38f:b0:a59:cdf4:f93d with SMTP id a640c23a62f3a-a5a2d5cb1dfmr1203606166b.34.1715858814953;
        Thu, 16 May 2024 04:26:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/13] grub: mark grub-module-explicitly-keeps-symbole-.module_license.patch as a workaround
Date: Thu, 16 May 2024 13:26:32 +0200
Message-Id: <20240516112640.2145789-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199472

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../grub-module-explicitly-keeps-symbole-.module_license.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
index d9012d1dd63..7c8770ce8bd 100644
--- a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
+++ b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -37,7 +37,7 @@ SYMBOL TABLE:
 0000000000000000 l    d  .modname       0000000000000000 .modname
 --------------
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [workaround that needs investigation into @TARGET_STRIP@ behaviour in oe-core vs toolchain used by upstream]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
-- 
2.39.2


