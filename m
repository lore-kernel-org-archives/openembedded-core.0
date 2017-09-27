Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A16F65D00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:11:57 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id w94so16572726ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1MLdvR9igVlvWWggA04uW+VSgbJ45mp/6t4hD36/GlA=;
	b=0dzXe1pp2eVt7s6nz6wogmV/kPGrOMGPNOhGrg9ZufsrBUs9deTrm+lUlP1Ez1+G1O
	n4TusbKcSqqDBoqIt8qu4g8pG4HYlp9RbceWloUsxEfmXWJQ4aavXyJfQnz31vyn0V6K
	H87ett2cz8e1gDaaCh9KebP57gDbTDOqtOtl/8ChF4/KJpiETXeAcWe+0LbKB8ksWcn8
	iLijy7Xw8gHzSXzywBsz6/jovLW26uLYuy65oKLi02ux7hzaxmn0kKBlFE1uayzRTMFg
	z/ow0h2CvTd5lowoePBdnHvKqOKXsGug2C9CJ8oKg8/Hc7bxM9ZSVTv7ZYKE4CZPNUmT
	7Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1MLdvR9igVlvWWggA04uW+VSgbJ45mp/6t4hD36/GlA=;
	b=d8PqU6RhuRwwn3rX6dLgF1WFJRhLpZnFibUdnlzoXCuef6SG+GccfWfqvK+zxN9gaH
	Gw4AR+DXWSOB62mo271ATBi1OAEPCMxc95iryALaOK4gG7G0IGLmTrz5MvRo/ljwbtj1
	8rBVTLRp4ia2MMI661cwTDi3iSjxdlKqturCVPMExfp09eITDmQVeDAvnjVGgXBtnc7t
	/LONgQFCQnq1tN38OQt47z7fSJv8REPNC0F2lU3Miu5McE5PAL77fUQr6SpkhaBxOa6j
	SuYvhpgUAl2FTTSQ3PEZlTppXuf/6O1Pnsbi4Gj35pQME9SbYzUzdzQxem6wmBbCuPg7
	FhVg==
X-Gm-Message-State: AMCzsaVltQPmyfuh3RnAhLXV97qjEHcAVubh0YpFUIkuZQBaBmxQ3+wY
	IKGMXNAlxk0FGaT/vNsL/CAr3laLpAFDZVyx6bnGTJJy
X-Google-Smtp-Source: AOwi7QCyvW2+BW9gaWkUKlafLPU2hPDzWDRu4ht9fuTIQENrjqoS5uXwjlgbOKPawz+pEtAGCEPFZa2Auh+Ui7WIcJI=
X-Received: by 10.107.32.70 with SMTP id g67mr3732936iog.77.1506539518804;
	Wed, 27 Sep 2017 12:11:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 12:11:38 -0700 (PDT)
In-Reply-To: <20170927131426.4037-2-fabien.lahoudere@collabora.co.uk>
References: <20170927131426.4037-1-fabien.lahoudere@collabora.co.uk>
	<20170927131426.4037-2-fabien.lahoudere@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 20:11:38 +0100
Message-ID: <CAJTo0LbRLkqJMgvH0wZczZWXYBjFb5LpFFh+mL3ox7S7qPiRZA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Wed, 27 Sep 2017 19:11:58 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2cdc2a19055a30906a"

--001a1140ae2cdc2a19055a30906a
Content-Type: text/plain; charset="UTF-8"

libsdl2 doesn't build for me:

| /bin/bash ../SDL2-2.0.5/build-scripts/mkinstalldirs build
| make: *** No rule to make target '/usr/share/wayland/wayland.xml', needed
by 'gen/wayland-client-protocol.h'.  Stop.

Do you have wayland-protocols on your build host?

Ross

