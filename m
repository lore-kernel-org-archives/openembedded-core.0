Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038C0C433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.339.1652841073825372834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xbDl7Jkn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so662010pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wKaYMS+pIGu4eYjsK0rIgG/blPdFqdcANVWSI6JIcNY=;
        b=xbDl7JknJmI4yj0OO0ollQm0tB2TzUxRQYAPmNNHTuZ0r6AmTywHE2lm4OpVtYlH7p
         n9cXrjXo4cDV0Upwk/2t77ZIjP31HL/u4xzW6zwh2zBz/zr3ypo9ITruMOfd39XBpiGe
         Fi6QlBIkyJNZrVuuTrNZ7PfsKQsZFKK5z53t0eg8pZFBcueYwqO6UXnM6LzCyyuvFBfq
         vmn3R0eIx41/OqzeHNlfWNPhUO+8OeoWkKFoLOV6S5hjxUJldQo9JmBYF/9nbEsVehL4
         26+ISAOciDQqoQ9I+b6wkglBAF4/NqUoS8iW4S8lkioiayCaJOzUohtHwAloMrUSuKrb
         tcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKaYMS+pIGu4eYjsK0rIgG/blPdFqdcANVWSI6JIcNY=;
        b=sqMQR1T8d4FIdfhFiVwbk5ZJgvD5jfU5wnk57+R6mWfur7w9e/J0WgE5esvpVAa7qQ
         ZffYGLPYS4Jp2JiUmxh+QUvcnx3hiIBtVJn5/43bZpzUOUl+78dxioQV1+QctznFxLxL
         aHtA5ax6HpODCeN4J3WAcvaR6tstRNHD622OImiMxW2JDjDppwhpq3eSpUQxl03SuhCM
         l+mKIItDbgxoqaVRH/U3biXOn4rYBADyT6KbDfe8Ib4S/CXKLNUwKD7zJebnG1t5FfFG
         QLzt7DnUghRHt1gcD1GcUGLKVbk8RtDM6rRQpVRRLH5KI20c+c64QzlhIvGLGcd7opxq
         SFfg==
X-Gm-Message-State: AOAM533tHdw4mZZ1dt29oa6El5MqUuR4RhyzQV1sngmSLj76S4zZegmQ
	XIJckjcuLi2yQDbm/y6t3+ssMrHVwh08NeJS
X-Google-Smtp-Source: 
 ABdhPJz+HNVAz9qlSzASk9y/USs0A07Q7wsIkY1yHur1THvy5inhNiK4zM+hWrBs0LvyofMVgPEBlw==
X-Received: by 2002:a17:902:b703:b0:15e:ea16:2c6e with SMTP id
 d3-20020a170902b70300b0015eea162c6emr25059035pls.100.1652841072667;
        Tue, 17 May 2022 19:31:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.31.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:31:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] linux-firmware: upgrade 20220411 -> 20220509
Date: Tue, 17 May 2022 16:30:36 -1000
Message-Id: 
 <1ec7c6f0f048482ae902fd15beab5cdfc7b50c7b.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165790

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85b1fef733683be09a1efdb2d8b8ffe543053ace)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20220411.bb => linux-firmware_20220509.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 34ed0c04c4..ec92cae2fa 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
+                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -208,7 +208,7 @@ SRC_URI = "\
   file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
-SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
+SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
 
-- 
2.25.1


