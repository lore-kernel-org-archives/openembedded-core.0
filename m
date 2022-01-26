Return-Path: <rudolf.streif@ibeeto.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C54EC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 18:39:09 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.16935.1643222348336993315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibeeto-com.20210112.gappssmtp.com header.s=20210112
 header.b=0eQmYVkR;
 spf=neutral (domain: ibeeto.com, ip: 209.85.216.43,
 mailfrom: rudolf.streif@ibeeto.com)
Received: by mail-pj1-f43.google.com with SMTP id d5so480321pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ibeeto-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H9Xytv8mGA+Nljcg8swAn/jUUpiDUi9CB3L8ioGIJ28=;
        b=0eQmYVkRkO84l8+q/80KSlCXNuezNZl82JtxaC2HTz6SYRDhqsHbEJXCaGt1QTi7el
         I4Grj+bN4aQREpewNelRDUUBgLM8yNhRhqAMihQCmAT9i+rDPIAZ86AeYBmrlLR5bNLk
         0deOiOHn2CF6Bq2SB+7AiBAz3FnGz+y5F3uxQkbSRs4sy+qMolk8pbcIES+YbqYVHjpY
         gP0q6iopcmhKnTHTxYRwrIBeeCY9W77R+e+7bMXvvBh8P9SFp3Z3GvO0oluz8q12ToFz
         9M9K2nNhlkcKyzdhZ7XKiSRcc7kDLk/25q6Wes5vYWoSVppAgupGjL4srVdtuUV6ctGt
         rRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H9Xytv8mGA+Nljcg8swAn/jUUpiDUi9CB3L8ioGIJ28=;
        b=RxTBK4/KIaSQFhcvw713TtkKFOjXi8GSkR/WRXadpWGTx1LJcawfEEgAogWA8inEFB
         VO29UPbdo52tI3rfTZqiihK9VdICRIxHZMKPn6CyaPGSpm5ofa+jZgP6zmL5W/VDhUlt
         wCzkIQbbYqN55OwT6YiZsGq2Izrlz8dJkv4ec2gOC78yIp6pnNJu6DzbLVKoErc5L1yv
         kh0+b4089CMPMyMrWhCqhIiM7E2WnA45G2SCGzqx1qo5ec4Ge1EAUn7GCZUPPLTFxFcE
         KSNHJe4WigWX9lSiodNIWtkpz0j+pUBiKB65WCTGzuDMzc0N2W27GZikKgBUetjDV7Vd
         4Chg==
X-Gm-Message-State: AOAM531X/wqEkox5i7twIZm7MtIz8U0ZKP6Rihlpaev0QGDBikOH05LI
	vfIrCLxg8P9wSArArFmfA7YSXsWqUVlLrcZT
X-Google-Smtp-Source: 
 ABdhPJxKNe86kO2PggAgrgCPbQJgepEjdNO23p82w4xxzHrSb3jqUzeDX65WU4cBXLuz51vb+COyiQ==
X-Received: by 2002:a17:90a:c301:: with SMTP id
 g1mr10048832pjt.132.1643222347386;
        Wed, 26 Jan 2022 10:39:07 -0800 (PST)
Received: from threaddy.. ([2600:8801:8d2a:a304:93dc:834e:6555:ccaa])
        by smtp.gmail.com with ESMTPSA id
 f16sm2976836pfa.147.2022.01.26.10.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 10:39:06 -0800 (PST)
From: Rudolf J Streif <rudolf.streif@ibeeto.com>
To: openembedded-core@lists.openembedded.org
Cc: Rudolf J Streif <rudolf.streif@ibeeto.com>
Subject: [PATCH] Add CLM blob to linux-firmware-bcm4373 package
Date: Wed, 26 Jan 2022 10:39:00 -0800
Message-Id: <20220126183900.2657513-1-rudolf.streif@ibeeto.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 18:39:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160993

The Country Local Matrix (CLM) blob brcmfmac4373-sdio.clm_blob was not
included with the files for the linux-firmware-bcm4373 package
but instead packaged with linux-firmware.

Signed-off-by: Rudolf J Streif <rudolf.streif@ibeeto.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 65bfda1d9f..5f1b696092 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -751,6 +751,7 @@ FILES:${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pc
 FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
 "
 
 LICENSE:${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.34.1


