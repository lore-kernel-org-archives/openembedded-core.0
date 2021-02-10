Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.9633.1612980578358511931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 10:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dxpIW0o4;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w20so2226292qta.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 10:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nr01B76F1+qYJwPbGmNd0gY0FF+lKTwN5j6UzsnpVo4=;
        b=dxpIW0o42AoTH8WyBMAdz/D3WmEGEcsUzyMHhB0eNFyOR0MEZafuxx0OSPgfY8zXB1
         k4VNbe4nT25wzIAU9JkeE0BcnZPZY0NgpJoZQOjb8o+E/bhIdaOtIOnS0G7giHlmJhbm
         mr3Ya/tUi98w+5XFXKiEOraNFhjNeGapgW1wjuqEw/fgozV3I18pzh97UbsTvZ+sO9FE
         HLfCaexYIm8FAnS6KIXw8kTpD4q/XHkQrZW3DRiOoN2iHRKYdW+ia6kKazO1YOSn7V4I
         O61dkjG347ZoJa/mOoT31rt5YUqyvRGydpEP8KWM3bksaCF9g+GmpKXsVnQlSd2ldxxQ
         YrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nr01B76F1+qYJwPbGmNd0gY0FF+lKTwN5j6UzsnpVo4=;
        b=dL5ktRg0l0IVLWB1XV4ys3u5bhVpk3LcpzQwTFenqPRQEMBBcaVx8fnMQlK4efMl+7
         XOJHwAL6LY+8jgr6V409ClQP/2D3fq5ItCVNiNuE9uERycvIPg0J3nW7dZ4Mbld0i4si
         A/udZLJ2Hnx8xnJJQwz9UUCokdMyPlj6/+INHAU13kmKr8qLKELuPtP3T6Lrl5vKOUJx
         EQppoNHGKZNYi76mk+DUbe5olh8TzTDVP4GXQqZS2bIpnqWD2DgG/Hbwjd7Pt1+CZU/0
         OlDkqJWVwAtgPO6bIKwqJL64tahhR9V4zg49m00sqSJn+UOWxvfJ71B1VjgadUauIS/B
         E61Q==
X-Gm-Message-State: AOAM532ZIOGu7rAZ2JX26TmFj/iU82KxN62mtVfpStjjz94fu/Vl9Z8M
	rzohqx1rmMNv5lYr81G07wVfFSx/XCi9n1PWI7c=
X-Google-Smtp-Source: ABdhPJzlR4cMoAquGNff7lVTi6lBrABkQBeexvr8V7YvWmZ8b/FvXzZg/ybUtfwJgTM3/pQ8cUQ6yPtLV2Syh8S/JhQ=
X-Received: by 2002:a05:622a:44d:: with SMTP id o13mr3879919qtx.378.1612980577421;
 Wed, 10 Feb 2021 10:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20210206063138.1649019-1-raj.khem@gmail.com> <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
 <CAMKF1so+8XcjgVUjSbn3ph1ZMRQRjnLQbq4na9WNEfTT_TPwuQ@mail.gmail.com>
 <YCOd2Ru/zB/fZedT@korppu> <CAJ86T=WTgTHUMb8s+jjUPJDRCwLjr_qpoT2vU3_nUgyheHDALQ@mail.gmail.com>
In-Reply-To: <CAJ86T=WTgTHUMb8s+jjUPJDRCwLjr_qpoT2vU3_nUgyheHDALQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Feb 2021 10:09:11 -0800
Message-ID: <CAMKF1sqTu562phLHi0opn7+mXHn6gb6d-ozB4WJBkcwVgsX+mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>, Anuj Mittal <anuj.mittal@intel.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 1:57 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Feb 10, 2021 at 12:48 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
> >
> > Hi,
> >
> > On Tue, Feb 09, 2021 at 11:37:39PM -0800, Khem Raj wrote:
> > > In this case -O  will take effect sadly. and it seems to be that
> > > autconf munges the compiler cmdline
> > > while generating CFLAGS in generated Makefiles and appends the value
> > > of -On coming from CC
> > > variable last.
> > >
> > > I think right solution would be to add same -O<level> as specified in
> > > SELECTED_OPTIMIZATION so it remains
> > > in sync always, I have sent a patch to ml. Could you test it out and
> > > let me know if it works for you as well.
> >
> > Or let it go? A lot of recipes amend their own optimization flags and override
> > distro wide optimization and other compiler flags. I once fixes all recipes
> > in a project which were not obeying Os until buildhistory showed change in binary
> > sizes... that was a lot of work for a PoC..
>
> If the goal is to ensure that the optimisation flag from
> FULL_OPTIMIZATION and the -D_FORTIFY_SOURCE flag from
> lcl_maybe_fortify are always applied together then isn't the easiest
> solution to move -D_FORTIFY_SOURCE out of lcl_maybe_fortify and into
> FULL_OPTIMIZATION ?
>

The problem is that we insert the flags inconsistently and it depends
on underlying build systems
interpretation of these flags. e.g. We add D_FORTIFY_SOURCE to CC/CXX
but -O<n> to CFLAGS/CXXFLAGS
many tests e.g. do not use CC and CFLAGS together, if we remove
D_FORTIFY_SOURCE from CC/CXX then it does not get tested in configure
tests but final compile uses it and cause miscompiles
and this all is also need to keep in mind that we might have external
toolchains which are compiled with its own
set of options by default. Thats why we have to be explicit about
these flags so they can be customized if needed.

> Putting a separate optimisation flag in lcl_maybe_fortify and trying
> to arrange for it not to clash with or override the one already in
> FULL_OPTIMIZATION seems like an ugly solution, even if it can be made
> to work.
