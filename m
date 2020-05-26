Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.46875.1590483411646111499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=dT7NhaGx;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=gx82=7i=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49WSWL5fNGz29;
	Tue, 26 May 2020 10:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590483407;
	bh=NIADGoJWOI+z0tKQ9CN0cF/XUWgV7iNp40kgZYvBm80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dT7NhaGxrNeKpkOnaF2ryD6GfRRgbPsOWECSzPhMKlG4UPhsHpcWoV4wBQASTw+Sr
	 MsnzCSy5IlqQm3sCaHfxR8RqFyxHW4HcyoEgFTCt16JscfTBc4D17FsF9ncZ0fJmTW
	 cmo91vYYpYs2wc82jNOhknSx4AN74iKEDUePhZ25NtpTVqORAJNxgbigyU+d50GMT7
	 uKRPkT2oLdXmQrD7/Gi11lcf9bHNX5AwhB9Zu0XobheLrxoMLoCq9K5rx2KujU1zJB
	 uf4nLTHUHjY9zc0hwRgpUyXBV9H55+Fmou8RW5zSwERHA0ba74YEJrtFleHdlpRlL/
	 ywU6m4AkC/GwUdqCBSxGy1ybgXuv3bfnPxqsAHBfmhPCP7z5PYNcDHgTnI30CtcKDh
	 7/SvR1+YyTbuD1ojJ0UkQEAYr0fsjD3T1P/229B7lilp7TGFSm7ppoTRd6ScNg6xXr
	 ER++9s/e7l4kpNeLJock012iiRdE2fERcr8jJU2q9rsNX8Yw3bpYSi+fzlh2RjsOxQ
	 mqx2RLtXhdln3OXMnsDGOezmGsHf3b/8fs1/J9DHmF/YZoypOiMPELtGJq82U8h+6Z
	 T/qOQtya5x/lqjUrjezA4o7og6a5hh0jKlWpJP+kIoLYwcCYkQlI5Z2ewzUJXRJJDd
	 IKly4FJw41krr5UsoUjbzGSM=
Date: Tue, 26 May 2020 11:56:44 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Paul Barker <pbarker@konsulko.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Marek Vasut <marex@denx.de>, Stefano Babic <sbabic@denx.de>
Subject: Re: [OE-core][dunfell 09/17] libubootenv: Depend on zlib
Message-ID: <20200526085644.GA15031@localhost>
References: <cover.1590445868.git.steve@sakoman.com>
 <dc5babe9472ba7379edbb17b6cbac44604606b26.1590445868.git.steve@sakoman.com>
 <CAM9ZRVt4dKEefgQF8xnGVoEbm4hFiPOzc106YPai0D5-DpuWoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVt4dKEefgQF8xnGVoEbm4hFiPOzc106YPai0D5-DpuWoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 26, 2020 at 09:24:59AM +0100, Paul Barker wrote:
> On Mon, 25 May 2020 at 23:37, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Marek Vasut <marex@denx.de>
> >
> > The libubootenv depends on zlib as it calls at least crc32() from
> > there and links against it. Add the DEPENDS entry.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Stefano Babic <sbabic@denx.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > (cherry picked from commit db513f9ec59b7ac526b2cdc42b0eb2573e134bc4)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > index 3251d0f05b..fa90a12bf8 100644
> > --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> > @@ -1,5 +1,5 @@
> >  SUMMARY = "U-Boot libraries and tools to access environment"
> > -DEPENDS += "mtd-utils"
> > +DEPENDS += "mtd-utils zlib"
> >
> >  DESCRIPTION = "This package contains tools and libraries to read \
> >  and modify U-Boot environment. \
> > --
> > 2.17.1
> 
> Is this actually needed for the u-boot version in dunfell? My
> understanding when I saw the original patch was that this is a new
> requirement of the latest u-boot.

libubootenv (not u-boot) uses zlib also in dunfell,
and a direct dependency looks correct to me.

I assume the breaking case involves a layer shipping an own mtd-utils 
recipe that does not pull in zlib.

> Thanks,

cu
Adrian
