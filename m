Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941F8C678D5
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.43540.1676990489758014750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aVLLqjyu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id ko13so5879346plb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyzG0llGH+zsOOxhM3PxyB0xaKoybihe9/v6KgjJMbU=;
        b=aVLLqjyuXEr5SAbJi7lOzxHCd3UzU4B5H3oMGaUOCe09kW1f9cThzPvF3SCWz7UYyp
         nURWbUiqVGMpO/o/hPFKvQajNMzErvOdHlr4/QoBe1CpYLbDuX39AafznMfoGBGH+2EN
         W2jyM6CYzFNwZbSBXEpvnaTul7lIzQU+zOCAkD5L0KlrOiWqXEV6dZhTOf3RxLDuXSCy
         amf0VmSG48vnTYdqNWu6ly346dwXNmB/9avu3t6WZYLb/LUEYA/OCInRK5141CmgRs61
         D2kE2Fsrn0WG0SPrV6e/4ZZie0b7cUHUC7nGlCkMHbc7oody24BivIxuy+BEbZIyMcps
         nn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyzG0llGH+zsOOxhM3PxyB0xaKoybihe9/v6KgjJMbU=;
        b=m2hzRsVsKhbLYpKC1xcdmiBPUBPCscQw8rarpfmXORVk6MVYiVJkHfU6KXuZhjOfrG
         zCs2s0vxVAluGqfMd9XRWX0RXZH2CBN+fPiF+Fy8FTJU1/6sJW6KYgmEmcUXoHsfMZG0
         vBhGvjMZrfEpTPzvQLptVULsmr+joA4NyTkCvpjwHTv86wFN5qij/yXYp8yPXlmqwaru
         SzKIkOsfy1KWpHQHUSOaRetYMeaP4F5Y03QjtDfEgT1uWacuvuYXIXDPOUsNwI6RvjJX
         jIEaPw02JtZDzys0aykJTMB2q5KvsAA66i1oNqwqLLjGDYLtn+S4exkMRyQY0yzTK7Mt
         LQ8w==
X-Gm-Message-State: AO0yUKX2xFY1qUkNZZbFX9GT90qHwCHzCU7AgXBdwfWI8JLnd1zvH8Jv
	TwyAZXduZJitt2lyA+Vu4zqKVfPtkpayGvXRhGs=
X-Google-Smtp-Source: AK7set/XaOWejajXp1ArL5UOMdByMd1EV1o80cU7N8d7y/cREECZjhvjMt5hiw8maHERZtsaA739Sg==
X-Received: by 2002:a05:6a20:b547:b0:cb:7244:1cd7 with SMTP id ev7-20020a056a20b54700b000cb72441cd7mr2781060pzb.12.1676990488782;
        Tue, 21 Feb 2023 06:41:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/23] linux-firmware: upgrade 20221214 -> 20230117
Date: Tue, 21 Feb 2023 04:40:51 -1000
Message-Id: <42246eb699bf9c96517bfc4e8788606cd4ba72fb.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177508

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares, copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fdb8c12fc71b4a985372f5d02ce59a1402c14c4a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20221214.bb => linux-firmware_20230117.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221214.bb => linux-firmware_20230117.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index c2354e627f..1dce06c8f5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -70,7 +70,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
+                    file://LICENSE.amdgpu;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "bf7c716d16e48fe118c6209f99b13253"
+WHENCE_CHKSUM  = "05f1d941972cedadbf667c05f6010378"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331"
+SRC_URI[sha256sum] = "df11e25ba2fb4d5343473757e17a3b4cef599250a26b1f7e0f038850f0cb3d64"
 
 inherit allarch
 
-- 
2.34.1


