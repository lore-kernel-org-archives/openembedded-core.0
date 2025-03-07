Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACC0C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:00:19 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.10274.1741352409143608989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id 99DCDBEB;
	Fri,  7 Mar 2025 13:59:27 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqXIV-1j2yQa0; Fri, 7 Mar 2025 13:59:27 +0100
Date: Fri, 07 Mar 2025 14:00:10 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] libsdl2: update 2.30.12 -> 2.32.2
To: alex.kanavin@gmail.com
Cc: "Alexander Kanavin via lists.openembedded.org"
	<alex.kanavin=gmail.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <A48RSS.P369E7KH05811@t-online.de>
In-Reply-To: <CANNYZj_8-YW4jN6wcWg-i7GOw2evaVnXi=Mz56ctN=e_zG0QpQ@mail.gmail.com>
References: <20250305175432.2040027-1-f_l_k@t-online.de>
	<CANNYZj_8-YW4jN6wcWg-i7GOw2evaVnXi=Mz56ctN=e_zG0QpQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-khATMY3NvodyQ8hFUNxj"
X-TOI-EXPURGATEID: 150726::1741352367-AD7F99EA-1F8E9CE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 36d0105e-3c72-49a3-977c-cd96cb13eedb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212433

--=-khATMY3NvodyQ8hFUNxj
Content-Type: text/plain; charset=us-ascii; format=flowed

Sounds reasonable. Maybe I can take a look at it next week.

On Thu, Mar 6 2025 at 12:14:03 +01:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
> Thanks :) We probably need a libsdl3 recipe at some point. It could be
> developed in meta-oe first to a mature, stable state perhaps, and
> moved to oe-core when consumers start appearing.
> (not asking that you do it, just as a general note)
> 
> Alex
> 
> On Wed, 5 Mar 2025 at 18:54, Markus Volk via lists.openembedded.org
> <f_l_k=t-online.de@lists.openembedded.org 
> <mailto:f_l_k=t-online.de@lists.openembedded.org>> wrote:
>> 
>>  SDL 3.0 recommended!
>> 
>>  The SDL development team is focusing efforts on SDL3 and making 
>> sdl2-compat a drop-in replacement for SDL2.
>>  If you run into issues with SDL2, please consider upgrading to SDL3 
>> or trying out sdl2-compat. We have made
>>  significant improvements across all platforms and your issue may 
>> already be resolved.
>> 
>>  2.32.2:
>>  This is a stable bugfix release, with the following changes:
>> 
>>      Fixed stack overflow when setting thread debug names on Windows
>>      Fixed flushing audio forever in some cases when recording 
>> PulseAudio on Linux
>>      Fixed a crash when initializing with controllers connected on 
>> macOS
>>      Added SDL_HINT_JOYSTICK_HAPTIC_AXES to specify how many haptic 
>> axes a device has
>> 
>>  2.32.0:
>>  This is a stable bugfix release, with the following changes:
>> 
>>      Allow destroying a window and its renderer in either order
>>      Added cursor-shape-v1 protocol support on Wayland
>>      Fixed full immersive mode in Android 9 and higher
>>      Improved event processing latency when gamepad/sensor is open
>>      Added SDL_HINT_APPLE_RWFROMFILE_USE_RESOURCES to control 
>> whether SDL tries to open files from the app's resource directory on 
>> macOS
>>      Fixed conditional effect playback on Moza Racing devices
>>      Fixed input for Thrustmaster PlayStation wheels when hid-tmff2 
>> is installed
>>      Enabled direct VRAM access when using the window surface API on 
>> PSP
>>      Improved window surface support on Nintendo 3DS
>>      Fixed condition variable implementation on Nintendo 3DS
>>      Fixed byte order detection on Solaris
>>      Implemented SDL_TriggerBreakpoint() on aarch64-w64-mingw32
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../libsdl2/{libsdl2_2.30.12.bb => libsdl2_2.32.2.bb}           | 
>> 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.12.bb => 
>> libsdl2_2.32.2.bb} (97%)
>> 
>>  diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb 
>> b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
>>  similarity index 97%
>>  rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
>>  rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
>>  index b0ad55e314..2b28b3dfa9 100644
>>  --- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
>>  +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
>>  @@ -25,7 +25,7 @@ SRC_URI = 
>> "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
>> 
>>   S = "${WORKDIR}/SDL2-${PV}"
>> 
>>  -SRC_URI[sha256sum] = 
>> "ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704850d5d47375b48ea"
>>  +SRC_URI[sha256sum] = 
>> "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922"
>> 
>>   inherit cmake lib_package binconfig-disabled pkgconfig 
>> upstream-version-is-even
>> 
>>  --
>>  2.48.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212385): 
> <https://lists.openembedded.org/g/openembedded-core/message/212385>
> Mute This Topic: <https://lists.openembedded.org/mt/111532762/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-khATMY3NvodyQ8hFUNxj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Sounds reasonable. Maybe I can take a look at it next week.</div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 6 2025 at 12:14:03 +01:00:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Thanks :) We probably need a libsdl3 recipe at some point. It could be
developed in meta-oe first to a mature, stable state perhaps, and
moved to oe-core when consumers start appearing.
(not asking that you do it, just as a general note)

