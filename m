Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id D8FFA7F847
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:48:34 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y6so16431153lfj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 14:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kdbY/n1TYJoyBUB/PO3PnQQYdcTrLxf+58LxPyRbTlM=;
	b=UDhPyt2QA3jXyLVjXDWZQFakSRA9U5ScyXJNOpM/dQW14tHFLN7rKze+n0XfvLB3r9
	WS6D4aT+n3zRRyHzr5zMrwR9wzkDRbkLJ9rlORCynKTPIFrzFImq8O7R9KHkyrOAQo2n
	TNXIh2jVRxlYM05nBALGwtBgTacrLJ0n4V8WJk7gZDqh3RuV5cOAlCkP/yK5jhOfaCaC
	MHXtn4zGX95mrI9LF8YY1HfN1llB+MNQXAgqDJkIFMVM4M4XI53vIFe/Y6VFbdCzjJuR
	4VAiagtwBv9s7tU6vvSG6dVVKyYLQ+sedhpeaIg27idTk/jrXRYB/k5j0ZRg5zbef5ET
	HSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kdbY/n1TYJoyBUB/PO3PnQQYdcTrLxf+58LxPyRbTlM=;
	b=ln3svtmMdSB/hhm/cAvOtJAWzLbVYzGWIRBMB9OxapEpVZdkLLOa5xW6+TSGFav3cu
	ufgq+WKK3mltGuMDoIyWDK3ZOLD5bsiiQnC/rNk6WQOb/SrkJ3lxCJrGVzIcUXbOCeQ5
	A+Dc9Ka5tBiC5JXs8jPlNuC7aeAhjcyJ1tS7OszGQLEBjGv2zlz9pqjevnFtPMveDbmz
	wNQnyXhA7p8whFviPIrhzXofwsvoV1jlbc2tyyGT/rdmZUXveQaIfUBZmXaIsDZiENne
	oxW31+fKNf0fPI9J2E0znXbR1L+DSOy9uYeBQXWMupnNNOGMIygzmyXqxWtXIMjxWgrL
	/jpQ==
X-Gm-Message-State: APjAAAVHbAHKgmwCpuUblCAX2WM3dAZu7PVocoTyg2vvMeUPVwZZFYhC
	lPFeYacSWxqqLBQnxXNRDz8ao05+NrYr5pJVhjM=
X-Google-Smtp-Source: APXvYqzmi8pcm/QE+E/wvUOqVkDF2cuNO1981WICQmK8zfVwzCkz4X3MHtD8/e02IMYANqhIxbPlLi7ZyOPHiMirVxQ=
X-Received: by 2002:ac2:5295:: with SMTP id q21mr21741154lfm.93.1572994115404; 
	Tue, 05 Nov 2019 14:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20191105215210.17008-1-alistair.francis@wdc.com>
	<CAMKF1sp89rDgU+FEb68TU8gaHyAVPCJ_i0OmSDRxtOncJMPkiw@mail.gmail.com>
In-Reply-To: <CAMKF1sp89rDgU+FEb68TU8gaHyAVPCJ_i0OmSDRxtOncJMPkiw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Nov 2019 14:42:53 -0800
Message-ID: <CAKmqyKO5GgkcYSkhHGtCJT+BaMhXSeDJV5-9FzuHech69Ow71g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 05 Nov 2019 22:48:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 2:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 5, 2019 at 1:57 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Fix the following errors for newlib and baremetal libcs:
> >   ld: unrecognized option '--hash-style=sysv'
> >   ld: unrecognized option '--hash-style=gnu'
> >
> > Setting LINKER_HASH_STYLE to empty for just newlib and baremetal doesn't
> > work as GCC still ends up being built with --hash-style=gnu which causes
> > failures when using a built newlib SDK.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/conf/machine/include/riscv/arch-riscv.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> > index 19f8f3e211..f3edcc39f7 100644
> > --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> > +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> > @@ -8,3 +8,6 @@ TUNE_CCARGS .= ""
> >
> >  # QEMU usermode fails with invalid instruction error (For riscv32)
> >  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
> > +
> > +# --hash-style is unsupported
> > +LINKER_HASH_STYLE = ""
>
> I think we still need to use newlib and baremetal overrides

That produces a SDK that doesn't work though.

Alistair

>
> > --
> > 2.23.0
> >

