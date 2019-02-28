Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2543171CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 23:05:42 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id z7so18510185lji.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=des6eLye5Amdj6wMjDNxW5ZhUTdlc2LQmMab9oQmvgI=;
	b=grYsbiymhz7uPS/IdGS40GlWF3ybaz4+2xMceEJei54StccqJHXpT8wTxcf5I/YnDj
	ulUtCYPiznfwRgnPIf9Zmz/00huoNt1RZubtFXNvAgZjA/Ski8pKKMlcRnCfowtXNdoM
	yUj6q3gcC4ka8cg7Q2VYhZvFvsPUSqIsyHZ5NR048FmSyg3lqqwrgfi+NBxIjx2vwt5z
	i1xbMYTC1LDqyFewCxDy4X+S9WvPL3jLfnW+hLPyYs4SL0SLhc/3fKfm1hkBZUJQYh/1
	F5kbtSyiUDLnk9gUPrtoD51pTSqXf4+3BH+lu7fRPW3wN8e75vcV48aRM6vAzIOxIaSQ
	ROSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=des6eLye5Amdj6wMjDNxW5ZhUTdlc2LQmMab9oQmvgI=;
	b=XljHaj5787Pf+BGnm/3SxyGrFSNNsmWMaKEv5qlUJ+rmN3enJgGZen/LMbIpSvyQbP
	0mYhcnJQorJ6gIkFH0bmt3uoI2SvNtjkvjFb88jiEjfjB6zG/LhD9WH5gqoj+ijwgWg6
	LUOfK2kgPfaGUYZhfnkG4dl/brPIYn3uTwpuJQF4NOBmQ6olj08eJnGf9SkqrqPuVnJV
	gvxd7hf3nUuZORjZsRi+gSPDDUetqQrOwPf3q6/tBei6dE1gZVQ4MD4cHNK1Lf4SUINW
	PNU7CoV7xieOQ/SMEE24iAH7CmKzIKUFUBxQLKC0OsO2VFGBdPQgEz4PqEr86jl3VoqF
	yHcg==
X-Gm-Message-State: APjAAAUSICBikNhsTT5Ud6ijkiRhgKnM/Mc6CdgjTABaimCjtM5gO+dB
	TZSISmAiAXR3ZhogsG8UGXc/wOqSVsOKEqY95cw=
X-Google-Smtp-Source: APXvYqy9h7Iqja7ieHaBZvBaYlO4ctPm4MBRRtxtvsz9Ow1NFDS09O8B/r4j8a/2laTtC/AAr0my4Xs7smZYvxl5DxQ=
X-Received: by 2002:a2e:8803:: with SMTP id x3mr755882ljh.27.1551395143414;
	Thu, 28 Feb 2019 15:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20190228213251.31036-1-alistair.francis@wdc.com>
	<44473a1d54ad68139b8fe9ef3e5b0fdc31870801.camel@linuxfoundation.org>
	<CAMKF1so3KK1v=guafU5K+_nDU3jQm-0HG-CgRCf5qWA_i4gRpQ@mail.gmail.com>
	<c41a4e170d2c8faa9e6e634643f4c0d0dfba16c3.camel@linuxfoundation.org>
In-Reply-To: <c41a4e170d2c8faa9e6e634643f4c0d0dfba16c3.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Feb 2019 15:04:45 -0800
Message-ID: <CAKmqyKM2LsvygvX+5P13LSr=micxSg0xiKcnOo6sOGYdrwQcoA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Feb 2019 23:05:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 28, 2019 at 2:28 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-02-28 at 14:25 -0800, Khem Raj wrote:
> > On Thu, Feb 28, 2019 at 2:24 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2019-02-28 at 21:33 +0000, Alistair Francis wrote:
> > > > This is required to fix this build failure:
> > > >
> > > > qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No
> > > > such
> > > > file or directory
> > > >  #include <libfdt.h>
> > > >           ^~~~~~~~~~
> > > > compilation terminated.
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > > b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > > index c8acff8e19..0b6a7f8b6e 100644
> > > > --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > > +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > > @@ -6,4 +6,4 @@ require qemu-native.inc
> > > >
> > > >  EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_targe
> > > > t_li
> > > > st(d)} --disable-tools --disable-blobs --disable-guest-agent"
> > > >
> > > > -PACKAGECONFIG ??= ""
> > > > +PACKAGECONFIG ??= "fdt"
> > >
> > > I think this is a rebuild bug, did you try cleaning and rebuilding
> > > qemu-native?
> > >
> > > I did hit this when testing but in amongst the rest of the chaos
> > > from
> > > today, forgot that :(
> > >
> >
> > dont think so , if one has libfdt on host and is not version qemu
> > like it will have build errors.
>
> I think what happens is that the "old" qemu-native had this enabled. We
> now split the qemu build so qemu-native is reconfigured and rebuilt but
> its configure script/makefiles are buggy and it leaves part of the
> system misconfigured leaving a build error. If you clean/rebuild this
> doesn't happen again.
>
> I did see this exact failure, it then went away after a clean and the
> above was the only explanation I have. Should be easy to reproduce
> though.

Yep, it seems to have disappeared now. Thanks for the help.

Alistair

>
> Cheers,
>
> Richard
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

