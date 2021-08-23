Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.24020.1629725928412242375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RJ/KyCXc;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id w5so37124832ejq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UubyVI2G1wSMzcD985oyv8WU7o+0y4ETKnrU7U254vA=;
        b=RJ/KyCXcWADPjJPnlkuFqLWGi6c1TiavCvWwquFFMIDpAiWqdCoVu90rAJIcjvyPl6
         qrmmb7BFcRq1bCPBXvi4wYdhmzpD0pNkoiAdw18SPkfQcvhp9Y0gz5krl5QSrBZjYK5X
         yWeb6fJKnVaR+//21mU60yFN4E6zQY5CLtm8yTx0HX8lL5k84RhKZmDpPialTNvmRGtb
         zalMLGYjeJiEKNlarrtLzGYghhY90aLT9T16NSl5RpxFIzhT13ePEtRgUsNh1Tr8F0r2
         qD0AzQPTwbv52VGh+AZeYxELj772JQYYSZAwpTvPIlKGBVXhk/XQAZL8zbmOB7o1PgiW
         CItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UubyVI2G1wSMzcD985oyv8WU7o+0y4ETKnrU7U254vA=;
        b=I/hiby7bkBDsK9FVKBbsQFdoqlh969Nm+IHra4FYXz4AheR8WsIrXBhB067HVsHWh2
         pn3068ai0nHriFeKWh+hkNNOhF0tn0kd4J9kPb3LiztXDZ3Phe6E7ocKny1qjW9XoAkf
         rpfFx9PlShMYXphcjd8kQKJL3OPtcJGR46B+AN9cJcgpvUeqgDl6psFDmOKyMrhLdGJC
         IFliviYDnwYESIMvGaLATmgnUmHC7xf4CaCpN1JL0xeEjkfcxAhqANTJCUHwIfkiLblT
         PSVqT4vSzFtTT1qc5H2P1+v3kOV7l0xpvTTjSrIKSr2zURQohCaOus+1xGB8oZafi3AB
         ZFfg==
X-Gm-Message-State: AOAM531uEw54PTU2VDF3pJZHg6KI/0PLZPmWX6tgk2G7TWN4yIofL9O1
	Ii7vyVu71mnnvIEtSfrOLHDIRQCgjofKP3WwH64=
X-Google-Smtp-Source: ABdhPJzE0LvxlIng081LeSL18XB5hsdbmFDmACeFjFUtgftXfvghZeumOsFBOmfrSXSCzIQKS9okmHTJC8AEJbe5/PM=
X-Received: by 2002:a17:906:f298:: with SMTP id gu24mr35993863ejb.334.1629725926924;
 Mon, 23 Aug 2021 06:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-6-zboszor@pr.hu>
 <CADkTA4NwEYtyROR_DDC=mK=7UCRR7eYeLi=KTEHBuc8-z9u7FA@mail.gmail.com> <9c84e9ba-6661-c23f-eca0-06845f7a6d21@pr.hu>
In-Reply-To: <9c84e9ba-6661-c23f-eca0-06845f7a6d21@pr.hu>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 23 Aug 2021 09:38:35 -0400
Message-ID: <CADkTA4NbBHutpYeYte6dh1BjjPHSGF4KBvG4XV_PO8tARDXHtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] kernel.bbclass: Use full versions for inter-package dependencies
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 9:30 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> 2021. 08. 23. 15:03 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> > On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
> > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >>
> >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>
> >> Some Yocto users do use package repositories and sometimes the PR
> >> value is forgotten. Use full versions for inter-package dependencies
> >> for the kernel subpackages.
> >
> > Can you expand this commit message ?
>
> I will send a new version with the expanded message.
>
> > What is the observable problem
> > with the full versions not being in the rdpends ?
>
> Currently the kernel creates such subpackages:
>
> kernel
> kernel-x.y.z
> kernel-image-x.y.z
> kernel-image-bzimage-x.y.z
> kernel-modules-x.y.z
>
> and in the split modules case, a lot of
>
> kernel-module-*-x.y.z
>
> RDEPENDS currently only references the package names.
>
> The issue I observe is this: I have enabled kernel module signing
> but I don't provide a key, so the kernel will generate one at
> every rebuild.
>
> You get the idea what problem this can make if there's a
> rebuild:
>
> x.y.z-r0.0 -> x.y.z-r1.0 (in which case the PR value was duly changed)
> or
> x.y.z-r0.0 -> x.y.z-r0.1 (where not)
>
> It's actually indifferent, but the same issue occurs if
> only the kernel-image-bzimage is upgraded: the modules either
> won't work or taint the kernel.

