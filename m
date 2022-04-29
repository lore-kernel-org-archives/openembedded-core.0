Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C636C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:19 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.12067.1651248132644033054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=u3EEDibW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id bg9so6846140pgb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HzDiREC4IEDuW1fGcjcJZTq1hOxA/pVvoK7f4Qq/J7w=;
        b=u3EEDibWnNqZDHgbOzhQWyUiVDmNRlpsLTBZsIYR2ZYKEZ6pKU1G+Y7Rg9xk/DdBAL
         nENl658KWP5Rtzxrw9dEnaGI4+A1eerJT2Fh8PuCgIpb0EB9kVc/N81sZDdXFKFIwzLw
         3cZJ0M88yhKNS7hAzqiopacSbeQd9vHrrYQsICTgcrAR3tgO374YomssNSvA3vln1ee/
         19m8Wity9e3Pjyv4BhgGvuaaTtPV30FyvS5RSulG94Kc7oryfpVw0HadAzvMZOObYaVm
         lP7PL+smBzgkcpKw30IAMv9YhRUm1F7FdSqLrPmwVh3P7wPwQKq5qcai/DcIpPVtGOuc
         aKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HzDiREC4IEDuW1fGcjcJZTq1hOxA/pVvoK7f4Qq/J7w=;
        b=wLlTR08tYoC3ofjfdXGoh6GThgTKbLSxB4SN2F14t2yKqgnv0lqf1gEQ/allR8bQXX
         RGyE/8ek2HhTM8J0fKqQiuSOFwb3LWdNuGpQ7TVyXn+TM65FQViNv0mvTpPMnPXQzyLi
         kNSIXz2Fmt5120snOpnUF8Pr204lCMGHfs6quuhfydPdjBXqOxe0JhRMjS68tUBhAe7j
         enqO7XEoabCvMevaA/5Pit3KtdqzsyMgCbk7CW7OtiI19oyH5fsq+asdRgEPcDt9apXd
         H3oEOgSPUOafn5xuqPlswbfWKcrvD+bx/wpSIfLx92eiV5ZJS8DbUGWxNlKph1dmPV6/
         NQCg==
X-Gm-Message-State: AOAM53244PrDMQnc2XJnpIvbInXq4O6//2K3zV1xBYKAPsZw8jHf8BE/
	WNNmNkLoHp59J5LjxOSzXPNq/hQR676cny7UZlQ=
X-Google-Smtp-Source: 
 ABdhPJyauNDXhIBuyAjmDJFnRkPpZzYHyNiad+HR/ue3TOYELiTTefcDGDaT44c1hy6tdbF4aF3yOA==
X-Received: by 2002:a63:8148:0:b0:3ab:6859:ae61 with SMTP id
 t69-20020a638148000000b003ab6859ae61mr71506pgd.556.1651248131417;
        Fri, 29 Apr 2022 09:02:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/34] gstreamer1.0: Minor documentation addition
Date: Fri, 29 Apr 2022 06:00:39 -1000
Message-Id: 
 <a7163c07186ab98b903bf11104e5c8a3baeba6d3.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165039

From: Carlos Rafael Giani <crg7475@mailbox.org>

This clears up some confusing packageconfigs.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5b682f80fba4a62cb1ff7050c97f5b1e204d5a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb                | 2 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.20.1.bb               | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
index 78e8f35025..f139281149 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
@@ -83,6 +83,8 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+# this enables support for stateless V4L2 mem2mem codecs, which is a newer form of
+# V4L2 codec; the V4L2 code in -base supports the older stateful V4L2 mem2mem codecs
 PACKAGECONFIG[v4l2codecs]      = "-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,libgudev"
 PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
index 9b9be0d326..0953261a98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
@@ -46,6 +46,8 @@ PACKAGECONFIG[ogg]          = "-Dogg=enabled,-Dogg=disabled,libogg"
 PACKAGECONFIG[opus]         = "-Dopus=enabled,-Dopus=disabled,libopus"
 PACKAGECONFIG[pango]        = "-Dpango=enabled,-Dpango=disabled,pango"
 PACKAGECONFIG[png]          = "-Dgl-png=enabled,-Dgl-png=disabled,libpng"
+# This enables Qt5 QML examples in -base. The Qt5 GStreamer
+# qmlglsink and qmlglsrc plugins still exist in -good.
 PACKAGECONFIG[qt5]          = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native"
 PACKAGECONFIG[theora]       = "-Dtheora=enabled,-Dtheora=disabled,libtheora"
 PACKAGECONFIG[tremor]       = "-Dtremor=enabled,-Dtremor=disabled,tremor"
-- 
2.25.1


