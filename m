Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62FDC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 18:37:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.1531.1645900670427693165
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 10:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRYX9s4E;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id qk11so17119677ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sv2X9tPETvCtSWZPLNo+n8HAK6eJGbBXZ9CRj1ysycE=;
        b=gRYX9s4EO4n8xnU1vdz7YZhjudQB9pDyehmlxWgaEdJIZwLbFVbm0ZZqbuXNZDzvut
         +26eFvSI2QdbLuflnBzahEu8EjjJBX0VXeoy4VBQF3Er7VptMbSLXEatQCF1Uh8xdfny
         jIQmMicGPYPony7M9i5hfWUaPURD02h/Y9lqbaJDlKCdv1iS24425bUJ1ghfdaxSAbup
         leucc6kK3f+VGNVV6J07fott4xk+GXjyCxsKZ9hYDGGzgtg6LmXKMoM4iWMnKfRVMAmJ
         tXb+RJcfIdgkIDkAk4I1xFn/R/7KHxv6ael9br75Fvp3t78QTJideiutuA9wXnOZlyIi
         okXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sv2X9tPETvCtSWZPLNo+n8HAK6eJGbBXZ9CRj1ysycE=;
        b=ziWiSNGJ3RLd8mJHYzG8zZFpMhEil1pZGnZv/AsoEJCTAKNEeNX9JPeQvtkiVMFbbd
         rw08V0jMDv5cGlkd+CyFaJmx0zlui7yskseK4F65GaC9klipvCe/zyyNQFFRO+rWw+ks
         29Bu0Q4qfx7QTk28yRXgjAO5GZxFx0wNdmJUuF/fu/6uew900UxlT0sKrB8rZyaTlvH9
         uvc1Ibklp4NR75tcUBY1PmqbP6Og5aHSfnxfLdwWA+ZJUv2ukHSZ6QNtA/Tq4kFMHook
         5AUQsgmoDv1a5M5X5QBlH+dqUT4UziSRsWK9/7Szf1eg1uyOSTavEQPwo1pioFFkzt0o
         pUHw==
X-Gm-Message-State: AOAM530ERrJMGkOPJEhGEBkjDEQGO3IgxmIvyv9/azDVvriZ6jgnd+JV
	7TC4QUUkTDuFG9zwkbkV/lwZ8Z8wapQZwI06qGI=
X-Google-Smtp-Source: 
 ABdhPJw7LDhdqBZ2DRB2RxNidOXqPCH2diMDWJsCUtOFL0vVFpzf/RglCHI1ximz6kQNeyFDvK1JEMUR82C+YnJovwM=
X-Received: by 2002:a17:906:f293:b0:6b6:bc93:f01f with SMTP id
 gu19-20020a170906f29300b006b6bc93f01fmr9648847ejb.743.1645900668929; Sat, 26
 Feb 2022 10:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20220225234317.668778-1-tim.orling@konsulko.com>
 <75da2ee2701f904fb0dd7f898eebf8f6927534b8.camel@linuxfoundation.org>
In-Reply-To: 
 <75da2ee2701f904fb0dd7f898eebf8f6927534b8.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 26 Feb 2022 10:37:37 -0800
Message-ID: 
 <CANx9H-BPX3p0-P-xNsO8_wFdH9Sc6Q7coHXpU4NDoVQ7LHbDHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] setuptools3.bbclass: add check for
 pyproject.toml
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000b50a6105d8f01c99"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 18:37:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162429

