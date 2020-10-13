Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.5321.1602621667518250819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 13:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=utphgP2r;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id u8so1720209ejg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W9my+68ROnmyN4jBD6fClvIpGwT/rSPfaPwwuqBjSv0=;
        b=utphgP2rUbhgXG0WUxh9YDOCBT8xtABk+vtpbKhm6pbBcozGVQRNAeb/M/GHResr06
         +F19OvAFDeiyc3UX+1jF6D4w/iOS6f+8isL7zvZ5cg4C2WkpHwz1L4xJ3Ae2VsOFgIpE
         lG3C5b4KlkM+XdVI9Mj9MRDZjiKURhZd/qzthJtaX1F3K87E+f6pQAYb73EjGR5xob2S
         +VZgm8MrX8NGdsjWCFYTQRUyc9mU6tV7XGMtR/h1ANH3lxlu2RA5Y03L3rqoifrw5Qmv
         aNyUGQHxVtrlY9fwrR5zoPuEN8cLQZCBPmxKqMfMY2Bxc39akcs/OfY7MjxiaQhUyzzi
         FEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W9my+68ROnmyN4jBD6fClvIpGwT/rSPfaPwwuqBjSv0=;
        b=If1iiGsJ0+fc5xBZmaCjHBx/xNcVsY3jirKrTqk6VDSi0dMEAwIbCu6KIZtXa2ZIO1
         qUKIPM6JTc9ygump2sCwuUOlQKFvSARh8/4BhS5A0edtFl4xSz7XzAjpA+4u09i7TDrU
         0X3W5ohx53O30Zq/u2Dl+mJQoGa74gmoVJ/MviTV3Ne4ZR9unWVYv0SDt2hy6CcWH5gn
         MCzIIUMtIPlXN7qpooUmOxiBTIsZn6J7q+hhqDWCOcIL6zAlj3oYy2Q99+EZd+N+ci+D
         2neFi1NCfT/cYsg6t88rF8Il8MoPncHCsasEkhv4PDJ0QxpxH/X6vLz5osikIDa1CPdp
         vz5Q==
X-Gm-Message-State: AOAM533wWA9a4iQuwWDSATTlvVY7Bb1DzQI3inRsP+b9YIw0Fs5PIP2A
	qqDvHVBrqTsoNCnzYYJhZQIWK07UIacizylJed6il76j3FQ=
X-Google-Smtp-Source: ABdhPJz1IIr1wXNIoCVmbaBXh2n5fQ/DCQL1DcPoqGS52l49hLrL7ZHkyLzgC0YK6tCLCmHWm+Dh4gSw5Ki2E3k8QgM=
X-Received: by 2002:a17:906:5509:: with SMTP id r9mr1753001ejp.12.1602621665833;
 Tue, 13 Oct 2020 13:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
 <20201013173502.2245733-5-quaresma.jose@gmail.com> <CANNYZj_TQp2yCR16dQhArYtgViUnSFi=+Dwb4MayXomTL79xKg@mail.gmail.com>
