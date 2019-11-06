Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 28A3B7FA37
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 22:18:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l24so88261qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 14:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a805Q3sz6/jqaYrE5rAz74WvueOyzHZ/JR/4cWkJeWU=;
	b=dQJIOtrzPtV4Bbvf8tPB/U/txcj3KH1qfNZbLrc0mlbimAkVo+ZlGgNJ84VPC/Lcr0
	C/ijDZUnFtD+rCnmUfLBfOFFa8kmU5+Ph7IM+DzsbqaNitgFoeZsFG5jG06BQ6nctpwv
	veqVDer5GOxy/rErLrrH6Mm/eoCQ85S52fYBz+ApNv78m6fZfKMpaXMuufd7kQijMpNX
	y4jVFG0ALaAzlSf7hZX4JH1P2PCiva/hDKYqOCcpguWStMAnpIXkkEEUmZ5rHI4IsROg
	1cRU047x5D7zHymzv0wHkPQ3FuKrzeEP4pwDG3UWz6JHxGdS7XgjH1U8Yk0Yphes/njD
	/P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a805Q3sz6/jqaYrE5rAz74WvueOyzHZ/JR/4cWkJeWU=;
	b=oAdGfmfqCSrw92h2ifWTClWQdpU33RK/qMyndHGfggmB/76MXUIWJvwRB6AG7Rcb08
	7IoWEr2YvqHz0a/DyA8AWjg8GWoFnT1VQLRTyzhj7YWwjX82kWNCVkTt/GiYCtH3seXo
	XNnDrK5uanX8Tb135+tw6sbRjxHHYaM0FUQ6/IPpN7Sng+N3Y3LhAwQVVCOFTggzBgR4
	EoAee4fs5OuQNKCseMtoXsMUj9+Be6M+JfjkRIMFglWShPEyam/upK9GcG1adlBFBKbd
	gszmF/39r1PoqeFeNl/PONvT8FyqwRUt+vkw2FTWOH8VI3ANEMKWW0ff88nKQvkOO68G
	JEiQ==
X-Gm-Message-State: APjAAAVw0pZdqNnJksGGGDt7AR189gcYnBs75qmp16Bq7bIt2OR5SuY3
	WufCHHpJ8t3TWcM+qiaUWcin/s2QmwgV2ZVVewE=
X-Google-Smtp-Source: APXvYqz7pKnMTbGL1X+ysa7A0fQVt7Dlfy/tj1RAX5pEcMtA9uOreKhC9LBV8nPTvPLDy0/H5IOBwde/QAz0O6yXd7k=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr365623qtj.80.1573078733654;
	Wed, 06 Nov 2019 14:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
	<b2b7a383c402c8b63e5725084daf8ca77f697583.camel@wdc.com>
	<CAMKF1spVsuoq5TUhGTRdqgX-0wq0zrGSzfYo6PwccvG85=J3ww@mail.gmail.com>
	<8d3f034ee8d61d85b61392994c07a617fb5fcbce.camel@wdc.com>
