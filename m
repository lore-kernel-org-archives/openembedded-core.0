Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69769C3F2D4
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.4029.1657773404551804504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=O8no6a19;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so7142552pjm.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=um56lL3QWZ3G2yyyOlhm9hZVhSmlAYOaM2kuT3KFkF0=;
        b=O8no6a19bHLtc1gyd900SPCVXRv9iIxiQMRP0cn1YTlcbdxsgfp3nnEYz5zM4lz/Ou
         prdS6w/eTAilbDDlaRlz2+/N206l+LQuQAF+o4QO5WYVZAxQwJdEDxAowquOHoHP689p
         hmEWyREMioMI0W+nN+zkXCKnPDpVwh2mNGxPa6/NANwmro5sc3h2krd6xQtbaRdcuWMJ
         Ip8OwHItrX6wpD25ikyzFisd7Z7ZVJhNk+ij/QUIfPrhisIf1UCA5BLYVfJ5ogH7xBr7
         hQVVP666IfDK4Lk7RhDPy6WjkIbw7CDefwDsEz8NrfxH6qTQ1F4J8fieXYiC6aMsd634
         jNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=um56lL3QWZ3G2yyyOlhm9hZVhSmlAYOaM2kuT3KFkF0=;
        b=zlv8Vj/YFg33r/GEuenSqlMMWJuQb0rti7FB8O6t7MtYk2V4cfUyHAe143LOpvUaIy
         X7AvKfU4AejBHeP6P5AS2Pk6LsI8PM/XziM+lnavm77uPbN8xxgvSyF4Je+RncJN2sYm
         HkXk/DzfCRrtcyE+o7me6wJFKKbeowxTZ8Kn9Sv5eWYempQtT75uEMPyzjC+XLZ1zbWA
         6nzOmqb5ERscuSMStLQ6/gQrXiAl2d9LoBfyMb5bko1Al8Vg0Hrr0jJ33vPA0EManRCn
         kMXQSuwrNZMYPUMGaOZh4DVwnDLMFH15mkCGFMGcDsFX+Q8Ru8IWTxNo0Rv+OEym39UT
         wHtw==
X-Gm-Message-State: AJIora9e84ApNmFoC8BJoECu1Jxy4D7rYFbmHNEuR3/baX+wdSoclrKV
	IwExjHRrt8ZFmdSDkjCEYDKFvQ0Deb/ZPcdz
X-Google-Smtp-Source: 
 AGRyM1veUK+zMwRHO0N19CkkGBv1Yg0GsLbv3Gs8l+h9lArJeyYZY/0sVkOFsJrBtEodZyrjOwsCYg==
X-Received: by 2002:a17:90b:3b8d:b0:1f0:22f1:27d8 with SMTP id
 pc13-20020a17090b3b8d00b001f022f127d8mr14066581pjb.56.1657773403532;
        Wed, 13 Jul 2022 21:36:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/27] gst-devtools: upgrade 1.20.2 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:34 -1000
Message-Id: 
 <84b2d193fa4d22c012a8032b4de6f581406a2720.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168011

From: wangmy <wangmy@fujitsu.com>

The third 1.20 bug-fix release (1.20.3) was released on 15 June 2022.

This release only contains bugfixes and it should be safe to upgrade from 1.20.x.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74bc037120fa9f00def7e8df6b3a77bba9c9031e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.20.2.bb => gst-devtools_1.20.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.2.bb => gst-devtools_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
index 4819a34b26..c515e173c8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "b28dba953a92532208b30467ff91076295e266f65364b1b3482b4c4372d44b2a"
+SRC_URI[sha256sum] = "bbbd45ead703367ea8f4be9b3c082d7b62bef47b240a39083f27844e28758c47"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.25.1


