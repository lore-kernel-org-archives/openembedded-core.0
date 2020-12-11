Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.14162.1607721256055670150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 13:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QEE8QAeD;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id w1so9576151ejf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=js/Akafwxrm/jg/WEOXjE0YzxPfiw1fKpSkI7mRrWFw=;
        b=QEE8QAeD+dLF0onpyfIxqJ+O7/wVHniwm9Tu/NBMCgMVY5W5AltlNIz+aIXn2gXuk/
         cSLWGc/XYEdsUzW4XPI34tfptpsXZdfknGii6vAR0AiIsG8GnowVdYlhizTcbjOQLpls
         myTIi+VbGcTgD16lG3AqZp+HCmxgnOONEWxjdiUqCjtUKOu3wx52QtY+Sh5tJ2UxF4df
         f6DCtHHQnLvJ9/ihaeevQfokZeP6UYNLUftHveOJvBJQsbypgNJ5+42Kev70wxcjfj1u
         KhjFKLQGHA7ur/nJSj0g4LX6OlVgoy3ZA+S2kSukhtxf4wwxFpeSMxM4LIBs3ygcQqMD
         Qmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=js/Akafwxrm/jg/WEOXjE0YzxPfiw1fKpSkI7mRrWFw=;
        b=HfI5ZFrp0yg04L129pCoVxGYzPVx1cfYiBNEYohK0qgfZtHBx0CRaC4ik6PwhcDKoB
         8MY/fPamnbFG+bkdL0kDstDMTlBo0dBQiOc7FbtA05Z36x6nBkZevnKtGsrT423hs9u/
         8XJl6jiCh3exI5p0nwwk6MF7OF79+Ok8QmhoHs40vgwkKq0iRic6TGVU399UsBni20qk
         VVQAAT9AULTKmvHMRlQv71W8vgrVxFQVz05ew4bFzMdasYzoFasZh8xiznJGmX9qTTl9
         6fZx3OhgCCLjL/gbDfbpoBPI9MIjFesKu5uHgkNrbfL/1UCCocLDCY4rgzWSAin1B3yN
         MQGg==
X-Gm-Message-State: AOAM532W/DQI9alAd0l0S7wdKIhBOtX2oCnZfMhHAbnc8N1cKhIPeB7o
	oYwDacxIREz+i3bne8LE89mgMe6RhuOLYg9lNAQ=
X-Google-Smtp-Source: ABdhPJzi+5bNe56CWLzwVhtWDrxSslcNe3UtG5O89/qnM/j5pj0Lq7hNTuvl5yQP5NU/TUSomSHPrkG776ykfSv/oPU=
X-Received: by 2002:a17:907:d28:: with SMTP id gn40mr12483386ejc.33.1607721254440;
 Fri, 11 Dec 2020 13:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20201208161257.949716-1-quaresma.jose@gmail.com> <164EC9D39D4D4B41.7121@lists.openembedded.org>
In-Reply-To: <164EC9D39D4D4B41.7121@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 11 Dec 2020 21:13:58 +0000
Message-ID: <CANPvuRkBwC0SborxcEtzRmYOFVT8w1iiZw+S4RfM=U8LhAWZjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 8/8] gstreamer1.0-plugins-bad: remove meson option for plugins with dependencies always present
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000044d5ce05b636c607"

--00000000000044d5ce05b636c607
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I have think about this patch and probably is better to drop it.
It is now on master-next

Without this we have meson options for all the gstreamer plugins that have
external dependencies.

Probably its better to have it explicity enabled than don't have this
options at all and falback to meson auto discovery dependencies.

Jose

A ter=C3=A7a, 8/12/2020, 16:13, Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu:

> decklink: libdl (glibc)
> dvbk: kernel headers
> fbdev: kernel headers
> ipcpipeline: gst-plugins-base
> shm: librt (glibc)
> transcode: gst-plugins-base
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb            | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.18.2.bb
> index d37a223254..a43261b704 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.=
bb
> @@ -87,12 +87,6 @@ PACKAGECONFIG[x265]            =3D
> "-Dx265=3Denabled,-Dx265=3Ddisabled,x265"
>
>  EXTRA_OEMESON +=3D " \
>      -Ddoc=3Ddisabled \
> -    -Ddecklink=3Denabled \
> -    -Ddvb=3Denabled \
> -    -Dfbdev=3Denabled \
> -    -Dipcpipeline=3Denabled \
> -    -Dshm=3Denabled \
> -    -Dtranscode=3Denabled \
>      -Dandroidmedia=3Ddisabled \
>      -Dapplemedia=3Ddisabled \
>      -Davtp=3Ddisabled \
> --
> 2.29.2
>
>
>=20
>
>

--00000000000044d5ce05b636c607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Richard,<div dir=3D"auto"><br></div><div dir=3D"a=
uto">I have think about this patch and probably is better to drop it.</div>=
<div dir=3D"auto">It is now on master-next</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Without this we have meson options for all the gstreamer=
 plugins that have external dependencies.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Probably its better to have it explicity enabled than don=
&#39;t have this options at all and falback to meson auto discovery depende=
ncies.</div><div dir=3D"auto"><br></div>Jose<br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">A ter=C3=A7a, 8/12/2020, 16:13, J=
ose Quaresma via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org">gmail.com@lists.openembedded.org</a>&gt; escreveu:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">decklink: libdl (glibc)<br>
dvbk: kernel headers<br>
fbdev: kernel headers<br>
ipcpipeline: gst-plugins-base<br>
shm: librt (glibc)<br>
transcode: gst-plugins-base<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.18.2.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.=
18.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ------<br>
=C2=A01 file changed, 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-bad_1.18.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
gstreamer1.0-plugins-bad_1.18.2.bb</a> b/meta/recipes-multimedia/gstreamer/=
<a href=3D"http://gstreamer1.0-plugins-bad_1.18.2.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.18.2.bb</a><br>
index d37a223254..a43261b704 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plu=
gins-bad_1.18.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gstream=
er1.0-plugins-bad_1.18.2.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plu=
gins-bad_1.18.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">gstream=
er1.0-plugins-bad_1.18.2.bb</a><br>
@@ -87,12 +87,6 @@ PACKAGECONFIG[x265]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;-Dx265=3Denabled,-Dx265=3Ddisabled,x265&quot;<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Ddoc=3Ddisabled \<br>
-=C2=A0 =C2=A0 -Ddecklink=3Denabled \<br>
-=C2=A0 =C2=A0 -Ddvb=3Denabled \<br>
-=C2=A0 =C2=A0 -Dfbdev=3Denabled \<br>
-=C2=A0 =C2=A0 -Dipcpipeline=3Denabled \<br>
-=C2=A0 =C2=A0 -Dshm=3Denabled \<br>
-=C2=A0 =C2=A0 -Dtranscode=3Denabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dandroidmedia=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dapplemedia=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Davtp=3Ddisabled \<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000044d5ce05b636c607--
