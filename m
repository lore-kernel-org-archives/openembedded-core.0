Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web12.14490.1589986743819114017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 07:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LO45iCwY;
 spf=pass (domain: linaro.org, ip: 209.85.167.194, mailfrom: anibal.limon@linaro.org)
Received: by mail-oi1-f194.google.com with SMTP id b3so3135055oib.13
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AeHRdr+p0ZGt1PrxqY9NC9jhYiYx1X+35z24j2ws1s=;
        b=LO45iCwYD+ntyF0I38xtmZkBq0J6+t964u0uQbntLZ4AV6xCLis9DUg3yFhXsW+cIR
         3+ZbKM5zvdzI2Na92B4Jq2YJfKU608luBHMeUn8l//BoJYrbiGjCnThu72FQbzmzb4mS
         MsVCUNeWKi6lhHiHwgiI39vAp+dc3kQQi6uq7ASY3gJJxmkM3DaaKzFAOtov+uIMyRF2
         VtWkWg0CTr38ZGGq/whljkeFCcW5Ism3v44+l8p0Y4RnQUy9MHI+3pJ1v+sJ/yatd/tC
         MlW/QO6ZlQbv3XYBNbUl7q21rzHiqRkVzV4MKRY9OiVVMyb+0Y7j+JUjVfZPDVC6JjhA
         9vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AeHRdr+p0ZGt1PrxqY9NC9jhYiYx1X+35z24j2ws1s=;
        b=tnzYHWsuLqOTMO4DQ6d5zrZ6my2wIcdr5co807OtkhZbtBQ8QcoyqJNO61qSaBWFuA
         HVOTV1glDabP4+pw/nuVwUf+7ffhkOZlx3tlJk1DMr/53Yqn6MT41JpM24hHA7CfexQV
         pduUWlZVZkd+vduSAPca2/8rwfypbkB9jNBxstlGNkJABZpZdUWoOPxfKzZBBcgGXSrE
         pvB8wOiqjo/HEBuGj4n9EV9rr1WWioBAgkHajv31pwlsUWuIn+l3h5TIcJGYrZwnjCZV
         IFWNQcisy8K92I+VngIapO0lcHxS+lbaHYqYVPSrQoprTYW4hpXSMDipw1WVHUpHwuPd
         V7ow==
X-Gm-Message-State: AOAM532Tqi0CtGT16KFshE1VGQzx3V09o4UKKOzOVxnToQ+Or6j0Dncx
	AwvBOhPfWLL85R872Dx6yc6mR7zGXPE=
X-Google-Smtp-Source: ABdhPJyShxhsVF0+TqkwXULeZZ7/YDHAZJJ3ZQdO6QY4+CMpm0sy5juqzOgalnhxWxfJI4/JH4Mqfw==
X-Received: by 2002:a54:4109:: with SMTP id l9mr3440738oic.26.1589986742813;
        Wed, 20 May 2020 07:59:02 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([200.68.141.41])
        by smtp.gmail.com with ESMTPSA id s198sm828174oos.18.2020.05.20.07.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 07:59:02 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH][dunfell 1/3] recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
Date: Wed, 20 May 2020 09:58:56 -0500
Message-Id: <20200520145859.622161-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

