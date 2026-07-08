Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35880C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:43:17 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7244.1783514591856137500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=VOwZUhtT;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id DDD71207AB;
	Wed,  8 Jul 2026 14:43:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1783514589;
	bh=QVYhv3GwVikC7GYQ4WQjr6h8Sotn0kx3vYTFcWy0dSo=; h=From:To:Subject;
	b=VOwZUhtTyPdUhdVQMG0mZrGXE4cJZFodQmISp/8EXka2kiO5bxLw/v3WtTSR7ZFdq
	 QT5rrDzprIqtLH+NiauWGQMRg+YZnsgxUIbfvWrN1IoPlmEy5ZdptjfWJwhMiMP4hY
	 LYmn4c7CHOkN6OfeyoJBTFwf514M35YMv+W8KaWO9XJNCjwctdsCM9Q1AKEdaC59zA
	 wbEC7VV+PNbZbHyESHHVM8ycoPU64PiHJne/GSxZb6sQmXAVUOnlEen9eeBYw7JjeX
	 He+A+6RjDmg5oeUJzdo/TiWwwOIwkQtasUNS5N+94FNeiHVv523Zco8HhA4+Cu4O9D
	 DLZl9a5igLVMw==
Date: Wed, 8 Jul 2026 14:43:04 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: openembedded-core@lists.openembedded.org
Cc: antoine.gouby@toradex.com
Subject: MESA build failure - today master
Message-ID: <20260708124304.GA80923@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 12:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240484

Hello,
since a few days current master is not building MESA with the error
below. Any idea? Is this error known?

07-08:14:01:13  | [658/1901] /workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa=
/26.1.4/recipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.4/src/ga=
llium/frontends/rusticl/rusticl_mesa_bindings.h --output /workdir/oe/tmp/wo=
rk/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/gallium/frontends/rusticl/rus=
ticl_mesa_bindings.rs --wrap-unsafe-ops --raw-line '#![allow(clippy::all)]'=
 --raw-line '#![allow(improper_ctypes)]' --raw-line '#![allow(unused_unsafe=
)]' --raw-line '#![allow(non_camel_case_types)]' --raw-line '#![allow(non_s=
nake_case)]' --raw-line '#![allow(non_upper_case_globals)]' --raw-line '#![=
allow(unsafe_op_in_unsafe_fn)]' --raw-line '#![allow(unnecessary_transmutes=
)]' --raw-line '#![allow(warnings)]' --no-convert-floats --default-enum-sty=
le rust --with-derive-partialeq --with-derive-eq --with-derive-partialord -=
-with-derive-ord --with-derive-hash --with-derive-default --anon-fields-pre=
fix anon_ --use-array-pointers-in-arguments --allowlist-function 'blob_.*' =
--allowlist-function 'disk_cache_.*' --allowlist-type float_controls --allo=
wlist-function 'mesa_.*' --allowlist-var 'OS_.*' --allowlist-function 'rz?a=
lloc_.*' --allowlist-var 'BLAKE3_.*' --allowlist-function '_mesa_blake3_.*'=
 --allowlist-function 'u_.*' --allowlist-function 'util_format_.*' --allowl=
ist-function 'util_queue_.*' --allowlist-function 'util_vma_.*' --allowlist=
-function util_get_cpu_caps --no-copy util_vma_heap --no-copy util_queue --=
no-copy util_queue_fence --allowlist-type 'cl_sampler_.*_mode' --constified=
-enum-module 'cl_sampler_.*_mode' --allowlist-function 'clc_.*' --allowlist=
-type clc_kernel_arg_access_qualifier --bitfield-enum clc_kernel_arg_access=
_qualifier --allowlist-type clc_kernel_arg_type_qualifier --bitfield-enum c=
lc_kernel_arg_type_qualifier --allowlist-type gl_access_qualifier --bitfiel=
d-enum gl_access_qualifier --allowlist-function 'glsl_.*' --allowlist-funct=
ion 'nir_.*' --allowlist-var nir_debug --allowlist-var 'NIR_DEBUG_.*' --bit=
field-enum nir_lower_int64_options --bitfield-enum nir_opt_if_options --bit=
field-enum nir_variable_mode --allowlist-function 'should_.*_nir' --allowli=
st-function 'spirv_.*' --allowlist-function 'pipe_.*' --allowlist-var 'PIPE=
_.*' --allowlist-type pipe_endian --bitfield-enum pipe_map_flags --allowlis=
t-type pipe_query_type --constified-enum-module pipe_query_type --allowlist=
-type pipe_resource_usage --bitfield-enum pipe_resource_usage --allowlist-t=
ype pipe_tex_filter --constified-enum-module pipe_tex_filter --allowlist-ty=
pe pipe_tex_wrap --constified-enum-module pipe_tex_wrap --allowlist-type pi=
pe_swizzle --constified-enum-module pipe_swizzle --blocklist-function pipe_=
shader_state_from_tgsi --allowlist-function 'rusticl_.*' --allowlist-functi=
on 'std(err|out)_ptr' --allowlist-function mmap --allowlist-function munmap=
 --allowlist-var 'MAP_.*' --allowlist-var 'PROT_.*' --allowlist-var 'WINSYS=
