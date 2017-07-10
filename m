Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 30C3B71993
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:47:00 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id f200so5462283ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dyp8tQeWjGUSLrY86WxaEdMA8Dvh/XD0yco/iLhaaXY=;
	b=iPcqZeH/nqvAm0fVeqyoCJ2cArKbByfIC5GraUQNYLpSE1NDNdoqg7KvaBwo5ysn9g
	FNzmsYz4l+yzdJxrhbjXEbAiWeTsSMLdQJChXfKcvYrj/4x4SFPTssbyRj/CmOnyerZR
	KzQg70AxWF0UbVX2brNWGGClqyreW1s/Ga92XljgMvTIg700UQJ5P6egGhy9ODMOUoKx
	DorBJQlBJxUheOfR2PochYxjMCQd6kFIN/6YPz76BKNfw0CwiF5eN7oULP7xKi/msRQY
	QIkPwOkCtWeLQEcKr76xMvaLIWVyV6/AbIC22d0MGWtXki+jRxrmblPHhYi0Ug/btcJU
	iBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dyp8tQeWjGUSLrY86WxaEdMA8Dvh/XD0yco/iLhaaXY=;
	b=brRTjdkhv0fsZJRB2BqVGWjFtbo4Bt+FIl9SiY/Ij/lVEGPubrQwt4Oh88R+mPsmht
	Ux/4bIKNSmnyx6CpU/aG/sN0KCPj0T7Nf0Th0h1xVUQ4CTQgVt6b0fZIoGSzbWkFdsGD
	l7JjNHFFqyXB37rtjSq+7sixH04tPZ1F9oEluOGcQvD1EXvHFwLep4OVEKIa8p3MNPMS
	YWZgYTdjSloQPnCs2nVZoh/wPtFc1HLyiroSOm06/wEM0NmO/U6WzL3eVVPkVX5Ki+VG
	9BIjMmmVJ3idzi7YEJM0uNMyQULFDnORtDcXYtPHOrZchlOEXH/IzyrXcEdQMQLsas2g
	8QIw==
X-Gm-Message-State: AIVw111ZX9VWt0+Svy7ofNabx/DXeORV95QjOetxmAudLqnNZPu0A4MN
	ibNHd6f+0eOEioqi/9ZeoeiUSVuSYQ==
X-Received: by 10.13.208.66 with SMTP id s63mr946547ywd.292.1499698021995;
	Mon, 10 Jul 2017 07:47:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Mon, 10 Jul 2017 07:47:01 -0700 (PDT)
In-Reply-To: <7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 10 Jul 2017 16:47:01 +0200
Message-ID: <CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Mon, 10 Jul 2017 14:47:01 -0000
Content-Type: multipart/alternative; boundary="001a114e5e98df21000553f7a757"

--001a114e5e98df21000553f7a757
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 27, 2017 at 3:16 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Imports the current EGL API registry from Khronos.
>
> Makes EGL support optional: this is reflected in the recipe but
> egl is enabled by default as before.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}            | 9
> +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb =>
> libepoxy_1.4.3.bb} (70%)
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> similarity index 70%
> rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
> rename to meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> index e69e828..c8b398f 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.2.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> @@ -6,15 +6,16 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>
>  SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${
> BP}.tar.xz"
> -SRC_URI[md5sum] = "632fcfd7ae9d21f5a634326d753a89c4"
> -SRC_URI[sha256sum] = "bea6fdec3d10939954495da898d87
> 2ee836b75c35699074cbf02a64fcb80d5b3"
> +SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
> +SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8
> bc7fb2fda074478e329b063c1f872b826f6"
>  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>
>  inherit autotools pkgconfig distro_features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> -DEPENDS = "util-macros virtual/egl"
> +DEPENDS = "util-macros"
>
> +PACKAGECONFIG[egl] = "--enable-egl, --disable-egl, virtual/egl"
>  PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
> --
> 2.1.4
>

Beside the issue with recent patch to mesa, also this one seems to have
caused nasty effects on raspberrypi builds... I got to it after bisecting
poky from 854c8c2 that failed with:

