Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E7DEE7CFDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 15:36:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i17so6628720pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mlA3srJPcmjNPAEssLniQ2t3K70BnmPxImjhsDuLg4c=;
	b=m/JYQIzYF/lFzYJFTTFy0yIPMF8FAHlhMRB4XoBScsscnF8dtS9+z8WRSemA/bVtDw
	qufjj0USL6/aXgZoTNdh+hlwkhTIXukcQDHzFJAsh1GyhmVUojHONm8Guupd54fnOVJF
	hMkmrVdNB5wn+edEXHhq9bRImBX1aJy7Tbxl61qSyJ3SeHi5uJAlyVr+OFRhDAZCchsW
	GxglYW16FwUsab2i8tzz85BnSs7fxkjeuLlIP7FVe9Su6t6aCF8FsZbJjq9JSU+xq3kh
	P6OqenYvwDmbr0jVh9hyWsF6IBDW1FmxgfyZ0ZiX6tnQKK1jhBwSUZ2PtfbZ1dExMOPr
	TF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mlA3srJPcmjNPAEssLniQ2t3K70BnmPxImjhsDuLg4c=;
	b=Abqoo2VptfkcU4GNyB4h92IHzMDNWbyppENUNpT2E5FgFYVSY2ok8aYwC/eNHQ8Q7T
	ii9GifIsV0QASgsWQsMS4oGsF8iYhUEcFK2YbvlPaqXE5WOo1V/k5OhwlXDOe4xuwtt9
	o/Si56/cjMwGT3Nd63fcjp6V6iNeVdXN5SbaF4ncPPbjd/Jfr2K1hZpSTt1oTqDs14Bh
	+KOU45vv2CJTS3rH4vtF+b5kMgcE2UFjgY1l8Q5aRxyiGqjMTlZbBWZWBsDI0vvHsB/7
	k8V6X3/UNNGP/sK4BVMS3RTmK0vig/t2FB/Do161UcOffY4b7TzTBDXKGmi2KIjiJTmI
	MlhQ==
X-Gm-Message-State: APjAAAWV2Dx0jsplcJn6G71dMcUznLE0PjHm5nOvU8oMTyIxTa8pWZze
	h3QBz+XN3LQ36aCWqbA+9JDnY5tW/yBmaLcddnk=
X-Google-Smtp-Source: APXvYqyXuOLvxESd8RbCz24R1YXb/g/WS5j7Yohfatzj7BsMZXWzhBteNXddWnnctnC+LnQRPRzJXCCPIIpOo9HPyY8=
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr23421171pgr.411.1553528216124;
	Mon, 25 Mar 2019 08:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
In-Reply-To: <CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 25 Mar 2019 16:36:44 +0100
Message-ID: <CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 15:36:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2019 at 11:00 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas M=C3=BCller wrote:
> > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > >...
> > > > > There are certain design aspects of musl which are actually turni=
ng
> > > > > out to be good
> > > > > e.g. there is no __MUSL__ define, so non-portable code can not be
> > > > > hidden which is a good thing,
> > > > >...
> > > >
> > > > Please take a closer look at some of the musl changes to NM that ma=
de
> > > > upgrading NM so hard for Andreas.
> > > >
> > > > +#if defined(__GLIBC__)
> > > >  #include <net/ethernet.h>
> > > > +#else /* musl libc */
> > > > +#define ETH_ALEN       6               /* Octets in one ethernet a=
ddr   */
> > > > +#endif
> > > >
> > > > Using __GLIBC__ in workarounds for bugs in musl is wrong,
> > > > and cannot be upstreamed since it would do the wrong thing
> > > > on other non-broken C libraries.
> > > >
> > > > > While the eyes may hurt
> > > > > to see them, it does serve a
> > > > > good reminder of whats needed for a given package.
> > > > >...
> > > >
> > > > Who is responsible for fixing the root causes of such bugs in musl,
> > > > so that the workaround patches can be dropped from packages like NM=
?
> > > >
> > > > cu
> > > > Adrian
> > > If I am not mistaken nobody is responsible. It is recipe wise: Sendin=
g
> > > out a patch that fails for musl is rejected usually.
> >
> > As you have experienced, it does create a huge technical debt to ship
> > workaround patches in several recipes instead of fixing the bug in musl=
.
> >
> > > The last example could be fixed easily at musl shipping a ethernet.h =
containing
> > > #define ETH_ALEN       6
> > >...
> >
> > That's already shipped by musl.
> >
> > But there seems to be some incompatibility between musl and the
> > kernel headers used by musl.
> >
> > This has to be sorted out in musl and/or the kernel headers.
> >
> Although I did not want to I'll start a musl build to create a cleanup
> for NM (and maybe) other musl patches.
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Hi,

I am jumping in a little late to take side with Khem :)

What happens now is that more 'bad' sources (written to suit glibc and
thus not portable) are discovered by the wider base of developers and
autobuilders.

I myself did struggle in the years to maintain a few packages deeply
bound to the kernel (mtd-utils, kexec tools) 'compatible' with klibc
so I know the pain.
As Khem said, this just needs time and efforts to clean up and
upstream the patches.

Cheers
Andrea

