Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.11024.1603712137167367707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIUD1AfB;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id l24so8878456edj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IZPY0c5FjkOHFRaZSW2ssJETIFjDus/Ul5FlLZ8TZl0=;
        b=nIUD1AfBhawLcpTb1q7sQXbUA8HdkxKVQfVSiOcNF38LR5VtyYwQAKYdopxabXmpGe
         iFvgCpaq94RpEhV7SEXoyw9dbNwpjflaDSvAYzJt/DQEzWXiWjo+uYVpZhEF46RZL55+
         rxNp0EbKNzsf8L6NS37yqunXBXaDwywt25W37TVy9ZJj52g0FyFmWJ80OArkN6N3A2WS
         h+aDigZPzi5r5SBxzSjuw9JJmJ66t7b+v1FTdMumGTgyDzRQQPr8DdBBV9rZVi+BOfGz
         MHHddi+8TQwk5glbosvXQNmOYc9byyS7cr68INR5mxfIdj3SKNY4OUgJOyD4+qsOUz8P
         hx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IZPY0c5FjkOHFRaZSW2ssJETIFjDus/Ul5FlLZ8TZl0=;
        b=lI5FK/Ui1K+77PCJvLWTB84lI2gJ02JzbMkzzGt2Nw30KuB98gYpVvAnLGTdpjvL3S
         YHWkOxdKYZioAA4aDhHjXoV/XBRikcxuyGkCbgF06nb0gXfFhSbD+uEl6qC1FrpsLjew
         TE+4nMGmmyo16aNlmes9NS5Q2eQWycIm8mKVnFtw5pTRwPbBeuTFat7knxwwavjeXM85
         T0qqaKE3pfHS6J1jwxN9aoWOAJMfEAL6QVJNyzexpfl+uFv5kDYv5sZmNe/sE7hLElaQ
         ODj4dSWb4z9wWVvxI/7HG8yvDBJ261iGlheBM9e9yYLXP+Mnp29vNP+soCvUawQBBxVM
         0f0Q==
X-Gm-Message-State: AOAM530cnArft0CcpNY72IByQHlFaD+p2Vt9F3E53ylyXGuqWM+SycM0
	zfcyeqIBY6vIzwiXt7TTOYttskY0M9yfxkavq2E=
X-Google-Smtp-Source: ABdhPJz1vCE5hS4w1V1gue1bq1CF83pDihaT1oM3FWuvssGgKJfmCSQSeTOvWvcCJclIwhKQhRaow57VNy1f0DTQrkw=
X-Received: by 2002:a05:6402:2070:: with SMTP id bd16mr15098584edb.358.1603712135449;
 Mon, 26 Oct 2020 04:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
 <20201017142935.3605756-5-quaresma.jose@gmail.com> <fd4eccc67f224c21b957742e33988bfd@XBOX03.axis.com>
 <CANPvuR=gnBY5euwoXzvBLQ9dVoaiqwJt18oS1GW3d_rQOchQfg@mail.gmail.com>
In-Reply-To: <CANPvuR=gnBY5euwoXzvBLQ9dVoaiqwJt18oS1GW3d_rQOchQfg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 26 Oct 2020 11:35:31 +0000
Message-ID: <CANPvuR=U9ZGG2sbeCLPLY5sdtCikg3-+hO7GF-JjW0OLqaU2fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

This has been fixed on V4 with your suggestion.
Thanks.

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia segunda,
19/10/2020 =C3=A0(s) 11:10:
>
> This patch it's only a little fix in the identencion and it can be
> dropped from the series.
> This is not really necessary for now and I don't need a new revision
> only to fix this patch.
>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia
> segunda, 19/10/2020 =C3=A0(s) 09:29:
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Jose Quaresma
> > > Sent: den 17 oktober 2020 16:30
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Jose Quaresma <quaresma.jose@gmail.com>
> > > Subject: [OE-core] [PATCH v3 5/5] spirv-tools: fix identation
> > >
> > > replace tabs with spaces and remove extra spaces
> > >
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > ---
> > >  meta/recipes-graphics/spir/spirv-tools_git.bb | 20 +++++++++--------=
--
> > >  1 file changed, 10 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/rec=
ipes-graphics/spir/spirv-tools_git.bb
> > > index d1c2436cd9..8c4d4299ed 100644
> > > --- a/meta/recipes-graphics/spir/spirv-tools_git.bb
> > > +++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
> > > @@ -9,12 +9,12 @@ SECTION =3D "graphics"
> > >  S =3D "${WORKDIR}/git"
> > >  DEST_DIR =3D "${S}/external"
> > >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;name=3Dsp=
irv-tools \
> > > -     git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspirv-he=
aders;destsuffix=3D${DEST_DIR}/spirv-headers \
> > > -     git://github.com/google/effcee.git;name=3Deffcee;destsuffix=3D$=
{DEST_DIR}/effcee \
> > > -     git://github.com/google/re2.git;name=3Dre2;destsuffix=3D${DEST_=
DIR}/re2 \
> > > -     git://github.com/google/googletest.git;name=3Dgoogletest;destsu=
ffix=3D${DEST_DIR}/googletest \
> > > -        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-=
file.patch \
> > > -        file://0001-Avoid-pessimizing-std-move-3124.patch \
> > > +           git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dsp=
irv-headers;destsuffix=3D${DEST_DIR}/spirv-headers \
> > > +           git://github.com/google/effcee.git;name=3Deffcee;destsuff=
ix=3D${DEST_DIR}/effcee \
> > > +           git://github.com/google/re2.git;name=3Dre2;destsuffix=3D$=
{DEST_DIR}/re2 \
> > > +           git://github.com/google/googletest.git;name=3Dgoogletest;=
destsuffix=3D${DEST_DIR}/googletest \
> > > +           file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMa=
ke-file.patch;destsuffix=3D${DEST_DIR}/effcee \
> > > +           file://0001-Avoid-pessimizing-std-move-3124.patch \
> > >  "
> > >  SRCREV_spirv-tools =3D "c413b982c316b14e784f50d941814fc737b55b4a"
> > >  SRCREV_spirv-headers =3D "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
> > > @@ -27,10 +27,10 @@ inherit cmake python3native
> > >  EXTRA_OECMAKE +=3D "-DSPIRV_WERROR=3DOFF"
> > >
> > >  do_install_append() {
> > > -     install -d ${D}/${includedir}/spirv
> > > -     install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* $=
{D}/${includedir}/spirv
> > > -     install -d ${D}/${includedir}/spirv/unified1
> > > -     install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified=
1/* ${D}/${includedir}/spirv/unified1
> > > +    install -d ${D}/${includedir}/spirv
> > > +    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${=
D}/${includedir}/spirv
> > > +    install -d ${D}/${includedir}/spirv/unified1
> > > +    install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1=
/* ${D}/${includedir}/spirv/unified1
> >
> > Shell code in OE-Core is actually expected to be indented using tabs,
> > so this part should be reverted. However, while you are here, you
> > should change "${D}/${includedir}" to "${D}${includedir}".
> >
> > >  }
> > >
> > >  FILES_SOLIBSDEV =3D ""
> > > --
> > > 2.28.0
> >
> > //Peter
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
