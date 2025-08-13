Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEAECA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:22:03 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.7712.1755120113457743805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mUfclwoi;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931cc1c442so325504276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755120112; x=1755724912; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaMtgp0V/jc5OeSZBfeFXMgViLhTH8AmwB0WJe3K0ZY=;
        b=mUfclwoiYlWVedsGypfzZefcdKmzGl8QobQUHpM6K+rM9nPYgJPCYQGTyjwcA98p1Z
         Z69wzBTuUhdho1DvbbbzG0jr9D7xrQQ72PodjyRQUZPHXdDOJi/h1Fw/L0y8lSH7As6A
         M6y1WhA7rLEL5DagIgea/o8H37aHWHXH44bP5+U5x7kETpt3U+W2Tw0QWqh+e3J+tt8e
         HaTqCazI9jA3N3WsGk5TUX1NECH9J/BGyEIG8UfNnKl3NcX9rW4BVQLE/nMyb9f6bDIP
         JEq70BjK96a7t2+Ndh3Nx9T5e7PeNYyAnfb3cVbkujekIZ7cNrcRQ0GuzrvOKeYb579T
         5SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120112; x=1755724912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaMtgp0V/jc5OeSZBfeFXMgViLhTH8AmwB0WJe3K0ZY=;
        b=Nx+vZ9oHr2x6zBb9bhz2yruyWG4po64EpUr3GnP3pQw/TqtkMjuEU0VdkuYv1eYap1
         ZD3PbiFp3P56izmdkRq7igOKLIbK25XTohLgvNBM4Ef1OOyoRovS5o0e3vBWIL8oPImo
         /gMgWyUAjyf+Qw3bcJUEgnrJSXdCDzcv/MUBgU/j7RSTLuJpSVeq+EqbmmNogK/e+IVs
         Rc9wZHX2AISXhWlwtg+dMEDrA4Odjv7m9Fin6vb+4PAiOYKGBmlHgec2w+90RyBYE3Md
         g4M1Iv6/Oo59c+GTjtjp/ggoc160/RF+xv+i9LbLV+T0e10ss44xlntyVJsdAyRyoje4
         MGwA==
X-Gm-Message-State: AOJu0YzyvQ5fCl9yCbdu7K0900P5O17RbdUsREDcO+pf2jCnCMP7vM19
	E5hfD9RirLMXGe+0w6upHCH88ii07fGwgPPI/ygTSU0taMMsTFQCLDflq2BCg/HBVpOZ4NRHXP3
	Pcfi9XosEBlM1yhWE+KuxtDawHRzjQGk=
X-Gm-Gg: ASbGnctR8329Lv4c6iOOjXEyzF2UJg/VyE4CAYZiiUaBiyGdZbupfc4twqeGC9WE+1+
	F8OMi5q0koGSFowh8uwP1o7Q6oH69uXQAN4Ia7qsrMLCebs1tiiClpGLhEPHpSlorWB8VOKCOVb
	rjKftiwvHGOgIvJ4fEz6CLfYnEJlzSvrIXT0I1xzo2V3KRG7IGjtQzH0IEydZKwltc3xy5oxu/x
	jCLURPxOJnvbsE7Tk7+dRYh3RuoM6LYOIU=
X-Google-Smtp-Source: AGHT+IFvw835eX1rA2l6C5Vc9JnynsltWwcZdkUI5PZrU32GuhqcDPxcvNn6QGhri696DdcNgm+ACC/jhFirWF25YQs=
X-Received: by 2002:a05:6902:6d03:b0:e90:62f9:b1be with SMTP id
 3f1490d57ef6-e931e1820c2mr755752276.22.1755120112263; Wed, 13 Aug 2025
 14:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755005205.git.steve@sakoman.com> <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
 <ebdeab05-86f3-41b8-8611-43318652b7e6@gmail.com> <CAOSpxdZqxpHaCGdLeuRux+JW5TBK+iWstL+nduTSpUp0rWDDhw@mail.gmail.com>
In-Reply-To: <CAOSpxdZqxpHaCGdLeuRux+JW5TBK+iWstL+nduTSpUp0rWDDhw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2025 14:21:25 -0700
X-Gm-Features: Ac12FXzA2Nr9l6DTyptq3kvSm5nlOz5lJuSeAaCQaI2y5PRK8doluVEFAN06sNQ
Message-ID: <CAMKF1sqtEcW-wzC3uP7mmiTqAJCVCqzg_Fy5H3anpVUnkg-QDw@mail.gmail.com>
Subject: Re: [OE-core][walnascar 3/3] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Gyorgy Sarvari <skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221830

On Wed, Aug 13, 2025 at 9:14=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Wed, Aug 13, 2025 at 9:11=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
> >
> > Is this more than cosmetic in walnascar? If it isn't, than should this
> > really go into a stable branch? In my understanding this will require a
> > brand new sstate cache.
>
> Khem,
>
> Can you comment on this?
>

Hi Steve,

