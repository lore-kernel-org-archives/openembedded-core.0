Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 436036006E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 16:16:26 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 4so7203783itv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZDbXmZy3/GoTKDen5VNce328HB/TBdOjQ9iY4zBWXVo=;
	b=NDCFfAJyMu9VLJ9mRebgYJtDKkaQfYsCRvpY6q4WQG2CZaY3ruuqg8KHlhGN0s3iV+
	um8mrNdEPti/UIcvdOClAyaz2/vnVtM/4lcVJCmGfb4boa93GIpQ46AnTAdaMQMQ2Lg6
	IHxElp9Gi8F8fPc4FWqFvGAi6yLCE2a5qh8YwSdd9p5DQptznIQIBrdyinLbCy+JzreR
	JA5fwTei5cmzdOR1g4TiPX7coCiH+iX8oNa/AQ/rp4yMde21TVz0ouOiSaF2Hr+6FaF3
	gcUvzIY2oNa8J3M2INw4idlyx/NkIfQpH4vQZc1IKqekSIhhdyMEoXN6ANd20rvw8Z79
	lofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZDbXmZy3/GoTKDen5VNce328HB/TBdOjQ9iY4zBWXVo=;
	b=Z0tFx+Siz43oJi7KMF7xNI1dzBToYKCYKrMO6oWZU/I0F9s5bYaXKnhIjhE+60je+f
	Pi6OR59FDZwWycNrkEyYhRmB+8oTjneCwCro7Qa6uXQ6MxLQ/xWEqzwH7eZfEFGqIDj3
	Z2b/Aa5ggVphyDqeHeftUa34MfQxhayp6wcQA8ZUhjfET7Oamm1kE115PPqqbG3R8edp
	J5Oj0RCUXfITwTnKGxBZ+g6O+bVXnsSwBKf4kB3qoURsQbzkfPM9raEtkLmTCdSN9+bh
	O4XO/JwVfNAa0SWCMkdqA9nT6m7EDOx3bapyHGB74V2hZj7Kkg4jQ9PdGzpHbbVuHA+c
	uExA==
X-Gm-Message-State: AHPjjUiG5LBUmaqJAOjjd06J3RIrs7FkAI8w/aMz9qo/cpbW+e1GWvne
	lYHxWbl1Wzcr7mr7ShognFftZiTHsO4NJZxzhlSuYRyg
X-Google-Smtp-Source: AOwi7QCOI3HAd9ll8ICTfMr+/d/u2g6mt5tIkJ/vDZS1JimINtvCliEIeY80PWqfiO85+UaoRYuMR5ZeY1aC+1EgxMU=
X-Received: by 10.36.26.87 with SMTP id 84mr1463611iti.38.1506528988131; Wed,
	27 Sep 2017 09:16:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 09:16:07 -0700 (PDT)
In-Reply-To: <20170922143423.19502-1-otavio@ossystems.com.br>
References: <20170922143423.19502-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 17:16:07 +0100
Message-ID: <CAJTo0LYdSj3LoxWRTkJiG0auMQvqrVzKLe+q-jxV25b8N6UM2A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] OBmesa: Upgrade to 17.2.1 release
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
X-List-Received-Date: Wed, 27 Sep 2017 16:16:27 -0000
Content-Type: multipart/alternative; boundary="001a1144159a2e9103055a2e1dc8"

--001a1144159a2e9103055a2e1dc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm guessing this upgrade actually requires the wayland upgrades?

| make[4]: *** No rule to make target
'/usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v=
1.xml',
needed by 'drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.

Ross

