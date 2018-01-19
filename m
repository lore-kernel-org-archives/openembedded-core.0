Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9D36078787;
	Fri, 19 Jan 2018 13:58:47 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g1so3576483wmg.2;
	Fri, 19 Jan 2018 05:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JUDWMnOzo4kp54+6B5LGQ43wwIF8czZ2t4NtsVsmr6A=;
	b=oKtxrBRfleRMQ0WaKANHj8MmWWy1syUg+VHtvUD1KYgXvfCh0mbnUhAeIgiiKW3+hx
	Pk15cZnJkZqpEb7aoPmm2TI8UMoc8NXKE4kZoSy2t589f3Z+LvlYR7YcEViC0qFIzOTo
	Ba2Timryy4ob2n3DslhIpPTT38wDBPTVm9hqjEPQER2PKa2ikEncyshSqZYqkQO6cNaf
	Ze4qN4g0eWl9qghKdeI0bAZpKWDrw4t9rhE8huOa6RWGDDFwBFLWGKOxMKbPoWxcF93Z
	tTGnYznYGVu0ZKjj4wIKvE6GTJXo9EwRq4ap2pn3gMLz9eJCbOz5ojtEkDLYSFod7AYH
	R2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JUDWMnOzo4kp54+6B5LGQ43wwIF8czZ2t4NtsVsmr6A=;
	b=HX/Rq93X0xnXsu/J4gHSac6VyAULT5l3Yh1wah1uquqIt+EMP8kkg+AySw2/8f+vGe
	HBB3gDMtc7RHBXvV44Mfk7Y21HcTTNmBsmV7BLqQ3qlZ0v4jk0S9KEJUNYp9R/2lDQRr
	TTsM7vWwoLyFPAhnCyimJZS1KduLQC1std1zc+SaNehCcqEgV8M+C3Y6TrOfgQvMzVd/
	757VaMeseJ2U7ISUqC2eRrkP2KBCN04NNSgaKuwJ5oCDoD/glJLpMhITSD4f6t6IcLOJ
	XoV9dH6qH+wY4/5SxU7QDhabBE9c2MvjjyJiWw4C4RH+THI+tL3FvxarRxoZ/XzWzIpH
	x/xg==
X-Gm-Message-State: AKwxytcTkn2mBnhkJXtuda6Do4drk56H7bjoe7HeWDwQFQDdmHPMaVpz
	dGLIdrxautL/VMmK5jfgKNgTgud0rxCdv/0SZlI=
X-Google-Smtp-Source: ACJfBosMPx7/uE20Ivt9wn133oKHaFOlR2SmdeLEbaQDOJnORd7a6J4yECbfMhMLnadZHUafdZBqkwYubsdALz+NiHM=
X-Received: by 10.28.22.200 with SMTP id 191mr8426670wmw.117.1516370328396;
	Fri, 19 Jan 2018 05:58:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 19 Jan 2018 05:58:47 -0800 (PST)
In-Reply-To: <20180118125101.2F92F235ED3@git.openembedded.org>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Jan 2018 14:58:47 +0100
Message-ID: <CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Fri, 19 Jan 2018 13:58:48 -0000
Content-Type: multipart/alternative; boundary="001a1146d90ac5aa130563217a9b"

--001a1146d90ac5aa130563217a9b
Content-Type: text/plain; charset="UTF-8"

It fails here since this upgrade, maybe the 0001-Do-not-disable-
gobject-introspection-when-cross-comp.patch is still useful and wasn't
completely merged upstream?

