Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5259178461
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 08:09:08 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f3so6717946wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 00:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nRhGMD5yHBJxBlOeVEArX/9IxYKbIRTVGTkAcdawzuY=;
	b=Bolon/+yniTu8wL1H+j+Ip6ZtQQu+DuUTjYMC74eoVgYOei5i36RloXG6VPQ4+dyaG
	Nr79EXtBZRkeF3Lg2IlpU+YKraG2JXGzvF3lpcfEDfuUhRpZodLyQmHqVbk9gGDQxh0x
	HmNFqM8Xr5wo3ovK6RdXArvvJKSZC2vKhRd+EcQ/yq98rFY9YNtofCF57Zk6smYlSyhv
	lKxofRIApKShajRpcweUuBEuOZ0+ZSCbOubWk0qEtnPzUNZgg6dx7nSE55re1lq/56Ut
	73MYux6Pvcbz9O3qu477Yfg30i2Ubzl0xopJgSOtyYi+525aU8yz0obiVC27lwZXE2a8
	GoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nRhGMD5yHBJxBlOeVEArX/9IxYKbIRTVGTkAcdawzuY=;
	b=eHVQz9BbIw+m7dnzWffCXqSrM20wwjViKaELMvFMRGlOdvZDSmIbjaGrTE5tcz2h75
	h17OR2fNjoXpOs0rn+t1MIr3RcF5gb73tFfc9BLmM0BxJvHE5F/JtZAXThmGFdKTnROW
	C16E1Pn+F4x61suHx/Apuav3qSEKzZ5FFxO3Rur3DC9dsllQxOrJiT99arvLWWrIRwH+
	Sr7aMScM0ITacKx533Jek198nt4qheuhztdcXSpw9iiRelVXi8i69Dz4KmNOnk2jxFNS
	Ql5v+l8lo1DfCMHZ9vEFwxfrNsbbK4RdETs6SZpfj+Y5K0OAOtc/NlBPPcurOvRnM1/N
	NMrA==
X-Gm-Message-State: AKwxytcl9ZXcv8Xg1ldTVWwO4/EMkBc+sPCJGP8VoWtuDW2Xyv4eNmdS
	7+jfppXWMk8Rgzzf7jzniWhELey48ycXUJb9atw=
X-Google-Smtp-Source: AH8x224hJ+o7vfMclMG2ce1P5AKG9oEHDemduQtw3F+Or2qkj/m0izp15afOJs1qTfBmZ90rQew13SUX9xt0+AgvZcE=
X-Received: by 10.28.13.18 with SMTP id 18mr3829351wmn.112.1516781349944; Wed,
	24 Jan 2018 00:09:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 24 Jan 2018 00:09:09 -0800 (PST)
In-Reply-To: <20180122142119.39020-1-alexander.kanavin@linux.intel.com>
References: <20180122142119.39020-1-alexander.kanavin@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Jan 2018 09:09:09 +0100
Message-ID: <CA+chaQd27ROgqCm7iMZidAx6PTyHWBnSDHH5jSKvu=C0v8_e-g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-glib: fix meson flags for introspection and documentation
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
X-List-Received-Date: Wed, 24 Jan 2018 08:09:09 -0000
Content-Type: multipart/alternative; boundary="001a1144361490c1c90563812d0e"

--001a1144361490c1c90563812d0e
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks

