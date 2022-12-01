Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47FDC4708D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:42 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.46687.1669908341446099679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=00oeQjf5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so5534137pje.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ButB0kHTY8APGv5Ep2aZ55LoDO7XFVhrEarhsEWTQsA=;
        b=00oeQjf57obF0xRS/3IoSBOpU1Ck1pMtmDS5FCBBctnHJV2HTAwzG3H0zMlp9jiF3W
         6z5thdDMAQcMHmB7rE8w9apsf29FzBr7CMkRMk3ip/+ElRTYlnmVHgrErucQP0XlQaWh
         dx3eTQAWIA6pOgeu3ZpnzsLS/88Sr0bSa2AoWA6ZJm/rcBZU2g611WHU5kvWAhcHrKGB
         RhLxOa/MX6C9YJcnjW40n10lNPxgXC/rv8vRVwKsnO80qgZ0LDGmTFgI7Q187OGrTSWE
         ip9Mf0kHT3TFSwyd3GOhnFnf2JDiV5bt2bTiSiQnWg3YPyoIY/0k1tpvDq9HiwhqIUHt
         vJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ButB0kHTY8APGv5Ep2aZ55LoDO7XFVhrEarhsEWTQsA=;
        b=4AWSpVun+FX7QktwNzUxPE8JPUxurgLrF/WY8KntDEIgK//9jya2YWp+XqjWMzVraY
         fdSuGla04iy3ceg6QfxagVkbuCtkEVX//W4oPTyrIhx1IaB2rr1zGeRerguNDIVy7bQr
         pMfDoJKRppXCr+toHFVrAuClsn9NYx/Hm4QsqmQ/eG8WWOPxkrR7lkoiQPPxZjAb6g5e
         pDvd4N7vbg5PbpBvDbeEKswVrQkSGNdssQ7OOVY/5hINwZ08hq48N+hXWIt4AjRcAf+A
         C1axvT/ntRYMqKLe9gcaBJSmoFn1Y/UVfMHad7FB+adlpDzluKsN6o2ByhLYqzcrbPDp
         8JOA==
X-Gm-Message-State: ANoB5pksiNQBrQIdzczCi0GWoZ2y/1j5iUuZ8Sswug7e1mZlokLCgG0D
	j1Kk4iSYPde9NhO2E9GDC4G1zmJ0nEaWBrK5Ca4=
X-Google-Smtp-Source: AA0mqf7+YZ2Gq93f5eWeuT5FJv0+YW/Li/0r60iTFEIUKMmuIH3AGpRyak8EsrntcmlBCc2yjJUNeg==
X-Received: by 2002:a17:903:2c2:b0:182:631a:ef28 with SMTP id s2-20020a17090302c200b00182631aef28mr46677431plk.46.1669908340372;
        Thu, 01 Dec 2022 07:25:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] linux-firmware: upgrade 20220913 -> 20221012
Date: Thu,  1 Dec 2022 05:25:17 -1000
Message-Id: <f33c9d8f62ebfe8855457d92d2055cbc3fa54ce5.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174116

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
index 2baf4bbe49..0a684ba874 100644
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


