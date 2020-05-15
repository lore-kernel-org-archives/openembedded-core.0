Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.139.1589574657377112031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 13:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qhD7/QvW;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id s9so3342614eju.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=RgBRs+tzA8k5KGu6UBuut7AZrTLXbO2CCorOi5OgyHc=;
        b=qhD7/QvWmGQ7CiZ+QJ+ge6sfwW9w24liG54pMC1HKnd5+rVTn6r203o9WMwzvY7kdt
         quPAJamLdey0PZ3/yDjxJq3vDI9zrmtfwv51gGd11s30vrKlMw0/P8BgHtKxE3Ucwk/0
         R62mr/U04hXqKzuMIdiLXJg5U+Kb5d5wSylx2ckFnlM4o3WAZ8/hJj4xvQC0D+1c2Rm2
         GsJw7LmYHSmWXgVAlVEZOilWi1BvRbk/mVTmXO7TUyjZnN+l8so/G6YcZSQWX1k7M/l1
         UjFYcGEx9pcKPxzUeMCru142FW8C4XAX+VOwGunF8VWo7arFa/UVqJtLPwNsobtv06jN
         FsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RgBRs+tzA8k5KGu6UBuut7AZrTLXbO2CCorOi5OgyHc=;
        b=QMNsJ1DH/mkKxDjJVZUp/RxLUIb8hpC2JGtiXsaAGqambWjB+1R2MDsHnXygc83Jd1
         18J85VXFw7W96nOm/gJHUn8Cz1v5JAYsnNZBUQ9aFckj5IU+sGZ3EPqNKMupwF2oX7du
         j8Gw2fqbdQJc2qseGGI6+mcRTWoQFGCYZYDWxSSqSddk+tcj9QgGZ85yCkpbO442kqyd
         TSQo0+7yQq/yAuaUYSzOMeE2OGFPyYyvDASM62XOQATHz5EE+shrOWL4vyOdGAI8j4L6
         9cKOPn1wjRMf4NajTosyDiUUltREF+WTi+18G+VD5q5LOBkuNfqlRCcG15QnjhPrhhu9
         kUAQ==
X-Gm-Message-State: AOAM530s/nMoBK1LajmrUGitrmbk3DrflUUSsfNvwUbnbv5BLwPG5I7H
	I5wfSLyquwwD6LVWcWYK2d+Fl5HPOC3PkMhm9TR5FUm6
X-Google-Smtp-Source: ABdhPJxGa1a2GEVkPkBkgWKb3PjGxd0+Nvf+9ObzxuIN0aeHQAQ+h7Zq19eKQWD+OpierRFJOu2E63lTo5ZCkiQ8/qU=
X-Received: by 2002:a17:906:51b:: with SMTP id j27mr4436002eja.246.1589574655367;
 Fri, 15 May 2020 13:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com> <20200430214203.26595-2-schnitzeltony@gmail.com>
In-Reply-To: <20200430214203.26595-2-schnitzeltony@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 15 May 2020 22:30:44 +0200
Message-ID: <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ad5eeb05a5b5b00f"

--000000000000ad5eeb05a5b5b00f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to be missing features_check inherit, so
that REQUIRED_DISTRO_FEATURES doesn't prevent it failing in my builds.

Will send patch shortly.

On Thu, Apr 30, 2020 at 11:42 PM Andreas M?ller <schnitzeltony@gmail.com>
wrote:

