Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.9617.1602633637302947926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 17:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=D7AeXIxR;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id s4so1378197qkf.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 17:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HBV/VAfeFy8+Gw1fgDrZMIT3EpYPXwUI107uM63lNAU=;
        b=D7AeXIxR6Je0OJTZKrkfXSkrTNeJ5q2lzJt+xzMcy031PZ3k3ZjuL79HWJefK3mnD9
         5LIZ9vxeDaerpXcOHcajidTSFUFcWx/NojlKgoPNBilBs7kn5qST8+nw590WnilhoWHL
         VyrJu+vWfp1PUixdmiaGCASpoVWIRcWPldUkSZoxXG1Rb+iWoa2cEzAAnzuQm3tAsnlT
         kTjeM9WBxXyZLx80HADN/Caw1ftA+CIGbIRgt7yIldkbA3iMPqQizwxcxdn2U5CywdBm
         hs4/bLIgRIWPUp1Zfwfs8G74Hs6zVfyhRZOc/HbJW8WY2fOf4+TgkNe6sAsUVLn7fgQv
         D08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HBV/VAfeFy8+Gw1fgDrZMIT3EpYPXwUI107uM63lNAU=;
        b=bwIrkwAgMbcnTFPiaK7oO1Ef7Y7o9rXLfb2vjxxMrrbEYPDcZ6ZGceWBo8GcdL+8qG
         A9uWs1p0TzgxZLe8uL93zIOMZ0uuTcg3IGiCWNk+F87RIBBfGtqAtGhnfJZZ3oUIAtle
         Cetm+euBSRD9uQXds34jzilQt+uKaJJBMAmY2Gqu/QyqK8qgmn+TFslCE7KoslLe1w7X
         je6vsoxBWHOeyGhSRWXxPeCwN8agxEETSrhds9muGIs+9/iB5+p1cXcut7YFdR8ON8pQ
         P4ONg5MXFUB8m3EfF2GtI9W2P44t081Qnf+JqUEOfjv8/TMqfmq849wxsTNzIJKbbERM
         r+Vw==
X-Gm-Message-State: AOAM530EzmBYmRgFiJPNm48YuYFg63ykRldywr755IZs2EcyjRbOti1h
	Zy9khzPwFNAkXquWlBhVDsQ1l04jJ/B4YMda
X-Google-Smtp-Source: ABdhPJwVWEnbqm7FDJUoMgb3XY0cc1710tIWTkhxOxWHVscw62qCReDoH8SG/vpvd+tsXmM7haQuWA==
X-Received: by 2002:a37:8cc5:: with SMTP id o188mr2597933qkd.34.1602633635923;
        Tue, 13 Oct 2020 17:00:35 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id r17sm647970qtc.22.2020.10.13.17.00.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 17:00:35 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f171.google.com with SMTP id s4so1378136qkf.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 17:00:34 -0700 (PDT)
X-Received: by 2002:a37:7086:: with SMTP id l128mr2682338qkc.64.1602633634403;
 Tue, 13 Oct 2020 17:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201013234452.2294860-1-quaresma.jose@gmail.com> <20201013234452.2294860-4-quaresma.jose@gmail.com>