FAILED: json-glib/Json-1.0.typelib
json-glib/1.4.2-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper
json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use
--includedir
error parsing file json-glib/Json-1.0.gir: Failed to parse included gir
GObject-2.0
If the above error message is about missing .so libraries, then setting up
GIR_EXTRA_LIBS_PATH in the recipe should help.
(typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

On Thu, Jan 18, 2018 at 1:51 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 6b87ad5b08004554f08d2f68027908956f3795e1
> Author: Yi Zhao <yi.zhao@windriver.com>
> AuthorDate: Tue Jan 16 08:32:33 2018 +0800
>
>     json-glib: update to 1.4.2
>
>     Drop 0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>     since it has been fixed upstream.
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...ble-gobject-introspection-when-cross-comp.patch | 32
> ----------------------
>  .../{json-glib_1.2.8.bb => json-glib_1.4.2.bb}     |  7 ++---
>  2 files changed, 2 insertions(+), 37 deletions(-)
>
> diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-
> disable-gobject-introspection-when-cross-comp.patch
> b/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-
> disable-gobject-introspection-when-cross-comp.patch
> deleted file mode 100644
> index 849bb9d..0000000
> --- a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-
> disable-gobject-introspection-when-cross-comp.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 293452c963188666dae99521294f09a0cf9582e2 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 4 Aug 2017 16:01:11 +0300
> -Subject: [PATCH] Do not disable gobject introspection when
> cross-compiling.
> -
> -Introspection does work fine for instance in Open Embedded,
> -one of the most prominent cross-compilation frameworks
> -(through qemu emulating target hardware), so let the user
> -decide if he wants the feature or not.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 43cbfd9..8a32f26 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -147,7 +147,7 @@ root_dir = include_directories('.')
> -
> - gnome = import('gnome')
> - gir = find_program('g-ir-scanner', required: false)
> --build_gir = gir.found() and not meson.is_cross_build() and not
> get_option('disable_introspection')
> -+build_gir = gir.found() and not get_option('disable_introspection')
> -
> - subdir('json-glib')
> -
> ---
> -2.13.2
> -
> diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
> b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> similarity index 84%
> rename from meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
> rename to meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> index 31912d1..fad0a2d 100644
> --- a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
> +++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
> @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 7fbc338309ac38fefcd64b04bb903e34"
>
>  DEPENDS = "glib-2.0"
>
> -SRC_URI_append = " \
> -           file://0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
> \
> -           "
> -SRC_URI[archive.md5sum] = "ff31e7d0594df44318e12facda3d086e"
> -SRC_URI[archive.sha256sum] = "fd55a9037d39e7a10f0db64309f5f0
> 265fa32ec962bf85066087b83a2807f40a"
> +SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
> +SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e0
> 81915bdc73f5be5045882ed120bb686dc8"
>
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase lib_package gobject-introspection gtk-doc manpages
> gettext
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--001a1146d90ac5aa130563217a9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It fails here since this upgrade, maybe the=C2=A0<spa=
n style=3D"font-size:12.8px">0001-Do-not-disable-</span><wbr style=3D"font-=
size:12.8px"><span style=3D"font-size:12.8px">gobject-introspection-when-</=
span><wbr style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">cross=
-comp.patch is still useful and wasn&#39;t completely merged upstream?</spa=
n></div><div><span style=3D"font-size:12.8px"><br></span></div><div>FAILED:=
 json-glib/Json-1.0.typelib=C2=A0</div><div>json-glib/1.4.2-r0/recipe-sysro=
ot/usr/bin/g-ir-compiler-wrapper json-glib/Json-1.0.gir --output json-glib/=
Json-1.0.typelib</div><div>Could not find GIR file &#39;GObject-2.0.gir&#39=
;; check XDG_DATA_DIRS or use --includedir</div><div>error parsing file jso=
n-glib/Json-1.0.gir: Failed to parse included gir GObject-2.0</div><div>If =
the above error message is about missing .so libraries, then setting up GIR=
_EXTRA_LIBS_PATH in the recipe should help.</div><div>(typically like this:=
 GIR_EXTRA_LIBS_PATH=3D&quot;${B}/something/.libs&quot; )</div><div>ninja: =
build stopped: subcommand failed.</div><div>WARNING: exit code 1 from a she=
ll command.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Thu, Jan 18, 2018 at 1:51 PM,  <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:git@git.openembedded.org" target=3D"_blank">git@git.openembedded.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is an automated=
 email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 6b87ad5b08004554f08d2f68027908<wbr>956f3795e1<br>
Author: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windri=
ver.com</a>&gt;<br>
AuthorDate: Tue Jan 16 08:32:33 2018 +0800<br>
<br>
=C2=A0 =C2=A0 json-glib: update to 1.4.2<br>
<br>
=C2=A0 =C2=A0 Drop 0001-Do-not-disable-gobject-<wbr>introspection-when-cros=
s-comp.<wbr>patch<br>
=C2=A0 =C2=A0 since it has been fixed upstream.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windrive=
r.com">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0...ble-gobject-introspection-<wbr>when-cross-comp.patch | 32 --------=
--------------<br>
=C2=A0.../{<a href=3D"http://json-glib_1.2.8.bb" rel=3D"noreferrer" target=
=3D"_blank">json-glib_1.2.8.bb</a> =3D&gt; <a href=3D"http://json-glib_1.4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a>}=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 ++---<br>
=C2=A02 files changed, 2 insertions(+), 37 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/json-<wbr>glib/json-glib/0001-Do-not-<wbr>d=
isable-gobject-introspection-<wbr>when-cross-comp.patch b/meta/recipes-gnom=
e/json-<wbr>glib/json-glib/0001-Do-not-<wbr>disable-gobject-introspection-<=
wbr>when-cross-comp.patch<br>
deleted file mode 100644<br>
index 849bb9d..0000000<br>
--- a/meta/recipes-gnome/json-<wbr>glib/json-glib/0001-Do-not-<wbr>disable-=
gobject-introspection-<wbr>when-cross-comp.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 293452c963188666dae99521294f09<wbr>a0cf9582e2 Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 4 Aug 2017 16:01:11 +0300<br>
-Subject: [PATCH] Do not disable gobject introspection when cross-compiling=
.<br>
-<br>
-Introspection does work fine for instance in Open Embedded,<br>
-one of the most prominent cross-compilation frameworks<br>
-(through qemu emulating target hardware), so let the user<br>
-decide if he wants the feature or not.<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- meson.build | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/meson.build b/meson.build<br>
-index 43cbfd9..8a32f26 100644<br>
---- a/meson.build<br>
-+++ b/meson.build<br>
-@@ -147,7 +147,7 @@ root_dir =3D include_directories(&#39;.&#39;)<br>
-<br>
- gnome =3D import(&#39;gnome&#39;)<br>
- gir =3D find_program(&#39;g-ir-scanner&#39;, required: false)<br>
--build_gir =3D gir.found() and not meson.is_cross_build() and not get_opti=
on(&#39;disable_<wbr>introspection&#39;)<br>
-+build_gir =3D gir.found() and not get_option(&#39;disable_<wbr>introspect=
ion&#39;)<br>
-<br>
- subdir(&#39;json-glib&#39;)<br>
-<br>
---<br>
-2.13.2<br>
-<br>
diff --git a/meta/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_=
1.2.8.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.2.8.bb</a> b/met=
a/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_1.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-gnome/json-glib/<a href=3D"http://json-glib_1.2.8.=
bb" rel=3D"noreferrer" target=3D"_blank">j<wbr>son-glib_1.2.8.bb</a><br>
rename to meta/recipes-gnome/json-glib/<a href=3D"http://json-glib_1.4.2.bb=
" rel=3D"noreferrer" target=3D"_blank">j<wbr>son-glib_1.4.2.bb</a><br>
index 31912d1..fad0a2d 100644<br>
--- a/meta/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_1.2.8.b=
b" rel=3D"noreferrer" target=3D"_blank">json-glib_1.2.8.bb</a><br>
+++ b/meta/recipes-gnome/json-<wbr>glib/<a href=3D"http://json-glib_1.4.2.b=
b" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a><br>
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>7fb=
c338309ac38fefcd64b04bb903e<wbr>34&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
<br>
-SRC_URI_append =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-disable-<wbr>g=
object-introspection-when-<wbr>cross-comp.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[archive.md5sum] =3D &quot;<wbr>ff31e7d0594df44318e12facda3d08<wbr>=
6e&quot;<br>
-SRC_URI[archive.sha256sum] =3D &quot;<wbr>fd55a9037d39e7a10f0db64309f5f0<w=
br>265fa32ec962bf85066087b83a2807<wbr>f40a&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;<wbr>35107e23a7bbbc70f31c34f7b9adf1<wbr>=
c3&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;<wbr>2d7709a44749c7318599a6829322e0<w=
br>81915bdc73f5be5045882ed120bb68<wbr>6dc8&quot;<br>
<br>
=C2=A0GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
=C2=A0inherit gnomebase lib_package gobject-introspection gtk-doc manpages =
gettext<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--001a1146d90ac5aa130563217a9b--
