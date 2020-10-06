Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.622.1602002401235368592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dijvkeo8;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a3so18565078ejy.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npCQAhG1SikMyU1ejIycABbGkMywk0Af3Jj4nE9OQng=;
        b=Dijvkeo85w5tts9PgpQEHiQue1FHtDZ6X+1CrP8qJ2R50I5dNfGZ73eGOTpjqwZbX6
         q8XnSMulOENm4ah5g3mLzlJpypdn0gTBRCr2494sP1YszUwmqhGgCvHz9bFy3lf8i9X4
         9lnybnKT/98l5fPdN2i+WLlZOIYF+gGELfMeJ/u8dr27n1rsKa2d3GoazszlBK7lm3jq
         JL23ob0hQ0rCZXEKgZjwvV4fKbqH3tDtDBVC+R8WhpGlYgijhPLsx9IlWLejFBYFF3BV
         JStVNPGxw2Dj9wjZPD8MOSZQe1+YjDapoQ/1toLgOyERDLQihCiv3yXR/IbTp6+VmGeV
         OlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npCQAhG1SikMyU1ejIycABbGkMywk0Af3Jj4nE9OQng=;
        b=TsU7wgdpYYz+E9UFD8rQGJGbzmSedIJxl0zd158HajQgjUi6mNQrOjofhhWaYWyLD2
         sL4bQBqYZfneytyXoPZA+JfnExhTZ5dcMYKnEoBEJalc1wf9myZD/bUZkJBy+94Xmylv
         cXNhRDxkYpNSOxH143858D7/HNFIvTMkiaNkQTDwM534nIeGWlgWYBfYNAN0BP0/FiIL
         0o48kixfVJS43PBcJ0lhPRV6kH0NsmdDSO0zlklN8OMF4njzmTLqg3wYDROHXQtc8q4T
         or8gSMKQQWZHg23KqYo3VPQ6uKTdE2fVzBD2SqxtlZl6MBSC4bqEbRfv3DU7LcBTKvVs
         WcKw==
X-Gm-Message-State: AOAM5302EfZXeVSY8xlvOHXLh0g1Kw7jAeNr8qUxcgrUOYHT6UFiuDhm
	uf9wgTeqNiR57AkekNHdDWTZG2T8r2Y6hzuiHtI=
X-Google-Smtp-Source: ABdhPJw50uqSFWr6rIjCqhDDedDZnKyH1qaJZS16K/n/jqkUDFytlh4M5YYX8TSZbCysGJ7amNPDrSIH/A9obHFueEQ=
X-Received: by 2002:a17:906:7e53:: with SMTP id z19mr402633ejr.334.1602002399137;
 Tue, 06 Oct 2020 09:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201006121105.94671-1-marex@denx.de> <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Oct 2020 12:39:48 -0400
Message-ID: <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Steve Sakoman <steve@sakoman.com>
Cc: Marek Vasut <marex@denx.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 12:30 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
> >
> > Update to latest available.
>
> Have you tested these patches with kernel versions 5.4.62+ ?
>
> IIRC, Bruce said that the 2.11.x tree did not have the necessary
> patches to build with recent 5.4 kernels.
>

Since I did that backport to keep us moving, the lttng project has
added commits to the 2.11.x branch.

I see changes to the right files in the commits, so it should be good
with this update, but I haven't tested it myself.

Bruce

> See his patch "lttng-modules: backport writeback.h changes from 2.12.x
> to fix kernel 5.4.62+"
>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=348c666b2dca230308c8462dac2117b04cca6ae7
>
> Steve
>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb}      | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (92%)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > similarity index 92%
> > rename from meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> > rename to meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > index 6fff096a37..a38d8afb7a 100644
> > --- a/meta/recipes-kernel/lttng/lttng-modules_2.11.2.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
> > @@ -13,8 +13,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> >             "
> >
> > -SRC_URI[md5sum] = "2e3bc8cfb264fa13f374618b46f170e7"
> > -SRC_URI[sha256sum] = "8a42240813b8fd1d001835cd6f5ec687f7d7f3b26070d4e21604c35a51a6441d"
> > +SRC_URI[md5sum] = "8ef09fdfcdec669d33f7fc1c1c80f2c4"
> > +SRC_URI[sha256sum] = "23372811cdcd2ac28ba8c9d09484ed5f9238cfbd0043f8c663ff3875ba9c8566"
> >
> >  export INSTALL_MOD_DIR="kernel/lttng-modules"
> >
> > --
> > 2.28.0
> >
> >
> >
> >
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
