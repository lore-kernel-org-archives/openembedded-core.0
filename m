Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17592E743C6
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 21:46:17 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.4833.1695937572558830411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 14:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAFBEMwI;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59c04237bf2so172855477b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695937572; x=1696542372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HBji/DsanUo0cKkDJyQYb0HvgBGhpEix0HoW3gYsyGM=;
        b=ZAFBEMwIzMr3nxPooRnG2jBmKFzPEa+sl1cXavxbAecYL1tLj50q/OE12KJWsr+vph
         sqkf8PpLbvaSRsAPGfFDTfigSet+J2xGlCTt8Z8uUYJUC0bd4pt2lR+JPf4lJadHtBPt
         U7TrCAzQAvc0rKJA35aLcHfGUWcsrnJGI5pvgtE6TCzqYT4ibB3kn5iXHFsw/B7mQE5S
         wfvKtaRFSEs5Ha4KvzHhFWOa0dmoKeTG8KQr764zBKNzDZCghtxPIf1DWVnakwOvqfzN
         dkW93TqN2W8EXU9mA0leFRrOKgBTzDw2QpWX3zvjEVDSpzi0bw7ei3dahEcsyM+ycpkl
         EERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695937572; x=1696542372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBji/DsanUo0cKkDJyQYb0HvgBGhpEix0HoW3gYsyGM=;
        b=nkb7cB06KzQnfS2D97eneUvfXBKUpfKDVsajpvuFH3SgQsl5Dvfgf649sMi9oOqcLA
         lyzi3h+tZoYb5p8tOHJMQ2W/ecCh0LxdgJL7qChM19ek8NT585hjU//lc7TEjCxIuYLC
         dEQ+U0lVvtvp7jpnymI1OAnyk5+TLCrwHP0ERnA0y1nqIvJGJfLWBFB8A2vaKIDhUPQy
         9ilbpv+9WUgjV2yG9/4W7NCfJ2PPBD2WbCZ+b7l6X0+hHn1V6O9/OyNLh7F/RrbE5CH2
         UsQ9xECVfPGlJ6AtrAwCO35hVhGQK3M1mpsbB5UvVM01qFBsxiaiwVZohOwbrLBW8sRA
         Gxzg==
X-Gm-Message-State: AOJu0Yxy5TD1oS9Xnsnb9GAh0AsG8uElJFVNS0mFxbJ+jbivGegYdo03
	TLGOMinchJsT/WtT0YZ9IkVUn16+uZ4c7lf+Hyo=
X-Google-Smtp-Source: AGHT+IHr5IT9bLflBv9eZGfIyn3umXebcyFq8LvMDfZOJM9O0p3BjlK8IBBNVfL9e9MRj7smeiPMb3AvyTFJfqp+WXY=
X-Received: by 2002:a81:77c4:0:b0:571:11ea:b2dd with SMTP id
 s187-20020a8177c4000000b0057111eab2ddmr2224877ywc.32.1695937571488; Thu, 28
 Sep 2023 14:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230922163721.477463-1-raj.khem@gmail.com> <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
 <CAMKF1spz5rxJ-yekHZrvqy9JoOPamNHfsUzFc1x0+c8DqHqgTQ@mail.gmail.com> <CAMKF1sqraCxWoQyk8a7iekHiySrV2nJEQ42sMyMaXR3OFvh6Qw@mail.gmail.com>
In-Reply-To: <CAMKF1sqraCxWoQyk8a7iekHiySrV2nJEQ42sMyMaXR3OFvh6Qw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 28 Sep 2023 14:46:00 -0700
Message-ID: <CANx9H-B1u9eirWxSYD-syZMG+Vrk1B=4j+1LqhX9JvvgRsN9dA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Update clang-17 patch to upstream v2
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000828ac10606723c54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 21:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188380

--000000000000828ac10606723c54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 1:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Can you check if the machines where it fails has llvm-14-dev package
> installed on host ?
>
>
In my case, yes. llvm-14-dev 1:14.0.0-1ubuntu1.1


