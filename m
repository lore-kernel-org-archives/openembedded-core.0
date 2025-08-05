Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14201C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:15:47 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.7685.1754421338254994790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4v9qc49;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71b691a40a8so47630047b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421337; x=1755026137; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX+wY1ZlhUmHs1SwWs74P+OkUWTWC1FW2mS5aM7NGa0=;
        b=d4v9qc49MWshcvuzglg9t49OG1AyPP4igAmuVUf1Yfjeqhz0BEpOk0hjmWLbBBUKcY
         yZZCi1sSdPbbL+sfz7yM40GbEYsJL82Tx89Yywodba0Xj57dlRjq8eFPnBQjrPL2KY6h
         dfsMebKRuL3vbWYvv/sNtsWmQnZOzkuld2uCawQPfWeqwhmNt8esVepofLXdLX+APD6k
         LNAwfmMETj2aGGL9AUMw3tJu0DnSRdMjvyF0xj3oMkRlDCtiV8YTYcMYtzj811JTTih6
         N3qn9MgpkkW/2qDT9G93wBdU9JlhSrgS567sf5RZRSPzHs9w4vog88K/Ry9DyO//R9P5
         uDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421337; x=1755026137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dX+wY1ZlhUmHs1SwWs74P+OkUWTWC1FW2mS5aM7NGa0=;
        b=QVmg0Z+rsw1ZzrKu1mmQyzUM81ZeCesAr38zd/SMsB8Mk51BSArzSBCcHDiMCYSfti
         zGpgGCHQ35zYb9c4T0HIv/nhNEC4gz5ywK6XJ1DHE4BANrTyCadIYslhH3pkOURf/zMD
         bDJhVdUmRnjM3Vc0TESrLbxXOpAWiFulLnK56LK47gvuQNYBoVRh03NeR+3xWoylaZxn
         Ee4AQxp7pK/wdyuoIBiAS3N0t0bw6aw+L3N3nZEI5NGbFQPFqBuOL8/aknnz4IiuzgXU
         uJRmoBHKgZoKOmolPMfL5TxcHcyp9InKnT5dS8Yz8fY9GUTNdmbLLGKTj91eJTFWfdEk
         20NA==
X-Gm-Message-State: AOJu0Yy2/z1ajD7xUf0NEAx5HJ/v727yZOWWiCVLzwgp8hEmVlfK3UM0
	xJwKuqVozIZgMFzL0o0rvS6xB7G6PtKlNPY6sH11de8dJzxFSn67t7wopYw2DEf5YoFW/jTMRHz
	V8C3DjxYut7HYjRuAbM256Ic6gwiaFnw=
X-Gm-Gg: ASbGncsMmH3c7EwzSaCxBBr2Q5I8SKW81EPji2h1leDPVZ6f1Q5y3RR8eL+WRvp4ZoY
	m7YK+jTBx39bj1f/zWgxc6GTYlsmSW5NXdTHQnh+Og2ghEwaMv+Qd71+4uUz31vKmJYVRDDwW0e
	g5o8ECX1+tLvUkivYm3Lh1W6Ij6F4kSOjv+xuKo8DSzY1Uc1+1m/BVzYSak/u28FgRRdgkPyOe+
	tiCc08JXRPho2QzwZjI7VXP7IYpo103wR03b0RdC9R2fg==
X-Google-Smtp-Source: AGHT+IHXewCUKrvwb3BugePghTk8F6DdwZEXGWEauYQwElmxUmOzrsmNMhIRjtJhQZo3SsDgjVt8BHxoK6u8K+R1YZo=
X-Received: by 2002:a05:690c:968f:b0:71a:1f26:5d1b with SMTP id
 00721157ae682-71bc981e6d5mr6025017b3.22.1754421337015; Tue, 05 Aug 2025
 12:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250805191115.608912-1-ross.burton@arm.com>
