Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F67EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 04:51:54 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.4133.1687323106208568881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 21:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: aehs29@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1a9b0ec6f4cso5041287fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 21:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687323105; x=1689915105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6koEVQhGIFNRv1a6dwQovbMFi9ligZPAeNYF/MYNPJ0=;
        b=evH2MHA1vsZUjZzI0UfVgSoD30Z7ksB88EOPB9/5NN4/5Hb4JgxmVxgc0eJ3tjfN9P
         raG1yUJ1gMiatkz+Zq3rwf8zFysrs6eSAkAMFp/zYJg+0baIYzY8NkGFmY+JnD5W7HJ5
         Kc6/chTga/zrlYbynm0Mdxmkfp8i5Fztc8icyFNRRBcJp/LVu57UkSdjYZQAdjdqWX98
         sPL7G0Oemk+//PdlUlCiTD/T8R0Lc8GJ2SK5nQfGaH50iNKn0XM8E68PGtEM9UQhRZ9i
         yw4k05UvQcy+Y5C2BDeb0vKsSuLfj6MfHeUIjWieJZqvTfnV6bE1UwtIoI9owJBBZJdF
         BrPw==
X-Gm-Message-State: AC+VfDzENRjwHPx6aLDTS8wNWoejXBdqVNXKxrycRwOvTmhxdm5vzit0
	91QTKNUgkADP+PSa4yuwrxp9HVSm8JUMwg==
X-Google-Smtp-Source: ACHHUZ6iV7XZkzyCULF0TuoMVbMCSinD9KYowzdIMTnv14E48EzNlGkYaDtnISSjrdy+yK6vD66mmA==
X-Received: by 2002:a05:6870:3a1c:b0:1a9:b063:67a4 with SMTP id du28-20020a0568703a1c00b001a9b06367a4mr8492175oab.38.1687323105035;
        Tue, 20 Jun 2023 21:51:45 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id hq15-20020a0568709b0f00b001acfd23ca84sm1319686oab.6.2023.06.20.21.51.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 21:51:44 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1a994308bc6so5018895fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 21:51:44 -0700 (PDT)
X-Received: by 2002:a05:6870:5253:b0:1a3:365:a8d5 with SMTP id
 o19-20020a056870525300b001a30365a8d5mr11972728oai.48.1687323104206; Tue, 20
 Jun 2023 21:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230609221242.2961719-1-alejandro@enedino.org> <7f7e7896f21211c149f8722fa0315639163e6a89.camel@linuxfoundation.org>
In-Reply-To: <7f7e7896f21211c149f8722fa0315639163e6a89.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Tue, 20 Jun 2023 22:51:32 -0600
X-Gmail-Original-Message-ID: <CAHMutrafwhYaDsYNuB+z-JROWtr6kn8uEscskn7sUd_b1APmZA@mail.gmail.com>
Message-ID: <CAHMutrafwhYaDsYNuB+z-JROWtr6kn8uEscskn7sUd_b1APmZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Update SRCREV to fix
 entry addresses for ARM architectures
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003f658905fe9c8638"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 04:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183166

--0000000000003f658905fe9c8638
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jun 2023 at 02:36, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-06-09 at 16:12 -0600, Alejandro Hernandez Samaniego wrote:
> > Update to the latest SRCREV to bring fixes using the proper entry
> > addresses for ARM architectures [1], as well as fixing a race condition
> > in the Makefile during assembly [2].
> >
> > Fix url in case automatic redirects stop working.
> >
> > [1]
> https://github.com/ahcbb6/baremetal-helloqemu/commit/602e82aee7ae95ee50eedb7f40c4a225ec5a3fb9
> > [2]
> https://github.com/ahcbb6/baremetal-helloqemu/commit/ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../baremetal-example/baremetal-helloworld_git.bb             | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > index 82b2901d51..4182372057 100644
> > --- a/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > +++ b/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > @@ -4,10 +4,10 @@ DESCRIPTION = "These are introductory examples to
> showcase the use of QEMU to ru
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
> >
> > -SRCREV = "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
> > +SRCREV = "ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec"
> >  PV = "0.1+git${SRCPV}"
> >
> > -SRC_URI = "git://
> github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
> > +SRC_URI = "git://
> github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
> >  UPSTREAM_VERSION_UNKNOWN="1"
> >
> >  S = "${WORKDIR}/git"
>
> I think there is a build race in here:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1609/steps/14/logs/stdio
>
> Fatal error: can't create build/hello_baremetal_aarch64.o: No such file
> or directory
>
> so perhaps racing on the creation of build/ ?
>
> Cheers,
>
> Richard
>
>
Apologies for the late reply, yes, one of the last update was an attempt to
fix such race condition, I will investigate further and send another update.

