Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.749.1602002676142777895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aWjTPpIg;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id a3so18586194ejy.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ElntIrQq8o4g3KOGE1j2Tcuo9tWgl6CSZ0SCUpoQHUY=;
        b=aWjTPpIgUHwo1LCB9YfO0lZt5e2IvNRuZnaWRfwcz5wgWb/+SXR+zzbq0lCiGYQk4h
         31rFZUpM5b9yxwhErJsjHXS07oUTgCJQ0tLbt0hSdTRNBNTWKBf+6uif5ZuQuzvt0WAH
         RegUb58EWaNt8lTQ8eO36CSbP85XdeC4NMUzKFZ8+SQuHv9fCojXNatjbFE+WZJ2SJTH
         GPVFwVVSPktfLNUO7oAItOxyHTuc8wg6DVmdqwuyjXwvsSfI7m7I8pj594ivjGbGDmR6
         lWO7e5hlVMWrs/B7y+vxXRDzb2WtavuGalh+RYKQM1/7VPnziP6gadt4PSs/sSVUJ2Pc
         K3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ElntIrQq8o4g3KOGE1j2Tcuo9tWgl6CSZ0SCUpoQHUY=;
        b=QoCD6RhE6DzOfjwVpqCjrXJL/4sMQ6iI2r/Hl/Vncaiw/2aeB1KA9Py3ToqEQUHkxC
         hSClPPQbTjBwmUhnB+DkPjYGN96fMSDyCrMrl2dwbIghwqcLKu0qaAOivuFYGFUfn/wc
         79ayDxxv/NBVnqbzDvXlX/LoD1nlIYjqsabbY7V1Js5ncQC7I+9qDM0C8I5NhUO1Z9Oq
         eyb/P7h3dMuOrWPexmAnmfiDj2UyrcmDq1phwyZx5nHXlcgJkW071DD0TiP+pgjHUsJz
         y31/hbi0Hsi71jNCZBp1P4sNC9uQhSED/SduE7aTqK/E0tdJoWaN2uCgDqjtS9ANpoeQ
         x11A==
X-Gm-Message-State: AOAM531EELeTj4ivZ2+C7uWcg7+fdLF6ahT8pBa1o+OHkoc+RscCp4F0
	lXxthhFzRX9BDf7oSQLlmFIPsESuI5U+2xXmP/OkbmLgmOTmTg==
X-Google-Smtp-Source: ABdhPJzer+uL9MJTnJtogJKLohIFQ0uF1f2smjUBQltFwiaP0mXQnSEKAyDqqqzj+TB7xs2Q8iwKFEzcQeC/fLh2GmA=
X-Received: by 2002:a17:906:7e53:: with SMTP id z19mr427348ejr.334.1602002674545;
 Tue, 06 Oct 2020 09:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201006121105.94671-1-marex@denx.de> <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
 <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com> <CAOSpxdYJss9x9axm4E_JMtgCS+Kwpx_F-iiHfn=o24do0g2YKQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYJss9x9axm4E_JMtgCS+Kwpx_F-iiHfn=o24do0g2YKQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Oct 2020 12:44:23 -0400
Message-ID: <CADkTA4Mb6hD=S-zC8qq=EQaku4FGHLxFpgjk4dJMfyj=X7=pkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Steve Sakoman <steve@sakoman.com>
Cc: Marek Vasut <marex@denx.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 12:42 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Tue, Oct 6, 2020 at 6:39 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Tue, Oct 6, 2020 at 12:30 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
> > > >
> > > > Update to latest available.
> > >
> > > Have you tested these patches with kernel versions 5.4.62+ ?
> > >
> > > IIRC, Bruce said that the 2.11.x tree did not have the necessary
> > > patches to build with recent 5.4 kernels.
> > >
> >
> > Since I did that backport to keep us moving, the lttng project has
> > added commits to the 2.11.x branch.
> >
> > I see changes to the right files in the commits, so it should be good
> > with this update, but I haven't tested it myself.
>
> Thanks for the quick response.  Given that info I'll pull in these
> patches and start testing.

That being said. I'd expect that we should drop the backport that I
did, but I don't see that in this commit. So that is worth checking
into ..

Bruce



>
> Steve
>
> > > See his patch "lttng-modules: backport writeback.h changes from 2.12.x
> > > to fix kernel 5.4.62+"
> > >
> > > https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=348c666b2dca230308c8462dac2117b04cca6ae7
> > >
> > > Steve
> > >
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  .../{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb}      | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (92%)
> > > >
> > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > > > similarity index 92%
> > > > rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> > > > rename to meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > > > index 6fff096a37..a38d8afb7a 100644
> > > > --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> > > > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > > > @@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> > > >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > > >             "
> > > >
> > > > -SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
> > > > -SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
> > > > +SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
> > > > +SRC_URI[sha256sum] = "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c663ff3875ba9c8566"
> > > >
> > > >  export INSTALL_MOD_DIR="kernel/lttng-modules"
> > > >
> > > > --
> > > > 2.28.0
> > > >
> > > >
> > > >
> > > >
> > >
> > > 
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