In-Reply-To: <20250805191115.608912-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Aug 2025 12:15:10 -0700
X-Gm-Features: Ac12FXwBLoiLNbB7afRnC6ZDWSQlgZDPgT-A4xBqVeFIGcGmw28GQS_v3oZsJS4
Message-ID: <CAMKF1sok7LjqPQGu8ekCmaH+Yr7AbK2i2s2yn23n=urBUDDaBg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] clang: split llvm out into a separate
 recipe again
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221487

On Tue, Aug 5, 2025 at 12:11=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> There are plenty of cases where you want libLLVM on the target but don't
> need to build clang at all, or only natively. Unfortunately, clang is
> very slow to build as it's so large.
>
> This patch splits clang and llvm back into separate recipes again, so
> we can only build the pieces that are needed.
>
> Some caveats:
> - The list of PACKAGECONFIGs might need revising and there's not great
>   separation of concerns in the llvm CMake scripts
> - llvm-config no longer gets a versioned symlink. There was no way for
>   this to be actually useful with multiple versions of llvm in parallel
>   without further work, so I've removed it.
> - clang-tools-extras are no longer built. If any of these tools are
>   needed then we should be able to bring them back.

We do assume clang-tidy and clangd as part of clang package which come from
clang-tools-extra, I think it should be kept building either part of
clang recipe or a
separate recipe I am fine either way.

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc |   1 +
>  meta/recipes-devtools/clang/clang_git.bb | 152 +++--------------------
>  meta/recipes-devtools/clang/llvm_git.bb  | 114 +++++++++++++++++
>  3 files changed, 129 insertions(+), 138 deletions(-)
>  create mode 100644 meta/recipes-devtools/clang/llvm_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 96d5a0819c8..588565cdc08 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -482,6 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfie=
ld <bruce.ashfield@gmail.com>
>  RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-project-source-20.1.8 =3D "Khem Raj <raj.khem@=
gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index 0009a95628d..cd59bc9b393 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -28,72 +28,31 @@ LDFLAGS:append:class-target:mips =3D " -Wl,--no-as-ne=
eded -latomic -Wl,--as-needed
>
>  inherit cmake pkgconfig multilib_header python3-dir
>
> -PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs lib=
clang-python \
> -                              ${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-lld', 'lld', '', d)} \
> -                              ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
> -                              "
> -
> -PACKAGECONFIG ??=3D "${PACKAGECONFIG_CLANG_COMMON} \
> +PACKAGECONFIG ??=3D "build-id libedit shared-libs libclang-python \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto',=
 d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', =
'lld', '', d)} \
> +                   ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compi=
ler-rt libcplusplus libomp unwindlib', '', d)} \
>                     "
> -PACKAGECONFIG:class-native =3D "clangd \
> -                              ${PACKAGECONFIG_CLANG_COMMON} \
> -                              "
> -PACKAGECONFIG:class-nativesdk =3D "clangd \
> -                                 ${PACKAGECONFIG_CLANG_COMMON} \
> -                                 ${@bb.utils.filter('DISTRO_FEATURES', '=
lto thin-lto', d)} \
> -                                 "
>
>  PACKAGECONFIG[build-id] =3D "-DENABLE_LINKER_BUILD_ID=3DON,-DENABLE_LINK=
ER_BUILD_ID=3DOFF,,"
> -PACKAGECONFIG[clangd] =3D "-DCLANG_ENABLE_CLANGD=3DON,-DCLANG_ENABLE_CLA=
NGD=3DOFF,,"
> -
> -# Activate to build the dexp tool in clangd
> -# Disabled by default for -native since it is known to trigger compiler =
failure on Debian 11
> -# See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15803
> -PACKAGECONFIG[clangd-dexp] =3D "-DCLANGD_BUILD_DEXP=3DON,-DCLANGD_BUILD_=
DEXP=3DOFF,,"
> -
>  PACKAGECONFIG[compiler-rt] =3D "-DCLANG_DEFAULT_RTLIB=3Dcompiler-rt,,"
> -PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF,,"
>  PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
>  PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit libedit-native"
>  PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
>  PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,,"
>  PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=
=3D${STAGING_INCDIR},,binutils,"
> -PACKAGECONFIG[opt-viewer] =3D "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLV=
M_HAVE_OPT_VIEWER_MODULES=3DOFF, \
> -                             python3-pyyaml-native python3-pygments-nati=
ve python3-pyyaml python3-pygments, \
> -                             python3-pyyaml python3-pygments,"
>  PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=
=3DOFF,libpfm,"
> -PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
>  PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK=
_LLVM_DYLIB=3DON,,,"
> -PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_S=
PLIT_DWARF=3DOFF,,"
>  PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_IN=
CDIR=3D${STAGING_INCDIR},,binutils,"
>  PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-DCL=
ANG_DEFAULT_UNWINDLIB=3Dlibgcc,,"
>  PACKAGECONFIG[libclang-python] =3D "-DCLANG_PYTHON_BINDINGS_VERSIONS=3D$=
{PYTHON_BASEVERSION},,"
>
> -OECMAKE_SOURCEPATH =3D "${S}/llvm"
> -
> -# By default we build all the supported CPU architectures, and the GPU t=
argets
> -# if the opengl or vulkan DISTRO_FEATURES are enabled.
> -#
> -# For target builds we default to building that specific architecture, B=
PF, and the GPU targets if required.
> -#
> -# The available target list can be seen in the source code
> -# in the LLVM_ALL_TARGETS assignment:
> -# https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
> -LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
gl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
> -LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;Loong=
Arch;${LLVM_TARGETS_GPU}"
> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
BPF;${LLVM_TARGETS_GPU}"
> -
> -LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
> +OECMAKE_SOURCEPATH =3D "${S}/clang"
>
>  HF =3D ""
>  HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard',=
 'hf', '', d)}"
