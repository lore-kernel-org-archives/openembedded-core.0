Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A42EC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:52:15 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.567.1638895933879198084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=z/xCqSF+;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id t9so30770301wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uRky1mkd0xgJ1IybEjooxNBw1UPGJUdKjKJ8OaVD+WY=;
        b=z/xCqSF+bkl+Cd02KCwqALjCExO2wN7QxcZNvLgrCEAcspHzzN5PsgsY0IItvy2Uas
         qLe0VD7dG+TGe9R/Q9UKKA+QfnfKfOqDDXfb8zHavWLoVf/5R2h8nhKLfx+PZf1JWTWX
         v8zCe2bgOIDnnOs7OhbY5qABZWgJQWyjgbrFawh0hpjq3HyddJwoUaNbqjU+fawsJWd9
         wYXL3z4mZV7g+EEdSzdLIeWjJskatdHXSbbXxVnbQ/rfoGnFrZsKiH0ShlPhHH5dEydn
         /sgCCMNE5cbKUHtxzRcTS+8rl3xrk7waYwFpcfLx1OOw4lKrQ6nqYi83rC9vtigSTEgr
         Bcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uRky1mkd0xgJ1IybEjooxNBw1UPGJUdKjKJ8OaVD+WY=;
        b=Y1YmN48PsHCPp1kyTJh3tcOM2szehNpkcDhHi9/xsfmWdEMBl0PfwiOOJr3bHrEm7q
         dBc20+7BaZNyLqxKvzL4+jRgLcwRajKY+czaBtD9U1BRVrthv4bf5hvn8EEfL520+LvD
         5Tu0xy1oPSix3R7KMj1kJ8qTyFZbexcFiIuA0DlCZP2+3wWrZ+iOA6NLY3HnQujbBgze
         9v85aEKqvNSf15ypOAs+Zu/BYEDMCuuuALCvdkBw3aHAyz5lYU/GIU+o4wbt0nohuDn8
         rnMjoqyWZG9DX575vU0NvQ45/7BZA9eEklHAQVBajfSE58TZtsQ9BXUohGOCnL1u+hu7
         6FWw==
X-Gm-Message-State: AOAM532B0tleysxFm9anmO+DU3T8glJN0RrIpyjS9fsEpOxXLrFTKviU
	JwRdlG7Aec4qjMkVCrQ+bgko46RNYk07erLrYg8Jhg==
X-Google-Smtp-Source: 
 ABdhPJx8xNpH2xpW/B9FS5QLLARbcbG3kdvtChWEHcUnV1bHTflnGYRa2wm0EWth16ZsCHxGLm8I/wKG7nF3K6loroc=
X-Received: by 2002:adf:e54a:: with SMTP id
 z10mr50708547wrm.328.1638895932094;
 Tue, 07 Dec 2021 08:52:12 -0800 (PST)
MIME-Version: 1.0
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
 <CAAnfSTtKWk0njrZQm_a0awBXyRWxGea8GCZ2tzgRfpy96F1zCg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtKWk0njrZQm_a0awBXyRWxGea8GCZ2tzgRfpy96F1zCg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 7 Dec 2021 16:52:01 +0000
Message-ID: 
 <CAAnfSTu24bK18-k3Wr2=qDP00ptnV+WFoAerpgz7kHGV1O5aqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:52:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159317

And https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2624/steps/12/logs/stdio,
so that's x86-64 and arm64.

Ross

On Tue, 7 Dec 2021 at 16:51, Ross Burton <ross@burtonini.com> wrote:
>
> Not just x32:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2898/steps/12/logs/stdio
>
> Ross
>
> On Tue, 7 Dec 2021 at 13:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2021-12-06 at 23:21 +0800, wangmy wrote:
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../pango/{pango_1.48.10.bb => pango_1.50.0.bb}                 | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.0.bb} (94%)
> > >
> > > diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > > similarity index 94%
> > > rename from meta/recipes-graphics/pango/pango_1.48.10.bb
> > > rename to meta/recipes-graphics/pango/pango_1.50.0.bb
> > > index 40df7042e6..db17158d20 100644
> > > --- a/meta/recipes-graphics/pango/pango_1.48.10.bb
> > > +++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > > @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
> > >
> > >  SRC_URI += "file://run-ptest"
> > >
> > > -SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
> > > +SRC_URI[archive.sha256sum] = "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
> > >
> > >  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> > >
> >
> > Seems to break x32 unfortunately:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/4403
> >
> > Cheers,
> >
> > Richard
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159304): https://lists.openembedded.org/g/openembedded-core/message/159304
> > Mute This Topic: https://lists.openembedded.org/mt/87541909/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

