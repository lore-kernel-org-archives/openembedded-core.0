Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.224.1613776920154385115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 15:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XkHWw8Di;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id x4so9000995wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 15:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l4WkBIcLGakelXdMQl2udlpuyUQE03Edmdxfsp0yQhQ=;
        b=XkHWw8DiNTkuk9uCAPEe5Cpy/QIi4Lt98t+Hof7vSgHxuFW+g+6T3LfTB9mLYF+vui
         QbNUtIOODmI+Oy9gl0yYmuTAwY69NB3Pc9TeZI/FQnFjF0rdr/uw/ae2ORmwAaYS6S5r
         nhpETkqG/UDV3nloAAueOHQe6FkrwtpqgbDjtHwd/EMML/O4wo8EthXgRsvBCEdQwNGZ
         e93h7v4+FWYbZLxFNjPdmIvcnBJImNutzlhRJggX0GXf0pHbeAykYXu9JAV7inaighpd
         EjiXCF1b4etC6K95UjZXysOGdlIl+bX4T2BoCl05Iz1vmXN/02yknAMS7MCiXStbckEs
         4hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l4WkBIcLGakelXdMQl2udlpuyUQE03Edmdxfsp0yQhQ=;
        b=fSwinUbVc3Dxed69lZenX4SgdPFjSK7jkxdlzGazVrFxxSxiamWneuyHS64umVa0eF
         ZGUnZNAR9zD8nFGkeypIMcVanU/GZbyp4vslS4q+WtI6ofOjLzhZkTrwLDl1nek/9fJC
         X0sImtDmFFdDXt1Acy/QEo6DvZdqypNY5axrfOyi3TB/79F77L5ouO0KkDwIFx+GMYX3
         pBnz6Li2H2gUpz0pG9hVxfxCbzNtObcENiYB0av9clsLBqDsLE/UN5X1Hg698vZ72+u2
         5+3rc1xad4Q18RSpUYq3xD6Sr/HiIfQv93pkDoTHjoLwvOonioYxpNfWqZGAx49AwMME
         V6gQ==
X-Gm-Message-State: AOAM532r2FZ05oKM1fHPXoAoNLkkv5YWydioBylJnzksiKBeSiUu4ghs
	0z13rjTZquHCCL9pzdkljz0WYQC4iIGU/o37NB41sw==
X-Google-Smtp-Source: ABdhPJzrcclABYdKLbI2EcZ9HNRVNstn/2/tRHNOBrc0OEQ3yskZgiv3bwwn0v9cHi29FE/2DqklPyfbCW82JTaoliw=
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr2910242wmc.12.1613776918624;
 Fri, 19 Feb 2021 15:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
 <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com>
 <CA+chaQdoYMbPazDp8onpqJMNj9SBL7pT_5XLYE1Dv1XmJ5ZMZw@mail.gmail.com>
 <CAMKF1spBtFXUzDaDSnQiOYw9xYPrn_-MiOrEOnmpven940MbNQ@mail.gmail.com>
 <CA+chaQcKgbUi8jXH24xMT4j2SqRctYu8PiXr3WL5tpAgeWDg+Q@mail.gmail.com> <CAMKF1spJ2iXuGXhZwMA-JX+d_XGPGA-6AXd4gPiVk3G0nbW1nA@mail.gmail.com>
In-Reply-To: <CAMKF1spJ2iXuGXhZwMA-JX+d_XGPGA-6AXd4gPiVk3G0nbW1nA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 19 Feb 2021 13:21:47 -1000
Message-ID: <CAOSpxda6cmEiCWp=e2+YS+6swq30Khw_mLvRGsViBvcr02q4UQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 1:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> After discussing with Martin offline and also his test reports
> indicate that we are not getting worse with this patch. So I am
> comfortable backporting it to dunfell.

Thanks!  I'll add this to my patch queue.

Steve

> On Tue, Feb 16, 2021 at 6:08 PM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > > Generally it was done so it applied on latest data which may be rege=
nerated during build
> >
> > Maybe I'm missing something, but
> > https://git.openembedded.org/openembedded-core/commit/?id=3D5e5be67744=
d7ddf5a9ac433ecba02f697a84a325
> > adds make_icudata task after do_patch and it was creating a copy from =
${WORKDIR}/data and then patching it, if it's already patched by do_patch t=
ask, then the patched data directory is being used even if the make_icudata=
 gets re-executed during build.
> >
> > So this IMHO shouldn't have any impact on behavior, except applying th=
e patch in do_patch instead of delaying (and possibly re-applying it when r=
e-executed) inside make_icudata task.
> >
> > On Tue, Feb 16, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On Tue, Feb 16, 2021 at 3:53 PM Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >>>
> >>>
> >>>
> >>> On Tue, Feb 16, 2021 at 3:33 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>>
> >>>> > index 08254648e4..6ba88595df 100644
> >>>> > --- a/meta/recipes-support/icu/icu_66.1.bb
> >>>> > +++ b/meta/recipes-support/icu/icu_66.1.bb
> >>>> > @@ -21,10 +21,11 @@ BASE_SRC_URI =3D "https://github.com/unicode-=
org/icu/releases/download/release-${I
> >>>> >  DATA_SRC_URI =3D "https://github.com/unicode-org/icu/releases/do=
wnload/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
> >>>> >  SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
> >>>> >             ${DATA_SRC_URI};name=3Ddata \
> >>>> > +           file://0001-Fix-big-endian-build.patch;patchdir=3D${W=
ORKDIR} \
> >>>
> >>>  > +           file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of=
-misc_res.patch;patchdir=3D${WORKDIR} \
> >>>>
> >>>>
> >>>> why this change ?
> >>>
> >>>
> >>> Because both these patches need to be applied on ${WORKDIR}/data dir=
ectory and doing it here provides slightly better error message when the pa=
tch doesn't apply (e.g. in this case ${WORKDIR}/data is using dos line endi=
ngs, but I was preparing the patch in git repo where it's using unix line e=
ndings as expected) and the patch call failing in do_make_icudata_class-tar=
get is more confusing than usual do_patch failure.
> >>>
> >>> Was there any reason to apply this fix only for target builds? I hav=
en't found any.
> >>
> >>
> >> Generally it was done so it applied on latest data which may be regen=
erated during build
> >>>
> >>>
> >>> Cheers,
>
>=20
>
