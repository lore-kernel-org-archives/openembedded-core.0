Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A401BC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:52 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.46689.1669908343181933027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4y68hgMe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 124so2226246pfy.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AMfe/0BhP3+NWA/mLoYZcm0Tn6VGOGgBT9ySZvKnXo=;
        b=4y68hgMeMobA3tuCejEC0aPdI/dkjBjo88TOzdyoRSrDNmZw9WPQoSuKZABgwy0qMe
         paka7/veT8Wmj/tVnJztDJtIenRsYc7Bpat99Vynl5YP30Y0C14Fjl8+484bBei1dXXu
         z5dk92E8GuwU5MbGy5Hr8FShM7x1qRyUn1pexQCQmG3U9FdaPUFRLe0kV+or+TRXVnhy
         MKv6vg6ayvodDJ3wh3Rk36sFbC+lchXZrFhdJx6aJDimten9Z6wjutkLLGTxbmAoU6wV
         dbtrHSjC9CD+ehWfJyhkBgDin4AXn6znLqm6l8GR8v4gHWIaJcwBeGmgr5eh/iG1IXtv
         OMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AMfe/0BhP3+NWA/mLoYZcm0Tn6VGOGgBT9ySZvKnXo=;
        b=f0asfyqZ7qLLmNCKV5fZ18WUgqOUymbF6vNYbGgvimnIjlTealfVRg6kHSRv9J5HLm
         7+2Of6F00JAkSQq9LkqQP/LdpN+Qe3eZqwvGkbxt3roHLGH0e9rnsml0bmaGTq7bsXKY
         5s9QEPl2AI8pPKqf4wzYkG2jcbzbyjH1gdpZ9QTLyOiOh7bo7m49weakErCsQqyPj/A8
         jY50axQDHOArfv46c7Ltk9RNk1Ur6rm+cUUFWBbFUaI5Tugf+f+IMOTN314W5UeX+gyb
         ZIY8/mK0lv9qiBJEitWcla1m+L+m7TJ8SYSN6ottYi4rVeOywn0zkQ6kPiLuDHjuhyWS
         V1ow==
X-Gm-Message-State: ANoB5pmva5nogD/TDTsyVGhLdg5BgaycWFDAV7476WAeWs54v/o8wDMp
	6L4KcycGMjrXXGu1Sfv7jsTA0/eXhN6htK4gqBI=
X-Google-Smtp-Source: AA0mqf4dte7cCAQug2HyemovT/wooZtOCtHIDypSiGgHMYvnkYleX0o9rDiMejhkPGhyIC4mcIRJTg==
X-Received: by 2002:a63:5016:0:b0:478:538a:aec6 with SMTP id e22-20020a635016000000b00478538aaec6mr10080807pgb.290.1669908342205;
        Thu, 01 Dec 2022 07:25:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] linux-firmware: upgrade 20221012 -> 20221109
Date: Thu,  1 Dec 2022 05:25:18 -1000
Message-Id: <922deb4ec740163ba98b3a47419ca6b3fe5eaef1.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174117

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
index 0a684ba874..8c132c8f34 100644
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


