Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC21C001B0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7343.1686734967265910937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=A2kcAixd;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-519c0ad1223so171316a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734965; x=1689326965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xserdymo6oTaK6YsUn4vytF3DpTDwMo0at4e5Bp+W8w=;
        b=A2kcAixd+7mQRPnXCWCe5dFbh0mwYFWiLK33cZR1HR3dbm3SyHgaKMnCNKGLqGeMR6
         puu8ryceqs1IPanWswPFwqu+3iujGJuJkCCnkc/EohyyEwcjJBcFE18P9Be3kOcR/RI4
         Rc/8zPaieT6EnfK6vgKAfMnxMwufS+xFuBYz7vIIjP0SLdstP/CeLbeMno8/AKLmuUPJ
         vpAH4y8p8tiD6DQ0KYBM9ULUAYjmrFjxW/xu4rPsXKAlhGJYYtHXNOAVAkvNyojbgyS5
         SV8yxAIPAgVSQMv/RLSKWlfzJXJ/kf+yYMnU4g7NIIU31Kjj024xr2mQppXGV2pTmmee
         Brbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734965; x=1689326965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xserdymo6oTaK6YsUn4vytF3DpTDwMo0at4e5Bp+W8w=;
        b=ckSA77minHxIxO5BykqMHumOqdfpXhDuPueQlyXgsHTGzTWn4/W9BCSmcUhHi/UVXk
         lBMvOVI4ycTspOVbKs4V+/ZoU5iq9yG+G6ejmlJEr9RAiscb5zaqCfvd684JEBRSQIlN
         M2dAsm/hxi7y8DL2sBLbkzLlGu2sPSzXd0tHG0muzp2iDgu8IadMM9sEBilT47k/jPBJ
         VR5xuQUaY+ZSywr6Id1xjVMxv/2uDJwRyZXkma6KK8EoRmXS70LQ9uup66NyJpr/jY4M
         /8JEWCm7NJhnosG5+uBVBi9W0Sse+diXmBH9X1/OalRZdI1QtUUR5DX0GwFYWsD+CcVG
         sj9w==
X-Gm-Message-State: AC+VfDwxM74bcBsvxrKzcJTsP/KBvHZajtbzSZH618IZxSk4wHA7tFFi
	efmJKjrGbNYiwnBevShcIuu6KkO2p5w=
X-Google-Smtp-Source: ACHHUZ6ZvnV5joLCK7t06XIRK1gHhsJulMojdSjduY9aHwLhK7zCBfGCLA4JDSn4bzLYCMVkeMQeWg==
X-Received: by 2002:a17:907:a411:b0:96f:2315:29fe with SMTP id sg17-20020a170907a41100b0096f231529femr16076722ejc.0.1686734965532;
        Wed, 14 Jun 2023 02:29:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/55] qemu: a pending patch was submitted and accepted upstream
Date: Wed, 14 Jun 2023 11:28:27 +0200
Message-Id: <20230614092918.4065570-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182749

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-tracetool-use-relative-paths-for-line-preprocessor-d.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
index a32ee57f8a4..049b9a51052 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
@@ -8,7 +8,7 @@ The event filename is an absolute path. Convert it to a relative path when
 writing '#line' directives, to preserve reproducibility of the generated
 output when different base paths are used.
 
-Upstream-Status: Pending
+Upstream-Status: Accepted [https://gitlab.com/qemu-project/qemu/-/commit/9d672e290475001fcecdcc9dc79ad088ff89d17f]
 
 ---
  scripts/tracetool/backend/ftrace.py | 4 +++-
-- 
2.30.2


