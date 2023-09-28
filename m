Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5608EE743C2
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 20:34:36 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.3194.1695933269683848003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 13:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUaedVj6;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3af604c3f8fso1434308b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695933269; x=1696538069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=segU39IMyXLi7R6ylqjlp0/ZVLQaaUj6CrhJqX+LHAI=;
        b=XUaedVj6j4s4NeO+yxLfg2T45eSjFr07fMKIFVR02cUqCgGf+5T1qmwmo/YGXXOe2X
         bijfA46x+chCSpddEW+sJrRnD8730F/M953bILFFAs6oVzseamiae/yimu3128B0VaX3
         f3Pqc5cerlZDEbozPpnFszhcm8zwKE8FrroUPCtBHd1GuLTECSCM0HR/5NozBfk9sq6J
         YMsdAs3QivsQJeLxo2JTB5PN/VvAlwMka55M87aYLwyWS3iac0R++w4LXpP5XecylluA
         DhM79mpLn7ZhyeoWko+dhTx88wEnKPTNswzzP8O9hiNy9SCTPPS5bM17GjWW/S8dIAn2
         SBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695933269; x=1696538069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=segU39IMyXLi7R6ylqjlp0/ZVLQaaUj6CrhJqX+LHAI=;
        b=qhLpepVmTSJj8debsqlw0k1ASzBpIJ2l7Jqiq8KQvZM9ZoRx/cd6ZWSen9S5winn6+
         E1AfAQbHbRTG8ZSunp/YO5PnaAtClFAJFiNxc7jDJheH3RMr6K/iGfXouT1cMUUT02/V
         PkD6dtRx0uyLfE2cmpYy5mcbPIKUPnwopOFAKWq70K422JyF15Una//F26yXeBin1pzl
         MTP40mz8qK0Wy3xbEj0/gHYcK/UtkqmJ+2jC8/RRUPtH3Yr3NjMXW20M1QjWJgcBm8iG
         8OLbq8yC5nc7kdsVYqHzb9Hc9DUkckemeIKlyL4SzD0CM+UISpiy1emDjsNE+dsnzLTa
         Uqyg==
X-Gm-Message-State: AOJu0Yw+/xbdsXOhu6wo3etxQ3mahbmAoi7PyTqhs9LJh0YYWQNwzuKO
	bMF/NU/UKbvmvjp4paGGaGIKmgcbkCci6JC7iKk=
X-Google-Smtp-Source: AGHT+IFE4efBtDnje9f03xbwXucMiLfVlIEhLvJYrqnA1Lo2LtYo/lt1VSPG47QPXLP9OT0yBzD/TEiyOnVP+W8W3N0=
X-Received: by 2002:a05:6870:818e:b0:1dc:86e5:ebd6 with SMTP id
 k14-20020a056870818e00b001dc86e5ebd6mr2596975oae.39.1695933268740; Thu, 28
 Sep 2023 13:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230922163721.477463-1-raj.khem@gmail.com> <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
 <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com>
In-Reply-To: <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 13:34:02 -0700
Message-ID: <CAMKF1sqraCxWoQyk8a7iekHiySrV2nJEQ42sMyMaXR3OFvh6Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Update clang-17 patch to upstream v2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 20:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188379

Can you check if the machines where it fails has llvm-14-dev package
installed on host ?

