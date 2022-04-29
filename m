Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E63C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.11920.1651248109648001605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=S21ow7AX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id b12so7522632plg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xHCiOoQejwG5yKXAihXsz06AuHuAqLLjL4xQV4ve8ZA=;
        b=S21ow7AXUUAjCfQgqPa9xGnPC/BBBZMVPsoUeiWBw64ARazTlWrPHyDVpyh/ofAJ8Y
         xXQczL0gqKAiX9vzogjFc+Y6QYxz4y+bOYXxqhGHlYffYQEfj6pmUqHUlcSiQe++rEl+
         r3gjae+ViV2LA7/YRmfr2i2EU79Fv1YhpGjAqQ8CgTr31q6Y83BE7YtNoAVADDbigVDr
         ZEjXjVFERIZVdh38s1yotCzfP0gp697QOiVDCoK+8+L1cNTF1R5XSSCeJ73fUghGXZry
         GpV/OwoPSH+jw52lfBuG/3LxjWXRqz6Igr7+caUXSJKAWzBpjGX6DYLpgBmjPTxvOzJj
         P0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xHCiOoQejwG5yKXAihXsz06AuHuAqLLjL4xQV4ve8ZA=;
        b=tJ4+DHdurd9aaO+8JUeRUEtiIWU1XsMTqvmIBkAIy5oCdHRHFJvpzPtfFnaouAulk6
         xZnLw9PaeOOrLoP5e8hRKg0dHHz1VcCq6h+4+mm4PR+zX1n+4kp5GrJCGNIIWfodENpH
         JuJEkDZ6hOR/iVSves7qtZqeDoe5L7+yrLLNzCTwM08YhWSsfi0tuYhz1Zx0YyAo+84d
         YPwpEp2gllqJ/jrCE7mV5Hkg8fnc4rGL6Ggv6RpuV83+eX7z8hoiek+SJhWGqQqbBqgO
         iQDkZvU7lq3rZmWklD8Kua/rl1cjQKuu33KivICn5Ep0tdA90hcyqgmVZLOMBcDIAexi
         jXKA==
X-Gm-Message-State: AOAM5317j7QNrF0FewQ8BMSg1AyWtgrrLD4IS4GDGi0IUw058d49Bpxz
	Gd3aLaU9PqG2u90qvLhe2eqC/qdZho+YwTSUpmo=
X-Google-Smtp-Source: 
 ABdhPJzsX1ZFW+hlif0+YUJBpvreqB7obghDBZY1YUcZ2msG5JA4AlL91CaJG6OFwSyEio3oqxLaXg==
X-Received: by 2002:a17:90b:4c0a:b0:1d5:2e1d:ec6 with SMTP id
 na10-20020a17090b4c0a00b001d52e1d0ec6mr4773997pjb.64.1651248108441;
        Fri, 29 Apr 2022 09:01:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/34] linux-firmware: correct license for ar3k
 firmware
Date: Fri, 29 Apr 2022 06:00:30 -1000
Message-Id: 
 <eff0cd8854f18b9ead2aaf7850d33d300cff2960.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165030

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

According to the WHENCE file, some a3k firmware files are licensed
under the special ar3k license, while others are licensed under the more
generic Atheros license. Document this by adding extending the
LICENSE:${PN}-ar3k and depending on both of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8e651814af706285d64b532095fcd6f5f02629ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index c7d9e1126e..4a443d14d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -352,7 +352,7 @@ FILES:${PN}-carl9170 = " \
 RDEPENDS:${PN}-carl9170 += "${PN}-gplv2-license"
 
 # For QualCommAthos
-LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
+LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
@@ -376,7 +376,7 @@ FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
 
-RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license"
+RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
-- 
2.25.1


