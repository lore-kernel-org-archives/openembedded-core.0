Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.18957.1603023027917295817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DzwBlZGv;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e17so8282521wru.12
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8t6xjQL/oMbt04MteAK8dLTiMDioricLiNiyAGhjzRI=;
        b=DzwBlZGvlrVliDVFzu3eVzo9mCR4+AOCd8VhyHyL1zHC4n7iFpdXUV0QqkV2jk6vFS
         Vw8O4dmQgVo2KL6mHHR34yz2mMyYmR010hCdJulwRTed9eHKw5nOXhckn1WoG9gJ5J14
         q+8C4qteEnP1vHGa4yqjWJp6wVNRAUfsnYkeCe5isy4VQYufiFGIlWe+a1V3zwBA1TGb
         IVZHnSZt/QUHNSuM8uBkUPh5u3bMaxHmSwOpmpkhS4CEdBkaLAmp6eCmlFz7fzBeH/Hh
         HU2Nrpi9vSGr/vOSN4+1zTWgC5BQYjPG7n4eby3l7DYhkj3+Wqe50RaarhwMOTxSNoY7
         1oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8t6xjQL/oMbt04MteAK8dLTiMDioricLiNiyAGhjzRI=;
        b=PTxoMUUhSToUe/z3Ca5nFXG8yKvFyQBCLcZmDjH8yS6h2rQsIBD12qF2VGg5f8Tn5w
         sdABtAWH4jdjkWnglSTTnwEDpfGCmJheLY4Yq/20nf2qKGfRtZHr4GkFIAqe+9UV64PG
         y59pAH3thH5KRtnF9Qbpo53AhURdTsU/kfMX4ZXB8VlYShg2U1MV7XHW84GWk/dZcKSa
         la68Xtjoj+Y0kvd/9G951pXe/GEWB30437759tYGTQdQygSZ1zmTJhXbCC52tgz1llIw
         CD8KyTFG3HHMnAXhI0x6LVIOcrrfThIxEyoGu+lTG0S5PbFHRQAfuJIablPAHwUXFWlD
         L0/g==
X-Gm-Message-State: AOAM5335esjxUOKSJymtmgkhpXe9KS145daOxExRVTe42dHiYU3CG3EB
	7Kc1W2np2FrJqHIFy5a+ADreV2H3fTzqgQ==
X-Google-Smtp-Source: ABdhPJwea3WnQxAd3lTtGfATGMsxBuDZAK4zpoElV61zo8Fv8aFvN2XTCqOIk+Agl7Zl0uRn2GUHng==
X-Received: by 2002:adf:9e06:: with SMTP id u6mr14568686wre.208.1603023026164;
        Sun, 18 Oct 2020 05:10:26 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:25 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 07/20] gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
Date: Sun, 18 Oct 2020 13:09:49 +0100
Message-Id: <20201018121002.1417335-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
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
2.28.0