Alex

On Wed, 5 Mar 2025 at 18:54, Markus Volk via lists.openembedded.org
&lt;<a href="mailto:f_l_k=t-online.de@lists.openembedded.org">f_l_k=t-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 SDL 3.0 recommended!

 The SDL development team is focusing efforts on SDL3 and making sdl2-compat a drop-in replacement for SDL2.
 If you run into issues with SDL2, please consider upgrading to SDL3 or trying out sdl2-compat. We have made
 significant improvements across all platforms and your issue may already be resolved.

 2.32.2:
 This is a stable bugfix release, with the following changes:

     Fixed stack overflow when setting thread debug names on Windows
     Fixed flushing audio forever in some cases when recording PulseAudio on Linux
     Fixed a crash when initializing with controllers connected on macOS
     Added SDL_HINT_JOYSTICK_HAPTIC_AXES to specify how many haptic axes a device has

 2.32.0:
 This is a stable bugfix release, with the following changes:

     Allow destroying a window and its renderer in either order
     Added cursor-shape-v1 protocol support on Wayland
     Fixed full immersive mode in Android 9 and higher
     Improved event processing latency when gamepad/sensor is open
     Added SDL_HINT_APPLE_RWFROMFILE_USE_RESOURCES to control whether SDL tries to open files from the app's resource directory on macOS
     Fixed conditional effect playback on Moza Racing devices
     Fixed input for Thrustmaster PlayStation wheels when hid-tmff2 is installed
     Enabled direct VRAM access when using the window surface API on PSP
     Improved window surface support on Nintendo 3DS
     Fixed condition variable implementation on Nintendo 3DS
     Fixed byte order detection on Solaris
     Implemented SDL_TriggerBreakpoint() on aarch64-w64-mingw32

 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../libsdl2/{libsdl2_2.30.12.bb =&gt; libsdl2_2.32.2.bb}           | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.12.bb =&gt; libsdl2_2.32.2.bb} (97%)

 diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
 similarity index 97%
 rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
 rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
 index b0ad55e314..2b28b3dfa9 100644
 --- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
 +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
 @@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"

  S = "${WORKDIR}/SDL2-${PV}"

 -SRC_URI[sha256sum] = "ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704850d5d47375b48ea"
 +SRC_URI[sha256sum] = "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e89cc6a50a2821922"

  inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even

 --
 2.48.1


 

</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#212385): <a href="https://lists.openembedded.org/g/openembedded-core/message/212385">https://lists.openembedded.org/g/openembedded-core/message/212385</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/111532762/3618223">https://lists.openembedded.org/mt/111532762/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-khATMY3NvodyQ8hFUNxj--


