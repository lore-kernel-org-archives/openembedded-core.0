Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C78C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:30 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.53142.1638136709923134714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HzOCPZCl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id r5so13837039pgi.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=go7dt7SwloHohFLwYGlGD+9vQX/CewhIM9xYGYzwYn4=;
        b=HzOCPZClbzPMvysLsPRagE77JxPhIUsPvwU+TWSDvIeDEA4EO4pm9nWxcSW77+X7FP
         iIUCSQRw/IqA58AzS33L5jtQuTXT4p8myZtysVwDJnnN+9drBuENuJrZ3BMKEdoPFoTB
         CAsBHnXytZNuaSL6IhOUov2dsDnFXgxDw0yXMC8HSieyErvj5ubzl2UVkzTpwx9EJzHM
         Gi/7U6B5otXWwdfA4RBqHFpHkB3XqOwSETu1qBgGRT1g1eK4PF/e8YI9KX3I5zWbZWIS
         iF+8KBWwKPbdW8nOQsbqiwNBVqaGBd+spLttO5s68pd+psaDQizy4dyYQvAsOdsGSRH4
         LMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=go7dt7SwloHohFLwYGlGD+9vQX/CewhIM9xYGYzwYn4=;
        b=1hTnaCNJKU4EXIMQeS7tYFIU/I64ZYyYkLk+dzY9CiwahaQpICKs0CvNJfzC9MQu7k
         lvxf1glOWO2tMwQdGQgT443ma5cHy0G99ThYUNDIjp3Cn4MBId9KnRnElGqzXH60ZrOl
         UQSODW+U8vjspv3x3L2O42CQic/K8jZpCM8Uexe3BYWB2ayfXWb8+skT12eYBnA2HYFr
         A6qQlylUZ0ETZQZhglEDm9zxqMxvqSF++91roltyZuAIVI35q+Ihs004LA4focLJ34cW
         w1/jJRJ0WJS/B2oQVn+OLxTRMBSyxrsX8kyRK8LyWtK0fi4h7oija/DYK33Y0Wg3bcu3
         +ypw==
X-Gm-Message-State: AOAM533I2jqOkI5V1bvwOZZRGdlWR62SfI5wZ/0YozHrxQYCEPIeBSOA
	q1Ws3ebbrs3cGx83R8UG8KqNrlBRfwyki6tar/Q=
X-Google-Smtp-Source: 
 ABdhPJy6pDkSRp4TlVd/mRcK0UiAF4QHmUYcZrXlkF3b943sgVMNFu5FgJCqhd4DNyiaDzrk16vzaA==
X-Received: by 2002:a63:5f0e:: with SMTP id
 t14mr17486020pgb.107.1638136708701;
        Sun, 28 Nov 2021 13:58:28 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/42] linux-firmware: upgrade 20210919 -> 20211027
Date: Sun, 28 Nov 2021 11:57:17 -1000
Message-Id: 
 <8c1d5f39be281833dc05a16674e48a3b704b785c.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158887

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares listed

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ca3fb1c7f11e04bf8d8bf59901ddd60178cb13c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20210919.bb => linux-firmware_20211027.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
index 03eb1a29f0..76aed9d443 100644
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
2.25.1


