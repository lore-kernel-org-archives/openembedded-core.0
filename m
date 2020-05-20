Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web12.3209.1589998856781262757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 11:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I48QE8DA;
 spf=pass (domain: linaro.org, ip: 209.85.167.194, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f194.google.com with SMTP id r25so3825861oij.4
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=smv/e+EIb4mVyfGtNir0FcKHVnkOKbeejb4POOTYDr0=;
        b=I48QE8DAOOpFRzr5/KdSxUNbIFeF9SPrVemgT/gVLti1e0xsNO28sYrnnWmpn9IeLi
         1BtPMEFV1Prhqu4N2eVPHmouOaagJ5Ky6eSGN6K4+frc9gCulKUo/QImUMk02NuiN6hv
         zUsMa5Wv3+ihR++FYdHJXYfAIrun4hCMjrNx0/lHp2/l6PdDG31rZvs5CBgLmXOCwlBG
         QLzgEr64n/2GeZLtcYB3iWST8/ICvmji+B/dtp8HybVClw7UH0xxO0CVoBO7otRm6nbz
         MN++j+qGyVsBJvQzCU2nbFB0BjwouZuYhJWSCghSgL0H3JNc6F6HoT67blRKmc0nsse/
         9gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=smv/e+EIb4mVyfGtNir0FcKHVnkOKbeejb4POOTYDr0=;
        b=kF3CzwVjXJoILDdVEi8l+P7UIKsryAxj6TthRFumRPSy8+bMxyrPKXYbXGE7pN90pN
         yaI3VdesgttIUiY6il6IpHBx85gP6mwU9JD+Lyi44DvgmePlMV/Nn0bBVDkoTe82lDfy
         uVFDhb2FK/ZIJiYMQvkT5pQO3jE5xJGtuXt8igGUZ0ygs6KRGewUER3UZXFqdnySCF4V
         /dF63P31tF9tH1ySUsT7x6PXH84zMfR6Wa1koHVvOsxJwCu0Yjs7Fw9DFCSns5zuqHPC
         ScqKDp4uzzEUJJlEzcm6WQQsT2TMd5dXSDV+MjhiVDW0Qo1iBXivoyRH45wyEETaJn6l
         AM1Q==
X-Gm-Message-State: AOAM533lbn6i0hXgRlDuTsE2DQcPv38fYS9/3E2wLAQn2wSBkJrS88J5
	kCGbi3rJmTEonMK5iPK7ZxBdYdmP2xI=
X-Google-Smtp-Source: ABdhPJwNlbkTuPKVmWBMrGrtP5M/705I45435g03+s3nozehNE6KmHAq3oNSnTzlGz/keTqNmt7BnQ==
X-Received: by 2002:aca:ed44:: with SMTP id l65mr4090421oih.127.1589998855875;
        Wed, 20 May 2020 11:20:55 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([200.68.141.41])
        by smtp.gmail.com with ESMTPSA id b19sm986589oii.1.2020.05.20.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 11:20:55 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCHv2][dunfell 3/3] linux-firmware: Update to 20200122 -> 20200421
Date: Wed, 20 May 2020 13:20:46 -0500
Message-Id: <20200520182046.2031954-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520182046.2031954-1-anibal.limon@linaro.org>
References: <20200520182046.2031954-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed9da2d9dc42c437650d539c4d14b8b786f82059)
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

