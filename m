Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.9959.1602156977120206706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 04:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W7JbSUm8;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id y194so2848302vsc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZJ7yZonesGR2e9yQ/xhuRer2/lw6d6vVpkuxy0nAmZ4=;
        b=W7JbSUm8MpDKa2GyBMe5UjpvZQ3aD45Z2cYxMTsx6PYycIySsdOjm9+xn9Sko3Y+h1
         l3en5VUjlm0SRxN/dAMmpfyGKeYd0GHZAS0xPD2FskXfww4YnSVxlPlpwQSWtRU9/3J3
         q91XGn0oWHyBXkn7LXLRKaO2ekIuFJVY4Z/12RNw4+H9VorSdA971EPyuW9oez0gHWU7
         0Ld61f7TA4ZRxEuaUar11BjiuQJxKLGomBrlxp+7ozbaUoQqS5UlcvW2BbVbwp6i0kfR
         vDlOSkYAMZwtSBbJzLOw0uKePBJjpdMlDctB4DmPQx3eqfOYkTUBRembyBEiUN2kg86i
         kV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZJ7yZonesGR2e9yQ/xhuRer2/lw6d6vVpkuxy0nAmZ4=;
        b=rT2Gsz7ARBxhdwWMUtYhTva9uEQt/+jh0Wa3F1MIvlhh5eyLcUKBIpzblnbQffu1TL
         vNYaaqmxVsrxy3PjCSG0WzQqk6TDyuvC/WSNWQ/+OlfduOqLb/rsvbIBZppHal1XYHZM
         nw7i4yUS8HYSYXeJlWU/C61U452yXmiwPzuNUeiLgKMNhkPVNNnylMkSJPIufiBw290W
         LMY8Ajo1dGr+GyDXYH4TPYxWJQAmfKyhk84qtNPVajnouK8vI4lnb2D5A+OyiRBYNYr6
         YrbRkqfQ/TbhbvScUcvvhZq+irwCyI1q+L17ViWIVMCT+d8Gz0jUZCj5+BTU7Vj/oMex
         cGJg==
X-Gm-Message-State: AOAM533WsYrd81YbK/cr7NPU3OMgCO3Gn/UoLNmWVzZ0B6I2D1qbX8KE
	9njhH2i1U2XgrftFZv8xwBN77HS6m+hewomnL7w=
X-Google-Smtp-Source: ABdhPJyZp38K5ml00jqyzgidBl1Rrla145ZfKtbMq1Sxt2+cWi5sEqOMuqFrXQm5qiHMkfO+ARPIH2CE61Y/EszGqMs=
X-Received: by 2002:a67:504:: with SMTP id 4mr3978431vsf.20.1602156976235;
 Thu, 08 Oct 2020 04:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
In-Reply-To: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 8 Oct 2020 13:36:05 +0200
Message-ID: <CANNYZj9oAoE_Se7HPd3y=sce9Mak-6n9zEBqyxikZr8trgJQvw@mail.gmail.com>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
To: Brett Warren <brett.warren@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007169ab05b1273d10"

--0000000000007169ab05b1273d10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Isn=E2=80=99t it better to just make a custom image recipe instead?

Alex

On Thu 8. Oct 2020 at 12.53, Brett Warren <brett.warren@arm.com> wrote:

> Previously, to satisfy opengl's requirement for at least 512MB
> of memory, QB_MEM was overriden by core-image-sato. This made it
> impossible for machine configurations to specify their own values,
> so this was changed to a default asssignment. To accomodate this,
> qemuboot's default assignment of QB_MEM was changed to the week
> variant.
>
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
>  meta/classes/qemuboot.bbclass               | 2 +-
>  meta/recipes-sato/images/core-image-sato.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbcla=
ss
> index d8f62ef6ea..8e4ee9e49b 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -73,7 +73,7 @@
>  # IMAGE_CLASSES +=3D "qemuboot"
>  # See "runqemu help" for more info
>
> -QB_MEM ?=3D "-m 256"
> +QB_MEM ??=3D "-m 256"
>  QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
>  QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
>  QB_DEFAULT_FSTYPE ?=3D "ext4"
> diff --git a/meta/recipes-sato/images/core-image-sato.bb
> b/meta/recipes-sato/images/core-image-sato.bb
> index 673106eb6d..ec5e2e20fc 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -11,5 +11,5 @@ inherit core-image
>  TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intlto=
ol
> nativesdk-glib-2.0"
>
> -QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512",=
 "-m
