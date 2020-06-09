Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web12.2225.1591688453999858225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 00:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l0zvVJhA;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id d22so4620279vkf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 00:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJJLHs+Tf2WAxW8STthWDXOltOaZzkTbnqiAaQcS7ZQ=;
        b=l0zvVJhAFm9s3s8cgf3XOjxfvvQQInmpeNz7VgK1GtEYA9YiSkQShKZDmE3pBZg5xT
         FTMYYpP9QuanL6rnr181JIuOhDZRHrolU9E+ErhzJs5Y7pSD2C660pxqYCHj5i8VxD3B
         K4ovFmqe4iJWFrWCxzi/wiTdBrWswrqC/Q1KIm7mmqUrleywprBksT1ZQxlGUHme9QDd
         4VDm4w5NfZ6MERq9FTYU6fKS4EZsiDbj8QyIenggOnHZ0jzCWHx6nePGqw4RshHD121f
         53ek5ZLK0RwLN0FezUq2aVC0Qa1wjH66V7UKi8QEyb31pFptfKCFwEQgH5KmFCzkgw/7
         PEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJJLHs+Tf2WAxW8STthWDXOltOaZzkTbnqiAaQcS7ZQ=;
        b=qOXYTNhXAn9r0EG3a8j/piFuTZjesHQvILIeBvPWYQHQqFN7Zd1CaNlV4DG/iXjKeA
         Zjcs6i8mBfvgnr51+Bt5I0Tgw4iiTQ62U1xBmXt9YiE9JdOTKrflpryg76D83qvgst9C
         vw7mb8XpAZoSKcVZ7IVAT4zEMg/23rdVc4UtF+Frr84UnW1etI04n8NBCKGiQ4VZoPvE
         KLcrieqcLdHUKUTncaJL8a+3+/cwZUIjMboaGFnT0Iy72Z8SJfQjzzK2IebtdnTec5HF
         01ohmRBtdcNTSALOwik3IzEnrzMpv9gSaB5J0DovvSLikYrMdXDqRBPoOtSrcFITxizR
         vrSg==
X-Gm-Message-State: AOAM532nsOzUQQ95zXXI5SQ3b9TCiX2ibdsUn9M+qTC0PuWQqvU1g26r
	qYYJ4KHpdMibLUtk/PG//hoxZubqoyWw73SSurnLVYZ4
X-Google-Smtp-Source: ABdhPJxisxhSci6K/mYcN55FPFPhImuXXW1rBA7KQd2lyF/oCZtEzGOmBBMbd9VzwXJO5VEGbyPCYxqbhbckMx6KNnA=
X-Received: by 2002:a1f:19cd:: with SMTP id 196mr1655595vkz.0.1591688452990;
 Tue, 09 Jun 2020 00:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200609071549.350578-1-mingli.yu@windriver.com>
In-Reply-To: <20200609071549.350578-1-mingli.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Jun 2020 09:40:42 +0200
Message-ID: <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d56c2f05a7a1d8dc"

--000000000000d56c2f05a7a1d8dc
Content-Type: text/plain; charset="UTF-8"

Please explain why?

Alex

On Tue 9. Jun 2020 at 9.17, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add opengl to REQUIRED_DISTRO_FEATURES only for target build.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> index 29b12628d0..d97f0e78f1 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> @@ -21,4 +21,4 @@ inherit meson pkgconfig features_check
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -REQUIRED_DISTRO_FEATURES = "opengl"
> +REQUIRED_DISTRO_FEATURES_class-target = "opengl"
> --
> 2.24.1
>
> 
>

--000000000000d56c2f05a7a1d8dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please explain why?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div></div><div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Jun 2020 at 9.17, Yu, Mingli &l=
t;<a href=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)">From: Mingli Yu &lt;<a href=3D"mailto:mi=
ngli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br=
>
<br>
Add opengl to REQUIRED_DISTRO_FEATURES only for target build.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_=
0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb</a> |=
 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglre=
nderer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.b=
b</a> b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer=
_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb</a><=
br>
index 29b12628d0..d97f0e78f1 100644<br>
--- a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_=
0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb</a><b=
r>
+++ b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_=
0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb</a><b=
r>
@@ -21,4 +21,4 @@ inherit meson pkgconfig features_check<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+REQUIRED_DISTRO_FEATURES_class-target =3D &quot;opengl&quot;<br>
-- <br>
2.24.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000d56c2f05a7a1d8dc--
