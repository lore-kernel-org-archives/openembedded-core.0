Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.4546.1616656792104837557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 00:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OWaipey3;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id e13so369638vsl.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7bTtsrdYmuaz+cI3tOo8xTdJrYuoG7DjXaZ6RCSEoM=;
        b=OWaipey38Soni3oCZzTVY7o2k0yDvdk4V/X3WYEHhxwzZG4YB3Zm1KWnb3PHmBW9uf
         gVodzaEzqI1izFr4jgcNcijwAC9u2goO92Se6C+9dZigQzsdfk5gQq7BqukXRUrlmV7o
         n6ma/fG+P+bOLhwS31TDlR0+DDSEyfQfGo+cYwm2AmEABdMR/6ajBhdTUJhg0NbcwLQO
         ot9cWcjdw4xz3lf8XXwRHnmSZqwdd8oPPAv3VBJBg7GVThYt6eXsSxYNvK+p42O0gD3C
         UxavK14JGxQTjejHBXqBfga4L7IZU/KzlU7Ts4NKoMUb90jf2Aiqp8eQhOpjn/IulT3T
         Am6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7bTtsrdYmuaz+cI3tOo8xTdJrYuoG7DjXaZ6RCSEoM=;
        b=FpQDxDAjmH72IFpiEL3zeIiKIKSmZbkcaTR+H3/eohVv1ZVUpNnhFlPVXt1M2Ur1Mx
         Pu4kkry7gyRG1CsYzJv9YGCZyFDbxa4Mu+RcaZ62nWjHOoZHXyP60qELzmQFiw0iHIZT
         Y/cb1YlbAP2ie3WDO61xaTQ2wNvk/x1vj2UwzGxwi2Knzb8l4rBpGANVso3S3dMop/7G
         orADXAhOM4QnDOioAq9y3C+2ZET3ll0KLHoL75rEZOiRT85K9ndSGjUP3n5rnZJk13Ph
         i6xE7aY/tokuqzsffuOyUFbdFR8NcF44GHPh9TVSQecRkVMgdmYFyHqubcpP2EGwQ8p7
         VQDQ==
X-Gm-Message-State: AOAM5318+f2GuzvV7eETxmAXdh0FqTzBCdPJ7Wiz/8txiWCAy5soyEcA
	qpV+V5g7+nzgngrAjfUz2MR5Bvw7tHojpPryCKQ=
X-Google-Smtp-Source: ABdhPJxbaQK65yPfE4htChOqVSHqgMxQH82v5/ALHQUooJZHbz9wKOuhCSwYmt6RNmUA2dSb0fwSjfkUpnoGlj+1/jQ=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr4082193vsn.51.1616656791309;
 Thu, 25 Mar 2021 00:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <1616629614-44093-1-git-send-email-wangmy@fujitsu.com> <1616629614-44093-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1616629614-44093-2-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 25 Mar 2021 08:19:40 +0100
Message-ID: <CANNYZj9bBa3AFUeh7Xt02wvr8fgMiv4tnpCWwmzwEbrJLVSUWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libassuan: upgrade 2.5.4 -> 2.5.5
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: multipart/alternative; boundary="000000000000c510be05be573d29"

--000000000000c510be05be573d29
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Mar 2021 at 00:47, wangmy <wangmy@fujitsu.com> wrote:

> -@@ -158,12 +88,8 @@ dnl
> - AC_DEFUN([AM_PATH_LIBASSUAN],
> - [ _AM_PATH_LIBASSUAN_COMMON($1)
> -   if test $ok = yes; then
> --    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
> --    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
> -     ifelse([$2], , :, [$2])
> -   else
> --    LIBASSUAN_CFLAGS=""
> --    LIBASSUAN_LIBS=""
> -     ifelse([$3], , :, [$3])
> -   fi
> -   AC_SUBST(LIBASSUAN_CFLAGS)
>
>
How was the patch refreshed? This chunk should not have been removed,
unless upstream has fixed the code, and even then needs to be separately
explained.

Please do use 'devtool upgrade'.

Alex

--000000000000c510be05be573d29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 25 Mar 2021 at 00:47, wangmy &lt;=
<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">-@@ -158,12 +88,8 @@ dnl<br>
- AC_DEFUN([AM_PATH_LIBASSUAN],<br>
- [ _AM_PATH_LIBASSUAN_COMMON($1)<br>
-=C2=A0 =C2=A0if test $ok =3D yes; then<br>
--=C2=A0 =C2=A0 LIBASSUAN_CFLAGS=3D`$LIBASSUAN_CONFIG --cflags`<br>
--=C2=A0 =C2=A0 LIBASSUAN_LIBS=3D`$LIBASSUAN_CONFIG --libs`<br>
-=C2=A0 =C2=A0 =C2=A0ifelse([$2], , :, [$2])<br>
-=C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 LIBASSUAN_CFLAGS=3D&quot;&quot;<br>
--=C2=A0 =C2=A0 LIBASSUAN_LIBS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0ifelse([$3], , :, [$3])<br>
-=C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0AC_SUBST(LIBASSUAN_CFLAGS)<br><br></blockquote><div><br></div=
><div>How was the patch refreshed? This chunk should not have been removed,=
 unless upstream has fixed the code, and even then needs to be separately e=
xplained.</div><div><br></div><div>Please do use &#39;devtool upgrade&#39;.=
<br></div><div><br></div><div>Alex<br></div></div></div>

--000000000000c510be05be573d29--
