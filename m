Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id DB3A17C30A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:36:19 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id x85-v6so6737685ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 14:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CMreNl51spWtt3Tq2dsGRCFJ/FXaQhrTukcymkeGqfQ=;
	b=khrkDRJHBTsz5d74V8/TJnBvFqq26GcNS0EQAKOdMZrIjhIVm1EDVEobhflTznkSyH
	Vk8m4GbG9RAyD2iwUZT6GM4M3YlYuR5V3H1cX88m9WThwS77eeyvretn3l41Yxs46bSF
	EE6SwyQdjPvTliJwp8oTVoFhnMk+t8dh7WRb5Xa+opPt5ZCd3q9Om/4qWnIurM5YZotL
	HJ7GJFGosbdeu+bxG9TX4BFlY8Jhl7QA+y+V9xCFOwAqK/EJ+cJkpVfWS3uATIgMnMKn
	JHJAC8WlYUIqbzU6fOrAAss+AnzbLwmF/6rE+Gb+O1yAPvSR0eh4qNO91pZPDdCyMDp0
	4GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CMreNl51spWtt3Tq2dsGRCFJ/FXaQhrTukcymkeGqfQ=;
	b=uPj2rHOrxwUN6eLrOer+R6DSX/RMtpsOeDgy3IJwv0Pc+RK0TwyeJ3QUdtS+iFNOmi
	XRpc/c8hPdQw9vE6XP4xoP00/7R49HCG0LS/jlZu05M76dKrLziTrActagwtRmBO2Hq4
	+z88nfLcM5fH4GuSQGDau4qQjSn6cuaYFLqWjVxlYQwmKFMlik86XxgBWS2nZFjN4ug9
	lA/y56hkqjuDcgUIOj0BU3jB4qiaG1SVBKYM97JAwoFO3i9aZGjrYANkajFAQe7kgr4A
	H5tjpW7GW3bp/7Te8W7p8PIQ/MtGXqKTG6URb6FD156OiXr6iqdRfN0hNliiX1acsKtp
	JloA==
X-Gm-Message-State: AJcUukc95SHSQfuaKM1e6AkhJZ0VZRBQZGtUb08RavRiQn+GXydizGW1
	rwN6Wxloki8CHEyyr49uTEC9rtutfw3904MsfYM=
X-Google-Smtp-Source: ALg8bN5y6YY1U0mWGeNu9RKaw/JfxTp3Mi1Eh8NsvdecHHgSl6m8Ebz2xQuQ4KYvuCkpNfPGY/dt3EoeLUCcNV1SV9g=
X-Received: by 2002:a2e:9457:: with SMTP id o23-v6mr7008118ljh.7.1548369380391;
	Thu, 24 Jan 2019 14:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20190124220816.6193-1-alistair.francis@wdc.com>
	<42a56aea5450286e3172f5c88b8025ef21aecde7.camel@linuxfoundation.org>
In-Reply-To: <42a56aea5450286e3172f5c88b8025ef21aecde7.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Jan 2019 14:35:53 -0800
Message-ID: <CAKmqyKMAP=uHOwjJMq9o6Ws-LtbnHdrJ1T4KhPkR7KT98HcWEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lubusb1: Add udev support
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
X-List-Received-Date: Thu, 24 Jan 2019 22:36:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 24, 2019 at 2:12 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-01-24 at 22:08 +0000, Alistair Francis wrote:
> > I don't see circular dependencies anymore between libusb1 and udev,
> > so
> > enable udev support for libusb1.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-support/libusb/libusb1_1.0.22.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > index 0c6e116dd7..9d1b8f4abb 100644
> > --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> > @@ -3,6 +3,8 @@ HOMEPAGE = "http://libusb.sf.net"
> >  BUGTRACKER = "http://www.libusb.org/report"
> >  SECTION = "libs"
> >
> > +DEPENDS = "udev"
> > +
> >  LICENSE = "LGPLv2.1+"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> >
> > @@ -20,9 +22,7 @@ S = "${WORKDIR}/libusb-${PV}"
> >
> >  inherit autotools pkgconfig ptest
> >
> > -# Don't configure udev by default since it will cause a circular
> > -# dependecy with udev package, which depends on libusb
> > -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> > +EXTRA_OECONF = "--libdir=${base_libdir}"
>
> Might as well turn this into a PACKAGECONFIG:
>
> PACKAGECONFIG ??= "udev"
> PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>
> or something like that anyway :)

Ok, v2 sent!

Alistair

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

