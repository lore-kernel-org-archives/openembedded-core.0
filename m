Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.205.1585686312101170051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 13:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Fc1VFxFm;
 spf=pass (domain: linaro.org, ip: 209.85.210.53, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f53.google.com with SMTP id f52so23487270otf.8
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwNyztI4KQuzp3dsvoF2BiK/IoM6PiP9wUfTz7l5nAs=;
        b=Fc1VFxFm59nuZdGY2N2OQwMafRgXFDupRaAgPDgX/bqU/3/JRjXAt0lKGLDA27NS7i
         nVKVJ6uvwZU6tGZBWKtEVgXlRmEctIuuJxVPjYgLzvP8MnxwQYgpvh6z4E7MueU0X9XS
         SNNDSIjzKaK4cichopf7EyLI1PGWvMkNGJ54cCHdrIwFSzW1hKCIrKVaYA/NBvs+PSGp
         0O3kj+qrxPSBdl7SrcfBmipS01vtqyGhO9jNJ/PUBIrbD8m77472x/EZvsbsaLg7RZkU
         SJVtTb1p/MY4/k4jSmdcGQS8E9tBObhqwSnD1btzXViW+UHFQ31VdQMTOngXG2kvW/gB
         19sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwNyztI4KQuzp3dsvoF2BiK/IoM6PiP9wUfTz7l5nAs=;
        b=CrT0QmUzazQf54q2O1TygCSVcoseox8y9YlH6VTypa1pC84GR1Aa7gmT77XKbCzIay
         rybDBVeNmTxI48V0VMeEKi4tAiCz32Oubsin879MaAeRmGUZVA78lvy+ifpa1YKZ3jMJ
         SPgr5oE4WHxSi1JBjfpoEcquBVcylUWN4fvXAdOMMDvEw7pQ0WkRswKtYSQ5b12678ZM
         psr7OekP6+YJEGmKTQFw4uW0LANjBAacanN93sf89o+Q756PWNS0zHUKBuB5QJPLFmVp
         D1s0NhC9BfaXR82F46/H0+MUSzQoj4ROWMF4qXsQlid9+50ILzvbJ/VcRm32YzTUFP33
         qaLA==
X-Gm-Message-State: ANhLgQ0Ce7q3eE8+1MtieY+veqUi0Pj0jWkAcUuEHMO/9Fx8UjF9prvr
	qzIqCA+BMbSrYq+QjEXih147+kt/9So=
X-Google-Smtp-Source: ADFU+vtI68qSW+80NfxtgI62sOzDMy8MD15uBXgjeUhNajFl6Re/RWqgfC2jspm0TkArGDfTL4m8Hg==
X-Received: by 2002:a05:6830:1f39:: with SMTP id e25mr14628701oth.135.1585686311146;
        Tue, 31 Mar 2020 13:25:11 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:66a1:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id j132sm14201oih.1.2020.03.31.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 13:25:10 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv2] recipes-kernel/linux-firmware: Add qcom-sdm845-{audio,compute,modem} firmware packages
Date: Tue, 31 Mar 2020 14:25:07 -0600
Message-Id: <20200331202507.280778-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Contains the firmware for the audio, compute and modem/wireless in SDM845 platforms.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../linux-firmware/linux-firmware_20200122.bb            | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index a7406e48de..7173409e05 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -289,6 +289,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -841,17 +842,23 @@ FILES_${PN}-qat-license   = "${nonarch_base_libdir}/firmware/LICENCE.qat_firmwar
 FILES_${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin"
 RDEPENDS_${PN}-qat        = "${PN}-qat-license"
 
-# For QCOM VPU/GPU
+# For QCOM VPU/GPU and SDM845
 LICENSE_${PN}-qcom-license = "Firmware-qcom"
 FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
+FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
+FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 
 FILES_${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.26.0