On 22 September 2017 at 15:34, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> Upgrade to a new stable release and drop patches applied on upstream.
>
> For a full release notes, please see:
> https://mesa3d.org/relnotes/17.2.0.html
> https://mesa3d.org/relnotes/17.2.1.html
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This patch has been tested using OE-Core current Wayland as well as v2
> of Fabien patches:
>
>  weston: Bump version to 3.0.0
>  wayland-protocols: Fix installation patch issue
>  wayland : Bump to version 1.14.0
>
> The distro used for test had: opengl, wayland, x11 and vulkan enabled.
>
> Changes in v3:
>  - fix build for wayland
>
> Changes in v2:
>  - update to 17.2.1
>
>  ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40
> ------------------
>  ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49
> ----------------------
>  .../mesa/{mesa-gl_17.1.7.bb =3D> mesa-gl_17.2.1.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc                |  2 +-
>  .../mesa/{mesa_17.1.7.bb =3D> mesa_17.2.1.bb}        |  7 ++--
>  5 files changed, 4 insertions(+), 94 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/
> files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
>  delete mode 100644 meta/recipes-graphics/mesa/
> files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb =3D> mesa-gl_17.2.1=
.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb =3D> mesa_17.2.1.bb}
> (77%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLV=
M-5.0-SVN-r300718.patch
> b/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-
> LLVM-5.0-SVN-r300718.patch
> deleted file mode 100644
> index b27a3bc8e4..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-
> LLVM-5.0-SVN-r300718.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 9861437e58fdd0de01193a102608d34e5952953f Mon Sep 17 00:00:00 2001
> -From: Christoph Haag <haagch+mesadev@frickel.club>
> -Date: Thu, 20 Apr 2017 10:34:18 +0200
> -Subject: [PATCH 1/2] ac: fix build after LLVM 5.0 SVN r300718
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -v2: previously getWithDereferenceableBytes() exists, but addAttr()
> doesn't take that type
> -
> -Signed-off-by: Christoph Haag <haagch+mesadev@frickel.club>
> -Reviewed-by: Nicolai H=C3=A4hnle <nicolai.haehnle@amd.com>
> -Tested-and-reviewed-by: Mike Lothian <mike@fireburn.co.uk>
> ----
> -Upstream-Status: Backport
> -
> - src/amd/common/ac_llvm_helper.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/amd/common/ac_llvm_helper.cpp b/src/amd/common/ac_llvm_
> helper.cpp
> -index d9ea4b1..11fa809 100644
> ---- a/src/amd/common/ac_llvm_helper.cpp
> -+++ b/src/amd/common/ac_llvm_helper.cpp
> -@@ -44,9 +44,13 @@ typedef AttributeSet AttributeList;
> - void ac_add_attr_dereferenceable(LLVMValueRef val, uint64_t bytes)
> - {
> -    llvm::Argument *A =3D llvm::unwrap<llvm::Argument>(val);
> -+#if HAVE_LLVM < 0x0500
> -    llvm::AttrBuilder B;
> -    B.addDereferenceableAttr(bytes);
> -    A->addAttr(llvm::AttributeList::get(A->getContext(), A->getArgNo() +
> 1,  B));
> -+#else
> -+   A->addAttr(llvm::Attribute::getWithDereferenceableBytes(A->getContex=
t(),
> bytes));
> -+#endif
> - }
> -
> - bool ac_is_sgpr_param(LLVMValueRef arg)
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-agai=
nst-LLVM-SVN-r302589.patch
> b/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-
> against-LLVM-SVN-r302589.patch
> deleted file mode 100644
> index ac8caec74d..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-
> against-LLVM-SVN-r302589.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From a02a0dfda2712d30ad62b8f0421ec7b8244ba2cb Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Michel=3D20D=3DC3=3DA4nzer?=3D <michel.daenzer@amd.com=
>
> -Date: Wed, 10 May 2017 17:26:07 +0900
> -Subject: [PATCH 2/2] gallivm: Fix build against LLVM SVN >=3D r302589
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -deregisterEHFrames doesn't take any parameters anymore.
> -
> -Reviewed-by: Vedran Mileti=C4=87 <vedran@miletic.net>
> -Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> ----
> -Upstream-Status: Backport
> -
> - src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 12 +++++++++---
> - 1 file changed, 9 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> -index 2a388cb..0e4a531 100644
> ---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> -+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> -@@ -342,14 +342,20 @@ class DelegatingJITMemoryManager : public
> BaseMemoryManager {
> -       virtual void registerEHFrames(uint8_t *Addr, uint64_t LoadAddr,
> size_t Size) {
> -          mgr()->registerEHFrames(Addr, LoadAddr, Size);
> -       }
> --      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr,
> size_t Size) {
> --         mgr()->deregisterEHFrames(Addr, LoadAddr, Size);
> --      }
> - #else
> -       virtual void registerEHFrames(llvm::StringRef SectionData) {
> -          mgr()->registerEHFrames(SectionData);
> -       }
> - #endif
> -+#if HAVE_LLVM >=3D 0x0500
> -+      virtual void deregisterEHFrames() {
> -+         mgr()->deregisterEHFrames();
> -+      }
> -+#elif HAVE_LLVM >=3D 0x0304
> -+      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr,
> size_t Size) {
> -+         mgr()->deregisterEHFrames(Addr, LoadAddr, Size);
> -+      }
> -+#endif
> -       virtual void *getPointerToNamedFunction(const std::string &Name,
> -                                               bool AbortOnFailure=3Dtru=
e) {
> -          return mgr()->getPointerToNamedFunction(Name, AbortOnFailure);
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
> b/meta/recipes-graphics/mesa/mesa-gl_17.2.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_17.2.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 4f31ed255c..cab8e4bfe7 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -45,7 +45,7 @@ X11_DEPS =3D "xf86driproto glproto virtual/libx11 libxe=
xt
> libxxf86vm libxdamage li
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] =3D "--enable-glx-tls,--disable-glx,${X11_DEPS}"
>  PACKAGECONFIG[xvmc] =3D "--enable-xvmc,--disable-xvmc,libxvmc"
> -PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm"
> +PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm
> wayland-protocols"
>
>  DRIDRIVERS =3D "swrast"
>  DRIDRIVERS_append_x86 =3D ",radeon,r200,nouveau,i965,i915"
> diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> b/meta/recipes-graphics/mesa/mesa_17.2.1.bb
> similarity index 77%
> rename from meta/recipes-graphics/mesa/mesa_17.1.7.bb
> rename to meta/recipes-graphics/mesa/mesa_17.2.1.bb
> index a50f32c025..59c40b1371 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.2.1.bb
> @@ -7,13 +7,12 @@ SRC_URI =3D "https://mesa.freedesktop.org/
> archive/mesa-${PV}.tar.xz \
>             file://0002-hardware-gloat.patch \
>             file://vulkan-mkdir.patch \
>             file://llvm-config-version.patch \
> -           file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
> -           file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch =
\
>             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0001-configure.ac-Always-check-for-expat.patch \
>             "
> -SRC_URI[md5sum] =3D "e40bb428a263bd28cbf6478dae45b207"
> -SRC_URI[sha256sum] =3D "69f472a874b1122404fa0bd13e2d6b
> f87eb3b9ad9c21d2f39872a96d83d9e5f5"
> +
> +SRC_URI[md5sum] =3D "f53ed38110237d9df5f9198c09ef0ab0"
> +SRC_URI[sha256sum] =3D "77385d17827cff24a3bae134342234
> f2efe7f7f990e778109682571dbbc9ba1e"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144159a2e9103055a2e1dc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m guessing this upgrade actually requires the waylan=
d upgrades?<div><br></div><div>| make[4]: *** No rule to make target &#39;/=
usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.=
xml&#39;, needed by &#39;drivers/dri2/linux-dmabuf-unstable-v1-client-proto=
col.h&#39;.=C2=A0 Stop.<br></div><div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 September 2017 at=
 15:34, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossy=
