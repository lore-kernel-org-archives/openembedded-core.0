Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 65F7C7F9C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:26:52 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r18so3099967eds.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 16:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yp2p7gF/yWMdTWlwb4+bR15qN/5hfwrTHCQQBGpRN00=;
	b=d1y7zCZUR5MAwynyGHiUGtErW+c0Rcf6pvyPJ/6X2XrcKYU/awlbogE3RBz9Y+WGu4
	vq3ocuvEbG8YCTBDWaSi3PPmsvIQJhq3mM6hwLEG+0xi9PzWMmn2oTGFlZnDESxfdDFg
	x3pea7sMpJDFIA2UTkIyRRJ8D3UVdULYfrEhn+3Be5c4zbnHODakp6OeCc6LA+yXB9W3
	AX8t62aD8SIwOt0mxcL5dKqsd4WltxkiIv2efZjRbfBjweh0agPFf5GC7NI4PrXVypJj
	SXjE6EpEOWcDWUKhxgvLhUmCcWtj87mM12tSlXPsIaBeGJQv+Hif98DzwtN0ItA/CVEf
	Ofgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yp2p7gF/yWMdTWlwb4+bR15qN/5hfwrTHCQQBGpRN00=;
	b=jSulHixYuk2wIPJIY7EORrHQFEMUoj+DNdigsHH+QoNuEGnY0vBoVu5Skgm5JvYt6j
	ezBT2sB75Y3yYmAe7GQQL8Qh4Xm7M8F2TxjBdphqNgmUV6KHUtn7pygte/eOvt6MEXx8
	N50XEiI+u5W14LLdlBJ25frlDYd4Q1yPmTFxzMagwxASim9Jd79xR7bxgp2E6Dl8iTwy
	CoGGdh3OkIdbww6KmMCDBQneA7HneyG07lxBDz562z7wAomPPxrZj52b5loaBdlAgcQM
	OsL8gyffJ9jDbasQKzTrKPAjRK2bg+9Yo0OIieEUFNeWIFYEXO0/0Jy2YY33iM9fas6W
	DDMg==
X-Gm-Message-State: APjAAAWyhh5uqzkE9Cqd/9VAFZ6VwtYSfc9srr7OVk4yXPlKTEx6y+8P
	y/Qu1xUKoSvKnJR3mDtM08cCXn/FB+by0Y0nl4Jmje5u
X-Google-Smtp-Source: APXvYqxdoKNCtHtK5a9Q835yRd7sTmdAndMRwQMaXYloYe09oHTUZGbLp43N5Xomxm4GJTTHVanmGVs4zQ5OoRLSMjE=
X-Received: by 2002:a17:906:66d2:: with SMTP id
	k18mr6112197ejp.100.1572046012975; 
	Fri, 25 Oct 2019 16:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191011201951.24617-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20191011201951.24617-1-fabio.berton@ossystems.com.br>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 26 Oct 2019 01:26:41 +0200
Message-ID: <CA+chaQfH5djxsVmNvSi3X+oNbDXwbq0+0V3YSU3EGZBVmfWWBw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.6 -> 19.2.1
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
X-List-Received-Date: Fri, 25 Oct 2019 23:26:52 -0000
Content-Type: multipart/alternative; boundary="0000000000002c8dc90595c47c92"

--0000000000002c8dc90595c47c92
Content-Type: text/plain; charset="UTF-8"

It's not part of this mesa upgrade, but as you're maintaining it and I'll
possibly forget to mention it next time (or if someone is using newest mesa
for whatever reason like pinephone does now)...

In latest mesa MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb

which will require do_install_append update in mesa recipe, libepoxy
upgrade or patch and possibly few other fixes like I just did for pinephone
here:
https://github.com/webOS-ports/meta-pine64-luneos/commit/a65667ab8356455557869c2e24cd6ad6a6cec61f

Regards,

