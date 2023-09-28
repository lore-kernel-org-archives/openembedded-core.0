Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE46E732E5
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:25:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16161.1695914753476031688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YBjHXFuy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32336a30d18so5086051f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695914751; x=1696519551; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYUDoOgNt5CzSNET5T2dH2+pGlyZKLFinqehY5Sx5MY=;
        b=YBjHXFuyT+PrjdPS8c2Lis8cSK7cJK0D/aNqIhtK4ptEcEjcHZbOvZiHH4bm7u1J8l
         JyuO/c/yoK/EgdKxkgUPs6pNzLP0/XmABaGjCNXX8Ikmm4aHdRPOc+igZzqYbmsC1hlL
         A3QDpzzBDq4xcXS6SygDVU7dl4teWNYizEp8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914751; x=1696519551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYUDoOgNt5CzSNET5T2dH2+pGlyZKLFinqehY5Sx5MY=;
        b=cXL/wo5xupYdx/waDkqJ3dHfTdd+rTsRxOczSXO6Br5DD1y3zhXzaOCAgFa5gklmCl
         yXq8qBHGYjUAQcTsQ96uu8hbDPesccihfF+6lfazQDR2cSgJYBgTG0zDpNTXgblYNdnh
         T0C96Rhazm4mjey8Tg1M8Q6oQBOEswju1K9H8qu8Arrr1wQxk0F7X2vNLmHUmX1d6VVT
         zwR68sxsLwBvuXNdMn1USWHrp2w7PzHOfv7oSvQ1I9voOEWvvS1CFrnolHmcQEwrv3IN
         l3FuFnPBI9Z42gPQOG3a6fx+YTRP4MkW/mx8g0j8zN+EkW6El8OugGuUCsoBxA/ul9Ep
         ZHUw==
X-Gm-Message-State: AOJu0Yw5kTBcY1hF4c54DeQbZJmACGzUluqRGJlWYp6vrVgMBNRXmVsR
	u+Whc34I+oxIbJaBREMwi9ohBQ==
X-Google-Smtp-Source: AGHT+IFr3CDbJUc3k5guVZjlpZKfh9Uu8Wojkbb15Evz/jcyNd64X3YrSA4PIEzUGcsTBbGDzFwV7Q==
X-Received: by 2002:a5d:574f:0:b0:323:16c0:9531 with SMTP id q15-20020a5d574f000000b0032316c09531mr1565232wrw.13.1695914751549;
        Thu, 28 Sep 2023 08:25:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93? ([2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93])
        by smtp.gmail.com with ESMTPSA id z20-20020a1c4c14000000b003fbe791a0e8sm20359146wmf.0.2023.09.28.08.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:25:51 -0700 (PDT)
Message-ID: <bbe1ed504e65644dc1434d4622ce5a51e44a671f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mesa: Update clang-17 patch to upstream v2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 28 Sep 2023 16:25:50 +0100
In-Reply-To: <20230922163721.477463-1-raj.khem@gmail.com>
References: <20230922163721.477463-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 15:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188373

On Fri, 2023-09-22 at 09:37 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-gallium-Fix-build-with-llvm-17.patch | 27 ++++++++++++-------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with=
-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-wi=
th-llvm-17.patch
> index 3631a918b0c..0ca7a22b45b 100644
> --- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-1=
7.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-1=
7.patch
> @@ -1,4 +1,4 @@
> -From 865762e0a767a121206d818bdd58301afbf30104 Mon Sep 17 00:00:00 2001
> +From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 23 Jun 2023 01:20:38 -0700
>  Subject: [PATCH] gallium: Fix build with llvm 17
> @@ -10,14 +10,12 @@ so add conditions to exclude them for llvm >=3D 17
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/23827]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - src/gallium/auxiliary/gallivm/lp_bld_init.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> =20
> -diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/a=
uxiliary/gallivm/lp_bld_init.c
> -index 24d0823..3d4573e 100644
>  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
>  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> -@@ -42,8 +42,10 @@
> +@@ -42,19 +42,23 @@
>  =20
>   #include <llvm/Config/llvm-config.h>
>   #include <llvm-c/Analysis.h>
> @@ -29,6 +27,17 @@ index 24d0823..3d4573e 100644
>   #include <llvm-c/Transforms/Utils.h>
>   #endif
>   #include <llvm-c/BitWriter.h>
> ---=20
> -2.41.0
> -
> + #if GALLIVM_USE_NEW_PASS =3D=3D 1
> + #include <llvm-c/Transforms/PassBuilder.h>
> +-#elif GALLIVM_HAVE_CORO =3D=3D 1
> ++#elif GALLIVM_HAVE_CORO =3D=3D 1 && LLVM_VERSION_MAJOR < 17
> + #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_AR=
M || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
> + #include <llvm-c/Transforms/IPO.h>
> + #endif
> ++#if LLVM_VERSION_MAJOR < 17
> + #include <llvm-c/Transforms/Coroutines.h>
> + #endif
> ++#endif
> +=20
> + unsigned gallivm_perf =3D 0;
> +=20

