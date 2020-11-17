Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web09.15303.1605650659483757084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5kPWf6r;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id r12so11604104qvq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bxxtiLXankGXzkpdcgov01U4ckoXZb/vl4POCCOLOSg=;
        b=D5kPWf6rvco+kRLwcnvRN9jK8V15+R4c+tCZAsy9hnqFiyHq8QB+X5CQdos5Xh9zaH
         S5ZKwj+j2Bh5In1UDVlEe/a1os7vmfoXzEkYgPFDVgI4nra9bRQut/bOXBa1d4tOWUR1
         HOgT85js1kAqjGrBYuoqlD9rR7h9ppGXKj4xs47jUSh+u3uPIAR6P6kpJCH1F7nPlNXN
         sXjOYagyUTwo6c1MITY8zM9RAze6PzAMroVS2g3PQApisxxm3b5pc1Fvo27EGPqHyT6K
         3IUTcz8qk0cb7HnKFAriUnR3ekFZXVdluPBMN/bHRc9Xd1bZ90cKOT3d6n/sWcMoZ9PT
         L3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bxxtiLXankGXzkpdcgov01U4ckoXZb/vl4POCCOLOSg=;
        b=DOjxjzyasv3MENs3xWgomRjwO+nRh18iC6wwus0KzlNiv+czJw139rRTQSNHpeSGK2
         RYZqRjJBcY84EAdJgWDWO/GjhZswjAhdou/AhZojsC3Fz/NoOdJMlXfe9rTfOjs7HFsy
         d1cIV1f4VjbhB7PZS4ed2Zkjrkqq9H2vRAH6RW5FvdoX/VlS3lUJeSZcTbxIqfzSkGMe
         LrIjwKrdZbbM5v4l+dz1OsjmvGAQTDrZm+3n6Z593uHxT6YIx56i07m/wvcAoQlyiZYN
         xnBM3keE+pWtgvG4ltGP1IziekPllhdZl3LaDEp1buzR5dVAimgAHqedhn4jso7HdPsW
         56MA==
X-Gm-Message-State: AOAM530wWrUN9IaOFiehO3GzfuCmTe1tEOZEKmoJQFuPgYDRJM8gn/JT
	T6f3qlieRi8EauR7BeWDb8udJOgkYPQ9rKyeiG0=
X-Google-Smtp-Source: ABdhPJxq6q8Y1y9L5c9/lKxZ2JSalwIQ/uC0vmP3ltGq3egAXmq9hCuqok9ysiRHzWjZT0UORR95/BN3VcFH+qmrLFQ=
X-Received: by 2002:ad4:4ae4:: with SMTP id cp4mr1499537qvb.21.1605650658232;
 Tue, 17 Nov 2020 14:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20201117180441.296304-1-raj.khem@gmail.com> <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
 <CA+chaQdPKhwuw197c=cHesYPmS5weQc6jc6SQi-1iisEGdHSeg@mail.gmail.com>
 <CANPvuRnK2v4SwZ722=Phhp_C6PGphB7ygMYOzMaCDbbXcSzUsw@mail.gmail.com>
 <CA+chaQdJ79DA8zB9DFkqbVWzumABb+aF5jXgPu0s4pdqXQ7UTg@mail.gmail.com> <CANPvuR=k3b+oiObtgixKTS2nX=sbFkdeaQ44GcmHDU=rrD12LQ@mail.gmail.com>
In-Reply-To: <CANPvuR=k3b+oiObtgixKTS2nX=sbFkdeaQ44GcmHDU=rrD12LQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 14:03:51 -0800
Message-ID: <CAMKF1sq3Uwvf6jB+V7ihhbCysohJ+QotAG=3_qoJGw3=nbaAhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 1:18 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
> Martin Jansa <martin.jansa@gmail.com> escreveu no dia ter=C3=A7a,
> 17/11/2020 =C3=A0(s) 20:24:
> >
> > Then you will need space in:
> > EXTRA_PYTHON_DEPENDS_append_class-target =3D " python3"
> > as well.
>
> right.
>
> >
> > I don't expect EXTRA_PYTHON_DEPENDS to be often (if at all) outside th=
e bbclass, but IMHO it's good convention to just use leading space wherever=
 you append to space separated list (less surprises for people who might ev=
entually set something like EXTRA_PYTHON_DEPENDS in their recipes - even fr=
om wrong reasons).
> >

I think that's fine reason, I am not too hard on it but I have sent a
v5 which reverts to original spaces. Hopefully this will be final rev.