In-Reply-To: <20201013234452.2294860-4-quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 21:00:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpjUpkXYKNZDftY0AUnxkH=58BifLNG49jSf_ry67sR7A@mail.gmail.com>
Message-ID: <CAP9ODKpjUpkXYKNZDftY0AUnxkH=58BifLNG49jSf_ry67sR7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] shaderc: add receipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 13 de out. de 2020 =C3=A0s 20:45, Jose Quaresma
<quaresma.jose@gmail.com> escreveu:
>
> A collection of tools, libraries and tests for shader compilation
>
> This receipe is needed to build the gstreamer vulkan plugin
> as it provides the binary glslc.
>
> It is based on arch linux shaderc packge including the patches
> https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a220264a44=
8527c1a8cf037caaad8e/trunk/PKGBUILD
>
>     * 0001-fix-glslang-link-order.patch
>       Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e6=
7]
>
>     * 0002-shaderc-2019.0-fix-build-against-new-glslang.patch
>       Upstream-Status: Pending
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...link-order-of-libglslang-and-libHLSL.patch | 47 ++++++++++++
>  ...2019.0-fix-build-against-new-glslang.patch | 71 +++++++++++++++++++
>  .../shaderc/shaderc_2019.0.bb                 | 37 ++++++++++
>  3 files changed, 155 insertions(+)
>  create mode 100644 meta/recipes-graphics/shaderc/files/0001-Fix-the-lin=
k-order-of-libglslang-and-libHLSL.patch
>  create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-201=
9.0-fix-build-against-new-glslang.patch
>  create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb
>
> diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order=
-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/0001=
-Fix-the-link-order-of-libglslang-and-libHLSL.patch
> new file mode 100644
> index 0000000000..d11d6e20d4
> --- /dev/null
> +++ b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-lib=
glslang-and-libHLSL.patch
> @@ -0,0 +1,47 @@
> +From d352129a9df212b384a908fd3cfe5a1739cb003a Mon Sep 17 00:00:00 2001
> +From: Niklas Haas <git@haasn.xyz>
> +Date: Tue, 29 May 2018 07:34:00 +0200
> +Subject: [PATCH 1/2] Fix the link order of libglslang and libHLSL
> +
> +libglslang depends on libHLSL, so the latter needs to be specified last=
.
> +This fixes an issue when trying to build shaderc against system-wide
> +versions of libglslang/libHLSL, rather than the in-tree versions from
> +third_party.
> +
> +Additionally, libshaderc_util also depends on SPIRV-Tools

Upstream-Status header is here.