_HANDLE_TYPE_.*' --experimental --wrap-static-fns --wrap-static-fns-path /w=
orkdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/gallium/front=
ends/rusticl/rusticl_mesa_bindings.c --rust-target 1.96.0 --rust-edition 20=
21 -- -fno-builtin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -=
D__STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.4"' '-DPACKAGE_BUGREPORT=3D=
"https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1 -DHA=
VE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_ETNAVIV -DHAVE_FREEDRENO -=
DHAVE_LLVMPIPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMES=
A_SYSTEM_HAS_KMS_DRM=3D1 -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0=
 -DVIDEO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=
=3D0 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=
=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -D=
HAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAV=
E_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_GFX_COMPUTE -D=
GLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_=
PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE =
-DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHA=
VE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BU=
ILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN=
_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_=
P -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BU=
ILTIN_SUB_OVERFLOW_P -DHAVE___BUILTIN_AARCH64_GET_FPCR -DHAVE___BUILTIN_AAR=
CH64_SET_FPCR -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DH=
AVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_=
UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK =
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRI=
BUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORE=
TURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_=
ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_=
GNU_SOURCE -DUSE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DH=
AS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -D=
HAVE_SYS_SHM_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -D=
HAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOC=
K -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GET=
ENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM=
_INVOCATION_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_T=
YPE -DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE=
_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_L=
IBDRM '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_L=
LVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_=
SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE=
_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_X11_DRM =
-DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_RE=
NDERDOC_INTEGRATION=3D1 -DHAVE_ETNAVIV_NO_PEST -march=3Darmv8-a+crypto -mbr=
anch-protection=3Dstandard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/work=
dir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/recipe-sysroot --target=3D=
aarch64-tdx-linux -D_FILE_OFFSET_BITS=3D64 -I/workdir/oe/tmp/work/armv8a-im=
x-tdx-linux/mesa/26.1.4/sources/mesa-26.1.4/src/gallium/include -I/workdir/=
oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/gallium/include -I/w=
orkdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sources/mesa-26.1.4/src=
/gallium/auxiliary -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/=
build/src/gallium/auxiliary -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mes=
a/26.1.4/sources/mesa-26.1.4/include/. -I/workdir/oe/tmp/work/armv8a-imx-td=
x-linux/mesa/26.1.4/build/include/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-l=
inux/mesa/26.1.4/sources/mesa-26.1.4/src/. -I/workdir/oe/tmp/work/armv8a-im=
x-tdx-linux/mesa/26.1.4/build/src/. -DNDEBUG -I/workdir/oe/tmp/work/armv8a-=
imx-tdx-linux/mesa/26.1.4/sources/mesa-26.1.4/src/compiler/nir/. -I/workdir=
/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/compiler/nir/. -I/w=
orkdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sources/mesa-26.1.4/src=
/compiler/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/s=
rc/compiler/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sourc=
es/mesa-26.1.4/src/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.=
4/build/src/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sourc=
es/mesa-26.1.4/include/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/2=
6.1.4/build/include/. -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__S=
TDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.4"' '-DPACKAGE_BUGREPORT=3D"htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1 -DHAVE_O=
PENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_ETNAVIV -DHAVE_FREEDRENO -DHAV=
E_LLVMPIPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SY=
STEM_HAS_KMS_DRM=3D1 -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0 -DV=
IDEO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 =
-DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 =
-DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_=
WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM=
_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_GFX_COMPUTE -DGLX_I=
NDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO=
_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAV=
E___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___=
BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN=
_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPC=
OUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DH=
AVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN=
_SUB_OVERFLOW_P -DHAVE___BUILTIN_AARCH64_GET_FPCR -DHAVE___BUILTIN_AARCH64_=
SET_FPCR -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_F=
UNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSE=
D -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAV=
E_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_=
RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN =
-DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRI=
BUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_S=
OURCE -DUSE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SC=
HED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_=
SYS_SHM_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_=
STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DH=
AVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -=
DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVO=
CATION_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -=
DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD=
 -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM=
 '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_A=
VAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV=
_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_D=
ISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_X11_DRM -DHAV=
E_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_RENDERD=
OC_INTEGRATION=3D1 -std=3Dc11 -MD -MQ ../sources/mesa-26.1.4/src/gallium/fr=
ontends/rusticl/rusticl_mesa_bindings.h -MF src/gallium/frontends/rusticl/r=
usticl_mesa_bindings.h.d
07-08:14:01:13  | FAILED: [code=3D1] src/gallium/frontends/rusticl/rusticl_=
mesa_bindings.rs src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
07-08:14:01:13  | /workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/rec=
ipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.4/src/gallium/front=
ends/rusticl/rusticl_mesa_bindings.h --output /workdir/oe/tmp/work/armv8a-i=
mx-tdx-linux/mesa/26.1.4/build/src/gallium/frontends/rusticl/rusticl_mesa_b=
indings.rs --wrap-unsafe-ops --raw-line '#![allow(clippy::all)]' --raw-line=
 '#![allow(improper_ctypes)]' --raw-line '#![allow(unused_unsafe)]' --raw-l=
ine '#![allow(non_camel_case_types)]' --raw-line '#![allow(non_snake_case)]=
' --raw-line '#![allow(non_upper_case_globals)]' --raw-line '#![allow(unsaf=
e_op_in_unsafe_fn)]' --raw-line '#![allow(unnecessary_transmutes)]' --raw-l=
ine '#![allow(warnings)]' --no-convert-floats --default-enum-style rust --w=
ith-derive-partialeq --with-derive-eq --with-derive-partialord --with-deriv=
e-ord --with-derive-hash --with-derive-default --anon-fields-prefix anon_ -=
-use-array-pointers-in-arguments --allowlist-function 'blob_.*' --allowlist=
-function 'disk_cache_.*' --allowlist-type float_controls --allowlist-funct=
ion 'mesa_.*' --allowlist-var 'OS_.*' --allowlist-function 'rz?alloc_.*' --=
allowlist-var 'BLAKE3_.*' --allowlist-function '_mesa_blake3_.*' --allowlis=
t-function 'u_.*' --allowlist-function 'util_format_.*' --allowlist-functio=
n 'util_queue_.*' --allowlist-function 'util_vma_.*' --allowlist-function u=
til_get_cpu_caps --no-copy util_vma_heap --no-copy util_queue --no-copy uti=
l_queue_fence --allowlist-type 'cl_sampler_.*_mode' --constified-enum-modul=
e 'cl_sampler_.*_mode' --allowlist-function 'clc_.*' --allowlist-type clc_k=
ernel_arg_access_qualifier --bitfield-enum clc_kernel_arg_access_qualifier =
--allowlist-type clc_kernel_arg_type_qualifier --bitfield-enum clc_kernel_a=
rg_type_qualifier --allowlist-type gl_access_qualifier --bitfield-enum gl_a=
ccess_qualifier --allowlist-function 'glsl_.*' --allowlist-function 'nir_.*=
' --allowlist-var nir_debug --allowlist-var 'NIR_DEBUG_.*' --bitfield-enum =
nir_lower_int64_options --bitfield-enum nir_opt_if_options --bitfield-enum =
nir_variable_mode --allowlist-function 'should_.*_nir' --allowlist-function=
 'spirv_.*' --allowlist-function 'pipe_.*' --allowlist-var 'PIPE_.*' --allo=
