Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB227E871
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:10:05 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id l128so2441579qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E1HqnC9HcFtLCx/z73l1Rdcph1lcmMnkpj+AS/9vVNs=;
	b=O/KTtbGiWQHEsbnWJMwWhko1DXYB7ksTXnSkhONXgLfrGka6Cuoomf7cIWPwDadukV
	YyDuPDFgKmNAmZEIieT1DMU31kZthYfW2s+RfCmyXla/36vVBBZ8ezOqNV215MGOZUzq
	YGu1WrdSnlUbePQ0lRPnj2FFT2vG9MaWTfX1E4P3CK5hFxLFx6MlKuMIWLCMJPvU0UaX
	NDC0q98qltPvzhe8oU2FTk/ye3zqopegqjLCHFfKRpLD/7m48h0XyncslRU+mhE7o3Bj
	uYqGizf9dLMKo34Zd/4Md2VqKUkvKrVuR7XMsvTITMTJ2JKKjD2EJCj/YQnmCz6TSikU
	Zm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E1HqnC9HcFtLCx/z73l1Rdcph1lcmMnkpj+AS/9vVNs=;
	b=akVHiJ0xgcgH2bPfda3U/A/xFxujJHtHchhafBYBBgBXSQWnkFqNj3EiDuWuV94si4
	aY6w5DpaTdvmVLU4Zd+8JiO8KbBaveujee0YdfWkYFTZryUBnC6/Gex7chSclROkMjyv
	O1fTuBmOPlFtG8+mQPkLM9Yl1qFw90MaCkSFBN7XM73Hli8vxIA78vMNmcT5pVxFPz4w
	nwOb/triXc/cf1ltkt/t5V2RefsPZVNQNTIrmw3QPUTnhAk54jsYuMmD03sv+M84ktQN
	jijMkKoaarylXxM5cRsDSW4rOm79zNA3a298tuFA4VCYulBwGNE6EIFW2mXWodHov4dn
	uojA==
X-Gm-Message-State: APjAAAVi3Ba4Wt7xssPhm/ILhvSr+kkwOl64YI3rf4eBrVx2/TivMGkk
	K/0knknapjyPAyPJxhYkC7vKSr4he0Qr3c9L96vLT7j9
X-Google-Smtp-Source: APXvYqxantueRYHquKKPkx3mh8IaAaTTVMyGrK7IH7hWHEca1FsD5YIM0tWlKTTQN5em+nNnoa1tA6KAXxdYOqsRVNA=
X-Received: by 2002:a37:4243:: with SMTP id p64mr24215439qka.9.1561050605995; 
	Thu, 20 Jun 2019 10:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190614072956.13672-1-bunk@stusta.de>
	<34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
	<CAMKF1sruqVtNBQjDnP-BkpKhgz9HCmk-yZv=of1tPvdzfGXKOQ@mail.gmail.com>
	<20190620071537.GA27107@localhost>
In-Reply-To: <20190620071537.GA27107@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 11:09:39 -0600
Message-ID: <CAMKF1soeQ9YreTazqHFbwh-C4AU6H2sr1H5_jNED6+T6K3TTGw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
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
X-List-Received-Date: Thu, 20 Jun 2019 17:10:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 1:15 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Jun 19, 2019 at 12:59:05PM -0700, Khem Raj wrote:
> > On Fri, Jun 14, 2019 at 4:44 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> >
> > > On Fri, 2019-06-14 at 10:29 +0300, Adrian Bunk wrote:
> > > > This removes clearly incorrect musl patches and marks
> > > > systemd as incompatible with musl until these issues
> > > > are fixed.
> > > >
> > > > The previous status quo where systemd was made compiling
> > > > with patches that are known to introduce bugs and security
> > > > vulnerabilities silently delivered a sub-standard package
> > > > to users, this change makes it clear where work is needed
> > > > to be done by people interested in systemd on musl.
> > > >
> > > > Patches that are merely questionable or not upstreamable
> > > > are not touched.
> > >
> > > I'll be interested to see what others think of this, I can't imagine
> > > this move being very popular...
> >
> > There are real products using this combination
>
> An OE-only combination neither upstream supports.
>
> > And this is not a good message, eventually we want to either fix or stop
> > supporting this but I think now is not the time
>
> When is the time?
>
> In a month?
> Before the Yocto 2.8 branching?
> After the Yocto 2.8 branching?
>

When users that I know stop using it, and that might be a release or
two. Meanwhile
I think it will be good to address the issues with patches, if they
introduce bugs or secvulns
that I think will help the user community instead of removing the support.

meanwhile, I would think that we can still work slowly towards making
things better
musl has provided a lot of good cleanup patches for systemd so this is
not a wasted
effort even if upstream systemd does not officially support anything
besides glibc.

> The best solution would be if someone would step up to properly maintain
> the systemd/musl combination, but usually such "either fix or stop" only
> work with a clear deadline.
>



> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