I think this patch may have broken against with the recent llvm point
release?

DEBUG: Executing shell function do_compile

[1/33] /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/usr/bin/python3-native/python3 ../m=
esa-23.1.8/bin/git_sha1_gen.py --output src/git_sha1.h
[2/13] g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/target=
s/dri/libgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upgrad=
es/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr=
/lib -L/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-undefi=
ned -shared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--ena=
ble-new-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -Wl,=
-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-li=
nux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/ttor=
ling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/reci=
pe-sysroot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -=
Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/ttorli=
ng/workspace-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linu=
x-x86-64.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/srv=
/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/=
23.1.8/build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/work=
space-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/libdr=
i.a src/util/libmesa_util.a src/util/format/libmesa_format.a src/util/libme=
sa_util_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/comp=
iler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/lib=
nir.a src/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/auxil=
iary/libgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-glap=
i/libglapi.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_static=
.a src/loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/nul=
l/libws_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw=
/dri/libswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/dri=
vers/llvmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a src/=
gallium/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwinsy=
s.a src/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/librade=
onsi_gfx6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/dri=
vers/radeonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeonsi_g=
fx9.a src/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/drivers/=
radeonsi/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_gfx1=
1.a src/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu/dr=
m/libamdgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_comm=
on.a src/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/libno=
uveauwinsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/drivers/=
nouveau/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/winsys/=
i915/drm/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/libi=
sl.a src/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a src/i=
ntel/isl/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/inte=
l/isl/libisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/intel/i=
sl/libisl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/=
libisl_per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/l=
ibisl_per_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/lib=
isl_tiled_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/win=
sys/svga/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/gallium/=
winsys/virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglcomm=
on.a src/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/iri=
s/libiris.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/dri=
vers/iris/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw_ve=
r110.a src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/drivers=
/iris/libiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src/in=
tel/blorp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libintel-d=
river-ds.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/drivers/=
crocus/libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a src/=
gallium/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/crocus/=
libcrocus_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver60.=
a src/gallium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drivers/c=
rocus/libcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_hw_=
ver80.a src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsh=
a1 -Wl,--gc-sections -Wl,--version-script /srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/galliu=
m/targets/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace-upgr=
ades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium=
/targets/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthr=
ead /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa=
-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/lib=
expat.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b/libz.so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-=
linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86=
_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/build/tmp=
/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconf=
ig/../../../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upgrades=
/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-upgra=
des/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/us=
r/lib/pkgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/works=
pace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/build/tto=
rling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/rec=
ipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so -Wl,-=
-end-group
FAILED: src/gallium/targets/dri/libgallium_dri.so=20
g++  -o src/gallium/targets/dri/libgallium_dri.so src/gallium/targets/dri/l=
ibgallium_dri.so.p/target.c.o -L/srv/build/ttorling/workspace-upgrades/buil=
d/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -L=
/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-nat=
ive/23.1.8/recipe-sysroot-native/lib -Wl,--as-needed -Wl,--no-undefined -sh=
ared -fPIC -Wl,--start-group -Wl,-soname,libgallium_dri.so -Wl,--enable-new=
-dtags -Wl,-rpath-link,/srv/build/ttorling/workspace-upgrades/build/tmp/wor=
k/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib -Wl,-rpath-=
link,/srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mes=
a-native/23.1.8/recipe-sysroot-native/lib -Wl,-rpath,/srv/build/ttorling/wo=
rkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysr=
oot-native/usr/lib -Wl,-rpath,/srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/lib -Wl,-O1 =
-Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/srv/build/ttorling/work=
space-upgrades/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-6=
4.so.2 '-Wl,-rpath,$ORIGIN/../../../mapi/shared-glapi:/srv/build/ttorling/w=
orkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/lib' -Wl,-rpath-link,/srv/build/=
ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/=
build/src/mapi/shared-glapi -Wl,-rpath-link,/srv/build/ttorling/workspace-u=
pgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-nativ=
e/usr/lib/pkgconfig/../../../usr/lib src/gallium/frontends/dri/libdri.a src=
/util/libmesa_util.a src/util/format/libmesa_format.a src/util/libmesa_util=
_sse41.a src/c11/impl/libmesa_util_c11.a src/mesa/libmesa.a src/compiler/gl=
sl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a src/compiler/nir/libnir.a s=
rc/compiler/libcompiler.a src/mesa/libmesa_sse41.a src/gallium/auxiliary/li=
bgalliumvl.a src/gallium/auxiliary/libgallium.a src/mapi/shared-glapi/libgl=
api.so.0.0.0 src/gallium/auxiliary/pipe-loader/libpipe_loader_static.a src/=
loader/libloader.a src/util/libxmlconfig.a src/gallium/winsys/sw/null/libws=
_null.a src/gallium/winsys/sw/wrapper/libwsw.a src/gallium/winsys/sw/dri/li=
bswdri.a src/gallium/winsys/sw/kms-dri/libswkmsdri.a src/gallium/drivers/ll=
vmpipe/libllvmpipe.a src/gallium/drivers/softpipe/libsoftpipe.a src/gallium=
/drivers/r300/libr300.a src/gallium/winsys/radeon/drm/libradeonwinsys.a src=
/gallium/drivers/r600/libr600.a src/gallium/drivers/radeonsi/libradeonsi_gf=
x6.a src/gallium/drivers/radeonsi/libradeonsi_gfx7.a src/gallium/drivers/ra=
deonsi/libradeonsi_gfx8.a src/gallium/drivers/radeonsi/libradeonsi_gfx9.a s=
rc/gallium/drivers/radeonsi/libradeonsi_gfx10.a src/gallium/drivers/radeons=
i/libradeonsi_gfx103.a src/gallium/drivers/radeonsi/libradeonsi_gfx11.a src=
/gallium/drivers/radeonsi/libradeonsi.a src/gallium/winsys/amdgpu/drm/libam=
dgpuwinsys.a src/amd/addrlib/libaddrlib.a src/amd/common/libamd_common.a sr=
c/amd/llvm/libamd_common_llvm.a src/gallium/winsys/nouveau/drm/libnouveauwi=
nsys.a src/nouveau/codegen/libnouveau_codegen.a src/gallium/drivers/nouveau=
/libnouveau.a src/gallium/drivers/i915/libi915.a src/gallium/winsys/i915/dr=
m/libi915drm.a src/intel/common/libintel_common.a src/intel/isl/libisl.a sr=
c/intel/isl/libisl_per_hw_ver40.a src/intel/dev/libintel_dev.a src/intel/is=
l/libisl_per_hw_ver50.a src/intel/isl/libisl_per_hw_ver60.a src/intel/isl/l=
ibisl_per_hw_ver70.a src/intel/isl/libisl_per_hw_ver75.a src/intel/isl/libi=
sl_per_hw_ver80.a src/intel/isl/libisl_per_hw_ver90.a src/intel/isl/libisl_=
per_hw_ver110.a src/intel/isl/libisl_per_hw_ver120.a src/intel/isl/libisl_p=
er_hw_ver125.a src/intel/isl/libisl_tiled_memcpy.a src/intel/isl/libisl_til=
ed_memcpy_sse41.a src/gallium/drivers/svga/libsvga.a src/gallium/winsys/svg=
a/drm/libsvgadrm.a src/gallium/drivers/virgl/libvirgl.a src/gallium/winsys/=
virgl/drm/libvirgldrm.a src/gallium/winsys/virgl/common/libvirglcommon.a sr=
c/gallium/winsys/virgl/vtest/libvirglvtest.a src/gallium/drivers/iris/libir=
is.a src/gallium/drivers/iris/libiris_per_hw_ver80.a src/gallium/drivers/ir=
is/libiris_per_hw_ver90.a src/gallium/drivers/iris/libiris_per_hw_ver110.a =
src/gallium/drivers/iris/libiris_per_hw_ver120.a src/gallium/drivers/iris/l=
ibiris_per_hw_ver125.a src/intel/compiler/libintel_compiler.a src/intel/blo=
rp/libblorp.a src/intel/perf/libintel_perf.a src/intel/ds/libintel-driver-d=
s.a src/gallium/winsys/iris/drm/libiriswinsys.a src/gallium/drivers/crocus/=
libcrocus.a src/gallium/drivers/crocus/libcrocus_per_hw_ver40.a src/gallium=
/drivers/crocus/libcrocus_per_hw_ver45.a src/gallium/drivers/crocus/libcroc=
us_per_hw_ver50.a src/gallium/drivers/crocus/libcrocus_per_hw_ver60.a src/g=
allium/drivers/crocus/libcrocus_per_hw_ver70.a src/gallium/drivers/crocus/l=
ibcrocus_per_hw_ver75.a src/gallium/drivers/crocus/libcrocus_per_hw_ver80.a=
 src/gallium/winsys/crocus/drm/libcrocuswinsys.a -Wl,--build-id=3Dsha1 -Wl,=
