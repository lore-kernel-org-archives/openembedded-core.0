Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2BAE732F5
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 16:56:19 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.18833.1695920176117968502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 09:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqOKrS0F;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1dce0c05171so5754683fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695920175; x=1696524975; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8PyJwIaR/e25no2dGD8kd9dDgpBr6ZOBPmLXAQIvN8=;
        b=RqOKrS0F3+cF3Z6D9MBpBQXSlad+LGuZaZyqxuRXR8HqFS0CfiOWtix1Q3iglMpZcz
         InhvhGgFwc9gcQTBL5G274t4hYeCMrHen0Am+6vWBQ16SWxrFFWu214LFZSd0n/K/Yuo
         ywVgYoGkqIHoQyZGU8BMAGLQAcJyLuBkX9IZgqmMPA4gaYhH+Okev3phl1mmcNC0FMYu
         LzrEWTbI5Q11eJ9Ij4MZL8KUMxAXwVsG9s75sFUag/OReIrESYt6HsX7uBxyEuHF17zk
         jV7yNRpLfiSoKpRo2vwjZglbusYWAHpBWP24DmbtmrCnYWtjthnamd+0dl9ixdsml5ZP
         HTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695920175; x=1696524975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8PyJwIaR/e25no2dGD8kd9dDgpBr6ZOBPmLXAQIvN8=;
        b=kyvuZzQm2z8CYUri8nnWnRHlwO9CY7fw9o4mRTeiQEgLhXc1Mi00bcdiyxT+v5mIhb
         DIQtDdXyC905EF69/VkQbkpC4BmSRELsFJtIlWVf5KvAhNMa1o9/iqyZ4+RmFJ0Ul2B8
         Ckbrn0vWaVtF8imxTPRiJcssYnu9tzUQTlaPlJDwCqg9NTBEdYrpBnmDzbfSJ3PuMGR+
         zLJQSceo60lpqeolC+YzuA24Hp/KZhPOeyKhJezCe1cf22yQXeCj+t16ageL1BgyrakS
         993DWkW3iD3wd7pjvBE+Q0hPcAFtt7UnKLaOcwdWkl+NC9UQC2X8sEQdwUtZRMLEoIdX
         L/8g==
X-Gm-Message-State: AOJu0Yyfnkb2C6BpKVTt4xQbnddZtdKS44L2IChwppYPZRrIAy24Lcbp
	uDQR6w1UqLLwcLGAtltQ6NHCm1haKY3l6htQn/w=
X-Google-Smtp-Source: AGHT+IHDKb5/O26v4hDCr/PClZlsh1dKaFeJjcyXRHCxxXRtSeI0Kmwt2R9e6Vw41uyadaZYlfMi9fk3o9oYVAtQlo4=
X-Received: by 2002:a05:6870:b6a4:b0:1d5:5659:4730 with SMTP id
 cy36-20020a056870b6a400b001d556594730mr2222364oab.37.1695920175223; Thu, 28
 Sep 2023 09:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230922163721.477463-1-raj.khem@gmail.com> <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
In-Reply-To: <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 09:55:48 -0700
Message-ID: <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Update clang-17 patch to upstream v2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188376

its linking with  /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is not
correct. Somehow its finding llvm library on your build host.