On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> its linking with  /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is not
> correct. Somehow its finding llvm library on your build host.
>
> On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../0001-gallium-Fix-build-with-llvm-17.patch | 27 ++++++++++++-----=
--
> > >  1 file changed, 18 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-=
with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-buil=
d-with-llvm-17.patch
> > > index 3631a918b0c..0ca7a22b45b 100644
> > > --- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-ll=
vm-17.patch
> > > +++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-ll=
vm-17.patch
> > > @@ -1,4 +1,4 @@
> > > -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00 20=
01
> > > +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 20=
01
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Fri, 23 Jun 2023 01:20:38 -0700
> > >  Subject: [PATCH] gallium: Fix build with llvm 17
> > > @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >=3D 1=
7
> > >  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa=
/-/merge_requests/23827]
> > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  ---
> > > - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
> > > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > > + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
> > > + 1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/galli=
um/auxiliary/gallivm/lp_bld_init.c
> > > -index 24d0823..3d4573e 100644
> > >  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
> > >  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> > > -@@ -42,8 +42,10 @@
> > > +@@ -42,19 +42,23 @@
> > >
> > >   #include <llvm/Config/llvm-config.h>
> > >   #include <llvm-c/Analysis.h>
> > > @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
> > >   #include <llvm-c/Transforms/Utils.h>
> > >   #endif
> > >   #include <llvm-c/BitWriter.h>
> > > ---
> > > -2.41.0
> > > -
> > > + #if GALLIVM_USE_NEW_PASS =3D=3D 1
> > > + #include <llvm-c/Transforms/PassBuilder.h>
> > > +-#elif GALLIVM_HAVE_CORO =3D=3D 1
> > > ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
> > > + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETECT_ARC=
H_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
> > > + #include <llvm-c/Transforms/IPO.h>
> > > + #endif
> > > ++#if LLVM_VERSION_MAJOR < 17
> > > + #include <llvm-c/Transforms/Coroutines.h>
> > > + #endif
> > > ++#endif
> > > +
> > > + unsigned gallivm_perf =3D 0;
> > > +
> >
> > I think this patch may have broken against with the recent llvm point
> > release?
> >
> > DEBUG: Executing shell function do_compile
> >
> > [1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-native/python3 =
../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
> > [2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/ta=
rgets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-up=
grades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native=
/usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-un=
defined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,-=
-enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib =
-Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_6=
4-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/=
ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/=
recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgr=
ades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/l=
ib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/tt=
orling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-=
linux-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build=
/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,=
/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nat=
ive/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/=
workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sy=
sroot-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/l=
ibdri.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/util/l=
ibmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/=
compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir=
/libnir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/a=
uxiliary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-=
glapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_st=
atic.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw=
/null/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsy=
s/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium=
/drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a =
src/gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonw=
insys.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/lib=
radeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium=
/drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeon=
si_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/driv=
ers/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_=
gfx11.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgp=
u/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_=
common.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/l=
ibnouveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/driv=
ers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/win=
sys/i915/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/=
libisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a s=
rc/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/=
intel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/int=
el/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/=
isl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/i=
sl/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl=
/libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium=
/winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/gall=
ium/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirgl=
common.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers=
/iris/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium=
/drivers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_h=
w_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/dri=
vers/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a sr=
c/intel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libint=
el-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/driv=
ers/crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a =
src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/cro=
cus/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ve=
r60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drive=
rs/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per=
_hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=
=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/g=
allium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/ga=
llium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/b=
uild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib=
/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 =
-pthread /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b/libexpat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/wor=
k/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/.=
./../../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pk=
gconfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/=
usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-=
upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/=
workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sy=
sroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/buil=
d/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.=
8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so =
-Wl,--end-group
> > FAILED: src/gallium/targets/dri/libgallium_dri.so
> > g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/targets/d=
ri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upgrades/=
build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/li=
b -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-undefined=
 -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--enable=
-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp=
/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -Wl,-rp=
ath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/ttorlin=
g/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-=
sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,=
-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/ttorling/=
workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x=
86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorli=
ng/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe=
-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/srv/bu=
ild/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.=
1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/workspa=
ce-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/libdri.a=
 src/util/libmesa_util.a src/util/format/libmesa_format.a src/util/libmesa_=
util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/compile=
r/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/libnir=
.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/auxiliar=
y/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/l=
ibglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a =
src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/null/l=
ibws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dr=
i/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/driver=
s/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a src/gal=
lium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwinsys.a=
 src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/libradeons=
i_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/driver=
s/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeonsi_gfx9=
.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/drivers/rad=
eonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_gfx11.a=
 src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu/drm/l=
ibamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.=
a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/libnouve=
auwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/drivers/nou=
veau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/winsys/i91=
5/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/libisl.=
a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a src/inte=
l/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/intel/i=
sl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/=
libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/lib=
isl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libi=
sl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/libisl=
_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/winsys=
/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/gallium/win=
sys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglcommon.=
a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/iris/l=
ibiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/driver=
s/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw_ver11=
0.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/drivers/ir=
is/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src/intel=
/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libintel-driv=
er-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/drivers/cro=
cus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a src/gal=
lium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/crocus/lib=
crocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a s=
rc/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drivers/croc=
us/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_hw_ver=
80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1 =
-Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/workspace-upgrad=
es/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium/t=
argets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace-upgrade=
s/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium/ta=
rgets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/build/tmp=
/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconf=
ig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread=
 /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-na=
tive/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libexp=
at.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/me=
sa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/l=
ibz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64=
-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../=
usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/build/tmp/wo=
rk/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/=
../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/=
pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/build/ttorli=
ng/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe=
-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so -Wl,--en=
d-group
> > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/gall=
ium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in function `llvm::=
SmallVectorTemplateBase<std::__cxx11::basic_string<char, std::char_traits<c=
har>, std::allocator<char> >, false>::grow(unsigned long)':
> > lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cxx1112b=
asic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVectorTem=
plateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm]=
+0x36): undefined reference to `llvm::SmallVectorBase<unsigned int>::malloc=
ForGrow(void*, unsigned long, unsigned long, unsigned long&)'
> > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/amd/=
llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `llvm::DataLa=
yout::getTypeSizeInBits(llvm::Type*) const':
> > ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_=
4TypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4): undefine=
d reference to `llvm::TargetExtType::getLayoutType() const'
> > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/amd/=
llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `ac_create_pa=
ssmgr':
> > ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined reference =
to `llvm::createPromoteMemoryToRegisterPass(bool)'
> > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: ac_llvm_=
helper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to `llvm::cr=
eateSROAPass(bool)'
> > collect2: error: ld returned 1 exit status
> > ninja: build stopped: subcommand failed.
> > INFO: autodetecting backend as ninja
> > INFO: calculating backend command to run: /srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nat=
ive/usr/bin/ninja -j 24 -v
> > WARNING: /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit 1 from 'meson =
compile -v -j 24'
> > WARNING: Backtrace (BB generated script):
> >         #1: meson_do_compile, /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, l=
ine 155
> >         #2: do_compile, /srv/build/ttorling/workspace-upgrades/build/tm=
p/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 15=
0
> >         #3: main, /srv/build/ttorling/workspace-upgrades/build/tmp/work=
/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 159
> >
> > (log borrowed from Tim but I'm seeing a similar issue)
> >
> > Cheers,
> >
> > Richard

