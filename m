Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9706AC3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 16:41:30 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a142so4092436qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jHl3Tuq5zK5NJuHBtSh2UdDOYvfjxSqaUDCzc1gSR3Q=;
	b=ioEmt1uRu3QFNx0Zo2DfaTHYlDCqEwFLrqiLXMduKKHP7yKiCPvgPw3DpPjEeSkUCK
	4p6zhxqB6x6KtmVa+syraFOzds/qc1Ry5JEiAcqsfQ+PaTCfUowKeo0Co0mzsErt+Ue9
	bUnZmt0y46VPLQkKu5EoXayrQYDkRg/sVjMGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jHl3Tuq5zK5NJuHBtSh2UdDOYvfjxSqaUDCzc1gSR3Q=;
	b=ADQWeloV+qsLg/Tkuby8SltDYGHUhvBctfQ5Q0ZhcAFRmELJCWNYLg/W7cyVVAdo9z
	GINL05GLcTpv2ontaW3X8aTB8XlO5EedJ/XckRzhpd8UHpuyps9TYVEG8Guy4Cfp9P0n
	tSx34IeDWK5219hA5NnN1yfhN+ySl1fvFpQBnu8pbiamd4ulLY6MuCcidowIB7/VNc6Z
	rs8tOe7oxT7dd4cFi05ECTxMUJHqVzjcwQ+7wOwSzN0H90VryVZRMGXo5mSUcHyzoLgv
	kzk7KXhQxi76TNvkNqCfGtDe6Ee+pjaosYzdT1NCTNMcYXouT3co64ezxlInHG0vJ12D
	PwFA==
X-Gm-Message-State: AJaThX58k2ftSDSHRWIXsYy04Knzczi3BiAWjm2J5c5AyywPZdiMH40S
	mlMdJNJl/VJEdfAvElnmQbEe8n8ok38wm3mPVQbTihMc
X-Google-Smtp-Source: AGs4zMbbSMT1s0tx/krm9Za7W3pYHT9uFIU1lgtC8YWe/ZWBAtCKe0oPI1rBwFc9Cmevid+rzeFfq7qb4nfmKNIG9qc=
X-Received: by 10.55.110.196 with SMTP id j187mr1742655qkc.192.1510159291922; 
	Wed, 08 Nov 2017 08:41:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.81.81 with HTTP; Wed, 8 Nov 2017 08:41:11 -0800 (PST)
In-Reply-To: <20171108131716.26248-2-otavio@ossystems.com.br>
References: <20171108131716.26248-1-otavio@ossystems.com.br>
	<20171108131716.26248-2-otavio@ossystems.com.br>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Nov 2017 17:41:11 +0100
Message-ID: <CAP71WjzW9C9h_r8QdJ8zsz2xdz3RcNh7VpNbnesDUqgzHQG2Yg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 1/4] mesa: Upgrade to 17.2.4 release
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
X-List-Received-Date: Wed, 08 Nov 2017 16:41:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2017 at 2:17 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> Upgrade to a new stable release and drop patches applied on upstream.
>
> For a full release notes, please see:
> https://mesa3d.org/relnotes/17.2.0.html
> https://mesa3d.org/relnotes/17.2.1.html
> https://mesa3d.org/relnotes/17.2.2.html
> https://mesa3d.org/relnotes/17.2.3.html
> https://mesa3d.org/relnotes/17.2.4.html
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

