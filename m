Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.183.1601484023967686824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 09:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YB5PjCqk;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id l16so2335400ilt.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ppvSC04pTrC+FFxEqJjspcRUaqp7WiOdODKb/5x3hk=;
        b=YB5PjCqk1JfHBzCcE7mAbkf+cZlYFKInkgiihCfDwf0xLFahaXpIWY8I6kTYh/CkMh
         Du8TiPf1Dz1hArSGGuKSs0rlF79ZblKB+gzVzuR9n7TcvCEtFXKgyqQJDufT0zY/y62E
         XCPr1+iZ431LLKFrkrvhZmgEBV3KBscefnj/jz7DlJzy4vejQY0hKQULJQnM2gDlHbdX
         FleqdiBvhDneCf7GJJvAlaNCw24QP9VuGFN0KYeNu5uArdjGbizxoeNt6Ma4poHAjxiy
         4KMUDetypWxjhx+XdXCcpVPLJTzMenp9v6j+xW/hSEL4kzqI9wW7bfy5r3Q5KiJ20iU2
         uZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ppvSC04pTrC+FFxEqJjspcRUaqp7WiOdODKb/5x3hk=;
        b=bpBUbekDdmh5K8APq2aH197GJDkyZFe3CdtwEpWOXEZH4Ur6U6HTDGeU46YrtQA8Al
         80r011EXjegWyUuQNa2lG+oJhIxz+FOTcpG4e75AMkxt63NhAEDjqRdEZ5a9fKv8Fd73
         IqBkNDvEzZXhW9PPaUJyX38s72wzd43vX72dJv+LvWErOxRXJMisyWMjrFOr9DkpcG/S
         QbYSsqCt6Bp6z7BSWttNuwJCwtkJmwbmqVSILchVBGrubFxA8JhkgVnxz05/uLdQ1WOM
         Lb3bvbcZgFdrRsn2p2ud/6wcM9NonpukKcEeAsWjoE8hZGLh4ue8yM/VYnSj4dLv87oB
         Ol5w==
X-Gm-Message-State: AOAM532luWIwOcCq5fbZAT40Pyf6/i5AUVXTP7byWf0JVwAzC/C6yz51
	JkGwBJyrzA6jd4aEN1t7f/LIGUamas8cb9fjw+w=
X-Google-Smtp-Source: ABdhPJysbH5Ir0zax9QnS51Paa0s+AseJUgrJFA69QxOJHpf6wFcYa2isJb2kPUUE86uEVRa4GWbEV7RZAuylzWMSGc=
X-Received: by 2002:a92:770e:: with SMTP id s14mr1498404ilc.130.1601484023145;
 Wed, 30 Sep 2020 09:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200930150545.3882859-1-ayaka@soulik.info>
In-Reply-To: <20200930150545.3882859-1-ayaka@soulik.info>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 30 Sep 2020 18:40:12 +0200
Message-ID: <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
Subject: Re: [PATCH] meson: add sysroot property
To: ayaka <ayaka@soulik.info>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000502a4d05b08a8e65"

--000000000000502a4d05b08a8e65
Content-Type: text/plain; charset="UTF-8"

Wait, how does it work in native meson then?

Alex

On Wed 30. Sep 2020 at 17.06, ayaka <ayaka@soulik.info> wrote:

> I know the environment setup script would set PKG_CONFIG_PATH,
>
> but the meson won't take that env when translate the includedir
>
> property from the pkg-config.
>
>
>
> Signed-off-by: ayaka <ayaka@soulik.info>
>
> ---
>
>  meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb | 1 +
>
>  1 file changed, 1 insertion(+)
>
>
>
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>
> index 67add2c25e..7fdc4c86d9 100644
>
> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>
> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
>
> @@ -40,6 +40,7 @@ c_args = @CFLAGS
>
>  c_link_args = @LDFLAGS
>
>  cpp_args = @CPPFLAGS
>
>  cpp_link_args = @LDFLAGS
>
> +sys_root = @OECORE_TARGET_SYSROOT
>
>
>
>  [host_machine]
>
>  system = '${SDK_OS}'
>
> --
>
> 2.25.4
>
>
>
>

--000000000000502a4d05b08a8e65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wait, how does=C2=A0it work in native meson then?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 30. Sep 2020 =
at 17.06, ayaka &lt;<a href=3D"mailto:ayaka@soulik.info">ayaka@soulik.info<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">I know the environment setup scrip=
t would set PKG_CONFIG_PATH,<br><br>but the meson won&#39;t take that env w=
hen translate the includedir<br><br>property from the pkg-config.<br><br><b=
r><br>Signed-off-by: ayaka &lt;<a href=3D"mailto:ayaka@soulik.info" target=
=3D"_blank">ayaka@soulik.info</a>&gt;<br><br>---<br><br>=C2=A0meta/recipes-=
devtools/meson/<a href=3D"http://nativesdk-meson_0.55.1.bb" rel=3D"noreferr=
er" target=3D"_blank">nativesdk-meson_0.55.1.bb</a> | 1 +<br><br>=C2=A01 fi=
le changed, 1 insertion(+)<br><br><br><br>diff --git a/meta/recipes-devtool=
s/meson/<a href=3D"http://nativesdk-meson_0.55.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">nativesdk-meson_0.55.1.bb</a> b/meta/recipes-devtools/meson/=
<a href=3D"http://nativesdk-meson_0.55.1.bb" rel=3D"noreferrer" target=3D"_=
blank">nativesdk-meson_0.55.1.bb</a><br><br>index 67add2c25e..7fdc4c86d9 10=
0644<br><br>--- a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-m=
eson_0.55.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.55.1=
.bb</a><br><br>+++ b/meta/recipes-devtools/meson/<a href=3D"http://nativesd=
k-meson_0.55.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.5=
5.1.bb</a><br><br>@@ -40,6 +40,7 @@ c_args =3D @CFLAGS<br><br>=C2=A0c_link_=
args =3D @LDFLAGS<br><br>=C2=A0cpp_args =3D @CPPFLAGS<br><br>=C2=A0cpp_link=
_args =3D @LDFLAGS<br><br>+sys_root =3D @OECORE_TARGET_SYSROOT<br><br><br><=
br>=C2=A0[host_machine]<br><br>=C2=A0system =3D &#39;${SDK_OS}&#39;<br><br>=
-- <br><br>2.25.4<br><br><br><br></blockquote></div></div>

--000000000000502a4d05b08a8e65--