In-Reply-To: <8d3f034ee8d61d85b61392994c07a617fb5fcbce.camel@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2019 14:18:27 -0800
Message-ID: <CAMKF1srbbV2xmcnKhU8GuXcDv6s8s7MZR0YSJsoj2EJVKt1qiw@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 Nov 2019 22:18:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 1:52 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Wed, 2019-11-06 at 13:49 -0800, Khem Raj wrote:
> > On Wed, Nov 6, 2019 at 1:34 PM Alistair Francis
> > <Alistair.Francis@wdc.com> wrote:
> > > On Wed, 2019-11-06 at 12:54 -0800, Khem Raj wrote:
> > > > On Wed, Nov 6, 2019 at 12:37 PM Alistair Francis
> > > > <alistair.francis@wdc.com> wrote:
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
> > > > >  meta/conf/machine/include/riscv/tune-riscv.inc | 17
> > > > > +++++++++++++++--
> > > > >  2 files changed, 17 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> > > > > b/meta/conf/machine/include/riscv/arch-riscv.inc
> > > > > index f3edcc39f7..6737545e00 100644
> > > > > --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> > > > > +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> > > > > @@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
> > > > >
> > > > >  TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
> > > > >  TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
> > > > > -TUNE_CCARGS .= ""
> > > > > +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES',
> > > > > 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> > > > > +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES',
> > > > > 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
> > > > >
> > > > >  # QEMU usermode fails with invalid instruction error (For
> > > > > riscv32)
> > > > >  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
> > > > > ${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-
> > > > > usermode',
> > > > > '', d)}"
> > > > > diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc
> > > > > b/meta/conf/machine/include/riscv/tune-riscv.inc
> > > > > index 25d0463492..631653f2a2 100644
> > > > > --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> > > > > +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> > > > > @@ -1,12 +1,26 @@
> > > > >  require conf/machine/include/riscv/arch-riscv.inc
> > > > >
> > > > >  TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
> > > > > +TUNEVALID[riscv64-f] = "Enable 64-bit RISC-V optimizations
> > > > > with
> > > > > hard float"
> > > > >  TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
> > > > > +TUNEVALID[riscv32-f] = "Enable 32-bit RISC-V optimizations
> > > > > with
> > > > > hard float"
> > > > >
> > > > >  TUNEVALID[bigendian] = "Big endian mode"
> > > > >
> > > > > -AVAILTUNES += "riscv64 riscv32"
> > > > > +AVAILTUNES += "riscv64 riscv64-f riscv32 riscv32-f"
> > > > >
> > > > > +# Hard float
> > > > > +TUNE_FEATURES_tune-riscv64-f = "${TUNE_FEATURES_tune-riscv64}
> > > > > riscv64-f"
> > > > > +TUNE_ARCH_tune-riscv64-f = "riscv64"
> > > > > +TUNE_PKGARCH_tune-riscv64-f = "riscv64"
> > > > > +PACKAGE_EXTRA_ARCHS_tune-riscv64-f = "riscv64"
> > > > > +
> > > > > +TUNE_FEATURES_tune-riscv32-f = "${TUNE_FEATURES_tune-riscv32}
> > > > > riscv32-f"
> > > > > +TUNE_ARCH_tune-riscv32-f = "riscv32"
> > > > > +TUNE_PKGARCH_tune-riscv32-f = "riscv32"
> > > > > +PACKAGE_EXTRA_ARCHS_tune-riscv32-f = "riscv32"
> > > > > +
> > > > > +# Soft float
> > > > >  TUNE_FEATURES_tune-riscv64 = "riscv64"
> > > > >  TUNE_ARCH_tune-riscv64 = "riscv64"
> > > > >  TUNE_PKGARCH_tune-riscv64 = "riscv64"
> > > > > @@ -16,4 +30,3 @@ TUNE_FEATURES_tune-riscv32 = "riscv32"
> > > > >  TUNE_ARCH_tune-riscv32 = "riscv32"
> > > > >  TUNE_PKGARCH_tune-riscv32 = "riscv32"
> > > > >  PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
> > > > > -
> > > >
> > > >  its better to add riscv64sf and keep existing tunes as it is.
> > > > since
> > > > sf is going to be rare
> > > > compared to rv64gc
> > >
> > > Ok, these are the tunes I have now:
> > >     riscv64 riscv64sf riscv32 riscv32hf
> >
> > what would riscv32hf be ?
>
> RISC-V 32-bit hard float. It sets: -mabi=ilp32f
>
> It currently isn't used, but it could be in the future.
>

hmmm we could also use sf = single float df=double float
nf=soft(no) float where exceptions are to be indicated and keep
riscv64 and riscv32 to indicate default ( common ) ABIs

> Alistair
>
> >
> > > Alistair
> > >
> > > > > --
> > > > > 2.23.0
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

