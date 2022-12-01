Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CD9C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:52 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.44637.1669904623560068754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UrBGa5FR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id k5so1986715pjo.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVcBAZu2fw/QbTT2JR15Tb71TBZDs9x9YxqyL7S1kCg=;
        b=UrBGa5FRIRm0N4KeMGFMRBWRr2HiKymgryaCTLkFeOR+vTk5Tsz5hYq7ftrdcHUpY3
         wuPTJUFvQ9mp9E0JRwKTui1Wcrqoyw9/s6uNWAR6D+Lt2KFH5CHbC5BzOFLSn1ulQVBt
         nLkeDRKC47fpZJbrvs5/bs30dfGw8Ww3r3Dm+hdkdxpbsgsAfbR6bBoT9mVz5y0rO5jr
         4hdVHDZjWBNAJjc6HTxqUIeY1u/qkwIAmYj3FcNWMGBsBMR99CvUeKx5l2aOZYuNmKPo
         uv5mMVM8wyDQcXvRQ6hvOERZKCq7E9fGPFiH0rfmiGVK9DbpGA3qJ2t/OX50PxvlOstu
         miBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVcBAZu2fw/QbTT2JR15Tb71TBZDs9x9YxqyL7S1kCg=;
        b=ErGmEZIJ+s9pOiUaU4yduHttMf7gqxMcH1xYdtUULqmA6YAb0DXJiED1uZVvpbdJlu
         ETS45GTVKU1OToxCRFZfQHbj3r5A/5SEr43UUf7x1F6dJq8yaJMItARu9bJT04AsX23t
         VoVeRIRK5VYmsZSeZOZfy4Ei+EG8KuZzyow4BVA9RryI4oTpnlD7CBqrW2PSe/KGbY+D
         c/2D9E75nMqQntdmI6lkNwvzHahBUorAYmoug06PCUSYcj/E3kUQIOUjIKq+V0zr6F7Q
         cZ6yv2sqVwUpammDdh/Z5AVECK74IWMZ2C16EvxzwAE5jIpqnPadHZ7GWfErfwPFX8HX
         5ghg==
X-Gm-Message-State: ANoB5pmDakywEPHjtG+O6X5JXlVkxP2Niqzwd14twKuXUWC/VjCn/Evi
	VORSCQnHz2IqNbzQYNOMeQ506anLAWGClfBqABc=
X-Google-Smtp-Source: AA0mqf5hoWBVxLf771UTEMoH4w7+wTnbondOSljyUYbQnc6wDHD1F+UJqfDUSbDrsJl0meh7dmRk0A==
X-Received: by 2002:a17:90a:ea8f:b0:219:2e8c:d1d0 with SMTP id h15-20020a17090aea8f00b002192e8cd1d0mr23892949pjz.57.1669904622479;
        Thu, 01 Dec 2022 06:23:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/22] linux-firmware: upgrade 20221012 -> 20221109
Date: Thu,  1 Dec 2022 04:22:47 -1000
Message-Id: <8706a9a935b758cd90efb476a91a2bfd063503af.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174080

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6940f297243a66bd58d6adee7d690bcee9b9ccb2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20221012.bb => linux-firmware_20221109.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221012.bb => linux-firmware_20221109.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
index c7ecee0d9a..dc977c2bb7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "d6d9d74a344a78028e6b0f1df80db14b"
+WHENCE_CHKSUM  = "ab4ba608dc4b757716871f9be033f0f1"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5"
+SRC_URI[sha256sum] = "c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701"
 
 inherit allarch
 
-- 
2.25.1


