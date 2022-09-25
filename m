Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E607C6FA92
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:42 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.20278.1664133516436659479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=D1sp1paf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id f23so4444294plr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=js6PEGDM4yBsC9rx5W6mH45PFoKQQfHKLE0pWaJthvY=;
        b=D1sp1pafosDPo0CbQvKN8vHJAH05n1d96G4mSjT8DpHWCY3FM3OdG5AGHyDK08VRp2
         o5lk0776W4Adap8CpZLSsoLe6xgV2zxiEP3TcoBamuPX7i4EV/d42a2f9GVJ4SPvT6xq
         jNlv9hVJXQtMGcbZU+Yy1hlhq66kIC03vdplYzueFAZbJShCQR18Auk8Ted/xsUvfsFZ
         WyP8HsH/ODdTSaXj46HXBIP/erjdU4VZKUfm++0v8p4wQKOeC1rvPUdx24/Vvzc7bU8R
         XbYZYlfCBbaWER10D3rbB7zByR3lMB58OQrWs6wpBeaAnlPWrPbi5WsDZGZ5BNTXt1Eh
         nWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=js6PEGDM4yBsC9rx5W6mH45PFoKQQfHKLE0pWaJthvY=;
        b=epb3+pse893ZDRkgiuCUtNIOq//K4YaxrI5WlFfRQOz5B5B8BaYGG2RulM6rQLUqnk
         Sm4HHGJw+y+jNXCHMbEfjizpN36Aldnl3UuLgjULo8+0gwDNHv00SnLK7wjGLMUizXkl
         OXMUnp+c6rTmKPbhDRggxqce0yZE15Flt8uCfs6v/hbVohEO2LoP1kC+PT1zmut/yhNf
         s3QA7At16Q0s4L0JYd0gSNoqXrVkAz4z5RHD3YV2eq7tzPovER56g1+Y+Y5P9d16Rn+A
         dl9oS2/2c5yKbvVF0VvnulI1xGySabXNsplj1mYgcqyAXeJa6fe7BzASuSm57sm6fGpq
         xWjQ==
X-Gm-Message-State: ACrzQf3xrIT+lsO69Tkf/aUZNTOaFHOemPPC3upmy8KVp+Al4A32Ruh0
	LxnPKe+xh4bPM9uv7DWBc6TOx2guIW37RgRb
X-Google-Smtp-Source: 
 AMsMyM6ZHDCYwC61+kc7n0nndWdiWvm+3l1fkwiF+BD1skFcynXLuZ/yqCj6R4H1eak0e68eyNd1lA==
X-Received: by 2002:a17:90b:4c41:b0:202:78e9:472b with SMTP id
 np1-20020a17090b4c4100b0020278e9472bmr21359805pjb.207.1664133515479;
        Sun, 25 Sep 2022 12:18:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/33] linux-firmware: upgrade 20220708 ->
 20220913
Date: Sun, 25 Sep 2022 09:17:30 -1000
Message-Id: 
 <5f04af95019926970dcabe755645d167ae46189f.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171033

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional files
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68ce822b765a7b67f8cc8590688860cc2530cf04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20220708.bb => linux-firmware_20220913.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 91c32e49d6..5a953fd0e2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "def08711eb23ba967fb7e1f8cff66178"
+WHENCE_CHKSUM  = "98ecc3d3223df7ebdc23b0ec56aafb20"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "0abec827a035c82bdcabdf82aa37ded247bc682ef05861bd409ea6f477bab81d"
+SRC_URI[sha256sum] = "26fd00f2d8e96c4af6f44269a6b893eb857253044f75ad28ef6706a2250cd8e9"
 
 inherit allarch
 
-- 
2.25.1