wlist-type pipe_endian --bitfield-enum pipe_map_flags --allowlist-type pipe=
_query_type --constified-enum-module pipe_query_type --allowlist-type pipe_=
resource_usage --bitfield-enum pipe_resource_usage --allowlist-type pipe_te=
x_filter --constified-enum-module pipe_tex_filter --allowlist-type pipe_tex=
_wrap --constified-enum-module pipe_tex_wrap --allowlist-type pipe_swizzle =
--constified-enum-module pipe_swizzle --blocklist-function pipe_shader_stat=
e_from_tgsi --allowlist-function 'rusticl_.*' --allowlist-function 'std(err=
|out)_ptr' --allowlist-function mmap --allowlist-function munmap --allowlis=
t-var 'MAP_.*' --allowlist-var 'PROT_.*' --allowlist-var 'WINSYS_HANDLE_TYP=
E_.*' --experimental --wrap-static-fns --wrap-static-fns-path /workdir/oe/t=
mp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/gallium/frontends/rustic=
l/rusticl_mesa_bindings.c --rust-target 1.96.0 --rust-edition 2021 -- -fno-=
builtin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIM=
IT_MACROS '-DPACKAGE_VERSION=3D"26.1.4"' '-DPACKAGE_BUGREPORT=3D"https://gi=
tlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_E=
S_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_ETNAVIV -DHAVE_FREEDRENO -DHAVE_LLVMP=
IPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HA=
S_KMS_DRM=3D1 -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CO=
DEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO=
_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO=
_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND=
_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFO=
RM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_GFX_COMPUTE -DGLX_INDIRECT=
_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_=
POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAVE___BUI=
LTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN=
_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -D=
HAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL =
-DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___B=
UILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OV=
ERFLOW_P -DHAVE___BUILTIN_AARCH64_GET_FPCR -DHAVE___BUILTIN_AARCH64_SET_FPC=
R -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATT=
RIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAV=
E_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_=
ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS=
_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_=
FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VI=
SIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -=
DUSE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GET=
AFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM=
_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF =
-DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STR=
TOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_S=
YSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_=
NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_S=
TRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE=
_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM '-DMES=
A_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABL=
E=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS =
-DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH=
_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_X11_DRM -DHAVE_DRI -=
DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_RENDERDOC_INTE=
GRATION=3D1 -DHAVE_ETNAVIV_NO_PEST -march=3Darmv8-a+crypto -mbranch-protect=
ion=3Dstandard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security --sysroot=3D/workdir/oe/tmp/wor=
k/armv8a-imx-tdx-linux/mesa/26.1.4/recipe-sysroot --target=3Daarch64-tdx-li=
nux -D_FILE_OFFSET_BITS=3D64 -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/me=
sa/26.1.4/sources/mesa-26.1.4/src/gallium/include -I/workdir/oe/tmp/work/ar=
mv8a-imx-tdx-linux/mesa/26.1.4/build/src/gallium/include -I/workdir/oe/tmp/=
work/armv8a-imx-tdx-linux/mesa/26.1.4/sources/mesa-26.1.4/src/gallium/auxil=
iary -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/gall=
ium/auxiliary -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sourc=
es/mesa-26.1.4/include/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/2=
6.1.4/build/include/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1=
=2E4/sources/mesa-26.1.4/src/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/=
mesa/26.1.4/build/src/. -DNDEBUG -I/workdir/oe/tmp/work/armv8a-imx-tdx-linu=
x/mesa/26.1.4/sources/mesa-26.1.4/src/compiler/nir/. -I/workdir/oe/tmp/work=
/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/compiler/nir/. -I/workdir/oe/tm=
p/work/armv8a-imx-tdx-linux/mesa/26.1.4/sources/mesa-26.1.4/src/compiler/. =
-I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/src/compiler/=
=2E -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sources/mesa-26=
=2E1.4/src/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/build/=
src/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/sources/mesa-=
26.1.4/include/. -I/workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/bu=
ild/include/. -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMI=
T_MACROS '-DPACKAGE_VERSION=3D"26.1.4"' '-DPACKAGE_BUGREPORT=3D"https://git=
lab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES=
_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_ETNAVIV -DHAVE_FREEDRENO -DHAVE_LLVMPI=
PE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS=
_KMS_DRM=3D1 -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_COD=
EC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_=
CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_=
CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_=
PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFOR=
M -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_=
RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_P=
OINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAVE___BUIL=
TIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_=
CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DH=
AVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL -=
DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___BU=
ILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVE=
RFLOW_P -DHAVE___BUILTIN_AARCH64_GET_FPCR -DHAVE___BUILTIN_AARCH64_SET_FPCR=
 -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTR=
IBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE=
_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_A=
TTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_=
NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_F=
UNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VIS=
IBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -D=
USE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETA=
FFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_=
H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -=
DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRT=
OK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_SY=
SCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_N=
AME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_ST=
RTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_=
COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM '-DMESA=
_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=
=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -=
DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_=
QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_X11_DRM -DHAVE_DRI -D=
HAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_RENDERDOC_INTEG=
RATION=3D1 -std=3Dc11 -MD -MQ ../sources/mesa-26.1.4/src/gallium/frontends/=
rusticl/rusticl_mesa_bindings.h -MF src/gallium/frontends/rusticl/rusticl_m=
esa_bindings.h.d
07-08:14:01:13  | /workdir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/rec=
ipe-sysroot/usr/include/stdio.h:38:10: fatal error: 'stddef.h' file not fou=
nd
07-08:14:01:13  | Unable to generate bindings: clang diagnosed error: /work=
dir/oe/tmp/work/armv8a-imx-tdx-linux/mesa/26.1.4/recipe-sysroot/usr/include=
/stdio.h:38:10: fatal error: 'stddef.h' file not found

Thanks,
Francesco