> 256", d)}'
> +QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512"=
,
> "-m 256", d)}'
>  QB_MEM_qemumips =3D "-m 256"
> --
> 2.17.1
>=20
>
>

--0000000000007169ab05b1273d10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Isn=E2=80=99t it better to just make a custom image recip=
e instead?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu 8. Oct 2020 at 12.53, Brett Warren &lt;<a href=3D"mailto:brett.warren@ar=
m.com">brett.warren@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Previo=
usly, to satisfy opengl&#39;s requirement for at least 512MB<br>of memory, =
QB_MEM was overriden by core-image-sato. This made it<br>impossible for mac=
hine configurations to specify their own values,<br>so this was changed to =
a default asssignment. To accomodate this,<br>qemuboot&#39;s default assign=
ment of QB_MEM was changed to the week<br>variant.<br><br>Signed-off-by: Br=
ett Warren &lt;<a href=3D"mailto:brett.warren@arm.com" target=3D"_blank">br=
ett.warren@arm.com</a>&gt;<br>---<br>=C2=A0meta/classes/qemuboot.bbclass=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-<br>=C2=A0meta/recipes-sato/images/<a href=3D"http://core-=
image-sato.bb" target=3D"_blank">core-image-sato.bb</a> | 2 +-<br>=C2=A02 f=
iles changed, 2 insertions(+), 2 deletions(-)<br><br>diff --git a/meta/clas=
ses/qemuboot.bbclass b/meta/classes/qemuboot.bbclass<br>index d8f62ef6ea..8=
e4ee9e49b 100644<br>--- a/meta/classes/qemuboot.bbclass<br>+++ b/meta/class=
es/qemuboot.bbclass<br>@@ -73,7 +73,7 @@<br>=C2=A0# IMAGE_CLASSES +=3D &quo=
t;qemuboot&quot;<br>=C2=A0# See &quot;runqemu help&quot; for more info<br>=
=C2=A0<br>-QB_MEM ?=3D &quot;-m 256&quot;<br>+QB_MEM ??=3D &quot;-m 256&qu=
ot;<br>=C2=A0QB_SERIAL_OPT ?=3D &quot;-serial mon:stdio -serial null&quot;<=
br>=C2=A0QB_DEFAULT_KERNEL ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>=C2=A0QB=
_DEFAULT_FSTYPE ?=3D &quot;ext4&quot;<br>diff --git a/meta/recipes-sato/ima=
ges/<a href=3D"http://core-image-sato.bb" target=3D"_blank">core-image-sato=
.bb</a> b/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" ta=
rget=3D"_blank">core-image-sato.bb</a><br>index 673106eb6d..ec5e2e20fc 1006=
44<br>--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" =
target=3D"_blank">core-image-sato.bb</a><br>+++ b/meta/recipes-sato/images/=
<a href=3D"http://core-image-sato.bb" target=3D"_blank">core-image-sato.bb<=
/a><br>@@ -11,5 +11,5 @@ inherit core-image<br>=C2=A0TOOLCHAIN_HOST_TASK_ap=
pend =3D &quot; nativesdk-intltool nativesdk-glib-2.0&quot;<br>=C2=A0TOOLCH=
AIN_HOST_TASK_remove_task-populate-sdk-ext =3D &quot; nativesdk-intltool na=
tivesdk-glib-2.0&quot;<br>=C2=A0<br>-QB_MEM =3D &#39;${@bb.utils.contains(&=
quot;DISTRO_FEATURES&quot;, &quot;opengl&quot;, &quot;-m 512&quot;, &quot;-=
m 256&quot;, d)}&#39;<br>+QB_MEM ?=3D &#39;${@bb.utils.contains(&quot;DISTR=
O_FEATURES&quot;, &quot;opengl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot=
;, d)}&#39;<br>=C2=A0QB_MEM_qemumips =3D &quot;-m 256&quot;<br>-- <br>2.17.=
1
<br>
<br>
<br>
</blockquote></div></div>

--0000000000007169ab05b1273d10--
