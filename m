Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66917C54EBE
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9366.1672830360745063970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BXBFOWRw;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id d9so3991466wrp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ThaCRSzFAXkgZKuBekvz1UqgTIByuJaYYhv8l4+Yhc=;
        b=BXBFOWRwjsPzAoCs+CDP2+dVkKAvF1NTEgmNCtxunAOm514lwYB9t+1yU1o+WYUkbw
         Iv6aU4rESEL4/xOWUdDkgR29wsifEQsBS6HpMS4YJLYicUrETecSztsn4nGQvNMlwxq5
         hk5CJWmcsVE+r2lFUGQAn9a4wDzpe0LwtihTvoXOIYRaW+fW3x94u0s0AIbYKhftgXqm
         6ggiFzh0gb/KeVJU1kkXaV6cTF/3qiNb5MSmXU/kwnBA+UDDV3Gsl5giQBBu0Ism8wnI
         OKLXPUOz9I1Ox9QCki21eF2BvLZJgD/IHpbpwY9wBhaaJTXn9TLdg3FJXnnY5aZUyVn7
         nCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ThaCRSzFAXkgZKuBekvz1UqgTIByuJaYYhv8l4+Yhc=;
        b=qHBtLlkSh6R7hCsFpEZXgvF6cQ5ZpRWm1OhnmgmZny+VoaSfIhp3kgKCtZtfIdo42m
         4pCM97qpOB3NJCW8EelXS4tTSv4yzRF5hM5p1ORybAFLgKqQFWOyfyhQqQiTb2OLKP1U
         uUt19UDaMKdyRsq9MGKPgbntcCXzdAnc/ZHfKKFT0ux0uYVgVte5SGB7hMRdqLbcxxQV
         jnL5THBeoF7c+x3abFl40ftU8CZH0N7cvsX+uIQyNdrYkHS/GzDfz8ENmciIox5mtgFN
         x85ZwBBdhNTs0kkU6/6MB1oYPlR8Gdxl++VeYXWp6nyu3TYuCK1zPR00+UOIEiWmdf/w
         W+zw==
X-Gm-Message-State: AFqh2kqQRLoFOYReLIAmmks9AQ8WeTgYxFQ4vawhGuBFD0/FcfL1Qylw
	eC7hbfLxss+PQ9S11gTCWe1iiupdVTU=
X-Google-Smtp-Source: AMrXdXtkykrMb7qtK5B6WYZTyX+YqFXdoqOWiMjDH7LPDrqgpiOvErg1sg8o4UBxGKzot3tCDRsMfg==
X-Received: by 2002:a5d:67c7:0:b0:26b:445c:6399 with SMTP id n7-20020a5d67c7000000b0026b445c6399mr26344345wrw.47.1672830359153;
        Wed, 04 Jan 2023 03:05:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/77] xcb-util: update 0.4.0 -> 0.4.1
Date: Wed,  4 Jan 2023 12:04:39 +0100
Message-Id: <20230104110548.2537259-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175392

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{xcb-util_0.4.0.bb => xcb-util_0.4.1.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util_0.4.0.bb => xcb-util_0.4.1.bb} (51%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
similarity index 51%
rename from meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
index 6d0af2aa23..0da004f907 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
@@ -1,10 +1,9 @@
 require xcb-util.inc
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/xcb_aux.c;endline=30;md5=ae305b9c2a38f9ba27060191046a6460 \
                     file://src/xcb_event.h;endline=27;md5=627be355aee59e1b8ade80d5bd90fad9"
 
-SRC_URI[md5sum] = "2e97feed81919465a04ccc71e4073313"
-SRC_URI[sha256sum] = "46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9"
+SRC_URI[sha256sum] = "5abe3bbbd8e54f0fa3ec945291b7e8fa8cfd3cccc43718f8758430f94126e512"
-- 
2.30.2


