Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1602471C9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:32:18 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n204so119662507qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/BGWPfVnbaUspVzNNsFEwqrQJAPGG4SYYH5T/QUczFo=;
	b=rbxbVIymmMyXnscre2ZjHR7G+Cb9MRWELALhNevQVjjIp1vIVG6PaAczszQc1I6/NO
	hO0v4kQlzIf3ldU0sUDN2U//qaQ+Ld8PKoUMBFH3Wx7ej4WGwWKfNj2rclHCpiZy+F0x
	LtQvGtFd5o2R7qahbi1EDzD2ufIUaeUoBXvjl5OwZDBC0Xpeg+zaf/13CYPc8K0Q+PyC
	2EQaKDZOjjd6GXCnpupvcxgPSAAe9QPeCMrrnBpu0dt174335g2jQ77p55h7O3DUpoDP
	hHvFjoZKlt9oOWHxS8N3ZQnGp5agvZPZdQYW/wJYcfVnSAyCMwA8+TzSdxCBvquzQ+H4
	hkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/BGWPfVnbaUspVzNNsFEwqrQJAPGG4SYYH5T/QUczFo=;
	b=gmF3JELDYUVlu3SDVEy/vLevJ68ziUNhk+EdvXmVCIz7sg4G8862NizXvCS/TOkFAK
	S8jW8Y0BS9gNI8K1adnv2NIrJDKYeQpDhlZAE807OPRvboD1PG0unSI7jtdOVaO/KpZN
	u+MYq8o7k5slCNe5ArmUzOtZajYVJ8bYXpNNaDJfN/H2g3kji9e0lZdfgMKmhD3E47/W
	U8gJihPD0O/xKVDb/dJI7vzIz9R9ytyXHCKfb42UkR7dkdic8+oULHCfGUigzDeha3BD
	kqSEwKv+YwIlNgVnARAiAdiWTiTKFTaWTs1uLfwSJuAkSug+udYwdZzoJedlcDBM/JLP
	KaJQ==
X-Gm-Message-State: AKaTC01cht3NjnWbaP3VDitklGdjTdzi6Bp1tF4zpS67wzZ8HQ0bGSOM740hrlwDam2df3C9FoqcJKpc2KdW2vIq
X-Received: by 10.55.31.157 with SMTP id n29mr14594609qkh.221.1481643140060;
	Tue, 13 Dec 2016 07:32:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 07:31:59 -0800 (PST)
In-Reply-To: <1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 15:31:59 +0000
Message-ID: <CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 15:32:19 -0000
Content-Type: multipart/alternative; boundary=001a1147f2280c4aed05438bedb6

--001a1147f2280c4aed05438bedb6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I finally merged the sdl/wayland bits of this series but libsdl2 fails for
me:

|   GEN    gen/wayland-client-protocol.h
| /bin/bash: client-header: command not found
| /bin/bash: client-header: command not found

Ross

