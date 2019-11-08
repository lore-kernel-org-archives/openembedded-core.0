Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 828267FA49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 00:45:03 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id z24so117889lfh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 16:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yTc21xcWhip+8W48F3CYwEdKpO7+m93QISpzOfnUSrs=;
	b=JQhSFtNw4x3fD1Oao0aapHuCn7GnlOt+3X1utIdiPFMjnSpYDsB9PGuyFeQXOsVOM2
	j8P2MURbm6gokj8RoWLxiars7MUOPnHWoi/NyrV2TOh2Q4PVSaCStYQ7d2arAZ05i9qU
	tK1Ox8z8V2+gPsnoNLoMFZl2ya8A2Jq7msbGOilHeCkpQF+hnfrf8EhpUeTHnnJF2xt5
	+Gizl3kOACXg3WEC+22W4iIG7cVCUNKLAE9VSmsLWTHUDh3YrdDYZYTA3bItGghbaiOm
	gzEwElt9Ap6kaYv5wOZZPfq5xPUKx9GV6nMM2ElYSH7H7gMi5CoUWzVFtq11+zPbs2Lr
	CFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yTc21xcWhip+8W48F3CYwEdKpO7+m93QISpzOfnUSrs=;
	b=iyArjuRdKlOw2CZsyq9jbgID/t5Pv6gx/Py+1iHkwW1PpyoNsYXCJto34JOkX/oSuS
	GVqXP2QfxY8pcRa1xO6nUBY39VIozLU0zco8APc6pSAxO9gcy8u0FOxiYKHhtWn7xue9
	kaPSRzf0/2zv7IrygzG6OLBUXgV6NkbwtFdqHkaVSj+Ok1OejdYOGM0Nf4stM7C47fAg
	C4D6ByikVpTQLhKollG9Tr401tsipFT9ZiYt/xBRNfEupQaNJLhCJLjdHolyw4234CL6
	xv6/RDk1bMYj8AAvE3k6u+dD/YTsPsHmRw4q7tMwasI35/rR74hSaG5a0u12idZGxsHq
	iNJQ==
X-Gm-Message-State: APjAAAX26Oy0woXStgQyKyip35Id9RWQX7BONhuUxzV3tyXb0iPIWcVN
	/hlxaWzC9tSGfbmdMNeOW3nrEkCmjpGkRqXmoq8=
X-Google-Smtp-Source: APXvYqxSPbfZnfw9lhhFLxnEU0Ej9M3rJYNeSi0si8DtuSUXoeG4rPdQpT/gNufdD+Ys3YCcXDGTEs6qdXT/6JdxtEA=
X-Received: by 2002:a19:f610:: with SMTP id x16mr4453815lfe.141.1573173903972; 
	Thu, 07 Nov 2019 16:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
In-Reply-To: <CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Nov 2019 16:39:22 -0800
Message-ID: <CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Fri, 08 Nov 2019 00:45:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 11:33 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Thu, 7 Nov 2019 at 09:34, Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Nov 06, 2019 at 10:18:18AM -0800, Alistair Francis wrote:
> > >...
> > > +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> > > +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
> > >...
> >
> > That looks wrong, what would you put in TUNE_FEATURES
> > for -mabi=lp64f when -mabi=lp64d is called riscv64-f?
> >
> > Also note that this is only the floating point calling convention,
> > whether the compiler emits floating point instructions is defined
> > by -march.
> >
> > It would be good if this would start with a plan how to handle
> > all possible combination of RISC-V ISA extensions, ideally better
> > than the arm mess.
>
> I am keen to see this as well, since I am currently directly
> hardcoding -march/-mabi in the machine conf.
>
> It would be nice to see the ISA tunes available in oe-core, even if
> that is just the tune features and not predefined tunes (e.g. like
> microblaze).

I think this idea as well. Some generic way of generating tunes from
ISA stings would be great!

Does anyone have any ideas on the best way to do this?

Alistair

>
> Regards,
> Nathan
>
> >
> > cu
> > Adrian
> >
> > --
> >
> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >         of the darkness. There had been need of rain for many days.
> >        "Only a promise," Lao Er said.
> >                                        Pearl S. Buck - Dragon Seed
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

