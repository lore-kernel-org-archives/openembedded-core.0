Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 613717C2D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 20:02:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r14so1011835qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 12:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=osXlC230K0NjHDMjF2Nw/4DitoJZ8w8BpSFIHB/QNsY=;
	b=PuL0En8+/bW0i7qT0KE2Vd17bM0hexxw93nFM34E10Y7N2UWIRkWdhr9GQo8C6B/nD
	TRp63zkeoHU2+y70tDH2tybgZv6yCjd5vBumjkJ4PS19uGRtDOTgYfeOn3WLuYzqSQoW
	0ERfj8eSmdYSZNHuK+DRbluDbcB/CZnMU336SfZoKtgytw6FzOTbGQJyKtum41MVnL0i
	hYGaIx24hxz3Eg7y+TcSgdKsnffSgvCEJO9dJbJJnfkNhr9rXTB6oFhHKJfbf6bazno6
	xFvn+8g7rC68maMss0zwC7fITwjKW8lJA49EkQwdW3MmtDXipkAfJOOYmkrzj+ukbldE
	x7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=osXlC230K0NjHDMjF2Nw/4DitoJZ8w8BpSFIHB/QNsY=;
	b=sRI38+7zkzmRWUYspT49/CqZmoW98Hej343zKWbLIykH5Vu6C0wZMLrLGjH7psIzL8
	t3TTvAhnlnsQ3aL/Mb4iHWiAtNoYZCYrsw8ft8wk69p2NSmRjCO/HJcy3CwEk32JxdoY
	nGl5t8eDzw/u+xF0ReN6WGTsazw3vUAWe2yjCkl2ZPZoJ54CoFytwMgDH/D0/JSLyiUF
	wUHwRURIHf2tpTHzY9u0MXW7VR1Hh1pkn1CWbvneKOIEblgS/AdMQ22oXL++Skzq51Dc
	bkAfDSiz0INxFLf8sOpOg+I/MzNbi0+WrG7bklqqHSvxSCXKFKTr+Un8YUDHRRTGcDw/
	3LPg==
X-Gm-Message-State: AJcUuke6ZTlAwdfbHCTVh2iiuCh1OqDs0y5KKxyNUUFUDTv1jumjPJhO
	ysg/GOHNeY7PjM9c2kfUoOFtbDh1bIMh7xr68OyMdneU
X-Google-Smtp-Source: ALg8bN6SV/3CzjnjfoQlW4sS66VUUjdcsz/PqbbLAyQX/698m7UUz5ivMZ6GHUYqo/c0dCzT/u7y4vmZeKj64Qx9wg0=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr31439120qte.29.1548878526989; 
	Wed, 30 Jan 2019 12:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<CAJ86T=XUqY8+ZAgRpXfd=OXULoOvMb57we6R2Df_b8N7q2csCA@mail.gmail.com>
In-Reply-To: <CAJ86T=XUqY8+ZAgRpXfd=OXULoOvMb57we6R2Df_b8N7q2csCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jan 2019 12:01:41 -0800
Message-ID: <CAMKF1srQNd9qe0Y+MgwFTcfnN-HOzFSO3GiOyOH+OL=h1mLDRA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 20:02:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 30, 2019 at 11:48 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Jan 30, 2019 at 8:50 AM Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > This is a tiny but pretty useful tool.
> >
> > question is, do we need this enabled in default config, or could be add it via
> > some DISTRO_FEATURE meant for validation etc. May be if you explain your
> > usecase then we might be able to make a better assessment.
>
> It's not just a validation tool. I've seen production code which sets
> up GPIOs etc using calls to devmem from an init script.
>
> Of course it's not needed by everyone, but it's a useful tool for some
> and it's so small it doesn't really deserve it's own conditional logic
> in the recipe.
>

Thanks for information, lets see what Adrian's case is.

> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>> > ---
> > >  meta/recipes-core/busybox/busybox/defconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> > > index d11707abc3..1519159a49 100644
> > > --- a/meta/recipes-core/busybox/busybox/defconfig
> > > +++ b/meta/recipes-core/busybox/busybox/defconfig
> > > @@ -791,7 +791,7 @@ CONFIG_DC=y
> > >  # CONFIG_DEVFSD_FG_NP is not set
> > >  # CONFIG_DEVFSD_VERBOSE is not set
> > >  # CONFIG_FEATURE_DEVFS is not set
> > > -# CONFIG_DEVMEM is not set
> > > +CONFIG_DEVMEM=y
> > >  # CONFIG_EJECT is not set
> > >  # CONFIG_FEATURE_EJECT_SCSI is not set
> > >  # CONFIG_FBSPLASH is not set
> > > --
> > > 2.11.0

