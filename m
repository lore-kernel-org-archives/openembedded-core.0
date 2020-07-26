Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web10.26457.1595759475551985530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 03:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hVN7kl6L;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id b26so2294038vsa.13
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oPP26vca2aUqL/dnUyLXcxmfi33R5t+iBYXrLcV4beI=;
        b=hVN7kl6L5xNYfKC3z/CzfGcQPSzbQUv1ahKaNNgNiSsX94L2C1TOTY2vzf519QvsAI
         BvPU7uOjU48JJh4mdsazIXo9GYIp0pZpq3/pOyAzqAwtjRPbFE8YcPfTWf/xvhsfP55O
         Mhf/d6mRtK0XR4UPm0H8wiq48mpXVy4FVSMoJ+pAoTCQRUZlgppE4ZB55EqNOUZt2QRz
         PZm/QvTGqiwKQg0GNxzkHMCLmb6nCh91OIbuPRP3o91jJmdzxJO3H3E4ecUAHMuuKZbe
         TuVNs3aApDf1eLBGanDufaWhANQVniVR6a9/tHEHyWR10afO9LyGd6JRn7ejwAiUMLh0
         Jcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oPP26vca2aUqL/dnUyLXcxmfi33R5t+iBYXrLcV4beI=;
        b=Xk+/xlvdTwOW9OuS2dWvpl72CRjdGR6UZ8d/euYZT/AuBCp2/4G9ZkDFU5cYyMIGGA
         XyggEE0VhOnVMuFC+IPgNnB3blQDAm6rDO8B5KvJERN6mKmRC9Ov+4fRTRt7pvzpYdQv
         o0QUUCxpPrpsOhe05GV/xE+4dYcjif7zVy1rDRo4gW7kBUb1R/6imGn5HAwqQpBy+186
         TELdi35zz1EECPAyJKmvhW0uB1bIWWbuO06fAr2HS6fi6bFSzNT5MFP/BGEBZpERVjcp
         445zS82SZb1k+yazknacHziTStTUGsfS8/nFZ6n2w7Z0Ir4u4dg1hY1f6OFzg9vxB1zk
         emsg==
X-Gm-Message-State: AOAM532o5nGBC8j8DtNQukbRChJhWzceeqkvsmijCQjeKEgYxfVJT64b
	qZSPR9ZzFGAlkELbxp2SYfmMReREhI3/dgoT7BzhSQAr0Ao=
X-Google-Smtp-Source: ABdhPJzm8RYo7gOSbD8BLAc/GBWuWN/lEsPHTUo26H0GU3kFnXY4LS3wS+tHozmLpWlbp/TWvOfXN+0wTQDRcQABpHA=
X-Received: by 2002:a67:cf88:: with SMTP id g8mr12864301vsm.25.1595759474384;
 Sun, 26 Jul 2020 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200726101759.3991490-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200726101759.3991490-1-open.source@oleksandr-kravchuk.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 26 Jul 2020 12:31:03 +0200
Message-ID: <CANNYZj94-vz9n+TL-t9NLeR90f9xOuEeBBGKmi50TByh8JgNDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libhandy: update to 0.80.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009e2ca305ab55b4f7"

--0000000000009e2ca305ab55b4f7
Content-Type: text/plain; charset="UTF-8"

This also needs a backport of compatibility patch for epiphany.

Alex

On Sun, 26 Jul 2020 at 12:18, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libhandy/{libhandy_git.bb => libhandy_0.80.0.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/libhandy/{libhandy_git.bb => libhandy_0.80.0.bb}
> (89%)
>
> diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb
> b/meta/recipes-gnome/libhandy/libhandy_0.80.0.bb
> similarity index 89%
> rename from meta/recipes-gnome/libhandy/libhandy_git.bb
> rename to meta/recipes-gnome/libhandy/libhandy_0.80.0.bb
> index 64258941ee..056d9659d8 100644
> --- a/meta/recipes-gnome/libhandy/libhandy_git.bb
> +++ b/meta/recipes-gnome/libhandy/libhandy_0.80.0.bb
> @@ -3,9 +3,9 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>  SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git;protocol=https
> <http://source.puri.sm/Librem5/$%7BBPN%7D.git;protocol=https>"
> -SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
> +SRCREV = "b61eefde06040703026f49a0b979588e69f77d3a"
> +
>  S = "${WORKDIR}/git"
> -PV = "0.0.13"
>
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> --
> 2.25.1
>
> 
>

--0000000000009e2ca305ab55b4f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This also needs a backport of compatibility patch for=
 epiphany.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 26 Jul 2020 at 12=
:18, Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchu=
k.com">open.source@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Oleksandr Kravchuk =
&lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank"=
>open.source@oleksandr-kravchuk.com</a>&gt;<br>
---<br>
=C2=A0.../libhandy/{<a href=3D"http://libhandy_git.bb" rel=3D"noreferrer" =
target=3D"_blank">libhandy_git.bb</a> =3D&gt; <a href=3D"http://libhandy_0.=
80.0.bb" rel=3D"noreferrer" target=3D"_blank">libhandy_0.80.0.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/libhandy/{<a href=3D"http://libhandy_git.b=
b" rel=3D"noreferrer" target=3D"_blank">libhandy_git.bb</a> =3D&gt; <a href=
=
=3D"http://libhandy_0.80.0.bb" rel=3D"noreferrer" target=3D"_blank">libhan=
dy_0.80.0.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-gnome/libhandy/<a href=3D"http://libhandy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libhandy_git.bb</a> b/meta/recipes-g=
nome/libhandy/<a href=3D"http://libhandy_0.80.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libhandy_0.80.0.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-gnome/libhandy/<a href=3D"http://libhandy_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">libhandy_git.bb</a><br>
rename to meta/recipes-gnome/libhandy/<a href=3D"http://libhandy_0.80.0.bb=
" rel=3D"noreferrer" target=3D"_blank">libhandy_0.80.0.bb</a><br>
index 64258941ee..056d9659d8 100644<br>
--- a/meta/recipes-gnome/libhandy/<a href=3D"http://libhandy_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libhandy_git.bb</a><br>
+++ b/meta/recipes-gnome/libhandy/<a href=3D"http://libhandy_0.80.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libhandy_0.80.0.bb</a><br>
@@ -3,9 +3,9 @@ LICENSE =3D &quot;LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd25595107=
9008b364516c&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://source.puri.sm/Librem5/$%7=
BBPN%7D.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">source.p=
uri.sm/Librem5/${BPN}.git;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;7a193d7692c9c76a1a94f17c4d30b585f77d177c&quot;<br>
+SRCREV =3D &quot;b61eefde06040703026f49a0b979588e69f77d3a&quot;<br>
+<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-PV =3D &quot;0.0.13&quot;<br>
<br>
=C2=A0GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
=C2=A0GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--0000000000009e2ca305ab55b4f7--
