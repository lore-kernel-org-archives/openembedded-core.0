Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A51C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:29:00 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.2745.1648607339860089348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P0UPTPwE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id l129so7858654pga.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gVGVuhz3b8K4GTg2023+SMvl44DEnPf9SaJgUBE18TI=;
        b=P0UPTPwEoyOua9fkqSa5JCG0MBZ2awkIb0P2H5gUNyfsTklgFMXVhVgp9NU9xs9Iyg
         xCKqG0rDkcO9GTS0QlIGcDPPIoD8WqKPkrhT6FPLPwATJqcK42mMPM05VORtTbDaCaF9
         h6bv7i1RYKnmmejj9ToLI+HsFKhDDouh251jydoU+Upr6TjC9DPiJ001ypVDnNIUyqpE
         j/bAJT4oz3YgMtIYL/JlhvnMpr/RKZovoUl28kujjfOmt+8HIyzB8QRTm5W4yOhP24Z0
         og2zsDl+6dLGWGazcoM4kIH/i2oOa+Oy6eQwDOnvIXqmZ12+E+ozrazjp3QcyUVlZXwz
         mhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVGVuhz3b8K4GTg2023+SMvl44DEnPf9SaJgUBE18TI=;
        b=5127cyO/PuV5+veF6VhKy77gIrZJRn+myGdUpU8nMWo2b4q/XukLfMgzlSaPDw53qO
         /grRYeOtWdQP1uVyUWV79sPkQKLRM2Su3CGEjp2j0UzplGyJ7fJv6GPPAu1UFvYkS+yd
         nPyMtqSiMDWWOx0ImfczwbYJaMo/qLU8RsmRy/Zf3YOr47HHA6ky1K4/neeijEdmLZ8D
         iREXQqld5akqFasdJ/VC+soNJFl5ngeBY+Py5VOuSU8IC2rbwUPtizg4oqKBc2JNX8st
         fK4Rw5hxyGo9mxETv+1kwAOLdzo89/an/wETpKAQ7cGgLbXhnRCqT4diufDLoZzVwl7g
         izWw==
X-Gm-Message-State: AOAM530TuTUfFi//cQDunEkS1ZdhkNYR41KucgAzx9Wro9/hl/aL2W8S
	wmgD84GtrtyJMYA+stzWtOtkm4ppirzeq/0MpSU=
X-Google-Smtp-Source: 
 ABdhPJwkt9T86qjpRYexq5VY9bYnd+Jxss7JeckwX+rl1stsjHHWrHlYlF2lRDcqfvHkGnvR1pT1oQ==
X-Received: by 2002:a05:6a00:1304:b0:4e1:2338:f11e with SMTP id
 j4-20020a056a00130400b004e12338f11emr30885325pfu.24.1648607338945;
        Tue, 29 Mar 2022 19:28:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] xserver-xorg: update to 1.20.14
Date: Tue, 29 Mar 2022 16:27:59 -1000
Message-Id: 
 <aa2bb4f62dd7e5c6fdf220264c3d62fbf2cc7d16.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:29:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163770

Fixes: CVE-2021-4008 CVE-2021-4009 CVE-2021-4010 CVE-2021-4011

Stable branch update:

97c5b7777 (HEAD -> server-1.20-branch, tag: xorg-server-1.20.14, origin/server-1.20-branch) xserver 1.20.14
35b4681c7 render: Fix out of bounds access in SProcRenderCompositeGlyphs()
67425fcab Xext: Fix out of bounds access in SProcScreenSaverSuspend()
6bb8aeb30 xfixes: Fix out of bounds access in *ProcXFixesCreatePointerBarrier()
acc50e609 record: Fix out of bounds access in SwapCreateRegister()
5ff3310b6 modesetting: Allow Present flips with mismatched stride on atomic drivers.
574fe59ef Fix RandR leasing for more than 1 simultaneously active lease.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_1.20.13.bb => xserver-xorg_1.20.14.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_1.20.14.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index 424d81add9..d176f390a4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            "
-SRC_URI[md5sum] = "1724c6efe8599fb0dc6c69c5f268de71"
-SRC_URI[sha256sum] = "26f801f4d92216995f389873cf3b4e90069cf63e94bc5dd09ebbf7fd7e1ddcc2"
+SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
+SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1


