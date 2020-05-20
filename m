Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.14338.1589986746958646200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s6YKLX0e;
 spf=pass (domain: linaro.org, ip: 209.85.167.194, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f194.google.com with SMTP id j145so3192054oib.5
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLS24jMV/W1zl1m77TVPuD8rv+H+5j/8N98qo/YUVzQ=;
        b=s6YKLX0exkfhigFX0qV35IHk6v/Vf0Cw9pkmjDKVBpyhQ1vsefb+IaWv1iz+UnPbYL
         YPQ/fSUhejRRKjNkDvQOvJ5Lph85Id+QP+LCaj8mMO38OQUmljqw5HoOqr/mSAG7oxRo
         DW1MB7OgmCXIGJXeeIPHCgS7+WlkPNiRuknP+3uyPR/RlB0H6fKx2PtAYCePDXnl9+ET
         HQk32moaPw4gusqeTqIZqMG4wlvig0hKla2ajKCB8psWOjxT+zt0f+RHf4X3HWYzQCFi
         jXvbQEBoL8tJuLBZv1yyG9agr1RfLSgOvKdZsjdaSBev536HrHMUSO/yG1t6TcxxVzYC
         L5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLS24jMV/W1zl1m77TVPuD8rv+H+5j/8N98qo/YUVzQ=;
        b=TaeylcIp01j3CIvLfRMwMH8vfHF8dwx6EPIO3u9DCuiBFmJjMfTm9uj1sxzVh5r+4J
         HOjTB6/eeKlLCo36tQufj8Moa4/BfdPeINcFStxfHMkPJwbgEC4ficiIWdmp7WVsX+Cu
         /cCsWi1tpMdH5aLNd8LPubqRSWAb2xOj7vHt6ajRg8zx/fTJz16uX6QQLu5YY1njzVhk
         GfIFEnTUw4KQrwuTQc2nNG/Xr+45sFe79wW7+a2EvsIgyB79g/EtCv+el/yrgH7x6Ld2
         Y98rgWzi5d+7W9vovlxEtgUVd1vpvgIm1wXWOpRV4bp7/zjnf5I5BWg8lnJlAqRviUlX
         Sp4A==
X-Gm-Message-State: AOAM533cdTh/cgWzMssCui+8NZO88qScJ9qx8v43lX9wI5AXy0mBDINo
	Ou+nUn/ZLX0k3MrKYr2Y5Fww3hMfYO8=
X-Google-Smtp-Source: ABdhPJzYsDDTm8tT2dH1hFOAlsiuN75ENfex9/Q5sR++DaITbevLTGGvKa1TOiRrbOTSm59OwtpEng==
X-Received: by 2002:a54:4012:: with SMTP id x18mr2106759oie.27.1589986745876;
        Wed, 20 May 2020 07:59:05 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([200.68.141.41])
        by smtp.gmail.com with ESMTPSA id s198sm828174oos.18.2020.05.20.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 07:59:05 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH][dunfell 3/3] linux-firmware: Update to 20200122 -> 20200421
Date: Wed, 20 May 2020 09:58:58 -0500
Message-Id: <20200520145859.622161-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520145859.622161-1-anibal.limon@linaro.org>
References: <20200520145859.622161-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 ...inux-firmware_20200122.bb => linux-firmware_20200421.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200122.bb => linux-firmware_20200421.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
index ac7d6ec431..fa0507a88c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
@@ -125,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=c27d0c06cd5d376d8ab55860e65ba4e4 \
+                    file://WHENCE;md5=cb9a66eff0464b55335d3a7374fbc51c \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -196,8 +196,8 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "ac291b21f366ae2a37193ec8f14c39d2"
-SRC_URI[sha256sum] = "a30e811b3736a72b874ac27e10662f5e5409b1cadf8aab7ba88e8f8bc8083986"
+SRC_URI[md5sum] = "229a93395f4033da68429f165a62b952"
+SRC_URI[sha256sum] = "6dd7cba25d694c031f65529b9027cc8faaffaddfae70a4e3b58c2e4a0af3bfa8"
 
 inherit allarch
 
-- 
2.26.2

