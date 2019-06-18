Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25DE36B07F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 23:55:50 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id a25so10602964lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bp/PgrQHJRCo0ewwgtWhtgyL2TiVHK9GsLZlWFtgkxw=;
	b=Mowqdl3mX/8IVMd0y4CjvrptIw5EBX8TE0SXnKJ8brDFq7uLdmHiChCjOc6I6WNZhY
	NPa8v/+a7nRj4HSLEzmc2R33O9ZBJELKjUVQLJVjpxYIXvqZSs5c5zUm6VtDNHVHgu8x
	R0iebBSU7+fZrL6Gk6tXy0hL5W3VSQ1uyi2t3Vq/yn5ivBIRwj6EsACvzerJqbNAekDM
	HM3mDpaIRu6S2rCtMiE/PNuIMJucWA9VvW6kIxGydtd3xSenKu74MrrSai2Da47G+fkr
	B1lyiW8ROoaZ/2Z2isJ4T+lmoPRSGHk6+R/eucVN09j6npg5BcE8WpXdfNFEZiwetBYL
	9p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bp/PgrQHJRCo0ewwgtWhtgyL2TiVHK9GsLZlWFtgkxw=;
	b=uHqs7I0KiVcHxS8Dmm7WtDJ8RDpr291Be5BHEOhQIhn+rI6D1bgzPWFVw20rnrOdNl
	lY8lvDwZjkr/LkCpLR0p/2Z2T4axIxzzDsWSQYRfv0IZS0vMyFhafVgB7BTCEBvvd5av
	qvgVTxTzqv6BXRYrIPZEGwlKaGBGDPx9EkXavZ+GNhoTmVbj2C8b/zQkW9xM1Td+qVkk
	CD2kSTCkCZ7bL2pT2Jn6kkGUpdHSgP+KETbz1GBqjyj7zHd3yLKYjAKk0keRvkOE0Nir
	AdVsFVPE1CpfZLbjtUcQNtB45SQiZGGLni2zyN7nJ32b3Xklwkc4OlB0i4ZD2En4YlqJ
	CdEA==
X-Gm-Message-State: APjAAAXVN7jtUekwYgb0HpXgEY1wGCS8EQ7eQ/3dsvvA+gnlK9KunG6P
	pCpFbdDQz3oMQF7cKLiY/kprQ9maHLe9c0ZTk3w=
X-Google-Smtp-Source: APXvYqzyw+ic7I2I4rPencDEuATytj4zM/fDgKeKwUNWtDJynqf9ramC7OxQYwp8O5sLgmxc9dz529ZUZ09Ol3ofcQc=
X-Received: by 2002:a19:4c05:: with SMTP id z5mr50716577lfa.5.1560902150712;
	Tue, 18 Jun 2019 16:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190617220122.13994-1-alistair.francis@wdc.com>
	<20190617220122.13994-3-alistair.francis@wdc.com>
	<CADkTA4OoLhubvA8ZCWVYeLVtiABtk+PC4Zm0h0HEFLzMzEimng@mail.gmail.com>
	<CAMKF1spyZz62gYdMj8otZVMKJSP4aFm=XUpW47zc+YjFOoBgqA@mail.gmail.com>
	<CADkTA4OJiU89h7CUNZ-Ve4s0C4X8nuxBJPC=rwFPsDraJ+fTiQ@mail.gmail.com>
In-Reply-To: <CADkTA4OJiU89h7CUNZ-Ve4s0C4X8nuxBJPC=rwFPsDraJ+fTiQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jun 2019 16:53:01 -0700
Message-ID: <CAKmqyKNyenWiCX29SZzej=5t8TDV1Uxr1eoukZ6cEWP1-DpO0Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] linux-yocto: Mark qemuriscv64 as compatible
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
X-List-Received-Date: Tue, 18 Jun 2019 23:55:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 11:30 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Tue, Jun 18, 2019 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Jun 17, 2019 at 8:44 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Mon, Jun 17, 2019 at 6:04 PM Alistair Francis
> > > <alistair.francis@wdc.com> wrote:
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > > > index 8aec315084..a79d0b962d 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > > > @@ -41,7 +41,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > > >  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> > > >  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > >
> > > > -COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > > > +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> > >
> > > What KBRANCH / SRCREV would this be building ? Unless it is something
> > > that I'm building and booting, we shouldn't put it in the core recipe
> > > as compatible until the SRCREV and KBRANCH are defined.
> > >
> >
> > it needs to be master branch of repo since it needs no additional
> > patches KBRANCH is not needed I suppose. and SRCREV can be picked from
> > master branch.
>
> Nope. That means <version>/standard/base is the KBRANCH.  master is
> reference only in the tree, and that's where SRCREV comes from as
> well.
> Regardless, it (the branch) should be set explicitly in the recipe if
> we mark it as compatible, since the branch documents the details.

Makes sense, fixed in my v2.

Alistair

>
> Bruce
>
> >
> > > Bruce
> > >
> > >
> > > >
> > > >  # Functionality flags
> > > >  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > > > --
> > > > 2.22.0
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

