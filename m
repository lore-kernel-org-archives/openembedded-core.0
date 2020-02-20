Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id EBA3E60203
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:07:48 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id k24so1185465uaq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DX2M58H3A5lKWmgwJT0+wUFljkr5viavW6W/mOQTIYI=;
	b=ZVHZhzKLPBI3jkZ6UFnApxvnBlFcrFT/+jFJbDK/dh0SH3OPfU0DWE15j9EfkcmDnf
	KwVQREcJh2WLfBgsL2zl3KGf0ghEScKu5TrLjTW6M6m7v7oISCfsll0+Nzkxse5lZNly
	3KV/hbKiRy923Qq+fXuhKxAgTzBoLi1X4uqaB10nNiN/ISo0LlK/K1J4nQQQIMN6Uaux
	6RhE9K9vOBPEVW6bUlMMN0AJ0yNYxuxTYddP51U5eYArPWikHAm3JBGYmlS2x1UsaGXh
	hXhTbgYqGNNdHSWa/WTxvZ4FMzVx2KEkno35l5rRp7VTHtkg+4YjRMN8LXuExzgHLr9d
	k6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DX2M58H3A5lKWmgwJT0+wUFljkr5viavW6W/mOQTIYI=;
	b=LLLSeKFIZPNqg/Cec9quaAP6+jzKZsl0gn1LSln9GfULXawqhe/GCahDF2216K2gMC
	Vosk3gnPV7n1vfGRCT198WxhlJEG6MMmMkX9lNwsg/yyilV3lB4XXoT2w8ldup5v44Hn
	NwScLcViMOlsHlC+SR1URBoVbeVE9scPfFKbg7gFYqZ6k3Zh2h6qu8I2Yy6+05iQFx2R
	ZceB9d11mNJ8k4n5JUVdbECG6OJl3sSOazTHjhl1eh6WPw64XgHEETs1ML5WFMa1UuS5
	0+zRsQFz0ddgiBeu8UIWGcYdoDvuZzbra7pdah+dJDeuBJ+uMg07sHvi2yh8fH6ajGNK
	5vDQ==
X-Gm-Message-State: APjAAAW66TBd0cwmH5c02mn3IptlpT63pzHQ865LrmGAqNnIsaQaYGLC
	p/+dN8atVki3ueB6W9JNdr3kY+zsB+qMpS5TsV4=
X-Google-Smtp-Source: APXvYqzZlmYpryMC9gi7hEb+zuo224bZ9RTJgpbdaarCcZJV7wx//wFOYQ0ZFLQiXy9lx7WPiflUQ0sTgjFu8NsQW6A=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr16477433uae.89.1582193269516; 
	Thu, 20 Feb 2020 02:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
In-Reply-To: <20200220002849.9126-1-schnitzeltony@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2020 11:08:12 +0100
Message-ID: <CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 10:07:49 -0000
Content-Type: multipart/alternative; boundary="000000000000cbabac059eff137a"

--000000000000cbabac059eff137a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You need to at the same time drop the introspection enablement logic from
EXTRA_OECMAKE I think?
This line:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/webki=
t/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70

And for consistency, it would be good to do the same for gtk-doc.

Alex