> From [1]:
>
> 0.20.3
>  * secret-file-backend: Fix use-after-free in flatpak [!52]
>  * docs: Add man subdir only if manpage is enabled [!51]
>
> From [2]:
>
> 0.20.2
>  * secret-file-collection: force little-endian in GVariant [!49, #42]
>  * Prefer g_info() over g_message() [!48, #40]
>  * meson: Don't specify shared_library() [!47]
>  * docs: Make sure to set install: true [!46]
>
> [1]
> http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libsecret-0.20.3.n=
ews
> [2]
> http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libsecret-0.20.2.n=
ews
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...ibsecret_0.20.1.bb =3D> libsecret_0.20.3.bb} | 19 +++++++++++-------=
-
>  1 file changed, 11 insertions(+), 8 deletions(-)
>  rename meta/recipes-gnome/libsecret/{libsecret_0.20.1.bb =3D>
> libsecret_0.20.3.bb} (63%)
>
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
> b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> similarity index 63%
> rename from meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
> rename to meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> index 72511af02d..d3a0c2ff54 100644
> --- a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> @@ -7,21 +7,24 @@ LICENSE =3D "LGPLv2.1"
>  BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libsecret/issues"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99d75238986559bb=
5fc6"
>
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
>  inherit gnomebase gtk-doc vala gobject-introspection manpages
>
>  DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
>
> -PACKAGECONFIG[manpages] =3D "--enable-manpages, --disable-manpages,
> libxslt-native xmlto-native"
> +SRC_URI[archive.md5sum] =3D "47c3fdfeb111a87b509ad271e4a6f496"
> +SRC_URI[archive.sha256sum] =3D
> "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
> +
> +GTKDOC_MESON_OPTION =3D 'gtk_doc'
>
> -SRC_URI[archive.md5sum] =3D "d2dd660a8d502099317bc8af9f30302e"
> -SRC_URI[archive.sha256sum] =3D
> "57f73e94ec6263a17a077fb809cf8cf424637a897a7f15b4eec42ce4aef52447"
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
> +
> +PACKAGECONFIG[manpages] =3D "-Dmanpage=3Dtrue,-Dmanpage=3Dfalse,libxslt=
-native
> xmlto-native"
>
>  # http://errors.yoctoproject.org/Errors/Details/20228/
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>  ARM_INSTRUCTION_SET_armv6 =3D "arm"
> -
> -# vapigen.m4 bundled with the tarball does not yet have our
> cross-compilation fixes
> -do_configure_prepend() {
> -    rm -f ${S}/build/m4/vapigen.m4
> -}
> --
> 2.21.1
>
>=20
>

--000000000000ad5eeb05a5b5b00f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be missing features_check inherit, so that=
=C2=A0REQUIRED_DISTRO_FEATURES doesn&#39;t prevent it failing in my builds=
.<div><br></div><div>Will send patch shortly.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 30, 2020 at =
11:42 PM Andreas M?ller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schn=
itzeltony@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From [1]:<br>
<br>
0.20.3<br>
=C2=A0* secret-file-backend: Fix use-after-free in flatpak [!52]<br>
=C2=A0* docs: Add man subdir only if manpage is enabled [!51]<br>
<br>
From [2]:<br>
<br>
0.20.2<br>
=C2=A0* secret-file-collection: force little-endian in GVariant [!49, #42]=
<br>
=C2=A0* Prefer g_info() over g_message() [!48, #40]<br>
=C2=A0* meson: Don&#39;t specify shared_library() [!47]<br>
=C2=A0* docs: Make sure to set install: true [!46]<br>
<br>
[1] <a href=3D"http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libse=
cret-0.20.3.news" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.org=
/pub/gnome/sources/libsecret/0.20/libsecret-0.20.3.news</a><br>
[2] <a href=3D"http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libse=
cret-0.20.2.news" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome.org=
/pub/gnome/sources/libsecret/0.20/libsecret-0.20.2.news</a><br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ibsecret_0.20.1.bb" rel=3D"noreferrer" target=
=3D"_blank">ibsecret_0.20.1.bb</a> =3D&gt; <a href=3D"http://libsecret_0.2=
0.3.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.3.bb</a>} | 19 =
+++++++++++--------<br>
=C2=A01 file changed, 11 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/libsecret/{<a href=3D"http://libsecret_0.2=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.1.bb</a> =3D&gt=
; <a href=3D"http://libsecret_0.20.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">libsecret_0.20.3.bb</a>} (63%)<br>
<br>
diff --git a/meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20=
.1.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.1.bb</a> b/meta/=
recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.3.bb" rel=3D"noref=
errer" target=3D"_blank">libsecret_0.20.3.bb</a><br>
similarity index 63%<br>
rename from meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.1.bb</a><br>
rename to meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.3.bb</a><br>
index 72511af02d..d3a0c2ff54 100644<br>
--- a/meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.1.bb" =
rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.1.bb</a><br>
+++ b/meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.3.bb</a><br>
@@ -7,21 +7,24 @@ LICENSE =3D &quot;LGPLv2.1&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/libse=
cret/issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/=
GNOME/libsecret/issues</a>&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D23c2a5e0106b99d75238=
986559bb5fc6&quot;<br>
<br>
+GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
+<br>
=C2=A0inherit gnomebase gtk-doc vala gobject-introspection manpages<br>
<br>
=C2=A0DEPENDS +=3D &quot;glib-2.0 libgcrypt gettext-native&quot;<br>
<br>
-PACKAGECONFIG[manpages] =3D &quot;--enable-manpages, --disable-manpages, =
libxslt-native xmlto-native&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;47c3fdfeb111a87b509ad271e4a6f496&quot;<=
br>
+SRC_URI[archive.sha256sum] =3D &quot;4fcb3c56f8ac4ab9c75b66901fb0104ec7f2=
2aa9a012315a14c0d6dffa5290e4&quot;<br>
+<br>
+GTKDOC_MESON_OPTION =3D &#39;gtk_doc&#39;<br>
<br>
-SRC_URI[archive.md5sum] =3D &quot;d2dd660a8d502099317bc8af9f30302e&quot;<=
br>
-SRC_URI[archive.sha256sum] =3D &quot;57f73e94ec6263a17a077fb809cf8cf42463=
7a897a7f15b4eec42ce4aef52447&quot;<br>
+# gobject-introspection is mandatory and cannot be configured<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<br>
+UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; introspection&quot;<br>
+<br>
+PACKAGECONFIG[manpages] =3D &quot;-Dmanpage=3Dtrue,-Dmanpage=3Dfalse,libx=
slt-native xmlto-native&quot;<br>
<br>
=C2=A0# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20228/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/D=
etails/20228/</a><br>
=C2=A0ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
=C2=A0ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
=C2=A0ARM_INSTRUCTION_SET_armv6 =3D &quot;arm&quot;<br>
-<br>
-# vapigen.m4 bundled with the tarball does not yet have our cross-compila=
tion fixes<br>
-do_configure_prepend() {<br>
-=C2=A0 =C2=A0 rm -f ${S}/build/m4/vapigen.m4<br>
-}<br>
-- <br>
2.21.1<br>
<br>
<br>
</blockquote></div>

--000000000000ad5eeb05a5b5b00f--