On 6 December 2016 at 00:19, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> * add sysroot prefix to wayland core protocols
> * do not use pkg-config to find wayland-scanner
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...-sysroot-path-so-that-make-finds-our-wayl.patch |  8 +++---
>  ...void-finding-build-host-s-wayland-scanner.patch | 31
> ++++++++++++++++++++++
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  1 +
>  3 files changed, 37 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-graphics/libsdl2/
> libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
> b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
> index d042430..efc8418 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-
> our-sysroot-path-so-that-make-finds-our-wayl.patch
> @@ -11,18 +11,20 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>  ---
> - configure.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + configure.in | 4 +-
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.in b/configure.in
>  index 726ded3..3376600 100644
>  --- a/configure.in
>  +++ b/configure.in
>  @@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch],
> [QtWayland server support for
> +                 WAYLAND_CFLAGS=3D`$PKG_CONFIG --cflags wayland-client
> wayland-egl wayland-cursor xkbcommon`
>                   WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client
> wayland-egl wayland-cursor xkbcommon`
>                   WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner
> wayland-scanner`
> -                 WAYLAND_CORE_PROTOCOL_DIR=3D`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-client`
> +-                WAYLAND_CORE_PROTOCOL_DIR=3D`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-client`
>  -                WAYLAND_PROTOCOLS_DIR=3D`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`
> ++                WAYLAND_CORE_PROTOCOL_DIR=3D${
> WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir
> wayland-client`
>  +                WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`
>                   video_wayland=3Dyes
>               fi
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-
> finding-build-host-s-wayland-scanner.patch b/meta/recipes-graphics/
> libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-scanner.patch
> new file mode 100644
> index 0000000..7837315
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-
> finding-build-host-s-wayland-scanner.patch
> @@ -0,0 +1,31 @@
> +From ae879091cf65cb70293b375ec7e61ed12a96d8a7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Fri, 2 Dec 2016 09:39:25 +0100
> +Subject: [PATCH] Avoid finding build host's wayland-scanner
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + configure.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 3376600..2aa6ed4 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch],
> [QtWayland server support for
> +             if $PKG_CONFIG --exists wayland-client wayland-scanner
> wayland-protocols wayland-egl wayland-cursor egl xkbcommon ; then
> +                 WAYLAND_CFLAGS=3D`$PKG_CONFIG --cflags wayland-client
> wayland-egl wayland-cursor xkbcommon`
> +                 WAYLAND_LIBS=3D`$PKG_CONFIG --libs wayland-client
> wayland-egl wayland-cursor xkbcommon`
> +-                WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dwayland_sca=
nner
> wayland-scanner`
> ++                AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> +                 WAYLAND_CORE_PROTOCOL_DIR=3D${
> WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir
> wayland-client`
> +                 WAYLAND_PROTOCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR=
}`$PKG_CONFIG
> --variable=3Dpkgdatadir wayland-protocols`
> +                 video_wayland=3Dyes
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> index bb75316..606e6fb 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D " \
>      http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>      file://linkage.patch \
>      file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.pat=
ch
> \
> +    file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
>  "
>
>  S =3D "${WORKDIR}/SDL2-${PV}"
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147f2280c4aed05438bedb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I finally merged the sdl/wayland bits of this series but l=
ibsdl2 fails for me:<div><br></div><div><div>| =C2=A0 GEN =C2=A0 =C2=A0gen/=
wayland-client-protocol.h</div><div>| /bin/bash: client-header: command not=
 found</div><div>| /bin/bash: client-header: command not found</div></div><=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 6 December 2016 at 00:19, Andreas M=C3=BCller <span di=
r=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_bl=
ank">schnitzeltony@googlemail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">* add sysroot prefix to wayland core protocols<br>
* do not use pkg-config to find wayland-scanner<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0...-sysroot-path-so-that-make-<wbr>finds-our-wayl.patch |=C2=A0 8 +++=
---<br>
=C2=A0...void-finding-build-host-s-<wbr>wayland-scanner.patch | 31 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libsdl2_2.0.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A03 files changed, 37 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libsdl2/<wbr>libsdl2/0002-Av=
oid-finding-<wbr>build-host-s-wayland-scanner.<wbr>patch<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>o=
ur-sysroot-path-so-that-make-<wbr>finds-our-wayl.patch b/meta/recipes-graph=
ics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>our-sysroot-path-so-that-make-<w=
br>finds-our-wayl.patch<br>
index d042430..efc8418 100644<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>our-sysr=
oot-path-so-that-make-<wbr>finds-our-wayl.patch<br>
+++ b/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0001-prepend-<wbr>our-sysr=
oot-path-so-that-make-<wbr>finds-our-wayl.patch<br>
@@ -11,18 +11,20 @@ Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzelton=
y@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
=C2=A0---<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 4 +-<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
=C2=A0index 726ded3..3376600 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-<wbr>video-wayland-qt-=
touch], [QtWayland server support for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CFLA=
GS=3D`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcom=
mon`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_LIBS=
=3D`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_SCAN=
NER=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayland-scanner`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CORE=
_PROTOCOL_DIR=3D`$<wbr>PKG_CONFIG --variable=3Dpkgdatadir wayland-client`<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_CORE_PROT=
OCOL_DIR=3D`$<wbr>PKG_CONFIG --variable=3Dpkgdatadir wayland-client`<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROT=
OCOLS_DIR=3D`$PKG_<wbr>CONFIG --variable=3Dpkgdatadir wayland-protocols`<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_CORE_PROT=
OCOL_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --variabl=
e=3Dpkgdatadir wayland-client`<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_PROT=
OCOLS_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --variab=
le=3Dpkgdatadir wayland-protocols`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 video_waylan=
d=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0002-Avoid-<wbr>fin=
ding-build-host-s-wayland-<wbr>scanner.patch b/meta/recipes-graphics/<wbr>l=
ibsdl2/libsdl2/0002-Avoid-<wbr>finding-build-host-s-wayland-<wbr>scanner.pa=
tch<br>
new file mode 100644<br>
index 0000000..7837315<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>libsdl2/libsdl2/0002-Avoid-<wbr>finding-bu=
ild-host-s-wayland-<wbr>scanner.patch<br>
@@ -0,0 +1,31 @@<br>
+From ae879091cf65cb70293b375ec7e61e<wbr>d12a96d8a7 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
+Date: Fri, 2 Dec 2016 09:39:25 +0100<br>
+Subject: [PATCH] Avoid finding build host&#39;s wayland-scanner<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
+index 3376600..2aa6ed4 100644<br>
+--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
++++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
+@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-<wbr>video-wayland-qt-touch=
], [QtWayland server support for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if $PKG_CONFIG --exists wa=
yland-client wayland-scanner wayland-protocols wayland-egl wayland-cursor e=
gl xkbcommon ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CFLA=
GS=3D`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcom=
mon`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_LIBS=
=3D`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WAYLAND_SCANNER=
=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayland-scanner`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([WAY=
LAND_SCANNER]<wbr>, [wayland-scanner])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_CORE=
_PROTOCOL_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --va=
riable=3Dpkgdatadir wayland-client`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_DIR=3D${<wbr>WAYLAND_PROTOCOLS_SYSROOT_DIR}<wbr>`$PKG_CONFIG --variab=
le=3Dpkgdatadir wayland-protocols`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0video_waylan=
d=3Dyes<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2=
.0.5.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a> b/meta/r=
ecipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
index bb75316..606e6fb 100644<br>
--- a/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>libsdl2/<a href=3D"http://libsdl2_2.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.libsdl.org/release/SDL2-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">http://www.libsdl.org/release/<wb=
r>SDL2-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://linkage.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-prepend-our-<wbr>sysroot-path-so-that-make-=
<wbr>finds-our-wayl.patch \<br>
+=C2=A0 =C2=A0 file://0002-Avoid-finding-<wbr>build-host-s-wayland-scanner.=
<wbr>patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/SDL2-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
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

--001a1147f2280c4aed05438bedb6--
