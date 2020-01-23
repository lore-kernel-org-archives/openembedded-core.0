Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 173FA7FD99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:16:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e10so94735edv.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MGfIr4SDLeMksBKKfyVekgECulbRsfCEhYRKQbqS2QQ=;
	b=bFAfw8KtR7dPGBAmZu33uu4TAi+egWMhXaCw+I1TzdN5QMT49pwzrVEDRrsXUbIX+3
	Sim+7qFpwjMApaglIr5dmiliDbxYL4lTKlH8VXf1QjurFa2gv6fFhn224vEq1yTOmPrV
	n+hy/ym84Gjo32A68MlghSqsqvWPf+Vb8gaPs9fonxooNX+iS/1awnXfippRgkdjo4a3
	JPDAiMl6KSPesHGQevSaa85dXHrRlv8G0Amcs6DMlqK4xDftyTqqf7KmupC6Eqq4zaHU
	ejukFoUuwIFGWQ0gsM/cvA15e+033MJhqYlii32pLnlDdyhbV3JZk+jMQ+MyuonsNKxg
	Vlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MGfIr4SDLeMksBKKfyVekgECulbRsfCEhYRKQbqS2QQ=;
	b=aiNeSxysLqOe7mG1EYNV6oia9/DgN6hP2fnXPqxPJxDx104PFO8zUp6afgV2MALr87
	/EtdhRwqWMtoklJ7Onei84mCngCehC6MMS2LXV/IWTPvULKfrkRqiXXQbTssV5EC/7Aq
	5x83/537Kt9PvHVDhmz3fVDV8I5Sg+TZEhmNmI5Uwi2wJDk7so4wH4TkaD3pRqESxZXL
	Osx0gN7D8rGOBiFuaX7nqwxk8ol0oUxO3b5Yvbqe9KPYs6Wxzk3Lv6XUD0apa4VWaFz8
	xLJn3oegMT5vENftZsnk87e9nuhAlHFwcTWHtLl7zNcFP7hfbHRegHHWGpu5ep8lPT1x
	g/9Q==
X-Gm-Message-State: APjAAAUMUC/pXlPvmL3LeXZKY+yHNFdDyYh9do03nD8n/eXbFjE1l9U0
	EFQc//T14JTj2SeJy2qyO3+UlUgP0caDj7wXORw=
X-Google-Smtp-Source: APXvYqxW0G3ebKEaZBV3M+Xp0af6myDrPcZ54JBkXF6DnfA8P9w0ir9gUEt9AiMTVaa2BWlrtoI0jgBFf0W7mrfAMqs=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr57334edr.164.1579817761743;
	Thu, 23 Jan 2020 14:16:01 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<20200123220536.GE4735@denix.org>
In-Reply-To: <20200123220536.GE4735@denix.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Jan 2020 17:15:50 -0500
Message-ID: <CADkTA4PCLSP1eBSLcS4iLUhok=UOzBD2BAXTnzjf5C0pXPn9ZQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 23 Jan 2020 22:16:01 -0000
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

It hasn't been there that long, and I was talking to Jon about it at
the various conferences late last year, otherwise, I wouldn't have
known either.

> What triggered this submission is that we have our own variant in meta-ti and
> Joshua Watt was adding a very similar one to meta-rockchip:
> https://lists.yoctoproject.org/g/yocto/topic/70054501#48116
>
>
> > What's the delta between the two ?
>
> Hmm, that one uses older 2.1 version. Other than that, I'll need to test to
> see if it's as adaptable and expandable as our more simplistic variants...

Sounds like a good plan.

Cheers,

Bruce

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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

