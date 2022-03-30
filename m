Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB3AC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.2720.1648607337511358738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=caVtzAVS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id s8so17506857pfk.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TtaA5ZNPodQg5bXyNDSLZZOgW/3P1ItVPgcVa4jqris=;
        b=caVtzAVSCIYG0wSQSUu3w+i+2G7EQLiuZg94KpB0Q/Gzw8bNrUbePjHVkmva0t6Pfl
         hwPTg5RKfrGPG5E316vdN8pvJChuxx4uNvlqACejbiZAr6p9Ge+68q+IiA6la2ta1q6x
         t7/vwxgpl2euRxyWQUsp/ayAZEGpxWrjtdrppVmXuFxG7GYIIgjNEmpXVrf+o0YzHSun
         1lXzDS2xM7rZ4AcPOkSpWYuzU0WVlD7ccbcyn5RxbKGfj+3SP9HTM4Qx3N+em+DWvsyS
         tt4qV5M9LBnuVQqGRhhhlwT1fIxGFCW2MPJ+WPVro8glfM9BLi7y00N5SMDkXK5+X1dO
         uyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtaA5ZNPodQg5bXyNDSLZZOgW/3P1ItVPgcVa4jqris=;
        b=Meaj7ydNzMaU9chpesvyO3T61C7c4+v4GI2ykXQT7cja3hqpK3bG/T5x7f8Cn8MeWk
         FKjQKLsQmQb6WVckKwX/o4mEybDsV/8o/Rz7YaI1jg/OHIwL+PfJzsKyxsrbW9T9wNx7
         M/8Xg2zGIzOGGuVOd6yFzEFBOw/XF9wrW2dFu4vbnrMBxPbOm11HY371PmQu4j417T6R
         D/xudkaabESIzt06njSG2ppzSO7ElU7WZQCwxsxpe0oWyTOf4PNEnQ9wr2piO0QSi0Se
         xiVN3MgYxLWUVnvlDHOUlY1FA7O/VPZUxQoY28BmiW3j6+M1XSzAAhue+Xhyf1D7Ri4L
         AR/w==
X-Gm-Message-State: AOAM531ZCweTiz4qEsRRfQA6VoArcl9xtBcO4PGhHmhwnQM34cJTVMjY
	0Q2mwKnePARFmJWqKHYzCMxwOJXn22NWknqthiE=
X-Google-Smtp-Source: 
 ABdhPJzHjfgpvJiCKoo+T7tz2h76O3DIYb2q2oQ55MfduAAjACDQPYxEibCd6IWhizqF522YzovKeQ==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr30557634pfl.40.1648607336558;
        Tue, 29 Mar 2022 19:28:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] xserver-xorg: update to 1.20.13
Date: Tue, 29 Mar 2022 16:27:58 -1000
Message-Id: 
 <3e9ecd77449a5bd70a55d47db7a2dfb85d44d9c2.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163769

Stable branch update:

86a72cb19 (tag: xorg-server-1.20.13) xserver 1.20.13
f85e4edba modesetting: unflip not possible when glamor is not set
b03d7184b present: fallback get_crtc to return crtc belonging to screen with present extension

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_1.20.12.bb => xserver-xorg_1.20.13.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.12.bb => xserver-xorg_1.20.13.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
index 2b326082d0..424d81add9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            "
-SRC_URI[md5sum] = "8775d8c22de768107978202fcf240e2e"
-SRC_URI[sha256sum] = "71687561262e4527a7ef779193725416f70c3e0424daaa9a6617bd37dc7701bb"
+SRC_URI[md5sum] = "1724c6efe8599fb0dc6c69c5f268de71"
+SRC_URI[sha256sum] = "26f801f4d92216995f389873cf3b4e90069cf63e94bc5dd09ebbf7fd7e1ddcc2"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1


