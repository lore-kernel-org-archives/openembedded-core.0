Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.7200.1602626608119459380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 15:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N4SviO17;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id 33so1013611edq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ugf77IJtPryizVtfx4j3Gsi685TxyKj1AggAT505hU=;
        b=N4SviO17clo7mx+vCnOmHd3A+VC9M3ottekMMi8Et6gA2nTbiYRbPTXs3UmZc2yfWD
         y5tIeETRHsIWsjSIPWvYH0XdTQNTLX+UdsCb7GjL/qEKrqF/szFzx4/0z63f/uxfTD2k
         yH8zwVzTUcAgRnfxlBjbng0i0lwG7D/9dv8WLNx3oktWwVMUe4SpSRTj+9rVSfpomj+y
         yB70pdGpghNgklqMk1+HnmyBRvueo/b3VMKPrDHAXx+9DQRZHrzsW1tHdNMQIduR5+7d
         JkC0tGr5nixciz+iu2yydet+Ssmzpq8hiirWVEgWvshAFt2TS6FQF2DnnpHRNNe7DY8k
         Aa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ugf77IJtPryizVtfx4j3Gsi685TxyKj1AggAT505hU=;
        b=s1V6pQ6vvLAmSB0+YW+sxNkFCmm1Yk75qX6WXKMvPBPvDwRU8idkjukv+07YCXaPJt
         A5MxtyciEdXYcc4uImGoIjMBGpSDrsuzs4O9wPZyfi/HfBmbWmqnvIEHVS2yXD7KlWx0
         4hBnq8lqQ8YVhibOr+elhHAtojHetw6wx/H7pbqdmXggoeC/qfdwONuIqtJl6T4oLxwG
         uas14rEdDMDZG3/z1eKP82g8cjorvcmRqiyR25URdZbnspz4hbDgOTPVBT1SBb79kr1s
         Q+9woQBqg3iu/IWOZd+VOPcI2jmQ8CbSJubYqEguX00HfDKAes5zJYambzjgfbvUjDle
         trYw==
X-Gm-Message-State: AOAM5310nJHZtxr5NLHCeMiWxPXwDy52gq1zRefdy6xlAgtSGOdM1dif
	nXyGD0HA+ed39KFX4ssuoX5hdKwWpbcZ4T9rgtE=
X-Google-Smtp-Source: ABdhPJxL+9x+xpqsf+o7wdaySBsWWd/lp+rRC2tNl4quAqHhdg9Cl54LwclgK0kw8zo0Xxe+nhesD1f2vRokQogVso8=
X-Received: by 2002:aa7:c3c7:: with SMTP id l7mr1822959edr.213.1602626606378;
 Tue, 13 Oct 2020 15:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
 <20201013173502.2245733-6-quaresma.jose@gmail.com> <CAHtQpK5wRtUgWGfc2dmeu5ousr38TTpn8=zc09KGSF6N8Ok0nA@mail.gmail.com>
 <CANPvuRmkjyrcthy_V4nQmR4eqdyeU6s+QJgTHvC6h9SknBxOVQ@mail.gmail.com>
In-Reply-To: <CANPvuRmkjyrcthy_V4nQmR4eqdyeU6s+QJgTHvC6h9SknBxOVQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 23:03:16 +0100
Message-ID: <CANPvuRmSsLXFYm1azE3QkMLCwq2g62+qXeoih9hXiWYkeuNsmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] shaderc: enable only native build as the target is failing
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have fixed this!

the mistake are:

-DEPENDS =3D "spirv-tools-native glslang-native"
+DEPENDS =3D "spirv-tools glslang"

I drop this patch on V2

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia ter=C3=A7a,
13/10/2020 =C3=A0(s) 21:52:
>
> Andrey Zhizhikin <andrey.z@gmail.com> escreveu no dia ter=C3=A7a,
> 13/10/2020 =C3=A0(s) 19:58:
> >
> > On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com=
> wrote:
> > >
> > > For now, only the native build its working.
> > > The target build is failing, when we can build for target
> > > this commit can be reverted.
> > >
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > ---
> > >  .../shaderc/{shaderc_2019.0.bb =3D> shaderc-native_2019.0.bb} | 6 +=
++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >  rename meta/recipes-graphics/shaderc/{shaderc_2019.0.bb =3D> shader=
c-native_2019.0.bb} (86%)
> > >
> > > diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/=
recipes-graphics/shaderc/shaderc-native_2019.0.bb
> > > similarity index 86%
> > > rename from meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> > > rename to meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> > > index ac3db09937..4e095e1243 100644
> > > --- a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> > > +++ b/meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> > > @@ -33,4 +33,8 @@ do_configure_prepend() {
> > >  EOF
> > >  }
> > >
> > > -BBCLASSEXTEND =3D "native nativesdk"
> > > +# TODO: for now only the native build its working
> > > +# the target build is failing, when the target builds
> > > +# we can drop this inherit and rename the receipe.
> > > +inherit native
> > > +#BBCLASSEXTEND =3D "native nativesdk"
> >
> > Maybe BBCLASSEXTEND =3D "native" then? Why leave a stale commented cod=
e here?
>
> with BBCLASSEXTEND =3D "native" the build fail when i run: bitbake shade=
rc
>
> >
> > More generic: should the failed target build be investigated further
> > here? Is there any severe technical problem that should be solved
> > here?
>
> This commit is only to find some help in building shaderc for the target=
.
> If anyone needs to build the gstreamer plugin on the target it will need
> the shaderc on the target.
>
> Because of these constraints in building for the target I rename the
> recipe to only support native build.
> Some extra pacthes are required to build it for the target and I need
> some help for this.
>
> >
> > > --
> > > 2.28.0
> > >
> > >
> > >=20
> > >
> >
> >
> > --
> > Regards,
> > Andrey.
>
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
