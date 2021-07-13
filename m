Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.2255.1626169689272368783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 02:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KoqUTsoA;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id a66so1565455vsd.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nf5nW5XB4roB+G6izpNcrmvOPWAoK+MoYAygrtHY+LU=;
        b=KoqUTsoAeD1/JT57lQFWVW6z6b8LZISx6FhA9ZdxRip7NbKrrmJWTtdvC7+XjgyHKC
         RgdplSZdjMY1rooZapuG08NYU3FZXu+XeXSuaI/mDC8jIHmfI/gXS8/Eaa9Mjxvmk96t
         yCjD6vMZQtVS6PXYDXmibv/mgH7PyJ83IkS5cHvJoDVBx31i+j+218nVQBfskKGkCj8s
         FliPSVe6m2nAl4pZptREBcCt+pHesemYx0wRqA0tPU/FurO3TEJghMoudF25gq4O88fo
         jqHkhIQb1Zza33MxLssXZx7sK4uOHtum0wNLUL0dp+TN68/2LQFCUEY0HH7yN2r3Ems8
         naCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf5nW5XB4roB+G6izpNcrmvOPWAoK+MoYAygrtHY+LU=;
        b=TPG5bLCee5fY//JhjnjKevYAAQdgWM6vkHUHlL4vDjbVbhVHWl0/a131S8t7g/9q+6
         yMMHvdJYc3nr4yZSkQshA/UbYcohHAEEn0a7c4EwmxWfjSWriNlIo7W82av8p0TcM8ev
         Qjsot8Jo2vF6ZIzz0JROduVAxeq+nnGI9ffJNt1rxtDW80CrUpCVb+It/aUDYPc6Hr7T
         eWHJMMGxbOFt42B4bN+fnVXLZQmg4Pyi0WSBjQhiA8qoLH8+W9OQRGfN9r8jl681a7EK
         RTD5rKZ54qmrppB4tlg3cWVLe3/r+/PMy6m7VaUU9l2WhXYdZa6snaqk2mQ2QuLXhq2w
         qb8g==
X-Gm-Message-State: AOAM531QsqPHQd2WpTZJfl82XC0JVIXeZXAUcrxgh4THgipUW4C06S8V
	y4PXUb8eFbdUl6A9nujbeLm6p64zYJ6TSZqFXxyWJNZk
X-Google-Smtp-Source: ABdhPJyaoEIGwc4Yixqi3CR40erHShVbBDV1lvjZIMGJL0obhwBEvoT+70SNeSTZQm0AsPCMgHjODAq0q2uSTBsPBJs=
X-Received: by 2002:a05:6102:3a5a:: with SMTP id c26mr4936702vsu.20.1626169688371;
 Tue, 13 Jul 2021 02:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210713093236.37506-1-Qi.Chen@windriver.com>
In-Reply-To: <20210713093236.37506-1-Qi.Chen@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 13 Jul 2021 11:47:56 +0200
Message-ID: <CANNYZj_mHO5px8Ht-5LyinJCLDvpN_m9eKkoEFakSnTD7p5Xag@mail.gmail.com>
Subject: Re: [OE-core][hardknott][PATCH] gobject-introspection: fix default search path for girdir
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009eb65505c6fe220b"

--0000000000009eb65505c6fe220b
Content-Type: text/plain; charset="UTF-8"

This is not seen in the autobuilder, how can it be reproduced?

Also, please submit upstream first.

Alex

On Tue 13. Jul 2021 at 11.34, Chen Qi <Qi.Chen@windriver.com> wrote:

> When running g-ir-scanner, we get the following error:
>
>   Couldn't find include 'GObject-2.0.gir' (search path:
>   '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0',
> '/usr/share/gir-1.0',
>   '/usr/share/gir-1.0', '/usr/share/gir-1.0']')
>
> This is because g-ir-tool-template.in is not setting girdir correctly.
> It's using the prefix instead of the actual girdir.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++++
>  .../gobject-introspection_1.66.1.bb           |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644
> meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
>
> diff --git
> a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> new file mode 100644
> index 0000000000..c0d263946b
> --- /dev/null
> +++
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
> @@ -0,0 +1,33 @@
> +From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 13 Jul 2021 02:05:11 -0700
> +Subject: [PATCH] g-ir-tool-template.in: fix girdir path
> +
> +In case gir_dir_prefix is set, it's possible that g-ir-scanner
> +cannot find the .gir files. This is because that the girdir
> +is set to gir_dir_prefix, which is wrong. It's not a prefix,
> +it the actual gir dir.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + tools/g-ir-tool-template.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
> +index 6e98f52e..62c07c31 100755
> +--- a/tools/g-ir-tool-template.in
> ++++ b/tools/g-ir-tool-template.in
> +@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] = datadir
> +
> + # Respect gir_dir_prefix
> + girdir = ''
> +-girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@
> '))
> ++girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@',
> 'gir-1.0'))
> + builtins.__dict__['GIRDIR'] = [girdir]
> +
> + # Again, relative paths first so that the installation prefix is
> relocatable
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.66.1.bb
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> index ebac8d3a43..45440cea1d 100644
> --- a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.66.1.bb
> +++ b/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.66.1.bb
> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}",
> 2)}/${BPN}-${PV}.tar.xz \
>
> file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
>
> file://0001-meson.build-exclude-girepo_dep-if-introspection-data.patch \
> +           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "dd44a55ee5f426ea22b6b89624708f9e8d53f5cc94e5485c15c87cb30e06161d"
> --
> 2.30.2
>
>
> 
>
>

