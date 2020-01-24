Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4C57FDDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:24:43 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c16so3566582ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=anjPDiDWR+6jRYrNwrouv6vN/+eDHWkoNUyGmC6tnso=;
	b=GAnXQbuKLQAKFsl1ky5sQPb93S2LpIVFbq+WSbSRk3KF+S5GbF2y2yoQOnBi5BoBwU
	l4WAYLIAUgRE1uKG8DkHftV0QB2lxKGwfl7RuSVLcRN6wi9wKbf+jOEBhLF/n6JsRNSD
	6TyocW1jiIZBTikbCgBMG/zHVNwfIR462GDJ0yrJYQhasskxm/jEEjFVGEdP6KXaBK+1
	u7JKdD2NYl/qVJRYe8qR+EUkxALuY+OIsYm7hQLSF1GSSND3m8zYRcJMKtk0GOtucNaZ
	HIGCOdHTtW2W5RJRmxQho0zcoAyI0+VDbWx8QleNe4n8bOG7HWaKKwnWsd6DFLQT6wVQ
	5hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=anjPDiDWR+6jRYrNwrouv6vN/+eDHWkoNUyGmC6tnso=;
	b=ZLye32FrT2ROpi8DrITgdFa7/k2p/3b/OTnGUpFRkvHlRQ0VZk8WeD2zWfYg3n2YNV
	jIerl/O+aQmSeJaG5iC9ODGb/NKlaY6LAMSZ6uWDnGnPcl9ZIm7mDFpxw7iuXxrMgkaB
	SPRywueL4JAPkfULfSyOZvSnxLmRf1cbzBG61+/zEkQCBaYDpSxsE9zBvkR+88nTZRgq
	JgK1LEdXy807kUJhcArTfUOFsZHjA2MsVdCTnevPUI1rtFwqvLx/6b32XNy4Qu8S69ek
	FY47B5d7y0RlCYR8iTH/pBeCjDj0Je9gOxOWGhSFnhp2P4WTimAcIf1uWxT9ZhnmkFvT
	STsA==
X-Gm-Message-State: APjAAAVFROGkLvEH+h9LDtHjf/fuIUatA6LXPWhLCKf2b+NdRmqR+0+K
	syBihsnU72LFe5IJGdKch94USkPhADkNL69Erdxm5w==
X-Google-Smtp-Source: APXvYqy66fPktPAB+19wK3DKxY0koK9RwQGGhbDFP1CEgAT5rcivUF2fzRpkcPRaJcOAA6EjkoJqrG3qkep8O4jDZGc=
X-Received: by 2002:a6b:e803:: with SMTP id f3mr4143875ioh.49.1579904684053;
	Fri, 24 Jan 2020 14:24:44 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
In-Reply-To: <20200123220536.GE4735@denix.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 17:24:32 -0500
Message-ID: <CAPoiz9xqwwxdfAKMoadh7ER-XcrLfZwXLyR55hx3uNU1f=pavA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Fri, 24 Jan 2020 22:24:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 5:05 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> > On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > > To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > > add an upstream reference implementation to openembedded-core, which can be
> > > customized by BSPs, if needed.
> >
> > Isn't this one of the things that Jon Mason is trying to
> > standardize/support in meta-arm ?
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
>
> Ah, interesting, somehow I totally missed that one! :)
>
> What triggered this submission is that we have our own variant in meta-ti and
> Joshua Watt was adding a very similar one to meta-rockchip:
> https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
>
>
> > What's the delta between the two ?
>
> Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> see if it's as adaptable and expandable as our more simplistic variants...

These work for the BSPs we have internally, but we are very open to
patches to make the recipes better :)

I believe someone inside Arm is working on v2.2 recipes.  I don't have
anything queued for it.  So I'll ask around to verify.

Thanks,
Jon

>
> --
> Denys
>
>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  .../arm-trusted-firmware_2.2.bb                    | 55 ++++++++++++++++++++++
> > >  1 file changed, 55 insertions(+)
> > >  create mode 100644 meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > >
> > > diff --git a/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > > new file mode 100644
> > > index 0000000..3079a70
> > > --- /dev/null
> > > +++ b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > > @@ -0,0 +1,55 @@
> > > +SUMMARY = "ARM Trusted Firmware"
> > > +DESCRIPTION = "ARM Trusted Firmware provides a reference implementation of \
> > > +Secure World software for ARMv8-A, including Exception Level 3 (EL3) software. \
> > > +It provides implementations of various ARM interface standards such as the \
> > > +Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
> > > +(TBBR) and Secure monitor code."
> > > +HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
> > > +
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> > > +
> > > +inherit deploy
> > > +
> > > +DEPENDS = "dtc-native openssl-native"
> > > +
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +B = "${WORKDIR}/build"
> > > +
> > > +BRANCH = "master"
> > > +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=http;branch=${BRANCH}"
> > > +SRCREV = "a04808c16cfc126d9fe572ae7c4b5a3d39de5796"
> > > +
> > > +ATF_BINARY ??= "bl31"
> > > +ATF_SUFFIX ??= "bin"
> > > +ATF_TARGET ??= "all"
> > > +
> > > +CFLAGS[unexport] = "1"
> > > +LDFLAGS[unexport] = "1"
> > > +AS[unexport] = "1"
> > > +LD[unexport] = "1"
> > > +
> > > +do_configure[noexec] = "1"
> > > +
> > > +EXTRA_OEMAKE = '-C ${S} BUILD_BASE=${B} DEBUG=0 CROSS_COMPILE="${TARGET_PREFIX}" \
> > > +               PLAT="${ATF_PLATFORM}" TARGET_BOARD="${ATF_BOARD}" ${PACKAGECONFIG_CONFARGS}'
> > > +
> > > +do_compile() {
> > > +       oe_runmake ${ATF_TARGET}
> > > +}
> > > +
> > > +do_install() {
> > > +       install -d ${D}/boot
> > > +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${D}/boot/
> > > +}
> > > +
> > > +do_deploy() {
> > > +       install -d ${DEPLOYDIR}
> > > +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${DEPLOYDIR}/
> > > +}
> > > +addtask deploy before do_build after do_compile
> > > +
> > > +FILES_${PN} = "/boot"
> > > +SYSROOT_DIRS += "/boot"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