Alejandro

--0000000000003f658905fe9c8638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, 16 Jun 2023 at 02:36, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Fri, 2023-06-09 at 16:12 -0600, Alejandro Hernandez=
 Samaniego wrote:<br>
&gt; Update to the latest SRCREV to bring fixes using the proper entry<br>
&gt; addresses for ARM architectures [1], as well as fixing a race conditio=
n<br>
&gt; in the Makefile during assembly [2].<br>
&gt; <br>
&gt; Fix url in case automatic redirects stop working.<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/ahcbb6/baremetal-helloqemu/commit/60=
2e82aee7ae95ee50eedb7f40c4a225ec5a3fb9" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/ahcbb6/baremetal-helloqemu/commit/602e82aee7ae95ee50ee=
db7f40c4a225ec5a3fb9</a><br>
&gt; [2] <a href=3D"https://github.com/ahcbb6/baremetal-helloqemu/commit/ea=
7f59b02467ed1fb36c3b4c6d5cabe702df26ec" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/ahcbb6/baremetal-helloqemu/commit/ea7f59b02467ed1fb36c=
3b4c6d5cabe702df26ec</a><br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 .../baremetal-example/<a href=3D"http://baremetal-helloworld_git=
.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/baremetal-example/<a href=3D"http:/=
/baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">baremeta=
l-helloworld_git.bb</a> b/meta/recipes-extended/baremetal-example/<a href=
=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank=
">baremetal-helloworld_git.bb</a><br>
&gt; index 82b2901d51..4182372057 100644<br>
&gt; --- a/meta/recipes-extended/baremetal-example/<a href=3D"http://bareme=
tal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-hello=
world_git.bb</a><br>
&gt; +++ b/meta/recipes-extended/baremetal-example/<a href=3D"http://bareme=
tal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-hello=
world_git.bb</a><br>
&gt; @@ -4,10 +4,10 @@ DESCRIPTION =3D &quot;These are introductory example=
s to showcase the use of QEMU to ru<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D39346640a23c701e=
4f459e05f56f4449&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;22016ecbb9fb6c5f3a7a06698aea7ff8a701c166&quot;<br>
&gt; +SRCREV =3D &quot;ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec&quot;<br>
&gt;=C2=A0 PV =3D &quot;0.1+git${SRCPV}&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/aehs29/baremetal=
-helloqemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/aehs29/baremetal-helloqemu.git;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ahcbb6/baremetal=
-helloqemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/ahcbb6/baremetal-helloqemu.git;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_VERSION_UNKNOWN=3D&quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
I think there is a build race in here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/127/buil=
ds/1609/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1609/steps/14/log=
s/stdio</a><br>
<br>
Fatal error: can&#39;t create build/hello_baremetal_aarch64.o: No such file=
<br>
or directory<br>
<br>
so perhaps racing on the creation of build/ ?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br></blockquote><div>=C2=A0</div><div><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small">Apologies for the late re=
ply, yes, one of the last update was an attempt to fix such race condition,=
 I will investigate further and send another update.</div><div class=3D"gma=
il_default" style=3D"font-family:arial,sans-serif;font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-s=
ize:small">Alejandro</div><br></div><div>=C2=A0</div></div></div>

--0000000000003f658905fe9c8638--

