Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.7296.1602664621193243547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 01:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZiT2p2bl;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id l24so2236419edj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0rjYquP6pDD3Jd22x8i81QlVnV+NuOvvlJjXgXxNnds=;
        b=ZiT2p2blGKMRYQhJm2lsAeRlCb2gndtPsea+hYp+nlLJNGmktCFiOfl7uZWdkpg0ot
         S5AgN+g/+Qj9nP4MgO3Up1Darw9gqAjsTCk+WeEhDXzxqvm9njAbZREG63PuvD67DlIQ
         MoLhLEKlEylhiWChFrfGUDM1IHEX0Ip7Y+NL0tGDaG83fXhHHnk9CPZ6NOFUcMpJ3Cn9
         ePy9ZraAOT6J09/j+skaYMNpv9xHcl0HzJ2iE8MbBU749tpV+3uHMAziN2rsXESGap/p
         1r/6H7bH9H39Em6gMbb26I6qqp1VwYS4WqulYBVAQhirqxxMz0faCaNeUSXVWODnPz4n
         1JKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0rjYquP6pDD3Jd22x8i81QlVnV+NuOvvlJjXgXxNnds=;
        b=d8x1OnVyhlucSiSAWKb3tgyldMLXSKLE9LpmwTEkzAV8lQjJ1dQcRxVgaLPYsePQ53
         Ci6qfsQZFA3eTakcnAbp03zTIIqj58pHMu7QlTY7YhwwFdaRNMhvvtvHqeRlwRC9kZgY
         W0EWbkF5Jh2pp2ww1WUfcHmbFklOEpxiJTCSkTzGXZAEid1D7r3JyPedTt6+k1ChHvz3
         5OFVzBqFPPmujOCnKb7npLMni3RlsNMp3gksPgIHH3gc8EcxFCN7XWTGWzpgV7Qx7V+u
         iiO5DWVCdTDWnK+XhMZq0KFGtPtFDSiz1YsqNGftF7dbxbQSEMOCoAJiqWvuMLVJq6y0
         tgnA==
X-Gm-Message-State: AOAM533AzZ2GFrLtEp+WrDZvEPp3Rjl236cm3fBGzZQG15+nKVWUbYLY
	JQV/Hf4thswrkgYHan3lrlwjdmgMB7lqcHlDtW0=
X-Google-Smtp-Source: ABdhPJwAnwfY7iO+oOe5D7PCuzfeCue3wxflujQ2RPfh/fi4BF1W3xPmkfGuNj9/XRQ3AAzgaKFgn9jW/O9Gr0YU6k0=
X-Received: by 2002:aa7:de06:: with SMTP id h6mr3938830edv.31.1602664619406;
 Wed, 14 Oct 2020 01:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201013234452.2294860-1-quaresma.jose@gmail.com>
 <20201013234452.2294860-4-quaresma.jose@gmail.com> <CAP9ODKpjUpkXYKNZDftY0AUnxkH=58BifLNG49jSf_ry67sR7A@mail.gmail.com>
In-Reply-To: <CAP9ODKpjUpkXYKNZDftY0AUnxkH=58BifLNG49jSf_ry67sR7A@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 14 Oct 2020 09:36:50 +0100
Message-ID: <CANPvuR=QxH4-udojrDvZE=QUQmQ4PgDztZc3AN363HgL26S_uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] shaderc: add receipe
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio.salvador@ossystems.com.br> escreveu no dia
quarta, 14/10/2020 =C3=A0(s) 01:00:
>
> Em ter., 13 de out. de 2020 =C3=A0s 20:45, Jose Quaresma
> <quaresma.jose@gmail.com> escreveu:
> >
> > A collection of tools, libraries and tests for shader compilation
> >
> > This receipe is needed to build the gstreamer vulkan plugin
> > as it provides the binary glslc.
> >
> > It is based on arch linux shaderc packge including the patches
> > https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a220264a=
448527c1a8cf037caaad8e/trunk/PKGBUILD
> >
> >     * 0001-fix-glslang-link-order.patch
> >       Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4=
e67]
> >
> >     * 0002-shaderc-2019.0-fix-build-against-new-glslang.patch
> >       Upstream-Status: Pending
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  ...link-order-of-libglslang-and-libHLSL.patch | 47 ++++++++++++
> >  ...2019.0-fix-build-against-new-glslang.patch | 71 ++++++++++++++++++=
+
> >  .../shaderc/shaderc_2019.0.bb                 | 37 ++++++++++
> >  3 files changed, 155 insertions(+)
> >  create mode 100644 meta/recipes-graphics/shaderc/files/0001-Fix-the-l=
ink-order-of-libglslang-and-libHLSL.patch
> >  create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-2=
019.0-fix-build-against-new-glslang.patch
> >  create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> >
> > diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-ord=
er-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/00=
01-Fix-the-link-order-of-libglslang-and-libHLSL.patch
> > new file mode 100644
> > index 0000000000..d11d6e20d4
> > --- /dev/null
> > +++ b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-l=
ibglslang-and-libHLSL.patch
> > @@ -0,0 +1,47 @@
> > +From d352129a9df212b384a908fd3cfe5a1739cb003a Mon Sep 17 00:00:00 200=
1
> > +From: Niklas Haas <git@haasn.xyz>
> > +Date: Tue, 29 May 2018 07:34:00 +0200
> > +Subject: [PATCH 1/2] Fix the link order of libglslang and libHLSL
> > +
> > +libglslang depends on libHLSL, so the latter needs to be specified la=
st.
> > +This fixes an issue when trying to build shaderc against system-wide
> > +versions of libglslang/libHLSL, rather than the in-tree versions from
> > +third_party.
> > +
> > +Additionally, libshaderc_util also depends on SPIRV-Tools
>
> Upstream-Status header is here.

