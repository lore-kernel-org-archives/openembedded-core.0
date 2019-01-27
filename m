Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7290F7C3EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 07:16:16 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id l10so9649472lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 23:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n3S8BO3x37I+EjGtnQmxFE4xAxU8mrLAGcQnWh/ZI8c=;
	b=jGMlGJDBbUCpXJMKX17/W3bE6myCz8m0hbdWa29xHbOCHsOiXhx/d5WHCp025ia6G7
	5HY3CJjIvGvZg/Q5KS2WaMVfHPRpPW8g0WRgVxzx8biNlH8qCU5NRskNllMA9ekKfTs2
	1vH3K54wIfXHmxUJlg9koVidg6BsTiZTHndbv4QJ66ewF9dCEyHpcaHxAB56DXxX8lJF
	lhC1CpkdEVGNIgYcv9UgBv3kxPS6fcQQC0y89omp1VVY+4yo4jATJUKbxKFwb6Y7SQJR
	1UnMGYIoQ5wbxJWM1pVxsBC27/PWx9ZA+MMc7iDi3/bt43iwbXgJH+gWuvMNWyzK35VV
	VrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n3S8BO3x37I+EjGtnQmxFE4xAxU8mrLAGcQnWh/ZI8c=;
	b=oOIPV4E9aHv4Y2Xotc7/elZOw2deJRrl0E1Lyv2xvLuOx4PgxmuW9IDZmw1fXERAhN
	6bTdS3/ZLyH63DwIA7tD8lTy5DAIJFLMlqKy5ZdyrG/st8VX9Se/thoQyFbCXB+my2ns
	PZZ9GBvMWN11gT+4RvFoIUaBNSTZB72zTZDjg456j57eGfklE+4pKMlWpkdUtFLOS6g9
	nJKDR2D6m8JalmDC6TjXRiJOmywEPAdyQ90fy2geohxUjkBS9un6Q0aSbpAkAILDo4Yh
	16+7b7Q31RLEOD+O6zxJbct3c1gAp9qsVmmDHCXoWHzdT4d1ditxr+wl/La1kguIIBRf
	vXBw==
X-Gm-Message-State: AJcUukfBCJtllYshiPVeYlCyb3DhCuAOtBuVFSfk/ChaSzKSoii+dusk
	fGIiK6vUMlAVlfpJpR2ZKbFG6kwi86dhOhlrJ1c=
X-Google-Smtp-Source: ALg8bN6Hdw1GLycBfzrxZJeH9FhcHSq4lmO4smfXVCq4nCQkA1sG4foBzlIdfMr0TLy5m6VoLcMOQkWm/UTJOi4CYP0=
X-Received: by 2002:a19:ef15:: with SMTP id n21mr13211740lfh.21.1548573376503; 
	Sat, 26 Jan 2019 23:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20190124223528.17455-1-alistair.francis@wdc.com>
	<30ebcccb5a7b406952657c5c6d031640e5f60a0a.camel@linuxfoundation.org>
	<CAMKF1sqCmskU=GmzXvHXVufnqdSieWmN8xvC4n9axNgL9GeM-g@mail.gmail.com>
In-Reply-To: <CAMKF1sqCmskU=GmzXvHXVufnqdSieWmN8xvC4n9axNgL9GeM-g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 26 Jan 2019 23:15:48 -0800
Message-ID: <CAKmqyKNGxQuHsKndq9tNDNj8jmYdhBWHnaqM8Rc2h5OeZM_bZQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sun, 27 Jan 2019 07:16:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 26, 2019 at 5:11 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Jan 26, 2019 at 3:27 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2019-01-24 at 22:35 +0000, Alistair Francis wrote:
> > > I don't see circular dependencies anymore between libusb1 and udev,
> > > so
> > > enable udev support for libusb1.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-support/libusb/libusb1_1.0.22.bb | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > index 0c6e116dd7..35c1d705b6 100644
> > > --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > > @@ -20,9 +20,10 @@ S = "${WORKDIR}/libusb-${PV}"
> > >
> > >  inherit autotools pkgconfig ptest
> > >
> > > -# Don't configure udev by default since it will cause a circular
> > > -# dependecy with udev package, which depends on libusb
> > > -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> > > +PACKAGECONFIG ??= "udev"
> > > +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> > > +
> > > +EXTRA_OECONF = "--libdir=${base_libdir}"
> >
> > Fails in testing with:
> >
> > WARNING: Nothing PROVIDES 'nativesdk-udev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS on or otherwise requires it). Close matches:
> > WARNING: Nothing PROVIDES 'udev-native' (but virtual:native:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb DEPENDS on or otherwise requires it). Close matches:
> > WARNING: Nothing RPROVIDES 'nativesdk-libusb1-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb RDEPENDS on or otherwise requires it)
> > WARNING: Nothing RPROVIDES 'nativesdk-libusb1' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/libusb/libusb1_1.0.22.bb RDEPENDS on or otherwise requires it)
> >
>
> I am seeing these fails too
>
> > Before someone sends a patch creating a nativesdk-udev please think
> > very carefully about whether a nativesdk-udev makes sense and what it
> > may need to look like.

What about just disabling the packageconfig for nativesdk? Would that
be a better option?

Alistair

>
> >
> > Cheers,
> >
> > Richard
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

