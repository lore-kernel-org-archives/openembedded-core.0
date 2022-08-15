Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AB8C25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:48:12 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web09.6356.1660589289029441265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMCInmOw;
 spf=pass (domain: gmail.com, ip: 209.85.128.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-32fd97c199fso70173407b3.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=rJl8boMTMTPJ/ME+ICpIudhX4yUoisFP2Dlv5/FLWBk=;
        b=VMCInmOwgn8tgbuDeVvNSdDX6nNnOFCIhjgcXUJSvZ5a2YXTml3hhD8iDTzfTCNAWT
         M42VijkB5bAEpPNA+jBKENW+up70Bn5ShQxYFBOPvx3TUVFtnw++gs5/TFDhck7elk5S
         EoizmSdPpVkrTH28GFCqvefJELXKjAQHJk99siP4VlApqPAfi5GDF4oclJOc2tmpElEw
         9bGykF2rcboo1qynx6B2ej45NgptXbdc9AhUTyNmtiYkMYvlrB8kHQyvtu2O347U0C7c
         0H1t9tch9VvEt9xpAIsSuE+YjpeM50LyGApw+K9n1Eh8Lq5H5ThMl5ez3RmBn0GF4Qm4
         b7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=rJl8boMTMTPJ/ME+ICpIudhX4yUoisFP2Dlv5/FLWBk=;
        b=eHy/cx79DRTMUtbzcypCdlWp9bWcJaptGTP37Vyxju4RUMljxgLQPGIg+GINgIJSlf
         iM/YEGOKZGKlVniyRC2yi9ZQYZkmh3eijy4dYIQ3WDICOssJlotSeoXOC8PTE26rcoMl
         xZUQWhudnMzDHNJFggH0+/2wii2O4h0cFBsp2RiOz6QydoBqlwS7n4VIiDkiLpLXEw5o
         oYlAgrEKp8UnClnTOMiFutGLd6xPpM7bwyjfbr4H0HkgKgGL//fvapp5GGa9fUwakk6Q
         7MPHB4YAhU+M95mP50yiUP/vgyBnRxtddZbBc/D/cCzAyn9sY9lgRzCAvWbVJNsjoOHd
         5FRg==
X-Gm-Message-State: ACgBeo2+HnANYAYzlY/rufhnioWg6b30ppq0Sy1ESLX2t3d6HweA1Ekx
	3ljIgUNXxGhdnb/FFA/xPdEPX37QhpjW49HN74s=
X-Google-Smtp-Source: 
 AA6agR5jKwn0Eo3oenXVnb1PCDK8L2tDmEFtvjtPhnxXv9UernkfpKwZkyxLtIVyObYo7nd+Am3RML1f0/tU1J6Ng3Y=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr11582010ybx.363.1660589287346; Mon, 15
 Aug 2022 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <43f17af6-eb16-efd3-ce23-374ea6791c52@gmail.com>
In-Reply-To: <43f17af6-eb16-efd3-ce23-374ea6791c52@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Aug 2022 11:47:40 -0700
Message-ID: 
 <CAMKF1spqYbHNQ7nWbPiM8jmy=pZNM3h7UvRhPfCRaYORuo7qDw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
To: Drew Moseley <drew.moseley@gmail.com>
Cc: ch@denx.de, dragos.panait@windriver.com,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:48:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169360

On Mon, Aug 15, 2022 at 11:30 AM Drew Moseley <drew.moseley@gmail.com> wrote:
>
> Hi Khem,
>
> It looks like you recently removed both the dependency on hwrng and
> systemd-udev-settle.  Do you think this change will be useful?

Depending on udev-settle certainly seems an overkill so that should go.
the change you have made will now ensure that this service starts when
dev-hwrng device is created
but loses the order of starting the service. So it may still race with
device creation.

>
> Claudius, any thoughts here?
>
>
> Drew
>
>
>
> On 8/15/22 2:25 PM, drew.moseley@gmail.com wrote:
> > From: Drew Moseley <drew@moseleynet.net>
> >
> > The previous change to remove the dependency on systemd-udev-settle
> > caused boot delays at least on qemu. It seems that change required
> > a hwrng device but that's not necessarily available on all platforms.
> >
> > This changes the "Requires" to a "WantedBy" as modeled after the
> > version of this file on Ubuntu 20.04.
> >
> > Signed-off-by: Drew Moseley <drew@moseleynet.net>
> > ---
> >   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > index 0f50890dcb..b013d95932 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> > @@ -3,8 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
> >   DefaultDependencies=no
> >   After=systemd-udev-settle.service
> >   Before=sysinit.target shutdown.target
> > -Requires=dev-hwrng.device
> > -After=dev-hwrng.device
> >   Conflicts=shutdown.target
> >
> >   [Service]
> > @@ -32,3 +30,4 @@ SystemCallFilter=@system-service
> >
> >   [Install]
> >   WantedBy=sysinit.target
> > +WantedBy=dev-hwrng.device
>
> --
> mailto:drew@moseleynet.net
>

