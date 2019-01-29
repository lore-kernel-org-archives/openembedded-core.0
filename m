Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 32C5F6011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 22:56:49 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q2-v6so19014733lji.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 14:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dmAhU9rEo2OIbYLjfxusCF7ni6WUKS7kleJHkQb6Om8=;
	b=rrx793+V94ycuoO2yDG+NhnFKm5gLgHQyzztjhLqwXJyTBFgCkkSEq22f4eicEcGO5
	ZgIbg2+9ztBAusa8W8ekdSvToZgUvVbTy/AhBYaAIT7XM7oZBGYzJh1dM4BUPxuqZgPh
	moo57lmhyewvuiKxfctJDHM/BhtYeJd+XgGlY/vT5grhXBnS7z5cMbBASgN1VtlyNw7r
	Y8xc+EBjCSKLMTu9rUwJ9WiIjfSseQQduxBmxpXWsUfwQkcqiKfL+WtHcI6GYaxwgUBL
	NazA2wYpenxvayqIiO3nP0aiQPh8xOef+M/xin5W8t9MbbtyLv8AU1Vc3tFjqkPVHQcJ
	Nw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dmAhU9rEo2OIbYLjfxusCF7ni6WUKS7kleJHkQb6Om8=;
	b=Tp02DtYAleq5n6lEdeNBn+DoId1TCBTAoZMPYva3QP0DghkfOKlLVMitxa+SSbcPZL
	vB2LnnFJLpa5surXavOMWo/17SwX18oLdKrhlJiw9/IHLEyoxOd90hT/NFIMHJUDHpZc
	YvEXunbRRn642GTcpx2jRhI+pckrX/MItNy+nRTI3jNpJelm7VRHSC+Ne3sC/UjmLIrG
	54U0Cz1YsgfpsFgxuncSqgykeMh4MJJjoF2Ig/4tgSxQqfSU8rck7s9Ez/dAGwqkFwpU
	E0QlUBEfoEGlTqW99TWoCFyAba1uG5H/IksWuignAyikbpTMfSjCGM3DVEUOApqtATvy
	Ur+A==
X-Gm-Message-State: AJcUuke98C6ZJNUledj78Q2ZuTlFZi6/OLs00Npct9Vl+sLiIBid8gcH
	0/LD31GEPyuDLQvEjXHaLG6mH4h9TA2oCNK4LnA=
X-Google-Smtp-Source: ALg8bN4Avgc15Ku2OG3KYCa8TQT5H5y4AHSGKqZXMLHSErdVjanfZzeN7pvm+yHt6FyPu/yKdZQtlErarwvBjJL/qVU=
X-Received: by 2002:a2e:484:: with SMTP id a4-v6mr21676928ljf.27.1548802609685;
	Tue, 29 Jan 2019 14:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20190124223528.17455-1-alistair.francis@wdc.com>
	<30ebcccb5a7b406952657c5c6d031640e5f60a0a.camel@linuxfoundation.org>
	<CAMKF1sqCmskU=GmzXvHXVufnqdSieWmN8xvC4n9axNgL9GeM-g@mail.gmail.com>
	<CAKmqyKNGxQuHsKndq9tNDNj8jmYdhBWHnaqM8Rc2h5OeZM_bZQ@mail.gmail.com>
	<065b814a6d339bfc054b24fe8199044e6747e337.camel@linuxfoundation.org>
In-Reply-To: <065b814a6d339bfc054b24fe8199044e6747e337.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 29 Jan 2019 14:56:21 -0800
Message-ID: <CAKmqyKNfMSgnb8wpaS2BDE2ojOEC2ETPqHqednU63N307DWTtg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lubusb1: Add udev support
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
X-List-Received-Date: Tue, 29 Jan 2019 22:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 27, 2019 at 4:07 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-01-26 at 23:15 -0800, Alistair Francis wrote:
> > On Sat, Jan 26, 2019 at 5:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > On Sat, Jan 26, 2019 at 3:27 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Thu, 2019-01-24 at 22:35 +0000, Alistair Francis wrote:
> > > > > I don't see circular dependencies anymore between libusb1 and
> > > > > udev,
> > > > > so
> > > > > enable udev support for libusb1.
> > > > >
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > > b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > > index 0c6e116dd7..35c1d705b6 100644
> > > > > --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > > +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > > @@ -20,9 +20,10 @@ S = "${WORKDIR}/libusb-${PV}"
> > > > >
> > > > >  inherit autotools pkgconfig ptest
> > > > >
> > > > > -# Don't configure udev by default since it will cause a
> > > > > circular
> > > > > -# dependecy with udev package, which depends on libusb
> > > > > -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> > > > > +PACKAGECONFIG ??= "udev"
> > > > > +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> > > > > +
> > > > > +EXTRA_OECONF = "--libdir=${base_libdir}"
> > > >
> > > > Fails in testing with:
> > > >
> > > > WARNING: Nothing PROVIDES 'nativesdk-udev' (but
> > > > virtual:nativesdk:/home/pokybuild/yocto-worker/a-
> > > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS
> > > > on or otherwise requires it). Close matches:
> > > > WARNING: Nothing PROVIDES 'udev-native' (but
> > > > virtual:native:/home/pokybuild/yocto-worker/a-
> > > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS
> > > > on or otherwise requires it). Close matches:
> > > > WARNING: Nothing RPROVIDES 'nativesdk-libusb1-dev' (but
> > > > virtual:nativesdk:/home/pokybuild/yocto-worker/a-
> > > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > RDEPENDS on or otherwise requires it)
> > > > WARNING: Nothing RPROVIDES 'nativesdk-libusb1' (but
> > > > virtual:nativesdk:/home/pokybuild/yocto-worker/a-
> > > > quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > > RDEPENDS on or otherwise requires it)
> > > >
> > >
> > > I am seeing these fails too
> > >
> > > > Before someone sends a patch creating a nativesdk-udev please
> > > > think
> > > > very carefully about whether a nativesdk-udev makes sense and
> > > > what it
> > > > may need to look like.
> >
> > What about just disabling the packageconfig for nativesdk? Would that
> > be a better option?
>
> Probably easier but what functionality are we missing out on in libusb
> and do we need it? This might limit the functionality of tools in the
> SDK?
>
> That said, we've been without this so far so you have to wonder how
> useful it is even on target...

It helped me with some debugging, but in the end I don't think (I
haven't checked) that I actually need it. Still it does seem useful to
have.

Alistair

>
> Cheers,
>
> Richard
>
>

