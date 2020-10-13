Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.5294.1602621580591271854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 13:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=anFFX4Pp;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id qp15so1695815ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rMBFwzqlfHn5BcnQWDJ/QHS+9GYM601cO2gL0zdZDtI=;
        b=anFFX4Ppr0AL9eguFSNqJ++lWp32EovL+xZdARnCd9W5ueAicfUyxA6O8ObUmHAA+/
         8HnOrtvQgA5cfGc/wQ1+JPFici5TlULeFg6u3vG9XZKWI3YRbntgjTdeAKSQe5MBDwBN
         RQcCHudu2eaqjqHolTGxN/eqAfMIS63DDlk1bO+YsQWbiXMyMsviQElGev6YwW94E1CB
         kt2p30y2vn66t+Ae2jcsEpaeg+j8TDm0A0drtr0iE5DZoidKMJncALQchTp3IknsSn3p
         O6SVjK0Vh+9s4UsMOCWiZCiapSY33W/Ev5C8WSVj0EoHiXMr4a9QGwoJeO6XdYxslPbh
         po6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rMBFwzqlfHn5BcnQWDJ/QHS+9GYM601cO2gL0zdZDtI=;
        b=JT4cKsZnt68qxTNpwdF4fvWRLUYU9E1YSmBmQrDMTRZ2oUge2kvh/EX3IssE4fi2Pb
         wbhGm5D/TaCZYRP+xCF4vN7CvfkzdtN288ahDwHxr4y0npwIw3uc0so+fA6k/pDvkmBJ
         xKR2W/Kkd36nWq5B+5wc8G9ySeoBuLmfdiVVi3m/jJe1vDFLYq87UTUw5zCPN9sYjucS
         DK0u2n1VWefPC6STqK8JfU/DIg2JEyBjk10Qx/ssbQBNKCAfdqQDgDXMZrR5gf4mn6+X
         hIvBVH4xnH2osaa+aA3vjyzBl4C36fxwnv654zoMkDMiQjYCxeA+v08eo4SskNP3UKJR
         ad8w==
X-Gm-Message-State: AOAM532CBsWjq2Z9h/SBOyUhu0GPdKWSrmNLyMUO8kgLOKeucGHkCQSw
	Me20bA7IUx32zatVNkh+zjPOxD7vbdC7ZTG8WyE=
X-Google-Smtp-Source: ABdhPJzle+ZkvnI0ynnINrkAyB9zmBx1aW8NYn73nrY3iBaRa8WhnN14M3mxbdrXU7esPw9luAapkMV7ioJVcyWsP6s=
X-Received: by 2002:a17:906:d7ad:: with SMTP id pk13mr1616848ejb.33.1602621578835;
 Tue, 13 Oct 2020 13:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
 <20201013173502.2245733-4-quaresma.jose@gmail.com> <CAHtQpK7jDLgFq3GNgCW9A7PE-z-cdCn_4pceFKMFON_-CQWAJw@mail.gmail.com>
In-Reply-To: <CAHtQpK7jDLgFq3GNgCW9A7PE-z-cdCn_4pceFKMFON_-CQWAJw@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 21:39:29 +0100
Message-ID: <CANPvuRkkgUhJycN=FgA19j=fJpYbrNuWmrt7P_AViY7MN-wK4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] glslang: add receipe
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrey Zhizhikin <andrey.z@gmail.com> escreveu no dia ter=C3=A7a,
13/10/2020 =C3=A0(s) 19:54:
>
> On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
> >
> > Glslang is the official reference compiler front end for the
> > OpenGL ES and OpenGL shading languages. It implements a strict interpr=
etation
> > of the specifications for these languages. It is open and free for any=
one to use,
> > either from a command line or programmatically.
> >
> > This receipe is needed to build the new shaderc
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../glslang/glslang_8.13.3559.bb              | 19 ++++++++++++++++++=
+
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> >
> > diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb b/meta=
/recipes-graphics/glslang/glslang_8.13.3559.bb
> > new file mode 100644
> > index 0000000000..2008ba59d8
> > --- /dev/null
> > +++ b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "OpenGL / OpenGL ES Reference Compiler"
> > +DESCRIPTION =3D "Glslang is the official reference compiler front end=
 for the \
> > +OpenGL ES and OpenGL shading languages. It implements a strict interp=
retation \
> > +of the specifications for these languages. It is open and free for an=
yone to use, \
> > +either from a command line or programmatically."
> > +SECTION =3D "graphics"
> > +HOMEPAGE =3D "https://www.khronos.org/opengles/sdk/tools/Reference-Co=
mpiler"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D918e668376010a04448a31=
2fb37ae69b"
> > +
> > +SRC_URI =3D "https://github.com/KhronosGroup/glslang/archive/${PV}.ta=
r.gz"
> > +SRC_URI[md5sum] =3D "cb32322377cee2bc1cee5b60ebe46133"
> > +SRC_URI[sha256sum] =3D "c58fdcf7e00943ba10f9ae565b2725ec9d5be7dab7c8e=
82cac72fcaa83c652ca"
>
> Any reason why archive is preferred here over GIT? I can see that the
> source repository has tags defined, so it would be better to use GIT
> instead of archive here.
>

There is no reason to use the archive here.
I will fix it in the next version and change it to git.

> > +
> > +inherit cmake python3native
> > +
> > +EXTRA_OECMAKE =3D ""
> This is not needed, as there are no extra cmake arguments supplied anywa=
y.
>

I will remove it.

> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.28.0
> >
> >
> >=20
> >
>
>
> --
> Regards,
> Andrey.



--=20
best regards,
Jos=C3=A9 Quaresma
