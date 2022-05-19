Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6799CC433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 16:46:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.10077.1652978794344024702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 09:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KwIQLn1C;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id m6so6941634ljb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkYTP8HXK7MvZuqXNlaulVjlFh5lcWuxb+6TQovW+L8=;
        b=KwIQLn1Cm8VGsUqDVyzwKu/UyVQMzYw4hC4SojQOlvdDS7Bj42eaLKSvSlPegFrUUW
         N53FaKGiwmu/vI7BBYDsm59jnxde2WCSmG01O3DVJaqhShfnp3Ay+UVGIbQkoMqgh7BX
         sWGN1hag4gEDTI402Pmcmbm1nVs8fvsMWj9fmlcsZyGuGo9uLCtyX6piuRzjzy3hoP6V
         JQiJymPCngay7pcuNvm9/pOKZWglBOFbZO8flvWJWKBSuaRQUfjw4SXX8rW/4QbzldrN
         jYK+yMTaNZ/iTNXHtZpc6HCQ/V8AdKI7pQBUHi1uWExIVJ+BjSUKpKnBG+OmUz3jdKMv
         7xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkYTP8HXK7MvZuqXNlaulVjlFh5lcWuxb+6TQovW+L8=;
        b=vQr1blcGRjVity+UoZ7KVFMysGiqCiCEs+b/398SgRwJJ28LXYcIZ7b8BgFQ1AnXSj
         4Ss+yVG33cb7ottMNkchKG+/u++PcInWSmht8DwKzQrBesrN85FuAspXoD4bZvTjh1Wv
         E/eGQjAXfPUjWNviPB0JQyXMGMmgdZPJ4fQD7+bWIs2jZb2wFAYcGlhQTAE9bMDXLP4e
         oaw4FBQ5kvWD6kFZZTqmdJp0nr57gHmA+MlLw7m54+bd/rZZ6C9W6gHn8Sh8zrdMVFXT
         psHnR5unA8PDDk/GIEL0WNdf1LUyCTZ3KDQ4I/N3wejZUGeMDlWBLH+DLq6nyacYkWBx
         U/fQ==
X-Gm-Message-State: AOAM531kULxNqJHFhX6pdDLuHvPQN/pgDihTlYBJMPaW+Jhyr4iPRiUw
	za3weyQ6y8IbdoKrKVz6b4XhSbQ8O4LQSVIZyNo=
X-Google-Smtp-Source: 
 ABdhPJxl2qGXm8h1pYW+4HLdMj6LonTjzanJdKvuLQEypiA4JMQ375fgzF3nK7AlLM7JHjYBSHbqS73bnKFqYT2EGmw=
X-Received: by 2002:a2e:a486:0:b0:24f:fd5:cdb7 with SMTP id
 h6-20020a2ea486000000b0024f0fd5cdb7mr3034445lji.109.1652978792526; Thu, 19
 May 2022 09:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
In-Reply-To: <20220519184315.1e91b017@melee>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 May 2022 18:46:20 +0200
Message-ID: 
 <CANNYZj8xWvRMVGjo1qaV0Gah0U9a42SqyFf=C9bZ64DTh8qZuQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165904

Also, does this need to be in core (as opposed to meta-oe)? Why?

Alex

On Thu, 19 May 2022 at 18:43, Luca Ceresoli via lists.openembedded.org
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> Hi Markus,
>
> Il giorno Thu, 19 May 2022 08:43:11 +0200
> "Markus Volk" <f_l_k@t-online.de> ha scritto:
>
> > libdecor is a client-side decoration library for Wayland clients. It
> > is used by libsdl2 for window decoration and is required to provide
> > decoration for shells that use client-side decoration such as
> > gnome-shell or weston.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
> I'm afraid we're having an issue with this patch as well:
>
> AssertionError:
> The following recipes do not have a maintainer assigned to them. Please
> add an entry to meta/conf/distro/include/maintainers.inc file. libdecor
> (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3547/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3604/steps/15/logs/stdio
>
> And also this warning:
>
> WARNING: Nothing RPROVIDES 'nativesdk-libdecor' (but
> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
> 'nativesdk-libdecor' NOTE: Runtime target 'nativesdk-libdecor' is
> unbuildable, removing... Missing or unbuildable dependency chain was:
> ['nativesdk-libdecor'] WARNING: Nothing RPROVIDES
> 'nativesdk-libdecor-dev' (but
> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
> 'nativesdk-libdecor-dev' NOTE: Runtime target 'nativesdk-libdecor-dev'
> is unbuildable, removing... Missing or unbuildable dependency chain
> was: ['nativesdk-libdecor-dev']
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/5543/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4571/steps/12/logs/stdio
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165903): https://lists.openembedded.org/g/openembedded-core/message/165903
> Mute This Topic: https://lists.openembedded.org/mt/91203655/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

