Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.13386.1616421620456167938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lwbt6CS/;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id z68so7498926vsb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiUu5L/Tjp5k9etCzrGAE2luP3o6tnDw4lSupYQjN5g=;
        b=Lwbt6CS/vXH7vQL2WCB6arpA+3Mr3zW7oiH5VusYG+InUm6w+t9e8yD0jDR59w+gnL
         x810wAL3KCTvc/OwGP8fwpqVrrpduixjZM9QJsFfCFT4/Y2fxZsnXAdh1mQeNqo2KDeF
         0GAb/Yw+oDVFrfFLyxsU8ThM3F1VJMuz3gxRy5lgzQoguOep6R0C5JoZDEeZ7I7YMUbO
         yMZHUB8ULfDyLKZDWKVK4XsZrO2kD2ba4AnGu7md3WAWaytAAZ0j8d3/nHv9CIPPL18P
         8nOC9v7h/JQre3YEVME+WBXQa8OU1L2+MLBQLxpwsOgqAafd8hP5Br7+hZBzWupYsObH
         08iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiUu5L/Tjp5k9etCzrGAE2luP3o6tnDw4lSupYQjN5g=;
        b=rQPlHS6genjwDmZhvinVdtRDJAheXAJlnxir7hdqYn71q5R0tFn9tVa7OGFi/JiTrh
         rd5ufQgXgkF44ts45/JGI8DMtM0uD9rtobV9+/AZw55HSsRTANOIsQjB4BdySfkMIC4q
         FFeaCOCRXqbXlenbZwOm/feZtfqj2I/pUbwUKupEyLk8urjMNlXh0D9xNqhgOiAFDQz8
         qqKZLN+SHDGKbHTuC8Z3hByLLqWg4VHKlWtLAPrwUkLAoUpal2DuPuym3BhjFMjzUlQr
         fDoz4xFbb8ju6TsOY5MghrK9HqakfO1OmE8siGA5GRBh+ZLDNT02tF/j0WPUQCEGWci8
         Id8Q==
X-Gm-Message-State: AOAM531pBHSKAEY+e9oNObuYAbqT8JXMRZbceftWCOxUX5SX1SOEyO/w
	TAHSg0qA2FmhZ9+FG4kyBEbNaCPj5SAlKV5oErE=
X-Google-Smtp-Source: ABdhPJzMOaHW0aXmK4QuN/qWizNKzgBbW0GMzbEzRvVJsoxu00N4XZkPlvIMLOtFOTvMNGb5OzLdGZE40sx8+3K7Tfk=
X-Received: by 2002:a05:6102:74a:: with SMTP id v10mr8604135vsg.20.1616421619451;
 Mon, 22 Mar 2021 07:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
 <20210319084401.576728-7-alex.kanavin@gmail.com> <20210322112942.3vjqmteke6x6quqz@jama>
In-Reply-To: <20210322112942.3vjqmteke6x6quqz@jama>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Mar 2021 17:00:08 +0300
Message-ID: <CANNYZj9pCS_iH76Nw2D1ZAqD595uKGd151SBf0e=QFog7yiqTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/16] mesa: update 20.3.4 -> 21.0.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f4b9405be207c94"

--0000000000006f4b9405be207c94
Content-Type: text/plain; charset="UTF-8"

I guess so, yes. I believe AB doesn't run the build?

Alex

