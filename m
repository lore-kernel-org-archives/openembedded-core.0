Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.6290.1617195957334575096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 06:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l1eaXg58;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id hq27so29945413ejc.9
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ezW7amSjwq0+z1unu7yHStKbhz/T6qnXQcvv+VEHp8M=;
        b=l1eaXg58m7Q4CPD8i5fEpdgzl5SsHdXAzJC2cSr5sL721ee5Z+k3qiq/0+9L0EBqHh
         OAJ9EaZzWWbhoRsLgPp7ahE9fG01W8PRZYlOJ5r+sqFppAaYSONTZzRzMmyhAabLL7y9
         jdJ+nSPcFRgLh7vKlgbquaOrGvNjgeJDgTQNOIgmtWfXsir0ykMAp+TNu5fyLI1ISvVy
         RmLTxvVqThy3Si1dPySfrd4x3kkAynwTDWV0gynH1Jgso5VNilZ09wVQ7msygfuci8ub
         IMhPQ01hRyR4WC9WIXWaAaPBLuai2dXZIBVD2NUV1LTg9GHlA1sI+rcmLqrNePMdCUAC
         Vm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ezW7amSjwq0+z1unu7yHStKbhz/T6qnXQcvv+VEHp8M=;
        b=BpmglJAv4chjDKd9VJAs94qxK3uFQOOHr2YTCMKWAdQPZ4zRx0JZIc2brX3LvC8EGO
         gOhhUouxc3ZLqQKa3SgsZjaJRG2rgDjAEY4JrPoEzpXDb+D40ZNlASSQxnZxxKNGazXV
         5P6MXyivUIAdgnIqAndPcVa7agA6tldROR+Vb0EQ6zpJAjZf74iY6tOeGfVVwHgA4mpt
         tCXUHa/ZiE+POL2bTdhYDmgXhdyuaN1EGrYiOv9N0MKvVZAO4vAST8bY22CVNl2v61pG
         jto9eaxWS3olN+wA1IFFXsZFPhTreMgOGs+GNKh/2J9jI7K6VtCL+ppr8UCTMfBnejva
         CXhg==
X-Gm-Message-State: AOAM531xXpP0qttac1YGggCsMTBUISorPjo38qerhast+ZedwaVGY0F8
	6osZgSJ57EEsuvPBcAYl4ehOz5DzEHyAato0vEg=
X-Google-Smtp-Source: ABdhPJz8SkZAEBzKRpu/3/MjAk4tmswf11gWeecF/FeoHVhsVjDeu7ZAlCW0Ro6Bjj9eFxt7Jbk3NUY0oja9mKC27pw=
X-Received: by 2002:a17:907:e8f:: with SMTP id ho15mr3435169ejc.541.1617195955685;
 Wed, 31 Mar 2021 06:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210331122254.121192-1-alex.kanavin@gmail.com>
In-Reply-To: <20210331122254.121192-1-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 31 Mar 2021 15:05:44 +0200
Message-ID: <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000788b6205bed4c664"

--000000000000788b6205bed4c664
Content-Type: text/plain; charset="UTF-8"

Are you going to fix meta-gl issue with swrast still in DRIDRIVERS reported
on previous upgrade?

https://lists.openembedded.org/g/openembedded-core/message/149775

https://lists.openembedded.org/g/openembedded-core/message/149779
I don't know what exactly AB builds, but it's easy to reproduce locally,
something like:
DISTRO_FEATURES_remove = "x11"
PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
bitbake mesa-gl
should be enough to see build failure.

On Wed, Mar 31, 2021 at 2:44 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../mesa/{mesa-gl_21.0.0.bb => mesa-gl_21.0.1.bb}               | 0
>  meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
>  meta/recipes-graphics/mesa/{mesa_21.0.0.bb => mesa_21.0.1.bb}   | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_21.0.0.bb => mesa-gl_21.0.1.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_21.0.0.bb => mesa_21.0.1.bb}
> (100%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> b/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index e9b72ce063..a40dad2b81 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -21,7 +21,7 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             "
>
> -SRC_URI[sha256sum] =
> "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
> +SRC_URI[sha256sum] =
> "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb
> b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_21.0.0.bb
> rename to meta/recipes-graphics/mesa/mesa_21.0.1.bb
> --
> 2.29.2
>
>
> 
>
>

--000000000000788b6205bed4c664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are you going to fix meta-gl issue with swrast still in DR=
IDRIVERS reported on previous upgrade?<div><br></div><div><a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/149775">https://lists.=
openembedded.org/g/openembedded-core/message/149775</a><br></div><div><br><=
/div><div><a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/149779">https://lists.openembedded.org/g/openembedded-core/message/149=
779</a><br></div><div>I don&#39;t know what exactly AB builds, but it&#39;s=
 easy to reproduce locally, something like:</div><div>DISTRO_FEATURES_remov=
e =3D &quot;x11&quot;<br>PREFERRED_PROVIDER_virtual/libgl =3D &quot;mesa-gl=
&quot;<br>PREFERRED_PROVIDER_virtual/mesa =3D &quot;mesa-gl&quot;<br></div>=
<div>bitbake mesa-gl</div><div>should be enough to see build failure.</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Mar 31, 2021 at 2:44 PM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Alexander Kanavin=
 &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../mesa/{<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mesa-gl_21.0.0.bb</a> =3D&gt; <a href=3D"http://mesa-gl_21.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.1.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 2 +-<br>
=C2=A0meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a> =3D&gt; <a href=3D"http:/=
/mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a>}=
=C2=A0 =C2=A0| 0<br>
=C2=A03 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_21.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> =3D&gt; <a h=
ref=3D"http://mesa-gl_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-=
gl_21.0.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a> =3D&gt; <a href=3D=
"http://mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb=
</a>} (100%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> b/meta/recipe=
s-graphics/mesa/<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mesa-gl_21.0.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.1.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc<br>
index e9b72ce063..a40dad2b81 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -21,7 +21,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.or=
g/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_=
futex-if-it-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c=
808ca0dd26ba522e0d84&quot;<br>
+SRC_URI[sha256sum] =3D &quot;379fc984459394f2ab2d84049efdc3a659869dc1328c=
e72ef0598506611712bb&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\d+)+=
)&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a> b/meta/recipes-grap=
hics/mesa/<a href=3D"http://mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">mesa_21.0.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a><br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000788b6205bed4c664--
