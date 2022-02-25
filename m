Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34238C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 04:47:42 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.3493.1645764461048772732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PEi68lYk;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id r13so8554506ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZVKPkqCK2k/Cy+d/pAApFBgOolSZEAjQejo+axA1jQ=;
        b=PEi68lYkjONJ9Tt4/qPHXrFXY4hDlgRVvL50CSCHdAmCon/7PArISJKQprXBtBk3At
         vBhGW9QgO1MWEALT9+oId/3s5mpzlfG4ZBxfhTNu7CA01QJF3ZzOaRcwuJhuae1pf1cc
         aKNq7Z0USlOS5BD1m41927cl7tIeo36iE/cQ2zkW2gcyPxbDUCtbJM0iaixGz90oavEe
         I6YyqrrveU19d3padhPcUubpI81+7jMWZ2C83W8zlpbb975Eu+aTg6KzLD/kjhDhZZVs
         gdJzgKvMhF+/PJSTUlLuzVdXsBoJU42iintUuLp+ymLPDm+8Hd/PPO312tc/s6werZVY
         KNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZVKPkqCK2k/Cy+d/pAApFBgOolSZEAjQejo+axA1jQ=;
        b=rkY1Cs6hNI3uz/kcHhkpjwbISueZHCnc5qdaHL5OnFJtJzEUf1uS3seNYXj3UQ4sTR
         C9OW6jsJgxn+VjxsHTX1p9faz8crXy7Y004NIL627n1i42m1kVcJX41zCxBAmK5+0fPY
         14tq+6EJluZnit5lMkAWI2nMuA7y/hdFLR65/zPxcDYlo86hxkIW+q27ugTOMZNbk9tb
         a0Lrx6AawQ0RBfUSDIoGkZf/fIY8mg70SJQ7or5V+iBNitPS2CUy8jZeWy3huyJo/HCv
         7b6Ek/qNyvOfSenOCP35ao5rQy/dQyk5chsLfU0AKudaI4rJtWBUG7gwK5T99H+/Xiv1
         pa3w==
X-Gm-Message-State: AOAM530g/u3dcWm44VjtsjygOsO51bKmgvetfOM5xYbsiVgaYws9KA5H
	Lq/UE/dY4uPG+PpYFL/j0fisvjRM1HIpyZHd6f0E7hkYbiQ=
X-Google-Smtp-Source: 
 ABdhPJyAMpNbE6eaDSEw1jZWturKKw2jL6MAI2xaMZdolLBV4UmlXeL+1WonbE13Rza5siDBR0RPyNdVs7uf3UNDS2E=
X-Received: by 2002:a17:906:3adb:b0:6b7:876c:d11b with SMTP id
 z27-20020a1709063adb00b006b7876cd11bmr4785635ejd.250.1645764458975; Thu, 24
 Feb 2022 20:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20220225040329.813595-1-tim.orling@konsulko.com>
In-Reply-To: <20220225040329.813595-1-tim.orling@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 24 Feb 2022 20:47:27 -0800
Message-ID: 
 <CANx9H-DTfQzE+Cma_WTek4g3+FbD=fXeVZz0Cm2JKgrW2b6UMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] setuptools3.bbclass: add check for pyproject.toml
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000f617b105d8d06537"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 04:47:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162337

--000000000000f617b105d8d06537
Content-Type: text/plain; charset="UTF-8"

Hold off on this one

On Thu, Feb 24, 2022 at 8:04 PM Tim Orling <ticotimo@gmail.com> wrote:

