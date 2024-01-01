Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EDCC4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 22:21:02 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.16547.1704147661285537992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 14:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OjocHxYs;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so5758099e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704147659; x=1704752459; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X2nhVg874htM8nIZA63iwwDROQ2itlNGSV0XJc1/gm4=;
        b=OjocHxYsPUIlXrel3/DWea/V7yYjsJmGhVvJsEUZYpfxFMdjxsgiaXnejCn0vE1mxj
         0WOUw/FrB/XrR09c6RWGxs6qSDr5G1wm1kn4HC4SohVkOf2l8rA1S2Dl22g1FZ+UQ9/S
         B8LMTlL8JCjtwe7hZaRBIGngrk0H6CUNmHZvtIVQbQpeiPfX1AIwRCHWUDOZuYn4m1EA
         H+QyQZ+enuguwBUZ3dyQp9ovReukXYhOFmwMjesYqqYfNesssnGy4DC1wFs0YkxCJ6B6
         5hIRgQy60pfmYPXs2EqW4pGe0ov6X6OCG5wxgDdJhnyTg4s/cu0vf/kQOmSe5bF1ybwz
         5T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704147659; x=1704752459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2nhVg874htM8nIZA63iwwDROQ2itlNGSV0XJc1/gm4=;
        b=DdZC376MiBc7O7hAZvB4646O5vd8boMzuezp6zFwq95DH5ldw2wprrn1yWxfxT6OQj
         XWrPEIWG3nOTiBB+iOjtNSMJSpe1b9wNlWWTFZbcWYb2PognGYjZ4CLMhy684uHWygY0
         D+m02Fqm+lbJS40D6ZEDP0L+Wf0SzKRQHLBVepMKsKHYUnZtT+krE25kYs895euieBg3
         q2rTFnbAsSnvu5s2N/iTBMwddyt5T0Zo6Btwz/cvzRTo2Kh4g0zwvlayA4poBSvkSrT5
         OcojsY5oU0duBqpcTh5k1LITgqr5Bl1Li2zlZqSTGTS3v2UoGLG2sdsNjvG71S/Ktx3O
         TbHg==
X-Gm-Message-State: AOJu0YwdoLWm+7ilI096hKY3NLEYv40owTWCBLDHAVFhhvc2jT8mpgBX
	KJTEwSA00i+lVCvS5zdsnF204KjmxPJzx5cBY5o=
X-Google-Smtp-Source: AGHT+IHn5t0fNhXFfOQ9DvuAGF4cQGuJBO5SCT9n2Ihanc7EGJFNYdAGNYFyF3doJNWtd+IZJYqrkPPxrUqrzjHzp0I=
X-Received: by 2002:a05:6512:230c:b0:50e:84b5:a4c with SMTP id
 o12-20020a056512230c00b0050e84b50a4cmr2375284lfu.232.1704147658962; Mon, 01
 Jan 2024 14:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20240101213117.437651-1-vince@underview.tech>
In-Reply-To: <20240101213117.437651-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jan 2024 23:20:48 +0100
Message-ID: <CANNYZj-0DEz5b=P3+qO+ei-hwD4Fb_gL3fXh9uS_NwSpw-OwhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] packagegroup-core-x11-xserver: use
 RRECOMMENDS for mesa-driver-swrast
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000db7ae7060de9cb32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193192

--000000000000db7ae7060de9cb32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How can the issue be reproduced? It=E2=80=99s not seen in standard configur=
ations,
so how did you run into the error?

Alex

On Mon 1. Jan 2024 at 22.31, Vincent Davis Jr <vince@underview.tech> wrote:

> When building qemux86-64 machine run into
>
> nothing provides mesa-driver-swrast needed by
> packagegroup-core-x11-xserver-1.0-r0.qemux86_64
>
> mesa-driver-swrast package is add via the
> PACKAGES_DYNAMIC variable, but gets included in
> RDEPENDS of packagegroup-core-x11-xserver.
>
> Put it in RRECOMMENDS so that error nolonger occurs.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  .../packagegroups/packagegroup-core-x11-xserver.bb           | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-graphics/packagegroups/
> packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/
> packagegroup-core-x11-xserver.bb
> index ebc1330055..c0473306ff 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.b=
b
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.b=
b
> @@ -10,13 +10,18 @@ inherit packagegroup features_check
>  # rdepends on XSERVER
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> +XSERVER_RECOMMENDS ??=3D ""
> +
>  XSERVER ?=3D "xserver-xorg \
>              xf86-video-fbdev \
>              xf86-video-modesetting \
>              "
> +
>  XSERVERCODECS ?=3D ""
>
>  RDEPENDS:${PN} =3D "\
>      ${XSERVER} \
>      ${XSERVERCODECS} \
>      "
> +
> +RRECOMMENDS:${PN} =3D "${XSERVER_RECOMMENDS}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193190):
> https://lists.openembedded.org/g/openembedded-core/message/193190
> Mute This Topic: https://lists.openembedded.org/mt/103471043/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000db7ae7060de9cb32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">How can the issue be reproduced? It=E2=80=99s not seen in=
 standard configurations, so how did you run into the error?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 1. Jan 2024 at 22.31,=
 Vincent Davis Jr &lt;vince@underview.tech&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">When building qemux86-64 machine run into<br>
<br>
nothing provides mesa-driver-swrast needed by<br>
packagegroup-core-x11-xserver-1.0-r0.qemux86_64<br>
<br>
mesa-driver-swrast package is add via the<br>
PACKAGES_DYNAMIC variable, but gets included in<br>
RDEPENDS of packagegroup-core-x11-xserver.<br>
<br>
Put it in RRECOMMENDS so that error nolonger occurs.<br>
<br>
Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-core-x11-xserver.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-core-x11-xserver.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/packagegroups/<a href=3D"http://packageg=
roup-core-x11-xserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-core-x11-xserver.bb</a> b/meta/recipes-graphics/packagegroups/<a href=3D"h=
ttp://packagegroup-core-x11-xserver.bb" rel=3D"noreferrer" target=3D"_blank=
">packagegroup-core-x11-xserver.bb</a><br>
index ebc1330055..c0473306ff 100644<br>
--- a/meta/recipes-graphics/packagegroups/<a href=3D"http://packagegroup-co=
re-x11-xserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-x=
11-xserver.bb</a><br>
+++ b/meta/recipes-graphics/packagegroups/<a href=3D"http://packagegroup-co=
re-x11-xserver.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-x=
11-xserver.bb</a><br>
@@ -10,13 +10,18 @@ inherit packagegroup features_check<br>
=C2=A0# rdepends on XSERVER<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
+XSERVER_RECOMMENDS ??=3D &quot;&quot;<br>
+<br>
=C2=A0XSERVER ?=3D &quot;xserver-xorg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xf86-video-fbdev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xf86-video-modesetting \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
=C2=A0XSERVERCODECS ?=3D &quot;&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${XSERVER} \<br>
=C2=A0 =C2=A0 =C2=A0${XSERVERCODECS} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+RRECOMMENDS:${PN} =3D &quot;${XSERVER_RECOMMENDS}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193190): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193190" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193190</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103471043/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103471043/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000db7ae7060de9cb32--