On Mon, 22 Mar 2021 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Mar 19, 2021 at 09:43:52AM +0100, Alexander Kanavin wrote:
> > 0001-anv-fix-a-build-race-between-generating-a-header-and.patch
> > merged upstream.
> >
> > osmesa is now a simple boolean option.
> >
> > Swrast has been removed from dri drivers, so as we need at least one
> > driver to enable dri in native/nativesdk, replace it with nouveau
> > (which does not take long to build).
>
> so the mesa-gl needs similar change, right?
>
> meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb:# When NOT using X11, we
> need to make sure we have swrast available.
> meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb:DRIDRIVERS_append =
> "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
>
> Now it's failing with:
> http://errors.yoctoproject.org/Errors/Build/118645/
>
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...race-between-generating-a-header-and.patch | 31 -------------------
> >  ...k-for-all-linux-host_os-combinations.patch | 12 +++----
> >  ...02-meson.build-make-TLS-ELF-optional.patch | 14 ++++-----
> >  .../{mesa-gl_20.3.4.bb => mesa-gl_21.0.0.bb}  |  0
> >  meta/recipes-graphics/mesa/mesa.inc           | 10 +++---
> >  .../mesa/{mesa_20.3.4.bb => mesa_21.0.0.bb}   |  0
> >  6 files changed, 17 insertions(+), 50 deletions(-)
> >  delete mode 100644
> meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
> >  rename meta/recipes-graphics/mesa/{mesa-gl_20.3.4.bb =>
> mesa-gl_21.0.0.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_20.3.4.bb => mesa_21.0.0.bb}
> (100%)
> >
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
> b/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
> > deleted file mode 100644
> > index a61e7b2160..0000000000
> > ---
> a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From f148d4f1b5b13288b254ead07f1d008d997e2342 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Mon, 2 Nov 2020 23:23:53 +0100
> > -Subject: [PATCH] anv: fix a build race between generating a header and
> using
> > - it
> > -
> > -anv_batch_chain.c includes genX_bits.h but doesn't ensure it gets
> > -generated first. This causes build failures, as observed here:
> > -
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1501/steps/8/logs/step2d
> > -
> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7412]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - src/intel/vulkan/meson.build | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/src/intel/vulkan/meson.build b/src/intel/vulkan/meson.build
> > -index 36e1689314e..b713d8eade3 100644
> > ---- a/src/intel/vulkan/meson.build
> > -+++ b/src/intel/vulkan/meson.build
> > -@@ -131,6 +131,7 @@ libanv_files = files(
> > - anv_deps = [
> > -   dep_libdrm,
> > -   dep_valgrind,
> > -+  idep_genxml,
> > -   idep_nir_headers,
> > -   idep_vulkan_util_headers,
> > - ]
> > ---
> > -2.29.0
> > -
> > diff --git
> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> > index 085254323c..b6f86743e1 100644
> > ---
> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> > +++
> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> > @@ -1,4 +1,4 @@
> > -From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 2001
> > +From 38e984073e4c23b6278d1a2ff21e894fda7b93c5 Mon Sep 17 00:00:00 2001
> >  From: Alistair Francis <alistair@alistair23.me>
> >  Date: Thu, 14 Nov 2019 13:04:49 -0800
> >  Subject: [PATCH] meson.build: check for all linux host_os combinations
> > @@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis <
> alistair@alistair23.me>
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/meson.build b/meson.build
> > -index 898d025..09e3759 100644
> > +index 932eb13..efc6171 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -124,7 +124,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
> > +@@ -153,7 +153,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
> >   # Only build shared_glapi if at least one OpenGL API is enabled
> >   with_shared_glapi = with_shared_glapi and with_any_opengl
> >
> > @@ -32,12 +32,12 @@ index 898d025..09e3759 100644
> >
> >   dri_drivers = get_option('dri-drivers')
> >   if dri_drivers.contains('auto')
> > -@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0;
> }',
> > +@@ -970,7 +970,7 @@ if cc.compiles('__uint128_t foo(void) { return 0;
> }',
> >   endif
> >
> >   # TODO: this is very incomplete
> > --if ['linux', 'cygwin', 'gnu', 'freebsd',
> 'gnu/kfreebsd'].contains(host_machine.system())
> > -+if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system())
> or host_machine.system().startswith('linux')
> > +-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd',
> 'haiku'].contains(host_machine.system())
> > ++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd',
> 'haiku'].contains(host_machine.system()) or
> host_machine.system().startswith('linux')
> >     pre_args += '-D_GNU_SOURCE'
> >   elif host_machine.system() == 'sunos'
> >     pre_args += '-D__EXTENSIONS__'
> > diff --git
> a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> > index 89c0d150fa..df2346d336 100644
> > ---
> a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> > +++
> b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> > @@ -1,4 +1,4 @@
> > -From ce57ce220d9c377beabf4914f33c43118f672ffe Mon Sep 17 00:00:00 2001
> > +From 624f430dd0a91344146a2b8d49a69f23560c2fa2 Mon Sep 17 00:00:00 2001
> >  From: Alistair Francis <alistair@alistair23.me>
> >  Date: Thu, 14 Nov 2019 13:08:31 -0800
> >  Subject: [PATCH] meson.build: make TLS ELF optional
> > @@ -30,23 +30,23 @@ Signed-off-by: Alistair Francis <
> alistair@alistair23.me>
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> >
> >  diff --git a/meson.build b/meson.build
> > -index c5136ea..185270d 100644
> > +index efc6171..8450968 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -424,7 +424,7 @@ endif
> > +@@ -448,7 +448,7 @@ endif
> >
> >   # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need
> ELF TLS.
> >   use_elf_tls = false
> > --if not ['windows', 'freebsd',
> 'openbsd'].contains(host_machine.system()) and (not with_platform_android
> or get_option('platform-sdk-version') >= 29)
> > -+if not ['windows', 'freebsd',
> 'openbsd'].contains(host_machine.system()) and (not with_platform_android
> or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
> > +-if not ['windows', 'freebsd', 'openbsd',
> 'haiku'].contains(host_machine.system()) and (not with_platform_android or
> get_option('platform-sdk-version') >= 29)
> > ++if not ['windows', 'freebsd', 'openbsd',
> 'haiku'].contains(host_machine.system()) and (not with_platform_android or
> get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
> >     pre_args += '-DUSE_ELF_TLS'
> >     use_elf_tls = true
> >   endif
> >  diff --git a/meson_options.txt b/meson_options.txt
> > -index 2d39d13..72006eb 100644
> > +index fc73f6e..d7482c0 100644
> >  --- a/meson_options.txt
> >  +++ b/meson_options.txt
> > -@@ -368,6 +368,12 @@ option(
> > +@@ -420,6 +420,12 @@ option(
> >     value : true,
> >     description : 'Enable direct rendering in GLX and EGL for DRI',
> >   )
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb
> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index 9f8ec112cf..e9b72ce063 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -19,10 +19,9 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >             file://0002-meson.build-make-TLS-ELF-optional.patch \
> >
>  file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> >
>  file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> > -
>  file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =
> "dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084"
> > +SRC_URI[sha256sum] =
> "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > @@ -103,8 +102,8 @@ PACKAGECONFIG[elf-tls] = "-Delf-tls=true,
> -Delf-tls=false"
> >  PACKAGECONFIG[xvmc] =
> "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
> >  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm
> wayland-protocols"
> >
> > -DRIDRIVERS_class-native = "swrast"
> > -DRIDRIVERS_class-nativesdk = "swrast"
> > +DRIDRIVERS_class-native = "nouveau"
> > +DRIDRIVERS_class-nativesdk = "nouveau"
> >  DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
> >  DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
> >  # "dri" requires "opengl"
> > @@ -168,8 +167,7 @@ GALLIUMDRIVERS_append
> ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
> >  PACKAGECONFIG[panfrost] = ""
> >  GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG',
> 'panfrost', ',panfrost', '', d)}"
> >
> > -OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium',
> 'classic', d)}"
> > -PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
> > +PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
> >
> >  PACKAGECONFIG[unwind] =
> "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_20.3.4.bb
> b/meta/recipes-graphics/mesa/mesa_21.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa_20.3.4.bb
> > rename to meta/recipes-graphics/mesa/mesa_21.0.0.bb
> > --
> > 2.29.2
> >
>
> >
> > 
> >
>
>