> From: Tim Orling <ticotimo@gmail.com>
>
> With help from Peter Kjellerstedt <peter.kjellerstedt@axis.com> via IRC.
>
> Add a check for pyproject.toml in ${S} and if so check if it has a
> [build-system] build-backend. Give the user a helpful warning that
> the recipe should be changed to one of the PEP-517 classes (instead of
> setuptools3.bbclass).
>
> Add SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK variable to skip this check (and
> avoid the warning). This is needed for e.g.
> python3-setuptools-rust-native which does not build cleanly with
> setuptools_build_meta.bbclass
>
> [YOCTO #14736]
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2:
>     fix whitespace errors
>
>  meta/classes/setuptools3.bbclass | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/meta/classes/setuptools3.bbclass
> b/meta/classes/setuptools3.bbclass
> index 12561340b07..12d662fb49c 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -18,6 +18,38 @@ setuptools3_do_configure() {
>      :
>  }
>
> +SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK ?= "0"
> +
> +python check_for_pyprojecttoml_build_backend() {
> +    import os
> +    import tomli
> +    from pathlib import Path
> +
> +    if d.getVar('SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK') == "1":
> +        bb.debug(3, "Skipping check for build-backend in pyproject.toml")
> +        return 0
> +    pyprojecttoml_file = Path(d.getVar('S'), 'pyproject.toml')
> +    if pyprojecttoml_file.exists():
> +        bb.debug(3, "pyproject.toml found: %s" % pyprojecttoml_file)
> +        with open(pyprojecttoml_file, "rb") as f:
> +            pyprojecttoml_dict = tomli.load(f)
> +            build_system = pyprojecttoml_dict["build-system"]
>

This needs results in KeyError when the source has pyproject.toml but not
[buiid-system],


> +            if build_system:
> +                bb.debug(3, "[build-system] found in pyproject.toml")
> +                backend = build_system.get('build-backend')
> +                if backend:
> +                    bb.debug(3, "build-backend found: %s" % backend)
> +                if backend == "flit_core.buildapi":
> +                    bb.warn("The source has a pyproject.toml which
> declares 'flit_core.buildapi' as a build backend, please consider 'inherit
> flit_core' instead of inheriting setuptools3.")
> +                elif backend == "setuptools.build_meta":
> +                    bb.warn("The source has a pyproject.toml which
> declares 'setuptools.build_meta' as a build backend, please consider
> 'inherit setuptools_build_meta' instead of inheriting setuptools3.")
> +                elif backend == "poetry.core.masonry.api":
> +                    bb.warn("The source has a pyproject.toml which
> declares 'poetry.core.masonry.api' as a build backend, please consider
> 'inherit poetry_core' from meta-python instead of inheriting setuptools3.")
> +                else:
> +                    bb.warn("The source has a pyproject.toml which
> declares '%s' as a build backend, but this is not currently supported in
> oe-core." % backend)
> +}
> +do_configure[prefuncs] += "check_for_pyprojecttoml_build_backend"
> +
>  setuptools3_do_compile() {
>          cd ${SETUPTOOLS_SETUP_PATH}
>          NO_FETCH_BUILD=1 \
> --
> 2.30.2
>
>

--000000000000f617b105d8d06537
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hold off on this one</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 24, 2022 at 8:04 PM T=
im Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">tic=
otimo@gmail.com</a>&gt;<br>
<br>
With help from Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt; via IRC.<br=
>
<br>
Add a check for pyproject.toml in ${S} and if so check if it has a<br>
[build-system] build-backend. Give the user a helpful warning that<br>
the recipe should be changed to one of the PEP-517 classes (instead of<br>
setuptools3.bbclass).<br>
<br>
Add SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK variable to skip this check (and<br=
>
avoid the warning). This is needed for e.g.<br>
python3-setuptools-rust-native which does not build cleanly with<br>
setuptools_build_meta.bbclass<br>
<br>
[YOCTO #14736]<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
Changes in v2:<br>
=C2=A0 =C2=A0 fix whitespace errors<br>
<br>
=C2=A0meta/classes/setuptools3.bbclass | 32 +++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 32 insertions(+)<br>
<br>
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bb=
class<br>
index 12561340b07..12d662fb49c 100644<br>
--- a/meta/classes/setuptools3.bbclass<br>
+++ b/meta/classes/setuptools3.bbclass<br>
@@ -18,6 +18,38 @@ setuptools3_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0:<br>
=C2=A0}<br>
<br>
+SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK ?=3D &quot;0&quot;<br>
+<br>
+python check_for_pyprojecttoml_build_backend() {<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 import tomli<br>
+=C2=A0 =C2=A0 from pathlib import Path<br>
+<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;SETUPTOOLS_SKIP_BUILD_BACKEND_CHECK&#39;) =
=3D=3D &quot;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(3, &quot;Skipping check for build-bac=
kend in pyproject.toml&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
+=C2=A0 =C2=A0 pyprojecttoml_file =3D Path(d.getVar(&#39;S&#39;), &#39;pypr=
oject.toml&#39;)<br>
+=C2=A0 =C2=A0 if pyprojecttoml_file.exists():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(3, &quot;pyproject.toml found: %s&quo=
t; % pyprojecttoml_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(pyprojecttoml_file, &quot;rb&quot;) =
as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyprojecttoml_dict =3D tomli.loa=
d(f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_system =3D pyprojecttoml_d=
ict[&quot;build-system&quot;]<br></blockquote><div><br></div><div>This need=
s results in KeyError when the source has pyproject.toml but not [buiid-sys=
tem],</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if build_system:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(3, &quot;=
[build-system] found in pyproject.toml&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backend =3D build_=
system.get(&#39;build-backend&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if backend:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.d=
ebug(3, &quot;build-backend found: %s&quot; % backend)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if backend =3D=3D =
&quot;flit_core.buildapi&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.w=
arn(&quot;The source has a pyproject.toml which declares &#39;flit_core.bui=
ldapi&#39; as a build backend, please consider &#39;inherit flit_core&#39; =
instead of inheriting setuptools3.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif backend =3D=
=3D &quot;setuptools.build_meta&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.w=
arn(&quot;The source has a pyproject.toml which declares &#39;setuptools.bu=
ild_meta&#39; as a build backend, please consider &#39;inherit setuptools_b=
uild_meta&#39; instead of inheriting setuptools3.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif backend =3D=
=3D &quot;poetry.core.masonry.api&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.w=
arn(&quot;The source has a pyproject.toml which declares &#39;poetry.core.m=
asonry.api&#39; as a build backend, please consider &#39;inherit poetry_cor=
e&#39; from meta-python instead of inheriting setuptools3.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.w=
arn(&quot;The source has a pyproject.toml which declares &#39;%s&#39; as a =
build backend, but this is not currently supported in oe-core.&quot; % back=
end)<br>
+}<br>
+do_configure[prefuncs] +=3D &quot;check_for_pyprojecttoml_build_backend&qu=
ot;<br>
+<br>
=C2=A0setuptools3_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${SETUPTOOLS_SETUP_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NO_FETCH_BUILD=3D1 \<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000f617b105d8d06537--

