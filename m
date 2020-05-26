Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com [209.85.161.67])
 by mx.groups.io with SMTP id smtpd.web11.47060.1590483476474704275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sYrosaZK;
 spf=pass (domain: konsulko.com, ip: 209.85.161.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f67.google.com with SMTP id p123so4072510oop.12
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrmtjTXL0fOISIsq8/v7v2LI4VbggCVT68DPpumiLyw=;
        b=sYrosaZK9AUKUVqTQwWxyHJGKbzWKr1nSKLV5+m44kB7BgWvq+AxRu2mKwJkQ7J/Nk
         gLcSMgrFxib1K9k4i0bbeVPfCEnTPqPZwSxwbAbfVxwyg72YAqpCEqss0W9uwG/zw415
         8qsBm83fLZmhPBbHBUso5vMTBC69wmN5TStpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrmtjTXL0fOISIsq8/v7v2LI4VbggCVT68DPpumiLyw=;
        b=LV18OOz2RX+hI8GLbasNdrQwtPRwTjAPdtMmsYh7ldiCW+maNZMYCingSmHM9byDng
         8yXEvNTHQhdbey1YtSMTIl9Z0LQT9yOdgzMq90feDUN3P4LtBYedpCwwit2kaYoYhQhJ
         hBnpPCW68+F5wsEoinXcsIgdfGC+ElQBRk/SrkuxJLKA1vwnJiQVp4+EVdBW2VBjzcKN
         n2+r/pc44mrerRXRCnNmdkyESp2N3r5vWJngJ5lpHOZbv/VG2jFDM9vqz2Ezg13NabX4
         NTbOmrrYFCACekMPNI3/5rAJmmeAsGLROCArmic2DWc0Wqec+fyvUZ4GVlqB/2I7KUMf
         CMSg==
X-Gm-Message-State: AOAM533rRQ/SOcOyNWUAuS4tckO+YqVYYRBDU5YWStL926HYXyO87Opq
	0XXtd0vlNNKektqgMbUuSSiZuS4XUp7Y8aO73Vm7Lw==
X-Google-Smtp-Source: ABdhPJyvipPSqdKUHZR01zg9d8bjCq40AzgtHVtWFTDJDgSBQMtJo5Ob9IIOWIfuRL9ISarBGZw+7BiiMSJnFaYz1YY=
X-Received: by 2002:a4a:3388:: with SMTP id q130mr16162986ooq.5.1590483475811;
 Tue, 26 May 2020 01:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590445868.git.steve@sakoman.com> <dc5babe9472ba7379edbb17b6cbac44604606b26.1590445868.git.steve@sakoman.com>
 <CAM9ZRVt4dKEefgQF8xnGVoEbm4hFiPOzc106YPai0D5-DpuWoQ@mail.gmail.com> <20200526085644.GA15031@localhost>
In-Reply-To: <20200526085644.GA15031@localhost>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 26 May 2020 09:57:45 +0100
Message-ID: <CAM9ZRVsmbfB4YzFa_kOdt-+QocRGz=uMjP0iw2a-5MMVJhaFrg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 09/17] libubootenv: Depend on zlib
To: Adrian Bunk <bunk@stusta.de>
Cc: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Marek Vasut <marex@denx.de>, 
	Stefano Babic <sbabic@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2020 at 09:56, Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, May 26, 2020 at 09:24:59AM +0100, Paul Barker wrote:
> > On Mon, 25 May 2020 at 23:37, Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > From: Marek Vasut <marex@denx.de>
> > >
> > > The libubootenv depends on zlib as it calls at least crc32() from
> > > there and links against it. Add the DEPENDS entry.
> > >
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Stefano Babic <sbabic@denx.de>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > (cherry picked from commit db513f9ec59b7ac526b2cdc42b0eb2573e134bc4)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > > index 3251d0f05b..fa90a12bf8 100644
> > > --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > > +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > > @@ -1,5 +1,5 @@
> > >  SUMMARY = "U-Boot libraries and tools to access environment"
> > > -DEPENDS += "mtd-utils"
> > > +DEPENDS += "mtd-utils zlib"
> > >
> > >  DESCRIPTION = "This package contains tools and libraries to read \
> > >  and modify U-Boot environment. \
> > > --
> > > 2.17.1
> >
> > Is this actually needed for the u-boot version in dunfell? My
> > understanding when I saw the original patch was that this is a new
> > requirement of the latest u-boot.
>
> libubootenv (not u-boot) uses zlib also in dunfell,
> and a direct dependency looks correct to me.
>
> I assume the breaking case involves a layer shipping an own mtd-utils
> recipe that does not pull in zlib.

Thanks for the confirmation, I understand now. Looks good for dunfell.

-- 
Paul Barker
Konsulko Group
