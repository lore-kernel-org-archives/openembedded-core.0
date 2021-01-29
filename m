Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.5642.1611896251898691613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 20:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAoFSmY4;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id w11so3945411qvz.12
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 20:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBN3y60JpNSPZbO4fESlTZzoYfpxXvWE7Ej8MkQB+04=;
        b=VAoFSmY4S8IlwpGd2QtRybNsMU5Tp6PkIr1rdvwZC1RJVzHaB0u400uUtUDhQ8wNeQ
         OUVbtzHlYt260bnTkbearMFsNQCEMNZm8kRllPDE9bFzWZFoV8BaGi2zF2uSY19I7/5O
         Dvw81voLNqG91fKCJdj/SzEyOXOKYkUuyHtuxxD8X8SYnZOQ9qqHY6LW/87bBVWzPKSf
         5B5K54+2LCeknjlKvtUdhb1L9MqKGOfqL7egUGzBUOJeuYQZlM2IwjGEIf4T9yN7yF97
         xfD0r2e8duam0z8iiHTGSj7I8xgOovkMoXUxIlyKMz+hsu8Cf4qtaPCXOrJer7+n6iZR
         i5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBN3y60JpNSPZbO4fESlTZzoYfpxXvWE7Ej8MkQB+04=;
        b=ILlgb4MLBO1fLT37+RsUVVvqVQikTIy4A/XnapoliLnUgfIY3NEP7jY09VbJX65tY7
         eZCCjc6RuRqF3xLmLqlP1sZJ7agbKAltbzZ5NhzK9YPQi0oq+8aewAWZMnuSpomZzVev
         aQJfK5bvwzDODVIr6SM4ZeqPlZtxCugLmHd6VSdCuDcmh6XsWTfNyOjNaW0e12VFFHk6
         WelkiOaoPD1Ykaj6366VhyVNbGdM1iL4FcF6dij3i/22Cjk2gYpIuwBRQehExPnkiwOq
         YHGfhFkrXopIvj/QRfOZ5YgA+RvFZ/q9EkTEn1arlyHMHWgPdPDqPAkg0HW9WR/QOPHY
         OZWQ==
X-Gm-Message-State: AOAM530tDBRhOycjS0KwEUr6f+A2DhWxrnFp7MI7HGVOL0kkRDUFdpTW
	BI3fuxOM0HNYPm/E/c2tJF9rAMSkeDyRUituVXQ=
X-Google-Smtp-Source: ABdhPJzzEuX9Q6eedHH5Qw6OCnZ6iv5C0XyugVl1FysQV+3C83VqJSQLKLX/m0gRAgdtgR6fbY8geS/IhqGqrmZ0gWY=
X-Received: by 2002:a0c:eda6:: with SMTP id h6mr2746000qvr.19.1611896251026;
 Thu, 28 Jan 2021 20:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20210129014259.7985-1-tom.hochstein@nxp.com>
In-Reply-To: <20210129014259.7985-1-tom.hochstein@nxp.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 28 Jan 2021 20:57:20 -0800
Message-ID: <CAMKF1srvbmYWe1EwDK-mLhgN0vDhKe7AfL1zznAy8CSTxv3G6Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] glm: Fix packaging for header-only recipe
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000750fdf05ba02d77a"

--000000000000750fdf05ba02d77a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 5:44 PM Tom Hochstein <tom.hochstein@nxp.com> wrote=
:

> Set ALLOW_EMPTY for the main package to "1" for this header-only recipe.
> This
> allows the SDK to be created properly when there is an RDEPENDS on glm.


Runtime dependency on a header only package seems a bit iffy it=E2=80=99s =
perhaps
better to depend on glm-dev perhaps ?

>
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
> b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
> index e2f4dbebc..019e6257d 100644
> --- a/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
> +++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb
> @@ -34,6 +34,7 @@ do_install() {
>
>  }
>
> -RDEPENDS_${PN}-dev =3D ""
> +# This is a header-only library, so the main package will be empty.
> +ALLOW_EMPTY_${PN} =3D "1"
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.17.1
>
>
>=20
>
>

--000000000000750fdf05ba02d77a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 28, 2021 at 5:44 PM Tom Hochstein &lt;<a href=
=3D"mailto:tom.hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)">Set ALLOW_EMPTY for the main package to &quot;1&quot=
; for this header-only recipe. This<br>
allows the SDK to be created properly when there is an RDEPENDS on glm.</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Runtime dependency =
on a header only package seems a bit iffy it=E2=80=99s perhaps better to de=
pend on glm-dev perhaps ?</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" =
target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">glm_0.9.9.6.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.6.bb=
" rel=3D"noreferrer" target=3D"_blank">glm_0.9.9.6.bb</a> b/meta-oe/recipes=
-graphics/glm/<a href=3D"http://glm_0.9.9.6.bb" rel=3D"noreferrer" target=
=3D"_blank">glm_0.9.9.6.bb</a><br>
index e2f4dbebc..019e6257d 100644<br>
--- a/meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">glm_0.9.9.6.bb</a><br>
+++ b/meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">glm_0.9.9.6.bb</a><br>
@@ -34,6 +34,7 @@ do_install() {<br>
<br>
=C2=A0}<br>
<br>
-RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
+# This is a header-only library, so the main package will be empty.<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000750fdf05ba02d77a--
