Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB8B7EE97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 05:12:05 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id n7so682647qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 22:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TmVddr9ftvU5sRx/j7WI7y6wA6aaKbM3smJKPnp+eXk=;
	b=LAFZpIFlv6Z3bSTc51DCBbgeHelkoOognhud2x8FdyWvyP2rRGdbFOuGULZo08VHWO
	I2Ye7VZ8ECEwCBjpknten4fVItcOKdDsKWtYZkvGKypVX6pUgJ+7z4a1kQVbo/KMmsa5
	C256rF470kunCVUa95EJHaOCle2jrWHExeAmHouOANqZdFOjhiRi6wfi5j4yYC9NC0qv
	LisH7U2RLKB3mPl7T5EJJ13uiDOK73fZwCbyfFd83fYhX6dfhan/vaO2GhzU9z0mPoXr
	2rKiWaH/GuQzhl0rSi+7hR7/AInDpreriFPN3BRRejM84WJd1j+jTPuikby49Dom9x01
	qnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TmVddr9ftvU5sRx/j7WI7y6wA6aaKbM3smJKPnp+eXk=;
	b=gZR9i80r4+Mk5ikuvhoeiZwYf+9w2qlNmyb15wT+PghoBBJ8CfAI9YS2HHLBw7l1qQ
	4/swva5EMlcGMNbSxbyh9fX4rHH70pNA0556qKEebkb4MgnoovHu/GXS8KrasgqxAVW7
	f/wdUgkf5CK8WpvNietUiUciVYv2AKE+06DGm31xtVdBoyU4BW4dlDoeWL4affnECkEA
	jWtFTnP1sj5yYpvk200Ym1hf5hHP/jKMVXP2qsYnxpNAFnaitR0Q+KbFdte9jFE29M6u
	lwXbpq38XDkXqk4x8RqgCIjioEcMLjRCGeU3JvfT9lkhBDQGHZ73q6cr3Jxhv4kaEdFE
	AYng==
X-Gm-Message-State: APjAAAWuKD6U7Y58ylHVH1DUKWLbftoTfVHUTAq+bnRn6rxO8q7FsPul
	RAntL7M7/cFXJcCW1GhebWt0vn/XMOfjpFIt/gc=
X-Google-Smtp-Source: APXvYqyWxBPleg0MRmi3uTk7UpskkQrOzGuuEE1Q1KuzzcPzRN6oWt/WX7xGd9STevBKUIH6dKQiWLln6nsqVjXPBFo=
X-Received: by 2002:aed:3c52:: with SMTP id u18mr1043782qte.194.1569301925992; 
	Mon, 23 Sep 2019 22:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
	<CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
	<7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
	<CAMKF1sp6hDii_4dH6nrr1VstobnP2sCpyNUy74eiOaJGqVKhNg@mail.gmail.com>
	<CAKmqyKOwPad=m_jN9u-0JmG6XxY86iHf-+QU-zdmPeXizoFfYQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOwPad=m_jN9u-0JmG6XxY86iHf-+QU-zdmPeXizoFfYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 22:11:37 -0700
Message-ID: <CAMKF1sqbaTfs9y9XT=S0f86_u-UWT=TQMt07qouKtSxzXcQhFg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Tue, 24 Sep 2019 05:12:05 -0000
Content-Type: text/plain; charset="UTF-8"

Please send a patch

On Mon, Sep 23, 2019 at 9:58 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Sep 23, 2019 at 7:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Sep 23, 2019 at 6:39 PM Alistair Francis
> > <Alistair.Francis@wdc.com> wrote:
> > >
> > > On Mon, 2019-09-23 at 17:59 -0700, Alistair Francis wrote:
> > > > On Mon, Sep 23, 2019 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > > Alistair,
> > > > >
> > > > > OE-core qemu upgrade to 4.1 has ended up with regressing musl/riscv
> > > > > port. I could pin point it to
> > > > >
> > > > > https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f
> > > > >
> > > > > it works fine with 4.0, I havent looked further
> > > > >
> > > > > To reproduce
> > > > >
> > > > > build
> > > > > MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
> > > > > TCLIBC=musl runqemu nographic
> > > >
> > > > Thanks, I can reproduce this and am bisecting QEMU now.
> > >
> > > This QEMU patch causes the failure. It reverts cleanly on master and
> > > that fixes the issue:
> > >
> > > RISC-V: Clear load reservations on context switch and SC
> > >
> > > This prevents a load reservation from being placed in one
> > > context/process,
> > > then being used in another, resulting in an SC succeeding incorrectly
> > > and
> > > breaking atomics.
> > >
> > > Signed-off-by: Joel Sing <joel@sing.id.au>
> > > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> > > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > >
> > > I'll investigate a full solution tomorrow, in the mean time do you want
> > > to just revert the patch?
> >
> > yes lets use the revert for now, this will give you enough time to
> > investigate solution
> > since its riscv specific it will be low risk and we can even go to 3.0
> > release with it
>
> Do you want me to prepare a patch or do you want to do it?
>
> Alistair
>
> >
> > >
> > > Alistair
> > >
> > > >
> > > > Alistair
> > > >
> > > > > Thanks
> > > > > -Khem
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

