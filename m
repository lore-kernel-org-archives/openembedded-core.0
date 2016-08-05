Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58AA4770A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 14:25:00 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id i199so2146245ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hc45xCOljfg1govgeuGU0Fl+ISUFwwNd6gGaWkfMOik=;
	b=of+UoL/F8ERKVUf2DIpoO0p94FZ2vqHjyt4ydZSCmevgIjyvJmlvPUDgrPBZIppKWk
	Soz6aTXOuRxVQG8FJwBYaTYzNH1GUpt5YsqCCOEYb2cWMLe8W2PBwnr30Nlb0ks+YPrX
	psuDjRQf2D3EOp+QRgDgSNBFep/5g9TAH5jjWz9I+KyiBLpYBS0VG2TGSd5fFQL7Z/3P
	LB2Ik6czx+GXuMo8QP2/IBN1AnGLmxIp7/hGa93W/yUJX3Rg8eE5bRjI+CeGnwgjHBix
	huz3fBA6XhcZ0Rfape5/gl7cO8WY76znvJefJAuw4hDF/CKApERbDv2oD8Y9SVBVddq4
	2jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hc45xCOljfg1govgeuGU0Fl+ISUFwwNd6gGaWkfMOik=;
	b=jEOv+9jcIrq3Mo3f8ore7w26ue3zZG/DnbJxfWLvLY6thbw+IUTRy0OKKhlL2OfR+L
	oIl/szjOCSdafRfYew7TwK+QSsUgOCUWbpdQbVHPS8zHeoQO/8tPz0Lu8T/ozF/ZKWXN
	XO1Iu1EsMggOt969Ef07dGsmlXL7edKfrbNX4YTy02RpTiZHljK4m++Ht9CTPWF53618
	LR24XZeQXoHMGip6uthV8PSVdtkVymlxNtMQKPRzQ6V4+qQpxIzaz9V3rbqbAUVUYFX6
	6ooEUATH+8pi/HS6Z5ZXi7kmVgNF5ro5xiCpYvLxutk2yLzVcGosR5veabc3mS5O9aXf
	hhlQ==
X-Gm-Message-State: AEkoouue+3/QFoIvLfD4i1HsvdL8XEun+dS2iyDcZJDkVwm0WE3ONyhHhjm0psjkAECtyg==
X-Received: by 10.107.163.129 with SMTP id m123mr88692026ioe.48.1470407101208; 
	Fri, 05 Aug 2016 07:25:01 -0700 (PDT)
Received: from openSUSE-i7.site ([45.72.227.185])
	by smtp.gmail.com with ESMTPSA id 65sm3897802itl.16.2016.08.05.07.25.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 07:25:00 -0700 (PDT)
Date: Fri, 5 Aug 2016 10:24:58 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20160805142458.GA16924@openSUSE-i7.site>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
	<CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
	<20160803125336.GA24499@openSUSE-i7.site>
	<CADkTA4NvDf+Wo8fSGiRGirE74z7Bi8EjmFeK-opz=sUzMJLsNw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NvDf+Wo8fSGiRGirE74z7Bi8EjmFeK-opz=sUzMJLsNw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Fri, 05 Aug 2016 14:25:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2016-08-03 @ 09:39:59 PM, Bruce Ashfield wrote:
> On Wed, Aug 3, 2016 at 8:53 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> 
> > On Mon 2016-08-01 @ 03:08:36 PM, Burton, Ross wrote:
> > > On 1 August 2016 at 15:07, Bruce Ashfield <bruce.ashfield@gmail.com>
> > wrote:
> > >
> > > > Not a large dependency, but it does bring to mind the question if this
> > > > could be conditional on the type of image being built ? via  distro
> > > > feature, some other mechanism ?
> > > >
> > >
> > > Exactly this: image building adds dependencies automatically based on
> > what
> > > is actually being used, so can the kernel do this too?
> >
> > The way the build knows which image was built is to build the kernel then
> > look
> > in the output directory to see what extension was given to the artifact.
> > iow,
> > it only discovers the dependency partway through the build; it doesn't know
> > the dependency when the build starts.
> >
> > Either bitbake will have to put together the kernel's config at the start
> > of
> > the build, then parse through it to try to determine which kernel will be
> > built, or we need some sort of mechanism that allows us to add dependencies
> > partway through a build, or we can add (yet another) build variable and
> > hope
> > people are able to keep it in sync.
> >
> >
> I'm on vacation for the next two weeks, so sorry for the slow reply.

np enjoy! "'tis the season" :-)

> 
> Wouldn't something like PACKAGECONFIG work here ? Something automatic
> is going to be complex (like you describe), but something like this would
> be an
> easy way for a BSP (or other) layer to bbappend the kernel and add this as
> a dependency.
> 
> ... but then again, I suppose they could currently just bbappend the kernel
> recipe
> and add it directly to the DEPENDS.

I've proposed a change to the kernel.bbclass to add the lzop-native DEPENDS to
the existing

	DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"

because it's in this file that the lzop program is being called.

It seems as though your suggestions are discussing changes to a recipe (?)
which is fine, I'll propose a patch to the BSP-in-question's kernel recipe.

> 
> >
> > ...or we could just add lzop-native as a static dependency in the
> > off-chance that
> > it's needed.
> >
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"

