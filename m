Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B65C47088
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.91882.1669557344544315129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0lT6GErF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id 4so7889782pli.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uknTsxd9yseChXNo9M3Hy/cBk4n02keF2F+rs7SIRZo=;
        b=0lT6GErFFOEzvFs69E6RbsUDtr9eR4wTvZYRM9g5B3BX8zwm93MxEo3lIUNyplatJb
         0O2nQumm4rfoqs4VhhHQ/t4ODUVd+amRhVN7BhvtXVY2m6+W9Juqn1UFTcH2fDwh8Wkr
         sw01/IQKem9a/WHZFKy0o7pIFXcdCPByMi0/Wiig0zpfUMsx8HeNwnyrM06MTCyOjAN0
         mQYCBAt1BJOulZ9alwddgxSTRSU88C+hZtPonROraAZF+En/wM7avHRljF0mhaY+4ZqL
         papaZcLY1IxUugx+IolHFcp0+mZH4qGB1nR2uBXd2Jy4QuMWWW8V24npSJ7K1AvA5/OU
         y7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uknTsxd9yseChXNo9M3Hy/cBk4n02keF2F+rs7SIRZo=;
        b=2wUMov+RXUl1ZpdYYg+9L1bXRn9czrp+DN6SyxcGZfV3l2ceTtwuGRK8RPvHVuH8XE
         CJJUPRAB9A/8nt1A2GidqKXSHtPZbVok+gSu6JOkqSoM9d0TTtmXAvPGiMo3g3F9Ii9a
         XTH9fYZG+TpovLIWSQlEwYTvuU0zLE45FFThqTrQgaX5Dx6mC/8NQGJBmxwNzCEOqgHC
         k2rfJTDUoumYwvPxclpXcBr42PIRZy2fzJHnPZB+3xcWHrjjKCHqB67sNrWJDEkISIED
         rO187rLZ4liMD6gFUgYBP00ojW2XQwcBzLJY+gu4J6UnYj8u1xpT+VRMr+pv7WSE44S/
         gDEg==
X-Gm-Message-State: ANoB5pkU1QcTa9R4Xj5G/QnDDSX8XQcvtt8hSWHAJtWI25Z45GT1fl6C
	MPvfRKdbVDAYSFnt1cYHQVJMC2aJ/Y73AXl/nMU=
X-Google-Smtp-Source: AA0mqf4JxurMB30AAzzSYDzZZTRu7hD43YITbdGkijrADB5xirUNL0gnz48JoZaKZBUhBu1LxkHWgw==
X-Received: by 2002:a17:902:f707:b0:186:4f38:dd3f with SMTP id h7-20020a170902f70700b001864f38dd3fmr28370859plo.172.1669557343569;
        Sun, 27 Nov 2022 05:55:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/31] linux-firmware: upgrade 20220913 -> 20221012
Date: Sun, 27 Nov 2022 03:54:53 -1000
Message-Id: <bb690da6ee765c40230f9919b012ceb51b9152ea.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173852

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years, additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9f658c724b6635e5745f30b25601bcc51a004be4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20220913.bb => linux-firmware_20221012.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221012.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
index 8f921e2d0e..6ba59a34c2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
@@ -71,7 +71,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
-                    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
+                    file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "98ecc3d3223df7ebdc23b0ec56aafb20"
+WHENCE_CHKSUM  = "d6d9d74a344a78028e6b0f1df80db14b"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "26fd00f2d8e96c4af6f44269a6b893eb857253044f75ad28ef6706a2250cd8e9"
+SRC_URI[sha256sum] = "e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5"
 
 inherit allarch
 
-- 
2.25.1


