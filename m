Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77831C64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:00 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.13849.1676902734753355872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0MH9H6rw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x24so723179pfn.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyzG0llGH+zsOOxhM3PxyB0xaKoybihe9/v6KgjJMbU=;
        b=0MH9H6rwiDif+J6X2ky9f+oLP1w24K8uOKccFs0v50NyJNuoMro7GCic1p2sfOQuok
         a0r0y6tQc5XFU3JRhatyk71jPnHCFX6s0SIVS95hIpzOghBRoImJ0MmETe8BAX3Qyfsj
         Ty1UYUVeV5AFn2IZOtLXXdoM0NokXfF4bacz6B9vQHn2Z6X3E2vbFOEHNMXNt2P/JlPj
         ccMZYnMvaj0sUE6s+63bYIRJBn/7r4lpmvYxy62vEg8Sy2oJWkuSG/EvKJYGn8ni8dsj
         QVfv+K7vNiSQGJruIuz8d9djgXi579FBVRzxP0ZrwNPZVv/GlIb2r1e/PYVoc/gwwKJk
         Q7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyzG0llGH+zsOOxhM3PxyB0xaKoybihe9/v6KgjJMbU=;
        b=zyvkPpE0nCXED7kT3fY0EwmMMJlMIG0tYf2VAkcawjuNi2POgojSmda2VNGiX59ScE
         2+nZ04k7PKx9DxGzEvjzhkPj6JSTMvsKVjhrBUql2iMDESu4wAhs1IZcgi3zjLYYv/Jr
         UK+nyF2hQCySTv2pW8NmX+BFrgZXnVur22Hm+OFJ73+6y11w1GwOwWQsojtWUKqJ6g6X
         m45OD/Q4JwJqqSrHt4IVCCQ/cP/gqMH+YfR7PmCCMMq1pBjMp+SitEOTRKAGn1zfHsZt
         zo2GqKFeIqz5YPPy+7P6UXVAxMeSaU0FAbBE2ptjGwSPs0oPWxKeI3ZEK1QLOoj9bH4/
         oQqA==
X-Gm-Message-State: AO0yUKUd8VfLnyy5JfOqk41fJTBqS/u7HgoeZJYEyMEovGqIrR575m/m
	6GhTOZ/RIepC0/HzZGX9wUP0vgWqWFh8Qa+jWs0=
X-Google-Smtp-Source: AK7set8freOEj6etVDs5z8HFd671L2QzoPLk/aFPVobR6rnwzb+pG4wVK+tbAEpErri21fUS7dQujg==
X-Received: by 2002:aa7:9eca:0:b0:5a8:ac19:8f42 with SMTP id r10-20020aa79eca000000b005a8ac198f42mr741235pfq.14.1676902733833;
        Mon, 20 Feb 2023 06:18:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/22] linux-firmware: upgrade 20221214 -> 20230117
Date: Mon, 20 Feb 2023 04:18:16 -1000
Message-Id: <3291c8ecf3ecf48f88175466425f2f0b0be69cdf.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177415

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


