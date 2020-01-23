Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F51E7FD96
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:14:43 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m8so66818edi.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pu4IMpEfzO2OIcjt3mTwUzdV7v4k28EXC4uLK3xkQvs=;
	b=bSdf4Q0+BmsP5rF2pcIpz5sCQgT1EIWsFLOz6E+jf+2PSx1aR/9ww+xVgZX98LPELz
	UYmSx0iCCr6xCFtve6TxthK7TKaicDg1YHm/MWFP2uRUrZz/lbbM2HBAZtKbofdICcyV
	P59+NxB1ev6K1D12L4Ow8puBrxMmMYc3SQqpzo3MWYccEp8788ys7nBzias/eO9mW6c7
	LRPein4LDvP/UHn1Ao8iR40yCBiYVIfZSU87TB7FgyJSB26hhpKE4qxZwE7gds0WjTzI
	KODFrB9ZQ+nMT6n5VGjZ9AhSr0eAOtW2ghXn92vhHvXX4WE3YxjkvQTKL8vi0Atmi48j
	DXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pu4IMpEfzO2OIcjt3mTwUzdV7v4k28EXC4uLK3xkQvs=;
	b=WWSlewBI17TfsFYLJPyhATIwZsiek5szmhA5uEJEYKk2IwPT4fiVGXpSmlfKBzHNPZ
	P1V7q1n6GZfIYoBT6CFWAmG+qYcrxl16uRjXooxScjGm9YflPn0FcNEtfqSzLlGTytJg
	vfcfW8gxzUH3oHkyl8vNSjtCRaCorGD2dLwtwshR5JTmuQmW4drxDHuVlqRsED9pSjWO
	iLwrKVYLFbeqggPPZb0sv/71CQF3sGxah3BFFlpBMfjeRjM9sWYnEYMUhfhnSVPj8RaV
	M6UeT73cWv8DH57exwOitX266rVSJNsjm1FSYiwCPZYljoqDhIvd9L+aXVrV63qJ3HmP
	lcnw==
X-Gm-Message-State: APjAAAVPDDwuECU9x0y6VuSCfxocDG1+/uUwnat1RETo8fNmp37tUKCo
	cQPNzC2U4K89ANpSMNanEcxxzhUjv1p5AWInlyQ=
X-Google-Smtp-Source: APXvYqxTrzlDbmLX8ZFJBT/EKAT+6gBIfSMH5x/dFEPVw5BbBmifVT1Fhz1sb9R3lOZoIL6Yf54WJ71lXC4ayDzb6Kk=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr14975edc.129.1579817684074;
	Thu, 23 Jan 2020 14:14:44 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
	<4e8ae0a5-bf21-9f91-6e04-c1f733f14905@gmail.com>
In-Reply-To: <4e8ae0a5-bf21-9f91-6e04-c1f733f14905@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Jan 2020 17:14:32 -0500
Message-ID: <CADkTA4P4s2-jKHaxWzk=0eV-c_1J_WpTYBbZboxR4f8OmDaV1Q@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:14:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 5:10 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
> On 1/23/20 4:05 PM, Denys Dmytriyenko wrote:
> > On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> >> On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >>> From: Denys Dmytriyenko <denys@ti.com>
> >>>
> >>> Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> >>> To avoid duplicating efforts of adding very similar recipes to BSP layers,
> >>> add an upstream reference implementation to openembedded-core, which can be
> >>> customized by BSPs, if needed.
> >> Isn't this one of the things that Jon Mason is trying to
> >> standardize/support in meta-arm ?
> >>
> >> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > Ah, interesting, somehow I totally missed that one! :)
> >
> > What triggered this submission is that we have our own variant in meta-ti and
> > Joshua Watt was adding a very similar one to meta-rockchip:
> > https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
>
> FWIW, variants of this recipe crop up in pretty much every ARM-based BSP
> layer (e.g.
> https://github.com/alistair23/meta-pine64/blob/master/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.1.bb);
> it seems common enough that a base recipe that each BSP layer can
> bbappend to suite their needs seems like it would be useful?

Jon had some ideas about that, but I admit to only being an interested
party and since I was aware of what he was up to, that I'd draw him
into the conversation.

Definitely a good thing to get some sort of centralized base recipe,
that can be extended by layers.

Bruce

>
> >
> >
> >> What's the delta between the two ?
> > Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> > see if it's as adaptable and expandable as our more simplistic variants...
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

