Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.26521.1592249809745741248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sAepW9W0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id v24so7209819plo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7h3ub0k+dW79nfUbhsx/BKf5NvMUXqc9BinG2EPWG7A=;
        b=sAepW9W01OxByPaj+0KzUDX3HoQhJno6F4/KCjgUhui0lZQiJYSiDKJHqVW0hwRrBP
         amq7W+xetT3CxDV4kX70Qjnu79puT88Q/RcnTvbxVb3QYt/nTFxbnGjx+nsNZu0ICMEy
         GllsPkk32wT50iTahvCjNX629hFdLeJ+gCfCS+STjmZZFzJOj96qCYO58Tb1Dm5IOmD+
         aV51F3JBXIhXRtOkla3xAyVa6syRAznbuzMVeE6SSuizhrpJUX3EJ+H1dFZ6U5kDrp1g
         L8PeyFWvw5pV6rbDQY6ttqAp6SCKYIyueTyaf0x0v6yXGn84YlL/JXtmCsC561OrDhMi
         ctsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7h3ub0k+dW79nfUbhsx/BKf5NvMUXqc9BinG2EPWG7A=;
        b=A8teJINqYP14vtahgLIAleeDaoD1AC9LCu6rCqYHAC0yOBahBm3SFcc9XrM6jR6oWw
         AkqqG0bXjV5zgn9HMEOZo96GDCAKiNMz15u0QEKn6oOMAjlXOuExKn2+z/AzBcQuxW1E
         gwfbFnQCcTfkfHYVxAPO1P1dXdZc9fFNc3Pp0k4UEMO+4cn3XbumGEhZCzS7sqKhDAvA
         XJRnQ/XbEF3COHtOabalxMTkl8LKIoOGQfWj4rpBCir7xihGWEoZqHLq1AC9wFV0oOCR
         OwObpRHZ+tkQPW19vZjD4NFw+nL8QH7x0sQ1/HqCPd/zRYjyUC5m3/uLDyZRaH3Gdhzf
         5wSQ==
X-Gm-Message-State: AOAM5330LUKywbCEpBx+daLg/Ho9byT3hQGiKY6OQTyDAuD4vo1QCNGs
	45raDNp+70TFxjuOym+VWF6qTK2TCzM=
X-Google-Smtp-Source: ABdhPJw/NB225nrUD3BhfQ9MRF5GGCb3DtO6x2ZY5/J9xs/ZR6gpZQUefajvMMRt5AM0byi3r8M52w==
X-Received: by 2002:a17:90a:f993:: with SMTP id cq19mr859522pjb.154.1592249808817;
        Mon, 15 Jun 2020 12:36:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/21] linux-firmware: upgrade 20200421 -> 20200519
Date: Mon, 15 Jun 2020 09:35:38 -1000
Message-Id: <06c4ea1e744c82ca2c1b6aa5796b548234b3878d.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: added more entries to WHENCE, all redistributable
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8d47014e453533b98e37c653177e9541e1deeda)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...linux-firmware_20200421.bb => linux-firmware_20200519.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200421.bb => linux-firmware_20200519.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
index fa0507a88c..fcad7df629 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
@@ -125,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=cb9a66eff0464b55335d3a7374fbc51c \
+                    file://WHENCE;md5=c15cee50b1a59d27106a37c2929d5291 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -196,8 +196,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "229a93395f4033da68429f165a62b952"
-SRC_URI[sha256sum] = "6dd7cba25d694c031f65529b9027cc8faaffaddfae70a4e3b58c2e4a0af3bfa8"
+SRC_URI[sha256sum] = "584c49c58291136b966ceffb0a456a672c23d4d759bab8bf86cbbe28061e415e"
 
 inherit allarch
 
-- 
2.17.1

