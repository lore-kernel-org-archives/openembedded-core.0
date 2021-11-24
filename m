Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B99C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.3349.1637741312408437493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gWigrlD0;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id o29so1432139wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IndEacGOAj6imIuNxvipUZS79utYWj8ZKBPHHszUveg=;
        b=gWigrlD0QEeajOkMhIxGwubSZm0pioh3zy/WxfVbl1GU4TO7xXJrLGFa4JWbPv5go4
         GKYelDLooTAZASJxoLAzVnnXpptsHcb37ivpfylRwCr1QlOfmMCZG2DwB9roT0G9G1L9
         0B/+DCD0PRCqW4mb3fqRnaFVclxP8QnCkA+gCoJpdkX188avbN60AGFATZpC2IrVPfcu
         WwfGLKhRjP8V3HzUD96C30jHt3+z03rglcpMgiY2rodeQxT6B3+Rq55fHtPx+PeWFyC6
         soCt+JfFwsruyHmaf7oPUBJzpMpIwCs3600vXF2AvtM+DnRsFehWu9UPhW4PTA9H9wu/
         EkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IndEacGOAj6imIuNxvipUZS79utYWj8ZKBPHHszUveg=;
        b=6OGlKcy1bxSpjB3JCoQLmk9lU9dt18tKk0g7kiFYmDbQ5j7i3Ple6COjXZSdtVwTyi
         OfEsb0xK72nP69feGGjF79XUbBPI/yJSUiKrshhqphbV8WOPYOK2De6kUkOn/LPbov7n
         xKBF9WmnaDy542Cpw3ZunRPFHwL9Tlq7B8cfXwBgcOmOzsldsFr15ITU3nD/N5JWFdUm
         JZUoekdbG1el/19qngykd8mPdOXrvJJkDq8o8DS8C53iVnuHgwcd6L/4qkLypLvJNN09
         Lurxf11SQIpHqk3AoRioSxHgJ/rwGK3O55lmqwCk6glwXZb+ro6biYC+njUt+u5qlPad
         T6sg==
X-Gm-Message-State: AOAM532pywj99h7R0wh08hIAU5z99ifNscHFtosSS9ivfXRorjpQxCOc
	B5aS5LFDnakdZXgdEh40K3tP5u8q1q6YAA==
X-Google-Smtp-Source: 
 ABdhPJzijr7ayrK2yt5IIxONi72egLU2niUnMt/zGt2FjdaCtKB8xPqVAPF18eP9LtvVgUUZBaqweQ==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr12008889wml.148.1637741310932;
        Wed, 24 Nov 2021 00:08:30 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/21] groff: mark patch as non-upstreamable
Date: Wed, 24 Nov 2021 09:08:08 +0100
Message-Id: <20211124080828.530981-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158657

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/groff/files/0001-Include-config.h.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.patch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
index 46065bc513..34fca1eb2f 100644
--- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
+++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
@@ -20,7 +20,7 @@ In file included from TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-
 We delete eqn.cpp and qen.hpp in do_configure
 to ensure they're regenerated and deterministic.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [issue fixed upstream with a similar patch]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/libs/libgroff/assert.cpp  |   4 +
-- 
2.20.1


