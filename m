Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 529A37CCD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 13:52:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id x7so12633522wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 05:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zFPaNIKByMzLHsfmMcCh+zOGBAy9Nx2C6cGxuYyyLdg=;
	b=cbhTVOahN9Eg5r+T3UALzwNXeTwrggUT1AOJqjqpfNR0LpexaOnp9g3xyQ6MZE9GIZ
	de657pAhyxA6fU5ffELHtgkiG1XNMjyCXhvnELoKDcrHNTGtNC6Lyei1QLe0mykAs2Zo
	lS85ZEsMFWRRKIjo+BiBVr1ipu6+WWQ35yUA7OQA/Zv5OI1ee1PhsxJMLXAVOBekF42y
	PMIRVnLOeSIeQfRbZ5HRGQWJmqfdQH/Yd3EZKHh9w133FHCEWRMz/5Ks4wIH+3SSTxZV
	BX3m4diETkUnk3Kt2pcAJ5ZXN8J0MFd4nzxYRX53rh+Axpd7FZJ7Te06OXHb+CcJ5YSK
	bjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zFPaNIKByMzLHsfmMcCh+zOGBAy9Nx2C6cGxuYyyLdg=;
	b=Sv03BwmwPLuGaui8D9tTMgV+Ba92TF4LQFUkYVuiMwl9wWHRw8Myd/6uuK6DSvsXpx
	A5/vhANzKPMstNjdQjWAZ0CqGBytNVaxrxBwwU+d52uuAsAs/ZovrWzB7p1x3k17hIkU
	TJOepLP1WDFb3OKNAB7EzJlkxNJwgEdzC7OEXmCFc2PW06HgImQ6Cm0/lyQncfWjusOV
	cd2zrXGnIlP+UBz9X+jZDBdyNqF2jD9FBrYk233im+u0pSUVEfagdf0A68wYCOv15z8P
	N6yKmslKCb6ugY+EwyKI/sUiml5AHyDm++myr7DriRSk5VQKQ6Di39dRzlKxu8fo2hU1
	pNJA==
X-Gm-Message-State: APjAAAXIc0YmgtSrrwwDiP1BloG04xqTd1e5seWXkVFPFoSdPV8ihhMZ
	9L48egj85G4XT10cT5dnHgAAaXsNg4abmbk9tF8=
X-Google-Smtp-Source: APXvYqyCSWlKChjQlOY6d6BP5W8WLeH2eIzscGgd9uiuFupVhuHbKzNr20XDcz7JeRDqPFU3Voh02EjOh7UF/naPSdg=
X-Received: by 2002:a1c:e1c4:: with SMTP id y187mr9567811wmg.50.1552053156848; 
	Fri, 08 Mar 2019 05:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20190226005221.27806-1-ross.burton@intel.com>
In-Reply-To: <20190226005221.27806-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Mar 2019 14:52:26 +0100
Message-ID: <CA+chaQeB=K=+C6bRJVgxfAYVo9oHLAKmB2t=9PtxBTSVj9HJiQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][thud] mesa: ship /etc/drirc in mesa-megadriver
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
X-List-Received-Date: Fri, 08 Mar 2019 13:52:36 -0000
Content-Type: multipart/alternative; boundary="000000000000162ad4058395891f"

--000000000000162ad4058395891f
Content-Type: text/plain; charset="UTF-8"

Interesting side-effect of this is that mesa package used to ship empty
/etc directory before, now it's empty and not created.

So be aware that if you had image/packagegroup installing mesa package for
whatever reason (by mistake most likely), you'll need to adjust that in
thud.

On Tue, Feb 26, 2019 at 1:52 AM Ross Burton <ross.burton@intel.com> wrote:

> Many years not shipping the stub drirc seemed like a good idea,
> but now it has content and is essential for some applications to run.
>
> Following patches in master, ship this file in mesa-megadriver.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 0cc0a82de49..f47f1aa20d8 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -141,8 +141,6 @@ do_install_append () {
>      rm -f ${D}${libdir}/gallium-pipe/*.la
>      rm -f ${D}${libdir}/gbm/*.la
>
> -    # it was packaged in libdricore9.1.3-1 and preventing upgrades when
> debian.bbclass was used
> -    rm -f ${D}${sysconfdir}/drirc
>      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
>
>      # libwayland-egl has been moved to wayland 1.15+
> @@ -209,8 +207,8 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
>
>  PACKAGES_DYNAMIC += "^mesa-driver-.*"
>
> -FILES_${PN} += "${sysconfdir}/drirc"
> -FILES_mesa-megadriver = "${libdir}/dri/*"
> +FILES_${PN} = ""
> +FILES_mesa-megadriver = "${libdir}/dri/* ${sysconfdir}"
>  FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
>  FILES_libegl-mesa = "${libdir}/libEGL.so.*"
>  FILES_libgbm = "${libdir}/libgbm.so.*"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000162ad4058395891f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Interesting side-effect of this is that mesa package used =
to ship empty /etc directory before, now it&#39;s empty and not created.<di=
v><br></div><div>So be aware that if you had image/packagegroup installing =
mesa package for whatever reason (by mistake most likely), you&#39;ll need =
to adjust that in thud.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Feb 26, 2019 at 1:52 AM Ross Burton &=
lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Many years=
 not shipping the stub drirc seemed like a good idea,<br>
but now it has content and is essential for some applications to run.<br>
<br>
Following patches in master, ship this file in mesa-megadriver.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 6 ++----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 0cc0a82de49..f47f1aa20d8 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -141,8 +141,6 @@ do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}/gallium-pipe/*.la<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}/gbm/*.la<br>
<br>
-=C2=A0 =C2=A0 # it was packaged in libdricore9.1.3-1 and preventing upgrad=
es when debian.bbclass was used <br>
-=C2=A0 =C2=A0 rm -f ${D}${sysconfdir}/drirc<br>
=C2=A0 =C2=A0 =C2=A0chrpath --delete ${D}${libdir}/dri/*_dri.so || true<br>
<br>
=C2=A0 =C2=A0 =C2=A0# libwayland-egl has been moved to wayland 1.15+<br>
@@ -209,8 +207,8 @@ PACKAGESPLITFUNCS_prepend =3D &quot;mesa_populate_packa=
ges &quot;<br>
<br>
=C2=A0PACKAGES_DYNAMIC +=3D &quot;^mesa-driver-.*&quot;<br>
<br>
-FILES_${PN} +=3D &quot;${sysconfdir}/drirc&quot;<br>
-FILES_mesa-megadriver =3D &quot;${libdir}/dri/*&quot;<br>
+FILES_${PN} =3D &quot;&quot;<br>
+FILES_mesa-megadriver =3D &quot;${libdir}/dri/* ${sysconfdir}&quot;<br>
=C2=A0FILES_mesa-vulkan-drivers =3D &quot;${libdir}/libvulkan_*.so ${datadi=
r}/vulkan&quot;<br>
=C2=A0FILES_libegl-mesa =3D &quot;${libdir}/libEGL.so.*&quot;<br>
=C2=A0FILES_libgbm =3D &quot;${libdir}/libgbm.so.*&quot;<br>
-- <br>
2.11.0<br>
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

--000000000000162ad4058395891f--
