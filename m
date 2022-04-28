Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9E6C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2998.1651182438961801138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=z/ujMq/j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id y38so5334176pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xD0Eo/IM4jfvODru564CWFYw6K/YO65XhmXSk+nZ+Wo=;
        b=z/ujMq/jp3h2ULJR80PI1Npa2OG2/Tpgn8jqjJtFq4Xm1lSaargv1EWtipA3sWyW5W
         zM4QPLKvgN8mhWvyq+jveCziF0xrtjfVOywfNCrLs0YLzeC8H4/JgNIY7GRdmn0Q8Ptx
         ofM+Ui/DeBMwCxZGckcworTY0F91ECG/vxtUKDf0EeVU1wwcKKvc3cYfgTJshf0BBY+Z
         Ep3dplTjcjxZ45RtrZO8xepyTOLZ0BODLznJAiteD2JKpGLVR6U3ToFEBmjy1KaUquDJ
         R7AASQ+vBLDdAp4+ib5WZ5KjqUyO0M/BlAQkS+PO3Uer5simOK3ItCN9D3FnvKrUSvXs
         96dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xD0Eo/IM4jfvODru564CWFYw6K/YO65XhmXSk+nZ+Wo=;
        b=qsrJZZj8r0ASZfKJoiHBaus59zp6sMf2ILlUtcjPiuRFkr2XBSil/kM5xQCOKM+kHV
         wcDSh4bX+nTd0FkkALjMyL9yZFHC0zWPwQSG+Fa58ZD4jCAgQRYyKDsG0lGYHCC8uuTS
         oYIzuwlhBhvZX1ylkg5egfkI2BT+/AYCRksDqE473dJY4ut1WmwuG0LqDjHjD8xvapA+
         0mSAXIWtheQAwMhzex+CjlwnA6QQenh4mKRMUNEosaaBoq47KDXmP3nZ7eJLW96FM2kq
         Vm3sRlp+PdoJgd8d88Bc/xKAmip/W7E8YlHF38BoNQRuz2ujFtfZzyXtXkjV6jB2Ckgx
         979Q==
X-Gm-Message-State: AOAM531K+tUQhKuPsgJ5C3Ui0Ui8XNhjukDEPhOvRzxMTvhv8YW/CDZB
	gmg/dPsNTir0ylMMaehjgA0ck+nd+FizlEBLbvA=
X-Google-Smtp-Source: 
 ABdhPJx14BpWrkhDqiaCKRD77RytKBBnO1u4LOSs9Dek7kr57cn+EcuRWQtlYAuYdJJSxtIgs4gMsA==
X-Received: by 2002:a63:224f:0:b0:399:4a1a:b01f with SMTP id
 t15-20020a63224f000000b003994a1ab01fmr30261135pgm.123.1651182437751;
        Thu, 28 Apr 2022 14:47:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c138-20020a624e90000000b005081f92826dsm749742pfb.99.2022.04.28.14.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:47:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] linux-firmware: correct license for ar3k
 firmware
Date: Thu, 28 Apr 2022 11:46:33 -1000
Message-Id: 
 <8c0aa16d76e5492f774fcfe08c829c877991afbd.1651182153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651182153.git.steve@sakoman.com>
References: <cover.1651182153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164981

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

According to the WHENCE file, some a3k firmware files are licensed
under the special ar3k license, while others are licensed under the more
generic Atheros license. Document this by adding extending the
LICENSE_${PN}-ar3k and depending on both of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8e651814af706285d64b532095fcd6f5f02629ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index 04a6cefaa1..ad8dbac17f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -352,7 +352,7 @@ FILES_${PN}-carl9170 = " \
 RDEPENDS_${PN}-carl9170 += "${PN}-gplv2-license"
 
 # For QualCommAthos
-LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
+LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
@@ -376,7 +376,7 @@ FILES_${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
 
-RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
+RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS_${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS_${PN}-qca += "${PN}-ath10k-license"
-- 
2.25.1


