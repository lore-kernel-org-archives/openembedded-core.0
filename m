Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.2804.1590055634546630603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W4MoLatS;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id f13so5678852edr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxfHaMux35IHRYQqNMYV7mvLLlpX3pp7j4/vxOZ2cwc=;
        b=W4MoLatS6/yl5HNIlffc8KVvUYYH8OcHIlkLLMJENThU3Df9SISa2lk7DpBS5UmwEK
         87yjYGryOGvqsy518LMzmVChk4H9qKQ5GlfSZFi5c/k16Q9ijpZOvXlFEsa/gf/Qrq+L
         N/MOELx69I9XWzeWFQ2qv2g+q5OfB7hKTOIe8SZXJt4Gc09jqD94tBNxXDSDv7I4N7QN
         YH108zbeXpNXe4X8lUBYbocZXemyGuKTdGwF9VPYotRqw1Yq7qJp+JQs+q/R/R+Tp102
         rySXJM5DT/hOFUk1QT6g33dQf7zMVGg2LpdkRkW61ImnkDn16zjDpmkgynN80ckqTiAn
         enkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxfHaMux35IHRYQqNMYV7mvLLlpX3pp7j4/vxOZ2cwc=;
        b=EM/7TfTbupbgOLnvf1FjJIg5SLYXKYJ0hjVnQhPDwmOZ1H6oXZLwP9IsQRSUQrj90w
         HpJ2Vj97fVgjP0OoVJDzReOYHewaf2n/oOX/HYt/wsvMQTja+vlqh1gEC4GHW6MIUpq1
         ea+c3g1eFMlNO3RylNbNQqOzA6ED73EVaNj2JdA4YGpn2Oc8fp7u7qqMhc65XwfMeilG
         /vDRFV0LfTENmWOsibB0KUMhn9y91lDeGypwTR1XWSozk9Mw5eiA9DIf5OvRCHiEvkmN
         wy1pG2pmjH9wA+vb8esNFNNrtdjQkAWji9g7VbwjCdrCdNBw5UvfLjyHtjNgN1BpjA7/
         QD5w==
X-Gm-Message-State: AOAM532l5DCr0VHz/2tJhro6F+/SBopRvprk4/guBlztZYdcPBB38j3z
	zHl4mMxsHdxS7C3SO0FthDVdhm4vzZ4/pJb6gBE=
X-Google-Smtp-Source: ABdhPJzs8MgMvhPKqH9wZDwygKAQeUU184VHDQBMHQkzO+uOK+Ngf2rt0oPoFiElJyDGw2WDYUqovnAJcL9152Amu8w=
X-Received: by 2002:a05:6402:1c94:: with SMTP id cy20mr7169915edb.270.1590055632979;
 Thu, 21 May 2020 03:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200521092241.28336-1-kai.kang@windriver.com>
In-Reply-To: <20200521092241.28336-1-kai.kang@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 21 May 2020 12:07:01 +0200
Message-ID: <CA+chaQf==RCLZSOE_-76sh9qhjavL_v2M=zTQfXbug1zmnNFhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsecret: add meson option introspection
To: kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002d4a5e05a625adca"

--0000000000002d4a5e05a625adca
Content-Type: text/plain; charset="UTF-8"

If it's no longer mandatory, then please remove:
https://github.com/openembedded/openembedded-core/commit/08c86406186828dce19e101adfd118ed5d9e947e

together with:
# gobject-introspection is mandatory and cannot be configured
REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"

and revert
https://github.com/openembedded/openembedded-core/commit/cab86a3196ef4fcd2714591597f2503aa8138df0
as well


