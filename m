Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61DF4795FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 16:45:07 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id r3-v6so6032029qte.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0Fy2n8j/5ApmFDVy9WdIJ+pxV3xqp5DWhEwMnNvREEA=;
	b=vUeBq7RJSB2CIbjlO4W3kcAhDfO2ca4De02s2PbqFPMTFUg9QrmWXdPzbf2N8sqMFL
	x7SPn4Y82yCsvw7xSgVPmcXa0c/txy81y5LJ8DminHgVRlZBulQ9YHCJwsf5gk3NuP+A
	q2xDGJKGkTcIObdibn90dk9tKhSPxgb42+sSFIKIyaRcTcf5VMQfknjiWSzkkoBQJGIr
	OMux1oOtbiKPgsG+bGhMJ3pPP1noxdIR328P/04DkYRTLj6fHe0IxvrXJlQaBos9J67B
	N2VU+rGIT2ufKlvKT0/z0u+9TA4NtNkuLA1D8IuUcIbSotwuGaOrW4z0EJ2xYtleI+/9
	ulmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0Fy2n8j/5ApmFDVy9WdIJ+pxV3xqp5DWhEwMnNvREEA=;
	b=IOEjJkRyfHm43LtCK4v7KEtu1VOs3QbK7CSUJpiLXTP+a8m56S6TGG517wAMhTLn/n
	uH8uCeveOxl8zkVp3+c7i4JSCLY/yycwMCwZcSjo2o6SUiRdHadkLBLd1/3Onuq/hRlB
	rc2yDDbumiefc/m50LIa1h/uY/TE/tq5AYsrPpBaslL9B/XheB1hSxPmO+AGn8RaxFfP
	oTl17QX87jXvyXQAXKXsGmq51PbRVO0QNrXln/B6XP1h6O8p75bQKjCf0Pd9Jgt+buZh
	vXRXACW+Fpzb3U1DjcMxy5VWR1py1lvlJ03gusAk6SAOuDaTX3fM4853kBeCtxmd4j2G
	zdPw==
X-Gm-Message-State: APzg51A64fLqUtsf8+5DdPszdO3ygp5UD7ElRPk2oSsC1Mi0q8u0XPcD
	NBl2z7d3TzzMKRbWoOLqeQWl7h0pkpqPpyBmVto=
X-Google-Smtp-Source: ANB0VdZd6T9GEMDgozaHEzIfCH7hSsyU/LnCT96V4sQLwawDoxxj4aWGrWiBTjOvRfrzFLjiqLmmAjWzU0I/dnK8wGQ=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr2715527qvo.50.1535129108045; 
	Fri, 24 Aug 2018 09:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
	<20180824154822.GK20864@hiutale>
	<CAMKF1sqc6fQhZfSKZ80D2dyHL_D=2hRAS1zMFKScP8MpXgQRbA@mail.gmail.com>
	<20180824161727.GL20864@hiutale>
	<CAMKF1soK8gJP6NNwX3-7EWESEs11czMpi_qt5HBMJXaRp6tXAw@mail.gmail.com>
	<20180824164118.GM20864@hiutale>
In-Reply-To: <20180824164118.GM20864@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 09:44:41 -0700
Message-ID: <CAMKF1spoousQbi6g8_v=O912tSdshm2C7LdUno+XfWbjv=LYUw@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 16:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 9:41 AM <Mikko.Rapeli@bmw.de> wrote:
>
> On Fri, Aug 24, 2018 at 09:23:45AM -0700, Khem Raj wrote:
> > On Fri, Aug 24, 2018 at 9:17 AM <Mikko.Rapeli@bmw.de> wrote:
> > >
> > > On Fri, Aug 24, 2018 at 08:51:42AM -0700, Khem Raj wrote:
> > > > On Fri, Aug 24, 2018 at 8:48 AM <Mikko.Rapeli@bmw.de> wrote:
> > > > > So to me it looks like using SYSTEM with target_include_directori=
es()
> > > > > is no longer possible with CMake and gcc > 6:
> > > > >
> > > > >
> > > > > https://cmake.org/cmake/help/v3.10/command/target_include_directo=
ries.html?highlight=3Dtarget_include_directories
> > > > >
> > > >
> > > > That=E2=80=99s right there is a patch I did  in WebKitgtk recipe in=
 Oe Core you
> > > > might want to include similar fixes for this package the patch actu=
ally it
> > > > a workaround but then I also think using isystem in apps is a bad i=
dea
> > >
> > > Yes, I tend to agree, but developers have used this to silence compil=
er
> > > warnings from system header files.
> > >
> > > In a few cases I saw that there were no longer any warnings coming fr=
om the
> > > headers but in some others there were.
> > >
> >
> > Unlike olden days, cross gcc compiler now a days knows about its
> > system headers and adds them implicitly with right options
> > so doing this include dance manually is not useful. Let compiler
> > decide to do the needed
> > for system headers, one must just specify --sysroot and let it handle
> > everything from sysroot.
> >
> > > Any other ideas how to suppress compiler wanings from system headers?
> > >
> >
> > what kind of warnings do you see ?
>
> After a ton of components have exported their headers to system paths,
> I see all kinds of crap. Some developers have cleaned up their own tree
> and added strict compiler flags, which I now have to relax since
> header file warning suppressions don't work, and new compiler produces
> new bunch of warnings. Here are few sample warnings from an ongoing build
> with counts redacted:
>
> $ egrep -ho "warning: .*" tmp-glibc/work/*/*/*/temp/log.do_compile| sort =
| uniq -c|sort -rn | head -8
>
> warning: dynamic exception specifications are deprecated in C++11 [-Wdepr=
ecated]
> warning: 'template<class> class std::auto_ptr' is deprecated [-Wdeprecate=
d-declarations]
> warning: conversion to 'int' from 'long unsigned int' may alter its value=
 [-Wconversion]
> warning: missed loop optimization, the loop counter may overflow [-Wunsaf=
e-loop-optimizations]
> warning: command line option '-std=3Dc++11' is valid for C++/ObjC++ but n=
ot for C
> warning: this statement may fall through [-Wimplicit-fallthrough=3D]
> warning: ISO C++ forbids zero-size array 'f_handle' [-Wpedantic]
>

Perhaps you can just remove adding these system headers at all and let
compiler include
them for you

> -Mikko

