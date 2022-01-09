Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F283EC433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:37 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.23594.1641765877001648699
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YEJWUwVa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id oa15so10853847pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7MRIhQv2IMVyCq1Su2FcE5XZU2KDnUD9nYQRvFLVrr8=;
        b=YEJWUwVaYfIx4sAOa5+xPPKXWXCtOc7Je7USuEe/2v5joGBvjXUyK3SYZEszUr/sl0
         uL4oaeRrp6lpddBzbuHlvI6K06Nyy9Z/suhtXToaqO9g4Jpc442BjJsUsnTMZvQu5bCn
         mmnuDJnwhB51M/uJ4CLckflps//NefkJf+8fUhqPxfjffCFQACf2GS6yQDvfv1zicNH/
         qJKThw68LvVawdvNMuR349Yecc3X6NOAtWCCSm3H1rIE+qNika5mmM+m3bGCjmUzBdM1
         CooASRocDjPPQh6D/P9f2FSa77LtAE7bGPNP6asFrv+qOIL2YnifeAULIqFxOnehPtdg
         VZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7MRIhQv2IMVyCq1Su2FcE5XZU2KDnUD9nYQRvFLVrr8=;
        b=5jSUK4rE9Ldm5KPfn3hHi/vA5yerCsyFN5+vW++4I6amUiebYp9sP803z80REZoAqq
         uGShELQVBDq37bA3JpZQkAFrtAaMcKUwT5gUJWw0jkPPsCzCs06zktWfXr+U03XSWfgc
         n3GzvpNCwk0u5hbUz5fQ5+hmwsBDaVhfXiJVk4vE5uyT7bLDDDdnM690MEQUaml8GzEe
         tSqSkh8MAfu+SpvzKF5fODPU+j7AIzz726y5gC+tBw8WY0nhV+JcwZ8lkAGZ17BaG67k
         dxQ2UER4i749Q1O8FOvXAxlDlJZA7vbREbjrjbybUStSOVaIsL0BJxSqnG48VMH0dZ2y
         P3+w==
X-Gm-Message-State: AOAM532Ui1Ppvp1wSK+DwZQuQL12Xx3GYRxWaYHPEpT7ZN/cS6+ILKV4
	N06Vc/TbMktobdn9SKFWf8QMjXO65D8o1fTokoQ=
X-Google-Smtp-Source: 
 ABdhPJyFdOdjLGzsuwi58/+w2IaCWobAYd3NHuyd8Q0HIu3HclUqLPnHTcTPc9fZLFE9NpEwMy7/OQ==
X-Received: by 2002:a17:902:bd05:b0:148:a2e8:2c3d with SMTP id
 p5-20020a170902bd0500b00148a2e82c3dmr71434783pls.140.1641765876056;
        Sun, 09 Jan 2022 14:04:36 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] linux-firmware: upgrade 20211027 -> 20211216
Date: Sun,  9 Jan 2022 12:04:06 -1000
Message-Id: 
 <904eb89c0ff22be32209eb0a8a569911f1969673.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160293

From: wangmy <wangmy@fujitsu.com>

License-Update: version of license file updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07dc668ddc50de14821aff1b6850d8b4999702bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20211027.bb => linux-firmware_20211216.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 76aed9d443..92b6ff5157 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d627873bd934d7c52b2c8191304a8eb7 \
+                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bc2657dd8eb82386a9a7ec6df9ccf31c32c7e9073c05d37786c1edc273f9440a"
+SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
 
 inherit allarch
 
-- 
2.25.1


