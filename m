Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F6EC369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:12:28 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.4385.1744661539820640563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 13:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bF26nZ4b;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-601e3f2cee1so2288525eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744661539; x=1745266339; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6NMuiApvsD99HfMFWzRUqNtLNvjUricXkKFBstXtzQ=;
        b=bF26nZ4bDKemcirUOslfCqvsFwan7tWLG91P6YhLhet9avmbABWwk5y0NKrYcb0ECp
         SAiUBk6vBGnD+WYsYz33ddmMYHwEIgjxHxgf8wuDHQ3Md2nQywJJXZOM18dBUX2DeHuw
         NMVdcOZsdCXBuDykwJRtA0TWSxI4gpwyvzD9TIoWkX9kCD2quS1M3rm8EswwpYnz2xtk
         dZ0Ia5F7CWwr9nFwu26AJG/ZrT+VIXUnKt6rBoj8qVNRLjHdQZ0kNyLWz7sPms5gN0dW
         pMsiqtlNgATuWyM+N2CKo1AOppJw2eHNcplq85BBPmXoXm9M3APhrQsSKFhMq7+QhHIZ
         W0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744661539; x=1745266339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6NMuiApvsD99HfMFWzRUqNtLNvjUricXkKFBstXtzQ=;
        b=SdIKYWWTPIXYSzjHyyULQ45pTx6e6hDkckbBVf+nLN3GbjjW/a8/njFiXW82hUXYth
         J7tbgT9YVNHWaA6NGv5BtQ+QWx496FH5wAydhV41yNE+rWvyUXFdV8t13F5En8tuZ9Ye
         Ff+5xWqXP9RxLeBwnnPwPxwIXUPK/sYFMPEmAR4z1rUzc/NNHoi5IQm+Pmql45K/vwxG
         xfmlU1Mpm0kSkW0c6Ss4J34bxFjQgkDo/NFjgpKKMyb5cjSVBZ0IUPKCKknbpJnQ9aSu
         zKl04VrUni3Dz6BGv6VFvaZgUsJfw+qBhggRjc3rwz1WZ2d5ygbMy3GDiCcZmVLIdIFZ
         nC0A==
X-Forwarded-Encrypted: i=1; AJvYcCXtCzYhMLOZrsp2YpIeNZZRnO/DAeLMRFeCfvR62lK4OD6VApGSl9DgWXYnQBSidzDKBbXGvE+aHqHg/L8H01gn6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzB9uGCrUsgnMl2J14oUmYqvzCsrVFcAjPti7gNRy7O0HYKntTf
	eqiJZUwwUO0e6qwCwu/r13nTqSvxkzwqOei2571006ySzAgfQMVJcnLFRy80z+qbdA8UYpIcJej
	8c3HKLjFkB4DTxXlvk1UogoE9Qqg=
X-Gm-Gg: ASbGnctzZY4+nJs+WZEcP79j+YKvHWNlJCSKkfs7PQBWCc/fL9gbc8ehCc3omRA9Y6Y
	0aUzXayPpd5rLLKFafXSsIIao1GJwVrC054n336akB5vQNqAMo3iHijPJyr8tfjr0yEJtAZS1Ik
	m5QhOPIa4zeOYkbyCpXPM+
X-Google-Smtp-Source: AGHT+IFYDtPZ0C5d/Rpwsf0aDPkHFnHz0Wn5ZMRDh5XI8i6t+GOZQIkGoEba1hgXErbrPAOe6XHhz55CRvSoU7EGEtw=
X-Received: by 2002:a05:6820:2d04:b0:603:f820:7be7 with SMTP id
 006d021491bc7-6046f5f4b15mr7993129eaf.8.1744661538832; Mon, 14 Apr 2025
 13:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-1-791840391271@oss.qualcomm.com>
 <CA+chaQdOxFvAzdia+o8ocaF8zpf_hYsvLG0tW+7ygwpeY8cYaQ@mail.gmail.com>
 <0214a9e5-0242-448b-b078-9ba202685943@oss.qualcomm.com> <CAMKF1sqC5s1Wd+Cc9pTjqUuK687iNcyT0GefJ6JBgm=S8WjgRw@mail.gmail.com>
 <CA+chaQfGcEOsznLojbsfj_Rxz4OGBeG8jsvgNR7a+nP9ViyAGQ@mail.gmail.com>
