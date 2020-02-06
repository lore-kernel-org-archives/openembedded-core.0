Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCEE60D63
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 13:25:24 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id o15so6094864ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z5PdsZSssXpsNXLEnq5o2TtxZ7WbNxQCq4uKulES1m8=;
	b=vPXCagrSTm8iDnhojWje0m/ErKpQ7R9dTTwSrEUz1Yn7qzfjLBorbs7mESmUHwauCf
	3mRs8vu4ztpKLAkgZ+7uZy6yK+T6L37bDxrc96kXv2muJmp+KVcfqqVb1KXqx80fp14x
	45Jm+6gKr3U5XwsRIZUT29/mNpP0BX0C7HaUoJOdCvJr6Ps5gTN/y2cPsOcUpufHFSYF
	JHsf1yodOHaSeZbzA0UsrJg+aRW6N9VqFxj5TBwoxD/8usuvwEfjbtUjXreACaicsS5b
	X/pXO+AmNTpVjTAQf0QpUj3c4aW2RRX2WJ/2EnbpcQLGTCQEngsfeiPtBATU9Xd9x9qZ
	pw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z5PdsZSssXpsNXLEnq5o2TtxZ7WbNxQCq4uKulES1m8=;
	b=VSgeM0qobKBuEzfQ5NrXbPAq/2VuG7DuTeMGhQoPwxs6DoHunUHx/x7ptgBW4O+TXu
	oOD7BDg9+PGcMVVsRmzDsgh/gvl+KEU7XOenwcOYMEyr4aZoipQPFw2OE6eJ0XUVqZfk
	lqzhwFxDRqYBc1ciLLVAmM/r/VTdrunR0JIsxwSqjZoOtMEv/4xatqAb2Qtz9HMOcPyB
	pTqkmTsVS9yPIIKvsQoaafBSpAsss8t9mNmtROURJVGj8rzeyRAJ2YYON8AnRNIVm2U7
	QJhjEeQkqFGYRBndjZpT3I9Kr5VPandpiq4QI0zilnWbenlgSGwRpS6RGGq/rCys7bDq
	1VBA==
X-Gm-Message-State: APjAAAXPCkkWFBb0703l4exAssLH4kkDU8yPR2WlRzXyAXzi6iUMB7WE
	ObgxXEHQPilj7QdUwJIemhpci1f2fTnCGpWDIfO2ukBr
X-Google-Smtp-Source: APXvYqw2DqYOyDxkm9bi1OBIUjWnkFOkRTSBRghvBmVLfSdn9/VCLxOTYAJyQ47XSBhTIzjFamkGvK6maK3bu1v1vqQ=
X-Received: by 2002:a2e:3504:: with SMTP id z4mr2057576ljz.273.1580995524602; 
	Thu, 06 Feb 2020 05:25:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
	<81d55204978a296d27ecaff359d270dfc0f473eb.camel@linuxfoundation.org>
In-Reply-To: <81d55204978a296d27ecaff359d270dfc0f473eb.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Feb 2020 08:25:13 -0500
Message-ID: <CADkTA4MOtNcsWQvxPORFRmrTCXE=0XXPaDZK-ucpbXWvt-eN4A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 06 Feb 2020 13:25:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 6, 2020 at 4:03 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Wed, 2020-02-05 at 18:12 -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Hi all,
> >
> > I've kept the v5.4 content changes, as well as the kernel version
> > default
> > changes out of this series and instead focused it on the collection
> > of
> > kernel-yocto and kern-tools tweaks that I've gethered over the past
> > few
> > weeks.
> >
> > I have Martin's gold linker fixes included, as well as the re-org'ing
> > of
> > the linux-yocto tasks that Paul Barker did to make it usable as a
> > single
> > inherit of the bbclass.
> >
> > I also have a defconfig detection fix included that was sent to the
> > list.
> >
> > I was able to confirm that my configuration was the same with this
> > series
> > enabled, and I was able to boot.
> >
> > That being said, I'll keep my eye out for any AB fallout and will
> > continue
> > some more build locally .. but I wanted to get this out today as
> > promised.
>
> qemuarm64 seems unhappy:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/1524

Bugger. I'll fix and resend a v2 pull request.

Bruce

>
> (the builds on the arm native machine also failed but it looks related)
>
> I think everything else passed testing for this series.
>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

