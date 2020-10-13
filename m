Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.5422.1602621720448043919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 13:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C+IQs6Wi;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id l16so881901eds.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 13:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lCs4xywVzgv6mUqMEjNJ5N/9QtvcOmy31Fie4KSIXjY=;
        b=C+IQs6Wi9tjg1k+zOM46UotWSg17YQdtFlZjvKbeXE/DQok6sjsf7+AfO1Irz4mjp3
         DPHdGxm2sMsaOOeSltGsyqKiwr+emUFjGfVa45NJMCYPzREswnYukJmWqcuI1jqvJPHK
         bG+lCFY/hIcv4260N+Mi+RRFqrQ4aS1sdDdFTg1ilS2nPm1zz9OgD1spca9b4SkTlb4Y
         4dRdI0VdwuRFW8S4dhUeFCPewOmCUx474pEXltgVN5ZqegLh4I2qQ95rrK1suIuUrBsy
         K0c/DCJ0kgTMjzWWDz7c8N8Xao2zQeL7T6mnqNRI+ICQcXgglOE12YGiit3F33fYqIjY
         AEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lCs4xywVzgv6mUqMEjNJ5N/9QtvcOmy31Fie4KSIXjY=;
        b=kUrpFWHir/PEE8E1MMfTTsKfnuCYi885eTJnA4p7sD8sTmJJXstuT7Lgye+tmCJaCf
         lFbNMMAztsnW8PxvASBOVI964h2LPpiWo4TXLFmxj2McYl/GsrjvApQ9s4R0TJuLoHgZ
         t8StE8JBjXBP5GqFrRQ1NIMtic9ga7YBT3jrdwNAkSBjKz8WzVRiZUbPhgsFMHmQ6LIP
         wiHAZUbH6q39RGIxudUHARCgaZmdtDWUL5ynPa33RctzHuYh6kIScGnnuo7oB6/wNv9p
         Mbn49Zqm5ZbxTZ92EZwfhwF14bZicdiEu+tU94M0Z5XXuF9AHNEqsajq+USachGgGrf7
         viVQ==
X-Gm-Message-State: AOAM533NEN2YhYobFSlrv3+X0dVpZdmdZevbr/qlI4L0rkX8ognLTGIy
	RWZw/FO1m9c0gU3TFyM4Td61mDV5wwpX9f3/Lmw=
X-Google-Smtp-Source: ABdhPJxRZVjZ0zVrqsnQNWc2rO0HZF2Kvv9rl0axOtrcZcKtg7yXxgYkjV5jmQED+bejORKHyh185YvRVcvr1Crer4w=
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr1513292edb.19.1602621718861;
 Tue, 13 Oct 2020 13:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
 <20201013173502.2245733-5-quaresma.jose@gmail.com> <CAHtQpK6b2xc-fnkwMk+9OBfFiKnAE7RMROo=UC0JwEANrp+Agw@mail.gmail.com>
