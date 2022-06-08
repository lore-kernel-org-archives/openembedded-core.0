Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB2FCCA483
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:29 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.7233.1654699208210141816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XqiC2Zdx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso6791891pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8l7JY0F2p1ndCw1M+yqq/KQ1FhpKIJTJD0PNhmoz790=;
        b=XqiC2Zdxd+ZIIUP6fXJS0W/fTkxRCOpCdkv5xt4DQeKcn7RMMCASlUnutHfnAgRd0I
         w0FX9JKKczf3tJGN6yUER0R9GBGLGerLb1f47GuLNJVZGSmYczaptSTqAVhWiuUJC+gZ
         6hmJ1xvPMoR0E982U0URiQBijaeZplmWeBscpcT4Gsi4QPiD9W/LTTWqUKsHBfsNKfXW
         P0WP73lE9J9sEGWroCS7rgClCkBglNkPp8RGyX6vNatyn/7xbRDcC/6vYOtq1JcNxN2d
         iedA1czq8E9JzN2RKfu+TvN2nWI+OMXvLRNaudp7mptXCLgHtDjjqf+2uvVaH1/BYX/O
         2b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8l7JY0F2p1ndCw1M+yqq/KQ1FhpKIJTJD0PNhmoz790=;
        b=jCulyBWAFUPJYr3hnYXVd8gIECpDYD5hB39n8fgIj4J9QC3ivNK8E/6hOhDR462QHw
         FQzY5D3Mh3uuWi3eihxiIMNl4le5mc/scUboBV+XyzYhPN7ncJYbSl1GQRf5LuUWH9Ae
         AX+olbKkRmNxjAoDBhAhd8RwTq0L1KeACtYT/0dwILm6lvIAS2FMF/P6f65v4F5Kej26
         ZqDRK1I/Mk3LnwgxNRw2QbsPSn2g+qMkQnJFjTnn94TMN6rrzPHUFG6vGe3LlGTfFsza
         G8vEeuT+3ciJLbXnrTT36kZHkYta0TeZw6y5ci0fJwuguyF0KH9Ui3v3+a61+tkrHuAv
         eLUw==
X-Gm-Message-State: AOAM533Yyco+TbPPCU+IE4skVS0FAqc+I0eFBER9goqnIOeB8MU7ISOI
	rDGxDNfap9HH6oJX+TapERaKHIkKaDNpFDg0
X-Google-Smtp-Source: 
 ABdhPJwJXFTCcFx882JqGKvBVZGQWkky4OcHEp1XMtu4TQFZ3Epn/0h41mZmPol08kO1mfqAufWDCw==
X-Received: by 2002:a17:903:22d1:b0:166:4bc1:a1da with SMTP id
 y17-20020a17090322d100b001664bc1a1damr30489898plg.13.1654699219084;
        Wed, 08 Jun 2022 07:40:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/22] webkitgtk: upgrade 2.36.1 -> 2.36.3
Date: Wed,  8 Jun 2022 04:39:23 -1000
Message-Id: 
 <4e5437696e422631a1ae042f18412461242ef62e.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166721

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is a bug fix release in the stable 2.36 series.

Support capturing already encoded video streams, which takes advantage of encoding done in hardware by devices which support this feature.
Avoid using experimental GStreamer elements for video demuxing.
Avoid using the legacy GStreamer VA-API decoding plug-ins, which often cause rendering issues and are not much maintained. Their usage can be re-enabled setting WEBKIT_GST_ENABLE_LEGACY_VAAPI=1 in the environment.
Fix playback of YouTube streams which use dynamic ad insertion.
Fix display capture with Pipewire.
Fix the build without the X11 target when X11 headers are not present.
Fix several crashes and rendering issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69e1c72417a4ea5594c17ead7bff2f9a0298e6c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
index 65757c36a7..83b6f8a6ee 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f"
+SRC_URI[sha256sum] = "732fcf8c4ec644b8ed28b46ebbd7c1ebab9d9e0afea9bdf5e5d12786afc478d1"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1


