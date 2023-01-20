Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18727C38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:20 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.82052.1674238279366093535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FhIYopnx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id f3so4749467pgc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+Xjh6iU8x66C49jS0iNM5Nep7Ik4Wuw5UpHZtQ9cjs=;
        b=FhIYopnxR3XJqQhoAKNXsKyj5Bbzh9VFPLLmQhYhJIVmbhS6kqsNIKZbmYo5o73vH9
         6gWCVMLW9jX76NGOvOqFtjfp+FuFxaxJFlvEmoV5x9VvZ6irajTln9i4sWqNEL5IlzIW
         BQev39hMN4h2g18GSYnOhbYhzLCe9jHbLZpLEdhy0WGKjlDK/iznK4uZ1Mt4mXV5jrUh
         Ghe0zqNmwPlFZ1/wKPhYedpABsRstx8HrmjTVpi1+fM5iS7PxpUur6YYAvYDZADskpKD
         ajMtLHTa8Mu6goxWEwk8gpH0DhryYmZmtri9VTFi/p8F2sht+A9K8hfVXkQrSlH4oMaC
         Sd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Xjh6iU8x66C49jS0iNM5Nep7Ik4Wuw5UpHZtQ9cjs=;
        b=n/AtqZvTNMgC42TVPDCSJofSl2EqoNHiWqdf4UcyU+/JaCplhjldXPTjMnID06xew+
         d918bJL6w372uxPhBDC9bHwxhd0Yh8AzsMYzXBXWANSwgFX9NpVAt3ofxl6IcwOZ/o5i
         Y3LAq4bQ2VctHucDQcHgIaqBDMPMG10/mXGey8rUnk+eh9jsZQDwNwc2pX2FBzmCdZ2K
         SG2xOAiBI/jo2u0EhFL4flZX2/B01LYYpih+4FUCPz4HbqLk00DVxqKBb3PTJaUoc+xc
         sBRgW4b43l3mjZHp4bnaGfU0msCs4behp5uW1vokNzpPRiFXlvgdNBtmVC8EzlkycSSY
         UzxQ==
X-Gm-Message-State: AFqh2kr6myPUV5noI7buevh0ilB/q1X87WyD+s8CpBEKwdqNX9efwfpW
	3T7ViYAieTI3Ot97AykKzqqKGyvEQa0OHgTecQo=
X-Google-Smtp-Source: AMrXdXtqNO34Eis/7e0jwhBctR278s7WpqKtZ71L5n+IduBzMyWGIQMU8cX65m3xQ2ZA8pl3cVHFdg==
X-Received: by 2002:aa7:8619:0:b0:581:12c5:1356 with SMTP id p25-20020aa78619000000b0058112c51356mr16333933pfn.30.1674238278375;
        Fri, 20 Jan 2023 10:11:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/41] linux-firmware: upgrade 20221109 -> 20221214
Date: Fri, 20 Jan 2023 08:10:25 -1000
Message-Id: <7c31b7265f5b765f6a21852a90cd4e4eae0c7bd6.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176214

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15f3a9f6c4406ddc00f7dc0ca7e1beafe9c71a9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20221109.bb => linux-firmware_20221214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
index b05b960ebd..c2354e627f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
+WHENCE_CHKSUM  = "bf7c716d16e48fe118c6209f99b13253"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
+SRC_URI[sha256sum] = "e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331"
 
 inherit allarch
 
-- 
2.25.1