In-Reply-To: <CA+chaQfGcEOsznLojbsfj_Rxz4OGBeG8jsvgNR7a+nP9ViyAGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Apr 2025 13:11:52 -0700
X-Gm-Features: ATxdqUHVqEuwW2Kbd6OIoZOvttui0QujLPH14AgrUL4awMBt2bXqvL89qK9BIBQ
Message-ID: <CAMKF1spJDS_svyZ3VSZn6vRqSqk86iom8HxShH0R7rMGhRcEJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] mesa: drop kmsro PACKAGECONFIG
To: Martin Jansa <martin.jansa@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214809

On Sat, Apr 12, 2025 at 11:46=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> On Sat, Apr 12, 2025 at 7:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > I am still seeing an error with all updates applied
> >
> > https://errors.yoctoproject.org/Errors/Details/852167/
>
> I'm seeing this one for target qemux86-64 builds as well, mesa-native
> seems to be fixed after meta-clang update.

I think the build failure is happening when we enable rm_work and
perhaps meta-clang is required too ( I have not done a build without
meta-clang )
Opened a tracker on YP bigzilla -
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15831

>
> >
> > On Sat, Apr 12, 2025 at 6:52=E2=80=AFAM Dmitry Baryshkov via
> > lists.openembedded.org
> > <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> > >
> > > On 12/04/2025 13:27, Martin Jansa wrote:
> > > > Thanks, I've sent PR for meta-raspberryip:
> > > > https://github.com/agherzan/meta-raspberrypi/pull/1456
> > > >
> > > > There is one more separate issue which mesa_clc in mesa-native buil=
ds,
> > > > possibly only in combination with using meta-clang, is it what you'=
ve
> > > > fixed with last 3 meta-clang commits from you?
> > >
> > > Yes, this is the LDFLAGS issue if I remember correctly. It should be
> > > fixed by the meta-clang PR that Khem has merged. Please ping me if it
> > > still can be reproduced.
> > >
> > > >
> > > > In some builds I've noticed failure like:
> > > > FAILED: src/intel/shaders/intel_gfx80_shaders.spv
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc
> > > > ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> > > > ../mesa-25.0.2/src/intel/shaders/generate.cl
> > > > ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> > > > ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> > > > ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> > > > ../mesa-25.0.2/src/intel/shaders/util.cl -o
> > > > src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> > > > -DGFX_VERx10=3D80
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/shaders/.
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/compiler/libcl
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/genxml
> > > > /bin/sh: line 1:
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc:
> > > > No such file or directory
> > > >
> > > > I haven't reproduced it locally yet, seen it couple times from jenk=
ins
> > > > builds, I guess it might be related to rm_work and mesa_clc using -=
L
> > > > pointing to clang-native's libdir/WORKDIR which might be already
> > > > cleaned by rm_work:
> > > >
> > > > # grep mesa_clc log.do_compile
> > > > [8/2437] gcc -Isrc/compiler/clc/mesa_clc.p -Isrc/compiler/clc
> > > > -I../mesa-25.0.2/src/compiler/clc -Iinclude -I../mesa-25.0.2/includ=
e
> > > > -Isrc -I../mesa-25.0.2/src
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/include
> > > > -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wal=
l
> > > > -Winvalid-pch -std=3Dc11 -mtls-dialect=3Dgnu2
> > > > -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototype=
s
> > > > -Werror=3Dreturn-type -Werror=3Dempty-body
> > > > -Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion
> > > > -Wimplicit-fallthrough -Wmisleading-indentation
> > > > -Wno-missing-field-initializers -Wno-format-truncation
> > > > -Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common
> > > > -Wno-unknown-pragmas -Wno-unused-function -Werror=3Dformat
> > > > -Wformat-security -ffunction-sections -fdata-sections -O2 -pipe
> > > > -pthread -isystemTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/=
recipe-sysroot-native/usr/include
> > > > -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACR=
OS
> > > > '-DPACKAGE_VERSION=3D"25.0.2"'
> > > > '-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/=
issues"'
> > > > -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1
> > > > -DHAVE_SOFTPIPE -DHAVE_I915 -DHAVE_CROCUS -DHAVE_R300 -DHAVE_NOUVEA=
U
> > > > -DHAVE_LLVMPIPE -DHAVE_IRIS -DHAVE_RADEONSI -DHAVE_SVGA -DHAVE_R600
> > > > -DHAVE_VIRGL -DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0
> > > > -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H264ENC=3D0
> > > > -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_A=
V1DEC=3D1
> > > > -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DHAVE_WAYLAND_PL=
ATFORM
> > > > -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
> > > > -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DGLX_INDIRECT_RENDERING
> > > > -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
> > > > -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
> > > > -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
> > > > -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZL=
L
> > > > -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
> > > > -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
> > > > -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
> > > > -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST
> > > > -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
> > > > -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
> > > > -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
> > > > -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
> > > > -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
> > > > -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
> > > > -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY
> > > > -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
> > > > -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
> > > > -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H
> > > > -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H
> > > > -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_SYS_INOTIFY_H
> > > > -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
> > > > -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R
> > > > -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV
> > > > -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC
> > > > -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
> > > > -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L
> > > > -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPU=
S
> > > > -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD
> > > > -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM
> > > > '-DMESA_LLVM_VERSION_STRING=3D"20.1.2"' -DLLVM_IS_SHARED=3D1
> > > > -DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=
=3D1
> > > > -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF
> > > > -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED
> > > > -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM
> > > > -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS
> > > > -Wno-override-init -MD -MQ src/compiler/clc/mesa_clc.p/mesa_clc.c.o
> > > > -MF src/compiler/clc/mesa_clc.p/mesa_clc.c.o.d -o
> > > > src/compiler/clc/mesa_clc.p/mesa_clc.c.o -c
> > > > ../mesa-25.0.2/src/compiler/clc/mesa_clc.c
> > > > ../mesa-25.0.2/src/compiler/clc/mesa_clc.c: In function =E2=80=98ma=
in=E2=80=99:
> > > > ../mesa-25.0.2/src/compiler/clc/mesa_clc.c:152:7: warning: ignoring
> > > > return value of =E2=80=98fread=E2=80=99 declared with attribute =E2=
=80=98warn_unused_result=E2=80=99
> > > > [-Wunused-result]
> > > > [920/2437] g++  -o src/compiler/clc/mesa_clc
> > > > src/compiler/clc/mesa_clc.p/mesa_clc.c.o
> > > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib
> > > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/lib
> > > > -Wl,--as-needed -Wl,--no-undefined -Wl,--enable-new-dtags
> > > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/r=
ecipe-sysroot-native/usr/lib
> > > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/r=
ecipe-sysroot-native/lib
> > > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe=
-sysroot-native/usr/lib
> > > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe=
-sysroot-native/lib
> > > > -Wl,-O1 -Wl,--allow-shlib-undefined
> > > > -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux=
/lib/ld-linux-x86-64.so.2
> > > > -pthread -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0=
.2/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> > > > -Wl,--start-group src/compiler/clc/liblibmesaclc.a
> > > > src/compiler/nir/libnir.a src/compiler/libcompiler.a
> > > > src/util/libmesa_util.a src/util/libmesa_util_sse41.a
> > > > src/util/blake3/libblake3.a src/c11/impl/libmesa_util_c11.a
> > > > src/compiler/spirv/libvtn.a -Wl,--build-id=3Dsha1 -fPIC -O2 -pipe
> > > > -fvisibility-inlines-hidden -Wl,--enable-new-dtags
> > > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/=
recipe-sysroot-native/usr/lib
> > > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/=
recipe-sysroot-native/lib
> > > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recip=
e-sysroot-native/usr/lib
> > > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recip=
e-sysroot-native/lib
> > > > -Wl,-O1 -Wl,--allow-shlib-undefined
> > > > -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux=
/lib/ld-linux-x86-64.so.2
> > > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib
> > > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/usr/lib
> > > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/lib
> > > > -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-=
sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-opt.so
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools.so
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-link.so
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libz.so
> > > > -lm TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib/libzstd.so
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/libclang-cpp.so
> > > > -isystemTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-s=
ysroot-native/usr/include
> > > > -O2 -fvisibility-inlines-hidden -Wl,--enable-new-dtags -Wl,-O1
> > > > -Wl,--allow-shlib-undefined
> > > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib
> > > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/usr/lib
> > > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot=
-native/lib
> > > > -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-=
sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libLLVMSPIRVLib.a
> > > > -Wl,--end-group
> > > > [921/2437] TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/=
src/compiler/clc/mesa_clc
> > > > ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> > > > ../mesa-25.0.2/src/intel/shaders/generate.cl
> > > > ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> > > > ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> > > > ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> > > > ../mesa-25.0.2/src/intel/shaders/util.cl -o
> > > > src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> > > > -DGFX_VERx10=3D80
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/shaders/.
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/compiler/libcl
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/genxml
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc
> > > > ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> > > > ../mesa-25.0.2/src/intel/shaders/generate.cl
> > > > ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> > > > ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> > > > ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> > > > ../mesa-25.0.2/src/intel/shaders/util.cl -o
> > > > src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> > > > -DGFX_VERx10=3D80
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/shaders/.
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/compiler/libcl
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> > > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src=
/intel/genxml
> > > > /bin/sh: line 1:
> > > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compile=
r/clc/mesa_clc:
> > > > No such file or directory
> > > >
> > > >
> > > > On Sat, Apr 12, 2025 at 12:09=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >>
> > > >> Mesa has dropped support for separate kmsro option to gallium-driv=
ers.
> > > >> Drop it from the recipe and drop the now-unused PACKAGECONFIG too.
> > > >>
> > > >> Reported-by: Martin Jansa <martin.jansa@gmail.com>
> > > >> Closes: https://lore.kernel.org/r/CA+chaQeWA01kB3q6=3Do4xcZwA1TMgg=
HxYTZ0AZETY7he_yU3E1A@mail.gmail.com/
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com=
>
> > > >> ---
> > > >>   meta/recipes-graphics/mesa/mesa.inc | 2 --
> > > >>   1 file changed, 2 deletions(-)
> > > >>
> > > >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gr=
aphics/mesa/mesa.inc
> > > >> index aca34983e97ca684d662987d3a1d0b61ba44029a..a88cc8660e26bae43c=
713b2bfdbf396e804f6c09 100644
> > > >> --- a/meta/recipes-graphics/mesa/mesa.inc
> > > >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > >> @@ -162,7 +162,6 @@ PACKAGECONFIG[opencl] =3D " \
> > > >>   PACKAGECONFIG[broadcom] =3D ""
> > > >>   PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> > > >>   PACKAGECONFIG[freedreno] =3D ""
> > > >> -PACKAGECONFIG[kmsro] =3D ""
> > > >>   PACKAGECONFIG[vc4] =3D ""
> > > >>   PACKAGECONFIG[v3d] =3D ""
> > > >>   PACKAGECONFIG[zink] =3D ""
> > > >> @@ -177,7 +176,6 @@ GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
> > > >>
> > > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'etnaviv', ',etnaviv', '', d)}"
> > > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'freedreno', ',freedreno', '', d)}"
> > > >> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', =
'kmsro', ',kmsro', '', d)}"
> > > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'vc4', ',vc4', '', d)}"
> > > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'v3d', ',v3d', '', d)}"
> > > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'zink', ',zink', '', d)}"
> > > >>
> > > >> --
> > > >> 2.39.5
> > > >>
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#214775): https://lists.openembedded.org/g/openemb=
edded-core/message/214775
> > > Mute This Topic: https://lists.openembedded.org/mt/112219028/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