On Fri, Oct 11, 2019 at 10:20 PM Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

>   - Update patches with devtool finish --force-patch-refresh
>
>   - Update license checksum due to commit d5e273aad2
>     docs: remove pointless line-break
>
>   This upgrade include the following changes:
>
>     - Mesa 19.2.1 This is a bug fix release.
>       Full log: https://mesa3d.org/relnotes/19.2.1.html
>
>     - Mesa 19.2.0 This is a new development release.
>       Full log: https://mesa3d.org/relnotes/19.2.0.html
>
>     - Mesa 19.1.7 is released.
>       Full log: https://mesa3d.org/relnotes/19.1.7.html
>
>     - Mesa 19.1.6 is released. This is a bug-fix release.
>       Full log: https://mesa3d.org/relnotes/19.1.6.html
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  ...k-for-all-linux-host_os-combinations.patch |  9 ++++----
>  ...on.build-make-TLS-GLX-optional-again.patch | 22 +++++++++----------
>  ...Allow-enable-DRI-without-DRI-drivers.patch |  9 ++++----
>  .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  2 +-
>  .../mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb}   |  4 ++--
>  6 files changed, 24 insertions(+), 22 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb}
> (85%)
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> index 9fba5da4b2..461fc83345 100644
> ---
> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> +++
> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> @@ -1,4 +1,4 @@
> -From ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00 2001
> +From 7ed5b340f4077e616287b6124dfd46cf6a2cab50 Mon Sep 17 00:00:00 2001
>  From: Fabio Berton <fabio.berton@ossystems.com.br>
>  Date: Wed, 12 Jun 2019 13:40:20 -0300
>  Subject: [PATCH] meson.build: check for all linux host_os combinations
> @@ -14,15 +14,16 @@ Upstream-Status: Pending
>  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
>   meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index 567a81afd6f..b33b430aed4 100644
> +index db94f85..6f7b0ed 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -107,7 +107,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
> +@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
>   # Only build shared_glapi if at least one OpenGL API is enabled
>   with_shared_glapi = get_option('shared-glapi') and with_any_opengl
>
> @@ -31,7 +32,7 @@ index 567a81afd6f..b33b430aed4 100644
>
>   dri_drivers = get_option('dri-drivers')
>   if dri_drivers.contains('auto')
> -@@ -845,7 +845,7 @@ if cc.compiles('int foo(void)
> __attribute__((__noreturn__));',
> +@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
>   endif
>
>   # TODO: this is very incomplete
> diff --git
> a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> index 641bacf1d9..dc232285f0 100644
> ---
> a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> +++
> b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> @@ -1,4 +1,4 @@
> -From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
> +From 78efbf1e2e733097d22ae7c558b8acf866104bec Mon Sep 17 00:00:00 2001
>  From: Fabio Berton <fabio.berton@ossystems.com.br>
>  Date: Wed, 12 Jun 2019 14:15:57 -0300
>  Subject: [PATCH] meson.build: make TLS GLX optional again
> @@ -12,31 +12,32 @@ Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
> - meson.build       | 4 +++-
> - meson_options.txt | 7 +++++++
> - 2 files changed, 10 insertions(+), 1 deletion(-)
> + meson.build       | 4 ++++
> + meson_options.txt | 6 ++++++
> + 2 files changed, 10 insertions(+)
>
>  diff --git a/meson.build b/meson.build
> -index b33b430aed4..0e50bb26c0a 100644
> +index 6f7b0ed..d961748 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or
> with_platform_surfaceless or with_plat
> -   endif
> +@@ -382,6 +382,10 @@ if not with_platform_android or
> get_option('platform-sdk-version') >= 29
> +   pre_args += '-DUSE_ELF_TLS'
>   endif
>
> --pre_args += '-DGLX_USE_TLS'
>  +if get_option('glx-tls')
>  +  pre_args += '-DGLX_USE_TLS'
>  +endif
> ++
>   if with_glx != 'disabled'
>     if not (with_platform_x11 and with_any_opengl)
>       error('Cannot build GLX support without X11 platform support and at
> least one OpenGL API')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 1f72faabee8..fcd49efea27 100644
> +index b768c15..d8a2d49 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -339,6 +339,13 @@ option(
> +@@ -333,6 +333,12 @@ option(
>     value : true,
>     description : 'Enable direct rendering in GLX and EGL for DRI',
>   )
> @@ -46,7 +47,6 @@ index 1f72faabee8..fcd49efea27 100644
>  +  value : true,
>  +  description : 'Enable TLS support in GLX',
>  +)
> -+
>   option(
>     'I-love-half-baked-turnips',
>     type : 'boolean',
> diff --git
> a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> index 3458c19199..5e66e09194 100644
> ---
> a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> +++
> b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> @@ -1,4 +1,4 @@
> -From f1482e88c2295b9c7288f5b273335a8e18039de8 Mon Sep 17 00:00:00 2001
> +From 8e0fe4f54d68ff962665f6d59ce5cc96520d9e7d Mon Sep 17 00:00:00 2001
>  From: Fabio Berton <fabio.berton@ossystems.com.br>
>  Date: Wed, 12 Jun 2019 14:18:31 -0300
>  Subject: [PATCH] Allow enable DRI without DRI drivers
> @@ -9,16 +9,17 @@ Upstream-Status: Pending
>  Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
>  ---
>   meson.build       | 2 +-
>   meson_options.txt | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
>  diff --git a/meson.build b/meson.build
> -index 0e50bb26c0a..de065c290d6 100644
> +index d961748..4e586e9 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -137,7 +137,7 @@ with_dri_r200 = dri_drivers.contains('r200')
> +@@ -147,7 +147,7 @@ with_dri_r200 = dri_drivers.contains('r200')
>   with_dri_nouveau = dri_drivers.contains('nouveau')
>   with_dri_swrast = dri_drivers.contains('swrast')
>
> @@ -28,7 +29,7 @@ index 0e50bb26c0a..de065c290d6 100644
>   gallium_drivers = get_option('gallium-drivers')
>   if gallium_drivers.contains('auto')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index fcd49efea27..0529200b3bb 100644
> +index d8a2d49..3fe980e 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -34,6 +34,12 @@ option(
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> b/meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 9e5808ee27..7809170f46 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM =
> "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
> +LIC_FILES_CHKSUM =
> "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
>
>  PE = "2"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
> similarity index 85%
> rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa_19.2.1.bb
> index 19221e9e25..ca66065251 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
> @@ -6,8 +6,8 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
>             "
>
> -SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
> -SRC_URI[sha256sum] =
> "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
> +SRC_URI[md5sum] = "8f9c05cfbf7b357c60a5345bb87a92c7"
> +SRC_URI[sha256sum] =
> "4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
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

--0000000000002c8dc90595c47c92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s not part of this mesa upgrade, but as you&#39;re =
maintaining it and I&#39;ll possibly forget to mention it next time (or if =
someone is using newest mesa for whatever reason like pinephone does now)..=
.<div><br></div><div>In latest mesa MESA_EGL_NO_X11_HEADERS was renamed to =
EGL_NO_X11 in:</div><div><a href=3D"https://github.com/mesa3d/mesa/commit/6=
202a13b71e18dc31ba7e2f4ea915b67eacc1ddb">https://github.com/mesa3d/mesa/com=
mit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb</a></div><div><br></div><div>w=
hich will require do_install_append update in mesa recipe, libepoxy upgrade=
 or patch and possibly few other fixes like I just did for pinephone here:<=
/div><div><a href=3D"https://github.com/webOS-ports/meta-pine64-luneos/comm=
it/a65667ab8356455557869c2e24cd6ad6a6cec61f">https://github.com/webOS-ports=
/meta-pine64-luneos/commit/a65667ab8356455557869c2e24cd6ad6a6cec61f</a><br>=
</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 11, 2019 at 10:20 PM Fa=
bio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berto=
n@ossystems.com.br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">=C2=A0 - Update patches with devtool finish --force-patch=
-refresh<br>
<br>
=C2=A0 - Update license checksum due to commit d5e273aad2<br>
=C2=A0 =C2=A0 docs: remove pointless line-break<br>
<br>
=C2=A0 This upgrade include the following changes:<br>
<br>
=C2=A0 =C2=A0 - Mesa 19.2.1 This is a bug fix release.<br>
=C2=A0 =C2=A0 =C2=A0 Full log: <a href=3D"https://mesa3d.org/relnotes/19.2.=
1.html" rel=3D"noreferrer" target=3D"_blank">https://mesa3d.org/relnotes/19=
.2.1.html</a><br>
<br>
=C2=A0 =C2=A0 - Mesa 19.2.0 This is a new development release.<br>
=C2=A0 =C2=A0 =C2=A0 Full log: <a href=3D"https://mesa3d.org/relnotes/19.2.=
0.html" rel=3D"noreferrer" target=3D"_blank">https://mesa3d.org/relnotes/19=
.2.0.html</a><br>
<br>
=C2=A0 =C2=A0 - Mesa 19.1.7 is released.<br>
=C2=A0 =C2=A0 =C2=A0 Full log: <a href=3D"https://mesa3d.org/relnotes/19.1.=
7.html" rel=3D"noreferrer" target=3D"_blank">https://mesa3d.org/relnotes/19=
.1.7.html</a><br>
<br>
=C2=A0 =C2=A0 - Mesa 19.1.6 is released. This is a bug-fix release.<br>
=C2=A0 =C2=A0 =C2=A0 Full log: <a href=3D"https://mesa3d.org/relnotes/19.1.=
6.html" rel=3D"noreferrer" target=3D"_blank">https://mesa3d.org/relnotes/19=
.1.6.html</a><br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
---<br>
=C2=A0...k-for-all-linux-host_os-combinations.patch |=C2=A0 9 ++++----<br>
=C2=A0...on.build-make-TLS-GLX-optional-again.patch | 22 +++++++++---------=
-<br>
=C2=A0...Allow-enable-DRI-without-DRI-drivers.patch |=C2=A0 9 ++++----<br>
=C2=A0.../{<a href=3D"http://mesa-gl_19.1.6.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa-gl_19.1.6.bb</a> =3D&gt; <a href=3D"http://mesa-gl_19.2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.2.1.bb</a>}=C2=A0 |=C2=
=A0 0<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_19.1.6.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_19.1.6.bb</a> =3D&gt; <a href=3D"http://mesa_19.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_19.2.1.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
=C2=A06 files changed, 24 insertions(+), 22 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_19.1.6.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.1.6.bb</a> =3D&gt; <a hr=
ef=3D"http://mesa-gl_19.2.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-g=
l_19.2.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_19.1.6.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_19.1.6.bb</a> =3D&gt; <a href=3D"=
http://mesa_19.2.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_19.2.1.bb<=
/a>} (85%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-al=
l-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-=
meson.build-check-for-all-linux-host_os-combinations.patch<br>
index 9fba5da4b2..461fc83345 100644<br>
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux=
-host_os-combinations.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux=
-host_os-combinations.patch<br>
@@ -1,4 +1,4 @@<br>
-From ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00 2001<br>
+From 7ed5b340f4077e616287b6124dfd46cf6a2cab50 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.b=
r" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Date: Wed, 12 Jun 2019 13:40:20 -0300<br>
=C2=A0Subject: [PATCH] meson.build: check for all linux host_os combination=
s<br>
@@ -14,15 +14,16 @@ Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.co=
m" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
=C2=A0Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyst=
ems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 meson.build | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index 567a81afd6f..b33b430aed4 100644<br>
+index db94f85..6f7b0ed 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -107,7 +107,7 @@ with_any_opengl =3D with_opengl or with_gles1 or with_=
gles2<br>
+@@ -117,7 +117,7 @@ with_any_opengl =3D with_opengl or with_gles1 or with_=
gles2<br>
=C2=A0 # Only build shared_glapi if at least one OpenGL API is enabled<br>
=C2=A0 with_shared_glapi =3D get_option(&#39;shared-glapi&#39;) and with_an=
y_opengl<br>
<br>
@@ -31,7 +32,7 @@ index 567a81afd6f..b33b430aed4 100644<br>
<br>
=C2=A0 dri_drivers =3D get_option(&#39;dri-drivers&#39;)<br>
=C2=A0 if dri_drivers.contains(&#39;auto&#39;)<br>
-@@ -845,7 +845,7 @@ if cc.compiles(&#39;int foo(void) __attribute__((__nor=
eturn__));&#39;,<br>
+@@ -856,7 +856,7 @@ if cc.compiles(&#39;__uint128_t foo(void) { return 0; =
}&#39;,<br>
=C2=A0 endif<br>
<br>
=C2=A0 # TODO: this is very incomplete<br>
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX=
-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-m=
ake-TLS-GLX-optional-again.patch<br>
index 641bacf1d9..dc232285f0 100644<br>
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-option=
al-again.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-option=
al-again.patch<br>
@@ -1,4 +1,4 @@<br>
-From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001<br>
+From 78efbf1e2e733097d22ae7c558b8acf866104bec Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.b=
r" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Date: Wed, 12 Jun 2019 14:15:57 -0300<br>
=C2=A0Subject: [PATCH] meson.build: make TLS GLX optional again<br>
@@ -12,31 +12,32 @@ Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyst=
ems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
+<br>
=C2=A0---<br>
- meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +++-<br>
- meson_options.txt | 7 +++++++<br>
- 2 files changed, 10 insertions(+), 1 deletion(-)<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
+ meson_options.txt | 6 ++++++<br>
+ 2 files changed, 10 insertions(+)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index b33b430aed4..0e50bb26c0a 100644<br>
+index 6f7b0ed..d961748 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platfor=
m_surfaceless or with_plat<br>
-=C2=A0 =C2=A0endif<br>
+@@ -382,6 +382,10 @@ if not with_platform_android or get_option(&#39;platf=
orm-sdk-version&#39;) &gt;=3D 29<br>
+=C2=A0 =C2=A0pre_args +=3D &#39;-DUSE_ELF_TLS&#39;<br>
=C2=A0 endif<br>
<br>
--pre_args +=3D &#39;-DGLX_USE_TLS&#39;<br>
=C2=A0+if get_option(&#39;glx-tls&#39;)<br>
=C2=A0+=C2=A0 pre_args +=3D &#39;-DGLX_USE_TLS&#39;<br>
=C2=A0+endif<br>
++<br>
=C2=A0 if with_glx !=3D &#39;disabled&#39;<br>
=C2=A0 =C2=A0 if not (with_platform_x11 and with_any_opengl)<br>
=C2=A0 =C2=A0 =C2=A0 error(&#39;Cannot build GLX support without X11 platfo=
rm support and at least one OpenGL API&#39;)<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index 1f72faabee8..fcd49efea27 100644<br>
+index b768c15..d8a2d49 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
-@@ -339,6 +339,13 @@ option(<br>
+@@ -333,6 +333,12 @@ option(<br>
=C2=A0 =C2=A0 value : true,<br>
=C2=A0 =C2=A0 description : &#39;Enable direct rendering in GLX and EGL for=
 DRI&#39;,<br>
=C2=A0 )<br>
@@ -46,7 +47,6 @@ index 1f72faabee8..fcd49efea27 100644<br>
=C2=A0+=C2=A0 value : true,<br>
=C2=A0+=C2=A0 description : &#39;Enable TLS support in GLX&#39;,<br>
=C2=A0+)<br>
-+<br>
=C2=A0 option(<br>
=C2=A0 =C2=A0 &#39;I-love-half-baked-turnips&#39;,<br>
=C2=A0 =C2=A0 type : &#39;boolean&#39;,<br>
diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without=
-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI=
-without-DRI-drivers.patch<br>
index 3458c19199..5e66e09194 100644<br>
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-dr=
ivers.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-dr=
ivers.patch<br>
@@ -1,4 +1,4 @@<br>
-From f1482e88c2295b9c7288f5b273335a8e18039de8 Mon Sep 17 00:00:00 2001<br>
+From 8e0fe4f54d68ff962665f6d59ce5cc96520d9e7d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.b=
r" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Date: Wed, 12 Jun 2019 14:18:31 -0300<br>
=C2=A0Subject: [PATCH] Allow enable DRI without DRI drivers<br>
@@ -9,16 +9,17 @@ Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro=
" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
=C2=A0Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyst=
ems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 meson_options.txt | 6 ++++++<br>
=C2=A0 2 files changed, 7 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index 0e50bb26c0a..de065c290d6 100644<br>
+index d961748..4e586e9 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -137,7 +137,7 @@ with_dri_r200 =3D dri_drivers.contains(&#39;r200&#39;)=
<br>
+@@ -147,7 +147,7 @@ with_dri_r200 =3D dri_drivers.contains(&#39;r200&#39;)=
<br>
=C2=A0 with_dri_nouveau =3D dri_drivers.contains(&#39;nouveau&#39;)<br>
=C2=A0 with_dri_swrast =3D dri_drivers.contains(&#39;swrast&#39;)<br>
<br>
@@ -28,7 +29,7 @@ index 0e50bb26c0a..de065c290d6 100644<br>
=C2=A0 gallium_drivers =3D get_option(&#39;gallium-drivers&#39;)<br>
=C2=A0 if gallium_drivers.contains(&#39;auto&#39;)<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index fcd49efea27..0529200b3bb 100644<br>
+index d8a2d49..3fe980e 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
=C2=A0@@ -34,6 +34,12 @@ option(<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_19.1.6.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.1.6.bb</a> b/meta/recipes=
-graphics/mesa/<a href=3D"http://mesa-gl_19.2.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mesa-gl_19.2.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_19.1.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.1.6.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_19.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa-gl_19.2.1.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 9e5808ee27..7809170f46 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -10,7 +10,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://mesa3d.org" rel=3D"n=
oreferrer" target=3D"_blank">http://mesa3d.org</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.org" rel=3D"=
noreferrer" target=3D"_blank">https://bugs.freedesktop.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://docs/license.html;md5=3D725f991a1cc322aa=
7a0cd3a2016621c4&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://docs/license.html;md5=3D3a4999caf82cc503=
ac8b9e37c235782e&quot;<br>
<br>
=C2=A0PE =3D &quot;2&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.1.6.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_19.1.6.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_19.2.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_19.2.1.bb</a><br>
similarity index 85%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.1.6.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_19.1.6.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_19.2.1.bb</a><br>
index 19221e9e25..ca66065251 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.1.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_19.1.6.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_19.2.1.bb</a><br>
@@ -6,8 +6,8 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org/a=
rchive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://=
mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Allow-enable-DRI-with=
out-DRI-drivers.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;7dbb40b8d10e89bee0a5bfc85350647b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2a369b7b48545c6486e7e44913ad022daca097c8bd937=
bf30dcf3f17a94d3496&quot;<br>
+SRC_URI[md5sum] =3D &quot;8f9c05cfbf7b357c60a5345bb87a92c7&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e=
28bb350cd29199f01e9&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\d+)+)=
&quot;<br>
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

--0000000000002c8dc90595c47c92--
