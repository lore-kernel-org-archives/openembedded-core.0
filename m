Return-Path: <damien.riegel@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9F2606B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 19:17:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id c25so1325722pgb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dlje+I0AzHU0QqlEb7KIculEoGGk4uRV8hJ6T6GG8tU=;
	b=U8ey4tsVtTwwCUJT3C8rBvHISTAcy0ZcmnaFifoJjUz8iW9psN2lUNtg9CONn+OucQ
	Cat6gwR28QUaztSCxr0zccAvbmtDOdIfJRQzxZQdUl67uBfsBJhDGdI9ZQMDy1/y7stv
	m/XBVgAJGrK1/zn5AoEFP2qYs4YO/JBCH0FJje68Mwfjd/VPB5441dpZj9kFR/ZIsPas
	D68E7bt6CsbLoAT/YOQjWRBJ3OfEW4GdOT8E8No1zUrL8wPcMifESZrU8ee/MVZSZ8Mr
	YCvrsGDgsqEjBe6X+L1fGcz/UaBkVPShK0PERVu/HFcl7kQ1/vgeHoxvGSOCQFTuxOzI
	+TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dlje+I0AzHU0QqlEb7KIculEoGGk4uRV8hJ6T6GG8tU=;
	b=gNhshnzfJybmIp15jj0b5UXiLpBkVODZSIkhER9CVauLujIpeKgPMH1hy0jEGZF2vU
	CKcuhaBRgEkp93bPbbYif1jPFYk/m535s1tEv3EHWbhL+VjJnfpIGK6tMxBQhqtfjj6g
	38FL8nTJATsPUapUhvbg8TWikJW+IV59qu4XcLzgshNYvx24pLVCWxBrwZl2t9fBNDII
	/KJ+b8XESB6UkFOLN8Bda+rmF0UzxVPRv2fRbsP42vxIkBLW6/HcCTpwdPOnSt8MMFrf
	dHl+nIYI0dEeazxAZ9YHjJrtQVKb3niQXWk0GefOPWllQV25e/mp/ucgB6Ci0O0CbOna
	0Ymg==
X-Gm-Message-State: AA+aEWbbBJ1diG3f09wjVT2eGkFFNWcyVCa0v02ylB/br0QtFJ1XNsH+
	/1/BQJhIVZ7tACtP/Rw32Pd9DsYEu5p4HdG6s6s=
X-Google-Smtp-Source: AFSGD/VZSnqylAQ7MhxbUrJNFgYfWVsvjjQEMy5H2q4OuHlbCiUmLi1pWbp7832CcjBVgWxoAO6vtFT+WfEEmlCseCU=
X-Received: by 2002:a63:2b01:: with SMTP id r1mr23901767pgr.432.1545333432293; 
	Thu, 20 Dec 2018 11:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20181219175040.10507-1-damien.riegel@gmail.com>
	<CAGgRHJr+obHJrRNFCDsPJN18w0-dtQsxAa_+Kk2KBMppDSycoA@mail.gmail.com>
	<CAL4iiOeed+At5V0hyFUEdS_JdRgG0o63dYLkiTkt0F-btK8tUw@mail.gmail.com>
	<CAGgRHJrg+VzfKq09yhJG6xEHkfWYXmA7fsVK_X96ozTG5z9k1A@mail.gmail.com>
	<CAL4iiOd3YC9-12r5gPF78_6edXRUzctmzWq4bBcv2XQf-Q2CBw@mail.gmail.com>
	<CAGgRHJphjj3Bzu5FVjw8m-uFivAJ-k5fqZiNQ++s+w8hk3QCcg@mail.gmail.com>
