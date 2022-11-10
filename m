Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65CDC43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.11.1668103984997024785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EMJv9yJR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id cl5so3438453wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpQzeIgqOOEFPqeZWTV1iqmiFzwBMo0+uPELIZ3ifg4=;
        b=EMJv9yJRL2Qcj4tL//w8/CypRytpkmNBGwLyYXTmy5fLSTt7EWQoR16kwIFLiD2Rx9
         eADTnSp3SoHKQ3dZyNRVfXSsiVFDselVgBaCMHMqDbLFLRgIKpOLgXSrrueQOkgU21wu
         SUlZdxG6En3Oph+46VOLe4CHorwJOUZKtD3ASQjxfI8ItcwV+kZ1gxIniXaP+g7WOAzQ
         jfpMvRdTNGZvaeCf5azNrmdKhZ6KIWh1TX/WR1mDetbqQ3iqIHeEibHxoyJuB6yV+69J
         nUAXCnHYiawY7yUYx7/5zF4jsP18XMgFFtqQtfBT+vFKeAzibrFF0uystOginMqTqUhU
         rsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpQzeIgqOOEFPqeZWTV1iqmiFzwBMo0+uPELIZ3ifg4=;
        b=TI6VZTRmVNJ7OqThzj+qHxaqkpVkz4He1SrAODednDfSGtGlPI0nr5nP+A5U9UkJG4
         td8wUS4L1cYoQSO3lXjqyb4C5J5Ddjj/lv8uxDaNbBNNdIvz8wU6G0p7Lc5R4JuLtpAM
         wxdelrisv9tyMgpnJbhUF7mjiMkwMpYIgVg5A01Dc3tH9V1sJljLLSQpi5sZYrfaNLWc
         isPs/MQnZiItLicobvF7ez0CNJTmr1gsXrusOX+XRKGbDm/lRLbIDYHyfBHAKJfXWiRT
         aSjo0mBaT+GXxX63W6gyakL4iNATFUWrPnTw2PgXtHTW2yL8XIgeg0tiV1SOFchHEIkO
         9fBA==
X-Gm-Message-State: ACrzQf0AUS1++/IRvSKWe2tQ7xyzI2O71oPPueC90zgrtguKATP+fNwj
	jIDHe1XEbj1XdcVDjWPA3GrD5HJNCVs=
X-Google-Smtp-Source: AMsMyM7M2BgbwSX8z0n/p3564LNCMvhAnXUENqnPzFA3KK5p9e6UIx/aCc5dUNZVNQRD55Y58brtcQ==
X-Received: by 2002:adf:dcce:0:b0:236:a8a4:37e5 with SMTP id x14-20020adfdcce000000b00236a8a437e5mr39952520wrm.188.1668103983420;
        Thu, 10 Nov 2022 10:13:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/19] libxmu: update 1.1.3 -> 1.1.4
Date: Thu, 10 Nov 2022 19:12:35 +0100
Message-Id: <20221110181249.1240200-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173088

Drop ipv6 option as no longer supported.

License-Update: additional files, path corrections

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxmu_1.1.3.bb => libxmu_1.1.4.bb}        | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.1.3.bb => libxmu_1.1.4.bb} (66%)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
similarity index 66%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
index eab3f07512..22632aa5a7 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.4.bb
@@ -10,7 +10,7 @@ second library, libXmuu."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=def3d8e4e9c42004f1941fa22f01dc18"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e79ad4fcc53b9bfe0fc38507a56446b9"
 
 DEPENDS += "libxt libxext"
 PROVIDES = "xmu"
@@ -18,6 +18,7 @@ PROVIDES = "xmu"
 PE = "1"
 
 XORG_PN = "libXmu"
+XORG_EXT = "tar.xz"
 
 LEAD_SONAME = "libXmu"
 
@@ -27,8 +28,4 @@ FILES:libxmuu = "${libdir}/libXmuu.so.*"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "ac774cff8b493f566088a255dbf91201"
-SRC_URI[sha256sum] = "9c343225e7c3dc0904f2122b562278da5fed639b1b5e880d25111561bac5b731"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+SRC_URI[sha256sum] = "210de3ab9c3e9382572c25d17c2518a854ce6e2c62c5f8315deac7579e758244"
-- 
2.30.2


