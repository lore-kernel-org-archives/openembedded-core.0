Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6917C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 17:58:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.1773.1643824708254704691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NKGKJEFz;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id p27so716594lfa.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/NLXp5/7WoO1Or2+NZX4YJwflXmoiEAg6+sZ8fnS18=;
        b=NKGKJEFzX/lWlPxvRpsYmo/r4RT0z9sXY8hfNxYXEvhB276Osl3MU5F3KyL8/4waqK
         Hfts+fN2Y+MDZLWrnFQCXU2HDUvMUf5Dm2saEwPtHjhVZrCiWPswR0nmo6pe555EbiwB
         /yFIfdijZLg1AW4ttA1sTKM2YNn507STk5DcXxktjhEa6KlbtO28URK1+CsKoTxj6WR4
         473wU0LqpeUckMJeGJOQ9RDb3b74kWZvm8Wys8RIxblrau0vvmNh22w5DHbnYgKxUxxf
         gAYgTd9pW6RTwajrN35tjbNU/PC+n+yWa/e0tGAOLUD8znp2bkFreis4rD7fk3/lDgDN
         0zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/NLXp5/7WoO1Or2+NZX4YJwflXmoiEAg6+sZ8fnS18=;
        b=R9IB0a6f/F6NIAvBkdLmG3Nlsn0j0i/0wIUtcGR8CAAx0ThHhPWu6VkHpddEXXsIJk
         Um1ho3DgryRaQ9GUMArtkO+etou7k08psRdS6LciTyJPtZ/Ue1exb9ZWfYa2mH6FOSdQ
         7qPOKaC3/nNnEBzxfo2C0zbu3vjvtK9EA15ykqufek4UpCaZSXXRdlTTv1/9p0P6M57S
         ZECGRyLWAdY5YD7fQOLn6ADNghsG0ApyFhpt/pF6PoXSGqz+0eLg488WLfeGamjgJ6X2
         WPEsifoTKBqU/QFqrtKgQvkA7WcVaHNhwRZ7wQhSDisGDqhCB+Gn4gWTZmSl0E7L4Rbv
         e4Xg==
X-Gm-Message-State: AOAM533Iu73rdxrW0tLYMcWBTudhdcam2rt467rM+slKlvzjnTmfjQzo
	tJaZ8azTN/QVsIfe+xNvFr8SxbiC+lnuapEJJ+A=
X-Google-Smtp-Source: 
 ABdhPJzhbmvs5+LoDZNNupqJKnwdbz6BD+8n2WJV57o88yGYuC3li/RcSnc3PVi31+zraoEYYC/Q+R654HWUxjTqeZc=
X-Received: by 2002:a05:6512:110f:: with SMTP id
 l15mr23749708lfg.161.1643824706432;
 Wed, 02 Feb 2022 09:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20220202134233.2091916-1-ch@denx.de>
 <20220202134233.2091916-6-ch@denx.de>
In-Reply-To: <20220202134233.2091916-6-ch@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Feb 2022 17:58:15 +0000
Message-ID: 
 <CANPvuRk8qzTD7_has-+VOgagCA=909ZaCW3zDUsVBRPHPXxnTA@mail.gmail.com>
Subject: Re: [PATCH 05/12] gstreamer1.0-plugins-ugly: 1.18.5 -> 1.19.90
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b3346905d70cc349"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 17:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161225

--000000000000b3346905d70cc349
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudius,

Claudius Heine <ch@denx.de> escreveu no dia quarta, 2/02/2022 =C3=A0(s) 13:=
43:

> Feature `gpl` was added, which allows building gpl licensed codecs.
>
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>  ...s-ugly_1.18.5.bb =3D> gstreamer1.0-plugins-ugly_1.19.90.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.18.5.bb =3D>
> gstreamer1.0-plugins-ugly_1.19.90.bb} (89%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.18.5.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.19.90.bb
> similarity index 89%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.18.5.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.19.90.bb
> index 9777aaee19..53d8d0ed07 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.18.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.19.90.bb
> @@ -13,7 +13,7 @@ LICENSE_FLAGS =3D "commercial"
>  SRC_URI =3D " \
>
> https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$=
{PV}.tar.xz
> \
>              "
> -SRC_URI[sha256sum] =3D
> "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
> +SRC_URI[sha256sum] =3D
> "5242a42c3fad209030bd2e8630b08ae93821384c2278965764a039d31ab2a246"
>
>  S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
>
> @@ -23,7 +23,7 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D "0"
>
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> -    a52dec mpeg2dec \
> +    a52dec mpeg2dec gpl \
>

This will require commercial licence support
https://docs.yoctoproject.org/dev-manual/common-tasks.html?highlight=3Dlice=
nse_flags#enabling-commercially-licensed-recipes


>  "
>
>  PACKAGECONFIG[a52dec]   =3D "-Da52dec=3Denabled,-Da52dec=3Ddisabled,liba=
52"
> @@ -33,6 +33,7 @@ PACKAGECONFIG[cdio]     =3D
> "-Dcdio=3Denabled,-Dcdio=3Ddisabled,libcdio"
>  PACKAGECONFIG[dvdread]  =3D
> "-Ddvdread=3Denabled,-Ddvdread=3Ddisabled,libdvdread"
>  PACKAGECONFIG[mpeg2dec] =3D
> "-Dmpeg2dec=3Denabled,-Dmpeg2dec=3Ddisabled,mpeg2dec"
>  PACKAGECONFIG[x264]     =3D "-Dx264=3Denabled,-Dx264=3Ddisabled,x264"
> +PACKAGECONFIG[gpl]      =3D "-Dgpl=3Denabled,-Dgpl=3Ddisabled"
>
>  EXTRA_OEMESON +=3D " \
>      -Ddoc=3Ddisabled \
> --
> 2.34.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b3346905d70cc349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Claudius,</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Claudius Heine &lt;<a href=3D"mailto:ch@d=
enx.de" target=3D"_blank">ch@denx.de</a>&gt; escreveu no dia quarta, 2/02/2=
022 =C3=A0(s) 13:43:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Feature `gpl` was added, which allows building gpl licensed codecs.<br=
>
<br>
Signed-off-by: Claudius Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_=
blank">ch@denx.de</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://s-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_=
blank">s-ugly_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugins-=
ugly_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-=
ugly_1.19.90.bb</a>} | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-ugly_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0-plugin=
s-ugly_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-ugly_1.19.90.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-ugly_1.18.5.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-ugly_1.19.90.bb" rel=3D"noreferrer" target=3D"=
_blank">gstreamer1.0-plugins-ugly_1.19.90.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-ugly_1.18.5.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-ugly_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-ugly_1.19.90.bb</a><br>
index 9777aaee19..53d8d0ed07 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-ugly_1.18.5.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.19.90.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-ugly_1.19.90.bb</a><br>
@@ -13,7 +13,7 @@ LICENSE_FLAGS =3D &quot;commercial&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gstreame=
r.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$%7BPV%7D.tar.xz" r=
el=3D"noreferrer" target=3D"_blank">https://gstreamer.freedesktop.org/src/g=
st-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;df32803e98f8a9979373fa2ca7e05e62f977b1097576d=
3a80619d9f5c69f66d9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5242a42c3fad209030bd2e8630b08ae93821384c22789=
65764a039d31ab2a246&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-ugly-${PV}&quot;<br>
<br>
@@ -23,7 +23,7 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D &quot;0&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${GSTREAMER_ORC} \<br>
-=C2=A0 =C2=A0 a52dec mpeg2dec \<br>
+=C2=A0 =C2=A0 a52dec mpeg2dec gpl \<br></blockquote><div><br></div><div>Th=
is will require commercial=C2=A0licence support</div><div><a href=3D"https:=
//docs.yoctoproject.org/dev-manual/common-tasks.html?highlight=3Dlicense_fl=
ags#enabling-commercially-licensed-recipes" target=3D"_blank">https://docs.=
yoctoproject.org/dev-manual/common-tasks.html?highlight=3Dlicense_flags#ena=
bling-commercially-licensed-recipes</a><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG[a52dec]=C2=A0 =C2=A0=3D &quot;-Da52dec=3Denabled,-Da52d=
ec=3Ddisabled,liba52&quot;<br>
@@ -33,6 +33,7 @@ PACKAGECONFIG[cdio]=C2=A0 =C2=A0 =C2=A0=3D &quot;-Dcdio=
=3Denabled,-Dcdio=3Ddisabled,libcdio&quot;<br>
=C2=A0PACKAGECONFIG[dvdread]=C2=A0 =3D &quot;-Ddvdread=3Denabled,-Ddvdread=
=3Ddisabled,libdvdread&quot;<br>
=C2=A0PACKAGECONFIG[mpeg2dec] =3D &quot;-Dmpeg2dec=3Denabled,-Dmpeg2dec=3Dd=
isabled,mpeg2dec&quot;<br>
=C2=A0PACKAGECONFIG[x264]=C2=A0 =C2=A0 =C2=A0=3D &quot;-Dx264=3Denabled,-Dx=
264=3Ddisabled,x264&quot;<br>
+PACKAGECONFIG[gpl]=C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dgpl=3Denabled,-Dgpl=3Dd=
isabled&quot;<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Ddoc=3Ddisabled \<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--000000000000b3346905d70cc349--