On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../0001-gallium-Fix-build-with-llvm-17.patch | 27 ++++++++++++-------
> >  1 file changed, 18 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-wi=
th-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-=
with-llvm-17.patch
> > index 3631a918b0c..0ca7a22b45b 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm=
-17.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm=
-17.patch
> > @@ -1,4 +1,4 @@
> > -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00 2001
> > +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 23 Jun 2023 01:20:38 -0700
> >  Subject: [PATCH] gallium: Fix build with llvm 17
> > @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >=3D 17
> >  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-=
/merge_requests/23827]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
> > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
> > + 1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium=
/auxiliary/gallivm/lp_bld_init.c
> > -index 24d0823..3d4573e 100644
> >  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
> >  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> > -@@ -42,8 +42,10 @@
> > +@@ -42,19 +42,23 @@
> >
> >   #include <llvm/Config/llvm-config.h>
> >   #include <llvm-c/Analysis.h>
> > @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
> >   #include <llvm-c/Transforms/Utils.h>
> >   #endif
> >   #include <llvm-c/BitWriter.h>
> > ---
> > -2.41.0
> > -
> > + #if GALLIVM_USE_NEW_PASS =3D=3D 1
> > + #include <llvm-c/Transforms/PassBuilder.h>
> > +-#elif GALLIVM_HAVE_CORO =3D=3D 1
> > ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
> > + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_=
ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
> > + #include <llvm-c/Transforms/IPO.h>
> > + #endif
> > ++#if LLVM_VERSION_MAJOR < 17
> > + #include <llvm-c/Transforms/Coroutines.h>
> > + #endif
> > ++#endif
> > +
> > + unsigned gallivm_perf =3D 0;
> > +
>
> I think this patch may have broken against with the recent llvm point
> release?
>
> DEBUG: Executing shell function do_compile
>
> [1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-native/python3 ..=
/mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
> [2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/targ=
ets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upgr=
ades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/u=
sr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-unde=
fined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--e=
nable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -W=
l,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/tt=
orling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/re=
cipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgrad=
es/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib=
 -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/ttor=
ling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-li=
nux-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/t=
torling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/s=
rv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nativ=
e/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/wo=
rkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/lib=
dri.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/util/lib=
mesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/co=
mpiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/l=
ibnir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/aux=
iliary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-gl=
api/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_stat=
ic.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/n=
ull/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/=
sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/d=
rivers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a sr=
c/gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwin=
sys.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/libra=
deonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/d=
rivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeonsi=
_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/driver=
s/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_gf=
x11.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu/=
drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_co=
mmon.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/lib=
nouveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/driver=
s/nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/winsy=
s/i915/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/li=
bisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a src=
/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/in=
tel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/intel=
/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/is=
l/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/isl=
/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/l=
ibisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/w=
insys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/galliu=
m/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglco=
mmon.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/i=
ris/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/d=
rivers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw_=
ver110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/drive=
rs/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src/=
intel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libintel=
-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/driver=
s/crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a sr=
c/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/crocu=
s/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver6=
0.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drivers=
/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_h=
w_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3D=
sha1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/workspace-u=
pgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gall=
ium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace-up=
grades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/galli=
um/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pk=
gconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pt=
hread /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/me=
sa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/l=
ibexpat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
lib/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_6=
4-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../..=
/usr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x=
86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../.=
./../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/build/t=
mp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upgrad=
es/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr=
/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/=
usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/wor=
kspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysro=
ot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/build/t=
torling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so -Wl=
,--end-group
> FAILED: src/gallium/targets/dri/libgallium_dri.so
> g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/targets/dri=
/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib =
-L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-undefined -=
shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--enable-n=
ew-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/w=
ork/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -Wl,-rpat=
h-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/ttorling/=
workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sy=
sroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-O=
1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/ttorling/wo=
rkspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86=
-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorling=
/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/srv/buil=
d/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.=
8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nat=
ive/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/libdri.a s=
rc/util/libmesa_util.a src/util/format/libmesa_format.a src/util/libmesa_ut=
il_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/compiler/=
glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/libnir.a=
 src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/auxiliary/=
libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/lib=
glapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a sr=
c/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/null/lib=
ws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dri/=
libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/drivers/=
llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a src/galli=
um/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwinsys.a s=
rc/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/libradeonsi_=
gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/drivers/=
radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeonsi_gfx9.a=
 src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/drivers/radeo=
nsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_gfx11.a s=
rc/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu/drm/lib=
amdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.a =
src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/libnouveau=
winsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/drivers/nouve=
au/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/winsys/i915/=
drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/libisl.a =
src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a src/intel/=
isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/intel/isl=
/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/li=
bisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/libis=
l_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libisl=
_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/libisl_t=
iled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/winsys/s=
vga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/gallium/winsy=
s/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglcommon.a =
src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/iris/lib=
iris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/drivers/=
iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw_ver110.=
a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/drivers/iris=
/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src/intel/b=
lorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libintel-driver=
-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/drivers/crocu=
s/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a src/galli=
um/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/crocus/libcr=
ocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a src=
/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drivers/crocus=
/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_hw_ver80=
.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1 -W=
l,--gc-sections -Wl,--version-script /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium/tar=
gets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace-upgrades/=
build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium/targ=
ets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/build/tmp/w=
ork/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig=
/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread /=
srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nati=
ve/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libexpat=
.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/lib=
z.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/build/tmp/work=
/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/..=
/../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pk=
gconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-upgrades/b=
uild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib=
/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/workspace-=
upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/build/ttorling=
/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so -Wl,--end-=
group
> /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/galliu=
m/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in function `llvm::Sm=
allVectorTemplateBase<std::__cxx11::basic_string<char, std::char_traits<cha=
r>, std::allocator<char> >, false>::grow(unsigned long)':
> lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cxx1112bas=
ic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVectorTempl=
ateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm]+0=
x36): undefined reference to `llvm::SmallVectorBase<unsigned int>::mallocFo=
rGrow(void*, unsigned long, unsigned long, unsigned long&)'
> /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/amd/ll=
vm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `llvm::DataLayo=
ut::getTypeSizeInBits(llvm::Type*) const':
> ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4T=
ypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4): undefined =
reference to `llvm::TargetExtType::getLayoutType() const'
> /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/amd/ll=
vm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `ac_create_pass=
mgr':
> ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined reference to=
 `llvm::createPromoteMemoryToRegisterPass(bool)'
> /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: ac_llvm_he=
lper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to `llvm::crea=
teSROAPass(bool)'
> collect2: error: ld returned 1 exit status
> ninja: build stopped: subcommand failed.
> INFO: autodetecting backend as ninja
> INFO: calculating backend command to run: /srv/build/ttorling/workspace-u=
pgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nativ=
e/usr/bin/ninja -j 24 -v
> WARNING: /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit 1 from 'meson co=
mpile -v -j 24'
> WARNING: Backtrace (BB generated script):
>         #1: meson_do_compile, /srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, lin=
e 155
>         #2: do_compile, /srv/build/ttorling/workspace-upgrades/build/tmp/=
work/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 150
>         #3: main, /srv/build/ttorling/workspace-upgrades/build/tmp/work/x=
86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 159
>
> (log borrowed from Tim but I'm seeing a similar issue)
>
> Cheers,
>
> Richard

