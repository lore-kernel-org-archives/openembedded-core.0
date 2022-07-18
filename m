Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80270C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 17:08:33 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.30114.1658164108228243154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 10:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YlpdSWhO;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id e16so5295298qka.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIXN3/Pj9aGx/nvwTw5iu4vAYOaFHY3HDedbzvVHXg8=;
        b=YlpdSWhOMdn3+W+/JssphuqgFF6pE/ANEbbaSA17FjGZh+Uyd0HxyyhBuF33R62Xrs
         IwWBUtZAf6jMrMBGhtOwQLyGXbgNVAO24gj/mhZmsQ9Bys51O1JiJTt/99RbcQ/vZifC
         zGpgWea5oVapoAO5yd79aUKYbzH9ShFg6N4e8wb367G1DgiXoI4e7uv49oF/0eG8QmDS
         0JMs5pSIm2hZcLL8pfZJwT3AHBew7I2iQkUtAh5tUeA2Wo/9JPAs7KWwmgHFjjnfhs4J
         FWgEYxrmyUYtJlNuJLBV+Ja664vPrd0rLsvc9RvGJ12F+IZ3Cwuyf5e4CXU43g3QSxeI
         urnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIXN3/Pj9aGx/nvwTw5iu4vAYOaFHY3HDedbzvVHXg8=;
        b=X5VWCmK8xE2dhwV3JipZYLF3kTHUVmY5COpG58kzOfnKirCqetv565j+wiDWllCXIp
         Z0mUQ6VjitZ0mAWA9sTwEWDDMkWtEhIwiQkrs3C4uX131nIYgwiD9lYreQX4oKQGU1T2
         sxxi9oLO+vkb7dy+MogymbU8IJpJERg3OKWnCf/03RZBE9rBaiX9cDQsLmKPHS8amlAq
         vEiASpV+gvECemDUR6N6Uro2exDLoMb4PM9YjTNPe1M7cVYQtwKf8vWRpVU0JOF4tTmi
         hdUmIE9URkqKy4kq4Sa1vc7rC7Jun0QxLCRTM/q6IHQbjDklYpv3GGxvZGMU1MXjZ3ts
         xITQ==
X-Gm-Message-State: AJIora9GCzEi3kR69qwgsq+rs+m10Q04NCmiNnN8rHgDsWf2k/7aBHzg
	2nW9dtpfBeIm21XinLc/DSGU7vPbiFGTFlfld6s=
X-Google-Smtp-Source: 
 AGRyM1tlpjm8ELMWzJWzgOq7lpoh/Wj6+uENnR+t8vn/PoWJlZNc6vNUVlqT9GUrYoCu4B08GoCV/rXcgUMVmtWThTA=
X-Received: by 2002:a05:620a:1786:b0:6af:6e0f:596c with SMTP id
 ay6-20020a05620a178600b006af6e0f596cmr17732838qkb.227.1658164107187; Mon, 18
 Jul 2022 10:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220718165023.422662-1-martin.beeger@online.de>
In-Reply-To: <20220718165023.422662-1-martin.beeger@online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jul 2022 13:08:00 -0400
Message-ID: 
 <CAMKF1sqhTWt_ANmfRiQEvcWnNXORxKGo0DM=XOoKKKQvAVp0KQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cmake: remove CMAKE_ASM_FLAGS variable in
 toolchain file
To: Martin Beeger <martin.beeger@online.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 17:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168244

On Mon, Jul 18, 2022 at 12:51 PM Martin Beeger <martin.beeger@online.de> wrote:
>
> As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
> file to configure the toolchain correctly in cross-compile build for recipes
> using cmake. The CMAKE_ASM_FLAGS are the configuration are meant for  assembly,
> but the spelling is incorrect and the Flag is ASFLAGS for gcc and other compilers.
> So this variable might neever have worked and it is better for
> recipes to specify their own.
>

Should it be removed from meta/classes/cmake.bbclass and
meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template as
well ?
and what about CMAKE_ASM_FLAGS_RELEASE

> Signed-off-by: Martin Beeger <martin.beeger@online.de>
> ---
>  meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> index 86446c3ace..3ddef12c83 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -1,7 +1,6 @@
>  set( CMAKE_SYSTEM_NAME Linux )
>  set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
> -set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
>
>  set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168243): https://lists.openembedded.org/g/openembedded-core/message/168243
> Mute This Topic: https://lists.openembedded.org/mt/92463416/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

