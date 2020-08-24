Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.197065.1598282149987569240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GRr0Xu8n;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id d19so4692472pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mt/UCM1WWwdrR4l4/zIMI82bbfE4MUDSOy0xtJgs7Ko=;
        b=GRr0Xu8n76/NOJ4bFdRGNL5fUMZLjTbhozgwBBpWOOPkAhAUPJIIHR1vzjMeCb1Umf
         x54K6OL4H7Y2vA7WsDEStFnuSmWOQ+yscvQVqeILh/i70EmLAsxOofwdC8RCl3Pou/wM
         AbOpd31my1XEVqW1/D+XW3knwkPL1iTTobwCHmTGluXoMxQUbt9c+2LjESQ3dpOjynKo
         IXJ4QWFJU4hQmk5wE2W9v0b7y8vH6A2XPjD/3gP0C6nGkhV7gCBzAofyUQwBlAKrWbSQ
         A04Ah0hdZdtERqMTIfgg2vDkKbhoDn1lud1e46s8KMRjyCiIOjOcSqlEvYolP+ilLm4A
         nmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mt/UCM1WWwdrR4l4/zIMI82bbfE4MUDSOy0xtJgs7Ko=;
        b=fiHfstQO9WnGldkzQ63HRJMQ91i68jDV1hxFzON4dqx4AkM9/wkvgH8gD6n+LBo40H
         8TelNxBAL3A4kWy2sqfLl93EyNgLrSu41T7aAuiYagrteXADKz+FFLuiVOYSppc4sAeI
         0Pw74OwsRLKMoKKFJku3EgFuOQlUB9WtCp4XTpnXDnM8Gx6PabtaLqeIWg2ZNoUj2Ssh
         +PNY9MOq1/tKptWm7Xg9SDHCoI4EQW3XvMlHb21qt5yc4WUXZt02RfCK6qJv6LRS5g9v
         U82hl2S9sO6tx/g7tbCtimdqroeBlPOCmudiFfnA1SEQdi3tkZaHwCi2mU5bfdbJMmrH
         Ij1w==
X-Gm-Message-State: AOAM531LtGZJxMzd5Hx7QWUccXZBPzMjrq1xKr1RXATpaLt+hQLwjDO8
	gX6O2+OpghpCDNGZGRkPbwPsIXXgxsf5wDD4mQU=
X-Google-Smtp-Source: ABdhPJywOU5a+R1+VhVKXhBSEXlIalpedco3La+xEM/NZ2MRcBHMNklPGb7RuUcv1egltVxutqRKnw==
X-Received: by 2002:a63:e907:: with SMTP id i7mr3880369pgh.210.1598282149105;
        Mon, 24 Aug 2020 08:15:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] alsa-ucm-conf: use ${datadir} in do_install()
Date: Mon, 24 Aug 2020 05:15:00 -1000
Message-Id: <da9571716c40fd8129e8c8f24f07302458b43e31.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Fixes build with custom directory structure.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 710567168eca3d9a580f768a82db033f1cca3cec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
index 469d1f7a95..a432d5de07 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
@@ -13,9 +13,9 @@ SRC_URI[sha256sum] = "ea8a86875f4cf430d49a662a04a6d6c606c5c9d67e54cb944c4d77b245
 inherit allarch
 
 do_install() {
-        install -d ${D}/usr/share/alsa
-        cp -r ${S}/ucm ${D}/usr/share/alsa
-        cp -r ${S}/ucm2 ${D}/usr/share/alsa
+        install -d "${D}${datadir}/alsa"
+        cp -r "${S}/ucm" "${D}${datadir}/alsa"
+        cp -r "${S}/ucm2" "${D}${datadir}/alsa"
 }
 
 PACKAGES = "${PN}"
-- 
2.17.1

