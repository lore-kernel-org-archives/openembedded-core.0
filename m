Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web11.11392.1592723131372546370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2020 00:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dg8JJl49;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id s6so3246386vkb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2020 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N2wGuxmv8fCWAIjf4tN2w+bcUD0WVlyWJCaHaPNrwRk=;
        b=dg8JJl49NLHh9Gx8IypgofHMi0pEtzn6mbYnEUBMijCU7sGuYkLlKw17PwgSPXcB2z
         QEEnci7SPIuWeKZE7Tk9PDFODGdK+p1zV2MJ+VhQRppFK1liZeoqNhcbtsCljl+agrcs
         u+E7GYpUFKkX+kolwEe9iJAs0ypSf4UVnnoW3iut4J1+pUUAYQticGQZmGA6a6BqsCIW
         ArsL6twNirguTCu4wIHFYu8IXLOgJLEvMtYJIpPAV1oAZXS0lthGi3VjoNYbu7y5saX2
         nEaXvS3NEy3cm1IUeJCOSKHTLgquKZLPYdqSWhKCLnzV1mSC9ScPolgOMKyCsPLKEed4
         Ju7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N2wGuxmv8fCWAIjf4tN2w+bcUD0WVlyWJCaHaPNrwRk=;
        b=YSpsuFTG+304GjFPLaPs5suiyBJ5zxJWDOVh8vxwKv3bQCoHzoG64485mqstINuS9v
         VWHQQhARUiT+nSbq044jhH6G5YMEjEidcqSn7sBzh40O45IkeVuXHp1Zl0C3aEqroqWB
         kvHZNh1NDX20z6DDDv34quM9Tsg/bZwbwNzn23ds/Pz7v1XOdbKnmadc5cRlU3n62f+r
         l3Deb66ippAV6cIjngPQnyZuucn3bJtHy+WiBY/Ti1ONOXUNVrdtlbT7qU+xZ1GwFrlx
         hBbqxRf0YXglzhZkkvw/HiJPGTFK66yZEYQg6LRfvr//hdef6mgKWamezQ/F98RlhH8B
         PUlQ==
X-Gm-Message-State: AOAM531vcSG8DSIlkFvC/Kp/zxO214FZTm7k4lnWyyXrG/kyWmG6x7G9
	ON1Zuy6taRpVM5EtHTWnDAgY+Jy8P0vyOax2m1Ad8SHz
X-Google-Smtp-Source: ABdhPJwGa67VN8AIclOTD5bNVQTTc4KS5rx41Hk6KK2+oiUX130UkkkbcrhX1Cwmb1/AsZd1WVZIlTJy811Jax/s01o=
X-Received: by 2002:a1f:5f0d:: with SMTP id t13mr598299vkb.29.1592723130064;
 Sun, 21 Jun 2020 00:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200621023640.30843-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200621023640.30843-1-open.source@oleksandr-kravchuk.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 21 Jun 2020 09:05:18 +0200
Message-ID: <CANNYZj_q3qcX8KFQsXrhgYZ6dnVwVNgF_CWfmOywd2znw-HKAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ell: update to 0.32
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000064a3e005a892c096"

--00000000000064a3e005a892c096
Content-Type: text/plain; charset="UTF-8"

Hello  Oleksandr,

have you received the python-setuptools/cythin upgrade patches from AUH?
Will you send them?

Alex

On Sun, 21 Jun 2020 at 04:36, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Changelog:
> - Fix issue with handling D-Bus watch removal.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)
>
> diff --git a/meta/recipes-core/ell/ell_0.31.bb b/meta/recipes-core/ell/
> ell_0.32.bb
> similarity index 83%
> rename from meta/recipes-core/ell/ell_0.31.bb
> rename to meta/recipes-core/ell/ell_0.32.bb
> index 1db7131ab0..7772dcddf3 100644
> --- a/meta/recipes-core/ell/ell_0.31.bb
> +++ b/meta/recipes-core/ell/ell_0.32.bb
> @@ -14,8 +14,8 @@ DEPENDS = "dbus"
>  inherit autotools pkgconfig
>
>  SRC_URI = "
> https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
> -SRC_URI[sha256sum] =
> "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
> +SRC_URI[md5sum] = "dde539c9a8d3cce08fd439347a82cce7"
> +SRC_URI[sha256sum] =
> "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
>
>  do_configure_prepend () {
>      mkdir -p ${S}/build-aux
> --
> 2.17.1
>
> 
>

--00000000000064a3e005a892c096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello=C2=A0 Oleksandr,</div><div><br></div><div>have =
you received the python-setuptools/cythin upgrade patches from AUH? Will yo=
u send them?</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 21 Jun 2020 at =
04:36, Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravc=
huk.com">open.source@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Changelog:<br>
- Fix issue with handling D-Bus watch removal.<br>
<br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksa=
ndr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&=
gt;<br>
---<br>
=C2=A0meta/recipes-core/ell/{<a href=3D"http://ell_0.31.bb" rel=3D"norefer=
rer" target=3D"_blank">ell_0.31.bb</a> =3D&gt; <a href=3D"http://ell_0.32.b=
b" rel=3D"noreferrer" target=3D"_blank">ell_0.32.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-core/ell/{<a href=3D"http://ell_0.31.bb" rel=3D"=
noreferrer" target=3D"_blank">ell_0.31.bb</a> =3D&gt; <a href=3D"http://ell=
_0.32.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.32.bb</a>} (83%)<br>
<br>
diff --git a/meta/recipes-core/ell/<a href=3D"http://ell_0.31.bb" rel=3D"n=
oreferrer" target=3D"_blank">ell_0.31.bb</a> b/meta/recipes-core/ell/<a hre=
f=3D"http://ell_0.32.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.32.bb</=
a><br>
similarity index 83%<br>
rename from meta/recipes-core/ell/<a href=3D"http://ell_0.31.bb" rel=3D"no=
referrer" target=3D"_blank">ell_0.31.bb</a><br>
rename to meta/recipes-core/ell/<a href=3D"http://ell_0.32.bb" rel=3D"nore=
ferrer" target=3D"_blank">ell_0.32.bb</a><br>
index 1db7131ab0..7772dcddf3 100644<br>
--- a/meta/recipes-core/ell/<a href=3D"http://ell_0.31.bb" rel=3D"noreferr=
er" target=3D"_blank">ell_0.31.bb</a><br>
+++ b/meta/recipes-core/ell/<a href=3D"http://ell_0.32.bb" rel=3D"noreferr=
er" target=3D"_blank">ell_0.32.bb</a><br>
@@ -14,8 +14,8 @@ DEPENDS =3D &quot;dbus&quot;<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://mirrors.edge.kernel.org/pub/lin=
ux/libs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-$=
{PV}.tar.xz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;3f670230be4d89d621b0508c70b1d36b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ae88617275452f9f5840b2365e33e6c7fb6fa3405d42=
cbf9367de642ee8b6701&quot;<br>
+SRC_URI[md5sum] =3D &quot;dde539c9a8d3cce08fd439347a82cce7&quot;<br>
+SRC_URI[sha256sum] =3D &quot;42fdb9e24ff561a101389d51445cab1ff7d55f5385dc=
22a05b0493088cf99e30&quot;<br>
<br>
=C2=A0do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/build-aux<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000064a3e005a892c096--
