Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.5632.1602622379567894871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 13:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vEVbUqJN;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id dt13so1666150ejb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 13:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jm78hniESWPzuDqYZE6vAEfOS0pzq9ygwBa8fF/6PbM=;
        b=vEVbUqJNa9lS0XiWFEpeYz+rNm28KLJLElqH4ZQ7FSYrWT6Y37vwEARXM5m7TODCtn
         8AohpZ/pj81rdofqiMmn1yy2tRHeXbJbgBTLZWNuzp+rkzkjaKt+dPuw0XYTFnlHwt4J
         /ci8gUXj2oTtKCxvqVuqY4BfTgivB5x28Dl+iTGo2RD2Xa/iyxWyAupxGWxIDdsLe1DU
         6+Dujafg3m1wrpKrs/1JFuh+6hMa6Le0nMft9Uqj28hKOQBN5OJqjX8Haxzx8qeKiZp/
         JWAy+VfmIDisBX9cduW4o5ylOahGK3bJYOdEiOWfxiiA9yZYiKs4nT14Iqhk3EPDiBeL
         leSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jm78hniESWPzuDqYZE6vAEfOS0pzq9ygwBa8fF/6PbM=;
        b=qf0lhjMQlgOLmsOnwxhBTmpWxUp/ZC7uHOfG6SQCoUbRPtc3EMCYEuM821cw30aj+J
         gwL7IWBvkfeY9ic3hk2k1ldXUQ1DaEbhsVg/MlcSHfEbLZ8QmqE+GbRodRu6wu4gCROD
         bnQ5iOmVoQZMJLIjNeNsVmhGLI8jjvIqqWI5hZbTz1G/sQNamdd3nI3yQDDE8oc0QK+h
         Ueh/ezMFYVLGVdVYQaOd/R1I/OXeQaEvdgDTkA+ZS/i13yv6hyw8Ql6K+a8iZlyKlQR1
         bWblwx3JyfDsU6JmBcBIsLl/KiUSV8hL+i6LJyEZrAztfsGeI7W/a/H473E2PfmusxYA
         t38w==
X-Gm-Message-State: AOAM532bbm5u6YDQPCWfIBIxzqVhPV5Hs7JslnlbGmiYFQspAhTLJQL3
	1kHRw42s4xh9FyANfm6/ycKKwbA2lSMl67FADk0=
X-Google-Smtp-Source: ABdhPJzmrQcBVNyCnPDiohH2+HONGFmQTZ8Ozze/bLNpeUfCxbuPt0uiCHvH2xt+As0wgB0VvS63NGhQC+5d9p0M15k=
X-Received: by 2002:a17:906:5509:: with SMTP id r9mr1797902ejp.12.1602622378037;
 Tue, 13 Oct 2020 13:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
 <20201013173502.2245733-6-quaresma.jose@gmail.com> <CAHtQpK5wRtUgWGfc2dmeu5ousr38TTpn8=zc09KGSF6N8Ok0nA@mail.gmail.com>
In-Reply-To: <CAHtQpK5wRtUgWGfc2dmeu5ousr38TTpn8=zc09KGSF6N8Ok0nA@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 21:52:48 +0100
Message-ID: <CANPvuRmkjyrcthy_V4nQmR4eqdyeU6s+QJgTHvC6h9SknBxOVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] shaderc: enable only native build as the target is failing
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrey Zhizhikin <andrey.z@gmail.com> escreveu no dia ter=C3=A7a,
13/10/2020 =C3=A0(s) 19:58:
>
> On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
> >
> > For now, only the native build its working.
> > The target build is failing, when we can build for target
> > this commit can be reverted.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../shaderc/{shaderc_2019.0.bb =3D> shaderc-native_2019.0.bb} | 6 +++=
++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >  rename meta/recipes-graphics/shaderc/{shaderc_2019.0.bb =3D> shaderc-=
native_2019.0.bb} (86%)
> >
> > diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/re=
cipes-graphics/shaderc/shaderc-native_2019.0.bb
> > similarity index 86%
> > rename from meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> > rename to meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> > index ac3db09937..4e095e1243 100644
> > --- a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> > +++ b/meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> > @@ -33,4 +33,8 @@ do_configure_prepend() {
> >  EOF
> >  }
> >
> > -BBCLASSEXTEND =3D "native nativesdk"
> > +# TODO: for now only the native build its working
> > +# the target build is failing, when the target builds
> > +# we can drop this inherit and rename the receipe.
> > +inherit native
> > +#BBCLASSEXTEND =3D "native nativesdk"
>
> Maybe BBCLASSEXTEND =3D "native" then? Why leave a stale commented code =
here?

with BBCLASSEXTEND =3D "native" the build fail when i run: bitbake shaderc

>
> More generic: should the failed target build be investigated further
> here? Is there any severe technical problem that should be solved
> here?

This commit is only to find some help in building shaderc for the target.
If anyone needs to build the gstreamer plugin on the target it will need
the shaderc on the target.

Because of these constraints in building for the target I rename the
recipe to only support native build.
Some extra pacthes are required to build it for the target and I need
some help for this.

>
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
