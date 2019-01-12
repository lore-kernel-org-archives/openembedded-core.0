Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 148D56C0F8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 20:25:32 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y16so8527167qki.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 12:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yNVNnCpBuNe6/YSXP/LIpiKMkcam3sS6KV13SZQ33ck=;
	b=IPPmylKSBWmEmnkoIIvrfzTqLdn1xDqsxPZ6Lvepd7NxAgnmXykg4tcWwhOmI8mhHp
	rYNcTfalOeZJp0mtc1cxzixcOOqSQeyOS+7dcU6e7DYVsVT1LkpaubMm06To1qiQJBPF
	44d4al+jggQFfs+BXjtulQL2N1zTVTvJm6aZasX5F6T0LaZkS537JhvCWVHzlXezEgw3
	cIdSU+RFTQZIqWL+iwZuGXmH/V0SHyWjIFaIjqGhyQcZSadMMP3Hpo5V9CtDgNA444ie
	eKZ+jtwcL/MtnanNUSliQpAWc2e8gW7hfklcP6XWeT9DgupKxt0Eq/LW/iFWKOXTop/2
	wblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yNVNnCpBuNe6/YSXP/LIpiKMkcam3sS6KV13SZQ33ck=;
	b=I64dSLgtay6Z1Nc6poyBz5Q8cY2bq+zLZ1hTadBn1BF59X9lyGJQHU9X1T/SLD5Z3I
	UU9m1rwAkHcERVe6r4u4eZoC4OEXrPdd9Pzuu6ok6Ae8I87Pewoh8Wy0eaRVhnSWcWz8
	8zhpFku9Kh6ufvGnAbrQfG2tyE3E0l7F0oXjx0P+kZ4yBtEhyHi+nYcEReDf07MmSxBr
	4WMNaqhEXm954Ix7tstifmvq3A1fanpGbJDFyUJReEdt7zYp/j3KFXFIZF7No1TnGtOu
	FlgMdYLlXp5mAhwzh17B1L61bOt+vCiYD4PYsGqJEZpT84g6b1xvE/pnn4RA2Wmc+Kyr
	ruFg==
X-Gm-Message-State: AJcUukflQdB9tDweZDhhW0HRJK8BvRvR9Fq1648lrUzz/AUD8bCDC/8Y
	clE/pnBs+prxJCuVBQ5Aw1aX6iDajOPkllIhHvo=
X-Google-Smtp-Source: ALg8bN5kbwCBZY6hoKIOm3WviNniqAonNw81sfJuElFfV6vAFPCJEyvK/DUD0W1t7GJ+iwsJvYE8A8tT5hQW234BvbQ=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr18166009qke.2.1547324733787; 
	Sat, 12 Jan 2019 12:25:33 -0800 (PST)
MIME-Version: 1.0
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
	<018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
	<7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
	<CAMKF1so9Aa8xjLoJMW8Sdv28PPuQ758zXCq585+5j6pFQ6o5fQ@mail.gmail.com>
	<98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>
In-Reply-To: <98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 12:25:07 -0800
Message-ID: <CAMKF1sow2u8YYrDabk4EuOvs=5O+PuBBOpk0ExiU6juHZTWGQg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libgpg-error: Support build for native on ppc host
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
X-List-Received-Date: Sat, 12 Jan 2019 20:25:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 11:18 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-01-12 at 10:31 -0800, Khem Raj wrote:
> > On Sat, Jan 12, 2019 at 8:22 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2019-01-12 at 17:56 +0200, Serhey Popovych wrote:
> > > > Richard Purdie wrote:
> > > > > On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
> > > > > > In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit
> > > > > > while
> > > > > > kernel
> > > > > > selected by the installer depending on PowerPC machine type:
> > > > > >
> > > > > >   * 32-bit for PowerMac G4 (ppc7400) and below
> > > > > >   * 64-bit for PowerMac G5 and above
> > > > > >
> > > > > > Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit
> > > > > > userspace
> > > > > > making build impossible due to missing some of lib64 multilib
> > > > > > equivalents in Ubuntu repository.
> > > > > >
> > > > > > Using setarch(8) override to make whole host look as PowerPC
> > > > > > 32-
> > > > > > bit
> > > > > > can actually help with build but requires mapping for ppc
> > > > > > target
> > > > > > to
> > > > > > their libgpg-error equivalent to fix native build.
> > > > > >
> > > > > > Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with
> > > > > > command:
> > > > > >
> > > > > >   MACHINE=qemuppc setarch ppc bitbake core-image-full-cmdline
> > > > > >
> > > > > > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > > > > > ---
> > > > > >  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/meta/recipes-support/libgpg-error/libgpg-
> > > > > > error_1.33.bb
> > > > > > b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > > > index 325529d..4153954 100644
> > > > > > --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > > > +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > > > @@ -47,6 +47,7 @@ do_compile_prepend() {
> > > > > >     mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
> > > > > >     mips*)      TUPLE=mips-unknown-linux-gnu ;;
> > > > > >     x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> > > > > > +   ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
> > > > > >     ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
> > > > > >     ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
> > > > > >     *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
> > > > >
> > > > > This doesn't feel correct. It only works if you're using the
> > > > > local
> > > > > setarch workaround and I'm worried most users are never going
> > > > > to
> > > > > find
> > > > > that.
> > > > >
> > > > > I'm fine with adding in general fixes but this is getting very
> > > > > specific
> > > > > to an very uncommon usecase :(
> > > >
> > > > Understand your position. Doing setarch(8) to run bitbake on
> > > > ppc64
> > > > kernel with 32-bit user space with missing 64-bit multilib seems
> > > > to
> > > > be the only option.
> > > >
> > > > Anyway this change just maps ppc to corresponding tuple used by
> > > > libgpg-error, so with this fix we hit both
> > > >
> > > >   a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
> > > >      no multilib
> > > >   b) native 32-bit powerpc host that is running as virtual
> > > > machine
> > > > for
> > > >      example).
> > >
> > > I'd understand that if this were just libgpg-error-native but our
> > > qemuppc builds work which I guess is why I don't quite understand
> > > what
> > > is wrong here?
> >
> > this is when using ppc32 as build host :)
>
> I appreciate that. My point is that we can build for ppc32 target
> machines (qemuppc) so why are ppc32 target machines using a different
> arch to native ppc32 machines?

Thats because for our ppc32 targets TARGET_ARCH is 'powerpc' and not ppc
which has one to one mapping for target specific lock-obj-pub.h file

>
> If the native and target recipes were different I could understand it
> but they're not.
>
> Could is mean we're using a non-standard name for ppc32 target builds?

Not really.

> or does it mean setarch should be to something else like powerpc on
> native builds?

yes historically ppc is ok they are used interchangeably

Basically I worry that we're using different names for
> the same thing.
>
> Cheers,
>
> Richard
>
>
>