> On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > its linking with  /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is not
> > correct. Somehow its finding llvm library on your build host.
> >
> > On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  .../0001-gallium-Fix-build-with-llvm-17.patch | 27
> ++++++++++++-------
> > > >  1 file changed, 18 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git
> a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> > > > index 3631a918b0c..0ca7a22b45b 100644
> > > > ---
> a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> > > > +++
> b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.pa=
tch
> > > > @@ -1,4 +1,4 @@
> > > > -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00
> 2001
> > > > +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00
> 2001
> > > >  From: Khem Raj <raj.khem@gmail.com>
> > > >  Date: Fri, 23 Jun 2023 01:20:38 -0700
> > > >  Subject: [PATCH] gallium: Fix build with llvm 17
> > > > @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >=3D=
 17
> > > >  Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
> > > >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >  ---
> > > > - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
> > > > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > > > + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
> > > > + 1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c
> b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> > > > -index 24d0823..3d4573e 100644
> > > >  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
> > > >  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> > > > -@@ -42,8 +42,10 @@
> > > > +@@ -42,19 +42,23 @@
> > > >
> > > >   #include <llvm/Config/llvm-config.h>
> > > >   #include <llvm-c/Analysis.h>
> > > > @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
> > > >   #include <llvm-c/Transforms/Utils.h>
> > > >   #endif
> > > >   #include <llvm-c/BitWriter.h>
> > > > ---
> > > > -2.41.0
> > > > -
> > > > + #if GALLIVM_USE_NEW_PASS =3D=3D 1
> > > > + #include <llvm-c/Transforms/PassBuilder.h>
> > > > +-#elif GALLIVM_HAVE_CORO =3D=3D 1
> > > > ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
> > > > + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 ||
> DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
> > > > + #include <llvm-c/Transforms/IPO.h>
> > > > + #endif
> > > > ++#if LLVM_VERSION_MAJOR < 17
> > > > + #include <llvm-c/Transforms/Coroutines.h>
> > > > + #endif
> > > > ++#endif
> > > > +
> > > > + unsigned gallivm_perf =3D 0;
> > > > +
> > >
> > > I think this patch may have broken against with the recent llvm point
> > > release?
> > >
> > > DEBUG: Executing shell function do_compile
> > >
> > > [1/33]
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/bin/python3-native/python3
> ../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
> > > [2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so
> src/gallium/targets/dri/libgallium_dri.so.p/target.c.o
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/lib
> -Wl,--as-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libgallium_dri.so -Wl,--enable-new-dtags
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3D/srv/build/ttorling/workspace-upgrades/build/tmp/s=
ysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib'
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib
> src/gallium/frontends/dri/libdri.a src/util/libmesa_util.a
> src/util/format/libmesa_format.a src/util/libmesa_util_sse41.a
> src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a
> src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
> src/compiler/nir/libnir.a src/compiler/libcompiler.a
> src/mesa/libmesa_sse41.a src/gallium/auxiliary/libgalliumvl.a
> src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/libglapi.so.0.0.=
0
> src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a
> src/loader/libloader.a src/util/libxmlconfig.a
> src/gallium/winsys/sw/null/libws_null.a
> src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dri/libswdri=
.a
> src/gallium/winsys/sw/kms-dri/libswkmsdri.a
> src/gallium/drivers/llvmpipe/libllvmpipe.a
> src/gallium/drivers/softpipe/libsoftpipe.a
> src/gallium/drivers/r300/libr300.a
> src/gallium/winsys/radeon/drm/libradeonwinsys.a
> src/gallium/drivers/r600/libr600.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx6.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx7.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx8.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx9.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx10.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx103.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx11.a
> src/gallium/drivers/radeonsi/libradeonsi.a
> src/gallium/winsys/amdgpu/drm/libamdgpuwinsys.a
> src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.a
> src/amd/llvm/libamd_common_llvm.a
> src/gallium/winsys/nouveau/drm/libnouveauwinsys.a
> src/nouveau/codegen/libnouveau_codegen.a
> src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915=
.a
> src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_common=
.a
> src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a
> src/intel/dev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a
> src/intel/isl/libisl_per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a
> src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a
> src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/libisl_per_hw_ver110.a
> src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libisl_per_hw_ver125.a
> src/intel/isl/libisl_tiled_memcpy.a
> src/intel/isl/libisl_tiled_memcpy_sse41.a
> src/gallium/drivers/svga/libsvga.a src/gallium/winsys/svga/drm/libsvgadrm=
.a
> src/gallium/drivers/virgl/libvirgl.a
> src/gallium/winsys/virgl/drm/libvirgldrm.a
> src/gallium/winsys/virgl/common/libvirglcommon.a
> src/gallium/winsys/virgl/vtest/libvirglvtest.a
> src/gallium/drivers/iris/libiris.a
> src/gallium/drivers/iris/libiris_per_hw_ver80.a
> src/gallium/drivers/iris/libiris_per_hw_ver90.a
> src/gallium/drivers/iris/libiris_per_hw_ver110.a
> src/gallium/drivers/iris/libiris_per_hw_ver120.a
> src/gallium/drivers/iris/libiris_per_hw_ver125.a
> src/intel/compiler/libintel_compiler.a src/intel/blorp/libblorp.a
> src/intel/perf/libintel_perf.a src/intel/ds/libintel-driver-ds.a
> src/gallium/winsys/iris/drm/libiriswinsys.a
> src/gallium/drivers/crocus/libcrocus.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver50.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver80.a
> src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1
> -Wl,--gc-sections -Wl,--version-script
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/dri.sym
> -Wl,--dynamic-list
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m.so
> /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libex=
pat.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libz.=
so
> -lm
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libzs=
td.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libxc=
b-randr.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_radeon.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libel=
f.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_amdgpu.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_nouveau.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_intel.so
> -Wl,--end-group
> > > FAILED: src/gallium/targets/dri/libgallium_dri.so
> > > g++  -o src/gallium/targets/dri/libgallium_dri.so
> src/gallium/targets/dri/libgallium_dri.so.p/target.c.o
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib
> -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/lib
> -Wl,--as-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libgallium_dri.so -Wl,--enable-new-dtags
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib
> -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-l=
inux/mesa-native/23.1.8/recipe-sysroot-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3D/srv/build/ttorling/workspace-upgrades/build/tmp/s=
ysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorling/worksp=
ace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib'
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi
> -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib
> src/gallium/frontends/dri/libdri.a src/util/libmesa_util.a
> src/util/format/libmesa_format.a src/util/libmesa_util_sse41.a
> src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a
> src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
> src/compiler/nir/libnir.a src/compiler/libcompiler.a
> src/mesa/libmesa_sse41.a src/gallium/auxiliary/libgalliumvl.a
> src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/libglapi.so.0.0.=
0
> src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a
> src/loader/libloader.a src/util/libxmlconfig.a
> src/gallium/winsys/sw/null/libws_null.a
> src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dri/libswdri=
.a
> src/gallium/winsys/sw/kms-dri/libswkmsdri.a
> src/gallium/drivers/llvmpipe/libllvmpipe.a
> src/gallium/drivers/softpipe/libsoftpipe.a
> src/gallium/drivers/r300/libr300.a
> src/gallium/winsys/radeon/drm/libradeonwinsys.a
> src/gallium/drivers/r600/libr600.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx6.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx7.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx8.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx9.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx10.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx103.a
> src/gallium/drivers/radeonsi/libradeonsi_gfx11.a
> src/gallium/drivers/radeonsi/libradeonsi.a
> src/gallium/winsys/amdgpu/drm/libamdgpuwinsys.a
> src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.a
> src/amd/llvm/libamd_common_llvm.a
> src/gallium/winsys/nouveau/drm/libnouveauwinsys.a
> src/nouveau/codegen/libnouveau_codegen.a
> src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915=
.a
> src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_common=
.a
> src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a
> src/intel/dev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a
> src/intel/isl/libisl_per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a
> src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a
> src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/libisl_per_hw_ver110.a
> src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libisl_per_hw_ver125.a
> src/intel/isl/libisl_tiled_memcpy.a
> src/intel/isl/libisl_tiled_memcpy_sse41.a
> src/gallium/drivers/svga/libsvga.a src/gallium/winsys/svga/drm/libsvgadrm=
.a
> src/gallium/drivers/virgl/libvirgl.a
> src/gallium/winsys/virgl/drm/libvirgldrm.a
> src/gallium/winsys/virgl/common/libvirglcommon.a
> src/gallium/winsys/virgl/vtest/libvirglvtest.a
> src/gallium/drivers/iris/libiris.a
> src/gallium/drivers/iris/libiris_per_hw_ver80.a
> src/gallium/drivers/iris/libiris_per_hw_ver90.a
> src/gallium/drivers/iris/libiris_per_hw_ver110.a
> src/gallium/drivers/iris/libiris_per_hw_ver120.a
> src/gallium/drivers/iris/libiris_per_hw_ver125.a
> src/intel/compiler/libintel_compiler.a src/intel/blorp/libblorp.a
> src/intel/perf/libintel_perf.a src/intel/ds/libintel-driver-ds.a
> src/gallium/winsys/iris/drm/libiriswinsys.a
> src/gallium/drivers/crocus/libcrocus.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver50.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a
> src/gallium/drivers/crocus/libcrocus_per_hw_ver80.a
> src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1
> -Wl,--gc-sections -Wl,--version-script
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/dri.sym
> -Wl,--dynamic-list
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m.so
> /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libex=
pat.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libz.=
so
> -lm
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libzs=
td.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libxc=
b-randr.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_radeon.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libel=
f.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_amdgpu.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_nouveau.so
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_intel.so
> -Wl,--end-group
> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> src/gallium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in functi=
on
> `llvm::SmallVectorTemplateBase<std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> >, false>::grow(unsigned
> long)':
> > >
> lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cxx1112bas=
ic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVectorTempl=
ateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm]+0=
x36):
> undefined reference to `llvm::SmallVectorBase<unsigned
> int>::mallocForGrow(void*, unsigned long, unsigned long, unsigned long&)'
> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> src/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function
> `llvm::DataLayout::getTypeSizeInBits(llvm::Type*) const':
> > >
> ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4T=
ypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4):
> undefined reference to `llvm::TargetExtType::getLayoutType() const'
> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> src/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function
> `ac_create_passmgr':
> > > ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined referenc=
e
> to `llvm::createPromoteMemoryToRegisterPass(bool)'
> > > /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld:
> ac_llvm_helper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to
> `llvm::createSROAPass(bool)'
> > > collect2: error: ld returned 1 exit status
> > > ninja: build stopped: subcommand failed.
> > > INFO: autodetecting backend as ninja
> > > INFO: calculating backend command to run:
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/bin/ninja
> -j 24 -v
> > > WARNING:
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760:155
> exit 1 from 'meson compile -v -j 24'
> > > WARNING: Backtrace (BB generated script):
> > >         #1: meson_do_compile,
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760,
> line 155
> > >         #2: do_compile,
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760,
> line 150
> > >         #3: main,
> /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/temp/run.do_compile.3996760,
> line 159
> > >
> > > (log borrowed from Tim but I'm seeing a similar issue)
> > >
> > > Cheers,
> > >
> > > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188379):
> https://lists.openembedded.org/g/openembedded-core/message/188379
> Mute This Topic: https://lists.openembedded.org/mt/101524707/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000828ac10606723c54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 28, 2023 at 1:34=E2=80=AF=
PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Can=
 you check if the machines where it fails has llvm-14-dev package<br>
installed on host ?<br>
<br></blockquote><div><br></div><div>In my case, yes. llvm-14-dev 1:14.0.0-=
1ubuntu1.1</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
On Thu, Sep 28, 2023 at 9:55=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; its linking with=C2=A0 /usr/lib/llvm-14/lib/libLLVM-14.so.1 which is n=
ot<br>
&gt; correct. Somehow its finding llvm library on your build host.<br>
&gt;<br>
&gt; On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../0001-gallium-Fix-build-with-llvm-17.patch | 27 +++=
+++++++++-------<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 18 insertions(+), 9 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-F=
ix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium=
-Fix-build-with-llvm-17.patch<br>
&gt; &gt; &gt; index 3631a918b0c..0ca7a22b45b 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-buil=
d-with-llvm-17.patch<br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-buil=
d-with-llvm-17.patch<br>
&gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 Date: Fri, 23 Jun 2023 01:20:38 -0700<br>
&gt; &gt; &gt;=C2=A0 Subject: [PATCH] gallium: Fix build with llvm 17<br>
&gt; &gt; &gt; @@ -10,14 +10,12 @@ so add conditions to exclude them for ll=
vm &gt;=3D 17<br>
&gt; &gt; &gt;=C2=A0 Upstream-Status: Submitted [<a href=3D"https://gitlab.=
freedesktop.org/mesa/mesa/-/merge_requests/23827" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827=
</a>]<br>
&gt; &gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 ---<br>
&gt; &gt; &gt; - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-<br>
&gt; &gt; &gt; - 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--<br>
&gt; &gt; &gt; + 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/=
src/gallium/auxiliary/gallivm/lp_bld_init.c<br>
&gt; &gt; &gt; -index 24d0823..3d4573e 100644<br>
&gt; &gt; &gt;=C2=A0 --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c<br>
&gt; &gt; &gt;=C2=A0 +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c<br>
&gt; &gt; &gt; -@@ -42,8 +42,10 @@<br>
&gt; &gt; &gt; +@@ -42,19 +42,23 @@<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm/Config/llvm-config.h&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm-c/Analysis.h&gt;<br>
&gt; &gt; &gt; @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm-c/Transforms/Utils.h&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; &gt; &gt;=C2=A0 =C2=A0#include &lt;llvm-c/BitWriter.h&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; -2.41.0<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; + #if GALLIVM_USE_NEW_PASS =3D=3D 1<br>
&gt; &gt; &gt; + #include &lt;llvm-c/Transforms/PassBuilder.h&gt;<br>
&gt; &gt; &gt; +-#elif GALLIVM_HAVE_CORO =3D=3D 1<br>
&gt; &gt; &gt; ++#elif GALLIVM_HAVE_CORO =3D=3D 1 &amp;&amp; LLVM_VERSION_M=
AJOR &lt; 17<br>
&gt; &gt; &gt; + #if LLVM_VERSION_MAJOR &lt;=3D 8 &amp;&amp; (DETECT_ARCH_A=
ARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)<br>
&gt; &gt; &gt; + #include &lt;llvm-c/Transforms/IPO.h&gt;<br>
&gt; &gt; &gt; + #endif<br>
&gt; &gt; &gt; ++#if LLVM_VERSION_MAJOR &lt; 17<br>
&gt; &gt; &gt; + #include &lt;llvm-c/Transforms/Coroutines.h&gt;<br>
&gt; &gt; &gt; + #endif<br>
&gt; &gt; &gt; ++#endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + unsigned gallivm_perf =3D 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; I think this patch may have broken against with the recent llvm p=
oint<br>
&gt; &gt; release?<br>
&gt; &gt;<br>
&gt; &gt; DEBUG: Executing shell function do_compile<br>
&gt; &gt;<br>
&gt; &gt; [1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_=
64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-native/py=
thon3 ../mesa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h<br>
&gt; &gt; [2/13] g++=C2=A0 -o src/gallium/targets/dri/libgallium_dri.so src=
/gallium/targets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/w=
orkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sys=
root-native/usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work=
/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed =
-Wl,--no-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_d=
ri.so -Wl,--enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-=
upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nati=
ve/usr/lib -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp=
/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,=
/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nat=
ive/23.1.8/recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/wor=
kspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysro=
ot-native/lib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/s=
rv/build/ttorling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-li=
nux/lib/ld-linux-x86-64.so.2 &#39;-Wl,-rpath,$ORIGIN/../../../mapi/shared-g=
lapi:/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mes=
a-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib&#3=
9; -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/=
srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nati=
ve/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib src/gall=
ium/frontends/dri/libdri.a src/util/libmesa_util.a src/util/format/libmesa_=
format.a src/util/libmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/=
mesa/libmesa.a src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp=
.a src/compiler/nir/libnir.a src/compiler/libcompiler.a src/mesa/libmesa_ss=
e41.a src/gallium/auxiliary/libgalliumvl.a src/gallium/auxiliary/libgallium=
.a src/mapi/shared-glapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loade=
r/libpipe_loader_static.a src/loader/libloader.a src/util/libxmlconfig.a sr=
c/gallium/winsys/sw/null/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.=
a src/gallium/winsys/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswk=
msdri.a src/gallium/drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/soft=
pipe/libsoftpipe.a src/gallium/drivers/r300/libr300.a src/gallium/winsys/ra=
deon/drm/libradeonwinsys.a src/gallium/drivers/r600/libr600.a src/gallium/d=
rivers/radeonsi/libradeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi=
_gfx7.a src/gallium/drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers=
/radeonsi/libradeonsi_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10=
.a src/gallium/drivers/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/ra=
deonsi/libradeonsi_gfx11.a src/gallium/drivers/radeonsi/libradeonsi.a src/g=
allium/winsys/amdgpu/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src=
/amd/common/libamd_common.a src/amd/llvm/libamd_common_llvm.a src/gallium/w=
insys/nouveau/drm/libnouveauwinsys.a src/nouveau/codegen/libnouveau_codegen=
.a src/gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi91=
5.a src/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_comm=
on.a src/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/d=
ev/libintel_dev.a src/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_=
per_hw_ver60.a src/intel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per=
_hw_ver75.a src/intel/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw=
_ver90.a src/intel/isl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_v=
er120.a src/intel/isl/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_mem=
cpy.a src/intel/isl/libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/li=
bsvga.a src/gallium/winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/=
libvirgl.a src/gallium/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/vi=
rgl/common/libvirglcommon.a src/gallium/winsys/virgl/vtest/libvirglvtest.a =
src/gallium/drivers/iris/libiris.a src/gallium/drivers/iris/libiris_per_hw_=
ver80.a src/gallium/drivers/iris/libiris_per_hw_ver90.a src/gallium/drivers=
/iris/libiris_per_hw_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver12=
0.a src/gallium/drivers/iris/libiris_per_hw_ver125.a src/intel/compiler/lib=
intel_compiler.a src/intel/blorp/libblorp.a src/intel/perf/libintel_perf.a =
src/intel/ds/libintel-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys=
.a src/gallium/drivers/crocus/libcrocus.a src/gallium/drivers/crocus/libcro=
cus_per_hw_ver40.a src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/=
gallium/drivers/crocus/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/=
libcrocus_per_hw_ver60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.=
a src/gallium/drivers/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/c=
rocus/libcrocus_per_hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsy=
s.a -Wl,--build-id=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/build=
/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8=
/mesa-23.1.8/src/gallium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/=
ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/=
mesa-23.1.8/src/gallium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/wo=
rkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/li=
b/libLLVM-14.so.1 -pthread /srv/build/ttorling/workspace-upgrades/build/tmp=
/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconf=
ig/../../../usr/lib/libexpat.so /srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pk=
gconfig/../../../usr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/libzstd.so /srv/build/ttorling/workspace-upgr=
ades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/lib/libxcb-randr.so /srv/build/ttorling/works=
pace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttor=
ling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/reci=
pe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/t=
torling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /s=
rv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nativ=
e/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_no=
uveau.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b/libdrm_intel.so -Wl,--end-group<br>
&gt; &gt; FAILED: src/gallium/targets/dri/libgallium_dri.so<br>
&gt; &gt; g++=C2=A0 -o src/gallium/targets/dri/libgallium_dri.so src/galliu=
m/targets/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspac=
e-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-na=
tive/usr/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64=
-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--n=
o-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -=
Wl,--enable-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrade=
s/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/=
lib -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x=
86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/bu=
ild/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.=
1.8/recipe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-=
upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nati=
ve/lib -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/buil=
d/ttorling/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2 &#39;-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/s=
rv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nativ=
e/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib&#39; -Wl,=
-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-li=
nux/mesa-native/23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/bui=
ld/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1=
.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/fro=
ntends/dri/libdri.a src/util/libmesa_util.a src/util/format/libmesa_format.=
a src/util/libmesa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/li=
bmesa.a src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/=
compiler/nir/libnir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a s=
rc/gallium/auxiliary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/=
mapi/shared-glapi/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpi=
pe_loader_static.a src/loader/libloader.a src/util/libxmlconfig.a src/galli=
um/winsys/sw/null/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/g=
allium/winsys/sw/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a=
 src/gallium/drivers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/li=
bsoftpipe.a src/gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/dr=
m/libradeonwinsys.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/=
radeonsi/libradeonsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a=
 src/gallium/drivers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeon=
si/libradeonsi_gfx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/=
gallium/drivers/radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/=
libradeonsi_gfx11.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/=
winsys/amdgpu/drm/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/co=
mmon/libamd_common.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/n=
ouveau/drm/libnouveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/=
gallium/drivers/nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src=
/gallium/winsys/i915/drm/libi915drm.a src/intel/common/libintel_common.a sr=
c/intel/isl/libisl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libi=
ntel_dev.a src/intel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_=
ver60.a src/intel/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver=
75.a src/intel/isl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.=
a src/intel/isl/libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a=
 src/intel/isl/libisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a s=
rc/intel/isl/libisl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a=
 src/gallium/winsys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirg=
l.a src/gallium/winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/com=
mon/libvirglcommon.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gal=
lium/drivers/iris/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a=
 src/gallium/drivers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/l=
ibiris_per_hw_ver110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src=
/gallium/drivers/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_c=
ompiler.a src/intel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/int=
el/ds/libintel-driver-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/=
gallium/drivers/crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per=
_hw_ver40.a src/gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium=
/drivers/crocus/libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcroc=
us_per_hw_ver60.a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/g=
allium/drivers/crocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/l=
ibcrocus_per_hw_ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl=
,--build-id=3Dsha1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorli=
ng/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-2=
3.1.8/src/gallium/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorlin=
g/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23=
.1.8/src/gallium/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace=
-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nat=
ive/usr/lib/pkgconfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLL=
VM-14.so.1 -pthread /srv/build/ttorling/workspace-upgrades/build/tmp/work/x=
86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../.=
./../usr/lib/libexpat.so /srv/build/ttorling/workspace-upgrades/build/tmp/w=
ork/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig=
/../../../usr/lib/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/=
pkgconfig/../../../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-up=
grades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/wo=
rkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysr=
oot-native/usr/lib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling=
/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-s=
ysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/buil=
d/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.=
8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.s=
o /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdr=
m_intel.so -Wl,--end-group<br>
&gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: sr=
c/gallium/auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in function `=
llvm::SmallVectorTemplateBase&lt;std::__cxx11::basic_string&lt;char, std::c=
har_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt;, false&gt;::grow(un=
signed long)&#39;:<br>
&gt; &gt; lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cx=
x1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVec=
torTemplateBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4g=
rowEm]+0x36): undefined reference to `llvm::SmallVectorBase&lt;unsigned int=
&gt;::mallocForGrow(void*, unsigned long, unsigned long, unsigned long&amp;=
)&#39;<br>
&gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: sr=
c/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `llvm::=
DataLayout::getTypeSizeInBits(llvm::Type*) const&#39;:<br>
&gt; &gt; ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBit=
sEPNS_4TypeE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4): un=
defined reference to `llvm::TargetExtType::getLayoutType() const&#39;<br>
&gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: sr=
c/amd/llvm/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `ac_cre=
ate_passmgr&#39;:<br>
&gt; &gt; ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined refe=
rence to `llvm::createPromoteMemoryToRegisterPass(bool)&#39;<br>
&gt; &gt; /srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: ac=
_llvm_helper.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to `ll=
vm::createSROAPass(bool)&#39;<br>
&gt; &gt; collect2: error: ld returned 1 exit status<br>
&gt; &gt; ninja: build stopped: subcommand failed.<br>
&gt; &gt; INFO: autodetecting backend as ninja<br>
&gt; &gt; INFO: calculating backend command to run: /srv/build/ttorling/wor=
kspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysro=
ot-native/usr/bin/ninja -j 24 -v<br>
&gt; &gt; WARNING: /srv/build/ttorling/workspace-upgrades/build/tmp/work/x8=
6_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit 1 from &=
#39;meson compile -v -j 24&#39;<br>
&gt; &gt; WARNING: Backtrace (BB generated script):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#1: meson_do_compile, /srv/build=
/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8=
/temp/run.do_compile.3996760, line 155<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#2: do_compile, /srv/build/ttorl=
ing/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/=
run.do_compile.3996760, line 150<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#3: main, /srv/build/ttorling/wo=
rkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/temp/run.do=
_compile.3996760, line 159<br>
&gt; &gt;<br>
&gt; &gt; (log borrowed from Tim but I&#39;m seeing a similar issue)<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188379): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188379" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188379</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101524707/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/101524707/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000828ac10606723c54--

