Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B3BC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:09:56 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147873.1783332588704282851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=b0HZFNNg;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 55810E752
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 12:09:39 +0200 (CEST)
Received: from mail-lf1-f52.google.com ([209.85.167.52]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wggGd-0pnF8i0; Mon, 6 Jul 2026 12:09:35 +0200
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so2334926e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:09:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz7LO2CCPOTB1TBemKAAJIRbcefCkSFN8Wm9zzkg+I3UQa4aaiI
	uLFLZ8J+h/PTYIjBJlz+QtVwL0dCimsCj9LqH2nZ09O7s5G+3lhnYKkoomDPkz/v8Wco8jOwI2f
	cszbDfzy3SpWnLNeklRZxBF55mS6rQ1Q=
X-Received: by 2002:a05:6512:3d0e:b0:5ae:b77f:f823 with SMTP id
 2adb3069b0e04-5aed5084c39mr1676082e87.15.1783332575255; Mon, 06 Jul 2026
 03:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260701163814.1290027-1-f_l_k@t-online.de> <CAMKF1sprX0AD4zJwbC1uBNLzdcBsC+oRDZM15ZmdP3iwtnx5qA@mail.gmail.com>
In-Reply-To: <CAMKF1sprX0AD4zJwbC1uBNLzdcBsC+oRDZM15ZmdP3iwtnx5qA@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Date: Mon, 6 Jul 2026 12:09:24 +0200
X-Gmail-Original-Message-ID: <CAGMZJCfBtKwV_yyRFA5Ke9cqATMfAMjGo8UVjHL=azdd8dMWVA@mail.gmail.com>
X-Gm-Features: AVVi8CdAVbis807mPzhQF_aLV_M30-jUrkSyLu2NkLewsDIKUbmhO1aclJnH0YQ
Message-ID: <CAGMZJCfBtKwV_yyRFA5Ke9cqATMfAMjGo8UVjHL=azdd8dMWVA@mail.gmail.com>
Subject: Re: [RFC][oe-core][Patch] mesa.inc: add a workaround for rusticl build
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa23810655ee789d"
X-TOI-EXPURGATEID: 150726::1783332575-8EFFA930-8A081FE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c567c2d-bfac-430c-84df-389f8cbdf84b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1783332579; i=f_l_k@t-online.de;
	bh=tofYsmiQEKPPun/8u/pzic4Vz/78xdJNboPSRBfbUV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b0HZFNNgMckQoE8v+R4VeZk4GZZJddKXLRvwyPnCZA/EUqMJw9fw7RIpMRmb8oDwn
	 CiNQHHyZeRaRmNlc4+CwYJ44G2/0p54eOJg6gUpntnHXLWPDJi+qD5eZZgvu7dAxxA
	 7s/hCm/jNRhb3L7Qu9xW36gLoOBf2mE7i6t/W7ihOZeP6y0MNLmKJB7hXxpnvjcUXR
	 XFMvQpQWyUiRujFxa4kLDmwNZ7AA4QWpelUGGB041EoKbvaVs8jNerRy+fTHiPYXbJ
	 7N2FfGOOEMHGFtyY36Ou1/u4aXd8LdN2Rytn/nl1NEnw2eydoNpxZ+Fg66nHSSxPt0
	 349V0Zjc0NSsA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240236

--000000000000aa23810655ee789d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I don't have access to my build Maschine this week so I can't test it but
this patch probably fixes the issue:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathieu/=
master-next&id=3D06d225db716ebe06e8dcead364386825e402beb7

Khem Raj via lists.openembedded.org <raj.khem=3D
gmail.com@lists.openembedded.org> schrieb am Fr., 3. Juli 2026, 16:42:

> Hi Markus,
>
> Hardcoding the LLVM version like this is fragile. We should look for a
> more robust way to handle the clang dependency that doesn't rely on a
> specific version number in the path.
>
> Best regards,
>
> Khem Raj
>
>
> On Wed, Jul 1, 2026, 9:38=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
>> Build checks if ${STAGING_BINDIR}/clang-22 is available and runnable
>>
>> | FAILED: [code=3D101]
>> src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs
>> src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
>> |
>> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/me=
sa/26.1.2/recipe-sysroot-native/usr/bin/bindgen
>> ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_bindin=
gs.h
>> --output
>> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/me=
sa/26.1.2/build/src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs
>> --wrap-unsafe-ops --raw-line '#![allow(clippy::all)]' --raw-line
>> '#![allow(improper_ctypes)]' --raw-line '#![allow(unused_unsafe)]'
>> --raw-line '#![allow(non_camel_case_types)]' --raw-line
>> '#![allow(non_snake_case)]' --raw-line '#![allow(non_upper_case_globals)=
]'
>> --raw-line '#![allow(unsafe_op_in_unsafe_fn)]' --raw-line
>> '#![allow(unnecessary_transmutes)]' --raw-line '#![allow(warnings)]'
>> --no-convert-floats --default-enum-style rust --with-derive-partialeq
>> --with-derive-eq --with-derive-partialord --with-derive-ord
>> --with-derive-hash --with-derive-default --anon-fields-prefix anon_
>> --use-array-pointers-in-arguments --allowlist-function 'blob_.*'
>> --allowlist-function 'disk_cache_.*' --allowlist-type float_controls
>> --allowlist-function 'mesa_.*' --allowlist-var 'OS_.*' --allowlist-funct=
ion
>> 'rz?alloc_.*' --allowlist-var 'BLAKE3_.*' --allowlist-function
>> '_mesa_blake3_.*' --allowlist-function 'u_.*' --allowlist-function
>> 'util_format_.*' --allowlist-function 'util_queue_.*' --allowlist-functi=
on
>> 'util_vma_.*' --allowlist-function util_get_cpu_caps --no-copy
>> util_vma_heap --no-copy util_queue --no-copy util_queue_fence
>> --allowlist-type 'cl_sampler_.*_mode' --constified-enum-module
>> 'cl_sampler_.*_mode' --allowlist-function 'clc_.*' --allowlist-type
>> clc_kernel_arg_access_qualifier --bitfield-enum
>> clc_kernel_arg_access_qualifier --allowlist-type
>> clc_kernel_arg_type_qualifier --bitfield-enum clc_kernel_arg_type_qualif=
ier
>> --allowlist-type gl_access_qualifier --bitfield-enum gl_access_qualifier
>> --allowlist-function 'glsl_.*' --allowlist-function 'nir_.*'
>> --allowlist-var nir_debug --allowlist-var 'NIR_DEBUG_.*' --bitfield-enum
>> nir_lower_int64_options --bitfield-enum nir_opt_if_options --bitfield-en=
um
>> nir_variable_mode --allowlist-function 'should_.*_nir' --allowlist-funct=
ion
>> 'spirv_.*' --allowlist-function 'pipe_.*' --allowlist-var 'PIPE_.*'
>> --allowlist-type pipe_endian --bitfield-enum pipe_map_flags
>> --allowlist-type pipe_query_type --constified-enum-module pipe_query_typ=
e
>> --allowlist-type pipe_resource_usage --bitfield-enum pipe_resource_usage
>> --allowlist-type pipe_tex_filter --constified-enum-module pipe_tex_filte=
r
>> --allowlist-type pipe_tex_wrap --constified-enum-module pipe_tex_wrap
>> --allowlist-type pipe_swizzle --constified-enum-module pipe_swizzle
>> --allowlist-function 'rusticl_.*' --allowlist-function 'std(err|out)_ptr=
'
>> --allowlist-function mmap --allowlist-function munmap --allowlist-var
>> 'MAP_.*' --allowlist-var 'PROT_.*' --allowlist-var 'WINSYS_HANDLE_TYPE_.=
*'
>> --experimental --wrap-static-fns --wrap-static-fns-path
>> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/me=
sa/26.1.2/build/src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
>> --rust-target 1.96.0 --rust-edition 2021 -- -fno-builtin-malloc
>> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
>> '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGREPORT=3D"
>> https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1
>> -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915
>> -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600
>> -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK
>> -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS
>> -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=
=3D1
>> -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=
=3D1
>> -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DE=
C=3D1
>> -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM
>> -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
>> -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0
>> -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE
>> -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
>> -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
>> -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64
>> -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ
>> -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL
>> -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL
>> -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P
>> -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P
>> -DHAVE___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST
>> -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
>> -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
>> -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
>> -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
>> -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
>> -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
>> -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT1=
28
>> -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
>> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
>> -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY
>> -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H
>> -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H
>> -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R
>> -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE
>> -DHAVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R
>> -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
>> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR
>> -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB
>> -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY
>> -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"'
>> -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1
>> -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITI=
ZER=3D0
>> -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT
>> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI
>> -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=
=3D1
>> -DHAVE_RENDERDOC_INTEGRATION=3D1 -m64 -march=3Dnehalem -mtune=3Dgeneric
>> -mfpmath=3Dsse -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=
=3D2
>> -Wformat -Wformat-security -Werror=3Dformat-security
>> --sysroot=3D/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64=
-oe-linux/mesa/26.1.2/recipe-sysroot
>> --target=3Dx86_64-oe-linux -D_FILE_OFFSET_BITS=3D64
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/src/gallium/include
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/src/gallium/include
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/src/gallium/auxiliary
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/src/gallium/auxiliary
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/include/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/include/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/src/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/src/.
>> -DNDEBUG
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/src/compiler/nir/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/src/compiler/nir/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/src/compiler/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/src/compiler/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/src/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/src/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/sources/mesa-26.1.2/include/.
>> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/=
mesa/26.1.2/build/include/.
>> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
>> '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGREPORT=3D"
>> https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1
>> -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915
>> -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600
>> -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK
>> -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS
>> -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=
=3D1
>> -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=
=3D1
>> -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DE=
C=3D1
>> -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM
>> -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
>> -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0
>> -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE
>> -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
>> -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
>> -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64
>> -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ
>> -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL
>> -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL
>> -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P
>> -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P
>> -DHAVE___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST
>> -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
>> -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
>> -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
>> -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
>> -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
>> -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
>> -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT1=
28
>> -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
>> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
>> -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY
>> -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H
>> -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H
>> -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R
>> -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE
>> -DHAVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R
>> -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
>> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR
>> -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB
>> -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY
>> -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"'
>> -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1
>> -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITI=
ZER=3D0
>> -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT
>> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI
>> -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=
=3D1
>> -DHAVE_RENDERDOC_INTEGRATION=3D1 -std=3Dc11 -MD -MQ
>> ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_bindin=
gs.h
>> -MF src/gallium/frontends/rusticl/rusticl_mesa_bindings.h.d
>> | panicked at
>> /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/bitbake/clan=
g-sys-1.8.1/src/support.rs:189:45:
>> | called `Result::unwrap()` on an `Err` value: "could not run executable
>> `/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/recipe-sysroot/usr/bin/clang-22`:
>> No such file or directory (os error 2)"
>>
>> Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 to
>> achieve this.
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc
>> b/meta/recipes-graphics/mesa/mesa.inc
>> index f8e294076a..ed95a29446 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -63,6 +63,7 @@ replace_llvm_config_path() {
>>
>>  do_configure:prepend:class-target() {
>>      replace_llvm_config_path
>> +    ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 ${STAGING_BINDIR}/clang-22
>>  }
>>
>>  do_configure:prepend:class-nativesdk() {
>> --
>> 2.54.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240118):
> https://lists.openembedded.org/g/openembedded-core/message/240118
> Mute This Topic: https://lists.openembedded.org/mt/120068848/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa23810655ee789d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Khem,<div dir=3D"auto"><br></div><div dir=3D"auto">I d=
on&#39;t have access to my build Maschine this week so I can&#39;t test it =
but this patch probably fixes the issue:</div><div dir=3D"auto"><a href=3D"=
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathieu/=
master-next&amp;id=3D06d225db716ebe06e8dcead364386825e402beb7">https://git.=
openembedded.org/openembedded-core-contrib/commit/?h=3Dmathieu/master-next&=
amp;id=3D06d225db716ebe06e8dcead364386825e402beb7</a></div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">Khem Raj via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; schrieb am Fr., 3. Juli 2026,=
 16:42:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Hi Markus=
,<br><br>Hardcoding the LLVM version like this is fragile. We should look f=
or a more robust way to handle the clang dependency that doesn&#39;t rely o=
n a specific version number in the path.<br><br>Best regards,<br><br>Khem R=
aj<div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Jul 1, 2026, 9:38=E2=80=AFAM Markus Volk via <a hr=
ef=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">l=
ists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.o=
penembedded.org" target=3D"_blank" rel=3D"noreferrer">t-online.de@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Build checks if ${STAGING_BINDIR}/clang-22 is available and ru=
nnable<br>
<br>
| FAILED: [code=3D101] src/gallium/frontends/rusticl/rusticl_mesa_bindings.=
rs src/gallium/frontends/rusticl/rusticl_mesa_bindings.c<br>
| /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/recipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.2/src/g=
allium/frontends/rusticl/rusticl_mesa_bindings.h --output /home/flk/bitbake=
/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/=
gallium/frontends/rusticl/rusticl_mesa_bindings.rs --wrap-unsafe-ops --raw-=
line &#39;#![allow(clippy::all)]&#39; --raw-line &#39;#![allow(improper_cty=
pes)]&#39; --raw-line &#39;#![allow(unused_unsafe)]&#39; --raw-line &#39;#!=
[allow(non_camel_case_types)]&#39; --raw-line &#39;#![allow(non_snake_case)=
]&#39; --raw-line &#39;#![allow(non_upper_case_globals)]&#39; --raw-line &#=
39;#![allow(unsafe_op_in_unsafe_fn)]&#39; --raw-line &#39;#![allow(unnecess=
ary_transmutes)]&#39; --raw-line &#39;#![allow(warnings)]&#39; --no-convert=
-floats --default-enum-style rust --with-derive-partialeq --with-derive-eq =
--with-derive-partialord --with-derive-ord --with-derive-hash --with-derive=
-default --anon-fields-prefix anon_ --use-array-pointers-in-arguments --all=
owlist-function &#39;blob_.*&#39; --allowlist-function &#39;disk_cache_.*&#=
39; --allowlist-type float_controls --allowlist-function &#39;mesa_.*&#39; =
--allowlist-var &#39;OS_.*&#39; --allowlist-function &#39;rz?alloc_.*&#39; =
--allowlist-var &#39;BLAKE3_.*&#39; --allowlist-function &#39;_mesa_blake3_=
.*&#39; --allowlist-function &#39;u_.*&#39; --allowlist-function &#39;util_=
format_.*&#39; --allowlist-function &#39;util_queue_.*&#39; --allowlist-fun=
ction &#39;util_vma_.*&#39; --allowlist-function util_get_cpu_caps --no-cop=
y util_vma_heap --no-copy util_queue --no-copy util_queue_fence --allowlist=
-type &#39;cl_sampler_.*_mode&#39; --constified-enum-module &#39;cl_sampler=
_.*_mode&#39; --allowlist-function &#39;clc_.*&#39; --allowlist-type clc_ke=
rnel_arg_access_qualifier --bitfield-enum clc_kernel_arg_access_qualifier -=
-allowlist-type clc_kernel_arg_type_qualifier --bitfield-enum clc_kernel_ar=
g_type_qualifier --allowlist-type gl_access_qualifier --bitfield-enum gl_ac=
cess_qualifier --allowlist-function &#39;glsl_.*&#39; --allowlist-function =
&#39;nir_.*&#39; --allowlist-var nir_debug --allowlist-var &#39;NIR_DEBUG_.=
*&#39; --bitfield-enum nir_lower_int64_options --bitfield-enum nir_opt_if_o=
ptions --bitfield-enum nir_variable_mode --allowlist-function &#39;should_.=
*_nir&#39; --allowlist-function &#39;spirv_.*&#39; --allowlist-function &#3=
9;pipe_.*&#39; --allowlist-var &#39;PIPE_.*&#39; --allowlist-type pipe_endi=
an --bitfield-enum pipe_map_flags --allowlist-type pipe_query_type --consti=
fied-enum-module pipe_query_type --allowlist-type pipe_resource_usage --bit=
field-enum pipe_resource_usage --allowlist-type pipe_tex_filter --constifie=
d-enum-module pipe_tex_filter --allowlist-type pipe_tex_wrap --constified-e=
num-module pipe_tex_wrap --allowlist-type pipe_swizzle --constified-enum-mo=
dule pipe_swizzle --allowlist-function &#39;rusticl_.*&#39; --allowlist-fun=
ction &#39;std(err|out)_ptr&#39; --allowlist-function mmap --allowlist-func=
tion munmap --allowlist-var &#39;MAP_.*&#39; --allowlist-var &#39;PROT_.*&#=
39; --allowlist-var &#39;WINSYS_HANDLE_TYPE_.*&#39; --experimental --wrap-s=
tatic-fns --wrap-static-fns-path /home/flk/bitbake/bitbake-builds/oe/build/=
tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/frontends/rusticl=
/rusticl_mesa_bindings.c --rust-target 1.96.0 --rust-edition 2021 -- -fno-b=
uiltin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMI=
T_MACROS &#39;-DPACKAGE_VERSION=3D&quot;26.1.2&quot;&#39; &#39;-DPACKAGE_BU=
GREPORT=3D&quot;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issue=
s" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitla=
b.freedesktop.org/mesa/mesa/-/issues</a>&quot;&#39; -DHAVE_OPENGL=3D1 -DHAV=
E_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915 -DHAVE_I=
RIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEONSI =
-DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_S=
YSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=3D1 =
-DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC_H265DEC=
=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1EN=
C=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JP=
EGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_=
SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=
=3D0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE -DGLX=
_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PRO=
TO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DH=
AVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE_=
__BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILT=
IN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_PO=
PCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -=
DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILT=
IN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN=
 -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIB=
UTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_W=
EAK -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_A=
TTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_=
NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_F=
UNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN=
 -D_GNU_SOURCE -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMI=
C_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -DHAV=
E_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_=
H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -=
DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRT=
OK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_SY=
SCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_N=
AME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_ST=
RTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS=
 -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_S=
ETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV &#39;-DMESA_LLVM_VERSION_STRING=3D&=
quot;22.1.8&quot;&#39; -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD=
_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBEL=
F -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIME=
OUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DR=
I -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=
=3D1 -DHAVE_RENDERDOC_INTEGRATION=3D1 -m64 -march=3Dnehalem -mtune=3Dgeneri=
c -mfpmath=3Dsse -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D=
2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/fl=
k/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/r=
ecipe-sysroot --target=3Dx86_64-oe-linux -D_FILE_OFFSET_BITS=3D64 -I/home/f=
lk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/=
sources/mesa-26.1.2/src/gallium/include -I/home/flk/bitbake/bitbake-builds/=
oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/include =
-I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/sources/mesa-26.1.2/src/gallium/auxiliary -I/home/flk/bitbake/bitb=
ake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/galli=
um/auxiliary -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64=
-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/include/. -I/home/flk/bitbake/bit=
bake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/include/=
. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/=
build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/. -DNDEBUG -I/home/=
flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2=
/sources/mesa-26.1.2/src/compiler/nir/. -I/home/flk/bitbake/bitbake-builds/=
oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/nir/. -=
I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa=
/26.1.2/sources/mesa-26.1.2/src/compiler/. -I/home/flk/bitbake/bitbake-buil=
ds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/. -I=
/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/=
26.1.2/sources/mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/buil=
d/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/. -I/home/flk/bitbake/b=
itbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa=
-26.1.2/include/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/core=
i7-64-oe-linux/mesa/26.1.2/build/include/. -D__STDC_CONSTANT_MACROS -D__STD=
C_FORMAT_MACROS -D__STDC_LIMIT_MACROS &#39;-DPACKAGE_VERSION=3D&quot;26.1.2=
&quot;&#39; &#39;-DPACKAGE_BUGREPORT=3D&quot;<a href=3D"https://gitlab.free=
desktop.org/mesa/mesa/-/issues" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/issues</a>&quot;=
&#39; -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAV=
E_CROCUS -DHAVE_I915 -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300=
 -DHAVE_R600 -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAV=
