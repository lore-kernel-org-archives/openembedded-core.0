Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0709C636F7
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.8120.1650463779272202233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=R4gMlRJe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id p3so695244pfw.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JAm0T6jp7fAMKlJ3/RuLQkWCWQTZridZ5iMHuSblosM=;
        b=R4gMlRJeZdeoryhFYMUoR5Mz1N27RRuToHTVddluTBohNvM48nzpZjlFbJDEgkL1mQ
         ePTpK+dKyd/0CD2AQ+KV7ZIYWTWb/TRZHxeKgYg8LLM0k5dpRZpkdAeLEDUGvYIVx+br
         pfnm0OKsXzje72TDPKuLl20VYCw7aJ49KaHE1cQNsOdpsoKmgQwyVcEOFlkobu7MJUdC
         mZGk2IyUW4oRM9PANVhYdJIYLLX4SK1tpWOpJ7grzCpihNI9v9P6hJRMy3bEjlRFahMG
         gHYECsO84P8pEVWj1GhtKjr6uMSCHbL3KSXWYG/chyqY6sMzTNXWHyx+hagt9jEXtiBV
         wsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JAm0T6jp7fAMKlJ3/RuLQkWCWQTZridZ5iMHuSblosM=;
        b=UuRDfML8fQznuawhYwh+ckwVagcM+fqLOmmfjjAjPjnNnUIS8K2852RWoeFihJcFTh
         wUJUIVqFTei0A6M1qrcDzRgNIWRtcNfPu+RFb0xRhOiW/1R6TQRbeg624vnXYxcdJBt8
         NwOAtze35zVGtVLcqGAxkOyernWylv5VvSJ5c45Vb8DUAVG02frX1i1jyZhgWOoEHzPZ
         N9rvjQcmh8NPPnIBCf1wI5jhhv4FOfMeAB94wxq/tWqq7yciHQfU1gWumxXRdEKEPYhq
         q0yuvX8b0kRRz3kFYuTwMXPZHLGMSSNgUhhsnGFwYAjh6puLcZm6EQOVJX4lMFsGQlbk
         4mXQ==
X-Gm-Message-State: AOAM533LSJpiaHUPLrrEqsiUkqql9ls/Z4KWCqt+oArdNLDJKFz6QiLR
	42+m9RK8HSXAEJ5QKg3gQUzpOnML6afYaKBgko4=
X-Google-Smtp-Source: 
 ABdhPJwohILKwpoz/NFjmJMHo+Ky51e7tqODUo5BUoY3nL+lWlmZWr0/8egPVIVWOUQzz+RZgHG3Qg==
X-Received: by 2002:a05:6a00:1304:b0:4e1:2338:f11e with SMTP id
 j4-20020a056a00130400b004e12338f11emr23712064pfu.24.1650463778401;
        Wed, 20 Apr 2022 07:09:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/27] apt: upgrade 2.4.3 -> 2.4.4
Date: Wed, 20 Apr 2022 04:08:11 -1000
Message-Id: 
 <3b334123a631cedacf6dceb1b019d4dcac1eb569.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164691

From: wangmy <wangmy@fujitsu.com>

apt (2.4.4)

  * Recognize Static-Built-Using and order it below Built-Using
    (Closes: #1008759)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c63741294c6322e6657f485034e434aab9fe2d8d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt_2.4.3.bb b/meta/recipes-devtools/apt/apt_2.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.3.bb
rename to meta/recipes-devtools/apt/apt_2.4.4.bb
index 27e455747f..9faf1e7ea9 100644
--- a/meta/recipes-devtools/apt/apt_2.4.3.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.4.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5a7215ca924302da0b2205862cd2d651326eea222a589184ec6ce663885729f7"
+SRC_URI[sha256sum] = "d6d83d122ddd7cc83b2c2f839a55940c13ab93e5cf6024a010d6a6b4110dcf0e"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.25.1


