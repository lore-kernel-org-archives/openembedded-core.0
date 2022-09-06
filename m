Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3A5ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 10:58:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web12.2543.1662461884609173685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 513367C96;
	Tue,  6 Sep 2022 12:58:02 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.37.201]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oVWHJ-1gLEau0; Tue, 6 Sep 2022 12:58:01 +0200
Date: Tue, 06 Sep 2022 12:57:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] libsdl2: update 2.0.22 -> 2.24.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <KSBSHR.GBRTTFZ3GOW63@t-online.de>
In-Reply-To: <YxcaoKV6sz+dCbGL@mail.local>
References: <20220906074315.195684-1-f_l_k@t-online.de>
	<YxcaoKV6sz+dCbGL@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-d2HdfkqU4Tpi3Xr/ni2t"
X-TOI-EXPURGATEID: 150726::1662461881-01449CE0-2C43EEBB/0/0 CLEAN NORMAL
X-TOI-MSGID: f0498584-c519-4084-92f6-748e26fb6652
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 10:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170343

--=-d2HdfkqU4Tpi3Xr/ni2t
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 6. Sep 2022 um 12:02:08 +0200 schrieb Alexandre Belloni 
<alexandre.belloni@bootlin.com>:
> | 
> /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/windows/SDL_windowsvideo.c:247:38: 
> error: 'WIN_GL_GetDrawableSize' undeclared (first use in this 
> function); did you mean 'WIN_GetDrawableSize'?
> |   247 |     device->Vulkan_GetDrawableSize = WIN_GL_GetDrawableSize;
> |       |                                      ^~~~~~~~~~~~~~~~~~~~~~
> |       |                                      WIN_GetDrawableSize

meta-mingw prohibits opengl and gles2 for libsdl2. Therefore, vulkan 
cannot be built either. I will add a PACKAGECONFIG for Vulkan to the 
libsdl2 recipe so we can disable it, and send a patch for meta-mingw to 
remove vulkan from the libsdl2 PACKAGECONFIG as well.

 
<https://git.yoctoproject.org/meta-mingw/tree/recipes-graphics/libsdl2/libsdl2_%25.bbappend#n4>


--=-d2HdfkqU4Tpi3Xr/ni2t
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 6. Sep 2022 um 12:02:08 +0200 schrieb Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/windows/SDL_windowsvideo.c:247:38: error: 'WIN_GL_GetDrawableSize' undeclared (first use in this function); did you mean 'WIN_GetDrawableSize'?
|   247 |     device-&gt;Vulkan_GetDrawableSize = WIN_GL_GetDrawableSize;
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~
|       |                                      WIN_GetDrawableSize</div></blockquote><div><br></div><div>meta-mingw prohibits opengl and gles2 for libsdl2. Therefore, vulkan cannot be built either. I will add a PACKAGECONFIG for Vulkan to the libsdl2 recipe so we can disable it, and send a patch for meta-mingw to remove vulkan from the libsdl2 PACKAGECONFIG as well.</div><div><br></div><div>&nbsp;<a href="https://git.yoctoproject.org/meta-mingw/tree/recipes-graphics/libsdl2/libsdl2_%25.bbappend#n4">https://git.yoctoproject.org/meta-mingw/tree/recipes-graphics/libsdl2/libsdl2_%25.bbappend#n4</a></div></div>
--=-d2HdfkqU4Tpi3Xr/ni2t--