${@bb.utils.contains('GI_DATA_ENABLED', 'True',
'-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \

${@bb.utils.contains('GI_DATA_ENABLED', 'True',
'-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \


On Thu, 20 Feb 2020 at 01:29, Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

> Enable if 'gobject-introspection-data' is in DISTRO_FEATURES. This is wha=
t
> gobject-introspection.bbclass does automatically for projects build with
> autotools and meson.
>
> It was checked: there are webkitgtk and libdnf inheriting
> gobject-introspection
> and cmake. Since libdnf cannot configure gir, webkitgtk seems the only
> project
> requiring gir-auto-enabling. So handle at recipe / no common magic at
> gobject-introspection.bbclass required.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>
> This patch applies on top of master-next/Alex's patches sent
>
>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> index 585723772e..d5085620d2 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> @@ -39,6 +39,7 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo libxsl=
t
> libxt libidn libgcrypt \
>            "
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
,
> d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES',
> 'gobject-introspection-data', 'gobject-introspection', '' ,d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'webgl opengl', '' ,d)} \
>                     enchant \
>                     libsecret \
> @@ -46,6 +47,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S',
> 'wayland x11', d)} \
>
>  PACKAGECONFIG[wayland] =3D
> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland libwp=
e
> wpebackend-fdo wayland-native"
>  PACKAGECONFIG[x11] =3D
> "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF,virtual/libx11"
> +PACKAGECONFIG[gobject-introspection] =3D
> "-DENABLE_INTROSPECTION=3DON,-DENABLE_INTROSPECTION=3DOFF"
>  PACKAGECONFIG[geoclue] =3D
> "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=3DOFF,geoclue"
>  PACKAGECONFIG[enchant] =3D
> "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=3DOFF,enchant2"
>  PACKAGECONFIG[gtk2] =3D
> "-DENABLE_PLUGIN_PROCESS_GTK2=3DON,-DENABLE_PLUGIN_PROCESS_GTK2=3DOFF,gtk=
+"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cbabac059eff137a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">You nee=
d to at the same time drop the introspection enablement logic from EXTRA_OE=
CMAKE I think?</div><div>This line:</div><div><a href=3D"http://git.yoctopr=
oject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/webkit/webkitgtk_2.26.4=
.bb?h=3Dmaster-next#n70">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tre=
e/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70</a><br><=
/div><div dir=3D"ltr"><br></div><div>And for consistency, it would be good =
to do the same for gtk-doc.</div><div dir=3D"ltr"><br></div><div>Alex</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr"><span style=3D"color:rgb(255,25=
5,255);font-size:13.333333015441895px">${@bb.utils.contains(&#39;GI_DATA_EN=
ABLED&#39;, &#39;True&#39;, &#39;-DENABLE_INTROSPECTION=3DON&#39;, &#39;-DE=
NABLE_INTROSPECTION=3DOFF&#39;, d)} \</span>=C2=A0<div><pre style=3D"paddin=
g:0px;margin-top:0px;margin-bottom:0px;color:rgb(255,255,255);font-size:13.=
333333015441895px"><code>${@bb.utils.contains(&#39;GI_DATA_ENABLED&#39;, &#=
39;True&#39;, &#39;-DENABLE_INTROSPECTION=3DON&#39;, &#39;-DENABLE_INTROSPE=
CTION=3DOFF&#39;, d)} \</code></pre></div></div></div></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Feb =
2020 at 01:29, Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmai=
l.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Ena=
ble if &#39;gobject-introspection-data&#39; is in DISTRO_FEATURES. This is =
what<br>
gobject-introspection.bbclass does automatically for projects build with<br=
>
autotools and meson.<br>
<br>
It was checked: there are webkitgtk and libdnf inheriting gobject-introspec=
tion<br>
and cmake. Since libdnf cannot configure gir, webkitgtk seems the only proj=
ect<br>
requiring gir-auto-enabling. So handle at recipe / no common magic at<br>
gobject-introspection.bbclass required.<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmai=
l.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
<br>
This patch applies on top of master-next/Alex&#39;s patches sent<br>
<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a> b/meta/recip=
es-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">webkitgtk_2.26.4.bb</a><br>
index 585723772e..d5085620d2 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.26.4.bb</a><br>
@@ -39,6 +39,7 @@ DEPENDS =3D &quot;zlib libsoup-2.4 curl libxml2 cairo lib=
xslt libxt libidn libgcrypt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;wayland x11&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;gobject-introspection-data&=
#39;, &#39;gobject-introspection&#39;, &#39;&#39; ,d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;webgl ope=
ngl&#39;, &#39;&#39; ,d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encha=
nt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libse=
cret \<br>
@@ -46,6 +47,7 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;wayland x11&#39;, d)} \<br>
<br>
=C2=A0PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND_TARGET=3DON,-DENABL=
E_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native&quot;<b=
r>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TA=
RGET=3DOFF,virtual/libx11&quot;<br>
+PACKAGECONFIG[gobject-introspection] =3D &quot;-DENABLE_INTROSPECTION=3DON=
,-DENABLE_INTROSPECTION=3DOFF&quot;<br>
=C2=A0PACKAGECONFIG[geoclue] =3D &quot;-DENABLE_GEOLOCATION=3DON,-DENABLE_G=
EOLOCATION=3DOFF,geoclue&quot;<br>
=C2=A0PACKAGECONFIG[enchant] =3D &quot;-DENABLE_SPELLCHECK=3DON,-DENABLE_SP=
ELLCHECK=3DOFF,enchant2&quot;<br>
=C2=A0PACKAGECONFIG[gtk2] =3D &quot;-DENABLE_PLUGIN_PROCESS_GTK2=3DON,-DENA=
BLE_PLUGIN_PROCESS_GTK2=3DOFF,gtk+&quot;<br>
-- <br>
2.21.0<br>
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

--000000000000cbabac059eff137a--
