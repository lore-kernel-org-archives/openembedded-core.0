Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E791C46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.70831.1669472136467444942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DAIjCsq9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id y4so6309501plb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHhU2lUU1Q9T7+C/8SmUpYrKPH0lf/kgI6PKZIAPbio=;
        b=DAIjCsq9tZirnnWMpOaP5MeGoGsiAaPdYMEcrcCMK488q9JL6ni35KXkNd9M6bEoVR
         iIwGa/RJZ9V+fNKosgV2dE49wLs5GZ2/X1lVJQr7IE05xuinGUfI7pAS1dJtrQ9odqgg
         JssBQlHpyrLmPcw7YK6O2r/G5Ih8pehn4s3kOVuHshugMFuDQPfhktOBLuOpElZQf7lJ
         Tq4yH1L8m4T46fecSdvdr3pTNs6td0yLzUvqAL4LZeYxfIlJj085Q+WqApm3kd+kgRxj
         UMJR29Zy7pXggYuBBr0lFaxqgPhSZAbw6LLJQhINw9q5kT75qBWaDr9KGmahFXuWaqJR
         1iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHhU2lUU1Q9T7+C/8SmUpYrKPH0lf/kgI6PKZIAPbio=;
        b=AG7wpLuGmyqMzalhRD1iF5eIc+icN0pC5kIwuzshChrCCE++yU/h3hDEpchV14sqG0
         PKKgdRMBb8n4EYaHSGz50Upffl+35iTHTnrEgdNm29z17U/kvKmmPI5PKAu90NrDdkpv
         f1Wh0Z9JJHoBFmhJNpJjTrlxfIa7+iIblfaMl6Awb2GJonWEeq0TajAyM6TANuFJqI5Q
         KNsyLJ+MZU/HhCoKX07qs3mFjUTSzxUzZZaDJOyBx4CkcEpAYzMJJhZgTojGJ+88wA9t
         PT8xArv3pt3XuhqHhldMN1m8jykoyVN1Z3r0JvvH3AnJjtMv+yC4oteR9T7shH/rKXtx
         6MtQ==
X-Gm-Message-State: ANoB5pkVDtWSM24vi5yQeSR+Ed8ydsWsulnkK21HNLyAUVazq6dW2zRm
	UgxjH7v8FCc32syYPj5QU6FgI9C35mv+5qm5/Cs=
X-Google-Smtp-Source: AA0mqf4fGI4Wkymk21s8nhfI7lM2qlwgqPw8q4I2Six+7Pl9sVCPLGm6HjSs0TTyCsDYgr3UdjDJJA==
X-Received: by 2002:a17:90a:f406:b0:219:9e8:84b2 with SMTP id ch6-20020a17090af40600b0021909e884b2mr9167744pjb.121.1669472144936;
        Sat, 26 Nov 2022 06:15:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/37] libsdl2: upgrade 2.24.1 -> 2.24.2
Date: Sat, 26 Nov 2022 04:14:22 -1000
Message-Id: <8dd54a5b441fa87fdbe076b89a496aa6e6c230fe.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173811

From: Wang Mingyu <wangmy@fujitsu.com>

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

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0091bbe02399f49b7da1ebf9b45541b26fb2ce12)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/{libsdl2_2.24.1.bb => libsdl2_2.24.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.1.bb => libsdl2_2.24.2.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
index 6bff0b8fe3..ce5a8aa8f2 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-build
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "bc121588b1105065598ce38078026a414c28ea95e66ed2adab4c44d80b309e1b"
+SRC_URI[sha256sum] = "b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7b0feb710f1a1329f"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


