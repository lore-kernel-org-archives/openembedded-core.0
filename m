Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.21611.1631485110839256633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 15:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RcMdM+sg;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id a66so8560931qkc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qJchODLJ6w5fZjpxOwjuzmbiUalBZ7lg2R7ZiBLsKGw=;
        b=RcMdM+sgLQQjxaK9jT+p3uLrlELu9zuc0THgEPHuBPrKExJ8oknNoW+6pmsXuPFetM
         HHAmx2iXJ3a8kzaalZbuzozl3sG854ML5EC+A8VsmGuFLtyTviva20aKraSGBPllBJHx
         w1ySc5dTRsbHxO9sfY98Dbdnvd5alRPM/dFVRo4N6t+uPznXLEH8K7to/kp26PuN15rq
         Kd4yFHb1/AAFAPyRbUhsc8Wv3hsb6OF6KV7059epXVklwhaPM5fAjj/OyFvm2jowy8Cu
         VpGVyOLDlh6fQ+/s+PtflCtk+9gAa1KiuMcMaOzLOn1rwlX35mvU8TBe2qM4DywzJ6wv
         EKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJchODLJ6w5fZjpxOwjuzmbiUalBZ7lg2R7ZiBLsKGw=;
        b=Og6sc20y3qJICQ1eR6B6oRNaOGWW39eu7+zqHUmVhzdqsizZRYbw6HrkJmHa4mkILt
         zmPR44UyRbG0ovBBtFp38+4sYIEicyjj4sSPdfIaib2ErQsjGXmNpdGGTQf335+nKR6x
         uKNrwp34Eyhep80N0hVzB5lhwDtk2lxG8SGPjOtkJGo6La4vPDW6OWUCOFJsLjJjx4lM
         YV4yduVMtbEM9CviChHrjuF+gUX6djrGGEWqQb6pAnIy2K30RPXt+FBUl+xLrO1D4pS6
         sIn4Y2DZx4lZwi1OP0DkptdehjqXu50btiX3WDwZVSOiKuhjks7Qln+1gsieYCDbTtuq
         UOLg==
X-Gm-Message-State: AOAM530GU4ubX3yVsFU/L8dfXT0OIB5Wu5rujad7i/UdyMhZFvlRystG
	qotnISErPaAoC3m6zQVA4pYXDy7q5Si/EbVx6/c=
X-Google-Smtp-Source: ABdhPJwuGTIaZWGWPcTEH7JJPLkBGOulTD7T9PuhsA0IVE9EHYzTzQYRX9sG5Rh+GATyDu2rWNTb5SHjF//bhWAtXRQ=
X-Received: by 2002:a05:620a:1086:: with SMTP id g6mr7307800qkk.105.1631485109807;
 Sun, 12 Sep 2021 15:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210912171919.3090505-1-f_l_k@t-online.de>
In-Reply-To: <20210912171919.3090505-1-f_l_k@t-online.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 12 Sep 2021 15:18:19 -0700
Message-ID: <CAMKF1soU-jZ1d=--NS+=f_Z72FwzL85VyHvoxpnXGdeZY4nsoA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] util-linux: disable raw
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006d2cd705cbd3bae9"

--0000000000006d2cd705cbd3bae9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 10:20 AM Markus Volk <f_l_k@t-online.de> wrote:

> raw.h has been dropped in linux-libc-headers-5.14 leading to:
>
> configure: error: raw selected, but required raw.h header file not
> available
> WARNING: exit code 1 from a shell command.


Overall this is a fine change however I wonder what=E2=80=99s the way to ge=
t this
fixed upstream is it that it should now be removed from util-Linux in
future ?

>
>
> Signed-off-by: MarkusVolk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/util-linux/util-linux_2.37.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
> b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
> index 9351595144..6f2808cc44 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
> @@ -73,7 +73,7 @@ EXTRA_OECONF =3D "\
>      \
>      --disable-bfs --disable-login \
>      --disable-makeinstall-chown --disable-minix --disable-newgrp \
> -    --disable-use-tty-group --disable-vipw \
> +    --disable-use-tty-group --disable-vipw --disable-raw \
>      \
>      --without-udev \
>      \
> --
> 2.25.1
>
>
>=20
>
>

--0000000000006d2cd705cbd3bae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 12, 2021 at 10:20 AM Markus Volk &lt;<a href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">raw.h has been dropped in linux-libc-headers-5.14 =
leading to:<br>
<br>
configure: error: raw selected, but required raw.h header file not availabl=
e<br>
WARNING: exit code 1 from a shell command.</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Overall this is a fine change however I wonder wh=
at=E2=80=99s the way to get this fixed upstream is it that it should now be=
 removed from util-Linux in future ?</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto"><br>
<br>
Signed-off-by: MarkusVolk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.37.2.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.37.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.37=
.2.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.37.2.bb</a> b/meta=
/recipes-core/util-linux/<a href=3D"http://util-linux_2.37.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">util-linux_2.37.2.bb</a><br>
index 9351595144..6f2808cc44 100644<br>
--- a/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.37.2.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.37.2.bb</a><br>
+++ b/meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.37.2.bb" =
rel=3D"noreferrer" target=3D"_blank">util-linux_2.37.2.bb</a><br>
@@ -73,7 +73,7 @@ EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0--disable-bfs --disable-login \<br>
=C2=A0 =C2=A0 =C2=A0--disable-makeinstall-chown --disable-minix --disable-n=
ewgrp \<br>
-=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw \<br>
+=C2=A0 =C2=A0 --disable-use-tty-group --disable-vipw --disable-raw \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0--without-udev \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000006d2cd705cbd3bae9--
