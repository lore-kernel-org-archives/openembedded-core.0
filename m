Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 76EE1747E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 23:20:44 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id y11so24283973lfj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 15:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KIQJhGfH6t35MAIKFzbRn69D77lOfho7yDiDxgvJikA=;
	b=j0sTrQOb4LuGaYMYEbyoGeiQBonR2Y51f/XDwmzF7r15xhogdAxbreIueO/Tkn/1xl
	8QW/cfZxZyiSOsoKUiSSUOMNVo0lkHKDBxpZMHtGxu9gQHdVqZCb/93WCrjfSOrXnbdb
	6qUl21JGoq7xXilmXIPE87oyvDNAdcgNXM1D2kHKryJDpE6V8FQAhYUqXUy0UOhM5cQK
	00XAn2liECZ/WS3Sl7k2cauGdM7cO18AxUoVF7vbIryyGHJuxT88ByeSd9DGv3YUx4Ba
	6vtr6xhS38orMqZ45Ar/m3RCeIQY2nDfZh1GveEvRv0x+0/6TuXdgltJIc++6EcqUbAT
	uHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KIQJhGfH6t35MAIKFzbRn69D77lOfho7yDiDxgvJikA=;
	b=hCHwd17bo4+3uqG7xguEhawW45wQxChV7OougaqQRBu7JQqi2A04XTcruGnDt2+A0E
	iWgBdSL+LA01hFInqVVV/ThW7pOxQNyOrnoAYV4agzlOlxNHlQsdvbHBeRP3Kw2HBucx
	TqDAr7T1hZwHnGw16wuqaAcGvgIGjKYlF8KLs8GFjm/HJLm/KoIASCWoYZJwwTKAD03U
	ZurrPdbOmyiyoWks4NFAZaT+Jb/4UwApaUEcB+LRee1jBW1g5GlO1JDBManVIH5hmYQA
	h9oUuBOAsqNBsF2fq0/dSYnjrrlAB9eAKA56zu8L3JDCTHSYMWajo8WR1eykEdypO76N
	YrPQ==
X-Gm-Message-State: AA+aEWacK8PoTZV7PeD/mYgKb8FyNOkmIfmBv424HgYSRp3z9bdn92qX
	4NgrJJZjFIi2itm9zys2Zc2GPUTchFlXP6SC6Qk=
X-Google-Smtp-Source: AFSGD/XwVg6S0/QkfLaj3827I4UVM/k7ZQesUciZx7RfQzvVHFpzog5CogSBr/E+2fJ0ZfQm7I8zpF7aMeBqd8R9rpw=
X-Received: by 2002:a19:2755:: with SMTP id n82mr23012093lfn.94.1546557645009; 
	Thu, 03 Jan 2019 15:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20190103223211.23531-1-alistair.francis@wdc.com>
	<CAMKF1soQ4jSBtSXCZVHDtk6nHcyKTSG9UFK6-vLETxmoSwkeQw@mail.gmail.com>
	<CAKmqyKN99yaSkjXVMCjt+HFC+QR-N+yJkrjzVTDSwUaZkcsh2A@mail.gmail.com>
	<CAMKF1srUDMrZ=T_UsSab-k91PVi3oML+L2OXoyfCLPdJKS7=cQ@mail.gmail.com>
In-Reply-To: <CAMKF1srUDMrZ=T_UsSab-k91PVi3oML+L2OXoyfCLPdJKS7=cQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 15:20:18 -0800
Message-ID: <CAKmqyKMbyjPycFmdB+a9gbZ4KFxNPaZQJ38DMkC4VQWg6wPQ=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fts: Bump FTS to version 1.2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 23:20:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thu, Jan 3, 2019 at 2:51 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Thu, Jan 3, 2019 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Thu, Jan 3, 2019 at 2:42 PM Alistair Francis
>> > <Alistair.Francis@wdc.com> wrote:
>> > >
>> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > > ---
>> > >  meta/recipes-core/fts/fts.bb       | 22 ----------------------
>> > >  meta/recipes-core/fts/fts_1.2.7.bb | 18 ++++++++++++++++++
>> > >  2 files changed, 18 insertions(+), 22 deletions(-)
>> > >  delete mode 100644 meta/recipes-core/fts/fts.bb
>> > >  create mode 100644 meta/recipes-core/fts/fts_1.2.7.bb
>> > >
>> > > diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
>> > > deleted file mode 100644
>> > > index 02f54086a3..0000000000
>> > > --- a/meta/recipes-core/fts/fts.bb
>> > > +++ /dev/null
>> > > @@ -1,22 +0,0 @@
>> > > -# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
>> > > -# Released under the MIT license (see COPYING.MIT for the terms)
>> > > -
>> >
>> > I am sad you took this out :)
>>
>> Do you want me to keep it in?
>
>
> Usually yes

V2 sent!

Alistair

>>
>>
>>
>> Alistair
>>
>> >
>> > > -SUMMARY = "POSIX file tree stream operations library"
>> > > -HOMEPAGE = "https://sites.google.com/a/bostic.com/keithbostic"
>> > > -LICENSE = "BSD-3-Clause"
>> > > -LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
>> > > -SECTION = "libs"
>> > > -
>> > > -SRCREV = "944333aed9dc24cfa76cc64bfe70c75d25652753"
>> > > -PV = "1.2+git${SRCPV}"
>> > > -
>> > > -SRC_URI = "git://github.com/voidlinux/musl-fts \
>> > > -"
>> > > -S = "${WORKDIR}/git"
>> > > -
>> > > -inherit autotools pkgconfig
>> > > -#
>> > > -# We will skip parsing for non-musl systems
>> > > -#
>> > > -COMPATIBLE_HOST = ".*-musl.*"
>> > > -
>> > > diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
>> > > new file mode 100644
>> > > index 0000000000..7ede6550f6
>> > > --- /dev/null
>> > > +++ b/meta/recipes-core/fts/fts_1.2.7.bb
>> > > @@ -0,0 +1,18 @@
>> > > +SUMMARY = "Implementation of ftsfor musl libc packages"
>> > > +HOMEPAGE = "https://github.com/pullmoll/musl-fts"
>> > > +LICENSE = "BSD-3-Clause"
>> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
>> > > +SECTION = "libs"
>> > > +
>> > > +SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
>> > > +
>> > > +SRC_URI = "git://github.com/pullmoll/musl-fts.git"
>> > > +
>> > > +S = "${WORKDIR}/git"
>> > > +
>> > > +inherit autotools pkgconfig
>> > > +#
>> > > +# We will skip parsing for non-musl systems
>> > > +#
>> > > +COMPATIBLE_HOST = ".*-musl.*"
>> > > +
>> > > --
>> > > 2.19.1
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-core mailing list
>> > > Openembedded-core@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

