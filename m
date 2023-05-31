Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11033C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 17:28:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.330.1685554101813751490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 10:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=U8u2sRjJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f60804faf4so45782145e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685554100; x=1688146100;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xM9zQImqy5FPPNtxKbj0CqqOukFykFgSyZ03HCdC/4k=;
        b=U8u2sRjJ2AWsd04CkTsbj0HJvIw/mAKiMs7ba56VB8M+Hf/GUi5mkesBXGz3Nl57Dm
         rUqGoRW/eE4yx9VfvrxMHs6LUI9DfyXUT+hQo3wEIN7kfl5TaMbg25+MdSQYbTmxsJ+M
         r44BXZ+dMExCwUpFaJ68RyL9hKjCwfV/7N6/bR/m1/bXgJRH9dwZohLpiSYgd+O4F/vh
         ixJBsTQnTc+Xqx84yh+OgM17K01djsHbU/84pMez6veVhXL7zWxJ7/GQWWXmJ4r3ZWRl
         Yi9TvMdIIlECGMwwAMs17MNsS6Mid+PYp2W1trdqU/fLJpfe0Kri01Xuf+c0oPP67YT0
         Ca3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685554100; x=1688146100;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xM9zQImqy5FPPNtxKbj0CqqOukFykFgSyZ03HCdC/4k=;
        b=NCbdmytB5hQyznfEsuttKOGzOedHD8B6jI1Da9D+DoyibJHRNAqXgjAZXulehQIexd
         0v2NsH5SfHjRTbficn/VXvVrEa8S45py3k4xwn/pDz0UgbYMVM6zNDLzvXMSQdmn2mkb
         q11l2GT9vcoEXWSreNLmmXS07wdkGyMaDu53s6tPdJlljI+nzG94EsaAL9sk7nGecf4P
         YxH0OM2xQMdVv4f98dov79zBVzIdHzEM469D5bTI8d7kGYjMe8FDMnlzS72WooABlHxM
         kc5nK2P4LqeXigutSHSww1ggUGH1JuFxTloPAeoNyUg/2cC9vx7cG2EdKPGqkWEEZS2f
         LySA==
X-Gm-Message-State: AC+VfDxrD4kXpjadeVqk/IWTKWBB//oMWbExVV2ySHE3sNiE2CNHcCuK
	sFxLRjLf+YfIa3fqlkDo8CDVUQxppjqPlSVRRPUhh+DF
X-Google-Smtp-Source: ACHHUZ49r6dUidUOeptlF02r6LZx1sdx7qRA2JQ8yiL0R+fBBudN948ma3JMljoXAE41s2RnC3KbiR7l24Xf0QSVX/s=
X-Received: by 2002:a5d:4c49:0:b0:309:e24:57b0 with SMTP id
 n9-20020a5d4c49000000b003090e2457b0mr4480762wrt.30.1685554099233; Wed, 31 May
 2023 10:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230522090405.35316-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20230522090405.35316-1-ranjitsinhrathod1991@gmail.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Wed, 31 May 2023 22:58:06 +0530
Message-ID: <CACpMEhMHkXt6GpfUiGJJFmGqtteFNG01kcyYjv3ceC6O-kdovQ@mail.gmail.com>
Subject: Re: [OE-Core][master][mickledore][langdale][kirkstone][PATCH]
 kmscube: Correct DEPENDS to avoid overwrite
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000055a87305fd00a5bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 17:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182020

--00000000000055a87305fd00a5bf
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

Can you please backport this to kirkstone and mickledore?

Thanks,
Ranjitsinh Rathod
+91 - 8460692403



On Mon, May 22, 2023, 2:34 PM <ranjitsinhrathod1991@gmail.com> wrote:

> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> As part of the below commit, DEPENDS gets overwrite which is wrong
> Link:
> https://git.yoctoproject.org/poky/commit/?id=bd947d3343dcd96e79fc8157f32a2a087cd710a7
>
> So correct the DEPENDS varibales
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  meta/recipes-graphics/kmscube/kmscube_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb
> b/meta/recipes-graphics/kmscube/kmscube_git.bb
> index b2c10e09fb..67ac97b963 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
>  HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
>  LICENSE = "MIT"
>  SECTION = "graphics"
> -DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
> +DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm
> virtual/libgbm"
>
>  LIC_FILES_CHKSUM =
> "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
>
> @@ -19,7 +19,6 @@ S = "${WORKDIR}/git"
>  inherit meson pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
> -DEPENDS = "virtual/libgbm"
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[gstreamer] =
> "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0
> gstreamer1.0-plugins-base"
> --
> 2.25.1
>
>

--00000000000055a87305fd00a5bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Steve,<div dir=3D"auto"><br></div><div dir=3D"auto">Ca=
n you please backport this to kirkstone and mickledore?<br><br><div data-sm=
artmail=3D"gmail_signature" dir=3D"auto">Thanks,<br>Ranjitsinh Rathod<br>+9=
1 - 8460692403<br><br>=C2=A0=C2=A0=C2=A0 </div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 22, 2023=
, 2:34 PM  &lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com">ranjitsinh=
rathod1991@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.com" =
target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>&gt;<br>
<br>
As part of the below commit, DEPENDS gets overwrite which is wrong<br>
Link: <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3Dbd947d3343d=
cd96e79fc8157f32a2a087cd710a7" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://git.yoctoproject.org/poky/commit/?id=3Dbd947d3343dcd96e79fc8157=
f32a2a087cd710a7</a><br>
<br>
So correct the DEPENDS varibales<br>
<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kp=
it.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>=
&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">kmscube_git.bb</a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">kmscube_git.bb</a> b/meta=
/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
index b2c10e09fb..67ac97b963 100644<br>
--- a/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
+++ b/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://cgit.freedesktop.org/mesa/kmscu=
be/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://cgit.freedeskt=
op.org/mesa/kmscube/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0SECTION =3D &quot;graphics&quot;<br>
-DEPENDS =3D &quot;virtual/libgles3 virtual/libgles2 virtual/egl libdrm&quo=
t;<br>
+DEPENDS =3D &quot;virtual/libgles3 virtual/libgles2 virtual/egl libdrm vir=
tual/libgbm&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://kmscube.c;beginline=3D1;endline=3D2=
3;md5=3D8b309d4ee67b7315ff7381270dd631fb&quot;<br>
<br>
@@ -19,7 +19,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0inherit meson pkgconfig features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
-DEPENDS =3D &quot;virtual/libgbm&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[gstreamer] =3D &quot;-Dgstreamer=3Denabled,-Dgstreamer=
=3Ddisabled,gstreamer1.0 gstreamer1.0-plugins-base&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000055a87305fd00a5bf--

