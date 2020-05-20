Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.3148.1589998853556356859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 11:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=th5gM6Ss;
 spf=pass (domain: linaro.org, ip: 209.85.167.193, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f193.google.com with SMTP id o7so3823218oif.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XK3z4Xr8/BWnOQ6AQgYbFnSwV49VrqCvtDChjg7Y+gI=;
        b=th5gM6SsfPq7HOOjsvnA/39GiYAsb9CNWPT8iNolXuUFAmfOJa4R5s7ECl6omFZIY5
         W5RtjwgkKzLpIEOOXdHyKb5zT/6DY7VAbIchRra2UVwnw/OjCkyqpqR9mkdsl3WGaROu
         5pVrNSFl6TDa30k6iVIGZmWTX4035+tpq2HosOVl4Hsbo9RvlQgVoxOXcgMZ6B2ysiQT
         a3+co5eKrpOgMKQi1hc+DTRV63ipxA4X/vIKRmWJipIhBHO7zlE7bkO731Ji6q9g8uHA
         DGSKgQPWyEEOEvdsgNkT3s5TcneQt1wu4OlGKoUXb3K5yNA4D0PYHsxtj0t7GfDx1Oq+
         pCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XK3z4Xr8/BWnOQ6AQgYbFnSwV49VrqCvtDChjg7Y+gI=;
        b=f/uY5JT691ufAPezn6Jr7DcwItJk/C7TF/9DWZcQ6FAoknft402X/NpyCk9cHJ9cBF
         pns6sDXqtJAIPbRerI76KX6pcyu1WucP2eVYuTdgzx8V4fcTQH+hNvIUTzSY6Hn5ystP
         vSAP22WTuU96oGlJTKDDUBKI1MA0fWonP0xAop3gjH2o4FVPdaJVzd6BxbmgZCpqrzWO
         6oBsrR62QbXBtfxW/7fQBXLRERHSenN5/rKNYmqxQJyVfOYYRiZdjSjDx1bxW2WKH8m3
         WW5eDyo2AIfRxTxk6hA8Gf8gVVC4Hg7v18kdjyTzZRZCywkmePO+tIoFlTRFPZzCFgwh
         MZ+g==
X-Gm-Message-State: AOAM531/P0YJLdmGCVFjTfa+ny8DCa4T9Rc+qltOKLCW7PL71CVzY73u
	IVTk+wKJfNhtGengtFlJmNGJXW4iFpM=
X-Google-Smtp-Source: ABdhPJy9FOoxw3EDBe0jBwwzevrPJHLjGc+X+59i5vqOy90MhRy2a5+eL3IqdFqi4gSW//YgO0+RXg==
X-Received: by 2002:aca:1110:: with SMTP id 16mr4193631oir.98.1589998851482;
        Wed, 20 May 2020 11:20:51 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([200.68.141.41])
        by smtp.gmail.com with ESMTPSA id b19sm986589oii.1.2020.05.20.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 11:20:50 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCHv2][dunfell 1/3] recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
Date: Wed, 20 May 2020 13:20:44 -0500
Message-Id: <20200520182046.2031954-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55fb6324d627f55c197af068038f3886b95c3cb2)
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 7173409e05..139307cda3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -851,7 +851,7 @@ FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw $
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.*"
+FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
-- 
2.26.2

