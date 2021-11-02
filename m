Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F2EC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.6554.1635842595928339439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGtnw+YW;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1481162wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=56QCg22qShxQ+7VfRNqL6reYP9N0hrAU8qXfqDjnc10=;
        b=XGtnw+YWDDMgBll6NlOtHhqZ0GkYqg4hQ2Cv9FyYkUiuQWUlg7d0HCPxYf6ea1aZ9M
         nrgqxnyKepvT5vdB25KDeYSUPMrMmY4N1yKV2J1JkZNT9b0WiPOFBH6boTw8CQhjGx8S
         yI7Keqe5q8LzX5K6Ljk+Khuhne22MlAZ9Q6K10/iF+7uhP2mEBEMQT0J68uNaP219AmT
         8y1IwXk+wUHLakhiuO8ZWz/8AAnybzhlRH0wxYIrkW6ntA1EuC85nFHYWO5cIPMeu014
         zYxn++OOosRZvSpk1B9BrJrtJmB1tlsdUsn3KOs13FST7zBtmFeQ5+5XL1a9MdZggwB5
         18UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=56QCg22qShxQ+7VfRNqL6reYP9N0hrAU8qXfqDjnc10=;
        b=Oaq0pt4g4oHCSB5Fw2oyOm7qpiBg7rCFW0nZhksoTVez/DOsrdLZ3GzTrRl2CKeE6e
         Srphgp3+8CPxTMO5OIGEb4oQao6ueH4+wCwFUtsneXeeTbnGzeq052/9lESWU5oB0jY0
         QqLXff3lHYhNIHAbnbybEoSUpzEhYd+NYofJ6gFa0lcL+pcami7oSKpe22xb9rdQ6Jge
         Leppzn09HfN0DBpy+9j+97Uht1xr/U8e2r6u0zG3WIFe5qp0M7p3v3LUi3shmPyYtBMF
         uC3gFweJ34esKzxDlauxnl0rie2ro8WIeC/6fQQCipbd+9sCvIHoY5DK0rxY+fhnm06Y
         SCQw==
X-Gm-Message-State: AOAM5331/LY0KvDcaC093ovQ4VSQ+Wa+oIRhvz/ZSoN1w6POPDyNYZrz
	wExypr6LT+3U0MpbJaXOSO9eB0i8GDM=
X-Google-Smtp-Source: 
 ABdhPJzycbCOhAWYTJb6mhjJXxm+6QAiSTSe5stcY7pmJxLJq1sPnY0BuGNCNovU6Wl7OCXDmZaBaw==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr5343914wmi.114.1635842594538;
        Tue, 02 Nov 2021 01:43:14 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/33] linux-firmware: upgrade 20210919 -> 20211027
Date: Tue,  2 Nov 2021 09:42:45 +0100
Message-Id: <20211102084303.2974802-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157753

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares listed

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20210919.bb => linux-firmware_20211027.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
index 48c01d99fe..97d42e98e2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=76f012f7e9b2260d34eccf5726374f08 \
+                    file://WHENCE;md5=d627873bd934d7c52b2c8191304a8eb7 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2fb22a5d7d23bf1f5800ab8152b39a00a445fbf4923de5a01b59d3f6253f0a9f"
+SRC_URI[sha256sum] = "bc2657dd8eb82386a9a7ec6df9ccf31c32c7e9073c05d37786c1edc273f9440a"
 
 inherit allarch
 
-- 
2.20.1


