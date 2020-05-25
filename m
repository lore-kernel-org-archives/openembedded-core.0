Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.40979.1590446256935244213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IfodajoF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id s10so9138957pgm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9tCchGlMIBAmVD0pFbNwk9nu7ST/WaHhpsryqVKENOM=;
        b=IfodajoF+/IuW76G5q2OGgyWS3YxI9miedOp6jPJ1pc16UTAoHCIJ8Jy2f4xvaec2R
         V+3TTWfxRmTbzDniNdV15+fTSja7M3XVFtSbGLVXpmwQukde9fD9lUk6jbgASivipkRp
         v3xP7T7h1slKOF1JWfeoT72FpJFN9hDAURLHV7a8WiZNzB9WGhqB7nCk/GIPjVjjnMcX
         uaCC08WoZDrHEU7GU71gIb9VE3BAJX7RMWTlmP2myXuJSwVSKMBDXEXNH5PX2EKz6z/h
         nOBWLmlarKHHJ2axu+kkCgoqj7GlFEkthDQkzMkKXn2/X/chE+XMVgwxdwLYLDPGnby8
         9mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9tCchGlMIBAmVD0pFbNwk9nu7ST/WaHhpsryqVKENOM=;
        b=lYVeD+SPZPOKDT/ux1HMfxx/UsGbJJPOsHawOQ4l++NNs+gefvDgcRz+qpA3Dm0PM8
         XGXsoXhUSJCQLJLK3kSmghVHBlu2fAFVeRTOQcM/qu41SgnpVihrWi85MxtmiXe86/eB
         ns62gaa+PpQ/pgA9kiK+TFBPikPDjBZCjbW8QZijec7MVO1fm8BF2OcT2vSalHEwBgWO
         E/x3VtDZaahQ0jaFZfPe36oSTk+d7vzstbcwx2j8fMQ0afOKKwG5RoJH1g7StKUrWOqD
         PsXwPKQDcKJIFEHlTE2n6FRyBJhsmLXe1aoFE01M7nZPKtEcy5cV1ORTai0gThDVDShj
         9Pqg==
X-Gm-Message-State: AOAM533u6YT3UU+Ue6ojjeTIktXclru+Crg0wpfTrQt/cbam5kM98Di4
	7fhmPYENwHdBzEnuoJj8AqKuLr1s5b4=
X-Google-Smtp-Source: ABdhPJyTfsldPihZX2lOuH7iLVKIX7ip7AtqxSxMi5WzT9nRbrLwIRSBhgbSL1axyeorhx0XHJEyGg==
X-Received: by 2002:a63:368c:: with SMTP id d134mr12935463pga.393.1590446256099;
        Mon, 25 May 2020 15:37:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/17] linux-firmware: Update to 20200122 -> 20200421
Date: Mon, 25 May 2020 12:36:53 -1000
Message-Id: <d53dd9460f17e3c1bb4e5a13d34a8977b25bf0f0.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 7f52475a2c84197c95928d65debf894bf59c90e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

