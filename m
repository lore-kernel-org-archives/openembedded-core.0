Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4DEC65BA0
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.13946.1650491493419136647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sJOti9iV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 2so3185043pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sT+PaJ4pLrwvVg0LAbYaPHi+531R3JuxznTdP94NB6s=;
        b=sJOti9iVf+SAZbLfN3Ek9fv4fmBfE9aII9xIKC4M4CPDMokFhVMcMDySF4WFe21FDe
         58xCuwg0KpjvyDKqfYGl5YfMQ/48Xf7jrzZ4zVpF5XAJ6jIkWKvAEtnO7nMZNylCdzzF
         TPIUcAsnAaJsKaPdNMHp7a5b3GQwz0sUsgXuz22EY1g3W9RrzC9frkJboy7rl1ViKMoW
         Q6ZFR4qBORA9ci6bJJpHcVPRBJaEK+WZbmQIUrXiSmpExeDEjZ5f9nOjXKrPF1/ZZ0hN
         /NqnuhuYzHqkCd1ulwQTwwWZ70gAQqYHbhq2Q8LK/SUwcANmyZlcenxft/ymLRVY+k8f
         0SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sT+PaJ4pLrwvVg0LAbYaPHi+531R3JuxznTdP94NB6s=;
        b=c9spTjZu7br5aPLFiMYMMiRwUR9Ov8U9dJEUi4qZsTuYKb3qk/Y6pX/zMuolhVZN4H
         xLJ5BLSs3+riOk8xz6Bh3RtQGojnQJMHCt1xKwZQ/fbOYofu1JJV3glvw/njlzbLnDhK
         UIMA7NgydIB7fibOBF6yLPfeErVL7UtUvxYV6z98/XJkK83+1wm3KlmqmsCNCZ6MBfql
         feINYUM4SD+WkIms5ob0VjcBgH3ZIG/0uV9/SIYBnoaOvj0Ox6scijMa3S5dor8mNjM5
         OJR0y5UHox8o2OOlwQfYI/sLN4X0/oSj+VoFzB5fVtoj8Bi7N4KFvqMJyjGF/9r6lN6n
         ry+Q==
X-Gm-Message-State: AOAM533d24kE4qEYnMCbzx+TyREf0A86VLKXDRZT2DesU3MekDF4eTk/
	NUqRXoAUQ3Hx39HibLxShwBXjTEqBeSHhQeL1lo=
X-Google-Smtp-Source: 
 ABdhPJyiyCEBWB5oz1medsbcLOOdSeKxX7R2wnH8Ab9puEmiI4Y5ZSSRbl/7wylgEQjgYW9c+8aYeg==
X-Received: by 2002:a17:902:d506:b0:158:d83f:c42b with SMTP id
 b6-20020a170902d50600b00158d83fc42bmr22413290plg.122.1650491492341;
        Wed, 20 Apr 2022 14:51:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm21102153pfe.210.2022.04.20.14.51.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:51:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] linux-firmware: upgrade 20220310 -> 20220411
Date: Wed, 20 Apr 2022 11:51:08 -1000
Message-Id: 
 <de880e23bff4e0da0306ec61396044e1f3b48aa1.1650491190.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650491190.git.steve@sakoman.com>
References: <cover.1650491190.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164728

From: wangmy <wangmy@fujitsu.com>

License-Update:
    Version of driver files updated
    Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01684df3a51be476081ee21eb54c24fef00acb3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20220310.bb => linux-firmware_20220411.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index 7a6cb1903b..04a6cefaa1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
+                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
+SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
 
 inherit allarch
 
-- 
2.25.1