ERROR: gtk+3-3.22.16-r0 do_prepare_recipe_sysroot: Error executing a python
function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/home/gizero/work/smartliving/distro/repo-
master/build-poky/conf/../../layers/poky/meta/classes/staging.bbclass',
lineno: 510, function: extend_recipe_sysroot
     0506:                    dest = newmanifest[l]
     0507:                    if l.endswith("/"):
     0508:                        staging_copydir(l, targetdir, dest,
seendirs)
     0509:                        continue
 *** 0510:                    staging_copyfile(l, targetdir, dest,
postinsts, seendirs)
     0511:
     0512:    for f in fixme:
     0513:        if f == '':
     0514:            staging_processfixme(fixme[f], recipesysroot,
recipesysroot, recipesysrootnative, d)
File: '/home/gizero/work/smartliving/distro/repo-
master/build-poky/conf/../../layers/poky/meta/classes/staging.bbclass',
lineno: 151, function: staging_copyfile
     0147:        os.symlink(linkto, dest)
     0148:        #bb.warn(c)
     0149:    else:
     0150:        try:
 *** 0151:            os.link(c, dest)
     0152:        except OSError as err:
     0153:            if err.errno == errno.EXDEV:
     0154:                bb.utils.copyfile(c, dest)
     0155:            else:
Exception: FileExistsError: [Errno 17] File exists: '/home/gizero/work/
smartliving/distro/repo-master/build-poky/tmp/sysroots-components/
raspberrypi3/userland/usr/include/KHR/khrplatform.h' -> '/home/gizero/work/
smartliving/distro/repo-master/build-poky/tmp/work/
cortexa7hf-neon-vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-
r0/recipe-sysroot/usr/include/KHR/khrplatform.h'

ERROR: gtk+3-3.22.16-r0 do_prepare_recipe_sysroot: Function failed:
extend_recipe_sysroot
ERROR: Logfile of failure stored in: /home/gizero/work/smartliving/
distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-
vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-r0/temp/log.do_
prepare_recipe_sysroot.31798
ERROR: Task (/home/gizero/work/smartliving/distro/repo-
master/build-poky/conf/../../layers/poky/meta/recipes-
gnome/gtk+/gtk+3_3.22.16.bb:do_prepare_recipe_sysroot) failed with exit
code '1'

During bisection the failing task changed from do_prepare_recipe_sysroot to
do_compile with the log below. I have no idea if these things do relate
themselves, but if not, I was not able to figure it out while bisecting.

