Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.29060.1620634288782751157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 01:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Gfaqvdbp;
 spf=pass (domain: blade-group.com, ip: 209.85.221.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f54.google.com with SMTP id d11so15578437wrw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9Q1PyBHCj/jpzZCkCz4i81Cxpp80dj8OWDkMGJKyeE=;
        b=GfaqvdbpBF/yYmIQ5KOon6U55oID5Qk4GnSb38hjyxavPTyUD6803dwIk9yuuNKPsI
         AyV4vp064JIIWKA7q4IaOPTdnoXz7df63OQlPtwHXD4CHqrbi60TUZr90KGzSld6zHhH
         RRmXMVh+hy3g4rvXffVUfGCW1gml9IObjnBSuJzzqBepRybSlsD/SUV34KPUS1Zcx/tY
         8fISdPfOPeXIF52ufEs3J0ok8HRnrTAWYu+KXQumuaO9yX/YcvoEafLTBMqLahZpwGfI
         dKd+KPx5mmfURfBIJD/OIjbVnlB1dDnBefLAh5MTBdNEZeYhtrY4DSgCwIlXJDK12O8L
         UBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9Q1PyBHCj/jpzZCkCz4i81Cxpp80dj8OWDkMGJKyeE=;
        b=pi2kz4wwu04gasAqoal4c8Mrmn4rAao62DhXIcNkgWUBYmm9Ai/FnfeFsQCmdISCLv
         RqCLDCHrlkOx3L5eu0nqf/kkkG1cg8kQ1WOGKFJKT7qZaakVjO8Rz8tt3Zw0vC4hpNYT
         6BT4JAbGihb5XR1Xr2mR8N3OtDqkeh6v/6QtKcQlXPjWrWJQLNpLEXepzd12zQqCOEwm
         sZQ9ykGmtaUvMyqLAHqTrJBIRmJGVABaowawDAQs2cGVDMcCvKePHeT3vkNjy22RuZrq
         7ayojsGEstXghdjG2MJsTruL9vBV68ppY/SEYn7L3XX9VUDQEA21qpNIB/6PGWlJqRxz
         B+yQ==
X-Gm-Message-State: AOAM532++nXyFxmZ7kqzpWWSft3tZRuAZmeabKHFVRw4HYyQmjM9HXrm
	oKeOfStBhA134wgnsNKHA1aL/OcwmvcCaA==
X-Google-Smtp-Source: ABdhPJzvNeAg4GzUbgQSnpA9jAHv2hvm9zy7YXaFLGGW+28O4l2DvG48eQjMx8+tKk4t0X2qFqnroQ==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr29387165wrn.253.1620634287296;
        Mon, 10 May 2021 01:11:27 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id z18sm20688961wrh.16.2021.05.10.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 01:11:26 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] linux-firmware: include all relevant files in -bcm4356
Date: Mon, 10 May 2021 10:11:03 +0200
Message-Id: <20210510081103.3912768-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This currently catches the .clb_blob and .vamrs,rock960.txt, and other
.txt files may come in future upstream releases.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
index 892455b039..1e32d1c8b6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
@@ -656,8 +656,8 @@ FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.
 "
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
-FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.bin \
+FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
 "
 FILES_${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
 FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin \
-- 
2.30.2

