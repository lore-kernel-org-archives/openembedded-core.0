Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id CAFEF7FDDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:27:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z193so3594327iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Be8BTw8/rsr8G08OxalrGjLDui4Ml2qqBfmIBJVcVpg=;
	b=EIsjN+cDTm9TrPabqjSnHUR9aaLz4XT1b9DfrHjkLNMyisPytwyon0YQG5n/fUoLnz
	MZnxUf0XP6vKhHJ20Nmp1A2ayvONUgrMJernSycJ3bcfMg05Xu2LoljEaIym/dH6hJVF
	ERupIBqzniZD+e5C2H2jffzV5gp5fqUPqJVh+E5RpYu6veSxuNIdrzXIrekvbJDhVz+e
	j7nvpdrOnt9EP2rWL9o2fBWe7S2lIbA/nJjnQX0G4BnTSzl699gubFFO+T/TTU85KE+1
	123nMSnvu5rU1h+JefH0W+hMI0t3YSLIybO0aymT5LVkqZMANFvXxkS5sSz9Ye+K+FJV
	23IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Be8BTw8/rsr8G08OxalrGjLDui4Ml2qqBfmIBJVcVpg=;
	b=iYwKPBoxibIgzQvsScZnWsn44Q5PJ2mol340ib+SbPAMKxsvXvz+ILaYChi33cvrB7
	qVMM7jhXAZ+Ugw4vbuoiSUu7tnYK76892lqr1H5kTYhlnqO1R/RXSWwZLiyXyOmOLPPQ
	6DFB4lZQ1voxvqX3Wb4ywZiialgj/9kNUw/E3uLH7sUYfrQ+88Ms5suBaNR9YuoiAR3q
	m/Ojv9ugLRlJeYaMrSGnYt3mPU1+RIv3v1/icjWe2IYRgAp0Azkl2K5AdxbAGNJxvhZk
	wpvU7DK6biKMNRVSMRfORJz+PkiZJTHhfTnwmrcGCt/UwM6qa0QjemzN2LRCHFhb6+3e
	AC6w==
X-Gm-Message-State: APjAAAUkCx8aOJ0Ak+vmVPqWYzkxy8wIjeKTzoLzlWGKr2SyezY4eP8u
	yy67r0w+vQ11Odf9RP4fDmFygThGRF0qf4jIN5rSiw==
X-Google-Smtp-Source: APXvYqzrZHUAZkMqVRy9r6cnTv1VAeYSoaEzMTC2c91W3zMWJLQ/ghf9Y30gXPlqNbWKlhADTvdrh/lPNmxyOsYX60g=
X-Received: by 2002:a6b:e803:: with SMTP id f3mr4152071ioh.49.1579904828790;
	Fri, 24 Jan 2020 14:27:08 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
	<CADkTA4PCLSP1eBSLcS4iLUhok=UOzBD2BAXTnzjf5C0pXPn9ZQ@mail.gmail.com>
In-Reply-To: <CADkTA4PCLSP1eBSLcS4iLUhok=UOzBD2BAXTnzjf5C0pXPn9ZQ@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 17:26:58 -0500
Message-ID: <CAPoiz9xRT1qffL_QGzMrR+AibTVwH7OSS+sbyPZbRGLEq+wcrw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jon Mason <jdmason@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 22:27:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 5:16 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Jan 23, 2020 at 5:05 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> > > On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > > > To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > > > add an upstream reference implementation to openembedded-core, which can be
> > > > customized by BSPs, if needed.
> > >
> > > Isn't this one of the things that Jon Mason is trying to
> > > standardize/support in meta-arm ?
> > >
> > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> >
> > Ah, interesting, somehow I totally missed that one! :)
> >
>
> It hasn't been there that long, and I was talking to Jon about it at
> the various conferences late last year, otherwise, I wouldn't have
> known either.

Getting this meta layer and recipe took longer than I was expecting.
So, I've been talking about it for months in anticipation of it coming
out, but it was only properly public at the beginning of this month.
So, not that it is, I can start badgering people to start using it
instead of recreating the wheel.  :)

Thanks,
Jon


>
> > What triggered this submission is that we have our own variant in meta-ti and
> > Joshua Watt was adding a very similar one to meta-rockchip:
> > https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
> >
> >
> > > What's the delta between the two ?
> >
> > Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> > see if it's as adaptable and expandable as our more simplistic variants...
>
> Sounds like a good plan.
>
> Cheers,
>
> Bruce
>
> >
> > --
> > Denys
> >
> >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  .../arm-trusted-firmware_2.2.bb                    | 55 ++++++++++++++++++++++
> > > >  1 file changed, 55 insertions(+)
> > > >  create mode 100644 meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > > >
> > > > diff --git a/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > > > new file mode 100644
> > > > index 0000000..3079a70
> > > > --- /dev/null
> > > > +++ b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > > > @@ -0,0 +1,55 @@
> > > > +SUMMARY = "ARM Trusted Firmware"
> > > > +DESCRIPTION = "ARM Trusted Firmware provides a reference implementation of \
> > > > +Secure World software for ARMv8-A, including Exception Level 3 (EL3) software. \
> > > > +It provides implementations of various ARM interface standards such as the \
> > > > +Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
> > > > +(TBBR) and Secure monitor code."
> > > > +HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
> > > > +
> > > > +LICENSE = "BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> > > > +
> > > > +inherit deploy
> > > > +
> > > > +DEPENDS = "dtc-native openssl-native"
> > > > +
> > > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +B = "${WORKDIR}/build"
> > > > +
> > > > +BRANCH = "master"
> > > > +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=http;branch=${BRANCH}"
> > > > +SRCREV = "a04808c16cfc126d9fe572ae7c4b5a3d39de5796"
> > > > +
> > > > +ATF_BINARY ??= "bl31"
> > > > +ATF_SUFFIX ??= "bin"
> > > > +ATF_TARGET ??= "all"
> > > > +
> > > > +CFLAGS[unexport] = "1"
> > > > +LDFLAGS[unexport] = "1"
> > > > +AS[unexport] = "1"
> > > > +LD[unexport] = "1"
> > > > +
> > > > +do_configure[noexec] = "1"
> > > > +
> > > > +EXTRA_OEMAKE = '-C ${S} BUILD_BASE=${B} DEBUG=0 CROSS_COMPILE="${TARGET_PREFIX}" \
> > > > +               PLAT="${ATF_PLATFORM}" TARGET_BOARD="${ATF_BOARD}" ${PACKAGECONFIG_CONFARGS}'
> > > > +
> > > > +do_compile() {
> > > > +       oe_runmake ${ATF_TARGET}
> > > > +}
> > > > +
> > > > +do_install() {
> > > > +       install -d ${D}/boot
> > > > +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${D}/boot/
> > > > +}
> > > > +
> > > > +do_deploy() {
> > > > +       install -d ${DEPLOYDIR}
> > > > +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${DEPLOYDIR}/
> > > > +}
> > > > +addtask deploy before do_build after do_compile
> > > > +
> > > > +FILES_${PN} = "/boot"
> > > > +SYSROOT_DIRS += "/boot"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

