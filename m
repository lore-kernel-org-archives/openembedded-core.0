Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D53679C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 15:15:47 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id c32so40381874otb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=OlBbVIU2+4Tzv28gV1tFxL2HziTauP5o75Nxu0TJmq0=;
	b=Tyoxn68q3dU1tF127H99vEcUjGj+2H6apW8kNE59kD4taPpSzdIyWO6B8twAU/z0rg
	LOcdAJRO/Xonet1QwVQXWzgo0J2ghx/uRZqlVOp09rttJABuqqFg90L6Z/s7Eq+qYp5U
	0JueAtMJ1DDVqV2rGRkviyOGuoXWcKwXLoVRXADCCYwHswTNHcJyrYiAk9vUVcBsWQOX
	DSt+cP6/yaKdaAzBr2ymaje/iYbbMz7x1CNjYhiuVcDuW2EiDIq9Hrc0MHUeWusGzo/l
	r5//K1MT8u4js6vSgREVEDYR8pe9t5FtTSE8VeJn9ZuNQu21WVQHxL+qB4q9GRwchthH
	Wnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=OlBbVIU2+4Tzv28gV1tFxL2HziTauP5o75Nxu0TJmq0=;
	b=RQ+egjqAzcYDt8TEEGs1ME/dC3V7BFJsxhrmPHgJUkepNAcGTRoKE7QOpW7/bpLZUt
	/5Lj+32ZKVxZrsrMGtqD9PKT9zvePbuLGPv+jGaku+6Q43rZG+gmCSXvji83h50FlOkW
	z/D/Q5LgTfXzr6JghwEx4t/GGA5LdzF6vQFZ5j3bK5RGO/qvi8Y1mwt6ux5eNZkgKJ3A
	MiCG3wd6Kh/7TGM24L6GRdFfDUv8700D0+zC8WfeepnBlNbvxlYsLoNrY3w/Vj8p2Rvx
	hg3ncK15cSdvjhWz2BxyivWcf92Cj2NOBhatIcDi+f6FF/e9MbPUYuPTRgQW1MMFGbfn
	oJsA==
X-Gm-Message-State: ABuFfoh1S2YsyErSUqt0Ccnic1A3cZzpxA/lYs30rhusox9P0wzxgZWz
	jxLhRhfBOzAue+7o3tA5+IkCbSIZbJVEW7i0VXTrSg==
X-Google-Smtp-Source: ACcGV61n7NkXJabTDfuhSczyQuRgNnIpcm/95p14lOaDTev9TDHgeckgJohFwxWXrzw5haIxrxdMnblU+3975nSyXyM=
X-Received: by 2002:a9d:5a1a:: with SMTP id v26mr18275242oth.267.1540221348014;
	Mon, 22 Oct 2018 08:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
	<b78abf64ec5be37dce3db8f290b312b9bda0ee1c.camel@gmail.com>
In-Reply-To: <b78abf64ec5be37dce3db8f290b312b9bda0ee1c.camel@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 22 Oct 2018 10:15:36 -0500
Message-ID: <CAJdd5GYYM95HtFaVrQrsX6qz1AW4Z1TGgW3G1zv0hsSt2e-nSg@mail.gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Subject: Re: [RFC PATCH] package.bbclass: improve -dbg and -src package ordering
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
X-List-Received-Date: Mon, 22 Oct 2018 15:15:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 2:42 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> This bug also affect sumo.
>
> Armin, would you be able to you backport it please?

Ping on the backport?

>
> Thanks.
>
> On Wed, 2018-07-11 at 13:38 +0200, Rasmus Villemoes wrote:
> > nativesdk-gpgme fails package_qa when setting
> > PACKAGE_DEBUG_SPLIT_STYLE
> > = "debug-with-srcpkg".
> >
> > ERROR: nativesdk-gpgme-1.10.0-r0 do_package_qa: QA Issue: non debug
> > package contains .debug directory: nativesdk-python3-gpg path
> > /work/x86_64-nativesdk-oesdk-linux/nativesdk-gpgme/1.10.0-
> > r0/packages-split/nativesdk-python3-gpg/usr/local/oecore-
> > x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python3.5/site-
> > packages/gpg/.debug/_gpgme.cpython-35m-x86_64-linux-gnu.so [debug-
> > files]
> >
> > This turns out to be because the automatic moving of the -dbg package
> > to
> > the beginning of the package list is disabled in that case, so the
> > python3-gpg packages that the recipe prepends to PACKAGES ends up
> > before
> > the -dbg package.
> >
> > It's not clear why the "and not split_source_package" was added when
> > debug-with-srcpkg was introduced. Presumably the intention was to
> > prevent the -dbg package to end up before the -src package, which we
> > of
> > course need to. But at the same time, we still need -dbg packages to
> > end
> > up before all other packages.
> >
> > Using list.insert(0, ...) also means that if there happens to more
> > than
> > one -dbg package, their relative ordering gets inverted in the new
> > list.
> >
> > This tries to fix these issues by sorting the packages by (priority,
> > original position), where priority is 10 for -src, 30 for -dbg and 50
> > for everything else. That guarantees that packages of the same "type"
> > preserve their relative ordering, while also ensuring that -dbg
> > always
> > preceed other packages. This scheme is also quite extensible, and,
> > should the need arise, one could even expose the priorities as a knob
> > the recipe author could use to ensure specific orderings of packages
> > instead of the somewhat fragile and coarse-grained method of "prepend
> > or
> > append, and ensure you do that in a proper order".
> >
> > Probably the autodebug condition needs to stay, but I think the
> > split_source_package condition in the preceding elif should be
> > removed,
> > so that that logic applies to all packages called -src, not just the
> > one
> > we might have created a few lines above.
> >
> > Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > ---
> >  meta/classes/package.bbclass | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes/package.bbclass
> > b/meta/classes/package.bbclass
> > index 8276046369..72b9c66c3b 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1151,21 +1151,22 @@ python populate_packages () {
> >
> >      # Sanity check PACKAGES for duplicates
> >      # Sanity should be moved to sanity.bbclass once we have the
> > infrastructure
> > -    package_list = []
> > +    package_dict = {}
> >
> > -    for pkg in packages.split():
> > -        if pkg in package_list:
> > +    for i, pkg in enumerate(packages.split()):
> > +        if pkg in package_dict:
> >              msg = "%s is listed in PACKAGES multiple times, this
> > leads to packaging errors." % pkg
> >              package_qa_handle_error("packages-list", msg, d)
> >          # If debug-with-srcpkg mode is enabled then the src package
> > will have
> >          # priority over dbg package when assigning the files.
> >          # This allows src package to include source files and remove
> > them from dbg.
> >          elif split_source_package and pkg.endswith("-src"):
> > -            package_list.insert(0, pkg)
> > -        elif autodebug and pkg.endswith("-dbg") and not
> > split_source_package:
> > -            package_list.insert(0, pkg)
> > +            package_dict[pkg] = (10, i)
> > +        elif autodebug and pkg.endswith("-dbg"):
> > +            package_dict[pkg] = (30, i)
> >          else:
> > -            package_list.append(pkg)
> > +            package_dict[pkg] = (50, i)
> > +    package_list = sorted(package_dict.keys(), key=package_dict.get)
> >      d.setVar('PACKAGES', ' '.join(package_list))
> >      pkgdest = d.getVar('PKGDEST')
> >
> > --
> > 2.16.4
> >
> --
> Joshua Watt <JPEWhacker@gmail.com>

