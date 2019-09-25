Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id DBC2D7DE5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 01:09:19 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id b20so3805473ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 18:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vdEZqoaIpdSZ5/8xwAqnL2a7N3vyj+Q7QCBxNRxQTMQ=;
	b=VEN4i68Di1//+MLwdd1mOqjNjvm1itwzGDFyviyRkCnArxuXatpJJzBw3KCFd/tHfQ
	kn7zGbPGItfkVZ0Goz40YCbxDNkBmeh2kzbKphGgCIyJIizi1J1E1mr2XxZ9alkYq+pk
	wh1oGSk12KkO2LZmPBEr1cEa+azhqoU+B3DJe9+6PKdeA3tOuBbI3ApZHMoZTYi7i0GW
	I0pK7nXcSoQ4hO8NLJYtvpT5KQCWReyHTV6gj0g6jdoI18aDfT1X6ftFNbehC/lLDXqt
	NSAyX3rADV9+EpjVNVG/MyFiE7/5tgEhLy9qoIaSvpyyHf0KQS5cUFYy3KBo0+bEwOb5
	Hw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vdEZqoaIpdSZ5/8xwAqnL2a7N3vyj+Q7QCBxNRxQTMQ=;
	b=YcVWLw7GjIOr87VESzDJ/NYx6mOoq5pT+NZDi7auNvsYJGXasmFgGDGv6CYlR6cSpv
	AeDWf8asAmS1msaPvxXuXL4WIbFb42XGTk6gIlmh2yvjeo3H70vEDblde92Ssjv1vjXK
	3ekjHW7c0tCk3JBP7KmVKZy7KWt6W/HBHvESvtz0z+AfYdXvbSSsfhAsOXgj6EwuyCTX
	ZH6BIo1RxWRhuQyPT5qSr1haA40HgN0xR0Zr/26y0xN4ZBNfrYdz+n5hc8SCzCXPMEBz
	1m/DjWLfgRVf2/JL++xHc9MHIhv/gT4auROyPgzr1auaqqwJbSos/RgZUK3L71SIqLn7
	Hcnw==
X-Gm-Message-State: APjAAAXOTUjmxB1vArNfCwkBboMzxGQfHrUwcCdmQbfCgpRhuA9eJuCk
	0PnSRokBUInhnuJVOidUXc7LE61UwuJAlBh8D7M=
X-Google-Smtp-Source: APXvYqypIzqlNCc1Ghu4GUkwdffC1riVAJpFojnm7+SLZhKFg63wBDepxogTdONZSVpWVwTBWhCae9PevBLWb3QVHOI=
X-Received: by 2002:a2e:9708:: with SMTP id r8mr3933034lji.58.1569373760449;
	Tue, 24 Sep 2019 18:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
	<CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
	<7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
	<CAMKF1sp6hDii_4dH6nrr1VstobnP2sCpyNUy74eiOaJGqVKhNg@mail.gmail.com>
	<CAKmqyKOwPad=m_jN9u-0JmG6XxY86iHf-+QU-zdmPeXizoFfYQ@mail.gmail.com>
	<CAMKF1sqbaTfs9y9XT=S0f86_u-UWT=TQMt07qouKtSxzXcQhFg@mail.gmail.com>
In-Reply-To: <CAMKF1sqbaTfs9y9XT=S0f86_u-UWT=TQMt07qouKtSxzXcQhFg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Sep 2019 18:04:38 -0700
Message-ID: <CAKmqyKOebbJNoyExJzKd0hr1YTzmmf=4Y22ux9eKEd9vUh6qLg@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Sep 2019 01:09:20 -0000
Content-Type: text/plain; charset="UTF-8"

I raised the regression on the QEMU mailing list while I was preparing
the revert for QEMU and Palmer pointed out this diff for musl:

diff --git a/arch/riscv64/atomic_arch.h b/arch/riscv64/atomic_arch.h
index c9765342..41ad4d04 100644
--- a/arch/riscv64/atomic_arch.h
+++ b/arch/riscv64/atomic_arch.h
@@ -14,7 +14,7 @@ static inline int a_cas(volatile int *p, int t, int s)
                "       sc.w.aqrl %1, %4, (%2)\n"
                "       bnez %1, 1b\n"
                "1:"
-               : "=&r"(old), "=r"(tmp)
+               : "=&r"(old), "=&r"(tmp)
                : "r"(p), "r"(t), "r"(s)
                : "memory");
        return old;
@@ -31,7 +31,7 @@ static inline void *a_cas_p(volatile void *p, void
*t, void *s)
                "       sc.d.aqrl %1, %4, (%2)\n"
                "       bnez %1, 1b\n"
                "1:"
-               : "=&r"(old), "=r"(tmp)
+               : "=&r"(old), "=&r"(tmp)
                : "r"(p), "r"(t), "r"(s)
                : "memory");
        return old;

This seems to fix the problem for me. Hopefully Palmer will prepare a
patch then we can just cherry pick that (from the list) on musl in OE
core.

I'm not going to send out the QEMU revert patch.

Alistair

On Mon, Sep 23, 2019 at 10:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Please send a patch
>
> On Mon, Sep 23, 2019 at 9:58 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Sep 23, 2019 at 7:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, Sep 23, 2019 at 6:39 PM Alistair Francis
> > > <Alistair.Francis@wdc.com> wrote:
> > > >
> > > > On Mon, 2019-09-23 at 17:59 -0700, Alistair Francis wrote:
> > > > > On Mon, Sep 23, 2019 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > Alistair,
> > > > > >
> > > > > > OE-core qemu upgrade to 4.1 has ended up with regressing musl/riscv
> > > > > > port. I could pin point it to
> > > > > >
> > > > > > https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f
> > > > > >
> > > > > > it works fine with 4.0, I havent looked further
> > > > > >
> > > > > > To reproduce
> > > > > >
> > > > > > build
> > > > > > MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
> > > > > > TCLIBC=musl runqemu nographic
> > > > >
> > > > > Thanks, I can reproduce this and am bisecting QEMU now.
> > > >
> > > > This QEMU patch causes the failure. It reverts cleanly on master and
> > > > that fixes the issue:
> > > >
> > > > RISC-V: Clear load reservations on context switch and SC
> > > >
> > > > This prevents a load reservation from being placed in one
> > > > context/process,
> > > > then being used in another, resulting in an SC succeeding incorrectly
> > > > and
> > > > breaking atomics.
> > > >
> > > > Signed-off-by: Joel Sing <joel@sing.id.au>
> > > > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> > > > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > >
> > > > I'll investigate a full solution tomorrow, in the mean time do you want
> > > > to just revert the patch?
> > >
> > > yes lets use the revert for now, this will give you enough time to
> > > investigate solution
> > > since its riscv specific it will be low risk and we can even go to 3.0
> > > release with it
> >
> > Do you want me to prepare a patch or do you want to do it?
> >
> > Alistair
> >
> > >
> > > >
> > > > Alistair
> > > >
> > > > >
> > > > > Alistair
> > > > >
> > > > > > Thanks
> > > > > > -Khem
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-core mailing list
> > > > > > Openembedded-core@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

