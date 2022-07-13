Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C505CC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 18:09:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.380.1657735761692803768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iTRTVh+I;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id x91so15156639ede.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RvbCyM4RcipJo1o6TL7cpky51WLXmX9ZM1nEmNsJ8Cs=;
        b=iTRTVh+IRytW6edN6PhQVlGZKoNgSHUL2jrvPr9WdJxxquo3vpXoCWgzEbeLi7+2VJ
         b/ThZPR6CvwxpWSA2+YqxqPqUEvKsVAJ97DViEjzebhro9S6mzF6ev4Jm+8URLsaVGil
         spT9bbRE5Uqdb7TMqr2Og9tSKL2yTTsKvjtOsSpQN4tq1DRlIlHtT8jATxvY9/OGOWkR
         B4jGajtZKdml7WZTsoVtkMZ1kiiqmwPkyySPqSVWOQARxohkCAm5r7pSD6nMaqYM7MgN
         6MUUyd6ROvOR//80XdSa4T4b638miLQIMnju4vAaWL69m9vQ3LS0mQ7oceit1Vv/v3vA
         8rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvbCyM4RcipJo1o6TL7cpky51WLXmX9ZM1nEmNsJ8Cs=;
        b=oYjfUjessv6iMQlFRXYVwp7FxBgomdkNn37jbZks/BKm1WUW46pdgdDr3yKRlHDrHY
         URnO7+CuE5l9gQcyk9wyVvGOIKKpPbEkBToL+1yYbmLMKd4tkdhbgeYqur+l2/v70G2O
         cU82+INrjyTRNpviCKVmbEC9EvMew47WwmLdOGikpirDCnfIPriI9TSRJQEZ7ZZEzQDX
         +E/Aoc48b6PxwfMb2k3DFMlkxEUex4PLYFupw5LiIc2zLKlIopCbGjrcREKhq+JZzID3
         SvHBK5X7LIYUEtIASV/le2ivjPA+ZDZg9y2JgnFybqXuGtNJWRJoomSuQPH1NMk4K+cY
         eYHA==
X-Gm-Message-State: AJIora+e4npH885/339u3Q1O7vMattgXXMwZUk6k7ssXUdJPIOK34Hjq
	tK1TO0vuUr/9233bRtSqg9bqU74iIQUmi46/gEI=
X-Google-Smtp-Source: 
 AGRyM1sCeQr6B6u+SFzGG0G3KEErOZ8lWTafOJsadDDs7GbXInJQ2t6gBavoKO4E7nUpaKBVnlzF1FMhKDytIUcGcVA=
X-Received: by 2002:a05:6402:3290:b0:43a:86c4:af70 with SMTP id
 f16-20020a056402329000b0043a86c4af70mr6392776eda.313.1657735760057; Wed, 13
 Jul 2022 11:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713165533.125600-1-luca.boccassi@gmail.com>
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
In-Reply-To: 
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 13 Jul 2022 19:09:08 +0100
Message-ID: 
 <CAMw=ZnQCPQ4zm0+YDjLq4+k17kYyjBTtAz2VsDFZDsUYp1jCXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 18:09:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167980

On Wed, 13 Jul 2022 at 18:53, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > Ensure it gets tested by the CI
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  meta-poky/conf/distro/poky-altcfg.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
> > index f03306e798..57a76e8bb9 100644
> > --- a/meta-poky/conf/distro/poky-altcfg.conf
> > +++ b/meta-poky/conf/distro/poky-altcfg.conf
> > @@ -9,6 +9,8 @@ DISTROOVERRIDES = "poky:poky-altcfg"
> >  #DISTROOVERRIDES = "poky:linuxstdbase"
> >
> >  INIT_MANAGER:poky-altcfg = "systemd"
> > +# systemd will soon require usrmerge
> > +DISTRO_FEATURES:poky-altcfg += "usrmerge"
> >  # systemd isn't suitable with musl
> >  INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
> >
>
> This blew up builds since it clears everything else out of
> DISTRO_FEATURES which isn't what was intended. I've tweaked the patch
> and re-queued.

Sorry, did I get something wrong? The diff between my local branch and
the master-next branch is empty, can't quite see it:

$ git diff upstream/master-next meta-poky/conf/distro/poky-altcfg.conf
$

Kind regards,
Luca Boccassi