> +---
> + glslc/CMakeLists.txt           | 2 +-
> + libshaderc_util/CMakeLists.txt | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
> +index acf6fb0..0f5d888 100644
> +--- a/glslc/CMakeLists.txt
> ++++ b/glslc/CMakeLists.txt
> +@@ -18,7 +18,7 @@ add_library(glslc STATIC
> + shaderc_default_compile_options(glslc)
> + target_include_directories(glslc PUBLIC ${glslang_SOURCE_DIR})
> + target_link_libraries(glslc PRIVATE glslang OSDependent OGLCompiler
> +-  HLSL glslang SPIRV ${CMAKE_THREAD_LIBS_INIT})
> ++  glslang SPIRV HLSL ${CMAKE_THREAD_LIBS_INIT})
> + target_link_libraries(glslc PRIVATE shaderc_util shaderc)
> +
> + add_executable(glslc_exe src/main.cc)
> +diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeList=
s.txt
> +index ec0e8fb..ded089d 100644
> +--- a/libshaderc_util/CMakeLists.txt
> ++++ b/libshaderc_util/CMakeLists.txt
> +@@ -28,8 +28,8 @@ target_include_directories(shaderc_util
> +
> + find_package(Threads)
> + target_link_libraries(shaderc_util PRIVATE
> +-  glslang OSDependent OGLCompiler HLSL glslang SPIRV
> +-  SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
> ++  glslang OSDependent OGLCompiler glslang HLSL SPIRV
> ++  SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})
> +
> + shaderc_add_tests(
> +   TEST_PREFIX shaderc_util
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix=
-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/0002=
-shaderc-2019.0-fix-build-against-new-glslang.patch
> new file mode 100644
> index 0000000000..5becbeb274
> --- /dev/null
> +++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-=
against-new-glslang.patch
> @@ -0,0 +1,71 @@
> +From f7dfc70c2709b2d77768a73dc883d92d44bb1b29 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Tue, 13 Oct 2020 15:20:11 +0100
> +Subject: [PATCH 2/2] shaderc-2019.0: fix build against new glslang
> +
> +posted to the arch package repository by: svenstaro@gmail.com
> +https://github.com/archlinux/svntogit-packages/commit/72283b634a0bd7c8d=
99cc605e273fe1294b77b44

Upstream-Status header is here as well.

> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + libshaderc/src/shaderc.cc       |  2 +-
> + libshaderc_util/src/compiler.cc | 10 +---------
> + 2 files changed, 2 insertions(+), 10 deletions(-)
> +
> +diff --git a/libshaderc/src/shaderc.cc b/libshaderc/src/shaderc.cc
> +index 3c3c3de..b5fc6cb 100644
> +--- a/libshaderc/src/shaderc.cc
> ++++ b/libshaderc/src/shaderc.cc
> +@@ -20,7 +20,7 @@
> + #include <sstream>
> + #include <vector>
> +
> +-#include "SPIRV/spirv.hpp"
> ++#include "glslang/SPIRV/spirv.hpp"
> +
> + #include "libshaderc_util/compiler.h"
> + #include "libshaderc_util/counting_includer.h"
> +diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/comp=
iler.cc
> +index ef7867f..acc172b 100644
> +--- a/libshaderc_util/src/compiler.cc
> ++++ b/libshaderc_util/src/compiler.cc
> +@@ -26,7 +26,7 @@
> + #include "libshaderc_util/string_piece.h"
> + #include "libshaderc_util/version_profile.h"
> +
> +-#include "SPIRV/GlslangToSpv.h"
> ++#include "glslang/SPIRV/GlslangToSpv.h"
> +
> + namespace {
> + using shaderc_util::string_piece;
> +@@ -291,17 +291,12 @@ std::tuple<bool, std::vector<uint32_t>, size_t> C=
ompiler::Compile(
> +       bases[static_cast<int>(UniformKind::StorageBuffer)]);
> +   shader.setShiftUavBinding(
> +       bases[static_cast<int>(UniformKind::UnorderedAccessView)]);
> +-  shader.setHlslIoMapping(hlsl_iomap_);
> +   shader.setResourceSetBinding(
> +       hlsl_explicit_bindings_[static_cast<int>(used_shader_stage)]);
> +   shader.setEnvClient(target_client_info.client,
> +                       target_client_info.client_version);
> +   shader.setEnvTarget(target_client_info.target_language,
> +                       target_client_info.target_language_version);
> +-  if (hlsl_functionality1_enabled_) {
> +-    shader.setEnvTargetHlslFunctionality1();
> +-  }
> +-
> +   const EShMessages rules =3D GetMessageRules(target_env_, source_lang=
uage_,
> +                                             hlsl_offsets_,
> +                                             generate_debug_info_);
> +@@ -478,9 +473,6 @@ std::tuple<bool, std::string, std::string> Compiler=
::PreprocessShader(
> +   }
> +   shader.setEnvClient(target_client_info.client,
> +                       target_client_info.client_version);
> +-  if (hlsl_functionality1_enabled_) {
> +-    shader.setEnvTargetHlslFunctionality1();
> +-  }
> +
> +   // The preprocessor might be sensitive to the target environment.
> +   // So combine the existing rules with the just-give-me-preprocessor-=
output
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/reci=
pes-graphics/shaderc/shaderc_2019.0.bb
> new file mode 100644
> index 0000000000..636bd780d0
> --- /dev/null
> +++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> @@ -0,0 +1,37 @@
> +SUMMARY  =3D "A collection of tools, libraries and tests for shader com=
pilation"
> +DESCRIPTION =3D "The Shaderc library provides an API for compiling GLSL=
/HLSL \
> +source code to SPIRV modules. It has been shipping in the Android NDK s=
ince version r12b."
> +SECTION =3D "graphics"
> +HOMEPAGE =3D "https://github.com/google/shaderc"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f=
4327"
> +
> +SRCREV =3D "34c412f21f945f4ef6ed4453f8b5dc4bb9d739e4"
> +SRC_URI =3D "git://github.com/google/shaderc.git;protocol=3Dhttps;branc=
h=3Dmain \
> +           file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.pat=
ch \
> +           file://0002-shaderc-2019.0-fix-build-against-new-glslang.pat=
ch \
> +"
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake python3native
> +
> +DEPENDS =3D "spirv-tools glslang"
> +
> +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DReleas -DSHADERC_SKIP_TESTS=3DO=
N"
> +
> +do_configure_prepend() {
> +    # de-vendor libs and disable git versioning
> +    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
> +    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt

This kind of source editing is hard to know when it becomes old,
unused, or incompatible. It might be nicer if you could add patches to
do those changes as if they become incompatible it is quite easy to
figure it as the patches fail to apply.

> +    # TODO: probably there is better solution for this.
> +    # I dont know any method for get the version of a receipe in DEPEND=
S
> +    # so do this ugly hack
> +    cat <<- EOF > ${S}/glslc/src/build-version.inc
> +"${PV}\\n"
> +"$(pkg-config --modversion SPIRV-Tools)\\n"
> +"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
> +EOF
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.28.0
>
>
>=20
>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
