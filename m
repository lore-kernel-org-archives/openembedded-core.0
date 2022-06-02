Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9946C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:53 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.1535.1654188768476044096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Edgs5ADw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id y189so5199227pfy.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gYab1GisB/b7Jw/nb84Ps+gwJ7ktO4NoqYt/YBPbUic=;
        b=Edgs5ADwiUaLCX0E5h99pk4ZeGhsACeuHvdBk8sTEawkhzF7fT2qfEh3z0eBiHGH+2
         a1HN/qvtUPsvax3cicYT15YLsUaZ7KjnYIksbrQQydl4VaKnVSxGB2q2H9gcVByVTJkv
         DRFYNEqjqVS2q8SS3AkSH7Y7u6LR7mLZ0FqPjhxDAs/tG/0aS4YWMmJ6tB4HzCeTnToY
         umBgY0RfD7FYwU0cxC1aIoTpd22yzfprqzNlamB/B4pWOMKBy5Az7jKqpAaSMbaBIXi2
         M272wpav35uyg+5oFztAmq+kmB0u8DLMyhfLoHo7d6bhxiE2wC8BqxSx4XyFmMzftvkc
         VVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYab1GisB/b7Jw/nb84Ps+gwJ7ktO4NoqYt/YBPbUic=;
        b=YWd5Lx8ASw/modQVzBdvinEcuq/ua3EEWzZSOLZSwFbu7f8G12EgG6s3rsBdD2DV2m
         EhQ6F2Hf9Nuc1mLdua2B5peZYW8vu/lYUxO40QsbZd9BeS1A2APpaolab1CaLNWJj3PB
         CDzksD7nEmX/MeJ07r0/+adqPK95CsyVvdz2XGAWG/o/hwJt4of5wAAbT+sve8VNc5V2
         misSuyn+LrvYmC9FAKqhckzv6nwWibfwnXApf+6sWjN6q4pUwaUGGDH1fI9WAsKWr9A8
         VaNJuzA5lC3b/ARRIzqDrO4Bv8jEMkVG/Y0xjPVIuLd3QekoDFJlA3i6W6eaeQ0fccn9
         vNOQ==
X-Gm-Message-State: AOAM533TXtAG+GnWehXYHc38bHYWz7aLLZdcx1S0lMlYB4O/A49k60FF
	9/gClipOc0MS3lJ266mWkl46/Kr9GAszOlM+
X-Google-Smtp-Source: 
 ABdhPJxDlY7KrabeJHYdhUjaWPsmAf541+hhkDIpF9fmket/3gZNdXg5to+8ivSJNN+9vJxZu8alJA==
X-Received: by 2002:a65:63d1:0:b0:3c6:25b2:22ba with SMTP id
 n17-20020a6563d1000000b003c625b222bamr4996247pgv.360.1654188767287;
        Thu, 02 Jun 2022 09:52:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/26] mesa.inc: package 00-radv-defaults.conf
Date: Thu,  2 Jun 2022 06:51:47 -1000
Message-Id: 
 <8d5f5823b357e5bba107511f62cfd0777da2e401.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166492

From: Markus Volk <f_l_k@t-online.de>

this fixes:

ERROR: mesa-2_22.0.2-r0 do_package: QA Issue: mesa: Files/directories were installed but not shipped in any package:
  /usr/share/drirc.d/00-radv-defaults.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
mesa: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e306dd7d300727852a2794cd78f3097d5999eb58)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d7bce3a008..0628151e96 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -286,7 +286,7 @@ PACKAGESPLITFUNCS:prepend = "mesa_populate_packages "
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
 
-FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
+FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa = "${libdir}/libEGL.so.*"
-- 
2.25.1


