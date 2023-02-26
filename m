Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAFEC64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:56 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.69586.1677430969348120283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6jdAH0aY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id p6so2269707pga.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWCIsNeZxac7FpPAaaFhCClSmEHalorBM8SXNfJScM0=;
        b=6jdAH0aYgaSHSBDULuCWUxX4E5gn+24z/W/qzRbTvbRj3K8BiSxQzezH0qP8cbPVjn
         M6uvHeACVCIqku9Pg3TmMJTYKKVIsvxBhUzqHzgglodiiBRQrKniVfFhQOdiYhdQnjZ6
         bk/k1xw6+2X9BDyuiucb5PNnWstl1Axqx0MDT+4Uvmlmm0epAjsZIovcIN+XTeYieWaj
         bN9UkzBnFBMp70dtpqOzXIo3/dZNzyMZF8SRiOvASvtmg6g0M9/iRR8fAxv8KhTz+7wo
         SKOJDxLpw3bm9jkJMPQFfqJdypWcGOqdk9qnYaxkMrTgOvxOdqm1l2MmGoCVPm3mBMCW
         AjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWCIsNeZxac7FpPAaaFhCClSmEHalorBM8SXNfJScM0=;
        b=Yoh6JfpQ4a2k16e7CBASVj/cffV142ZoxJkaeHJLIX+RFV/90750AMhHhvchbOsplY
         3zBjoHIUk1upmaIv10JmuvdrL8jwJfxXn72GDSlxzuwkVOgyTo+YnyiS3zfooYQE2B+4
         Xrtw3twZ6oLDeT+AXkLPLJirm1Jwmix2+eCVa9+qZqVP7HHswbbtKb433uG5F5MUwXBd
         YRk7rKh0fqt1K9BRQnylob2oe1qnsKHTmIWpDd47BzNkR4Mpa3uo1VgaM2gAxXgLrCq8
         WbekBGOIU5P/j/coy+dQf3dmqiuYOzM9BAWoRgvVUnffnQlggukiOlh4JM7mru4a50hn
         j4vg==
X-Gm-Message-State: AO0yUKXNqDDJwpgfSBawXslynw/Ip9TwDF1MlKceTq/hFf980wKglOFX
	QCqv1li7+5VH70xOyq+USRN0kZgJC2gwuXI2UIA=
X-Google-Smtp-Source: AK7set+TXANEp4vqrHTAPq+Agr6xRFApqLgnuA8gCDI3CrfHJOvmvshI7OvT/txf3Chcj6wJYzN5dA==
X-Received: by 2002:a62:18d0:0:b0:575:b783:b6b3 with SMTP id 199-20020a6218d0000000b00575b783b6b3mr19995586pfy.28.1677430968378;
        Sun, 26 Feb 2023 09:02:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/28] linux-firmware: upgrade 20230117 -> 20230210
Date: Sun, 26 Feb 2023 07:02:06 -1000
Message-Id: <0c69a2117cc7773a042bea5f79478c726b143f4c.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177748

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8e6134d39b840d96e1c37d3df21a522afea8bc76)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230117.bb => linux-firmware_20230210.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230117.bb => linux-firmware_20230210.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
index fa9e6f604b..bf5d4f54e6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "05f1d941972cedadbf667c05f6010378"
+WHENCE_CHKSUM  = "aadb3cccbde1e53fc244a409e9bd5a22"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "df11e25ba2fb4d5343473757e17a3b4cef599250a26b1f7e0f038850f0cb3d64"
+SRC_URI[sha256sum] = "6e3d9e8d52cffc4ec0dbe8533a8445328e0524a20f159a5b61c2706f983ce38a"
 
 inherit allarch
 
-- 
2.34.1


