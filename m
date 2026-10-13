Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E404ECC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 05:03:16 +0000 (UTC)
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2644.1791910659224304835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 09:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codethink.co.uk header.s=imap4-20230908 header.b=ZuX0rV02;
 spf=pass (domain: codethink.co.uk, ip: 188.40.203.114, mailfrom: marcel.ziswiler@codethink.co.uk)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To; bh=3MeXwXK3zECtzsYfrEOT9fFKHgAPSG/mExVSSyz3btM=; b=ZuX0r
	V02lwrTU5IrDEGQbJBGpnqOlvE4OuQX94OM1NMlogZ4OLsMGnDYaJSwDVw7GxjhvJR9+F49zuYvCf
	t/PrMAqW+FRHmcK4ccWXlREcZeq37Q37jgESjR+/uHdFii1zOqpzBkJbIXeH/Pn7hMFi+yfuQtWhy
	U2vWvyfr0ge2OaQB1vemAZfHndg8/a5HyH3/jtnlHZQEUjOOQr4NaZ9pLDWb7G8UdEubb9Q1g20j7
	CeuFaspqVYYmo5cUCDm8lm91InyMsi8ZzhKmukkjVFVCgCS865DQGzYeFXqpJumveTYCujQRcBP78
	vfI0R3EwAj4APJq/HVQfqQEYmIIog==;
Received: from xcpe-84-227-225-151.dyn.res.sunrise.net ([84.227.225.151] helo=[10.10.1.181])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1xGf12-00HCAd-PC; Tue, 13 Oct 2026 17:06:12 +0100
Message-ID: <b62d6b230b62140a8e1fce22c091de8c3f7060e0.camel@codethink.co.uk>
Subject: Re: [OE-core] [PATCH 1/2] mesa,mesa-tools-native: upgrade 26.2.3 -> 26.2.4
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Oct 2026 18:06:11 +0200
In-Reply-To: <C0AFB954-4CC9-4E16-9E85-A8358F30CC38@arm.com>
References: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
	 <6aa07d3d439f56b58f6267c68103b737639cdb5e.1791224526.git.marcel.ziswiler@codethink.co.uk>
	 <C0AFB954-4CC9-4E16-9E85-A8358F30CC38@arm.com>
Organization: Codethink
User-Agent: Evolution 3.62.0 (by Flathub.org) 
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 05:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247739

On Tue, 2026-10-13 at 15:03 +0000, Ross Burton wrote:
> We=E2=80=99ve trimmed this when merging, but in the future could you trim=
 the release notes before posting?
>=20
> We don=E2=80=99t need to see details like the SHA checksums or the full c=
hangelog, just the summary of the changes.

Sure, I will keep that in mind.

Thanks!

> Thanks,
> Ross

Cheers

Marcel

> > On 5 Oct 2026, at 19:36, Marcel Ziswiler via lists.openembedded.org
> > <marcel.ziswiler=3Dcodethink.co.uk@lists.openembedded.org> wrote:
> >=20
> > Mesa 26.2.3 Release Notes / 2026-09-16
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Mesa 26.2.3 is a bug fix release which fixes bugs found since the 26.2.=
2
> > release.
> >=20
> > Mesa 26.2.3 implements the OpenGL 4.6 API, but the version reported by
> > glGetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) /
> > glGetIntegerv(GL_MINOR_VERSION) depends on the particular driver being =
used.
> > Some drivers don't support all the features required in OpenGL 4.6. Ope=
nGL
> > 4.6 is **only** available if requested at context creation.
> > Compatibility contexts may report a lower version depending on each dri=
ver.
> >=20
> > Mesa 26.2.3 implements the OpenCL 3.1 API, but the version reported by
> > the CL_DEVICE_VERSION, CL_DEVICE_NUMERIC_VERSION and
> > CL_DEVICE_OPENCL_C_ALL_VERSIONS
> > clGetDeviceInfo queries depends on the particular driver being used.
> >=20
> > Mesa 26.2.3 implements the Vulkan 1.4 API, but the version reported by
> > the apiVersion property of the VkPhysicalDeviceProperties struct
> > depends on the particular driver being used.
> >=20
> > SHA checksums
> > -------------
> >=20
> > ::
> >=20
> > =C2=A0=C2=A0 SHA256: 1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed9456=
ff423ea034a81f
> > =C2=A0=C2=A0 mesa-26.2.3.tar.xz
> > =C2=A0=C2=A0 SHA512: ec621735ae4679762ea27b979a5314c7aecfdd4165afea19c8=
c55f933d79b40f01fa
> > =C2=A0=C2=A0 041a95874fc4347e732ac565786d9b616a9aa8856a422204d9ecc9a12e=
c4
> > =C2=A0=C2=A0 mesa-26.2.3.tar.xz
> >=20
> > New features
> > ------------
> >=20
> > - None
> >=20
> > Bug fixes
> > ---------
> >=20
> > - NVK memory leak in CmdCopyBufferToImage in 26.2.0, 26.2.1 and 26.2.2.
> > - RADV: GPU page fault (null pointer) with RT emulation on Polaris (RX =
580
> > =C2=A02048SP). Issue between 26.1.6 and 26.2.1
> > - [ANV][ARL][bisected] Visual graphics glitches in Counter-Strike 2 sta=
rting in
> > =C2=A0Mesa 26.2.x
> > - [radeonsi] Minecraft Voxy mod: Distant water rendering issue on Vega =
iGPU and
> > =C2=A0RDNA2
> > - \`hevc_vaapi` on AMD (radeonsi/gfx1150) stalls to ~1 fps when input f=
rames
> > =C2=A0carry A/53 (CEA-608/708) closed-caption side data
> > - anv: Test fails in simulation due to coarse pixel shading state
> > - asahi: 16-bit blending into RGBA32F produces zero due to 32-bit tileb=
uffer
> > =C2=A0load
> > - asahi: Some textures do not render correctly in Portals 2
> > - libvulkan_intel.so crash with X-Plane 12.4.3 on Intel Arc B580
> > - nircache causes glxgears/eglgears to segfault under Zink
> > - vulkan,radv: when using descriptor heaps, input attachments in SPIR-V=
 are
