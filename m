Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.23697.1629725755904231649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IIqxpmIk;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id dm15so1207712edb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RBlBi+ML9cd6QAStjlDlvq5VTxo2J4WiJF4C2mnkQQM=;
        b=IIqxpmIkI23sqiKSeNE2hVtzXKonfTrGyGDPASZfz/oNEUFuWEvKiIWBLmNZ6RFNU3
         lJAYjQicjQ5zfM0ycnY6gVQn67GvA3DhUMk8BP51tQE6sLCw/Q6dI3bXQjlbnKhEsEiA
         5jxXIxhcz2+/gcSuICNultr+ayPMUG19zZgSvT4ih7LHb3oRWucDl4maqdeTp2cmB+nl
         7S3q+HhNJNSin6ahnBjh9/c24Cp0a1LWiQdko8PCF9CyKslB5cq6PAq5nrL3nNwthJl1
         PphNlxLv1xiR79OHFo/Yih10bZ0z5SaaVH/BvM4iAf/AlYN2BLzaRmmPPPSr/XzOjfYd
         OH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RBlBi+ML9cd6QAStjlDlvq5VTxo2J4WiJF4C2mnkQQM=;
        b=EyTzca8mMPJf9Umqo24sqTFfDATgD15jMdKVf79t5wxdTumOw8uPumDMU1Kd6+7gdB
         j40q/Ve8yQT2ZmUOULy153yZ0Pri2uLYGmacop2sWQnRHAh1+0+yKnj+/Zgsi09RqP8a
         k5V9/d2As6IfckaZEIlAMVCwbIrJYgP1Mu0ZqUnrZmECVV9gZSZ4ZN50D908CDJUQYu7
         U6i3Qr2VtdxWXDDSkCoq70vtL4qIk605mJ79jLyrQMBMo0ScggA+wvgE6Re4Sqz98Aw0
         ndQUJKfiufTB66nlrGIC3JXtmLDN+OtXS9QLFl6n7QPqYPSuwvW05a7D99kvyuRwA5qY
         SPOQ==
X-Gm-Message-State: AOAM5322lRC9sdDoifjjlQdgn4gdXTlFp8X7WxCYnkrUXRJr7Q9cNK3p
	bkovOZxXyDWfWpA/WOInHKc1TaSyB05E55U6Koo=
X-Google-Smtp-Source: ABdhPJzHAu43RuYpBE+HsMnL1LGwS1eqyxaDDHVeV9TboX4ypDhANEdLnGeL554U296Tp0BTn/CLOUUDKiNIXwm1US0=
X-Received: by 2002:a05:6402:1d1c:: with SMTP id dg28mr38729363edb.234.1629725754224;
 Mon, 23 Aug 2021 06:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-4-zboszor@pr.hu>
 <CADkTA4PC3Fi6y+OSFUWSxRgdbFQsc=Vfq4Yv_G86nmatnWirbA@mail.gmail.com>
 <d780f47b-38a7-a44e-d8a1-3d6dd0a286c5@pr.hu> <CADkTA4NrgEbv-8qh9gQ0oyKYCsNCmv=hu0OTnC0RnRmvjo4cYA@mail.gmail.com>
 <e2b1a3e3-125a-f36c-21df-eadcfa2ffaa7@pr.hu>
In-Reply-To: <e2b1a3e3-125a-f36c-21df-eadcfa2ffaa7@pr.hu>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 23 Aug 2021 09:35:43 -0400
Message-ID: <CADkTA4MsoDZoEqYQCzciG49CRas_uqXz+dEHd-cP5Tw+=g2xVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] kernel-module-split.bbclass: Allow opt-out of split kernel modules
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 9:31 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> 2021. 08. 23. 15:27 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> > On Mon, Aug 23, 2021 at 9:18 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@pr.hu> wrote:
> >>
> >> 2021. 08. 23. 14:55 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> >>> On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
> >>> lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote=
:
> >>>>
> >>>> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>>>
> >>>> For some use cases, a monolithic kernel-modules package containing
> >>>> all modules built from the kernel sources may be preferred.
> >>>> For one, download time is shorter and installation time is faster.
> >>>>
> >>>
> >>> There's still an outstanding issue though. Unless you generate the
> >>> provides/rdepends along with the monolithic package, any existing
> >>> rdepends on kernel modules break.
> >>
> >> The next patch in the thread does it.
> >
> > That's what my follow up said ;)
> >
> > See my second reply though, this gap in functionality created by this
> > commit, should be documented in the commit that it will be restored in
> > future ones.
>
> I can squash the two commits so there's no gap.

