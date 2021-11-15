Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703ECC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:06:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.22561.1636985194362859434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 06:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TtO5MRxD;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d5so30970391wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 06:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0e33qIoMKhbBr0zXMee0GQiEWlVs+B6hR2U2C5pZwL4=;
        b=TtO5MRxDyvnhmtVzPa4TafgoRQOhiQA2OpfhB4tBxDqzSb0nRdP3a1DYRUEBTzqx4m
         Vud3wTVN5YwoNrUMgpuPKHj5PiggH9OqBLgcYrZwP7fGV0oXrcmoaTLLC9RwxDlxM0Tf
         514oFrkk4tQluGNg6anLm1G7GmR+w5uvKN9kKhaPmL/PlsJQtJhMxz+JLfJzGxWZCz1a
         pLTkACUZRr4zT1cSdSMOyiZF1/ZvyrETPBQCucFPMtzzNb+/q0qnpzNPAm2/XLRtVs1O
         fR412fE82JcuY8V7UvJ30rSVIkROM0RCFJqnZMQAeAB8/LlcOnt0/UCsQ5Gw5O9a2x0U
         /Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0e33qIoMKhbBr0zXMee0GQiEWlVs+B6hR2U2C5pZwL4=;
        b=GOqv/O1UIA/20t7ZrP0mDOJxAPuMj3hxwc3/CeKnfrYdrZWSBn7yJxiWXsz+LQjWUK
         xygvA4Qj2JWQU0Fz0pA63CJ2GZJo0RY+/Rvju0cgw6uKhDq4Ey+gtqvkrJ+SE/5ijD8E
         meoO7JTKJe/I8Su3kbVmmO7tgWqzSPmiWdDxKLzY3vJqmxo3ToeMxbPWqLWAA0H17K7Y
         OQkLp5jo5PwlupUIwVA4Cm0KPXHzNmSs0EoDy+nUIKCqKQbIIXswGOf/4fR6ZaOaA6Tc
         fm3QNAObH4wiX1d/uAgmO4blZLVs3qFTb0avP+20Z1Fl22/YCbiDpkxSzwF1oXIg3QbK
         kGVA==
X-Gm-Message-State: AOAM533p2Bnvlrukf095HeG9x8jZtawr6JWYkUfzSTpE8+0s4ve160+O
	K9SC0DPsuLYDi4EdW7OVSVh+pa58ox8=
X-Google-Smtp-Source: 
 ABdhPJyroaR8ks5UsOPkMCG8PrI6UM56OoR5M0SQIAJzChcZ/LYJk1N1UnNmqeIi8be+Jfq30jHV9A==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr45416907wrt.91.1636985192530;
        Mon, 15 Nov 2021 06:06:32 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 126sm19562148wmz.28.2021.11.15.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:06:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] spirv-headers: PV should be 1.5.4
Date: Mon, 15 Nov 2021 15:06:30 +0100
Message-Id: <20211115140630.222488-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 14:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158293

As upstream hasn't actually tagged 1.5.5, we should
continue to use 1.5.4 until it does.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../spir/{spirv-headers_1.5.5.bb => spirv-headers_1.5.4.bb}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.5.5.bb => spirv-headers_1.5.4.bb} (100%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
-- 
2.20.1