>  HF[vardepvalue] =3D "${HF}"
>
> -# Ensure that LLVM_PROJECTS does not contain compiler runtime components=
 e.g. libcxx etc
> -# they are enabled via LLVM_ENABLE_RUNTIMES
> -LLVM_PROJECTS ?=3D "clang;clang-tools-extra"
> -
>  # linux hosts (.so) on Windows .pyd
>  SOLIBSDEV:mingw32 =3D ".pyd"
>
> @@ -101,25 +60,18 @@ SOLIBSDEV:mingw32 =3D ".pyd"
>
>  EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>                    -DLLVM_APPEND_VC_REV=3DOFF \
> -                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
>                    -DLLVM_ENABLE_EXPENSIVE_CHECKS=3DOFF \
>                    -DLLVM_ENABLE_PIC=3DON \
>                    -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
> -                  -DLLVM_BINDINGS_LIST=3D'' \
> -                  -DLLVM_ENABLE_FFI=3DON \
>                    -DLLVM_ENABLE_ZSTD=3DON \
>                    -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
>                    -DLLVM_BUILD_EXTERNAL_COMPILER_RT=3DON \
>                    -DCMAKE_SYSTEM_NAME=3DLinux \
>                    -DCMAKE_BUILD_TYPE=3DRelease \
>                    -DLLVM_ENABLE_PROJECTS=3D'${LLVM_PROJECTS}' \
> -                  -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
>                    -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
> -                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
> -                  -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
> -                  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
> -                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
> -                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
> +                  -DLLVM_CMAKE_DIR=3D${STAGING_LIBDIR}/cmake/llvm \
> +                  -DLLVM_INCLUDE_TESTS=3DOFF \
>  "
>
>  EXTRA_OECMAKE:append:class-nativesdk =3D "\
> @@ -130,6 +82,9 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
>                    -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-strip \
>  "
>  EXTRA_OECMAKE:append:class-target =3D "\
> +                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
> +                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
> +                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
>                    -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
>                    -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
>                    -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
> @@ -140,31 +95,13 @@ EXTRA_OECMAKE:append:class-target =3D "\
>                    -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>  "
>
> -DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native llvm-tblge=
n-native"
> +DEPENDS =3D "llvm-tblgen-native llvm binutils zlib zstd libffi libxml2 l=
ibxml2-native"
>  DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/n=
ativesdk-cross-binutils"
>  DEPENDS:append:class-target =3D " ${MLPREFIX}clang-cross-${TARGET_ARCH} =
${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)=
}"
>
>  RDEPENDS:${PN}:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'ld-is-lld', ' lld', '', d)}"
>  RRECOMMENDS:${PN}:append:class-target =3D "binutils ${@bb.utils.contains=
('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
>
> -# patch out build host paths for reproducibility
> -reproducible_build_variables() {
> -    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
> -        -e "s,--sysroot=3D${RECIPE_SYSROOT},,g" \
> -        -e "s,${STAGING_DIR_HOST},,g" \
> -        -e "s,${S}/llvm,,g"  \
> -        -e "s,${B},,g" \
> -        ${B}/tools/llvm-config/BuildVariables.inc
> -}
> -
> -do_configure:append:class-target() {
> -    reproducible_build_variables
> -}
> -
> -do_configure:append:class-nativesdk() {
> -    reproducible_build_variables
> -}
> -
>  do_install:append() {
>      for t in clang-pseudo clang-pseudo-gen clang-rename; do
>          if [ -e ${B}${BINPATHPREFIX}/bin/$t ]; then
> @@ -172,22 +109,10 @@ do_install:append() {
>          fi
>      done
>
> -    oe_multilib_header llvm/Config/llvm-config.h
>      oe_multilib_header clang/Config/config.h
>  }
>
>  do_install:append:class-target () {
> -    # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
> -    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdi=
r}/cmake/llvm/LLVMExports-release.cmake
> -
> -    # Insert function to populate Import Variables
> -    sed -i "4i\
> -if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\
> -  execute_process(COMMAND \"llvm-config\" \"--bindir\" OUTPUT_VARIABLE _=
IMPORT_PREFIX_BIN OUTPUT_STRIP_TRAILING_WHITESPACE)\n\
> -else()\n\
> -  set(_IMPORT_PREFIX_BIN \"\${_IMPORT_PREFIX}/bin\")\n\
> -endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
> -
>      if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
>          mkdir -p ${D}${nonarch_libdir}
>          mv ${D}${libdir}/clang ${D}${nonarch_libdir}/clang
> @@ -198,25 +123,10 @@ endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-rel=
ease.cmake
>          llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov; do
>          ln -sf $t ${D}${bindir}/${TARGET_PREFIX}$t
>      done
> -
> -    # reproducibility
> -    sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
>  }
>
>  do_install:append:class-native () {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
> -        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
> -    fi
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> -
> -    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> -        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> -        echo "stripped $f"
> -    done
>      ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
> -
> -    # These are provided by llvm-tblgen-native
> -    rm ${D}${bindir}/*-tblgen
>  }
>
>  do_install:append:class-nativesdk () {
> @@ -226,16 +136,8 @@ do_install:append:class-nativesdk () {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
>          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
>      fi
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}=
/clang-tblgen
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> -    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
> -        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> -    done
> +
>      ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
> -    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
> -    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
> -    rm -rf ${D}${datadir}/llvm/cmake
> -    rm -rf ${D}${datadir}/llvm
>
>      #reproducibility
>      if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
> @@ -243,12 +145,7 @@ do_install:append:class-nativesdk () {
>      fi
>  }
>
> -PROVIDES:append:class-native =3D " llvm-native"
> -PROVIDES:append:class-target =3D " llvm"
> -PROVIDES:append:class-nativesdk =3D " nativesdk-llvm"
> -
> -PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools \
> -             libclang llvm-linker-tools"
> +PACKAGES =3D+ "${PN}-libclang-python ${PN}-libclang-cpp ${PN}-format ${P=
N}-tools libclang"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> @@ -264,15 +161,10 @@ RDEPENDS:${PN}-tools +=3D "\
>    perl-module-term-ansicolor \
>  "
>
> -RRECOMMENDS:${PN}-tidy +=3D "${PN}-tools"
> -
> -FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${libdir}/libLTO.so.* $=
{libdir}/LLVMPolly*"
> -
>  FILES:${PN}-libclang-cpp =3D "${libdir}/libclang-cpp.so.*"
>
>  FILES:${PN}-libclang-python =3D "${PYTHON_SITEPACKAGES_DIR}/clang/*"
>
> -FILES:${PN}-tidy =3D "${bindir}/*clang-tidy*"
>  FILES:${PN}-format =3D "${bindir}/*clang-format*"
>
>  FILES:${PN}-tools =3D "${bindir}/analyze-build \
> @@ -317,7 +209,6 @@ FILES:${PN}-tools =3D "${bindir}/analyze-build \
>    ${libexecdir}/intercept-cc \
>    ${datadir}/scan-build/* \
>    ${datadir}/scan-view/* \
> -  ${datadir}/opt-viewer/* \
>    ${datadir}/clang/* \
>  "
>
> @@ -330,12 +221,6 @@ FILES:${PN} +=3D "\
>    ${nonarch_libdir}/${BPN}/*/include/ \
>  "
>
> -FILES:${PN}-libllvm =3D+ "\
> -  ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
> -  ${libdir}/libLLVM-${MAJOR_VER}.so \
> -  ${libdir}/libRemarks.so.* \
> -"
> -
>  FILES:libclang =3D "\
>    ${libdir}/libclang.so.* \
>  "
> @@ -356,7 +241,6 @@ FILES:${PN}:remove =3D "${libdir}/${BPN}/*"
>
>  INSANE_SKIP:${PN} +=3D "already-stripped"
>  #INSANE_SKIP:${PN}-dev +=3D "dev-elf"
> -INSANE_SKIP:${PN}-libllvm =3D "dev-so"
>
>  #Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
>  SSTATE_SCAN_FILES:remove =3D "*-config"
> @@ -370,19 +254,11 @@ SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " =
clang_sysroot_preprocess"
>  SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " clang_sysroot_prep=
rocess"
>
>  clang_sysroot_preprocess() {
> -       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> -       install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT=
_DESTDIR}${bindir_crossscripts}/
> -       ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-=
config${PV}
> +       install -d ${SYSROOT_DESTDIR}${bindir}/
>
>         binaries=3D"diagtool clang-${MAJOR_VER} clang-format clang-offloa=
d-packager
>                         clang-offload-bundler clang-scan-deps clang-repl
> -                       clang-refactor clang-check clang-extdef-mapping c=
lang-apply-replacements
> -                       clang-reorder-fields clang-tidy clang-change-name=
space clang-doc clang-include-fixer
> -                       find-all-symbols clang-move clang-query pp-trace =
modularize"
> -
> -       if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false=
', d)}; then
> -               binaries=3D"${binaries} clangd"
> -       fi
> +                       clang-refactor clang-check clang-extdef-mapping"
>
>         for f in ${binaries}
>         do
> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devto=
ols/clang/llvm_git.bb
> new file mode 100644
> index 00000000000..8316adc4d02
> --- /dev/null
> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> @@ -0,0 +1,114 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "The LLVM Compiler Infrastructure"
> +HOMEPAGE =3D "http://llvm.org"
> +LICENSE =3D "Apache-2.0-with-LLVM-exception"
> +SECTION =3D "devel"
> +
> +require common-clang.inc
> +require common-source.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
> +
> +DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd"
> +
> +inherit cmake pkgconfig lib_package
> +
> +OECMAKE_SOURCEPATH =3D "${S}/llvm"
> +
> +# By default we build all the supported CPU architectures, and the GPU t=
argets
> +# if the opengl or vulkan DISTRO_FEATURES are enabled.
> +#
> +# For target builds we default to building that specific architecture, B=
PF, and the GPU targets if required.
> +#
> +# The available target list can be seen in the source code
> +# in the LLVM_ALL_TARGETS assignment:
> +# https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
> +LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
gl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
> +LLVM_TARGETS ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LL=
VM_TARGETS_GPU}"
> +LLVM_TARGETS:class-target ?=3D "${@get_clang_host_arch(bb, d)};BPF;${LLV=
M_TARGETS_GPU}"
> +
> +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> +ARM_INSTRUCTION_SET:armv4t =3D "arm"
> +
> +EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelease \
> +                  -DLLVM_ENABLE_ASSERTIONS=3DOFF \
> +                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=3DOFF \
> +                  -DLLVM_ENABLE_PIC=3DON \
> +                  -DLLVM_BINDINGS_LIST=3D'' \
> +                  -DLLVM_BUILD_LLVM_DYLIB=3DON \
> +                  -DLLVM_LINK_LLVM_DYLIB=3DON \
> +                  -DLLVM_ENABLE_FFI=3DON \
> +                  -DLLVM_ENABLE_RTTI=3DON \
> +                  -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS}' \
> +                  -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
> +                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
> +                  -DLLVM_INCLUDE_TESTS=3DOFF \
> +                  -DLLVM_INCLUDE_EXAMPLES=3DOFF \
> +                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DOFF \
> +                  -DLLVM_TOOL_OBJ2YAML_BUILD=3DOFF \
> +                  -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
> +                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
> +                 "
> +
> +EXTRA_OECMAKE:append:class-target =3D "\
> +                  -DLLVM_HOST_TRIPLE=3D${TARGET_SYS} \
> +                  -DLLVM_CONFIG_PATH=3D${STAGING_BINDIR_NATIVE}/llvm-con=
fig \
> +                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
> +                 "
> +
> +EXTRA_OECMAKE:append:class-nativesdk =3D "\
> +                  -DLLVM_HOST_TRIPLE=3D${SDK_SYS} \
> +                  -DLLVM_CONFIG_PATH=3D${STAGING_BINDIR_NATIVE}/llvm-con=
fig \
> +                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
> +                 "
> +
> +PACKAGECONFIG ??=3D "eh rtti"
> +PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF"
> +PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F"
> +PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_S=
PLIT_DWARF=3DOFF"
> +PACKAGECONFIG[opt-viewer] =3D "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLV=
M_HAVE_OPT_VIEWER_MODULES=3DOFF, \
> +                             python3-pyyaml-native python3-pygments-nati=
ve python3-pyyaml python3-pygments, \
> +                             python3-pyyaml python3-pygments"
> +
> +reproducible_build_variables() {
> +    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
> +        -e "s,--sysroot=3D${RECIPE_SYSROOT},,g" \
> +        -e "s,${STAGING_DIR_HOST},,g" \
> +        -e "s,${S}/llvm,,g"  \
> +        -e "s,${B},,g" \
> +        ${B}/tools/llvm-config/BuildVariables.inc
> +}
> +
> +do_configure:append:class-target() {
> +    reproducible_build_variables
> +}
> +do_configure:append:class-nativesdk() {
> +    reproducible_build_variables
> +}
> +
> +do_install:append() {
> +    # llvm harcodes usr/lib as install path, so this corrects it to actu=
al libdir
> +    mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
> +
> +    # reproducibility
> +    sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cma=
ke
> +}
> +
> +do_install:append:class-native() {
> +    # These are provided by llvm-tblgen-native
> +    rm ${D}${bindir}/*-tblgen
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " llvm_sysroot_preproce=
ss"
> +SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " llvm_sysroot_prepr=
ocess"
> +
> +llvm_sysroot_preprocess() {
> +       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +       install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT=
_DESTDIR}${bindir_crossscripts}/
> +}
> +
> +FILES:${PN}-dev +=3D "${libdir}/llvm-config"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221486): https://lists.openembedded.org/g/openembedde=
d-core/message/221486
> Mute This Topic: https://lists.openembedded.org/mt/114554152/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

