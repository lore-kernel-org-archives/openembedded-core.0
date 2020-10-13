Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web12.2963.1602615546349521998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 11:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YeThnRcK;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id l6so641584vsr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=16lh0hk9oSA8OCSdKyGep8X8JW536qxVGE283e79JjE=;
        b=YeThnRcK2O3StUJnf7xQd0Me12cmwCV7ErI84+5H60aUS8rzhPcSAuG4V3QADSZF+t
         VoDbSE2WrfXcGkXrYzL28qFIZtxCK4R+79pW2gkgPYNBO5TTVfWhNeAnCMN5CZa35qEn
         FGZ1CEvpdYpy0Wh+JTZhPjvCyz5538w5HtMRUHQJw1jl1s4M+6p4omSbSI0aBHJiRKzs
         oUHahAPdoi3ooanVYbK37py+ByY3dbsNQWHjmdfBSS3d4JgfbjtA7l7H9WA8Bwh81Nod
         xvNGTVYdJ0MZHItl8TvgaNxqw0/6zRAnqAVXJ06o3FRFXnr2zJp73ReC9Ge6RxM2KVfB
         YRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=16lh0hk9oSA8OCSdKyGep8X8JW536qxVGE283e79JjE=;
        b=S62I1ICstnZ/Em2bLYlrHNx/nHGUpnvmErvo7b8q+7b1VhZSnJy4v/xq3gurpIT1qu
         JX+znsrbep6FSXTKDXjxXlDah0vmVTqE84Bpe0Vc2WEwfAQeomXzaFuKCu7c+mg+eOce
         LM+mNmMFLMrlxA7F5tVUus7Y0Bjt6mXDKRKLABy39+QOtcrzYLuKdzZsr5jIIMFtXGrf
         s7NrM4NDk7xkhJJuakwxVjDs9a/9HFMhfclMGA/owJFWkEx0UNBRnhXi41vU6jqI+7uU
         dCsMooL9s+gMYs/iWx/iWZ9T9SAxBAKRVKb3fh8R2K0s6tKSaHQ1rM3ma0FnsIByTNiB
         uTLQ==
X-Gm-Message-State: AOAM532tAp02idhiv7O1YuAhEGpL+QEXpQGkiZ0r8ScqZ343281sC6GH
	N+uiqjagBPxlrkf2+nkAA/sGctcPbJHQNEM0i2s=
X-Google-Smtp-Source: ABdhPJyUrIAZiSHGH/raoUT/p0OBfpYgf6dySqQSS1vlI3HWxgPFWjabfPO9ShVc+Zc+/PqvHzE3ExyNIAsS3L2nnPw=
X-Received: by 2002:a67:f981:: with SMTP id b1mr1020844vsq.31.1602615545490;
 Tue, 13 Oct 2020 11:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com> <20201013173502.2245733-5-quaresma.jose@gmail.com>
In-Reply-To: <20201013173502.2245733-5-quaresma.jose@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2020 20:58:54 +0200
Message-ID: <CANNYZj_TQp2yCR16dQhArYtgViUnSFi=+Dwb4MayXomTL79xKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] shaderc: add receipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004cef4005b1920217"

--0000000000004cef4005b1920217
Content-Type: text/plain; charset="UTF-8"

Same here: please build from git://

Alex

On Tue, 13 Oct 2020 at 19:35, Jose Quaresma <quaresma.jose@gmail.com> wrote:

> A collection of tools, libraries and tests for shader compilation
>
> This receipe is needed to build the gstreamer vulkan plugin
> as it provides the binary glslc.
>
> It is based on arch linux shaderc packge including the patches
>
> https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a220264a448527c1a8cf037caaad8e/trunk/PKGBUILD
>
>     * 0001-fix-glslang-link-order.patch
>       Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e67]
>
>     * 0002-shaderc-2019.0-fix-build-against-new-glslang.patch
>       Upstream-Status: Pending
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../files/0001-fix-glslang-link-order.patch   | 44 +++++++++++++++
>  ...2019.0-fix-build-against-new-glslang.patch | 54 +++++++++++++++++++
>  .../shaderc/shaderc_2019.0.bb                 | 36 +++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644
> meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
>  create mode 100644
> meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
>  create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb
>
> diff --git
> a/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
> b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
> new file mode 100644
> index 0000000000..a404c85839
> --- /dev/null
> +++ b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
> @@ -0,0 +1,44 @@
> +From 21c8be385b3fab5edcb934a6d99f69fd389c4e67 Mon Sep 17 00:00:00 2001
> +From: Niklas Haas <git@haasn.xyz>
> +Date: Tue, 29 May 2018 07:34:00 +0200
> +Subject: [PATCH] Fix the link order of libglslang and libHLSL
> +
> +libglslang depends on libHLSL, so the latter needs to be specified last.
> +This fixes an issue when trying to build shaderc against system-wide
> +versions of libglslang/libHLSL, rather than the in-tree versions from
> +third_party.
> +
> +Additionally, libshaderc_util also depends on SPIRV-Tools
> +---
> + glslc/CMakeLists.txt           | 2 +-
> + libshaderc_util/CMakeLists.txt | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
> +index acf6fb0b..0f5d8886 100644
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
> +diff --git a/libshaderc_util/CMakeLists.txt
> b/libshaderc_util/CMakeLists.txt
> +index 873540ab..6d0c465c 100644
> +--- a/libshaderc_util/CMakeLists.txt
> ++++ b/libshaderc_util/CMakeLists.txt
> +@@ -34,8 +34,8 @@ endif(SHADERC_ENABLE_INSTALL)
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
> diff --git
> a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
> b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
> new file mode 100644
> index 0000000000..807540cf62
> --- /dev/null
> +++
> b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
> @@ -0,0 +1,54 @@
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
> +diff --git a/libshaderc_util/src/compiler.cc
> b/libshaderc_util/src/compiler.cc
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
> +@@ -291,17 +291,12 @@ std::tuple<bool, std::vector<uint32_t>, size_t>
> Compiler::Compile(
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
> +   const EShMessages rules = GetMessageRules(target_env_,
> source_language_,
> +                                             hlsl_offsets_,
> +                                             generate_debug_info_);
> +@@ -478,9 +473,6 @@ std::tuple<bool, std::string, std::string>
> Compiler::PreprocessShader(
> +   }
> +   shader.setEnvClient(target_client_info.client,
> +                       target_client_info.client_version);
> +-  if (hlsl_functionality1_enabled_) {
> +-    shader.setEnvTargetHlslFunctionality1();
> +-  }
> +
> +   // The preprocessor might be sensitive to the target environment.
> +   // So combine the existing rules with the
> just-give-me-preprocessor-output
> diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> new file mode 100644
> index 0000000000..ac3db09937
> --- /dev/null
> +++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> @@ -0,0 +1,36 @@
> +SUMMARY  = "A collection of tools, libraries and tests for shader
> compilation"
> +DESCRIPTION = ""
> +SECTION = "graphics"
> +HOMEPAGE = "https://github.com/google/shaderc"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI = "https://github.com/google/shaderc/archive/v${PV}.tar.gz \
> +           file://0001-fix-glslang-link-order.patch \
> +           file://0002-shaderc-2019.0-fix-build-against-new-glslang.patch
> \
> +"
> +SRC_URI[md5sum] = "8eb2b40712db2762a5cc40b568fd8ad9"
> +SRC_URI[sha256sum] =
> "1018cd02be52295272fdbffa056ee24b881be277c83d039ad554d91230f4e11b"
> +
> +inherit cmake python3native
> +
> +DEPENDS = "spirv-tools-native glslang-native"
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Releas -DSHADERC_SKIP_TESTS=ON"
> +
> +do_configure_prepend() {
> +    # de-vendor libs and disable git versioning
> +    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
> +    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt
> +
> +    # TODO: probably there is better solution for this.
> +    # I dont know any method for get the version of a receipe dependent
> +    # so do this ugly hack
> +    cat <<- EOF > ${S}/glslc/src/build-version.inc
> +"${PV}\\n"
> +"$(pkg-config --modversion SPIRV-Tools)\\n"
> +"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
> +EOF
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.28.0
>
>
> 
>
>

--0000000000004cef4005b1920217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Same here: please build from git://</div><div><br></d=
iv><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, 13 Oct 2020 at 19:35, Jose Quaresma &lt;<a hr=
ef=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A collection o=
f tools, libraries and tests for shader compilation<br>
<br>
This receipe is needed to build the gstreamer vulkan plugin<br>
as it provides the binary glslc.<br>
<br>
It is based on arch linux shaderc packge including the patches<br>
<a href=3D"https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a=
220264a448527c1a8cf037caaad8e/trunk/PKGBUILD" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a2202=
64a448527c1a8cf037caaad8e/trunk/PKGBUILD</a><br>
<br>
=C2=A0 =C2=A0 * 0001-fix-glslang-link-order.patch<br>
=C2=A0 =C2=A0 =C2=A0 Upstream-Status: Backport [21c8be385b3fab5edcb934a6d9=
9f69fd389c4e67]<br>
<br>
=C2=A0 =C2=A0 * 0002-shaderc-2019.0-fix-build-against-new-glslang.patch<br=
>
=C2=A0 =C2=A0 =C2=A0 Upstream-Status: Pending<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com=
" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../files/0001-fix-glslang-link-order.patch=C2=A0 =C2=A0| 44 +++++++=
++++++++<br>
=C2=A0...2019.0-fix-build-against-new-glslang.patch | 54 +++++++++++++++++=
++<br>
=C2=A0.../shaderc/<a href=3D"http://shaderc_2019.0.bb" rel=3D"noreferrer" =
target=3D"_blank">shaderc_2019.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 +++++++++++++<br>
=C2=A03 files changed, 134 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/shaderc/files/0001-fix-glsl=
ang-link-order.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-=
2019.0-fix-build-against-new-glslang.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/shaderc/<a href=3D"http://s=
haderc_2019.0.bb" rel=3D"noreferrer" target=3D"_blank">shaderc_2019.0.bb</a=
><br>
<br>
diff --git a/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-ord=
er.patch b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.=
patch<br>
new file mode 100644<br>
index 0000000000..a404c85839<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patc=
h<br>
@@ -0,0 +1,44 @@<br>
+From 21c8be385b3fab5edcb934a6d99f69fd389c4e67 Mon Sep 17 00:00:00 2001<br=
>
+From: Niklas Haas &lt;<a href=3D"mailto:git@haasn.xyz" target=3D"_blank">=
git@haasn.xyz</a>&gt;<br>
+Date: Tue, 29 May 2018 07:34:00 +0200<br>
+Subject: [PATCH] Fix the link order of libglslang and libHLSL<br>
+<br>
+libglslang depends on libHLSL, so the latter needs to be specified last.<=
br>
+This fixes an issue when trying to build shaderc against system-wide<br>
+versions of libglslang/libHLSL, rather than the in-tree versions from<br>
+third_party.<br>
+<br>
+Additionally, libshaderc_util also depends on SPIRV-Tools<br>
+---<br>
+ glslc/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ libshaderc_util/CMakeLists.txt | 4 ++--<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt<br>
+index acf6fb0b..0f5d8886 100644<br>
+--- a/glslc/CMakeLists.txt<br>
++++ b/glslc/CMakeLists.txt<br>
+@@ -18,7 +18,7 @@ add_library(glslc STATIC<br>
+ shaderc_default_compile_options(glslc)<br>
+ target_include_directories(glslc PUBLIC ${glslang_SOURCE_DIR})<br>
+ target_link_libraries(glslc PRIVATE glslang OSDependent OGLCompiler<br>
+-=C2=A0 HLSL glslang SPIRV ${CMAKE_THREAD_LIBS_INIT})<br>
++=C2=A0 glslang SPIRV HLSL ${CMAKE_THREAD_LIBS_INIT})<br>
+ target_link_libraries(glslc PRIVATE shaderc_util shaderc)<br>
+ <br>
+ add_executable(glslc_exe src/main.cc)<br>
+diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.=
txt<br>
+index 873540ab..6d0c465c 100644<br>
+--- a/libshaderc_util/CMakeLists.txt<br>
++++ b/libshaderc_util/CMakeLists.txt<br>
+@@ -34,8 +34,8 @@ endif(SHADERC_ENABLE_INSTALL)<br>
+ <br>
+ find_package(Threads)<br>
+ target_link_libraries(shaderc_util PRIVATE<br>
+-=C2=A0 glslang OSDependent OGLCompiler HLSL glslang SPIRV<br>
+-=C2=A0 SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})<br>
++=C2=A0 glslang OSDependent OGLCompiler glslang HLSL SPIRV<br>
++=C2=A0 SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})<br>
+ <br>
+ shaderc_add_tests(<br>
+=C2=A0 =C2=A0TEST_PREFIX shaderc_util<br>
diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-b=
uild-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/0002-s=
haderc-2019.0-fix-build-against-new-glslang.patch<br>
new file mode 100644<br>
index 0000000000..807540cf62<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-ag=
ainst-new-glslang.patch<br>
@@ -0,0 +1,54 @@<br>
+diff --git a/libshaderc/src/shaderc.cc b/libshaderc/src/shaderc.cc<br>
+index 3c3c3de..b5fc6cb 100644<br>
+--- a/libshaderc/src/shaderc.cc<br>
++++ b/libshaderc/src/shaderc.cc<br>
+@@ -20,7 +20,7 @@<br>
+ #include &lt;sstream&gt;<br>
+ #include &lt;vector&gt;<br>
+ <br>
+-#include &quot;SPIRV/spirv.hpp&quot;<br>
++#include &quot;glslang/SPIRV/spirv.hpp&quot;<br>
+ <br>
+ #include &quot;libshaderc_util/compiler.h&quot;<br>
+ #include &quot;libshaderc_util/counting_includer.h&quot;<br>
+diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compil=
er.cc<br>
+index ef7867f..acc172b 100644<br>
+--- a/libshaderc_util/src/compiler.cc<br>
++++ b/libshaderc_util/src/compiler.cc<br>
+@@ -26,7 +26,7 @@<br>
+ #include &quot;libshaderc_util/string_piece.h&quot;<br>
+ #include &quot;libshaderc_util/version_profile.h&quot;<br>
+ <br>
+-#include &quot;SPIRV/GlslangToSpv.h&quot;<br>
++#include &quot;glslang/SPIRV/GlslangToSpv.h&quot;<br>
+ <br>
+ namespace {<br>
+ using shaderc_util::string_piece;<br>
+@@ -291,17 +291,12 @@ std::tuple&lt;bool, std::vector&lt;uint32_t&gt;, si=
ze_t&gt; Compiler::Compile(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bases[static_cast&lt;int&gt;(UniformKind::Stor=
ageBuffer)]);<br>
+=C2=A0 =C2=A0shader.setShiftUavBinding(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bases[static_cast&lt;int&gt;(UniformKind::Unor=
deredAccessView)]);<br>
+-=C2=A0 shader.setHlslIoMapping(hlsl_iomap_);<br>
+=C2=A0 =C2=A0shader.setResourceSetBinding(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hlsl_explicit_bindings_[static_cast&lt;int&gt;=
(used_shader_stage)]);<br>
+=C2=A0 =C2=A0shader.setEnvClient(target_client_info.client,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0target_client_info.client_version);<br>
+=C2=A0 =C2=A0shader.setEnvTarget(target_client_info.target_language,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0target_client_info.target_language_version);<br>
+-=C2=A0 if (hlsl_functionality1_enabled_) {<br>
+-=C2=A0 =C2=A0 shader.setEnvTargetHlslFunctionality1();<br>
+-=C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0const EShMessages rules =3D GetMessageRules(target_env_, sou=
rce_language_,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0hlsl_offsets_,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0generate_debug_info_);<br>
+@@ -478,9 +473,6 @@ std::tuple&lt;bool, std::string, std::string&gt; Comp=
iler::PreprocessShader(<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0shader.setEnvClient(target_client_info.client,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0target_client_info.client_version);<br>
+-=C2=A0 if (hlsl_functionality1_enabled_) {<br>
+-=C2=A0 =C2=A0 shader.setEnvTargetHlslFunctionality1();<br>
+-=C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0// The preprocessor might be sensitive to the target environ=
ment.<br>
+=C2=A0 =C2=A0// So combine the existing rules with the just-give-me-prepr=
ocessor-output<br>
diff --git a/meta/recipes-graphics/shaderc/<a href=3D"http://shaderc_2019.=
0.bb" rel=3D"noreferrer" target=3D"_blank">shaderc_2019.0.bb</a> b/meta/rec=
ipes-graphics/shaderc/<a href=3D"http://shaderc_2019.0.bb" rel=3D"noreferre=
r" target=3D"_blank">shaderc_2019.0.bb</a><br>
new file mode 100644<br>
index 0000000000..ac3db09937<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/shaderc/<a href=3D"http://shaderc_2019.0.bb" r=
el=3D"noreferrer" target=3D"_blank">shaderc_2019.0.bb</a><br>
@@ -0,0 +1,36 @@<br>
+SUMMARY=C2=A0 =3D &quot;A collection of tools, libraries and tests for sh=
ader compilation&quot;<br>
+DESCRIPTION =3D &quot;&quot;<br>
+SECTION =3D &quot;graphics&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/google/shaderc" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/google/shaderc</a>&quot;<br=
>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D86d3f3a95c324c9479bd89869=
68f4327&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/shaderc/archive/v$=
%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/go=
ogle/shaderc/archive/v${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-glslang-link-ord=
er.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-shaderc-2019.0-fix-b=
uild-against-new-glslang.patch \<br>
+&quot;<br>
+SRC_URI[md5sum] =3D &quot;8eb2b40712db2762a5cc40b568fd8ad9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1018cd02be52295272fdbffa056ee24b881be277c83d=
039ad554d91230f4e11b&quot;<br>
+<br>
+inherit cmake python3native<br>
+<br>
+DEPENDS =3D &quot;spirv-tools-native glslang-native&quot;<br>
+<br>
+EXTRA_OECMAKE =3D &quot;-DCMAKE_BUILD_TYPE=3DReleas -DSHADERC_SKIP_TESTS=
=3DON&quot;<br>
+<br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 # de-vendor libs and disable git versioning<br>
+=C2=A0 =C2=A0 sed &#39;/examples/d;/third_party/d&#39; -i ${S}/CMakeLists=
.txt<br>
+=C2=A0 =C2=A0 sed &#39;/build-version/d&#39; -i ${S}/glslc/CMakeLists.txt=
<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 # TODO: probably there is better solution for this.<br>
+=C2=A0 =C2=A0 # I dont know any method for get the version of a receipe d=
ependent<br>
+=C2=A0 =C2=A0 # so do this ugly hack<br>
+=C2=A0 =C2=A0 cat &lt;&lt;- EOF &gt; ${S}/glslc/src/build-version.inc<br>
+&quot;${PV}\\n&quot;<br>
+&quot;$(pkg-config --modversion SPIRV-Tools)\\n&quot;<br>
+&quot;$(glslangValidator --version | head -1 | cut -d&#39; &#39; -f3)\\n&=
quot;<br>
+EOF<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004cef4005b1920217--