--000000000000b50a6105d8f01c99
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 11:27 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2022-02-25 at 15:43 -0800, Tim Orling wrote:
> > From: Tim Orling <ticotimo@gmail.com>
> >
> > With help from Peter Kjellerstedt <peter.kjellerstedt@axis.com> via IRC.
> >
> > Add a check for pyproject.toml in ${S} and if so check if it has a
> > [build-system] build-backend. Give the user a helpful warning that
> > the recipe should be changed to one of the PEP-517 classes (instead of
> > setuptools3.bbclass).
> >
> > Add SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK variable to skip this check (and
> > avoid the warning). This is needed for e.g.
> > python3-setuptools-rust-native which does not build cleanly with
> > setuptools_build_meta.bbclass
> >
> > Because some sources have a pyproject.toml but no [build-sytem] or no
> > properly defined (or accurate) build-backend, add a try: except: clause
> > to avoid KeyError.
> >
> > [YOCTO #14736]
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  meta/classes/setuptools3.bbclass | 41 ++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/meta/classes/setuptools3.bbclass
> b/meta/classes/setuptools3.bbclass
> > index 12561340b07..d80a91d3296 100644
> > --- a/meta/classes/setuptools3.bbclass
> > +++ b/meta/classes/setuptools3.bbclass
> > @@ -18,6 +18,47 @@ setuptools3_do_configure() {
> >      :
> >  }
> >
> > +SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK ?= "0"
> > +
> > +python check_for_pyprojecttoml_build_backend() {
> > +    import os
> > +    import tomli
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4833/steps/12/logs/stdio
>
> Exception: ModuleNotFoundError: No module named 'tomli'
>

Ah. Right. This is the chicken and egg problem of needing a TOML parser.
I really wish upstream had added one to the standard libs.


>
> Cheers,
>
> Richard
>
> > +    from pathlib import Path
> > +
> > +    if d.getVar('SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK') == "1":
> > +        bb.debug(3, "Skipping check for build-backend in
> pyproject.toml")
> > +        return 0
> > +    warn_string = "The source has a pyproject.toml which declares '%s'
> as a build backend, please consider 'inherit %s' instead of inheriting
> setuptools3."
> > +    warn_layer_string = "The source has a pyproject.toml which declares
> '%s' as a build backend, please consider 'inherit %s' from %s instead of
> inheriting setuptools3."
> > +    pyprojecttoml_file = Path(d.getVar('S'), 'pyproject.toml')
> > +    if pyprojecttoml_file.exists():
> > +        bb.debug(3, "pyproject.toml found: %s" % pyprojecttoml_file)
> > +        with open(pyprojecttoml_file, "rb") as f:
> > +            pyprojecttoml_dict = tomli.load(f)
> > +            try:
> > +                build_system = pyprojecttoml_dict["build-system"]
> > +                if build_system:
> > +                    bb.debug(3, "[build-system] found in
> pyproject.toml")
> > +                    backend = build_system.get('build-backend')
> > +                    if backend:
> > +                        bb.debug(3, "build-backend found: %s" % backend)
> > +                    if backend == "flit_core.buildapi":
> > +                        bb.warn(warn_string % ('flit_core.buildapi',
> > +                                               'flit_core'))
> > +                    elif backend == "setuptools.build_meta":
> > +                        bb.warn(warn_string % ('setuptools.build_meta',
> > +                                              'setuptools_build_meta'))
> > +                    elif backend == "poetry.core.masonry.api":
> > +                        bb.warn(warn_layer_string %
> ('poetry.core.masonry.api',
> > +                                                     'poetry_core',
> 'meta-python'))
> > +                    else:
> > +                        bb.warn("The source has a pyproject.toml which
> declares '%s' as a build backend, but this is not currently supported in
> oe-core." % backend)
> > +            except KeyError:
> > +                bb.warn("The source has a pyproject.toml, but either no
> [build-system] or it is malformed. If the recipe is still buildable with
> setuptools3, you can skip this check
> with:\nSETUPTOOLS_SKIP_BUILD_BACKEND_CHECK= \"1\"")
> > +                pass
> > +}
> > +do_configure[prefuncs] += "check_for_pyprojecttoml_build_backend"
> > +
> >  setuptools3_do_compile() {
> >          cd ${SETUPTOOLS_SETUP_PATH}
> >          NO_FETCH_BUILD=1 \
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162414):
> https://lists.openembedded.org/g/openembedded-core/message/162414
> > Mute This Topic: https://lists.openembedded.org/mt/89401217/1686473
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> richard.purdie@linuxfoundation.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
>

--000000000000b50a6105d8f01c99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 25, 2022 at 11:27 PM Rich=
ard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richar=
d.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Fri, 2022-02-25 at 15:43 -0800, Tim Orling w=
rote:<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_=
blank">ticotimo@gmail.com</a>&gt;<br>
&gt; <br>
&gt; With help from Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt; via IR=
C.<br>
&gt; <br>
&gt; Add a check for pyproject.toml in ${S} and if so check if it has a<br>
&gt; [build-system] build-backend. Give the user a helpful warning that<br>
&gt; the recipe should be changed to one of the PEP-517 classes (instead of=
<br>
&gt; setuptools3.bbclass).<br>
&gt; <br>
&gt; Add SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK variable to skip this check (a=
nd<br>
&gt; avoid the warning). This is needed for e.g.<br>
&gt; python3-setuptools-rust-native which does not build cleanly with<br>
&gt; setuptools_build_meta.bbclass<br>
&gt; <br>
&gt; Because some sources have a pyproject.toml but no [build-sytem] or no<=
br>
&gt; properly defined (or accurate) build-backend, add a try: except: claus=
e<br>
&gt; to avoid KeyError.<br>
&gt; <br>
&gt; [YOCTO #14736]<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/setuptools3.bbclass | 41 ++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptool=
s3.bbclass<br>
&gt; index 12561340b07..d80a91d3296 100644<br>
&gt; --- a/meta/classes/setuptools3.bbclass<br>
&gt; +++ b/meta/classes/setuptools3.bbclass<br>
&gt; @@ -18,6 +18,47 @@ setuptools3_do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK ?=3D &quot;0&quot;<br>
&gt; +<br>
&gt; +python check_for_pyprojecttoml_build_backend() {<br>
&gt; +=C2=A0 =C2=A0 import os<br>
&gt; +=C2=A0 =C2=A0 import tomli<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/4833/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4833/steps/12/logs/=
stdio</a><br>
<br>
Exception: ModuleNotFoundError: No module named &#39;tomli&#39;<br></blockq=
uote><div><br></div><div>Ah. Right. This is the chicken and egg problem of =
needing a TOML parser.</div><div>I really wish upstream had added one to th=
e standard libs.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; +=C2=A0 =C2=A0 from pathlib import Path<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK&#3=
9;) =3D=3D &quot;1&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(3, &quot;Skipping check for buil=
d-backend in pyproject.toml&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; +=C2=A0 =C2=A0 warn_string =3D &quot;The source has a pyproject.toml w=
hich declares &#39;%s&#39; as a build backend, please consider &#39;inherit=
 %s&#39; instead of inheriting setuptools3.&quot;<br>
&gt; +=C2=A0 =C2=A0 warn_layer_string =3D &quot;The source has a pyproject.=
toml which declares &#39;%s&#39; as a build backend, please consider &#39;i=
nherit %s&#39; from %s instead of inheriting setuptools3.&quot;<br>
&gt; +=C2=A0 =C2=A0 pyprojecttoml_file =3D Path(d.getVar(&#39;S&#39;), &#39=
;pyproject.toml&#39;)<br>
&gt; +=C2=A0 =C2=A0 if pyprojecttoml_file.exists():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(3, &quot;pyproject.toml found: %=
s&quot; % pyprojecttoml_file)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(pyprojecttoml_file, &quot;rb&qu=
ot;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyprojecttoml_dict =3D toml=
i.load(f)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_system =
=3D pyprojecttoml_dict[&quot;build-system&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if build_syst=
em:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.debug(3, &quot;[build-system] found in pyproject.toml&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 backend =3D build_system.get(&#39;build-backend&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if backend:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.debug(3, &quot;build-backend found: %s&quot; % backend)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if backend =3D=3D &quot;flit_core.buildapi&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.warn(warn_string % (&#39;flit_core.buildapi&#39;, <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;flit_core&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 elif backend =3D=3D &quot;setuptools.build_meta&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.warn(warn_string % (&#39;setuptools.build_meta&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;setuptools_build_meta&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 elif backend =3D=3D &quot;poetry.core.masonry.api&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.warn(warn_layer_string % (&#39;poetry.core.masonry.api&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;poetry_core&#39;, &#39;me=
ta-python&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.warn(&quot;The source has a pyproject.toml which declares=
 &#39;%s&#39; as a build backend, but this is not currently supported in oe=
-core.&quot; % backend)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;The source has a pyproject.toml, but either no [build-system] or it is mal=
formed. If the recipe is still buildable with setuptools3, you can skip thi=
s check with:\nSETUPTOOLS_SKIP_BUILD_BACKEND_CHECK=3D \&quot;1\&quot;&quot;=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +}<br>
&gt; +do_configure[prefuncs] +=3D &quot;check_for_pyprojecttoml_build_backe=
nd&quot;<br>
&gt; +<br>
&gt;=C2=A0 setuptools3_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${SETUPTOOLS_SETUP_PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NO_FETCH_BUILD=3D1 \<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162414): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162414" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162414</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89401217=
/1686473" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89401217/1686473</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--000000000000b50a6105d8f01c99--

