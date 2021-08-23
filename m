Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.23865.1629725267936779182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hf/T0H1o;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ia27so14835907ejc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iONE3lL7BNI9xamCMFSX2gQeF3Kok5z1AtZ7Dl5fkg0=;
        b=Hf/T0H1oBZLW2Vpj4D4594rD509mMWqZxni5g3Ya4sVOl7/CNVKfSWAGUfp4Xd39IX
         PRJbNpT17YT3QwPFK1Bl2j7WvXDN+i+C6wQxRv4QXzvZRZiMvrKBb2PjWrIw9JjyixVT
         7cBMUcyJS2z7aHu2VQv/bkjTZBqu3iG1MuZQhypWtwCOXDdjDjm3iBPnvW687I4mysaQ
         fSsSh3mpzuF7itF3uCL3yM66BwWKn0N2p1u1v9q06+bVVyBRlBXR4vmNtP3WSmce1iYp
         sAJJWz1uG68UaArCX0atFSRCyrF/H1tMpjnjDY+iZKDDV5ZEnOUDQ78qaKgBQWfYIyfx
         eiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iONE3lL7BNI9xamCMFSX2gQeF3Kok5z1AtZ7Dl5fkg0=;
        b=TmGIiwC0dwo8UkSz7T0I8TAAeaguy33LbBkm66QOzfNWCUtBYGk0vOfXvyS1REHHrZ
         SnxQUylu+9B6TJU6Co0B4X0KUuH32fPfHTrEKALDkuN3ACWZQEdRjhSeql5Mv/IG4PSb
         Iw5VXo8oEJb024DghI+1deP/SddFUdvmdfEShtmI2PiOsf+m+FRh4oFGMBhsLCupnyPV
         bOE3BBBqTvdnDyTRUmUVHoPhdMYP/YarU4RCsi1EGfR22yGpJTkTquExQec+ke4y/Qo/
         2BUEqDVcFU9Yh6S4kaIy2wuTTv+T5CaKjcJzXD9zzYGUZBUQ5RX9uCHQ2s0oJEAuJiIq
         /Y3w==
X-Gm-Message-State: AOAM533EUQtOHfUd2kK5gCoiUzpcs8qNp2UEmMVWsZdNy8Sj60nOEQvI
	LBQXf0sZTYcxdzTMerm6KVZ3fOlLq7diuJiWkNU=
X-Google-Smtp-Source: ABdhPJzU1RJ372zkuWKx7w9b4eSXrDbjp6ytCwPdCovtSDYp50Qp7Hl/eAhZXi5LxyMBq9mhwb3ob/waAsQRFWX7gNE=
X-Received: by 2002:a17:906:eb53:: with SMTP id mc19mr35569886ejb.22.1629725266343;
 Mon, 23 Aug 2021 06:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-4-zboszor@pr.hu>
 <CADkTA4PC3Fi6y+OSFUWSxRgdbFQsc=Vfq4Yv_G86nmatnWirbA@mail.gmail.com> <d780f47b-38a7-a44e-d8a1-3d6dd0a286c5@pr.hu>
In-Reply-To: <d780f47b-38a7-a44e-d8a1-3d6dd0a286c5@pr.hu>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 23 Aug 2021 09:27:35 -0400
Message-ID: <CADkTA4NrgEbv-8qh9gQ0oyKYCsNCmv=hu0OTnC0RnRmvjo4cYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] kernel-module-split.bbclass: Allow opt-out of split kernel modules
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 9:18 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> 2021. 08. 23. 14:55 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> > On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
> > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >>
> >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>
> >> For some use cases, a monolithic kernel-modules package containing
> >> all modules built from the kernel sources may be preferred.
> >> For one, download time is shorter and installation time is faster.
> >>
> >
> > There's still an outstanding issue though. Unless you generate the
> > provides/rdepends along with the monolithic package, any existing
> > rdepends on kernel modules break.
>
> The next patch in the thread does it.

That's what my follow up said ;)

See my second reply though, this gap in functionality created by this
commit, should be documented in the commit that it will be restored in
future ones.

Cheers,

Bruce

>
> >
> > While that likely isn't something you hit in your use case, it would
> > be something that would have to be covered to make this part of core.
> >
> > About 7 years ago, I was most of the way through a similar change,
> > that created on large package with all the rprovides generated (I'm
> > not sure I can track it down now, but I could have a look), since
> > doing an on target update with thousands of kernel module package is
> > very painful.
>
> Well, yes. In our defconfig, about 1500 kernel-module-* subpackages
> were created and had to be upgraded at once. It was *very* painful
> with over 50 minutes to download and upgrade the kernel.
>
> >
> > Cheers,
> >
> > Bruce
> >
> >> Set KERNEL_SPLIT_MODULES=3D"0" for this.
> >>
> >> The default is one subpackage per module.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
> >>   1 file changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/k=
ernel-module-split.bbclass
> >> index 6c1de4c992..a29c294810 100644
> >> --- a/meta/classes/kernel-module-split.bbclass
> >> +++ b/meta/classes/kernel-module-split.bbclass
> >> @@ -28,6 +28,7 @@ do_install:append() {
> >>          install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir=
}/modprobe.d/
> >>   }
> >>
> >> +KERNEL_SPLIT_MODULES ?=3D "1"
> >>   PACKAGESPLITFUNCS:prepend =3D "split_kernel_module_packages "
> >>
> >>   KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME"=
) or "kernel" }-modules"
> >> @@ -156,18 +157,26 @@ python split_kernel_module_packages () {
> >>       kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME") or "kern=
el"
> >>       kernel_version =3D d.getVar("KERNEL_VERSION")
> >>
> >> +    metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> >> +    splitmods =3D d.getVar('KERNEL_SPLIT_MODULES')
> >> +    postinst =3D d.getVar('pkg_postinst:modules')
> >> +    postrm =3D d.getVar('pkg_postrm:modules')
> >> +
> >> +    if splitmods !=3D '1':
> >> +        etcdir =3D d.getVar('sysconfdir')
> >> +        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modpro=
be.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
> >> +        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
> >> +        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
> >> +        return
> >> +
> >>       module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> >>
> >>       module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX=
')
> >>       module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX=
')
> >>       module_pattern =3D module_pattern_prefix + kernel_package_name +=
 '-module-%s' + module_pattern_suffix
> >>
> >> -    postinst =3D d.getVar('pkg_postinst:modules')
> >> -    postrm =3D d.getVar('pkg_postrm:modules')
> >> -
> >>       modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/=
modules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descr=
iption=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursiv=
e=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_n=
ame, kernel_version))
> >>       if modules:
> >> -        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> >>           d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> >>
> >>       # If modules-load.d and modprobe.d are empty at this point, remo=
ve them to
> >> --
> >> 2.31.1
> >>
> >>
> >>
> >>
> >
> >
> >
> >
> >=20
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