I think there are patches in other layers which will be required to
backported as well. While its possible, I think
it could be some work to get it going, I would suggest to hold it back
and let folks use october release to use it
where it is soaked better.

> Thanks!
>
> Steve
>
> >
> > On 8/12/25 15:29, Steve Sakoman via lists.openembedded.org wrote:
> > > From: Khem Raj <raj.khem@gmail.com>
> > >
> > > -ffile-prefix map is more comprehensive when it comes to reproducible
> > > builds and its superset of all prefix-mapping options in compilers
> > >
> > > (From OE-Core rev: ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0)
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
> > >  meta/conf/bitbake.conf                             | 14 +++++-------=
--
> > >  meta/lib/oe/package.py                             |  2 +-
> > >  meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
> > >  .../python/python3-maturin_1.8.3.bb                |  2 +-
> > >  meta/recipes-devtools/rust/cargo_1.84.1.bb         |  2 +-
> > >  6 files changed, 11 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-r=
ecipe/kernel-arch.bbclass
> > > index 36a6e0a60a..749a266ea3 100644
> > > --- a/meta/classes-recipe/kernel-arch.bbclass
> > > +++ b/meta/classes-recipe/kernel-arch.bbclass
> > > @@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KE=
RNEL_ARCH}"
> > >
> > >  KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
> > >   -fuse-ld=3Dbfd ${DEBUG_PREFIX_MAP} \
> > > - -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> > > - -fmacro-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> > > - -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH=
} \
> > > - -fmacro-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH=
} \
> > > + -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> > > + -ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH}=
 \
> > >  "
> > >  KERNEL_LD =3D "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> > >  KERNEL_AR =3D "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 501808204e..b1dae17267 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALL=
EL_MAKEINST} "
> > >  ##################################################################
> > >  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> > >  # Beware: applied last to first
> > > -DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > > - -fmacro-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > > - -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > > - -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > > - -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > > - -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > > - -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > > - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > > - -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > > +DEBUG_PREFIX_MAP ?=3D "\
> > > + -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> > > + -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> > > + -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > > + -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > >  "
> > >  DEBUG_LEVELFLAG ?=3D "-g"
> > >
> > > diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> > > index 0db14f2164..0bcc04ea54 100644
> > > --- a/meta/lib/oe/package.py
> > > +++ b/meta/lib/oe/package.py
> > > @@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
> > >
> > >          prefixmap =3D {}
> > >          for flag in cflags.split():
> > > -            if not flag.startswith("-fdebug-prefix-map"):
> > > +            if not flag.startswith("-ffile-prefix-map"):
> > >                  continue
> > >              if "recipe-sysroot" in flag:
> > >                  continue
> > > diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes=
-devtools/gcc/libgfortran.inc
> > > index 4560421ed1..fa6aecaaa3 100644
> > > --- a/meta/recipes-devtools/gcc/libgfortran.inc
> > > +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> > > @@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS =3D "\
> > >  # An arm hard float target like raspberrypi4 won't build
> > >  # as CFLAGS don't make it to the fortran compiler otherwise
> > >  # (the configure script sets FC to $GFORTRAN unconditionally)
> > > -export GFORTRAN =3D "${FC} -fcanon-prefix-map -fdebug-prefix-map=3D$=
{S}=3D${TARGET_DBGSRC_DIR} -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR}=
 -gno-record-gcc-switches"
> > > +export GFORTRAN =3D "${FC} -ffile-prefix-map=3D${S}=3D${TARGET_DBGSR=
C_DIR} -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} -gno-record-gcc-swit=
ches"
> > >
> > >  do_configure () {
> > >       for target in libbacktrace libgfortran
> > > diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/=
meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > > index 17c8fb7083..ad61aac856 100644
> > > --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > > +++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > > @@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "304762f86fd53a8031b1bf006d125=
72a2aa0a5235485031113195cc015
> > >
> > >  S =3D "${WORKDIR}/maturin-${PV}"
> > >
> > > -CFLAGS +=3D "-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DI=
R}/cargo_home"
> > > +CFLAGS +=3D "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR=
}/cargo_home"
> > >
> > >  DEPENDS +=3D "\
> > >      python3-setuptools-rust-native \
> > > diff --git a/meta/recipes-devtools/rust/cargo_1.84.1.bb b/meta/recipe=
s-devtools/rust/cargo_1.84.1.bb
> > > index db18ecfda9..150c2d2b80 100644
> > > --- a/meta/recipes-devtools/rust/cargo_1.84.1.bb
> > > +++ b/meta/recipes-devtools/rust/cargo_1.84.1.bb
> > > @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
> > >
> > >  inherit cargo pkgconfig
> > >
> > > -DEBUG_PREFIX_MAP +=3D "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D${TA=
RGET_DBGSRC_DIR}"
> > > +DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TAR=
GET_DBGSRC_DIR}"
> > >
> > >  do_cargo_setup_snapshot () {
> > >       ${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install=
.sh --prefix=3D"${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> > >
> >