In-Reply-To: <CANNYZj_TQp2yCR16dQhArYtgViUnSFi=+Dwb4MayXomTL79xKg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 21:40:55 +0100
Message-ID: <CANPvuRnnUiP+1kmdGkWrTQeT2fjCS5-PF6fFN2UXnd6EqBcXUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] shaderc: add receipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will fix it and use git instead of the archive.

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a,
13/10/2020 =C3=A0(s) 19:59:
>
> Same here: please build from git://
>
> Alex
>
> On Tue, 13 Oct 2020 at 19:35, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> A collection of tools, libraries and tests for shader compilation
>>
>> This receipe is needed to build the gstreamer vulkan plugin
>> as it provides the binary glslc.
>>
>> It is based on arch linux shaderc packge including the patches
>> https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a220264a4=
48527c1a8cf037caaad8e/trunk/PKGBUILD
>>
>>     * 0001-fix-glslang-link-order.patch
>>       Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e=
67]
>>
>>     * 0002-shaderc-2019.0-fix-build-against-new-glslang.patch
>>       Upstream-Status: Pending
>>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>  .../files/0001-fix-glslang-link-order.patch   | 44 +++++++++++++++
>>  ...2019.0-fix-build-against-new-glslang.patch | 54 +++++++++++++++++++
>>  .../shaderc/shaderc_2019.0.bb                 | 36 +++++++++++++
>>  3 files changed, 134 insertions(+)
>>  create mode 100644 meta/recipes-graphics/shaderc/files/0001-fix-glslan=
g-link-order.patch
>>  create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-20=
19.0-fix-build-against-new-glslang.patch
>>  create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb
>>
>> diff --git a/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-=
order.patch b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-ord=
er.patch
>> new file mode 100644
>> index 0000000000..a404c85839
>> --- /dev/null
>> +++ b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.p=
atch
>> @@ -0,0 +1,44 @@
>> +From 21c8be385b3fab5edcb934a6d99f69fd389c4e67 Mon Sep 17 00:00:00 2001
>> +From: Niklas Haas <git@haasn.xyz>
>> +Date: Tue, 29 May 2018 07:34:00 +0200
>> +Subject: [PATCH] Fix the link order of libglslang and libHLSL
>> +
>> +libglslang depends on libHLSL, so the latter needs to be specified las=
t.
>> +This fixes an issue when trying to build shaderc against system-wide
>> +versions of libglslang/libHLSL, rather than the in-tree versions from
>> +third_party.
>> +
>> +Additionally, libshaderc_util also depends on SPIRV-Tools
>> +---
>> + glslc/CMakeLists.txt           | 2 +-
>> + libshaderc_util/CMakeLists.txt | 4 ++--
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
>> +index acf6fb0b..0f5d8886 100644
>> +--- a/glslc/CMakeLists.txt
>> ++++ b/glslc/CMakeLists.txt
>> +@@ -18,7 +18,7 @@ add_library(glslc STATIC
>> + shaderc_default_compile_options(glslc)
>> + target_include_directories(glslc PUBLIC ${glslang_SOURCE_DIR})
>> + target_link_libraries(glslc PRIVATE glslang OSDependent OGLCompiler
>> +-  HLSL glslang SPIRV ${CMAKE_THREAD_LIBS_INIT})
>> ++  glslang SPIRV HLSL ${CMAKE_THREAD_LIBS_INIT})
>> + target_link_libraries(glslc PRIVATE shaderc_util shaderc)
>> +
>> + add_executable(glslc_exe src/main.cc)
>> +diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLis=
ts.txt
>> +index 873540ab..6d0c465c 100644
>> +--- a/libshaderc_util/CMakeLists.txt
>> ++++ b/libshaderc_util/CMakeLists.txt
>> +@@ -34,8 +34,8 @@ endif(SHADERC_ENABLE_INSTALL)
>> +
>> + find_package(Threads)
>> + target_link_libraries(shaderc_util PRIVATE
>> +-  glslang OSDependent OGLCompiler HLSL glslang SPIRV
>> +-  SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
>> ++  glslang OSDependent OGLCompiler glslang HLSL SPIRV
>> ++  SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})
>> +
>> + shaderc_add_tests(
>> +   TEST_PREFIX shaderc_util
>> diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fi=
x-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/000=
2-shaderc-2019.0-fix-build-against-new-glslang.patch
>> new file mode 100644
>> index 0000000000..807540cf62
>> --- /dev/null
>> +++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build=
-against-new-glslang.patch
>> @@ -0,0 +1,54 @@
>> +diff --git a/libshaderc/src/shaderc.cc b/libshaderc/src/shaderc.cc
>> +index 3c3c3de..b5fc6cb 100644
>> +--- a/libshaderc/src/shaderc.cc
>> ++++ b/libshaderc/src/shaderc.cc
>> +@@ -20,7 +20,7 @@
>> + #include <sstream>
>> + #include <vector>
>> +
>> +-#include "SPIRV/spirv.hpp"
>> ++#include "glslang/SPIRV/spirv.hpp"
>> +
>> + #include "libshaderc_util/compiler.h"
>> + #include "libshaderc_util/counting_includer.h"
>> +diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/com=
piler.cc
>> +index ef7867f..acc172b 100644
>> +--- a/libshaderc_util/src/compiler.cc
>> ++++ b/libshaderc_util/src/compiler.cc
>> +@@ -26,7 +26,7 @@
>> + #include "libshaderc_util/string_piece.h"
>> + #include "libshaderc_util/version_profile.h"
>> +
>> +-#include "SPIRV/GlslangToSpv.h"
>> ++#include "glslang/SPIRV/GlslangToSpv.h"
>> +
>> + namespace {
>> + using shaderc_util::string_piece;
>> +@@ -291,17 +291,12 @@ std::tuple<bool, std::vector<uint32_t>, size_t> =
Compiler::Compile(
>> +       bases[static_cast<int>(UniformKind::StorageBuffer)]);
>> +   shader.setShiftUavBinding(
>> +       bases[static_cast<int>(UniformKind::UnorderedAccessView)]);
>> +-  shader.setHlslIoMapping(hlsl_iomap_);
>> +   shader.setResourceSetBinding(
>> +       hlsl_explicit_bindings_[static_cast<int>(used_shader_stage)]);
>> +   shader.setEnvClient(target_client_info.client,
>> +                       target_client_info.client_version);
>> +   shader.setEnvTarget(target_client_info.target_language,
>> +                       target_client_info.target_language_version);
>> +-  if (hlsl_functionality1_enabled_) {
>> +-    shader.setEnvTargetHlslFunctionality1();
>> +-  }
>> +-
>> +   const EShMessages rules =3D GetMessageRules(target_env_, source_lan=
guage_,
>> +                                             hlsl_offsets_,
>> +                                             generate_debug_info_);
>> +@@ -478,9 +473,6 @@ std::tuple<bool, std::string, std::string> Compile=
r::PreprocessShader(
>> +   }
>> +   shader.setEnvClient(target_client_info.client,
>> +                       target_client_info.client_version);
>> +-  if (hlsl_functionality1_enabled_) {
>> +-    shader.setEnvTargetHlslFunctionality1();
>> +-  }
>> +
>> +   // The preprocessor might be sensitive to the target environment.
>> +   // So combine the existing rules with the just-give-me-preprocessor=
-output
>> diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/rec=
ipes-graphics/shaderc/shaderc_2019.0.bb
>> new file mode 100644
>> index 0000000000..ac3db09937
>> --- /dev/null
>> +++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
>> @@ -0,0 +1,36 @@
>> +SUMMARY  =3D "A collection of tools, libraries and tests for shader co=
mpilation"
>> +DESCRIPTION =3D ""
>> +SECTION =3D "graphics"
>> +HOMEPAGE =3D "https://github.com/google/shaderc"
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968=
f4327"
>> +
>> +SRC_URI =3D "https://github.com/google/shaderc/archive/v${PV}.tar.gz \
>> +           file://0001-fix-glslang-link-order.patch \
>> +           file://0002-shaderc-2019.0-fix-build-against-new-glslang.pa=
tch \
>> +"
>> +SRC_URI[md5sum] =3D "8eb2b40712db2762a5cc40b568fd8ad9"
>> +SRC_URI[sha256sum] =3D "1018cd02be52295272fdbffa056ee24b881be277c83d03=
9ad554d91230f4e11b"
>> +
>> +inherit cmake python3native
>> +
>> +DEPENDS =3D "spirv-tools-native glslang-native"
>> +
>> +EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DReleas -DSHADERC_SKIP_TESTS=3D=
ON"
>> +
>> +do_configure_prepend() {
>> +    # de-vendor libs and disable git versioning
>> +    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
>> +    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt
>> +
>> +    # TODO: probably there is better solution for this.
>> +    # I dont know any method for get the version of a receipe dependen=
t
>> +    # so do this ugly hack
>> +    cat <<- EOF > ${S}/glslc/src/build-version.inc
>> +"${PV}\\n"
>> +"$(pkg-config --modversion SPIRV-Tools)\\n"
>> +"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
>> +EOF
>> +}
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.28.0
>>
>>
>>=20
>>


--=20
best regards,
Jos=C3=A9 Quaresma
