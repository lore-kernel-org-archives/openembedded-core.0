Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web09.8190.1620831573688251497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wmTpVMt6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso20798058otn.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O9MqKeIVwexnxS4mRMRcAJ03GafB0nrlkHm5RUn8Z8s=;
        b=wmTpVMt6BmTOk7HBsWu48afLX7AyNOMkf80cpTjKJR7Zpd6LMZr+rdmqzRw9NaWCDB
         wYmCyT0CYKsK+RBamCtsT1kYHMzogiUcIqn0kOul+wC0vbySyX5VIuiFKFHV0JAZrkzo
         FRXeSstPd5VeiYX1wZrhy6L62NFl+dqTmocEwjoJSnV73SMjZI6r0yb5ntvDmwu0LM6X
         9RVpklX5PHlwBPveS6E342/s/fbAY7rqnaV+rDe626SWA9xYKSyvkwyPORvnZsWs4Uj0
         VAraYJfMvP52MKByeCwWSZyptz2IFASD9RsoXRzz4ngF/B+DaOH7cRxNUmQvr5eKXcn6
         Sg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O9MqKeIVwexnxS4mRMRcAJ03GafB0nrlkHm5RUn8Z8s=;
        b=HYg/LUMVANsnmaKWVAe1LPBLAQacB3G9rU08Iz+Ye0RatZSfmLYqGU0u3+rRnwrjFN
         OWoPzxZ6TVliqoYXO/2saltu2wcH8LlgVeRUiWErTLMdEVxuHTUF36JxZ3TYaf2oSY8i
         MDM3b9ag50Tr7vhPQVP+iixA/dzPdYd43scx1RAv7BsoI/67EmT3g3/9zZ9IfOAML6Yr
         XoJ7XTwKUQ9dA32T483bBFUkvBA8mpUsdyE9ZhsXHWJ67dp9kf/aw8+KJiAkHNvZ9qME
         fjnro53fNLDFKoCk3XqcYUjUvEiNShNCgvijJBEa5snD5c08eRfpVf7FnMy20QETyTzz
         MwZw==
X-Gm-Message-State: AOAM5334iQZ0sWcoGXG2gdc3au5YWnwRz7b+g3OS7ViF1fRGHLXu2XK/
	7wBN1Syj4WS0Ti7vLn207Nzqs6FpH+/zoTpZyxY=
X-Google-Smtp-Source: ABdhPJxjkHsvWjA6pfZY2Wx9w5uO6yWdjLLTobPT+szRewaqL1V/F5h9T2hpSrGygAGeuhQhidvpzg==
X-Received: by 2002:a05:6830:1452:: with SMTP id w18mr31320528otp.227.1620831572642;
        Wed, 12 May 2021 07:59:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.59.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/22] linux-firmware: include all relevant files in -bcm4356
Date: Wed, 12 May 2021 04:57:01 -1000
Message-Id: <fb8138e7b4fc00d99c11d5af64260add2c4ca02c.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This currently catches the .clb_blob and .vamrs,rock960.txt, and other
.txt files may come in future upstream releases.

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e332738a8aae0914c58b40faae8b9d7a82fd6a95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

