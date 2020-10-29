Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.9661.1603981698428166794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DoRL/ukQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id w14so2982296wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s17Jd5iDqOkSOgO+yld2jCjTmhorAcedDxm63sszsoM=;
        b=DoRL/ukQnMYi6Q0nzUCsBPzR6ep5AMLG9vJrhh8AZlSIFr+/vHigyTZ140pzWrDAb3
         KOhaCJb9Kv4DmPZde+vu2xhl576mTnuPOlbHr38Fii97fGfnBD7H1DszYoty/bgOrs0b
         tWD5mRDSJqN7mZeeejYmOFDla46vca+oxPMwtLUyIvF+mYp9aV856LYSgT7FEaHwz1cS
         Mt+BlZuFai3oDaaiZTYTacS5E4a5vdnShl+PKhKC9zl6IZCoYS29Zp50VvxIC2aHE9aI
         XpE+B3JVqN9BqQP6kWRHPix2D4fxDc4u+PTJef5CNo3nGgPQ+atQnmqxivwtLm4F3FFk
         HkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s17Jd5iDqOkSOgO+yld2jCjTmhorAcedDxm63sszsoM=;
        b=LEZQdWlvKlERT+ROTAyZtbUpiuQBZaoiJKIgCK7l5B+lh7jpJnfDOhza8R0Qkz2xu+
         gUVpFS18PnS8wkJhYCX3nYgrzaq/+srpFEIxT77Ynxdd9eTOdZhhvql4GLr1EdkwbDX3
         eK0hCkYhtbjyM0vH4kmkShuSl5hB17aK8DFkqrW4bmECuFHKEoUVYwJX0aaXev81+/en
         +oO9v7yE1qx+r/aSvh4IsrjQ4kCg/rLJ58uiBFwUXklpT5svcZKRjPe4H7UMft20535C
         t6pIX6fGbNnFMar0W4a3JmF6ndsBw3ZUaolxuhqzmJKE4brK2qj+XFxYRJjVk/QlcVCw
         J6pQ==
X-Gm-Message-State: AOAM530GYb1D3nH2XcKaPcHyyUwiBU4Dp15jrpnrs9BuwpDAg6k0HzIi
	xS4PLR6mg/GyNmasuEEIoi/7o/Cc5Pdu8g==
X-Google-Smtp-Source: ABdhPJw/PtHsPWqQwfZWBA/r1UG/OAIWaJj1Yf0xOKfDqF+BsqJEp5G9BwqBFpwCsmwFK4an084iKQ==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr5897841wrt.221.1603981696835;
        Thu, 29 Oct 2020 07:28:16 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:16 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 07/22] gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
Date: Thu, 29 Oct 2020 14:27:51 +0000
Message-Id: <20201029142806.1830504-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.18.0.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index ad3eabd0be..860b31106f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
@@ -20,6 +20,7 @@ RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
     bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
 "
 
@@ -27,6 +28,7 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
 X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
 
+PACKAGECONFIG[asm]        = "-Dasm=enabled,-Dasm=disabled,nasm"
 PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
 PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
 PACKAGECONFIG[dv1394]     = "-Ddv1394=enabled,-Ddv1394=disabled,libiec61883 libavc1394 libraw1394"
-- 
2.29.1