On Thu, May 21, 2020 at 11:23 AM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Add meson option introspection for libsecret. For bsp which doesn't
> support qemu usermode, it could disable gobject introspection build.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../0001-meson-add-option-introspection.patch | 137 ++++++++++++++++++
>  .../libsecret/libsecret_0.20.3.bb             |   2 +
>  2 files changed, 139 insertions(+)
>  create mode 100644
> meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
>
> diff --git
> a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
> b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
> new file mode 100644
> index 0000000000..51ee66f42b
> --- /dev/null
> +++
> b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
> @@ -0,0 +1,137 @@
> +meson: add option introspection
> +
> +Add an option 'introspection' for meson which could control whether
> +build GIR files or not.
> +
> +Upstream-Status: Submitted [
> https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/53]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + libsecret/meson.build | 86 ++++++++++++++++++++++---------------------
> + meson.build           |  1 +
> + meson_options.txt     |  1 +
> + 3 files changed, 46 insertions(+), 42 deletions(-)
> +
> +diff --git a/libsecret/meson.build b/libsecret/meson.build
> +index 759b5ef..2ee8850 100644
> +--- a/libsecret/meson.build
> ++++ b/libsecret/meson.build
> +@@ -104,50 +104,52 @@ libsecret_dep = declare_dependency(
> + )
> +
> + # GObject Introspection
> +-libsecret_gir_sources = [
> +-  'secret-attributes.c',
> +-  'secret-attributes.h',
> +-  'secret-backend.c',
> +-  'secret-backend.h',
> +-  'secret-collection.c',
> +-  'secret-collection.h',
> +-  'secret-item.c',
> +-  'secret-item.h',
> +-  'secret-methods.c',
> +-  'secret-password.c',
> +-  'secret-password.h',
> +-  'secret-paths.c',
> +-  'secret-paths.h',
> +-  'secret-prompt.c',
> +-  'secret-prompt.h',
> +-  'secret-retrievable.c',
> +-  'secret-retrievable.h',
> +-  'secret-schema.c',
> +-  'secret-schema.h',
> +-  'secret-schemas.c',
> +-  'secret-schemas.h',
> +-  'secret-service.c',
> +-  'secret-service.h',
> +-  'secret-types.h',
> +-  'secret-value.c',
> +-  'secret-value.h',
> +-]
> +-libsecret_gir_sources += version_h
> +-libsecret_gir_sources += _enums_generated
> +-
> +-libsecret_gir = gnome.generate_gir(libsecret,
> +-  sources: libsecret_gir_sources,
> +-  namespace: 'Secret',
> +-  nsversion: api_version_major,
> +-  export_packages: 'libsecret-@0@'.format(api_version_major),
> +-  includes: [ 'GObject-2.0', 'Gio-2.0' ],
> +-  header: 'libsecret/secret.h',
> +-  extra_args: [ '-D SECRET_COMPILATION'],
> +-  install: true,
> +-)
> ++if with_gir
> ++  libsecret_gir_sources = [
> ++    'secret-attributes.c',
> ++    'secret-attributes.h',
> ++    'secret-backend.c',
> ++    'secret-backend.h',
> ++    'secret-collection.c',
> ++    'secret-collection.h',
> ++    'secret-item.c',
> ++    'secret-item.h',
> ++    'secret-methods.c',
> ++    'secret-password.c',
> ++    'secret-password.h',
> ++    'secret-paths.c',
> ++    'secret-paths.h',
> ++    'secret-prompt.c',
> ++    'secret-prompt.h',
> ++    'secret-retrievable.c',
> ++    'secret-retrievable.h',
> ++    'secret-schema.c',
> ++    'secret-schema.h',
> ++    'secret-schemas.c',
> ++    'secret-schemas.h',
> ++    'secret-service.c',
> ++    'secret-service.h',
> ++    'secret-types.h',
> ++    'secret-value.c',
> ++    'secret-value.h',
> ++  ]
> ++  libsecret_gir_sources += version_h
> ++  libsecret_gir_sources += _enums_generated
> ++
> ++  libsecret_gir = gnome.generate_gir(libsecret,
> ++    sources: libsecret_gir_sources,
> ++    namespace: 'Secret',
> ++    nsversion: api_version_major,
> ++    export_packages: 'libsecret-@0@'.format(api_version_major),
> ++    includes: [ 'GObject-2.0', 'Gio-2.0' ],
> ++    header: 'libsecret/secret.h',
> ++    extra_args: [ '-D SECRET_COMPILATION'],
> ++    install: true,
> ++  )
> ++endif
> +
> + # Vapi
> +-if with_vapi
> ++if with_vapi and with_gir
> +   libsecret_vapi = gnome.generate_vapi('libsecret-@0
> @'.format(api_version_major),
> +     sources: libsecret_gir[0],
> +     metadata_dirs: meson.source_root() / 'libsecret',
> +diff --git a/meson.build b/meson.build
> +index a26d046..d22e008 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -22,6 +22,7 @@ with_gcrypt = get_option('gcrypt')
> + enable_debug = get_option('debugging')
> + with_vapi = get_option('vapi')
> + with_gtkdoc = get_option('gtk_doc')
> ++with_gir = get_option('introspection')
> +
> + # Some variables
> + config_h_dir = include_directories('.')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index c1fda5d..445aeb0 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -3,3 +3,4 @@ option('gcrypt', type: 'boolean', value: true,
> description: 'With gcrypt and tra
> + option('debugging', type: 'boolean', value: false, description: 'Turn
> debugging on/off')
> + option('vapi', type: 'boolean', value: true, description: 'Create VAPI
> file.')
> + option('gtk_doc', type: 'boolean', value: true, description: 'Build
> reference documentation using gtk-doc')
> ++option('introspection', type: 'boolean', value: true, description:
> 'Create GIR file.')
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> index 8d317c8efc..9830c80448 100644
> --- a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
> @@ -13,6 +13,8 @@ inherit gnomebase gtk-doc vala gobject-introspection
> manpages features_check
>
>  DEPENDS += "glib-2.0 libgcrypt gettext-native"
>
> +SRC_URI += "file://0001-meson-add-option-introspection.patch"
> +
>  SRC_URI[archive.md5sum] = "47c3fdfeb111a87b509ad271e4a6f496"
>  SRC_URI[archive.sha256sum] =
> "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
>
> --
> 2.17.1
>
> 
>

--0000000000002d4a5e05a625adca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If it&#39;s no longer mandatory, then please remove:<div><=
a href=3D"https://github.com/openembedded/openembedded-core/commit/08c86406=
186828dce19e101adfd118ed5d9e947e">https://github.com/openembedded/openembed=
ded-core/commit/08c86406186828dce19e101adfd118ed5d9e947e</a><br></div><div>=
<br></div><div>together with:</div><div># gobject-introspection is mandator=
y and cannot be configured<br>REQUIRED_DISTRO_FEATURES =3D &quot;gobject-in=
trospection-data&quot;<br>UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; int=
rospection&quot;<br></div><div><br></div><div>and revert</div><div><a href=
=3D"https://github.com/openembedded/openembedded-core/commit/cab86a3196ef4=
fcd2714591597f2503aa8138df0">https://github.com/openembedded/openembedded-c=
ore/commit/cab86a3196ef4fcd2714591597f2503aa8138df0</a><br></div><div>as we=
ll</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, May 21, 2020 at 11:23 AM kai &lt;<a href=3D"=
mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a =
href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver=
.com</a>&gt;<br>
<br>
Add meson option introspection for libsecret. For bsp which doesn&#39;t<br=
>
support qemu usermode, it could disable gobject introspection build.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-meson-add-option-introspection.patch | 137 ++++++++++++++++=
++<br>
=C2=A0.../libsecret/<a href=3D"http://libsecret_0.20.3.bb" rel=3D"noreferr=
er" target=3D"_blank">libsecret_0.20.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A02 files changed, 139 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/libsecret/files/0001-meson-add=
-option-introspection.patch<br>
<br>
diff --git a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-intr=
ospection.patch b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-=
introspection.patch<br>
new file mode 100644<br>
index 0000000000..51ee66f42b<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspecti=
on.patch<br>
@@ -0,0 +1,137 @@<br>
+meson: add option introspection<br>
+<br>
+Add an option &#39;introspection&#39; for meson which could control wheth=
er<br>
+build GIR files or not.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.gnome.org/GNOME/lib=
secret/-/merge_requests/53" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.gnome.org/GNOME/libsecret/-/merge_requests/53</a>]<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" tar=
get=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+---<br>
+ libsecret/meson.build | 86 ++++++++++++++++++++++---------------------<b=
r>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ meson_options.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ 3 files changed, 46 insertions(+), 42 deletions(-)<br>
+<br>
+diff --git a/libsecret/meson.build b/libsecret/meson.build<br>
+index 759b5ef..2ee8850 100644<br>
+--- a/libsecret/meson.build<br>
++++ b/libsecret/meson.build<br>
+@@ -104,50 +104,52 @@ libsecret_dep =3D declare_dependency(<br>
+ )<br>
+ <br>
+ # GObject Introspection<br>
+-libsecret_gir_sources =3D [<br>
+-=C2=A0 &#39;secret-attributes.c&#39;,<br>
+-=C2=A0 &#39;secret-attributes.h&#39;,<br>
+-=C2=A0 &#39;secret-backend.c&#39;,<br>
+-=C2=A0 &#39;secret-backend.h&#39;,<br>
+-=C2=A0 &#39;secret-collection.c&#39;,<br>
+-=C2=A0 &#39;secret-collection.h&#39;,<br>
+-=C2=A0 &#39;secret-item.c&#39;,<br>
+-=C2=A0 &#39;secret-item.h&#39;,<br>
+-=C2=A0 &#39;secret-methods.c&#39;,<br>
+-=C2=A0 &#39;secret-password.c&#39;,<br>
+-=C2=A0 &#39;secret-password.h&#39;,<br>
+-=C2=A0 &#39;secret-paths.c&#39;,<br>
+-=C2=A0 &#39;secret-paths.h&#39;,<br>
+-=C2=A0 &#39;secret-prompt.c&#39;,<br>
+-=C2=A0 &#39;secret-prompt.h&#39;,<br>
+-=C2=A0 &#39;secret-retrievable.c&#39;,<br>
+-=C2=A0 &#39;secret-retrievable.h&#39;,<br>
+-=C2=A0 &#39;secret-schema.c&#39;,<br>
+-=C2=A0 &#39;secret-schema.h&#39;,<br>
+-=C2=A0 &#39;secret-schemas.c&#39;,<br>
+-=C2=A0 &#39;secret-schemas.h&#39;,<br>
+-=C2=A0 &#39;secret-service.c&#39;,<br>
+-=C2=A0 &#39;secret-service.h&#39;,<br>
+-=C2=A0 &#39;secret-types.h&#39;,<br>
+-=C2=A0 &#39;secret-value.c&#39;,<br>
+-=C2=A0 &#39;secret-value.h&#39;,<br>
+-]<br>
+-libsecret_gir_sources +=3D version_h<br>
+-libsecret_gir_sources +=3D _enums_generated<br>
+-<br>
+-libsecret_gir =3D gnome.generate_gir(libsecret,<br>
+-=C2=A0 sources: libsecret_gir_sources,<br>
+-=C2=A0 namespace: &#39;Secret&#39;,<br>
+-=C2=A0 nsversion: api_version_major,<br>
+-=C2=A0 export_packages: &#39;libsecret-@0@&#39;.format(api_version_major=
),<br>
+-=C2=A0 includes: [ &#39;GObject-2.0&#39;, &#39;Gio-2.0&#39; ],<br>
+-=C2=A0 header: &#39;libsecret/secret.h&#39;,<br>
+-=C2=A0 extra_args: [ &#39;-D SECRET_COMPILATION&#39;],<br>
+-=C2=A0 install: true,<br>
+-)<br>
++if with_gir<br>
++=C2=A0 libsecret_gir_sources =3D [<br>
++=C2=A0 =C2=A0 &#39;secret-attributes.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-attributes.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-backend.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-backend.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-collection.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-collection.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-item.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-item.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-methods.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-password.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-password.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-paths.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-paths.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-prompt.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-prompt.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-retrievable.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-retrievable.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-schema.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-schema.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-schemas.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-schemas.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-service.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-service.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-types.h&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-value.c&#39;,<br>
++=C2=A0 =C2=A0 &#39;secret-value.h&#39;,<br>
++=C2=A0 ]<br>
++=C2=A0 libsecret_gir_sources +=3D version_h<br>
++=C2=A0 libsecret_gir_sources +=3D _enums_generated<br>
++<br>
++=C2=A0 libsecret_gir =3D gnome.generate_gir(libsecret,<br>
++=C2=A0 =C2=A0 sources: libsecret_gir_sources,<br>
++=C2=A0 =C2=A0 namespace: &#39;Secret&#39;,<br>
++=C2=A0 =C2=A0 nsversion: api_version_major,<br>
++=C2=A0 =C2=A0 export_packages: &#39;libsecret-@0@&#39;.format(api_versio=
n_major),<br>
++=C2=A0 =C2=A0 includes: [ &#39;GObject-2.0&#39;, &#39;Gio-2.0&#39; ],<br=
>
++=C2=A0 =C2=A0 header: &#39;libsecret/secret.h&#39;,<br>
++=C2=A0 =C2=A0 extra_args: [ &#39;-D SECRET_COMPILATION&#39;],<br>
++=C2=A0 =C2=A0 install: true,<br>
++=C2=A0 )<br>
++endif<br>
+ <br>
+ # Vapi<br>
+-if with_vapi<br>
++if with_vapi and with_gir<br>
+=C2=A0 =C2=A0libsecret_vapi =3D gnome.generate_vapi(&#39;libsecret-@0@&#3=
9;.format(api_version_major),<br>
+=C2=A0 =C2=A0 =C2=A0sources: libsecret_gir[0],<br>
+=C2=A0 =C2=A0 =C2=A0metadata_dirs: meson.source_root() / &#39;libsecret&#=
39;,<br>
+diff --git a/meson.build b/meson.build<br>
+index a26d046..d22e008 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -22,6 +22,7 @@ with_gcrypt =3D get_option(&#39;gcrypt&#39;)<br>
+ enable_debug =3D get_option(&#39;debugging&#39;)<br>
+ with_vapi =3D get_option(&#39;vapi&#39;)<br>
+ with_gtkdoc =3D get_option(&#39;gtk_doc&#39;)<br>
++with_gir =3D get_option(&#39;introspection&#39;)<br>
+ <br>
+ # Some variables<br>
+ config_h_dir =3D include_directories(&#39;.&#39;)<br>
+diff --git a/meson_options.txt b/meson_options.txt<br>
+index c1fda5d..445aeb0 100644<br>
+--- a/meson_options.txt<br>
++++ b/meson_options.txt<br>
+@@ -3,3 +3,4 @@ option(&#39;gcrypt&#39;, type: &#39;boolean&#39;, value: =
true, description: &#39;With gcrypt and tra<br>
+ option(&#39;debugging&#39;, type: &#39;boolean&#39;, value: false, descr=
iption: &#39;Turn debugging on/off&#39;)<br>
+ option(&#39;vapi&#39;, type: &#39;boolean&#39;, value: true, description=
: &#39;Create VAPI file.&#39;)<br>
+ option(&#39;gtk_doc&#39;, type: &#39;boolean&#39;, value: true, descript=
ion: &#39;Build reference documentation using gtk-doc&#39;)<br>
++option(&#39;introspection&#39;, type: &#39;boolean&#39;, value: true, de=
scription: &#39;Create GIR file.&#39;)<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20=
.3.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.3.bb</a> b/meta/=
recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.3.bb" rel=3D"noref=
errer" target=3D"_blank">libsecret_0.20.3.bb</a><br>
index 8d317c8efc..9830c80448 100644<br>
--- a/meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.3.bb</a><br>
+++ b/meta/recipes-gnome/libsecret/<a href=3D"http://libsecret_0.20.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libsecret_0.20.3.bb</a><br>
@@ -13,6 +13,8 @@ inherit gnomebase gtk-doc vala gobject-introspection man=
pages features_check<br>
<br>
=C2=A0DEPENDS +=3D &quot;glib-2.0 libgcrypt gettext-native&quot;<br>
<br>
+SRC_URI +=3D &quot;file://0001-meson-add-option-introspection.patch&quot;=
<br>
+<br>
=C2=A0SRC_URI[archive.md5sum] =3D &quot;47c3fdfeb111a87b509ad271e4a6f496&q=
uot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;4fcb3c56f8ac4ab9c75b66901fb0104=
ec7f22aa9a012315a14c0d6dffa5290e4&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--0000000000002d4a5e05a625adca--
