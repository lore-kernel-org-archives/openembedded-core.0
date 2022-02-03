Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31274C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:47 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.2938.1643917906676058486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ux1/+Xlj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id r59so3395209pjg.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dBigTvc52/+CMAkCQ0trjJ88o8N6HICO4jZB5kYhn8o=;
        b=ux1/+XljUbYr0/UlElXX0WdbbpgK6pCq08d8/72pHsVz/VmOXZPvOnMh4ADqZw0OiW
         bO83bqbS/IPELOVS8Wo5aIBSdaETZUXpKd4B6S959VZxyDbbUExjn/p3rc2kuuqn+53U
         1eTNMLshaL7EMg9+ETGRz4aqJ5SQgozddzBP1YQxpov9Jf5tI/C1Qhr9Zl0qp2f4dkSt
         f3EGhk0NPF7HdIQZofSi7l3/05D/1J9FwADxkIv83wsjJsO5lHQRRJTXVr7f6CI7srPZ
         h3hm7C7J82+RQMWgJHli8pzC6lCSnHOsK47/w+tsxprbvESL4PhpbN9zXkj0+Cm2OIH4
         9Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dBigTvc52/+CMAkCQ0trjJ88o8N6HICO4jZB5kYhn8o=;
        b=3dsjQZxoXdvaYVOim94nNisDbdiqKd8FxYnHY+2t3X9lgDn0TgTcPuJMDLw0+pYDI+
         AXDKdPePJOnugMXDKTtpGSJrcjeKwk/Jxgmg9Zyqa8/OI2UE9MMIIqxPs+vscckzEgHX
         EO9bWOLXjPHDxdxbIrtSCDJ7hO3jOXDKJF+ri7fhO7gfys8E4Ndewu1nk6wadUOu13yY
         D2Orc3/h7lcrSVajmawnb0fViin0jvCl2VbboRkhAa5UaAoJaN/l7bJSuxYtKTM+YF5N
         wmVm30kmfdgpIcOuN5f9g1J0juCc5dGedFOkkcKOVLMsVIXllUTts3Pv7ZXnzKcDO4vw
         bhtw==
X-Gm-Message-State: AOAM530LxEpNCePxrG2UO4tta9aARsxb+uziNB4ujishVo3dVjFo2Yup
	4NYzyLzDNE6FI8mkktK+uOQd8X5BFWq2xwuX
X-Google-Smtp-Source: 
 ABdhPJzFDNWDGP1FsqjmSDPN25hcsSzO67DLdvGyPj1n5ghCSFD3bvxwGCL4WAIR/qBt5Zhx5fQY6Q==
X-Received: by 2002:a17:902:7893:: with SMTP id
 q19mr24567504pll.9.1643917905082;
        Thu, 03 Feb 2022 11:51:45 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/20] linux-firmware: Add CLM blob to
 linux-firmware-bcm4373 package
Date: Thu,  3 Feb 2022 09:50:43 -1000
Message-Id: 
 <7c43920eaab8f31553ee0a14578850fd422f5877.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161314

From: Rudolf J Streif <rudolf.streif@ibeeto.com>

The Country Local Matrix (CLM) blob brcmfmac4373-sdio.clm_blob was not
included with the files for the linux-firmware-bcm4373 package
but instead packaged with linux-firmware.

Signed-off-by: Rudolf J Streif <rudolf.streif@ibeeto.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18ba64d4a12e7275381cf34fe72b757accbb1544)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 92b6ff5157..07389f6982 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -751,6 +751,7 @@ FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pc
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
 "
 
 LICENSE_${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.25.1


