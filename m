Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070FFE674BF
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 09:17:04 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.33474.1730452615228901606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 02:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDLrBOUb;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so15873735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730452614; x=1731057414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyhc2ZwSYuVOAzmGITmfsj2eCUf0mNkOkiJx5mDok3A=;
        b=EDLrBOUbmM1/trdb5TQE2vKwabtRJ+sueFhjyu1Zg9TOSSxp4aSmjOgirNmXAJNOew
         GY8HDVYbPBc4x0pcgEN5yEmiZYJqE7bczAFGQrQvAhc9QQzMDwhTPIN1LNTbAEsHhId6
         Ghl6oOdaZ6d9q5bZZXfcxvdhqvVMcfYrlaOXivPFUrRxchaS1/M6p5GoCiwliqiGGhif
         TNbkoe5ldIgwed3aVXC/an1fgnT+U16YKsySefWSfD8rPhs0TvsG99V/kBC1YmfKql3P
         CdoBP3TAu8tnb5KjJffgelZLwMYTW9BavplnkB03x0IwRCgodgkX8Oy8GgmmananEqlv
         jfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452614; x=1731057414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyhc2ZwSYuVOAzmGITmfsj2eCUf0mNkOkiJx5mDok3A=;
        b=XWz27OPZvj+zvQ8anLlEYogILjU6DORU7M/4u20n3TEsakISY9IgWfLXofSn7gQGQi
         WfYSpUVCkYH7gfFcT/Dq0xtYiUrt6Tbb9mWlDJ+D5EmU/It0pSG/pH/YSPIWCi7mlWx6
         zYzBvANRAucvA1uCyg6Qi8aiY6GlLQoiXIsTIuF4fJKsPpT//zKimZKu2p6pmcIi4sz7
         jl3dwGm9KU3pmowf+CIKBG/qumNqXZwdYH6gHJpXPQcmxuuUIDN2ORV5JEAyfpA+r8Lv
         y5gtBmYiF6FpV/0+h1iqri9MTYM1i20ov4dWKoYFnLdJskfAeahpzmPiXZ6gRZqXM4BS
         O2kw==
X-Gm-Message-State: AOJu0YwK7yKxnjCI96YNl6tathb2L9p8VNE9m2XGtAWTnZ914QBLpYxJ
	GrBmdfakc/nK8QkcD9pNOw041TleVmz7HWZLaQJjwH/44NklfHFyWp51qg==
X-Google-Smtp-Source: AGHT+IEEvq1bNgweCNsgMOGhpFe+jiWAtzsfDg7UguPPD4Fv4USFKMIXNWt+hYaZjrx6sJrKwj64Nw==
X-Received: by 2002:a05:600c:a09:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-4327b6fda39mr49693135e9.10.1730452613508;
        Fri, 01 Nov 2024 02:16:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9cab20sm82637715e9.47.2024.11.01.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:16:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] xf86-input-evdev: update 2.10.6 -> 2.11.0
Date: Fri,  1 Nov 2024 10:16:39 +0100
Message-Id: <20241101091639.2872561-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101091639.2872561-1-alex.kanavin@gmail.com>
References: <20241101091639.2872561-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 09:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206612

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{xf86-input-evdev_2.10.6.bb => xf86-input-evdev_2.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.6.bb => xf86-input-evdev_2.11.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.6.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.11.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.6.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.11.0.bb
index 60e325cebb0..c557e477ff8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.6.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.11.0.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "e8bd1edc6751f92e425cae7eba3c61eb"
-SRC_URI[sha256sum] = "8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+SRC_URI[sha256sum] = "730022de934cc366bb12439daf202a7bfff52a028cf4573e457642e25a071315"
-- 
2.39.5


