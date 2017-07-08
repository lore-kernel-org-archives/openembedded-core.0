Return-Path: <gizero@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 27FCD78094
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 15:34:57 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id n205so2527460yba.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dUqjiY/EbYbPb0Ku/OQ6RWg+nxeh9iHOe+w4/snt5tI=;
	b=KzXOLxE2prvKhy58OlBMXXqT+F6W9gTf8nNVM3dpLtlSK3adoLN0lc65X4Ew0Jvq/o
	XujogcSCaS6ENCqhvtkhRoldUNlzixDQPn5opceY5GAg+okHfSDiRXkX9qTXGvwtUrJw
	U3E5zBiZipAt4Cse36lttuqgKZYoBsyO6owa75mvwhPbfE12CEnoEimdARAAAPX6tZHI
	1FR9tYmk21e1RH+Vi8mAKg6a3Fviz5Opxa0w52116PGqXOpQpP+9hlkvffqOSDi0jhpI
	wlSE1GWX/J1pKrStUtEq+Zv6TNjrhPDNELrJTSU54PysHwxJ9XmDvgVfiT8a3tva56az
	dUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dUqjiY/EbYbPb0Ku/OQ6RWg+nxeh9iHOe+w4/snt5tI=;
	b=jj5lwENzT63YBR8FWeFkAfykekblXhZRxRvPUuGRf3eORXqPX8eXiquqzrfvp4YYWW
	C6CyB0hxzrcwlB/XPlU9y63DMH3WLar7IUWIqAJRrIi3gEkP5nI72s39xjbu807Qz+HF
	VsU79LxQ+lidY8qsQQFYqjK9VIiZbOfI+YH2iVUW3z1mIsEXfDmtgWoby8SMDvftezGT
	cvkvfHlZjUY0Zh3o8JgJGz7AMbOslOeu0gGgLYPAw88JPmZZmD9KdSVpi3E1q7qMg8q8
	KLx6l9LdXkbmY2L+2PaZ1rR4PYVzKJeFJdRmkTBCh9/ploEIk4meInn9td75XW6yTJm/
	2X0Q==
X-Gm-Message-State: AIVw112pEBhXduDAH+iVxdAHZw9PHuUBQzs092E8j4LNJkw0myLjaUPV
	HhDPGUFXTr6rsFqwCDvmxTuB/Ca7lQ==
X-Received: by 10.37.199.205 with SMTP id w196mr8238365ybe.143.1499528098609; 
	Sat, 08 Jul 2017 08:34:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Sat, 8 Jul 2017 08:34:58 -0700 (PDT)
In-Reply-To: <20170703200210.32229-1-otavio@ossystems.com.br>
References: <20170703200210.32229-1-otavio@ossystems.com.br>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sat, 8 Jul 2017 17:34:58 +0200
Message-ID: <CAC+thW25+hHFEn6gAaJwE5fmg=kuJG=RU-dF7JpC1yfDJCN2vQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] mesa: Avoid platform probing when building without EGL
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
X-List-Received-Date: Sat, 08 Jul 2017 15:34:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c1480b8a5fee20553d0171b"

--94eb2c1480b8a5fee20553d0171b
Content-Type: text/plain; charset="UTF-8"

Hi!

On Mon, Jul 3, 2017 at 10:02 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> The 17.1.2 release has changed the platform setting and when not
> explicitly disabled it assumes x11 support.
>
> Fixes:
>
> | checking for x11-xcb xcb xcb-dri2 >= 1.8 xcb-xfixes... no
> | configure: error: Package requirements (x11-xcb xcb xcb-dri2 >= 1.8
> xcb-xfixes) were not met:
> |
> | No package 'x11-xcb' found
> | No package 'xcb' found
> | No package 'xcb-dri2' found
> | No package 'xcb-xfixes' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables XCB_DRI2_CFLAGS
> | and XCB_DRI2_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
>
> The issue has been exposed by meta-freescale BSP. Fix tested with
> imx6qsabresd machine.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v2:
> - new patch
>
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 41747cffc8..a12ab7ab5b 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -49,7 +49,7 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2,
> --disable-gles1 --disable-
>  EGL_PLATFORMS  = "drm"
>  EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11',
> '', d)}"
>  EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland',
> ',wayland', '', d)}"
> -PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS},
> --disable-egl"
> +PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS},
> --disable-egl --with-platforms=''"
>
>  PACKAGECONFIG[etnaviv] = ""
>  PACKAGECONFIG[imx] = ""
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


After merging this patch (as per current poky master), builds for
MACHINE=raspberrypi3 with meta-raspberrypi fail complaining like this:

