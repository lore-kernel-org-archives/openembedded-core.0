Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7F2C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16.1668103992700140802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxddFzjW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1717015wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YdGkDBB+4/Awr0zTV8zLcxFHiZD07jvv3QSrKLGqGM=;
        b=JxddFzjW8eM+KSSzTDB7zH8Rd+ZKvEZglCBX3bhuYqRDwR2sncgj7rrHdyZmzG0ULJ
         ert8EkXrLGXMkGvUqN7NbSL1G5ntGXINoRdzPdSX+84vzR7iSQuRzj1B6XwDqvn6cm22
         N31AUTtOBVVyaxNJOfkh7fuo1bjAEti+EgF8fHy66MgigaWR8J2lcFsTdOHyDenVPoVz
         hPLnPspGMfk0fZO/vpJtUlkHBiY15Fdiqo89MpiUYfsWFw69+slgN5jEJG13r5poyA++
         494Wrxo3dpu039X18ZV1QOkjmEwm9qPYiX+9RtkF42lTpUDfysVzipfGjBf2dTNKJZCP
         legQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YdGkDBB+4/Awr0zTV8zLcxFHiZD07jvv3QSrKLGqGM=;
        b=Cp58tJbG3ZmodkD3Y1QF7FMb9HZ+stRDC0kMB26YubnfDZ/X7DK5T/rvEdK2mLMe1w
         vmB4EYgst+L8VIHIm+61dddEuUVO4Jchy9KJ6/J7bMY2feB0ZHJb53B3zBv8/ejiqk3N
         jBw91lrjXbDMX4Ab+KRFjO9nERbqDeQYfpJeBIbUxinhpI2dBmiGQ8A7rKtbjogIvonD
         O1gEkw04Qwx9cpgutFnuZmvehD0W/lY/rbSB/gvk59DBBZCJ2F0sTvG5epCPj6xcyJ9S
         OJc5LysbHlPHRyHqF5eYLKbzQow6fs8exlxJtsSwctU6+hq0UuF11ERv3ATiPelCj5BR
         Nlog==
X-Gm-Message-State: ACrzQf28dezHRspUnIkiI35cJRLxyDKPhPVvj9dE1yAxenQuuoK+eWoE
	jWuH0Dszp0pBrgLQ5BtfWKUD5SEiq7o=
X-Google-Smtp-Source: AMsMyM7kV5JjtljMNRvGQ48j8A0l5v59/Nw0t2lExuIK4Xal4MK48UJYn9N1G1AerCjxRGtyTPyHQA==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e76:9830 with SMTP id 26-20020a05600c021a00b003cf6e769830mr40789611wmi.159.1668103991160;
        Thu, 10 Nov 2022 10:13:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/19] rgb: update 1.0.6 -> 1.1.0
Date: Thu, 10 Nov 2022 19:12:47 +0100
Message-Id: <20221110181249.1240200-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173101

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/xorg-app/{rgb_1.0.6.bb => rgb_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{rgb_1.0.6.bb => rgb_1.1.0.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb b/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-app/rgb_1.0.6.bb
rename to meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
index db287a5b57..f14da7fd21 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb
@@ -10,7 +10,7 @@ DEPENDS += " xorgproto util-macros"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
 PE = "1"
 
-SRC_URI[md5sum] = "eab5bbd7642e5c784429307ec210d198"
-SRC_URI[sha256sum] = "bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b"
 
 FILES:${PN} += "${datadir}/X11"
-- 
2.30.2