thanks! I have tested on Dragonboard (freedreno) and the update looks
good to me. I have tested both the mesa and libdrm upgrade
simultaneously, and it's tested with X11 ad kmscube.

Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>
> Changes in v7:
>  - fix commit log typo
>
> Changes in v6:
>  - update to 17.2.4
>
> Changes in v5:
>  - rebase on top of master
>
> Changes in v4:
>  - update to 17.2.2
>
> Changes in v3:
>  - fix build for wayland
>
> Changes in v2:
>  - update to 17.2.1
>
>  ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ----------------=
--
>  ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------=
------
>  .../mesa/{mesa-gl_17.1.7.bb =3D> mesa-gl_17.2.4.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc                |  2 +-
>  .../mesa/{mesa_17.1.7.bb =3D> mesa_17.2.4.bb}        |  7 ++--
>  5 files changed, 4 insertions(+), 94 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-af=
ter-LLVM-5.0-SVN-r300718.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-bui=
ld-against-LLVM-SVN-r302589.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb =3D> mesa-gl_17.2.4=
.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb =3D> mesa_17.2.4.bb} (=
78%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLV=
M-5.0-SVN-r300718.patch b/meta/recipes-graphics/mesa/files/0001-ac-fix-buil=
d-after-LLVM-5.0-SVN-r300718.patch
> deleted file mode 100644
> index b27a3bc8e4..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-S=
VN-r300718.patch
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
> -v2: previously getWithDereferenceableBytes() exists, but addAttr() doesn=
't take that type
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
> -diff --git a/src/amd/common/ac_llvm_helper.cpp b/src/amd/common/ac_llvm_=
helper.cpp
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
> -    A->addAttr(llvm::AttributeList::get(A->getContext(), A->getArgNo() +=
 1,  B));
> -+#else
> -+   A->addAttr(llvm::Attribute::getWithDereferenceableBytes(A->getContex=
t(), bytes));
> -+#endif
> - }
> -
> - bool ac_is_sgpr_param(LLVMValueRef arg)
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-agai=
nst-LLVM-SVN-r302589.patch b/meta/recipes-graphics/mesa/files/0002-gallivm-=
Fix-build-against-LLVM-SVN-r302589.patch
> deleted file mode 100644
> index ac8caec74d..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLV=
M-SVN-r302589.patch
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
> -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium=
/auxiliary/gallivm/lp_bld_misc.cpp
> -index 2a388cb..0e4a531 100644
> ---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> -+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> -@@ -342,14 +342,20 @@ class DelegatingJITMemoryManager : public BaseMemo=
ryManager {
> -       virtual void registerEHFrames(uint8_t *Addr, uint64_t LoadAddr, s=
ize_t Size) {
> -          mgr()->registerEHFrames(Addr, LoadAddr, Size);
> -       }
> --      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr,=
 size_t Size) {
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
> -+      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr,=
 size_t Size) {
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
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb b/meta/recipes-=
graphics/mesa/mesa-gl_17.2.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_17.2.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 4f31ed255c..cab8e4bfe7 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -45,7 +45,7 @@ X11_DEPS =3D "xf86driproto glproto virtual/libx11 libxe=
xt libxxf86vm libxdamage li
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] =3D "--enable-glx-tls,--disable-glx,${X11_DEPS}"
>  PACKAGECONFIG[xvmc] =3D "--enable-xvmc,--disable-xvmc,libxvmc"
> -PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm"
> +PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
>
>  DRIDRIVERS =3D "swrast"
>  DRIDRIVERS_append_x86 =3D ",radeon,r200,nouveau,i965,i915"
> diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb b/meta/recipes-gra=
phics/mesa/mesa_17.2.4.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa_17.1.7.bb
> rename to meta/recipes-graphics/mesa/mesa_17.2.4.bb
> index 39cfce992f..928cb920af 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.2.4.bb
> @@ -7,14 +7,13 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
>             file://0002-hardware-gloat.patch \
>             file://vulkan-mkdir.patch \
>             file://llvm-config-version.patch \
> -           file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
> -           file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch =
\
>             file://0001-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0001-configure.ac-Always-check-for-expat.patch \
>             file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-int=
el-.patch \
>             "
> -SRC_URI[md5sum] =3D "e40bb428a263bd28cbf6478dae45b207"
> -SRC_URI[sha256sum] =3D "69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f3=
9872a96d83d9e5f5"
> +
> +SRC_URI[md5sum] =3D "cf0b7a297eedd0549cda5ba071d7561f"
> +SRC_URI[sha256sum] =3D "5ba408fecd6e1132e5490eec1a2f04466214e4c65c8b89b3=
31be844768c2e550"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

