Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F4AC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 05:45:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.44577.1747633524668564722
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 22:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 04C021360;
	Mon, 19 May 2025 07:45:22 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.37.6]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGtJO-0gcIwy0; Mon, 19 May 2025 07:45:18 +0200
Date: Mon, 19 May 2025 07:45:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/2] mesa: update 25.0.5 -> 25.1.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <DNUHWS.X4OGET36CNFR2@t-online.de>
In-Reply-To: <CA+chaQdCGhrx5NJUuo_4PCz6-x9x8-YMnme1SSYnqoOA4i_6gQ@mail.gmail.com>
References: <20250518161010.1879511-1-f_l_k@t-online.de>
	<CA+chaQdCGhrx5NJUuo_4PCz6-x9x8-YMnme1SSYnqoOA4i_6gQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-z3jpahED3m+wH3yGUcXl"
X-TOI-EXPURGATEID: 150726::1747633518-6AFFB5CE-DD0C5B1B/0/0 CLEAN NORMAL
X-TOI-MSGID: a92cfc41-df13-4062-84df-ada975e03441
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 05:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216818

--=-z3jpahED3m+wH3yGUcXl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

No, thanks, this was by mistake. I will send a v2

On Sun, May 18 2025 at 19:41:27 +02:00:00, Martin Jansa=20
<martin.jansa@gmail.com> wrote:
> On Sun, May 18, 2025 at 6:10=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  - drop two merged patches
>>  - clover frontend is always compiled, even if not enabled
>>    clover is deprecated and was removed in master branch
>>    add a patch to fix that
>>  - install gbm_backend_abi.h
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
> ....
>>  diff --git a/meta/recipes-graphics/mesa/mesa.inc=20
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  index 288027bbb9..47edf0d512 100644
>>  --- a/meta/recipes-graphics/mesa/mesa.inc
>>  +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  @@ -17,13 +17,11 @@ PE =3D "2"
>>   SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz=20
>> <https://archive.mesa3d.org/mesa-$%7BPV%7D.tar.xz> \
>>             =20
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=20
>> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>>             =20
>> file://0001-freedreno-don-t-encode-build-path-into-binaries.patch=20
>> <file://0001-freedreno-don-t-encode-build-path-into-binaries.patch/>=20
>> \
>>  -          =20
>> file://0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch=20
>> <file://0001-mesa-clc-add-an-option-to-force-inclusion-of-opencl-.patch/=
>=20
>> \
>>  -           file://0001-clover-Don-t-include-libclc-headers.patch=20
>> <file://0001-clover-don-t-include-libclc-headers.patch/> \
>>  -          =20
>> file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch=20
>> <file://0001-gallium-clover-do-not-use-llvm_library_dir-for-fallb.patch/=
>=20
>> \
>>  +           file://0001-dont-build-clover-frontend.patch=20
>> <file://0001-dont-build-clover-frontend.patch/> \
>>   "
>>=20
>>  -SRC_URI[sha256sum] =3D=20
>> "c0d245dea0aa4b49f74b3d474b16542e4a8799791cd33d676c69f650ad4378d0"
>>  -PV =3D "25.0.5"
>>  +SRC_URI[sha256sum] =3D=20
>> "b1c45888969ee5df997e2542654f735ab1b772924b442f3016d2293414c99c14"
>>  +PV =3D "25.1.0"
>>=20
>>   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>=20
>>  @@ -343,7 +341,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*=20
>> ${datadir}/drirc.d"
>>   FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so=20
>> ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
>>   FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>>   FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*=20
>> ${datadir}/glvnd/egl_vendor.d"
>>  -FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
>>  +FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so=20
>> ${includedir}/gbm_backend_abi.h"
>>   FILES:libgallium =3D "${libdir}/libgallium-*.so"
>>   FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>>   FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>=20
> Is there a reason for gbm_backend_abi.h to be packaged in libgbm
> instead of -dev package?


--=-z3jpahED3m+wH3yGUcXl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>No, thanks, this was by mistake. I=
 will send a v2</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sun,=
 May 18 2025 at 19:41:27 +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com=
&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"=
white-space: break-spaces;">On Sun, May 18, 2025 at 6:10=E2=80=AFPM Markus =
Volk via lists.openembedded.org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 - drop two merged patches
 - clover frontend is always compiled, even if not enabled
   clover is deprecated and was removed in master branch
   add a patch to fix that
 - install gbm_backend_abi.h

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
</blockquote>....
<blockquote> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipe=
s-graphics/mesa/mesa.inc
 index 288027bbb9..47edf0d512 100644
 --- a/meta/recipes-graphics/mesa/mesa.inc
 +++ b/meta/recipes-graphics/mesa/mesa.inc
 @@ -17,13 +17,11 @@ PE =3D "2"
  SRC_URI =3D "<a href=3D"https://archive.mesa3d.org/mesa-${PV}.tar.xz">htt=
ps://archive.mesa3d.org/mesa-${PV}.tar.xz</a> \
             <a href=3D"file://0001-meson-misdetects-64bit-atomics-on-mips-=
clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=
</a> \
             <a href=3D"file://0001-freedreno-don-t-encode-build-path-into-=
binaries.patch">file://0001-freedreno-don-t-encode-build-path-into-binaries=
.patch</a> \
 -           <a href=3D"file://0001-mesa-clc-add-an-option-to-force-inclusi=
on-of-OpenCL-.patch">file://0001-mesa-clc-add-an-option-to-force-inclusion-=
of-OpenCL-.patch</a> \
 -           <a href=3D"file://0001-clover-Don-t-include-libclc-headers.pat=
ch">file://0001-clover-Don-t-include-libclc-headers.patch</a> \
 -           <a href=3D"file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_=
DIR-for-FALLB.patch">file://0001-gallium-clover-Do-not-use-LLVM_LIBRARY_DIR=
-for-FALLB.patch</a> \
 +           <a href=3D"file://0001-dont-build-clover-frontend.patch">file:=
//0001-dont-build-clover-frontend.patch</a> \
  "

 -SRC_URI[sha256sum] =3D "c0d245dea0aa4b49f74b3d474b16542e4a8799791cd33d676=
c69f650ad4378d0"
 -PV =3D "25.0.5"
 +SRC_URI[sha256sum] =3D "b1c45888969ee5df997e2542654f735ab1b772924b442f301=
6d2293414c99c14"
 +PV =3D "25.1.0"

  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"

 @@ -343,7 +341,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/=
drirc.d"
  FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpowe=
rvr_rogue.so ${datadir}/vulkan"
  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor=
.d"
 -FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
 +FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so ${included=
ir}/gbm_backend_abi.h"
  FILES:libgallium =3D "${libdir}/libgallium-*.so"
  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
</blockquote>
Is there a reason for gbm_backend_abi.h to be packaged in libgbm
instead of -dev package?
</div></blockquote></div>
--=-z3jpahED3m+wH3yGUcXl--


