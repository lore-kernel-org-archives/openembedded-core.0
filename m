Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 40EFD7F950
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 23:06:53 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o3so31562680qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 15:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oKPJZQVa0gZR70D5VPsex2dVNvjJ4JyFWwRdKzDoNyo=;
	b=ClCGGJaW5OYOZINZBYqv3CYXW5uLC853OCAFnbP1e0PDpvf6gUMkkpgX9lwzOiQgU8
	IgIH8wfLc/q06e34oyiSAEGsfxckr+gzS6BLlRxHPESJQueRFTEbkhpaAR0axctcgrYx
	4n8GvfpcmGwuB11EbYFj+CL0/nVK0uKLx7JMEQFpaw3kVshma3KjfiqnWqC+hxcXa6i6
	gEtr3rtRQjn2EGVQq2gJCLMzt5JuKpLr6FGJUu7SgixJ7wcON7G5YD3bhix7P8p/YRcU
	JbhKBnOwUfHZMe4lNVByHoKz43xdJLUqFoVUWqocrvMsD9a4vEn8xNyQtzE4FBLRceSN
	X+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oKPJZQVa0gZR70D5VPsex2dVNvjJ4JyFWwRdKzDoNyo=;
	b=hwBkgc1McoLgrACHd7++/z3EWL0bl8ctYmrL0aMQXq0MH92p9MV2YkelSpPcgLN180
	6WeRVil1HwsaXjp5HVbuzRlff5Y/WhR+d/ynzkB8nXE7wX7qlc2Te4dGDGwBiMxkKAdN
	ucd5IHdMhKY564ZCC3cfuNT1wk87C6n6WpX5fv3Cw1qKbjtlfhX4u76vS68z8XJHEgk6
	KFyfZf4qtu2NaJoBONTKhwbvIGMyntrHdtXA29MHOdoKf8V6yDCgoBxUjWZHFhJosa7U
	9OHZanmSrTuA9HvzLQj07AcrIYrz4mPUY4AYp4roG/VcYiePMPOAqVmfRQGgfHD+Ehh5
	Qewg==
X-Gm-Message-State: APjAAAVHp2hehF/iJNFjw4CkIt27YyuVvoeiCoyWU4O73xOcCYJdjRYJ
	+adqKKlakQgsiUivo/n7aSPRLmQTqoAhHF54ddU=
X-Google-Smtp-Source: APXvYqxS38gD8kkLPWPKzar4JQKk9ai7CCciqFNpWsUPO21piMD++xo1Ogg5igxJTw6iQxzKo0LENs8hPnAh/SW0pPI=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr9576454qtj.80.1572995213849; 
	Tue, 05 Nov 2019 15:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20191105215210.17008-1-alistair.francis@wdc.com>
	<CAMKF1sp89rDgU+FEb68TU8gaHyAVPCJ_i0OmSDRxtOncJMPkiw@mail.gmail.com>
	<CAKmqyKO5GgkcYSkhHGtCJT+BaMhXSeDJV5-9FzuHech69Ow71g@mail.gmail.com>
In-Reply-To: <CAKmqyKO5GgkcYSkhHGtCJT+BaMhXSeDJV5-9FzuHech69Ow71g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 15:06:27 -0800
Message-ID: <CAMKF1spno4ynjRbmMQOJA93PsDf3SE9o0NH+QiD16mqH5Xa9NA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] machine/arch-riscv: Fix newlib and baremetal builds
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
X-List-Received-Date: Tue, 05 Nov 2019 23:06:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 2:48 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Nov 5, 2019 at 2:42 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Nov 5, 2019 at 1:57 PM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > Fix the following errors for newlib and baremetal libcs:
> > >   ld: unrecognized option '--hash-style=sysv'
> > >   ld: unrecognized option '--hash-style=gnu'
> > >
> > > Setting LINKER_HASH_STYLE to empty for just newlib and baremetal doesn't
> > > work as GCC still ends up being built with --hash-style=gnu which causes
> > > failures when using a built newlib SDK.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/conf/machine/include/riscv/arch-riscv.inc | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> > > index 19f8f3e211..f3edcc39f7 100644
> > > --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> > > +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> > > @@ -8,3 +8,6 @@ TUNE_CCARGS .= ""
> > >
> > >  # QEMU usermode fails with invalid instruction error (For riscv32)
> > >  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
> > > +
> > > +# --hash-style is unsupported
> > > +LINKER_HASH_STYLE = ""
> >
> > I think we still need to use newlib and baremetal overrides
>
> That produces a SDK that doesn't work though.
>

Generally, I am in favor of this change, what it does do is that now
it will depend on toolchain defaults
the selection which is gnu for riscv for Linux targets so it does not
change defaults for internal toolchain
however external toolchains might have different default behavior so
we won't be able to control that
anymore. I think sysv may not even be an option for riscv so that will
eliminate this completely.

> Alistair
>
> >
> > > --
> > > 2.23.0
> > >

