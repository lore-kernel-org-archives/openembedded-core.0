Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83134C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:08 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.11009.1645452907442529913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ezDC+vh+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so3411284pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1ZkAM3sy2v+H34THgGVfxzIdCO4GPo7AO7L/nsq6XS0=;
        b=ezDC+vh+GSstUEoGJshRgprpXeGLQk1udTTSXCqSQgeuRCfOPQKk+5gy/mmi3Ox5za
         WPdKHWzz64/jqbvEHiwnqG6vrfm/oJsOzuJiE5b7rt8ivct9qXAd7MN7L/N6lMKXW4Gr
         MGr3HR3y0my4p3+OLxSKXxEWEH89G7KQCTAoI9IrdhQpUgFEl3DFcyGF+Fg6YVOrObst
         92D7Tz9E8KvlPgby8ZjAiUMH61QTxtFumwaCzmhlQjnhKs7OKCqdYA2RId6Lbkynugxr
         LT86ZyNpleDXUwzlltgEezxzaXJ675/UQ7Gz72qxVEKjvhCYBy7aZYGGoRAutc05yGvP
         xy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ZkAM3sy2v+H34THgGVfxzIdCO4GPo7AO7L/nsq6XS0=;
        b=QoiHydk38Kn8AUtfrAepNzIQZJRCHbA/M4/stgSAjMtRNjAMXYluZxxsfrqs3g9kw3
         Ou4TqDPNc4Ced4DszS4sDsu6JN1ZXNtfokZd7WeOzWrB/TEWC5bt3GVMu7x+n4dl1C8D
         ENRD3OFxEDIZNmzyoIwLKVdjH5kTCHLFygFK/NvkVIy2ShVEJzJuEOzzpiRTsoUXAhm9
         H9EkBBNJf74dosnkR3JuiXOC0n1TswjFCBcBWEfL3i9X3t2zhh3io2xFM5K8RcILxjhR
         +kNayJ/FHln5hW2b9c4aRPqZTofQPNuJ2vMWGAFqdJLDK8tAa0QEJf9a6BqVFE7yIru2
         zvZw==
X-Gm-Message-State: AOAM532VGk4HKX++Yve0Q5HMoh/u+IpxGJcOffPFPQMj7CCCKZZOGRgb
	nQgbtrZfLyl9uvIkq2bOIe6j6ljdXRkHjOEj
X-Google-Smtp-Source: 
 ABdhPJwtuM5bqqB8TI3m2M0qH4bJoLPUjih+peEqa6MSCgl5uM/hdrsW1O3pIkoIXN4Keu22MkMQ7g==
X-Received: by 2002:a17:902:f549:b0:14f:a0c5:ced3 with SMTP id
 h9-20020a170902f54900b0014fa0c5ced3mr8440132plf.57.1645452906525;
        Mon, 21 Feb 2022 06:15:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.15.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:15:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/20] linux-firmware: upgrade 20211216 -> 20220209
Date: Mon, 21 Feb 2022 04:14:15 -1000
Message-Id: 
 <a28a6d31e84f59c4cfe47ddbd28bbe258d5d094f.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162045

From: wangmy <wangmy@fujitsu.com>

License-Update:
Version of some driver files updated
Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a2a64082d2a4845bebe802afed2a65dac994043)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20211216.bb => linux-firmware_20220209.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
index 07389f6982..9cb357fa90 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
+                    file://WHENCE;md5=ed3d7426e4df06fbadcca24ebf00cc5f \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
+SRC_URI[sha256sum] = "e2e46fa618414952bbf2f6920cd3abcddbef45bfb7d1352994b4bfc35394d177"
 
 inherit allarch
 
-- 
2.25.1