stems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Upgrade to a new stable release and dr=
op patches applied on upstream.<br>
<br>
For a full release notes, please see:<br>
<a href=3D"https://mesa3d.org/relnotes/17.2.0.html" rel=3D"noreferrer" targ=
et=3D"_blank">https://mesa3d.org/relnotes/<wbr>17.2.0.html</a><br>
<a href=3D"https://mesa3d.org/relnotes/17.2.1.html" rel=3D"noreferrer" targ=
et=3D"_blank">https://mesa3d.org/relnotes/<wbr>17.2.1.html</a><br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
This patch has been tested using OE-Core current Wayland as well as v2<br>
of Fabien patches:<br>
<br>
=C2=A0weston: Bump version to 3.0.0<br>
=C2=A0wayland-protocols: Fix installation patch issue<br>
=C2=A0wayland : Bump to version 1.14.0<br>
<br>
The distro used for test had: opengl, wayland, x11 and vulkan enabled.<br>
<br>
Changes in v3:<br>
=C2=A0- fix build for wayland<br>
<br>
Changes in v2:<br>
=C2=A0- update to 17.2.1<br>
<br>
=C2=A0...1-ac-fix-build-after-LLVM-<wbr>5.0-SVN-r300718.patch | 40 --------=
----------<br>
=C2=A0...allivm-Fix-build-against-<wbr>LLVM-SVN-r302589.patch | 49 --------=
--------------<br>
=C2=A0.../mesa/{<a href=3D"http://mesa-gl_17.1.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mesa-gl_17.1.7.bb</a> =3D&gt; <a href=3D"http://mesa-gl_17.2=
.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_17.2.1.bb</a>}=C2=A0 |=
=C2=A0 0<br>
=C2=A0meta/recipes-graphics/mesa/<wbr>mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_17.1.7.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_17.1.7.bb</a> =3D&gt; <a href=3D"http://mesa_17.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_17.2.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 ++--<br>
=C2=A05 files changed, 4 insertions(+), 94 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/mesa/<wbr>files/0001-ac-fix-=
build-after-<wbr>LLVM-5.0-SVN-r300718.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/mesa/<wbr>files/0002-gallivm=
-Fix-build-<wbr>against-LLVM-SVN-r302589.patch<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_17.1.7.b=
b" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_17.1.7.bb</a> =3D&gt; =
<a href=3D"http://mesa-gl_17.2.1.bb" rel=3D"noreferrer" target=3D"_blank">m=
esa-gl_17.2.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_17.1.7.bb" =
rel=3D"noreferrer" target=3D"_blank">me<wbr>sa_17.1.7.bb</a> =3D&gt; <a hre=
f=3D"http://mesa_17.2.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_17.2.=
1.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>files/0001-ac-fix-build-after-=
<wbr>LLVM-5.0-SVN-r300718.patch b/meta/recipes-graphics/mesa/<wbr>files/000=
1-ac-fix-build-after-<wbr>LLVM-5.0-SVN-r300718.patch<br>
deleted file mode 100644<br>
index b27a3bc8e4..0000000000<br>
--- a/meta/recipes-graphics/mesa/<wbr>files/0001-ac-fix-build-after-<wbr>LL=
VM-5.0-SVN-r300718.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 9861437e58fdd0de01193a102608d3<wbr>4e5952953f Mon Sep 17 00:00:00 200=
1<br>
-From: Christoph Haag &lt;haagch+mesadev@frickel.club&gt;<br>
-Date: Thu, 20 Apr 2017 10:34:18 +0200<br>
-Subject: [PATCH 1/2] ac: fix build after LLVM 5.0 SVN r300718<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-v2: previously getWithDereferenceableBytes() exists, but addAttr() doesn&#=
39;t take that type<br>
-<br>
-Signed-off-by: Christoph Haag &lt;haagch+mesadev@frickel.club&gt;<br>
-Reviewed-by: Nicolai H=C3=A4hnle &lt;<a href=3D"mailto:nicolai.haehnle@amd=
.com">nicolai.haehnle@amd.com</a>&gt;<br>
-Tested-and-reviewed-by: Mike Lothian &lt;<a href=3D"mailto:mike@fireburn.c=
o.uk">mike@fireburn.co.uk</a>&gt;<br>
----<br>
-Upstream-Status: Backport<br>
-<br>
- src/amd/common/ac_llvm_helper.<wbr>cpp | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/src/amd/common/ac_llvm_<wbr>helper.cpp b/src/amd/common/ac_ll=
vm_<wbr>helper.cpp<br>
-index d9ea4b1..11fa809 100644<br>
---- a/src/amd/common/ac_llvm_<wbr>helper.cpp<br>
-+++ b/src/amd/common/ac_llvm_<wbr>helper.cpp<br>
-@@ -44,9 +44,13 @@ typedef AttributeSet AttributeList;<br>
- void ac_add_attr_dereferenceable(<wbr>LLVMValueRef val, uint64_t bytes)<b=
r>
- {<br>
-=C2=A0 =C2=A0 llvm::Argument *A =3D llvm::unwrap&lt;llvm::Argument&gt;(<wb=
r>val);<br>
-+#if HAVE_LLVM &lt; 0x0500<br>
-=C2=A0 =C2=A0 llvm::AttrBuilder B;<br>
-=C2=A0 =C2=A0 B.addDereferenceableAttr(<wbr>bytes);<br>
-=C2=A0 =C2=A0 A-&gt;addAttr(llvm::<wbr>AttributeList::get(A-&gt;<wbr>getCo=
ntext(), A-&gt;getArgNo() + 1,=C2=A0 B));<br>
-+#else<br>
-+=C2=A0 =C2=A0A-&gt;addAttr(llvm::Attribute::<wbr>getWithDereferenceableBy=
tes(A-<wbr>&gt;getContext(), bytes));<br>
-+#endif<br>
- }<br>
-<br>
- bool ac_is_sgpr_param(LLVMValueRef arg)<br>
---<br>
-2.13.3<br>
-<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>files/0002-gallivm-Fix-build-<=
wbr>against-LLVM-SVN-r302589.patch b/meta/recipes-graphics/mesa/<wbr>files/=
0002-gallivm-Fix-build-<wbr>against-LLVM-SVN-r302589.patch<br>
deleted file mode 100644<br>
index ac8caec74d..0000000000<br>
--- a/meta/recipes-graphics/mesa/<wbr>files/0002-gallivm-Fix-build-<wbr>aga=
inst-LLVM-SVN-r302589.patch<br>
+++ /dev/null<br>
@@ -1,49 +0,0 @@<br>
-From a02a0dfda2712d30ad62b8f0421ec7<wbr>b8244ba2cb Mon Sep 17 00:00:00 200=
1<br>
-From: =3D?UTF-8?q?Michel=3D20D=3DC3=3D<wbr>A4nzer?=3D &lt;<a href=3D"mailt=
o:michel.daenzer@amd.com">michel.daenzer@amd.com</a>&gt;<br>
-Date: Wed, 10 May 2017 17:26:07 +0900<br>
-Subject: [PATCH 2/2] gallivm: Fix build against LLVM SVN &gt;=3D r302589<b=
r>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-deregisterEHFrames doesn&#39;t take any parameters anymore.<br>
-<br>
-Reviewed-by: Vedran Mileti=C4=87 &lt;<a href=3D"mailto:vedran@miletic.net"=
>vedran@miletic.net</a>&gt;<br>
-Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.c=
om">marek.olsak@amd.com</a>&gt;<br>
----<br>
-Upstream-Status: Backport<br>
-<br>
- src/gallium/auxiliary/gallivm/<wbr>lp_bld_misc.cpp | 12 +++++++++---<br>
- 1 file changed, 9 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/gallium/auxiliary/<wbr>gallivm/lp_bld_misc.cpp b/src/gall=
ium/auxiliary/<wbr>gallivm/lp_bld_misc.cpp<br>
-index 2a388cb..0e4a531 100644<br>
---- a/src/gallium/auxiliary/<wbr>gallivm/lp_bld_misc.cpp<br>
-+++ b/src/gallium/auxiliary/<wbr>gallivm/lp_bld_misc.cpp<br>
-@@ -342,14 +342,20 @@ class DelegatingJITMemoryManager : public BaseMemory=
Manager {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0virtual void registerEHFrames(uint8_t *Addr, ui=
nt64_t LoadAddr, size_t Size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mgr()-&gt;registerEHFrames(Addr, LoadAd=
dr, Size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 virtual void deregisterEHFrames(uint8_t *Addr, uint6=
4_t LoadAddr, size_t Size) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mgr()-&gt;deregisterEHFrames(<wbr>Addr,=
 LoadAddr, Size);<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0virtual void registerEHFrames(llvm::<wbr>String=
Ref SectionData) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mgr()-&gt;registerEHFrames(<wbr>Section=
Data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
-+#if HAVE_LLVM &gt;=3D 0x0500<br>
-+=C2=A0 =C2=A0 =C2=A0 virtual void deregisterEHFrames() {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mgr()-&gt;deregisterEHFrames();<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+#elif HAVE_LLVM &gt;=3D 0x0304<br>
-+=C2=A0 =C2=A0 =C2=A0 virtual void deregisterEHFrames(uint8_t *Addr, uint6=
4_t LoadAddr, size_t Size) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mgr()-&gt;deregisterEHFrames(<wbr>Addr,=
 LoadAddr, Size);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0virtual void *getPointerToNamedFunction(<wbr>co=
nst std::string &amp;Name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bool AbortOnFailure=3Dtrue) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mgr()-&gt;<wbr>getPointerToNamed=
Function(<wbr>Name, AbortOnFailure);<br>
---<br>
-2.13.3<br>
-<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.7.bb=
" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa-gl_17.1.7.bb</a> b/meta/re=
cipes-graphics/mesa/<a href=3D"http://mesa-gl_17.2.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">m<wbr>esa-gl_17.2.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.1.7.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.2.1.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/recipes-graphi=
cs/mesa/<wbr>mesa.inc<br>
index 4f31ed255c..cab8e4bfe7 100644<br>
--- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
@@ -45,7 +45,7 @@ X11_DEPS =3D &quot;xf86driproto glproto virtual/libx11 li=
bxext libxxf86vm libxdamage li<br>
=C2=A0# &quot;x11&quot; requires &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-glx-tls,--disable-<wbr>glx,${X1=
1_DEPS}&quot;<br>
=C2=A0PACKAGECONFIG[xvmc] =3D &quot;--enable-xvmc,--disable-xvmc,<wbr>libxv=
mc&quot;<br>
-PACKAGECONFIG[wayland] =3D &quot;,,wayland-native wayland libdrm&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;,,wayland-native wayland libdrm wayland-p=
rotocols&quot;<br>
<br>
=C2=A0DRIDRIVERS =3D &quot;swrast&quot;<br>
=C2=A0DRIDRIVERS_append_x86 =3D &quot;,radeon,r200,nouveau,i965,<wbr>i915&q=
uot;<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.1.7.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_17.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">m<wbr>esa_17.2.1.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" re=
l=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.1.7.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.2.1.bb</a><br>
index a50f32c025..59c40b1371 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.7.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.2.1.bb</a><br>
@@ -7,13 +7,12 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://me=
sa.freedesktop.org/<wbr>archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-hardware-gloat.<wbr>p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vulkan-mkdir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://llvm-config-version.<wbr>p=
atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ac-fix-build-<wbr>aft=
er-LLVM-5.0-SVN-r300718.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-gallivm-Fix-build-<wb=
r>against-LLVM-SVN-r302589.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-winsys-svga-drm-<wbr>=
Include-sys-types.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure.ac-<wbr>Alw=
ays-check-for-expat.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>e40bb428a263bd28cbf6478dae45b2<wbr>07&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>69f472a874b1122404fa0bd13e2d6b<wbr>f87eb=
3b9ad9c21d2f39872a96d83d9<wbr>e5f5&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>f53ed38110237d9df5f9198c09ef0a<wbr>b0&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>77385d17827cff24a3bae134342234<wbr>f2efe=
7f7f990e778109682571dbbc9<wbr>ba1e&quot;<br>
<br>
=C2=A0#because we cannot rely on the fact that all apps will use pkgconfig,=
<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
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

--001a1144159a2e9103055a2e1dc8--
