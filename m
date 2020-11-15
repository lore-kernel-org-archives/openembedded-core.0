Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web09.19196.1605445567712804155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 05:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qr39MIzL;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id h2so21294500wmm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2020 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VqrNSi27MuarEN6IDfWkhZN1TybxYP2KTCQSPo36oI=;
        b=qr39MIzLD5L4+OPHtBBsUPrUXA2RXLKIFP+oMOfj7qJcYtZeE0T5UEnLPeRmoRK6tP
         k213a/hG8DCtw9z3x7elVvmpRR/Mb6d399ibD2v6eLKqjOOJVl0gKSBNC4SIWt7JUMf5
         0nzipdLZ7RjurQhfWJ3WgC6wGFw03am8IH5wSmZeqHMM2da6Abd+6t2N6HRrYJ+TFz0F
         E4oZOXcIdDhN28fQIsZ8JkysaL9HXX3ySBMBQR1hfnDZSm9B9BHpzsNuoUZgrzXUTq5g
         5ZxvkHQzR93jDQgKCtPeJgeXJ6ZJFzYJL35fA4uY5kH0dOTSUmB8BT0Xtktc01s1mgkF
         0fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VqrNSi27MuarEN6IDfWkhZN1TybxYP2KTCQSPo36oI=;
        b=mZK8h9yS4XH4ePIsEcshe8dhdiVICC5lCga/cEKqhEo7/K0Z5y7dZ8lRoiyN9lHqtu
         m4tfD/nfG7j4dGY518sSvRDoWYCfczJHsX+DJohli5mLkUhSWfae5EqGuYxI7wUlSwM7
         UYxoZelA4zeQacgrD4xQSKL7A7VWE6JUessPtwmV0Tup2nTlIgL5/zcQHnJRdry/wfyV
         FsjTaUdsEIPMk65dGy/esYTSFNKISaz7A9/qqD9gJtczsfZyPlNhs0GMU5sUcgT/DkyD
         eGclVoMPjGAtrNXY1YfNqHsBGYH9krC+g02Dk8rgjU7UlPzhu4PXTPXbsK5JbaLTVpFL
         vHeA==
X-Gm-Message-State: AOAM5319dLm8KvbOj/Wn+6+b+21s9ZFhYdAqhOCGFB2M98RhQMhKfVnQ
	OkKm3aZayXBpLhKHgrqCpsemhOlaChY=
X-Google-Smtp-Source: ABdhPJw46VLSe8UJ4ft1wLV/dR9U3v+9XJuVIvIMJ1ZGLEOzMRwGeAlE9Qg4LtXC8irFzDpm2HgJQQ==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr10739290wmk.65.1605445565874;
        Sun, 15 Nov 2020 05:06:05 -0800 (PST)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id a17sm19866159wra.61.2020.11.15.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 05:06:05 -0800 (PST)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][PATCH] linux-firmware: rdepend on license for all nvidia packages
Date: Sun, 15 Nov 2020 14:03:54 +0100
Message-Id: <20201115130354.43190-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes commit 0671d04978 ("linux-firmware: package nvidia firmware")

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
index 045f2647e0..93b9d5308a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
@@ -501,6 +501,7 @@ FILES_${PN}-nvidia-license = "${nonarch_base_libdir}/firmware/LICENCE.nvidia"
 
 RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
+RDEPENDS_${PN}-nvidia-tegra-k1 += "${PN}-nvidia-license"
 
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
-- 
2.20.1

