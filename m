Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.197588.1598282143097013448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yXBpTHZL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id ep8so4383732pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hsmlhg04gHvwoBUMt7JsuytCcd8COldqH2FgAd1DPiM=;
        b=yXBpTHZLyb9SsydNzs3NRa0TZqsv2a1CtCiaKLpAvaXToX99td/wJF/tkrMu8d/sR7
         1t8oqnFN6iKNqw7oKG2HRIw5EqYtJ259Dz3kq3m824mwtnyDcV4d/umnhINXCFpj2rQI
         /EKW0IchSp7JMyN1fROhLE/sBOwBHICIq5eEbvGT3o8JL+X1IyzcANUEAyf+IjKturWA
         i+MNUg/R9vpr628dB1DKrNy26Qarh/pfOnmUh5nKUlNRCIGJD1GYUUgi81M1Ikd+bx1A
         cOqtILkXHN8fOMQH23FOqFE1fgu8IaV5e1xOYux80K2I6qqb0rMVKCjddW82xrlpPKQY
         3qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsmlhg04gHvwoBUMt7JsuytCcd8COldqH2FgAd1DPiM=;
        b=nqIPCJAihg48dkXEj7ghCu/qeRob4zwibcOaRhBwwX3yypB68oCpEkCOrmByPZ241f
         ReNTTjcce6gWk5onk4hD5uGGH3e/N1LcTT5UhXznyzospTZ8Ad//BtSwLVxEnq6A9Q0m
         d3fW212Fa1ShL2JKOD9pCDOUNVczyWb+7FgHgx+8ushtUSfftJdBQslzPwxDDCkW/+CC
         cIM6VThUVlH22HjYP6TXZ8Je349HctBFOQMB3anxVHJrc4gBVJ4SwrTH8xbj6CbYP/i4
         zLyz7HYAJJ+dUf7p0E2j3TFL2j4ecaka1MzuICZo921LWmZ8X3yerp+m9yn/DaORDGWi
         qqwQ==
X-Gm-Message-State: AOAM530TuFpkBg7QRuFch5YyAZqF6ORJyYd4paYe5e5QlZA8PcnKBk+W
	gOBqyCbtm7n7BCXlNQ75ulyGAB6SIJlx8cIWvmI=
X-Google-Smtp-Source: ABdhPJxpQt5frVk60BOkUpbtOnTqa8VAE1v8ZkI4l7b7oWOWGBtO5tJ4SVRwhKVC+LqYLMPq7y4zxQ==
X-Received: by 2002:a17:902:868b:: with SMTP id g11mr3167058plo.213.1598282142159;
        Mon, 24 Aug 2020 08:15:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] xserver-xorg: upgrade 1.20.7 -> 1.20.8
Date: Mon, 24 Aug 2020 05:14:57 -1000
Message-Id: <55d6ba6f7635f4939e6dad0bd3f6730a23870238.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Bug fix point release for current stable branch

Adam Jackson (1):
      Revert "dri2: Don't make reference to noClientException"

Arthur Williams (1):
      dix: Check for NULL spriteInfo in GetPairedDevice

Daniel Llewellyn (1):
      os: Ignore dying client in ResetCurrentRequest

Dave Airlie (1):
      modesetting: remove unnecessary error message, fix zaphod leases

David Seifert (1):
      Fix building with `-fno-common`

Dor Askayo (1):
      xwayland: clear pixmaps after creation in rootless mode

Eric Anholt (1):
      glamor: Fix a compiler warning since the recent OOM fixes.

George Matsumura (1):
      Restrict 1x1 pixmap filling optimization to GXcopy

Jon Turney (2):
      Add xf86OSInputThreadInit to stub os-support as well
      Fix old-style definition warning for xf86OSInputThreadInit()

Jonas Ådahl (1):
      xwayland/glamor-gbm: Handle DRM_FORMAT_MOD_INVALID gracefully

Kenneth Graunke (1):
      configure: Define GLAMOR_HAS_EGL_QUERY_DRIVER when available

Maarten Lankhorst (1):
      modesetting: Disable atomic support by default

Matt Turner (1):
      xserver 1.20.8

Michel Dänzer (8):
      modesetting: Explicitly #include "mi.h"
      xfree86/modes: Bail from xf86RotateRedisplay if pScreen->root is NULL
      xwayland: Split up xwl_screen_post_damage into two phases
      xwayland: Call glamor_block_handler from xwl_screen_post_damage
      xwayland: Add xwl_window_create_frame_callback helper
      xwayland: Use single frame callback for Present flips and normal updates
      xwayland: Use frame callbacks for Present vblank events
      xwayland: Delete all frame_callback_list nodes in xwl_unrealize_window

Paul Kocialkowski (4):
      glamor: Propagate FBO allocation failure for picture to texture upload
      glamor: Error out on out-of-memory when allocating PBO for FBO access
      glamor: Propagate glamor_prepare_access failures in copy helpers
      glamor: Fallback to system memory for RW PBO buffer allocation

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e06262ee0eafa4aff6dfcd7bd2fdd62820d5f12)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_1.20.7.bb => xserver-xorg_1.20.8.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.7.bb => xserver-xorg_1.20.8.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 998b98a76c..3f7fbe85b8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            "
-SRC_URI[md5sum] = "d2e96355ad47244c675bce38db2b48a9"
-SRC_URI[sha256sum] = "bd5986f010f34f5b3d6bc99fe395ecb1e0dead15a26807e0c832701809a06ea1"
+SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
+SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
 
 CFLAGS += "-fcommon"
 
-- 
2.17.1

