Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C244DC25B0D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:28:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.1916.1660364895475702947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jTW67i7x;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gp7so2618094pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0/7TkGCd1GIMhAWtqhs2c1FMrFhXRbdtd72V1j2RQHo=;
        b=jTW67i7xtma4lObzwWr3up69Y6ibXshMN+0P/S5SrSOCUYpPIaoEPJ6lGfwr2LRfHB
         0xjbVsIcDchQHvvBIGL/HxsbGIsSUnGdCuv2H5dhp7BNCTXgVmNr4EyluGl4Odvzmmnj
         FVo7Hb5+QeIrKj3eqzZ5R9lUx0i7W2IG8mADBJTW99PsQprjddt56mPmpT0MMc9A1QTq
         mdmRCZWKqkzrPMB7wd6zW23vxXQDFG3m1KU24FkM6OF/jvuDcH+z2moZmsahY5WcnMuy
         gPrfSDnd+Upxp1WufAjr4pUpt8A/Xq5GKO8uVlpoEH8ayHQnN+5mCeDhNMwh0hKGFlu9
         MUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0/7TkGCd1GIMhAWtqhs2c1FMrFhXRbdtd72V1j2RQHo=;
        b=z/RJig0BmN7SULhKKEbRk4m/1yLuxLQ6vFlwiJuh45IxmgR7GpQiBQVb7KIaNswnMK
         wk805BiwBCA7nBKfU5t9M38tyNbDrh+Onmul3jwlvjloFbC51g0cSQhaqecEaq9oiBfQ
         NnH7xYyTGijgiQoF0tmJzgpUxnhlIV15AGVG9V+tPdLmsG1rPBBeGOYby6a3AyLCl0Ka
         Zv6INVLtODVUzzusdArGkcIjpQ1QgCjuN7XZhz5STPN0UEZeV9TaU9AbrKRTA5Qr0wfH
         mqnHl8TUQnBEofWmA9YSvMVv/OCyAfymDrPyANZyimFZET6Md/mGqWFP+4hOH1xp3ZmV
         Z7Qg==
X-Gm-Message-State: ACgBeo30F+26DvfBkG2yLE5AmYltPFfQfLWaL9RP8XQJD6LU+Y3R1YPP
	Co5L+qpAWEJ9SwytESSAnKYQ8Ao//iY=
X-Google-Smtp-Source: 
 AA6agR7Km7wW1SIMMbs1ynOCiMx5WiMSErDoGgpR7qrrlmv3DaSszYn+me8b/3dY2LOubrTTExki1g==
X-Received: by 2002:a17:902:bf01:b0:170:ced1:5ffe with SMTP id
 bi1-20020a170902bf0100b00170ced15ffemr7036952plb.41.1660364894434;
        Fri, 12 Aug 2022 21:28:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h18-20020aa796d2000000b0052d4afc4302sm2536105pfq.175.2022.08.12.21.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:28:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] local.conf.sample.extended: Remove largefile from
 DISTRO_FEATURES
Date: Fri, 12 Aug 2022 21:28:06 -0700
Message-Id: <20220813042807.3533472-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813042807.3533472-1-raj.khem@gmail.com>
References: <20220813042807.3533472-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 04:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169299

This feature is removed therefore lets remove it from samples and
templates

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/local.conf.sample.extended | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index d24616c764b..a898b18d59f 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -35,7 +35,7 @@
 #DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
 # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
-#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
 
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
-- 
2.37.1


