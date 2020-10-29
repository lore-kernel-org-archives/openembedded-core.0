Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.2889.1604001552479691076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 12:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yc3EqRiD;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id oq3so3636128ejb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 12:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TFha4mln9tZ89ZSy+lE0UJjd/NPV2MmuN4dBfZv4IoM=;
        b=Yc3EqRiDopRY/ePhG7liY6NnIq38iAmRCVOXUMwtKjst84Bjg3Fsl2AEgxhlH8RoPZ
         nLAlPGth80aE0g3Py6FyJByEoT5LkeECxapqev5GEEmjL2yrDjdjhFTJt/ugRYz6lZTn
         OivdOxS5od9WgA84OlsIyrb4tGKIsbYRmCui7Eb0lURUZycmM0TcWF/8bHMKDdmox5Zy
         7GPrl2Fpo3r81IvTl0VHJcKY+ALPolly5ERIma3zCYNjEQNaK+FDwU4QnYLl1r7hLk9a
         PKWsEyhOuaGFEeJ4w7djxrEL2aoWkWYuL67CN9FTtzbwmW8f8/+RXxBori9KM4wIuA0Y
         sxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TFha4mln9tZ89ZSy+lE0UJjd/NPV2MmuN4dBfZv4IoM=;
        b=G6uFLoDP1GGJ1OhmgSHXvKRhty7EJjZ1NOtrxi4AH+W77sozLWrVBCTJNQgjyw6xst
         jtU+3cLzHdgnijwUReoGBnqVoDAixtaqmxWVrat/6UiK0EXYojjT5qHygBO9wNy9rILx
         9ip140gxrJ0wCOmDfb1j7KdiYckEyXK9SASORFUdMRfMvU6MW99TuDZYqiwfrJt4WBMK
         5UQgln9W5c9ACcmf4KSebqIORQz5N/QZVUP5VbWJ/KgKmGVWjfN/k87gLz+AjM4QtIRc
         C8yUb1pPKWhleASA24HwzpDrxZsB976bA73X4p2W+dGABlFGeo6azH9sSkGCq2v4b0B/
         8c4A==
X-Gm-Message-State: AOAM533jVstSbaCsUWDrvgJqzeSeAsAHGr4bHFue0O+ior3VZTHtlD9z
	6KZjwlsYzRm+0tZm1GzbuAx2Er/tnGFsESfKmTU=
X-Google-Smtp-Source: ABdhPJzrB2K4sDPpTOE5wpjM5uCZh9dPRFohwrY5KlZ8TqHBLAl4Fezi/r71m4zBohI3CIF3mTa9bn/E5KC3XHaanC4=
X-Received: by 2002:a17:906:16c6:: with SMTP id t6mr5516238ejd.453.1604001550975;
 Thu, 29 Oct 2020 12:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201026113906.2217226-1-quaresma.jose@gmail.com> <164187E56BC82039.9771@lists.openembedded.org>
In-Reply-To: <164187E56BC82039.9771@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 19:59:10 +0000
Message-ID: <CANPvuR=PxMPRVd+W0QvvJ3dm58bT9HvFNrEZ7d2iv3fk+GRdSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/6] maintainers.inc: Add Jose Quaresma
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
segunda, 26/10/2020 =C3=A0(s) 11:39:
>
> Jose Quaresma is responsible for the maintenance as follows:
>
> shaderc
> glslang
> spirv-tools
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro=
/include/maintainers.inc
> index 7935f968c7..ff80ef687e 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -213,6 +213,7 @@ RECIPE_MAINTAINER_pn-glibc-scripts =3D "Khem Raj <ra=
j.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-glibc-testsuite =3D "Khem Raj <raj.khem@gmail.com>=
"
>  RECIPE_MAINTAINER_pn-glide =3D "Otavio Salvador <otavio.salvador@ossyst=
ems.com.br>"
>  RECIPE_MAINTAINER_pn-gmp =3D "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER_pn-glslang =3D "Jose Quaresma <quaresma.jose@gmail.co=
m>"
>  RECIPE_MAINTAINER_pn-gnome-desktop-testing =3D "Ross Burton <ross.burto=
n@arm.com>"
>  RECIPE_MAINTAINER_pn-gnu-config =3D "Robert Yang <liezhi.yang@windriver=
.com>"
>  RECIPE_MAINTAINER_pn-gnu-efi =3D "Yi Zhao <yi.zhao@windriver.com>"
> @@ -641,6 +642,7 @@ RECIPE_MAINTAINER_pn-settings-daemon =3D "Anuj Mitta=
l <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-shadow =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-shadow-securetty =3D "Chen Qi <Qi.Chen@windriver.c=
om>"
>  RECIPE_MAINTAINER_pn-shadow-sysroot =3D "Chen Qi <Qi.Chen@windriver.com=
>"
> +RECIPE_MAINTAINER_pn-shaderc =3D =3D "Jose Quaresma <quaresma.jose@gmai=
l.com>"

There is an extra "=3D"
I need to fix this on a V5

>  RECIPE_MAINTAINER_pn-shared-mime-info =3D "Anuj Mittal <anuj.mittal@int=
el.com>"
>  RECIPE_MAINTAINER_pn-shutdown-desktop =3D "Alexander Kanavin <alex.kana=
vin@gmail.com>"
>  RECIPE_MAINTAINER_pn-signing-keys =3D "Richard Purdie <richard.purdie@l=
inuxfoundation.org>"
> @@ -648,6 +650,7 @@ RECIPE_MAINTAINER_pn-slang =3D "Yi Zhao <yi.zhao@win=
driver.com>"
>  RECIPE_MAINTAINER_pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-speex =3D "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-speexdsp =3D "Tanu Kaskinen <tanuk@iki.fi>"
> +RECIPE_MAINTAINER_pn-spirv-tools =3D "Jose Quaresma <quaresma.jose@gmai=
l.com>"
>  RECIPE_MAINTAINER_pn-sqlite3 =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-squashfs-tools =3D "Robert Yang <liezhi.yang@windr=
iver.com>"
>  RECIPE_MAINTAINER_pn-ssh-pregen-hostkeys =3D "Richard Purdie <richard.p=
urdie@linuxfoundation.org>"
> --
> 2.29.0
>
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
