Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id EA9AA7F89B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 21:50:16 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h15so105102qka.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EcEocihEk4NNoOnktCIXSkUfNpGewwyvKc6hF9fKTNk=;
	b=lnOee7zOc4iTUSynWMuQYN2Z9APZEZhouzYAtM71i8D5M2a5zYpUcSSSek6anudsg9
	/1xdC+PKj262lzD+70RuPbXJXVed+/1SHOq5qoZueiadrl4bm4c3hJr+Nos/Gvtx0GZT
	4lnQ1pdDgnbNmKQA+hin0ae9gYC+VHIIj9NZwst674NhXOLK5GI4DETzraCXkkMFxbGr
	H6TE7EZMDZboBSg3dS9cqGatlvhDMEa3yGDPdNqK8uPXOV8eptPBiWRVPfzLifKwLgpe
	Sy7DAAHqJQr/nOAS7wJK69Ooulu1jeCxN6Wvq1wK8eE1JX9eKgrYYDJS5HANRfSoAzs5
	nP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EcEocihEk4NNoOnktCIXSkUfNpGewwyvKc6hF9fKTNk=;
	b=SNmJQUSOmE4Q2/YWviQ51e62SIvFOYjS2hIQUD3DMlTLGkhluYez4/EdrkW9pB54IJ
	c9DlEGnAIu0ZspR+5xObWM1zI7AWIBdBfBupLdm1IW1V8NuJPj7lSAFE0C2RcYlwjAp+
	HSUQPPbF7lBKmwypVlRVsTzDLzMN1mr8msjrc45gSV5o7kMxjctIwTTJBAr5cWV5fEFn
	1v7FXROqClon/yn/RILwMLVUKY797JIDJHwj3fEBSFe8DE1XOIgNytOKMOPhWKyXBFld
	rvP2OC5qcXmVIpPrX3WkAxYeo2Pa+jUUhI60srCzvbVJSjWE5rwhxf8Jgag7uLopfZj0
	wfSw==
X-Gm-Message-State: APjAAAU8uk79182OPGtgmhitsUMqFq8myFicMfr6MizchDMLkBfwkijX
	IEKc8qwfpJDhRHSKUsE5Xz6DAzcdgQhYGE9FyFk=
X-Google-Smtp-Source: APXvYqyta9Qnmg0wWAYWD2f3pG4mTZRnAHfkc2AZQtoRu89EuCBu60YJ3R2+M6oc2dNnnCHM0TMoSHd/ei+oDyiMly8=
X-Received: by 2002:a37:84b:: with SMTP id 72mr4353530qki.337.1573077017433;
	Wed, 06 Nov 2019 13:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<CAMKF1soM-bediaxsN9n5Ra_LK1ydR=_gpy5dyzxaH9yGu5Ar2Q@mail.gmail.com>
	<b2b7a383c402c8b63e5725084daf8ca77f697583.camel@wdc.com>
In-Reply-To: <b2b7a383c402c8b63e5725084daf8ca77f697583.camel@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2019 13:49:51 -0800
Message-ID: <CAMKF1spVsuoq5TUhGTRdqgX-0wq0zrGSzfYo6PwccvG85=J3ww@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Nov 2019 21:50:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 1:34 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Wed, 2019-11-06 at 12:54 -0800, Khem Raj wrote:
> > On Wed, Nov 6, 2019 at 12:37 PM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
> > >  meta/conf/machine/include/riscv/tune-riscv.inc | 17
> > > +++++++++++++++--
> > >  2 files changed, 17 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> > > b/meta/conf/machine/include/riscv/arch-riscv.inc
> > > index f3edcc39f7..6737545e00 100644
> > > --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> > > +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> > > @@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
> > >
> > >  TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
> > >  TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
> > > -TUNE_CCARGS .= ""
> > > +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES',
> > > 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> > > +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES',
> > > 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
> > >
> > >  # QEMU usermode fails with invalid instruction error (For riscv32)
> > >  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
> > > ${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode',
> > > '', d)}"
> > > diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc
> > > b/meta/conf/machine/include/riscv/tune-riscv.inc
> > > index 25d0463492..631653f2a2 100644
> > > --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> > > +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> > > @@ -1,12 +1,26 @@
> > >  require conf/machine/include/riscv/arch-riscv.inc
> > >
> > >  TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
> > > +TUNEVALID[riscv64-f] = "Enable 64-bit RISC-V optimizations with
> > > hard float"
> > >  TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
> > > +TUNEVALID[riscv32-f] = "Enable 32-bit RISC-V optimizations with
> > > hard float"
> > >
> > >  TUNEVALID[bigendian] = "Big endian mode"
> > >
> > > -AVAILTUNES += "riscv64 riscv32"
> > > +AVAILTUNES += "riscv64 riscv64-f riscv32 riscv32-f"
> > >
> > > +# Hard float
> > > +TUNE_FEATURES_tune-riscv64-f = "${TUNE_FEATURES_tune-riscv64}
> > > riscv64-f"
> > > +TUNE_ARCH_tune-riscv64-f = "riscv64"
> > > +TUNE_PKGARCH_tune-riscv64-f = "riscv64"
> > > +PACKAGE_EXTRA_ARCHS_tune-riscv64-f = "riscv64"
> > > +
> > > +TUNE_FEATURES_tune-riscv32-f = "${TUNE_FEATURES_tune-riscv32}
> > > riscv32-f"
> > > +TUNE_ARCH_tune-riscv32-f = "riscv32"
> > > +TUNE_PKGARCH_tune-riscv32-f = "riscv32"
> > > +PACKAGE_EXTRA_ARCHS_tune-riscv32-f = "riscv32"
> > > +
> > > +# Soft float
> > >  TUNE_FEATURES_tune-riscv64 = "riscv64"
> > >  TUNE_ARCH_tune-riscv64 = "riscv64"
> > >  TUNE_PKGARCH_tune-riscv64 = "riscv64"
> > > @@ -16,4 +30,3 @@ TUNE_FEATURES_tune-riscv32 = "riscv32"
> > >  TUNE_ARCH_tune-riscv32 = "riscv32"
> > >  TUNE_PKGARCH_tune-riscv32 = "riscv32"
> > >  PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
> > > -
> >
> >  its better to add riscv64sf and keep existing tunes as it is. since
> > sf is going to be rare
> > compared to rv64gc
>
> Ok, these are the tunes I have now:
>     riscv64 riscv64sf riscv32 riscv32hf

what would riscv32hf be ?

>
> Alistair
>
> >
> > > --
> > > 2.23.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