That's my preference (others may disagree), since they are related and
anyone that has poked around in this area may notice the issue (like I
did).

I don't normally bisect through oe-core, but it is nice to know that
if you were on this intermediate commit, that the dependencies would
stay valid/consistent.

Cheers,

Bruce

>
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >>>
> >>> While that likely isn't something you hit in your use case, it would
> >>> be something that would have to be covered to make this part of core.
> >>>
> >>> About 7 years ago, I was most of the way through a similar change,
> >>> that created on large package with all the rprovides generated (I'm
> >>> not sure I can track it down now, but I could have a look), since
> >>> doing an on target update with thousands of kernel module package is
> >>> very painful.
> >>
> >> Well, yes. In our defconfig, about 1500 kernel-module-* subpackages
> >> were created and had to be upgraded at once. It was *very* painful
> >> with over 50 minutes to download and upgrade the kernel.
> >>
> >>>
> >>> Cheers,
> >>>
> >>> Bruce
> >>>
> >>>> Set KERNEL_SPLIT_MODULES=3D"0" for this.
> >>>>
> >>>> The default is one subpackage per module.
> >>>>
> >>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>>> ---
> >>>>    meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
> >>>>    1 file changed, 13 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes=
/kernel-module-split.bbclass
> >>>> index 6c1de4c992..a29c294810 100644
> >>>> --- a/meta/classes/kernel-module-split.bbclass
> >>>> +++ b/meta/classes/kernel-module-split.bbclass
> >>>> @@ -28,6 +28,7 @@ do_install:append() {
> >>>>           install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconf=
dir}/modprobe.d/
> >>>>    }
> >>>>
> >>>> +KERNEL_SPLIT_MODULES ?=3D "1"
> >>>>    PACKAGESPLITFUNCS:prepend =3D "split_kernel_module_packages "
> >>>>
> >>>>    KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NA=
ME") or "kernel" }-modules"
> >>>> @@ -156,18 +157,26 @@ python split_kernel_module_packages () {
> >>>>        kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME") or "k=
ernel"
> >>>>        kernel_version =3D d.getVar("KERNEL_VERSION")
> >>>>
> >>>> +    metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> >>>> +    splitmods =3D d.getVar('KERNEL_SPLIT_MODULES')
> >>>> +    postinst =3D d.getVar('pkg_postinst:modules')
> >>>> +    postrm =3D d.getVar('pkg_postrm:modules')
> >>>> +
> >>>> +    if splitmods !=3D '1':
> >>>> +        etcdir =3D d.getVar('sysconfdir')
> >>>> +        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modp=
robe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
> >>>> +        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
> >>>> +        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
> >>>> +        return
> >>>> +
> >>>>        module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> >>>>
> >>>>        module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PRE=
FIX')
> >>>>        module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUF=
FIX')
> >>>>        module_pattern =3D module_pattern_prefix + kernel_package_nam=
e + '-module-%s' + module_pattern_suffix
> >>>>
> >>>> -    postinst =3D d.getVar('pkg_postinst:modules')
> >>>> -    postrm =3D d.getVar('pkg_postrm:modules')
> >>>> -
> >>>>        modules =3D do_split_packages(d, root=3D'${nonarch_base_libdi=
r}/modules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, de=
scription=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recur=
sive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_packag=
e_name, kernel_version))
> >>>>        if modules:
> >>>> -        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> >>>>            d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> >>>>
> >>>>        # If modules-load.d and modprobe.d are empty at this point, r=
emove them to
> >>>> --
> >>>> 2.31.1
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
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