Your second example is similar to the times I've seen some module
issues as well, and honestly, I can't recall if it was solved in a
similar way to this (I don't have access to my old repos from Wind
River any more).

But that does make sense to me, and the details you have in this
follow up, make a nice commit explanation.

While opkg may not handle the situation you describe as well as RPM,
we should make sure that the full version doesn't cause issues with
the package generation or standard image creation.

Cheers,

Bruce

>
> This scenario is currently valid in the package manager because
> of the versionless RDEPENDS.
>
> >
> > I've run many different package feeds with different kernels and
> > modules, and haven't run into anything on this front, in my experience
> > the extended version in the package depends/provides causes issues
> > with some package managers .. so we'd need the testing for this
> > documented/provided so we could ensure that there are no hidden
> > issues.
> >
> > Bruce
> >
> >
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta/classes/kernel.bbclass | 13 +++++++------
> >>   1 file changed, 7 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index 6dc5387a9b..9ec7daa17a 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -91,17 +91,18 @@ python __anonymous () {
> >>       kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
> >>       imagedest =3D d.getVar('KERNEL_IMAGEDEST')
> >>
> >> +    fullver =3D d.getVar('EXTENDPKGV')
> >>       for type in types.split():
> >>           if bb.data.inherits_class('nopackages', d):
> >>               continue
> >>           typelower =3D type.lower()
> >>           d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
> >>           d.setVar('FILES:' + kname + '-image-' + typelower, '/' + ima=
gedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + =
type)
> >> -        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s' % (kn=
ame, typelower))
> >> +        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (=3D %=
s)' % (kname, typelower, fullver))
> >>           splitmods =3D d.getVar("KERNEL_SPLIT_MODULES")
> >>           if splitmods !=3D '1':
> >> -            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules' % =
kname)
> >> -            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), =
' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
> >> +            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (=
=3D %s)' % (kname, fullver))
> >> +            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), =
' %s-modules-${KERNEL_VERSION_PKG_NAME} (=3D %s)' % (kname, fullver))
> >>               d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_=
VERSION_PKG_NAME}' % kname)
> >>               d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-=
${KERNEL_VERSION_PKG_NAME}' % kname)
> >>
> >> @@ -628,12 +629,12 @@ FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> >>   FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* /boot/Module=
.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/$=
{KERNEL_VERSION}/build"
> >>   FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux-${KERNEL_VER=
SION_NAME}"
> >>   FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> >> -RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
> >> +RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D=
 ${EXTENDPKGV})"
> >>   # Allow machines to override this dependency if kernel image files a=
re
> >>   # not wanted in images as standard
> >> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-ima=
ge"
> >> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-ima=
ge (=3D ${EXTENDPKGV})"
> >>   PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-$=
{@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> >> -RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('=
KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
> >> +RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('=
KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EXTEND=
PKGV})', '', d)}"
> >>   PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legit=
imize_package_name(d.getVar('KERNEL_VERSION'))}"
> >>   RPROVIDES:${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-$=
{KERNEL_VERSION}"
> >>   ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
> >> --
> >> 2.31.1
> >>
> >>
> >>=20
> >>
> >
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
