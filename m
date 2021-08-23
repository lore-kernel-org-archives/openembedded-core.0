Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.23420.1629723407188200192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rWgwLbQM;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bt14so36860901ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YhESje1CU8ml2gYwO4aKdWCBANfcnxCdLICRLWIhTqE=;
        b=rWgwLbQMeZKuAx2OIwObOgraGGxQXF7pvRuB6bvBI5mXM4Sz7zlFRZ+nilqGgpUAB5
         Jh1j7IJXxNCyO6M0803Ezx9I1RuHKau3CCGb/bfgpcw72A00C8F54LZ4YOmcFOpfkZwr
         0QsdUUxfMxUSLFHx+BdyaFljtBUDmCS6YFgBBEquDDtnjeHD9zpHZrSOxYp397ZwcAkm
         gDvfWGRrjpfcGpsiML5GE+tojNW0bIipw7P16G29v54jjkXGKfe+VTET5y/HLhUP2BIt
         iA4efodf7J7QgxhQZuUMCyhC66VKmareB0UY4wEMYDmpcRvQMb59jM0HUB/A9U8e32PG
         jzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YhESje1CU8ml2gYwO4aKdWCBANfcnxCdLICRLWIhTqE=;
        b=SJTzFuocV2IqmD6+u1S9AaPZ8rJmh06VxGU2u5Xbc24FB/1iDTg6Agx42om2nXYjQ/
         B11wEWsKpkFs6xgbZXlANFeiAHi2+ift8/R3uGjyilUzzLC5F7wySfpVs98O2WlgzPRQ
         O9QUQY0HPNwUNhZz3/1IqUyDUkFStKiZEcH/+mC8sb7t+dNm+k6xU5J/boM6x7XDN+98
         zPUikR9PO7Tur/6Xj1f1BHvuAlBJeOhmOKhgAebkBSHg7oxWyROjFGAXjECO+8nNI+Dy
         TzvnexXq/kyWpFg6teYVQgVGlvt8A9J8FsMNisfIShx6Dh686A0L/grlZSXZo/H3ZVGH
         dyQQ==
X-Gm-Message-State: AOAM533Ecs/bN8IkIgfLQJiSAcleDSqqRtJGY/DoL7AlKJmTLQU6X/6f
	reY89tiL48XNVS+3q1CfsXz6qCj9wVD5QR4jSp0=
X-Google-Smtp-Source: ABdhPJzN9ApY6hNaYV6pG5PFzvd7FmCNLR59mhl7BzBLYVJJXE9I6WmnftmCnV8CPUYt3adyFzwcV1/UZ3Wz3JsW+n4=
X-Received: by 2002:a17:906:f298:: with SMTP id gu24mr35800700ejb.334.1629723405748;
 Mon, 23 Aug 2021 05:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-4-zboszor@pr.hu>
 <169DF0BA24F74A88.27647@lists.openembedded.org>
In-Reply-To: <169DF0BA24F74A88.27647@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 23 Aug 2021 08:56:34 -0400
Message-ID: <CADkTA4PpHLOV4tHTGUoCDj7rmnv2OFk0FLoDuO71q1qbi8iMbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] kernel-module-split.bbclass: Allow opt-out of split kernel modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: zboszor@pr.hu, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 8:55 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >
> > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >
> > For some use cases, a monolithic kernel-modules package containing
> > all modules built from the kernel sources may be preferred.
> > For one, download time is shorter and installation time is faster.
> >
>
> There's still an outstanding issue though. Unless you generate the
> provides/rdepends along with the monolithic package, any existing
> rdepends on kernel modules break.

Ha.

Never mind, I see the next patch in the series.

It would be worthwhile to document that other changes handle that
detail in the commit log, that way if we are looking for issues in the
future, we know there is hope :D

Bruce

>
> While that likely isn't something you hit in your use case, it would
> be something that would have to be covered to make this part of core.
>
> About 7 years ago, I was most of the way through a similar change,
> that created on large package with all the rprovides generated (I'm
> not sure I can track it down now, but I could have a look), since
> doing an on target update with thousands of kernel module package is
> very painful.
>
> Cheers,
>
> Bruce
>
> > Set KERNEL_SPLIT_MODULES=3D"0" for this.
> >
> > The default is one subpackage per module.
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >  meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/ke=
rnel-module-split.bbclass
> > index 6c1de4c992..a29c294810 100644
> > --- a/meta/classes/kernel-module-split.bbclass
> > +++ b/meta/classes/kernel-module-split.bbclass
> > @@ -28,6 +28,7 @@ do_install:append() {
> >         install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/=
modprobe.d/
> >  }
> >
> > +KERNEL_SPLIT_MODULES ?=3D "1"
> >  PACKAGESPLITFUNCS:prepend =3D "split_kernel_module_packages "
> >
> >  KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME") =
or "kernel" }-modules"
> > @@ -156,18 +157,26 @@ python split_kernel_module_packages () {
> >      kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME") or "kernel=
"
> >      kernel_version =3D d.getVar("KERNEL_VERSION")
> >
> > +    metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> > +    splitmods =3D d.getVar('KERNEL_SPLIT_MODULES')
> > +    postinst =3D d.getVar('pkg_postinst:modules')
> > +    postrm =3D d.getVar('pkg_postrm:modules')
> > +
> > +    if splitmods !=3D '1':
> > +        etcdir =3D d.getVar('sysconfdir')
> > +        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprob=
e.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
> > +        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
> > +        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
> > +        return
> > +
> >      module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> >
> >      module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> >      module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> >      module_pattern =3D module_pattern_prefix + kernel_package_name + '=
-module-%s' + module_pattern_suffix
> >
> > -    postinst =3D d.getVar('pkg_postinst:modules')
> > -    postrm =3D d.getVar('pkg_postrm:modules')
> > -
> >      modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/mo=
dules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descrip=
tion=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=
=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_na=
me, kernel_version))
> >      if modules:
> > -        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> >
> >      # If modules-load.d and modprobe.d are empty at this point, remove=
 them to
> > --
> > 2.31.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
