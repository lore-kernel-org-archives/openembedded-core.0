Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3654C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:37:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.66982.1638884255386768060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W9vAIFVP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j3so29604819wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PDkG6+GBqxT6RZkI5xW7W8pVl2NijqhNjD3ujiIqSbI=;
        b=W9vAIFVPqOHy/o2kH9XASIxewC8L63V8vaHrINL7gGbskLKClRPBSNqGSfEyFT9Atq
         kv2BAEZxVdcZgL9DozSlXg1+D8rdhuTd8SJEQDTZaqNmpfFUMFdf/fuqDcmvlJDCUhNZ
         CamLrUbZJcPMnhlnsHj691tdToNHhFyJF6odE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PDkG6+GBqxT6RZkI5xW7W8pVl2NijqhNjD3ujiIqSbI=;
        b=Gcxv1moo4Ur+xChy/nBqJaajb3ZKFNwCAFaYo5YyAVfRc9tZ3SFf2wkj3+sio5X2JN
         cC/Y437Zi5hoRLC9c5xqnDPg5GZrsohAFjbnxFCuivaaIpNA+/JalDU8f2T8jiNueHJ1
         WXr0eqnMGdStD99+Ea/DK4G7vbeEk1ueBbuCQB2LokZoSmxIbLcbUlGFObFw1pZ8bA7B
         ANabbCEXcpTrLCp+S25R8B2UqBy6DCVVBcbwwdQC70oIIthcJjmWjZK0SOVHGV5Hx/jX
         kU/5kNhoPYmqixK5on+5fGkO50VrJiNZp9aj9TvlojHr3dNvACIxN28lVZybBusMIuM0
         FSgg==
X-Gm-Message-State: AOAM530cgsyY/r9mLFvNwpCGo7VBgMdUex/SydNMDESa1yGJUO3zu+GV
	2ICmB9tKJYDrs2iDDHWmOgJ07w==
X-Google-Smtp-Source: 
 ABdhPJztkvjLO5DDZjascOvGE9MQqM0U+Ul0QNxcUvWwXTCICcDZtt1bC13Xlt00ZijOdCgw98kNIw==
X-Received: by 2002:a5d:59ab:: with SMTP id
 p11mr51299333wrr.340.1638884254001;
        Tue, 07 Dec 2021 05:37:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 z7sm2577940wmi.33.2021.12.07.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:37:33 -0800 (PST)
Message-ID: 
 <7a377fc9d27576f8848d99a6bd1b63e18e04c340.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsdl2: upgrade 2.0.16 -> 2.0.18
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Dec 2021 13:37:32 +0000
In-Reply-To: <1638835501-3733-1-git-send-email-zhengrq.fnst@fujitsu.com>
References: <1638835501-3733-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159305

On Tue, 2021-12-07 at 08:05 +0800, zhengruoqin wrote:
> Remove unsupported option "--enable-sdl-dlopen".
> 
> Changelog:
> =======================
> 
> General:
> 
> The SDL wiki documentation and development headers are automatically kept in sync
> Each function has information about in which version of SDL it was introduced
> SDL-specific CMake options are now prefixed with 'SDL_'. Be sure to update your CMake build scripts accordingly!
> Added the hint SDL_HINT_APP_NAME to let SDL know the name of your application for various places it might show up in system information
> Added SDL_RenderGeometry() and SDL_RenderGeometryRaw() to allow rendering of arbitrary shapes using the SDL 2D render API
> Added SDL_SetTextureUserData() and SDL_GetTextureUserData() to associate application data with an SDL texture
> Added SDL_RenderWindowToLogical() and SDL_RenderLogicalToWindow() to convert between window coordinates and logical render coordinates
> Added SDL_RenderSetVSync() to change whether a renderer present is synchronized with vblank at runtime
> Added SDL_PremultiplyAlpha() to premultiply alpha on a block of SDL_PIXELFORMAT_ARGB8888 pixels
> Added a window event SDL_WINDOWEVENT_DISPLAY_CHANGED which is sent when a window changes what display it's centered on
> Added SDL_GetWindowICCProfile() to query a window's ICC profile, and a window event SDL_WINDOWEVENT_ICCPROF_CHANGED that is sent when it changes
> Added the hint SDL_HINT_VIDEO_EGL_ALLOW_TRANSPARENCY to allow EGL windows to be transparent instead of opaque
> SDL_WaitEvent() has been redesigned to use less CPU in most cases
> Added SDL_SetWindowMouseRect() and SDL_GetWindowMouseRect() to confine the mouse cursor to an area of a window
> You can now read precise mouse wheel motion using 'preciseX' and 'preciseY' event fields
> Added SDL_GameControllerHasRumble() and SDL_GameControllerHasRumbleTriggers() to query whether a game controller supports rumble
> Added SDL_JoystickHasRumble() and SDL_JoystickHasRumbleTriggers() to query whether a joystick supports rumble
> SDL's hidapi implementation is now available as a public API in SDL_hidapi.h
> Windows:
> 
> Improved relative mouse motion over Windows Remote Desktop
> Added the hint SDL_HINT_IME_SHOW_UI to show native UI components instead of hiding them (defaults off)
> Windows/UWP:
> 
> WGI is used instead of XInput for better controller support in UWP apps
> Linux:
> 
> Added the hint SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME to set the activity that's displayed by the system when the screensaver is disabled
> Added the hint SDL_HINT_LINUX_JOYSTICK_CLASSIC to control whether /dev/input/js* or /dev/input/event* are used as joystick devices
> Added the hint SDL_HINT_JOYSTICK_DEVICE to allow the user to specify devices that will be opened in addition to the normal joystick detection
> Added SDL_LinuxSetThreadPriorityAndPolicy() for more control over a thread priority on Linux
> Android:
> 
> Added support for audio output and capture using AAudio on Android 8.1 and newer
> Steam Controller support is disabled by default, and can be enabled by setting the hint SDL_HINT_JOYSTICK_HIDAPI_STEAM to "1" before calling SDL_Init()
> Apple Arcade:
> 
> Added SDL_GameControllerGetAppleSFSymbolsNameForButton() and SDL_GameControllerGetAppleSFSymbolsNameForAxis() to support Apple Arcade titles
> iOS:
> 
> Added documentation that the UIApplicationSupportsIndirectInputEvents key must be set to true in your application's Info.plist in order to get real Bluetooth mouse events.
> Steam Controller support is disabled by default, and can be enabled by setting the hint SDL_HINT_JOYSTICK_HIDAPI_STEAM to "1" before calling SDL_Init()
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../libsdl2/{libsdl2_2.0.16.bb => libsdl2_2.0.18.bb}           | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.16.bb => libsdl2_2.0.18.bb} (96%)

Seems to break automated testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2998

e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/3348

but many many more in that build.

Cheers,

Richard