| checking for x11 xext xdamage >= 1.1 xfixes x11-xcb xcb xcb-glx >= 1.8.1
xcb-dri2 >= 1.8 xxf86vm... yes
| checking for wayland-scanner... no
| configure: error: Building without the x11 platform as GLX is enabled, is
not supported
| NOTE: The following config.log files may provide further information.
| NOTE:
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.1.4-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_17.
1.4-r0/temp/log.do_configure.11176)

I know very little about graphical stacks since I use these systems mostly
headless. Can anyone have a look into it? BTW, without this only commit,
the build runs to the end with no other errors.

--94eb2c1480b8a5fee20553d0171b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi!<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">On Mon=
, Jul 3, 2017 at 10:02 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
The 17.1.2 release has changed the platform setting and when not<br>
explicitly disabled it assumes x11 support.<br>
<br>
Fixes:<br>
<br>
| checking for x11-xcb xcb xcb-dri2 &gt;=3D 1.8 xcb-xfixes... no<br>
| configure: error: Package requirements (x11-xcb xcb xcb-dri2 &gt;=3D 1.8 =
xcb-xfixes) were not met:<br>
|<br>
| No package &#39;x11-xcb&#39; found<br>
| No package &#39;xcb&#39; found<br>
| No package &#39;xcb-dri2&#39; found<br>
| No package &#39;xcb-xfixes&#39; found<br>
|<br>
| Consider adjusting the PKG_CONFIG_PATH environment variable if you<br>
| installed software in a non-standard prefix.<br>
|<br>
| Alternatively, you may set the environment variables XCB_DRI2_CFLAGS<br>
| and XCB_DRI2_LIBS to avoid the need to call pkg-config.<br>
| See the pkg-config man page for more details.<br>
<br>
The issue has been exposed by meta-freescale BSP. Fix tested with<br>
imx6qsabresd machine.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- new patch<br>
<br>
=C2=A0meta/recipes-graphics/mesa/<wbr>mesa.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/recipes-graphi=
cs/mesa/<wbr>mesa.inc<br>
index 41747cffc8..a12ab7ab5b 100644<br>
--- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
@@ -49,7 +49,7 @@ PACKAGECONFIG[gles] =3D &quot;--enable-gles1 --enable-gle=
s2, --disable-gles1 --disable-<br>
=C2=A0EGL_PLATFORMS=C2=A0 =3D &quot;drm&quot;<br>
=C2=A0EGL_PLATFORMS .=3D&quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&=
#39;, &#39;x11&#39;, &#39;,x11&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0EGL_PLATFORMS .=3D&quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&=
#39;, &#39;wayland&#39;, &#39;,wayland&#39;, &#39;&#39;, d)}&quot;<br>
-PACKAGECONFIG[egl] =3D &quot;--enable-egl --with-platforms=3D${EGL_<wbr>PL=
ATFORMS}, --disable-egl&quot;<br>
+PACKAGECONFIG[egl] =3D &quot;--enable-egl --with-platforms=3D${EGL_<wbr>PL=
ATFORMS}, --disable-egl --with-platforms=3D&#39;&#39;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[imx] =3D &quot;&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">After merging this patch (as per current po=
ky master), builds for MACHINE=3Draspberrypi3 with meta-raspberrypi fail co=
mplaining like this:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_extra">| checking for x11 xext xdamage=
 &gt;=3D 1.1 xfixes x11-xcb xcb xcb-glx &gt;=3D 1.8.1 xcb-dri2 &gt;=3D 1.8 =
xxf86vm... yes</div><div class=3D"gmail_extra">| checking for wayland-scann=
er... no</div><div class=3D"gmail_extra">| configure: error: Building witho=
ut the x11 platform as GLX is enabled, is not supported</div><div class=3D"=
gmail_extra">| NOTE: The following config.log files may provide further inf=
ormation.</div><div class=3D"gmail_extra">| NOTE: /home/gizero/work/smartli=
ving/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-linu=
x-gnueabi/mesa-gl/2_17.1.4-r0/build/config.log</div><div class=3D"gmail_ext=
ra">| ERROR: configure failed</div><div class=3D"gmail_extra">| WARNING: ex=
it code 1 from a shell command.</div><div class=3D"gmail_extra">| ERROR: Fu=
nction failed: do_configure (log file is located at /home/gizero/work/smart=
living/distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-li=
nux-gnueabi/mesa-gl/2_17.</div><div class=3D"gmail_extra">1.4-r0/temp/log.d=
o_configure.11176)</div></div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">I know very little about graphical stacks since I use th=
ese systems mostly headless. Can anyone have a look into it? BTW, without t=
his only commit, the build runs to the end with no other errors.</div></div=
>

--94eb2c1480b8a5fee20553d0171b--