--0000000000009eb65505c6fe220b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is not seen in the autobuilder, how can it be reprod=
uced?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, please submi=
t upstream first.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue 13. Jul 2021 at 11.34, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@wind=
river.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
>When running g-ir-scanner, we get the following error:<br>
<br>
=C2=A0 Couldn&#39;t find include &#39;GObject-2.0.gir&#39; (search path:<b=
r>
=C2=A0 &#39;[&#39;/usr/lib64&#39;, &#39;gir-1.0&#39;, &#39;/usr/local/shar=
e/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;,<br>
=C2=A0 &#39;/usr/share/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;]&#39;)<b=
r>
<br>
This is because <a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer=
" target=3D"_blank">g-ir-tool-template.in</a> is not setting girdir correct=
ly.<br>
It&#39;s using the prefix instead of the actual girdir.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++=
++<br>
=C2=A0.../<a href=3D"http://gobject-introspection_1.66.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">gobject-introspection_1.66.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-=
introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch<br>
<br>
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gob=
ject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-gir=
dir-path.patch<br>
new file mode 100644<br>
index 0000000000..c0d263946b<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-=
g-ir-tool-template.in-fix-girdir-path.patch<br>
@@ -0,0 +1,33 @@<br>
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001<br=
>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 13 Jul 2021 02:05:11 -0700<br>
+Subject: [PATCH] <a href=3D"http://g-ir-tool-template.in" rel=3D"noreferr=
er" target=3D"_blank">g-ir-tool-template.in</a>: fix girdir path<br>
+<br>
+In case gir_dir_prefix is set, it&#39;s possible that g-ir-scanner<br>
+cannot find the .gir files. This is because that the girdir<br>
+is set to gir_dir_prefix, which is wrong. It&#39;s not a prefix,<br>
+it the actual gir dir.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer" target=
=
=3D"_blank">g-ir-tool-template.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"norefe=
rrer" target=3D"_blank">g-ir-tool-template.in</a> b/tools/<a href=3D"http:/=
/g-ir-tool-template.in" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-temp=
late.in</a><br>
+index 6e98f52e..62c07c31 100755<br>
+--- a/tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer" t=
arget=3D"_blank">g-ir-tool-template.in</a><br>
++++ b/tools/<a href=3D"http://g-ir-tool-template.in" rel=3D"noreferrer" t=
arget=3D"_blank">g-ir-tool-template.in</a><br>
+@@ -55,7 +55,7 @@ builtins.__dict__[&#39;DATADIR&#39;] =3D datadir<br>
+ <br>
+ # Respect gir_dir_prefix<br>
+ girdir =3D &#39;&#39;<br>
+-girdir =3D os.path.abspath(os.path.join(filedir, &#39;..&#39;, &#39;@gir=
_dir_prefix@&#39;))<br>
++girdir =3D os.path.abspath(os.path.join(filedir, &#39;..&#39;, &#39;@gir=
_dir_prefix@&#39;, &#39;gir-1.0&#39;))<br>
+ builtins.__dict__[&#39;GIRDIR&#39;] =3D [girdir]<br>
+ <br>
+ # Again, relative paths first so that the installation prefix is relocat=
able<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://go=
bject-introspection_1.66.1.bb" rel=3D"noreferrer" target=3D"_blank">gobject=
-introspection_1.66.1.bb</a> b/meta/recipes-gnome/gobject-introspection/<a =
href=3D"http://gobject-introspection_1.66.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gobject-introspection_1.66.1.bb</a><br>
index ebac8d3a43..45440cea1d 100644<br>
--- a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobject-i=
ntrospection_1.66.1.bb" rel=3D"noreferrer" target=3D"_blank">gobject-intros=
pection_1.66.1.bb</a><br>
+++ b/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobject-i=
ntrospection_1.66.1.bb" rel=3D"noreferrer" target=3D"_blank">gobject-intros=
pection_1.66.1.bb</a><br>
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc434e812=
8a68bedd59b80b2ac1eb1c4a \<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version(&q=
uot;${PV}&quot;, 2)}/${BPN}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-giscanner-ignore-err=
or-return-codes-from-ldd-wrapper.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson.build-exclude-=
girepo_dep-if-introspection-data.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-g-ir-tool-template.i=
n-fix-girdir-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;dd44a55ee5f426ea22b6b89624708f9e8d53f5c=
c94e5485c15c87cb30e06161d&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000009eb65505c6fe220b--