I will change it.

>
> > +---
> > + glslc/CMakeLists.txt           | 2 +-
> > + libshaderc_util/CMakeLists.txt | 4 ++--
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
> > +index acf6fb0..0f5d888 100644
> > +--- a/glslc/CMakeLists.txt
> > ++++ b/glslc/CMakeLists.txt
> > +@@ -18,7 +18,7 @@ add_library(glslc STATIC
> > + shaderc_default_compile_options(glslc)
> > + target_include_directories(glslc PUBLIC ${glslang_SOURCE_DIR})
> > + target_link_libraries(glslc PRIVATE glslang OSDependent OGLCompiler
> > +-  HLSL glslang SPIRV ${CMAKE_THREAD_LIBS_INIT})
> > ++  glslang SPIRV HLSL ${CMAKE_THREAD_LIBS_INIT})
> > + target_link_libraries(glslc PRIVATE shaderc_util shaderc)
> > +
> > + add_executable(glslc_exe src/main.cc)
> > +diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLi=
sts.txt
> > +index ec0e8fb..ded089d 100644
> > +--- a/libshaderc_util/CMakeLists.txt
> > ++++ b/libshaderc_util/CMakeLists.txt
> > +@@ -28,8 +28,8 @@ target_include_directories(shaderc_util
> > +
> > + find_package(Threads)
> > + target_link_libraries(shaderc_util PRIVATE
> > +-  glslang OSDependent OGLCompiler HLSL glslang SPIRV
> > +-  SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
> > ++  glslang OSDependent OGLCompiler glslang HLSL SPIRV
> > ++  SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})
> > +
> > + shaderc_add_tests(
> > +   TEST_PREFIX shaderc_util
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-f=
ix-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/00=
02-shaderc-2019.0-fix-build-against-new-glslang.patch
> > new file mode 100644
> > index 0000000000..5becbeb274
> > --- /dev/null
> > +++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-buil=
d-against-new-glslang.patch
> > @@ -0,0 +1,71 @@
> > +From f7dfc70c2709b2d77768a73dc883d92d44bb1b29 Mon Sep 17 00:00:00 200=
1
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Tue, 13 Oct 2020 15:20:11 +0100
> > +Subject: [PATCH 2/2] shaderc-2019.0: fix build against new glslang
> > +
> > +posted to the arch package repository by: svenstaro@gmail.com
> > +https://github.com/archlinux/svntogit-packages/commit/72283b634a0bd7c=
8d99cc605e273fe1294b77b44
>
> Upstream-Status header is here as well.

I will change it.

>
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + libshaderc/src/shaderc.cc       |  2 +-
> > + libshaderc_util/src/compiler.cc | 10 +---------
> > + 2 files changed, 2 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/libshaderc/src/shaderc.cc b/libshaderc/src/shaderc.cc
> > +index 3c3c3de..b5fc6cb 100644
> > +--- a/libshaderc/src/shaderc.cc
> > ++++ b/libshaderc/src/shaderc.cc
> > +@@ -20,7 +20,7 @@
> > + #include <sstream>
> > + #include <vector>
> > +
> > +-#include "SPIRV/spirv.hpp"
> > ++#include "glslang/SPIRV/spirv.hpp"
> > +
> > + #include "libshaderc_util/compiler.h"
> > + #include "libshaderc_util/counting_includer.h"
> > +diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/co=
mpiler.cc
> > +index ef7867f..acc172b 100644
> > +--- a/libshaderc_util/src/compiler.cc
> > ++++ b/libshaderc_util/src/compiler.cc
> > +@@ -26,7 +26,7 @@
> > + #include "libshaderc_util/string_piece.h"
> > + #include "libshaderc_util/version_profile.h"
> > +
> > +-#include "SPIRV/GlslangToSpv.h"
> > ++#include "glslang/SPIRV/GlslangToSpv.h"
> > +
> > + namespace {
> > + using shaderc_util::string_piece;
> > +@@ -291,17 +291,12 @@ std::tuple<bool, std::vector<uint32_t>, size_t>=
 Compiler::Compile(
> > +       bases[static_cast<int>(UniformKind::StorageBuffer)]);
> > +   shader.setShiftUavBinding(
> > +       bases[static_cast<int>(UniformKind::UnorderedAccessView)]);
> > +-  shader.setHlslIoMapping(hlsl_iomap_);
> > +   shader.setResourceSetBinding(
> > +       hlsl_explicit_bindings_[static_cast<int>(used_shader_stage)]);
> > +   shader.setEnvClient(target_client_info.client,
> > +                       target_client_info.client_version);
> > +   shader.setEnvTarget(target_client_info.target_language,
> > +                       target_client_info.target_language_version);
> > +-  if (hlsl_functionality1_enabled_) {
> > +-    shader.setEnvTargetHlslFunctionality1();
> > +-  }
> > +-
> > +   const EShMessages rules =3D GetMessageRules(target_env_, source_la=
nguage_,
> > +                                             hlsl_offsets_,
> > +                                             generate_debug_info_);
> > +@@ -478,9 +473,6 @@ std::tuple<bool, std::string, std::string> Compil=
er::PreprocessShader(
> > +   }
> > +   shader.setEnvClient(target_client_info.client,
> > +                       target_client_info.client_version);
> > +-  if (hlsl_functionality1_enabled_) {
> > +-    shader.setEnvTargetHlslFunctionality1();
> > +-  }
> > +
> > +   // The preprocessor might be sensitive to the target environment.
> > +   // So combine the existing rules with the just-give-me-preprocesso=
r-output
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/re=
cipes-graphics/shaderc/shaderc_2019.0.bb
> > new file mode 100644
> > index 0000000000..636bd780d0
> > --- /dev/null
> > +++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> > @@ -0,0 +1,37 @@
> > +SUMMARY  =3D "A collection of tools, libraries and tests for shader c=
ompilation"
> > +DESCRIPTION =3D "The Shaderc library provides an API for compiling GL=
SL/HLSL \
> > +source code to SPIRV modules. It has been shipping in the Android NDK=
 since version r12b."
> > +SECTION =3D "graphics"
> > +HOMEPAGE =3D "https://github.com/google/shaderc"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd898696=
8f4327"
> > +
> > +SRCREV =3D "34c412f21f945f4ef6ed4453f8b5dc4bb9d739e4"
> > +SRC_URI =3D "git://github.com/google/shaderc.git;protocol=3Dhttps;bra=
nch=3Dmain \
> > +           file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.p=
atch \
> > +           file://0002-shaderc-2019.0-fix-build-against-new-glslang.p=
atch \
> > +"
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake python3native
> > +
> > +DEPENDS =3D "spirv-tools glslang"
> > +
> > +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DReleas -DSHADERC_SKIP_TESTS=
=3DON"
> > +
> > +do_configure_prepend() {
> > +    # de-vendor libs and disable git versioning
> > +    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
> > +    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt
>
> This kind of source editing is hard to know when it becomes old,
> unused, or incompatible. It might be nicer if you could add patches to
> do those changes as if they become incompatible it is quite easy to
> figure it as the patches fail to apply.
>

I will add a pacth for this.

> > +    # TODO: probably there is better solution for this.
> > +    # I dont know any method for get the version of a receipe in DEPE=
NDS
> > +    # so do this ugly hack
> > +    cat <<- EOF > ${S}/glslc/src/build-version.inc
> > +"${PV}\\n"
> > +"$(pkg-config --modversion SPIRV-Tools)\\n"
> > +"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
> > +EOF
> > +}

Do you know any better method to do this?
I need the version of the receipe in DEPENDS

> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.28.0
> >
> >
> >=20
> >
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750



--=20
best regards,
Jos=C3=A9 Quaresma
