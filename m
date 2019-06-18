Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6320E7E930
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:03:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j19so15934833qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ajH07WJ+SlBmSE3hTIRByWSMEyXLTlAqE/gIgDopIqs=;
	b=H2m9DjLO7XAOLXXGNoc1PkdGGmO/dfTJgct4oNXo9c2MU8nR282re99fTQ5wed/DCz
	O5toXGg8VcOlByav9llFVWXQGkVZTaRYJW6fshg8f23uMWtKc4QzWFV0A+hBAzTE0yYp
	8COSjTMqF3aQPqixtZMv7D9k2rp9OmevNJC6l2VSzXBBVEeGJsDs6/M9UOTEDiaAyKdu
	rGO4V8tRST54z0ZmCGMYvt3+m54tsNpctR/yKFGjM+tSbxX1Y9ieJrdqStcpkuJlkHRm
	WOBx9U+ajSD3us8IZirc9GRpbneGhBNynofoq4tGz+/vLAi8uE1L1uhOKBtiEWRawEJc
	J8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ajH07WJ+SlBmSE3hTIRByWSMEyXLTlAqE/gIgDopIqs=;
	b=AdOAUQUYYseR9d4n79U+GaA7CL9rZU7MPwv/cOjZLBLUHvzYOYeD19E0IjmFpRCe1L
	S91fhg41PGOazqYamXPuiTafRPa28LlRhritdfRH0jcs/n8ABfWIxVO+ZxGChYURXfNn
	nL2CGlsmaeSn7rmUm1GQnmZjvWLCOdx7zs1IGORamWF9kY2hzoO0w6CqhFSq6C4kvWlG
	RD3tItjGyqyYSBfT7O+GQDkHLBhzv0vvp67z4snNZ/78YR0EHY3WYxpX49XXx1f6LNPs
	L3sH78rYYTBtszNFOXc8/ap2cgjm04fsOjhQ/heCEA02QgYPlxQlFX095R3ykLdB+Ry+
	4YuQ==
X-Gm-Message-State: APjAAAVAU4wgP9soJf6yZAT3xsU5DTwgZsVh9euSsmAVoPAzVgeXrfA1
	Vp6V6mfC3cIKEBAMwkijZGBp/QtozLJxCkQXVYM+DhSq
X-Google-Smtp-Source: APXvYqzDQFfIYdUcgL/FZd6/i4StYBFD572I6OgiG84YIwNhpQo69wbCXSjhN67HlEXnla3mEULPin1ee+qyij0flWA=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr97701880qtp.88.1560873786254; 
	Tue, 18 Jun 2019 09:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190617220122.13994-1-alistair.francis@wdc.com>
	<20190617220122.13994-3-alistair.francis@wdc.com>
	<CADkTA4OoLhubvA8ZCWVYeLVtiABtk+PC4Zm0h0HEFLzMzEimng@mail.gmail.com>
In-Reply-To: <CADkTA4OoLhubvA8ZCWVYeLVtiABtk+PC4Zm0h0HEFLzMzEimng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 09:02:39 -0700
Message-ID: <CAMKF1spyZz62gYdMj8otZVMKJSP4aFm=XUpW47zc+YjFOoBgqA@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Jun 2019 16:03:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 17, 2019 at 8:44 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Jun 17, 2019 at 6:04 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto_5.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > index 8aec315084..a79d0b962d 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > @@ -41,7 +41,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> >  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> >  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> >
> > -COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
>
> What KBRANCH / SRCREV would this be building ? Unless it is something
> that I'm building and booting, we shouldn't put it in the core recipe
> as compatible until the SRCREV and KBRANCH are defined.
>

it needs to be master branch of repo since it needs no additional
patches KBRANCH is not needed I suppose. and SRCREV can be picked from
master branch.

> Bruce
>
>
> >
> >  # Functionality flags
> >  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > --
> > 2.22.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
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

