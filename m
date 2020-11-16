Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web08.31903.1605516073199996779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 00:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=saNyBLHv;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id g3so5097959uae.7
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 00:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+47fl8cPNBGYNMAVJfkm8JkFc0BRMwM4hy7HGRRroPc=;
        b=saNyBLHvWYoD+mhuDv6fSswhkCs5uoQidmhbBxpwAEAy7ZkUM545ixX4GIqwMgt1+2
         k00A7zEPzwGd2XWsPAboxYGzfFDC0rkYYD3IQPOtX8rCRt3zR+JOAdRT7njWnyNZ1mBC
         Foy2XWW0y4Ni0DtzNm7tfp9+NFNFlgmMKoUU85vWMFRctlwfL0JmoJyMCZ8UMeZz+pyB
         WxfHxFpUIHcpVwiyDwAZL/3qKCCXWc+huornyOF1wheodt7Nw4/ufgqVrOuO9NfYqA8P
         F9fEUrRCnHrWOrdIKJN+Y93z17skuVHu0JU1S+AsrqQtw3OptZnA+0k0Fg+b9Hh8vDTg
         n1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+47fl8cPNBGYNMAVJfkm8JkFc0BRMwM4hy7HGRRroPc=;
        b=oO6MJFMxDoWorhDJ42dZajBti8JPjqF2Ep5dD7Anz8Tfl2DQbhIJ2KfP95hbt6Qlog
         ZMVd0lOlye0tslogOlvC2Yje0yejeCuWzDhenpjUM6xW3+YSuAPwrzeCsZ1+aFnRKrHW
         Lyn3i4DydUbW/qK0fxoocUJrKGk5C2Ng/pA2PyrovH/nz7HDVPvetpVjyma2mStpvmub
         2KxMFiiR6QFIfny3IW1m3Wg91tQ+07Nozr8Z7Eq7Gpzj1yRU5rvCEAD0lbu/CZZ7hnmm
         SQlvK5rY/cxSkMQXmuwG5upBkOxh2glYO71WaB3iXZPxH2C21DCuVIExcqgDz3yvpCPs
         3JcQ==
X-Gm-Message-State: AOAM532zYibVkDu72+wLjZLRn9iW1uujgICS+tN21VgATXT+ygcNLkin
	dDso0rEBhgD2Y6RutnihOgB1kX2PegQ8GWj17aM=
X-Google-Smtp-Source: ABdhPJwq2eGs1Ee2/oHVmmDK9eAYj9htKd2iTBltsHlXH7L6vv4l3/DABWeoZ+1IAs+2tzTeMUQf6ryk4VPU+idQF+g=
X-Received: by 2002:ab0:3751:: with SMTP id i17mr6880986uat.71.1605516072360;
 Mon, 16 Nov 2020 00:41:12 -0800 (PST)
MIME-Version: 1.0
References: <1605541167-86728-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1605541167-86728-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 16 Nov 2020 09:41:01 +0100
Message-ID: <CANNYZj9_ZurxDD4=zRuP=zHvF38d7M7xj8cdbp97YDZjRFXS2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libdrm: upgrade 2.4.102 -> 2.4.103
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ca18b05b4355799"

--0000000000002ca18b05b4355799
Content-Type: text/plain; charset="UTF-8"

The patch file should be deleted as well if it is no longer in src_uri.

Alex

On Mon 16. Nov 2020 at 4.40, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../drm/{libdrm_2.4.102.bb => libdrm_2.4.103.bb}             | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.102.bb => libdrm_2.4.103.bb}
> (93%)
>
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.102.bb
> b/meta/recipes-graphics/drm/libdrm_2.4.103.bb
> similarity index 93%
> rename from meta/recipes-graphics/drm/libdrm_2.4.102.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.103.bb
> index ad512d14a9..1028d618ae 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.102.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.103.bb
> @@ -10,10 +10,9 @@ LIC_FILES_CHKSUM =
> "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
>  PROVIDES = "drm"
>  DEPENDS = "libpthread-stubs"
>
> -SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
> -           file://0001-xf86drm.c-fix-build-failure.patch "
> +SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
>
> -SRC_URI[sha256sum] =
> "8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b"
> +SRC_URI[sha256sum] =
> "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
>
>  inherit meson pkgconfig manpages
>
> --
> 2.25.1
>
>
>
>
> 
>
>

--0000000000002ca18b05b4355799
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The patch file should be deleted as well if it is no long=
er in src_uri.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon 16. Nov 2020 at 4.40, zangrc &lt;<a href=3D"mailto:zangrc.fnst@cn.fu=
jitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)">Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujits=
u.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../drm/{<a href=3D"http://libdrm_2.4.102.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libdrm_2.4.102.bb</a> =3D&gt; <a href=3D"http://libdrm_2.4.1=
03.bb" rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.103.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/drm/{<a href=3D"http://libdrm_2.4.102.b=
b" rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.102.bb</a> =3D&gt; <a hr=
ef=3D"http://libdrm_2.4.103.bb" rel=3D"noreferrer" target=3D"_blank">libdrm=
_2.4.103.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.102.bb=
" rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.102.bb</a> b/meta/recipes=
-graphics/drm/<a href=3D"http://libdrm_2.4.103.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libdrm_2.4.103.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.102.bb"=
 rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.102.bb</a><br>
rename to meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.103.bb" r=
el=3D"noreferrer" target=3D"_blank">libdrm_2.4.103.bb</a><br>
index ad512d14a9..1028d618ae 100644<br>
--- a/meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.102.bb" rel=
=3D"noreferrer" target=3D"_blank">libdrm_2.4.102.bb</a><br>
+++ b/meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.103.bb" rel=
=3D"noreferrer" target=3D"_blank">libdrm_2.4.103.bb</a><br>
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM =3D &quot;file://xf86drm.c;beginline=
=3D9;endline=3D32;md5=3Dc8a3b961af7667c5<br>
=C2=A0PROVIDES =3D &quot;drm&quot;<br>
=C2=A0DEPENDS =3D &quot;libpthread-stubs&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://dri.freedesktop.org/libdrm/$%7BBP%7D.=
tar.xz" rel=3D"noreferrer" target=3D"_blank">http://dri.freedesktop.org/lib=
drm/${BP}.tar.xz</a> \ <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-xf86drm.c-fix-build-=
failure.patch &quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://dri.freedesktop.org/libdrm/$%7BBP%7D.=
tar.xz" rel=3D"noreferrer" target=3D"_blank">http://dri.freedesktop.org/lib=
drm/${BP}.tar.xz</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e92=
9d52d3ad7ad8525ba05b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3fe0affdba6460166a7323290c18cf68e9b59edcb520=
722826cb244e9cb50222&quot;<br>
<br>
=C2=A0inherit meson pkgconfig manpages<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000002ca18b05b4355799--