>
> if EXTRA_PYTHON_DEPENDS is don't expect to be often (if at all)
> outside the bbclass, a clean solution can be:
>
> -DEPENDS_append =3D " python3"
> +DEPENDS_append_class-target =3D " python3"
>
> > On Tue, Nov 17, 2020 at 9:18 PM Jose Quaresma <quaresma.jose@gmail.com=
> wrote:
> >>
> >> Martin,
> >>
> >> you're right. if EXTRA_PYTHON_DEPENDS is set outside of the bbclass i=
t
> >> break the DEPENDS.
> >>
> >> Sorry Khem for my suggestion, your initial was right.
> >>
> >> +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> >> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> >>
> >> But in this case (when EXTRA_PYTHON_DEPENDS is set outside of the bbc=
lass)
> >> it will don't have any effect for the overwrite class-target because
> >> EXTRA_PYTHON_DEPENDS_class-target=3D"python3" always will set
> >> EXTRA_PYTHON_DEPENDS=3D"python3"
> >>
> >> I think I have see another problem now and something like this is bet=
ter:
> >>
> >> +EXTRA_PYTHON_DEPENDS_append_class-target =3D "python3"
> >> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> >>
> >> Martin Jansa <martin.jansa@gmail.com> escreveu no dia ter=C3=A7a,
> >> 17/11/2020 =C3=A0(s) 19:56:
> >> >
> >> > I don't mind this change, but why do you think space in the variabl=
e is better in this case (where we don't mind extra space being added for n=
ative/nativesdk case?)
> >> >
> >> > If someone sets EXTRA_PYTHON_DEPENDS =3D "foo" for whatever reason =
in some recipe, then the space will be missing.
> >> >
> >> > On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
> >> >>
> >> >> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 17/11/20=
20 =C3=A0(s) 18:04:
> >> >> >
> >> >> > python3targetconfig append target python3 to dependencies
> >> >> > unconditionally, and here its inherited unconditionally too but
> >> >> > distutils3-base is inherited in BBCLASSEXTEND'ed recipes and oth=
er not-target
> >> >> > recipes as well. Hence the change added via 9c8f666097802cb594a7=
59989edcf01603a22df3
> >> >> > is now bridging the native dependencies with target python3 and =
thats
> >> >> > resulting all sorts of rebuilds for multimachine builds e.g.
> >> >> >
> >> >> > MACHINE=3Dqemuarm bitbake python3-scons-native
> >> >> > MACHINE=3Dqemumips bitbake python3-scons-native
> >> >> >
> >> >> > results in rebuilds for python3-scons-native
> >> >> >
> >> >> > bitbake-diffsigs shows
> >> >> >
> >> >> > Hash for dependent task python/python3-scons-native_3.1.2.bb:do_=
populate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033=
146b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
> >> >> > 0e3b97bd058d162065
> >> >> >     Hash for dependent task python/python3-scons-native_3.1.2.bb=
:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb=
4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
> >> >> > 229cb0f5ebb11
> >> >> >         Hash for dependent task python/python3-scons-native_3.1.=
2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608=
793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
> >> >> > 7cc9769194c43eae1
> >> >> >             Hash for dependent task python/python3-scons-native_=
3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b12=
66dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
> >> >> > b346650fbdf114ac70ab57b
> >> >> >                 Hash for dependent task python/python3-scons-nat=
ive_3.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b51=
62b3cdd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
> >> >> > 4935aaecf31a79e867826fe634cde4f44171d8e7
> >> >> >                     Hash for dependent task python/python3_3.9.0=
.bb:do_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d5=
5e2e32f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
> >> >> > 08777e46a6fa6e417c0445018
> >> >> >
> >> >> > ...
> >> >> >
> >> >> > Therefore limit effects of this class only for target recipes.
> >> >> >
> >> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> >> >> > ---
> >> >> > v2: Mark depends conditional instead
> >> >> > v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
> >> >> >     and mark tasks with target override
> >> >> >
> >> >> >  meta/classes/python3targetconfig.bbclass | 10 ++++++----
> >> >> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >> >> >
> >> >> > diff --git a/meta/classes/python3targetconfig.bbclass b/meta/cla=
sses/python3targetconfig.bbclass
> >> >> > index 640d0c97b6..fc1025c207 100644
> >> >> > --- a/meta/classes/python3targetconfig.bbclass
> >> >> > +++ b/meta/classes/python3targetconfig.bbclass
> >> >> > @@ -1,15 +1,17 @@
> >> >> >  inherit python3native
> >> >> >
> >> >> > -DEPENDS_append =3D " python3"
> >> >> > +EXTRA_PYTHON_DEPENDS ?=3D ""
> >> >> > +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> >> >> > +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> >> >>
> >> >> -EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> >> >> -DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> >> >> +EXTRA_PYTHON_DEPENDS_class-target =3D " python3"
> >> >> +DEPENDS_append =3D "${EXTRA_PYTHON_DEPENDS}"
> >> >>
> >> >> add a space before python3 is better than always add it to DEPENDS
> >> >>
> >> >> >
> >> >> > -do_configure_prepend() {
> >> >> > +do_configure_prepend_class-target() {
> >> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >> >> >  }
> >> >> >
> >> >> > -do_compile_prepend() {
> >> >> > +do_compile_prepend_class-target() {
> >> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >> >> >  }
> >> >> >
> >> >> > -do_install_prepend() {
> >> >> > +do_install_prepend_class-target() {
> >> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >> >> >  }
> >> >> > --
> >> >> > 2.29.2
> >> >> >
> >> >> >=20
> >> >> >
> >> >>
> >> >>
> >> >> --
> >> >> best regards,
> >> >> Jos=C3=A9 Quaresma
> >>
> >>
> >>
> >> --
> >> best regards,
> >> Jos=C3=A9 Quaresma
>
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
