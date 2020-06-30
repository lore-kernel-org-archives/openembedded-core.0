Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.7509.1593486317245916231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mv0lHL7U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id a14so4206338pfi.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NdrvawlvAvM4tsx+QPIgMk/qqIITZmWahRtAGemNnM4=;
        b=mv0lHL7UZV1IgkJDBb2XbzNZyowuEoPVkgfgWIymfzYASbSnGNV0EWxZhYmlg0EBCp
         EX9K/pbHX4uscoVdyk155ZyfvzsWVcK2P5hkP94dOE5GYQDtNSRQXY5pquuE4j8xUc1B
         plJvTwSNv3bvp30H9W/RWiGJaNXAZF9driCtyugUACiwRyM8ddkHEmVTZLvHCvNAWeks
         SedLNIL7rU84HiCGNcwVBaUQNitnNzoEeNm51qrdwYoBXO8bZCsJAwka5SDQsVOmiSLT
         m/l9MVa49GLrQ/apCr+/5o+QVBylZyC1RGX4okeOIHsSijGKNVKj7nN7o6N9j3I3IKgr
         Jniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NdrvawlvAvM4tsx+QPIgMk/qqIITZmWahRtAGemNnM4=;
        b=Cu5+rlPthMdOpaaexGLaWd2QYjVkMH7fd7nB9BjAK+IxN4kNCA2hNxYBsXeemLy47s
         LE0vE8j9Uh22eMpzOC1G+AuIgyM1dUKgfqnlHNFDK3rvmr83canV+1kHtsXqrCutbz1B
         ru/i4GUh7m7NgCT1z70aMOu9O5iqDzcURXTB4dOoyhLihv5gedGC9Vh/mzNMuGPKFVUP
         MVnJxGy0kwGzSfnJv4Rq2OwdRxi7jE8H8ggc/gmb3jfPfgUJvF4oSflZejGEzdPf5/Tz
         w95zK1bg33/6XwgzqCaQKldWldpDdIEXd452uZ2YYTEGv5QMvMOD/GcxzcXWfGyeuEmp
         V0RQ==
X-Gm-Message-State: AOAM530DwCaYRK4qV2O4Wtg+TvCNtn3Z93l6T7H5RuKvQQw1hk4Q//+2
	PFYboXMQNVaU+qJlu5HVF2LrKZbkhdkiHw==
X-Google-Smtp-Source: ABdhPJwAD6JRIwQzTDiQp9F6r2BpCa+P1oftpzcCUzHm/zBxcQ7Wt6VY37dH+I8o/lZ1xn8YdaSCTw==
X-Received: by 2002:a62:178e:: with SMTP id 136mr16881400pfx.180.1593486316369;
        Mon, 29 Jun 2020 20:05:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/22] linux-firmware: upgrade 20200519 -> 20200619
Date: Mon, 29 Jun 2020 17:03:16 -1000
Message-Id: <42d5386cf22716bbbc47f31979db78f4ad92bc93.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: new firmwares, all redistributable
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ae9585efdf5bcef7224c8e752ea76064922ee99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20200519.bb => linux-firmware_20200619.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 18f44bccae..392e03a10a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=c15cee50b1a59d27106a37c2929d5291 \
+                    file://WHENCE;md5=d373d30188c38dabffec0d3cc87abbfd \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "584c49c58291136b966ceffb0a456a672c23d4d759bab8bf86cbbe28061e415e"
+SRC_URI[sha256sum] = "962d3ae197d226c8259f9cc7746f7ef12a9d23787cd56bd27302021ba6339722"
 
 inherit allarch
 
-- 
2.17.1

