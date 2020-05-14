Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web11.1741.1589477474774458503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f+BwW7+f;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id 21so548577vkq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WciFod1abp6Ii3BpCabue7ij7mx7tJnAPxTreYUmXzY=;
        b=f+BwW7+f4t/CHd+GPAnR3tmlts6l7pDiFR/Zz1/4Uzbc5ziPunURtfuvYRaaTqappi
         0/c9ZM4eVWE9u4ELVyKEv0ZRW2T8Adag0x1G0vzOd2KTsb3pXM8XwunXxBNl1Ge8AqE9
         nhybfDZNdwkY9/Av9BO23kBO9wpD3LusZoFvVuCI1Pmc0r3aTEihgosSE+yIf0J1mGt8
         Uv2bp53NKR/tXd/unLFlOXbAvtmmYOt4+HbC3FySYX2FvuIqVIrSm2PAgkOqKo4qs0Iz
         LHjP/hbbwa5rm7SWqVgwmTpBWgLvKKbZe9Q9DEuX15A/HGaQ77aL1ivAUfNZtNu/goPZ
         Ft3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WciFod1abp6Ii3BpCabue7ij7mx7tJnAPxTreYUmXzY=;
        b=OuWdcHd5cAvuQnUOUY3NAA1vlHnx7D6/IcAWDF5tVzTynMREQ2of5VwBJGyPyYYfch
         CIINwkmwGNUnE7QmPg0nBYJ1w8zA/w/t+7eb0Uh5uZuZBXaphDk3WVFY3+wJHbeV40v8
         A19INLVPskg1Z0yJINqZ/bPWCivToC+rR3JbAKj1lzc7aw2WwqsW53dSgACU5qK/MZKV
         4fXbtoAwOo2t18zJ3yoKiLHdrA0rxfwzuPscXojzl7kTglQ2zFMCaT2rUjEOYg3Mw0e+
         Uzhf8NQeJCTw1Lwz69iGToz96/XTTyCwLLh+jQjiM674tcXIIWfW4FPwTaR/bodFKTwR
         LTdQ==
X-Gm-Message-State: AOAM531WUr6tgagoMg9+qoVcWDXK+5uQc7x+WjFKVZELWvsgpn+51TaB
	zL0nB84qsyPbiamy5y+lEN9SRcQ/M3v9kUZFXQQ=
X-Google-Smtp-Source: ABdhPJwmUkqKtfberBwTcwUJW1BFJINs7i2hoedju6U5s8H5P6vES78BZ0p3D4q//VeEhwx4ftiiG7/A2uKFKy6qMQk=
X-Received: by 2002:a1f:b209:: with SMTP id b9mr4845257vkf.9.1589477473939;
 Thu, 14 May 2020 10:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200514142107.20702-1-diego.rondini@kynetics.com>
In-Reply-To: <20200514142107.20702-1-diego.rondini@kynetics.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 14 May 2020 19:31:02 +0200
Message-ID: <CANNYZj8_gXYNTewvCX3TFp5nj9LP6+cZfKYgdBEF9Y_F_U2S_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmap-tools: update to latest git master
To: Diego <diego.rondini@kynetics.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003672cf05a59f1073"

--0000000000003672cf05a59f1073
Content-Type: text/plain; charset="UTF-8"

You can't generally update to a random development commit, especially if PV
stays the same. Please ask upstream to make a new release.

Alex

On Thu, 14 May 2020 at 16:22, Diego <diego.rondini@kynetics.com> wrote:

> Update to latest revision of git master to include, among other
> improvements, support for zstd compression format.
>
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> ---
>  meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> index 7c4db85b32..694c5f09be 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "git://github.com/intel/${BPN}
> <http://github.com/intel/$%7BBPN%7D>"
>
> -SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
> +SRCREV = "a17f0e3ff8669dd3b1c44a741ae4f8162155faed"
>  S = "${WORKDIR}/git"
>  PV .= "+git${SRCPV}"
>
> --
> 2.21.3
>
> 
>

--0000000000003672cf05a59f1073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You can&#39;t generally update to a random developmen=
t commit, especially if PV stays the same. Please ask upstream to make a ne=
w release.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 14 May 2020 at 16=
:22, Diego &lt;<a href=3D"mailto:diego.rondini@kynetics.com">diego.rondini@=
kynetics.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Update to latest revision of git master to include, among other=
<br>
improvements, support for zstd compression format.<br>
<br>
Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynetics.=
com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a> b/meta/r=
ecipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb" rel=3D"noref=
errer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
index 7c4db85b32..694c5f09be 100644<br>
--- a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
+++ b/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d=
69f5fce4486a80fdaf4a4263&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/intel/$%7BBPN%7=
D" rel=3D"noreferrer" target=3D"_blank">github.com/intel/${BPN}</a>&quot;<b=
r>
<br>
-SRCREV =3D &quot;db7087b883bf52cbff063ad17a41cc1cbb85104d&quot;<br>
+SRCREV =3D &quot;a17f0e3ff8669dd3b1c44a741ae4f8162155faed&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0PV .=3D &quot;+git${SRCPV}&quot;<br>
<br>
-- <br>
2.21.3<br>
<br>
<br>
</blockquote></div>

--0000000000003672cf05a59f1073--
