Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AE1C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:05:24 +0000 (UTC)
Received: from mail1.bemta32.sdw.messagelabs.com
 (mail1.bemta32.sdw.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.52742.1638803123190937096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GQRuamay;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638803121; i=@fujitsu.com;
	bh=bPYOt3YebQWRuZcadp4Aey+dU+utmSaevEFkfdV2Ahc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GQRuamayk8p81/Zli2bPUu/r9jB4O7dZsc/j/CvlNPHusi+T2jqAUBGDAf9pRvBWv
	 rNjl+fh72YGB+M665ZX8qFKfWlJAp6Y1cd6ly4znVdL28/SC/5wx/Ggy0dai6h9FHJ
	 0p4J2xLoA2tjCIKiaw+EA9vp4vjeRiD6s2lzsbO1QgZZOGDbyTqvv4x7RfYN7Y2C1Q
	 pfAgMLS5dMoc2H2sbAwcBwpe1morX1aIgVCWMqNdqLzPQEMLtdF8bh+bCuFp4u6aTx
	 IaSnFWj7kOyF6b23EH8ZbTpL+gIPBLKy/cwubVbI7fBkc1A1PAuUfqj4rrS3UXGdzK
	 MrI1rx6CxkZcg==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 40/3F-20904-0B62EA16;
 Mon, 06 Dec 2021 15:05:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSXeD2rp
  Eg9nXlC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyjfyQL1qtVLF99nbGB8a1CFyMXh5DAY0aJ
  6ze7mLsYOYGc80wSz1sMIOzdjBLvLkqC2GwCuhLnHq9l72Lk4BAR0JO4+k8UJCwsYCOxYcNVF
  hCbRUBF4sy2PjCbV8Bd4svmHYwgtoSAgsSUh++ZIeKCEidnPgGrYRaQkDj44gUzyEgJAUWJ2d
  PlIcorJF4fvsQMYatJXD23iXkCI98sJN2zkHQvYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6B
  rZGiql1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGHQpxQzXdzBO7Pupd4hR
  koNJSZTXQ2xdohBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3v0qQDnBotT01Iq0zBxgBMCkJTh4l
  ER4NygBpXmLCxJzizPTIVKnGI05Tq5asoiZo3nS8u3MQix5+XmpUuK8R1WBSgVASjNK8+AGwS
  LzEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3vkgU3gy80rg9r0COoUJ6JSY/tUgp5QkIqS
  kGpj4nkdMU/mdpHU07Lv0Ie0opTqrHRHVRmc/XjNwe6h/p/172TLekz/+Xtu6WOLCkh/va5el
  /cjpVF6cGf+adfrXV6/E29cJFSveP3/3UU/jnFMyPill8Z+bnsTPE5O0Oup0RGWuRW4b8yGHB
  JOTFbH5Efxr2gMazRkNVe2nhe/c58NrnSmsced5T94ZEc7kKhapfYEnPiqEiid5WqxRvT4z6a
  BDzR37LV+LVklYTK+wmBV34PzEdyKef2cU7RJs2Dx156zvkZwfQnrCmQy9/WZ/inXftWdtysL
  td+6t/R00PeTkpphP3H+nmyjwW6UElffdvRRXxi56OmnPkq4WLtHFa7+KGqX1uVcdObSKLUeJ
  pTgj0VCLuag4EQA4aARpRwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1638803120!17197!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22655 invoked from network); 6 Dec 2021 15:05:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:05:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1FB1610045A
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:05:20 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1008C100456
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:05:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:05:14 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.0.16 -> 2.0.18
Date: Tue, 7 Dec 2021 08:05:01 +0800
Message-ID: <1638835501-3733-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:05:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159233

Remove unsupported option "--enable-sdl-dlopen".

Changelog:
=======================

General:

The SDL wiki documentation and development headers are automatically kept in sync
Each function has information about in which version of SDL it was introduced
SDL-specific CMake options are now prefixed with 'SDL_'. Be sure to update your CMake build scripts accordingly!
Added the hint SDL_HINT_APP_NAME to let SDL know the name of your application for various places it might show up in system information
Added SDL_RenderGeometry() and SDL_RenderGeometryRaw() to allow rendering of arbitrary shapes using the SDL 2D render API
Added SDL_SetTextureUserData() and SDL_GetTextureUserData() to associate application data with an SDL texture
Added SDL_RenderWindowToLogical() and SDL_RenderLogicalToWindow() to convert between window coordinates and logical render coordinates
Added SDL_RenderSetVSync() to change whether a renderer present is synchronized with vblank at runtime
Added SDL_PremultiplyAlpha() to premultiply alpha on a block of SDL_PIXELFORMAT_ARGB8888 pixels
Added a window event SDL_WINDOWEVENT_DISPLAY_CHANGED which is sent when a window changes what display it's centered on
Added SDL_GetWindowICCProfile() to query a window's ICC profile, and a window event SDL_WINDOWEVENT_ICCPROF_CHANGED that is sent when it changes
Added the hint SDL_HINT_VIDEO_EGL_ALLOW_TRANSPARENCY to allow EGL windows to be transparent instead of opaque
SDL_WaitEvent() has been redesigned to use less CPU in most cases
Added SDL_SetWindowMouseRect() and SDL_GetWindowMouseRect() to confine the mouse cursor to an area of a window
You can now read precise mouse wheel motion using 'preciseX' and 'preciseY' event fields
Added SDL_GameControllerHasRumble() and SDL_GameControllerHasRumbleTriggers() to query whether a game controller supports rumble
Added SDL_JoystickHasRumble() and SDL_JoystickHasRumbleTriggers() to query whether a joystick supports rumble
SDL's hidapi implementation is now available as a public API in SDL_hidapi.h
Windows:

Improved relative mouse motion over Windows Remote Desktop
Added the hint SDL_HINT_IME_SHOW_UI to show native UI components instead of hiding them (defaults off)
Windows/UWP:

WGI is used instead of XInput for better controller support in UWP apps
Linux:

Added the hint SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME to set the activity that's displayed by the system when the screensaver is disabled
Added the hint SDL_HINT_LINUX_JOYSTICK_CLASSIC to control whether /dev/input/js* or /dev/input/event* are used as joystick devices
Added the hint SDL_HINT_JOYSTICK_DEVICE to allow the user to specify devices that will be opened in addition to the normal joystick detection
Added SDL_LinuxSetThreadPriorityAndPolicy() for more control over a thread priority on Linux
Android:

Added support for audio output and capture using AAudio on Android 8.1 and newer
Steam Controller support is disabled by default, and can be enabled by setting the hint SDL_HINT_JOYSTICK_HIDAPI_STEAM to "1" before calling SDL_Init()
Apple Arcade:

Added SDL_GameControllerGetAppleSFSymbolsNameForButton() and SDL_GameControllerGetAppleSFSymbolsNameForAxis() to support Apple Arcade titles
iOS:

Added documentation that the UIApplicationSupportsIndirectInputEvents key must be set to true in your application's Info.plist in order to get real Bluetooth mouse events.
Steam Controller support is disabled by default, and can be enabled by setting the hint SDL_HINT_JOYSTICK_HIDAPI_STEAM to "1" before calling SDL_Init()

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.0.16.bb => libsdl2_2.0.18.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.16.bb => libsdl2_2.0.18.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
similarity index 96%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index bd7dea275e..5e645b443c 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.16.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "65be9ff6004034b5b2ce9927b5a4db1814930f169c4b2dae0a1e4697075f287b"
+SRC_URI[sha256sum] = "94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
@@ -35,7 +35,6 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-video-dummy \
                 --disable-video-rpi \
                 --enable-pthreads \
-                --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-sndio \
                 --disable-fcitx --disable-ibus \
-- 
2.25.1


