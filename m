Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E33C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:52 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.32837.1635699531142949632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zMdFEtcA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id m21so15005738pgu.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sXuRLb4cBFI9m0OBvK5wq5nUJWAv3dl0En0PIjwYfnQ=;
        b=zMdFEtcAJ0C2B6uIO+EH5+Sd2ahxtHWmRqGQr1C8q/zzlH9PFVqb2kRPka8T6RAgoO
         plptgIyvxAvrGnlPcT0+V27OjzDKCM+/T4yzBGm8i89PIFFjU6J/F6fiV22wxjfX+WZ7
         dYXqyhZcY1ts7/iVXFST+WUDuG7CTQULxRT+Yw7g8VcpkKMy+dTGKNhZajg0zxbX91yK
         /9OmT37H2EyNXhKQAcM9YvST/ba9osazMEb0HxDwhQGt5QspgwurQhKMcMC8iK5/Fg9y
         aU6JRQxOfV16OPUJFcdhkCIJT154GYU+E/0rGWutesM/VNv/HiJBYiEqFdZ3AEiPExe8
         5H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXuRLb4cBFI9m0OBvK5wq5nUJWAv3dl0En0PIjwYfnQ=;
        b=IDhCCST7n2jlScPmRayQOvb4KYepymuvPRy+BynAe1VJ//X9B0MkWeyTWiKqdSJvU3
         TeaLIEWd//ZsHVayf9KQ1m/LM9RbIofGHJmqZRJco4d/AX3G+FGW4Irdxf/mlafBEALp
         NMLwvguoY9qZQLWeMeVjiAyB9gBpu/EoAOSlBP9oVuEuh2uiPVhOlETX/McIJdat3jub
         fm2tXExgiFdE42ivwMBJkkL4h3CJ+JWEkW5yc2pNWZ/ZpvAEbR7vqIk0R6IoNEKDr9Ac
         ZqaLgcQjM50OLkA70uCFclO2zg//ibKp1wJKJF4HtdW+O1pZP7xv12TzVxndV9vWK8Vz
         8r5w==
X-Gm-Message-State: AOAM533KMhYbPoXgz0ry1zRV7y5V4KDmZnXIMPrLkisC0YLsqyka8sey
	D2wgnpCEddXFNzOIxcmOa0hoHuRu3GSl5DLMYxE=
X-Google-Smtp-Source: 
 ABdhPJzkQEeAf4+uBZunyiR2y41ffgj5TefPF3tnQq2AXq7dY3b5/MqyBMCMlO5/xFh6uxX/Q4k/2w==
X-Received: by 2002:a63:b94b:: with SMTP id
 v11mr18090378pgo.145.1635699530321;
        Sun, 31 Oct 2021 09:58:50 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/29] linux-firmware: upgrade 20210818 -> 20210919
Date: Sun, 31 Oct 2021 06:57:43 -1000
Message-Id: 
 <b09616804e3147e8514dab4bab84dd260c93c9f9.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157682

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8dac57dfed45a0d8a049473f2efc1711b56273a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20210818.bb => linux-firmware_20210919.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210818.bb => linux-firmware_20210919.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
index 7f6db18b69..03eb1a29f0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210919.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=15ad289bf2359e8ecf613f3b04f72fab \
+                    file://WHENCE;md5=76f012f7e9b2260d34eccf5726374f08 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bef3d317c348d962b3a1b95cb4e19ea4f282e18112b2c669cff74f9267ce3893"
+SRC_URI[sha256sum] = "2fb22a5d7d23bf1f5800ab8152b39a00a445fbf4923de5a01b59d3f6253f0a9f"
 
 inherit allarch
 
-- 
2.25.1


