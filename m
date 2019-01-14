Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2567C052
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 16:10:05 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id v10so17978470ios.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 08:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5aH6FroYZQ24oyLIa/7px40/EiLpVVd3Z3gNRSnYRaM=;
	b=sJ6Lo1u4x5sMXeyPrh21BSAAqvxGkY8ZoW4b0K3ZFzinOkIFzkV39lOl9Lq2Cad0FL
	GRhZbOah95+BZcICQscqMxnWs6HyOJfekFMgPGveu554gs6oDZGNbZH3SNb2ylmhRw5P
	a+3hswaqeiGMPidaWW8AiUx+i8cZhDTarXprtkPncjTEvPwiYhWvcgqi4Fi7Yob50Ghz
	hWf9fzsgpNrgqrqOiyE1D2mkHHF8e8x8thX9F1tYfM1KKUlbIMQJ9Vh1V9gs7hX/tOX+
	ei01Xrnat3pb7aqXU88XgW1ac27ymWv62sak3PhOd5aD/rMjd7+Q1B4UOgUBKnQE19NS
	yWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5aH6FroYZQ24oyLIa/7px40/EiLpVVd3Z3gNRSnYRaM=;
	b=dKVeGYAl3X1BbQGCYJe7PzUDXiQk3/lK9AYv8zCwIbg3/xowiKLtRm0RMKxoSK1lph
	jafL5b0TOfAAEWdkFxOeZvnHqqYRHn6GZe1jCbHa5gekpwRmVRXcSdXPNXFRL2JUK5Mg
	gDI71Ai5Zm/eTRXMsk9zTFzjglREosguWvsdqJWCatjDGTNcDnQme3s7fFv3mj97TQTF
	ZP7yjRYCpchaX0IouQUjaR9XeMKJU2PLnXwYS9k8ghzOotYgKw6oW3TmOEAyl5u0RFuB
	yCf2b0MJXTTvyWf8sqb2C0Y8K4JR3tdJina0FcBZ/xbSz+mz0b4zQW9I/QLk7OHgXZ6U
	5dDQ==
X-Gm-Message-State: AJcUukfx8WH4QxVzYuMOzA+Rlh5kUEXssf+Mw0Tr5+UjNeRLzPi/zai5
	N3vVBrv9WDsISTlTZhALN2kWxKSb8c0o/w/1hRC92g==
X-Google-Smtp-Source: ALg8bN7xzgXK6v1fWSGOYfMflCHqNum72GPhuZLxmTd2aWHMgSExPOITGD1hpj7/hsstd+v6usBpX4hrYzZuH313u+A=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr14719417iog.270.1547482206391;
	Mon, 14 Jan 2019 08:10:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<55c6e394f9668f9b1bd5b426d557d39581c0ff42.1547477793.git.alex.kanavin@gmail.com>
In-Reply-To: <55c6e394f9668f9b1bd5b426d557d39581c0ff42.1547477793.git.alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 16:09:55 +0000
Message-ID: <CAJTo0Lb4Ju4TG2JD_mHy-uXHxqkZc6atb2OEGZbujpvEmw_sNQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/23] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 16:10:05 -0000
Content-Type: multipart/alternative; boundary="00000000000035656e057f6d47bc"

--00000000000035656e057f6d47bc
Content-Type: text/plain; charset="UTF-8"

Wouldn't a preferred provider would sort this?

Ross

On Mon, 14 Jan 2019 at 15:06, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> index 73267eb4f0d..030db6c1440 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> @@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
>  S = "${WORKDIR}/mesa-${PV}"
>
>  PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> +
> +BBCLASSEXTEND_remove = "nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000035656e057f6d47bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wouldn&#39;t a preferred provider would sort this?<div><br=
></div><div>Ross</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Mon, 14 Jan 2019 at 15:06, Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex">Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_18.1.9.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.1.9.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa-gl_18.1.9.bb</a> b/meta/recipes=
-graphics/mesa/<a href=3D"http://mesa-gl_18.1.9.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mesa-gl_18.1.9.bb</a><br>
index 73267eb4f0d..030db6c1440 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_18.1.9.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_18.1.9.bb</a><br>
@@ -7,3 +7,5 @@ PROVIDES =3D &quot;virtual/libgl virtual/mesa&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/mesa-${PV}&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
+<br>
+BBCLASSEXTEND_remove =3D &quot;nativesdk&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000035656e057f6d47bc--
