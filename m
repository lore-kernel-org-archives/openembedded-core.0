Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.35734.1612794025700059675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 06:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Irse3YgF;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id q2so18285307edi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 06:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r//EPbNELvo8KbbGNduBnTzv3KMhkjX1zwNmUivYmvI=;
        b=Irse3YgFPbB+8hlvDr9VuMtC78WbHHnvhRFyYs2fpqbmO2rI+BzFTqwI2HByYMBGKq
         +GRfrE+w0zYud0EFLWGYhI6YvVBXVwjEIZZdNq3oYvZP0iqE/C9mEjsT8rFyuxKBjAak
         He8BlDz5xR9AC2bB1l7EO+QNW/GT42bemE4X3A41k8WkzQqmq9xbXIgllPjr0tP78NTI
         y9AoKBb3A5mRPAkrFnrjam/NYYI7uztu46Kgx6bVeSmGd8D6EsDgobEtjxv10QTJ2fxa
         fU4TPn+dCT0CHkPWIWhsQtKvCHPXnSwW3lmN2XNFkHKb3fB7GsSvOL67nWoeGQE9p+hx
         eG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r//EPbNELvo8KbbGNduBnTzv3KMhkjX1zwNmUivYmvI=;
        b=eY70mQw7Nh+WLGvzIkfaVkRn9a3BwEmxb2dxcONP9uwdHtFhdTyHBDUiTPFZWz4FNW
         Os0zfB2DyXv6O+zF8jbr/MEs5U8oLjz813wLIm+CLS5WGm92JqN69oYBz22kuDle1fVX
         BmLDCQtRbNS6jZkb+eARxYceLQ9NtQxVC6cHi2jiAnd+KvG6b3BerZF6HyFuFhoVlxjU
         MMt1BrFv1B+D1Z2+iaNkT1c3KI0axvwhDmyb6kmfQ66v8bK2FX58x3utN68dmi/8xfVl
         qLs9Yy3JJO/pT6ae4kEVUUfr7dnP1PrHDLSbaMm3qF35ZlBbWLV7rvp1FUg75lM379FM
         gW/Q==
X-Gm-Message-State: AOAM5306XDa8wzwDHvycMVBXWP3X6gu4XOj1TwThh2M3Ow3kpkURvZfg
	rstuRKfmt37xegWiQ4lZxg60FUBPaO1gI4wZ4rg=
X-Google-Smtp-Source: ABdhPJzuJz2O/jLZqTws8RMxhpKtL9Z/Ge2RoTHgCGem4KuoSjOFRt3yw0GQOZOW9DFgvo+qxwZsh96GgudGKEiGH4k=
X-Received: by 2002:a05:6402:5207:: with SMTP id s7mr16842751edd.311.1612794023953;
 Mon, 08 Feb 2021 06:20:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612792088.git.steve@sakoman.com> <347808ca0898452d9656317cd24559bc34f9ed78.1612792088.git.steve@sakoman.com>
In-Reply-To: <347808ca0898452d9656317cd24559bc34f9ed78.1612792088.git.steve@sakoman.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 8 Feb 2021 15:20:13 +0100
Message-ID: <CA+chaQesbg883MCuZ=r23jjTiV=pCdgsOnoVKLJTunOYyr8LWQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 18/28] image_types: Ensure tar archives are reproducible
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e4c78005bad3de58"

--000000000000e4c78005bad3de58
Content-Type: text/plain; charset="UTF-8"

Please add this only together with
https://git.openembedded.org/openembedded-core/commit/?id=3ecea58f2a3382d9f4b410d6ad7089111334cb6f

RP dropped this one from last gatesgarth PR as well until both are applied
at the same time:
https://lists.openembedded.org/g/openembedded-core/message/147712

On Mon, Feb 8, 2021 at 2:54 PM Steve Sakoman <steve@sakoman.com> wrote:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The tar output seems to vary depending on the version of tar used and
> distro
> configuration. Be explict about the output format to avoid this and be
> determinstic.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit c56f3c9febc1732aa1302524c6c4da36f16bd1f7)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index d81747527b..6de16d42b9 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -126,7 +126,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS}
> ${IMGDEPLOYDIR}/${IMAGE_NAM
>  # required when extracting, but it seems prudent to use it in both cases.
>  IMAGE_CMD_TAR ?= "tar"
>  # ignore return code 1 "file changed as we read it" as other tasks(e.g.
> do_image_wic) may be hardlinking rootfs
> -IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} .
> || [ $? -eq 1 ]"
> +IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu
> --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar
> -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>
>  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>  IMAGE_CMD_cpio () {
> --
> 2.25.1
>
>
> 
>
>

--000000000000e4c78005bad3de58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please add this only together with<div><a href=3D"https://=
git.openembedded.org/openembedded-core/commit/?id=3D3ecea58f2a3382d9f4b410d=
6ad7089111334cb6f">https://git.openembedded.org/openembedded-core/commit/?i=
d=3D3ecea58f2a3382d9f4b410d6ad7089111334cb6f</a><br></div><div><br></div><d=
iv>RP dropped this one from last gatesgarth PR as well until both are appli=
ed at the same time:</div><div><a href=3D"https://lists.openembedded.org/g/=
openembedded-core/message/147712">https://lists.openembedded.org/g/openembe=
dded-core/message/147712</a><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021 at 2:54 PM Steve =
Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targe=
t=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
The tar output seems to vary depending on the version of tar used and dist=
ro<br>
configuration. Be explict about the output format to avoid this and be<br>
determinstic.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
(cherry picked from commit c56f3c9febc1732aa1302524c6c4da36f16bd1f7)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targ=
et=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image_types.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.b=
bclass<br>
index d81747527b..6de16d42b9 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -126,7 +126,7 @@ IMAGE_CMD_squashfs-lz4 =3D &quot;mksquashfs ${IMAGE_RO=
OTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM<br>
=C2=A0# required when extracting, but it seems prudent to use it in both c=
ases.<br>
=C2=A0IMAGE_CMD_TAR ?=3D &quot;tar&quot;<br>
=C2=A0# ignore return code 1 &quot;file changed as we read it&quot; as oth=
er tasks(e.g. do_image_wic) may be hardlinking rootfs<br>
-IMAGE_CMD_tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --numeric-owner -c=
f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} =
. || [ $? -eq 1 ]&quot;<br>
+IMAGE_CMD_tar =3D &quot;${IMAGE_CMD_TAR} --sort=3Dname --format=3Dgnu --n=
umeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C $=
{IMAGE_ROOTFS} . || [ $? -eq 1 ]&quot;<br>
<br>
=C2=A0do_image_cpio[cleandirs] +=3D &quot;${WORKDIR}/cpio_append&quot;<br>
=C2=A0IMAGE_CMD_cpio () {<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e4c78005bad3de58--
