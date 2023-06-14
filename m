Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DE3EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:52:54 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.7685.1686736365017769307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ey6AHujA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f61d79b0f2so8579092e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686736363; x=1689328363;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bsNBJR/lcww//wxb0lWxEvnwoxw30G9XdvEMhPjCKBs=;
        b=ey6AHujAOqXaBvrWWFlg9Raz4BtAgEALUSbHMOjWJLyhewiXs3COwC9Mym/EZv3WM/
         RRGDOoReK5EAL8oQ1b+pAb4S2MOK5qUAD2NsH2c49ejApk6RXy1IA1HRuSX+Mpoh/XRc
         dkk6Ucjo+gZbh9e/1Yc1GiNqEtfz8Vgsqfjiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686736363; x=1689328363;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsNBJR/lcww//wxb0lWxEvnwoxw30G9XdvEMhPjCKBs=;
        b=a/HEZcIuB/ShPEIVkLes/oXXSyHyEGvMSU7Xcws4TMR6VQvHx2J3A+g0xtJCfdyG4X
         nxj0mrIvSTxPq7iTlv2FBqF7tOI7oEAhB0smV+TPdqlhVTlIphY+MRGK+6k992X7Is47
         BGKTA/lKhg/3dbKMpNqH8AI6/bjE3zp3BJWAsJdI735LraPjywAHVb1AV57rQ1kGnWUT
         S3mLdu5DL+o/eL3Z1xGDc6x3vc2wZvn2tnSD14ZaOdV5KBC5wzUjI1EyLuo3/jyzK5aU
         PmmIblMyhaQxtxzUvkQzMTNfn4kuPnAs0flZmhYM2tjkyBAEfIms7ucr6AudLg8lKikM
         0+jw==
X-Gm-Message-State: AC+VfDyDLjS42RrV4nMxhe082AVJVhZVZrPe/beVQg8kQKN+zG5ZvY0J
	3JJ6uHgLYyJHrMDBmMLaPsUxlQ==
X-Google-Smtp-Source: ACHHUZ59U1jMCYRi1eAedGZrpOkIwvPZ1yOtrRI9zN/NDD+nPWTXMFmdfNbESKUcq3wGGnILCf0cIQ==
X-Received: by 2002:a19:7104:0:b0:4f6:3000:4d5a with SMTP id m4-20020a197104000000b004f630004d5amr6391830lfc.38.1686736362995;
        Wed, 14 Jun 2023 02:52:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b? ([2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003f8db429095sm599021wml.28.2023.06.14.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:52:42 -0700 (PDT)
Message-ID: <01dca4b2a76d8972c24ec1aa5480b93f4f0b0585.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] python_mesonpy: New class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Wed, 14 Jun 2023 10:52:41 +0100
In-Reply-To: <b48ac118-3096-8a94-9896-daefe4b46a30@gmail.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
	 <20230602074419.2450399-3-zboszor@gmail.com>
	 <fcb088b53c6635a6289c3d7d6fdbc6930de634a6.camel@linuxfoundation.org>
	 <b48ac118-3096-8a94-9896-daefe4b46a30@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182801

On Wed, 2023-06-14 at 07:46 +0200, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> 2023. 06. 13. 22:59 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > On Fri, 2023-06-02 at 09:44 +0200, Zoltan Boszormenyi wrote:
> > > This is a new PEP517 compatible build class for python modules
> > > that use pyproject.toml and this:
> > >=20
> > > [build-system]
> > > build-backend =3D 'mesonpy'
> > >=20
> > > The new class uses python3-meson-python-native.
> > >=20
> > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> > > ---
> > >   meta/classes-recipe/python_mesonpy.bbclass | 54 +++++++++++++++++++=
+++
> > >   1 file changed, 54 insertions(+)
> > >   create mode 100644 meta/classes-recipe/python_mesonpy.bbclass
> > >=20
> > > diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classe=
s-recipe/python_mesonpy.bbclass
> > > new file mode 100644
> > > index 0000000000..1da8b005ab
> > > --- /dev/null
> > > +++ b/meta/classes-recipe/python_mesonpy.bbclass
> > > @@ -0,0 +1,54 @@
> > > +#
> > > +# Copyright OpenEmbedded Contributors
> > > +#
> > > +# SPDX-License-Identifier: MIT
> > > +#
> > > +
> > > +inherit meson setuptools3-base python3targetconfig python_pep517
> > > +
> > > +# Filter out meson_do_qa_configure from do_configure[postfuncs]
> > > +DOCONFIGUREPOSTFUNCS :=3D "${@d.getVarFlag('do_configure', 'postfunc=
s')}"
> > > +DOCONFIGUREPOSTFUNCS:remove =3D "meson_do_qa_configure"
> > > +do_configure[postfuncs] :=3D "${@'' if d.getVar('DOCONFIGUREPOSTFUNC=
S') is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
> > > +
> > > +# This prevents the meson error:
> > > +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype.=
 Pick one.
> > > +MESONOPTS:remove =3D "--buildtype ${MESON_BUILDTYPE}"
> > > +
> > > +CONFIGURE_FILES =3D "pyproject.toml"
> > > +
> > > +DEPENDS +=3D "python3-wheel-native python3-meson-python-native"
> > > +
> > > +def mesonpy_get_args(d):
> > > +    vars =3D ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
> > > +    varlist =3D []
> > > +    for var in vars:
> > > +        value =3D d.getVar(var)
> > > +        vallist =3D value.split()
> > > +        for elem in vallist:
> > > +            varlist.append("-Csetup-args=3D" + elem)
> > > +    return ' '.join(varlist)
> > > +
> > > +PEP517_BUILD_OPTS =3D "-Cbuilddir=3D'${B}' ${@mesonpy_get_args(d)}"
> > > +
> > > +# Python pyx -> c -> so build leaves absolute build paths in the cod=
e
> > > +INSANE_SKIP:${PN} +=3D "buildpaths"
> > > +INSANE_SKIP:${PN}-src +=3D "buildpaths"
> > This is not ready for core as the output is not reproducible. I am not
> > taking patches which skip buildpaths warnings.
> >=20
> > This also shows that the code is not being tested in OE-Core. Until it
> > is needed by and being used by something in core, I don't think it
> > should be there.
>=20
> This thread was long time dead. The series was sent to meta-oe.

Was the reproducibility issue fixed? It really does need to be as we
have things like hash equivalence which depend upon that...

Cheers,

Richard

