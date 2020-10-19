Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.10568.1603102241335323792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rt0FbOnw;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id md26so13051824ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0XBKkgdSvBnLucFqc3Qcu9CG2k5439Dkzd/aasIG0IY=;
        b=rt0FbOnwxh3gcSX8nc4ej1ph8KIr8clsaQ9/HZXD+yPv3FM+5ACTModFwHWt1/bA0D
         vtcqilR1mZniYZLBPG7FN1KIRePXoWHSf38cTOVB4xb3cb4USGWp2QeQGYLMI7qWfA21
         fnU9JQlX393s0nEJfYU85NwXajy/etXpychEy43tJ33xUucI7oIEhLD51TKopBYXRJ11
         TPI0on4l0b6yfxlh0HRvWkjmYMaCxs8BS/1dG+yi3ipZmOC8g0oALcY6v62CQc9AkZz9
         yYqmqAi2V+4olqib0wvLDGiclsSnyNG4B5dZp/oOjiabFQJ3/gzX59V4eKlZ2vrX68Jg
         vtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0XBKkgdSvBnLucFqc3Qcu9CG2k5439Dkzd/aasIG0IY=;
        b=qN5XCKSFqR5KJzDsQKBNyh2T/KXyd1gEykriBeIX4c4k4gzSfjPZ2Jbx3djiscpGG1
         7HyWO5OAnESty+HzFl94TOsqYHPj7L0tmfnS96R3iUee7LxNgEs5fZNGtfBpqMlZC6ZG
         bAfXsQ0LqcWt1BPli03dsCmLV1Q9fErvXhBEfhwDQ/dQpHBO2pIeI336LQw7PHe5cCpB
         /zVqQ+SVkEWE1fMqErQQ6ipOR4dCUuVA6GYu/DVHjVETn2sCBf/I9L9Deun39LZ7aRXi
         gwkreBdwaKukmUVjpXfRd4yDzIiy6cCEvFnRJXaxkQqafRIdrtKKpxhJKYwjN1aIJmUA
         2NtA==
X-Gm-Message-State: AOAM530o1sgD59/xvGkJXp4TXS6v2CYCuAo/dakBVzVKpU1P4teba+oX
	BL0TOy86gW+60lsgskbBrGazvAroZKrrkCPHC8URJEft2PSPrA==
X-Google-Smtp-Source: ABdhPJx6nApWUg0jG4QHIp5PXcHJeXo+1ApPWG9en+tFVOC1rsTlg+CPy8D8D8ZLpRtjAobAJGLybj+Oz53rIRQyScs=
X-Received: by 2002:a17:906:715a:: with SMTP id z26mr16744447ejj.300.1603102239876;
 Mon, 19 Oct 2020 03:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
 <20201017142935.3605756-5-quaresma.jose@gmail.com> <fd4eccc67f224c21b957742e33988bfd@XBOX03.axis.com>
In-Reply-To: <fd4eccc67f224c21b957742e33988bfd@XBOX03.axis.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 19 Oct 2020 11:10:28 +0100
Message-ID: <CANPvuR=gnBY5euwoXzvBLQ9dVoaiqwJt18oS1GW3d_rQOchQfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch it's only a little fix in the identencion and it can be
dropped from the series.
This is not really necessary for now and I don't need a new revision
only to fix this patch.

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia
segunda, 19/10/2020 =C3=A0(s) 09:29:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Jose Quaresma
> > Sent: den 17 oktober 2020 16:30
> > To: openembedded-core@lists.openembedded.org
> > Cc: Jose Quaresma <quaresma.jose@gmail.com>
> > Subject: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
> >
> > replace tabs with spaces and remove extra spaces
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/recipes-graphics/spir/spirv-tools_git.bb | 20 +++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recip=
es-graphics/spir/spirv-tools_git.bb
> > index d1c2436cd9..8c4d4299ed 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_git.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
> > @@ -9,12 +9,12 @@ SECTION =3D "graphics"
> >  S =3D "${WORKDIR}/git"
> >  DEST_DIR =3D "${S}/external"
> >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;name=3Dspir=
v-tools \
> > -     git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspirv-head=
ers;destsuffix=3D${DEST_DIR}/spirv-headers \
> > -     git://github.com/google/effcee.git;name=3Deffcee;destsuffix=3D${D=
EST_DIR}/effcee \
> > -     git://github.com/google/re2.git;name=3Dre2;destsuffix=3D${DEST_DI=
R}/re2 \
> > -     git://github.com/google/googletest.git;name=3Dgoogletest;destsuff=
ix=3D${DEST_DIR}/googletest \
> > -        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-fi=
le.patch \
> > -        file://0001-Avoid-pessimizing-std-move-3124.patch \
> > +           git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspir=
v-headers;destsuffix=3D${DEST_DIR}/spirv-headers \
> > +           git://github.com/google/effcee.git;name=3Deffcee;destsuffix=
=3D${DEST_DIR}/effcee \
> > +           git://github.com/google/re2.git;name=3Dre2;destsuffix=3D${D=
EST_DIR}/re2 \
> > +           git://github.com/google/googletest.git;name=3Dgoogletest;de=
stsuffix=3D${DEST_DIR}/googletest \
> > +           file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake=
-file.patch;destsuffix=3D${DEST_DIR}/effcee \
> > +           file://0001-Avoid-pessimizing-std-move-3124.patch \
> >  "
> >  SRCREV_spirv-tools =3D "c413b982c316b14e784f50d941814fc737b55b4a"
> >  SRCREV_spirv-headers =3D "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
> > @@ -27,10 +27,10 @@ inherit cmake python3native
> >  EXTRA_OECMAKE +=3D "-DSPIRV_WERROR=3DOFF"
> >
> >  do_install_append() {
> > -     install -d ${D}/${includedir}/spirv
> > -     install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D=
}/${includedir}/spirv
> > -     install -d ${D}/${includedir}/spirv/unified1
> > -     install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/=
* ${D}/${includedir}/spirv/unified1
> > +    install -d ${D}/${includedir}/spirv
> > +    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}=
/${includedir}/spirv
> > +    install -d ${D}/${includedir}/spirv/unified1
> > +    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/*=
 ${D}/${includedir}/spirv/unified1
>
> Shell code in OE-Core is actually expected to be indented using tabs,
> so this part should be reverted. However, while you are here, you
> should change "${D}/${includedir}" to "${D}${includedir}".
>
> >  }
> >
> >  FILES_SOLIBSDEV =3D ""
> > --
> > 2.28.0
>
> //Peter
>


--=20
best regards,
Jos=C3=A9 Quaresma
