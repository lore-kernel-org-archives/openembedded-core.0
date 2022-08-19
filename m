Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E41C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.472.1660894074839236359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fusdXbJo;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso3706270wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7jOQp1Vbwjjuv07L3GYbNHWCKcAosTyjbGwNqL9AeWo=;
        b=fusdXbJo+X11odgExoXC12tVfnBnC3M/eAY/QIQKK0sZIKl+N7NUEiO/Xoj3rvZt4C
         BnCRKKyaZwEuxmp/dLug7b23Agyhpoe4mU+SZ75wD3X5dVTX1SZC3x8b7KaC2uYAGzL9
         YwXZoVw6Cu7gO3piqYovt15sUbcK1j5E6EzFNVLZVfqH6HEe3t/yvxKykZeTeG0Z9f2u
         81GIP8Tptr25f0Qv1BOiBuEBe3dx25qZhbDZVE1W2rmltXe97OmwLatRvLQY4HS1JogM
         Fjclp+Py5zGfYe00D5rUj6x6KGRkHfVXsW0NpHB55YoJFJhC7jE2+JhkOWI8nPiCI/bF
         2zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7jOQp1Vbwjjuv07L3GYbNHWCKcAosTyjbGwNqL9AeWo=;
        b=XwNbFVs8uKjM9ZhYTsXYxVMtu7KcmbsZv3TqTecYSQoIbhvg4zeU4moLZeQIX2NIy2
         URaLGWVUwvaAkCSwfcngdPQx8JXo9Z749TBMYgu+Lypi9ZtnuWgjd0iFZPrGFas0/qST
         SmWPmUK4Y8tB4oKrwhbowyHN0YSR4cON4U42sb0490SkjaiO7+Ad1uOyHAoQDEYqCz91
         or6oqxIF1LYdj2jQNs3jWqvHizPU5uCZEZWW8cJ5aEhAPhJzpROFdJrG2rEx/A6z4bXm
         KAgzrf8pv3v5W2iTHyuRRRjSl88nBtxTdl3AxCtCPFq6+jGKStnk64Z7maHLXPalT9KG
         n+wg==
X-Gm-Message-State: ACgBeo1d0dcpx1/iF1Aw2hGV1xJuNehISsSpfvmOfoTXdwfwsSb+6w1C
	9eAKx8g/MtUg9wctkIrWTsITWbGNUjM=
X-Google-Smtp-Source: 
 AA6agR6dYw2n+OnnqP3nNBTIhooj78su3swxNR0d4lvO8APq/Mozn9vSHms+cqpvlEehOyIXwmoBuQ==
X-Received: by 2002:a05:600c:ace:b0:3a5:b495:854d with SMTP id
 c14-20020a05600c0ace00b003a5b495854dmr3843053wmr.86.1660894073359;
        Fri, 19 Aug 2022 00:27:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/42] xorgproto: update 2022.1 -> 2022.2
Date: Fri, 19 Aug 2022 09:26:54 +0200
Message-Id: <20220819072727.2236928-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169580

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-proto/{xorgproto_2022.1.bb => xorgproto_2022.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2022.1.bb => xorgproto_2022.2.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
index a1e852b9eb..a1cd66c744 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
@@ -8,8 +8,8 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
-SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1d2dcc66963f234d2c1e1f8d98a0d3e8725149cdac0a263df4097593c48bc2a6"
+SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
+SRC_URI[sha256sum] = "5d13dbf2be08f95323985de53352c4f352713860457b95ccaf894a647ac06b9e"
 
 inherit meson
 
-- 
2.30.2