--0000000000006f4b9405be207c94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I guess so, yes. I believe AB doesn&#39;t run the build?<d=
iv><br></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 22 Mar 2021 at 14:29, Martin Jansa &=
lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
Mar 19, 2021 at 09:43:52AM +0100, Alexander Kanavin wrote:<br>
&gt; 0001-anv-fix-a-build-race-between-generating-a-header-and.patch<br>
&gt; merged upstream.<br>
&gt; <br>
&gt; osmesa is now a simple boolean option.<br>
&gt; <br>
&gt; Swrast has been removed from dri drivers, so as we need at least one<=
br>
&gt; driver to enable dri in native/nativesdk, replace it with nouveau<br>
&gt; (which does not take long to build).<br>
<br>
so the mesa-gl needs similar change, right?<br>
<br>
meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb:# When NOT using X11, we need=
 to make sure we have swrast available.<br>
meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb:DRIDRIVERS_append =3D &quot;$=
{@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;&#39;, &=
#39;,swrast&#39;, d)}&quot;<br>
<br>
Now it&#39;s failing with:<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Build/118645/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Build/1186=
45/</a><br>
<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...race-between-generating-a-header-and.patch | 31 ------------=
-------<br>
&gt;=C2=A0 ...k-for-all-linux-host_os-combinations.patch | 12 +++----<br>
&gt;=C2=A0 ...02-meson.build-make-TLS-ELF-optional.patch | 14 ++++-----<br=
>
&gt;=C2=A0 .../{<a href=3D"http://mesa-gl_20.3.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mesa-gl_20.3.4.bb</a> =3D&gt; <a href=3D"http://mesa-gl_21.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a>}=C2=A0 |=
=
=C2=A0 0<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 10 +++---<br>
&gt;=C2=A0 .../mesa/{<a href=3D"http://mesa_20.3.4.bb" rel=3D"noreferrer" =
target=3D"_blank">mesa_20.3.4.bb</a> =3D&gt; <a href=3D"http://mesa_21.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 0<br>
&gt;=C2=A0 6 files changed, 17 insertions(+), 50 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/mesa/files/0001-anv-fi=
x-a-build-race-between-generating-a-header-and.patch<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_20=
.3.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.3.4.bb</a> =3D&gt;=
 <a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">=
mesa-gl_21.0.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_20.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_20.3.4.bb</a> =3D&gt; <a hr=
ef=3D"http://mesa_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0=
.0.bb</a>} (100%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-ra=
ce-between-generating-a-header-and.patch b/meta/recipes-graphics/mesa/files=
/0001-anv-fix-a-build-race-between-generating-a-header-and.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a61e7b2160..0000000000<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-betw=
een-generating-a-header-and.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -From f148d4f1b5b13288b254ead07f1d008d997e2342 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Mon, 2 Nov 2020 23:23:53 +0100<br>
&gt; -Subject: [PATCH] anv: fix a build race between generating a header a=
nd using<br>
&gt; - it<br>
&gt; -<br>
&gt; -anv_batch_chain.c includes genX_bits.h but doesn&#39;t ensure it get=
s<br>
&gt; -generated first. This causes build failures, as observed here:<br>
&gt; -<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/8=
6/builds/1501/steps/8/logs/step2d" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1501/steps/8=
/logs/step2d</a><br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.or=
g/mesa/mesa/-/merge_requests/7412" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7412</a>]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/intel/vulkan/meson.build | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/src/intel/vulkan/meson.build b/src/intel/vulkan/meson.b=
uild<br>
&gt; -index 36e1689314e..b713d8eade3 100644<br>
&gt; ---- a/src/intel/vulkan/meson.build<br>
&gt; -+++ b/src/intel/vulkan/meson.build<br>
&gt; -@@ -131,6 +131,7 @@ libanv_files =3D files(<br>
&gt; - anv_deps =3D [<br>
&gt; -=C2=A0 =C2=A0dep_libdrm,<br>
&gt; -=C2=A0 =C2=A0dep_valgrind,<br>
&gt; -+=C2=A0 idep_genxml,<br>
&gt; -=C2=A0 =C2=A0idep_nir_headers,<br>
&gt; -=C2=A0 =C2=A0idep_vulkan_util_headers,<br>
&gt; - ]<br>
&gt; --- <br>
&gt; -2.29.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-=
for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files=
/0001-meson.build-check-for-all-linux-host_os-combinations.patch<br>
&gt; index 085254323c..b6f86743e1 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all=
-linux-host_os-combinations.patch<br>
&gt; +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all=
-linux-host_os-combinations.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 38e984073e4c23b6278d1a2ff21e894fda7b93c5 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair2=
3.me" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 14 Nov 2019 13:04:49 -0800<br>
&gt;=C2=A0 Subject: [PATCH] meson.build: check for all linux host_os combi=
nations<br>
&gt; @@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis &lt;<a href=3D"ma=
ilto:alistair@alistair23.me" target=3D"_blank">alistair@alistair23.me</a>&g=
t;<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; -index 898d025..09e3759 100644<br>
&gt; +index 932eb13..efc6171 100644<br>
&gt;=C2=A0 --- a/meson.build<br>
&gt;=C2=A0 +++ b/meson.build<br>
&gt; -@@ -124,7 +124,7 @@ with_any_opengl =3D with_opengl or with_gles1 or=
 with_gles2<br>
&gt; +@@ -153,7 +153,7 @@ with_any_opengl =3D with_opengl or with_gles1 or=
 with_gles2<br>
&gt;=C2=A0 =C2=A0# Only build shared_glapi if at least one OpenGL API is e=
nabled<br>
&gt;=C2=A0 =C2=A0with_shared_glapi =3D with_shared_glapi and with_any_open=
gl<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -32,12 +32,12 @@ index 898d025..09e3759 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0dri_drivers =3D get_option(&#39;dri-drivers&#39;)<br>
&gt;=C2=A0 =C2=A0if dri_drivers.contains(&#39;auto&#39;)<br>
&gt; -@@ -884,7 +884,7 @@ if cc.compiles(&#39;__uint128_t foo(void) { retu=
rn 0; }&#39;,<br>
&gt; +@@ -970,7 +970,7 @@ if cc.compiles(&#39;__uint128_t foo(void) { retu=
rn 0; }&#39;,<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# TODO: this is very incomplete<br>
&gt; --if [&#39;linux&#39;, &#39;cygwin&#39;, &#39;gnu&#39;, &#39;freebsd&=
#39;, &#39;gnu/kfreebsd&#39;].contains(host_machine.system())<br>
&gt; -+if [&#39;cygwin&#39;, &#39;gnu&#39;, &#39;gnu/kfreebsd&#39;].contai=
ns(host_machine.system()) or host_machine.system().startswith(&#39;linux&#3=
9;)<br>
&gt; +-if [&#39;linux&#39;, &#39;cygwin&#39;, &#39;gnu&#39;, &#39;freebsd&=
#39;, &#39;gnu/kfreebsd&#39;, &#39;haiku&#39;].contains(host_machine.system=
())<br>
&gt; ++if [&#39;linux&#39;, &#39;cygwin&#39;, &#39;gnu&#39;, &#39;freebsd&=
#39;, &#39;gnu/kfreebsd&#39;, &#39;haiku&#39;].contains(host_machine.system=
()) or host_machine.system().startswith(&#39;linux&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0pre_args +=3D &#39;-D_GNU_SOURCE&#39;<br>
&gt;=C2=A0 =C2=A0elif host_machine.system() =3D=3D &#39;sunos&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pre_args +=3D &#39;-D__EXTENSIONS__&#39;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-T=
LS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-m=
ake-TLS-ELF-optional.patch<br>
&gt; index 89c0d150fa..df2346d336 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-=
optional.patch<br>
&gt; +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-=
optional.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From ce57ce220d9c377beabf4914f33c43118f672ffe Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 624f430dd0a91344146a2b8d49a69f23560c2fa2 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair2=
3.me" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 14 Nov 2019 13:08:31 -0800<br>
&gt;=C2=A0 Subject: [PATCH] meson.build: make TLS ELF optional<br>
&gt; @@ -30,23 +30,23 @@ Signed-off-by: Alistair Francis &lt;<a href=3D"ma=
ilto:alistair@alistair23.me" target=3D"_blank">alistair@alistair23.me</a>&g=
t;<br>
&gt;=C2=A0 =C2=A02 files changed, 7 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; -index c5136ea..185270d 100644<br>
&gt; +index efc6171..8450968 100644<br>
&gt;=C2=A0 --- a/meson.build<br>
&gt;=C2=A0 +++ b/meson.build<br>
&gt; -@@ -424,7 +424,7 @@ endif<br>
&gt; +@@ -448,7 +448,7 @@ endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Android uses emutls for versions &lt;=3D P/28. For USE_=
ELF_TLS we need ELF TLS.<br>
&gt;=C2=A0 =C2=A0use_elf_tls =3D false<br>
&gt; --if not [&#39;windows&#39;, &#39;freebsd&#39;, &#39;openbsd&#39;].co=
ntains(host_machine.system()) and (not with_platform_android or get_option(=
&#39;platform-sdk-version&#39;) &gt;=3D 29)<br>
&gt; -+if not [&#39;windows&#39;, &#39;freebsd&#39;, &#39;openbsd&#39;].co=
ntains(host_machine.system()) and (not with_platform_android or get_option(=
&#39;platform-sdk-version&#39;) &gt;=3D 29) and get_option(&#39;elf-tls&#39=
;)<br>
&gt; +-if not [&#39;windows&#39;, &#39;freebsd&#39;, &#39;openbsd&#39;, &#=
39;haiku&#39;].contains(host_machine.system()) and (not with_platform_andro=
id or get_option(&#39;platform-sdk-version&#39;) &gt;=3D 29)<br>
&gt; ++if not [&#39;windows&#39;, &#39;freebsd&#39;, &#39;openbsd&#39;, &#=
39;haiku&#39;].contains(host_machine.system()) and (not with_platform_andro=
id or get_option(&#39;platform-sdk-version&#39;) &gt;=3D 29) and get_option=
(&#39;elf-tls&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0pre_args +=3D &#39;-DUSE_ELF_TLS&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0use_elf_tls =3D true<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; -index 2d39d13..72006eb 100644<br>
&gt; +index fc73f6e..d7482c0 100644<br>
&gt;=C2=A0 --- a/meson_options.txt<br>
&gt;=C2=A0 +++ b/meson_options.txt<br>
&gt; -@@ -368,6 +368,12 @@ option(<br>
&gt; +@@ -420,6 +420,12 @@ option(<br>
&gt;=C2=A0 =C2=A0 =C2=A0value : true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0description : &#39;Enable direct rendering in GLX =
and EGL for DRI&#39;,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_20.=
3.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.3.4.bb</a> b/meta/r=
ecipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"noreferrer=
" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_20.3=
.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.3.4.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graph=
ics/mesa/mesa.inc<br>
&gt; index 9f8ec112cf..e9b72ce063 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -19,10 +19,9 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesk=
top.org/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank"=
>https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-meson.buil=
d-make-TLS-ELF-optional.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-misd=
etects-64bit-atomics-on-mips-clang.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-futex.h-De=
fine-__NR_futex-if-it-does-not-exist.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-anv-fix-a-build=
-race-between-generating-a-header-and.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;dc21a987ec1ff45b278fe4b1419b1719f1968de=
bbb80221480e44180849b4084&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f=
3601c808ca0dd26ba522e0d84&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.=
\d+)+)&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -103,8 +102,8 @@ PACKAGECONFIG[elf-tls] =3D &quot;-Delf-tls=3Dtrue=
, -Delf-tls=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[xvmc] =3D &quot;-Dgallium-xvmc=3Denabled,-Dgalliu=
m-xvmc=3Ddisabled,libxvmc&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[wayland] =3D &quot;,,wayland-native wayland libdr=
m wayland-protocols&quot;<br>
&gt;=C2=A0 <br>
&gt; -DRIDRIVERS_class-native =3D &quot;swrast&quot;<br>
&gt; -DRIDRIVERS_class-nativesdk =3D &quot;swrast&quot;<br>
&gt; +DRIDRIVERS_class-native =3D &quot;nouveau&quot;<br>
&gt; +DRIDRIVERS_class-nativesdk =3D &quot;nouveau&quot;<br>
&gt;=C2=A0 DRIDRIVERS_append_x86_class-target =3D &quot;,r100,r200,nouveau=
,i965,i915&quot;<br>
&gt;=C2=A0 DRIDRIVERS_append_x86-64_class-target =3D &quot;,r100,r200,nouv=
eau,i965,i915&quot;<br>
&gt;=C2=A0 # &quot;dri&quot; requires &quot;opengl&quot;<br>
&gt; @@ -168,8 +167,7 @@ GALLIUMDRIVERS_append =3D&quot;${@bb.utils.contai=
ns(&#39;PACKAGECONFIG&#39;, &#39;lima&#39;, &#39;,lima&#39;, &#39;<br>
&gt;=C2=A0 PACKAGECONFIG[panfrost] =3D &quot;&quot;<br>
&gt;=C2=A0 GALLIUMDRIVERS_append =3D&quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;panfrost&#39;, &#39;,panfrost&#39;, &#39;&#39;, d)}&quot=
;<br>
&gt;=C2=A0 <br>
&gt; -OSMESA =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;=
gallium&#39;, &#39;gallium&#39;, &#39;classic&#39;, d)}&quot;<br>
&gt; -PACKAGECONFIG[osmesa] =3D &quot;-Dosmesa=3D${OSMESA},-Dosmesa=3Dnone=
&quot;<br>
&gt; +PACKAGECONFIG[osmesa] =3D &quot;-Dosmesa=3Dtrue,-Dosmesa=3Dfalse&quo=
t;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG[unwind] =3D &quot;-Dlibunwind=3Denabled,-Dlibunwi=
nd=3Ddisabled,libunwind&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_20.3.4=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa_20.3.4.bb</a> b/meta/recipes=
-graphics/mesa/<a href=3D"http://mesa_21.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_21.0.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_20.3.4.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_20.3.4.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a><br>
&gt; -- <br>
&gt; 2.29.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--0000000000006f4b9405be207c94--