On Mon, Jan 22, 2018 at 3:21 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Upstream has renamed them all, and folded manpages building
> into the overall 'docs' option.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-gnome/json-glib/json-glib_1.4.2.bb | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> index fad0a2df36d..dd67a8907bd 100644
> --- a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> +++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> @@ -14,21 +14,20 @@ SRC_URI[archive.md5sum] = "
> 35107e23a7bbbc70f31c34f7b9adf1c3"
>  SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e0
> 81915bdc73f5be5045882ed120bb686dc8"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase lib_package gobject-introspection gtk-doc manpages
> gettext
> +inherit gnomebase lib_package gobject-introspection gtk-doc gettext
>
> -GTKDOC_ENABLE_FLAG = "-Denable-gtk-doc=true"
> -GTKDOC_DISABLE_FLAG = "-Denable-gtk-doc=false"
> +# This builds both API docs (via gtk-doc) and manpages
> +GTKDOC_ENABLE_FLAG = "-Ddocs=true"
> +GTKDOC_DISABLE_FLAG = "-Ddocs=false"
>
> -GI_ENABLE_FLAG = "-Ddisable_introspection=false"
> -GI_DISABLE_FLAG = "-Ddisable_introspection=true"
> +GI_ENABLE_FLAG = "-Dintrospection=true"
> +GI_DISABLE_FLAG = "-Dintrospection=false"
>
>  EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED',
> 'True', '${GTKDOC_ENABLE_FLAG}', \
>
>            '${GTKDOC_DISABLE_FLAG}', d)} "
>  EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED',
> 'True', '${GI_ENABLE_FLAG}', \
>
>            '${GI_DISABLE_FLAG}', d)} "
>
> -PACKAGECONFIG[manpages] = "-Denable-man=true, -Denable-man=false,
> libxslt-native xmlto-native"
> -
>  do_install_append() {
>      # FIXME: these need to be provided via ptest
>      rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144361490c1c90563812d0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by:=C2=A0Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<div><br></div><div>Thanks</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, =
Jan 22, 2018 at 3:21 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Upstream has renamed them all, and folded manpages building<br>
into the overall &#39;docs&#39; option.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/json-glib/<a href=3D"http://json-glib_1.4.2.bb" re=
l=3D"noreferrer" target=3D"_blank">j<wbr>son-glib_1.4.2.bb</a> | 13 ++++++-=
------<br>
=C2=A01 file changed, 6 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_=
1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a> b/met=
a/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_1.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a><br>
index fad0a2df36d..dd67a8907bd 100644<br>
--- a/meta/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_1.4.2.b=
b" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a><br>
+++ b/meta/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_1.4.2.b=
b" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a><br>
@@ -14,21 +14,20 @@ SRC_URI[archive.md5sum] =3D &quot;<wbr>35107e23a7bbbc70=
f31c34f7b9adf1<wbr>c3&quot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;<wbr>2d7709a44749c7318599a682932=
2e0<wbr>81915bdc73f5be5045882ed120bb68<wbr>6dc8&quot;<br>
<br>
=C2=A0GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
-inherit gnomebase lib_package gobject-introspection gtk-doc manpages gette=
xt<br>
+inherit gnomebase lib_package gobject-introspection gtk-doc gettext<br>
<br>
-GTKDOC_ENABLE_FLAG =3D &quot;-Denable-gtk-doc=3Dtrue&quot;<br>
-GTKDOC_DISABLE_FLAG =3D &quot;-Denable-gtk-doc=3Dfalse&quot;<br>
+# This builds both API docs (via gtk-doc) and manpages<br>
+GTKDOC_ENABLE_FLAG =3D &quot;-Ddocs=3Dtrue&quot;<br>
+GTKDOC_DISABLE_FLAG =3D &quot;-Ddocs=3Dfalse&quot;<br>
<br>
-GI_ENABLE_FLAG =3D &quot;-Ddisable_introspection=3D<wbr>false&quot;<br>
-GI_DISABLE_FLAG =3D &quot;-Ddisable_introspection=3Dtrue&quot;<br>
+GI_ENABLE_FLAG =3D &quot;-Dintrospection=3Dtrue&quot;<br>
+GI_DISABLE_FLAG =3D &quot;-Dintrospection=3Dfalse&quot;<br>
<br>
=C2=A0EXTRA_OEMESON_append_class-<wbr>target =3D &quot; ${@bb.utils.contain=
s(&#39;GTKDOC_<wbr>ENABLED&#39;, &#39;True&#39;, &#39;${GTKDOC_ENABLE_FLAG}=
&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;${GTKDOC_DISABLE_FLAG}&#39;, d)} &quot;<br>
=C2=A0EXTRA_OEMESON_append_class-<wbr>target =3D &quot; ${@bb.utils.contain=
s(&#39;GI_DATA_<wbr>ENABLED&#39;, &#39;True&#39;, &#39;${GI_ENABLE_FLAG}&#3=
9;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;${GI_DISABLE_FLAG}&#39;, d)} &quot;<br>
<br>
-PACKAGECONFIG[manpages] =3D &quot;-Denable-man=3Dtrue, -Denable-man=3Dfals=
e, libxslt-native xmlto-native&quot;<br>
-<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0# FIXME: these need to be provided via ptest<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1144361490c1c90563812d0e--
