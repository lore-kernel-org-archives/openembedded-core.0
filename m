Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id E09D07FC1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:20:11 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id s16so6830303vsc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HuPv7A/MNtXrVamuwh/wGehB6xurozb/qCCOrOlZI8c=;
	b=J1ghiIrrUyyGc9n2uXY/MrpYJMlS5DJlwh7TaJ8Vu2B5Yl+04dtPXOIAKQWfswczsc
	fibdxH1VBMWcOm/D5UrcQGF+TTOoTEryIotrM+ms+ZPshVIIra9K/lChK+CtT+ksVvrI
	/wEwinFgiD4Orxqa69ebqYZlhcu00Iv4PgovT36t93lYuW0DQWBj0yuM7z2SYwZNweKq
	ZKvVb4iBQCEWIg0A4m4+sShmL7X5K+kmIoXQXl3Y9zn3DZt4R86guaothPYFSMBFAZ8z
	Jq7jYOvWH8KLImibBrwWwawgnz7uHcF3sONA+GkkLxmRAkSrdcWs7aA+YcG0O2p0IJJS
	P1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HuPv7A/MNtXrVamuwh/wGehB6xurozb/qCCOrOlZI8c=;
	b=VRfSpxhrTiQ8x0VyQuF8Y5oRhTugE+XDKhtsmc801Z9GTX/SdyaKj43oNY9ozQqWKx
	wu8cP+sShDW4uk7c4CNbS849mCp/4aas9wfaIgvvnIStDnWhEEHWV714zdRUHsHfuHfi
	led+/UW5/GS0/f1062cQzQNAfQejAzhF/1VkuVfr+mBu0qpi6tIIeEWwjnXyRWKzCWHx
	2xGgHm3dcWHijfsB5EJuQD0hb0qFo0CPOeYzh254YTku4E7tvv6A/Y/YuuoZufeoF13y
	o7LwdVSy4sWIQFq0O3RX58V1wga/yJVLtnBaAbaxFOJ7FFA4otz1yUAyYpO/E2644XXP
	CKDQ==
X-Gm-Message-State: APjAAAWQVXCbkTf67ljlaq7hVprSPeAoOgbmaGqVWZekb8ivBbiaxpQN
	iDAzcHLy61GB7bkOoz1PCd/hn4iGlT4hFO8s0mYntg==
X-Google-Smtp-Source: APXvYqwObnCoy9/hd8Zrs5Gw88pEY4IDZpCwPcIIWafDt3ON1Ltup7NRDIdsT7JjGOAKse9g3J4pM1+7YKPnFqLgGQU=
X-Received: by 2002:a67:3187:: with SMTP id x129mr8316473vsx.23.1578950412718; 
	Mon, 13 Jan 2020 13:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20200113211005.14693-1-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20200113211005.14693-1-maxime.roussinbelanger@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2020 22:20:01 +0100
Message-ID: <CANNYZj-2ZLcTC7j=SGTY5O6h-Z2FNRZnkNgzQcWNedSDnPBZUA@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: gdk-pixbuf: add man packageconfig
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
X-List-Received-Date: Mon, 13 Jan 2020 21:20:12 -0000
Content-Type: multipart/alternative; boundary="00000000000077d8da059c0c0aa2"

--00000000000077d8da059c0c0aa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The correct way to configure this is to inherit manpages class, and name
the option 'manpages' as well.

Alex

On Mon, 13 Jan 2020 at 22:10, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> The current default for the meson configuration is to build
> the man. It will only do it if it finds the xsltproc binary
> and man option (default: on).
>
> Adding the packageconfig make sure that xsltproc will be
> found in the correct path (recipe-sysroot-native) and that
> the docbook can be used.
>
> The docbook is needed because xsltproc is used with the
> --nonet option, which prevents the uses of the internet to
> fetch DFD's.
>
> This recipe has been working for probably everyone with the
> current configuration, however if for some reason xsltproc
> can be found inside PATH, meson will use it.
>
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> index 699c4ecd0b..f6cc25cd8c 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> @@ -53,6 +53,7 @@ PACKAGECONFIG[png] =3D "-Dpng=3Dtrue,-Dpng=3Dfalse,libp=
ng"
>  PACKAGECONFIG[jpeg] =3D "-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg"
>  PACKAGECONFIG[tiff] =3D "-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff"
>  PACKAGECONFIG[jpeg2000] =3D "-Djasper=3Dtrue,-Djasper=3Dfalse,jasper"
> +PACKAGECONFIG[man] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native
> docbook-xsl-stylesheets-native,"
>
>  PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx11"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000077d8da059c0c0aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The correct way to configure this is to inherit manpa=
ges class, and name the option &#39;manpages&#39; as well.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 13 Jan 2020 at 22:10, Maxime Roussin-B=C3=A9=
langer &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com">maxime.rouss=
inbelanger@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">The current default for the meson configuration is to b=
uild<br>
the man. It will only do it if it finds the xsltproc binary<br>
and man option (default: on).<br>
<br>
Adding the packageconfig make sure that xsltproc will be<br>
found in the correct path (recipe-sysroot-native) and that<br>
the docbook can be used.<br>
<br>
The docbook is needed because xsltproc is used with the<br>
--nonet option, which prevents the uses of the internet to<br>
fetch DFD&#39;s.<br>
<br>
This recipe has been working for probably everyone with the<br>
current configuration, however if for some reason xsltproc<br>
can be found inside PATH, meson will use it.<br>
<br>
Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.ro=
ussinbelanger@gmail.com" target=3D"_blank">maxime.roussinbelanger@gmail.com=
</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.4=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a> b/met=
a/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>
index 699c4ecd0b..f6cc25cd8c 100644<br>
--- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>
+++ b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>
@@ -53,6 +53,7 @@ PACKAGECONFIG[png] =3D &quot;-Dpng=3Dtrue,-Dpng=3Dfalse,l=
ibpng&quot;<br>
=C2=A0PACKAGECONFIG[jpeg] =3D &quot;-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg&quot;=
<br>
=C2=A0PACKAGECONFIG[tiff] =3D &quot;-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff&quot;=
<br>
=C2=A0PACKAGECONFIG[jpeg2000] =3D &quot;-Djasper=3Dtrue,-Djasper=3Dfalse,ja=
sper&quot;<br>
+PACKAGECONFIG[man] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native doc=
book-xsl-stylesheets-native,&quot;<br>
<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx1=
1&quot;<br>
<br>
-- <br>
2.20.1<br>
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

--00000000000077d8da059c0c0aa2--