In-Reply-To: <CAGgRHJphjj3Bzu5FVjw8m-uFivAJ-k5fqZiNQ++s+w8hk3QCcg@mail.gmail.com>
From: Damien Riegel <damien.riegel@gmail.com>
Date: Thu, 20 Dec 2018 14:17:01 -0500
Message-ID: <CAL4iiOcibL0=wknC_UdSmpvsyMbB1H4xQ7UymvZpZLaU+g6EBg@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] go.bbclass: install dependencies under $GOPATH instead of $GOROOT
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
X-List-Received-Date: Thu, 20 Dec 2018 19:17:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 11:00, Matt Madison <matt@madison.systems> wrote:
>
> On Thu, Dec 20, 2018 at 6:02 AM Damien Riegel <damien.riegel@gmail.com> wrote:
> >
> > On Thu, 20 Dec 2018 at 07:53, Matt Madison <matt@madison.systems> wrote:
> > >
> > > On Wed, Dec 19, 2018 at 5:52 PM Damien Riegel <damien.riegel@gmail.com> wrote:
> > > >
> > > > On Wed, 19 Dec 2018 at 16:41, Matt Madison <matt@madison.systems> wrote:
> > > > >
> > > > > On Wed, Dec 19, 2018 at 9:51 AM Damien Riegel <damien.riegel@gmail.com> wrote:
> > > > > >
> > > > > > To package a go application in Yocto, one needs to also package its
> > > > > > dependencies to keep the build reproducible and under control. The
> > > > > > default install task of the go class puts the source in ${libdir}/go/src.
> > > > > >
> > > > > > ${libdir}/go/src is where the standard go packages resides, aka $GOROOT.
> > > > > > When a go package has dependencies on other go packages, they must be
> > > > > > located under $GOPATH, otherwise errors like this one may happen:
> > > > > >
> > > > > >   Non-standard package <packagename> in standard package <packagename>
> > > > > >
> > > > > > This point of this patch is to trigger a discussion on how this issue
> > > > > > can be tackled in Yocto. Following code is working but should not be
> > > > > > considered for inclusion.
> > > > >
> > > > > Can you describe the context of this a bit more?  The way go.bbclass
> > > > > is set up, all of your recipe's dependencies (and their dependencies)
> > > > > should already have been installed in the per-recipe sysroot (where
> > > > > GOROOT lives for the current recipe's build), and should get resolved
> > > > > from there. GOPATH gets set to ${B} for the current recipe's build.
> > > > > Nothing in the GOROOT should be importing packages that reside in
> > > > > GOPATH, which is what that particular error message is indicating. If
> > > > > you're getting that error, then there might be something wrong with
> > > > > recipe dependencies.
> > > >
> > > > Sure. I think the issue is because I have the following chain of
> > > > dependencies:
> > > >
> > > > A --> B --> C
> > > >   `-> C
> > > >
> > > > Building C is fine, building B is fine, but building A triggers the
> > > > error I mentioned, because the Go compiler complains about B using a
> > > > non-standard package C. It thinks B is a standard package because it's
> > > > located in GOROOT.
> > >
> > > Are the three packages in separate source repositories? If so, the go
> > > tool should not be finding any C files in GOPATH.
> > >
> > > If A and C are part of the same source repository, but B is separate,
> > > that would make the situation a bit trickier, but still solvable.
> >
> > They are three separate repositories. The issue is precisely that C
> > files are not in GOPATH but in GOROOT. C files _should be_ in GOPATH or
> > that will break Go tools.
>
> Go does allow for non-"standard" packages to be in GOROOT as well.
> The way the go tool marks a package as "standard" is if it resides in
> GOROOT _and_ starts with a prefix that does not look like a domain
> name (specifically, does not contain a dot '.').  The Go convention,
> though, is to use a domain name as the first element of the import
> path for anything that isn't part of the base runtime (std, cmd).

Damn, I think that's the issue, some packages don't use a domain name
as the first element of the import path.

> If you do have a situation where you have multiple interdependent
> packages that for some reason have import paths that do not start with
> a domain name, you could build them all using a single recipe, rather
> than splitting them up into separate recipes.  I've had to do that for
> cases where there were circular dependencies between two (or more)
> packages; the same technique could work this, though, too.

Okay, got it. There are no circular dependencies here, it's really a
straightforward situation "A needs B", so fixing the package names
should solve the issue.

On a side note, it would be nice to have documentation somewhere on
how to use the go class, especially for GO_IMPORT and GO_INSTALL.
Does that belong in the class file itself? Or should that be put in the doc
repository?


Thank your very much for your help!
 --
Damien

