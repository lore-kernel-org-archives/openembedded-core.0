Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3C77F1E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 04:58:10 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id e17so424723ljf.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZzFOYE4xFua0EIhM+6DvNrroJ2BvIU2hKs+sKW4ZMsw=;
	b=a1Re7DKzs8aPHv7cta031ttRA8+eAQeBzv4sB9Hmg2xulmfpX4wNUtyW4aHarNLqYa
	MNYApEL1yBGz2GdeGwVVHaJxYd0obm3kJ0fbKHESt/fAi+tCB60/fwZWjQ0kdUcRy2ME
	3gHOJKh2sCPX9AlDUC3bMxYomsuSi5naSqi9INe66EBo9EWo8sKTvy5eol1RliOqL6FL
	HEk6IHIbQwWAUoC4GQsy9pTxVbB9uQI3Kpm3ehKN4ekksn7cmTo4UcfPH3Sx40jOlNCb
	5le49qx+JATyx5UOvkpP8XnF8bxvl4RSUug62yH4896SkLG+5KD2jjYEHauTGeNBjPYG
	sGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZzFOYE4xFua0EIhM+6DvNrroJ2BvIU2hKs+sKW4ZMsw=;
	b=PEequQ4/yM9fYrCqAsogV9n6IqE/J76OtMdgE75UecjcRy0t7/vYUO7jP4lra70DLO
	5+1g6cSSK4T4hwqs0uibWSRGN512me0DHwggEVI9lDLhKVwZ6PrNeh+GQkcpjpMfviun
	7IoEDim/c62EBwB33UxHHJyKdlGbvnkeRbinDSAavKe8ILUPw08JnqH6g7v6WDX92ubk
	9ia1k/UxaIF/zsxZIzYlEjbUnJLzzPwdfZWrbmrhPIwlVcLZ1fnnKm5UTGF3/KKvhilY
	LRSwqhrCnp4yLnhUiF+3ayhX3Y30wi/Uq96/452a0hCdeNrF9581w9tpa743sfzoDy9N
	c90g==
X-Gm-Message-State: APjAAAWcyZOp1mgfpEqaRWdSSX0PZJSeRDZqpe1eL1JMJjl/mbPRnvaO
	1Mnr4U16UlReN/msg0atGiG8+Jgo6aprB6lhhrI=
X-Google-Smtp-Source: APXvYqxBpAJzEH3oj+uMAFm6iyfvcATqDXskG0+JVGTV94RwQg6wZhT40E/oydvDAjd7eDo39mhVgm2FES3ZQ154hMo=
X-Received: by 2002:a2e:91c7:: with SMTP id u7mr580599ljg.146.1569301090760;
	Mon, 23 Sep 2019 21:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
	<CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
	<7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
	<CAMKF1sp6hDii_4dH6nrr1VstobnP2sCpyNUy74eiOaJGqVKhNg@mail.gmail.com>
In-Reply-To: <CAMKF1sp6hDii_4dH6nrr1VstobnP2sCpyNUy74eiOaJGqVKhNg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Sep 2019 21:57:43 -0700
Message-ID: <CAKmqyKOwPad=m_jN9u-0JmG6XxY86iHf-+QU-zdmPeXizoFfYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu 4.1 boot regression with riscv/musl
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
X-List-Received-Date: Tue, 24 Sep 2019 04:58:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 7:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Sep 23, 2019 at 6:39 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > On Mon, 2019-09-23 at 17:59 -0700, Alistair Francis wrote:
> > > On Mon, Sep 23, 2019 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > Alistair,
> > > >
> > > > OE-core qemu upgrade to 4.1 has ended up with regressing musl/riscv
> > > > port. I could pin point it to
> > > >
> > > > https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f
> > > >
> > > > it works fine with 4.0, I havent looked further
> > > >
> > > > To reproduce
> > > >
> > > > build
> > > > MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
> > > > TCLIBC=musl runqemu nographic
> > >
> > > Thanks, I can reproduce this and am bisecting QEMU now.
> >
> > This QEMU patch causes the failure. It reverts cleanly on master and
> > that fixes the issue:
> >
> > RISC-V: Clear load reservations on context switch and SC
> >
> > This prevents a load reservation from being placed in one
> > context/process,
> > then being used in another, resulting in an SC succeeding incorrectly
> > and
> > breaking atomics.
> >
> > Signed-off-by: Joel Sing <joel@sing.id.au>
> > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> >
> > I'll investigate a full solution tomorrow, in the mean time do you want
> > to just revert the patch?
>
> yes lets use the revert for now, this will give you enough time to
> investigate solution
> since its riscv specific it will be low risk and we can even go to 3.0
> release with it

Do you want me to prepare a patch or do you want to do it?

Alistair

>
> >
> > Alistair
> >
> > >
> > > Alistair
> > >
> > > > Thanks
> > > > -Khem
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

