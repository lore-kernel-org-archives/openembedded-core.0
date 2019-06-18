Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 31D467D2AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 18:29:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r9so555015ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YgSPG/QmXB9xsnZX5JrtwNp2e7RCKpV9H0avZojcXGc=;
	b=gvxARyMV4iCJ8+i4sWUHW9SgCs4cXKlGE/cT/Jd6Se+Ounksk5g5OsVRL/7azvsD6d
	fFpa2OgigxslcljPJO7gk659HeR9q0WSc3uhbcKgjtpCLQDNw0VTXObjarVUiBH4cNzv
	hseQnnwKycuwT0H78wLFKH/4qzjOktkr7XYAgyfo9PIuP0AhD+TSOz+swnFVxdWIxkPX
	PQ7bHwYHp22SUvA39adqZy/T6TSEJXhoE2Zar4Z1d7w3sVbX5u8OL8ISMdejpNh2i5TP
	KGBFdYuFGF1dY+qHR63FrpxQw8kWNISmSBl4gouZFrPw7fDY4VkPmfVGvH0c+EBuZ2bx
	QJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YgSPG/QmXB9xsnZX5JrtwNp2e7RCKpV9H0avZojcXGc=;
	b=uMpZHU1mIhHSlcdyJoYhDlpPx3SrDE9LgzVXU0yBFjscwh5//z6wwm8W6CRcazQNFG
	jO9nX0vCJuvk7mEyuG3QMWFOPLMrAiRVCVn+z/Y7Hk9uLPrOKr9kndxLviVXVUQucwJ9
	XdmHQfx4fRZBqIGtsq7RrkENq3kpt7X8NMlZeNBM1Pb0d5KaWOWWuRAwf5EUvK22Uua1
	TdAeYl0YlVK6jCg5aEGaV/KR9+d/i+uqR7B92hhCJiHfNSBYL9rROAjs81NTV+GLDadR
	rf4iUXbw2cA3Ho0EUVbPqkFFY/hN30I/Cefzs2k/fmh6JGhqCKMXhhR9K6E3WmjdjCzb
	2x8Q==
X-Gm-Message-State: APjAAAWLqz2D20tr3gcT63UUhSabsC9H7jcdrZwxvPMdA9W+aKeG7arK
	BID2w6RNvxp1hmEaPesWeAelw0ZlGtD3TIUSgqs=
X-Google-Smtp-Source: APXvYqx+K9dQXl1f8dNqalQM6bEO5b8TuNFfwsaIFfTr9OLNBhg2Cnjiri6a8WK6Zp+PnpxxbtETDYafIBMJrrr1hp4=
X-Received: by 2002:a2e:98f:: with SMTP id 137mr16403118ljj.232.1560882580578; 
	Tue, 18 Jun 2019 11:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190617220122.13994-1-alistair.francis@wdc.com>
	<20190617220122.13994-3-alistair.francis@wdc.com>
	<CADkTA4OoLhubvA8ZCWVYeLVtiABtk+PC4Zm0h0HEFLzMzEimng@mail.gmail.com>
	<CAMKF1spyZz62gYdMj8otZVMKJSP4aFm=XUpW47zc+YjFOoBgqA@mail.gmail.com>
In-Reply-To: <CAMKF1spyZz62gYdMj8otZVMKJSP4aFm=XUpW47zc+YjFOoBgqA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Jun 2019 14:29:29 -0400
Message-ID: <CADkTA4OJiU89h7CUNZ-Ve4s0C4X8nuxBJPC=rwFPsDraJ+fTiQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 18 Jun 2019 18:29:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jun 17, 2019 at 8:44 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Jun 17, 2019 at 6:04 PM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > > index 8aec315084..a79d0b962d 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> > > @@ -41,7 +41,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > >  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> > >  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > >
> > > -COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > > +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> >
> > What KBRANCH / SRCREV would this be building ? Unless it is something
> > that I'm building and booting, we shouldn't put it in the core recipe
> > as compatible until the SRCREV and KBRANCH are defined.
> >
>
> it needs to be master branch of repo since it needs no additional
> patches KBRANCH is not needed I suppose. and SRCREV can be picked from
> master branch.

Nope. That means <version>/standard/base is the KBRANCH.  master is
reference only in the tree, and that's where SRCREV comes from as
well.
Regardless, it (the branch) should be set explicitly in the recipe if
we mark it as compatible, since the branch documents the details.

Bruce

>
> > Bruce
> >
> >
> > >
> > >  # Functionality flags
> > >  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > > --
> > > 2.22.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

