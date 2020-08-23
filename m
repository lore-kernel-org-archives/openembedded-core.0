Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.181968.1598214100096855037
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KoGtvMLN;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id di22so6251608edb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZSm6PbmEyw5djJLZpb++GvRwf7laD/gcvaRHo9KcdhI=;
        b=KoGtvMLNuLOjQJIr+LWDmowIuryWTwOI4cZkvT6EdES09ii/7sVYSWvS7t7e1eX+yH
         qB+WxReWVjjgwy1S/g04dK9lc2sjRo/67TWwJ52BSIqV34BhNLYZ/bzIRyDA8bmcC4LY
         /C3gsk4qYJBhBQNM0NV/0ZMoWyEhp/TzzIK/Mde7jj63/j+9zyI3JAxKb1oj8uYLx4Xe
         nHDMMJymobUSxxdyt6l7i81Np+wtzrEg48127a4worrfThB83J46UtXl+Y+KTlPGQBEV
         bnV/PakFASKY65G7IyC8uYCnFQt6cKjNdnu9agQXhnEKK+X0o9BpnMRa10mIoY/rsf0Y
         05/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZSm6PbmEyw5djJLZpb++GvRwf7laD/gcvaRHo9KcdhI=;
        b=sVSomXBu43b/kVTfGDBUAbvacZGxJiKEMKrI8PMMkHoZIlitVyQqMiPZY8WBKzEXjt
         ovEjMgcl8BpV5Gt1nYwfr9jdL4hmDU4MlWog0DSeeOP/SBkhpAofQRZwZT+geNef3tOf
         JAH1hPPruV6m26pnJzhhSPBzCV60hNT64luwY49S9++b6DZBLEY+yfzsvlZ8MJSMYLz0
         H9td3MXfZA/G4HoRjB1TdoLiuO7izD8zETEtxCii217Ba3SuLcgWxBHjqILdrGNrc3+D
         9IRiDmHhtS2WogEYU1qxVCM98/vuqpSen75f8opd/EqmCJKUEaoI88H0SlCvu044vBu6
         nafg==
X-Gm-Message-State: AOAM533iGt/TG/C8C74W4az/3sBnej8gISt7revtfOsfoP4X4hXuop/v
	g5cnNO3gPRKp0fWxq6qsMdlR8mEx460=
X-Google-Smtp-Source: ABdhPJxvUsU23ztHsUDC6jBb4Ha3GvdMq4iKZ0HdMpu3dTlSWwDGSbOEcyloFDKpmZuVJWz6rHgtjQ==
X-Received: by 2002:a05:6402:1545:: with SMTP id p5mr2504200edx.388.1598214098309;
        Sun, 23 Aug 2020 13:21:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/37] linux-firmware: update 20200721 -> 20200817
Date: Sun, 23 Aug 2020 22:20:30 +0200
Message-Id: <20200823202031.24686-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20200721.bb => linux-firmware_20200817.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200721.bb => linux-firmware_20200817.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 659534521e..22e71059d8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=7627a0ba9a78e7e556afcf15b0971016 \
+                    file://WHENCE;md5=4d229f79f8770b5b2c4aac655b9fabef \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "898c334b0da7de6ea173899beb696fad647dce0c06960d7368ba4d4e802fb860"
+SRC_URI[sha256sum] = "76d05d5f1eff268d3b80675245fa596f557bd55ee2e16ddd54d18ffeae943887"
 
 inherit allarch
 
-- 
2.28.0