--gc-sections -Wl,--version-script /srv/build/ttorling/workspace-upgrades/b=
uild/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium/targe=
ts/dri/dri.sym -Wl,--dynamic-list /srv/build/ttorling/workspace-upgrades/bu=
ild/tmp/work/x86_64-linux/mesa-native/23.1.8/mesa-23.1.8/src/gallium/target=
s/dri/../dri-vdpau.dyn /srv/build/ttorling/workspace-upgrades/build/tmp/wor=
k/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/.=
./../../usr/lib/libdrm.so /usr/lib/llvm-14/lib/libLLVM-14.so.1 -pthread /sr=
v/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-native=
/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libexpat.s=
o /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/mesa-n=
ative/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libz.=
so -lm /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux/m=
esa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/=
libzstd.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/=
lib/libxcb-randr.so /srv/build/ttorling/workspace-upgrades/build/tmp/work/x=
86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgconfig/../.=
./../usr/lib/libdrm_radeon.so /srv/build/ttorling/workspace-upgrades/build/=
tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/lib/libelf.so /srv/build/ttorling/workspace-upgrades/bui=
ld/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/usr/lib/p=
kgconfig/../../../usr/lib/libdrm_amdgpu.so /srv/build/ttorling/workspace-up=
grades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native=
/usr/lib/pkgconfig/../../../usr/lib/libdrm_nouveau.so /srv/build/ttorling/w=
orkspace-upgrades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/lib/libdrm_intel.so -Wl,--end-gr=
oup
/srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/gallium/=
auxiliary/libgallium.a.p/gallivm_lp_bld_misc.cpp.o: in function `llvm::Smal=
lVectorTemplateBase<std::__cxx11::basic_string<char, std::char_traits<char>=
, std::allocator<char> >, false>::grow(unsigned long)':
lp_bld_misc.cpp:(.text._ZN4llvm23SmallVectorTemplateBaseINSt7__cxx1112basic=
_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm[_ZN4llvm23SmallVectorTemplat=
eBaseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELb0EE4growEm]+0x3=
6): undefined reference to `llvm::SmallVectorBase<unsigned int>::mallocForG=
row(void*, unsigned long, unsigned long, unsigned long&)'
/srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/amd/llvm=
/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `llvm::DataLayout=
::getTypeSizeInBits(llvm::Type*) const':
ac_llvm_helper.cpp:(.text._ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4Typ=
eE[_ZNK4llvm10DataLayout17getTypeSizeInBitsEPNS_4TypeE]+0xa4): undefined re=
ference to `llvm::TargetExtType::getLayoutType() const'
/srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: src/amd/llvm=
/libamd_common_llvm.a.p/ac_llvm_helper.cpp.o: in function `ac_create_passmg=
r':
ac_llvm_helper.cpp:(.text.ac_create_passmgr+0x8c): undefined reference to `=
llvm::createPromoteMemoryToRegisterPass(bool)'
/srv/build/ttorling/workspace-upgrades/build/tmp/hosttools/ld: ac_llvm_help=
er.cpp:(.text.ac_create_passmgr+0xa6): undefined reference to `llvm::create=
SROAPass(bool)'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
INFO: autodetecting backend as ninja
INFO: calculating backend command to run: /srv/build/ttorling/workspace-upg=
rades/build/tmp/work/x86_64-linux/mesa-native/23.1.8/recipe-sysroot-native/=
usr/bin/ninja -j 24 -v
WARNING: /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-linux=
/mesa-native/23.1.8/temp/run.do_compile.3996760:155 exit 1 from 'meson comp=
ile -v -j 24'
WARNING: Backtrace (BB generated script):=20
	#1: meson_do_compile, /srv/build/ttorling/workspace-upgrades/build/tmp/wor=
k/x86_64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 155
	#2: do_compile, /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_=
64-linux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 150
	#3: main, /srv/build/ttorling/workspace-upgrades/build/tmp/work/x86_64-lin=
ux/mesa-native/23.1.8/temp/run.do_compile.3996760, line 159

(log borrowed from Tim but I'm seeing a similar issue)

Cheers,

Richard

