Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.4315.1618476555541223687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 01:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QdE/rU8e;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id b20so11475541vsr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZLxnTEf1Jv9Nkb7cP32fsXTnwzN6txYVUDKsw8ii4Ho=;
        b=QdE/rU8euzUywtPIeUaTBXEf18f96X52+mUJKl3XcqmMBQ+wAo/N0s70UDBR7AxSEQ
         YwZjTL6qRCK6NpaMIgtHiifkWGPHbhgmvXXfr38rJFuvKxeXiAOz7/sdhmWSgUe7bT2w
         7gAhHZKxqkzjotdeiagNSnjhIu7g/HRMGRhiPThUv05jEvopDnt3NF2wvaTE54MfaUML
         0EklzwB6jY+4BHr9Cy0yYFWyzb4lSM7OMEXRQKMEWXLa7P+uMXL7sZ/nU1P8pTkAKIDi
         HgQ13adMFifK7ZX+m/GJOAWJPsNrmOpxj5PzQVWie9VJ7XJS4ZIqA5j4A5U2sMoVKfOE
         5gAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZLxnTEf1Jv9Nkb7cP32fsXTnwzN6txYVUDKsw8ii4Ho=;
        b=e6Inaof8PV4yNBrj2P/03Gwx4xbnTpqzdzuXwyo6jJ1GRHHoqHQfho24fomwMQW3w8
         Pn99UIc3EURxCvCci1IgyyxTgOCyrkRF7+H1MG2qHJwpHqQPPOyXTtzo4vu39gZxxmOo
         44JT4KBlUEefiLjWolfKqi8dl/8JuNbjOsnxvo6LAjgELvxeB1MK8pRY3enjO9iyV6IH
         Zu9tAiopqe1LfFzQe878JUyd29VEvU8zNQH72X3CHeU8mA74RkJsV3ESt+oOxTx4ikaO
         BudiAiqrZ4cvpOqLdVfgepL4FG6ovKUrwYydfFY4xl3WMLYbsNXheqpqtCyXuI/06Bwl
         lFcQ==
X-Gm-Message-State: AOAM530722YAeMHtyeLoA8gJGXSNz/I+RhcHMCTQUT5FcGs5LuJpBAkU
	dhSIg4x9pP8XQoXexYJSIUI3BQcLtR9+NXkkiak=
X-Google-Smtp-Source: ABdhPJz2UBCdIQFTbhGFzyF54svqFmbDzxQdIee5wWS8efnEMvs4q+F6csOO1abgAUyMK7DN59tzbma+UH2cXE5Ldb4=
X-Received: by 2002:a67:1447:: with SMTP id 68mr956783vsu.20.1618476554747;
 Thu, 15 Apr 2021 01:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com> <1618466841-24292-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1618466841-24292-3-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 15 Apr 2021 10:49:03 +0200
Message-ID: <CANNYZj_W-u+nMwV-78GVdkMgezLTTbPLDSRA23imu+A6O5+BPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 21.0.1 -> 21.0.2
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f81da05bffef0ed"

--0000000000001f81da05bffef0ed
Content-Type: text/plain; charset="UTF-8"

Please remember to update mesa-gl version at the same time.

Alex

On Thu, 15 Apr 2021 at 08:08, wangmy <wangmy@fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
>  meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb}
> (100%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index caf3c62ad8..5705ae0f08 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -21,7 +21,7 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             "
>
> -SRC_URI[sha256sum] =
> "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
> +SRC_URI[sha256sum] =
> "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb
> b/meta/recipes-graphics/mesa/mesa_21.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
> --
> 2.25.1
>
>
> 
>
>

--0000000000001f81da05bffef0ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please remember to update mesa-gl version at the same=
 time.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 15 Apr 2021 at 08:08,=
 wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-=
off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_bl=
ank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
=C2=A0meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.0.1.bb" rel=3D=
"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a> =3D&gt; <a href=3D"http:/=
/mesa_21.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.2.bb</a>} |=
 0<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a> =3D&gt; <a href=3D=
"http://mesa_21.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.2.bb=
</a>} (100%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc<br>
index caf3c62ad8..5705ae0f08 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -21,7 +21,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.or=
g/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_=
futex-if-it-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;379fc984459394f2ab2d84049efdc3a659869dc1328c=
e72ef0598506611712bb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;46c1dc5bb54a372dee43ec3c067229c299187d5bdadf=
1402756bbf66a6df5b88&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\d+)+=
)&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a> b/meta/recipes-grap=
hics/mesa/<a href=3D"http://mesa_21.0.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">mesa_21.0.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">mesa_21.0.2.bb</a><br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001f81da05bffef0ed--