> > =C2=A0incorrectly detected as read only instead of read write
> >=20
> > Changes
> > -------
> >=20
> > Alyssa Rosenzweig (1):
> > - mesa/st: fix incorrect VS input bases
> > Andrzej Datczuk (1):
> > - ac/sqtt, radv, radeonsi: Fix SQTT buffer size alignment issues
> > Benjamin Cheng (1):
> > - radeonsi: set stencil clear to 0 when enabling TC compat
> > Caio Oliveira (1):
> > - spirv: Preserve all fp_math_ctrl bits in vtn_handle_alu default case
> > Christian Gmeiner (2):
> >=20
> > - etnaviv: Do not abort on unsupported stencil-only blits
> > - etnaviv: Use RS depth formats only on halti5+
> >=20
> > Danylo Piliaiev (5):
> >=20
> > - tu: Wait for XFB query writes to land before making it available
> > - tu: Synchronizing with CmdCopyQueryPoolResult should wait for mem wri=
tes
> > - tu: Use p_atomic_read to read from query's slot->available
> > - tu: Fix PACKED + alignas(8) application to the same struct on older G=
CC
> > - tu: Handle lazy memory in GetDeviceMemoryOpaqueCaptureAddress
> >=20
> > David Rosca (2):
> >=20
> > - va: Drop HEVC SEI parsing
> > - radv/video: Fix setting session parameters override info
> >=20
> > Dmitry Baryshkov (8):
> >=20
> > - ir3: keep byte SSBO offsets before a6xx
> > - freedreno/a5xx: only 2D-blit between compatible formats
> > - freedreno/a5xx: program NUMNONPOSVAR with position's VPC location
> > - freedreno/a4xx+a5xx: clamp the texture buffer size
> > - freedreno: keep the separate stencil out of the shadow blit
> > - freedreno/a5xx: blit the separate stencil plane too
> > - ir3: skip the phis of non-GPR registers in the minimum pressure bound
> > - freedreno/a5xx: bound blits by the layer count, not the depth
> >=20
> > Emma Anholt (3):
> >=20
> > - tu: Drop TRANSFER_SRC/DST from bufferFeatures.
> > - tu: Fix the sType of the returned VkFragmentShadingRateKHRs.
> > - tu: Fix destroy order of autotune vs perfcounters in failure path.
> >=20
> > Eric Engestrom (4):
> >=20
> > - docs: add sha sum for 26.2.2
> > - .pick_status.json: Update to 9f42ea1239025d3f93d9bbf7405340adcec94419
> > - .pick_status.json: Mark f45825a0c724d06f231a1210484fe9af71a3ffab as
> > =C2=A0denominated
> > - .pick_status.json: Mark 859fcc3b74f831bbb9151f06d055ddfd45cc6e50 as
> > =C2=A0denominated
> >=20
> > Frank Binns (3):
> >=20
> > - pvr: add missing GPU architecture to device info for some BVNCs
> > - pvr: fixup ordering of (has\_)usc_itr_parallel_instances in dev info
> > - zink: replace blend and vertex elements state hashes with IDs
> >=20
> > Ganesh Belgur Ramachandra (1):
> > - amd: add gfx1171
> > Georg Lehmann (2):
> >=20
> > - nir/opt_uub: fix imax optimization
> > - aco: avoid mubuf bounds checking for global
> >=20
> > Iv=C3=A1n Briano (1):
> > - anv: fix push constant range gathering for dynamic offsets
> > Jiyu Yang (1):
> > - clc: fix fd leak in open_clc_data() on map failure
> > Juston Li (1):
> > - anv/android: Don't disable AUX_BIT importing Xe2+ CCS mod images
> > Karmjit Mahil (1):
> > - tu: Fix sparse bind column merging
> > Karol Herbst (2):
> >=20
> > - nir/serialize: set info.spec to NULL
> > - rusticl/event: properly implement CL
> >=20
> > [Changelog truncated as it exceeds 5000 characters;
> > the full changelog can be found in an attachment to the AUH email]
> >=20
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
> > ---
> > ...-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch | 2 +-
> > ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 2 +-
> > .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=C2=A0=C2=A0=
 | 2 +-