In-Reply-To: <CAHtQpK6b2xc-fnkwMk+9OBfFiKnAE7RMROo=UC0JwEANrp+Agw@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 21:41:49 +0100
Message-ID: <CANPvuR=-CWrYXZ6Hz0Wb7_kEu6e0Sh=qxYrjHRKuzBUVWNTjXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] shaderc: add receipe
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrey Zhizhikin <andrey.z@gmail.com> escreveu no dia ter=C3=A7a,
13/10/2020 =C3=A0(s) 20:01:
>
> On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
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
> >  .../files/0001-fix-glslang-link-order.patch   | 44 +++++++++++++++
> >  ...2019.0-fix-build-against-new-glslang.patch | 54 ++++++++++++++++++=
+
> >  .../shaderc/shaderc_2019.0.bb                 | 36 +++++++++++++
> >  3 files changed, 134 insertions(+)
> >  create mode 100644 meta/recipes-graphics/shaderc/files/0001-fix-glsla=
ng-link-order.patch
> >  create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-2=
019.0-fix-build-against-new-glslang.patch
> >  create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> >
> > diff --git a/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link=
-order.patch b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-or=
der.patch
> > new file mode 100644
> > index 0000000000..a404c85839
> > --- /dev/null
> > +++ b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.=
patch
> > @@ -0,0 +1,44 @@
> > +From 21c8be385b3fab5edcb934a6d99f69fd389c4e67 Mon Sep 17 00:00:00 200=
1
> > +From: Niklas Haas <git@haasn.xyz>
> > +Date: Tue, 29 May 2018 07:34:00 +0200
> > +Subject: [PATCH] Fix the link order of libglslang and libHLSL
> > +
> > +libglslang depends on libHLSL, so the latter needs to be specified la=
st.
> > +This fixes an issue when trying to build shaderc against system-wide
> > +versions of libglslang/libHLSL, rather than the in-tree versions from
> > +third_party.
> > +
> > +Additionally, libshaderc_util also depends on SPIRV-Tools
> > +---
> > + glslc/CMakeLists.txt           | 2 +-
> > + libshaderc_util/CMakeLists.txt | 4 ++--
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
> > +index acf6fb0b..0f5d8886 100644
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
> > +index 873540ab..6d0c465c 100644
> > +--- a/libshaderc_util/CMakeLists.txt
> > ++++ b/libshaderc_util/CMakeLists.txt
> > +@@ -34,8 +34,8 @@ endif(SHADERC_ENABLE_INSTALL)
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
> > diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-f=
ix-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/00=
02-shaderc-2019.0-fix-build-against-new-glslang.patch
> > new file mode 100644
> > index 0000000000..807540cf62
> > --- /dev/null
> > +++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-buil=
d-against-new-glslang.patch
>
> This patch does not have any Header, Signed-of-by: and
> Upstream-Status. Would be really hard to track it, and should actually
> fail AB.

I will try to fix it and find the author of the patch.

>
> > @@ -0,0 +1,54 @@
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
> > diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/re=
cipes-graphics/shaderc/shaderc_2019.0.bb
> > new file mode 100644
> > index 0000000000..ac3db09937
> > --- /dev/null
> > +++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY  =3D "A collection of tools, libraries and tests for shader c=
ompilation"
> > +DESCRIPTION =3D ""
> > +SECTION =3D "graphics"
> > +HOMEPAGE =3D "https://github.com/google/shaderc"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd898696=
8f4327"
> > +
> > +SRC_URI =3D "https://github.com/google/shaderc/archive/v${PV}.tar.gz =
\
> > +           file://0001-fix-glslang-link-order.patch \
> > +           file://0002-shaderc-2019.0-fix-build-against-new-glslang.p=
atch \
> > +"
> > +SRC_URI[md5sum] =3D "8eb2b40712db2762a5cc40b568fd8ad9"
> > +SRC_URI[sha256sum] =3D "1018cd02be52295272fdbffa056ee24b881be277c83d0=
39ad554d91230f4e11b"
> > +
> > +inherit cmake python3native
> > +
> > +DEPENDS =3D "spirv-tools-native glslang-native"
> > +
> > +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DReleas -DSHADERC_SKIP_TESTS=
=3DON"
> > +
> > +do_configure_prepend() {
> > +    # de-vendor libs and disable git versioning
> > +    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
> > +    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt
> > +
> > +    # TODO: probably there is better solution for this.
> > +    # I dont know any method for get the version of a receipe depende=
nt
> > +    # so do this ugly hack
> > +    cat <<- EOF > ${S}/glslc/src/build-version.inc
> > +"${PV}\\n"
> > +"$(pkg-config --modversion SPIRV-Tools)\\n"
> > +"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
> > +EOF
> > +}
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
> Regards,
> Andrey.



--=20
best regards,
Jos=C3=A9 Quaresma
