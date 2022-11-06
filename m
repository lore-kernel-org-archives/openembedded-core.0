Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A408EC43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:17:51 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.16527.1667744257993949940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cWxZyBF0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k15so8447200pfg.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIWpEd/6GPiSwBhyYdzuhn9Y686Y+VKB1se3um9GI20=;
        b=cWxZyBF0ZJeAg7KvIJbxG8VOJmPcpeiPvExUEgoIu3XHapRYq0AJxtaT6m/9vouwjE
         pmcB9c+ypEsjWgcXVSNoDxJvHjp5+4fcjVc+h76s7VdnUDIS3EYscPWfXG3La7AaWNxf
         BBq9+ZQEoGHPdwN8KVG85WDAy4p8cT13XmAf5ux4n09ZPITr2CV0v7m4RLAjeEmzUNb+
         LJrzv9y06t8up60WR/r1HXtUDELBz9ouVwPQemqxqwz6bxtp2rri3DF5X2+D13KlGcMk
         LvDTxLdPVwyu6mwOzyiMf3iLcfKis0gzqxILrK+x91L35ERcvhIwmpYdwqbvKpPJ05pu
         NvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIWpEd/6GPiSwBhyYdzuhn9Y686Y+VKB1se3um9GI20=;
        b=F/TacYvIFejZcCoIkf6M8lnCan1vd4W2iJ/EpY8tdPldJ1wsvcnUJlHnnWW4UpOpDB
         sBppIHGdyBTLwxgihemzUAKn36YgrQ9DSUN5EwPPHHRajdVlTOflbmrMmImTiGb71uwP
         PXkvbp0PpNAoLe4QZQX2ZKL21ctzuzp2VTqKGY/MLkQapHdr04XjPv+YpNyZa/HbquhW
         qH0p0nF1odaPj8PnrnIiXdfTF8LY7ypTR46KYPMBfqKD17sK7g9YzPuT72e9OayBeLvZ
         CiC+Y7f1MykWUpJ1h2avx8Zr7XI8MMj/KP5jZYAFkLBNCflNyB7uF3LFm8eAKCXldy/H
         4YeA==
X-Gm-Message-State: ACrzQf1+CV63U4b5DblAX1/O2gwQ/5xBLlLnZPg67sptkQBZDJBnAQ15
	G/+LC2fqhJQAQkCYaqdtKnb5ss947nyi943E
X-Google-Smtp-Source: AMsMyM4d70wQl4CjTZ+jE+XSdDg9J9nG0r8ADRHz+d3McOL2kJfHbeX4E3qWc5auh/JLlauk2FgEew==
X-Received: by 2002:a05:6a00:1a4d:b0:563:a7c4:f521 with SMTP id h13-20020a056a001a4d00b00563a7c4f521mr45862158pfv.61.1667744264817;
        Sun, 06 Nov 2022 06:17:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/34] libsdl2: upgrade 2.24.0 -> 2.24.1
Date: Sun,  6 Nov 2022 04:16:50 -1000
Message-Id: <3c686477cc7557060fd9152f7546f00099a630a2.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172775

From: wangmy <wangmy@fujitsu.com>

This is a stable bugfix release, with the following changes:

Windows

Only check to see if the ICC profile changes when the display changes or we gain focus
Fixed window resize handing when using the D3D12 renderer
Fixed Xbox controller detection on Windows XP

macOS

Fixed long delay in SDL_CloseAudioDevice()

Linux

Fixed crash in Wayland_HasScreenKeyboardSupport()

FreeBSD

Fixed building without GNU sort, but warn that dynamic libraries won't be found

Emscripten

Fixed infinite recursion related to mutexes on startup

OS/2

Fixes and improvements to SDL_LoadObject() functionality

0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit aa45a2fad9ecd5d553c605dc6b3d4cd70d7d7776)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...sable-libunwind-in-native-OE-builds-by-not-looking.patch | 6 +++---
 .../libsdl2/{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
index 57bc522393..f34b870e74 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
@@ -1,4 +1,4 @@
-From 0234c546d86174fafe9ab280cf5f44de50b73676 Mon Sep 17 00:00:00 2001
+From 77093de6a12c24a60fc447698900d18d0a3943af Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Fri, 18 Mar 2022 12:06:23 +0100
 Subject: [PATCH] Disable libunwind in native OE builds by not looking for
@@ -22,10 +22,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 644715a..bbf2e28 100644
+index 7617205..d9b1522 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -869,7 +869,7 @@ if(SDL_LIBC)
+@@ -952,7 +952,7 @@ if(SDL_LIBC)
      check_include_file(sys/types.h HAVE_SYS_TYPES_H)
      foreach(_HEADER
              stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
index d5cbf73df2..6bff0b8fe3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-build
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "91e4c34b1768f92d399b078e171448c6af18cafda743987ed2064a28954d6d97"
+SRC_URI[sha256sum] = "bc121588b1105065598ce38078026a414c28ea95e66ed2adab4c44d80b309e1b"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