> > ...src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 2 +-
> > ...src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 2 +-
> > meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> > 6 files changed, 7 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builti=
n_cpu_supports-for-avx2-
> > detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-bui=
ltin_cpu_supports-for-avx2-
> > detecti.patch
> > index 12002a2c037c..2b30c1b5c78f 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_s=
upports-for-avx2-detecti.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_s=
upports-for-avx2-detecti.patch
> > @@ -1,4 +1,4 @@
> > -From 52293e90484f07b5186f2f1fa7de63da0f120122 Mon Sep 17 00:00:00 2001
> > +From b00409956cd1a58f1c676de9cbfd2c688ca3fc9f Mon Sep 17 00:00:00 2001
> > From: Khem Raj <khem.raj@oss.qualcomm.com>
> > Date: Thu, 13 Aug 2026 00:00:00 +0000
> > Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detecti=
on
> > diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-enco=
de-build-path-into-binaries.patch
> > b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-pa=
th-into-binaries.patch
> > index 7a00acbed383..d58027712486 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-buil=
d-path-into-binaries.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-buil=
d-path-into-binaries.patch
> > @@ -1,4 +1,4 @@
> > -From fd5571e22fd18b855199f23731f035927067a2a2 Mon Sep 17 00:00:00 2001
> > +From a61daaf354bd84dfa849f8da6028ddc71f1af7dc Mon Sep 17 00:00:00 2001
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Date: Wed, 10 Dec 2025 02:27:16 +0200
> > Subject: [PATCH] freedreno: don't encode build path into binaries
> > diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64b=
it-atomics-on-mips-clang.patch
> > b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-=
on-mips-clang.patch
> > index dc0957d8e2d5..77a0ba3d8ba7 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atom=
ics-on-mips-clang.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atom=
ics-on-mips-clang.patch
> > @@ -1,4 +1,4 @@
> > -From c1a89a08629f9e576e136dc044c0ed8a2b67d92f Mon Sep 17 00:00:00 2001
> > +From c3a359d39e387e785883cb740934a0dc4e6376db Mon Sep 17 00:00:00 2001
> > From: Khem Raj <raj.khem@gmail.com>
> > Date: Mon, 13 Jan 2020 15:23:47 -0800
> > Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
> > diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-j=
ay-jay_ir.h-do-not-used-typed-
> > en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay=
-jay_ir.h-do-not-used-typed-en.patch
> > index 36456cc3b153..b923c4c1fb8b 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_=
ir.h-do-not-used-typed-en.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_=
ir.h-do-not-used-typed-en.patch
> > @@ -1,4 +1,4 @@
> > -From f0c1b4e5480bb4118326a339a3a7084df1a6b0b7 Mon Sep 17 00:00:00 2001
> > +From ccfa5a6555f6eb035ace12cba1ce3e785a47895f Mon Sep 17 00:00:00 2001
> > From: Alexander Kanavin <alex@linutronix.de>
> > Date: Sun, 14 Jun 2026 17:42:19 +0200
> > Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enu=
m
> > diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do=
-not-use-arm-fpu-instructions-
> > if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-n=
ot-use-arm-fpu-instructions-if.patch
> > index aac42083c46e..0d0fdace2ccf 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-us=
e-arm-fpu-instructions-if.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-us=
e-arm-fpu-instructions-if.patch
> > @@ -1,4 +1,4 @@
> > -From 56dbc838e42d920506f0f119a65a1faf0cf7b3cc Mon Sep 17 00:00:00 2001
> > +From 89c46de92e974202c1cabce25bb4d9441830b8b6 Mon Sep 17 00:00:00 2001
> > From: Alexander Kanavin <alex@linutronix.de>
> > Date: Wed, 1 Jul 2026 22:48:15 +0200
> > Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if =
fpu is
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 1154d511d975..b0ae5016de1a 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -22,8 +22,8 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.ta=
r.xz=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://000=
1-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> >=20
> > -SRC_URI[sha256sum] =3D "1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed=
9456ff423ea034a81f"
> > -PV =3D "26.2.3"
> > +SRC_URI[sha256sum] =3D "bce5f7fbebb934373b86c999a064d52fb5065878dc57f2=
87f95346648ec832e9"
> > +PV =3D "26.2.4"
> >=20
> > UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >=20
> > --=20
> > 2.53.0
> >=20
> >=20
> >=20

