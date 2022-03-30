Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9427AC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.2744.1648607335557965952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SIRinG3t;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id v4so19267916pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QoqhdtWR+w0KSHSGo2blLGgOs0gdm+AovdT94ieHUk0=;
        b=SIRinG3tCiwCtyG2VXqb3PAfXXn6HlAJy1GTcQNN9hisJ90JrLlQrRgAiAKe5RxZ1g
         RuH1kSu5Hw6el8O40VUo6qHVBq24kKUBCw+Y4RVkRO96JH465zVKSNi2mhmRY4V5xCLu
         sKliWU4rIcZ8trVb9bSuD3ygGYWVkaRLUH+FZ7a1RHkNzIlMpQj0cunFQi3bPELR1SNW
         3gum840KGE0dq8/zPHHMb4P8FTEWblllOh9n9ZWTF/IxtRZwghANoeHkkuMF3ok9iVSD
         RUs7Hyh05uQsW8NwGXq4jXxTUBOVPZEAaAXFUJm0ZXgOZGRR6REt+PYF+vZnnM8aic2Q
         v0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QoqhdtWR+w0KSHSGo2blLGgOs0gdm+AovdT94ieHUk0=;
        b=D6hsiYwDAvkRCrqrbAV/FXSA9e8p35OEIadnFLVeqBrEYvrHxAduYW5QNjTAxKIH0l
         zbt2PhFN5z3pPM4OTE5PlpqdQ8UP7x7vOpQGk8+eqcyA3Gz5mIedar5VCBqM2O5EOImX
         He3l0e2mMv+IBExtQa1157ZVWKiKnYKdCaXNTV69rSuO1dCnM0FyGTL9ehVVFptqpTz/
         JLumuAq5NlymkoKjpZ4AAVdycGPMPMjZe+V06mbM3JpWq44SjBttgTeRb0KOS8DFdimf
         3mEedQP1MAFwROYYzECRXNxflYcxgb1JD0qH09lgetiq0BOregKTSdhAebMCuymPo1gp
         BzDg==
X-Gm-Message-State: AOAM532T3o6wPZqbGcw6UCUL0scaO8MJ75Z5d0+UuQyiYwj0ZogTOhD8
	O5AByVsmz0yczgGcVezVagflVQGGnRzQDkfnrTs=
X-Google-Smtp-Source: 
 ABdhPJy04LcT7QvVzXaxH1GTYv8rzWOumFS+k6w91J+BSoO0+2qZhras6ci2OBAB67mBZsQ+q8qrTg==
X-Received: by 2002:a17:903:32ca:b0:154:7cee:7737 with SMTP id
 i10-20020a17090332ca00b001547cee7737mr32517279plr.173.1648607334541;
        Tue, 29 Mar 2022 19:28:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] xserver-xorg: update to 1.20.12
Date: Tue, 29 Mar 2022 16:27:57 -1000
Message-Id: 
 <e8416c75630a27527faedeab218a8ba71a1eb5ea.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163768

Stable branch update:

b88ad0b34 (tag: xorg-server-1.20.12) xserver 1.20.12
8dea50223 Build xz tarballs instead of bzip2
b7adbac7d hw/dmx/config: Link directly with libdmxconfig.a
e49738f0c xfree86: Fix NULL pointer dereference crash
9a59631a4 glx: Fix use after free in MakeCurrent
1fc0ca6e6 xfree86: Fix out of array bound access to xf86Entities
a4210fe07 xfree86: Change displays array to pointers array to fix invalid pointer issues after table reallocation
22449f630 glamor: Avoid using GL_QUADS on V3D
d16f64031 modesetting: Fix possible_crtcs
f1e76731a modesetting: Update props for dynamically added outputs
7bf477711 xquartz: Ensure the mouse pointer is shown when switching to a native macOS alert or window
3ef6e7b76 xquartz: Fix appFlags build failure with macOS 10.15+ SDKs
2a83c840c glx: Set ContextTag for all contexts
394b6cc1c glx: don't create implicit GLXWindow if one already exists
0086535e7 modesetting: Remove few common functions from ms namespace
321964443 modesetting: remove unnecessary ms_covering_xf86_crtc dup of ms_covering_randr_crtc
52eb801d0 modesetting: Find crtc on slave outputs as fallback instead of returning primary crtc
c7a2da7b9 present: fix msc offset calculation in screen mode
31544e68e present: Use crtc's screen present operation for syncing
464cbee1c modesetting: Initialize present extension despite glamor is disabled
4e11bd390 modesetting: Disable reverse prime offload mode for displays running on evdi,udl
627252933 dix: Guard against non-existing PtrFeedbackPtr
d41b43345 xwayland: Add PtrFeedback to the touch device
23a53f0d5 glx: fixup symbol name for get_extensions function

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc           | 2 +-
 .../{xserver-xorg_1.20.11.bb => xserver-xorg_1.20.12.bb}      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.11.bb => xserver-xorg_1.20.12.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index c891211c40..ce57982a7d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -16,7 +16,7 @@ PE = "2"
 INC_PR = "r8"
 
 XORG_PN = "xorg-server"
-SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.gz"
 
 CVE_PRODUCT = "xorg-server x_server"
 # This is specific to Debian's xserver-wrapper.c
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
index b800167af9..2b326082d0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.12.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            "
-SRC_URI[md5sum] = "a22ccd74a5eee721cad6805e489c7144"
-SRC_URI[sha256sum] = "914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49"
+SRC_URI[md5sum] = "8775d8c22de768107978202fcf240e2e"
+SRC_URI[sha256sum] = "71687561262e4527a7ef779193725416f70c3e0424daaa9a6617bd37dc7701bb"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1