| In file included from /home/gizero/work/smartliving/
distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-
vfpv4-poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/
usr/include/epoxy/egl.h:46:0,
|                  from ../../../gtk+-3.22.16/gdk/
wayland/gdkglcontext-wayland.h:32,
|                  from ../../../gtk+-3.22.16/gdk/
wayland/gdkglcontext-wayland.c:24:
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c: In function
'gdk_wayland_gl_context_realize':
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:179:43: error:
expected expression before 'EGLContext'
|                                          : EGL_NO_CONTEXT,
|                                            ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:200:47: error:
expected expression before 'EGLContext'
|                                              : EGL_NO_CONTEXT,
|                                                ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c: In function
'gdk_x11_gl_context_dispose':
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:510:54: error:
expected expression before 'EGLSurface'
|          eglMakeCurrent(display_wayland->egl_display, EGL_NO_SURFACE,
EGL_NO_SURFACE,
|                                                       ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:510:70: error:
expected expression before 'EGLSurface'
|          eglMakeCurrent(display_wayland->egl_display, EGL_NO_SURFACE,
EGL_NO_SURFACE,
|                                                                       ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:511:24: error:
expected expression before 'EGLContext'
|                         EGL_NO_CONTEXT);
|                         ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c: In function
'gdk_wayland_display_make_gl_context_current':
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:534:52: error:
expected expression before 'EGLSurface'
|        eglMakeCurrent(display_wayland->egl_display, EGL_NO_SURFACE,
EGL_NO_SURFACE,
|                                                     ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:534:68: error:
expected expression before 'EGLSurface'
|        eglMakeCurrent(display_wayland->egl_display, EGL_NO_SURFACE,
EGL_NO_SURFACE,
|                                                                     ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:535:22: error:
expected expression before 'EGLContext'
|                       EGL_NO_CONTEXT);
|                       ^
| ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:547:16: error:
expected expression before 'EGLSurface'
|   egl_surface = EGL_NO_SURFACE;
|                 ^
| Makefile:692: recipe for target 'gdkglcontext-wayland.lo' failed
| make[5]: *** [gdkglcontext-wayland.lo] Error 1
| make[5]: *** Waiting for unfinished jobs....
| make[5]: Leaving directory '/home/gizero/work/smartliving/distro/repo-
master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-
linux-gnueabi/gtk+3/3.22.16-r0/build/gdk/wayland'

--001a114e5e98df21000553f7a757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 27, 2017 at 3:16 PM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Imports the current EGL API registry from Khronos.<br>
<br>
Makes EGL support optional: this is reflected in the recipe but<br>
egl is enabled by default as before.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libepoxy/{<a href=3D"http://libepoxy_1.4.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">libepoxy_1.4.2.<wbr>bb</a> =3D&gt; <a href=3D"http://lib=
epoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/libepoxy<wbr>/{<a href=3D"http://libepox=
y_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a> =3D&=
gt; <a href=3D"http://libepoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">libepoxy_1.4.3.bb</a>} (70%)<br>
<br>
diff --git a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy=
_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a> b/met=
a/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
similarity index 70%<br>
rename from meta/recipes-graphics/libepoxy<wbr>/<a href=3D"http://libepoxy_=
1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a><br>
rename to meta/recipes-graphics/libepoxy<wbr>/<a href=3D"http://libepoxy_1.=
4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
index e69e828..c8b398f 100644<br>
--- a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.4.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.2.bb</a><br>
+++ b/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.4.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
@@ -6,15 +6,16 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D58ef4c80d4<wbr>01e07b=
d9ee8b6b58cf464b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/anholt/$%7BBPN%7D/rel=
eases/download/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/anholt/${B<wbr>PN}/releases/download/${PV}/${<wbr>B=
P}.tar.xz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;632fcfd7ae9d21f5a634326d753a8<wbr>9c4&quot;<br>
-SRC_URI[sha256sum] =3D &quot;bea6fdec3d10939954495da898d87<wbr>2ee836b75c3=
5699074cbf02a64fcb8<wbr>0d5b3&quot;<br>
+SRC_URI[md5sum] =3D &quot;af4c3ce0fb1143bdc4e43f85695a9<wbr>bed&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0b808a06c9685a62fca34b680abb8<wbr>bc7fb2fda07=
4478e329b063c1f872b<wbr>826f6&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/anholt/lib=
epoxy/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/anh=
olt/lib<wbr>epoxy/releases</a>&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig distro_features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
-DEPENDS =3D &quot;util-macros virtual/egl&quot;<br>
+DEPENDS =3D &quot;util-macros&quot;<br>
<br>
+PACKAGECONFIG[egl] =3D &quot;--enable-egl, --disable-egl, virtual/egl&quot=
;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-glx, --disable-glx, virtual/lib=
x11&quot;<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FE<wbr>ATURES&#39=
;, &#39;x11&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FE<wbr>ATURES&#39=
;, &#39;x11&#39;, d)} egl&quot;<br>
<span class=3D"m_827202577286063731gmail-HOEnZb"><font color=3D"#888888">--=
<br>
2.1.4</font></span><br></blockquote></div><br></div><div class=3D"gmail_ext=
ra">Beside the issue with recent patch to mesa, also this one seems to have=
 caused nasty effects on raspberrypi builds... I got to it after bisecting =
poky from 854c8c2 that failed with:<br><br>ERROR: gtk+3-3.22.16-r0 do_prepa=
re_recipe_sysroot: Error executing a python function in exec_python_func() =
autogenerated:<br><br>The stack trace of python calls that resulted in this=
 exception/failure was:<br>File: &#39;exec_python_func() autogenerated&#39;=
, lineno: 2, function: &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0=C2=A0 0001:<br>=
=C2=A0*** 0002:extend_recipe_sysroot(d)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0003:<b=
r>File: &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<wbr>master/bui=
ld-poky/conf/../../<wbr>layers/poky/meta/classes/<wbr>staging.bbclass&#39;,=
 lineno: 510, function: extend_recipe_sysroot<br>=C2=A0=C2=A0=C2=A0=C2=A0 0=
506:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =3D newmanifest[l]<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0507:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if l.=
endswith(&quot;/&quot;):<br>=C2=A0=C2=A0=C2=A0=C2=A0 0508:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging_copydir(l, targetd=
ir, dest, seendirs)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0509:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue<br>=C2=A0*** 0510:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 staging_copyfile(l, targetdir, dest, p=
ostinsts, seendirs)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0511:<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0512:=C2=A0=C2=A0=C2=A0 for f in fixme:<br>=C2=A0=C2=A0=C2=A0=C2=A0 =
0513:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if f =3D=3D &#39;&#39;:<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0514:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 staging_processfixme(fixme[f], recipesysroot, recipes=
ysroot, recipesysrootnative, d)<br>File: &#39;/home/gizero/work/<wbr>smartl=
iving/distro/repo-<wbr>master/build-poky/conf/../../<wbr>layers/poky/meta/c=
lasses/<wbr>staging.bbclass&#39;, lineno: 151, function: staging_copyfile<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 0147:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
os.symlink(linkto, dest)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0148:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #bb.warn(c)<br>=C2=A0=C2=A0=C2=A0=C2=A0 0149:=
=C2=A0=C2=A0=C2=A0 else:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0150:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>=C2=A0*** 0151:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.link(c, dest)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 0152:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except OSError=
 as err:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0153:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if err.errno =3D=3D errno.EXDEV:<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 0154:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.copyfile(c, dest)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0155:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 else:<br>Exception: FileExistsError: [Errno 17] File =
exists: &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<wbr>master/bui=
ld-poky/tmp/<wbr>sysroots-components/<wbr>raspberrypi3/userland/usr/<wbr>in=
clude/KHR/khrplatform.h&#39; -&gt; &#39;/home/gizero/work/<wbr>smartliving/=
distro/repo-<wbr>master/build-poky/tmp/work/<wbr>cortexa7hf-neon-vfpv4-poky=
-<wbr>linux-gnueabi/gtk+3/3.22.16-<wbr>r0/recipe-sysroot/usr/include/<wbr>K=
HR/khrplatform.h&#39;<br><br>ERROR: gtk+3-3.22.16-r0 do_prepare_recipe_sysr=
oot: Function failed: extend_recipe_sysroot<br>ERROR: Logfile of failure st=
ored in: /home/gizero/work/smartliving/<wbr>distro/repo-master/build-poky/<=
wbr>tmp/work/cortexa7hf-neon-<wbr>vfpv4-poky-linux-gnueabi/gtk+<wbr>3/3.22.=
16-r0/temp/log.do_<wbr>prepare_recipe_sysroot.31798<br>ERROR: Task (/home/g=
izero/work/<wbr>smartliving/distro/repo-<wbr>master/build-poky/conf/../../<=
wbr>layers/poky/meta/recipes-<wbr>gnome/gtk+/gtk+3_3.22.16.bb:do<wbr>_prepa=
re_recipe_sysroot) failed with exit code &#39;1&#39;<br><br></div><div clas=
s=3D"gmail_extra">During bisection the failing task changed from do_prepare=
_recipe_sysroot to do_compile with the log below. I have no idea if these t=
hings do relate themselves, but if not, I was not able to figure it out whi=
le bisecting.<br></div><div class=3D"gmail_extra"><br>| In file included fr=
om /home/gizero/work/smartliving/<wbr>distro/repo-master/build-poky/<wbr>tm=
p/work/cortexa7hf-neon-<wbr>vfpv4-poky-linux-gnueabi/gtk+<wbr>3/3.22.16-r0/=
recipe-sysroot/<wbr>usr/include/epoxy/egl.h:46:0,<br>|=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 from ../../../gtk+-3.22.16/gdk/<wbr>wayland/gdkglcontext-wayland.<wb=
r>h:32,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../../../gtk+-3.22.16/gdk/<wbr=
>wayland/gdkglcontext-wayland.<wbr>c:24:<br>| ../../../gtk+-3.22.16/gdk/<wb=
r>wayland/gdkglcontext-wayland.<wbr>c: In function &#39;gdk_wayland_gl_cont=
ext_<wbr>realize&#39;:<br>| ../../../gtk+-3.22.16/gdk/<wbr>wayland/gdkglcon=
text-wayland.<wbr>c:179:43: error: expected expression before &#39;EGLConte=
xt&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : EGL_NO_CONTEXT,<br>|=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| ../../../gtk+-3.22.16/gdk/<wbr>wayland/g=
dkglcontext-wayland.<wbr>c:200:47: error: expected expression before &#39;E=
GLContext&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : =
EGL_NO_CONTEXT,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^<br>| ../../../gtk+-3.22.16/gdk/<wbr>wayland/gdkglcontext-waylan=
d.<wbr>c: In function &#39;gdk_x11_gl_context_dispose&#39;:<br>| ../../../g=
tk+-3.22.16/gdk/<wbr>wayland/gdkglcontext-wayland.<wbr>c:510:54: error: exp=
ected expression before &#39;EGLSurface&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eglMakeCurrent(display_<wbr>wayland-&gt;egl_=
display, EGL_NO_SURFACE, EGL_NO_SURFACE,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^<br>| ../../../gtk+-3.22.16/gdk/<wbr>wayland/gdkglcontext-wayland.<wbr>c:=
510:70: error: expected expression before &#39;EGLSurface&#39;<br>|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eglMakeCurrent(display_<wb=
r>wayland-&gt;egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,<br>|=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| ../../../gtk+-3.22.16/=
gdk/<wbr>wayland/gdkglcontext-wayland.<wbr>c:511:24: error: expected expres=
sion before &#39;EGLContext&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_NO_CONTEXT);<br>|=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| ../../../gtk+-3.=
22.16/gdk/<wbr>wayland/gdkglcontext-wayland.<wbr>c: In function &#39;gdk_wa=
yland_display_make_gl_<wbr>context_current&#39;:<br>| ../../../gtk+-3.22.16=
/gdk/<wbr>wayland/gdkglcontext-wayland.<wbr>c:534:52: error: expected expre=
ssion before &#39;EGLSurface&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 eglMakeCurrent(display_<wbr>wayland-&gt;egl_display, EGL_NO_SURFACE,=
 EGL_NO_SURFACE,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| ../../../gtk+-3.22.16/gdk/<w=
br>wayland/gdkglcontext-wayland.<wbr>c:534:68: error: expected expression b=
efore &#39;EGLSurface&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
glMakeCurrent(display_<wbr>wayland-&gt;egl_display, EGL_NO_SURFACE, EGL_NO_=
SURFACE,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| ../../..=
/gtk+-3.22.16/gdk/<wbr>wayland/gdkglcontext-wayland.<wbr>c:535:22: error: e=
xpected expression before &#39;EGLContext&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EGL_NO_CONTEXT);<br>|=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| ../../../gtk+-3.22.16/gdk/<w=
br>wayland/gdkglcontext-wayland.<wbr>c:547:16: error: expected expression b=
efore &#39;EGLSurface&#39;<br>|=C2=A0=C2=A0 egl_surface =3D EGL_NO_SURFACE;=
<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>| Makefile:692: recipe for target &#39;gdk=
glcontext-wayland.lo&#39; failed<br>| make[5]: *** [gdkglcontext-wayland.lo=
] Error 1<br>| make[5]: *** Waiting for unfinished jobs....<br>| make[5]: L=
eaving directory &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<wbr>m=
aster/build-poky/tmp/work/<wbr>cortexa7hf-neon-vfpv4-poky-<wbr>linux-gnueab=
i/gtk+3/3.22.16-<wbr>r0/build/gdk/wayland&#39;<br><br><br></div></div>

--001a114e5e98df21000553f7a757--