On 27 September 2017 at 14:14, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> This patch also remove workaround to find wayland-protocols:
>
> WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}
>
> in:
>
> - gtk+3
> - libsdl2
> - xserver-xorg
> - gstreamer1.0-plugins-bad
> - weston-2.0.0
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc                  |  1 -
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  2 +-
>  .../usesysrootprefixforpkgdatadirvariable.patch    | 27
> ++++++++++++++++++++++
>  .../wayland/wayland-protocols_1.10.bb              |  1 +
>  meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 -
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
>  .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
>  7 files changed, 29 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/
> usesysrootprefixforpkgdatadirvariable.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
> b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 0a357db049..420ead2ca2 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -35,7 +35,6 @@ EXTRA_OECONF += " \
>                   --enable-modules \
>                   --disable-cups \
>                   --disable-colord \
> -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
>                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "",
> "--disable-gtk-doc", d)} \
>                   "
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> index 12d3aaf6f0..6bfa13200b 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -35,7 +35,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd
> --disable-arts \
>                  --enable-pthreads \
>                  --enable-sdl-dlopen \
>                  --disable-rpath \
> -                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
> +                "
>
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols/
> usesysrootprefixforpkgdatadirvariable.patch b/meta/recipes-graphics/
> wayland/wayland-protocols/usesysrootprefixforpkgdatadirvariable.patch
> new file mode 100644
> index 0000000000..0922a4d2c2
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland-protocols/
> usesysrootprefixforpkgdatadirvariable.patch
> @@ -0,0 +1,27 @@
> +From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001
> +From: Tomek Bury <tomek.bury@broadcom.com>
> +Date: Fri, 4 Aug 2017 16:16:38 +0100
> +Subject: Use sysroot prefix for pkgdatadir variable
> +
> +The pc_sysroot is automatically added to cflags and libs but not
> +to 'pkg-config --variable'
> +
> +Upstream-Status: Backport [https://cgit.freedesktop.org/
> wayland/wayland-protocols/commit/?id=875130ee3cbcf62266901ef4b91b9a
> 0fb6adad43]
> +
> +Reviewed-by: Daniel Stone <daniels@collabora.com>
> +
> +diff --git a/wayland-protocols.pc.in b/wayland-protocols.pc.in
> +index a26744c..379be06 100644
> +--- a/wayland-protocols.pc.in
> ++++ b/wayland-protocols.pc.in
> +@@ -1,6 +1,6 @@
> + prefix=@prefix@
> + datarootdir=@datarootdir@
> +-pkgdatadir=@datadir@/@PACKAGE@
> ++pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
> +
> + Name: Wayland Protocols
> + Description: Wayland protocol files
> +--
> +cgit v0.10.2
> +
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> index 4f9e9f32bf..1ff12c607b 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> c7b12b6702da38ca028ace54aae3d484 \
>                      file://stable/presentation-
> time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc
> 53"
>
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> +          file://usesysrootprefixforpkgdatadirvariable.patch \
>             "
>  SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
>  SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a
> 72ac99229e2b460c4bb10513de08839c0a"
> diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> index 54b07bd6b9..8160f5556d 100644
> --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> @@ -25,7 +25,6 @@ DEPENDS += "wayland wayland-protocols libinput
> virtual/egl pango wayland-native"
>
>  EXTRA_OECONF = "--enable-setuid-install \
>                  --disable-rdp-compositor \
> -                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
>                  "
>  EXTRA_OECONF_append_qemux86 = "\
>                 WESTON_NATIVE_BACKEND=fbdev-backend.so \
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 863d80ce43..e8025de55f 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -117,7 +117,6 @@ EXTRA_OECONF += "--with-fop=no \
>                   --sysconfdir=/etc/X11 \
>                   --localstatedir=/var \
>                   --with-xkb-output=/var/lib/xkb \
> -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
>  "
>
>  OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-bad_1.12.2.bb
> index 8321da0c27..a83a5bab21 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
> @@ -22,5 +22,4 @@ SRC_URI[sha256sum] = "9c2c7edde4f59d74eb414e0701c551
> 31f562e5c605a3ce9b091754f106
>
>  S = "${WORKDIR}/gst-plugins-bad-${PV}"
>
> -EXTRA_OECONF += "WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140ae2cdc2a19055a30906a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">libsdl2 doesn&#39;t build for me:<div><br></div><div><div>=
| /bin/bash ../SDL2-2.0.5/build-scripts/mkinstalldirs build</div><div>| mak=
e: *** No rule to make target &#39;/usr/share/wayland/wayland.xml&#39;, nee=
ded by &#39;gen/wayland-client-protocol.h&#39;.=C2=A0 Stop.</div></div><div=
><br></div><div>Do you have wayland-protocols on your build host?</div><div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 27 September 2017 at 14:14, Fabien Lahoudere <span dir=
=3D"ltr">&lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=3D"=
_blank">fabien.lahoudere@collabora.co.uk</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">This patch also remove workaround to find wayland-pro=
tocols:<br>
<br>
WAYLAND_PROTOCOLS_SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT}<br>
<br>
in:<br>
<br>
- gtk+3<br>
- libsdl2<br>
- xserver-xorg<br>
- gstreamer1.0-plugins-bad<br>
- weston-2.0.0<br>
<br>
Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@coll=
abora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gtk+/gtk+3.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libsdl2_2.0.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0.../<wbr>usesysrootprefixforpkgdatadirv<wbr>ariable.patch=C2=A0 =C2=
=A0 | 27 ++++++++++++++++++++++<br>
=C2=A0.../wayland/<a href=3D"http://wayland-protocols_1.10.bb" rel=3D"noref=
errer" target=3D"_blank">wayland-protocols_<wbr>1.10.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>weston_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 -<br>
=C2=A0.../recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc |=C2=A0 1 -<b=
r>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb=
</a>=C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A07 files changed, 29 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/<wbr>wayland-protoco=
ls/<wbr>usesysrootprefixforpkgdatadirv<wbr>ariable.patch<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+<wbr>3.inc b/meta/recipes-gnome/gt=
k+/gtk+<wbr>3.inc<br>
index 0a357db049..420ead2ca2 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+<wbr>3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+<wbr>3.inc<br>
@@ -35,7 +35,6 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-mod=
ules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-cu=
ps \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-co=
lord \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.=
contains(&quot;DISTRO_<wbr>FEATURES&quot;, &quot;x11&quot;, &quot;&quot;, &=
quot;--disable-gtk-doc&quot;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a> b/meta/r=
ecipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
index 12d3aaf6f0..6bfa13200b 100644<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
@@ -35,7 +35,7 @@ EXTRA_OECONF =3D &quot;--disable-oss --disable-esd --disa=
ble-arts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-pthr=
eads \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-sdl-=
dlopen \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rpa=
th \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS_=
SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# opengl packageconfig factored out to make it easy for distros<br>
=C2=A0# and BSP layers to pick either (desktop) opengl, gles2, or no GL<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/wayland-protocols/<wbr>uses=
ysrootprefixforpkgdatadirv<wbr>ariable.patch b/meta/recipes-graphics/<wbr>w=
ayland/wayland-protocols/<wbr>usesysrootprefixforpkgdatadirv<wbr>ariable.pa=
tch<br>
new file mode 100644<br>
index 0000000000..0922a4d2c2<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>wayland/wayland-protocols/<wbr>usesysrootp=
refixforpkgdatadirv<wbr>ariable.patch<br>
@@ -0,0 +1,27 @@<br>
+From 875130ee3cbcf62266901ef4b91b9a<wbr>0fb6adad43 Mon Sep 17 00:00:00 200=
1<br>
+From: Tomek Bury &lt;<a href=3D"mailto:tomek.bury@broadcom.com">tomek.bury=
@broadcom.com</a>&gt;<br>
+Date: Fri, 4 Aug 2017 16:16:38 +0100<br>
+Subject: Use sysroot prefix for pkgdatadir variable<br>
+<br>
+The pc_sysroot is automatically added to cflags and libs but not<br>
+to &#39;pkg-config --variable&#39;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.freedesktop.org/wayland=
/wayland-protocols/commit/?id=3D875130ee3cbcf62266901ef4b91b9a0fb6adad43" r=
el=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/<wbr>wayla=
nd/wayland-protocols/<wbr>commit/?id=3D<wbr>875130ee3cbcf62266901ef4b91b9a<=
wbr>0fb6adad43</a>]<br>
+<br>
+Reviewed-by: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com">dan=
iels@collabora.com</a>&gt;<br>
+<br>
+diff --git a/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">wayland-protocols.pc.in</a> b/<a href=3D"http://wayland-=
protocols.pc.in" rel=3D"noreferrer" target=3D"_blank">wayland-protocols.pc.=
in</a><br>
+index a26744c..379be06 100644<br>
+--- a/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer" target=
=3D"_blank">wayland-protocols.pc.in</a><br>
++++ b/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer" target=
=3D"_blank">wayland-protocols.pc.in</a><br>
+@@ -1,6 +1,6 @@<br>
+ prefix=3D@prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+-pkgdatadir=3D@datadir@/@<wbr>PACKAGE@<br>
++pkgdatadir=3D${pc_sysrootdir}@<wbr>datadir@/@PACKAGE@<br>
+<br>
+ Name: Wayland Protocols<br>
+ Description: Wayland protocol files<br>
+--<br>
+cgit v0.10.2<br>
+<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland-p=
rotocols_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.=
<wbr>10.bb</a> b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayla=
nd-protocols_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocol=
s_1.<wbr>10.bb</a><br>
index 4f9e9f32bf..1ff12c607b 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland-protocol=
s_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>10=
.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://wayland-protocol=
s_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>10=
.bb</a><br>
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>c7b1=
2b6702da38ca028ace54aae3d4<wbr>84 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://stable/presentation-<wbr>time/presentation-time.xml;<wbr>endline=
=3D26;md5=3D<wbr>4646cd7d9edc9fa55db941f2d3a7dc<wbr>53&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/releases=
/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wayland.=
freedesktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<wbr>usesysrootprefixforpkgdatad=
irv<wbr>ariable.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>84a7846c2b6a6a3e265fc9be36453e<wbr>60&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>5719c51d7354864983171c5083e93a<wbr>=
72ac99229e2b460c4bb10513de0883<wbr>9c0a&quot;<br>
diff --git a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> b/meta/rec=
ipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">weston_2.0.0.bb</a><br>
index 54b07bd6b9..8160f5556d 100644<br>
--- a/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>wayland/<a href=3D"http://weston_2.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
@@ -25,7 +25,6 @@ DEPENDS +=3D &quot;wayland wayland-protocols libinput vir=
tual/egl pango wayland-native&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-setuid-install \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-rdp=
-compositor \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROTOCOLS_=
SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0EXTRA_OECONF_append_qemux86 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WESTON_NATIVE_BACKE=
ND=3Dfbdev-<wbr>backend.so \<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc b/met=
a/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc<br>
index 863d80ce43..e8025de55f 100644<br>
--- a/meta/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc<br>
+++ b/meta/recipes-graphics/xorg-<wbr>xserver/xserver-xorg.inc<br>
@@ -117,7 +117,6 @@ EXTRA_OECONF +=3D &quot;--with-fop=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir=
=3D/etc/X11 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstate=
dir=3D/var \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-xkb-o=
utput=3D/var/lib/xkb \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D<wbr>${RECIPE_SYSROOT} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0OPENGL_PKGCONFIGS =3D &quot;dri glx glamor dri3 xshmfence&quot;<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstream=
er1.0-<wbr>plugins-bad_1.12.2.bb</a> b/meta/recipes-multimedia/<wbr>gstream=
er/<a href=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb</a><br>
index 8321da0c27..a83a5bab21 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-bad_1.12.2.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-bad_1.12.2.bb</a><br>
@@ -22,5 +22,4 @@ SRC_URI[sha256sum] =3D &quot;<wbr>9c2c7edde4f59d74eb414e0=
701c551<wbr>31f562e5c605a3ce9b091754f106<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-bad-${<wbr>PV}&quot;<br>
<br>
-EXTRA_OECONF +=3D &quot;WAYLAND_PROTOCOLS_SYSROOT_<wbr>DIR=3D${RECIPE_SYSR=
OOT}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
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

--001a1140ae2cdc2a19055a30906a--