E_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSI=
ONS -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264EN=
C=3D1 -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1=
DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPE=
G12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM =
-DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_=
XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIE=
RS -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX=
_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D=
0 -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -=
DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BU=
ILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_P=
OPCOUNT -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___B=
UILTIN_TYPES_COMPATIBLE_P -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_AD=
D_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -D=
HAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIB=
UTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RES=
ULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATT=
RIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_A=
LIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_F=
UNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_R=
EALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41 -DHAVE___BUILTIN_IA32=
_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -D=
HAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -=
DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINU=
X_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM=
_R -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DH=
AVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC =
-DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DH=
AVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSU=
PPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHA=
VE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV &#39;-DM=
ESA_LLVM_VERSION_STRING=3D&quot;22.1.8&quot;&#39; -DLLVM_IS_SHARED=3D1 -DDR=
AW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DH=
AVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -D=
HAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPEN=
MP -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_D=
RISW_KMS -DHAVE_LIBSENSORS=3D1 -DHAVE_RENDERDOC_INTEGRATION=3D1 -std=3Dc11 =
-MD -MQ ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_b=
indings.h -MF src/gallium/frontends/rusticl/rusticl_mesa_bindings.h.d<br>
| panicked at /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/b=
itbake/clang-sys-1.8.1/src/support.rs:189:45:<br>
| called `Result::unwrap()` on an `Err` value: &quot;could not run executab=
le `/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/recipe-sysroot/usr/bin/clang-22`: No such file or directory (os =
error 2)&quot;<br>
<br>
Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 to ach=
ieve this.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" rel=3D"=
noreferrer noreferrer" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index f8e294076a..ed95a29446 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -63,6 +63,7 @@ replace_llvm_config_path() {<br>
<br>
=C2=A0do_configure:prepend:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0replace_llvm_config_path<br>
+=C2=A0 =C2=A0 ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 ${STAGING_BINDIR}/c=
lang-22<br>
=C2=A0}<br>
<br>
=C2=A0do_configure:prepend:class-nativesdk() {<br>
-- <br>
2.54.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240118): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240118" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/240118</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120068848/361=
8223" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120068848/3618223</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:f_l_k@t-online.=
de" target=3D"_blank" rel=3D"noreferrer">f_l_k@t-online.de</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000aa23810655ee789d--

