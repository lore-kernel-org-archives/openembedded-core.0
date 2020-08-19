Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.82819.1597811210207747923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 21:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=X7uNCjBi;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.214.171, mailfrom: scott.branden@broadcom.com)
Received: by mail-pl1-f171.google.com with SMTP id g15so6315516plj.6
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 21:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=j1dW0uZBphWF5iT18Ky1SoTOLDZ1TJuXcFsAtBPnSxo=;
        b=X7uNCjBiqCObujPyWsYthYshGX4oEs6JrjGAu7Alig7ZEt1+QxWDwgD55cySW9Cyqw
         dTNcPGpDCSryAlBqZPFjUQ1GsQnePoXmVfR3G/jQYKXfA5bJ34CQZkRKOYAgc1GvfKpB
         P2OpOMjvT39MRVUVJgzW5IlZSoONEh0mghlj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=j1dW0uZBphWF5iT18Ky1SoTOLDZ1TJuXcFsAtBPnSxo=;
        b=FqLR3QxSKJ2KWNpMgOHfpSzEcNNQ9PhSj0MMgaRYs+gM5wpM/1FBDUdx0bnuaAPGkw
         aTSYQb/JzjN+iyOcUaJgyxRiTR3PKQXCRE89NJo2pVugW4aPKUjqgDOPnWKynhs+OuP/
         PSE064H+dN/Jzwrmxp2lYr54e3FE9DcQO59sO1q4FranZxmkAvV7rglNF7u6Mp1dU2UN
         uozj6CvfhVgfj5Ume6OtySx2p5MogAoCvSdY4Mz385qVgtPeAqKaA3RjXDnL5uSCjY6I
         AbY0t7DTExlADtL4+P7KXBGBHpOXJnmi/k2nm+HHPHqDinagpxWMPBs0BgWlCW5PWVxA
         AHWQ==
X-Gm-Message-State: AOAM530oh1ZURKAtrbSJ2kWEbyKNIACwon2gGNscEzD1N7yjBHCtW6cS
	GO9zdhcYBAOpvG4GPrFiHE72/Q==
X-Google-Smtp-Source: ABdhPJyh+Y2JnW1+2ZwF48Pxm4UInOPJEs58GNSJV9z8Pl5UdDSvaeTDd0lJTg1p49NEEdO2v9/qrQ==
X-Received: by 2002:a17:90a:6e0c:: with SMTP id b12mr2625611pjk.141.1597811207528;
        Tue, 18 Aug 2020 21:26:47 -0700 (PDT)
Return-Path: <scott.branden@broadcom.com>
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id q10sm25843808pfs.75.2020.08.18.21.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 21:26:46 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.35 release
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200730075343.2118722-1-raj.khem@gmail.com>
From: "Scott Branden" <scott.branden@broadcom.com>
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Message-ID: <68235453-696a-155f-1fa8-d7b5873f235b@broadcom.com>
Date: Tue, 18 Aug 2020 21:26:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730075343.2118722-1-raj.khem@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------17047460B27431B495A01220"
Content-Language: en-CA

--------------17047460B27431B495A01220
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Khem,

Has this complete binutils 2.35 change been well tested?

This patch causes my system to not work entirely.
It appears that modprobe is not working properly on kernel objects.
Without this patch everything works fine.
It would take me some time to debug what in this change breaks things.

Also, when you regenerated the patches for this recipe your renamed them which makes them more difficult to diff with a directory compare.
But there are new changes in them beyond just being regenerated for 2.35?

Regards,
Scott

On 2020-07-30 12:53 a.m., Khem Raj wrote:
> assembler supports dwarf-5 format line numbers
> linker has -M -MP gcc-like option
>
> for detailed release notes see [1]
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00008.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  .../{binutils-2.34.inc => binutils-2.35.inc}  |   27 +-
>  ....34.bb => binutils-cross-canadian_2.35.bb} |    0
>  ...34.bb => binutils-cross-testsuite_2.35.bb} |    0
>  ...s-cross_2.34.bb => binutils-cross_2.35.bb} |    0
>  ...ssdk_2.34.bb => binutils-crosssdk_2.35.bb} |    0
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |   11 +-
>  ...o-not-generate-linker-script-directo.patch |   10 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |   29 +-
>  ...iden-the-regexp-for-SH-architectures.patch |   15 +-
>  ...005-Point-scripts-location-to-libdir.patch |   15 +-
>  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   14 +-
>  ...tro-compiler-point-to-the-wrong-ins.patch} |   13 +-
>  ...system-directories-when-cross-linki.patch} |   72 +-
>  ...-default-emulation-for-mips64-linux.patch} |   15 +-
>  ...> 0010-Add-support-for-Netlogic-XLP.patch} |   55 +-
>  ...ect-assembling-for-ppc-wait-mnemonic.patch |   37 +
>  ... => 0012-Detect-64-bit-MIPS-targets.patch} |    9 +-
>  ...l-2.4.patch => 0013-Use-libtool-2.4.patch} | 2529 +++++++++++++++--
>  ...ect-assembling-for-ppc-wait-mnemonic.patch |   33 -
>  ...-in-libtool-when-sysroot-is-enabled.patch} |    9 +-
>  .../0015-sync-with-OE-libtool-changes.patch   |    9 +-
>  ...or-clang-before-checking-gcc-version.patch |   14 +-
>  ...SCV_NONE-reloc-in-the-extra-unused-r.patch |   42 +
>  ...dundant-program_name-definition-fno-.patch |   61 -
>  .../binutils/binutils/CVE-2020-0551.patch     |  549 ----
>  .../{binutils_2.34.bb => binutils_2.35.bb}    |    0
>  27 files changed, 2490 insertions(+), 1080 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.34.inc => binutils-2.35.inc} (68%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.34.bb => binutils-cross-canadian_2.35.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.34.bb => binutils-cross-testsuite_2.35.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.34.bb => binutils-cross_2.35.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.34.bb => binutils-crosssdk_2.35.bb} (100%)
>  rename meta/recipes-devtools/binutils/binutils/{0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (78%)
>  rename meta/recipes-devtools/binutils/binutils/{0009-warn-for-uses-of-system-directories-when-cross-linki.patch => 0008-warn-for-uses-of-system-directories-when-cross-linki.patch} (81%)
>  rename meta/recipes-devtools/binutils/binutils/{0011-Change-default-emulation-for-mips64-linux.patch => 0009-Change-default-emulation-for-mips64-linux.patch} (87%)
>  rename meta/recipes-devtools/binutils/binutils/{0012-Add-support-for-Netlogic-XLP.patch => 0010-Add-support-for-Netlogic-XLP.patch} (93%)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
>  rename meta/recipes-devtools/binutils/binutils/{0014-Detect-64-bit-MIPS-targets.patch => 0012-Detect-64-bit-MIPS-targets.patch} (86%)
>  rename meta/recipes-devtools/binutils/binutils/{0007-Use-libtool-2.4.patch => 0013-Use-libtool-2.4.patch} (90%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
>  rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (89%)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.34.bb => binutils_2.35.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 79f523ff3d..c5cc4bdcdf 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
>  GCCVERSION ?= "10.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.34%"
> +BINUVERSION ?= "2.35%"
>  GDBVERSION ?= "9.%"
>  GLIBCVERSION ?= "2.32"
>  LINUXLIBCVERSION ?= "5.4%"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.35.inc
> similarity index 68%
> rename from meta/recipes-devtools/binutils/binutils-2.34.inc
> rename to meta/recipes-devtools/binutils/binutils-2.35.inc
> index f65fdb7328..9aa5e7efe3 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.34.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
> @@ -16,32 +16,31 @@ def binutils_branch_version(d):
>  
>  # When upgrading to 2.35, please make sure there is no trailing .0, so
>  # that upstream version check can work correctly.
> -PV = "2.34"
> -CVE_VERSION = "2.34"
> +PV = "2.35"
> +CVE_VERSION = "2.35"
>  BINUPV = "${@binutils_branch_version(d)}"
>  #BRANCH = "binutils-${BINUPV}-branch"
> -BRANCH ?= "binutils-2_34-branch"
> +BRANCH ?= "binutils-2_35-branch"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>  
> -SRCREV ?= "d4b50999b3b287b5f984ade2f8734aa8c9359440"
> +SRCREV ?= "89a9065674a14a8bd94bb326b27d19a2f3583efb"
>  BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \
>       file://0004-configure-widen-the-regexp-for-SH-architectures.patch \
>       file://0005-Point-scripts-location-to-libdir.patch \
>       file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
> -     file://0007-Use-libtool-2.4.patch \
> -     file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
> -     file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
> -     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> -     file://0011-Change-default-emulation-for-mips64-linux.patch \
> -     file://0012-Add-support-for-Netlogic-XLP.patch \
> -     file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> -     file://0014-Detect-64-bit-MIPS-targets.patch \
> +     file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
> +     file://0008-warn-for-uses-of-system-directories-when-cross-linki.patch \
> +     file://0009-Change-default-emulation-for-mips64-linux.patch \
> +     file://0010-Add-support-for-Netlogic-XLP.patch \
> +     file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
> +     file://0012-Detect-64-bit-MIPS-targets.patch \
> +     file://0013-Use-libtool-2.4.patch \
> +     file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
> -     file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
> -     file://CVE-2020-0551.patch \
> +     file://0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.34.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.34.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.34.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.34.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.34.bb b/meta/recipes-devtools/binutils/binutils-cross_2.35.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.34.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.35.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.34.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.35.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.34.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.35.bb
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 14e84215e0..0e62d47616 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> @@ -1,7 +1,7 @@
> -From b05f0be13aadf0b26a0b39dfe7daf2c47a300338 Mon Sep 17 00:00:00 2001
> +From b8d182865081d17549fb9a4b9bc3062b526caf65 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:58:54 +0000
> -Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> +Subject: [PATCH 01/17] binutils-crosssdk: Generate relocatable SDKs
>  
>  This patch will modify the ELF linker scripts so that the crosssdk
>  linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 5 insertions(+), 2 deletions(-)
>  
>  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index 03392d265c..435689ea14 100755
> +index 03392d265c7..435689ea144 100755
>  --- a/ld/genscripts.sh
>  +++ b/ld/genscripts.sh
>  @@ -304,6 +304,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
> @@ -43,7 +43,7 @@ index 03392d265c..435689ea14 100755
>   DATA_ALIGNMENT=${DATA_ALIGNMENT_}
>   RELOCATING=" "
>  diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> -index 0b8b32a440..ee6b71075d 100644
> +index 0b8b32a4407..ee6b71075d7 100644
>  --- a/ld/scripttempl/elf.sc
>  +++ b/ld/scripttempl/elf.sc
>  @@ -140,8 +140,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> @@ -57,3 +57,6 @@ index 0b8b32a440..ee6b71075d 100644
>   fi
>   if test -z "$PLT"; then
>     IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> index 91de94b768..41dff05b25 100644
> --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> @@ -1,7 +1,8 @@
> -From 6d79f81336e7cbe727b5a51134f5d314a455379d Mon Sep 17 00:00:00 2001
> +From 0d14f8f333a9b519202246ce779f3e380491826c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Mar 2017 23:37:05 -0800
> -Subject: [PATCH] binutils-cross: Do not generate linker script directories
> +Subject: [PATCH 02/17] binutils-cross: Do not generate linker script
> + directories
>  
>  We don't place target libraries within ${exec_prefix}, we'd always place these
>  within the target sysroot within the standard library directories. Worse, the
> @@ -22,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 25 deletions(-)
>  
>  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index 435689ea14..cff8a1467f 100755
> +index 435689ea144..cff8a1467f9 100755
>  --- a/ld/genscripts.sh
>  +++ b/ld/genscripts.sh
>  @@ -235,31 +235,6 @@ append_to_lib_path()
> @@ -57,3 +58,6 @@ index 435689ea14..cff8a1467f 100755
>   if [ "x${LIB_PATH}" = "x" ] && [ "x${USE_LIBPATH}" = xyes ] ; then
>     libs=${NATIVE_LIB_DIRS}
>     if [ "x${NATIVE}" = "xyes" ] ; then
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> index 4b4d73d21d..28daf58f74 100644
> --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> @@ -1,8 +1,8 @@
> -From d057b215f114f6158b4010ab44a19cae9dcc8386 Mon Sep 17 00:00:00 2001
> +From 3bbec749ec9fe681ade6812c48c541a752fcffd5 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 19 Feb 2020 09:51:16 -0800
> -Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
> - installation
> +Subject: [PATCH 03/17] binutils-nativesdk: Search for alternative ld.so.conf
> + in SDK installation
>  
>  We need binutils to look at our ld.so.conf file within the SDK to ensure
>  we search the SDK's libdirs as well as those from the host system.
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   5 files changed, 7 insertions(+), 3 deletions(-)
>  
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 4a9b8404b7..1c132d3ce4 100644
> +index 02c4fc16395..a5762227f0a 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
> @@ -43,10 +43,10 @@ index 4a9b8404b7..1c132d3ce4 100644
>   NO_WERROR = @NO_WERROR@
>   AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index 46d9b14077..e453bc1b33 100644
> +index 2fe12e14f63..8f0c83ac8d2 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -555,7 +555,8 @@ ZLIB = @zlibdir@ -lz
> +@@ -548,7 +548,8 @@ ZLIB = @zlibdir@ -lz
>   ZLIBINC = @zlibinc@
>   ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
>   	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
> @@ -55,25 +55,25 @@ index 46d9b14077..e453bc1b33 100644
>  +           -DSYSCONFDIR="\"$(sysconfdir)\""
>   
>   AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> - @ENABLE_PLUGINS_FALSE@PLUGIN_C = 
> + 
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 2e27cf48a8..a095d6aac5 100644
> +index bada3ade2d7..b4784009d7a 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -907,7 +907,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
> +@@ -911,7 +911,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
>   
>         info.path = NULL;
>         info.len = info.alloc = 0;
>  -      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
> -+      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
> ++      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
>   			(const char *) NULL);
>         if (!ldelf_parse_ld_so_conf (&info, tmppath))
>   	{
>  diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index c4af10f4e9..da1ad17763 100644
> +index 08be9030cb5..f5c5a336320 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
> -@@ -69,6 +69,7 @@ char *program_name;
> +@@ -70,6 +70,7 @@ char *program_name;
>   
>   /* The prefix for system library directories.  */
>   const char *ld_sysroot;
> @@ -82,7 +82,7 @@ index c4af10f4e9..da1ad17763 100644
>   /* The canonical representation of ld_sysroot.  */
>   char *ld_canon_sysroot;
>  diff --git a/ld/ldmain.h b/ld/ldmain.h
> -index 0f05821d1e..54c36a94ce 100644
> +index ac7db5720d5..1cbe1771912 100644
>  --- a/ld/ldmain.h
>  +++ b/ld/ldmain.h
>  @@ -23,6 +23,7 @@
> @@ -93,3 +93,6 @@ index 0f05821d1e..54c36a94ce 100644
>   extern char *ld_canon_sysroot;
>   extern int ld_canon_sysroot_len;
>   extern FILE *saved_script_handle;
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> index d10a144ed5..2381c7b85e 100644
> --- a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> @@ -1,7 +1,7 @@
> -From f7ad8a44c10f01e03680f093fd7af71c9f5e8606 Mon Sep 17 00:00:00 2001
> +From 361c2c313196c095d12d17cecf0a069107dd629b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:07:33 +0000
> -Subject: [PATCH] configure: widen the regexp for SH architectures
> +Subject: [PATCH 04/17] configure: widen the regexp for SH architectures
>  
>  gprof needs to know about uclibc
>  
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/configure b/configure
> -index 91dc42f6c7..7c1b747e7c 100755
> +index 54d0339ab9e..6782f8b6ab8 100755
>  --- a/configure
>  +++ b/configure
> -@@ -3915,7 +3915,7 @@ case "${target}" in
> +@@ -3937,7 +3937,7 @@ case "${target}" in
>     nvptx*-*-*)
>       noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
>       ;;
> @@ -27,10 +27,10 @@ index 91dc42f6c7..7c1b747e7c 100755
>         sh*-*-elf)
>            ;;
>  diff --git a/configure.ac b/configure.ac
> -index 4bd869a63a..7187b34dfc 100644
> +index a910c4fd6ba..55beb1dea46 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1159,7 +1159,7 @@ case "${target}" in
> +@@ -1178,7 +1178,7 @@ case "${target}" in
>     nvptx*-*-*)
>       noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
>       ;;
> @@ -39,3 +39,6 @@ index 4bd869a63a..7187b34dfc 100644
>       case "${target}" in
>         sh*-*-elf)
>            ;;
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
> index 3ba0ba63f1..c31a0bc9a6 100644
> --- a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
> @@ -1,7 +1,7 @@
> -From 08b088b7dd3d9707ed66948a7271ffb438eeddf5 Mon Sep 17 00:00:00 2001
> +From 39b478b7e52fb1b892a392f3c3750b9023cfabc8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:09:58 +0000
> -Subject: [PATCH] Point scripts location to libdir
> +Subject: [PATCH 05/17] Point scripts location to libdir
>  
>  Upstream-Status: Inappropriate [debian patch]
>  
> @@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 1c132d3ce4..8d82cf2e16 100644
> +index a5762227f0a..e1c665898f3 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
> -@@ -64,7 +64,7 @@ endif
> +@@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
>   # We put the scripts in the directory $(scriptdir)/ldscripts.
>   # We can't put the scripts in $(datadir) because the SEARCH_DIR
>   # directives need to be different for native and cross linkers.
> @@ -25,10 +25,10 @@ index 1c132d3ce4..8d82cf2e16 100644
>   EMUL = @EMUL@
>   EMULATION_OFILES = @EMULATION_OFILES@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index e453bc1b33..2dcd72f809 100644
> +index 8f0c83ac8d2..acc24ec4130 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -573,7 +573,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> +@@ -556,7 +556,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
>   # We put the scripts in the directory $(scriptdir)/ldscripts.
>   # We can't put the scripts in $(datadir) because the SEARCH_DIR
>   # directives need to be different for native and cross linkers.
> @@ -37,3 +37,6 @@ index e453bc1b33..2dcd72f809 100644
>   BASEDIR = $(srcdir)/..
>   BFDDIR = $(BASEDIR)/bfd
>   INCDIR = $(BASEDIR)/include
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> index d920729204..654b64ff78 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,7 +1,8 @@
> -From 13791636abf518f0db209dc51c29445d80421f2e Mon Sep 17 00:00:00 2001
> +From 59640ddf11104a604ccf7c078a48359d711c2f9c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:27:17 +0000
> -Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
> +Subject: [PATCH 06/17] Only generate an RPATH entry if LD_RUN_PATH is not
> + empty
>  
>  for cases where -rpath isn't specified. debian (#151024)
>  
> @@ -14,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>  
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index a095d6aac5..a2455a8793 100644
> +index b4784009d7a..541772f4604 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -1229,6 +1229,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
> +@@ -1247,6 +1247,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
>   		  && command_line.rpath == NULL)
>   		{
>   		  path = (const char *) getenv ("LD_RUN_PATH");
> @@ -26,7 +27,7 @@ index a095d6aac5..a2455a8793 100644
>   		  if (path
>   		      && ldelf_search_needed (path, &n, force,
>   					      is_linux, elfsize))
> -@@ -1573,6 +1575,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
> +@@ -1605,6 +1607,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
>     rpath = command_line.rpath;
>     if (rpath == NULL)
>       rpath = (const char *) getenv ("LD_RUN_PATH");
> @@ -35,3 +36,6 @@ index a095d6aac5..a2455a8793 100644
>   
>     for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
>       if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> similarity index 78%
> rename from meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> rename to meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> index b0e94ab1cb..7f8fc9a5c0 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> @@ -1,8 +1,8 @@
> -From e36a4e05f900bbe6a8d744a93f3a407bc55c96f7 Mon Sep 17 00:00:00 2001
> +From 2b81508b9af76db292cd756432b03035cb8157e0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:39:01 +0000
> -Subject: [PATCH] don't let the distro compiler point to the wrong installation
> - location
> +Subject: [PATCH 07/17] don't let the distro compiler point to the wrong
> + installation location
>  
>  Thanks to RP for helping find the source code causing the issue.
>  
> @@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
>  diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> -index fe738d0db4..27d818f253 100644
> +index 895f701bcd0..97a53f15bb6 100644
>  --- a/libiberty/Makefile.in
>  +++ b/libiberty/Makefile.in
> -@@ -365,7 +365,8 @@ install-strip: install
> +@@ -367,7 +367,8 @@ install-strip: install
>   # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
>   # default multilib, so we have to take CFLAGS into account as well,
>   # since it will be passed the multilib flags.
> @@ -30,3 +30,6 @@ index fe738d0db4..27d818f253 100644
>   install_to_libdir: all
>   	if test -n "${target_header_dir}"; then \
>   		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
> similarity index 81%
> rename from meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
> rename to meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
> index 11a8110d40..2356c6a60f 100644
> --- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
> @@ -1,7 +1,7 @@
> -From 7b24f81e04c9d00d96de7dbd250beade6d2c6e44 Mon Sep 17 00:00:00 2001
> +From 413075afbdb16e7cc05511682ca9e3c880acb5a7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 Jan 2016 06:31:09 +0000
> -Subject: [PATCH] warn for uses of system directories when cross linking
> +Subject: [PATCH 08/17] warn for uses of system directories when cross linking
>  
>  2008-07-02  Joseph Myers  <joseph@codesourcery.com>
>  
> @@ -57,16 +57,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ld/ld.h         |  8 ++++++++
>   ld/ld.texi      | 12 ++++++++++++
>   ld/ldfile.c     | 17 +++++++++++++++++
> - ld/ldlex.h      |  2 ++
> + ld/ldlex.h      |  5 +++++
>   ld/ldmain.c     |  2 ++
> - ld/lexsup.c     | 15 +++++++++++++++
> - 9 files changed, 85 insertions(+)
> + ld/lexsup.c     | 27 +++++++++++++++++++++++++++
> + 9 files changed, 100 insertions(+)
>  
>  diff --git a/ld/config.in b/ld/config.in
> -index d93c9b0830..5da2742bea 100644
> +index f1712107367..308e0173c16 100644
>  --- a/ld/config.in
>  +++ b/ld/config.in
> -@@ -31,6 +31,9 @@
> +@@ -40,6 +40,9 @@
>      language is requested. */
>   #undef ENABLE_NLS
>   
> @@ -77,7 +77,7 @@ index d93c9b0830..5da2742bea 100644
>   #undef EXTRA_SHLIB_EXTENSION
>   
>  diff --git a/ld/configure b/ld/configure
> -index 811134a503..f8c17c19ae 100755
> +index f08ce9969ea..1c872c0db5f 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -826,6 +826,7 @@ with_lib_path
> @@ -88,7 +88,7 @@ index 811134a503..f8c17c19ae 100755
>   enable_gold
>   enable_got
>   enable_compressed_debug_sections
> -@@ -1491,6 +1492,8 @@ Optional Features:
> +@@ -1493,6 +1494,8 @@ Optional Features:
>     --disable-largefile     omit support for large files
>     --enable-targets        alternative target configurations
>     --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
> @@ -97,7 +97,7 @@ index 811134a503..f8c17c19ae 100755
>     --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
>     --enable-got=<type>     GOT handling scheme (target, single, negative,
>                             multigot)
> -@@ -15788,6 +15791,19 @@ fi
> +@@ -15793,6 +15796,19 @@ fi
>   
>   
>   
> @@ -118,7 +118,7 @@ index 811134a503..f8c17c19ae 100755
>   if test "${enable_gold+set}" = set; then :
>     enableval=$enable_gold; case "${enableval}" in
>  diff --git a/ld/configure.ac b/ld/configure.ac
> -index b5e849d84a..22e022ec03 100644
> +index 5a4938afdb0..dbbbde74b04 100644
>  --- a/ld/configure.ac
>  +++ b/ld/configure.ac
>  @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
> @@ -139,7 +139,7 @@ index b5e849d84a..22e022ec03 100644
>   dnl "install_as_default" is set to false if gold is the default linker.
>   dnl "installed_linker" is the installed BFD linker name.
>  diff --git a/ld/ld.h b/ld/ld.h
> -index 71fd781267..5c7843100b 100644
> +index 1790dc81a66..73f832eb169 100644
>  --- a/ld/ld.h
>  +++ b/ld/ld.h
>  @@ -166,6 +166,14 @@ typedef struct
> @@ -158,10 +158,10 @@ index 71fd781267..5c7843100b 100644
>     enum endian_enum endian;
>   
>  diff --git a/ld/ld.texi b/ld/ld.texi
> -index eb7bcb9933..3c73d445a0 100644
> +index 2a93e9456ac..3eeb70607fd 100644
>  --- a/ld/ld.texi
>  +++ b/ld/ld.texi
> -@@ -2551,6 +2551,18 @@ string identifying the original linked file does not change.
> +@@ -2655,6 +2655,18 @@ string identifying the original linked file does not change.
>   
>   Passing @code{none} for @var{style} disables the setting from any
>   @code{--build-id} options earlier on the command line.
> @@ -181,7 +181,7 @@ index eb7bcb9933..3c73d445a0 100644
>   
>   @c man end
>  diff --git a/ld/ldfile.c b/ld/ldfile.c
> -index 411f7ddf97..17db16c2cc 100644
> +index e39170b5d94..fadc248a140 100644
>  --- a/ld/ldfile.c
>  +++ b/ld/ldfile.c
>  @@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
> @@ -209,23 +209,26 @@ index 411f7ddf97..17db16c2cc 100644
>   
>   /* Try to open a BFD for a lang_input_statement.  */
>  diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index 5287f19a7f..55096e4fc9 100644
> +index 5ea083ebeb3..941dc5f3dc8 100644
>  --- a/ld/ldlex.h
>  +++ b/ld/ldlex.h
> -@@ -150,6 +150,8 @@ enum option_values
> -   OPTION_FORCE_GROUP_ALLOCATION,
> -   OPTION_PRINT_MAP_DISCARDED,
> -   OPTION_NO_PRINT_MAP_DISCARDED,
> +@@ -155,6 +155,11 @@ enum option_values
> +   OPTION_NON_CONTIGUOUS_REGIONS,
> +   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
> +   OPTION_DEPENDENCY_FILE,
> ++  OPTION_CTF_VARIABLES,
> ++  OPTION_NO_CTF_VARIABLES,
> ++  OPTION_CTF_SHARE_TYPES,
>  +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
>  +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
>   };
>   
>   /* The initial parser states.  */
>  diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index da1ad17763..12d0b07d8a 100644
> +index f5c5a336320..516ba0360e2 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
> -@@ -274,6 +274,8 @@ main (int argc, char **argv)
> +@@ -322,6 +322,8 @@ main (int argc, char **argv)
>     command_line.warn_mismatch = TRUE;
>     command_line.warn_search_mismatch = TRUE;
>     command_line.check_section_addresses = -1;
> @@ -235,13 +238,25 @@ index da1ad17763..12d0b07d8a 100644
>     /* We initialize DEMANGLING based on the environment variable
>        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
>  diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index 3d15cc491d..0e8b4f2b7a 100644
> +index 58c6c078325..879e7bb7658 100644
>  --- a/ld/lexsup.c
>  +++ b/ld/lexsup.c
> -@@ -550,6 +550,14 @@ static const struct ld_option ld_options[] =
> +@@ -572,6 +572,26 @@ static const struct ld_option ld_options[] =
>     { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
>       '\0', NULL, N_("Do not show discarded sections in map file output"),
>       TWO_DASHES },
> ++  { {"ctf-variables", no_argument, NULL, OPTION_CTF_VARIABLES},
> ++    '\0', NULL, N_("Emit names and types of static variables in CTF"),
> ++    TWO_DASHES },
> ++  { {"no-ctf-variables", no_argument, NULL, OPTION_NO_CTF_VARIABLES},
> ++    '\0', NULL, N_("Do not emit names and types of static variables in CTF"),
> ++    TWO_DASHES },
> ++  { {"ctf-share-types=<method>", required_argument, NULL,
> ++     OPTION_CTF_SHARE_TYPES},
> ++    '\0', NULL, N_("How to share CTF types between translation units.\n"
> ++		   "                                <method> is: share-unconflicted (default),\n"
> ++		   "                                             share-duplicated"),
> ++    TWO_DASHES },
>  +  { {"no-poison-system-directories", no_argument, NULL,
>  +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
>  +    '\0', NULL, N_("Do not warn for -L options using system directories"),
> @@ -253,7 +268,7 @@ index 3d15cc491d..0e8b4f2b7a 100644
>   };
>   
>   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1603,6 +1611,13 @@ parse_args (unsigned argc, char **argv)
> +@@ -1632,6 +1652,13 @@ parse_args (unsigned argc, char **argv)
>   
>   	case OPTION_PRINT_MAP_DISCARDED:
>   	  config.print_map_discarded = TRUE;
> @@ -265,5 +280,8 @@ index 3d15cc491d..0e8b4f2b7a 100644
>  +	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
>  +	  command_line.error_poison_system_directories = TRUE;
>   	  break;
> - 	}
> -     }
> + 
> + 	case OPTION_DEPENDENCY_FILE:
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> similarity index 87%
> rename from meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
> rename to meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> index c49b8e863f..fb5276e183 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
> @@ -1,7 +1,7 @@
> -From 2182791a453f34bee6968b3e72848608cf7d7abe Mon Sep 17 00:00:00 2001
> +From 13a67e9040c01abd284fe506471e0eab668ee3dc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:44:14 +0000
> -Subject: [PATCH] Change default emulation for mips64*-*-linux
> +Subject: [PATCH 09/17] Change default emulation for mips64*-*-linux
>  
>  we change the default emulations to be N64 instead of N32
>  
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 8 insertions(+), 8 deletions(-)
>  
>  diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index b96931f52e..847f9f0ba9 100644
> +index 14523caf0c5..e5233cd1f7e 100644
>  --- a/bfd/config.bfd
>  +++ b/bfd/config.bfd
> -@@ -911,12 +911,12 @@ case "${targ}" in
> +@@ -894,12 +894,12 @@ case "${targ}" in
>       targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
>       ;;
>     mips64*el-*-linux*)
> @@ -35,10 +35,10 @@ index b96931f52e..847f9f0ba9 100644
>     mips*el-*-linux*)
>       targ_defvec=mips_elf32_trad_le_vec
>  diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index 23194e357f..f4f0eaf9b2 100644
> +index 87c7d9a4cad..9b4bf2ca964 100644
>  --- a/ld/configure.tgt
>  +++ b/ld/configure.tgt
> -@@ -541,12 +541,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
> +@@ -531,12 +531,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
>   			;;
>   mips*-*-windiss)	targ_emul=elf32mipswindiss
>   			;;
> @@ -55,3 +55,6 @@ index 23194e357f..f4f0eaf9b2 100644
>   			targ_extra_libpath=$targ_extra_emuls
>   			;;
>   mips*el-*-linux-*)	targ_emul=elf32ltsmip
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
> similarity index 93%
> rename from meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
> rename to meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
> index c32867a238..277db4ec5c 100644
> --- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
> @@ -1,7 +1,7 @@
> -From a0237ec2d1e58bd35c236df39dd5a06504c6d2ed Mon Sep 17 00:00:00 2001
> +From 69ab45c16f80f18fa78121f6e774750b9e9a200b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:06:19 +0000
> -Subject: [PATCH] Add support for Netlogic XLP
> +Subject: [PATCH 10/17] Add support for Netlogic XLP
>  
>  Patch From: Nebu Philips <nphilips@netlogicmicro.com>
>  
> @@ -35,10 +35,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>   15 files changed, 65 insertions(+), 21 deletions(-)
>  
>  diff --git a/bfd/aoutx.h b/bfd/aoutx.h
> -index fa3a9746b6..5078024fd5 100644
> +index d352a1a3e44..2e2c3c1af86 100644
>  --- a/bfd/aoutx.h
>  +++ b/bfd/aoutx.h
> -@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
> +@@ -810,6 +810,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
>   	case bfd_mach_mipsisa64r6:
>   	case bfd_mach_mips_sb1:
>   	case bfd_mach_mips_xlr:
> @@ -47,7 +47,7 @@ index fa3a9746b6..5078024fd5 100644
>   	  arch_flags = M_MIPS2;
>   	  break;
>  diff --git a/bfd/archures.c b/bfd/archures.c
> -index 232103817c..b2b3b8c124 100644
> +index 551ec8732f0..2665b378623 100644
>  --- a/bfd/archures.c
>  +++ b/bfd/archures.c
>  @@ -185,6 +185,7 @@ DESCRIPTION
> @@ -59,10 +59,10 @@ index 232103817c..b2b3b8c124 100644
>   .#define bfd_mach_mipsisa32r2		33
>   .#define bfd_mach_mipsisa32r3		34
>  diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> -index 7c13bc8c91..2e453c50c1 100644
> +index 35ef4d755bb..48db00af80b 100644
>  --- a/bfd/bfd-in2.h
>  +++ b/bfd/bfd-in2.h
> -@@ -1568,6 +1568,7 @@ enum bfd_architecture
> +@@ -1585,6 +1585,7 @@ enum bfd_architecture
>   #define bfd_mach_mips_octeon3          6503
>   #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
>   #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
> @@ -71,10 +71,10 @@ index 7c13bc8c91..2e453c50c1 100644
>   #define bfd_mach_mipsisa32r2           33
>   #define bfd_mach_mipsisa32r3           34
>  diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index 847f9f0ba9..a12707f827 100644
> +index e5233cd1f7e..2e4ae6bbdff 100644
>  --- a/bfd/config.bfd
>  +++ b/bfd/config.bfd
> -@@ -894,6 +894,11 @@ case "${targ}" in
> +@@ -877,6 +877,11 @@ case "${targ}" in
>       targ_defvec=mips_elf32_le_vec
>       targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
>       ;;
> @@ -87,7 +87,7 @@ index 847f9f0ba9..a12707f827 100644
>       targ_defvec=mips_elf32_be_vec
>       targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
>  diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
> -index 802acb45f1..fd9ec4c0ad 100644
> +index 802acb45f1e..fd9ec4c0ad4 100644
>  --- a/bfd/cpu-mips.c
>  +++ b/bfd/cpu-mips.c
>  @@ -108,7 +108,8 @@ enum
> @@ -111,10 +111,10 @@ index 802acb45f1..fd9ec4c0ad 100644
>   
>   /* The default architecture is mips:3000, but with a machine number of
>  diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
> -index d7e3aed3b6..7baeee9ee3 100644
> +index 160febec94c..4c9499cc2cf 100644
>  --- a/bfd/elfxx-mips.c
>  +++ b/bfd/elfxx-mips.c
> -@@ -6999,6 +6999,9 @@ _bfd_elf_mips_mach (flagword flags)
> +@@ -6982,6 +6982,9 @@ _bfd_elf_mips_mach (flagword flags)
>       case E_MIPS_MACH_IAMR2:
>         return bfd_mach_mips_interaptiv_mr2;
>   
> @@ -124,7 +124,7 @@ index d7e3aed3b6..7baeee9ee3 100644
>       default:
>         switch (flags & EF_MIPS_ARCH)
>   	{
> -@@ -12355,6 +12358,10 @@ mips_set_isa_flags (bfd *abfd)
> +@@ -12356,6 +12359,10 @@ mips_set_isa_flags (bfd *abfd)
>         val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
>         break;
>   
> @@ -135,7 +135,7 @@ index d7e3aed3b6..7baeee9ee3 100644
>       case bfd_mach_mipsisa32:
>         val = E_MIPS_ARCH_32;
>         break;
> -@@ -14379,6 +14386,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
> +@@ -14373,6 +14380,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
>     { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
>     { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
>     { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
> @@ -144,10 +144,10 @@ index d7e3aed3b6..7baeee9ee3 100644
>     /* MIPS64 extensions.  */
>     { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
>  diff --git a/binutils/readelf.c b/binutils/readelf.c
> -index 6b5bebe743..d15a7828db 100644
> +index 6057515a89b..ea119b0b254 100644
>  --- a/binutils/readelf.c
>  +++ b/binutils/readelf.c
> -@@ -3440,6 +3440,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
> +@@ -3483,6 +3483,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
>   	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
>   	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
>   	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
> @@ -156,7 +156,7 @@ index 6b5bebe743..d15a7828db 100644
>   	    /* We simply ignore the field in this case to avoid confusion:
>   	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
>  diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
> -index fc6898834e..2c7151ccdb 100644
> +index 31acb77d78a..0ead168d51e 100644
>  --- a/gas/config/tc-mips.c
>  +++ b/gas/config/tc-mips.c
>  @@ -568,6 +568,7 @@ static int mips_32bitmode = 0;
> @@ -175,7 +175,7 @@ index fc6898834e..2c7151ccdb 100644
>      )
>   
>   /* Whether the processor uses hardware interlocks to protect reads
> -@@ -20135,7 +20137,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
> +@@ -20174,7 +20176,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
>     /* Broadcom XLP.
>        XLP is mostly like XLR, with the prominent exception that it is
>        MIPS64R2 rather than MIPS64.  */
> @@ -185,7 +185,7 @@ index fc6898834e..2c7151ccdb 100644
>     /* MIPS 64 Release 6.  */
>     { "i6400",	      0, ASE_VIRT | ASE_MSA,	ISA_MIPS64R6, CPU_MIPS64R6},
>  diff --git a/gas/configure b/gas/configure
> -index 60c1a055ae..59d6d11215 100755
> +index 5bccfd9d1b7..d4b13e6fc8b 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -12722,6 +12722,9 @@ _ACEOF
> @@ -199,7 +199,7 @@ index 60c1a055ae..59d6d11215 100755
>   	    mips_cpu=r3900
>   	    ;;
>  diff --git a/gas/configure.ac b/gas/configure.ac
> -index 6f32e55a1a..11c2e0d273 100644
> +index b65108fecb2..ce1f2dad9bc 100644
>  --- a/gas/configure.ac
>  +++ b/gas/configure.ac
>  @@ -325,6 +325,9 @@ changequote([,])dnl
> @@ -213,7 +213,7 @@ index 6f32e55a1a..11c2e0d273 100644
>   	    mips_cpu=r3900
>   	    ;;
>  diff --git a/include/elf/mips.h b/include/elf/mips.h
> -index d116b036b6..dceeb3f156 100644
> +index cc08ebd4318..bb518575ce1 100644
>  --- a/include/elf/mips.h
>  +++ b/include/elf/mips.h
>  @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
> @@ -225,7 +225,7 @@ index d116b036b6..dceeb3f156 100644
>   #define E_MIPS_MACH_OCTEON3	0x008e0000
>   #define E_MIPS_MACH_5400	0x00910000
>  diff --git a/include/opcode/mips.h b/include/opcode/mips.h
> -index fd031f3758..a96a44df84 100644
> +index fd031f37588..a96a44df840 100644
>  --- a/include/opcode/mips.h
>  +++ b/include/opcode/mips.h
>  @@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] = {
> @@ -256,10 +256,10 @@ index fd031f3758..a96a44df84 100644
>         return FALSE;
>       }
>  diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index f4f0eaf9b2..0da3eca19c 100644
> +index 9b4bf2ca964..f6d7171dff7 100644
>  --- a/ld/configure.tgt
>  +++ b/ld/configure.tgt
> -@@ -520,6 +520,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
> +@@ -510,6 +510,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
>   			targ_emul=elf32btsmip
>   			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip"
>   			;;
> @@ -270,7 +270,7 @@ index f4f0eaf9b2..0da3eca19c 100644
>   			targ_extra_emuls="elf32lr5900"
>   			targ_extra_libpath=$targ_extra_emuls
>  diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
> -index 755bbe294b..ce22ef683a 100644
> +index 755bbe294bd..ce22ef683a6 100644
>  --- a/opcodes/mips-dis.c
>  +++ b/opcodes/mips-dis.c
>  @@ -674,13 +674,11 @@ const struct mips_arch_choice mips_arch_choices[] =
> @@ -293,7 +293,7 @@ index 755bbe294b..ce22ef683a 100644
>     /* This entry, mips16, is here only for ISA/processor selection; do
>        not print its name.  */
>  diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
> -index 5270aeefa8..d17dc78cd7 100644
> +index 5270aeefa80..d17dc78cd71 100644
>  --- a/opcodes/mips-opc.c
>  +++ b/opcodes/mips-opc.c
>  @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
> @@ -404,3 +404,6 @@ index 5270aeefa8..d17dc78cd7 100644
>   {"swc0",		"E,o(b)",	0xe0000000, 0xfc000000,	RD_3|RD_C0|SM,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
>   {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
>   {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> new file mode 100644
> index 0000000000..10c3d80865
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -0,0 +1,37 @@
> +From 7836f8aa56ef0f18c8658dc7e4952a9d097ba7e8 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@nxp.com>
> +Date: Sat, 11 Jun 2016 22:08:29 -0500
> +Subject: [PATCH 11/17] fix the incorrect assembling for ppc wait mnemonic
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> +
> +Upstream-Status: Pending
> +---
> + opcodes/ppc-opc.c | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> +index 5e20d617664..4c9656ecf08 100644
> +--- a/opcodes/ppc-opc.c
> ++++ b/opcodes/ppc-opc.c
> +@@ -6265,8 +6265,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> + {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
> + {"waitrsv",	XWCPL(31,30,1,0),0xffffffff, POWER10,	0,		{0}},
> + {"pause_short",	XWCPL(31,30,2,0),0xffffffff, POWER10,	0,		{0}},
> +-{"wait",	X(31,30),	XWCPL_MASK,  POWER10,	0,		{WC, PL}},
> +-{"wait",	X(31,30),	XWC_MASK,    POWER9,	POWER10,	{WC}},
> + 
> + {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
> + 
> +@@ -6326,7 +6324,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> + 
> + {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
> + {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
> +-{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2, 0,		{WC}},
> ++{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2|POWER9|POWER10, 0,	{WC}},
> + 
> + {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
> + 
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> similarity index 86%
> rename from meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
> rename to meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> index 6acde1f781..ef8b253b6a 100644
> --- a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
> @@ -1,7 +1,7 @@
> -From 2f7f2389764ef1d699f6ad32057314024b7e84e7 Mon Sep 17 00:00:00 2001
> +From dbff6bdf2123f5495b8be930304d9aa5e88006a7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 31 Mar 2017 11:42:03 -0700
> -Subject: [PATCH] Detect 64-bit MIPS targets
> +Subject: [PATCH 12/17] Detect 64-bit MIPS targets
>  
>  Add mips64 target triplets and default to N64
>  
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 14 insertions(+)
>  
>  diff --git a/gold/configure.tgt b/gold/configure.tgt
> -index aa7ec552ae..470515062e 100644
> +index aa7ec552aec..470515062e4 100644
>  --- a/gold/configure.tgt
>  +++ b/gold/configure.tgt
>  @@ -153,6 +153,13 @@ aarch64*-*)
> @@ -45,3 +45,6 @@ index aa7ec552ae..470515062e 100644
>   mips*-*-*)
>    targ_obj=mips
>    targ_machine=EM_MIPS
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> similarity index 90%
> rename from meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
> rename to meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> index 89da62fbf7..987a96f4b7 100644
> --- a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> @@ -1,7 +1,7 @@
> -From b8fafd8ce6c47c9a551ed796176d884a34930086 Mon Sep 17 00:00:00 2001
> +From 7e2ddee8704c9c3b73760dd9464b18fade563d85 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:04:07 +0000
> -Subject: [PATCH 07/15] Use libtool 2.4
> +Subject: [PATCH 13/17] Use libtool 2.4
>  
>  get libtool sysroot support
>  
> @@ -22,10 +22,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ltversion.m4       |   12 +-
>   lt~obsolete.m4     |    2 +-
>   opcodes/configure  | 1320 +++++++++++++++-----
> - 13 files changed, 9939 insertions(+), 3700 deletions(-)
> + zlib/configure     | 1320 +++++++++++++++-----
> + 14 files changed, 10931 insertions(+), 4028 deletions(-)
>  
>  diff --git a/bfd/configure b/bfd/configure
> -index bc576b7894a..cd036638081 100755
> +index 0340ed541b5..2012656b3b7 100755
>  --- a/bfd/configure
>  +++ b/bfd/configure
>  @@ -704,6 +704,9 @@ OTOOL
> @@ -1350,7 +1351,7 @@ index bc576b7894a..cd036638081 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14554,7 +15209,7 @@ SHARED_LDFLAGS=
> +@@ -14578,7 +15233,7 @@ SHARED_LDFLAGS=
>   if test "$enable_shared" = "yes"; then
>     x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>     if test -n "$x"; then
> @@ -1359,7 +1360,7 @@ index bc576b7894a..cd036638081 100755
>     fi
>   
>     case "${host}" in
> -@@ -17176,13 +17831,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -17197,13 +17852,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -1380,7 +1381,7 @@ index bc576b7894a..cd036638081 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -17197,14 +17859,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -17218,14 +17880,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -1399,7 +1400,7 @@ index bc576b7894a..cd036638081 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17237,12 +17902,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -17258,12 +17923,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -1413,7 +1414,7 @@ index bc576b7894a..cd036638081 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -17297,8 +17962,13 @@ reload_flag \
> +@@ -17318,8 +17983,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -1427,7 +1428,7 @@ index bc576b7894a..cd036638081 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -17308,12 +17978,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -17329,12 +17999,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -1443,7 +1444,7 @@ index bc576b7894a..cd036638081 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -17329,7 +18001,6 @@ no_undefined_flag \
> +@@ -17350,7 +18022,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -1451,7 +1452,7 @@ index bc576b7894a..cd036638081 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -17365,6 +18036,7 @@ module_cmds \
> +@@ -17386,6 +18057,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -1459,7 +1460,7 @@ index bc576b7894a..cd036638081 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18153,7 +18825,8 @@ $as_echo X"$file" |
> +@@ -18174,7 +18846,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -1469,7 +1470,7 @@ index bc576b7894a..cd036638081 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -18256,19 +18929,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -18277,19 +18950,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -1513,7 +1514,7 @@ index bc576b7894a..cd036638081 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -18298,6 +18994,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -18319,6 +19015,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -1526,7 +1527,7 @@ index bc576b7894a..cd036638081 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -18307,6 +19009,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -18328,6 +19030,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -1536,7 +1537,7 @@ index bc576b7894a..cd036638081 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -18421,12 +19126,12 @@ with_gcc=$GCC
> +@@ -18442,12 +19147,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -1552,7 +1553,7 @@ index bc576b7894a..cd036638081 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -18513,9 +19218,6 @@ inherit_rpath=$inherit_rpath
> +@@ -18534,9 +19239,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -1562,7 +1563,7 @@ index bc576b7894a..cd036638081 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -18531,6 +19233,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -18552,6 +19254,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -1572,7 +1573,7 @@ index bc576b7894a..cd036638081 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -18563,210 +19268,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -18584,210 +19289,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -1947,10 +1948,10 @@ index bc576b7894a..cd036638081 100755
>     chmod +x "$ofile"
>   
>  diff --git a/bfd/configure.ac b/bfd/configure.ac
> -index c5bfbd5d129..e666b1cc106 100644
> +index 8e86f8399ce..e8700c9d4d2 100644
>  --- a/bfd/configure.ac
>  +++ b/bfd/configure.ac
> -@@ -290,7 +290,7 @@ changequote(,)dnl
> +@@ -314,7 +314,7 @@ changequote(,)dnl
>     x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
>   changequote([,])dnl
>     if test -n "$x"; then
> @@ -1960,10 +1961,10 @@ index c5bfbd5d129..e666b1cc106 100644
>   
>     case "${host}" in
>  diff --git a/binutils/configure b/binutils/configure
> -index a8dfd4bd68c..82316496953 100755
> +index 89c99abfeba..d3289a5efcd 100755
>  --- a/binutils/configure
>  +++ b/binutils/configure
> -@@ -690,8 +690,11 @@ OTOOL
> +@@ -692,8 +692,11 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -1975,7 +1976,7 @@ index a8dfd4bd68c..82316496953 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -808,6 +811,7 @@ enable_static
> +@@ -810,6 +813,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -1983,7 +1984,7 @@ index a8dfd4bd68c..82316496953 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1485,6 +1489,8 @@ Optional Packages:
> +@@ -1490,6 +1494,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -1992,7 +1993,7 @@ index a8dfd4bd68c..82316496953 100755
>     --with-debuginfod       Enable debuginfo lookups with debuginfod
>                             (auto/yes/no)
>     --with-system-zlib      use installed libz
> -@@ -5461,8 +5467,8 @@ esac
> +@@ -5467,8 +5473,8 @@ esac
>   
>   
>   
> @@ -2003,7 +2004,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   
>   
> -@@ -5502,7 +5508,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5508,7 +5514,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -2012,7 +2013,7 @@ index a8dfd4bd68c..82316496953 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6188,8 +6194,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6194,8 +6200,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -2023,7 +2024,7 @@ index a8dfd4bd68c..82316496953 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6238,6 +6244,80 @@ esac
> +@@ -6244,6 +6250,80 @@ esac
>   
>   
>   
> @@ -2104,7 +2105,7 @@ index a8dfd4bd68c..82316496953 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6254,6 +6334,11 @@ case $reload_flag in
> +@@ -6260,6 +6340,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -2116,7 +2117,7 @@ index a8dfd4bd68c..82316496953 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6422,7 +6507,8 @@ mingw* | pw32*)
> +@@ -6428,7 +6513,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -2126,7 +2127,7 @@ index a8dfd4bd68c..82316496953 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6576,6 +6662,21 @@ esac
> +@@ -6582,6 +6668,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -2148,7 +2149,7 @@ index a8dfd4bd68c..82316496953 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6591,9 +6692,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6597,9 +6698,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -2313,7 +2314,7 @@ index a8dfd4bd68c..82316496953 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6609,7 +6863,7 @@ do
> +@@ -6615,7 +6869,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2322,7 +2323,7 @@ index a8dfd4bd68c..82316496953 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6629,11 +6883,15 @@ $as_echo "no" >&6; }
> +@@ -6635,11 +6889,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -2341,7 +2342,7 @@ index a8dfd4bd68c..82316496953 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6649,7 +6907,7 @@ do
> +@@ -6655,7 +6913,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2350,7 +2351,7 @@ index a8dfd4bd68c..82316496953 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6668,6 +6926,10 @@ else
> +@@ -6674,6 +6932,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -2361,7 +2362,7 @@ index a8dfd4bd68c..82316496953 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6679,12 +6941,10 @@ ac_tool_warned=yes ;;
> +@@ -6685,12 +6947,10 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -2376,7 +2377,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   
>   
> -@@ -6696,6 +6956,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -6702,6 +6962,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -2441,7 +2442,7 @@ index a8dfd4bd68c..82316496953 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -7030,8 +7348,8 @@ esac
> +@@ -7036,8 +7354,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -2452,7 +2453,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7067,6 +7385,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7073,6 +7391,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -2460,7 +2461,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7108,6 +7427,18 @@ _LT_EOF
> +@@ -7114,6 +7433,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -2479,7 +2480,7 @@ index a8dfd4bd68c..82316496953 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7119,7 +7450,7 @@ _LT_EOF
> +@@ -7125,7 +7456,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -2488,7 +2489,7 @@ index a8dfd4bd68c..82316496953 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7145,8 +7476,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7151,8 +7482,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -2499,7 +2500,7 @@ index a8dfd4bd68c..82316496953 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7156,8 +7487,8 @@ _LT_EOF
> +@@ -7162,8 +7493,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -2510,7 +2511,7 @@ index a8dfd4bd68c..82316496953 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7194,6 +7525,21 @@ else
> +@@ -7200,6 +7531,21 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -2532,7 +2533,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   
>   
> -@@ -7210,6 +7556,40 @@ fi
> +@@ -7216,6 +7562,40 @@ fi
>   
>   
>   
> @@ -2573,7 +2574,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   
>   
> -@@ -7421,6 +7801,123 @@ esac
> +@@ -7427,6 +7807,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -2697,7 +2698,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7984,6 +8481,8 @@ _LT_EOF
> +@@ -7990,6 +8487,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -2706,7 +2707,7 @@ index a8dfd4bd68c..82316496953 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8179,7 +8678,8 @@ fi
> +@@ -8185,7 +8684,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -2716,7 +2717,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   
>   
> -@@ -8268,7 +8768,7 @@ aix3*)
> +@@ -8274,7 +8774,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -2725,7 +2726,7 @@ index a8dfd4bd68c..82316496953 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8566,8 +9066,6 @@ fi
> +@@ -8572,8 +9072,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -2734,7 +2735,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8733,6 +9231,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8739,6 +9237,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -2747,7 +2748,7 @@ index a8dfd4bd68c..82316496953 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8795,7 +9299,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8801,7 +9305,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -2756,7 +2757,7 @@ index a8dfd4bd68c..82316496953 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8852,13 +9356,17 @@ case $host_os in
> +@@ -8858,13 +9362,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -2780,7 +2781,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8919,6 +9427,11 @@ fi
> +@@ -8925,6 +9433,11 @@ fi
>   
>   
>   
> @@ -2792,7 +2793,7 @@ index a8dfd4bd68c..82316496953 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9269,7 +9782,8 @@ _LT_EOF
> +@@ -9275,7 +9788,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -2802,7 +2803,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9368,12 +9882,12 @@ _LT_EOF
> +@@ -9374,12 +9888,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -2817,7 +2818,7 @@ index a8dfd4bd68c..82316496953 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9387,8 +9901,8 @@ _LT_EOF
> +@@ -9393,8 +9907,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -2828,7 +2829,7 @@ index a8dfd4bd68c..82316496953 100755
>         fi
>         ;;
>   
> -@@ -9406,8 +9920,8 @@ _LT_EOF
> +@@ -9412,8 +9926,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2839,7 +2840,7 @@ index a8dfd4bd68c..82316496953 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9453,8 +9967,8 @@ _LT_EOF
> +@@ -9459,8 +9973,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -2850,7 +2851,7 @@ index a8dfd4bd68c..82316496953 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9584,7 +10098,13 @@ _LT_EOF
> +@@ -9590,7 +10104,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -2865,7 +2866,7 @@ index a8dfd4bd68c..82316496953 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9597,22 +10117,29 @@ main ()
> +@@ -9603,22 +10123,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -2908,7 +2909,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9624,7 +10151,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9630,7 +10157,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -2923,7 +2924,7 @@ index a8dfd4bd68c..82316496953 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9637,22 +10170,29 @@ main ()
> +@@ -9643,22 +10176,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -2966,7 +2967,7 @@ index a8dfd4bd68c..82316496953 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9697,20 +10237,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9703,20 +10243,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -3044,7 +3045,7 @@ index a8dfd4bd68c..82316496953 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9771,7 +10354,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9777,7 +10360,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -3053,7 +3054,7 @@ index a8dfd4bd68c..82316496953 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9779,7 +10362,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9785,7 +10368,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -3062,7 +3063,7 @@ index a8dfd4bd68c..82316496953 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9795,7 +10378,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9801,7 +10384,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -3071,7 +3072,7 @@ index a8dfd4bd68c..82316496953 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9819,10 +10402,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9825,10 +10408,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -3084,7 +3085,7 @@ index a8dfd4bd68c..82316496953 100755
>   	  ;;
>   	esac
>         else
> -@@ -9901,23 +10484,36 @@ fi
> +@@ -9907,23 +10490,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -3129,7 +3130,7 @@ index a8dfd4bd68c..82316496953 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10002,7 +10598,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10008,7 +10604,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -3138,7 +3139,7 @@ index a8dfd4bd68c..82316496953 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10021,9 +10617,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10027,9 +10623,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -3150,7 +3151,7 @@ index a8dfd4bd68c..82316496953 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10599,8 +11195,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10605,8 +11201,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -3162,7 +3163,7 @@ index a8dfd4bd68c..82316496953 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10633,13 +11230,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10639,13 +11236,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -3235,7 +3236,7 @@ index a8dfd4bd68c..82316496953 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10731,7 +11386,7 @@ haiku*)
> +@@ -10737,7 +11392,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -3244,16 +3245,16 @@ index a8dfd4bd68c..82316496953 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11527,7 +12182,7 @@ else
> +@@ -11533,7 +12188,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11530 "configure"
> +-#line 11536 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11571,10 +12226,10 @@ else
> +@@ -11577,10 +12232,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3266,16 +3267,16 @@ index a8dfd4bd68c..82316496953 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11633,7 +12288,7 @@ else
> +@@ -11639,7 +12294,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11636 "configure"
> +-#line 11642 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11677,10 +12332,10 @@ else
> +@@ -11683,10 +12338,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -3288,7 +3289,7 @@ index a8dfd4bd68c..82316496953 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -16024,13 +16679,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -16076,13 +16731,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -3309,7 +3310,7 @@ index a8dfd4bd68c..82316496953 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -16045,14 +16707,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -16097,14 +16759,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -3328,7 +3329,7 @@ index a8dfd4bd68c..82316496953 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -16085,12 +16750,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -16137,12 +16802,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -3342,7 +3343,7 @@ index a8dfd4bd68c..82316496953 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -16145,8 +16810,13 @@ reload_flag \
> +@@ -16197,8 +16862,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -3356,7 +3357,7 @@ index a8dfd4bd68c..82316496953 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -16156,12 +16826,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -16208,12 +16878,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -3372,7 +3373,7 @@ index a8dfd4bd68c..82316496953 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -16177,7 +16849,6 @@ no_undefined_flag \
> +@@ -16229,7 +16901,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -3380,7 +3381,7 @@ index a8dfd4bd68c..82316496953 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -16213,6 +16884,7 @@ module_cmds \
> +@@ -16265,6 +16936,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -3388,7 +3389,7 @@ index a8dfd4bd68c..82316496953 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16979,7 +17651,8 @@ $as_echo X"$file" |
> +@@ -17031,7 +17703,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -3398,7 +3399,7 @@ index a8dfd4bd68c..82316496953 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -17082,19 +17755,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -17134,19 +17807,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -3442,7 +3443,7 @@ index a8dfd4bd68c..82316496953 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -17124,6 +17820,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -17176,6 +17872,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -3455,7 +3456,7 @@ index a8dfd4bd68c..82316496953 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -17133,6 +17835,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -17185,6 +17887,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -3465,7 +3466,7 @@ index a8dfd4bd68c..82316496953 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -17247,12 +17952,12 @@ with_gcc=$GCC
> +@@ -17299,12 +18004,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -3481,7 +3482,7 @@ index a8dfd4bd68c..82316496953 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -17339,9 +18044,6 @@ inherit_rpath=$inherit_rpath
> +@@ -17391,9 +18096,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -3491,7 +3492,7 @@ index a8dfd4bd68c..82316496953 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -17357,6 +18059,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -17409,6 +18111,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -3501,7 +3502,7 @@ index a8dfd4bd68c..82316496953 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -17389,210 +18094,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -17441,210 +18146,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -3876,7 +3877,7 @@ index a8dfd4bd68c..82316496953 100755
>     chmod +x "$ofile"
>   
>  diff --git a/gas/configure b/gas/configure
> -index 60c1a055ae2..0e0ce4c0e23 100755
> +index d4b13e6fc8b..dd5224c5c81 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -681,8 +681,11 @@ OTOOL
> @@ -5204,7 +5205,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15928,13 +16583,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -15981,13 +16636,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -5225,7 +5226,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -15949,14 +16611,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -16002,14 +16664,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -5244,7 +5245,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15989,12 +16654,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -16042,12 +16707,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -5258,7 +5259,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -16049,8 +16714,13 @@ reload_flag \
> +@@ -16102,8 +16767,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -5272,7 +5273,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -16060,12 +16730,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -16113,12 +16783,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -5288,7 +5289,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -16081,7 +16753,6 @@ no_undefined_flag \
> +@@ -16134,7 +16806,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -5296,7 +5297,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -16117,6 +16788,7 @@ module_cmds \
> +@@ -16170,6 +16841,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -5304,7 +5305,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16890,7 +17562,8 @@ $as_echo X"$file" |
> +@@ -16943,7 +17615,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -5314,7 +5315,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -16993,19 +17666,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -17046,19 +17719,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -5358,7 +5359,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -17035,6 +17731,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -17088,6 +17784,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -5371,7 +5372,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -17044,6 +17746,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -17097,6 +17799,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -5381,7 +5382,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -17158,12 +17863,12 @@ with_gcc=$GCC
> +@@ -17211,12 +17916,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -5397,7 +5398,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -17250,9 +17955,6 @@ inherit_rpath=$inherit_rpath
> +@@ -17303,9 +18008,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -5407,7 +5408,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -17268,6 +17970,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -17321,6 +18023,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -5417,7 +5418,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -17300,210 +18005,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -17353,210 +18058,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -5792,7 +5793,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
>     chmod +x "$ofile"
>   
>  diff --git a/gprof/configure b/gprof/configure
> -index c23692e5c3d..9f936a5b03d 100755
> +index 3cf41b79116..e5d57f52912 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -662,8 +662,11 @@ OTOOL
> @@ -7707,7 +7708,7 @@ index c23692e5c3d..9f936a5b03d 100755
>     chmod +x "$ofile"
>   
>  diff --git a/ld/configure b/ld/configure
> -index 811134a503b..f432f4637d0 100755
> +index 1c872c0db5f..fe938e6c99f 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -691,8 +691,11 @@ OTOOL
> @@ -7730,7 +7731,7 @@ index 811134a503b..f432f4637d0 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1512,6 +1516,8 @@ Optional Packages:
> +@@ -1520,6 +1524,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -7739,7 +7740,7 @@ index 811134a503b..f432f4637d0 100755
>     --with-lib-path=dir1:dir2...  set default LIB_PATH
>     --with-sysroot=DIR Search for usr/lib et al within DIR.
>     --with-system-zlib      use installed libz
> -@@ -5965,8 +5971,8 @@ esac
> +@@ -5973,8 +5979,8 @@ esac
>   
>   
>   
> @@ -7750,7 +7751,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   
> -@@ -6006,7 +6012,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -6014,7 +6020,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -7759,7 +7760,7 @@ index 811134a503b..f432f4637d0 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6692,8 +6698,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6700,8 +6706,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -7770,7 +7771,7 @@ index 811134a503b..f432f4637d0 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6742,6 +6748,80 @@ esac
> +@@ -6750,6 +6756,80 @@ esac
>   
>   
>   
> @@ -7851,7 +7852,7 @@ index 811134a503b..f432f4637d0 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6758,6 +6838,11 @@ case $reload_flag in
> +@@ -6766,6 +6846,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -7863,7 +7864,7 @@ index 811134a503b..f432f4637d0 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6926,7 +7011,8 @@ mingw* | pw32*)
> +@@ -6934,7 +7019,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -7873,7 +7874,7 @@ index 811134a503b..f432f4637d0 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -7080,6 +7166,21 @@ esac
> +@@ -7088,6 +7174,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -7895,7 +7896,7 @@ index 811134a503b..f432f4637d0 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -7095,9 +7196,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -7103,9 +7204,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -8060,7 +8061,7 @@ index 811134a503b..f432f4637d0 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -7113,7 +7367,7 @@ do
> +@@ -7121,7 +7375,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8069,7 +8070,7 @@ index 811134a503b..f432f4637d0 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7133,11 +7387,15 @@ $as_echo "no" >&6; }
> +@@ -7141,11 +7395,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -8088,7 +8089,7 @@ index 811134a503b..f432f4637d0 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -7153,7 +7411,7 @@ do
> +@@ -7161,7 +7419,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8097,7 +8098,7 @@ index 811134a503b..f432f4637d0 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7172,6 +7430,10 @@ else
> +@@ -7180,6 +7438,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -8108,7 +8109,7 @@ index 811134a503b..f432f4637d0 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -7183,12 +7445,12 @@ ac_tool_warned=yes ;;
> +@@ -7191,12 +7453,12 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -8125,7 +8126,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   
> -@@ -7198,6 +7460,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
> +@@ -7206,6 +7468,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>   
>   
>   
> @@ -8188,7 +8189,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   if test -n "$ac_tool_prefix"; then
> -@@ -7534,8 +7852,8 @@ esac
> +@@ -7542,8 +7860,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -8199,7 +8200,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7571,6 +7889,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7579,6 +7897,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -8207,7 +8208,7 @@ index 811134a503b..f432f4637d0 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7612,6 +7931,18 @@ _LT_EOF
> +@@ -7620,6 +7939,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -8226,7 +8227,7 @@ index 811134a503b..f432f4637d0 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7623,7 +7954,7 @@ _LT_EOF
> +@@ -7631,7 +7962,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -8235,7 +8236,7 @@ index 811134a503b..f432f4637d0 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7649,8 +7980,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7657,8 +7988,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -8246,7 +8247,7 @@ index 811134a503b..f432f4637d0 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7660,8 +7991,8 @@ _LT_EOF
> +@@ -7668,8 +7999,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -8257,7 +8258,7 @@ index 811134a503b..f432f4637d0 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7698,6 +8029,19 @@ else
> +@@ -7706,6 +8037,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -8277,7 +8278,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   
> -@@ -7714,6 +8058,42 @@ fi
> +@@ -7722,6 +8066,42 @@ fi
>   
>   
>   
> @@ -8320,7 +8321,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   
> -@@ -7925,6 +8305,123 @@ esac
> +@@ -7933,6 +8313,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -8444,7 +8445,7 @@ index 811134a503b..f432f4637d0 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8488,6 +8985,8 @@ _LT_EOF
> +@@ -8496,6 +8993,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -8453,7 +8454,7 @@ index 811134a503b..f432f4637d0 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8556,6 +9055,16 @@ done
> +@@ -8564,6 +9063,16 @@ done
>   
>   
>   
> @@ -8470,7 +8471,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   # Set options
> -@@ -8684,7 +9193,8 @@ fi
> +@@ -8692,7 +9201,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -8480,7 +8481,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   
>   
> -@@ -8773,7 +9283,7 @@ aix3*)
> +@@ -8781,7 +9291,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -8489,7 +8490,7 @@ index 811134a503b..f432f4637d0 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -9071,8 +9581,6 @@ fi
> +@@ -9079,8 +9589,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -8498,7 +8499,7 @@ index 811134a503b..f432f4637d0 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -9238,6 +9746,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -9246,6 +9754,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -8511,7 +8512,7 @@ index 811134a503b..f432f4637d0 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -9300,7 +9814,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -9308,7 +9822,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -8520,7 +8521,7 @@ index 811134a503b..f432f4637d0 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -9357,13 +9871,17 @@ case $host_os in
> +@@ -9365,13 +9879,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -8544,7 +8545,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -9424,6 +9942,11 @@ fi
> +@@ -9432,6 +9950,11 @@ fi
>   
>   
>   
> @@ -8556,7 +8557,7 @@ index 811134a503b..f432f4637d0 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9774,7 +10297,8 @@ _LT_EOF
> +@@ -9782,7 +10305,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -8566,7 +8567,7 @@ index 811134a503b..f432f4637d0 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9873,12 +10397,12 @@ _LT_EOF
> +@@ -9881,12 +10405,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -8581,7 +8582,7 @@ index 811134a503b..f432f4637d0 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9892,8 +10416,8 @@ _LT_EOF
> +@@ -9900,8 +10424,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -8592,7 +8593,7 @@ index 811134a503b..f432f4637d0 100755
>         fi
>         ;;
>   
> -@@ -9911,8 +10435,8 @@ _LT_EOF
> +@@ -9919,8 +10443,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8603,7 +8604,7 @@ index 811134a503b..f432f4637d0 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9958,8 +10482,8 @@ _LT_EOF
> +@@ -9966,8 +10490,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -8614,7 +8615,7 @@ index 811134a503b..f432f4637d0 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -10089,7 +10613,13 @@ _LT_EOF
> +@@ -10097,7 +10621,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -8629,7 +8630,7 @@ index 811134a503b..f432f4637d0 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -10102,22 +10632,29 @@ main ()
> +@@ -10110,22 +10640,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -8672,7 +8673,7 @@ index 811134a503b..f432f4637d0 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -10129,7 +10666,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10137,7 +10674,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -8687,7 +8688,7 @@ index 811134a503b..f432f4637d0 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -10142,22 +10685,29 @@ main ()
> +@@ -10150,22 +10693,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -8730,7 +8731,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -10201,21 +10751,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10209,21 +10759,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # When not using gcc, we currently assume that we are using
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
> @@ -8810,7 +8811,7 @@ index 811134a503b..f432f4637d0 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -10276,7 +10869,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10284,7 +10877,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -8819,7 +8820,7 @@ index 811134a503b..f432f4637d0 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -10284,7 +10877,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10292,7 +10885,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -8828,7 +8829,7 @@ index 811134a503b..f432f4637d0 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -10300,7 +10893,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10308,7 +10901,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -8837,7 +8838,7 @@ index 811134a503b..f432f4637d0 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -10324,10 +10917,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -10332,10 +10925,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -8850,7 +8851,7 @@ index 811134a503b..f432f4637d0 100755
>   	  ;;
>   	esac
>         else
> -@@ -10406,23 +10999,36 @@ fi
> +@@ -10414,23 +11007,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -8895,7 +8896,7 @@ index 811134a503b..f432f4637d0 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -10507,7 +11113,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10515,7 +11121,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -8904,7 +8905,7 @@ index 811134a503b..f432f4637d0 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10526,9 +11132,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10534,9 +11140,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -8916,7 +8917,7 @@ index 811134a503b..f432f4637d0 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -11104,8 +11710,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11112,8 +11718,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -8928,7 +8929,7 @@ index 811134a503b..f432f4637d0 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -11138,13 +11745,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -11146,13 +11753,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9001,7 +9002,7 @@ index 811134a503b..f432f4637d0 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -11236,7 +11901,7 @@ haiku*)
> +@@ -11244,7 +11909,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -9010,16 +9011,16 @@ index 811134a503b..f432f4637d0 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -12032,7 +12697,7 @@ else
> +@@ -12040,7 +12705,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12035 "configure"
> +-#line 12040 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -12076,10 +12741,10 @@ else
> +@@ -12084,10 +12749,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9032,16 +9033,16 @@ index 811134a503b..f432f4637d0 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12138,7 +12803,7 @@ else
> +@@ -12146,7 +12811,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12141 "configure"
> +-#line 12146 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -12182,10 +12847,10 @@ else
> +@@ -12190,10 +12855,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -9054,7 +9055,7 @@ index 811134a503b..f432f4637d0 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12577,6 +13242,7 @@ $RM -r conftest*
> +@@ -12585,6 +13250,7 @@ $RM -r conftest*
>   
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=$CC
> @@ -9062,7 +9063,7 @@ index 811134a503b..f432f4637d0 100755
>     lt_save_LD=$LD
>     lt_save_GCC=$GCC
>     GCC=$GXX
> -@@ -12594,6 +13260,7 @@ $RM -r conftest*
> +@@ -12602,6 +13268,7 @@ $RM -r conftest*
>     fi
>     test -z "${LDCXX+set}" || LD=$LDCXX
>     CC=${CXX-"c++"}
> @@ -9070,7 +9071,7 @@ index 811134a503b..f432f4637d0 100755
>     compiler=$CC
>     compiler_CXX=$CC
>     for cc_temp in $compiler""; do
> -@@ -12876,7 +13543,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -12884,7 +13551,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>             allow_undefined_flag_CXX='-berok'
>             # Determine the default libpath from the value encoded in an empty
>             # executable.
> @@ -9085,7 +9086,7 @@ index 811134a503b..f432f4637d0 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -12889,22 +13562,29 @@ main ()
> +@@ -12897,22 +13570,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>   
> @@ -9128,7 +9129,7 @@ index 811134a503b..f432f4637d0 100755
>   
>             hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>   
> -@@ -12917,7 +13597,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12925,7 +13605,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>             else
>   	    # Determine the default libpath from the value encoded in an
>   	    # empty executable.
> @@ -9143,7 +9144,7 @@ index 811134a503b..f432f4637d0 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -12930,22 +13616,29 @@ main ()
> +@@ -12938,22 +13624,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>   
> @@ -9186,7 +9187,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	    # Warning - without using the other run time loading flags,
> -@@ -12988,29 +13681,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -12996,29 +13689,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>           ;;
>   
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -9285,7 +9286,7 @@ index 811134a503b..f432f4637d0 100755
>         darwin* | rhapsody*)
>   
>   
> -@@ -13116,7 +13855,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13124,7 +13863,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>               ;;
>             *)
>               if test "$GXX" = yes; then
> @@ -9294,7 +9295,7 @@ index 811134a503b..f432f4637d0 100755
>               else
>                 # FIXME: insert proper C++ library support
>                 ld_shlibs_CXX=no
> -@@ -13187,10 +13926,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13195,10 +13934,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
>   	            ;;
>   	          ia64*)
> @@ -9307,7 +9308,7 @@ index 811134a503b..f432f4637d0 100755
>   	            ;;
>   	        esac
>   	      fi
> -@@ -13231,9 +13970,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13239,9 +13978,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>             *)
>   	    if test "$GXX" = yes; then
>   	      if test "$with_gnu_ld" = no; then
> @@ -9319,7 +9320,7 @@ index 811134a503b..f432f4637d0 100755
>   	      fi
>   	    fi
>   	    link_all_deplibs_CXX=yes
> -@@ -13303,20 +14042,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13311,20 +14050,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	      prelink_cmds_CXX='tpldir=Template.dir~
>   		rm -rf $tpldir~
>   		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
> @@ -9344,7 +9345,7 @@ index 811134a503b..f432f4637d0 100755
>   	      ;;
>   	    *) # Version 6 and above use weak symbols
>   	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
> -@@ -13511,7 +14250,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13519,7 +14258,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
>   		  ;;
>   	        *)
> @@ -9353,7 +9354,7 @@ index 811134a503b..f432f4637d0 100755
>   		  ;;
>   	      esac
>   
> -@@ -13557,7 +14296,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13565,7 +14304,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>         solaris*)
>           case $cc_basename in
> @@ -9362,7 +9363,7 @@ index 811134a503b..f432f4637d0 100755
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>               archive_cmds_need_lc_CXX=yes
>   	    no_undefined_flag_CXX=' -zdefs'
> -@@ -13598,9 +14337,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -13606,9 +14345,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>   	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
>   	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -9374,7 +9375,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   	        # Commands to make compiler produce verbose output that lists
>   	        # what "hidden" libraries, object files and flags are used when
> -@@ -13735,6 +14474,13 @@ private:
> +@@ -13743,6 +14482,13 @@ private:
>   };
>   _LT_EOF
>   
> @@ -9388,7 +9389,7 @@ index 811134a503b..f432f4637d0 100755
>   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     (eval $ac_compile) 2>&5
>     ac_status=$?
> -@@ -13748,7 +14494,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13756,7 +14502,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     pre_test_object_deps_done=no
>   
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -9397,7 +9398,7 @@ index 811134a503b..f432f4637d0 100755
>   
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -13757,13 +14503,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13765,13 +14511,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>             test $p = "-R"; then
>   	 prev=$p
>   	 continue
> @@ -9424,7 +9425,7 @@ index 811134a503b..f432f4637d0 100755
>   	   # Internal compiler library paths should come after those
>   	   # provided the user.  The postdeps already come after the
>   	   # user supplied libs so there is no need to process them.
> -@@ -13783,8 +14538,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
> +@@ -13791,8 +14546,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>   	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
>   	 fi
>          fi
> @@ -9435,7 +9436,7 @@ index 811134a503b..f432f4637d0 100755
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -13820,6 +14577,7 @@ else
> +@@ -13828,6 +14585,7 @@ else
>   fi
>   
>   $RM -f confest.$objext
> @@ -9443,7 +9444,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   # PORTME: override above test on systems where it is broken
>   case $host_os in
> -@@ -13855,7 +14613,7 @@ linux*)
> +@@ -13863,7 +14621,7 @@ linux*)
>   
>   solaris*)
>     case $cc_basename in
> @@ -9452,7 +9453,7 @@ index 811134a503b..f432f4637d0 100755
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -13920,8 +14678,6 @@ fi
> +@@ -13928,8 +14686,6 @@ fi
>   lt_prog_compiler_pic_CXX=
>   lt_prog_compiler_static_CXX=
>   
> @@ -9461,7 +9462,7 @@ index 811134a503b..f432f4637d0 100755
>   
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" = yes; then
> -@@ -14026,6 +14782,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -14034,6 +14790,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	  ;;
>   	esac
>   	;;
> @@ -9473,7 +9474,7 @@ index 811134a503b..f432f4637d0 100755
>         dgux*)
>   	case $cc_basename in
>   	  ec++*)
> -@@ -14178,7 +14939,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -14186,7 +14947,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	;;
>         solaris*)
>   	case $cc_basename in
> @@ -9482,7 +9483,7 @@ index 811134a503b..f432f4637d0 100755
>   	    # Sun C++ 4.2, 5.x and Centerline C++
>   	    lt_prog_compiler_pic_CXX='-KPIC'
>   	    lt_prog_compiler_static_CXX='-Bstatic'
> -@@ -14243,10 +15004,17 @@ case $host_os in
> +@@ -14251,10 +15012,17 @@ case $host_os in
>       lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
>       ;;
>   esac
> @@ -9503,7 +9504,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -14304,6 +15072,8 @@ fi
> +@@ -14312,6 +15080,8 @@ fi
>   
>   
>   
> @@ -9512,7 +9513,7 @@ index 811134a503b..f432f4637d0 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -14481,6 +15251,7 @@ fi
> +@@ -14489,6 +15259,7 @@ fi
>   $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
>   
>     export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -9520,7 +9521,7 @@ index 811134a503b..f432f4637d0 100755
>     case $host_os in
>     aix[4-9]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -14495,15 +15266,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
> +@@ -14503,15 +15274,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
>       ;;
>     pw32*)
>       export_symbols_cmds_CXX="$ltdll_cmds"
> @@ -9546,7 +9547,7 @@ index 811134a503b..f432f4637d0 100755
>   
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
>   $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14766,8 +15542,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14774,8 +15550,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -9558,7 +9559,7 @@ index 811134a503b..f432f4637d0 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -14799,13 +15576,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -14807,13 +15584,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9631,7 +9632,7 @@ index 811134a503b..f432f4637d0 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -14896,7 +15731,7 @@ haiku*)
> +@@ -14904,7 +15739,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -9640,7 +9641,7 @@ index 811134a503b..f432f4637d0 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -15355,6 +16190,7 @@ fi
> +@@ -15363,6 +16198,7 @@ fi
>     fi # test -n "$compiler"
>   
>     CC=$lt_save_CC
> @@ -9648,7 +9649,7 @@ index 811134a503b..f432f4637d0 100755
>     LDCXX=$LD
>     LD=$lt_save_LD
>     GCC=$lt_save_GCC
> -@@ -18477,13 +19313,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -18554,13 +19390,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -9669,7 +9670,7 @@ index 811134a503b..f432f4637d0 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -18498,14 +19341,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -18575,14 +19418,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -9688,7 +9689,7 @@ index 811134a503b..f432f4637d0 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -18538,12 +19384,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -18615,12 +19461,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -9702,7 +9703,7 @@ index 811134a503b..f432f4637d0 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -18582,8 +19428,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
> +@@ -18659,8 +19505,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>   compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
>   GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9712,7 +9713,7 @@ index 811134a503b..f432f4637d0 100755
>   lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
>   archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -18610,12 +19456,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
> +@@ -18687,12 +19533,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>   hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -9726,7 +9727,7 @@ index 811134a503b..f432f4637d0 100755
>   file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
>   hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
>   compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
> -@@ -18653,8 +19499,13 @@ reload_flag \
> +@@ -18730,8 +19576,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -9740,7 +9741,7 @@ index 811134a503b..f432f4637d0 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -18664,12 +19515,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -18741,12 +19592,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -9756,7 +9757,7 @@ index 811134a503b..f432f4637d0 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -18685,7 +19538,6 @@ no_undefined_flag \
> +@@ -18762,7 +19615,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -9764,7 +9765,7 @@ index 811134a503b..f432f4637d0 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -18707,8 +19559,8 @@ LD_CXX \
> +@@ -18784,8 +19636,8 @@ LD_CXX \
>   reload_flag_CXX \
>   compiler_CXX \
>   lt_prog_compiler_no_builtin_flag_CXX \
> @@ -9774,7 +9775,7 @@ index 811134a503b..f432f4637d0 100755
>   lt_prog_compiler_static_CXX \
>   lt_cv_prog_compiler_c_o_CXX \
>   export_dynamic_flag_spec_CXX \
> -@@ -18720,7 +19572,6 @@ no_undefined_flag_CXX \
> +@@ -18797,7 +19649,6 @@ no_undefined_flag_CXX \
>   hardcode_libdir_flag_spec_CXX \
>   hardcode_libdir_flag_spec_ld_CXX \
>   hardcode_libdir_separator_CXX \
> @@ -9782,7 +9783,7 @@ index 811134a503b..f432f4637d0 100755
>   exclude_expsyms_CXX \
>   include_expsyms_CXX \
>   file_list_spec_CXX \
> -@@ -18754,6 +19605,7 @@ module_cmds \
> +@@ -18831,6 +19682,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -9790,7 +9791,7 @@ index 811134a503b..f432f4637d0 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18768,7 +19620,8 @@ archive_expsym_cmds_CXX \
> +@@ -18845,7 +19697,8 @@ archive_expsym_cmds_CXX \
>   module_cmds_CXX \
>   module_expsym_cmds_CXX \
>   export_symbols_cmds_CXX \
> @@ -9800,7 +9801,7 @@ index 811134a503b..f432f4637d0 100755
>       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>       *[\\\\\\\`\\"\\\$]*)
>         eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -19533,7 +20386,8 @@ $as_echo X"$file" |
> +@@ -19610,7 +20463,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -9810,7 +9811,7 @@ index 811134a503b..f432f4637d0 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -19636,19 +20490,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -19713,19 +20567,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -9854,7 +9855,7 @@ index 811134a503b..f432f4637d0 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -19678,6 +20555,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -19755,6 +20632,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -9867,7 +9868,7 @@ index 811134a503b..f432f4637d0 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -19687,6 +20570,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -19764,6 +20647,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -9877,7 +9878,7 @@ index 811134a503b..f432f4637d0 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -19801,12 +20687,12 @@ with_gcc=$GCC
> +@@ -19878,12 +20764,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -9893,7 +9894,7 @@ index 811134a503b..f432f4637d0 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -19893,9 +20779,6 @@ inherit_rpath=$inherit_rpath
> +@@ -19970,9 +20856,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -9903,7 +9904,7 @@ index 811134a503b..f432f4637d0 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -19911,6 +20794,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -19988,6 +20871,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -9913,7 +9914,7 @@ index 811134a503b..f432f4637d0 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -19957,210 +20843,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -20034,210 +20920,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -10287,7 +10288,7 @@ index 811134a503b..f432f4637d0 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> -@@ -20188,12 +21033,12 @@ with_gcc=$GCC_CXX
> +@@ -20265,12 +21110,12 @@ with_gcc=$GCC_CXX
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
>   
> @@ -10303,7 +10304,7 @@ index 811134a503b..f432f4637d0 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static_CXX
>   
> -@@ -20280,9 +21125,6 @@ inherit_rpath=$inherit_rpath_CXX
> +@@ -20357,9 +21202,6 @@ inherit_rpath=$inherit_rpath_CXX
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs_CXX
>   
> @@ -10313,7 +10314,7 @@ index 811134a503b..f432f4637d0 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols_CXX
>   
> -@@ -20298,6 +21140,9 @@ include_expsyms=$lt_include_expsyms_CXX
> +@@ -20375,6 +21217,9 @@ include_expsyms=$lt_include_expsyms_CXX
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds_CXX
>   
> @@ -10324,7 +10325,7 @@ index 811134a503b..f432f4637d0 100755
>   file_list_spec=$lt_file_list_spec_CXX
>   
>  diff --git a/libctf/configure b/libctf/configure
> -index e5493b31691..9977e4f7a42 100755
> +index 1dc1b65fac3..c5c2f36bbc0 100755
>  --- a/libctf/configure
>  +++ b/libctf/configure
>  @@ -663,6 +663,8 @@ OTOOL
> @@ -10336,7 +10337,7 @@ index e5493b31691..9977e4f7a42 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -778,6 +780,7 @@ enable_static
> +@@ -790,6 +792,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -10344,7 +10345,7 @@ index e5493b31691..9977e4f7a42 100755
>   enable_libtool_lock
>   enable_largefile
>   enable_werror_always
> -@@ -1436,6 +1439,8 @@ Optional Packages:
> +@@ -1448,6 +1451,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> @@ -10353,7 +10354,7 @@ index e5493b31691..9977e4f7a42 100755
>     --with-system-zlib      use installed libz
>   
>   Some influential environment variables:
> -@@ -5324,8 +5329,8 @@ esac
> +@@ -5406,8 +5411,8 @@ esac
>   
>   
>   
> @@ -10364,7 +10365,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   
>   
> -@@ -5436,7 +5441,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5518,7 +5523,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -10373,7 +10374,7 @@ index e5493b31691..9977e4f7a42 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6122,8 +6127,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> +@@ -6204,8 +6209,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -10384,7 +10385,7 @@ index e5493b31691..9977e4f7a42 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6172,6 +6177,80 @@ esac
> +@@ -6254,6 +6259,80 @@ esac
>   
>   
>   
> @@ -10465,7 +10466,7 @@ index e5493b31691..9977e4f7a42 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6188,6 +6267,11 @@ case $reload_flag in
> +@@ -6270,6 +6349,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -10477,7 +10478,7 @@ index e5493b31691..9977e4f7a42 100755
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> -@@ -6356,7 +6440,8 @@ mingw* | pw32*)
> +@@ -6438,7 +6522,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -10487,7 +10488,7 @@ index e5493b31691..9977e4f7a42 100755
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6510,6 +6595,21 @@ esac
> +@@ -6592,6 +6677,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -10509,7 +10510,7 @@ index e5493b31691..9977e4f7a42 100755
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -6525,9 +6625,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -6607,9 +6707,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
>   
>   
>   
> @@ -10674,7 +10675,7 @@ index e5493b31691..9977e4f7a42 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6543,7 +6796,7 @@ do
> +@@ -6625,7 +6878,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10683,7 +10684,7 @@ index e5493b31691..9977e4f7a42 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6563,11 +6816,15 @@ $as_echo "no" >&6; }
> +@@ -6645,11 +6898,15 @@ $as_echo "no" >&6; }
>   fi
>   
>   
> @@ -10702,7 +10703,7 @@ index e5493b31691..9977e4f7a42 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6583,7 +6840,7 @@ do
> +@@ -6665,7 +6922,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10711,7 +10712,7 @@ index e5493b31691..9977e4f7a42 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -6602,6 +6859,10 @@ else
> +@@ -6684,6 +6941,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>   
> @@ -10722,7 +10723,7 @@ index e5493b31691..9977e4f7a42 100755
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -6613,16 +6874,72 @@ ac_tool_warned=yes ;;
> +@@ -6695,16 +6956,72 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -10799,7 +10800,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   
>   
> -@@ -6964,8 +7281,8 @@ esac
> +@@ -7046,8 +7363,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>   
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -10810,7 +10811,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7001,6 +7318,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7083,6 +7400,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -10818,7 +10819,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7042,6 +7360,18 @@ _LT_EOF
> +@@ -7124,6 +7442,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>   	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>   	  cat <<_LT_EOF > conftest.$ac_ext
> @@ -10837,7 +10838,7 @@ index e5493b31691..9977e4f7a42 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7053,7 +7383,7 @@ _LT_EOF
> +@@ -7135,7 +7465,7 @@ _LT_EOF
>   	  cat <<_LT_EOF >> conftest.$ac_ext
>   
>   /* The mapping between symbol names and symbols.  */
> @@ -10846,7 +10847,7 @@ index e5493b31691..9977e4f7a42 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7079,8 +7409,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7161,8 +7491,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>   	  # Now try linking the two files.
>   	  mv conftest.$ac_objext conftstm.$ac_objext
> @@ -10857,7 +10858,7 @@ index e5493b31691..9977e4f7a42 100755
>   	  LIBS="conftstm.$ac_objext"
>   	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>   	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> -@@ -7090,8 +7420,8 @@ _LT_EOF
> +@@ -7172,8 +7502,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>   	    pipe_works=yes
>   	  fi
> @@ -10868,7 +10869,7 @@ index e5493b31691..9977e4f7a42 100755
>   	else
>   	  echo "cannot find nm_test_func in $nlist" >&5
>   	fi
> -@@ -7128,6 +7458,16 @@ else
> +@@ -7210,6 +7540,16 @@ else
>   $as_echo "ok" >&6; }
>   fi
>   
> @@ -10885,7 +10886,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   
>   
> -@@ -7144,6 +7484,45 @@ fi
> +@@ -7226,6 +7566,45 @@ fi
>   
>   
>   
> @@ -10931,7 +10932,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   
>   
> -@@ -7355,6 +7734,123 @@ esac
> +@@ -7437,6 +7816,123 @@ esac
>   
>   need_locks="$enable_libtool_lock"
>   
> @@ -11055,7 +11056,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7918,6 +8414,8 @@ _LT_EOF
> +@@ -8000,6 +8496,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -11064,7 +11065,7 @@ index e5493b31691..9977e4f7a42 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8083,7 +8581,8 @@ fi
> +@@ -8165,7 +8663,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>   
>   # Always use our own libtool.
> @@ -11074,7 +11075,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   
>   
> -@@ -8172,7 +8671,7 @@ aix3*)
> +@@ -8254,7 +8753,7 @@ aix3*)
>   esac
>   
>   # Global variables:
> @@ -11083,7 +11084,7 @@ index e5493b31691..9977e4f7a42 100755
>   can_build_shared=yes
>   
>   # All known linkers require a `.a' archive for static linking (except MSVC,
> -@@ -8470,8 +8969,6 @@ fi
> +@@ -8552,8 +9051,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>   
> @@ -11092,7 +11093,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -8637,6 +9134,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8719,6 +9216,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>   	lt_prog_compiler_pic='--shared'
>   	lt_prog_compiler_static='--static'
>   	;;
> @@ -11105,7 +11106,7 @@ index e5493b31691..9977e4f7a42 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>   	# which looks to be a dead project)
> -@@ -8699,7 +9202,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +@@ -8781,7 +9284,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -11114,7 +11115,7 @@ index e5493b31691..9977e4f7a42 100755
>   	lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>   	lt_prog_compiler_wl='-Wl,';;
> -@@ -8756,13 +9259,17 @@ case $host_os in
> +@@ -8838,13 +9341,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -11138,7 +11139,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8823,6 +9330,11 @@ fi
> +@@ -8905,6 +9412,11 @@ fi
>   
>   
>   
> @@ -11150,7 +11151,7 @@ index e5493b31691..9977e4f7a42 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9173,7 +9685,8 @@ _LT_EOF
> +@@ -9255,7 +9767,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -11160,7 +11161,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> -@@ -9272,12 +9785,12 @@ _LT_EOF
> +@@ -9354,12 +9867,12 @@ _LT_EOF
>   	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
>   	  hardcode_libdir_flag_spec=
>   	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -11175,7 +11176,7 @@ index e5493b31691..9977e4f7a42 100755
>   	  fi
>   	  ;;
>   	esac
> -@@ -9291,8 +9804,8 @@ _LT_EOF
> +@@ -9373,8 +9886,8 @@ _LT_EOF
>   	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
>   	wlarc=
>         else
> @@ -11186,7 +11187,7 @@ index e5493b31691..9977e4f7a42 100755
>         fi
>         ;;
>   
> -@@ -9310,8 +9823,8 @@ _LT_EOF
> +@@ -9392,8 +9905,8 @@ _LT_EOF
>   
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -11197,7 +11198,7 @@ index e5493b31691..9977e4f7a42 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9357,8 +9870,8 @@ _LT_EOF
> +@@ -9439,8 +9952,8 @@ _LT_EOF
>   
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> @@ -11208,7 +11209,7 @@ index e5493b31691..9977e4f7a42 100755
>         else
>   	ld_shlibs=no
>         fi
> -@@ -9488,7 +10001,13 @@ _LT_EOF
> +@@ -9570,7 +10083,13 @@ _LT_EOF
>   	allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -11223,7 +11224,7 @@ index e5493b31691..9977e4f7a42 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9501,22 +10020,29 @@ main ()
> +@@ -9583,22 +10102,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -11266,7 +11267,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9528,7 +10054,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9610,7 +10136,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	else
>   	 # Determine the default libpath from the value encoded in an
>   	 # empty executable.
> @@ -11281,7 +11282,7 @@ index e5493b31691..9977e4f7a42 100755
>   /* end confdefs.h.  */
>   
>   int
> -@@ -9541,22 +10073,29 @@ main ()
> +@@ -9623,22 +10155,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>   
> @@ -11324,7 +11325,7 @@ index e5493b31691..9977e4f7a42 100755
>   
>   	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>   	  # Warning - without using the other run time loading flags,
> -@@ -9601,20 +10140,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9683,20 +10222,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -11402,7 +11403,7 @@ index e5493b31691..9977e4f7a42 100755
>         ;;
>   
>       darwin* | rhapsody*)
> -@@ -9675,7 +10257,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9757,7 +10339,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -11411,7 +11412,7 @@ index e5493b31691..9977e4f7a42 100755
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -9683,7 +10265,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9765,7 +10347,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -11420,7 +11421,7 @@ index e5493b31691..9977e4f7a42 100755
>         else
>   	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9699,7 +10281,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9781,7 +10363,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -11429,7 +11430,7 @@ index e5493b31691..9977e4f7a42 100755
>         else
>   	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -9723,10 +10305,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +@@ -9805,10 +10387,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
>   	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
>   	  ;;
>   	ia64*)
> @@ -11442,7 +11443,7 @@ index e5493b31691..9977e4f7a42 100755
>   	  ;;
>   	esac
>         else
> -@@ -9805,23 +10387,36 @@ fi
> +@@ -9887,23 +10469,36 @@ fi
>   
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -11487,7 +11488,7 @@ index e5493b31691..9977e4f7a42 100755
>         else
>   	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>   	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> -@@ -9906,7 +10501,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9988,7 +10583,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)	# as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>   	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -11496,7 +11497,7 @@ index e5493b31691..9977e4f7a42 100755
>   	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>   	allow_undefined_flag=' -expect_unresolved \*'
> -@@ -9925,9 +10520,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10007,9 +10602,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>   	wlarc='${wl}'
> @@ -11508,7 +11509,7 @@ index e5493b31691..9977e4f7a42 100755
>         else
>   	case `$CC -V 2>&1` in
>   	*"Compilers 5.0"*)
> -@@ -10503,8 +11098,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10585,8 +11180,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>   
> @@ -11520,7 +11521,7 @@ index e5493b31691..9977e4f7a42 100755
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -10537,13 +11133,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10619,13 +11215,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -11593,7 +11594,7 @@ index e5493b31691..9977e4f7a42 100755
>     # FIXME: first we should search . and the directory the executable is in
>     shlibpath_var=PATH
>     ;;
> -@@ -10635,7 +11289,7 @@ haiku*)
> +@@ -10717,7 +11371,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -11602,16 +11603,16 @@ index e5493b31691..9977e4f7a42 100755
>     hardcode_into_libs=yes
>     ;;
>   
> -@@ -11431,7 +12085,7 @@ else
> +@@ -11513,7 +12167,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11434 "configure"
> +-#line 11516 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11475,10 +12129,10 @@ else
> +@@ -11557,10 +12211,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -11624,16 +11625,16 @@ index e5493b31691..9977e4f7a42 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11537,7 +12191,7 @@ else
> +@@ -11619,7 +12273,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11540 "configure"
> +-#line 11622 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>   
>   #if HAVE_DLFCN_H
> -@@ -11581,10 +12235,10 @@ else
> +@@ -11663,10 +12317,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> @@ -11646,7 +11647,7 @@ index e5493b31691..9977e4f7a42 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13994,13 +14648,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> +@@ -14110,13 +14764,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -11667,7 +11668,7 @@ index e5493b31691..9977e4f7a42 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> -@@ -14015,14 +14676,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -14131,14 +14792,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> @@ -11686,7 +11687,7 @@ index e5493b31691..9977e4f7a42 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14055,12 +14719,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -14171,12 +14835,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> @@ -11700,7 +11701,7 @@ index e5493b31691..9977e4f7a42 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> -@@ -14115,8 +14779,13 @@ reload_flag \
> +@@ -14231,8 +14895,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -11714,7 +11715,7 @@ index e5493b31691..9977e4f7a42 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -14126,12 +14795,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14242,12 +14911,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -11730,7 +11731,7 @@ index e5493b31691..9977e4f7a42 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -14147,7 +14818,6 @@ no_undefined_flag \
> +@@ -14263,7 +14934,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -11738,7 +11739,7 @@ index e5493b31691..9977e4f7a42 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -14183,6 +14853,7 @@ module_cmds \
> +@@ -14299,6 +14969,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -11746,7 +11747,7 @@ index e5493b31691..9977e4f7a42 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -14939,7 +15610,8 @@ $as_echo X"$file" |
> +@@ -15055,7 +15726,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -11756,7 +11757,7 @@ index e5493b31691..9977e4f7a42 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15042,19 +15714,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -15158,19 +15830,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>   
> @@ -11800,7 +11801,7 @@ index e5493b31691..9977e4f7a42 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>   
> -@@ -15084,6 +15779,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -15200,6 +15895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>   
> @@ -11813,7 +11814,7 @@ index e5493b31691..9977e4f7a42 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>   
> -@@ -15093,6 +15794,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -15209,6 +15910,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>   
> @@ -11823,7 +11824,7 @@ index e5493b31691..9977e4f7a42 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>   
> -@@ -15207,12 +15911,12 @@ with_gcc=$GCC
> +@@ -15323,12 +16027,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>   
> @@ -11839,7 +11840,7 @@ index e5493b31691..9977e4f7a42 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>   
> -@@ -15299,9 +16003,6 @@ inherit_rpath=$inherit_rpath
> +@@ -15415,9 +16119,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency libraries.
>   link_all_deplibs=$link_all_deplibs
>   
> @@ -11849,7 +11850,7 @@ index e5493b31691..9977e4f7a42 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>   
> -@@ -15317,6 +16018,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -15433,6 +16134,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with templates.
>   prelink_cmds=$lt_prelink_cmds
>   
> @@ -11859,7 +11860,7 @@ index e5493b31691..9977e4f7a42 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>   
> -@@ -15349,210 +16053,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -15465,210 +16169,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -19317,7 +19318,7 @@ index bf92b5e0790..c573da90c5c 100644
>   # These exist entirely to fool aclocal when bootstrapping libtool.
>   #
>  diff --git a/opcodes/configure b/opcodes/configure
> -index 4723dcdc1e8..006ccdaa458 100755
> +index 8d1e561c942..a0291dfbfa7 100755
>  --- a/opcodes/configure
>  +++ b/opcodes/configure
>  @@ -680,6 +680,9 @@ OTOOL
> @@ -21229,6 +21230,1924 @@ index 4723dcdc1e8..006ccdaa458 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   
> +diff --git a/zlib/configure b/zlib/configure
> +index de6fa7e9960..cce448b6a53 100755
> +--- a/zlib/configure
> ++++ b/zlib/configure
> +@@ -646,8 +646,11 @@ OTOOL
> + LIPO
> + NMEDIT
> + DSYMUTIL
> ++MANIFEST_TOOL
> + RANLIB
> ++ac_ct_AR
> + AR
> ++DLLTOOL
> + OBJDUMP
> + LN_S
> + NM
> +@@ -774,6 +777,7 @@ enable_static
> + with_pic
> + enable_fast_install
> + with_gnu_ld
> ++with_libtool_sysroot
> + enable_libtool_lock
> + enable_host_shared
> + '
> +@@ -1428,6 +1432,8 @@ Optional Packages:
> +   --with-pic              try to use only PIC/non-PIC objects [default=use
> +                           both]
> +   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
> ++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
> ++                        (or the compiler's sysroot if not specified).
> + 
> + Some influential environment variables:
> +   CC          C compiler command
> +@@ -4147,8 +4153,8 @@ esac
> + 
> + 
> + 
> +-macro_version='2.2.7a'
> +-macro_revision='1.3134'
> ++macro_version='2.4'
> ++macro_revision='1.3293'
> + 
> + 
> + 
> +@@ -4188,7 +4194,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
> + $as_echo_n "checking how to print strings... " >&6; }
> + # Test print first, because it will be a builtin if present.
> +-if test "X`print -r -- -n 2>/dev/null`" = X-n && \
> ++if test "X`( print -r -- -n ) 2>/dev/null`" = X-n && \
> +    test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
> +   ECHO='print -r --'
> + elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> +@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
> + # Try some XSI features
> + xsi_shell=no
> + ( _lt_dummy="a/b/c"
> +-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
> +-      = c,a/b,, \
> ++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%"$_lt_dummy"}, \
> ++      = c,a/b,b/c, \
> +     && eval 'test $(( 1 + 1 )) -eq 2 \
> +     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> +   && xsi_shell=yes
> +@@ -5054,6 +5060,80 @@ esac
> + 
> + 
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
> ++$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
> ++if ${lt_cv_to_host_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_w32
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=func_convert_file_cygwin_to_w32
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++  *-*-cygwin* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_cygwin
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=func_convert_file_noop
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_cygwin
> ++        ;;
> ++    esac
> ++    ;;
> ++  * ) # unhandled hosts (and "normal" native builds)
> ++    lt_cv_to_host_file_cmd=func_convert_file_noop
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_host_file_cmd=$lt_cv_to_host_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_cmd" >&5
> ++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
> ++$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
> ++if ${lt_cv_to_tool_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  #assume ordinary cross tools, or native build.
> ++lt_cv_to_tool_file_cmd=func_convert_file_noop
> ++case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_tool_file_cmd=func_convert_file_msys_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_cmd" >&5
> ++$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
> + $as_echo_n "checking for $LD option to reload object files... " >&6; }
> + if ${lt_cv_ld_reload_flag+:} false; then :
> +@@ -5070,6 +5150,11 @@ case $reload_flag in
> + esac
> + reload_cmds='$LD$reload_flag -o $output$reload_objs'
> + case $host_os in
> ++  cygwin* | mingw* | pw32* | cegcc*)
> ++    if test "$GCC" != yes; then
> ++      reload_cmds=false
> ++    fi
> ++    ;;
> +   darwin*)
> +     if test "$GCC" = yes; then
> +       reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
> +@@ -5238,7 +5323,8 @@ mingw* | pw32*)
> +     lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
> +     lt_cv_file_magic_cmd='func_win32_libid'
> +   else
> +-    lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
> ++    # Keep this pattern in sync with the one in func_win32_libid.
> ++    lt_cv_deplibs_check_method='file_magic file format (pei*-i386(.*architecture: i386)?|pe-arm-wince|pe-x86-64)'
> +     lt_cv_file_magic_cmd='$OBJDUMP -f'
> +   fi
> +   ;;
> +@@ -5392,6 +5478,21 @@ esac
> + fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
> + $as_echo "$lt_cv_deplibs_check_method" >&6; }
> ++
> ++file_magic_glob=
> ++want_nocaseglob=no
> ++if test "$build" = "$host"; then
> ++  case $host_os in
> ++  mingw* | pw32*)
> ++    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
> ++      want_nocaseglob=yes
> ++    else
> ++      file_magic_glob=`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
> ++    fi
> ++    ;;
> ++  esac
> ++fi
> ++
> + file_magic_cmd=$lt_cv_file_magic_cmd
> + deplibs_check_method=$lt_cv_deplibs_check_method
> + test -z "$deplibs_check_method" && deplibs_check_method=unknown
> +@@ -5405,11 +5506,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> + 
> + 
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
> ++  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
> ++set dummy ${ac_tool_prefix}dlltool; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$DLLTOOL"; then
> ++  ac_cv_prog_DLLTOOL="$DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++DLLTOOL=$ac_cv_prog_DLLTOOL
> ++if test -n "$DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
> ++$as_echo "$DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_DLLTOOL"; then
> ++  ac_ct_DLLTOOL=$DLLTOOL
> ++  # Extract the first word of "dlltool", so it can be a program name with args.
> ++set dummy dlltool; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_DLLTOOL"; then
> ++  ac_cv_prog_ac_ct_DLLTOOL="$ac_ct_DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_DLLTOOL=$ac_cv_prog_ac_ct_DLLTOOL
> ++if test -n "$ac_ct_DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >&5
> ++$as_echo "$ac_ct_DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_DLLTOOL" = x; then
> ++    DLLTOOL="false"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
> ++ac_tool_warned=yes ;;
> ++esac
> ++    DLLTOOL=$ac_ct_DLLTOOL
> ++  fi
> ++else
> ++  DLLTOOL="$ac_cv_prog_DLLTOOL"
> ++fi
> ++
> ++test -z "$DLLTOOL" && DLLTOOL=dlltool
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
> ++$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
> ++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_sharedlib_from_linklib_cmd='unknown'
> ++
> ++case $host_os in
> ++cygwin* | mingw* | pw32* | cegcc*)
> ++  # two different shell functions defined in ltmain.sh
> ++  # decide which to use based on capabilities of $DLLTOOL
> ++  case `$DLLTOOL --help 2>&1` in
> ++  *--identify-strict*)
> ++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib
> ++    ;;
> ++  *)
> ++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib_fallback
> ++    ;;
> ++  esac
> ++  ;;
> ++*)
> ++  # fallback: assume linklib IS sharedlib
> ++  lt_cv_sharedlib_from_linklib_cmd="$ECHO"
> ++  ;;
> ++esac
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_from_linklib_cmd" >&5
> ++$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
> ++sharedlib_from_linklib_cmd=$lt_cv_sharedlib_from_linklib_cmd
> ++test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=$ECHO
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++if test -n "$ac_tool_prefix"; then
> ++  for ac_prog in ar
> ++  do
> ++    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
> ++set dummy $ac_tool_prefix$ac_prog; ac_word=$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_AR+:} false; then :
> +@@ -5425,7 +5680,7 @@ do
> +   test -z "$as_dir" && as_dir=.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_AR="${ac_tool_prefix}ar"
> ++    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +     break 2
> +   fi
> +@@ -5445,11 +5700,15 @@ $as_echo "no" >&6; }
> + fi
> + 
> + 
> ++    test -n "$AR" && break
> ++  done
> + fi
> +-if test -z "$ac_cv_prog_AR"; then
> ++if test -z "$AR"; then
> +   ac_ct_AR=$AR
> +-  # Extract the first word of "ar", so it can be a program name with args.
> +-set dummy ar; ac_word=$2
> ++  for ac_prog in ar
> ++do
> ++  # Extract the first word of "$ac_prog", so it can be a program name with args.
> ++set dummy $ac_prog; ac_word=$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_ac_ct_AR+:} false; then :
> +@@ -5465,7 +5724,7 @@ do
> +   test -z "$as_dir" && as_dir=.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_ac_ct_AR="ar"
> ++    ac_cv_prog_ac_ct_AR="$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +     break 2
> +   fi
> +@@ -5484,6 +5743,10 @@ else
> + $as_echo "no" >&6; }
> + fi
> + 
> ++
> ++  test -n "$ac_ct_AR" && break
> ++done
> ++
> +   if test "x$ac_ct_AR" = x; then
> +     AR="false"
> +   else
> +@@ -5495,16 +5758,72 @@ ac_tool_warned=yes ;;
> + esac
> +     AR=$ac_ct_AR
> +   fi
> +-else
> +-  AR="$ac_cv_prog_AR"
> + fi
> + 
> +-test -z "$AR" && AR=ar
> +-test -z "$AR_FLAGS" && AR_FLAGS=cru
> ++: ${AR=ar}
> ++: ${AR_FLAGS=cru}
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
> ++$as_echo_n "checking for archiver @FILE support... " >&6; }
> ++if ${lt_cv_ar_at_file+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_ar_at_file=no
> ++   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++/* end confdefs.h.  */
> ++
> ++int
> ++main ()
> ++{
> + 
> ++  ;
> ++  return 0;
> ++}
> ++_ACEOF
> ++if ac_fn_c_try_compile "$LINENO"; then :
> ++  echo conftest.$ac_objext > conftest.lst
> ++      lt_ar_try='$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
> ++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> ++  test $ac_status = 0; }
> ++      if test "$ac_status" -eq 0; then
> ++	# Ensure the archiver fails upon bogus file names.
> ++	rm -f conftest.$ac_objext libconftest.a
> ++	{ { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> ++  test $ac_status = 0; }
> ++	if test "$ac_status" -ne 0; then
> ++          lt_cv_ar_at_file=@
> ++        fi
> ++      fi
> ++      rm -f conftest.* libconftest.a
> + 
> ++fi
> ++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> + 
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
> ++$as_echo "$lt_cv_ar_at_file" >&6; }
> + 
> ++if test "x$lt_cv_ar_at_file" = xno; then
> ++  archiver_list_spec=
> ++else
> ++  archiver_list_spec=$lt_cv_ar_at_file
> ++fi
> + 
> + 
> + 
> +@@ -5846,8 +6165,8 @@ esac
> + lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> + 
> + # Transform an extracted symbol line into symbol name and symbol address
> +-lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
> +-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> + 
> + # Handle CRLF in mingw tool chain
> + opt_cr=
> +@@ -5883,6 +6202,7 @@ for ac_symprfx in "" "_"; do
> +   else
> +     lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> +   fi
> ++  lt_cv_sys_global_symbol_pipe="$lt_cv_sys_global_symbol_pipe | sed '/ __gnu_lto/d'"
> + 
> +   # Check to see that the pipe works correctly.
> +   pipe_works=no
> +@@ -5924,6 +6244,18 @@ _LT_EOF
> +       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> + 	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> + 	  cat <<_LT_EOF > conftest.$ac_ext
> ++/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and tests.  */
> ++#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
> ++/* DATA imports from DLLs on WIN32 con't be const, because runtime
> ++   relocations are performed -- see ld's documentation on pseudo-relocs.  */
> ++# define LT_DLSYM_CONST
> ++#elif defined(__osf__)
> ++/* This system does not cope well with relocations in const data.  */
> ++# define LT_DLSYM_CONST
> ++#else
> ++# define LT_DLSYM_CONST const
> ++#endif
> ++
> + #ifdef __cplusplus
> + extern "C" {
> + #endif
> +@@ -5935,7 +6267,7 @@ _LT_EOF
> + 	  cat <<_LT_EOF >> conftest.$ac_ext
> + 
> + /* The mapping between symbol names and symbols.  */
> +-const struct {
> ++LT_DLSYM_CONST struct {
> +   const char *name;
> +   void       *address;
> + }
> +@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup() {
> + _LT_EOF
> + 	  # Now try linking the two files.
> + 	  mv conftest.$ac_objext conftstm.$ac_objext
> +-	  lt_save_LIBS="$LIBS"
> +-	  lt_save_CFLAGS="$CFLAGS"
> ++	  lt_globsym_save_LIBS=$LIBS
> ++	  lt_globsym_save_CFLAGS=$CFLAGS
> + 	  LIBS="conftstm.$ac_objext"
> + 	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
> + 	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
> +@@ -5972,8 +6304,8 @@ _LT_EOF
> +   test $ac_status = 0; } && test -s conftest${ac_exeext}; then
> + 	    pipe_works=yes
> + 	  fi
> +-	  LIBS="$lt_save_LIBS"
> +-	  CFLAGS="$lt_save_CFLAGS"
> ++	  LIBS=$lt_globsym_save_LIBS
> ++	  CFLAGS=$lt_globsym_save_CFLAGS
> + 	else
> + 	  echo "cannot find nm_test_func in $nlist" >&5
> + 	fi
> +@@ -6010,6 +6342,19 @@ else
> + $as_echo "ok" >&6; }
> + fi
> + 
> ++# Response file support.
> ++if test "$lt_cv_nm_interface" = "MS dumpbin"; then
> ++  nm_file_list_spec='@'
> ++elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
> ++  nm_file_list_spec='@'
> ++fi
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> + 
> + 
> + 
> +@@ -6027,6 +6372,41 @@ fi
> + 
> + 
> + 
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> ++$as_echo_n "checking for sysroot... " >&6; }
> ++
> ++# Check whether --with-libtool-sysroot was given.
> ++if test "${with_libtool_sysroot+set}" = set; then :
> ++  withval=$with_libtool_sysroot;
> ++else
> ++  with_libtool_sysroot=no
> ++fi
> ++
> ++
> ++lt_sysroot=
> ++case ${with_libtool_sysroot} in #(
> ++ yes)
> ++   if test "$GCC" = yes; then
> ++     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> ++   fi
> ++   ;; #(
> ++ /*)
> ++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> ++   ;; #(
> ++ no|'')
> ++   ;; #(
> ++ *)
> ++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
> ++$as_echo "${with_libtool_sysroot}" >&6; }
> ++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
> ++   ;;
> ++esac
> ++
> ++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
> ++$as_echo "${lt_sysroot:-no}" >&6; }
> + 
> + 
> + 
> +@@ -6241,6 +6621,123 @@ esac
> + 
> + need_locks="$enable_libtool_lock"
> + 
> ++if test -n "$ac_tool_prefix"; then
> ++  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
> ++set dummy ${ac_tool_prefix}mt; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$MANIFEST_TOOL"; then
> ++  ac_cv_prog_MANIFEST_TOOL="$MANIFEST_TOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++MANIFEST_TOOL=$ac_cv_prog_MANIFEST_TOOL
> ++if test -n "$MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >&5
> ++$as_echo "$MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
> ++  ac_ct_MANIFEST_TOOL=$MANIFEST_TOOL
> ++  # Extract the first word of "mt", so it can be a program name with args.
> ++set dummy mt; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  ac_cv_prog_ac_ct_MANIFEST_TOOL="$ac_ct_MANIFEST_TOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_MANIFEST_TOOL=$ac_cv_prog_ac_ct_MANIFEST_TOOL
> ++if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_TOOL" >&5
> ++$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_MANIFEST_TOOL" = x; then
> ++    MANIFEST_TOOL=":"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
> ++ac_tool_warned=yes ;;
> ++esac
> ++    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
> ++  fi
> ++else
> ++  MANIFEST_TOOL="$ac_cv_prog_MANIFEST_TOOL"
> ++fi
> ++
> ++test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
> ++$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
> ++if ${lt_cv_path_mainfest_tool+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_path_mainfest_tool=no
> ++  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
> ++  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
> ++  cat conftest.err >&5
> ++  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> ++    lt_cv_path_mainfest_tool=yes
> ++  fi
> ++  rm -f conftest*
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_tool" >&5
> ++$as_echo "$lt_cv_path_mainfest_tool" >&6; }
> ++if test "x$lt_cv_path_mainfest_tool" != xyes; then
> ++  MANIFEST_TOOL=:
> ++fi
> ++
> ++
> ++
> ++
> ++
> + 
> +   case $host_os in
> +     rhapsody* | darwin*)
> +@@ -6807,6 +7304,8 @@ _LT_EOF
> +       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> +       echo "$AR cru libconftest.a conftest.o" >&5
> +       $AR cru libconftest.a conftest.o 2>&5
> ++      echo "$RANLIB libconftest.a" >&5
> ++      $RANLIB libconftest.a 2>&5
> +       cat > conftest.c << _LT_EOF
> + int main() { return 0;}
> + _LT_EOF
> +@@ -7269,7 +7768,8 @@ fi
> + LIBTOOL_DEPS="$ltmain"
> + 
> + # Always use our own libtool.
> +-LIBTOOL='$(SHELL) $(top_builddir)/libtool'
> ++LIBTOOL='$(SHELL) $(top_builddir)'
> ++LIBTOOL="$LIBTOOL/${host_alias}-libtool"
> + 
> + 
> + 
> +@@ -7358,7 +7858,7 @@ aix3*)
> + esac
> + 
> + # Global variables:
> +-ofile=libtool
> ++ofile=${host_alias}-libtool
> + can_build_shared=yes
> + 
> + # All known linkers require a `.a' archive for static linking (except MSVC,
> +@@ -7656,8 +8156,6 @@ fi
> + lt_prog_compiler_pic=
> + lt_prog_compiler_static=
> + 
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 
> +   if test "$GCC" = yes; then
> +     lt_prog_compiler_wl='-Wl,'
> +@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> + 	lt_prog_compiler_pic='--shared'
> + 	lt_prog_compiler_static='--static'
> + 	;;
> ++      nagfor*)
> ++	# NAG Fortran compiler
> ++	lt_prog_compiler_wl='-Wl,-Wl,,'
> ++	lt_prog_compiler_pic='-PIC'
> ++	lt_prog_compiler_static='-Bstatic'
> ++	;;
> +       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> +         # Portland Group compilers (*not* the Pentium gcc compiler,
> + 	# which looks to be a dead project)
> +@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +       lt_prog_compiler_pic='-KPIC'
> +       lt_prog_compiler_static='-Bstatic'
> +       case $cc_basename in
> +-      f77* | f90* | f95*)
> ++      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
> + 	lt_prog_compiler_wl='-Qoption ld ';;
> +       *)
> + 	lt_prog_compiler_wl='-Wl,';;
> +@@ -7942,13 +8446,17 @@ case $host_os in
> +     lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
> +     ;;
> + esac
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic" >&5
> +-$as_echo "$lt_prog_compiler_pic" >&6; }
> +-
> +-
> +-
> +-
> + 
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
> ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> ++if ${lt_cv_prog_compiler_pic+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_pic" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic" >&6; }
> ++lt_prog_compiler_pic=$lt_cv_prog_compiler_pic
> + 
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -8009,6 +8517,11 @@ fi
> + 
> + 
> + 
> ++
> ++
> ++
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -8359,7 +8872,8 @@ _LT_EOF
> +       allow_undefined_flag=unsupported
> +       always_export_symbols=no
> +       enable_shared_with_static_runtimes=yes
> +-      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
> ++      exclude_expsyms='[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> + 
> +       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> +         archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
> +@@ -8458,12 +8972,12 @@ _LT_EOF
> + 	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
> + 	  hardcode_libdir_flag_spec=
> + 	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
> +-	  archive_cmds='$LD -shared $libobjs $deplibs $compiler_flags -soname $soname -o $lib'
> ++	  archive_cmds='$LD -shared $libobjs $deplibs $linker_flags -soname $soname -o $lib'
> + 	  if test "x$supports_anon_versioning" = xyes; then
> + 	    archive_expsym_cmds='echo "{ global:" > $output_objdir/$libname.ver~
> + 	      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
> + 	      echo "local: *; };" >> $output_objdir/$libname.ver~
> +-	      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
> ++	      $LD -shared $libobjs $deplibs $linker_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
> + 	  fi
> + 	  ;;
> + 	esac
> +@@ -8477,8 +8991,8 @@ _LT_EOF
> + 	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
> + 	wlarc=
> +       else
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       fi
> +       ;;
> + 
> +@@ -8496,8 +9010,8 @@ _LT_EOF
> + 
> + _LT_EOF
> +       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       else
> + 	ld_shlibs=no
> +       fi
> +@@ -8543,8 +9057,8 @@ _LT_EOF
> + 
> +     *)
> +       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> +-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
> ++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
> +       else
> + 	ld_shlibs=no
> +       fi
> +@@ -8674,7 +9188,13 @@ _LT_EOF
> + 	allow_undefined_flag='-berok'
> +         # Determine the default libpath from the value encoded in an
> +         # empty executable.
> +-        if test x$gcc_no_link = xyes; then
> ++        if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test x$gcc_no_link = xyes; then
> +   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
> + fi
> + cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +@@ -8690,22 +9210,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath_
> ++fi
> + 
> +         hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
> +         archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> +@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	else
> + 	 # Determine the default libpath from the value encoded in an
> + 	 # empty executable.
> +-	 if test x$gcc_no_link = xyes; then
> ++	 if test "${lt_cv_aix_libpath+set}" = set; then
> ++  aix_libpath=$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test x$gcc_no_link = xyes; then
> +   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
> + fi
> + cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +@@ -8733,22 +9266,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> + 
> +-lt_aix_libpath_sed='
> +-    /Import File Strings/,/^$/ {
> +-	/^0/ {
> +-	    s/^0  *\(.*\)$/\1/
> +-	    p
> +-	}
> +-    }'
> +-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed='
> ++      /Import File Strings/,/^$/ {
> ++	  /^0/ {
> ++	      s/^0  *\([^ ]*\) *$/\1/
> ++	      p
> ++	  }
> ++      }'
> ++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_="/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=$lt_cv_aix_libpath_
> ++fi
> + 
> + 	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
> + 	  # Warning - without using the other run time loading flags,
> +@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> +       # Microsoft Visual C++.
> +       # hardcode_libdir_flag_spec is actually meaningless, as there is
> +       # no search path for DLLs.
> +-      hardcode_libdir_flag_spec=' '
> +-      allow_undefined_flag=unsupported
> +-      # Tell ltmain to make .lib files, not .a files.
> +-      libext=lib
> +-      # Tell ltmain to make .dll files, not .so files.
> +-      shrext_cmds=".dll"
> +-      # FIXME: Setting linknames here is a bad hack.
> +-      archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
> +-      # The linker will automatically build a .lib file if we build a DLL.
> +-      old_archive_from_new_cmds='true'
> +-      # FIXME: Should let the user specify the lib program.
> +-      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
> +-      fix_srcfile_path='`cygpath -w "$srcfile"`'
> +-      enable_shared_with_static_runtimes=yes
> ++      case $cc_basename in
> ++      cl*)
> ++	# Native MSVC
> ++	hardcode_libdir_flag_spec=' '
> ++	allow_undefined_flag=unsupported
> ++	always_export_symbols=yes
> ++	file_list_spec='@'
> ++	# Tell ltmain to make .lib files, not .a files.
> ++	libext=lib
> ++	# Tell ltmain to make .dll files, not .so files.
> ++	shrext_cmds=".dll"
> ++	# FIXME: Setting linknames here is a bad hack.
> ++	archive_cmds='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
> ++	archive_expsym_cmds='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
> ++	    sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> ++	  else
> ++	    sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
> ++	  fi~
> ++	  $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
> ++	  linknames='
> ++	# The linker will not automatically build a static lib if we build a DLL.
> ++	# _LT_TAGVAR(old_archive_from_new_cmds, )='true'
> ++	enable_shared_with_static_runtimes=yes
> ++	export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++	# Don't use ranlib
> ++	old_postinstall_cmds='chmod 644 $oldlib'
> ++	postlink_cmds='lt_outputfile="@OUTPUT@"~
> ++	  lt_tool_outputfile="@TOOL_OUTPUT@"~
> ++	  case $lt_outputfile in
> ++	    *.exe|*.EXE) ;;
> ++	    *)
> ++	      lt_outputfile="$lt_outputfile.exe"
> ++	      lt_tool_outputfile="$lt_tool_outputfile.exe"
> ++	      ;;
> ++	  esac~
> ++	  if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
> ++	    $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
> ++	    $RM "$lt_outputfile.manifest";
> ++	  fi'
> ++	;;
> ++      *)
> ++	# Assume MSVC wrapper
> ++	hardcode_libdir_flag_spec=' '
> ++	allow_undefined_flag=unsupported
> ++	# Tell ltmain to make .lib files, not .a files.
> ++	libext=lib
> ++	# Tell ltmain to make .dll files, not .so files.
> ++	shrext_cmds=".dll"
> ++	# FIXME: Setting linknames here is a bad hack.
> ++	archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
> ++	# The linker will automatically build a .lib file if we build a DLL.
> ++	old_archive_from_new_cmds='true'
> ++	# FIXME: Should let the user specify the lib program.
> ++	old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
> ++	enable_shared_with_static_runtimes=yes
> ++	;;
> ++      esac
> +       ;;
> + 
> +     darwin* | rhapsody*)
> +@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> +     freebsd* | dragonfly*)
> +-      archive_cmds='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
> ++      archive_cmds='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
> +       hardcode_libdir_flag_spec='-R$libdir'
> +       hardcode_direct=yes
> +       hardcode_shlibpath_var=no
> +@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     hpux9*)
> +       if test "$GCC" = yes; then
> +-	archive_cmds='$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> ++	archive_cmds='$RM $output_objdir/$soname~$CC -shared $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +       else
> + 	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
> +       fi
> +@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 
> +     hpux10*)
> +       if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> +-	archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++	archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> +       else
> + 	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
> +       fi
> +@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
> + 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	ia64*)
> +-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> ++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	*)
> +-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> + 	  ;;
> + 	esac
> +       else
> +@@ -8997,26 +9580,39 @@ fi
> + 
> +     irix5* | irix6* | nonstopux*)
> +       if test "$GCC" = yes; then
> +-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	# Try to use the -exported_symbol ld option, if it does not
> + 	# work, assume that -exports_file does not work either and
> + 	# implicitly export all symbols.
> +-        save_LDFLAGS="$LDFLAGS"
> +-        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
> +-        if test x$gcc_no_link = xyes; then
> ++	# This should be the same for all languages, so no per-tag cache variable.
> ++	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
> ++$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
> ++if ${lt_cv_irix_exported_symbol+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  save_LDFLAGS="$LDFLAGS"
> ++	   LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
> ++	   if test x$gcc_no_link = xyes; then
> +   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
> + fi
> + cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +-int foo(void) {}
> ++int foo (void) { return 0; }
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> +-  archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> +-
> ++  lt_cv_irix_exported_symbol=yes
> ++else
> ++  lt_cv_irix_exported_symbol=no
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-        LDFLAGS="$save_LDFLAGS"
> ++           LDFLAGS="$save_LDFLAGS"
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exported_symbol" >&5
> ++$as_echo "$lt_cv_irix_exported_symbol" >&6; }
> ++	if test "$lt_cv_irix_exported_symbol" = yes; then
> ++          archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> ++	fi
> +       else
> + 	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
> + 	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
> +@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +     osf4* | osf5*)	# as osf3* with the addition of -msym flag
> +       if test "$GCC" = yes; then
> + 	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> +-	archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> ++	archive_cmds='$CC -shared${allow_undefined_flag} $pic_flag $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
> + 	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
> +       else
> + 	allow_undefined_flag=' -expect_unresolved \*'
> +@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +       no_undefined_flag=' -z defs'
> +       if test "$GCC" = yes; then
> + 	wlarc='${wl}'
> +-	archive_cmds='$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> ++	archive_cmds='$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + 	archive_expsym_cmds='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
> +-	  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> ++	  $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> +       else
> + 	case `$CC -V 2>&1` in
> + 	*"Compilers 5.0"*)
> +@@ -9698,8 +10294,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +   need_version=no
> +   need_lib_prefix=no
> + 
> +-  case $GCC,$host_os in
> +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++  case $GCC,$cc_basename in
> ++  yes,*)
> ++    # gcc
> +     library_names_spec='$libname.dll.a'
> +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> +     postinstall_cmds='base_file=`basename \${file}`~
> +@@ -9732,13 +10329,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +       library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> +       ;;
> +     esac
> ++    dynamic_linker='Win32 ld.exe'
> ++    ;;
> ++
> ++  *,cl*)
> ++    # Native MSVC
> ++    libname_spec='$name'
> ++    soname_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> ++    library_names_spec='${libname}.dll.lib'
> ++
> ++    case $build_os in
> ++    mingw*)
> ++      sys_lib_search_path_spec=
> ++      lt_save_ifs=$IFS
> ++      IFS=';'
> ++      for lt_path in $LIB
> ++      do
> ++        IFS=$lt_save_ifs
> ++        # Let DOS variable expansion print the short 8.3 style file name.
> ++        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
> ++        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
> ++      done
> ++      IFS=$lt_save_ifs
> ++      # Convert to MSYS style.
> ++      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> ++      ;;
> ++    cygwin*)
> ++      # Convert to unix form, then to dos form, then back to unix form
> ++      # but this time dos style (no spaces!) so that the unix form looks
> ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
> ++      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
> ++      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      ;;
> ++    *)
> ++      sys_lib_search_path_spec="$LIB"
> ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/null; then
> ++        # It is most probably a Windows format PATH.
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
> ++      else
> ++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      fi
> ++      # FIXME: find the short name or the path components, as spaces are
> ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> ++      ;;
> ++    esac
> ++
> ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> ++    postinstall_cmds='base_file=`basename \${file}`~
> ++      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
> ++      dldir=$destdir/`dirname \$dlpath`~
> ++      test -d \$dldir || mkdir -p \$dldir~
> ++      $install_prog $dir/$dlname \$dldir/$dlname'
> ++    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
> ++      dlpath=$dir/\$dldll~
> ++       $RM \$dlpath'
> ++    shlibpath_overrides_runpath=yes
> ++    dynamic_linker='Win32 link.exe'
> +     ;;
> + 
> +   *)
> ++    # Assume MSVC wrapper
> +     library_names_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext} $libname.lib'
> ++    dynamic_linker='Win32 ld.exe'
> +     ;;
> +   esac
> +-  dynamic_linker='Win32 ld.exe'
> +   # FIXME: first we should search . and the directory the executable is in
> +   shlibpath_var=PATH
> +   ;;
> +@@ -9830,7 +10485,7 @@ haiku*)
> +   soname_spec='${libname}${release}${shared_ext}$major'
> +   shlibpath_var=LIBRARY_PATH
> +   shlibpath_overrides_runpath=yes
> +-  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/beos/system/lib'
> ++  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/system/lib'
> +   hardcode_into_libs=yes
> +   ;;
> + 
> +@@ -10644,7 +11299,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 10647 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> + 
> + #if HAVE_DLFCN_H
> +@@ -10688,10 +11343,10 @@ else
> + /* When -fvisbility=hidden is used, assume the code has been annotated
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> + 
> +-void fnord () { int i=42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -10750,7 +11405,7 @@ else
> +   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
> +   lt_status=$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 10753 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> + 
> + #if HAVE_DLFCN_H
> +@@ -10794,10 +11449,10 @@ else
> + /* When -fvisbility=hidden is used, assume the code has been annotated
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> + 
> +-void fnord () { int i=42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
> + lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> + lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> + lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_host_file_cmd='`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_tool_file_cmd='`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$delay_single_quote_subst"`'
> + reload_flag='`$ECHO "$reload_flag" | $SED "$delay_single_quote_subst"`'
> + reload_cmds='`$ECHO "$reload_cmds" | $SED "$delay_single_quote_subst"`'
> + OBJDUMP='`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
> + deplibs_check_method='`$ECHO "$deplibs_check_method" | $SED "$delay_single_quote_subst"`'
> + file_magic_cmd='`$ECHO "$file_magic_cmd" | $SED "$delay_single_quote_subst"`'
> ++file_magic_glob='`$ECHO "$file_magic_glob" | $SED "$delay_single_quote_subst"`'
> ++want_nocaseglob='`$ECHO "$want_nocaseglob" | $SED "$delay_single_quote_subst"`'
> ++DLLTOOL='`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
> ++sharedlib_from_linklib_cmd='`$ECHO "$sharedlib_from_linklib_cmd" | $SED "$delay_single_quote_subst"`'
> + AR='`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
> + AR_FLAGS='`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
> ++archiver_list_spec='`$ECHO "$archiver_list_spec" | $SED "$delay_single_quote_subst"`'
> + STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> + RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> + old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
> +@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> + lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
> ++nm_file_list_spec='`$ECHO "$nm_file_list_spec" | $SED "$delay_single_quote_subst"`'
> ++lt_sysroot='`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst"`'
> + objdir='`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
> + MAGIC_CMD='`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag='`$ECHO "$lt_prog_compiler_no_builtin_flag" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_pic='`$ECHO "$lt_prog_compiler_pic" | $SED "$delay_single_quote_subst"`'
> ++lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_static='`$ECHO "$lt_prog_compiler_static" | $SED "$delay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o='`$ECHO "$lt_cv_prog_compiler_c_o" | $SED "$delay_single_quote_subst"`'
> + need_locks='`$ECHO "$need_locks" | $SED "$delay_single_quote_subst"`'
> ++MANIFEST_TOOL='`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote_subst"`'
> + DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> + NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> + LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> +@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
> + hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
> + inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
> + link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
> +-fix_srcfile_path='`$ECHO "$fix_srcfile_path" | $SED "$delay_single_quote_subst"`'
> + always_export_symbols='`$ECHO "$always_export_symbols" | $SED "$delay_single_quote_subst"`'
> + export_symbols_cmds='`$ECHO "$export_symbols_cmds" | $SED "$delay_single_quote_subst"`'
> + exclude_expsyms='`$ECHO "$exclude_expsyms" | $SED "$delay_single_quote_subst"`'
> + include_expsyms='`$ECHO "$include_expsyms" | $SED "$delay_single_quote_subst"`'
> + prelink_cmds='`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_subst"`'
> ++postlink_cmds='`$ECHO "$postlink_cmds" | $SED "$delay_single_quote_subst"`'
> + file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
> + variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
> + need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
> +@@ -12388,8 +13053,13 @@ reload_flag \
> + OBJDUMP \
> + deplibs_check_method \
> + file_magic_cmd \
> ++file_magic_glob \
> ++want_nocaseglob \
> ++DLLTOOL \
> ++sharedlib_from_linklib_cmd \
> + AR \
> + AR_FLAGS \
> ++archiver_list_spec \
> + STRIP \
> + RANLIB \
> + CC \
> +@@ -12399,12 +13069,14 @@ lt_cv_sys_global_symbol_pipe \
> + lt_cv_sys_global_symbol_to_cdecl \
> + lt_cv_sys_global_symbol_to_c_name_address \
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> ++nm_file_list_spec \
> + lt_prog_compiler_no_builtin_flag \
> +-lt_prog_compiler_wl \
> + lt_prog_compiler_pic \
> ++lt_prog_compiler_wl \
> + lt_prog_compiler_static \
> + lt_cv_prog_compiler_c_o \
> + need_locks \
> ++MANIFEST_TOOL \
> + DSYMUTIL \
> + NMEDIT \
> + LIPO \
> +@@ -12420,7 +13092,6 @@ no_undefined_flag \
> + hardcode_libdir_flag_spec \
> + hardcode_libdir_flag_spec_ld \
> + hardcode_libdir_separator \
> +-fix_srcfile_path \
> + exclude_expsyms \
> + include_expsyms \
> + file_list_spec \
> +@@ -12456,6 +13127,7 @@ module_cmds \
> + module_expsym_cmds \
> + export_symbols_cmds \
> + prelink_cmds \
> ++postlink_cmds \
> + postinstall_cmds \
> + postuninstall_cmds \
> + finish_cmds \
> +@@ -13054,7 +13726,8 @@ $as_echo X"$file" |
> + # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> + #
> + #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> +-#                 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
> ++#                 2006, 2007, 2008, 2009, 2010 Free Software Foundation,
> ++#                 Inc.
> + #   Written by Gordon Matzigkeit, 1996
> + #
> + #   This file is part of GNU Libtool.
> +@@ -13157,19 +13830,42 @@ SP2NL=$lt_lt_SP2NL
> + # turn newlines into spaces.
> + NL2SP=$lt_lt_NL2SP
> + 
> ++# convert \$build file names to \$host format.
> ++to_host_file_cmd=$lt_cv_to_host_file_cmd
> ++
> ++# convert \$build files to toolchain format.
> ++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
> ++
> + # An object symbol dumper.
> + OBJDUMP=$lt_OBJDUMP
> + 
> + # Method to check whether dependent libraries are shared objects.
> + deplibs_check_method=$lt_deplibs_check_method
> + 
> +-# Command to use when deplibs_check_method == "file_magic".
> ++# Command to use when deplibs_check_method = "file_magic".
> + file_magic_cmd=$lt_file_magic_cmd
> + 
> ++# How to find potential files when deplibs_check_method = "file_magic".
> ++file_magic_glob=$lt_file_magic_glob
> ++
> ++# Find potential files using nocaseglob when deplibs_check_method = "file_magic".
> ++want_nocaseglob=$lt_want_nocaseglob
> ++
> ++# DLL creation program.
> ++DLLTOOL=$lt_DLLTOOL
> ++
> ++# Command to associate shared and link libraries.
> ++sharedlib_from_linklib_cmd=$lt_sharedlib_from_linklib_cmd
> ++
> + # The archiver.
> + AR=$lt_AR
> ++
> ++# Flags to create an archive.
> + AR_FLAGS=$lt_AR_FLAGS
> + 
> ++# How to feed a file listing to the archiver.
> ++archiver_list_spec=$lt_archiver_list_spec
> ++
> + # A symbol stripping program.
> + STRIP=$lt_STRIP
> + 
> +@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> + # Transform the output of nm in a C name address pair when lib prefix is needed.
> + global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
> + 
> ++# Specify filename containing input files for \$NM.
> ++nm_file_list_spec=$lt_nm_file_list_spec
> ++
> ++# The root where to search for dependent libraries,and in which our libraries should be installed.
> ++lt_sysroot=$lt_sysroot
> ++
> + # The name of the directory that contains temporary libtool files.
> + objdir=$objdir
> + 
> +@@ -13208,6 +13910,9 @@ MAGIC_CMD=$MAGIC_CMD
> + # Must we lock files when doing compilation?
> + need_locks=$lt_need_locks
> + 
> ++# Manifest tool.
> ++MANIFEST_TOOL=$lt_MANIFEST_TOOL
> ++
> + # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> + DSYMUTIL=$lt_DSYMUTIL
> + 
> +@@ -13322,12 +14027,12 @@ with_gcc=$GCC
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
> + 
> +-# How to pass a linker flag through the compiler.
> +-wl=$lt_lt_prog_compiler_wl
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=$lt_lt_prog_compiler_pic
> + 
> ++# How to pass a linker flag through the compiler.
> ++wl=$lt_lt_prog_compiler_wl
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=$lt_lt_prog_compiler_static
> + 
> +@@ -13414,9 +14119,6 @@ inherit_rpath=$inherit_rpath
> + # Whether libtool must link a program against all its dependency libraries.
> + link_all_deplibs=$link_all_deplibs
> + 
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=$lt_fix_srcfile_path
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=$always_export_symbols
> + 
> +@@ -13432,6 +14134,9 @@ include_expsyms=$lt_include_expsyms
> + # Commands necessary for linking programs (against libraries) with templates.
> + prelink_cmds=$lt_prelink_cmds
> + 
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=$lt_postlink_cmds
> ++
> + # Specify filename containing input files.
> + file_list_spec=$lt_file_list_spec
> + 
> +@@ -13464,210 +14169,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> +   # text mode, it properly converts lines to CR/LF.  This bash problem
> +   # is reportedly fixed, but why not run on old versions too?
> +-  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  case $xsi_shell in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result="${1%/*}${2}" ;;
> +-    *  ) func_dirname_result="${3}" ;;
> +-  esac
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result="${1##*/}"
> +-}
> +-
> +-# func_dirname_and_basename file append nondir_replacement
> +-# perform func_basename and func_dirname in a single function
> +-# call:
> +-#   dirname:  Compute the dirname of FILE.  If nonempty,
> +-#             add APPEND to the result, otherwise set result
> +-#             to NONDIR_REPLACEMENT.
> +-#             value returned in "$func_dirname_result"
> +-#   basename: Compute filename of FILE.
> +-#             value retuned in "$func_basename_result"
> +-# Implementation must be kept synchronized with func_dirname
> +-# and func_basename. For efficiency, we do not delegate to
> +-# those functions but instead duplicate the functionality here.
> +-func_dirname_and_basename ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result="${1%/*}${2}" ;;
> +-    *  ) func_dirname_result="${3}" ;;
> +-  esac
> +-  func_basename_result="${1##*/}"
> +-}
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-func_stripname ()
> +-{
> +-  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
> +-  # positional parameters, so assign one to ordinary parameter first.
> +-  func_stripname_result=${3}
> +-  func_stripname_result=${func_stripname_result#"${1}"}
> +-  func_stripname_result=${func_stripname_result%"${2}"}
> +-}
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=${1%%=*}
> +-  func_opt_split_arg=${1#*=}
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  case ${1} in
> +-    *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
> +-    *)    func_lo2o_result=${1} ;;
> +-  esac
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=${1%.*}.lo
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=$(( $* ))
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=${#1}
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  *) # Bourne compatible functions.
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  # Extract subdirectory from the argument.
> +-  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
> +-  if test "X$func_dirname_result" = "X${1}"; then
> +-    func_dirname_result="${3}"
> +-  else
> +-    func_dirname_result="$func_dirname_result${2}"
> +-  fi
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
> +-}
> +-
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-# func_strip_suffix prefix name
> +-func_stripname ()
> +-{
> +-  case ${2} in
> +-    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
> +-    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
> +-  esac
> +-}
> +-
> +-# sed scripts:
> +-my_sed_long_opt='1s/^\(-[^=]*\)=.*/\1/;q'
> +-my_sed_long_arg='1s/^-[^=]*=//'
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=`$ECHO "${1}" | $SED "$my_sed_long_opt"`
> +-  func_opt_split_arg=`$ECHO "${1}" | $SED "$my_sed_long_arg"`
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  func_lo2o_result=`$ECHO "${1}" | $SED "$lo2o"`
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=`expr "$@"`
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_len`
> +-}
> +-
> +-_LT_EOF
> +-esac
> +-
> +-case $lt_shell_append in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1+=\$2"
> +-}
> +-_LT_EOF
> +-    ;;
> +-  *)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1=\$$1\$2"
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  esac
> +-
> +-
> +-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  mv -f "$cfgfile" "$ofile" ||
> ++  sed '$q' "$ltmain" >> "$cfgfile" \
> ++     || (rm -f "$cfgfile"; exit 1)
> ++
> ++  if test x"$xsi_shell" = xyes; then
> ++  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
> ++func_dirname ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result="${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result="${3}" ;;\
> ++\    esac\
> ++} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_basename ()$/,/^} # func_basename /c\
> ++func_basename ()\
> ++{\
> ++\    func_basename_result="${1##*/}"\
> ++} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_basename /c\
> ++func_dirname_and_basename ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result="${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result="${3}" ;;\
> ++\    esac\
> ++\    func_basename_result="${1##*/}"\
> ++} # Extended-shell func_dirname_and_basename implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
> ++func_stripname ()\
> ++{\
> ++\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are\
> ++\    # positional parameters, so assign one to ordinary parameter first.\
> ++\    func_stripname_result=${3}\
> ++\    func_stripname_result=${func_stripname_result#"${1}"}\
> ++\    func_stripname_result=${func_stripname_result%"${2}"}\
> ++} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
> ++func_split_long_opt ()\
> ++{\
> ++\    func_split_long_opt_name=${1%%=*}\
> ++\    func_split_long_opt_arg=${1#*=}\
> ++} # Extended-shell func_split_long_opt implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
> ++func_split_short_opt ()\
> ++{\
> ++\    func_split_short_opt_arg=${1#??}\
> ++\    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}\
> ++} # Extended-shell func_split_short_opt implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
> ++func_lo2o ()\
> ++{\
> ++\    case ${1} in\
> ++\      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;\
> ++\      *)    func_lo2o_result=${1} ;;\
> ++\    esac\
> ++} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_xform ()$/,/^} # func_xform /c\
> ++func_xform ()\
> ++{\
> ++    func_xform_result=${1%.*}.lo\
> ++} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_arith ()$/,/^} # func_arith /c\
> ++func_arith ()\
> ++{\
> ++    func_arith_result=$(( $* ))\
> ++} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_len ()$/,/^} # func_len /c\
> ++func_len ()\
> ++{\
> ++    func_len_result=${#1}\
> ++} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++fi
> ++
> ++if test x"$lt_shell_append" = xyes; then
> ++  sed -e '/^func_append ()$/,/^} # func_append /c\
> ++func_append ()\
> ++{\
> ++    eval "${1}+=\\${2}"\
> ++} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
> ++func_append_quoted ()\
> ++{\
> ++\    func_quote_for_eval "${2}"\
> ++\    eval "${1}+=\\\\ \\$func_quote_for_eval_result"\
> ++} # Extended-shell func_append_quoted implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=:
> ++
> ++
> ++  # Save a `func_append' function call where possible by direct use of '+='
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=:
> ++else
> ++  # Save a `func_append' function call even when '+=' is not available
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1="$\1%g' $cfgfile > $cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=:
> ++fi
> ++
> ++if test x"$_lt_function_replace_fail" = x":"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
> ++$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
> ++fi
> ++
> ++
> ++   mv -f "$cfgfile" "$ofile" ||
> +     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> +   chmod +x "$ofile"
> + 
>  -- 
> -2.26.0
> +2.28.0
>  
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> deleted file mode 100644
> index 463de80638..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From ef4ad1cb9ff1b5a871ffa792a71b3ad6d14eb3dc Mon Sep 17 00:00:00 2001
> -From: Zhenhua Luo <zhenhua.luo@nxp.com>
> -Date: Sat, 11 Jun 2016 22:08:29 -0500
> -Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> -
> -Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> -
> -Upstream-Status: Pending
> ----
> - opcodes/ppc-opc.c | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> -index 7ef91d819b..145953d3c4 100644
> ---- a/opcodes/ppc-opc.c
> -+++ b/opcodes/ppc-opc.c
> -@@ -5709,7 +5709,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> - {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
> - 
> - {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
> --{"wait",	X(31,30),	XWC_MASK,    POWER9,	0,		{WC}},
> - 
> - {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
> - 
> -@@ -5763,7 +5762,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> - 
> - {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
> - {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
> --{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2, 0,		{WC}},
> -+{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2|POWER9, 0,	{WC}},
> - 
> - {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
> - 
> diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> similarity index 89%
> rename from meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> rename to meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> index f4f1a068cb..69a2383782 100644
> --- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> @@ -1,7 +1,7 @@
> -From 70f3f2d9e912ea777fa113e02cdbc3465a66e40d Mon Sep 17 00:00:00 2001
> +From f791a5d84475c02356f16679b7f4ee9c9c3408aa Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:42:38 +0000
> -Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> +Subject: [PATCH 14/17] Fix rpath in libtool when sysroot is enabled
>  
>  Enabling sysroot support in libtool exposed a bug where the final
>  library had an RPATH encoded into it which still pointed to the
> @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 8 insertions(+), 2 deletions(-)
>  
>  diff --git a/ltmain.sh b/ltmain.sh
> -index 70e856e065..11ee684ccc 100644
> +index 70e856e0659..11ee684cccf 100644
>  --- a/ltmain.sh
>  +++ b/ltmain.sh
>  @@ -8035,9 +8035,11 @@ EOF
> @@ -47,3 +47,6 @@ index 70e856e065..11ee684ccc 100644
>   	  if test -n "$hardcode_libdir_separator"; then
>   	    if test -z "$hardcode_libdirs"; then
>   	      hardcode_libdirs="$libdir"
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> index a794719bd2..e848f146b0 100644
> --- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> @@ -1,7 +1,7 @@
> -From 392d474a72d37b669f53ab9f0fa913b958af93f6 Mon Sep 17 00:00:00 2001
> +From e087f96e219d47c4d2244c3f32397e56d41bfdec Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 6 Mar 2017 23:33:27 -0800
> -Subject: [PATCH] sync with OE libtool changes
> +Subject: [PATCH 15/17] sync with OE libtool changes
>  
>  Apply these patches from our libtool patches as not only are redundant RPATHs a
>  waste of space but they can cause incorrect linking when native packages are
> @@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 28 insertions(+), 6 deletions(-)
>  
>  diff --git a/ltmain.sh b/ltmain.sh
> -index 11ee684ccc..3b19ac1532 100644
> +index 11ee684cccf..3b19ac15328 100644
>  --- a/ltmain.sh
>  +++ b/ltmain.sh
>  @@ -8053,8 +8053,16 @@ EOF
> @@ -84,3 +84,6 @@ index 11ee684ccc..3b19ac1532 100644
>   	  fi
>   	elif test -n "$runpath_var"; then
>   	  case "$finalize_perm_rpath " in
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
> index c694b42dc3..400b79823f 100644
> --- a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
> @@ -1,7 +1,7 @@
> -From 67590a44c1256491fa674426f0170d5d05377d05 Mon Sep 17 00:00:00 2001
> +From ae5a7d622dc9addb2ca9fc85889c45964c025a9c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 15 Apr 2020 14:17:20 -0700
> -Subject: [PATCH 16/16] Check for clang before checking gcc version
> +Subject: [PATCH 16/17] Check for clang before checking gcc version
>  
>  Clang advertises itself to be gcc 4.2.1, so when compiling this test
>  here fails since gcc < 4.4.5 did not support -static-libstdc++ but thats
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/configure b/configure
> -index 590b03c2da0..46f116fdb54 100755
> +index 6782f8b6ab8..72f5766b363 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5140,7 +5140,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
> +@@ -5143,7 +5143,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>   /* end confdefs.h.  */
>   
> @@ -31,10 +31,10 @@ index 590b03c2da0..46f116fdb54 100755
>   #endif
>   int main() {}
>  diff --git a/configure.ac b/configure.ac
> -index d3f85e6f5d5..c0eb1343121 100644
> +index 55beb1dea46..3f9e613e2d9 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1309,7 +1309,7 @@ if test "$GCC" = yes; then
> +@@ -1312,7 +1312,7 @@ if test "$GCC" = yes; then
>     AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
>     AC_LANG_PUSH(C++)
>     AC_LINK_IFELSE([AC_LANG_SOURCE([
> @@ -44,5 +44,5 @@ index d3f85e6f5d5..c0eb1343121 100644
>   #endif
>   int main() {}])],
>  -- 
> -2.26.1
> +2.28.0
>  
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch b/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch
> new file mode 100644
> index 0000000000..99bb38eb67
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch
> @@ -0,0 +1,42 @@
> +From 5b61c40c34c3db699de723c3128ba704501ccdac Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 20 Apr 2020 14:23:57 -0700
> +Subject: [PATCH 17/17] Do not emit R_RISCV_NONE reloc in the extra unused
> + reloc space.
> +
> +Redundant R_RISCV_DTPMOD* R_RISCV_DTPREL* results from Global Dynamic -> Local Exec relaxation
> +which generates
> +
> +Patch from https://sourceware.org/bugzilla/show_bug.cgi?id=24673
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + bfd/elfnn-riscv.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bfd/elfnn-riscv.c b/bfd/elfnn-riscv.c
> +index a5fa415309a..1e582052aa9 100644
> +--- a/bfd/elfnn-riscv.c
> ++++ b/bfd/elfnn-riscv.c
> +@@ -2090,13 +2090,14 @@ riscv_elf_relocate_section (bfd *output_bfd,
> + 		  pic = bfd_link_pic (info);
> + 
> + 		  if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (dyn, pic, h)
> +-		      && (!pic || !SYMBOL_REFERENCES_LOCAL (info, h)))
> ++		      && (bfd_link_dll (info)
> ++			  || !SYMBOL_REFERENCES_LOCAL (info, h)))
> + 		    indx = h->dynindx;
> + 		}
> + 
> + 	      /* The GOT entries have not been initialized yet.  Do it
> + 		 now, and emit any relocations.  */
> +-	      if ((bfd_link_pic (info) || indx != 0)
> ++	      if ((bfd_link_dll (info) || indx != 0)
> + 		  && (h == NULL
> + 		      || ELF_ST_VISIBILITY (h->other) == STV_DEFAULT
> + 		      || h->root.type != bfd_link_hash_undefweak))
> +-- 
> +2.28.0
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
> deleted file mode 100644
> index be59f9dca0..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 57a3e055605b28a9449b1b27eda7125737c42b00 Mon Sep 17 00:00:00 2001
> -From: Sergei Trofimovich <siarheit@google.com>
> -Date: Sat, 1 Feb 2020 23:16:11 +0000
> -Subject: [PATCH] binutils: drop redundant 'program_name' definition
> - (-fno-common)
> -
> -	* coffdump.c (program_name): Drop redundant definition.
> -	* srconv.c (program_name): Likewise
> -	* sysdump.c (program_name): Likewise
> -
> -Upstream-Status: Backport (commit 0b398d69ac)
> -Signed-off-by: Sergei Trofimovich <siarheit@google.com>
> -Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ----
> - binutils/coffdump.c | 2 --
> - binutils/srconv.c   | 2 --
> - binutils/sysdump.c  | 2 --
> - 3 files changed, 6 deletions(-)
> -
> -diff --git a/binutils/coffdump.c b/binutils/coffdump.c
> -index 531a4e46c3..336da57ca2 100644
> ---- a/binutils/coffdump.c
> -+++ b/binutils/coffdump.c
> -@@ -456,8 +456,6 @@ coff_dump (struct coff_ofile *ptr)
> -     dump_coff_section (ptr->sections + i);
> - }
> - 
> --char * program_name;
> --
> - static void
> - show_usage (FILE *file, int status)
> - {
> -diff --git a/binutils/srconv.c b/binutils/srconv.c
> -index 5742b16759..f071794f0a 100644
> ---- a/binutils/srconv.c
> -+++ b/binutils/srconv.c
> -@@ -1687,8 +1687,6 @@ prescan (struct coff_ofile *otree)
> -     }
> - }
> - 
> --char *program_name;
> --
> - ATTRIBUTE_NORETURN static void
> - show_usage (FILE *ffile, int status)
> - {
> -diff --git a/binutils/sysdump.c b/binutils/sysdump.c
> -index d433e71ed9..7eebbd61d3 100644
> ---- a/binutils/sysdump.c
> -+++ b/binutils/sysdump.c
> -@@ -633,8 +633,6 @@ module (void)
> -     }
> - }
> - 
> --char *program_name;
> --
> - ATTRIBUTE_NORETURN static void
> - show_usage (FILE *ffile, int status)
> - {
> --- 
> -2.26.2
> -
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
> deleted file mode 100644
> index 53e3caf445..0000000000
> --- a/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
> +++ /dev/null
> @@ -1,549 +0,0 @@
> -From ae531041c7c5956672342f89c486a011c84f027f Mon Sep 17 00:00:00 2001
> -From: "H.J. Lu" <hjl.tools@gmail.com>
> -Date: Wed, 11 Mar 2020 09:46:19 -0700
> -Subject: [PATCH 1/1] i386: Generate lfence with load/indirect branch/ret
> - [CVE-2020-0551]
> -
> -Add 3 command-line options to generate lfence for load, indirect near
> -branch and ret to help mitigate:
> -
> -https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00334.html
> -http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-0551
> -
> -1. -mlfence-after-load=[no|yes]:
> -  -mlfence-after-load=yes generates lfence after load instructions.
> -2. -mlfence-before-indirect-branch=[none|all|memory|register]:
> -  a. -mlfence-before-indirect-branch=all generates lfence before indirect
> -  near branches via register and a warning before indirect near branches
> -  via memory.
> -  b. -mlfence-before-indirect-branch=memory issue a warning before
> -  indirect near branches via memory.
> -  c. -mlfence-before-indirect-branch=register generates lfence before
> -  indirect near branches via register.
> -Note that lfence won't be generated before indirect near branches via
> -register with -mlfence-after-load=yes since lfence will be generated
> -after loading branch target register.
> -3. -mlfence-before-ret=[none|or|not]
> -  a. -mlfence-before-ret=or generates or with lfence before ret.
> -  b. -mlfence-before-ret=not generates not with lfence before ret.
> -
> -A warning will be issued and lfence won't be generated before indirect
> -near branch and ret if the previous item is a prefix or a constant
> -directive, which may be used to hardcode an instruction, since there
> -is no clear instruction boundary.
> -
> -	* config/tc-i386.c (lfence_after_load): New.
> -	(lfence_before_indirect_branch_kind): New.
> -	(lfence_before_indirect_branch): New.
> -	(lfence_before_ret_kind): New.
> -	(lfence_before_ret): New.
> -	(last_insn): New.
> -	(load_insn_p): New.
> -	(insert_lfence_after): New.
> -	(insert_lfence_before): New.
> -	(md_assemble): Call insert_lfence_before and insert_lfence_after.
> -	Set last_insn.
> -	(OPTION_MLFENCE_AFTER_LOAD): New.
> -	(OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH): New.
> -	(OPTION_MLFENCE_BEFORE_RET): New.
> -	(md_longopts): Add -mlfence-after-load=,
> -	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
> -	(md_parse_option): Handle -mlfence-after-load=,
> -	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
> -	(md_show_usage): Display -mlfence-after-load=,
> -	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
> -	(i386_cons_align): New.
> -	* config/tc-i386.h (i386_cons_align): New.
> -	(md_cons_align): New.
> -	* doc/c-i386.texi: Document -mlfence-after-load=,
> -	-mlfence-before-indirect-branch= and -mlfence-before-ret=.
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> -Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ae531041c7c5956672342f89c486a011c84f027f]
> -CVE: CVE-2020-0551
> ----
> -diff --git a/gas/config/tc-i386.c b/gas/config/tc-i386.c
> -index b020f39c863..09063f784b7 100644
> ---- a/gas/config/tc-i386.c
> -+++ b/gas/config/tc-i386.c
> -@@ -629,7 +629,29 @@ static int omit_lock_prefix = 0;
> -    "lock addl $0, (%{re}sp)".  */
> - static int avoid_fence = 0;
> - 
> --/* Type of the previous instruction.  */
> -+/* 1 if lfence should be inserted after every load.  */
> -+static int lfence_after_load = 0;
> -+
> -+/* Non-zero if lfence should be inserted before indirect branch.  */
> -+static enum lfence_before_indirect_branch_kind
> -+  {
> -+    lfence_branch_none = 0,
> -+    lfence_branch_register,
> -+    lfence_branch_memory,
> -+    lfence_branch_all
> -+  }
> -+lfence_before_indirect_branch;
> -+
> -+/* Non-zero if lfence should be inserted before ret.  */
> -+static enum lfence_before_ret_kind
> -+  {
> -+    lfence_before_ret_none = 0,
> -+    lfence_before_ret_not,
> -+    lfence_before_ret_or
> -+  }
> -+lfence_before_ret;
> -+
> -+/* Types of previous instruction is .byte or prefix.  */
> - static struct
> -   {
> -     segT seg;
> -@@ -4311,6 +4333,283 @@ optimize_encoding (void)
> -     }
> - }
> - 
> -+/* Return non-zero for load instruction.  */
> -+
> -+static int
> -+load_insn_p (void)
> -+{
> -+  unsigned int dest;
> -+  int any_vex_p = is_any_vex_encoding (&i.tm);
> -+  unsigned int base_opcode = i.tm.base_opcode | 1;
> -+
> -+  if (!any_vex_p)
> -+    {
> -+      /* lea  */
> -+      if (i.tm.base_opcode == 0x8d)
> -+	return 0;
> -+
> -+      /* pop  */
> -+      if ((i.tm.base_opcode & ~7) == 0x58
> -+	  || (i.tm.base_opcode == 0x8f && i.tm.extension_opcode == 0))
> -+	return 1;
> -+
> -+      /* movs, cmps, lods, scas.  */
> -+      if ((i.tm.base_opcode | 0xb) == 0xaf)
> -+	return 1;
> -+
> -+      /* outs */
> -+      if (base_opcode == 0x6f)
> -+	return 1;
> -+    }
> -+
> -+  /* No memory operand.  */
> -+  if (!i.mem_operands)
> -+    return 0;
> -+
> -+  if (any_vex_p)
> -+    {
> -+      /* vldmxcsr.  */
> -+      if (i.tm.base_opcode == 0xae
> -+	  && i.tm.opcode_modifier.vex
> -+	  && i.tm.opcode_modifier.vexopcode == VEX0F
> -+	  && i.tm.extension_opcode == 2)
> -+	return 1;
> -+    }
> -+  else
> -+    {
> -+      /* test, not, neg, mul, imul, div, idiv.  */
> -+      if ((i.tm.base_opcode == 0xf6 || i.tm.base_opcode == 0xf7)
> -+	  && i.tm.extension_opcode != 1)
> -+	return 1;
> -+
> -+      /* inc, dec.  */
> -+      if (base_opcode == 0xff && i.tm.extension_opcode <= 1)
> -+	return 1;
> -+
> -+      /* add, or, adc, sbb, and, sub, xor, cmp.  */
> -+      if (i.tm.base_opcode >= 0x80 && i.tm.base_opcode <= 0x83)
> -+	return 1;
> -+
> -+      /* bt, bts, btr, btc.  */
> -+      if (i.tm.base_opcode == 0xfba
> -+	  && (i.tm.extension_opcode >= 4 && i.tm.extension_opcode <= 7))
> -+	return 1;
> -+
> -+      /* rol, ror, rcl, rcr, shl/sal, shr, sar. */
> -+      if ((base_opcode == 0xc1
> -+	   || (i.tm.base_opcode >= 0xd0 && i.tm.base_opcode <= 0xd3))
> -+	  && i.tm.extension_opcode != 6)
> -+	return 1;
> -+
> -+      /* cmpxchg8b, cmpxchg16b, xrstors.  */
> -+      if (i.tm.base_opcode == 0xfc7
> -+	  && (i.tm.extension_opcode == 1 || i.tm.extension_opcode == 3))
> -+	return 1;
> -+
> -+      /* fxrstor, ldmxcsr, xrstor.  */
> -+      if (i.tm.base_opcode == 0xfae
> -+	  && (i.tm.extension_opcode == 1
> -+	      || i.tm.extension_opcode == 2
> -+	      || i.tm.extension_opcode == 5))
> -+	return 1;
> -+
> -+      /* lgdt, lidt, lmsw.  */
> -+      if (i.tm.base_opcode == 0xf01
> -+	  && (i.tm.extension_opcode == 2
> -+	      || i.tm.extension_opcode == 3
> -+	      || i.tm.extension_opcode == 6))
> -+	return 1;
> -+
> -+      /* vmptrld */
> -+      if (i.tm.base_opcode == 0xfc7
> -+	  && i.tm.extension_opcode == 6)
> -+	return 1;
> -+
> -+      /* Check for x87 instructions.  */
> -+      if (i.tm.base_opcode >= 0xd8 && i.tm.base_opcode <= 0xdf)
> -+	{
> -+	  /* Skip fst, fstp, fstenv, fstcw.  */
> -+	  if (i.tm.base_opcode == 0xd9
> -+	      && (i.tm.extension_opcode == 2
> -+		  || i.tm.extension_opcode == 3
> -+		  || i.tm.extension_opcode == 6
> -+		  || i.tm.extension_opcode == 7))
> -+	    return 0;
> -+
> -+	  /* Skip fisttp, fist, fistp, fstp.  */
> -+	  if (i.tm.base_opcode == 0xdb
> -+	      && (i.tm.extension_opcode == 1
> -+		  || i.tm.extension_opcode == 2
> -+		  || i.tm.extension_opcode == 3
> -+		  || i.tm.extension_opcode == 7))
> -+	    return 0;
> -+
> -+	  /* Skip fisttp, fst, fstp, fsave, fstsw.  */
> -+	  if (i.tm.base_opcode == 0xdd
> -+	      && (i.tm.extension_opcode == 1
> -+		  || i.tm.extension_opcode == 2
> -+		  || i.tm.extension_opcode == 3
> -+		  || i.tm.extension_opcode == 6
> -+		  || i.tm.extension_opcode == 7))
> -+	    return 0;
> -+
> -+	  /* Skip fisttp, fist, fistp, fbstp, fistp.  */
> -+	  if (i.tm.base_opcode == 0xdf
> -+	      && (i.tm.extension_opcode == 1
> -+		  || i.tm.extension_opcode == 2
> -+		  || i.tm.extension_opcode == 3
> -+		  || i.tm.extension_opcode == 6
> -+		  || i.tm.extension_opcode == 7))
> -+	    return 0;
> -+
> -+	  return 1;
> -+	}
> -+    }
> -+
> -+  dest = i.operands - 1;
> -+
> -+  /* Check fake imm8 operand and 3 source operands.  */
> -+  if ((i.tm.opcode_modifier.immext
> -+       || i.tm.opcode_modifier.vexsources == VEX3SOURCES)
> -+      && i.types[dest].bitfield.imm8)
> -+    dest--;
> -+
> -+  /* add, or, adc, sbb, and, sub, xor, cmp, test, xchg, xadd  */
> -+  if (!any_vex_p
> -+      && (base_opcode == 0x1
> -+	  || base_opcode == 0x9
> -+	  || base_opcode == 0x11
> -+	  || base_opcode == 0x19
> -+	  || base_opcode == 0x21
> -+	  || base_opcode == 0x29
> -+	  || base_opcode == 0x31
> -+	  || base_opcode == 0x39
> -+	  || (i.tm.base_opcode >= 0x84 && i.tm.base_opcode <= 0x87)
> -+	  || base_opcode == 0xfc1))
> -+    return 1;
> -+
> -+  /* Check for load instruction.  */
> -+  return (i.types[dest].bitfield.class != ClassNone
> -+	  || i.types[dest].bitfield.instance == Accum);
> -+}
> -+
> -+/* Output lfence, 0xfaee8, after instruction.  */
> -+
> -+static void
> -+insert_lfence_after (void)
> -+{
> -+  if (lfence_after_load && load_insn_p ())
> -+    {
> -+      char *p = frag_more (3);
> -+      *p++ = 0xf;
> -+      *p++ = 0xae;
> -+      *p = 0xe8;
> -+    }
> -+}
> -+
> -+/* Output lfence, 0xfaee8, before instruction.  */
> -+
> -+static void
> -+insert_lfence_before (void)
> -+{
> -+  char *p;
> -+
> -+  if (is_any_vex_encoding (&i.tm))
> -+    return;
> -+
> -+  if (i.tm.base_opcode == 0xff
> -+      && (i.tm.extension_opcode == 2 || i.tm.extension_opcode == 4))
> -+    {
> -+      /* Insert lfence before indirect branch if needed.  */
> -+
> -+      if (lfence_before_indirect_branch == lfence_branch_none)
> -+	return;
> -+
> -+      if (i.operands != 1)
> -+	abort ();
> -+
> -+      if (i.reg_operands == 1)
> -+	{
> -+	  /* Indirect branch via register.  Don't insert lfence with
> -+	     -mlfence-after-load=yes.  */
> -+	  if (lfence_after_load
> -+	      || lfence_before_indirect_branch == lfence_branch_memory)
> -+	    return;
> -+	}
> -+      else if (i.mem_operands == 1
> -+	       && lfence_before_indirect_branch != lfence_branch_register)
> -+	{
> -+	  as_warn (_("indirect `%s` with memory operand should be avoided"),
> -+		   i.tm.name);
> -+	  return;
> -+	}
> -+      else
> -+	return;
> -+
> -+      if (last_insn.kind != last_insn_other
> -+	  && last_insn.seg == now_seg)
> -+	{
> -+	  as_warn_where (last_insn.file, last_insn.line,
> -+			 _("`%s` skips -mlfence-before-indirect-branch on `%s`"),
> -+			 last_insn.name, i.tm.name);
> -+	  return;
> -+	}
> -+
> -+      p = frag_more (3);
> -+      *p++ = 0xf;
> -+      *p++ = 0xae;
> -+      *p = 0xe8;
> -+      return;
> -+    }
> -+
> -+  /* Output or/not and lfence before ret.  */
> -+  if (lfence_before_ret != lfence_before_ret_none
> -+      && (i.tm.base_opcode == 0xc2
> -+	  || i.tm.base_opcode == 0xc3
> -+	  || i.tm.base_opcode == 0xca
> -+	  || i.tm.base_opcode == 0xcb))
> -+    {
> -+      if (last_insn.kind != last_insn_other
> -+	  && last_insn.seg == now_seg)
> -+	{
> -+	  as_warn_where (last_insn.file, last_insn.line,
> -+			 _("`%s` skips -mlfence-before-ret on `%s`"),
> -+			 last_insn.name, i.tm.name);
> -+	  return;
> -+	}
> -+      if (lfence_before_ret == lfence_before_ret_or)
> -+	{
> -+	  /* orl: 0x830c2400.  */
> -+	  p = frag_more ((flag_code == CODE_64BIT ? 1 : 0) + 4 + 3);
> -+	  if (flag_code == CODE_64BIT)
> -+	    *p++ = 0x48;
> -+	  *p++ = 0x83;
> -+	  *p++ = 0xc;
> -+	  *p++ = 0x24;
> -+	  *p++ = 0x0;
> -+	}
> -+      else
> -+	{
> -+	  p = frag_more ((flag_code == CODE_64BIT ? 2 : 0) + 6 + 3);
> -+	  /* notl: 0xf71424.  */
> -+	  if (flag_code == CODE_64BIT)
> -+	    *p++ = 0x48;
> -+	  *p++ = 0xf7;
> -+	  *p++ = 0x14;
> -+	  *p++ = 0x24;
> -+	  /* notl: 0xf71424.  */
> -+	  if (flag_code == CODE_64BIT)
> -+	    *p++ = 0x48;
> -+	  *p++ = 0xf7;
> -+	  *p++ = 0x14;
> -+	  *p++ = 0x24;
> -+	}
> -+      *p++ = 0xf;
> -+      *p++ = 0xae;
> -+      *p = 0xe8;
> -+    }
> -+}
> -+
> - /* This is the guts of the machine-dependent assembler.  LINE points to a
> -    machine dependent instruction.  This function is supposed to emit
> -    the frags/bytes it assembles to.  */
> -@@ -4628,9 +4927,13 @@ md_assemble (char *line)
> -   if (i.rex != 0)
> -     add_prefix (REX_OPCODE | i.rex);
> - 
> -+  insert_lfence_before ();
> -+
> -   /* We are ready to output the insn.  */
> -   output_insn ();
> - 
> -+  insert_lfence_after ();
> -+
> -   last_insn.seg = now_seg;
> - 
> -   if (i.tm.opcode_modifier.isprefix)
> -@@ -12250,6 +12553,9 @@ const char *md_shortopts = "qnO::";
> - #define OPTION_MALIGN_BRANCH_PREFIX_SIZE (OPTION_MD_BASE + 28)
> - #define OPTION_MALIGN_BRANCH (OPTION_MD_BASE + 29)
> - #define OPTION_MBRANCHES_WITH_32B_BOUNDARIES (OPTION_MD_BASE + 30)
> -+#define OPTION_MLFENCE_AFTER_LOAD (OPTION_MD_BASE + 31)
> -+#define OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH (OPTION_MD_BASE + 32)
> -+#define OPTION_MLFENCE_BEFORE_RET (OPTION_MD_BASE + 33)
> - 
> - struct option md_longopts[] =
> - {
> -@@ -12289,6 +12595,10 @@ struct option md_longopts[] =
> -   {"malign-branch-prefix-size", required_argument, NULL, OPTION_MALIGN_BRANCH_PREFIX_SIZE},
> -   {"malign-branch", required_argument, NULL, OPTION_MALIGN_BRANCH},
> -   {"mbranches-within-32B-boundaries", no_argument, NULL, OPTION_MBRANCHES_WITH_32B_BOUNDARIES},
> -+  {"mlfence-after-load", required_argument, NULL, OPTION_MLFENCE_AFTER_LOAD},
> -+  {"mlfence-before-indirect-branch", required_argument, NULL,
> -+   OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH},
> -+  {"mlfence-before-ret", required_argument, NULL, OPTION_MLFENCE_BEFORE_RET},
> -   {"mamd64", no_argument, NULL, OPTION_MAMD64},
> -   {"mintel64", no_argument, NULL, OPTION_MINTEL64},
> -   {NULL, no_argument, NULL, 0}
> -@@ -12668,6 +12978,41 @@ md_parse_option (int c, const char *arg)
> -         as_fatal (_("invalid -mfence-as-lock-add= option: `%s'"), arg);
> -       break;
> - 
> -+    case OPTION_MLFENCE_AFTER_LOAD:
> -+      if (strcasecmp (arg, "yes") == 0)
> -+	lfence_after_load = 1;
> -+      else if (strcasecmp (arg, "no") == 0)
> -+	lfence_after_load = 0;
> -+      else
> -+        as_fatal (_("invalid -mlfence-after-load= option: `%s'"), arg);
> -+      break;
> -+
> -+    case OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH:
> -+      if (strcasecmp (arg, "all") == 0)
> -+	lfence_before_indirect_branch = lfence_branch_all;
> -+      else if (strcasecmp (arg, "memory") == 0)
> -+	lfence_before_indirect_branch = lfence_branch_memory;
> -+      else if (strcasecmp (arg, "register") == 0)
> -+	lfence_before_indirect_branch = lfence_branch_register;
> -+      else if (strcasecmp (arg, "none") == 0)
> -+	lfence_before_indirect_branch = lfence_branch_none;
> -+      else
> -+        as_fatal (_("invalid -mlfence-before-indirect-branch= option: `%s'"),
> -+		  arg);
> -+      break;
> -+
> -+    case OPTION_MLFENCE_BEFORE_RET:
> -+      if (strcasecmp (arg, "or") == 0)
> -+	lfence_before_ret = lfence_before_ret_or;
> -+      else if (strcasecmp (arg, "not") == 0)
> -+	lfence_before_ret = lfence_before_ret_not;
> -+      else if (strcasecmp (arg, "none") == 0)
> -+	lfence_before_ret = lfence_before_ret_none;
> -+      else
> -+        as_fatal (_("invalid -mlfence-before-ret= option: `%s'"),
> -+		  arg);
> -+      break;
> -+
> -     case OPTION_MRELAX_RELOCATIONS:
> -       if (strcasecmp (arg, "yes") == 0)
> -         generate_relax_relocations = 1;
> -@@ -13025,6 +13370,15 @@ md_show_usage (FILE *stream)
> -   -mbranches-within-32B-boundaries\n\
> -                           align branches within 32 byte boundary\n"));
> -   fprintf (stream, _("\
> -+  -mlfence-after-load=[no|yes] (default: no)\n\
> -+                          generate lfence after load\n"));
> -+  fprintf (stream, _("\
> -+  -mlfence-before-indirect-branch=[none|all|register|memory] (default: none)\n\
> -+                          generate lfence before indirect near branch\n"));
> -+  fprintf (stream, _("\
> -+  -mlfence-before-ret=[none|or|not] (default: none)\n\
> -+                          generate lfence before ret\n"));
> -+  fprintf (stream, _("\
> -   -mamd64                 accept only AMD64 ISA [default]\n"));
> -   fprintf (stream, _("\
> -   -mintel64               accept only Intel64 ISA\n"));
> -@@ -13254,6 +13608,16 @@ i386_cons_align (int ignore ATTRIBUTE_UNUSED)
> -       last_insn.kind = last_insn_directive;
> -       last_insn.name = "constant directive";
> -       last_insn.file = as_where (&last_insn.line);
> -+      if (lfence_before_ret != lfence_before_ret_none)
> -+	{
> -+	  if (lfence_before_indirect_branch != lfence_branch_none)
> -+	    as_warn (_("constant directive skips -mlfence-before-ret "
> -+		       "and -mlfence-before-indirect-branch"));
> -+	  else
> -+	    as_warn (_("constant directive skips -mlfence-before-ret"));
> -+	}
> -+      else if (lfence_before_indirect_branch != lfence_branch_none)
> -+	as_warn (_("constant directive skips -mlfence-before-indirect-branch"));
> -     }
> - }
> - 
> -diff --git a/gas/doc/c-i386.texi b/gas/doc/c-i386.texi
> -index c536759cb38..1dd99f91bb0 100644
> ---- a/gas/doc/c-i386.texi
> -+++ b/gas/doc/c-i386.texi
> -@@ -464,6 +464,49 @@ on an instruction.  It is equivalent to
> - @option{-malign-branch-prefix-size=5}.
> - The default doesn't align branches.
> - 
> -+@cindex @samp{-mlfence-after-load=} option, i386
> -+@cindex @samp{-mlfence-after-load=} option, x86-64
> -+@item -mlfence-after-load=@var{no}
> -+@itemx -mlfence-after-load=@var{yes}
> -+These options control whether the assembler should generate lfence
> -+after load instructions.  @option{-mlfence-after-load=@var{yes}} will
> -+generate lfence.  @option{-mlfence-after-load=@var{no}} will not generate
> -+lfence, which is the default.
> -+
> -+@cindex @samp{-mlfence-before-indirect-branch=} option, i386
> -+@cindex @samp{-mlfence-before-indirect-branch=} option, x86-64
> -+@item -mlfence-before-indirect-branch=@var{none}
> -+@item -mlfence-before-indirect-branch=@var{all}
> -+@item -mlfence-before-indirect-branch=@var{register}
> -+@itemx -mlfence-before-indirect-branch=@var{memory}
> -+These options control whether the assembler should generate lfence
> -+after indirect near branch instructions.
> -+@option{-mlfence-before-indirect-branch=@var{all}} will generate lfence
> -+after indirect near branch via register and issue a warning before
> -+indirect near branch via memory.
> -+@option{-mlfence-before-indirect-branch=@var{register}} will generate
> -+lfence after indirect near branch via register.
> -+@option{-mlfence-before-indirect-branch=@var{memory}} will issue a
> -+warning before indirect near branch via memory.
> -+@option{-mlfence-before-indirect-branch=@var{none}} will not generate
> -+lfence nor issue warning, which is the default.  Note that lfence won't
> -+be generated before indirect near branch via register with
> -+@option{-mlfence-after-load=@var{yes}} since lfence will be generated
> -+after loading branch target register.
> -+
> -+@cindex @samp{-mlfence-before-ret=} option, i386
> -+@cindex @samp{-mlfence-before-ret=} option, x86-64
> -+@item -mlfence-before-ret=@var{none}
> -+@item -mlfence-before-ret=@var{or}
> -+@itemx -mlfence-before-ret=@var{not}
> -+These options control whether the assembler should generate lfence
> -+before ret.  @option{-mlfence-before-ret=@var{or}} will generate
> -+generate or instruction with lfence.
> -+@option{-mlfence-before-ret=@var{not}} will generate not instruction
> -+with lfence.
> -+@option{-mlfence-before-ret=@var{none}} will not generate lfence,
> -+which is the default.
> -+
> - @cindex @samp{-mx86-used-note=} option, i386
> - @cindex @samp{-mx86-used-note=} option, x86-64
> - @item -mx86-used-note=@var{no}
> --- 
> -2.18.2
> diff --git a/meta/recipes-devtools/binutils/binutils_2.34.bb b/meta/recipes-devtools/binutils/binutils_2.35.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.34.bb
> rename to meta/recipes-devtools/binutils/binutils_2.35.bb
>
> 


--------------17047460B27431B495A01220
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgSGkg
S2hlbSw8YnI+CiAgICA8YnI+CiAgICBIYXMgdGhpcyBjb21wbGV0ZSBiaW51dGlscyAyLjM1IGNo
YW5nZSBiZWVuIHdlbGwgdGVzdGVkPzxicj4KICAgIDxicj4KICAgIFRoaXMgcGF0Y2ggY2F1c2Vz
IG15IHN5c3RlbSB0byBub3Qgd29yayBlbnRpcmVseS48YnI+CiAgICBJdCBhcHBlYXJzIHRoYXQg
bW9kcHJvYmUgaXMgbm90IHdvcmtpbmcgcHJvcGVybHkgb24ga2VybmVsIG9iamVjdHMuPGJyPgog
ICAgV2l0aG91dCB0aGlzIHBhdGNoIGV2ZXJ5dGhpbmcgd29ya3MgZmluZS48YnI+CiAgICBJdCB3
b3VsZCB0YWtlIG1lIHNvbWUgdGltZSB0byBkZWJ1ZyB3aGF0IGluIHRoaXMgY2hhbmdlIGJyZWFr
cwogICAgdGhpbmdzLjxicj4KICAgIDxicj4KICAgIEFsc28sIHdoZW4geW91IHJlZ2VuZXJhdGVk
IHRoZSBwYXRjaGVzIGZvciB0aGlzIHJlY2lwZSB5b3VyIHJlbmFtZWQKICAgIHRoZW0gd2hpY2gg
bWFrZXMgdGhlbSBtb3JlIGRpZmZpY3VsdCB0byBkaWZmIHdpdGggYSBkaXJlY3RvcnkKICAgIGNv
bXBhcmUuPGJyPgogICAgQnV0IHRoZXJlIGFyZSBuZXcgY2hhbmdlcyBpbiB0aGVtIGJleW9uZCBq
dXN0IGJlaW5nIHJlZ2VuZXJhdGVkIGZvcgogICAgMi4zNT88YnI+CiAgICA8YnI+CiAgICBSZWdh
cmRzLCA8YnI+CiAgICBTY290dDxicj4KICAgIDxicj4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRl
LXByZWZpeCI+T24gMjAyMC0wNy0zMCAxMjo1MyBhLm0uLCBLaGVtIFJhagogICAgICB3cm90ZTo8
YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1p
ZDoyMDIwMDczMDA3NTM0My4yMTE4NzIyLTEtcmFqLmtoZW1AZ21haWwuY29tIj4KICAgICAgPHBy
ZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5hc3NlbWJsZXIgc3VwcG9ydHMgZHdhcmYt
NSBmb3JtYXQgbGluZSBudW1iZXJzCmxpbmtlciBoYXMgLU0gLU1QIGdjYy1saWtlIG9wdGlvbgoK
Zm9yIGRldGFpbGVkIHJlbGVhc2Ugbm90ZXMgc2VlIFsxXQoKWzFdIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwv
aW5mby1nbnUvMjAyMC0wNy9tc2cwMDAwOC5odG1sIj5odHRwczovL2xpc3RzLmdudS5vcmcvYXJj
aGl2ZS9odG1sL2luZm8tZ251LzIwMjAtMDcvbXNnMDAwMDguaHRtbDwvYT4KClNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgotLS0K
IG1ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS90Y21vZGUtZGVmYXVsdC5pbmMgICB8ICAgIDIgKy0K
IC4uLi97YmludXRpbHMtMi4zNC5pbmMgPSZndDsgYmludXRpbHMtMi4zNS5pbmN9ICB8ICAgMjcg
Ky0KIC4uLi4zNC5iYiA9Jmd0OyBiaW51dGlscy1jcm9zcy1jYW5hZGlhbl8yLjM1LmJifSB8ICAg
IDAKIC4uLjM0LmJiID0mZ3Q7IGJpbnV0aWxzLWNyb3NzLXRlc3RzdWl0ZV8yLjM1LmJifSB8ICAg
IDAKIC4uLnMtY3Jvc3NfMi4zNC5iYiA9Jmd0OyBiaW51dGlscy1jcm9zc18yLjM1LmJifSB8ICAg
IDAKIC4uLnNzZGtfMi4zNC5iYiA9Jmd0OyBiaW51dGlscy1jcm9zc3Nka18yLjM1LmJifSB8ICAg
IDAKIC4uLnMtY3Jvc3NzZGstR2VuZXJhdGUtcmVsb2NhdGFibGUtU0RLcy5wYXRjaCB8ICAgMTEg
Ky0KIC4uLm8tbm90LWdlbmVyYXRlLWxpbmtlci1zY3JpcHQtZGlyZWN0by5wYXRjaCB8ICAgMTAg
Ky0KIC4uLmRrLVNlYXJjaC1mb3ItYWx0ZXJuYXRpdmUtbGQuc28uY29uZi5wYXRjaCB8ICAgMjkg
Ky0KIC4uLmlkZW4tdGhlLXJlZ2V4cC1mb3ItU0gtYXJjaGl0ZWN0dXJlcy5wYXRjaCB8ICAgMTUg
Ky0KIC4uLjAwNS1Qb2ludC1zY3JpcHRzLWxvY2F0aW9uLXRvLWxpYmRpci5wYXRjaCB8ICAgMTUg
Ky0KIC4uLi1SUEFUSC1lbnRyeS1pZi1MRF9SVU5fUEFUSC1pcy1ub3QtZS5wYXRjaCB8ICAgMTQg
Ky0KIC4uLnRyby1jb21waWxlci1wb2ludC10by10aGUtd3JvbmctaW5zLnBhdGNofSB8ICAgMTMg
Ky0KIC4uLnN5c3RlbS1kaXJlY3Rvcmllcy13aGVuLWNyb3NzLWxpbmtpLnBhdGNofSB8ICAgNzIg
Ky0KIC4uLi1kZWZhdWx0LWVtdWxhdGlvbi1mb3ItbWlwczY0LWxpbnV4LnBhdGNofSB8ICAgMTUg
Ky0KIC4uLiZndDsgMDAxMC1BZGQtc3VwcG9ydC1mb3ItTmV0bG9naWMtWExQLnBhdGNofSB8ICAg
NTUgKy0KIC4uLmVjdC1hc3NlbWJsaW5nLWZvci1wcGMtd2FpdC1tbmVtb25pYy5wYXRjaCB8ICAg
MzcgKwogLi4uID0mZ3Q7IDAwMTItRGV0ZWN0LTY0LWJpdC1NSVBTLXRhcmdldHMucGF0Y2h9IHwg
ICAgOSArLQogLi4ubC0yLjQucGF0Y2ggPSZndDsgMDAxMy1Vc2UtbGlidG9vbC0yLjQucGF0Y2h9
IHwgMjUyOSArKysrKysrKysrKysrKystLQogLi4uZWN0LWFzc2VtYmxpbmctZm9yLXBwYy13YWl0
LW1uZW1vbmljLnBhdGNoIHwgICAzMyAtCiAuLi4taW4tbGlidG9vbC13aGVuLXN5c3Jvb3QtaXMt
ZW5hYmxlZC5wYXRjaH0gfCAgICA5ICstCiAuLi4vMDAxNS1zeW5jLXdpdGgtT0UtbGlidG9vbC1j
aGFuZ2VzLnBhdGNoICAgfCAgICA5ICstCiAuLi5vci1jbGFuZy1iZWZvcmUtY2hlY2tpbmctZ2Nj
LXZlcnNpb24ucGF0Y2ggfCAgIDE0ICstCiAuLi5TQ1ZfTk9ORS1yZWxvYy1pbi10aGUtZXh0cmEt
dW51c2VkLXIucGF0Y2ggfCAgIDQyICsKIC4uLmR1bmRhbnQtcHJvZ3JhbV9uYW1lLWRlZmluaXRp
b24tZm5vLS5wYXRjaCB8ICAgNjEgLQogLi4uL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0yMDIwLTA1
NTEucGF0Y2ggICAgIHwgIDU0OSAtLS0tCiAuLi4ve2JpbnV0aWxzXzIuMzQuYmIgPSZndDsgYmlu
dXRpbHNfMi4zNS5iYn0gICAgfCAgICAwCiAyNyBmaWxlcyBjaGFuZ2VkLCAyNDkwIGluc2VydGlv
bnMoKyksIDEwODAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Jp
bnV0aWxzL3tiaW51dGlscy0yLjM0LmluYyA9Jmd0OyBiaW51dGlscy0yLjM1LmluY30gKDY4JSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMve2JpbnV0aWxzLWNyb3NzLWNh
bmFkaWFuXzIuMzQuYmIgPSZndDsgYmludXRpbHMtY3Jvc3MtY2FuYWRpYW5fMi4zNS5iYn0gKDEw
MCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL3tiaW51dGlscy1jcm9z
cy10ZXN0c3VpdGVfMi4zNC5iYiA9Jmd0OyBiaW51dGlscy1jcm9zcy10ZXN0c3VpdGVfMi4zNS5i
Yn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL3tiaW51dGls
cy1jcm9zc18yLjM0LmJiID0mZ3Q7IGJpbnV0aWxzLWNyb3NzXzIuMzUuYmJ9ICgxMDAlKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy97YmludXRpbHMtY3Jvc3NzZGtfMi4z
NC5iYiA9Jmd0OyBiaW51dGlscy1jcm9zc3Nka18yLjM1LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvezAwMDgtZG9uLXQtbGV0LXRoZS1k
aXN0cm8tY29tcGlsZXItcG9pbnQtdG8tdGhlLXdyb25nLWlucy5wYXRjaCA9Jmd0OyAwMDA3LWRv
bi10LWxldC10aGUtZGlzdHJvLWNvbXBpbGVyLXBvaW50LXRvLXRoZS13cm9uZy1pbnMucGF0Y2h9
ICg3OCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzL3sw
MDA5LXdhcm4tZm9yLXVzZXMtb2Ytc3lzdGVtLWRpcmVjdG9yaWVzLXdoZW4tY3Jvc3MtbGlua2ku
cGF0Y2ggPSZndDsgMDAwOC13YXJuLWZvci11c2VzLW9mLXN5c3RlbS1kaXJlY3Rvcmllcy13aGVu
LWNyb3NzLWxpbmtpLnBhdGNofSAoODElKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9i
aW51dGlscy9iaW51dGlscy97MDAxMS1DaGFuZ2UtZGVmYXVsdC1lbXVsYXRpb24tZm9yLW1pcHM2
NC1saW51eC5wYXRjaCA9Jmd0OyAwMDA5LUNoYW5nZS1kZWZhdWx0LWVtdWxhdGlvbi1mb3ItbWlw
czY0LWxpbnV4LnBhdGNofSAoODclKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51
dGlscy9iaW51dGlscy97MDAxMi1BZGQtc3VwcG9ydC1mb3ItTmV0bG9naWMtWExQLnBhdGNoID0m
Z3Q7IDAwMTAtQWRkLXN1cHBvcnQtZm9yLU5ldGxvZ2ljLVhMUC5wYXRjaH0gKDkzJSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAx
MS1maXgtdGhlLWluY29ycmVjdC1hc3NlbWJsaW5nLWZvci1wcGMtd2FpdC1tbmVtb25pYy5wYXRj
aAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy97MDAxNC1E
ZXRlY3QtNjQtYml0LU1JUFMtdGFyZ2V0cy5wYXRjaCA9Jmd0OyAwMDEyLURldGVjdC02NC1iaXQt
TUlQUy10YXJnZXRzLnBhdGNofSAoODYlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9i
aW51dGlscy9iaW51dGlscy97MDAwNy1Vc2UtbGlidG9vbC0yLjQucGF0Y2ggPSZndDsgMDAxMy1V
c2UtbGlidG9vbC0yLjQucGF0Y2h9ICg5MCUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTMtZml4LXRoZS1pbmNvcnJlY3QtYXNz
ZW1ibGluZy1mb3ItcHBjLXdhaXQtbW5lbW9uaWMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvezAwMTAtRml4LXJwYXRoLWluLWxpYnRvb2wtd2hl
bi1zeXNyb290LWlzLWVuYWJsZWQucGF0Y2ggPSZndDsgMDAxNC1GaXgtcnBhdGgtaW4tbGlidG9v
bC13aGVuLXN5c3Jvb3QtaXMtZW5hYmxlZC5wYXRjaH0gKDg5JSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxNy1Eby1ub3QtZW1p
dC1SX1JJU0NWX05PTkUtcmVsb2MtaW4tdGhlLWV4dHJhLXVudXNlZC1yLnBhdGNoCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTct
YmludXRpbHMtZHJvcC1yZWR1bmRhbnQtcHJvZ3JhbV9uYW1lLWRlZmluaXRpb24tZm5vLS5wYXRj
aAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51
dGlscy9DVkUtMjAyMC0wNTUxLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Jp
bnV0aWxzL3tiaW51dGlsc18yLjM0LmJiID0mZ3Q7IGJpbnV0aWxzXzIuMzUuYmJ9ICgxMDAlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS90Y21vZGUtZGVmYXVsdC5pbmMg
Yi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvdGNtb2RlLWRlZmF1bHQuaW5jCmluZGV4IDc5ZjUy
M2ZmM2QuLmM1Y2M0YmRjZGYgMTAwNjQ0Ci0tLSBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS90
Y21vZGUtZGVmYXVsdC5pbmMKKysrIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3RjbW9kZS1k
ZWZhdWx0LmluYwpAQCAtMTgsNyArMTgsNyBAQCBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9n
ZXR0ZXh0ID8/PSAiZ2V0dGV4dCIKIAogR0NDVkVSU0lPTiA/PSAiMTAuJSIKIFNES0dDQ1ZFUlNJ
T04gPz0gIiR7R0NDVkVSU0lPTn0iCi1CSU5VVkVSU0lPTiA/PSAiMi4zNCUiCitCSU5VVkVSU0lP
TiA/PSAiMi4zNSUiCiBHREJWRVJTSU9OID89ICI5LiUiCiBHTElCQ1ZFUlNJT04gPz0gIjIuMzIi
CiBMSU5VWExJQkNWRVJTSU9OID89ICI1LjQlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLTIuMzQuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2JpbnV0aWxzL2JpbnV0aWxzLTIuMzUuaW5jCnNpbWlsYXJpdHkgaW5kZXggNjglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy0yLjM0LmluYwpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLTIuMzUuaW5jCmlu
ZGV4IGY2NWZkYjczMjguLjlhYTVlN2VmZTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9iaW51dGlscy9iaW51dGlscy0yLjM0LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYmludXRpbHMvYmludXRpbHMtMi4zNS5pbmMKQEAgLTE2LDMyICsxNiwzMSBAQCBkZWYgYmlu
dXRpbHNfYnJhbmNoX3ZlcnNpb24oZCk6CiAKICMgV2hlbiB1cGdyYWRpbmcgdG8gMi4zNSwgcGxl
YXNlIG1ha2Ugc3VyZSB0aGVyZSBpcyBubyB0cmFpbGluZyAuMCwgc28KICMgdGhhdCB1cHN0cmVh
bSB2ZXJzaW9uIGNoZWNrIGNhbiB3b3JrIGNvcnJlY3RseS4KLVBWID0gIjIuMzQiCi1DVkVfVkVS
U0lPTiA9ICIyLjM0IgorUFYgPSAiMi4zNSIKK0NWRV9WRVJTSU9OID0gIjIuMzUiCiBCSU5VUFYg
PSAiJHtAYmludXRpbHNfYnJhbmNoX3ZlcnNpb24oZCl9IgogI0JSQU5DSCA9ICJiaW51dGlscy0k
e0JJTlVQVn0tYnJhbmNoIgotQlJBTkNIID89ICJiaW51dGlscy0yXzM0LWJyYW5jaCIKK0JSQU5D
SCA/PSAiYmludXRpbHMtMl8zNS1icmFuY2giCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VY
ID0gImJpbnV0aWxzLSg/UCZsdDtwdmVyJmd0O1xkK18oXGRfPykqKSIKIAotU1JDUkVWID89ICJk
NGI1MDk5OWIzYjI4N2I1Zjk4NGFkZTJmODczNGFhOGM5MzU5NDQwIgorU1JDUkVWID89ICI4OWE5
MDY1Njc0YTE0YThiZDk0YmIzMjZiMjdkMTlhMmYzNTgzZWZiIgogQklOVVRJTFNfR0lUX1VSSSA/
PSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L2JpbnV0aWxzLWdkYi5naXQ7YnJhbmNoPSR7QlJB
TkNIfTtwcm90b2NvbD1naXQiCiBTUkNfVVJJID0gIlwKICAgICAgJHtCSU5VVElMU19HSVRfVVJJ
fSBcCiAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8w
MDA0LWNvbmZpZ3VyZS13aWRlbi10aGUtcmVnZXhwLWZvci1TSC1hcmNoaXRlY3R1cmVzLnBhdGNo
Ij5maWxlOi8vMDAwNC1jb25maWd1cmUtd2lkZW4tdGhlLXJlZ2V4cC1mb3ItU0gtYXJjaGl0ZWN0
dXJlcy5wYXRjaDwvYT4gXAogICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBo
cmVmPSJmaWxlOi8vMDAwNS1Qb2ludC1zY3JpcHRzLWxvY2F0aW9uLXRvLWxpYmRpci5wYXRjaCI+
ZmlsZTovLzAwMDUtUG9pbnQtc2NyaXB0cy1sb2NhdGlvbi10by1saWJkaXIucGF0Y2g8L2E+IFwK
ICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMDYt
T25seS1nZW5lcmF0ZS1hbi1SUEFUSC1lbnRyeS1pZi1MRF9SVU5fUEFUSC1pcy1ub3QtZS5wYXRj
aCI+ZmlsZTovLzAwMDYtT25seS1nZW5lcmF0ZS1hbi1SUEFUSC1lbnRyeS1pZi1MRF9SVU5fUEFU
SC1pcy1ub3QtZS5wYXRjaDwvYT4gXAotICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0
ZXh0IiBocmVmPSJmaWxlOi8vMDAwNy1Vc2UtbGlidG9vbC0yLjQucGF0Y2giPmZpbGU6Ly8wMDA3
LVVzZS1saWJ0b29sLTIuNC5wYXRjaDwvYT4gXAotICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAwOC1kb24tdC1sZXQtdGhlLWRpc3Ryby1jb21waWxl
ci1wb2ludC10by10aGUtd3JvbmctaW5zLnBhdGNoIj5maWxlOi8vMDAwOC1kb24tdC1sZXQtdGhl
LWRpc3Ryby1jb21waWxlci1wb2ludC10by10aGUtd3JvbmctaW5zLnBhdGNoPC9hPiBcCi0gICAg
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDA5LXdhcm4t
Zm9yLXVzZXMtb2Ytc3lzdGVtLWRpcmVjdG9yaWVzLXdoZW4tY3Jvc3MtbGlua2kucGF0Y2giPmZp
bGU6Ly8wMDA5LXdhcm4tZm9yLXVzZXMtb2Ytc3lzdGVtLWRpcmVjdG9yaWVzLXdoZW4tY3Jvc3Mt
bGlua2kucGF0Y2g8L2E+IFwKLSAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIg
aHJlZj0iZmlsZTovLzAwMTAtRml4LXJwYXRoLWluLWxpYnRvb2wtd2hlbi1zeXNyb290LWlzLWVu
YWJsZWQucGF0Y2giPmZpbGU6Ly8wMDEwLUZpeC1ycGF0aC1pbi1saWJ0b29sLXdoZW4tc3lzcm9v
dC1pcy1lbmFibGVkLnBhdGNoPC9hPiBcCi0gICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJl
ZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDExLUNoYW5nZS1kZWZhdWx0LWVtdWxhdGlvbi1mb3ItbWlw
czY0LWxpbnV4LnBhdGNoIj5maWxlOi8vMDAxMS1DaGFuZ2UtZGVmYXVsdC1lbXVsYXRpb24tZm9y
LW1pcHM2NC1saW51eC5wYXRjaDwvYT4gXAotICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZy
ZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAxMi1BZGQtc3VwcG9ydC1mb3ItTmV0bG9naWMtWExQLnBh
dGNoIj5maWxlOi8vMDAxMi1BZGQtc3VwcG9ydC1mb3ItTmV0bG9naWMtWExQLnBhdGNoPC9hPiBc
Ci0gICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDEz
LWZpeC10aGUtaW5jb3JyZWN0LWFzc2VtYmxpbmctZm9yLXBwYy13YWl0LW1uZW1vbmljLnBhdGNo
Ij5maWxlOi8vMDAxMy1maXgtdGhlLWluY29ycmVjdC1hc3NlbWJsaW5nLWZvci1wcGMtd2FpdC1t
bmVtb25pYy5wYXRjaDwvYT4gXAotICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0
IiBocmVmPSJmaWxlOi8vMDAxNC1EZXRlY3QtNjQtYml0LU1JUFMtdGFyZ2V0cy5wYXRjaCI+Zmls
ZTovLzAwMTQtRGV0ZWN0LTY0LWJpdC1NSVBTLXRhcmdldHMucGF0Y2g8L2E+IFwKKyAgICAgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMDctZG9uLXQtbGV0
LXRoZS1kaXN0cm8tY29tcGlsZXItcG9pbnQtdG8tdGhlLXdyb25nLWlucy5wYXRjaCI+ZmlsZTov
LzAwMDctZG9uLXQtbGV0LXRoZS1kaXN0cm8tY29tcGlsZXItcG9pbnQtdG8tdGhlLXdyb25nLWlu
cy5wYXRjaDwvYT4gXAorICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJmaWxlOi8vMDAwOC13YXJuLWZvci11c2VzLW9mLXN5c3RlbS1kaXJlY3Rvcmllcy13aGVuLWNy
b3NzLWxpbmtpLnBhdGNoIj5maWxlOi8vMDAwOC13YXJuLWZvci11c2VzLW9mLXN5c3RlbS1kaXJl
Y3Rvcmllcy13aGVuLWNyb3NzLWxpbmtpLnBhdGNoPC9hPiBcCisgICAgIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9ImZpbGU6Ly8wMDA5LUNoYW5nZS1kZWZhdWx0LWVtdWxh
dGlvbi1mb3ItbWlwczY0LWxpbnV4LnBhdGNoIj5maWxlOi8vMDAwOS1DaGFuZ2UtZGVmYXVsdC1l
bXVsYXRpb24tZm9yLW1pcHM2NC1saW51eC5wYXRjaDwvYT4gXAorICAgICA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAxMC1BZGQtc3VwcG9ydC1mb3ItTmV0
bG9naWMtWExQLnBhdGNoIj5maWxlOi8vMDAxMC1BZGQtc3VwcG9ydC1mb3ItTmV0bG9naWMtWExQ
LnBhdGNoPC9hPiBcCisgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9
ImZpbGU6Ly8wMDExLWZpeC10aGUtaW5jb3JyZWN0LWFzc2VtYmxpbmctZm9yLXBwYy13YWl0LW1u
ZW1vbmljLnBhdGNoIj5maWxlOi8vMDAxMS1maXgtdGhlLWluY29ycmVjdC1hc3NlbWJsaW5nLWZv
ci1wcGMtd2FpdC1tbmVtb25pYy5wYXRjaDwvYT4gXAorICAgICA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAxMi1EZXRlY3QtNjQtYml0LU1JUFMtdGFyZ2V0
cy5wYXRjaCI+ZmlsZTovLzAwMTItRGV0ZWN0LTY0LWJpdC1NSVBTLXRhcmdldHMucGF0Y2g8L2E+
IFwKKyAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAw
MTMtVXNlLWxpYnRvb2wtMi40LnBhdGNoIj5maWxlOi8vMDAxMy1Vc2UtbGlidG9vbC0yLjQucGF0
Y2g8L2E+IFwKKyAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmls
ZTovLzAwMTQtRml4LXJwYXRoLWluLWxpYnRvb2wtd2hlbi1zeXNyb290LWlzLWVuYWJsZWQucGF0
Y2giPmZpbGU6Ly8wMDE0LUZpeC1ycGF0aC1pbi1saWJ0b29sLXdoZW4tc3lzcm9vdC1pcy1lbmFi
bGVkLnBhdGNoPC9hPiBcCiAgICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhy
ZWY9ImZpbGU6Ly8wMDE1LXN5bmMtd2l0aC1PRS1saWJ0b29sLWNoYW5nZXMucGF0Y2giPmZpbGU6
Ly8wMDE1LXN5bmMtd2l0aC1PRS1saWJ0b29sLWNoYW5nZXMucGF0Y2g8L2E+IFwKICAgICAgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iZmlsZTovLzAwMTYtQ2hlY2stZm9y
LWNsYW5nLWJlZm9yZS1jaGVja2luZy1nY2MtdmVyc2lvbi5wYXRjaCI+ZmlsZTovLzAwMTYtQ2hl
Y2stZm9yLWNsYW5nLWJlZm9yZS1jaGVja2luZy1nY2MtdmVyc2lvbi5wYXRjaDwvYT4gXAotICAg
ICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJmaWxlOi8vMDAxNy1iaW51
dGlscy1kcm9wLXJlZHVuZGFudC1wcm9ncmFtX25hbWUtZGVmaW5pdGlvbi1mbm8tLnBhdGNoIj5m
aWxlOi8vMDAxNy1iaW51dGlscy1kcm9wLXJlZHVuZGFudC1wcm9ncmFtX25hbWUtZGVmaW5pdGlv
bi1mbm8tLnBhdGNoPC9hPiBcCi0gICAgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQi
IGhyZWY9ImZpbGU6Ly9DVkUtMjAyMC0wNTUxLnBhdGNoIj5maWxlOi8vQ1ZFLTIwMjAtMDU1MS5w
YXRjaDwvYT4gXAorICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJm
aWxlOi8vMDAxNy1Eby1ub3QtZW1pdC1SX1JJU0NWX05PTkUtcmVsb2MtaW4tdGhlLWV4dHJhLXVu
dXNlZC1yLnBhdGNoIj5maWxlOi8vMDAxNy1Eby1ub3QtZW1pdC1SX1JJU0NWX05PTkUtcmVsb2Mt
aW4tdGhlLWV4dHJhLXVudXNlZC1yLnBhdGNoPC9hPiBcCiAiCiBTICA9ICIke1dPUktESVJ9L2dp
dCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1j
cm9zcy1jYW5hZGlhbl8yLjM0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2Jp
bnV0aWxzLWNyb3NzLWNhbmFkaWFuXzIuMzUuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1jcm9zcy1jYW5h
ZGlhbl8yLjM0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmlu
dXRpbHMtY3Jvc3MtY2FuYWRpYW5fMi4zNS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLWNyb3NzLXRlc3RzdWl0ZV8yLjM0LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLWNyb3NzLXRlc3RzdWl0ZV8yLjM1LmJi
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YmludXRpbHMvYmludXRpbHMtY3Jvc3MtdGVzdHN1aXRlXzIuMzQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1jcm9zcy10ZXN0c3VpdGVfMi4zNS5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLWNy
b3NzXzIuMzQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMtY3Jv
c3NfMi4zNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLWNyb3NzXzIuMzQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1jcm9zc18yLjM1LmJiCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMtY3Jvc3NzZGtfMi4z
NC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy1jcm9zc3Nka18y
LjM1LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYmludXRpbHMvYmludXRpbHMtY3Jvc3NzZGtfMi4zNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLWNyb3Nzc2RrXzIuMzUuYmIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDAxLWJpbnV0
aWxzLWNyb3Nzc2RrLUdlbmVyYXRlLXJlbG9jYXRhYmxlLVNES3MucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwMS1iaW51dGlscy1jcm9zc3Nkay1HZW5l
cmF0ZS1yZWxvY2F0YWJsZS1TREtzLnBhdGNoCmluZGV4IDE0ZTg0MjE1ZTAuLjBlNjJkNDc2MTYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDAx
LWJpbnV0aWxzLWNyb3Nzc2RrLUdlbmVyYXRlLXJlbG9jYXRhYmxlLVNES3MucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDEtYmludXRpbHMtY3Jv
c3NzZGstR2VuZXJhdGUtcmVsb2NhdGFibGUtU0RLcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZy
b20gYjA1ZjBiZTEzYWFkZjBiMjZhMGIzOWRmZTdkYWYyYzQ3YTMwMDMzOCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYjhkMTgyODY1MDgxZDE3NTQ5ZmI5YTRiOWJjMzA2MmI1MjZjYWY2
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDty
YWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogTW9uLCAyIE1hciAyMDE1IDAxOjU4OjU0
ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGJpbnV0aWxzLWNyb3Nzc2RrOiBHZW5lcmF0ZSByZWxv
Y2F0YWJsZSBTREtzCitTdWJqZWN0OiBbUEFUQ0ggMDEvMTddIGJpbnV0aWxzLWNyb3Nzc2RrOiBH
ZW5lcmF0ZSByZWxvY2F0YWJsZSBTREtzCiAKIFRoaXMgcGF0Y2ggd2lsbCBtb2RpZnkgdGhlIEVM
RiBsaW5rZXIgc2NyaXB0cyBzbyB0aGF0IHRoZSBjcm9zc3NkawogbGlua2VyIHdpbGwgZ2VuZXJh
dGUgYmluYXJpZXMgd2l0aCBhIDQwOTYgYnl0ZXMgUFRfSU5URVJQIHNlY3Rpb24uIFdoZW4gdGhl
IGJpbmFyaWVzCkBAIC0xOCw3ICsxOCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGQvZ2Vuc2NyaXB0
cy5zaCBiL2xkL2dlbnNjcmlwdHMuc2gKLWluZGV4IDAzMzkyZDI2NWMuLjQzNTY4OWVhMTQgMTAw
NzU1CitpbmRleCAwMzM5MmQyNjVjNy4uNDM1Njg5ZWExNDQgMTAwNzU1CiAtLS0gYS9sZC9nZW5z
Y3JpcHRzLnNoCiArKysgYi9sZC9nZW5zY3JpcHRzLnNoCiBAQCAtMzA0LDYgKzMwNCw3IEBAIERB
VEFfQUxJR05NRU5UX3U9IiR7REFUQV9BTElHTk1FTlRfdS0ke0RBVEFfQUxJR05NRU5UX3J9fTxh
IGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpAQC00Myw3KzQzLDdA
QGluZGV4MDMzOTJkMjY1Yy4uNDM1Njg5ZWExNDEwMDc1NURBVEFfQUxJR05NRU5UPSR7REFUQV9B
TElHTk1FTlRffVJFTE9DQVRJTkc9Ij4iCkBAIC00Myw3ICs0Myw3IEBAIGluZGV4IDAzMzkyZDI2
NWMuLjQzNTY4OWVhMTQgMTAwNzU1CiAgREFUQV9BTElHTk1FTlQ9JHtEQVRBX0FMSUdOTUVOVF99
CiAgUkVMT0NBVElORz0iPC9hPiAiCiBkaWZmIC0tZ2l0IGEvbGQvc2NyaXB0dGVtcGwvZWxmLnNj
IGIvbGQvc2NyaXB0dGVtcGwvZWxmLnNjCi1pbmRleCAwYjhiMzJhNDQwLi5lZTZiNzEwNzVkIDEw
MDY0NAoraW5kZXggMGI4YjMyYTQ0MDcuLmVlNmI3MTA3NWQ3IDEwMDY0NAogLS0tIGEvbGQvc2Ny
aXB0dGVtcGwvZWxmLnNjCiArKysgYi9sZC9zY3JpcHR0ZW1wbC9lbGYuc2MKIEBAIC0xNDAsOCAr
MTQwLDggQEAgaWYgdGVzdCAteiAiJERBVEFfU0VHTUVOVF9BTElHTiI7IHRoZW4KQEAgLTU3LDMg
KzU3LDYgQEAgaW5kZXggMGI4YjMyYTQ0MC4uZWU2YjcxMDc1ZCAxMDA2NDQKICBmaQogIGlmIHRl
c3QgLXogIiRQTFQiOyB0aGVuCiAgICBJUExUPSIuaXBsdCAgICAgICAgICR7UkVMT0NBVElORy0w
fSA6IHsgKiguaXBsdCkgfSIKKy0tIAorMi4yOC4wCisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDAyLWJpbnV0aWxzLWNyb3NzLURvLW5vdC1n
ZW5lcmF0ZS1saW5rZXItc2NyaXB0LWRpcmVjdG8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYmludXRpbHMvYmludXRpbHMvMDAwMi1iaW51dGlscy1jcm9zcy1Eby1ub3QtZ2VuZXJhdGUt
bGlua2VyLXNjcmlwdC1kaXJlY3RvLnBhdGNoCmluZGV4IDkxZGU5NGI3NjguLjQxZGZmMDViMjUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDAy
LWJpbnV0aWxzLWNyb3NzLURvLW5vdC1nZW5lcmF0ZS1saW5rZXItc2NyaXB0LWRpcmVjdG8ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDItYmlu
dXRpbHMtY3Jvc3MtRG8tbm90LWdlbmVyYXRlLWxpbmtlci1zY3JpcHQtZGlyZWN0by5wYXRjaApA
QCAtMSw3ICsxLDggQEAKLUZyb20gNmQ3OWY4MTMzNmU3Y2JlNzI3YjVhNTExMzRmNWQzMTRhNDU1
Mzc5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGQxNGY4ZjMzM2E5YjUxOTIwMjI0
NmNlNzc5ZjNlMzgwNDkxODI2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0g
UmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hl
bUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTogTW9uLCA2
IE1hciAyMDE3IDIzOjM3OjA1IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIGJpbnV0aWxzLWNyb3Nz
OiBEbyBub3QgZ2VuZXJhdGUgbGlua2VyIHNjcmlwdCBkaXJlY3RvcmllcworU3ViamVjdDogW1BB
VENIIDAyLzE3XSBiaW51dGlscy1jcm9zczogRG8gbm90IGdlbmVyYXRlIGxpbmtlciBzY3JpcHQK
KyBkaXJlY3RvcmllcwogCiBXZSBkb24ndCBwbGFjZSB0YXJnZXQgbGlicmFyaWVzIHdpdGhpbiAk
e2V4ZWNfcHJlZml4fSwgd2UnZCBhbHdheXMgcGxhY2UgdGhlc2UKIHdpdGhpbiB0aGUgdGFyZ2V0
IHN5c3Jvb3Qgd2l0aGluIHRoZSBzdGFuZGFyZCBsaWJyYXJ5IGRpcmVjdG9yaWVzLiBXb3JzZSwg
dGhlCkBAIC0yMiw3ICsyMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZs
dDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDEgZmlsZSBjaGFuZ2VkLCAyNSBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL2xkL2dlbnNjcmlwdHMuc2ggYi9sZC9nZW5zY3JpcHRzLnNo
Ci1pbmRleCA0MzU2ODllYTE0Li5jZmY4YTE0NjdmIDEwMDc1NQoraW5kZXggNDM1Njg5ZWExNDQu
LmNmZjhhMTQ2N2Y5IDEwMDc1NQogLS0tIGEvbGQvZ2Vuc2NyaXB0cy5zaAogKysrIGIvbGQvZ2Vu
c2NyaXB0cy5zaAogQEAgLTIzNSwzMSArMjM1LDYgQEAgYXBwZW5kX3RvX2xpYl9wYXRoKCkKQEAg
LTU3LDMgKzU4LDYgQEAgaW5kZXggNDM1Njg5ZWExNC4uY2ZmOGExNDY3ZiAxMDA3NTUKICBpZiBb
ICJ4JHtMSUJfUEFUSH0iID0gIngiIF0gJmFtcDsmYW1wOyBbICJ4JHtVU0VfTElCUEFUSH0iID0g
eHllcyBdIDsgdGhlbgogICAgbGlicz0ke05BVElWRV9MSUJfRElSU30KICAgIGlmIFsgIngke05B
VElWRX0iID0gInh5ZXMiIF0gOyB0aGVuCistLSAKKzIuMjguMAorCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwMy1iaW51dGlscy1uYXRpdmVz
ZGstU2VhcmNoLWZvci1hbHRlcm5hdGl2ZS1sZC5zby5jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDMtYmludXRpbHMtbmF0aXZlc2RrLVNlYXJj
aC1mb3ItYWx0ZXJuYXRpdmUtbGQuc28uY29uZi5wYXRjaAppbmRleCA0YjRkNzNkMjFkLi4yOGRh
ZjU4Zjc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRp
bHMvMDAwMy1iaW51dGlscy1uYXRpdmVzZGstU2VhcmNoLWZvci1hbHRlcm5hdGl2ZS1sZC5zby5j
b25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8w
MDAzLWJpbnV0aWxzLW5hdGl2ZXNkay1TZWFyY2gtZm9yLWFsdGVybmF0aXZlLWxkLnNvLmNvbmYu
cGF0Y2gKQEAgLTEsOCArMSw4IEBACi1Gcm9tIGQwNTdiMjE1ZjExNGY2MTU4YjQwMTBhYjQ0YTE5
Y2FlOWRjYzgzODYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNiYmVjNzQ5ZWM5ZmU2
ODFhZGU2ODEyYzQ4YzU0MWE3NTJmY2ZmZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSaWNoYXJkIFB1cmRpZSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZyI+Jmx0O3JpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcmZ3Q7PC9hPgogRGF0ZTogV2VkLCAxOSBGZWIgMjAyMCAw
OTo1MToxNiAtMDgwMAotU3ViamVjdDogW1BBVENIXSBiaW51dGlscy1uYXRpdmVzZGs6IFNlYXJj
aCBmb3IgYWx0ZXJuYXRpdmUgbGQuc28uY29uZiBpbiBTREsKLSBpbnN0YWxsYXRpb24KK1N1Ympl
Y3Q6IFtQQVRDSCAwMy8xN10gYmludXRpbHMtbmF0aXZlc2RrOiBTZWFyY2ggZm9yIGFsdGVybmF0
aXZlIGxkLnNvLmNvbmYKKyBpbiBTREsgaW5zdGFsbGF0aW9uCiAKIFdlIG5lZWQgYmludXRpbHMg
dG8gbG9vayBhdCBvdXIgbGQuc28uY29uZiBmaWxlIHdpdGhpbiB0aGUgU0RLIHRvIGVuc3VyZQog
d2Ugc2VhcmNoIHRoZSBTREsncyBsaWJkaXJzIGFzIHdlbGwgYXMgdGhvc2UgZnJvbSB0aGUgaG9z
dCBzeXN0ZW0uCkBAIC0yOSw3ICsyOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDUgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGQvTWFrZWZpbGUu
YW0gYi9sZC9NYWtlZmlsZS5hbQotaW5kZXggNGE5Yjg0MDRiNy4uMWMxMzJkM2NlNCAxMDA2NDQK
K2luZGV4IDAyYzRmYzE2Mzk1Li5hNTc2MjIyN2YwYSAxMDA2NDQKIC0tLSBhL2xkL01ha2VmaWxl
LmFtCiArKysgYi9sZC9NYWtlZmlsZS5hbQogQEAgLTQyLDcgKzQyLDggQEAgWkxJQklOQyA9IEB6
bGliaW5jQApAQCAtNDMsMTAgKzQzLDEwIEBAIGluZGV4IDRhOWI4NDA0YjcuLjFjMTMyZDNjZTQg
MTAwNjQ0CiAgTk9fV0VSUk9SID0gQE5PX1dFUlJPUkAKICBBTV9DRkxBR1MgPSAkKFdBUk5fQ0ZM
QUdTKSAkKEVMRl9DTEZBR1MpCiBkaWZmIC0tZ2l0IGEvbGQvTWFrZWZpbGUuaW4gYi9sZC9NYWtl
ZmlsZS5pbgotaW5kZXggNDZkOWIxNDA3Ny4uZTQ1M2JjMWIzMyAxMDA2NDQKK2luZGV4IDJmZTEy
ZTE0ZjYzLi44ZjBjODNhYzhkMiAxMDA2NDQKIC0tLSBhL2xkL01ha2VmaWxlLmluCiArKysgYi9s
ZC9NYWtlZmlsZS5pbgotQEAgLTU1NSw3ICs1NTUsOCBAQCBaTElCID0gQHpsaWJkaXJAIC1segor
QEAgLTU0OCw3ICs1NDgsOCBAQCBaTElCID0gQHpsaWJkaXJAIC1segogIFpMSUJJTkMgPSBAemxp
YmluY0AKICBFTEZfQ0xGQUdTID0gLURFTEZfTElTVF9PUFRJT05TPUBlbGZfbGlzdF9vcHRpb25z
QCBcCiAgCSAgIC1ERUxGX1NITElCX0xJU1RfT1BUSU9OUz1AZWxmX3NobGliX2xpc3Rfb3B0aW9u
c0AgXApAQCAtNTUsMjUgKzU1LDI1IEBAIGluZGV4IDQ2ZDliMTQwNzcuLmU0NTNiYzFiMzMgMTAw
NjQ0CiArICAgICAgICAgICAtRFNZU0NPTkZESVI9IlwiJChzeXNjb25mZGlyKVwiIgogIAogIEFN
X0NGTEFHUyA9ICQoV0FSTl9DRkxBR1MpICQoRUxGX0NMRkFHUykKLSBARU5BQkxFX1BMVUdJTlNf
RkFMU0VAUExVR0lOX0MgPSAKKyAKIGRpZmYgLS1naXQgYS9sZC9sZGVsZi5jIGIvbGQvbGRlbGYu
YwotaW5kZXggMmUyN2NmNDhhOC4uYTA5NWQ2YWFjNSAxMDA2NDQKK2luZGV4IGJhZGEzYWRlMmQ3
Li5iNDc4NDAwOWQ3YSAxMDA2NDQKIC0tLSBhL2xkL2xkZWxmLmMKICsrKyBiL2xkL2xkZWxmLmMK
LUBAIC05MDcsNyArOTA3LDcgQEAgbGRlbGZfY2hlY2tfbGRfc29fY29uZiAoY29uc3Qgc3RydWN0
IGJmZF9saW5rX25lZWRlZF9saXN0ICpsLCBpbnQgZm9yY2UsCitAQCAtOTExLDcgKzkxMSw3IEBA
IGxkZWxmX2NoZWNrX2xkX3NvX2NvbmYgKGNvbnN0IHN0cnVjdCBiZmRfbGlua19uZWVkZWRfbGlz
dCAqbCwgaW50IGZvcmNlLAogIAogICAgICAgIGluZm8ucGF0aCA9IE5VTEw7CiAgICAgICAgaW5m
by5sZW4gPSBpbmZvLmFsbG9jID0gMDsKIC0gICAgICB0bXBwYXRoID0gY29uY2F0IChsZF9zeXNy
b290LCBwcmVmaXgsICIvZXRjL2xkLnNvLmNvbmYiLAotKyAgICAgIHRtcHBhdGggPSBjb25jYXQg
KGxkX3N5c2NvbmZkaXIsICIvbGQuc28uY29uZiIsCisrICAgICAgdG1wcGF0aCA9IGNvbmNhdCAo
bGRfc3lzY29uZmRpciwgIi9ldGMvbGQuc28uY29uZiIsCiAgCQkJKGNvbnN0IGNoYXIgKikgTlVM
TCk7CiAgICAgICAgaWYgKCFsZGVsZl9wYXJzZV9sZF9zb19jb25mICgmYW1wO2luZm8sIHRtcHBh
dGgpKQogIAl7CiBkaWZmIC0tZ2l0IGEvbGQvbGRtYWluLmMgYi9sZC9sZG1haW4uYwotaW5kZXgg
YzRhZjEwZjRlOS4uZGExYWQxNzc2MyAxMDA2NDQKK2luZGV4IDA4YmU5MDMwY2I1Li5mNWM1YTMz
NjMyMCAxMDA2NDQKIC0tLSBhL2xkL2xkbWFpbi5jCiArKysgYi9sZC9sZG1haW4uYwotQEAgLTY5
LDYgKzY5LDcgQEAgY2hhciAqcHJvZ3JhbV9uYW1lOworQEAgLTcwLDYgKzcwLDcgQEAgY2hhciAq
cHJvZ3JhbV9uYW1lOwogIAogIC8qIFRoZSBwcmVmaXggZm9yIHN5c3RlbSBsaWJyYXJ5IGRpcmVj
dG9yaWVzLiAgKi8KICBjb25zdCBjaGFyICpsZF9zeXNyb290OwpAQCAtODIsNyArODIsNyBAQCBp
bmRleCBjNGFmMTBmNGU5Li5kYTFhZDE3NzYzIDEwMDY0NAogIC8qIFRoZSBjYW5vbmljYWwgcmVw
cmVzZW50YXRpb24gb2YgbGRfc3lzcm9vdC4gICovCiAgY2hhciAqbGRfY2Fub25fc3lzcm9vdDsK
IGRpZmYgLS1naXQgYS9sZC9sZG1haW4uaCBiL2xkL2xkbWFpbi5oCi1pbmRleCAwZjA1ODIxZDFl
Li41NGMzNmE5NGNlIDEwMDY0NAoraW5kZXggYWM3ZGI1NzIwZDUuLjFjYmUxNzcxOTEyIDEwMDY0
NAogLS0tIGEvbGQvbGRtYWluLmgKICsrKyBiL2xkL2xkbWFpbi5oCiBAQCAtMjMsNiArMjMsNyBA
QApAQCAtOTMsMyArOTMsNiBAQCBpbmRleCAwZjA1ODIxZDFlLi41NGMzNmE5NGNlIDEwMDY0NAog
IGV4dGVybiBjaGFyICpsZF9jYW5vbl9zeXNyb290OwogIGV4dGVybiBpbnQgbGRfY2Fub25fc3lz
cm9vdF9sZW47CiAgZXh0ZXJuIEZJTEUgKnNhdmVkX3NjcmlwdF9oYW5kbGU7CistLSAKKzIuMjgu
MAorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMv
MDAwNC1jb25maWd1cmUtd2lkZW4tdGhlLXJlZ2V4cC1mb3ItU0gtYXJjaGl0ZWN0dXJlcy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDA0LWNvbmZpZ3Vy
ZS13aWRlbi10aGUtcmVnZXhwLWZvci1TSC1hcmNoaXRlY3R1cmVzLnBhdGNoCmluZGV4IGQxMGEx
NDRlZDUuLjIzODFjN2I4NWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51
dGlscy9iaW51dGlscy8wMDA0LWNvbmZpZ3VyZS13aWRlbi10aGUtcmVnZXhwLWZvci1TSC1hcmNo
aXRlY3R1cmVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51
dGlscy8wMDA0LWNvbmZpZ3VyZS13aWRlbi10aGUtcmVnZXhwLWZvci1TSC1hcmNoaXRlY3R1cmVz
LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBmN2FkOGE0NGMxMGYwMWUwMzY4MGYwOTNmZDdh
ZjcxYzlmNWU4NjA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNjFjMmMzMTMxOTZj
MDk1ZDEyZDE3Y2VjZjBhMDY5MTA3ZGQ2MjliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRl
OiBNb24sIDIgTWFyIDIwMTUgMDE6MDc6MzMgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gY29uZmln
dXJlOiB3aWRlbiB0aGUgcmVnZXhwIGZvciBTSCBhcmNoaXRlY3R1cmVzCitTdWJqZWN0OiBbUEFU
Q0ggMDQvMTddIGNvbmZpZ3VyZTogd2lkZW4gdGhlIHJlZ2V4cCBmb3IgU0ggYXJjaGl0ZWN0dXJl
cwogCiBncHJvZiBuZWVkcyB0byBrbm93IGFib3V0IHVjbGliYwogCkBAIC0xNCwxMCArMTQsMTAg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNv
bSZndDs8L2E+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4IDkxZGM0MmY2
YzcuLjdjMWI3NDdlN2MgMTAwNzU1CitpbmRleCA1NGQwMzM5YWI5ZS4uNjc4MmY4YjZhYjggMTAw
NzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTM5MTUsNyArMzkxNSw3
IEBAIGNhc2UgIiR7dGFyZ2V0fSIgaW4KK0BAIC0zOTM3LDcgKzM5MzcsNyBAQCBjYXNlICIke3Rh
cmdldH0iIGluCiAgICBudnB0eCotKi0qKQogICAgICBub2NvbmZpZ2RpcnM9IiRub2NvbmZpZ2Rp
cnMgdGFyZ2V0LWxpYnNzcCB0YXJnZXQtbGlic3RkYysrLXYzIHRhcmdldC1saWJvYmpjIgogICAg
ICA7OwpAQCAtMjcsMTAgKzI3LDEwIEBAIGluZGV4IDkxZGM0MmY2YzcuLjdjMWI3NDdlN2MgMTAw
NzU1CiAgICAgICAgc2gqLSotZWxmKQogICAgICAgICAgIDs7CiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA0YmQ4NjlhNjNhLi43MTg3YjM0ZGZjIDEwMDY0
NAoraW5kZXggYTkxMGM0ZmQ2YmEuLjU1YmViMWRlYTQ2IDEwMDY0NAogLS0tIGEvY29uZmlndXJl
LmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0xMTU5LDcgKzExNTksNyBAQCBjYXNlICIke3Rh
cmdldH0iIGluCitAQCAtMTE3OCw3ICsxMTc4LDcgQEAgY2FzZSAiJHt0YXJnZXR9IiBpbgogICAg
bnZwdHgqLSotKikKICAgICAgbm9jb25maWdkaXJzPSIkbm9jb25maWdkaXJzIHRhcmdldC1saWJz
c3AgdGFyZ2V0LWxpYnN0ZGMrKy12MyB0YXJnZXQtbGlib2JqYyIKICAgICAgOzsKQEAgLTM5LDMg
KzM5LDYgQEAgaW5kZXggNGJkODY5YTYzYS4uNzE4N2IzNGRmYyAxMDA2NDQKICAgICAgY2FzZSAi
JHt0YXJnZXR9IiBpbgogICAgICAgIHNoKi0qLWVsZikKICAgICAgICAgICA7OworLS0gCisyLjI4
LjAKKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxz
LzAwMDUtUG9pbnQtc2NyaXB0cy1sb2NhdGlvbi10by1saWJkaXIucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwNS1Qb2ludC1zY3JpcHRzLWxvY2F0aW9u
LXRvLWxpYmRpci5wYXRjaAppbmRleCAzYmEwYmE2M2YxLi5jMzFhMGJjOWE2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwNS1Qb2ludC1zY3Jp
cHRzLWxvY2F0aW9uLXRvLWxpYmRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YmludXRpbHMvYmludXRpbHMvMDAwNS1Qb2ludC1zY3JpcHRzLWxvY2F0aW9uLXRvLWxpYmRpci5w
YXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMDhiMDg4YjdkZDNkOTcwN2VkNjY5NDhhNzI3MWZm
YjQzOGVlZGRmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzliNDc4YjdlNTJmYjFi
ODkyYTM5MmYzYzM3NTBiOTAyM2NmYWJjOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpy
YWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0ZTog
TW9uLCAyIE1hciAyMDE1IDAxOjA5OjU4ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIFBvaW50IHNj
cmlwdHMgbG9jYXRpb24gdG8gbGliZGlyCitTdWJqZWN0OiBbUEFUQ0ggMDUvMTddIFBvaW50IHNj
cmlwdHMgbG9jYXRpb24gdG8gbGliZGlyCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbZGViaWFuIHBhdGNoXQogCkBAIC0xMiwxMCArMTIsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5r
aGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiAgMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9s
ZC9NYWtlZmlsZS5hbSBiL2xkL01ha2VmaWxlLmFtCi1pbmRleCAxYzEzMmQzY2U0Li44ZDgyY2Yy
ZTE2IDEwMDY0NAoraW5kZXggYTU3NjIyMjdmMGEuLmUxYzY2NTg5OGYzIDEwMDY0NAogLS0tIGEv
bGQvTWFrZWZpbGUuYW0KICsrKyBiL2xkL01ha2VmaWxlLmFtCi1AQCAtNjQsNyArNjQsNyBAQCBl
bmRpZgorQEAgLTUxLDcgKzUxLDcgQEAgQU1fQ0ZMQUdTID0gJChXQVJOX0NGTEFHUykgJChFTEZf
Q0xGQUdTKQogICMgV2UgcHV0IHRoZSBzY3JpcHRzIGluIHRoZSBkaXJlY3RvcnkgJChzY3JpcHRk
aXIpL2xkc2NyaXB0cy4KICAjIFdlIGNhbid0IHB1dCB0aGUgc2NyaXB0cyBpbiAkKGRhdGFkaXIp
IGJlY2F1c2UgdGhlIFNFQVJDSF9ESVIKICAjIGRpcmVjdGl2ZXMgbmVlZCB0byBiZSBkaWZmZXJl
bnQgZm9yIG5hdGl2ZSBhbmQgY3Jvc3MgbGlua2Vycy4KQEAgLTI1LDEwICsyNSwxMCBAQCBpbmRl
eCAxYzEzMmQzY2U0Li44ZDgyY2YyZTE2IDEwMDY0NAogIEVNVUwgPSBARU1VTEAKICBFTVVMQVRJ
T05fT0ZJTEVTID0gQEVNVUxBVElPTl9PRklMRVNACiBkaWZmIC0tZ2l0IGEvbGQvTWFrZWZpbGUu
aW4gYi9sZC9NYWtlZmlsZS5pbgotaW5kZXggZTQ1M2JjMWIzMy4uMmRjZDcyZjgwOSAxMDA2NDQK
K2luZGV4IDhmMGM4M2FjOGQyLi5hY2MyNGVjNDEzMCAxMDA2NDQKIC0tLSBhL2xkL01ha2VmaWxl
LmluCiArKysgYi9sZC9NYWtlZmlsZS5pbgotQEAgLTU3Myw3ICs1NzMsNyBAQCBBTV9DRkxBR1Mg
PSAkKFdBUk5fQ0ZMQUdTKSAkKEVMRl9DTEZBR1MpCitAQCAtNTU2LDcgKzU1Niw3IEBAIEFNX0NG
TEFHUyA9ICQoV0FSTl9DRkxBR1MpICQoRUxGX0NMRkFHUykKICAjIFdlIHB1dCB0aGUgc2NyaXB0
cyBpbiB0aGUgZGlyZWN0b3J5ICQoc2NyaXB0ZGlyKS9sZHNjcmlwdHMuCiAgIyBXZSBjYW4ndCBw
dXQgdGhlIHNjcmlwdHMgaW4gJChkYXRhZGlyKSBiZWNhdXNlIHRoZSBTRUFSQ0hfRElSCiAgIyBk
aXJlY3RpdmVzIG5lZWQgdG8gYmUgZGlmZmVyZW50IGZvciBuYXRpdmUgYW5kIGNyb3NzIGxpbmtl
cnMuCkBAIC0zNywzICszNyw2IEBAIGluZGV4IGU0NTNiYzFiMzMuLjJkY2Q3MmY4MDkgMTAwNjQ0
CiAgQkFTRURJUiA9ICQoc3JjZGlyKS8uLgogIEJGRERJUiA9ICQoQkFTRURJUikvYmZkCiAgSU5D
RElSID0gJChCQVNFRElSKS9pbmNsdWRlCistLSAKKzIuMjguMAorCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwNi1Pbmx5LWdlbmVyYXRlLWFu
LVJQQVRILWVudHJ5LWlmLUxEX1JVTl9QQVRILWlzLW5vdC1lLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDYtT25seS1nZW5lcmF0ZS1hbi1SUEFUSC1l
bnRyeS1pZi1MRF9SVU5fUEFUSC1pcy1ub3QtZS5wYXRjaAppbmRleCBkOTIwNzI5MjA0Li42NTRi
NjRmZjc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRp
bHMvMDAwNi1Pbmx5LWdlbmVyYXRlLWFuLVJQQVRILWVudHJ5LWlmLUxEX1JVTl9QQVRILWlzLW5v
dC1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8w
MDA2LU9ubHktZ2VuZXJhdGUtYW4tUlBBVEgtZW50cnktaWYtTERfUlVOX1BBVEgtaXMtbm90LWUu
cGF0Y2gKQEAgLTEsNyArMSw4IEBACi1Gcm9tIDEzNzkxNjM2YWJmNTE4ZjBkYjIwOWRjNTFjMjk0
NDVkODA0MjFmMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU5NjQwZGRmMTExMDRh
NjA0Y2NmN2MwNzhhNDgzNTlkNzExYzJmOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6
IE1vbiwgMiBNYXIgMjAxNSAwMToyNzoxNyArMDAwMAotU3ViamVjdDogW1BBVENIXSBPbmx5IGdl
bmVyYXRlIGFuIFJQQVRIIGVudHJ5IGlmIExEX1JVTl9QQVRIIGlzIG5vdCBlbXB0eQorU3ViamVj
dDogW1BBVENIIDA2LzE3XSBPbmx5IGdlbmVyYXRlIGFuIFJQQVRIIGVudHJ5IGlmIExEX1JVTl9Q
QVRIIGlzIG5vdAorIGVtcHR5CiAKIGZvciBjYXNlcyB3aGVyZSAtcnBhdGggaXNuJ3Qgc3BlY2lm
aWVkLiBkZWJpYW4gKCMxNTEwMjQpCiAKQEAgLTE0LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9sZC9sZGVsZi5jIGIv
bGQvbGRlbGYuYwotaW5kZXggYTA5NWQ2YWFjNS4uYTI0NTVhODc5MyAxMDA2NDQKK2luZGV4IGI0
Nzg0MDA5ZDdhLi41NDE3NzJmNDYwNCAxMDA2NDQKIC0tLSBhL2xkL2xkZWxmLmMKICsrKyBiL2xk
L2xkZWxmLmMKLUBAIC0xMjI5LDYgKzEyMjksOCBAQCBsZGVsZl9hZnRlcl9vcGVuIChpbnQgdXNl
X2xpYnBhdGgsIGludCBuYXRpdmUsIGludCBpc19saW51eCwgaW50IGlzX2ZyZWVic2QsCitAQCAt
MTI0Nyw2ICsxMjQ3LDggQEAgbGRlbGZfYWZ0ZXJfb3BlbiAoaW50IHVzZV9saWJwYXRoLCBpbnQg
bmF0aXZlLCBpbnQgaXNfbGludXgsIGludCBpc19mcmVlYnNkLAogIAkJICAmYW1wOyZhbXA7IGNv
bW1hbmRfbGluZS5ycGF0aCA9PSBOVUxMKQogIAkJewogIAkJICBwYXRoID0gKGNvbnN0IGNoYXIg
KikgZ2V0ZW52ICgiTERfUlVOX1BBVEg8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86KTtAQC0yNiw3KzI3LDdAQGluZGV4YTA5NWQ2YWFjNS4uYTI0NTVhODc5MzEw
MDY0NGlmKHBhdGgmYW1wOyZhbXA7bGRlbGZfc2VhcmNoX25lZWRlZChwYXRoLCZhbXA7bixmb3Jj
ZSxpc19saW51eCxlbGZzaXplKSktQEAtMTU3Myw2KzE1NzUsOEBAbGRlbGZfYmVmb3JlX2FsbG9j
YXRpb24oY2hhciphdWRpdCxjaGFyKmRlcGF1ZGl0LCtAQC0xNjA1LDYrMTYwNyw4QEBsZGVsZl9i
ZWZvcmVfYWxsb2NhdGlvbihjaGFyKmF1ZGl0LGNoYXIqZGVwYXVkaXQscnBhdGg9Y29tbWFuZF9s
aW5lLnJwYXRoO2lmKHJwYXRoPT1OVUxMKXJwYXRoPShjb25zdGNoYXIqKWdldGVudigiPiIpOwpA
QCAtMjYsNyArMjcsNyBAQCBpbmRleCBhMDk1ZDZhYWM1Li5hMjQ1NWE4NzkzIDEwMDY0NAogIAkJ
ICBpZiAocGF0aAogIAkJICAgICAgJmFtcDsmYW1wOyBsZGVsZl9zZWFyY2hfbmVlZGVkIChwYXRo
LCAmYW1wO24sIGZvcmNlLAogIAkJCQkJICAgICAgaXNfbGludXgsIGVsZnNpemUpKQotQEAgLTE1
NzMsNiArMTU3NSw4IEBAIGxkZWxmX2JlZm9yZV9hbGxvY2F0aW9uIChjaGFyICphdWRpdCwgY2hh
ciAqZGVwYXVkaXQsCitAQCAtMTYwNSw2ICsxNjA3LDggQEAgbGRlbGZfYmVmb3JlX2FsbG9jYXRp
b24gKGNoYXIgKmF1ZGl0LCBjaGFyICpkZXBhdWRpdCwKICAgIHJwYXRoID0gY29tbWFuZF9saW5l
LnJwYXRoOwogICAgaWYgKHJwYXRoID09IE5VTEwpCiAgICAgIHJwYXRoID0gKGNvbnN0IGNoYXIg
KikgZ2V0ZW52ICgiPC9hPkxEX1JVTl9QQVRIIik7CkBAIC0zNSwzICszNiw2IEBAIGluZGV4IGEw
OTVkNmFhYzUuLmEyNDU1YTg3OTMgMTAwNjQ0CiAgCiAgICBmb3IgKGFiZmQgPSBsaW5rX2luZm8u
aW5wdXRfYmZkczsgYWJmZDsgYWJmZCA9IGFiZmQtJmd0O2xpbmsubmV4dCkKICAgICAgaWYgKGJm
ZF9nZXRfZmxhdm91ciAoYWJmZCkgPT0gYmZkX3RhcmdldF9lbGZfZmxhdm91cikKKy0tIAorMi4y
OC4wCisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGls
cy8wMDA4LWRvbi10LWxldC10aGUtZGlzdHJvLWNvbXBpbGVyLXBvaW50LXRvLXRoZS13cm9uZy1p
bnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwNy1k
b24tdC1sZXQtdGhlLWRpc3Ryby1jb21waWxlci1wb2ludC10by10aGUtd3JvbmctaW5zLnBhdGNo
CnNpbWlsYXJpdHkgaW5kZXggNzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9i
aW51dGlscy9iaW51dGlscy8wMDA4LWRvbi10LWxldC10aGUtZGlzdHJvLWNvbXBpbGVyLXBvaW50
LXRvLXRoZS13cm9uZy1pbnMucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9i
aW51dGlscy9iaW51dGlscy8wMDA3LWRvbi10LWxldC10aGUtZGlzdHJvLWNvbXBpbGVyLXBvaW50
LXRvLXRoZS13cm9uZy1pbnMucGF0Y2gKaW5kZXggYjBlOTRhYjFjYi4uN2Y4ZmM5YTVjMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDgtZG9u
LXQtbGV0LXRoZS1kaXN0cm8tY29tcGlsZXItcG9pbnQtdG8tdGhlLXdyb25nLWlucy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwNy1kb24tdC1s
ZXQtdGhlLWRpc3Ryby1jb21waWxlci1wb2ludC10by10aGUtd3JvbmctaW5zLnBhdGNoCkBAIC0x
LDggKzEsOCBAQAotRnJvbSBlMzZhNGUwNWY5MDBiYmU2YThkNzQ0YTkzZjNhNDA3YmM1NWM5NmY3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYjgxNTA4YjlhZjc2ZGIyOTJjZDc1NjQz
MmIwMzAzNWNiODE1N2UwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWog
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdt
YWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBNb24sIDIgTWFy
IDIwMTUgMDE6Mzk6MDEgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gZG9uJ3QgbGV0IHRoZSBkaXN0
cm8gY29tcGlsZXIgcG9pbnQgdG8gdGhlIHdyb25nIGluc3RhbGxhdGlvbgotIGxvY2F0aW9uCitT
dWJqZWN0OiBbUEFUQ0ggMDcvMTddIGRvbid0IGxldCB0aGUgZGlzdHJvIGNvbXBpbGVyIHBvaW50
IHRvIHRoZSB3cm9uZworIGluc3RhbGxhdGlvbiBsb2NhdGlvbgogCiBUaGFua3MgdG8gUlAgZm9y
IGhlbHBpbmcgZmluZCB0aGUgc291cmNlIGNvZGUgY2F1c2luZyB0aGUgaXNzdWUuCiAKQEAgLTE3
LDEwICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmto
ZW1AZ21haWwuY29tJmd0OzwvYT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWJpYmVydHkvTWFrZWZpbGUuaW4gYi9saWJp
YmVydHkvTWFrZWZpbGUuaW4KLWluZGV4IGZlNzM4ZDBkYjQuLjI3ZDgxOGYyNTMgMTAwNjQ0Citp
bmRleCA4OTVmNzAxYmNkMC4uOTdhNTNmMTViYjYgMTAwNjQ0CiAtLS0gYS9saWJpYmVydHkvTWFr
ZWZpbGUuaW4KICsrKyBiL2xpYmliZXJ0eS9NYWtlZmlsZS5pbgotQEAgLTM2NSw3ICszNjUsOCBA
QCBpbnN0YWxsLXN0cmlwOiBpbnN0YWxsCitAQCAtMzY3LDcgKzM2Nyw4IEBAIGluc3RhbGwtc3Ry
aXA6IGluc3RhbGwKICAjIG11bHRpbGliLXNwZWNpZmljIGZsYWdzLCBpdCdzIG92ZXJyaWRkZW4g
YnkgRkxBR1NfVE9fUEFTUyBmcm9tIHRoZQogICMgZGVmYXVsdCBtdWx0aWxpYiwgc28gd2UgaGF2
ZSB0byB0YWtlIENGTEFHUyBpbnRvIGFjY291bnQgYXMgd2VsbCwKICAjIHNpbmNlIGl0IHdpbGwg
YmUgcGFzc2VkIHRoZSBtdWx0aWxpYiBmbGFncy4KQEAgLTMwLDMgKzMwLDYgQEAgaW5kZXggZmU3
MzhkMGRiNC4uMjdkODE4ZjI1MyAxMDA2NDQKICBpbnN0YWxsX3RvX2xpYmRpcjogYWxsCiAgCWlm
IHRlc3QgLW4gIiR7dGFyZ2V0X2hlYWRlcl9kaXJ9IjsgdGhlbiBcCiAgCQkke21raW5zdGFsbGRp
cnN9ICQoREVTVERJUikkKGxpYmRpcikvJChNVUxUSU9TRElSKTsgXAorLS0gCisyLjI4LjAKKwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDkt
d2Fybi1mb3ItdXNlcy1vZi1zeXN0ZW0tZGlyZWN0b3JpZXMtd2hlbi1jcm9zcy1saW5raS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDA4LXdhcm4tZm9y
LXVzZXMtb2Ytc3lzdGVtLWRpcmVjdG9yaWVzLXdoZW4tY3Jvc3MtbGlua2kucGF0Y2gKc2ltaWxh
cml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxz
L2JpbnV0aWxzLzAwMDktd2Fybi1mb3ItdXNlcy1vZi1zeXN0ZW0tZGlyZWN0b3JpZXMtd2hlbi1j
cm9zcy1saW5raS5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxz
L2JpbnV0aWxzLzAwMDgtd2Fybi1mb3ItdXNlcy1vZi1zeXN0ZW0tZGlyZWN0b3JpZXMtd2hlbi1j
cm9zcy1saW5raS5wYXRjaAppbmRleCAxMWE4MTEwZDQwLi4yMzU2YzZhNjBmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwOS13YXJuLWZvci11
c2VzLW9mLXN5c3RlbS1kaXJlY3Rvcmllcy13aGVuLWNyb3NzLWxpbmtpLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDA4LXdhcm4tZm9yLXVzZXMt
b2Ytc3lzdGVtLWRpcmVjdG9yaWVzLXdoZW4tY3Jvc3MtbGlua2kucGF0Y2gKQEAgLTEsNyArMSw3
IEBACi1Gcm9tIDdiMjRmODFlMDRjOWQwMGQ5NmRlN2RiZDI1MGJlYWRlNmQyYzZlNDQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQxMzA3NWFmYmRiMTZlN2NjMDU1MTE2ODJjYTllM2M4
ODBhY2I1YTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29t
Ij4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IEZyaSwgMTUgSmFuIDIwMTYg
MDY6MzE6MDkgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gd2FybiBmb3IgdXNlcyBvZiBzeXN0ZW0g
ZGlyZWN0b3JpZXMgd2hlbiBjcm9zcyBsaW5raW5nCitTdWJqZWN0OiBbUEFUQ0ggMDgvMTddIHdh
cm4gZm9yIHVzZXMgb2Ygc3lzdGVtIGRpcmVjdG9yaWVzIHdoZW4gY3Jvc3MgbGlua2luZwogCiAy
MDA4LTA3LTAyICBKb3NlcGggTXllcnMgIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzpqb3NlcGhAY29kZXNvdXJjZXJ5LmNvbSI+Jmx0O2pvc2VwaEBjb2Rlc291
cmNlcnkuY29tJmd0OzwvYT4KIApAQCAtNTcsMTYgKzU3LDE2IEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWou
a2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIGxkL2xkLmgg
ICAgICAgICB8ICA4ICsrKysrKysrCiAgbGQvbGQudGV4aSAgICAgIHwgMTIgKysrKysrKysrKysr
CiAgbGQvbGRmaWxlLmMgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKLSBsZC9sZGxleC5oICAg
ICAgfCAgMiArKworIGxkL2xkbGV4LmggICAgICB8ICA1ICsrKysrCiAgbGQvbGRtYWluLmMgICAg
IHwgIDIgKysKLSBsZC9sZXhzdXAuYyAgICAgfCAxNSArKysrKysrKysrKysrKysKLSA5IGZpbGVz
IGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKykKKyBsZC9sZXhzdXAuYyAgICAgfCAyNyArKysrKysr
KysrKysrKysrKysrKysrKysrKysKKyA5IGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCsp
CiAKIGRpZmYgLS1naXQgYS9sZC9jb25maWcuaW4gYi9sZC9jb25maWcuaW4KLWluZGV4IGQ5M2M5
YjA4MzAuLjVkYTI3NDJiZWEgMTAwNjQ0CitpbmRleCBmMTcxMjEwNzM2Ny4uMzA4ZTAxNzNjMTYg
MTAwNjQ0CiAtLS0gYS9sZC9jb25maWcuaW4KICsrKyBiL2xkL2NvbmZpZy5pbgotQEAgLTMxLDYg
KzMxLDkgQEAKK0BAIC00MCw2ICs0MCw5IEBACiAgICAgbGFuZ3VhZ2UgaXMgcmVxdWVzdGVkLiAq
LwogICN1bmRlZiBFTkFCTEVfTkxTCiAgCkBAIC03Nyw3ICs3Nyw3IEBAIGluZGV4IGQ5M2M5YjA4
MzAuLjVkYTI3NDJiZWEgMTAwNjQ0CiAgI3VuZGVmIEVYVFJBX1NITElCX0VYVEVOU0lPTgogIAog
ZGlmZiAtLWdpdCBhL2xkL2NvbmZpZ3VyZSBiL2xkL2NvbmZpZ3VyZQotaW5kZXggODExMTM0YTUw
My4uZjhjMTdjMTlhZSAxMDA3NTUKK2luZGV4IGYwOGNlOTk2OWVhLi4xYzg3MmMwZGI1ZiAxMDA3
NTUKIC0tLSBhL2xkL2NvbmZpZ3VyZQogKysrIGIvbGQvY29uZmlndXJlCiBAQCAtODI2LDYgKzgy
Niw3IEBAIHdpdGhfbGliX3BhdGgKQEAgLTg4LDcgKzg4LDcgQEAgaW5kZXggODExMTM0YTUwMy4u
ZjhjMTdjMTlhZSAxMDA3NTUKICBlbmFibGVfZ29sZAogIGVuYWJsZV9nb3QKICBlbmFibGVfY29t
cHJlc3NlZF9kZWJ1Z19zZWN0aW9ucwotQEAgLTE0OTEsNiArMTQ5Miw4IEBAIE9wdGlvbmFsIEZl
YXR1cmVzOgorQEAgLTE0OTMsNiArMTQ5NCw4IEBAIE9wdGlvbmFsIEZlYXR1cmVzOgogICAgLS1k
aXNhYmxlLWxhcmdlZmlsZSAgICAgb21pdCBzdXBwb3J0IGZvciBsYXJnZSBmaWxlcwogICAgLS1l
bmFibGUtdGFyZ2V0cyAgICAgICAgYWx0ZXJuYXRpdmUgdGFyZ2V0IGNvbmZpZ3VyYXRpb25zCiAg
ICAtLWVuYWJsZS02NC1iaXQtYmZkICAgICA2NC1iaXQgc3VwcG9ydCAob24gaG9zdHMgd2l0aCBu
YXJyb3dlciB3b3JkIHNpemVzKQpAQCAtOTcsNyArOTcsNyBAQCBpbmRleCA4MTExMzRhNTAzLi5m
OGMxN2MxOWFlIDEwMDc1NQogICAgLS1lbmFibGUtZ29sZFs9QVJHXSAgICAgYnVpbGQgZ29sZCBb
QVJHPXtkZWZhdWx0LHllcyxub31dCiAgICAtLWVuYWJsZS1nb3Q9Jmx0O3R5cGUmZ3Q7ICAgICBH
T1QgaGFuZGxpbmcgc2NoZW1lICh0YXJnZXQsIHNpbmdsZSwgbmVnYXRpdmUsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtdWx0aWdvdCkKLUBAIC0xNTc4OCw2ICsxNTc5MSwxOSBAQCBmaQor
QEAgLTE1NzkzLDYgKzE1Nzk2LDE5IEBAIGZpCiAgCiAgCiAgCkBAIC0xMTgsNyArMTE4LDcgQEAg
aW5kZXggODExMTM0YTUwMy4uZjhjMTdjMTlhZSAxMDA3NTUKICBpZiB0ZXN0ICIke2VuYWJsZV9n
b2xkK3NldH0iID0gc2V0OyB0aGVuIDoKICAgIGVuYWJsZXZhbD0kZW5hYmxlX2dvbGQ7IGNhc2Ug
IiR7ZW5hYmxldmFsfSIgaW4KIGRpZmYgLS1naXQgYS9sZC9jb25maWd1cmUuYWMgYi9sZC9jb25m
aWd1cmUuYWMKLWluZGV4IGI1ZTg0OWQ4NGEuLjIyZTAyMmVjMDMgMTAwNjQ0CitpbmRleCA1YTQ5
MzhhZmRiMC4uZGJiYmRlNzRiMDQgMTAwNjQ0CiAtLS0gYS9sZC9jb25maWd1cmUuYWMKICsrKyBi
L2xkL2NvbmZpZ3VyZS5hYwogQEAgLTk0LDYgKzk0LDE2IEBAIEFDX1NVQlNUKHVzZV9zeXNyb290
KQpAQCAtMTM5LDcgKzEzOSw3IEBAIGluZGV4IGI1ZTg0OWQ4NGEuLjIyZTAyMmVjMDMgMTAwNjQ0
CiAgZG5sICJpbnN0YWxsX2FzX2RlZmF1bHQiIGlzIHNldCB0byBmYWxzZSBpZiBnb2xkIGlzIHRo
ZSBkZWZhdWx0IGxpbmtlci4KICBkbmwgImluc3RhbGxlZF9saW5rZXI8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86aXN0aGVpbnN0YWxsZWRCRkRsaW5rZXJuYW1l
LmRpZmYtLWdpdGEvbGQvbGQuaGIvbGQvbGQuaC1pbmRleDcxZmQ3ODEyNjcuLjVjNzg0MzEwMGIx
MDA2NDQraW5kZXgxNzkwZGM4MWE2Ni4uNzNmODMyZWIxNjkxMDA2NDQtLS1hL2xkL2xkLmgrKyti
L2xkL2xkLmhAQC0xNjYsNisxNjYsMTRAQHR5cGVkZWZzdHJ1Y3RAQC0xNTgsMTArMTU4LDEwQEBp
bmRleDcxZmQ3ODEyNjcuLjVjNzg0MzEwMGIxMDA2NDRlbnVtZW5kaWFuX2VudW1lbmRpYW47ZGlm
Zi0tZ2l0YS9sZC9sZC50ZXhpYi9sZC9sZC50ZXhpLWluZGV4ZWI3YmNiOTkzMy4uM2M3M2Q0NDVh
MDEwMDY0NCtpbmRleDJhOTNlOTQ1NmFjLi4zZWViNzA2MDdmZDEwMDY0NC0tLWEvbGQvbGQudGV4
aSsrK2IvbGQvbGQudGV4aS1AQC0yNTUxLDYrMjU1MSwxOEBAc3RyaW5naWRlbnRpZnlpbmd0aGVv
cmlnaW5hbGxpbmtlZGZpbGVkb2Vzbm90Y2hhbmdlLitAQC0yNjU1LDYrMjY1NSwxOEBAc3RyaW5n
aWRlbnRpZnlpbmd0aGVvcmlnaW5hbGxpbmtlZGZpbGVkb2Vzbm90Y2hhbmdlLlBhc3NpbmdAY29k
ZXtub25lfWZvckB2YXJ7c3R5bGV9ZGlzYWJsZXN0aGVzZXR0aW5nZnJvbWFueUBjb2Rley0tYnVp
bGQtaWR9b3B0aW9uc2VhcmxpZXJvbnRoZWNvbW1hbmRsaW5lLkBALTE4MSw3KzE4MSw3QEBpbmRl
eGViN2JjYjk5MzMuLjNjNzNkNDQ1YTAxMDA2NDRAY21hbmVuZGRpZmYtLWdpdGEvbGQvbGRmaWxl
LmNiL2xkL2xkZmlsZS5jLWluZGV4NDExZjdkZGY5Ny4uMTdkYjE2YzJjYzEwMDY0NCtpbmRleGUz
OTE3MGI1ZDk0Li5mYWRjMjQ4YTE0MDEwMDY0NC0tLWEvbGQvbGRmaWxlLmMrKytiL2xkL2xkZmls
ZS5jQEAtMTE3LDYrMTE3LDIzQEBsZGZpbGVfYWRkX2xpYnJhcnlfcGF0aChjb25zdGNoYXIqbmFt
ZSxiZmRfYm9vbGVhbmNtZGxpbmUpQEAtMjA5LDIzKzIwOSwyNkBAaW5kZXg0MTFmN2RkZjk3Li4x
N2RiMTZjMmNjMTAwNjQ0LypUcnl0b29wZW5hQkZEZm9yYWxhbmdfaW5wdXRfc3RhdGVtZW50Liov
ZGlmZi0tZ2l0YS9sZC9sZGxleC5oYi9sZC9sZGxleC5oLWluZGV4NTI4N2YxOWE3Zi4uNTUwOTZl
NGZjOTEwMDY0NCtpbmRleDVlYTA4M2ViZWIzLi45NDFkYzVmM2RjODEwMDY0NC0tLWEvbGQvbGRs
ZXguaCsrK2IvbGQvbGRsZXguaC1AQC0xNTAsNisxNTAsOEBAZW51bW9wdGlvbl92YWx1ZXMtT1BU
SU9OX0ZPUkNFX0dST1VQX0FMTE9DQVRJT04sLU9QVElPTl9QUklOVF9NQVBfRElTQ0FSREVELC1P
UFRJT05fTk9fUFJJTlRfTUFQX0RJU0NBUkRFRCwrQEAtMTU1LDYrMTU1LDExQEBlbnVtb3B0aW9u
X3ZhbHVlcytPUFRJT05fTk9OX0NPTlRJR1VPVVNfUkVHSU9OUywrT1BUSU9OX05PTl9DT05USUdV
T1VTX1JFR0lPTlNfV0FSTklOR1MsK09QVElPTl9ERVBFTkRFTkNZX0ZJTEUsKytPUFRJT05fQ1RG
X1ZBUklBQkxFUywrK09QVElPTl9OT19DVEZfVkFSSUFCTEVTLCsrT1BUSU9OX0NURl9TSEFSRV9U
WVBFUywrT1BUSU9OX05PX1BPSVNPTl9TWVNURU1fRElSRUNUT1JJRVMsK09QVElPTl9FUlJPUl9Q
T0lTT05fU1lTVEVNX0RJUkVDVE9SSUVTLH07LypUaGVpbml0aWFscGFyc2Vyc3RhdGVzLiovZGlm
Zi0tZ2l0YS9sZC9sZG1haW4uY2IvbGQvbGRtYWluLmMtaW5kZXhkYTFhZDE3NzYzLi4xMmQwYjA3
ZDhhMTAwNjQ0K2luZGV4ZjVjNWEzMzYzMjAuLjUxNmJhMDM2MGUyMTAwNjQ0LS0tYS9sZC9sZG1h
aW4uYysrK2IvbGQvbGRtYWluLmMtQEAtMjc0LDYrMjc0LDhAQG1haW4oaW50YXJnYyxjaGFyKiph
cmd2KStAQC0zMjIsNiszMjIsOEBAbWFpbihpbnRhcmdjLGNoYXIqKmFyZ3YpY29tbWFuZF9saW5l
Lndhcm5fbWlzbWF0Y2g9VFJVRTtjb21tYW5kX2xpbmUud2Fybl9zZWFyY2hfbWlzbWF0Y2g9VFJV
RTtjb21tYW5kX2xpbmUuY2hlY2tfc2VjdGlvbl9hZGRyZXNzZXM9LTE7QEAtMjM1LDEzKzIzOCwy
NUBAaW5kZXhkYTFhZDE3NzYzLi4xMmQwYjA3ZDhhMTAwNjQ0LypXZWluaXRpYWxpemVERU1BTkdM
SU5HYmFzZWRvbnRoZWVudmlyb25tZW50dmFyaWFibGVDT0xMRUNUX05PX0RFTUFOR0xFLlRoZWdj
Y2NvbGxlY3QycHJvZ3JhbXdpbGxkZW1hbmdsZXRoZWRpZmYtLWdpdGEvbGQvbGV4c3VwLmNiL2xk
L2xleHN1cC5jLWluZGV4M2QxNWNjNDkxZC4uMGU4YjRmMmI3YTEwMDY0NCtpbmRleDU4YzZjMDc4
MzI1Li44NzllN2JiNzY1ODEwMDY0NC0tLWEvbGQvbGV4c3VwLmMrKytiL2xkL2xleHN1cC5jLUBA
LTU1MCw2KzU1MCwxNEBAc3RhdGljY29uc3RzdHJ1Y3RsZF9vcHRpb25sZF9vcHRpb25zW109K0BA
LTU3Miw2KzU3MiwyNkBAc3RhdGljY29uc3RzdHJ1Y3RsZF9vcHRpb25sZF9vcHRpb25zW109e3si
PiIgaXMgdGhlIGluc3RhbGxlZCBCRkQgbGlua2VyIG5hbWUuCiBkaWZmIC0tZ2l0IGEvbGQvbGQu
aCBiL2xkL2xkLmgKLWluZGV4IDcxZmQ3ODEyNjcuLjVjNzg0MzEwMGIgMTAwNjQ0CitpbmRleCAx
NzkwZGM4MWE2Ni4uNzNmODMyZWIxNjkgMTAwNjQ0CiAtLS0gYS9sZC9sZC5oCiArKysgYi9sZC9s
ZC5oCiBAQCAtMTY2LDYgKzE2NiwxNCBAQCB0eXBlZGVmIHN0cnVjdApAQCAtMTU4LDEwICsxNTgs
MTAgQEAgaW5kZXggNzFmZDc4MTI2Ny4uNWM3ODQzMTAwYiAxMDA2NDQKICAgIGVudW0gZW5kaWFu
X2VudW0gZW5kaWFuOwogIAogZGlmZiAtLWdpdCBhL2xkL2xkLnRleGkgYi9sZC9sZC50ZXhpCi1p
bmRleCBlYjdiY2I5OTMzLi4zYzczZDQ0NWEwIDEwMDY0NAoraW5kZXggMmE5M2U5NDU2YWMuLjNl
ZWI3MDYwN2ZkIDEwMDY0NAogLS0tIGEvbGQvbGQudGV4aQogKysrIGIvbGQvbGQudGV4aQotQEAg
LTI1NTEsNiArMjU1MSwxOCBAQCBzdHJpbmcgaWRlbnRpZnlpbmcgdGhlIG9yaWdpbmFsIGxpbmtl
ZCBmaWxlIGRvZXMgbm90IGNoYW5nZS4KK0BAIC0yNjU1LDYgKzI2NTUsMTggQEAgc3RyaW5nIGlk
ZW50aWZ5aW5nIHRoZSBvcmlnaW5hbCBsaW5rZWQgZmlsZSBkb2VzIG5vdCBjaGFuZ2UuCiAgCiAg
UGFzc2luZyBAY29kZXtub25lfSBmb3IgQHZhcntzdHlsZX0gZGlzYWJsZXMgdGhlIHNldHRpbmcg
ZnJvbSBhbnkKICBAY29kZXstLWJ1aWxkLWlkfSBvcHRpb25zIGVhcmxpZXIgb24gdGhlIGNvbW1h
bmQgbGluZS4KQEAgLTE4MSw3ICsxODEsNyBAQCBpbmRleCBlYjdiY2I5OTMzLi4zYzczZDQ0NWEw
IDEwMDY0NAogIAogIEBjIG1hbiBlbmQKIGRpZmYgLS1naXQgYS9sZC9sZGZpbGUuYyBiL2xkL2xk
ZmlsZS5jCi1pbmRleCA0MTFmN2RkZjk3Li4xN2RiMTZjMmNjIDEwMDY0NAoraW5kZXggZTM5MTcw
YjVkOTQuLmZhZGMyNDhhMTQwIDEwMDY0NAogLS0tIGEvbGQvbGRmaWxlLmMKICsrKyBiL2xkL2xk
ZmlsZS5jCiBAQCAtMTE3LDYgKzExNywyMyBAQCBsZGZpbGVfYWRkX2xpYnJhcnlfcGF0aCAoY29u
c3QgY2hhciAqbmFtZSwgYmZkX2Jvb2xlYW4gY21kbGluZSkKQEAgLTIwOSwyMyArMjA5LDI2IEBA
IGluZGV4IDQxMWY3ZGRmOTcuLjE3ZGIxNmMyY2MgMTAwNjQ0CiAgCiAgLyogVHJ5IHRvIG9wZW4g
YSBCRkQgZm9yIGEgbGFuZ19pbnB1dF9zdGF0ZW1lbnQuICAqLwogZGlmZiAtLWdpdCBhL2xkL2xk
bGV4LmggYi9sZC9sZGxleC5oCi1pbmRleCA1Mjg3ZjE5YTdmLi41NTA5NmU0ZmM5IDEwMDY0NAor
aW5kZXggNWVhMDgzZWJlYjMuLjk0MWRjNWYzZGM4IDEwMDY0NAogLS0tIGEvbGQvbGRsZXguaAog
KysrIGIvbGQvbGRsZXguaAotQEAgLTE1MCw2ICsxNTAsOCBAQCBlbnVtIG9wdGlvbl92YWx1ZXMK
LSAgIE9QVElPTl9GT1JDRV9HUk9VUF9BTExPQ0FUSU9OLAotICAgT1BUSU9OX1BSSU5UX01BUF9E
SVNDQVJERUQsCi0gICBPUFRJT05fTk9fUFJJTlRfTUFQX0RJU0NBUkRFRCwKK0BAIC0xNTUsNiAr
MTU1LDExIEBAIGVudW0gb3B0aW9uX3ZhbHVlcworICAgT1BUSU9OX05PTl9DT05USUdVT1VTX1JF
R0lPTlMsCisgICBPUFRJT05fTk9OX0NPTlRJR1VPVVNfUkVHSU9OU19XQVJOSU5HUywKKyAgIE9Q
VElPTl9ERVBFTkRFTkNZX0ZJTEUsCisrICBPUFRJT05fQ1RGX1ZBUklBQkxFUywKKysgIE9QVElP
Tl9OT19DVEZfVkFSSUFCTEVTLAorKyAgT1BUSU9OX0NURl9TSEFSRV9UWVBFUywKICsgIE9QVElP
Tl9OT19QT0lTT05fU1lTVEVNX0RJUkVDVE9SSUVTLAogKyAgT1BUSU9OX0VSUk9SX1BPSVNPTl9T
WVNURU1fRElSRUNUT1JJRVMsCiAgfTsKICAKICAvKiBUaGUgaW5pdGlhbCBwYXJzZXIgc3RhdGVz
LiAgKi8KIGRpZmYgLS1naXQgYS9sZC9sZG1haW4uYyBiL2xkL2xkbWFpbi5jCi1pbmRleCBkYTFh
ZDE3NzYzLi4xMmQwYjA3ZDhhIDEwMDY0NAoraW5kZXggZjVjNWEzMzYzMjAuLjUxNmJhMDM2MGUy
IDEwMDY0NAogLS0tIGEvbGQvbGRtYWluLmMKICsrKyBiL2xkL2xkbWFpbi5jCi1AQCAtMjc0LDYg
KzI3NCw4IEBAIG1haW4gKGludCBhcmdjLCBjaGFyICoqYXJndikKK0BAIC0zMjIsNiArMzIyLDgg
QEAgbWFpbiAoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgY29tbWFuZF9saW5lLndhcm5fbWlz
bWF0Y2ggPSBUUlVFOwogICAgY29tbWFuZF9saW5lLndhcm5fc2VhcmNoX21pc21hdGNoID0gVFJV
RTsKICAgIGNvbW1hbmRfbGluZS5jaGVja19zZWN0aW9uX2FkZHJlc3NlcyA9IC0xOwpAQCAtMjM1
LDEzICsyMzgsMjUgQEAgaW5kZXggZGExYWQxNzc2My4uMTJkMGIwN2Q4YSAxMDA2NDQKICAgIC8q
IFdlIGluaXRpYWxpemUgREVNQU5HTElORyBiYXNlZCBvbiB0aGUgZW52aXJvbm1lbnQgdmFyaWFi
bGUKICAgICAgIENPTExFQ1RfTk9fREVNQU5HTEUuICBUaGUgZ2NjIGNvbGxlY3QyIHByb2dyYW0g
d2lsbCBkZW1hbmdsZSB0aGUKIGRpZmYgLS1naXQgYS9sZC9sZXhzdXAuYyBiL2xkL2xleHN1cC5j
Ci1pbmRleCAzZDE1Y2M0OTFkLi4wZThiNGYyYjdhIDEwMDY0NAoraW5kZXggNThjNmMwNzgzMjUu
Ljg3OWU3YmI3NjU4IDEwMDY0NAogLS0tIGEvbGQvbGV4c3VwLmMKICsrKyBiL2xkL2xleHN1cC5j
Ci1AQCAtNTUwLDYgKzU1MCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGxkX29wdGlvbiBsZF9v
cHRpb25zW10gPQorQEAgLTU3Miw2ICs1NzIsMjYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBsZF9v
cHRpb24gbGRfb3B0aW9uc1tdID0KICAgIHsgeyI8L2E+bm8tcHJpbnQtbWFwLWRpc2NhcmRlZCIs
IG5vX2FyZ3VtZW50LCBOVUxMLCBPUFRJT05fTk9fUFJJTlRfTUFQX0RJU0NBUkRFRH0sCiAgICAg
ICdcMCcsIE5VTEwsIE5fKCJEbyBub3Qgc2hvdyBkaXNjYXJkZWQgc2VjdGlvbnMgaW4gbWFwIGZp
bGUgb3V0cHV0IiksCiAgICAgIFRXT19EQVNIRVMgfSwKKysgIHsgeyJjdGYtdmFyaWFibGVzIiwg
bm9fYXJndW1lbnQsIE5VTEwsIE9QVElPTl9DVEZfVkFSSUFCTEVTfSwKKysgICAgJ1wwJywgTlVM
TCwgTl8oIkVtaXQgbmFtZXMgYW5kIHR5cGVzIG9mIHN0YXRpYyB2YXJpYWJsZXMgaW4gQ1RGIiks
CisrICAgIFRXT19EQVNIRVMgfSwKKysgIHsgeyJuby1jdGYtdmFyaWFibGVzIiwgbm9fYXJndW1l
bnQsIE5VTEwsIE9QVElPTl9OT19DVEZfVkFSSUFCTEVTfSwKKysgICAgJ1wwJywgTlVMTCwgTl8o
IkRvIG5vdCBlbWl0IG5hbWVzIGFuZCB0eXBlcyBvZiBzdGF0aWMgdmFyaWFibGVzIGluIENURiIp
LAorKyAgICBUV09fREFTSEVTIH0sCisrICB7IHsiY3RmLXNoYXJlLXR5cGVzPSZsdDttZXRob2Qm
Z3Q7IiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsCisrICAgICBPUFRJT05fQ1RGX1NIQVJFX1RZ
UEVTfSwKKysgICAgJ1wwJywgTlVMTCwgTl8oIkhvdyB0byBzaGFyZSBDVEYgdHlwZXMgYmV0d2Vl
biB0cmFuc2xhdGlvbiB1bml0cy5cbiIKKysJCSAgICIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZsdDttZXRob2QmZ3Q7IGlzOiBzaGFyZS11bmNvbmZsaWN0ZWQgKGRlZmF1bHQpLFxu
IgorKwkJICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNo
YXJlLWR1cGxpY2F0ZWQiKSwKKysgICAgVFdPX0RBU0hFUyB9LAogKyAgeyB7Im5vLXBvaXNvbi1z
eXN0ZW0tZGlyZWN0b3JpZXMiLCBub19hcmd1bWVudCwgTlVMTCwKICsgICAgIE9QVElPTl9OT19Q
T0lTT05fU1lTVEVNX0RJUkVDVE9SSUVTfSwKICsgICAgJ1wwJywgTlVMTCwgTl8oIkRvIG5vdCB3
YXJuIGZvciAtTCBvcHRpb25zIHVzaW5nIHN5c3RlbSBkaXJlY3RvcmllcyIpLApAQCAtMjUzLDcg
KzI2OCw3IEBAIGluZGV4IDNkMTVjYzQ5MWQuLjBlOGI0ZjJiN2EgMTAwNjQ0CiAgfTsKICAKICAj
ZGVmaW5lIE9QVElPTl9DT1VOVCBBUlJBWV9TSVpFIChsZF9vcHRpb25zKQotQEAgLTE2MDMsNiAr
MTYxMSwxMyBAQCBwYXJzZV9hcmdzICh1bnNpZ25lZCBhcmdjLCBjaGFyICoqYXJndikKK0BAIC0x
NjMyLDYgKzE2NTIsMTMgQEAgcGFyc2VfYXJncyAodW5zaWduZWQgYXJnYywgY2hhciAqKmFyZ3Yp
CiAgCiAgCWNhc2UgT1BUSU9OX1BSSU5UX01BUF9ESVNDQVJERUQ6CiAgCSAgY29uZmlnLnByaW50
X21hcF9kaXNjYXJkZWQgPSBUUlVFOwpAQCAtMjY1LDUgKzI4MCw4IEBAIGluZGV4IDNkMTVjYzQ5
MWQuLjBlOGI0ZjJiN2EgMTAwNjQ0CiArCWNhc2UgT1BUSU9OX0VSUk9SX1BPSVNPTl9TWVNURU1f
RElSRUNUT1JJRVM6CiArCSAgY29tbWFuZF9saW5lLmVycm9yX3BvaXNvbl9zeXN0ZW1fZGlyZWN0
b3JpZXMgPSBUUlVFOwogIAkgIGJyZWFrOwotIAl9Ci0gICAgIH0KKyAKKyAJY2FzZSBPUFRJT05f
REVQRU5ERU5DWV9GSUxFOgorLS0gCisyLjI4LjAKKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTEtQ2hhbmdlLWRlZmF1bHQtZW11bGF0aW9u
LWZvci1taXBzNjQtbGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMv
YmludXRpbHMvMDAwOS1DaGFuZ2UtZGVmYXVsdC1lbXVsYXRpb24tZm9yLW1pcHM2NC1saW51eC5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYmludXRpbHMvYmludXRpbHMvMDAxMS1DaGFuZ2UtZGVmYXVsdC1lbXVsYXRpb24tZm9yLW1p
cHM2NC1saW51eC5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxz
L2JpbnV0aWxzLzAwMDktQ2hhbmdlLWRlZmF1bHQtZW11bGF0aW9uLWZvci1taXBzNjQtbGludXgu
cGF0Y2gKaW5kZXggYzQ5YjhlODYzZi4uZmI1Mjc2ZTE4MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTEtQ2hhbmdlLWRlZmF1bHQtZW11bGF0
aW9uLWZvci1taXBzNjQtbGludXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Jp
bnV0aWxzL2JpbnV0aWxzLzAwMDktQ2hhbmdlLWRlZmF1bHQtZW11bGF0aW9uLWZvci1taXBzNjQt
bGludXgucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDIxODI3OTFhNDUzZjM0YmVlNjk2OGIz
ZTcyODQ4NjA4Y2Y3ZDdhYmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDEzYTY3ZTkw
NDBjMDFhYmQyODRmZTUwNjQ3MWUwZWFiNjY4ZWUzZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4K
IERhdGU6IE1vbiwgMiBNYXIgMjAxNSAwMTo0NDoxNCArMDAwMAotU3ViamVjdDogW1BBVENIXSBD
aGFuZ2UgZGVmYXVsdCBlbXVsYXRpb24gZm9yIG1pcHM2NCotKi1saW51eAorU3ViamVjdDogW1BB
VENIIDA5LzE3XSBDaGFuZ2UgZGVmYXVsdCBlbXVsYXRpb24gZm9yIG1pcHM2NCotKi1saW51eAog
CiB3ZSBjaGFuZ2UgdGhlIGRlZmF1bHQgZW11bGF0aW9ucyB0byBiZSBONjQgaW5zdGVhZCBvZiBO
MzIKIApAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20i
PiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYmZkL2NvbmZpZy5iZmQg
Yi9iZmQvY29uZmlnLmJmZAotaW5kZXggYjk2OTMxZjUyZS4uODQ3ZjlmMGJhOSAxMDA2NDQKK2lu
ZGV4IDE0NTIzY2FmMGM1Li5lNTIzM2NkMWY3ZSAxMDA2NDQKIC0tLSBhL2JmZC9jb25maWcuYmZk
CiArKysgYi9iZmQvY29uZmlnLmJmZAotQEAgLTkxMSwxMiArOTExLDEyIEBAIGNhc2UgIiR7dGFy
Z30iIGluCitAQCAtODk0LDEyICs4OTQsMTIgQEAgY2FzZSAiJHt0YXJnfSIgaW4KICAgICAgdGFy
Z19zZWx2ZWNzPSJtaXBzX2VsZjMyX2xlX3ZlYyBtaXBzX2VsZjY0X2JlX3ZlYyBtaXBzX2VsZjY0
X2xlX3ZlYyBtaXBzX2Vjb2ZmX2JlX3ZlYyBtaXBzX2Vjb2ZmX2xlX3ZlYyIKICAgICAgOzsKICAg
IG1pcHM2NCplbC0qLWxpbnV4KikKQEAgLTM1LDEwICszNSwxMCBAQCBpbmRleCBiOTY5MzFmNTJl
Li44NDdmOWYwYmE5IDEwMDY0NAogICAgbWlwcyplbC0qLWxpbnV4KikKICAgICAgdGFyZ19kZWZ2
ZWM9bWlwc19lbGYzMl90cmFkX2xlX3ZlYwogZGlmZiAtLWdpdCBhL2xkL2NvbmZpZ3VyZS50Z3Qg
Yi9sZC9jb25maWd1cmUudGd0Ci1pbmRleCAyMzE5NGUzNTdmLi5mNGYwZWFmOWIyIDEwMDY0NAor
aW5kZXggODdjN2Q5YTRjYWQuLjliNGJmMmNhOTY0IDEwMDY0NAogLS0tIGEvbGQvY29uZmlndXJl
LnRndAogKysrIGIvbGQvY29uZmlndXJlLnRndAotQEAgLTU0MSwxMiArNTQxLDEyIEBAIG1pcHMq
LSotdnh3b3JrcyopCXRhcmdfZW11bD1lbGYzMmVibWlwdnh3b3JrcworQEAgLTUzMSwxMiArNTMx
LDEyIEBAIG1pcHMqLSotdnh3b3JrcyopCXRhcmdfZW11bD1lbGYzMmVibWlwdnh3b3JrcwogIAkJ
CTs7CiAgbWlwcyotKi13aW5kaXNzKQl0YXJnX2VtdWw9ZWxmMzJtaXBzd2luZGlzcwogIAkJCTs7
CkBAIC01NSwzICs1NSw2IEBAIGluZGV4IDIzMTk0ZTM1N2YuLmY0ZjBlYWY5YjIgMTAwNjQ0CiAg
CQkJdGFyZ19leHRyYV9saWJwYXRoPSR0YXJnX2V4dHJhX2VtdWxzCiAgCQkJOzsKICBtaXBzKmVs
LSotbGludXgtKikJdGFyZ19lbXVsPWVsZjMybHRzbWlwCistLSAKKzIuMjguMAorCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxMi1BZGQtc3Vw
cG9ydC1mb3ItTmV0bG9naWMtWExQLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0
aWxzL2JpbnV0aWxzLzAwMTAtQWRkLXN1cHBvcnQtZm9yLU5ldGxvZ2ljLVhMUC5wYXRjaApzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRp
bHMvYmludXRpbHMvMDAxMi1BZGQtc3VwcG9ydC1mb3ItTmV0bG9naWMtWExQLnBhdGNoCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxMC1BZGQtc3Vw
cG9ydC1mb3ItTmV0bG9naWMtWExQLnBhdGNoCmluZGV4IGMzMjg2N2EyMzguLjI3N2RiNGVjNWMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDEy
LUFkZC1zdXBwb3J0LWZvci1OZXRsb2dpYy1YTFAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTAtQWRkLXN1cHBvcnQtZm9yLU5ldGxvZ2ljLVhM
UC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gYTAyMzdlYzJkMWU1OGJkMzVjMjM2ZGYzOWRk
NWEwNjUwNGM2ZDJlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjlhYjQ1YzE2Zjgw
ZjE4ZmE3ODEyMWY2ZTc3NDc1MGI5ZTlhMjAwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogRGF0
ZTogU3VuLCAxNCBGZWIgMjAxNiAxNzowNjoxOSArMDAwMAotU3ViamVjdDogW1BBVENIXSBBZGQg
c3VwcG9ydCBmb3IgTmV0bG9naWMgWExQCitTdWJqZWN0OiBbUEFUQ0ggMTAvMTddIEFkZCBzdXBw
b3J0IGZvciBOZXRsb2dpYyBYTFAKIAogUGF0Y2ggRnJvbTogTmVidSBQaGlsaXBzIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpucGhpbGlwc0BuZXRsb2dpY21p
Y3JvLmNvbSI+Jmx0O25waGlsaXBzQG5ldGxvZ2ljbWljcm8uY29tJmd0OzwvYT4KIApAQCAtMzUs
MTAgKzM1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IE1hcmsgSGF0bGUgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbSI+Jmx0
O21hcmsuaGF0bGVAd2luZHJpdmVyLmNvbSZndDs8L2E+CiAgMTUgZmlsZXMgY2hhbmdlZCwgNjUg
aW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9iZmQvYW91dHgu
aCBiL2JmZC9hb3V0eC5oCi1pbmRleCBmYTNhOTc0NmI2Li41MDc4MDI0ZmQ1IDEwMDY0NAoraW5k
ZXggZDM1MmExYTNlNDQuLjJlMmMzYzFhZjg2IDEwMDY0NAogLS0tIGEvYmZkL2FvdXR4LmgKICsr
KyBiL2JmZC9hb3V0eC5oCi1AQCAtNzk5LDYgKzc5OSw3IEBAIE5BTUUgKGFvdXQsIG1hY2hpbmVf
dHlwZSkgKGVudW0gYmZkX2FyY2hpdGVjdHVyZSBhcmNoLAorQEAgLTgxMCw2ICs4MTAsNyBAQCBO
QU1FIChhb3V0LCBtYWNoaW5lX3R5cGUpIChlbnVtIGJmZF9hcmNoaXRlY3R1cmUgYXJjaCwKICAJ
Y2FzZSBiZmRfbWFjaF9taXBzaXNhNjRyNjoKICAJY2FzZSBiZmRfbWFjaF9taXBzX3NiMToKICAJ
Y2FzZSBiZmRfbWFjaF9taXBzX3hscjoKQEAgLTQ3LDcgKzQ3LDcgQEAgaW5kZXggZmEzYTk3NDZi
Ni4uNTA3ODAyNGZkNSAxMDA2NDQKICAJICBhcmNoX2ZsYWdzID0gTV9NSVBTMjsKICAJICBicmVh
azsKIGRpZmYgLS1naXQgYS9iZmQvYXJjaHVyZXMuYyBiL2JmZC9hcmNodXJlcy5jCi1pbmRleCAy
MzIxMDM4MTdjLi5iMmIzYjhjMTI0IDEwMDY0NAoraW5kZXggNTUxZWM4NzMyZjAuLjI2NjViMzc4
NjIzIDEwMDY0NAogLS0tIGEvYmZkL2FyY2h1cmVzLmMKICsrKyBiL2JmZC9hcmNodXJlcy5jCiBA
QCAtMTg1LDYgKzE4NSw3IEBAIERFU0NSSVBUSU9OCkBAIC01OSwxMCArNTksMTAgQEAgaW5kZXgg
MjMyMTAzODE3Yy4uYjJiM2I4YzEyNCAxMDA2NDQKICAuI2RlZmluZSBiZmRfbWFjaF9taXBzaXNh
MzJyMgkJMzMKICAuI2RlZmluZSBiZmRfbWFjaF9taXBzaXNhMzJyMwkJMzQKIGRpZmYgLS1naXQg
YS9iZmQvYmZkLWluMi5oIGIvYmZkL2JmZC1pbjIuaAotaW5kZXggN2MxM2JjOGM5MS4uMmU0NTNj
NTBjMSAxMDA2NDQKK2luZGV4IDM1ZWY0ZDc1NWJiLi40OGRiMDBhZjgwYiAxMDA2NDQKIC0tLSBh
L2JmZC9iZmQtaW4yLmgKICsrKyBiL2JmZC9iZmQtaW4yLmgKLUBAIC0xNTY4LDYgKzE1NjgsNyBA
QCBlbnVtIGJmZF9hcmNoaXRlY3R1cmUKK0BAIC0xNTg1LDYgKzE1ODUsNyBAQCBlbnVtIGJmZF9h
cmNoaXRlY3R1cmUKICAjZGVmaW5lIGJmZF9tYWNoX21pcHNfb2N0ZW9uMyAgICAgICAgICA2NTAz
CiAgI2RlZmluZSBiZmRfbWFjaF9taXBzX3hsciAgICAgICAgICAgICAgODg3NjgyICAgLyogZGVj
aW1hbCAnWExSJy4gICovCiAgI2RlZmluZSBiZmRfbWFjaF9taXBzX2ludGVyYXB0aXZfbXIyICAg
NzM2NTUwICAgLyogZGVjaW1hbCAnSUEyJy4gICovCkBAIC03MSwxMCArNzEsMTAgQEAgaW5kZXgg
N2MxM2JjOGM5MS4uMmU0NTNjNTBjMSAxMDA2NDQKICAjZGVmaW5lIGJmZF9tYWNoX21pcHNpc2Ez
MnIyICAgICAgICAgICAzMwogICNkZWZpbmUgYmZkX21hY2hfbWlwc2lzYTMycjMgICAgICAgICAg
IDM0CiBkaWZmIC0tZ2l0IGEvYmZkL2NvbmZpZy5iZmQgYi9iZmQvY29uZmlnLmJmZAotaW5kZXgg
ODQ3ZjlmMGJhOS4uYTEyNzA3ZjgyNyAxMDA2NDQKK2luZGV4IGU1MjMzY2QxZjdlLi4yZTRhZTZi
YmRmZiAxMDA2NDQKIC0tLSBhL2JmZC9jb25maWcuYmZkCiArKysgYi9iZmQvY29uZmlnLmJmZAot
QEAgLTg5NCw2ICs4OTQsMTEgQEAgY2FzZSAiJHt0YXJnfSIgaW4KK0BAIC04NzcsNiArODc3LDEx
IEBAIGNhc2UgIiR7dGFyZ30iIGluCiAgICAgIHRhcmdfZGVmdmVjPW1pcHNfZWxmMzJfbGVfdmVj
CiAgICAgIHRhcmdfc2VsdmVjcz0ibWlwc19lbGYzMl9iZV92ZWMgbWlwc19lbGY2NF9iZV92ZWMg
bWlwc19lbGY2NF9sZV92ZWMiCiAgICAgIDs7CkBAIC04Nyw3ICs4Nyw3IEBAIGluZGV4IDg0N2Y5
ZjBiYTkuLmExMjcwN2Y4MjcgMTAwNjQ0CiAgICAgIHRhcmdfZGVmdmVjPW1pcHNfZWxmMzJfYmVf
dmVjCiAgICAgIHRhcmdfc2VsdmVjcz0ibWlwc19lbGYzMl9sZV92ZWMgbWlwc19lbGY2NF9iZV92
ZWMgbWlwc19lbGY2NF9sZV92ZWMiCiBkaWZmIC0tZ2l0IGEvYmZkL2NwdS1taXBzLmMgYi9iZmQv
Y3B1LW1pcHMuYwotaW5kZXggODAyYWNiNDVmMS4uZmQ5ZWM0YzBhZCAxMDA2NDQKK2luZGV4IDgw
MmFjYjQ1ZjFlLi5mZDllYzRjMGFkNCAxMDA2NDQKIC0tLSBhL2JmZC9jcHUtbWlwcy5jCiArKysg
Yi9iZmQvY3B1LW1pcHMuYwogQEAgLTEwOCw3ICsxMDgsOCBAQCBlbnVtCkBAIC0xMTEsMTAgKzEx
MSwxMCBAQCBpbmRleCA4MDJhY2I0NWYxLi5mZDllYzRjMGFkIDEwMDY0NAogIAogIC8qIFRoZSBk
ZWZhdWx0IGFyY2hpdGVjdHVyZSBpcyBtaXBzOjMwMDAsIGJ1dCB3aXRoIGEgbWFjaGluZSBudW1i
ZXIgb2YKIGRpZmYgLS1naXQgYS9iZmQvZWxmeHgtbWlwcy5jIGIvYmZkL2VsZnh4LW1pcHMuYwot
aW5kZXggZDdlM2FlZDNiNi4uN2JhZWVlOWVlMyAxMDA2NDQKK2luZGV4IDE2MGZlYmVjOTRjLi40
Yzk0OTljYzJjZiAxMDA2NDQKIC0tLSBhL2JmZC9lbGZ4eC1taXBzLmMKICsrKyBiL2JmZC9lbGZ4
eC1taXBzLmMKLUBAIC02OTk5LDYgKzY5OTksOSBAQCBfYmZkX2VsZl9taXBzX21hY2ggKGZsYWd3
b3JkIGZsYWdzKQorQEAgLTY5ODIsNiArNjk4Miw5IEBAIF9iZmRfZWxmX21pcHNfbWFjaCAoZmxh
Z3dvcmQgZmxhZ3MpCiAgICAgIGNhc2UgRV9NSVBTX01BQ0hfSUFNUjI6CiAgICAgICAgcmV0dXJu
IGJmZF9tYWNoX21pcHNfaW50ZXJhcHRpdl9tcjI7CiAgCkBAIC0xMjQsNyArMTI0LDcgQEAgaW5k
ZXggZDdlM2FlZDNiNi4uN2JhZWVlOWVlMyAxMDA2NDQKICAgICAgZGVmYXVsdDoKICAgICAgICBz
d2l0Y2ggKGZsYWdzICZhbXA7IEVGX01JUFNfQVJDSCkKICAJewotQEAgLTEyMzU1LDYgKzEyMzU4
LDEwIEBAIG1pcHNfc2V0X2lzYV9mbGFncyAoYmZkICphYmZkKQorQEAgLTEyMzU2LDYgKzEyMzU5
LDEwIEBAIG1pcHNfc2V0X2lzYV9mbGFncyAoYmZkICphYmZkKQogICAgICAgIHZhbCA9IEVfTUlQ
U19BUkNIXzY0UjIgfCBFX01JUFNfTUFDSF9PQ1RFT04yOwogICAgICAgIGJyZWFrOwogIApAQCAt
MTM1LDcgKzEzNSw3IEBAIGluZGV4IGQ3ZTNhZWQzYjYuLjdiYWVlZTllZTMgMTAwNjQ0CiAgICAg
IGNhc2UgYmZkX21hY2hfbWlwc2lzYTMyOgogICAgICAgIHZhbCA9IEVfTUlQU19BUkNIXzMyOwog
ICAgICAgIGJyZWFrOwotQEAgLTE0Mzc5LDYgKzE0Mzg2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBtaXBzX21hY2hfZXh0ZW5zaW9uIG1pcHNfbWFjaF9leHRlbnNpb25zW10gPQorQEAgLTE0Mzcz
LDYgKzE0MzgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaXBzX21hY2hfZXh0ZW5zaW9uIG1p
cHNfbWFjaF9leHRlbnNpb25zW10gPQogICAgeyBiZmRfbWFjaF9taXBzX2dzMjY0ZSwgYmZkX21h
Y2hfbWlwc19nczQ2NGUgfSwKICAgIHsgYmZkX21hY2hfbWlwc19nczQ2NGUsIGJmZF9tYWNoX21p
cHNfZ3M0NjQgfSwKICAgIHsgYmZkX21hY2hfbWlwc19nczQ2NCwgYmZkX21hY2hfbWlwc2lzYTY0
cjIgfSwKQEAgLTE0NCwxMCArMTQ0LDEwIEBAIGluZGV4IGQ3ZTNhZWQzYjYuLjdiYWVlZTllZTMg
MTAwNjQ0CiAgICAvKiBNSVBTNjQgZXh0ZW5zaW9ucy4gICovCiAgICB7IGJmZF9tYWNoX21pcHNp
c2E2NHIyLCBiZmRfbWFjaF9taXBzaXNhNjQgfSwKIGRpZmYgLS1naXQgYS9iaW51dGlscy9yZWFk
ZWxmLmMgYi9iaW51dGlscy9yZWFkZWxmLmMKLWluZGV4IDZiNWJlYmU3NDMuLmQxNWE3ODI4ZGIg
MTAwNjQ0CitpbmRleCA2MDU3NTE1YTg5Yi4uZWExMTliMGIyNTQgMTAwNjQ0CiAtLS0gYS9iaW51
dGlscy9yZWFkZWxmLmMKICsrKyBiL2JpbnV0aWxzL3JlYWRlbGYuYwotQEAgLTM0NDAsNiArMzQ0
MCw3IEBAIGdldF9tYWNoaW5lX2ZsYWdzIChGaWxlZGF0YSAqIGZpbGVkYXRhLCB1bnNpZ25lZCBl
X2ZsYWdzLCB1bnNpZ25lZCBlX21hY2hpbmUpCitAQCAtMzQ4Myw2ICszNDgzLDcgQEAgZ2V0X21h
Y2hpbmVfZmxhZ3MgKEZpbGVkYXRhICogZmlsZWRhdGEsIHVuc2lnbmVkIGVfZmxhZ3MsIHVuc2ln
bmVkIGVfbWFjaGluZSkKICAJICAgIGNhc2UgRV9NSVBTX01BQ0hfT0NURU9OMzogc3RyY2F0IChi
dWYsICIsIG9jdGVvbjMiKTsgYnJlYWs7CiAgCSAgICBjYXNlIEVfTUlQU19NQUNIX1hMUjogIHN0
cmNhdCAoYnVmLCAiLCB4bHIiKTsgYnJlYWs7CiAgCSAgICBjYXNlIEVfTUlQU19NQUNIX0lBTVIy
OiAgc3RyY2F0IChidWYsICIsIGludGVyYXB0aXYtbXIyIik7IGJyZWFrOwpAQCAtMTU2LDcgKzE1
Niw3IEBAIGluZGV4IDZiNWJlYmU3NDMuLmQxNWE3ODI4ZGIgMTAwNjQ0CiAgCSAgICAvKiBXZSBz
aW1wbHkgaWdub3JlIHRoZSBmaWVsZCBpbiB0aGlzIGNhc2UgdG8gYXZvaWQgY29uZnVzaW9uOgog
IAkgICAgICAgTUlQUyBFTEYgZG9lcyBub3Qgc3BlY2lmeSBFRl9NSVBTX01BQ0gsIGl0IGlzIGEg
R05VCiBkaWZmIC0tZ2l0IGEvZ2FzL2NvbmZpZy90Yy1taXBzLmMgYi9nYXMvY29uZmlnL3RjLW1p
cHMuYwotaW5kZXggZmM2ODk4ODM0ZS4uMmM3MTUxY2NkYiAxMDA2NDQKK2luZGV4IDMxYWNiNzdk
NzhhLi4wZWFkMTY4ZDUxZSAxMDA2NDQKIC0tLSBhL2dhcy9jb25maWcvdGMtbWlwcy5jCiArKysg
Yi9nYXMvY29uZmlnL3RjLW1pcHMuYwogQEAgLTU2OCw2ICs1NjgsNyBAQCBzdGF0aWMgaW50IG1p
cHNfMzJiaXRtb2RlID0gMDsKQEAgLTE3NSw3ICsxNzUsNyBAQCBpbmRleCBmYzY4OTg4MzRlLi4y
YzcxNTFjY2RiIDEwMDY0NAogICAgICkKICAKICAvKiBXaGV0aGVyIHRoZSBwcm9jZXNzb3IgdXNl
cyBoYXJkd2FyZSBpbnRlcmxvY2tzIHRvIHByb3RlY3QgcmVhZHMKLUBAIC0yMDEzNSw3ICsyMDEz
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWlwc19jcHVfaW5mbyBtaXBzX2NwdV9pbmZvX3Rh
YmxlW10gPQorQEAgLTIwMTc0LDcgKzIwMTc2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaXBz
X2NwdV9pbmZvIG1pcHNfY3B1X2luZm9fdGFibGVbXSA9CiAgICAvKiBCcm9hZGNvbSBYTFAuCiAg
ICAgICBYTFAgaXMgbW9zdGx5IGxpa2UgWExSLCB3aXRoIHRoZSBwcm9taW5lbnQgZXhjZXB0aW9u
IHRoYXQgaXQgaXMKICAgICAgIE1JUFM2NFIyIHJhdGhlciB0aGFuIE1JUFM2NC4gICovCkBAIC0x
ODUsNyArMTg1LDcgQEAgaW5kZXggZmM2ODk4ODM0ZS4uMmM3MTUxY2NkYiAxMDA2NDQKICAgIC8q
IE1JUFMgNjQgUmVsZWFzZSA2LiAgKi8KICAgIHsgImk2NDAwIiwJICAgICAgMCwgQVNFX1ZJUlQg
fCBBU0VfTVNBLAlJU0FfTUlQUzY0UjYsIENQVV9NSVBTNjRSNn0sCiBkaWZmIC0tZ2l0IGEvZ2Fz
L2NvbmZpZ3VyZSBiL2dhcy9jb25maWd1cmUKLWluZGV4IDYwYzFhMDU1YWUuLjU5ZDZkMTEyMTUg
MTAwNzU1CitpbmRleCA1YmNjZmQ5ZDFiNy4uZDRiMTNlNmZjOGIgMTAwNzU1CiAtLS0gYS9nYXMv
Y29uZmlndXJlCiArKysgYi9nYXMvY29uZmlndXJlCiBAQCAtMTI3MjIsNiArMTI3MjIsOSBAQCBf
QUNFT0YKQEAgLTE5OSw3ICsxOTksNyBAQCBpbmRleCA2MGMxYTA1NWFlLi41OWQ2ZDExMjE1IDEw
MDc1NQogIAkgICAgbWlwc19jcHU9cjM5MDAKICAJICAgIDs7CiBkaWZmIC0tZ2l0IGEvZ2FzL2Nv
bmZpZ3VyZS5hYyBiL2dhcy9jb25maWd1cmUuYWMKLWluZGV4IDZmMzJlNTVhMWEuLjExYzJlMGQy
NzMgMTAwNjQ0CitpbmRleCBiNjUxMDhmZWNiMi4uY2UxZjJkYWQ5YmMgMTAwNjQ0CiAtLS0gYS9n
YXMvY29uZmlndXJlLmFjCiArKysgYi9nYXMvY29uZmlndXJlLmFjCiBAQCAtMzI1LDYgKzMyNSw5
IEBAIGNoYW5nZXF1b3RlKFssXSlkbmwKQEAgLTIxMyw3ICsyMTMsNyBAQCBpbmRleCA2ZjMyZTU1
YTFhLi4xMWMyZTBkMjczIDEwMDY0NAogIAkgICAgbWlwc19jcHU9cjM5MDAKICAJICAgIDs7CiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9lbGYvbWlwcy5oIGIvaW5jbHVkZS9lbGYvbWlwcy5oCi1pbmRl
eCBkMTE2YjAzNmI2Li5kY2VlYjNmMTU2IDEwMDY0NAoraW5kZXggY2MwOGViZDQzMTguLmJiNTE4
NTc1Y2UxIDEwMDY0NAogLS0tIGEvaW5jbHVkZS9lbGYvbWlwcy5oCiArKysgYi9pbmNsdWRlL2Vs
Zi9taXBzLmgKIEBAIC0yOTAsNiArMjkwLDcgQEAgRU5EX1JFTE9DX05VTUJFUlMgKFJfTUlQU19t
YXhleHQpCkBAIC0yMjUsNyArMjI1LDcgQEAgaW5kZXggZDExNmIwMzZiNi4uZGNlZWIzZjE1NiAx
MDA2NDQKICAjZGVmaW5lIEVfTUlQU19NQUNIX09DVEVPTjMJMHgwMDhlMDAwMAogICNkZWZpbmUg
RV9NSVBTX01BQ0hfNTQwMAkweDAwOTEwMDAwCiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9vcGNvZGUv
bWlwcy5oIGIvaW5jbHVkZS9vcGNvZGUvbWlwcy5oCi1pbmRleCBmZDAzMWYzNzU4Li5hOTZhNDRk
Zjg0IDEwMDY0NAoraW5kZXggZmQwMzFmMzc1ODguLmE5NmE0NGRmODQwIDEwMDY0NAogLS0tIGEv
aW5jbHVkZS9vcGNvZGUvbWlwcy5oCiArKysgYi9pbmNsdWRlL29wY29kZS9taXBzLmgKIEBAIC0x
MjYwLDYgKzEyNjAsOCBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG1pcHNfaXNhX3RhYmxl
W10gPSB7CkBAIC0yNTYsMTAgKzI1NiwxMCBAQCBpbmRleCBmZDAzMWYzNzU4Li5hOTZhNDRkZjg0
IDEwMDY0NAogICAgICAgIHJldHVybiBGQUxTRTsKICAgICAgfQogZGlmZiAtLWdpdCBhL2xkL2Nv
bmZpZ3VyZS50Z3QgYi9sZC9jb25maWd1cmUudGd0Ci1pbmRleCBmNGYwZWFmOWIyLi4wZGEzZWNh
MTljIDEwMDY0NAoraW5kZXggOWI0YmYyY2E5NjQuLmY2ZDcxNzFkZmY3IDEwMDY0NAogLS0tIGEv
bGQvY29uZmlndXJlLnRndAogKysrIGIvbGQvY29uZmlndXJlLnRndAotQEAgLTUyMCw2ICs1MjAs
OSBAQCBtaXBzKi1zZGUtZWxmKiB8IG1pcHMqLW10aS1lbGYqIHwgbWlwcyotaW1nLWVsZiopCitA
QCAtNTEwLDYgKzUxMCw5IEBAIG1pcHMqLXNkZS1lbGYqIHwgbWlwcyotbXRpLWVsZiogfCBtaXBz
Ki1pbWctZWxmKikKICAJCQl0YXJnX2VtdWw9ZWxmMzJidHNtaXAKICAJCQl0YXJnX2V4dHJhX2Vt
dWxzPSJlbGYzMmx0c21pcCBlbGYzMmJ0c21pcG4zMiBlbGY2NGJ0c21pcCBlbGYzMmx0c21pcG4z
MiBlbGY2NGx0c21pcCIKICAJCQk7OwpAQCAtMjcwLDcgKzI3MCw3IEBAIGluZGV4IGY0ZjBlYWY5
YjIuLjBkYTNlY2ExOWMgMTAwNjQ0CiAgCQkJdGFyZ19leHRyYV9lbXVscz0iZWxmMzJscjU5MDAi
CiAgCQkJdGFyZ19leHRyYV9saWJwYXRoPSR0YXJnX2V4dHJhX2VtdWxzCiBkaWZmIC0tZ2l0IGEv
b3Bjb2Rlcy9taXBzLWRpcy5jIGIvb3Bjb2Rlcy9taXBzLWRpcy5jCi1pbmRleCA3NTViYmUyOTRi
Li5jZTIyZWY2ODNhIDEwMDY0NAoraW5kZXggNzU1YmJlMjk0YmQuLmNlMjJlZjY4M2E2IDEwMDY0
NAogLS0tIGEvb3Bjb2Rlcy9taXBzLWRpcy5jCiArKysgYi9vcGNvZGVzL21pcHMtZGlzLmMKIEBA
IC02NzQsMTMgKzY3NCwxMSBAQCBjb25zdCBzdHJ1Y3QgbWlwc19hcmNoX2Nob2ljZSBtaXBzX2Fy
Y2hfY2hvaWNlc1tdID0KQEAgLTI5Myw3ICsyOTMsNyBAQCBpbmRleCA3NTViYmUyOTRiLi5jZTIy
ZWY2ODNhIDEwMDY0NAogICAgLyogVGhpcyBlbnRyeSwgbWlwczE2LCBpcyBoZXJlIG9ubHkgZm9y
IElTQS9wcm9jZXNzb3Igc2VsZWN0aW9uOyBkbwogICAgICAgbm90IHByaW50IGl0cyBuYW1lLiAg
Ki8KIGRpZmYgLS1naXQgYS9vcGNvZGVzL21pcHMtb3BjLmMgYi9vcGNvZGVzL21pcHMtb3BjLmMK
LWluZGV4IDUyNzBhZWVmYTguLmQxN2RjNzhjZDcgMTAwNjQ0CitpbmRleCA1MjcwYWVlZmE4MC4u
ZDE3ZGM3OGNkNzEgMTAwNjQ0CiAtLS0gYS9vcGNvZGVzL21pcHMtb3BjLmMKICsrKyBiL29wY29k
ZXMvbWlwcy1vcGMuYwogQEAgLTMyOCw2ICszMjgsNyBAQCBkZWNvZGVfbWlwc19vcGVyYW5kIChj
b25zdCBjaGFyICpwKQpAQCAtNDA0LDMgKzQwNCw2IEBAIGluZGV4IDUyNzBhZWVmYTguLmQxN2Rj
NzhjZDcgMTAwNjQ0CiAgeyJzd2MwIiwJCSJFLG8oYikiLAkweGUwMDAwMDAwLCAweGZjMDAwMDAw
LAlSRF8zfFJEX0MwfFNNLAkJMCwJCUkxLAkJMCwJSU9DVHxJT0NUUHxJT0NUMnxJMzcgfSwKICB7
InN3YzAiLAkJIkUsQShiKSIsCTAsICAgIChpbnQpIE1fU1dDMF9BQiwJSU5TTl9NQUNSTywJCTAs
CQlJMSwJCTAsCUlPQ1R8SU9DVFB8SU9DVDJ8STM3IH0sCiAgeyJzd2MxIiwJCSJULG8oYikiLAkw
eGU0MDAwMDAwLCAweGZjMDAwMDAwLAlSRF8xfFJEXzN8U018RlBfUywJMCwJCUkxLAkJMCwJMCB9
LAorLS0gCisyLjI4LjAKKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0
aWxzL2JpbnV0aWxzLzAwMTEtZml4LXRoZS1pbmNvcnJlY3QtYXNzZW1ibGluZy1mb3ItcHBjLXdh
aXQtbW5lbW9uaWMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRp
bHMvMDAxMS1maXgtdGhlLWluY29ycmVjdC1hc3NlbWJsaW5nLWZvci1wcGMtd2FpdC1tbmVtb25p
Yy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xMGMzZDgwODY1
Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0
aWxzLzAwMTEtZml4LXRoZS1pbmNvcnJlY3QtYXNzZW1ibGluZy1mb3ItcHBjLXdhaXQtbW5lbW9u
aWMucGF0Y2gKQEAgLTAsMCArMSwzNyBAQAorRnJvbSA3ODM2ZjhhYTU2ZWYwZjE4Yzg2NThkYzdl
NDk1MmE5ZDA5N2JhN2U4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogWmhlbmh1YSBM
dW8gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnpoZW5odWEu
bHVvQG54cC5jb20iPiZsdDt6aGVuaHVhLmx1b0BueHAuY29tJmd0OzwvYT4KK0RhdGU6IFNhdCwg
MTEgSnVuIDIwMTYgMjI6MDg6MjkgLTA1MDAKK1N1YmplY3Q6IFtQQVRDSCAxMS8xN10gZml4IHRo
ZSBpbmNvcnJlY3QgYXNzZW1ibGluZyBmb3IgcHBjIHdhaXQgbW5lbW9uaWMKKworU2lnbmVkLW9m
Zi1ieTogWmhlbmh1YSBMdW8gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOnpoZW5odWEubHVvQG54cC5jb20iPiZsdDt6aGVuaHVhLmx1b0BueHAuY29tJmd0Ozwv
YT4KKworVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCistLS0KKyBvcGNvZGVzL3BwYy1vcGMuYyB8
IDQgKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
KworZGlmZiAtLWdpdCBhL29wY29kZXMvcHBjLW9wYy5jIGIvb3Bjb2Rlcy9wcGMtb3BjLmMKK2lu
ZGV4IDVlMjBkNjE3NjY0Li40Yzk2NTZlY2YwOCAxMDA2NDQKKy0tLSBhL29wY29kZXMvcHBjLW9w
Yy5jCisrKysgYi9vcGNvZGVzL3BwYy1vcGMuYworQEAgLTYyNjUsOCArNjI2NSw2IEBAIGNvbnN0
IHN0cnVjdCBwb3dlcnBjX29wY29kZSBwb3dlcnBjX29wY29kZXNbXSA9IHsKKyB7IndhaXRhc2Vj
IiwJWCgzMSwzMCksICAgICAgWFJUUkFSQl9NQVNLLCBQT1dFUjgsCVBPV0VSOSwJCXswfX0sCisg
eyJ3YWl0cnN2IiwJWFdDUEwoMzEsMzAsMSwwKSwweGZmZmZmZmZmLCBQT1dFUjEwLAkwLAkJezB9
fSwKKyB7InBhdXNlX3Nob3J0IiwJWFdDUEwoMzEsMzAsMiwwKSwweGZmZmZmZmZmLCBQT1dFUjEw
LAkwLAkJezB9fSwKKy17IndhaXQiLAlYKDMxLDMwKSwJWFdDUExfTUFTSywgIFBPV0VSMTAsCTAs
CQl7V0MsIFBMfX0sCisteyJ3YWl0IiwJWCgzMSwzMCksCVhXQ19NQVNLLCAgICBQT1dFUjksCVBP
V0VSMTAsCXtXQ319LAorIAorIHsibHdlcHgiLAlYKDMxLDMxKSwJWF9NQVNLLAkgIEU1MDBNQ3xQ
UENBMiwgMCwJCXtSVCwgUkEwLCBSQn19LAorIAorQEAgLTYzMjYsNyArNjMyNCw3IEBAIGNvbnN0
IHN0cnVjdCBwb3dlcnBjX29wY29kZSBwb3dlcnBjX29wY29kZXNbXSA9IHsKKyAKKyB7IndhaXRy
c3YiLAlYKDMxLDYyKXwoMSZsdDsmbHQ7MjEpLCAweGZmZmZmZmZmLCBFNTAwTUN8UFBDQTIsIDAs
CQl7MH19LAorIHsid2FpdGltcGwiLAlYKDMxLDYyKXwoMiZsdDsmbHQ7MjEpLCAweGZmZmZmZmZm
LCBFNTAwTUN8UFBDQTIsIDAsCQl7MH19LAorLXsid2FpdCIsCVgoMzEsNjIpLAlYV0NfTUFTSywg
ICAgRTUwME1DfFBQQ0EyLCAwLAkJe1dDfX0sCisreyJ3YWl0IiwJWCgzMSw2MiksCVhXQ19NQVNL
LCAgICBFNTAwTUN8UFBDQTJ8UE9XRVI5fFBPV0VSMTAsIDAsCXtXQ319LAorIAorIHsiZGNic3Rl
cCIsCVhSVCgzMSw2MywwKSwJWFJUX01BU0ssICAgIEU1MDBNQ3xQUENBMiwgMCwJCXtSQTAsIFJC
fX0sCisgCistLSAKKzIuMjguMAorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YmludXRpbHMvYmludXRpbHMvMDAxNC1EZXRlY3QtNjQtYml0LU1JUFMtdGFyZ2V0cy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDEyLURldGVjdC02NC1i
aXQtTUlQUy10YXJnZXRzLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDE0LURldGVjdC02NC1iaXQt
TUlQUy10YXJnZXRzLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRp
bHMvYmludXRpbHMvMDAxMi1EZXRlY3QtNjQtYml0LU1JUFMtdGFyZ2V0cy5wYXRjaAppbmRleCA2
YWNkZTFmNzgxLi5lZjhiMjUzYjZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YmludXRpbHMvYmludXRpbHMvMDAxNC1EZXRlY3QtNjQtYml0LU1JUFMtdGFyZ2V0cy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxMi1EZXRlY3Qt
NjQtYml0LU1JUFMtdGFyZ2V0cy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMmY3ZjIzODk3
NjRlZjFkNjk5ZjZhZDMyMDU3MzE0MDI0YjdlODRlNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGJmZjZiZGYyMTIzZjU0OTViOGJlOTMwMzA0ZDlhYTVlODgwMDZhNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFp
bC5jb20mZ3Q7PC9hPgogRGF0ZTogRnJpLCAzMSBNYXIgMjAxNyAxMTo0MjowMyAtMDcwMAotU3Vi
amVjdDogW1BBVENIXSBEZXRlY3QgNjQtYml0IE1JUFMgdGFyZ2V0cworU3ViamVjdDogW1BBVENI
IDEyLzE3XSBEZXRlY3QgNjQtYml0IE1JUFMgdGFyZ2V0cwogCiBBZGQgbWlwczY0IHRhcmdldCB0
cmlwbGV0cyBhbmQgZGVmYXVsdCB0byBONjQKIApAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KICAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZ29sZC9jb25m
aWd1cmUudGd0IGIvZ29sZC9jb25maWd1cmUudGd0Ci1pbmRleCBhYTdlYzU1MmFlLi40NzA1MTUw
NjJlIDEwMDY0NAoraW5kZXggYWE3ZWM1NTJhZWMuLjQ3MDUxNTA2MmU0IDEwMDY0NAogLS0tIGEv
Z29sZC9jb25maWd1cmUudGd0CiArKysgYi9nb2xkL2NvbmZpZ3VyZS50Z3QKIEBAIC0xNTMsNiAr
MTUzLDEzIEBAIGFhcmNoNjQqLSopCkBAIC00NSwzICs0NSw2IEBAIGluZGV4IGFhN2VjNTUyYWUu
LjQ3MDUxNTA2MmUgMTAwNjQ0CiAgbWlwcyotKi0qKQogICB0YXJnX29iaj1taXBzCiAgIHRhcmdf
bWFjaGluZT1FTV9NSVBTCistLSAKKzIuMjguMAorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAwNy1Vc2UtbGlidG9vbC0yLjQucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxMy1Vc2UtbGlidG9vbC0y
LjQucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDctVXNlLWxpYnRvb2wtMi40LnBhdGNoCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxMy1Vc2UtbGli
dG9vbC0yLjQucGF0Y2gKaW5kZXggODlkYTYyZmJmNy4uOTg3YTk2ZjRiNyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMDctVXNlLWxpYnRvb2wt
Mi40LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8w
MDEzLVVzZS1saWJ0b29sLTIuNC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gYjhmYWZkOGNl
NmM0N2M5YTU1MWVkNzk2MTc2ZDg4NGEzNDkzMDA4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gN2UyZGRlZTg3MDRjOWMzYjczNzYwZGQ5NDY0YjE4ZmFkZTU2M2Q4NSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFp
bC5jb20mZ3Q7PC9hPgogRGF0ZTogU3VuLCAxNCBGZWIgMjAxNiAxNzowNDowNyArMDAwMAotU3Vi
amVjdDogW1BBVENIIDA3LzE1XSBVc2UgbGlidG9vbCAyLjQKK1N1YmplY3Q6IFtQQVRDSCAxMy8x
N10gVXNlIGxpYnRvb2wgMi40CiAKIGdldCBsaWJ0b29sIHN5c3Jvb3Qgc3VwcG9ydAogCkBAIC0y
MiwxMCArMjIsMTEgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5r
aGVtQGdtYWlsLmNvbSZndDs8L2E+CiAgbHR2ZXJzaW9uLm00ICAgICAgIHwgICAxMiArLQogIGx0
fm9ic29sZXRlLm00ICAgICB8ICAgIDIgKy0KICBvcGNvZGVzL2NvbmZpZ3VyZSAgfCAxMzIwICsr
KysrKysrKysrKysrKy0tLS0tCi0gMTMgZmlsZXMgY2hhbmdlZCwgOTkzOSBpbnNlcnRpb25zKCsp
LCAzNzAwIGRlbGV0aW9ucygtKQorIHpsaWIvY29uZmlndXJlICAgICB8IDEzMjAgKysrKysrKysr
KysrKysrLS0tLS0KKyAxNCBmaWxlcyBjaGFuZ2VkLCAxMDkzMSBpbnNlcnRpb25zKCspLCA0MDI4
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYmZkL2NvbmZpZ3VyZSBiL2JmZC9jb25maWd1
cmUKLWluZGV4IGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4MSAxMDA3NTUKK2luZGV4IDAzNDBlZDU0
MWI1Li4yMDEyNjU2YjNiNyAxMDA3NTUKIC0tLSBhL2JmZC9jb25maWd1cmUKICsrKyBiL2JmZC9j
b25maWd1cmUKIEBAIC03MDQsNiArNzA0LDkgQEAgT1RPT0wKQEAgLTEzNTAsNyArMTM1MSw3IEBA
IGluZGV4IGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4MSAxMDA3NTUKICBpbnQgbWFpbiAoKQogIHsK
ICAgIHZvaWQgKnNlbGYgPSBkbG9wZW4gKDAsIExUX0RMR0xPQkFMfExUX0RMTEFaWV9PUl9OT1cp
OwotQEAgLTE0NTU0LDcgKzE1MjA5LDcgQEAgU0hBUkVEX0xERkxBR1M9CitAQCAtMTQ1NzgsNyAr
MTUyMzMsNyBAQCBTSEFSRURfTERGTEFHUz0KICBpZiB0ZXN0ICIkZW5hYmxlX3NoYXJlZCIgPSAi
eWVzIjsgdGhlbgogICAgeD1gc2VkIC1uIC1lICdzL15bIAldKlBJQ0ZMQUdbIAldKj1bIAldKi8v
cCcgJmx0OyAuLi9saWJpYmVydHkvTWFrZWZpbGUgfCBzZWQgLW4gJyRwJ2AKICAgIGlmIHRlc3Qg
LW4gIiR4IjsgdGhlbgpAQCAtMTM1OSw3ICsxMzYwLDcgQEAgaW5kZXggYmM1NzZiNzg5NGEuLmNk
MDM2NjM4MDgxIDEwMDc1NQogICAgZmkKICAKICAgIGNhc2UgIiR7aG9zdH0iIGluCi1AQCAtMTcx
NzYsMTMgKzE3ODMxLDIwIEBAIGV4ZWV4dD0nYCRFQ0hPICIkZXhlZXh0IiB8ICRTRUQgIiRkZWxh
eV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKK0BAIC0xNzE5NywxMyArMTc4NTIsMjAgQEAgZXhlZXh0
PSdgJEVDSE8gIiRleGVleHQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwog
IGx0X3Vuc2V0PSdgJEVDSE8gIiRsdF91bnNldCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3Rl
X3N1YnN0ImAnCiAgbHRfU1AyTkw9J2AkRUNITyAiJGx0X1NQMk5MIiB8ICRTRUQgIiRkZWxheV9z
aW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9OTDJTUD0nYCRFQ0hPICIkbHRfTkwyU1AiIHwgJFNF
RCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpgJ0BALTEzODAsNysxMzgxLDdAQGluZGV4YmM1NzZiNzg5NGEuLmNk
MDM2NjM4MDgxMTAwNzU1U1RSSVA9J2AkRUNITyI+ImAnCkBAIC0xMzgwLDcgKzEzODEsNyBAQCBp
bmRleCBiYzU3NmI3ODk0YS4uY2QwMzY2MzgwODEgMTAwNzU1CiAgU1RSSVA9J2AkRUNITyAiPC9h
PiRTVFJJUCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgUkFOTElCPSdg
JEVDSE8gIiRSQU5MSUIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIG9s
ZF9wb3N0aW5zdGFsbF9jbWRzPSdgJEVDSE8gIiRvbGRfcG9zdGluc3RhbGxfY21kcyIgfCAkU0VE
ICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCi1AQCAtMTcxOTcsMTQgKzE3ODU5LDE3IEBA
IGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGU9J2AkRUNITyAiJGx0X2N2X3N5c19nbG9iYWxf
c3ltYm9sX3BpcGUiIHwgJFNFRCAiJGRlCitAQCAtMTcyMTgsMTQgKzE3ODgwLDE3IEBAIGx0X2N2
X3N5c19nbG9iYWxfc3ltYm9sX3BpcGU9J2AkRUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9s
X3BpcGUiIHwgJFNFRCAiJGRlCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY2RlY2w9J2Ak
RUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsIiB8ICRTRUQgIiRkZWxheV9z
aW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVf
YWRkcmVzcz0nYCRFQ0hPICIkbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJl
c3MiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGx0X2N2X3N5c19nbG9i
YWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXg9J2AkRUNITyAiJGx0X2N2X3N5
c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXgiIHwgJFNFRCAiJGRl
bGF5X3NpbmdsZV9xdW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Im1haWx0bzpgJ0BALTEzOTksNysxNDAwLDdAQGluZGV4YmM1NzZiNzg5NGEuLmNkMDM2NjM4
MDgxMTAwNzU1RFNZTVVUSUw9J2AkRUNITyI+ImAnCkBAIC0xMzk5LDcgKzE0MDAsNyBAQCBpbmRl
eCBiYzU3NmI3ODk0YS4uY2QwMzY2MzgwODEgMTAwNzU1CiAgRFNZTVVUSUw9J2AkRUNITyAiPC9h
PiREU1lNVVRJTCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgTk1FRElU
PSdgJEVDSE8gIiROTUVESVQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwog
IExJUE89J2AkRUNITyAiJExJUE8iIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJg
JwotQEAgLTE3MjM3LDEyICsxNzkwMiwxMiBAQCBoYXJkY29kZV9zaGxpYnBhdGhfdmFyPSdgJEVD
SE8gIiRoYXJkY29kZV9zaGxpYnBhdGhfdmFyIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcQorQEAg
LTE3MjU4LDEyICsxNzkyMywxMiBAQCBoYXJkY29kZV9zaGxpYnBhdGhfdmFyPSdgJEVDSE8gIiRo
YXJkY29kZV9zaGxpYnBhdGhfdmFyIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcQogIGhhcmRjb2Rl
X2F1dG9tYXRpYz0nYCRFQ0hPICIkaGFyZGNvZGVfYXV0b21hdGljIiB8ICRTRUQgIiRkZWxheV9z
aW5nbGVfcXVvdGVfc3Vic3QiYCcKICBpbmhlcml0X3JwYXRoPSdgJEVDSE8gIiRpbmhlcml0X3Jw
YXRoIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsaW5rX2FsbF9kZXBs
aWJzPSdgJEVDSE8gIiRsaW5rX2FsbF9kZXBsaWJzIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVv
dGVfc3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YCdA
QC0xNDEzLDcrMTQxNCw3QEBpbmRleGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4MTEwMDc1NWZpbGVf
bGlzdF9zcGVjPSdgJEVDSE8iPiJgJwpAQCAtMTQxMyw3ICsxNDE0LDcgQEAgaW5kZXggYmM1NzZi
Nzg5NGEuLmNkMDM2NjM4MDgxIDEwMDc1NQogIGZpbGVfbGlzdF9zcGVjPSdgJEVDSE8gIjwvYT4k
ZmlsZV9saXN0X3NwZWMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIHZh
cmlhYmxlc19zYXZlZF9mb3JfcmVsaW5rPSdgJEVDSE8gIiR2YXJpYWJsZXNfc2F2ZWRfZm9yX3Jl
bGluayIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgbmVlZF9saWJfcHJl
Zml4PSdgJEVDSE8gIiRuZWVkX2xpYl9wcmVmaXgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpgJy1A
QC0xNzI5Nyw4KzE3OTYyLDEzQEByZWxvYWRfZmxhZ1wrQEAtMTczMTgsOCsxNzk4MywxM0BAcmVs
b2FkX2ZsYWdcT0JKRFVNUFxkZXBsaWJzX2NoZWNrX21ldGhvZFxmaWxlX21hZ2ljX2NtZFxAQC0x
NDI3LDcrMTQyOCw3QEBpbmRleGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4MTEwMDc1NVNUUklQXFJB
TkxJQlxDQ1wtQEAtMTczMDgsMTIrMTc5NzgsMTRAQGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3Bp
cGVcK0BALTE3MzI5LDEyKzE3OTk5LDE0QEBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlXGx0
X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsXGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3Rv
X2NfbmFtZV9hZGRyZXNzXGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNz
X2xpYl9wcmVmaXhcQEAtMTQ0Myw3KzE0NDQsN0BAaW5kZXhiYzU3NmI3ODk0YS4uY2QwMzY2Mzgw
ODExMDA3NTVEU1lNVVRJTFxOTUVESVRcTElQT1wtQEAtMTczMjksNysxODAwMSw2QEBub191bmRl
ZmluZWRfZmxhZ1wrQEAtMTczNTAsNysxODAyMiw2QEBub191bmRlZmluZWRfZmxhZ1xoYXJkY29k
ZV9saWJkaXJfZmxhZ19zcGVjXGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWNfbGRcaGFyZGNvZGVf
bGliZGlyX3NlcGFyYXRvclxAQC0xNDUxLDcrMTQ1Miw3QEBpbmRleGJjNTc2Yjc4OTRhLi5jZDAz
NjYzODA4MTEwMDc1NWV4Y2x1ZGVfZXhwc3ltc1xpbmNsdWRlX2V4cHN5bXNcZmlsZV9saXN0X3Nw
ZWNcLUBALTE3MzY1LDYrMTgwMzYsN0BAbW9kdWxlX2NtZHNcK0BALTE3Mzg2LDYrMTgwNTcsN0BA
bW9kdWxlX2NtZHNcbW9kdWxlX2V4cHN5bV9jbWRzXGV4cG9ydF9zeW1ib2xzX2NtZHNccHJlbGlu
a19jbWRzXEBALTE0NTksNysxNDYwLDdAQGluZGV4YmM1NzZiNzg5NGEuLmNkMDM2NjM4MDgxMTAw
NzU1cG9zdGluc3RhbGxfY21kc1xwb3N0dW5pbnN0YWxsX2NtZHNcZmluaXNoX2NtZHNcLUBALTE4
MTUzLDcrMTg4MjUsOEBAJGFzX2VjaG9YIj4iYCcKLUBAIC0xNzI5Nyw4ICsxNzk2MiwxMyBAQCBy
ZWxvYWRfZmxhZyBcCitAQCAtMTczMTgsOCArMTc5ODMsMTMgQEAgcmVsb2FkX2ZsYWcgXAogIE9C
SkRVTVAgXAogIGRlcGxpYnNfY2hlY2tfbWV0aG9kIFwKICBmaWxlX21hZ2ljX2NtZCBcCkBAIC0x
NDI3LDcgKzE0MjgsNyBAQCBpbmRleCBiYzU3NmI3ODk0YS4uY2QwMzY2MzgwODEgMTAwNzU1CiAg
U1RSSVAgXAogIFJBTkxJQiBcCiAgQ0MgXAotQEAgLTE3MzA4LDEyICsxNzk3OCwxNCBAQCBsdF9j
dl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlIFwKK0BAIC0xNzMyOSwxMiArMTc5OTksMTQgQEAgbHRf
Y3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZSBcCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9f
Y2RlY2wgXAogIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzIFwKICBs
dF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4IFwKQEAg
LTE0NDMsNyArMTQ0NCw3IEBAIGluZGV4IGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4MSAxMDA3NTUK
ICBEU1lNVVRJTCBcCiAgTk1FRElUIFwKICBMSVBPIFwKLUBAIC0xNzMyOSw3ICsxODAwMSw2IEBA
IG5vX3VuZGVmaW5lZF9mbGFnIFwKK0BAIC0xNzM1MCw3ICsxODAyMiw2IEBAIG5vX3VuZGVmaW5l
ZF9mbGFnIFwKICBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjIFwKICBoYXJkY29kZV9saWJkaXJf
ZmxhZ19zcGVjX2xkIFwKICBoYXJkY29kZV9saWJkaXJfc2VwYXJhdG9yIFwKQEAgLTE0NTEsNyAr
MTQ1Miw3IEBAIGluZGV4IGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4MSAxMDA3NTUKICBleGNsdWRl
X2V4cHN5bXMgXAogIGluY2x1ZGVfZXhwc3ltcyBcCiAgZmlsZV9saXN0X3NwZWMgXAotQEAgLTE3
MzY1LDYgKzE4MDM2LDcgQEAgbW9kdWxlX2NtZHMgXAorQEAgLTE3Mzg2LDYgKzE4MDU3LDcgQEAg
bW9kdWxlX2NtZHMgXAogIG1vZHVsZV9leHBzeW1fY21kcyBcCiAgZXhwb3J0X3N5bWJvbHNfY21k
cyBcCiAgcHJlbGlua19jbWRzIFwKQEAgLTE0NTksNyArMTQ2MCw3IEBAIGluZGV4IGJjNTc2Yjc4
OTRhLi5jZDAzNjYzODA4MSAxMDA3NTUKICBwb3N0aW5zdGFsbF9jbWRzIFwKICBwb3N0dW5pbnN0
YWxsX2NtZHMgXAogIGZpbmlzaF9jbWRzIFwKLUBAIC0xODE1Myw3ICsxODgyNSw4IEBAICRhc19l
Y2hvIFgiPC9hPiRmaWxlIiB8CitAQCAtMTgxNzQsNyArMTg4NDYsOCBAQCAkYXNfZWNobyBYIiRm
aWxlIiB8CiAgIyBOT1RFOiBDaGFuZ2VzIG1hZGUgdG8gdGhpcyBmaWxlIHdpbGwgYmUgbG9zdDog
bG9vayBhdCBsdG1haW4uc2guCiAgIwogICMgICBDb3B5cmlnaHQgKEMpIDE5OTYsIDE5OTcsIDE5
OTgsIDE5OTksIDIwMDAsIDIwMDEsIDIwMDMsIDIwMDQsIDIwMDUsCkBAIC0xNDY5LDcgKzE0NzAs
NyBAQCBpbmRleCBiYzU3NmI3ODk0YS4uY2QwMzY2MzgwODEgMTAwNzU1CiAgIyAgIFdyaXR0ZW4g
YnkgR29yZG9uIE1hdHppZ2tlaXQsIDE5OTYKICAjCiAgIyAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9m
IEdOVSBMaWJ0b29sLgotQEAgLTE4MjU2LDE5ICsxODkyOSw0MiBAQCBTUDJOTD0kbHRfbHRfU1Ay
TkwKK0BAIC0xODI3NywxOSArMTg5NTAsNDIgQEAgU1AyTkw9JGx0X2x0X1NQMk5MCiAgIyB0dXJu
IG5ld2xpbmVzIGludG8gc3BhY2VzLgogIE5MMlNQPSRsdF9sdF9OTDJTUAogIApAQCAtMTUxMyw3
ICsxNTE0LDcgQEAgaW5kZXggYmM1NzZiNzg5NGEuLmNkMDM2NjM4MDgxIDEwMDc1NQogICMgQSBz
eW1ib2wgc3RyaXBwaW5nIHByb2dyYW0uCiAgU1RSSVA9JGx0X1NUUklQCiAgCi1AQCAtMTgyOTgs
NiArMTg5OTQsMTIgQEAgZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcz0kbHRfbHRfY3Zf
c3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3MKK0BAIC0xODMxOSw2ICsxOTAxNSwx
MiBAQCBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzPSRsdF9sdF9jdl9zeXNfZ2xvYmFs
X3N5bWJvbF90b19jX25hbWVfYWRkcmVzcwogICMgVHJhbnNmb3JtIHRoZSBvdXRwdXQgb2Ygbm0g
aW4gYSBDIG5hbWUgYWRkcmVzcyBwYWlyIHdoZW4gbGliIHByZWZpeCBpcyBuZWVkZWQuCiAgZ2xv
YmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4PSRsdF9sdF9jdl9zeXNfZ2xv
YmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4CiAgCkBAIC0xNTI2LDcgKzE1
MjcsNyBAQCBpbmRleCBiYzU3NmI3ODk0YS4uY2QwMzY2MzgwODEgMTAwNzU1CiAgIyBUaGUgbmFt
ZSBvZiB0aGUgZGlyZWN0b3J5IHRoYXQgY29udGFpbnMgdGVtcG9yYXJ5IGxpYnRvb2wgZmlsZXMu
CiAgb2JqZGlyPSRvYmpkaXIKICAKLUBAIC0xODMwNyw2ICsxOTAwOSw5IEBAIE1BR0lDX0NNRD0k
TUFHSUNfQ01ECitAQCAtMTgzMjgsNiArMTkwMzAsOSBAQCBNQUdJQ19DTUQ9JE1BR0lDX0NNRAog
ICMgTXVzdCB3ZSBsb2NrIGZpbGVzIHdoZW4gZG9pbmcgY29tcGlsYXRpb24/CiAgbmVlZF9sb2Nr
cz0kbHRfbmVlZF9sb2NrcwogIApAQCAtMTUzNiw3ICsxNTM3LDcgQEAgaW5kZXggYmM1NzZiNzg5
NGEuLmNkMDM2NjM4MDgxIDEwMDc1NQogICMgVG9vbCB0byBtYW5pcHVsYXRlIGFyY2hpdmVkIERX
QVJGIGRlYnVnIHN5bWJvbCBmaWxlcyBvbiBNYWMgT1MgWC4KICBEU1lNVVRJTD0kbHRfRFNZTVVU
SUwKICAKLUBAIC0xODQyMSwxMiArMTkxMjYsMTIgQEAgd2l0aF9nY2M9JEdDQworQEAgLTE4NDQy
LDEyICsxOTE0NywxMiBAQCB3aXRoX2djYz0kR0NDCiAgIyBDb21waWxlciBmbGFnIHRvIHR1cm4g
b2ZmIGJ1aWx0aW4gZnVuY3Rpb25zLgogIG5vX2J1aWx0aW5fZmxhZz0kbHRfbHRfcHJvZ19jb21w
aWxlcl9ub19idWlsdGluX2ZsYWcKICAKQEAgLTE1NTIsNyArMTU1Myw3IEBAIGluZGV4IGJjNTc2
Yjc4OTRhLi5jZDAzNjYzODA4MSAxMDA3NTUKICAjIENvbXBpbGVyIGZsYWcgdG8gcHJldmVudCBk
eW5hbWljIGxpbmtpbmcuCiAgbGlua19zdGF0aWNfZmxhZz0kbHRfbHRfcHJvZ19jb21waWxlcl9z
dGF0aWMKICAKLUBAIC0xODUxMyw5ICsxOTIxOCw2IEBAIGluaGVyaXRfcnBhdGg9JGluaGVyaXRf
cnBhdGgKK0BAIC0xODUzNCw5ICsxOTIzOSw2IEBAIGluaGVyaXRfcnBhdGg9JGluaGVyaXRfcnBh
dGgKICAjIFdoZXRoZXIgbGlidG9vbCBtdXN0IGxpbmsgYSBwcm9ncmFtIGFnYWluc3QgYWxsIGl0
cyBkZXBlbmRlbmN5IGxpYnJhcmllcy4KICBsaW5rX2FsbF9kZXBsaWJzPSRsaW5rX2FsbF9kZXBs
aWJzCiAgCkBAIC0xNTYyLDcgKzE1NjMsNyBAQCBpbmRleCBiYzU3NmI3ODk0YS4uY2QwMzY2Mzgw
ODEgMTAwNzU1CiAgIyBTZXQgdG8gInllcyIgaWYgZXhwb3J0ZWQgc3ltYm9scyBhcmUgcmVxdWly
ZWQuCiAgYWx3YXlzX2V4cG9ydF9zeW1ib2xzPSRhbHdheXNfZXhwb3J0X3N5bWJvbHMKICAKLUBA
IC0xODUzMSw2ICsxOTIzMyw5IEBAIGluY2x1ZGVfZXhwc3ltcz0kbHRfaW5jbHVkZV9leHBzeW1z
CitAQCAtMTg1NTIsNiArMTkyNTQsOSBAQCBpbmNsdWRlX2V4cHN5bXM9JGx0X2luY2x1ZGVfZXhw
c3ltcwogICMgQ29tbWFuZHMgbmVjZXNzYXJ5IGZvciBsaW5raW5nIHByb2dyYW1zIChhZ2FpbnN0
IGxpYnJhcmllcykgd2l0aCB0ZW1wbGF0ZXMuCiAgcHJlbGlua19jbWRzPSRsdF9wcmVsaW5rX2Nt
ZHMKICAKQEAgLTE1NzIsNyArMTU3Myw3IEBAIGluZGV4IGJjNTc2Yjc4OTRhLi5jZDAzNjYzODA4
MSAxMDA3NTUKICAjIFNwZWNpZnkgZmlsZW5hbWUgY29udGFpbmluZyBpbnB1dCBmaWxlcy4KICBm
aWxlX2xpc3Rfc3BlYz0kbHRfZmlsZV9saXN0X3NwZWMKICAKLUBAIC0xODU2MywyMTAgKzE5MjY4
LDE2OSBAQCBsdG1haW49IiRhY19hdXhfZGlyL2x0bWFpbi5zaCIKK0BAIC0xODU4NCwyMTAgKzE5
Mjg5LDE2OSBAQCBsdG1haW49IiRhY19hdXhfZGlyL2x0bWFpbi5zaCIKICAgICMgaWYgZmluZHMg
bWl4ZWQgQ1IvTEYgYW5kIExGLW9ubHkgbGluZXMuICBTaW5jZSBzZWQgb3BlcmF0ZXMgaW4KICAg
ICMgdGV4dCBtb2RlLCBpdCBwcm9wZXJseSBjb252ZXJ0cyBsaW5lcyB0byBDUi9MRi4gIFRoaXMg
YmFzaCBwcm9ibGVtCiAgICAjIGlzIHJlcG9ydGVkbHkgZml4ZWQsIGJ1dCB3aHkgbm90IHJ1biBv
biBvbGQgdmVyc2lvbnMgdG9vPwpAQCAtMTk0NywxMCArMTk0OCwxMCBAQCBpbmRleCBiYzU3NmI3
ODk0YS4uY2QwMzY2MzgwODEgMTAwNzU1CiAgICBjaG1vZCAreCAiJG9maWxlIgogIAogZGlmZiAt
LWdpdCBhL2JmZC9jb25maWd1cmUuYWMgYi9iZmQvY29uZmlndXJlLmFjCi1pbmRleCBjNWJmYmQ1
ZDEyOS4uZTY2NmIxY2MxMDYgMTAwNjQ0CitpbmRleCA4ZTg2ZjgzOTljZS4uZTg3MDBjOWQ0ZDIg
MTAwNjQ0CiAtLS0gYS9iZmQvY29uZmlndXJlLmFjCiArKysgYi9iZmQvY29uZmlndXJlLmFjCi1A
QCAtMjkwLDcgKzI5MCw3IEBAIGNoYW5nZXF1b3RlKCwpZG5sCitAQCAtMzE0LDcgKzMxNCw3IEBA
IGNoYW5nZXF1b3RlKCwpZG5sCiAgICB4PWBzZWQgLW4gLWUgJ3MvXlsgCV0qUElDRkxBR1sgCV0q
PVsgCV0qLy9wJyAmbHQ7IC4uL2xpYmliZXJ0eS9NYWtlZmlsZSB8IHNlZCAtbiAnJHAnYAogIGNo
YW5nZXF1b3RlKFssXSlkbmwKICAgIGlmIHRlc3QgLW4gIiR4IjsgdGhlbgpAQCAtMTk2MCwxMCAr
MTk2MSwxMCBAQCBpbmRleCBjNWJmYmQ1ZDEyOS4uZTY2NmIxY2MxMDYgMTAwNjQ0CiAgCiAgICBj
YXNlICIke2hvc3R9PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OmluZGlmZi0tZ2l0YS9iaW51dGlscy9jb25maWd1cmViL2JpbnV0aWxzL2NvbmZpZ3VyZS1pbmRl
eGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MzEwMDc1NStpbmRleDg5Yzk5YWJmZWJhLi5kMzI4OWE1
ZWZjZDEwMDc1NS0tLWEvYmludXRpbHMvY29uZmlndXJlKysrYi9iaW51dGlscy9jb25maWd1cmUt
QEAtNjkwLDgrNjkwLDExQEBPVE9PTCtAQC02OTIsOCs2OTIsMTFAQE9UT09MTElQT05NRURJVERT
WU1VVElMQEAtMTk3NSw3KzE5NzYsN0BAaW5kZXhhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMxMDA3
NTVPQkpEVU1QTE5fU05NLUBALTgwOCw2KzgxMSw3QEBlbmFibGVfc3RhdGljK0BALTgxMCw2Kzgx
Myw3QEBlbmFibGVfc3RhdGljd2l0aF9waWNlbmFibGVfZmFzdF9pbnN0YWxsd2l0aF9nbnVfbGRA
QC0xOTgzLDcrMTk4NCw3QEBpbmRleGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MzEwMDc1NWVuYWJs
ZV9saWJ0b29sX2xvY2tlbmFibGVfcGx1Z2luc2VuYWJsZV9sYXJnZWZpbGUtQEAtMTQ4NSw2KzE0
ODksOEBAT3B0aW9uYWxQYWNrYWdlczorQEAtMTQ5MCw2KzE0OTQsOEBAT3B0aW9uYWxQYWNrYWdl
czotLXdpdGgtcGljdHJ5dG91c2Vvbmx5UElDL25vbi1QSUNvYmplY3RzW2RlZmF1bHQ9dXNlYm90
aF0tLXdpdGgtZ251LWxkYXNzdW1ldGhlQ2NvbXBpbGVydXNlc0dOVWxkW2RlZmF1bHQ9bm9dQEAt
MTk5Miw3KzE5OTMsN0BAaW5kZXhhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMxMDA3NTUtLXdpdGgt
ZGVidWdpbmZvZEVuYWJsZWRlYnVnaW5mb2xvb2t1cHN3aXRoZGVidWdpbmZvZChhdXRvL3llcy9u
byktLXdpdGgtc3lzdGVtLXpsaWJ1c2VpbnN0YWxsZWRsaWJ6LUBALTU0NjEsOCs1NDY3LDhAQGVz
YWMrQEAtNTQ2Nyw4KzU0NzMsOEBAZXNhY0BALTIwMDMsNysyMDA0LDdAQGluZGV4YThkZmQ0YmQ2
OGMuLjgyMzE2NDk2OTUzMTAwNzU1LUBALTU1MDIsNys1NTA4LDdAQEVDSE89JEVDSE8kRUNITyRF
Q0hPJEVDSE8kRUNITyRFQ0hPK0BALTU1MDgsNys1NTE0LDdAQEVDSE89JEVDSE8kRUNITyRFQ0hP
JEVDSE8kRUNITyRFQ0hPeyRhc19lY2hvIj4iIGluCiBkaWZmIC0tZ2l0IGEvYmludXRpbHMvY29u
ZmlndXJlIGIvYmludXRpbHMvY29uZmlndXJlCi1pbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5
NTMgMTAwNzU1CitpbmRleCA4OWM5OWFiZmViYS4uZDMyODlhNWVmY2QgMTAwNzU1CiAtLS0gYS9i
aW51dGlscy9jb25maWd1cmUKICsrKyBiL2JpbnV0aWxzL2NvbmZpZ3VyZQotQEAgLTY5MCw4ICs2
OTAsMTEgQEAgT1RPT0wKK0BAIC02OTIsOCArNjkyLDExIEBAIE9UT09MCiAgTElQTwogIE5NRURJ
VAogIERTWU1VVElMCkBAIC0xOTc1LDcgKzE5NzYsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIz
MTY0OTY5NTMgMTAwNzU1CiAgT0JKRFVNUAogIExOX1MKICBOTQotQEAgLTgwOCw2ICs4MTEsNyBA
QCBlbmFibGVfc3RhdGljCitAQCAtODEwLDYgKzgxMyw3IEBAIGVuYWJsZV9zdGF0aWMKICB3aXRo
X3BpYwogIGVuYWJsZV9mYXN0X2luc3RhbGwKICB3aXRoX2dudV9sZApAQCAtMTk4Myw3ICsxOTg0
LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIGVuYWJsZV9saWJ0
b29sX2xvY2sKICBlbmFibGVfcGx1Z2lucwogIGVuYWJsZV9sYXJnZWZpbGUKLUBAIC0xNDg1LDYg
KzE0ODksOCBAQCBPcHRpb25hbCBQYWNrYWdlczoKK0BAIC0xNDkwLDYgKzE0OTQsOCBAQCBPcHRp
b25hbCBQYWNrYWdlczoKICAgIC0td2l0aC1waWMgICAgICAgICAgICAgIHRyeSB0byB1c2Ugb25s
eSBQSUMvbm9uLVBJQyBvYmplY3RzIFtkZWZhdWx0PXVzZQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYm90aF0KICAgIC0td2l0aC1nbnUtbGQgICAgICAgICAgIGFzc3VtZSB0aGUgQyBjb21w
aWxlciB1c2VzIEdOVSBsZCBbZGVmYXVsdD1ub10KQEAgLTE5OTIsNyArMTk5Myw3IEBAIGluZGV4
IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgIC0td2l0aC1kZWJ1Z2luZm9kICAg
ICAgIEVuYWJsZSBkZWJ1Z2luZm8gbG9va3VwcyB3aXRoIGRlYnVnaW5mb2QKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChhdXRvL3llcy9ubykKICAgIC0td2l0aC1zeXN0ZW0temxpYiAgICAg
IHVzZSBpbnN0YWxsZWQgbGliegotQEAgLTU0NjEsOCArNTQ2Nyw4IEBAIGVzYWMKK0BAIC01NDY3
LDggKzU0NzMsOCBAQCBlc2FjCiAgCiAgCiAgCkBAIC0yMDAzLDcgKzIwMDQsNyBAQCBpbmRleCBh
OGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgCiAgCiAgCi1AQCAtNTUwMiw3ICs1NTA4
LDcgQEAgRUNITz0kRUNITyRFQ0hPJEVDSE8kRUNITyRFQ0hPJEVDSE8KK0BAIC01NTA4LDcgKzU1
MTQsNyBAQCBFQ0hPPSRFQ0hPJEVDSE8kRUNITyRFQ0hPJEVDSE8kRUNITwogIHsgJGFzX2VjaG8g
IjwvYT4kYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGNoZWNraW5nIGhvdyB0byBwcmludCBz
dHJpbmdzIiAmZ3Q7JmFtcDs1CiAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgaG93IHRvIHByaW50IHN0
cmluZ3MuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAgIyBUZXN0IHByaW50IGZpcnN0LCBiZWNhdXNlIGl0
IHdpbGwgYmUgYSBidWlsdGluIGlmIHByZXNlbnQuCkBAIC0yMDEyLDcgKzIwMTMsNyBAQCBpbmRl
eCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgICAgdGVzdCAiWGBwcmludCAtciAt
LSAkRUNITyAyJmd0Oy9kZXYvbnVsbGAiID0gIlgkRUNITyI7IHRoZW4KICAgIEVDSE89J3ByaW50
IC1yIC0tJwogIGVsaWYgdGVzdCAiWGBwcmludGYgJXMgJEVDSE8gMiZndDsvZGV2L251bGxgIiA9
ICJYJEVDSE8iOyB0aGVuCi1AQCAtNjE4OCw4ICs2MTk0LDggQEAgJGFzX2VjaG9fbiAiY2hlY2tp
bmcgd2hldGhlciB0aGUgc2hlbGwgdW5kZXJzdGFuZHMgc29tZSBYU0kgY29uc3RydWN0cy4uLiAi
ICZndDsmYW1wOzY7CitAQCAtNjE5NCw4ICs2MjAwLDggQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcg
d2hldGhlciB0aGUgc2hlbGwgdW5kZXJzdGFuZHMgc29tZSBYU0kgY29uc3RydWN0cy4uLiAiICZn
dDsmYW1wOzY7CiAgIyBUcnkgc29tZSBYU0kgZmVhdHVyZXMKICB4c2lfc2hlbGw9bm8KICAoIF9s
dF9kdW1teT0iYS9iL2M8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86QEAtMjAyMyw3KzIwMjQsN0BAaW5kZXhhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMxMDA3NTUm
YW1wOyZhbXA7ZXZhbCd0ZXN0JCgoMSsxKSktZXEyXCZhbXA7JmFtcDt0ZXN0Ij4iCkBAIC0yMDIz
LDcgKzIwMjQsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgICAg
ICZhbXA7JmFtcDsgZXZhbCAndGVzdCAkKCggMSArIDEgKSkgLWVxIDIgXAogICAgICAmYW1wOyZh
bXA7IHRlc3QgIjwvYT4keyNfbHRfZHVtbXl9IiAtZXEgNScgKSAmZ3Q7L2Rldi9udWxsIDImZ3Q7
JmFtcDsxIFwKICAgICZhbXA7JmFtcDsgeHNpX3NoZWxsPXllcwotQEAgLTYyMzgsNiArNjI0NCw4
MCBAQCBlc2FjCitAQCAtNjI0NCw2ICs2MjUwLDgwIEBAIGVzYWMKICAKICAKICAKQEAgLTIxMDQs
NyArMjEwNSw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICB7ICRh
c19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGNoZWNraW5nIGZvciAkTEQgb3B0
aW9uIHRvIHJlbG9hZCBvYmplY3QgZmlsZXMiICZndDsmYW1wOzUKICAkYXNfZWNob19uICJjaGVj
a2luZyBmb3IgJExEIG9wdGlvbiB0byByZWxvYWQgb2JqZWN0IGZpbGVzLi4uICIgJmd0OyZhbXA7
NjsgfQogIGlmICR7bHRfY3ZfbGRfcmVsb2FkX2ZsYWcrOn0gZmFsc2U7IHRoZW4gOgotQEAgLTYy
NTQsNiArNjMzNCwxMSBAQCBjYXNlICRyZWxvYWRfZmxhZyBpbgorQEAgLTYyNjAsNiArNjM0MCwx
MSBAQCBjYXNlICRyZWxvYWRfZmxhZyBpbgogIGVzYWMKICByZWxvYWRfY21kcz0nJExEJHJlbG9h
ZF9mbGFnIC1vICRvdXRwdXQkcmVsb2FkX29ianMnCiAgY2FzZSAkaG9zdF9vcyBpbgpAQCAtMjEx
Niw3ICsyMTE3LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogICAg
ZGFyd2luKikKICAgICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4KICAgICAgICByZWxvYWRf
Y21kcz0nJExUQ0MgJExUQ0ZMQUdTIC1ub3N0ZGxpYiAke3dsfS1yIC1vICRvdXRwdXQkcmVsb2Fk
X29ianMnCi1AQCAtNjQyMiw3ICs2NTA3LDggQEAgbWluZ3cqIHwgcHczMiopCitAQCAtNjQyOCw3
ICs2NTEzLDggQEAgbWluZ3cqIHwgcHczMiopCiAgICAgIGx0X2N2X2RlcGxpYnNfY2hlY2tfbWV0
aG9kPSdmaWxlX21hZ2ljIF54ODYgYXJjaGl2ZSBpbXBvcnR8Xng4NiBETEwnCiAgICAgIGx0X2N2
X2ZpbGVfbWFnaWNfY21kPSdmdW5jX3dpbjMyX2xpYmlkJwogICAgZWxzZQpAQCAtMjEyNiw3ICsy
MTI3LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogICAgICBsdF9j
dl9maWxlX21hZ2ljX2NtZD0nJE9CSkRVTVAgLWYnCiAgICBmaQogICAgOzsKLUBAIC02NTc2LDYg
KzY2NjIsMjEgQEAgZXNhYworQEAgLTY1ODIsNiArNjY2OCwyMSBAQCBlc2FjCiAgZmkKICB7ICRh
c19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IHJlc3VsdDogJGx0X2N2X2RlcGxp
YnNfY2hlY2tfbWV0aG9kIiAmZ3Q7JmFtcDs1CiAgJGFzX2VjaG8gIiRsdF9jdl9kZXBsaWJzX2No
ZWNrX21ldGhvZCIgJmd0OyZhbXA7NjsgfQpAQCAtMjE0OCw3ICsyMTQ5LDcgQEAgaW5kZXggYThk
ZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIGZpbGVfbWFnaWNfY21kPSRsdF9jdl9maWxl
X21hZ2ljX2NtZAogIGRlcGxpYnNfY2hlY2tfbWV0aG9kPSRsdF9jdl9kZXBsaWJzX2NoZWNrX21l
dGhvZAogIHRlc3QgLXogIiRkZXBsaWJzX2NoZWNrX21ldGhvZCIgJmFtcDsmYW1wOyBkZXBsaWJz
X2NoZWNrX21ldGhvZD11bmtub3duCi1AQCAtNjU5MSw5ICs2NjkyLDE2MiBAQCB0ZXN0IC16ICIk
ZGVwbGlic19jaGVja19tZXRob2QiICZhbXA7JmFtcDsgZGVwbGlic19jaGVja19tZXRob2Q9dW5r
bm93bgorQEAgLTY1OTcsOSArNjY5OCwxNjIgQEAgdGVzdCAteiAiJGRlcGxpYnNfY2hlY2tfbWV0
aG9kIiAmYW1wOyZhbXA7IGRlcGxpYnNfY2hlY2tfbWV0aG9kPXVua25vd24KICAKICAKICAKQEAg
LTIzMTMsNyArMjMxNCw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUK
ICB7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGNoZWNraW5nIGZvciAk
YWNfd29yZCIgJmd0OyZhbXA7NQogICRhc19lY2hvX24gImNoZWNraW5nIGZvciAkYWNfd29yZC4u
LiAiICZndDsmYW1wOzY7IH0KICBpZiAke2FjX2N2X3Byb2dfQVIrOn0gZmFsc2U7IHRoZW4gOgot
QEAgLTY2MDksNyArNjg2Myw3IEBAIGRvCitAQCAtNjYxNSw3ICs2ODY5LDcgQEAgZG8KICAgIHRl
c3QgLXogIiRhc19kaXIiICZhbXA7JmFtcDsgYXNfZGlyPS4KICAgICAgZm9yIGFjX2V4ZWNfZXh0
IGluICcnICRhY19leGVjdXRhYmxlX2V4dGVuc2lvbnM7IGRvCiAgICBpZiBhc19mbl9leGVjdXRh
YmxlX3AgIiRhc19kaXIvJGFjX3dvcmQkYWNfZXhlY19leHQiOyB0aGVuCkBAIC0yMzIyLDcgKzIz
MjMsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgICAgICRhc19l
Y2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGZvdW5kICRhc19kaXIvJGFjX3dvcmQk
YWNfZXhlY19leHQiICZndDsmYW1wOzUKICAgICAgYnJlYWsgMgogICAgZmkKLUBAIC02NjI5LDEx
ICs2ODgzLDE1IEBAICRhc19lY2hvICJubyIgJmd0OyZhbXA7NjsgfQorQEAgLTY2MzUsMTEgKzY4
ODksMTUgQEAgJGFzX2VjaG8gIm5vIiAmZ3Q7JmFtcDs2OyB9CiAgZmkKICAKICAKQEAgLTIzNDEs
NyArMjM0Miw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICB7ICRh
c19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGNoZWNraW5nIGZvciAkYWNfd29y
ZCIgJmd0OyZhbXA7NQogICRhc19lY2hvX24gImNoZWNraW5nIGZvciAkYWNfd29yZC4uLiAiICZn
dDsmYW1wOzY7IH0KICBpZiAke2FjX2N2X3Byb2dfYWNfY3RfQVIrOn0gZmFsc2U7IHRoZW4gOgot
QEAgLTY2NDksNyArNjkwNyw3IEBAIGRvCitAQCAtNjY1NSw3ICs2OTEzLDcgQEAgZG8KICAgIHRl
c3QgLXogIiRhc19kaXIiICZhbXA7JmFtcDsgYXNfZGlyPS4KICAgICAgZm9yIGFjX2V4ZWNfZXh0
IGluICcnICRhY19leGVjdXRhYmxlX2V4dGVuc2lvbnM7IGRvCiAgICBpZiBhc19mbl9leGVjdXRh
YmxlX3AgIiRhc19kaXIvJGFjX3dvcmQkYWNfZXhlY19leHQiOyB0aGVuCkBAIC0yMzUwLDcgKzIz
NTEsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgICAgICRhc19l
Y2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGZvdW5kICRhc19kaXIvJGFjX3dvcmQk
YWNfZXhlY19leHQiICZndDsmYW1wOzUKICAgICAgYnJlYWsgMgogICAgZmkKLUBAIC02NjY4LDYg
KzY5MjYsMTAgQEAgZWxzZQorQEAgLTY2NzQsNiArNjkzMiwxMCBAQCBlbHNlCiAgJGFzX2VjaG8g
Im5vIiAmZ3Q7JmFtcDs2OyB9CiAgZmkKICAKQEAgLTIzNjEsNyArMjM2Miw3IEBAIGluZGV4IGE4
ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgIGlmIHRlc3QgIngkYWNfY3RfQVIiID0g
eDsgdGhlbgogICAgICBBUj0iZmFsc2UiCiAgICBlbHNlCi1AQCAtNjY3OSwxMiArNjk0MSwxMCBA
QCBhY190b29sX3dhcm5lZD15ZXMgOzsKK0BAIC02Njg1LDEyICs2OTQ3LDEwIEBAIGFjX3Rvb2xf
d2FybmVkPXllcyA7OwogIGVzYWMKICAgICAgQVI9JGFjX2N0X0FSCiAgICBmaQpAQCAtMjM3Niw3
ICsyMzc3LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIAogIAog
IAotQEAgLTY2OTYsNiArNjk1Niw2NCBAQCB0ZXN0IC16ICIkQVJfRkxBR1MiICZhbXA7JmFtcDsg
QVJfRkxBR1M9Y3J1CitAQCAtNjcwMiw2ICs2OTYyLDY0IEBAIHRlc3QgLXogIiRBUl9GTEFHUyIg
JmFtcDsmYW1wOyBBUl9GTEFHUz1jcnUKICAKICAKICAKQEAgLTI0NDEsNyArMjQ0Miw3IEBAIGlu
ZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICBpZiB0ZXN0IC1uICIkYWNfdG9v
bF9wcmVmaXgiOyB0aGVuCiAgICAjIEV4dHJhY3QgdGhlIGZpcnN0IHdvcmQgb2YgIiR7YWNfdG9v
bF9wcmVmaXh9c3RyaXAiLCBzbyBpdCBjYW4gYmUgYSBwcm9ncmFtIG5hbWUgd2l0aCBhcmdzLgog
IHNldCBkdW1teSAke2FjX3Rvb2xfcHJlZml4fXN0cmlwOyBhY193b3JkPSQyCi1AQCAtNzAzMCw4
ICs3MzQ4LDggQEAgZXNhYworQEAgLTcwMzYsOCArNzM1NCw4IEBAIGVzYWMKICBsdF9jdl9zeXNf
Z2xvYmFsX3N5bWJvbF90b19jZGVjbD0ic2VkIC1uIC1lICdzL15UIC4qIFwoLipcKSQvZXh0ZXJu
IGludCBcMSgpOy9wJyAtZSAncy9eJHN5bWNvZGUqIC4qIFwoLipcKSQvZXh0ZXJuIGNoYXIgXDE7
L3AnIgogIAogICMgVHJhbnNmb3JtIGFuIGV4dHJhY3RlZCBzeW1ib2wgbGluZSBpbnRvIHN5bWJv
bCBuYW1lIGFuZCBzeW1ib2wgYWRkcmVzcwpAQCAtMjQ1Miw3ICsyNDUzLDcgQEAgaW5kZXggYThk
ZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIAogICMgSGFuZGxlIENSTEYgaW4gbWluZ3cg
dG9vbCBjaGFpbgogIG9wdF9jcj0KLUBAIC03MDY3LDYgKzczODUsNyBAQCBmb3IgYWNfc3ltcHJm
eCBpbiAiIiAiXyI7IGRvCitAQCAtNzA3Myw2ICs3MzkxLDcgQEAgZm9yIGFjX3N5bXByZnggaW4g
IiIgIl8iOyBkbwogICAgZWxzZQogICAgICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlPSJz
ZWQgLW4gLWUgJ3MvXi4qWwkgXVwoJHN5bWNvZGUkc3ltY29kZSpcKVsJIF1bCSBdKiRhY19zeW1w
cmZ4JHN5bXBhdCRvcHRfY3IkLyRzeW14ZnJtL3AnIgogICAgZmkKQEAgLTI0NjAsNyArMjQ2MSw3
IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAKICAgICMgQ2hlY2sg
dG8gc2VlIHRoYXQgdGhlIHBpcGUgd29ya3MgY29ycmVjdGx5LgogICAgcGlwZV93b3Jrcz1ubwot
QEAgLTcxMDgsNiArNzQyNywxOCBAQCBfTFRfRU9GCitAQCAtNzExNCw2ICs3NDMzLDE4IEBAIF9M
VF9FT0YKICAgICAgICBpZiAkR1JFUCAnIG5tX3Rlc3RfdmFyJCcgIiRubGlzdCIgJmd0Oy9kZXYv
bnVsbDsgdGhlbgogIAlpZiAkR1JFUCAnIG5tX3Rlc3RfZnVuYyQnICIkbmxpc3QiICZndDsvZGV2
L251bGw7IHRoZW4KICAJICBjYXQgJmx0OyZsdDtfTFRfRU9GICZndDsgY29uZnRlc3QuJGFjX2V4
dApAQCAtMjQ3OSw3ICsyNDgwLDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEw
MDc1NQogICNpZmRlZiBfX2NwbHVzcGx1cwogIGV4dGVybiAiQyIgewogICNlbmRpZgotQEAgLTcx
MTksNyArNzQ1MCw3IEBAIF9MVF9FT0YKK0BAIC03MTI1LDcgKzc0NTYsNyBAQCBfTFRfRU9GCiAg
CSAgY2F0ICZsdDsmbHQ7X0xUX0VPRiAmZ3Q7Jmd0OyBjb25mdGVzdC4kYWNfZXh0CiAgCiAgLyog
VGhlIG1hcHBpbmcgYmV0d2VlbiBzeW1ib2wgbmFtZXMgYW5kIHN5bWJvbHMuICAqLwpAQCAtMjQ4
OCw3ICsyNDg5LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogICAg
Y29uc3QgY2hhciAqbmFtZTsKICAgIHZvaWQgICAgICAgKmFkZHJlc3M7CiAgfQotQEAgLTcxNDUs
OCArNzQ3Niw4IEBAIHN0YXRpYyBjb25zdCB2b2lkICpsdF9wcmVsb2FkZWRfc2V0dXAoKSB7CitA
QCAtNzE1MSw4ICs3NDgyLDggQEAgc3RhdGljIGNvbnN0IHZvaWQgKmx0X3ByZWxvYWRlZF9zZXR1
cCgpIHsKICBfTFRfRU9GCiAgCSAgIyBOb3cgdHJ5IGxpbmtpbmcgdGhlIHR3byBmaWxlcy4KICAJ
ICBtdiBjb25mdGVzdC4kYWNfb2JqZXh0IGNvbmZ0c3RtLiRhY19vYmpleHQKQEAgLTI0OTksNyAr
MjUwMCw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAJICBMSUJT
PSJjb25mdHN0bS4kYWNfb2JqZXh0IgogIAkgIENGTEFHUz0iJENGTEFHUyRsdF9wcm9nX2NvbXBp
bGVyX25vX2J1aWx0aW5fZmxhZyIKICAJICBpZiB7IHsgZXZhbCBlY2hvICJcIlwkYXNfbWVcIjok
e2FzX2xpbmVuby0kTElORU5PfTogXCIkYWNfbGlua1wiIjsgfSAmZ3Q7JmFtcDs1Ci1AQCAtNzE1
Niw4ICs3NDg3LDggQEAgX0xUX0VPRgorQEAgLTcxNjIsOCArNzQ5Myw4IEBAIF9MVF9FT0YKICAg
IHRlc3QgJGFjX3N0YXR1cyA9IDA7IH0gJmFtcDsmYW1wOyB0ZXN0IC1zIGNvbmZ0ZXN0JHthY19l
eGVleHR9OyB0aGVuCiAgCSAgICBwaXBlX3dvcmtzPXllcwogIAkgIGZpCkBAIC0yNTEwLDcgKzI1
MTEsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgCWVsc2UKICAJ
ICBlY2hvICJjYW5ub3QgZmluZCBubV90ZXN0X2Z1bmMgaW4gJG5saXN0IiAmZ3Q7JmFtcDs1CiAg
CWZpCi1AQCAtNzE5NCw2ICs3NTI1LDIxIEBAIGVsc2UKK0BAIC03MjAwLDYgKzc1MzEsMjEgQEAg
ZWxzZQogICRhc19lY2hvICJvayIgJmd0OyZhbXA7NjsgfQogIGZpCiAgCkBAIC0yNTMyLDcgKzI1
MzMsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgCiAgCiAgCi1A
QCAtNzIxMCw2ICs3NTU2LDQwIEBAIGZpCitAQCAtNzIxNiw2ICs3NTYyLDQwIEBAIGZpCiAgCiAg
CiAgCkBAIC0yNTczLDcgKzI1NzQsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMg
MTAwNzU1CiAgCiAgCiAgCi1AQCAtNzQyMSw2ICs3ODAxLDEyMyBAQCBlc2FjCitAQCAtNzQyNyw2
ICs3ODA3LDEyMyBAQCBlc2FjCiAgCiAgbmVlZF9sb2Nrcz0iJGVuYWJsZV9saWJ0b29sX2xvY2si
CiAgCkBAIC0yNjk3LDcgKzI2OTgsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMg
MTAwNzU1CiAgCiAgICBjYXNlICRob3N0X29zIGluCiAgICAgIHJoYXBzb2R5KiB8IGRhcndpbiop
Ci1AQCAtNzk4NCw2ICs4NDgxLDggQEAgX0xUX0VPRgorQEAgLTc5OTAsNiArODQ4Nyw4IEBAIF9M
VF9FT0YKICAgICAgICAkTFRDQyAkTFRDRkxBR1MgLWMgLW8gY29uZnRlc3QubyBjb25mdGVzdC5j
IDImZ3Q7JmFtcDs1CiAgICAgICAgZWNobyAiJEFSIGNydSBsaWJjb25mdGVzdC5hIGNvbmZ0ZXN0
Lm8iICZndDsmYW1wOzUKICAgICAgICAkQVIgY3J1IGxpYmNvbmZ0ZXN0LmEgY29uZnRlc3QubyAy
Jmd0OyZhbXA7NQpAQCAtMjcwNiw3ICsyNzA3LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2
NDk2OTUzIDEwMDc1NQogICAgICAgIGNhdCAmZ3Q7IGNvbmZ0ZXN0LmMgJmx0OyZsdDsgX0xUX0VP
RgogIGludCBtYWluKCkgeyByZXR1cm4gMDt9CiAgX0xUX0VPRgotQEAgLTgxNzksNyArODY3OCw4
IEBAIGZpCitAQCAtODE4NSw3ICs4Njg0LDggQEAgZmkKICBMSUJUT09MX0RFUFM9IiRsdG1haW48
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86I0Fsd2F5c3VzZW91
cm93bmxpYnRvb2wuQEAtMjcxNiw3KzI3MTcsN0BAaW5kZXhhOGRmZDRiZDY4Yy4uODIzMTY0OTY5
NTMxMDA3NTUtQEAtODI2OCw3Kzg3NjgsN0BAYWl4MyopK0BALTgyNzQsNys4Nzc0LDdAQGFpeDMq
KWVzYWMjR2xvYmFsdmFyaWFibGVzOkBALTI3MjUsNysyNzI2LDdAQGluZGV4YThkZmQ0YmQ2OGMu
LjgyMzE2NDk2OTUzMTAwNzU1Y2FuX2J1aWxkX3NoYXJlZD15ZXMjQWxsa25vd25saW5rZXJzcmVx
dWlyZWFgLmEnYXJjaGl2ZWZvcnN0YXRpY2xpbmtpbmcoZXhjZXB0TVNWQywtQEAtODU2Niw4Kzkw
NjYsNkBAZmkrQEAtODU3Miw4KzkwNzIsNkBAZmlsdF9wcm9nX2NvbXBpbGVyX3BpYz1sdF9wcm9n
X2NvbXBpbGVyX3N0YXRpYz1AQC0yNzM0LDcrMjczNSw3QEBpbmRleGE4ZGZkNGJkNjhjLi44MjMx
NjQ5Njk1MzEwMDc1NWlmdGVzdCI+IgogIAogICMgQWx3YXlzIHVzZSBvdXIgb3duIGxpYnRvb2wu
CkBAIC0yNzE2LDcgKzI3MTcsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAw
NzU1CiAgCiAgCiAgCi1AQCAtODI2OCw3ICs4NzY4LDcgQEAgYWl4MyopCitAQCAtODI3NCw3ICs4
Nzc0LDcgQEAgYWl4MyopCiAgZXNhYwogIAogICMgR2xvYmFsIHZhcmlhYmxlczoKQEAgLTI3MjUs
NyArMjcyNiw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICBjYW5f
YnVpbGRfc2hhcmVkPXllcwogIAogICMgQWxsIGtub3duIGxpbmtlcnMgcmVxdWlyZSBhIGAuYScg
YXJjaGl2ZSBmb3Igc3RhdGljIGxpbmtpbmcgKGV4Y2VwdCBNU1ZDLAotQEAgLTg1NjYsOCArOTA2
Niw2IEBAIGZpCitAQCAtODU3Miw4ICs5MDcyLDYgQEAgZmkKICBsdF9wcm9nX2NvbXBpbGVyX3Bp
Yz0KICBsdF9wcm9nX2NvbXBpbGVyX3N0YXRpYz0KICAKQEAgLTI3MzQsNyArMjczNSw3IEBAIGlu
ZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAKICAgIGlmIHRlc3QgIjwvYT4k
R0NDIiA9IHllczsgdGhlbgogICAgICBsdF9wcm9nX2NvbXBpbGVyX3dsPSctV2wsJwotQEAgLTg3
MzMsNiArOTIzMSwxMiBAQCAkYXNfZWNob19uICJjaGVja2luZyBmb3IgJGNvbXBpbGVyIG9wdGlv
biB0byBwcm9kdWNlIFBJQy4uLiAiICZndDsmYW1wOzY7IH0KK0BAIC04NzM5LDYgKzkyMzcsMTIg
QEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRjb21waWxlciBvcHRpb24gdG8gcHJvZHVjZSBQ
SUMuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAgCWx0X3Byb2dfY29tcGlsZXJfcGljPSctLXNoYXJlZCcK
ICAJbHRfcHJvZ19jb21waWxlcl9zdGF0aWM9Jy0tc3RhdGljJwogIAk7OwpAQCAtMjc0Nyw3ICsy
NzQ4LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogICAgICAgIHBn
Y2MqIHwgcGdmNzcqIHwgcGdmOTAqIHwgcGdmOTUqIHwgcGdmb3J0cmFuKikKICAgICAgICAgICMg
UG9ydGxhbmQgR3JvdXAgY29tcGlsZXJzICgqbm90KiB0aGUgUGVudGl1bSBnY2MgY29tcGlsZXIs
CiAgCSMgd2hpY2ggbG9va3MgdG8gYmUgYSBkZWFkIHByb2plY3QpCi1AQCAtODc5NSw3ICs5Mjk5
LDcgQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRjb21waWxlciBvcHRpb24gdG8gcHJvZHVj
ZSBQSUMuLi4gIiAmZ3Q7JmFtcDs2OyB9CitAQCAtODgwMSw3ICs5MzA1LDcgQEAgJGFzX2VjaG9f
biAiY2hlY2tpbmcgZm9yICRjb21waWxlciBvcHRpb24gdG8gcHJvZHVjZSBQSUMuLi4gIiAmZ3Q7
JmFtcDs2OyB9CiAgICAgICAgbHRfcHJvZ19jb21waWxlcl9waWM9Jy1LUElDJwogICAgICAgIGx0
X3Byb2dfY29tcGlsZXJfc3RhdGljPSctQnN0YXRpYycKICAgICAgICBjYXNlICRjY19iYXNlbmFt
ZSBpbgpAQCAtMjc1Niw3ICsyNzU3LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUz
IDEwMDc1NQogIAlsdF9wcm9nX2NvbXBpbGVyX3dsPSctUW9wdGlvbiBsZCAnOzsKICAgICAgICAq
KQogIAlsdF9wcm9nX2NvbXBpbGVyX3dsPSctV2wsJzs7Ci1AQCAtODg1MiwxMyArOTM1NiwxNyBA
QCBjYXNlICRob3N0X29zIGluCitAQCAtODg1OCwxMyArOTM2MiwxNyBAQCBjYXNlICRob3N0X29z
IGluCiAgICAgIGx0X3Byb2dfY29tcGlsZXJfcGljPSIkbHRfcHJvZ19jb21waWxlcl9waWMgLURQ
SUMiCiAgICAgIDs7CiAgZXNhYwpAQCAtMjc4MCw3ICsyNzgxLDcgQEAgaW5kZXggYThkZmQ0YmQ2
OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIAogICMKICAjIENoZWNrIHRvIG1ha2Ugc3VyZSB0aGUg
UElDIGZsYWcgYWN0dWFsbHkgd29ya3MuCi1AQCAtODkxOSw2ICs5NDI3LDExIEBAIGZpCitAQCAt
ODkyNSw2ICs5NDMzLDExIEBAIGZpCiAgCiAgCiAgCkBAIC0yNzkyLDcgKzI3OTMsNyBAQCBpbmRl
eCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgIwogICMgQ2hlY2sgdG8gbWFrZSBz
dXJlIHRoZSBzdGF0aWMgZmxhZyBhY3R1YWxseSB3b3Jrcy4KICAjCi1AQCAtOTI2OSw3ICs5Nzgy
LDggQEAgX0xUX0VPRgorQEAgLTkyNzUsNyArOTc4OCw4IEBAIF9MVF9FT0YKICAgICAgICBhbGxv
d191bmRlZmluZWRfZmxhZz11bnN1cHBvcnRlZAogICAgICAgIGFsd2F5c19leHBvcnRfc3ltYm9s
cz1ubwogICAgICAgIGVuYWJsZV9zaGFyZWRfd2l0aF9zdGF0aWNfcnVudGltZXM9eWVzCkBAIC0y
ODAyLDcgKzI4MDMsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAg
CiAgICAgICAgaWYgJExEIC0taGVscCAyJmd0OyZhbXA7MSB8ICRHUkVQICdhdXRvLWltcG9ydCcg
Jmd0OyAvZGV2L251bGw7IHRoZW4KICAgICAgICAgIGFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQg
JGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzIC1vICRvdXRwdXRfb2JqZGlyLyRzb25h
bWUgJHt3bH0tLWVuYWJsZS1hdXRvLWltYWdlLWJhc2UgLVhsaW5rZXIgLS1vdXQtaW1wbGliIC1Y
bGlua2VyICRsaWInCi1AQCAtOTM2OCwxMiArOTg4MiwxMiBAQCBfTFRfRU9GCitAQCAtOTM3NCwx
MiArOTg4OCwxMiBAQCBfTFRfRU9GCiAgCSAgd2hvbGVfYXJjaGl2ZV9mbGFnX3NwZWM9Jy0td2hv
bGUtYXJjaGl2ZSRjb252ZW5pZW5jZSAtLW5vLXdob2xlLWFyY2hpdmUnCiAgCSAgaGFyZGNvZGVf
bGliZGlyX2ZsYWdfc3BlYz0KICAJICBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjX2xkPSctcnBh
dGggJGxpYmRpcicKQEAgLTI4MTcsNyArMjgxOCw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMx
NjQ5Njk1MyAxMDA3NTUKICAJICBmaQogIAkgIDs7CiAgCWVzYWMKLUBAIC05Mzg3LDggKzk5MDEs
OCBAQCBfTFRfRU9GCitAQCAtOTM5Myw4ICs5OTA3LDggQEAgX0xUX0VPRgogIAlhcmNoaXZlX2Nt
ZHM9JyRMRCAtQnNoYXJlYWJsZSAkbGlib2JqcyAkZGVwbGlicyAkbGlua2VyX2ZsYWdzIC1vICRs
aWInCiAgCXdsYXJjPQogICAgICAgIGVsc2UKQEAgLTI4MjgsNyArMjgyOSw3IEBAIGluZGV4IGE4
ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgICAgICBmaQogICAgICAgIDs7CiAgCi1A
QCAtOTQwNiw4ICs5OTIwLDggQEAgX0xUX0VPRgorQEAgLTk0MTIsOCArOTkyNiw4IEBAIF9MVF9F
T0YKICAKICBfTFRfRU9GCiAgICAgICAgZWxpZiAkTEQgLS1oZWxwIDImZ3Q7JmFtcDsxIHwgJEdS
RVAgJzogc3VwcG9ydGVkIHRhcmdldHM6LiogZWxmJyAmZ3Q7IC9kZXYvbnVsbDsgdGhlbgpAQCAt
MjgzOSw3ICsyODQwLDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQog
ICAgICAgIGVsc2UKICAJbGRfc2hsaWJzPW5vCiAgICAgICAgZmkKLUBAIC05NDUzLDggKzk5Njcs
OCBAQCBfTFRfRU9GCitAQCAtOTQ1OSw4ICs5OTczLDggQEAgX0xUX0VPRgogIAogICAgICAqKQog
ICAgICAgIGlmICRMRCAtLWhlbHAgMiZndDsmYW1wOzEgfCAkR1JFUCAnOiBzdXBwb3J0ZWQgdGFy
Z2V0czouKiBlbGYnICZndDsgL2Rldi9udWxsOyB0aGVuCkBAIC0yODUwLDcgKzI4NTEsNyBAQCBp
bmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgICAgICAgZWxzZQogIAlsZF9z
aGxpYnM9bm8KICAgICAgICBmaQotQEAgLTk1ODQsNyArMTAwOTgsMTMgQEAgX0xUX0VPRgorQEAg
LTk1OTAsNyArMTAxMDQsMTMgQEAgX0xUX0VPRgogIAlhbGxvd191bmRlZmluZWRfZmxhZz0nLWJl
cm9rJwogICAgICAgICAgIyBEZXRlcm1pbmUgdGhlIGRlZmF1bHQgbGlicGF0aCBmcm9tIHRoZSB2
YWx1ZSBlbmNvZGVkIGluIGFuCiAgICAgICAgICAjIGVtcHR5IGV4ZWN1dGFibGUuCkBAIC0yODY1
LDcgKzI4NjYsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgLyog
ZW5kIGNvbmZkZWZzLmguICAqLwogIAogIGludAotQEAgLTk1OTcsMjIgKzEwMTE3LDI5IEBAIG1h
aW4gKCkKK0BAIC05NjAzLDIyICsxMDEyMywyOSBAQCBtYWluICgpCiAgX0FDRU9GCiAgaWYgYWNf
Zm5fY190cnlfbGluayAiJExJTkVOTyI7IHRoZW4gOgogIApAQCAtMjkwOCw3ICsyOTA5LDcgQEAg
aW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIAogICAgICAgICAgaGFyZGNv
ZGVfbGliZGlyX2ZsYWdfc3BlYz0nJHt3bH0tYmxpYnBhdGg6JGxpYmRpcjonIiRhaXhfbGlicGF0
aCIKICAgICAgICAgIGFyY2hpdmVfZXhwc3ltX2NtZHM9JyRDQyAtbyAkb3V0cHV0X29iamRpci8k
c29uYW1lICRsaWJvYmpzICRkZXBsaWJzICciXCR7d2x9JG5vX2VudHJ5X2ZsYWciJyAkY29tcGls
ZXJfZmxhZ3MgYGlmIHRlc3QgIngke2FsbG93X3VuZGVmaW5lZF9mbGFnfSIgIT0gIngiOyB0aGVu
IGZ1bmNfZWNob19hbGwgIiR7d2x9JHthbGxvd191bmRlZmluZWRfZmxhZ30iOyBlbHNlIDo7IGZp
YCAnIlwke3dsfSRleHBfc3ltX2ZsYWc6XCRleHBvcnRfc3ltYm9scyAkc2hhcmVkX2ZsYWciCi1A
QCAtOTYyNCw3ICsxMDE1MSwxMyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFp
eF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC05NjMwLDcgKzEwMTU3LDEzIEBAIGlm
IHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIi
OyBmaQogIAllbHNlCiAgCSAjIERldGVybWluZSB0aGUgZGVmYXVsdCBsaWJwYXRoIGZyb20gdGhl
IHZhbHVlIGVuY29kZWQgaW4gYW4KICAJICMgZW1wdHkgZXhlY3V0YWJsZS4KQEAgLTI5MjMsNyAr
MjkyNCw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAvKiBlbmQg
Y29uZmRlZnMuaC4gICovCiAgCiAgaW50Ci1AQCAtOTYzNywyMiArMTAxNzAsMjkgQEAgbWFpbiAo
KQorQEAgLTk2NDMsMjIgKzEwMTc2LDI5IEBAIG1haW4gKCkKICBfQUNFT0YKICBpZiBhY19mbl9j
X3RyeV9saW5rICIkTElORU5PIjsgdGhlbiA6CiAgCkBAIC0yOTY2LDcgKzI5NjcsNyBAQCBpbmRl
eCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgCiAgCSBoYXJkY29kZV9saWJkaXJf
ZmxhZ19zcGVjPScke3dsfS1ibGlicGF0aDokbGliZGlyOiciJGFpeF9saWJwYXRoIgogIAkgICMg
V2FybmluZyAtIHdpdGhvdXQgdXNpbmcgdGhlIG90aGVyIHJ1biB0aW1lIGxvYWRpbmcgZmxhZ3Ms
Ci1AQCAtOTY5NywyMCArMTAyMzcsNjMgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhl
biBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCitAQCAtOTcwMywyMCArMTAyNDMsNjMg
QEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6
L2xpYiI7IGZpCiAgICAgICAgIyBNaWNyb3NvZnQgVmlzdWFsIEMrKy4KICAgICAgICAjIGhhcmRj
b2RlX2xpYmRpcl9mbGFnX3NwZWMgaXMgYWN0dWFsbHkgbWVhbmluZ2xlc3MsIGFzIHRoZXJlIGlz
CiAgICAgICAgIyBubyBzZWFyY2ggcGF0aCBmb3IgRExMcy4KQEAgLTMwNDQsNyArMzA0NSw3IEBA
IGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgICAgICA7OwogIAogICAg
ICBkYXJ3aW4qIHwgcmhhcHNvZHkqKQotQEAgLTk3NzEsNyArMTAzNTQsNyBAQCBpZiB0ZXN0IC16
ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BA
IC05Nzc3LDcgKzEwMzYwLDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhf
bGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCiAgCiAgICAgICMgRnJlZUJTRCAzIGFuZCBncmVh
dGVyIHVzZXMgZ2NjIC1zaGFyZWQgdG8gZG8gc2hhcmVkIGxpYnJhcmllcy4KICAgICAgZnJlZWJz
ZCogfCBkcmFnb25mbHkqKQpAQCAtMzA1Myw3ICszMDU0LDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMu
LjgyMzE2NDk2OTUzIDEwMDc1NQogICAgICAgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9Jy1S
JGxpYmRpcicKICAgICAgICBoYXJkY29kZV9kaXJlY3Q9eWVzCiAgICAgICAgaGFyZGNvZGVfc2hs
aWJwYXRoX3Zhcj1ubwotQEAgLTk3NzksNyArMTAzNjIsNyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xp
YnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC05Nzg1LDcg
KzEwMzY4LDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0i
L3Vzci9saWI6L2xpYiI7IGZpCiAgCiAgICAgIGhwdXg5KikKICAgICAgICBpZiB0ZXN0ICIkR0ND
IiA9IHllczsgdGhlbgpAQCAtMzA2Miw3ICszMDYzLDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgy
MzE2NDk2OTUzIDEwMDc1NQogICAgICAgIGVsc2UKICAJYXJjaGl2ZV9jbWRzPSckUk0gJG91dHB1
dF9vYmpkaXIvJHNvbmFtZX4kTEQgLWIgK2IgJGluc3RhbGxfbGliZGlyIC1vICRvdXRwdXRfb2Jq
ZGlyLyRzb25hbWUgJGxpYm9ianMgJGRlcGxpYnMgJGxpbmtlcl9mbGFnc350ZXN0ICRvdXRwdXRf
b2JqZGlyLyRzb25hbWUgPSAkbGliIHx8IG12ICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxpYicK
ICAgICAgICBmaQotQEAgLTk3OTUsNyArMTAzNzgsNyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBh
dGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC05ODAxLDcgKzEw
Mzg0LDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vz
ci9saWI6L2xpYiI7IGZpCiAgCiAgICAgIGhwdXgxMCopCiAgICAgICAgaWYgdGVzdCAiJEdDQyIg
PSB5ZXMgJmFtcDsmYW1wOyB0ZXN0ICIkd2l0aF9nbnVfbGQiID0gbm87IHRoZW4KQEAgLTMwNzEs
NyArMzA3Miw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgICAg
ICBlbHNlCiAgCWFyY2hpdmVfY21kcz0nJExEIC1iICtoICRzb25hbWUgK2IgJGluc3RhbGxfbGli
ZGlyIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGxpbmtlcl9mbGFncycKICAgICAgICBmaQot
QEAgLTk4MTksMTAgKzEwNDAyLDEwIEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4g
YWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTk4MjUsMTAgKzEwNDA4LDEwIEBA
IGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9s
aWIiOyBmaQogIAkgIGFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJHt3bH0raCAke3dsfSRzb25h
bWUgLW8gJGxpYiAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MnCiAgCSAgOzsKICAJ
aWE2NCopCkBAIC0zMDg0LDcgKzMwODUsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5
NTMgMTAwNzU1CiAgCSAgOzsKICAJZXNhYwogICAgICAgIGVsc2UKLUBAIC05OTAxLDIzICsxMDQ4
NCwzNiBAQCBmaQorQEAgLTk5MDcsMjMgKzEwNDkwLDM2IEBAIGZpCiAgCiAgICAgIGlyaXg1KiB8
IGlyaXg2KiB8IG5vbnN0b3B1eCopCiAgICAgICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4K
QEAgLTMxMjksNyArMzEzMCw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3
NTUKICAgICAgICBlbHNlCiAgCWFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJGxpYm9ianMgJGRl
cGxpYnMgJGNvbXBpbGVyX2ZsYWdzIC1zb25hbWUgJHNvbmFtZSBgdGVzdCAtbiAiJHZlcnN0cmlu
ZyIgJmFtcDsmYW1wOyBmdW5jX2VjaG9fYWxsICItc2V0X3ZlcnNpb24gJHZlcnN0cmluZyJgIC11
cGRhdGVfcmVnaXN0cnkgJHtvdXRwdXRfb2JqZGlyfS9zb19sb2NhdGlvbnMgLW8gJGxpYicKICAJ
YXJjaGl2ZV9leHBzeW1fY21kcz0nJENDIC1zaGFyZWQgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBp
bGVyX2ZsYWdzIC1zb25hbWUgJHNvbmFtZSBgdGVzdCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1w
OyBmdW5jX2VjaG9fYWxsICItc2V0X3ZlcnNpb24gJHZlcnN0cmluZyJgIC11cGRhdGVfcmVnaXN0
cnkgJHtvdXRwdXRfb2JqZGlyfS9zb19sb2NhdGlvbnMgLWV4cG9ydHNfZmlsZSAkZXhwb3J0X3N5
bWJvbHMgLW8gJGxpYicKLUBAIC0xMDAwMiw3ICsxMDU5OCw3IEBAIHJtIC1mIGNvcmUgY29uZnRl
c3QuZXJyIGNvbmZ0ZXN0LiRhY19vYmpleHQgXAorQEAgLTEwMDA4LDcgKzEwNjA0LDcgQEAgcm0g
LWYgY29yZSBjb25mdGVzdC5lcnIgY29uZnRlc3QuJGFjX29iamV4dCBcCiAgICAgIG9zZjQqIHwg
b3NmNSopCSMgYXMgb3NmMyogd2l0aCB0aGUgYWRkaXRpb24gb2YgLW1zeW0gZmxhZwogICAgICAg
IGlmIHRlc3QgIiRHQ0MiID0geWVzOyB0aGVuCiAgCWFsbG93X3VuZGVmaW5lZF9mbGFnPScgJHt3
bH0tZXhwZWN0X3VucmVzb2x2ZWQgJHt3bH1cKicKQEAgLTMxMzgsNyArMzEzOSw3IEBAIGluZGV4
IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAJaGFyZGNvZGVfbGliZGlyX2ZsYWdf
c3BlYz0nJHt3bH0tcnBhdGggJHt3bH0kbGliZGlyJwogICAgICAgIGVsc2UKICAJYWxsb3dfdW5k
ZWZpbmVkX2ZsYWc9JyAtZXhwZWN0X3VucmVzb2x2ZWQgXConCi1AQCAtMTAwMjEsOSArMTA2MTcs
OSBAQCBybSAtZiBjb3JlIGNvbmZ0ZXN0LmVyciBjb25mdGVzdC4kYWNfb2JqZXh0IFwKK0BAIC0x
MDAyNyw5ICsxMDYyMyw5IEBAIHJtIC1mIGNvcmUgY29uZnRlc3QuZXJyIGNvbmZ0ZXN0LiRhY19v
YmpleHQgXAogICAgICAgIG5vX3VuZGVmaW5lZF9mbGFnPScgLXogZGVmcycKICAgICAgICBpZiB0
ZXN0ICIkR0NDIiA9IHllczsgdGhlbgogIAl3bGFyYz0nJHt3bH0nCkBAIC0zMTUwLDcgKzMxNTEs
NyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgICAgICAgZWxzZQog
IAljYXNlIGAkQ0MgLVYgMiZndDsmYW1wOzFgIGluCiAgCSoiQ29tcGlsZXJzIDUuMCIqKQotQEAg
LTEwNTk5LDggKzExMTk1LDkgQEAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2MqKQor
QEAgLTEwNjA1LDggKzExMjAxLDkgQEAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2Mq
KQogICAgbmVlZF92ZXJzaW9uPW5vCiAgICBuZWVkX2xpYl9wcmVmaXg9bm8KICAKQEAgLTMxNjIs
NyArMzE2Myw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgICAg
bGlicmFyeV9uYW1lc19zcGVjPSckbGlibmFtZS5kbGwuYScKICAgICAgIyBETEwgaXMgaW5zdGFs
bGVkIHRvICQobGliZGlyKS8uLi9iaW4gYnkgcG9zdGluc3RhbGxfY21kcwogICAgICBwb3N0aW5z
dGFsbF9jbWRzPSdiYXNlX2ZpbGU9YGJhc2VuYW1lIFwke2ZpbGV9YH4KLUBAIC0xMDYzMywxMyAr
MTEyMzAsNzEgQEAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2MqKQorQEAgLTEwNjM5
LDEzICsxMTIzNiw3MSBAQCBjeWd3aW4qIHwgbWluZ3cqIHwgcHczMiogfCBjZWdjYyopCiAgICAg
ICAgbGlicmFyeV9uYW1lc19zcGVjPSdgZWNobyAke2xpYm5hbWV9IHwgc2VkIC1lICdzL15saWIv
cHcvJ2BgZWNobyAke3JlbGVhc2V9IHwgJFNFRCAtZSAncy9bLl0vLS9nJ2Ake3ZlcnN1ZmZpeH0k
e3NoYXJlZF9leHR9JwogICAgICAgIDs7CiAgICAgIGVzYWMKQEAgLTMyMzUsNyArMzIzNiw3IEBA
IGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAgICMgRklYTUU6IGZpcnN0
IHdlIHNob3VsZCBzZWFyY2ggLiBhbmQgdGhlIGRpcmVjdG9yeSB0aGUgZXhlY3V0YWJsZSBpcyBp
bgogICAgc2hsaWJwYXRoX3Zhcj1QQVRICiAgICA7OwotQEAgLTEwNzMxLDcgKzExMzg2LDcgQEAg
aGFpa3UqKQorQEAgLTEwNzM3LDcgKzExMzkyLDcgQEAgaGFpa3UqKQogICAgc29uYW1lX3NwZWM9
JyR7bGlibmFtZX0ke3JlbGVhc2V9JHtzaGFyZWRfZXh0fSRtYWpvcicKICAgIHNobGlicGF0aF92
YXI9TElCUkFSWV9QQVRICiAgICBzaGxpYnBhdGhfb3ZlcnJpZGVzX3J1bnBhdGg9eWVzCkBAIC0z
MjQ0LDE2ICszMjQ1LDE2IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUK
ICAgIGhhcmRjb2RlX2ludG9fbGlicz15ZXMKICAgIDs7CiAgCi1AQCAtMTE1MjcsNyArMTIxODIs
NyBAQCBlbHNlCitAQCAtMTE1MzMsNyArMTIxODgsNyBAQCBlbHNlCiAgICBsdF9kbHVua25vd249
MDsgbHRfZGxub191c2NvcmU9MTsgbHRfZGxuZWVkX3VzY29yZT0yCiAgICBsdF9zdGF0dXM9JGx0
X2RsdW5rbm93bgogICAgY2F0ICZndDsgY29uZnRlc3QuJGFjX2V4dCAmbHQ7Jmx0O19MVF9FT0YK
LS0jbGluZSAxMTUzMCAiY29uZmlndXJlIgorLSNsaW5lIDExNTM2ICJjb25maWd1cmUiCiArI2xp
bmUgJExJTkVOTyAiY29uZmlndXJlIgogICNpbmNsdWRlICJjb25mZGVmcy5oIgogIAogICNpZiBI
QVZFX0RMRkNOX0gKLUBAIC0xMTU3MSwxMCArMTIyMjYsMTAgQEAgZWxzZQorQEAgLTExNTc3LDEw
ICsxMjIzMiwxMCBAQCBlbHNlCiAgLyogV2hlbiAtZnZpc2JpbGl0eT1oaWRkZW4gaXMgdXNlZCwg
YXNzdW1lIHRoZSBjb2RlIGhhcyBiZWVuIGFubm90YXRlZAogICAgIGNvcnJlc3BvbmRpbmdseSBm
b3IgdGhlIHN5bWJvbHMgbmVlZGVkLiAgKi8KICAjaWYgZGVmaW5lZChfX0dOVUNfXykgJmFtcDsm
YW1wOyAoKChfX0dOVUNfXyA9PSAzKSAmYW1wOyZhbXA7IChfX0dOVUNfTUlOT1JfXyAmZ3Q7PSAz
KSkgfHwgKF9fR05VQ19fICZndDsgMykpCkBAIC0zMjY2LDE2ICszMjY3LDE2IEBAIGluZGV4IGE4
ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICBpbnQgbWFpbiAoKQogIHsKICAgIHZvaWQg
KnNlbGYgPSBkbG9wZW4gKDAsIExUX0RMR0xPQkFMfExUX0RMTEFaWV9PUl9OT1cpOwotQEAgLTEx
NjMzLDcgKzEyMjg4LDcgQEAgZWxzZQorQEAgLTExNjM5LDcgKzEyMjk0LDcgQEAgZWxzZQogICAg
bHRfZGx1bmtub3duPTA7IGx0X2Rsbm9fdXNjb3JlPTE7IGx0X2RsbmVlZF91c2NvcmU9MgogICAg
bHRfc3RhdHVzPSRsdF9kbHVua25vd24KICAgIGNhdCAmZ3Q7IGNvbmZ0ZXN0LiRhY19leHQgJmx0
OyZsdDtfTFRfRU9GCi0tI2xpbmUgMTE2MzYgImNvbmZpZ3VyZSIKKy0jbGluZSAxMTY0MiAiY29u
ZmlndXJlIgogKyNsaW5lICRMSU5FTk8gImNvbmZpZ3VyZSIKICAjaW5jbHVkZSAiY29uZmRlZnMu
aCIKICAKICAjaWYgSEFWRV9ETEZDTl9ICi1AQCAtMTE2NzcsMTAgKzEyMzMyLDEwIEBAIGVsc2UK
K0BAIC0xMTY4MywxMCArMTIzMzgsMTAgQEAgZWxzZQogIC8qIFdoZW4gLWZ2aXNiaWxpdHk9aGlk
ZGVuIGlzIHVzZWQsIGFzc3VtZSB0aGUgY29kZSBoYXMgYmVlbiBhbm5vdGF0ZWQKICAgICBjb3Jy
ZXNwb25kaW5nbHkgZm9yIHRoZSBzeW1ib2xzIG5lZWRlZC4gICovCiAgI2lmIGRlZmluZWQoX19H
TlVDX18pICZhbXA7JmFtcDsgKCgoX19HTlVDX18gPT0gMykgJmFtcDsmYW1wOyAoX19HTlVDX01J
Tk9SX18gJmd0Oz0gMykpIHx8IChfX0dOVUNfXyAmZ3Q7IDMpKQpAQCAtMzI4OCw3ICszMjg5LDcg
QEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIGludCBtYWluICgpCiAg
ewogICAgdm9pZCAqc2VsZiA9IGRsb3BlbiAoMCwgTFRfRExHTE9CQUx8TFRfRExMQVpZX09SX05P
Vyk7Ci1AQCAtMTYwMjQsMTMgKzE2Njc5LDIwIEBAIGV4ZWV4dD0nYCRFQ0hPICIkZXhlZXh0IiB8
ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKK0BAIC0xNjA3NiwxMyArMTY3MzEs
MjAgQEAgZXhlZXh0PSdgJEVDSE8gIiRleGVleHQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdCJgJwogIGx0X3Vuc2V0PSdgJEVDSE8gIiRsdF91bnNldCIgfCAkU0VEICIkZGVsYXlf
c2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgbHRfU1AyTkw9J2AkRUNITyAiJGx0X1NQMk5MIiB8ICRT
RUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9OTDJTUD0nYCRFQ0hPICIkbHRf
TkwyU1AiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpgJ0BALTMzMDksNyszMzEwLDdAQGluZGV4YThk
ZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzMTAwNzU1U1RSSVA9J2AkRUNITyI+ImAnCkBAIC0zMzA5LDcg
KzMzMTAsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgU1RSSVA9
J2AkRUNITyAiPC9hPiRTVFJJUCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAn
CiAgUkFOTElCPSdgJEVDSE8gIiRSQU5MSUIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9z
dWJzdCJgJwogIG9sZF9wb3N0aW5zdGFsbF9jbWRzPSdgJEVDSE8gIiRvbGRfcG9zdGluc3RhbGxf
Y21kcyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCi1AQCAtMTYwNDUsMTQg
KzE2NzA3LDE3IEBAIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGU9J2AkRUNITyAiJGx0X2N2
X3N5c19nbG9iYWxfc3ltYm9sX3BpcGUiIHwgJFNFRCAiJGRlCitAQCAtMTYwOTcsMTQgKzE2NzU5
LDE3IEBAIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGU9J2AkRUNITyAiJGx0X2N2X3N5c19n
bG9iYWxfc3ltYm9sX3BpcGUiIHwgJFNFRCAiJGRlCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xf
dG9fY2RlY2w9J2AkRUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsIiB8ICRT
RUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJv
bF90b19jX25hbWVfYWRkcmVzcz0nYCRFQ0hPICIkbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9f
Y19uYW1lX2FkZHJlc3MiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGx0
X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXg9J2AkRUNI
TyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXgi
IHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpgJ0BALTMzMjgsNyszMzI5LDdAQGluZGV4YThkZmQ0YmQ2
OGMuLjgyMzE2NDk2OTUzMTAwNzU1RFNZTVVUSUw9J2AkRUNITyI+ImAnCkBAIC0zMzI4LDcgKzMz
MjksNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgRFNZTVVUSUw9
J2AkRUNITyAiPC9hPiREU1lNVVRJTCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0
ImAnCiAgTk1FRElUPSdgJEVDSE8gIiROTUVESVQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdCJgJwogIExJUE89J2AkRUNITyAiJExJUE8iIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9x
dW90ZV9zdWJzdCJgJwotQEAgLTE2MDg1LDEyICsxNjc1MCwxMiBAQCBoYXJkY29kZV9zaGxpYnBh
dGhfdmFyPSdgJEVDSE8gIiRoYXJkY29kZV9zaGxpYnBhdGhfdmFyIiB8ICRTRUQgIiRkZWxheV9z
aW5nbGVfcQorQEAgLTE2MTM3LDEyICsxNjgwMiwxMiBAQCBoYXJkY29kZV9zaGxpYnBhdGhfdmFy
PSdgJEVDSE8gIiRoYXJkY29kZV9zaGxpYnBhdGhfdmFyIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVf
cQogIGhhcmRjb2RlX2F1dG9tYXRpYz0nYCRFQ0hPICIkaGFyZGNvZGVfYXV0b21hdGljIiB8ICRT
RUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBpbmhlcml0X3JwYXRoPSdgJEVDSE8g
IiRpbmhlcml0X3JwYXRoIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBs
aW5rX2FsbF9kZXBsaWJzPSdgJEVDSE8gIiRsaW5rX2FsbF9kZXBsaWJzIiB8ICRTRUQgIiRkZWxh
eV9zaW5nbGVfcXVvdGVfc3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86YCdAQC0zMzQyLDcrMzM0Myw3QEBpbmRleGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1
MzEwMDc1NWZpbGVfbGlzdF9zcGVjPSdgJEVDSE8iPiJgJwpAQCAtMzM0Miw3ICszMzQzLDcgQEAg
aW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogIGZpbGVfbGlzdF9zcGVjPSdg
JEVDSE8gIjwvYT4kZmlsZV9saXN0X3NwZWMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9z
dWJzdCJgJwogIHZhcmlhYmxlc19zYXZlZF9mb3JfcmVsaW5rPSdgJEVDSE8gIiR2YXJpYWJsZXNf
c2F2ZWRfZm9yX3JlbGluayIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAg
bmVlZF9saWJfcHJlZml4PSdgJEVDSE8gIiRuZWVkX2xpYl9wcmVmaXgiIHwgJFNFRCAiJGRlbGF5
X3NpbmdsZV9xdW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpgJy1AQC0xNjE0NSw4KzE2ODEwLDEzQEByZWxvYWRfZmxhZ1wrQEAtMTYxOTcsOCsx
Njg2MiwxM0BAcmVsb2FkX2ZsYWdcT0JKRFVNUFxkZXBsaWJzX2NoZWNrX21ldGhvZFxmaWxlX21h
Z2ljX2NtZFxAQC0zMzU2LDcrMzM1Nyw3QEBpbmRleGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MzEw
MDc1NVNUUklQXFJBTkxJQlxDQ1wtQEAtMTYxNTYsMTIrMTY4MjYsMTRAQGx0X2N2X3N5c19nbG9i
YWxfc3ltYm9sX3BpcGVcK0BALTE2MjA4LDEyKzE2ODc4LDE0QEBsdF9jdl9zeXNfZ2xvYmFsX3N5
bWJvbF9waXBlXGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsXGx0X2N2X3N5c19nbG9i
YWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzXGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2Nf
bmFtZV9hZGRyZXNzX2xpYl9wcmVmaXhcQEAtMzM3Miw3KzMzNzMsN0BAaW5kZXhhOGRmZDRiZDY4
Yy4uODIzMTY0OTY5NTMxMDA3NTVEU1lNVVRJTFxOTUVESVRcTElQT1wtQEAtMTYxNzcsNysxNjg0
OSw2QEBub191bmRlZmluZWRfZmxhZ1wrQEAtMTYyMjksNysxNjkwMSw2QEBub191bmRlZmluZWRf
ZmxhZ1xoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjXGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWNf
bGRcaGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvclxAQC0zMzgwLDcrMzM4MSw3QEBpbmRleGE4ZGZk
NGJkNjhjLi44MjMxNjQ5Njk1MzEwMDc1NWV4Y2x1ZGVfZXhwc3ltc1xpbmNsdWRlX2V4cHN5bXNc
ZmlsZV9saXN0X3NwZWNcLUBALTE2MjEzLDYrMTY4ODQsN0BAbW9kdWxlX2NtZHNcK0BALTE2MjY1
LDYrMTY5MzYsN0BAbW9kdWxlX2NtZHNcbW9kdWxlX2V4cHN5bV9jbWRzXGV4cG9ydF9zeW1ib2xz
X2NtZHNccHJlbGlua19jbWRzXEBALTMzODgsNyszMzg5LDdAQGluZGV4YThkZmQ0YmQ2OGMuLjgy
MzE2NDk2OTUzMTAwNzU1cG9zdGluc3RhbGxfY21kc1xwb3N0dW5pbnN0YWxsX2NtZHNcZmluaXNo
X2NtZHNcLUBALTE2OTc5LDcrMTc2NTEsOEBAJGFzX2VjaG9YIj4iYCcKLUBAIC0xNjE0NSw4ICsx
NjgxMCwxMyBAQCByZWxvYWRfZmxhZyBcCitAQCAtMTYxOTcsOCArMTY4NjIsMTMgQEAgcmVsb2Fk
X2ZsYWcgXAogIE9CSkRVTVAgXAogIGRlcGxpYnNfY2hlY2tfbWV0aG9kIFwKICBmaWxlX21hZ2lj
X2NtZCBcCkBAIC0zMzU2LDcgKzMzNTcsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5
NTMgMTAwNzU1CiAgU1RSSVAgXAogIFJBTkxJQiBcCiAgQ0MgXAotQEAgLTE2MTU2LDEyICsxNjgy
NiwxNCBAQCBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlIFwKK0BAIC0xNjIwOCwxMiArMTY4
NzgsMTQgQEAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZSBcCiAgbHRfY3Zfc3lzX2dsb2Jh
bF9zeW1ib2xfdG9fY2RlY2wgXAogIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9h
ZGRyZXNzIFwKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJf
cHJlZml4IFwKQEAgLTMzNzIsNyArMzM3Myw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5
Njk1MyAxMDA3NTUKICBEU1lNVVRJTCBcCiAgTk1FRElUIFwKICBMSVBPIFwKLUBAIC0xNjE3Nyw3
ICsxNjg0OSw2IEBAIG5vX3VuZGVmaW5lZF9mbGFnIFwKK0BAIC0xNjIyOSw3ICsxNjkwMSw2IEBA
IG5vX3VuZGVmaW5lZF9mbGFnIFwKICBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjIFwKICBoYXJk
Y29kZV9saWJkaXJfZmxhZ19zcGVjX2xkIFwKICBoYXJkY29kZV9saWJkaXJfc2VwYXJhdG9yIFwK
QEAgLTMzODAsNyArMzM4MSw3IEBAIGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3
NTUKICBleGNsdWRlX2V4cHN5bXMgXAogIGluY2x1ZGVfZXhwc3ltcyBcCiAgZmlsZV9saXN0X3Nw
ZWMgXAotQEAgLTE2MjEzLDYgKzE2ODg0LDcgQEAgbW9kdWxlX2NtZHMgXAorQEAgLTE2MjY1LDYg
KzE2OTM2LDcgQEAgbW9kdWxlX2NtZHMgXAogIG1vZHVsZV9leHBzeW1fY21kcyBcCiAgZXhwb3J0
X3N5bWJvbHNfY21kcyBcCiAgcHJlbGlua19jbWRzIFwKQEAgLTMzODgsNyArMzM4OSw3IEBAIGlu
ZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICBwb3N0aW5zdGFsbF9jbWRzIFwK
ICBwb3N0dW5pbnN0YWxsX2NtZHMgXAogIGZpbmlzaF9jbWRzIFwKLUBAIC0xNjk3OSw3ICsxNzY1
MSw4IEBAICRhc19lY2hvIFgiPC9hPiRmaWxlIiB8CitAQCAtMTcwMzEsNyArMTc3MDMsOCBAQCAk
YXNfZWNobyBYIiRmaWxlIiB8CiAgIyBOT1RFOiBDaGFuZ2VzIG1hZGUgdG8gdGhpcyBmaWxlIHdp
bGwgYmUgbG9zdDogbG9vayBhdCBsdG1haW4uc2guCiAgIwogICMgICBDb3B5cmlnaHQgKEMpIDE5
OTYsIDE5OTcsIDE5OTgsIDE5OTksIDIwMDAsIDIwMDEsIDIwMDMsIDIwMDQsIDIwMDUsCkBAIC0z
Mzk4LDcgKzMzOTksNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAg
IyAgIFdyaXR0ZW4gYnkgR29yZG9uIE1hdHppZ2tlaXQsIDE5OTYKICAjCiAgIyAgIFRoaXMgZmls
ZSBpcyBwYXJ0IG9mIEdOVSBMaWJ0b29sLgotQEAgLTE3MDgyLDE5ICsxNzc1NSw0MiBAQCBTUDJO
TD0kbHRfbHRfU1AyTkwKK0BAIC0xNzEzNCwxOSArMTc4MDcsNDIgQEAgU1AyTkw9JGx0X2x0X1NQ
Mk5MCiAgIyB0dXJuIG5ld2xpbmVzIGludG8gc3BhY2VzLgogIE5MMlNQPSRsdF9sdF9OTDJTUAog
IApAQCAtMzQ0Miw3ICszNDQzLDcgQEAgaW5kZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEw
MDc1NQogICMgQSBzeW1ib2wgc3RyaXBwaW5nIHByb2dyYW0uCiAgU1RSSVA9JGx0X1NUUklQCiAg
Ci1AQCAtMTcxMjQsNiArMTc4MjAsMTIgQEAgZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVz
cz0kbHRfbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3MKK0BAIC0xNzE3
Niw2ICsxNzg3MiwxMiBAQCBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzPSRsdF9sdF9j
dl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcwogICMgVHJhbnNmb3JtIHRoZSBv
dXRwdXQgb2Ygbm0gaW4gYSBDIG5hbWUgYWRkcmVzcyBwYWlyIHdoZW4gbGliIHByZWZpeCBpcyBu
ZWVkZWQuCiAgZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4PSRsdF9s
dF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4CiAgCkBA
IC0zNDU1LDcgKzM0NTYsNyBAQCBpbmRleCBhOGRmZDRiZDY4Yy4uODIzMTY0OTY5NTMgMTAwNzU1
CiAgIyBUaGUgbmFtZSBvZiB0aGUgZGlyZWN0b3J5IHRoYXQgY29udGFpbnMgdGVtcG9yYXJ5IGxp
YnRvb2wgZmlsZXMuCiAgb2JqZGlyPSRvYmpkaXIKICAKLUBAIC0xNzEzMyw2ICsxNzgzNSw5IEBA
IE1BR0lDX0NNRD0kTUFHSUNfQ01ECitAQCAtMTcxODUsNiArMTc4ODcsOSBAQCBNQUdJQ19DTUQ9
JE1BR0lDX0NNRAogICMgTXVzdCB3ZSBsb2NrIGZpbGVzIHdoZW4gZG9pbmcgY29tcGlsYXRpb24/
CiAgbmVlZF9sb2Nrcz0kbHRfbmVlZF9sb2NrcwogIApAQCAtMzQ2NSw3ICszNDY2LDcgQEAgaW5k
ZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogICMgVG9vbCB0byBtYW5pcHVsYXRl
IGFyY2hpdmVkIERXQVJGIGRlYnVnIHN5bWJvbCBmaWxlcyBvbiBNYWMgT1MgWC4KICBEU1lNVVRJ
TD0kbHRfRFNZTVVUSUwKICAKLUBAIC0xNzI0NywxMiArMTc5NTIsMTIgQEAgd2l0aF9nY2M9JEdD
QworQEAgLTE3Mjk5LDEyICsxODAwNCwxMiBAQCB3aXRoX2djYz0kR0NDCiAgIyBDb21waWxlciBm
bGFnIHRvIHR1cm4gb2ZmIGJ1aWx0aW4gZnVuY3Rpb25zLgogIG5vX2J1aWx0aW5fZmxhZz0kbHRf
bHRfcHJvZ19jb21waWxlcl9ub19idWlsdGluX2ZsYWcKICAKQEAgLTM0ODEsNyArMzQ4Miw3IEBA
IGluZGV4IGE4ZGZkNGJkNjhjLi44MjMxNjQ5Njk1MyAxMDA3NTUKICAjIENvbXBpbGVyIGZsYWcg
dG8gcHJldmVudCBkeW5hbWljIGxpbmtpbmcuCiAgbGlua19zdGF0aWNfZmxhZz0kbHRfbHRfcHJv
Z19jb21waWxlcl9zdGF0aWMKICAKLUBAIC0xNzMzOSw5ICsxODA0NCw2IEBAIGluaGVyaXRfcnBh
dGg9JGluaGVyaXRfcnBhdGgKK0BAIC0xNzM5MSw5ICsxODA5Niw2IEBAIGluaGVyaXRfcnBhdGg9
JGluaGVyaXRfcnBhdGgKICAjIFdoZXRoZXIgbGlidG9vbCBtdXN0IGxpbmsgYSBwcm9ncmFtIGFn
YWluc3QgYWxsIGl0cyBkZXBlbmRlbmN5IGxpYnJhcmllcy4KICBsaW5rX2FsbF9kZXBsaWJzPSRs
aW5rX2FsbF9kZXBsaWJzCiAgCkBAIC0zNDkxLDcgKzM0OTIsNyBAQCBpbmRleCBhOGRmZDRiZDY4
Yy4uODIzMTY0OTY5NTMgMTAwNzU1CiAgIyBTZXQgdG8gInllcyIgaWYgZXhwb3J0ZWQgc3ltYm9s
cyBhcmUgcmVxdWlyZWQuCiAgYWx3YXlzX2V4cG9ydF9zeW1ib2xzPSRhbHdheXNfZXhwb3J0X3N5
bWJvbHMKICAKLUBAIC0xNzM1Nyw2ICsxODA1OSw5IEBAIGluY2x1ZGVfZXhwc3ltcz0kbHRfaW5j
bHVkZV9leHBzeW1zCitAQCAtMTc0MDksNiArMTgxMTEsOSBAQCBpbmNsdWRlX2V4cHN5bXM9JGx0
X2luY2x1ZGVfZXhwc3ltcwogICMgQ29tbWFuZHMgbmVjZXNzYXJ5IGZvciBsaW5raW5nIHByb2dy
YW1zIChhZ2FpbnN0IGxpYnJhcmllcykgd2l0aCB0ZW1wbGF0ZXMuCiAgcHJlbGlua19jbWRzPSRs
dF9wcmVsaW5rX2NtZHMKICAKQEAgLTM1MDEsNyArMzUwMiw3IEBAIGluZGV4IGE4ZGZkNGJkNjhj
Li44MjMxNjQ5Njk1MyAxMDA3NTUKICAjIFNwZWNpZnkgZmlsZW5hbWUgY29udGFpbmluZyBpbnB1
dCBmaWxlcy4KICBmaWxlX2xpc3Rfc3BlYz0kbHRfZmlsZV9saXN0X3NwZWMKICAKLUBAIC0xNzM4
OSwyMTAgKzE4MDk0LDE2OSBAQCBsdG1haW49IiRhY19hdXhfZGlyL2x0bWFpbi5zaCIKK0BAIC0x
NzQ0MSwyMTAgKzE4MTQ2LDE2OSBAQCBsdG1haW49IiRhY19hdXhfZGlyL2x0bWFpbi5zaCIKICAg
ICMgaWYgZmluZHMgbWl4ZWQgQ1IvTEYgYW5kIExGLW9ubHkgbGluZXMuICBTaW5jZSBzZWQgb3Bl
cmF0ZXMgaW4KICAgICMgdGV4dCBtb2RlLCBpdCBwcm9wZXJseSBjb252ZXJ0cyBsaW5lcyB0byBD
Ui9MRi4gIFRoaXMgYmFzaCBwcm9ibGVtCiAgICAjIGlzIHJlcG9ydGVkbHkgZml4ZWQsIGJ1dCB3
aHkgbm90IHJ1biBvbiBvbGQgdmVyc2lvbnMgdG9vPwpAQCAtMzg3Niw3ICszODc3LDcgQEAgaW5k
ZXggYThkZmQ0YmQ2OGMuLjgyMzE2NDk2OTUzIDEwMDc1NQogICAgY2htb2QgK3ggIiRvZmlsZSIK
ICAKIGRpZmYgLS1naXQgYS9nYXMvY29uZmlndXJlIGIvZ2FzL2NvbmZpZ3VyZQotaW5kZXggNjBj
MWEwNTVhZTIuLjBlMGNlNGMwZTIzIDEwMDc1NQoraW5kZXggZDRiMTNlNmZjOGIuLmRkNTIyNGM1
YzgxIDEwMDc1NQogLS0tIGEvZ2FzL2NvbmZpZ3VyZQogKysrIGIvZ2FzL2NvbmZpZ3VyZQogQEAg
LTY4MSw4ICs2ODEsMTEgQEAgT1RPT0wKQEAgLTUyMDQsNyArNTIwNSw3IEBAIGluZGV4IDYwYzFh
MDU1YWUyLi4wZTBjZTRjMGUyMyAxMDA3NTUKICBpbnQgbWFpbiAoKQogIHsKICAgIHZvaWQgKnNl
bGYgPSBkbG9wZW4gKDAsIExUX0RMR0xPQkFMfExUX0RMTEFaWV9PUl9OT1cpOwotQEAgLTE1OTI4
LDEzICsxNjU4MywyMCBAQCBleGVleHQ9J2AkRUNITyAiJGV4ZWV4dCIgfCAkU0VEICIkZGVsYXlf
c2luZ2xlX3F1b3RlX3N1YnN0ImAnCitAQCAtMTU5ODEsMTMgKzE2NjM2LDIwIEBAIGV4ZWV4dD0n
YCRFQ0hPICIkZXhlZXh0IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBs
dF91bnNldD0nYCRFQ0hPICIkbHRfdW5zZXQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9z
dWJzdCJgJwogIGx0X1NQMk5MPSdgJEVDSE8gIiRsdF9TUDJOTCIgfCAkU0VEICIkZGVsYXlfc2lu
Z2xlX3F1b3RlX3N1YnN0ImAnCiAgbHRfTkwyU1A9J2AkRUNITyAiJGx0X05MMlNQIiB8ICRTRUQg
IiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZF
IiBocmVmPSJtYWlsdG86YCdAQC01MjI1LDcrNTIyNiw3QEBpbmRleDYwYzFhMDU1YWUyLi4wZTBj
ZTRjMGUyMzEwMDc1NVNUUklQPSdgJEVDSE8iPiJgJwpAQCAtNTIyNSw3ICs1MjI2LDcgQEAgaW5k
ZXggNjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIzIDEwMDc1NQogIFNUUklQPSdgJEVDSE8gIjwvYT4k
U1RSSVAiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIFJBTkxJQj0nYCRF
Q0hPICIkUkFOTElCIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBvbGRf
cG9zdGluc3RhbGxfY21kcz0nYCRFQ0hPICIkb2xkX3Bvc3RpbnN0YWxsX2NtZHMiIHwgJFNFRCAi
JGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwotQEAgLTE1OTQ5LDE0ICsxNjYxMSwxNyBAQCBs
dF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5
bWJvbF9waXBlIiB8ICRTRUQgIiRkZQorQEAgLTE2MDAyLDE0ICsxNjY2NCwxNyBAQCBsdF9jdl9z
eXNfZ2xvYmFsX3N5bWJvbF9waXBlPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9w
aXBlIiB8ICRTRUQgIiRkZQogIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsPSdgJEVD
SE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jZGVjbCIgfCAkU0VEICIkZGVsYXlfc2lu
Z2xlX3F1b3RlX3N1YnN0ImAnCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2Fk
ZHJlc3M9J2AkRUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNz
IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9jdl9zeXNfZ2xvYmFs
X3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4PSdgJEVDSE8gIiRsdF9jdl9zeXNf
Z2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4IiB8ICRTRUQgIiRkZWxh
eV9zaW5nbGVfcXVvdGVfc3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86YCdAQC01MjQ0LDcrNTI0NSw3QEBpbmRleDYwYzFhMDU1YWUyLi4wZTBjZTRjMGUy
MzEwMDc1NURTWU1VVElMPSdgJEVDSE8iPiJgJwpAQCAtNTI0NCw3ICs1MjQ1LDcgQEAgaW5kZXgg
NjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIzIDEwMDc1NQogIERTWU1VVElMPSdgJEVDSE8gIjwvYT4k
RFNZTVVUSUwiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIE5NRURJVD0n
YCRFQ0hPICIkTk1FRElUIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBM
SVBPPSdgJEVDSE8gIiRMSVBPIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcK
LUBAIC0xNTk4OSwxMiArMTY2NTQsMTIgQEAgaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcj0nYCRFQ0hP
ICIkaGFyZGNvZGVfc2hsaWJwYXRoX3ZhciIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3EKK0BAIC0x
NjA0MiwxMiArMTY3MDcsMTIgQEAgaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcj0nYCRFQ0hPICIkaGFy
ZGNvZGVfc2hsaWJwYXRoX3ZhciIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3EKICBoYXJkY29kZV9h
dXRvbWF0aWM9J2AkRUNITyAiJGhhcmRjb2RlX2F1dG9tYXRpYyIgfCAkU0VEICIkZGVsYXlfc2lu
Z2xlX3F1b3RlX3N1YnN0ImAnCiAgaW5oZXJpdF9ycGF0aD0nYCRFQ0hPICIkaW5oZXJpdF9ycGF0
aCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgbGlua19hbGxfZGVwbGli
cz0nYCRFQ0hPICIkbGlua19hbGxfZGVwbGlicyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3Rl
X3N1YnN0PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmAnQEAt
NTI1OCw3KzUyNTksN0BAaW5kZXg2MGMxYTA1NWFlMi4uMGUwY2U0YzBlMjMxMDA3NTVmaWxlX2xp
c3Rfc3BlYz0nYCRFQ0hPIj4iYCcKQEAgLTUyNTgsNyArNTI1OSw3IEBAIGluZGV4IDYwYzFhMDU1
YWUyLi4wZTBjZTRjMGUyMyAxMDA3NTUKICBmaWxlX2xpc3Rfc3BlYz0nYCRFQ0hPICI8L2E+JGZp
bGVfbGlzdF9zcGVjIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICB2YXJp
YWJsZXNfc2F2ZWRfZm9yX3JlbGluaz0nYCRFQ0hPICIkdmFyaWFibGVzX3NhdmVkX2Zvcl9yZWxp
bmsiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIG5lZWRfbGliX3ByZWZp
eD0nYCRFQ0hPICIkbmVlZF9saWJfcHJlZml4IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVf
c3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YCctQEAt
MTYwNDksOCsxNjcxNCwxM0BAcmVsb2FkX2ZsYWdcK0BALTE2MTAyLDgrMTY3NjcsMTNAQHJlbG9h
ZF9mbGFnXE9CSkRVTVBcZGVwbGlic19jaGVja19tZXRob2RcZmlsZV9tYWdpY19jbWRcQEAtNTI3
Miw3KzUyNzMsN0BAaW5kZXg2MGMxYTA1NWFlMi4uMGUwY2U0YzBlMjMxMDA3NTVTVFJJUFxSQU5M
SUJcQ0NcLUBALTE2MDYwLDEyKzE2NzMwLDE0QEBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBl
XCtAQC0xNjExMywxMisxNjc4MywxNEBAbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZVxsdF9j
dl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jZGVjbFxsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19j
X25hbWVfYWRkcmVzc1xsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19s
aWJfcHJlZml4XEBALTUyODgsNys1Mjg5LDdAQGluZGV4NjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIz
MTAwNzU1RFNZTVVUSUxcTk1FRElUXExJUE9cLUBALTE2MDgxLDcrMTY3NTMsNkBAbm9fdW5kZWZp
bmVkX2ZsYWdcK0BALTE2MTM0LDcrMTY4MDYsNkBAbm9fdW5kZWZpbmVkX2ZsYWdcaGFyZGNvZGVf
bGliZGlyX2ZsYWdfc3BlY1xoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjX2xkXGhhcmRjb2RlX2xp
YmRpcl9zZXBhcmF0b3JcQEAtNTI5Niw3KzUyOTcsN0BAaW5kZXg2MGMxYTA1NWFlMi4uMGUwY2U0
YzBlMjMxMDA3NTVleGNsdWRlX2V4cHN5bXNcaW5jbHVkZV9leHBzeW1zXGZpbGVfbGlzdF9zcGVj
XC1AQC0xNjExNyw2KzE2Nzg4LDdAQG1vZHVsZV9jbWRzXCtAQC0xNjE3MCw2KzE2ODQxLDdAQG1v
ZHVsZV9jbWRzXG1vZHVsZV9leHBzeW1fY21kc1xleHBvcnRfc3ltYm9sc19jbWRzXHByZWxpbmtf
Y21kc1xAQC01MzA0LDcrNTMwNSw3QEBpbmRleDYwYzFhMDU1YWUyLi4wZTBjZTRjMGUyMzEwMDc1
NXBvc3RpbnN0YWxsX2NtZHNccG9zdHVuaW5zdGFsbF9jbWRzXGZpbmlzaF9jbWRzXC1AQC0xNjg5
MCw3KzE3NTYyLDhAQCRhc19lY2hvWCI+ImAnCi1AQCAtMTYwNDksOCArMTY3MTQsMTMgQEAgcmVs
b2FkX2ZsYWcgXAorQEAgLTE2MTAyLDggKzE2NzY3LDEzIEBAIHJlbG9hZF9mbGFnIFwKICBPQkpE
VU1QIFwKICBkZXBsaWJzX2NoZWNrX21ldGhvZCBcCiAgZmlsZV9tYWdpY19jbWQgXApAQCAtNTI3
Miw3ICs1MjczLDcgQEAgaW5kZXggNjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIzIDEwMDc1NQogIFNU
UklQIFwKICBSQU5MSUIgXAogIENDIFwKLUBAIC0xNjA2MCwxMiArMTY3MzAsMTQgQEAgbHRfY3Zf
c3lzX2dsb2JhbF9zeW1ib2xfcGlwZSBcCitAQCAtMTYxMTMsMTIgKzE2NzgzLDE0IEBAIGx0X2N2
X3N5c19nbG9iYWxfc3ltYm9sX3BpcGUgXAogIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2Nk
ZWNsIFwKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcyBcCiAgbHRf
Y3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3NfbGliX3ByZWZpeCBcCkBAIC01
Mjg4LDcgKzUyODksNyBAQCBpbmRleCA2MGMxYTA1NWFlMi4uMGUwY2U0YzBlMjMgMTAwNzU1CiAg
RFNZTVVUSUwgXAogIE5NRURJVCBcCiAgTElQTyBcCi1AQCAtMTYwODEsNyArMTY3NTMsNiBAQCBu
b191bmRlZmluZWRfZmxhZyBcCitAQCAtMTYxMzQsNyArMTY4MDYsNiBAQCBub191bmRlZmluZWRf
ZmxhZyBcCiAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYyBcCiAgaGFyZGNvZGVfbGliZGlyX2Zs
YWdfc3BlY19sZCBcCiAgaGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvciBcCkBAIC01Mjk2LDcgKzUy
OTcsNyBAQCBpbmRleCA2MGMxYTA1NWFlMi4uMGUwY2U0YzBlMjMgMTAwNzU1CiAgZXhjbHVkZV9l
eHBzeW1zIFwKICBpbmNsdWRlX2V4cHN5bXMgXAogIGZpbGVfbGlzdF9zcGVjIFwKLUBAIC0xNjEx
Nyw2ICsxNjc4OCw3IEBAIG1vZHVsZV9jbWRzIFwKK0BAIC0xNjE3MCw2ICsxNjg0MSw3IEBAIG1v
ZHVsZV9jbWRzIFwKICBtb2R1bGVfZXhwc3ltX2NtZHMgXAogIGV4cG9ydF9zeW1ib2xzX2NtZHMg
XAogIHByZWxpbmtfY21kcyBcCkBAIC01MzA0LDcgKzUzMDUsNyBAQCBpbmRleCA2MGMxYTA1NWFl
Mi4uMGUwY2U0YzBlMjMgMTAwNzU1CiAgcG9zdGluc3RhbGxfY21kcyBcCiAgcG9zdHVuaW5zdGFs
bF9jbWRzIFwKICBmaW5pc2hfY21kcyBcCi1AQCAtMTY4OTAsNyArMTc1NjIsOCBAQCAkYXNfZWNo
byBYIjwvYT4kZmlsZSIgfAorQEAgLTE2OTQzLDcgKzE3NjE1LDggQEAgJGFzX2VjaG8gWCIkZmls
ZSIgfAogICMgTk9URTogQ2hhbmdlcyBtYWRlIHRvIHRoaXMgZmlsZSB3aWxsIGJlIGxvc3Q6IGxv
b2sgYXQgbHRtYWluLnNoLgogICMKICAjICAgQ29weXJpZ2h0IChDKSAxOTk2LCAxOTk3LCAxOTk4
LCAxOTk5LCAyMDAwLCAyMDAxLCAyMDAzLCAyMDA0LCAyMDA1LApAQCAtNTMxNCw3ICs1MzE1LDcg
QEAgaW5kZXggNjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIzIDEwMDc1NQogICMgICBXcml0dGVuIGJ5
IEdvcmRvbiBNYXR6aWdrZWl0LCAxOTk2CiAgIwogICMgICBUaGlzIGZpbGUgaXMgcGFydCBvZiBH
TlUgTGlidG9vbC4KLUBAIC0xNjk5MywxOSArMTc2NjYsNDIgQEAgU1AyTkw9JGx0X2x0X1NQMk5M
CitAQCAtMTcwNDYsMTkgKzE3NzE5LDQyIEBAIFNQMk5MPSRsdF9sdF9TUDJOTAogICMgdHVybiBu
ZXdsaW5lcyBpbnRvIHNwYWNlcy4KICBOTDJTUD0kbHRfbHRfTkwyU1AKICAKQEAgLTUzNTgsNyAr
NTM1OSw3IEBAIGluZGV4IDYwYzFhMDU1YWUyLi4wZTBjZTRjMGUyMyAxMDA3NTUKICAjIEEgc3lt
Ym9sIHN0cmlwcGluZyBwcm9ncmFtLgogIFNUUklQPSRsdF9TVFJJUAogIAotQEAgLTE3MDM1LDYg
KzE3NzMxLDEyIEBAIGdsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3M9JGx0X2x0X2N2X3N5
c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzCitAQCAtMTcwODgsNiArMTc3ODQsMTIg
QEAgZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcz0kbHRfbHRfY3Zfc3lzX2dsb2JhbF9z
eW1ib2xfdG9fY19uYW1lX2FkZHJlc3MKICAjIFRyYW5zZm9ybSB0aGUgb3V0cHV0IG9mIG5tIGlu
IGEgQyBuYW1lIGFkZHJlc3MgcGFpciB3aGVuIGxpYiBwcmVmaXggaXMgbmVlZGVkLgogIGdsb2Jh
bF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3NfbGliX3ByZWZpeD0kbHRfbHRfY3Zfc3lzX2dsb2Jh
bF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3NfbGliX3ByZWZpeAogIApAQCAtNTM3MSw3ICs1Mzcy
LDcgQEAgaW5kZXggNjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIzIDEwMDc1NQogICMgVGhlIG5hbWUg
b2YgdGhlIGRpcmVjdG9yeSB0aGF0IGNvbnRhaW5zIHRlbXBvcmFyeSBsaWJ0b29sIGZpbGVzLgog
IG9iamRpcj0kb2JqZGlyCiAgCi1AQCAtMTcwNDQsNiArMTc3NDYsOSBAQCBNQUdJQ19DTUQ9JE1B
R0lDX0NNRAorQEAgLTE3MDk3LDYgKzE3Nzk5LDkgQEAgTUFHSUNfQ01EPSRNQUdJQ19DTUQKICAj
IE11c3Qgd2UgbG9jayBmaWxlcyB3aGVuIGRvaW5nIGNvbXBpbGF0aW9uPwogIG5lZWRfbG9ja3M9
JGx0X25lZWRfbG9ja3MKICAKQEAgLTUzODEsNyArNTM4Miw3IEBAIGluZGV4IDYwYzFhMDU1YWUy
Li4wZTBjZTRjMGUyMyAxMDA3NTUKICAjIFRvb2wgdG8gbWFuaXB1bGF0ZSBhcmNoaXZlZCBEV0FS
RiBkZWJ1ZyBzeW1ib2wgZmlsZXMgb24gTWFjIE9TIFguCiAgRFNZTVVUSUw9JGx0X0RTWU1VVElM
CiAgCi1AQCAtMTcxNTgsMTIgKzE3ODYzLDEyIEBAIHdpdGhfZ2NjPSRHQ0MKK0BAIC0xNzIxMSwx
MiArMTc5MTYsMTIgQEAgd2l0aF9nY2M9JEdDQwogICMgQ29tcGlsZXIgZmxhZyB0byB0dXJuIG9m
ZiBidWlsdGluIGZ1bmN0aW9ucy4KICBub19idWlsdGluX2ZsYWc9JGx0X2x0X3Byb2dfY29tcGls
ZXJfbm9fYnVpbHRpbl9mbGFnCiAgCkBAIC01Mzk3LDcgKzUzOTgsNyBAQCBpbmRleCA2MGMxYTA1
NWFlMi4uMGUwY2U0YzBlMjMgMTAwNzU1CiAgIyBDb21waWxlciBmbGFnIHRvIHByZXZlbnQgZHlu
YW1pYyBsaW5raW5nLgogIGxpbmtfc3RhdGljX2ZsYWc9JGx0X2x0X3Byb2dfY29tcGlsZXJfc3Rh
dGljCiAgCi1AQCAtMTcyNTAsOSArMTc5NTUsNiBAQCBpbmhlcml0X3JwYXRoPSRpbmhlcml0X3Jw
YXRoCitAQCAtMTczMDMsOSArMTgwMDgsNiBAQCBpbmhlcml0X3JwYXRoPSRpbmhlcml0X3JwYXRo
CiAgIyBXaGV0aGVyIGxpYnRvb2wgbXVzdCBsaW5rIGEgcHJvZ3JhbSBhZ2FpbnN0IGFsbCBpdHMg
ZGVwZW5kZW5jeSBsaWJyYXJpZXMuCiAgbGlua19hbGxfZGVwbGlicz0kbGlua19hbGxfZGVwbGli
cwogIApAQCAtNTQwNyw3ICs1NDA4LDcgQEAgaW5kZXggNjBjMWEwNTVhZTIuLjBlMGNlNGMwZTIz
IDEwMDc1NQogICMgU2V0IHRvICJ5ZXMiIGlmIGV4cG9ydGVkIHN5bWJvbHMgYXJlIHJlcXVpcmVk
LgogIGFsd2F5c19leHBvcnRfc3ltYm9scz0kYWx3YXlzX2V4cG9ydF9zeW1ib2xzCiAgCi1AQCAt
MTcyNjgsNiArMTc5NzAsOSBAQCBpbmNsdWRlX2V4cHN5bXM9JGx0X2luY2x1ZGVfZXhwc3ltcwor
QEAgLTE3MzIxLDYgKzE4MDIzLDkgQEAgaW5jbHVkZV9leHBzeW1zPSRsdF9pbmNsdWRlX2V4cHN5
bXMKICAjIENvbW1hbmRzIG5lY2Vzc2FyeSBmb3IgbGlua2luZyBwcm9ncmFtcyAoYWdhaW5zdCBs
aWJyYXJpZXMpIHdpdGggdGVtcGxhdGVzLgogIHByZWxpbmtfY21kcz0kbHRfcHJlbGlua19jbWRz
CiAgCkBAIC01NDE3LDcgKzU0MTgsNyBAQCBpbmRleCA2MGMxYTA1NWFlMi4uMGUwY2U0YzBlMjMg
MTAwNzU1CiAgIyBTcGVjaWZ5IGZpbGVuYW1lIGNvbnRhaW5pbmcgaW5wdXQgZmlsZXMuCiAgZmls
ZV9saXN0X3NwZWM9JGx0X2ZpbGVfbGlzdF9zcGVjCiAgCi1AQCAtMTczMDAsMjEwICsxODAwNSwx
NjkgQEAgbHRtYWluPSIkYWNfYXV4X2Rpci9sdG1haW4uc2giCitAQCAtMTczNTMsMjEwICsxODA1
OCwxNjkgQEAgbHRtYWluPSIkYWNfYXV4X2Rpci9sdG1haW4uc2giCiAgICAjIGlmIGZpbmRzIG1p
eGVkIENSL0xGIGFuZCBMRi1vbmx5IGxpbmVzLiAgU2luY2Ugc2VkIG9wZXJhdGVzIGluCiAgICAj
IHRleHQgbW9kZSwgaXQgcHJvcGVybHkgY29udmVydHMgbGluZXMgdG8gQ1IvTEYuICBUaGlzIGJh
c2ggcHJvYmxlbQogICAgIyBpcyByZXBvcnRlZGx5IGZpeGVkLCBidXQgd2h5IG5vdCBydW4gb24g
b2xkIHZlcnNpb25zIHRvbz8KQEAgLTU3OTIsNyArNTc5Myw3IEBAIGluZGV4IDYwYzFhMDU1YWUy
Li4wZTBjZTRjMGUyMyAxMDA3NTUKICAgIGNobW9kICt4ICIkb2ZpbGUiCiAgCiBkaWZmIC0tZ2l0
IGEvZ3Byb2YvY29uZmlndXJlIGIvZ3Byb2YvY29uZmlndXJlCi1pbmRleCBjMjM2OTJlNWMzZC4u
OWY5MzZhNWIwM2QgMTAwNzU1CitpbmRleCAzY2Y0MWI3OTExNi4uZTVkNTdmNTI5MTIgMTAwNzU1
CiAtLS0gYS9ncHJvZi9jb25maWd1cmUKICsrKyBiL2dwcm9mL2NvbmZpZ3VyZQogQEAgLTY2Miw4
ICs2NjIsMTEgQEAgT1RPT0wKQEAgLTc3MDcsNyArNzcwOCw3IEBAIGluZGV4IGMyMzY5MmU1YzNk
Li45ZjkzNmE1YjAzZCAxMDA3NTUKICAgIGNobW9kICt4ICIkb2ZpbGUiCiAgCiBkaWZmIC0tZ2l0
IGEvbGQvY29uZmlndXJlIGIvbGQvY29uZmlndXJlCi1pbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0
NjM3ZDAgMTAwNzU1CitpbmRleCAxYzg3MmMwZGI1Zi4uZmU5MzhlNmM5OWYgMTAwNzU1CiAtLS0g
YS9sZC9jb25maWd1cmUKICsrKyBiL2xkL2NvbmZpZ3VyZQogQEAgLTY5MSw4ICs2OTEsMTEgQEAg
T1RPT0wKQEAgLTc3MzAsNyArNzczMSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2Mzdk
MCAxMDA3NTUKICBlbmFibGVfbGlidG9vbF9sb2NrCiAgZW5hYmxlX3BsdWdpbnMKICBlbmFibGVf
bGFyZ2VmaWxlCi1AQCAtMTUxMiw2ICsxNTE2LDggQEAgT3B0aW9uYWwgUGFja2FnZXM6CitAQCAt
MTUyMCw2ICsxNTI0LDggQEAgT3B0aW9uYWwgUGFja2FnZXM6CiAgICAtLXdpdGgtcGljICAgICAg
ICAgICAgICB0cnkgdG8gdXNlIG9ubHkgUElDL25vbi1QSUMgb2JqZWN0cyBbZGVmYXVsdD11c2UK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvdGhdCiAgICAtLXdpdGgtZ251LWxkICAgICAg
ICAgICBhc3N1bWUgdGhlIEMgY29tcGlsZXIgdXNlcyBHTlUgbGQgW2RlZmF1bHQ9bm9dCkBAIC03
NzM5LDcgKzc3NDAsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAg
ICAtLXdpdGgtbGliLXBhdGg9ZGlyMTpkaXIyLi4uICBzZXQgZGVmYXVsdCBMSUJfUEFUSAogICAg
LS13aXRoLXN5c3Jvb3Q9RElSIFNlYXJjaCBmb3IgdXNyL2xpYiBldCBhbCB3aXRoaW4gRElSLgog
ICAgLS13aXRoLXN5c3RlbS16bGliICAgICAgdXNlIGluc3RhbGxlZCBsaWJ6Ci1AQCAtNTk2NSw4
ICs1OTcxLDggQEAgZXNhYworQEAgLTU5NzMsOCArNTk3OSw4IEBAIGVzYWMKICAKICAKICAKQEAg
LTc3NTAsNyArNzc1MSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUK
ICAKICAKICAKLUBAIC02MDA2LDcgKzYwMTIsNyBAQCBFQ0hPPSRFQ0hPJEVDSE8kRUNITyRFQ0hP
JEVDSE8kRUNITworQEAgLTYwMTQsNyArNjAyMCw3IEBAIEVDSE89JEVDSE8kRUNITyRFQ0hPJEVD
SE8kRUNITyRFQ0hPCiAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBj
aGVja2luZyBob3cgdG8gcHJpbnQgc3RyaW5ncyIgJmd0OyZhbXA7NQogICRhc19lY2hvX24gImNo
ZWNraW5nIGhvdyB0byBwcmludCBzdHJpbmdzLi4uICIgJmd0OyZhbXA7NjsgfQogICMgVGVzdCBw
cmludCBmaXJzdCwgYmVjYXVzZSBpdCB3aWxsIGJlIGEgYnVpbHRpbiBpZiBwcmVzZW50LgpAQCAt
Nzc1OSw3ICs3NzYwLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQog
ICAgIHRlc3QgIlhgcHJpbnQgLXIgLS0gJEVDSE8gMiZndDsvZGV2L251bGxgIiA9ICJYJEVDSE8i
OyB0aGVuCiAgICBFQ0hPPSdwcmludCAtciAtLScKICBlbGlmIHRlc3QgIlhgcHJpbnRmICVzICRF
Q0hPIDImZ3Q7L2Rldi9udWxsYCIgPSAiWCRFQ0hPIjsgdGhlbgotQEAgLTY2OTIsOCArNjY5OCw4
IEBAICRhc19lY2hvX24gImNoZWNraW5nIHdoZXRoZXIgdGhlIHNoZWxsIHVuZGVyc3RhbmRzIHNv
bWUgWFNJIGNvbnN0cnVjdHMuLi4gIiAmZ3Q7JmFtcDs2OworQEAgLTY3MDAsOCArNjcwNiw4IEBA
ICRhc19lY2hvX24gImNoZWNraW5nIHdoZXRoZXIgdGhlIHNoZWxsIHVuZGVyc3RhbmRzIHNvbWUg
WFNJIGNvbnN0cnVjdHMuLi4gIiAmZ3Q7JmFtcDs2OwogICMgVHJ5IHNvbWUgWFNJIGZlYXR1cmVz
CiAgeHNpX3NoZWxsPW5vCiAgKCBfbHRfZHVtbXk9ImEvYi9jPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOkBALTc3NzAsNys3NzcxLDdAQGluZGV4ODExMTM0YTUw
M2IuLmY0MzJmNDYzN2QwMTAwNzU1JmFtcDsmYW1wO2V2YWwndGVzdCQoKDErMSkpLWVxMlwmYW1w
OyZhbXA7dGVzdCI+IgpAQCAtNzc3MCw3ICs3NzcxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0
MzJmNDYzN2QwIDEwMDc1NQogICAgICAmYW1wOyZhbXA7IGV2YWwgJ3Rlc3QgJCgoIDEgKyAxICkp
IC1lcSAyIFwKICAgICAgJmFtcDsmYW1wOyB0ZXN0ICI8L2E+JHsjX2x0X2R1bW15fSIgLWVxIDUn
ICkgJmd0Oy9kZXYvbnVsbCAyJmd0OyZhbXA7MSBcCiAgICAmYW1wOyZhbXA7IHhzaV9zaGVsbD15
ZXMKLUBAIC02NzQyLDYgKzY3NDgsODAgQEAgZXNhYworQEAgLTY3NTAsNiArNjc1Niw4MCBAQCBl
c2FjCiAgCiAgCiAgCkBAIC03ODUxLDcgKzc4NTIsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQz
MmY0NjM3ZDAgMTAwNzU1CiAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99
OiBjaGVja2luZyBmb3IgJExEIG9wdGlvbiB0byByZWxvYWQgb2JqZWN0IGZpbGVzIiAmZ3Q7JmFt
cDs1CiAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRMRCBvcHRpb24gdG8gcmVsb2FkIG9iamVj
dCBmaWxlcy4uLiAiICZndDsmYW1wOzY7IH0KICBpZiAke2x0X2N2X2xkX3JlbG9hZF9mbGFnKzp9
IGZhbHNlOyB0aGVuIDoKLUBAIC02NzU4LDYgKzY4MzgsMTEgQEAgY2FzZSAkcmVsb2FkX2ZsYWcg
aW4KK0BAIC02NzY2LDYgKzY4NDYsMTEgQEAgY2FzZSAkcmVsb2FkX2ZsYWcgaW4KICBlc2FjCiAg
cmVsb2FkX2NtZHM9JyRMRCRyZWxvYWRfZmxhZyAtbyAkb3V0cHV0JHJlbG9hZF9vYmpzJwogIGNh
c2UgJGhvc3Rfb3MgaW4KQEAgLTc4NjMsNyArNzg2NCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5m
NDMyZjQ2MzdkMCAxMDA3NTUKICAgIGRhcndpbiopCiAgICAgIGlmIHRlc3QgIiRHQ0MiID0geWVz
OyB0aGVuCiAgICAgICAgcmVsb2FkX2NtZHM9JyRMVENDICRMVENGTEFHUyAtbm9zdGRsaWIgJHt3
bH0tciAtbyAkb3V0cHV0JHJlbG9hZF9vYmpzJwotQEAgLTY5MjYsNyArNzAxMSw4IEBAIG1pbmd3
KiB8IHB3MzIqKQorQEAgLTY5MzQsNyArNzAxOSw4IEBAIG1pbmd3KiB8IHB3MzIqKQogICAgICBs
dF9jdl9kZXBsaWJzX2NoZWNrX21ldGhvZD0nZmlsZV9tYWdpYyBeeDg2IGFyY2hpdmUgaW1wb3J0
fF54ODYgRExMJwogICAgICBsdF9jdl9maWxlX21hZ2ljX2NtZD0nZnVuY193aW4zMl9saWJpZCcK
ICAgIGVsc2UKQEAgLTc4NzMsNyArNzg3NCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMCAxMDA3NTUKICAgICAgbHRfY3ZfZmlsZV9tYWdpY19jbWQ9JyRPQkpEVU1QIC1mJwogICAg
ZmkKICAgIDs7Ci1AQCAtNzA4MCw2ICs3MTY2LDIxIEBAIGVzYWMKK0BAIC03MDg4LDYgKzcxNzQs
MjEgQEAgZXNhYwogIGZpCiAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99
OiByZXN1bHQ6ICRsdF9jdl9kZXBsaWJzX2NoZWNrX21ldGhvZCIgJmd0OyZhbXA7NQogICRhc19l
Y2hvICIkbHRfY3ZfZGVwbGlic19jaGVja19tZXRob2QiICZndDsmYW1wOzY7IH0KQEAgLTc4OTUs
NyArNzg5Niw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICBmaWxl
X21hZ2ljX2NtZD0kbHRfY3ZfZmlsZV9tYWdpY19jbWQKICBkZXBsaWJzX2NoZWNrX21ldGhvZD0k
bHRfY3ZfZGVwbGlic19jaGVja19tZXRob2QKICB0ZXN0IC16ICIkZGVwbGlic19jaGVja19tZXRo
b2QiICZhbXA7JmFtcDsgZGVwbGlic19jaGVja19tZXRob2Q9dW5rbm93bgotQEAgLTcwOTUsOSAr
NzE5NiwxNjIgQEAgdGVzdCAteiAiJGRlcGxpYnNfY2hlY2tfbWV0aG9kIiAmYW1wOyZhbXA7IGRl
cGxpYnNfY2hlY2tfbWV0aG9kPXVua25vd24KK0BAIC03MTAzLDkgKzcyMDQsMTYyIEBAIHRlc3Qg
LXogIiRkZXBsaWJzX2NoZWNrX21ldGhvZCIgJmFtcDsmYW1wOyBkZXBsaWJzX2NoZWNrX21ldGhv
ZD11bmtub3duCiAgCiAgCiAgCkBAIC04MDYwLDcgKzgwNjEsNyBAQCBpbmRleCA4MTExMzRhNTAz
Yi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRM
SU5FTk99OiBjaGVja2luZyBmb3IgJGFjX3dvcmQiICZndDsmYW1wOzUKICAkYXNfZWNob19uICJj
aGVja2luZyBmb3IgJGFjX3dvcmQuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAgaWYgJHthY19jdl9wcm9n
X0FSKzp9IGZhbHNlOyB0aGVuIDoKLUBAIC03MTEzLDcgKzczNjcsNyBAQCBkbworQEAgLTcxMjEs
NyArNzM3NSw3IEBAIGRvCiAgICB0ZXN0IC16ICIkYXNfZGlyIiAmYW1wOyZhbXA7IGFzX2Rpcj0u
CiAgICAgIGZvciBhY19leGVjX2V4dCBpbiAnJyAkYWNfZXhlY3V0YWJsZV9leHRlbnNpb25zOyBk
bwogICAgaWYgYXNfZm5fZXhlY3V0YWJsZV9wICIkYXNfZGlyLyRhY193b3JkJGFjX2V4ZWNfZXh0
IjsgdGhlbgpAQCAtODA2OSw3ICs4MDcwLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYz
N2QwIDEwMDc1NQogICAgICAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBm
b3VuZCAkYXNfZGlyLyRhY193b3JkJGFjX2V4ZWNfZXh0IiAmZ3Q7JmFtcDs1CiAgICAgIGJyZWFr
IDIKICAgIGZpCi1AQCAtNzEzMywxMSArNzM4NywxNSBAQCAkYXNfZWNobyAibm8iICZndDsmYW1w
OzY7IH0KK0BAIC03MTQxLDExICs3Mzk1LDE1IEBAICRhc19lY2hvICJubyIgJmd0OyZhbXA7Njsg
fQogIGZpCiAgCiAgCkBAIC04MDg4LDcgKzgwODksNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQz
MmY0NjM3ZDAgMTAwNzU1CiAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99
OiBjaGVja2luZyBmb3IgJGFjX3dvcmQiICZndDsmYW1wOzUKICAkYXNfZWNob19uICJjaGVja2lu
ZyBmb3IgJGFjX3dvcmQuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAgaWYgJHthY19jdl9wcm9nX2FjX2N0
X0FSKzp9IGZhbHNlOyB0aGVuIDoKLUBAIC03MTUzLDcgKzc0MTEsNyBAQCBkbworQEAgLTcxNjEs
NyArNzQxOSw3IEBAIGRvCiAgICB0ZXN0IC16ICIkYXNfZGlyIiAmYW1wOyZhbXA7IGFzX2Rpcj0u
CiAgICAgIGZvciBhY19leGVjX2V4dCBpbiAnJyAkYWNfZXhlY3V0YWJsZV9leHRlbnNpb25zOyBk
bwogICAgaWYgYXNfZm5fZXhlY3V0YWJsZV9wICIkYXNfZGlyLyRhY193b3JkJGFjX2V4ZWNfZXh0
IjsgdGhlbgpAQCAtODA5Nyw3ICs4MDk4LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYz
N2QwIDEwMDc1NQogICAgICAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBm
b3VuZCAkYXNfZGlyLyRhY193b3JkJGFjX2V4ZWNfZXh0IiAmZ3Q7JmFtcDs1CiAgICAgIGJyZWFr
IDIKICAgIGZpCi1AQCAtNzE3Miw2ICs3NDMwLDEwIEBAIGVsc2UKK0BAIC03MTgwLDYgKzc0Mzgs
MTAgQEAgZWxzZQogICRhc19lY2hvICJubyIgJmd0OyZhbXA7NjsgfQogIGZpCiAgCkBAIC04MTA4
LDcgKzgxMDksNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICBp
ZiB0ZXN0ICJ4JGFjX2N0X0FSIiA9IHg7IHRoZW4KICAgICAgQVI9ImZhbHNlIgogICAgZWxzZQot
QEAgLTcxODMsMTIgKzc0NDUsMTIgQEAgYWNfdG9vbF93YXJuZWQ9eWVzIDs7CitAQCAtNzE5MSwx
MiArNzQ1MywxMiBAQCBhY190b29sX3dhcm5lZD15ZXMgOzsKICBlc2FjCiAgICAgIEFSPSRhY19j
dF9BUgogICAgZmkKQEAgLTgxMjUsNyArODEyNiw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMy
ZjQ2MzdkMCAxMDA3NTUKICAKICAKICAKLUBAIC03MTk4LDYgKzc0NjAsNjIgQEAgdGVzdCAteiAi
JEFSX0ZMQUdTIiAmYW1wOyZhbXA7IEFSX0ZMQUdTPWNydQorQEAgLTcyMDYsNiArNzQ2OCw2MiBA
QCB0ZXN0IC16ICIkQVJfRkxBR1MiICZhbXA7JmFtcDsgQVJfRkxBR1M9Y3J1CiAgCiAgCiAgCkBA
IC04MTg4LDcgKzgxODksNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1
CiAgCiAgCiAgaWYgdGVzdCAtbiAiJGFjX3Rvb2xfcHJlZml4IjsgdGhlbgotQEAgLTc1MzQsOCAr
Nzg1Miw4IEBAIGVzYWMKK0BAIC03NTQyLDggKzc4NjAsOCBAQCBlc2FjCiAgbHRfY3Zfc3lzX2ds
b2JhbF9zeW1ib2xfdG9fY2RlY2w9InNlZCAtbiAtZSAncy9eVCAuKiBcKC4qXCkkL2V4dGVybiBp
bnQgXDEoKTsvcCcgLWUgJ3MvXiRzeW1jb2RlKiAuKiBcKC4qXCkkL2V4dGVybiBjaGFyIFwxOy9w
JyIKICAKICAjIFRyYW5zZm9ybSBhbiBleHRyYWN0ZWQgc3ltYm9sIGxpbmUgaW50byBzeW1ib2wg
bmFtZSBhbmQgc3ltYm9sIGFkZHJlc3MKQEAgLTgxOTksNyArODIwMCw3IEBAIGluZGV4IDgxMTEz
NGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAKICAjIEhhbmRsZSBDUkxGIGluIG1pbmd3IHRv
b2wgY2hhaW4KICBvcHRfY3I9Ci1AQCAtNzU3MSw2ICs3ODg5LDcgQEAgZm9yIGFjX3N5bXByZngg
aW4gIiIgIl8iOyBkbworQEAgLTc1NzksNiArNzg5Nyw3IEBAIGZvciBhY19zeW1wcmZ4IGluICIi
ICJfIjsgZG8KICAgIGVsc2UKICAgICAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZT0ic2Vk
IC1uIC1lICdzL14uKlsJIF1cKCRzeW1jb2RlJHN5bWNvZGUqXClbCSBdWwkgXSokYWNfc3ltcHJm
eCRzeW1wYXQkb3B0X2NyJC8kc3lteGZybS9wJyIKICAgIGZpCkBAIC04MjA3LDcgKzgyMDgsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgICAjIENoZWNrIHRv
IHNlZSB0aGF0IHRoZSBwaXBlIHdvcmtzIGNvcnJlY3RseS4KICAgIHBpcGVfd29ya3M9bm8KLUBA
IC03NjEyLDYgKzc5MzEsMTggQEAgX0xUX0VPRgorQEAgLTc2MjAsNiArNzkzOSwxOCBAQCBfTFRf
RU9GCiAgICAgICAgaWYgJEdSRVAgJyBubV90ZXN0X3ZhciQnICIkbmxpc3QiICZndDsvZGV2L251
bGw7IHRoZW4KICAJaWYgJEdSRVAgJyBubV90ZXN0X2Z1bmMkJyAiJG5saXN0IiAmZ3Q7L2Rldi9u
dWxsOyB0aGVuCiAgCSAgY2F0ICZsdDsmbHQ7X0xUX0VPRiAmZ3Q7IGNvbmZ0ZXN0LiRhY19leHQK
QEAgLTgyMjYsNyArODIyNyw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3
NTUKICAjaWZkZWYgX19jcGx1c3BsdXMKICBleHRlcm4gIkMiIHsKICAjZW5kaWYKLUBAIC03NjIz
LDcgKzc5NTQsNyBAQCBfTFRfRU9GCitAQCAtNzYzMSw3ICs3OTYyLDcgQEAgX0xUX0VPRgogIAkg
IGNhdCAmbHQ7Jmx0O19MVF9FT0YgJmd0OyZndDsgY29uZnRlc3QuJGFjX2V4dAogIAogIC8qIFRo
ZSBtYXBwaW5nIGJldHdlZW4gc3ltYm9sIG5hbWVzIGFuZCBzeW1ib2xzLiAgKi8KQEAgLTgyMzUs
NyArODIzNiw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgIGNv
bnN0IGNoYXIgKm5hbWU7CiAgICB2b2lkICAgICAgICphZGRyZXNzOwogIH0KLUBAIC03NjQ5LDgg
Kzc5ODAsOCBAQCBzdGF0aWMgY29uc3Qgdm9pZCAqbHRfcHJlbG9hZGVkX3NldHVwKCkgeworQEAg
LTc2NTcsOCArNzk4OCw4IEBAIHN0YXRpYyBjb25zdCB2b2lkICpsdF9wcmVsb2FkZWRfc2V0dXAo
KSB7CiAgX0xUX0VPRgogIAkgICMgTm93IHRyeSBsaW5raW5nIHRoZSB0d28gZmlsZXMuCiAgCSAg
bXYgY29uZnRlc3QuJGFjX29iamV4dCBjb25mdHN0bS4kYWNfb2JqZXh0CkBAIC04MjQ2LDcgKzgy
NDcsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCSAgTElCUz0i
Y29uZnRzdG0uJGFjX29iamV4dCIKICAJICBDRkxBR1M9IiRDRkxBR1MkbHRfcHJvZ19jb21waWxl
cl9ub19idWlsdGluX2ZsYWciCiAgCSAgaWYgeyB7IGV2YWwgZWNobyAiXCJcJGFzX21lXCI6JHth
c19saW5lbm8tJExJTkVOT306IFwiJGFjX2xpbmtcIiI7IH0gJmd0OyZhbXA7NQotQEAgLTc2NjAs
OCArNzk5MSw4IEBAIF9MVF9FT0YKK0BAIC03NjY4LDggKzc5OTksOCBAQCBfTFRfRU9GCiAgICB0
ZXN0ICRhY19zdGF0dXMgPSAwOyB9ICZhbXA7JmFtcDsgdGVzdCAtcyBjb25mdGVzdCR7YWNfZXhl
ZXh0fTsgdGhlbgogIAkgICAgcGlwZV93b3Jrcz15ZXMKICAJICBmaQpAQCAtODI1Nyw3ICs4MjU4
LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAllbHNlCiAgCSAg
ZWNobyAiY2Fubm90IGZpbmQgbm1fdGVzdF9mdW5jIGluICRubGlzdCIgJmd0OyZhbXA7NQogIAlm
aQotQEAgLTc2OTgsNiArODAyOSwxOSBAQCBlbHNlCitAQCAtNzcwNiw2ICs4MDM3LDE5IEBAIGVs
c2UKICAkYXNfZWNobyAib2siICZndDsmYW1wOzY7IH0KICBmaQogIApAQCAtODI3Nyw3ICs4Mjc4
LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAogIAogIAotQEAg
LTc3MTQsNiArODA1OCw0MiBAQCBmaQorQEAgLTc3MjIsNiArODA2Niw0MiBAQCBmaQogIAogIAog
IApAQCAtODMyMCw3ICs4MzIxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEw
MDc1NQogIAogIAogIAotQEAgLTc5MjUsNiArODMwNSwxMjMgQEAgZXNhYworQEAgLTc5MzMsNiAr
ODMxMywxMjMgQEAgZXNhYwogIAogIG5lZWRfbG9ja3M9IiRlbmFibGVfbGlidG9vbF9sb2NrIgog
IApAQCAtODQ0NCw3ICs4NDQ1LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEw
MDc1NQogIAogICAgY2FzZSAkaG9zdF9vcyBpbgogICAgICByaGFwc29keSogfCBkYXJ3aW4qKQot
QEAgLTg0ODgsNiArODk4NSw4IEBAIF9MVF9FT0YKK0BAIC04NDk2LDYgKzg5OTMsOCBAQCBfTFRf
RU9GCiAgICAgICAgJExUQ0MgJExUQ0ZMQUdTIC1jIC1vIGNvbmZ0ZXN0Lm8gY29uZnRlc3QuYyAy
Jmd0OyZhbXA7NQogICAgICAgIGVjaG8gIiRBUiBjcnUgbGliY29uZnRlc3QuYSBjb25mdGVzdC5v
IiAmZ3Q7JmFtcDs1CiAgICAgICAgJEFSIGNydSBsaWJjb25mdGVzdC5hIGNvbmZ0ZXN0Lm8gMiZn
dDsmYW1wOzUKQEAgLTg0NTMsNyArODQ1NCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMCAxMDA3NTUKICAgICAgICBjYXQgJmd0OyBjb25mdGVzdC5jICZsdDsmbHQ7IF9MVF9FT0YK
ICBpbnQgbWFpbigpIHsgcmV0dXJuIDA7fQogIF9MVF9FT0YKLUBAIC04NTU2LDYgKzkwNTUsMTYg
QEAgZG9uZQorQEAgLTg1NjQsNiArOTA2MywxNiBAQCBkb25lCiAgCiAgCiAgCkBAIC04NDcwLDcg
Kzg0NzEsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgCiAg
IyBTZXQgb3B0aW9ucwotQEAgLTg2ODQsNyArOTE5Myw4IEBAIGZpCitAQCAtODY5Miw3ICs5MjAx
LDggQEAgZmkKICBMSUJUT09MX0RFUFM9IiRsdG1haW48YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86I0Fsd2F5c3VzZW91cm93bmxpYnRvb2wuQEAtODQ4MCw3Kzg0
ODEsN0BAaW5kZXg4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTUtQEAtODc3Myw3KzkyODMs
N0BAYWl4MyopK0BALTg3ODEsNys5MjkxLDdAQGFpeDMqKWVzYWMjR2xvYmFsdmFyaWFibGVzOkBA
LTg0ODksNys4NDkwLDdAQGluZGV4ODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwMTAwNzU1Y2FuX2J1
aWxkX3NoYXJlZD15ZXMjQWxsa25vd25saW5rZXJzcmVxdWlyZWFgLmEnYXJjaGl2ZWZvcnN0YXRp
Y2xpbmtpbmcoZXhjZXB0TVNWQywtQEAtOTA3MSw4Kzk1ODEsNkBAZmkrQEAtOTA3OSw4Kzk1ODks
NkBAZmlsdF9wcm9nX2NvbXBpbGVyX3BpYz1sdF9wcm9nX2NvbXBpbGVyX3N0YXRpYz1AQC04NDk4
LDcrODQ5OSw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NWlmdGVzdCI+Igog
IAogICMgQWx3YXlzIHVzZSBvdXIgb3duIGxpYnRvb2wuCkBAIC04NDgwLDcgKzg0ODEsNyBAQCBp
bmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgCiAgCi1AQCAtODc3Myw3
ICs5MjgzLDcgQEAgYWl4MyopCitAQCAtODc4MSw3ICs5MjkxLDcgQEAgYWl4MyopCiAgZXNhYwog
IAogICMgR2xvYmFsIHZhcmlhYmxlczoKQEAgLTg0ODksNyArODQ5MCw3IEBAIGluZGV4IDgxMTEz
NGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICBjYW5fYnVpbGRfc2hhcmVkPXllcwogIAogICMg
QWxsIGtub3duIGxpbmtlcnMgcmVxdWlyZSBhIGAuYScgYXJjaGl2ZSBmb3Igc3RhdGljIGxpbmtp
bmcgKGV4Y2VwdCBNU1ZDLAotQEAgLTkwNzEsOCArOTU4MSw2IEBAIGZpCitAQCAtOTA3OSw4ICs5
NTg5LDYgQEAgZmkKICBsdF9wcm9nX2NvbXBpbGVyX3BpYz0KICBsdF9wcm9nX2NvbXBpbGVyX3N0
YXRpYz0KICAKQEAgLTg0OTgsNyArODQ5OSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMCAxMDA3NTUKICAKICAgIGlmIHRlc3QgIjwvYT4kR0NDIiA9IHllczsgdGhlbgogICAgICBs
dF9wcm9nX2NvbXBpbGVyX3dsPSctV2wsJwotQEAgLTkyMzgsNiArOTc0NiwxMiBAQCAkYXNfZWNo
b19uICJjaGVja2luZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBwcm9kdWNlIFBJQy4uLiAiICZn
dDsmYW1wOzY7IH0KK0BAIC05MjQ2LDYgKzk3NTQsMTIgQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcg
Zm9yICRjb21waWxlciBvcHRpb24gdG8gcHJvZHVjZSBQSUMuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAg
CWx0X3Byb2dfY29tcGlsZXJfcGljPSctLXNoYXJlZCcKICAJbHRfcHJvZ19jb21waWxlcl9zdGF0
aWM9Jy0tc3RhdGljJwogIAk7OwpAQCAtODUxMSw3ICs4NTEyLDcgQEAgaW5kZXggODExMTM0YTUw
M2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogICAgICAgIHBnY2MqIHwgcGdmNzcqIHwgcGdmOTAqIHwg
cGdmOTUqIHwgcGdmb3J0cmFuKikKICAgICAgICAgICMgUG9ydGxhbmQgR3JvdXAgY29tcGlsZXJz
ICgqbm90KiB0aGUgUGVudGl1bSBnY2MgY29tcGlsZXIsCiAgCSMgd2hpY2ggbG9va3MgdG8gYmUg
YSBkZWFkIHByb2plY3QpCi1AQCAtOTMwMCw3ICs5ODE0LDcgQEAgJGFzX2VjaG9fbiAiY2hlY2tp
bmcgZm9yICRjb21waWxlciBvcHRpb24gdG8gcHJvZHVjZSBQSUMuLi4gIiAmZ3Q7JmFtcDs2OyB9
CitAQCAtOTMwOCw3ICs5ODIyLDcgQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRjb21waWxl
ciBvcHRpb24gdG8gcHJvZHVjZSBQSUMuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAgICAgICAgbHRfcHJv
Z19jb21waWxlcl9waWM9Jy1LUElDJwogICAgICAgIGx0X3Byb2dfY29tcGlsZXJfc3RhdGljPSct
QnN0YXRpYycKICAgICAgICBjYXNlICRjY19iYXNlbmFtZSBpbgpAQCAtODUyMCw3ICs4NTIxLDcg
QEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAlsdF9wcm9nX2NvbXBp
bGVyX3dsPSctUW9wdGlvbiBsZCAnOzsKICAgICAgICAqKQogIAlsdF9wcm9nX2NvbXBpbGVyX3ds
PSctV2wsJzs7Ci1AQCAtOTM1NywxMyArOTg3MSwxNyBAQCBjYXNlICRob3N0X29zIGluCitAQCAt
OTM2NSwxMyArOTg3OSwxNyBAQCBjYXNlICRob3N0X29zIGluCiAgICAgIGx0X3Byb2dfY29tcGls
ZXJfcGljPSIkbHRfcHJvZ19jb21waWxlcl9waWMgLURQSUMiCiAgICAgIDs7CiAgZXNhYwpAQCAt
ODU0NCw3ICs4NTQ1LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQog
IAogICMKICAjIENoZWNrIHRvIG1ha2Ugc3VyZSB0aGUgUElDIGZsYWcgYWN0dWFsbHkgd29ya3Mu
Ci1AQCAtOTQyNCw2ICs5OTQyLDExIEBAIGZpCitAQCAtOTQzMiw2ICs5OTUwLDExIEBAIGZpCiAg
CiAgCiAgCkBAIC04NTU2LDcgKzg1NTcsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3
ZDAgMTAwNzU1CiAgIwogICMgQ2hlY2sgdG8gbWFrZSBzdXJlIHRoZSBzdGF0aWMgZmxhZyBhY3R1
YWxseSB3b3Jrcy4KICAjCi1AQCAtOTc3NCw3ICsxMDI5Nyw4IEBAIF9MVF9FT0YKK0BAIC05Nzgy
LDcgKzEwMzA1LDggQEAgX0xUX0VPRgogICAgICAgIGFsbG93X3VuZGVmaW5lZF9mbGFnPXVuc3Vw
cG9ydGVkCiAgICAgICAgYWx3YXlzX2V4cG9ydF9zeW1ib2xzPW5vCiAgICAgICAgZW5hYmxlX3No
YXJlZF93aXRoX3N0YXRpY19ydW50aW1lcz15ZXMKQEAgLTg1NjYsNyArODU2Nyw3IEBAIGluZGV4
IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAKICAgICAgICBpZiAkTEQgLS1oZWxw
IDImZ3Q7JmFtcDsxIHwgJEdSRVAgJ2F1dG8taW1wb3J0JyAmZ3Q7IC9kZXYvbnVsbDsgdGhlbgog
ICAgICAgICAgYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCAkbGlib2JqcyAkZGVwbGlicyAkY29t
cGlsZXJfZmxhZ3MgLW8gJG91dHB1dF9vYmpkaXIvJHNvbmFtZSAke3dsfS0tZW5hYmxlLWF1dG8t
aW1hZ2UtYmFzZSAtWGxpbmtlciAtLW91dC1pbXBsaWIgLVhsaW5rZXIgJGxpYicKLUBAIC05ODcz
LDEyICsxMDM5NywxMiBAQCBfTFRfRU9GCitAQCAtOTg4MSwxMiArMTA0MDUsMTIgQEAgX0xUX0VP
RgogIAkgIHdob2xlX2FyY2hpdmVfZmxhZ19zcGVjPSctLXdob2xlLWFyY2hpdmUkY29udmVuaWVu
Y2UgLS1uby13aG9sZS1hcmNoaXZlJwogIAkgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9CiAg
CSAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlY19sZD0nLXJwYXRoICRsaWJkaXInCkBAIC04NTgx
LDcgKzg1ODIsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCSAg
ZmkKICAJICA7OwogIAllc2FjCi1AQCAtOTg5Miw4ICsxMDQxNiw4IEBAIF9MVF9FT0YKK0BAIC05
OTAwLDggKzEwNDI0LDggQEAgX0xUX0VPRgogIAlhcmNoaXZlX2NtZHM9JyRMRCAtQnNoYXJlYWJs
ZSAkbGlib2JqcyAkZGVwbGlicyAkbGlua2VyX2ZsYWdzIC1vICRsaWInCiAgCXdsYXJjPQogICAg
ICAgIGVsc2UKQEAgLTg1OTIsNyArODU5Myw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMCAxMDA3NTUKICAgICAgICBmaQogICAgICAgIDs7CiAgCi1AQCAtOTkxMSw4ICsxMDQzNSw4
IEBAIF9MVF9FT0YKK0BAIC05OTE5LDggKzEwNDQzLDggQEAgX0xUX0VPRgogIAogIF9MVF9FT0YK
ICAgICAgICBlbGlmICRMRCAtLWhlbHAgMiZndDsmYW1wOzEgfCAkR1JFUCAnOiBzdXBwb3J0ZWQg
dGFyZ2V0czouKiBlbGYnICZndDsgL2Rldi9udWxsOyB0aGVuCkBAIC04NjAzLDcgKzg2MDQsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICAgICAgZWxzZQogIAls
ZF9zaGxpYnM9bm8KICAgICAgICBmaQotQEAgLTk5NTgsOCArMTA0ODIsOCBAQCBfTFRfRU9GCitA
QCAtOTk2Niw4ICsxMDQ5MCw4IEBAIF9MVF9FT0YKICAKICAgICAgKikKICAgICAgICBpZiAkTEQg
LS1oZWxwIDImZ3Q7JmFtcDsxIHwgJEdSRVAgJzogc3VwcG9ydGVkIHRhcmdldHM6LiogZWxmJyAm
Z3Q7IC9kZXYvbnVsbDsgdGhlbgpAQCAtODYxNCw3ICs4NjE1LDcgQEAgaW5kZXggODExMTM0YTUw
M2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogICAgICAgIGVsc2UKICAJbGRfc2hsaWJzPW5vCiAgICAg
ICAgZmkKLUBAIC0xMDA4OSw3ICsxMDYxMywxMyBAQCBfTFRfRU9GCitAQCAtMTAwOTcsNyArMTA2
MjEsMTMgQEAgX0xUX0VPRgogIAlhbGxvd191bmRlZmluZWRfZmxhZz0nLWJlcm9rJwogICAgICAg
ICAgIyBEZXRlcm1pbmUgdGhlIGRlZmF1bHQgbGlicGF0aCBmcm9tIHRoZSB2YWx1ZSBlbmNvZGVk
IGluIGFuCiAgICAgICAgICAjIGVtcHR5IGV4ZWN1dGFibGUuCkBAIC04NjI5LDcgKzg2MzAsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgLyogZW5kIGNvbmZkZWZz
LmguICAqLwogIAogIGludAotQEAgLTEwMTAyLDIyICsxMDYzMiwyOSBAQCBtYWluICgpCitAQCAt
MTAxMTAsMjIgKzEwNjQwLDI5IEBAIG1haW4gKCkKICBfQUNFT0YKICBpZiBhY19mbl9jX3RyeV9s
aW5rICIkTElORU5PIjsgdGhlbiA6CiAgCkBAIC04NjcyLDcgKzg2NzMsNyBAQCBpbmRleCA4MTEx
MzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgICAgICAgICBoYXJkY29kZV9saWJkaXJf
ZmxhZ19zcGVjPScke3dsfS1ibGlicGF0aDokbGliZGlyOiciJGFpeF9saWJwYXRoIgogICAgICAg
ICAgYXJjaGl2ZV9leHBzeW1fY21kcz0nJENDIC1vICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxp
Ym9ianMgJGRlcGxpYnMgJyJcJHt3bH0kbm9fZW50cnlfZmxhZyInICRjb21waWxlcl9mbGFncyBg
aWYgdGVzdCAieCR7YWxsb3dfdW5kZWZpbmVkX2ZsYWd9IiAhPSAieCI7IHRoZW4gZnVuY19lY2hv
X2FsbCAiJHt3bH0ke2FsbG93X3VuZGVmaW5lZF9mbGFnfSI7IGVsc2UgOjsgZmlgICciXCR7d2x9
JGV4cF9zeW1fZmxhZzpcJGV4cG9ydF9zeW1ib2xzICRzaGFyZWRfZmxhZyIKLUBAIC0xMDEyOSw3
ICsxMDY2NiwxMyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRo
PSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC0xMDEzNyw3ICsxMDY3NCwxMyBAQCBpZiB0ZXN0IC16
ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAJ
ZWxzZQogIAkgIyBEZXRlcm1pbmUgdGhlIGRlZmF1bHQgbGlicGF0aCBmcm9tIHRoZSB2YWx1ZSBl
bmNvZGVkIGluIGFuCiAgCSAjIGVtcHR5IGV4ZWN1dGFibGUuCkBAIC04Njg3LDcgKzg2ODgsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgLyogZW5kIGNvbmZkZWZz
LmguICAqLwogIAogIGludAotQEAgLTEwMTQyLDIyICsxMDY4NSwyOSBAQCBtYWluICgpCitAQCAt
MTAxNTAsMjIgKzEwNjkzLDI5IEBAIG1haW4gKCkKICBfQUNFT0YKICBpZiBhY19mbl9jX3RyeV9s
aW5rICIkTElORU5PIjsgdGhlbiA6CiAgCkBAIC04NzMwLDcgKzg3MzEsNyBAQCBpbmRleCA4MTEx
MzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgCSBoYXJkY29kZV9saWJkaXJfZmxhZ19z
cGVjPScke3dsfS1ibGlicGF0aDokbGliZGlyOiciJGFpeF9saWJwYXRoIgogIAkgICMgV2Fybmlu
ZyAtIHdpdGhvdXQgdXNpbmcgdGhlIG90aGVyIHJ1biB0aW1lIGxvYWRpbmcgZmxhZ3MsCi1AQCAt
MTAyMDEsMjEgKzEwNzUxLDY0IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4
X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTEwMjA5LDIxICsxMDc1OSw2NCBAQCBp
ZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGli
IjsgZmkKICAgICAgICAjIFdoZW4gbm90IHVzaW5nIGdjYywgd2UgY3VycmVudGx5IGFzc3VtZSB0
aGF0IHdlIGFyZSB1c2luZwogICAgICAgICMgTWljcm9zb2Z0IFZpc3VhbCBDKysuCiAgICAgICAg
IyBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjIGlzIGFjdHVhbGx5IG1lYW5pbmdsZXNzLCBhcyB0
aGVyZSBpcwpAQCAtODgxMCw3ICs4ODExLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYz
N2QwIDEwMDc1NQogICAgICAgIDs7CiAgCiAgICAgIGRhcndpbiogfCByaGFwc29keSopCi1AQCAt
MTAyNzYsNyArMTA4NjksNyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9s
aWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC0xMDI4NCw3ICsxMDg3Nyw3IEBAIGlmIHRl
c3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBm
aQogIAogICAgICAjIEZyZWVCU0QgMyBhbmQgZ3JlYXRlciB1c2VzIGdjYyAtc2hhcmVkIHRvIGRv
IHNoYXJlZCBsaWJyYXJpZXMuCiAgICAgIGZyZWVic2QqIHwgZHJhZ29uZmx5KikKQEAgLTg4MTks
NyArODgyMCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICAg
ICBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjPSctUiRsaWJkaXInCiAgICAgICAgaGFyZGNvZGVf
ZGlyZWN0PXllcwogICAgICAgIGhhcmRjb2RlX3NobGlicGF0aF92YXI9bm8KLUBAIC0xMDI4NCw3
ICsxMDg3Nyw3IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9
Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTEwMjkyLDcgKzEwODg1LDcgQEAgaWYgdGVzdCAteiAi
JGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCiAgCiAg
ICAgIGhwdXg5KikKICAgICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllczsgdGhlbgpAQCAtODgyOCw3
ICs4ODI5LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogICAgICAg
IGVsc2UKICAJYXJjaGl2ZV9jbWRzPSckUk0gJG91dHB1dF9vYmpkaXIvJHNvbmFtZX4kTEQgLWIg
K2IgJGluc3RhbGxfbGliZGlyIC1vICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxpYm9ianMgJGRl
cGxpYnMgJGxpbmtlcl9mbGFnc350ZXN0ICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgPSAkbGliIHx8
IG12ICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxpYicKICAgICAgICBmaQotQEAgLTEwMzAwLDcg
KzEwODkzLDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0i
L3Vzci9saWI6L2xpYiI7IGZpCitAQCAtMTAzMDgsNyArMTA5MDEsNyBAQCBpZiB0ZXN0IC16ICIk
YWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAKICAg
ICAgaHB1eDEwKikKICAgICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllcyAmYW1wOyZhbXA7IHRlc3Qg
IiR3aXRoX2dudV9sZCIgPSBubzsgdGhlbgpAQCAtODgzNyw3ICs4ODM4LDcgQEAgaW5kZXggODEx
MTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogICAgICAgIGVsc2UKICAJYXJjaGl2ZV9jbWRz
PSckTEQgLWIgK2ggJHNvbmFtZSArYiAkaW5zdGFsbF9saWJkaXIgLW8gJGxpYiAkbGlib2JqcyAk
ZGVwbGlicyAkbGlua2VyX2ZsYWdzJwogICAgICAgIGZpCi1AQCAtMTAzMjQsMTAgKzEwOTE3LDEw
IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGli
Oi9saWIiOyBmaQorQEAgLTEwMzMyLDEwICsxMDkyNSwxMCBAQCBpZiB0ZXN0IC16ICIkYWl4X2xp
YnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAJICBhcmNoaXZl
X2NtZHM9JyRDQyAtc2hhcmVkICR7d2x9K2ggJHt3bH0kc29uYW1lIC1vICRsaWIgJGxpYm9ianMg
JGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzJwogIAkgIDs7CiAgCWlhNjQqKQpAQCAtODg1MCw3ICs4
ODUxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAkgIDs7CiAg
CWVzYWMKICAgICAgICBlbHNlCi1AQCAtMTA0MDYsMjMgKzEwOTk5LDM2IEBAIGZpCitAQCAtMTA0
MTQsMjMgKzExMDA3LDM2IEBAIGZpCiAgCiAgICAgIGlyaXg1KiB8IGlyaXg2KiB8IG5vbnN0b3B1
eCopCiAgICAgICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4KQEAgLTg4OTUsNyArODg5Niw3
IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICAgICBlbHNlCiAg
CWFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2Zs
YWdzIC1zb25hbWUgJHNvbmFtZSBgdGVzdCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1wOyBmdW5j
X2VjaG9fYWxsICItc2V0X3ZlcnNpb24gJHZlcnN0cmluZyJgIC11cGRhdGVfcmVnaXN0cnkgJHtv
dXRwdXRfb2JqZGlyfS9zb19sb2NhdGlvbnMgLW8gJGxpYicKICAJYXJjaGl2ZV9leHBzeW1fY21k
cz0nJENDIC1zaGFyZWQgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzIC1zb25hbWUg
JHNvbmFtZSBgdGVzdCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1wOyBmdW5jX2VjaG9fYWxsICIt
c2V0X3ZlcnNpb24gJHZlcnN0cmluZyJgIC11cGRhdGVfcmVnaXN0cnkgJHtvdXRwdXRfb2JqZGly
fS9zb19sb2NhdGlvbnMgLWV4cG9ydHNfZmlsZSAkZXhwb3J0X3N5bWJvbHMgLW8gJGxpYicKLUBA
IC0xMDUwNyw3ICsxMTExMyw3IEBAIHJtIC1mIGNvcmUgY29uZnRlc3QuZXJyIGNvbmZ0ZXN0LiRh
Y19vYmpleHQgXAorQEAgLTEwNTE1LDcgKzExMTIxLDcgQEAgcm0gLWYgY29yZSBjb25mdGVzdC5l
cnIgY29uZnRlc3QuJGFjX29iamV4dCBcCiAgICAgIG9zZjQqIHwgb3NmNSopCSMgYXMgb3NmMyog
d2l0aCB0aGUgYWRkaXRpb24gb2YgLW1zeW0gZmxhZwogICAgICAgIGlmIHRlc3QgIiRHQ0MiID0g
eWVzOyB0aGVuCiAgCWFsbG93X3VuZGVmaW5lZF9mbGFnPScgJHt3bH0tZXhwZWN0X3VucmVzb2x2
ZWQgJHt3bH1cKicKQEAgLTg5MDQsNyArODkwNSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMy
ZjQ2MzdkMCAxMDA3NTUKICAJaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0nJHt3bH0tcnBhdGgg
JHt3bH0kbGliZGlyJwogICAgICAgIGVsc2UKICAJYWxsb3dfdW5kZWZpbmVkX2ZsYWc9JyAtZXhw
ZWN0X3VucmVzb2x2ZWQgXConCi1AQCAtMTA1MjYsOSArMTExMzIsOSBAQCBybSAtZiBjb3JlIGNv
bmZ0ZXN0LmVyciBjb25mdGVzdC4kYWNfb2JqZXh0IFwKK0BAIC0xMDUzNCw5ICsxMTE0MCw5IEBA
IHJtIC1mIGNvcmUgY29uZnRlc3QuZXJyIGNvbmZ0ZXN0LiRhY19vYmpleHQgXAogICAgICAgIG5v
X3VuZGVmaW5lZF9mbGFnPScgLXogZGVmcycKICAgICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllczsg
dGhlbgogIAl3bGFyYz0nJHt3bH0nCkBAIC04OTE2LDcgKzg5MTcsNyBAQCBpbmRleCA4MTExMzRh
NTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICAgICAgZWxzZQogIAljYXNlIGAkQ0MgLVYgMiZn
dDsmYW1wOzFgIGluCiAgCSoiQ29tcGlsZXJzIDUuMCIqKQotQEAgLTExMTA0LDggKzExNzEwLDkg
QEAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2MqKQorQEAgLTExMTEyLDggKzExNzE4
LDkgQEAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2MqKQogICAgbmVlZF92ZXJzaW9u
PW5vCiAgICBuZWVkX2xpYl9wcmVmaXg9bm8KICAKQEAgLTg5MjgsNyArODkyOSw3IEBAIGluZGV4
IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICAgbGlicmFyeV9uYW1lc19zcGVj
PSckbGlibmFtZS5kbGwuYScKICAgICAgIyBETEwgaXMgaW5zdGFsbGVkIHRvICQobGliZGlyKS8u
Li9iaW4gYnkgcG9zdGluc3RhbGxfY21kcwogICAgICBwb3N0aW5zdGFsbF9jbWRzPSdiYXNlX2Zp
bGU9YGJhc2VuYW1lIFwke2ZpbGV9YH4KLUBAIC0xMTEzOCwxMyArMTE3NDUsNzEgQEAgY3lnd2lu
KiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2MqKQorQEAgLTExMTQ2LDEzICsxMTc1Myw3MSBAQCBj
eWd3aW4qIHwgbWluZ3cqIHwgcHczMiogfCBjZWdjYyopCiAgICAgICAgbGlicmFyeV9uYW1lc19z
cGVjPSdgZWNobyAke2xpYm5hbWV9IHwgc2VkIC1lICdzL15saWIvcHcvJ2BgZWNobyAke3JlbGVh
c2V9IHwgJFNFRCAtZSAncy9bLl0vLS9nJ2Ake3ZlcnN1ZmZpeH0ke3NoYXJlZF9leHR9JwogICAg
ICAgIDs7CiAgICAgIGVzYWMKQEAgLTkwMDEsNyArOTAwMiw3IEBAIGluZGV4IDgxMTEzNGE1MDNi
Li5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICMgRklYTUU6IGZpcnN0IHdlIHNob3VsZCBzZWFyY2gg
LiBhbmQgdGhlIGRpcmVjdG9yeSB0aGUgZXhlY3V0YWJsZSBpcyBpbgogICAgc2hsaWJwYXRoX3Zh
cj1QQVRICiAgICA7OwotQEAgLTExMjM2LDcgKzExOTAxLDcgQEAgaGFpa3UqKQorQEAgLTExMjQ0
LDcgKzExOTA5LDcgQEAgaGFpa3UqKQogICAgc29uYW1lX3NwZWM9JyR7bGlibmFtZX0ke3JlbGVh
c2V9JHtzaGFyZWRfZXh0fSRtYWpvcicKICAgIHNobGlicGF0aF92YXI9TElCUkFSWV9QQVRICiAg
ICBzaGxpYnBhdGhfb3ZlcnJpZGVzX3J1bnBhdGg9eWVzCkBAIC05MDEwLDE2ICs5MDExLDE2IEBA
IGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgIGhhcmRjb2RlX2ludG9f
bGlicz15ZXMKICAgIDs7CiAgCi1AQCAtMTIwMzIsNyArMTI2OTcsNyBAQCBlbHNlCitAQCAtMTIw
NDAsNyArMTI3MDUsNyBAQCBlbHNlCiAgICBsdF9kbHVua25vd249MDsgbHRfZGxub191c2NvcmU9
MTsgbHRfZGxuZWVkX3VzY29yZT0yCiAgICBsdF9zdGF0dXM9JGx0X2RsdW5rbm93bgogICAgY2F0
ICZndDsgY29uZnRlc3QuJGFjX2V4dCAmbHQ7Jmx0O19MVF9FT0YKLS0jbGluZSAxMjAzNSAiY29u
ZmlndXJlIgorLSNsaW5lIDEyMDQwICJjb25maWd1cmUiCiArI2xpbmUgJExJTkVOTyAiY29uZmln
dXJlIgogICNpbmNsdWRlICJjb25mZGVmcy5oIgogIAogICNpZiBIQVZFX0RMRkNOX0gKLUBAIC0x
MjA3NiwxMCArMTI3NDEsMTAgQEAgZWxzZQorQEAgLTEyMDg0LDEwICsxMjc0OSwxMCBAQCBlbHNl
CiAgLyogV2hlbiAtZnZpc2JpbGl0eT1oaWRkZW4gaXMgdXNlZCwgYXNzdW1lIHRoZSBjb2RlIGhh
cyBiZWVuIGFubm90YXRlZAogICAgIGNvcnJlc3BvbmRpbmdseSBmb3IgdGhlIHN5bWJvbHMgbmVl
ZGVkLiAgKi8KICAjaWYgZGVmaW5lZChfX0dOVUNfXykgJmFtcDsmYW1wOyAoKChfX0dOVUNfXyA9
PSAzKSAmYW1wOyZhbXA7IChfX0dOVUNfTUlOT1JfXyAmZ3Q7PSAzKSkgfHwgKF9fR05VQ19fICZn
dDsgMykpCkBAIC05MDMyLDE2ICs5MDMzLDE2IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMCAxMDA3NTUKICBpbnQgbWFpbiAoKQogIHsKICAgIHZvaWQgKnNlbGYgPSBkbG9wZW4gKDAs
IExUX0RMR0xPQkFMfExUX0RMTEFaWV9PUl9OT1cpOwotQEAgLTEyMTM4LDcgKzEyODAzLDcgQEAg
ZWxzZQorQEAgLTEyMTQ2LDcgKzEyODExLDcgQEAgZWxzZQogICAgbHRfZGx1bmtub3duPTA7IGx0
X2Rsbm9fdXNjb3JlPTE7IGx0X2RsbmVlZF91c2NvcmU9MgogICAgbHRfc3RhdHVzPSRsdF9kbHVu
a25vd24KICAgIGNhdCAmZ3Q7IGNvbmZ0ZXN0LiRhY19leHQgJmx0OyZsdDtfTFRfRU9GCi0tI2xp
bmUgMTIxNDEgImNvbmZpZ3VyZSIKKy0jbGluZSAxMjE0NiAiY29uZmlndXJlIgogKyNsaW5lICRM
SU5FTk8gImNvbmZpZ3VyZSIKICAjaW5jbHVkZSAiY29uZmRlZnMuaCIKICAKICAjaWYgSEFWRV9E
TEZDTl9ICi1AQCAtMTIxODIsMTAgKzEyODQ3LDEwIEBAIGVsc2UKK0BAIC0xMjE5MCwxMCArMTI4
NTUsMTAgQEAgZWxzZQogIC8qIFdoZW4gLWZ2aXNiaWxpdHk9aGlkZGVuIGlzIHVzZWQsIGFzc3Vt
ZSB0aGUgY29kZSBoYXMgYmVlbiBhbm5vdGF0ZWQKICAgICBjb3JyZXNwb25kaW5nbHkgZm9yIHRo
ZSBzeW1ib2xzIG5lZWRlZC4gICovCiAgI2lmIGRlZmluZWQoX19HTlVDX18pICZhbXA7JmFtcDsg
KCgoX19HTlVDX18gPT0gMykgJmFtcDsmYW1wOyAoX19HTlVDX01JTk9SX18gJmd0Oz0gMykpIHx8
IChfX0dOVUNfXyAmZ3Q7IDMpKQpAQCAtOTA1NCw3ICs5MDU1LDcgQEAgaW5kZXggODExMTM0YTUw
M2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIGludCBtYWluICgpCiAgewogICAgdm9pZCAqc2VsZiA9
IGRsb3BlbiAoMCwgTFRfRExHTE9CQUx8TFRfRExMQVpZX09SX05PVyk7Ci1AQCAtMTI1NzcsNiAr
MTMyNDIsNyBAQCAkUk0gLXIgY29uZnRlc3QqCitAQCAtMTI1ODUsNiArMTMyNTAsNyBAQCAkUk0g
LXIgY29uZnRlc3QqCiAgCiAgICAjIEFsbG93IENDIHRvIGJlIGEgcHJvZ3JhbSBuYW1lIHdpdGgg
YXJndW1lbnRzLgogICAgbHRfc2F2ZV9DQz0kQ0MKQEAgLTkwNjIsNyArOTA2Myw3IEBAIGluZGV4
IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgIGx0X3NhdmVfTEQ9JExECiAgICBs
dF9zYXZlX0dDQz0kR0NDCiAgICBHQ0M9JEdYWAotQEAgLTEyNTk0LDYgKzEzMjYwLDcgQEAgJFJN
IC1yIGNvbmZ0ZXN0KgorQEAgLTEyNjAyLDYgKzEzMjY4LDcgQEAgJFJNIC1yIGNvbmZ0ZXN0Kgog
ICAgZmkKICAgIHRlc3QgLXogIiR7TERDWFgrc2V0fSIgfHwgTEQ9JExEQ1hYCiAgICBDQz0ke0NY
WC0iYysrPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOn1AQC05
MDcwLDcrOTA3MSw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NWNvbXBpbGVy
PSRDQ2NvbXBpbGVyX0NYWD0kQ0Nmb3JjY190ZW1waW4kY29tcGlsZXIiPiJ9CkBAIC05MDcwLDcg
KzkwNzEsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICBjb21w
aWxlcj0kQ0MKICAgIGNvbXBpbGVyX0NYWD0kQ0MKICAgIGZvciBjY190ZW1wIGluICRjb21waWxl
ciI8L2E+IjsgZG8KLUBAIC0xMjg3Niw3ICsxMzU0MywxMyBAQCAkYXNfZWNob19uICJjaGVja2lu
ZyB3aGV0aGVyIHRoZSAkY29tcGlsZXIgbGlua2VyICgkTEQpIHN1cHBvcnRzIHNoYXJlZCBsaWJy
YXJpZQorQEAgLTEyODg0LDcgKzEzNTUxLDEzIEBAICRhc19lY2hvX24gImNoZWNraW5nIHdoZXRo
ZXIgdGhlICRjb21waWxlciBsaW5rZXIgKCRMRCkgc3VwcG9ydHMgc2hhcmVkIGxpYnJhcmllCiAg
ICAgICAgICAgIGFsbG93X3VuZGVmaW5lZF9mbGFnX0NYWD0nLWJlcm9rJwogICAgICAgICAgICAj
IERldGVybWluZSB0aGUgZGVmYXVsdCBsaWJwYXRoIGZyb20gdGhlIHZhbHVlIGVuY29kZWQgaW4g
YW4gZW1wdHkKICAgICAgICAgICAgIyBleGVjdXRhYmxlLgpAQCAtOTA4NSw3ICs5MDg2LDcgQEAg
aW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIC8qIGVuZCBjb25mZGVmcy5o
LiAgKi8KICAKICBpbnQKLUBAIC0xMjg4OSwyMiArMTM1NjIsMjkgQEAgbWFpbiAoKQorQEAgLTEy
ODk3LDIyICsxMzU3MCwyOSBAQCBtYWluICgpCiAgX0FDRU9GCiAgaWYgYWNfZm5fY3h4X3RyeV9s
aW5rICIkTElORU5PIjsgdGhlbiA6CiAgCkBAIC05MTI4LDcgKzkxMjksNyBAQCBpbmRleCA4MTEx
MzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgICAgICAgICAgIGhhcmRjb2RlX2xpYmRp
cl9mbGFnX3NwZWNfQ1hYPScke3dsfS1ibGlicGF0aDokbGliZGlyOiciJGFpeF9saWJwYXRoIgog
IAotQEAgLTEyOTE3LDcgKzEzNTk3LDEzIEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRo
ZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTEyOTI1LDcgKzEzNjA1LDEz
IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGli
Oi9saWIiOyBmaQogICAgICAgICAgICBlbHNlCiAgCSAgICAjIERldGVybWluZSB0aGUgZGVmYXVs
dCBsaWJwYXRoIGZyb20gdGhlIHZhbHVlIGVuY29kZWQgaW4gYW4KICAJICAgICMgZW1wdHkgZXhl
Y3V0YWJsZS4KQEAgLTkxNDMsNyArOTE0NCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMCAxMDA3NTUKICAvKiBlbmQgY29uZmRlZnMuaC4gICovCiAgCiAgaW50Ci1AQCAtMTI5MzAs
MjIgKzEzNjE2LDI5IEBAIG1haW4gKCkKK0BAIC0xMjkzOCwyMiArMTM2MjQsMjkgQEAgbWFpbiAo
KQogIF9BQ0VPRgogIGlmIGFjX2ZuX2N4eF90cnlfbGluayAiJExJTkVOTyI7IHRoZW4gOgogIApA
QCAtOTE4Niw3ICs5MTg3LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1
NQogIAogIAkgICAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlY19DWFg9JyR7d2x9LWJsaWJwYXRo
OiRsaWJkaXI6JyIkYWl4X2xpYnBhdGgiCiAgCSAgICAjIFdhcm5pbmcgLSB3aXRob3V0IHVzaW5n
IHRoZSBvdGhlciBydW4gdGltZSBsb2FkaW5nIGZsYWdzLAotQEAgLTEyOTg4LDI5ICsxMzY4MSw3
NSBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xp
YjovbGliIjsgZmkKK0BAIC0xMjk5NiwyOSArMTM2ODksNzUgQEAgaWYgdGVzdCAteiAiJGFpeF9s
aWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCiAgICAgICAgICA7
OwogIAogICAgICAgIGN5Z3dpbiogfCBtaW5ndyogfCBwdzMyKiB8IGNlZ2NjKikKQEAgLTkyODUs
NyArOTI4Niw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICAg
ICBkYXJ3aW4qIHwgcmhhcHNvZHkqKQogIAogIAotQEAgLTEzMTE2LDcgKzEzODU1LDcgQEAgaWYg
dGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7
IGZpCitAQCAtMTMxMjQsNyArMTM4NjMsNyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0
aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAgICAgICAgICAgICA7OwogICAg
ICAgICAgICAqKQogICAgICAgICAgICAgIGlmIHRlc3QgIiRHWFgiID0geWVzOyB0aGVuCkBAIC05
Mjk0LDcgKzkyOTUsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAg
ICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgIyBGSVhNRTogaW5zZXJ0IHByb3BlciBD
KysgbGlicmFyeSBzdXBwb3J0CiAgICAgICAgICAgICAgICBsZF9zaGxpYnNfQ1hYPW5vCi1AQCAt
MTMxODcsMTAgKzEzOTI2LDEwIEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4
X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTEzMTk1LDEwICsxMzkzNCwxMCBAQCBp
ZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGli
IjsgZmkKICAJICAgICAgICAgICAgYXJjaGl2ZV9jbWRzX0NYWD0nJENDIC1zaGFyZWQgLW5vc3Rk
bGliIC1mUElDICR7d2x9K2ggJHt3bH0kc29uYW1lIC1vICRsaWIgJHByZWRlcF9vYmplY3RzICRs
aWJvYmpzICRkZXBsaWJzICRwb3N0ZGVwX29iamVjdHMgJGNvbXBpbGVyX2ZsYWdzJwogIAkgICAg
ICAgICAgICA7OwogIAkgICAgICAgICAgaWE2NCopCkBAIC05MzA3LDcgKzkzMDgsNyBAQCBpbmRl
eCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCSAgICAgICAgICAgIDs7CiAgCSAg
ICAgICAgZXNhYwogIAkgICAgICBmaQotQEAgLTEzMjMxLDkgKzEzOTcwLDkgQEAgaWYgdGVzdCAt
eiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCitA
QCAtMTMyMzksOSArMTM5NzgsOSBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFp
eF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAgICAgICAgICAgKikKICAJICAgIGlmIHRl
c3QgIiRHWFgiID0geWVzOyB0aGVuCiAgCSAgICAgIGlmIHRlc3QgIiR3aXRoX2dudV9sZCIgPSBu
bzsgdGhlbgpAQCAtOTMxOSw3ICs5MzIwLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYz
N2QwIDEwMDc1NQogIAkgICAgICBmaQogIAkgICAgZmkKICAJICAgIGxpbmtfYWxsX2RlcGxpYnNf
Q1hYPXllcwotQEAgLTEzMzAzLDIwICsxNDA0MiwyMCBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBh
dGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC0xMzMxMSwyMCAr
MTQwNTAsMjAgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0i
L3Vzci9saWI6L2xpYiI7IGZpCiAgCSAgICAgIHByZWxpbmtfY21kc19DWFg9J3RwbGRpcj1UZW1w
bGF0ZS5kaXJ+CiAgCQlybSAtcmYgJHRwbGRpcn4KICAJCSRDQyAtLXByZWxpbmtfb2JqZWN0cyAt
LWluc3RhbnRpYXRpb25fZGlyICR0cGxkaXIgJG9ianMgJGxpYm9ianMgJGNvbXBpbGVfZGVwbGli
c34KQEAgLTkzNDQsNyArOTM0NSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAx
MDA3NTUKICAJICAgICAgOzsKICAJICAgICopICMgVmVyc2lvbiA2IGFuZCBhYm92ZSB1c2Ugd2Vh
ayBzeW1ib2xzCiAgCSAgICAgIGFyY2hpdmVfY21kc19DWFg9JyRDQyAtc2hhcmVkICRwaWNfZmxh
ZyAkcHJlZGVwX29iamVjdHMgJGxpYm9ianMgJGRlcGxpYnMgJHBvc3RkZXBfb2JqZWN0cyAkY29t
cGlsZXJfZmxhZ3MgJHt3bH0tc29uYW1lICR7d2x9JHNvbmFtZSAtbyAkbGliJwotQEAgLTEzNTEx
LDcgKzE0MjUwLDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0
aD0iL3Vzci9saWI6L2xpYiI7IGZpCitAQCAtMTM1MTksNyArMTQyNTgsNyBAQCBpZiB0ZXN0IC16
ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAJ
ICAgICAgICAgIGFyY2hpdmVfY21kc19DWFg9JyRDQyAtc2hhcmVkIC1ub3N0ZGxpYiAke2FsbG93
X3VuZGVmaW5lZF9mbGFnfSAkcHJlZGVwX29iamVjdHMgJGxpYm9ianMgJGRlcGxpYnMgJHBvc3Rk
ZXBfb2JqZWN0cyAkY29tcGlsZXJfZmxhZ3MgJHt3bH0tc29uYW1lICR7d2x9JHNvbmFtZSBgdGVz
dCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1wOyBmdW5jX2VjaG9fYWxsICIke3dsfS1zZXRfdmVy
c2lvbiAke3dsfSR2ZXJzdHJpbmciYCAke3dsfS11cGRhdGVfcmVnaXN0cnkgJHt3bH0ke291dHB1
dF9vYmpkaXJ9L3NvX2xvY2F0aW9ucyAtbyAkbGliJwogIAkJICA7OwogIAkgICAgICAgICopCkBA
IC05MzUzLDcgKzkzNTQsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1
CiAgCQkgIDs7CiAgCSAgICAgIGVzYWMKICAKLUBAIC0xMzU1Nyw3ICsxNDI5Niw3IEBAIGlmIHRl
c3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBm
aQorQEAgLTEzNTY1LDcgKzE0MzA0LDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhl
biBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCiAgCiAgICAgICAgc29sYXJpcyopCiAg
ICAgICAgICBjYXNlICRjY19iYXNlbmFtZSBpbgpAQCAtOTM2Miw3ICs5MzYzLDcgQEAgaW5kZXgg
ODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAkgICAgIyBTdW4gQysrIDQuMiwgNS54
IGFuZCBDZW50ZXJsaW5lIEMrKwogICAgICAgICAgICAgIGFyY2hpdmVfY21kc19uZWVkX2xjX0NY
WD15ZXMKICAJICAgIG5vX3VuZGVmaW5lZF9mbGFnX0NYWD0nIC16ZGVmcycKLUBAIC0xMzU5OCw5
ICsxNDMzNyw5IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9
Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTEzNjA2LDkgKzE0MzQ1LDkgQEAgaWYgdGVzdCAteiAi
JGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCiAgCSAg
ICBpZiB0ZXN0ICIkR1hYIiA9IHllcyAmYW1wOyZhbXA7IHRlc3QgIiR3aXRoX2dudV9sZCIgPSBu
bzsgdGhlbgogIAkgICAgICBub191bmRlZmluZWRfZmxhZ19DWFg9JyAke3dsfS16ICR7d2x9ZGVm
cycKICAJICAgICAgaWYgJENDIC0tdmVyc2lvbiB8ICRHUkVQIC12ICdeMlwuNycgJmd0OyAvZGV2
L251bGw7IHRoZW4KQEAgLTkzNzQsNyArOTM3NSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMy
ZjQ2MzdkMCAxMDA3NTUKICAKICAJICAgICAgICAjIENvbW1hbmRzIHRvIG1ha2UgY29tcGlsZXIg
cHJvZHVjZSB2ZXJib3NlIG91dHB1dCB0aGF0IGxpc3RzCiAgCSAgICAgICAgIyB3aGF0ICJoaWRk
ZW4iIGxpYnJhcmllcywgb2JqZWN0IGZpbGVzIGFuZCBmbGFncyBhcmUgdXNlZCB3aGVuCi1AQCAt
MTM3MzUsNiArMTQ0NzQsMTMgQEAgcHJpdmF0ZToKK0BAIC0xMzc0Myw2ICsxNDQ4MiwxMyBAQCBw
cml2YXRlOgogIH07CiAgX0xUX0VPRgogIApAQCAtOTM4OCw3ICs5Mzg5LDcgQEAgaW5kZXggODEx
MTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIGlmIHsgeyBldmFsIGVjaG8gIlwiXCRhc19t
ZVwiOiR7YXNfbGluZW5vLSRMSU5FTk99OiBcIiRhY19jb21waWxlXCIiOyB9ICZndDsmYW1wOzUK
ICAgIChldmFsICRhY19jb21waWxlKSAyJmd0OyZhbXA7NQogICAgYWNfc3RhdHVzPSQ/Ci1AQCAt
MTM3NDgsNyArMTQ0OTQsNyBAQCBpZiB7IHsgZXZhbCBlY2hvICJcIlwkYXNfbWVcIjoke2FzX2xp
bmVuby0kTElORU5PfTogXCIkYWNfY29tcGlsZVwiIjsgfSAmZ3Q7JmFtcDs1CitAQCAtMTM3NTYs
NyArMTQ1MDIsNyBAQCBpZiB7IHsgZXZhbCBlY2hvICJcIlwkYXNfbWVcIjoke2FzX2xpbmVuby0k
TElORU5PfTogXCIkYWNfY29tcGlsZVwiIjsgfSAmZ3Q7JmFtcDs1CiAgICBwcmVfdGVzdF9vYmpl
Y3RfZGVwc19kb25lPW5vCiAgCiAgICBmb3IgcCBpbiBgZXZhbCAiJG91dHB1dF92ZXJib3NlX2xp
bmtfY21kImA7IGRvCkBAIC05Mzk3LDcgKzkzOTgsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQz
MmY0NjM3ZDAgMTAwNzU1CiAgCiAgICAgIC1MKiB8IC1SKiB8IC1sKikKICAgICAgICAgIyBTb21l
IGNvbXBpbGVycyBwbGFjZSBzcGFjZSBiZXR3ZWVuICIte0wsUn0iIGFuZCB0aGUgcGF0aC4KLUBA
IC0xMzc1NywxMyArMTQ1MDMsMjIgQEAgaWYgeyB7IGV2YWwgZWNobyAiXCJcJGFzX21lXCI6JHth
c19saW5lbm8tJExJTkVOT306IFwiJGFjX2NvbXBpbGVcIiI7IH0gJmd0OyZhbXA7NQorQEAgLTEz
NzY1LDEzICsxNDUxMSwyMiBAQCBpZiB7IHsgZXZhbCBlY2hvICJcIlwkYXNfbWVcIjoke2FzX2xp
bmVuby0kTElORU5PfTogXCIkYWNfY29tcGlsZVwiIjsgfSAmZ3Q7JmFtcDs1CiAgICAgICAgICAg
IHRlc3QgJHAgPSAiLVIiOyB0aGVuCiAgCSBwcmV2PSRwCiAgCSBjb250aW51ZQpAQCAtOTQyNCw3
ICs5NDI1LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAkgICAj
IEludGVybmFsIGNvbXBpbGVyIGxpYnJhcnkgcGF0aHMgc2hvdWxkIGNvbWUgYWZ0ZXIgdGhvc2UK
ICAJICAgIyBwcm92aWRlZCB0aGUgdXNlci4gIFRoZSBwb3N0ZGVwcyBhbHJlYWR5IGNvbWUgYWZ0
ZXIgdGhlCiAgCSAgICMgdXNlciBzdXBwbGllZCBsaWJzIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8g
cHJvY2VzcyB0aGVtLgotQEAgLTEzNzgzLDggKzE0NTM4LDEwIEBAIGlmIHsgeyBldmFsIGVjaG8g
IlwiXCRhc19tZVwiOiR7YXNfbGluZW5vLSRMSU5FTk99OiBcIiRhY19jb21waWxlXCIiOyB9ICZn
dDsmYW1wOzUKK0BAIC0xMzc5MSw4ICsxNDU0NiwxMCBAQCBpZiB7IHsgZXZhbCBlY2hvICJcIlwk
YXNfbWVcIjoke2FzX2xpbmVuby0kTElORU5PfTogXCIkYWNfY29tcGlsZVwiIjsgfSAmZ3Q7JmFt
cDs1CiAgCSAgIHBvc3RkZXBzX0NYWD0iJHtwb3N0ZGVwc19DWFh9ICR7cHJldn0ke3B9PGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmZpZmlAQC05NDM1LDcrOTQz
Niw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NSouJG9iamV4dCkjVGhpc2Fz
c3VtZXN0aGF0dGhldGVzdG9iamVjdGZpbGVvbmx5c2hvd3N1cCNvbmNlaW50aGVjb21waWxlcm91
dHB1dC4tQEAtMTM4MjAsNisxNDU3Nyw3QEBlbHNlK0BALTEzODI4LDYrMTQ1ODUsN0BAZWxzZWZp
JFJNLWZjb25mZXN0LiRvYmpleHRAQC05NDQzLDcrOTQ0NCw3QEBpbmRleDgxMTEzNGE1MDNiLi5m
NDMyZjQ2MzdkMDEwMDc1NSNQT1JUTUU6b3ZlcnJpZGVhYm92ZXRlc3RvbnN5c3RlbXN3aGVyZWl0
aXNicm9rZW5jYXNlJGhvc3Rfb3Npbi1AQC0xMzg1NSw3KzE0NjEzLDdAQGxpbnV4KikrQEAtMTM4
NjMsNysxNDYyMSw3QEBsaW51eCopc29sYXJpcyopY2FzZSRjY19iYXNlbmFtZWluQEAtOTQ1Miw3
Kzk0NTMsN0BAaW5kZXg4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTUjVGhlbW9yZXN0YW5k
YXJkcy1jb25mb3JtaW5nc3RscG9ydDRsaWJyYXJ5aXMjaW5jb21wYXRpYmxld2l0aHRoZUNzdGRs
aWJyYXJ5LkF2b2lkc3BlY2lmeWluZyNpdGlmaXQnc2luQ1hYRkxBR1MuSWdub3JlbGliQ3J1bmFz
LUBALTEzOTIwLDgrMTQ2NzgsNkBAZmkrQEAtMTM5MjgsOCsxNDY4Niw2QEBmaWx0X3Byb2dfY29t
cGlsZXJfcGljX0NYWD1sdF9wcm9nX2NvbXBpbGVyX3N0YXRpY19DWFg9QEAtOTQ2MSw3Kzk0NjIs
N0BAaW5kZXg4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTUjQysrc3BlY2lmaWNjYXNlc2Zv
cnBpYyxzdGF0aWMsd2wsZXRjLmlmdGVzdCI+IgogIAkgZmkKICAgICAgICAgZmkKQEAgLTk0MzUs
NyArOTQzNiw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICAg
Ki4kb2JqZXh0KQogICAgICAgICAjIFRoaXMgYXNzdW1lcyB0aGF0IHRoZSB0ZXN0IG9iamVjdCBm
aWxlIG9ubHkgc2hvd3MgdXAKICAgICAgICAgIyBvbmNlIGluIHRoZSBjb21waWxlciBvdXRwdXQu
Ci1AQCAtMTM4MjAsNiArMTQ1NzcsNyBAQCBlbHNlCitAQCAtMTM4MjgsNiArMTQ1ODUsNyBAQCBl
bHNlCiAgZmkKICAKICAkUk0gLWYgY29uZmVzdC4kb2JqZXh0CkBAIC05NDQzLDcgKzk0NDQsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgCiAgIyBQT1JUTUU6IG92
ZXJyaWRlIGFib3ZlIHRlc3Qgb24gc3lzdGVtcyB3aGVyZSBpdCBpcyBicm9rZW4KICBjYXNlICRo
b3N0X29zIGluCi1AQCAtMTM4NTUsNyArMTQ2MTMsNyBAQCBsaW51eCopCitAQCAtMTM4NjMsNyAr
MTQ2MjEsNyBAQCBsaW51eCopCiAgCiAgc29sYXJpcyopCiAgICBjYXNlICRjY19iYXNlbmFtZSBp
bgpAQCAtOTQ1Miw3ICs5NDUzLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEw
MDc1NQogICAgICAjIFRoZSBtb3JlIHN0YW5kYXJkcy1jb25mb3JtaW5nIHN0bHBvcnQ0IGxpYnJh
cnkgaXMKICAgICAgIyBpbmNvbXBhdGlibGUgd2l0aCB0aGUgQ3N0ZCBsaWJyYXJ5LiBBdm9pZCBz
cGVjaWZ5aW5nCiAgICAgICMgaXQgaWYgaXQncyBpbiBDWFhGTEFHUy4gSWdub3JlIGxpYkNydW4g
YXMKLUBAIC0xMzkyMCw4ICsxNDY3OCw2IEBAIGZpCitAQCAtMTM5MjgsOCArMTQ2ODYsNiBAQCBm
aQogIGx0X3Byb2dfY29tcGlsZXJfcGljX0NYWD0KICBsdF9wcm9nX2NvbXBpbGVyX3N0YXRpY19D
WFg9CiAgCkBAIC05NDYxLDcgKzk0NjIsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3
ZDAgMTAwNzU1CiAgCiAgICAjIEMrKyBzcGVjaWZpYyBjYXNlcyBmb3IgcGljLCBzdGF0aWMsIHds
LCBldGMuCiAgICBpZiB0ZXN0ICI8L2E+JEdYWCIgPSB5ZXM7IHRoZW4KLUBAIC0xNDAyNiw2ICsx
NDc4MiwxMSBAQCAkYXNfZWNob19uICJjaGVja2luZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBw
cm9kdWNlIFBJQy4uLiAiICZndDsmYW1wOzY7IH0KK0BAIC0xNDAzNCw2ICsxNDc5MCwxMSBAQCAk
YXNfZWNob19uICJjaGVja2luZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBwcm9kdWNlIFBJQy4u
LiAiICZndDsmYW1wOzY7IH0KICAJICA7OwogIAllc2FjCiAgCTs7CkBAIC05NDczLDcgKzk0NzQs
NyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICAgICAgZGd1eCop
CiAgCWNhc2UgJGNjX2Jhc2VuYW1lIGluCiAgCSAgZWMrKyopCi1AQCAtMTQxNzgsNyArMTQ5Mzks
NyBAQCAkYXNfZWNob19uICJjaGVja2luZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBwcm9kdWNl
IFBJQy4uLiAiICZndDsmYW1wOzY7IH0KK0BAIC0xNDE4Niw3ICsxNDk0Nyw3IEBAICRhc19lY2hv
X24gImNoZWNraW5nIGZvciAkY29tcGlsZXIgb3B0aW9uIHRvIHByb2R1Y2UgUElDLi4uICIgJmd0
OyZhbXA7NjsgfQogIAk7OwogICAgICAgIHNvbGFyaXMqKQogIAljYXNlICRjY19iYXNlbmFtZSBp
bgpAQCAtOTQ4Miw3ICs5NDgzLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEw
MDc1NQogIAkgICAgIyBTdW4gQysrIDQuMiwgNS54IGFuZCBDZW50ZXJsaW5lIEMrKwogIAkgICAg
bHRfcHJvZ19jb21waWxlcl9waWNfQ1hYPSctS1BJQycKICAJICAgIGx0X3Byb2dfY29tcGlsZXJf
c3RhdGljX0NYWD0nLUJzdGF0aWMnCi1AQCAtMTQyNDMsMTAgKzE1MDA0LDE3IEBAIGNhc2UgJGhv
c3Rfb3MgaW4KK0BAIC0xNDI1MSwxMCArMTUwMTIsMTcgQEAgY2FzZSAkaG9zdF9vcyBpbgogICAg
ICBsdF9wcm9nX2NvbXBpbGVyX3BpY19DWFg9IiRsdF9wcm9nX2NvbXBpbGVyX3BpY19DWFggLURQ
SUMiCiAgICAgIDs7CiAgZXNhYwpAQCAtOTUwMyw3ICs5NTA0LDcgQEAgaW5kZXggODExMTM0YTUw
M2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAogICMKICAjIENoZWNrIHRvIG1ha2Ugc3VyZSB0aGUg
UElDIGZsYWcgYWN0dWFsbHkgd29ya3MuCi1AQCAtMTQzMDQsNiArMTUwNzIsOCBAQCBmaQorQEAg
LTE0MzEyLDYgKzE1MDgwLDggQEAgZmkKICAKICAKICAKQEAgLTk1MTIsNyArOTUxMyw3IEBAIGlu
ZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAjCiAgIyBDaGVjayB0byBtYWtl
IHN1cmUgdGhlIHN0YXRpYyBmbGFnIGFjdHVhbGx5IHdvcmtzLgogICMKLUBAIC0xNDQ4MSw2ICsx
NTI1MSw3IEBAIGZpCitAQCAtMTQ0ODksNiArMTUyNTksNyBAQCBmaQogICRhc19lY2hvX24gImNo
ZWNraW5nIHdoZXRoZXIgdGhlICRjb21waWxlciBsaW5rZXIgKCRMRCkgc3VwcG9ydHMgc2hhcmVk
IGxpYnJhcmllcy4uLiAiICZndDsmYW1wOzY7IH0KICAKICAgIGV4cG9ydF9zeW1ib2xzX2NtZHNf
Q1hYPSckTk0gJGxpYm9ianMgJGNvbnZlbmllbmNlIHwgJGdsb2JhbF9zeW1ib2xfcGlwZSB8ICRT
RUQgJ1wnJ3MvLiogLy8nXCcnIHwgc29ydCB8IHVuaXEgJmd0OyAkZXhwb3J0X3N5bWJvbHMnCkBA
IC05NTIwLDcgKzk1MjEsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1
CiAgICBjYXNlICRob3N0X29zIGluCiAgICBhaXhbNC05XSopCiAgICAgICMgSWYgd2UncmUgdXNp
bmcgR05VIG5tLCB0aGVuIHdlIGRvbid0IHdhbnQgdGhlICItQyIgb3B0aW9uLgotQEAgLTE0NDk1
LDE1ICsxNTI2NiwyMCBAQCAkYXNfZWNob19uICJjaGVja2luZyB3aGV0aGVyIHRoZSAkY29tcGls
ZXIgbGlua2VyICgkTEQpIHN1cHBvcnRzIHNoYXJlZCBsaWJyYXJpZQorQEAgLTE0NTAzLDE1ICsx
NTI3NCwyMCBAQCAkYXNfZWNob19uICJjaGVja2luZyB3aGV0aGVyIHRoZSAkY29tcGlsZXIgbGlu
a2VyICgkTEQpIHN1cHBvcnRzIHNoYXJlZCBsaWJyYXJpZQogICAgICA7OwogICAgcHczMiopCiAg
ICAgIGV4cG9ydF9zeW1ib2xzX2NtZHNfQ1hYPSIkbHRkbGxfY21kczxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpAQC05NTQ2LDcrOTU0Nyw3QEBpbmRleDgxMTEz
NGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NXskYXNfZWNobyI+IgpAQCAtOTU0Niw3ICs5NTQ3LDcg
QEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIAogIHsgJGFzX2VjaG8g
IjwvYT4kYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IHJlc3VsdDogJGxkX3NobGlic19DWFgi
ICZndDsmYW1wOzUKICAkYXNfZWNobyAiJGxkX3NobGlic19DWFgiICZndDsmYW1wOzY7IH0KLUBA
IC0xNDc2Niw4ICsxNTU0Miw5IEBAIGN5Z3dpbiogfCBtaW5ndyogfCBwdzMyKiB8IGNlZ2NjKikK
K0BAIC0xNDc3NCw4ICsxNTU1MCw5IEBAIGN5Z3dpbiogfCBtaW5ndyogfCBwdzMyKiB8IGNlZ2Nj
KikKICAgIG5lZWRfdmVyc2lvbj1ubwogICAgbmVlZF9saWJfcHJlZml4PW5vCiAgCkBAIC05NTU4
LDcgKzk1NTksNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICAg
IGxpYnJhcnlfbmFtZXNfc3BlYz0nJGxpYm5hbWUuZGxsLmEnCiAgICAgICMgRExMIGlzIGluc3Rh
bGxlZCB0byAkKGxpYmRpcikvLi4vYmluIGJ5IHBvc3RpbnN0YWxsX2NtZHMKICAgICAgcG9zdGlu
c3RhbGxfY21kcz0nYmFzZV9maWxlPWBiYXNlbmFtZSBcJHtmaWxlfWB+Ci1AQCAtMTQ3OTksMTMg
KzE1NTc2LDcxIEBAIGN5Z3dpbiogfCBtaW5ndyogfCBwdzMyKiB8IGNlZ2NjKikKK0BAIC0xNDgw
NywxMyArMTU1ODQsNzEgQEAgY3lnd2luKiB8IG1pbmd3KiB8IHB3MzIqIHwgY2VnY2MqKQogICAg
ICAgIGxpYnJhcnlfbmFtZXNfc3BlYz0nYGVjaG8gJHtsaWJuYW1lfSB8IHNlZCAtZSAncy9ebGli
L3B3LydgYGVjaG8gJHtyZWxlYXNlfSB8ICRTRUQgLWUgJ3MvWy5dLy0vZydgJHt2ZXJzdWZmaXh9
JHtzaGFyZWRfZXh0fScKICAgICAgICA7OwogICAgICBlc2FjCkBAIC05NjMxLDcgKzk2MzIsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgICAjIEZJWE1FOiBmaXJz
dCB3ZSBzaG91bGQgc2VhcmNoIC4gYW5kIHRoZSBkaXJlY3RvcnkgdGhlIGV4ZWN1dGFibGUgaXMg
aW4KICAgIHNobGlicGF0aF92YXI9UEFUSAogICAgOzsKLUBAIC0xNDg5Niw3ICsxNTczMSw3IEBA
IGhhaWt1KikKK0BAIC0xNDkwNCw3ICsxNTczOSw3IEBAIGhhaWt1KikKICAgIHNvbmFtZV9zcGVj
PScke2xpYm5hbWV9JHtyZWxlYXNlfSR7c2hhcmVkX2V4dH0kbWFqb3InCiAgICBzaGxpYnBhdGhf
dmFyPUxJQlJBUllfUEFUSAogICAgc2hsaWJwYXRoX292ZXJyaWRlc19ydW5wYXRoPXllcwpAQCAt
OTY0MCw3ICs5NjQxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQog
ICAgaGFyZGNvZGVfaW50b19saWJzPXllcwogICAgOzsKICAKLUBAIC0xNTM1NSw2ICsxNjE5MCw3
IEBAIGZpCitAQCAtMTUzNjMsNiArMTYxOTgsNyBAQCBmaQogICAgZmkgIyB0ZXN0IC1uICIkY29t
cGlsZXIiCiAgCiAgICBDQz0kbHRfc2F2ZV9DQwpAQCAtOTY0OCw3ICs5NjQ5LDcgQEAgaW5kZXgg
ODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogICAgTERDWFg9JExECiAgICBMRD0kbHRf
c2F2ZV9MRAogICAgR0NDPSRsdF9zYXZlX0dDQwotQEAgLTE4NDc3LDEzICsxOTMxMywyMCBAQCBl
eGVleHQ9J2AkRUNITyAiJGV4ZWV4dCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0
ImAnCitAQCAtMTg1NTQsMTMgKzE5MzkwLDIwIEBAIGV4ZWV4dD0nYCRFQ0hPICIkZXhlZXh0IiB8
ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF91bnNldD0nYCRFQ0hPICIk
bHRfdW5zZXQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGx0X1NQMk5M
PSdgJEVDSE8gIiRsdF9TUDJOTCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAn
CiAgbHRfTkwyU1A9J2AkRUNITyAiJGx0X05MMlNQIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVv
dGVfc3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YCdA
QC05NjY5LDcrOTY3MCw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NVNUUklQ
PSdgJEVDSE8iPiJgJwpAQCAtOTY2OSw3ICs5NjcwLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0
MzJmNDYzN2QwIDEwMDc1NQogIFNUUklQPSdgJEVDSE8gIjwvYT4kU1RSSVAiIHwgJFNFRCAiJGRl
bGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIFJBTkxJQj0nYCRFQ0hPICIkUkFOTElCIiB8ICRT
RUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBvbGRfcG9zdGluc3RhbGxfY21kcz0n
YCRFQ0hPICIkb2xkX3Bvc3RpbnN0YWxsX2NtZHMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdCJgJwotQEAgLTE4NDk4LDE0ICsxOTM0MSwxNyBAQCBsdF9jdl9zeXNfZ2xvYmFsX3N5
bWJvbF9waXBlPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlIiB8ICRTRUQg
IiRkZQorQEAgLTE4NTc1LDE0ICsxOTQxOCwxNyBAQCBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9w
aXBlPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlIiB8ICRTRUQgIiRkZQog
IGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xv
YmFsX3N5bWJvbF90b19jZGVjbCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAn
CiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3M9J2AkRUNITyAiJGx0
X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzIiB8ICRTRUQgIiRkZWxheV9z
aW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVf
YWRkcmVzc19saWJfcHJlZml4PSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19j
X25hbWVfYWRkcmVzc19saWJfcHJlZml4IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vi
c3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YCdAQC05Njg4
LDcrOTY4OSw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NURTWU1VVElMPSdg
JEVDSE8iPiJgJwpAQCAtOTY4OCw3ICs5Njg5LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJm
NDYzN2QwIDEwMDc1NQogIERTWU1VVElMPSdgJEVDSE8gIjwvYT4kRFNZTVVUSUwiIHwgJFNFRCAi
JGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIE5NRURJVD0nYCRFQ0hPICIkTk1FRElUIiB8
ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBMSVBPPSdgJEVDSE8gIiRMSVBP
IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKLUBAIC0xODUzOCwxMiArMTkz
ODQsMTIgQEAgaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcj0nYCRFQ0hPICIkaGFyZGNvZGVfc2hsaWJw
YXRoX3ZhciIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3EKK0BAIC0xODYxNSwxMiArMTk0NjEsMTIg
QEAgaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcj0nYCRFQ0hPICIkaGFyZGNvZGVfc2hsaWJwYXRoX3Zh
ciIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3EKICBoYXJkY29kZV9hdXRvbWF0aWM9J2AkRUNITyAi
JGhhcmRjb2RlX2F1dG9tYXRpYyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAn
CiAgaW5oZXJpdF9ycGF0aD0nYCRFQ0hPICIkaW5oZXJpdF9ycGF0aCIgfCAkU0VEICIkZGVsYXlf
c2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgbGlua19hbGxfZGVwbGlicz0nYCRFQ0hPICIkbGlua19h
bGxfZGVwbGlicyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0PGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmAnQEAtOTcwMiw3Kzk3MDMsN0BAaW5k
ZXg4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTVmaWxlX2xpc3Rfc3BlYz0nYCRFQ0hPIj4i
YCcKQEAgLTk3MDIsNyArOTcwMyw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAx
MDA3NTUKICBmaWxlX2xpc3Rfc3BlYz0nYCRFQ0hPICI8L2E+JGZpbGVfbGlzdF9zcGVjIiB8ICRT
RUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICB2YXJpYWJsZXNfc2F2ZWRfZm9yX3Jl
bGluaz0nYCRFQ0hPICIkdmFyaWFibGVzX3NhdmVkX2Zvcl9yZWxpbmsiIHwgJFNFRCAiJGRlbGF5
X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIG5lZWRfbGliX3ByZWZpeD0nYCRFQ0hPICIkbmVlZF9s
aWJfcHJlZml4IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKLUBAIC0xODU4
Miw4ICsxOTQyOCw4IEBAIG9sZF9hcmNoaXZlX2NtZHNfQ1hYPSdgJEVDSE8gIiRvbGRfYXJjaGl2
ZV9jbWRzX0NYWCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlCitAQCAtMTg2NTksOCArMTk1
MDUsOCBAQCBvbGRfYXJjaGl2ZV9jbWRzX0NYWD0nYCRFQ0hPICIkb2xkX2FyY2hpdmVfY21kc19D
WFgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZQogIGNvbXBpbGVyX0NYWD0nYCRFQ0hPICIk
Y29tcGlsZXJfQ1hYIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBHQ0Nf
Q1hYPSdgJEVDSE8gIiRHQ0NfQ1hYIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3Qi
YCcKICBsdF9wcm9nX2NvbXBpbGVyX25vX2J1aWx0aW5fZmxhZ19DWFg9J2AkRUNITyAiJGx0X3By
b2dfY29tcGlsZXJfbm9fYnVpbHRpbl9mbGFnX0NYWCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1
b3RlX3N1YnN0PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmAn
QEAtOTcxMiw3Kzk3MTMsN0BAaW5kZXg4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTVsdF9w
cm9nX2NvbXBpbGVyX3N0YXRpY19DWFg9J2AkRUNITyI+ImAnCkBAIC05NzEyLDcgKzk3MTMsNyBA
QCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgbHRfcHJvZ19jb21waWxl
cl9zdGF0aWNfQ1hYPSdgJEVDSE8gIjwvYT4kbHRfcHJvZ19jb21waWxlcl9zdGF0aWNfQ1hYIiB8
ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9jdl9wcm9nX2NvbXBpbGVy
X2Nfb19DWFg9J2AkRUNITyAiJGx0X2N2X3Byb2dfY29tcGlsZXJfY19vX0NYWCIgfCAkU0VEICIk
ZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgYXJjaGl2ZV9jbWRzX25lZWRfbGNfQ1hYPSdg
JEVDSE8gIiRhcmNoaXZlX2NtZHNfbmVlZF9sY19DWFgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9x
dW90ZV9zdWJzdCJgJwotQEAgLTE4NjEwLDEyICsxOTQ1NiwxMiBAQCBoYXJkY29kZV9zaGxpYnBh
dGhfdmFyX0NYWD0nYCRFQ0hPICIkaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcl9DWFgiIHwgJFNFRCAi
JGRlbGF5XworQEAgLTE4Njg3LDEyICsxOTUzMywxMiBAQCBoYXJkY29kZV9zaGxpYnBhdGhfdmFy
X0NYWD0nYCRFQ0hPICIkaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcl9DWFgiIHwgJFNFRCAiJGRlbGF5
XwogIGhhcmRjb2RlX2F1dG9tYXRpY19DWFg9J2AkRUNITyAiJGhhcmRjb2RlX2F1dG9tYXRpY19D
WFgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGluaGVyaXRfcnBhdGhf
Q1hYPSdgJEVDSE8gIiRpbmhlcml0X3JwYXRoX0NYWCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1
b3RlX3N1YnN0ImAnCiAgbGlua19hbGxfZGVwbGlic19DWFg9J2AkRUNITyAiJGxpbmtfYWxsX2Rl
cGxpYnNfQ1hYIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3Q8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YCdAQC05NzI2LDcrOTcyNyw3QEBpbmRl
eDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NWZpbGVfbGlzdF9zcGVjX0NYWD0nYCRFQ0hP
Ij4iYCcKQEAgLTk3MjYsNyArOTcyNyw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2Mzdk
MCAxMDA3NTUKICBmaWxlX2xpc3Rfc3BlY19DWFg9J2AkRUNITyAiPC9hPiRmaWxlX2xpc3Rfc3Bl
Y19DWFgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGhhcmRjb2RlX2Fj
dGlvbl9DWFg9J2AkRUNITyAiJGhhcmRjb2RlX2FjdGlvbl9DWFgiIHwgJFNFRCAiJGRlbGF5X3Np
bmdsZV9xdW90ZV9zdWJzdCJgJwogIGNvbXBpbGVyX2xpYl9zZWFyY2hfZGlyc19DWFg9J2AkRUNI
TyAiJGNvbXBpbGVyX2xpYl9zZWFyY2hfZGlyc19DWFgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9x
dW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpg
Jy1AQC0xODY1Myw4KzE5NDk5LDEzQEByZWxvYWRfZmxhZ1wrQEAtMTg3MzAsOCsxOTU3NiwxM0BA
cmVsb2FkX2ZsYWdcT0JKRFVNUFxkZXBsaWJzX2NoZWNrX21ldGhvZFxmaWxlX21hZ2ljX2NtZFxA
QC05NzQwLDcrOTc0MSw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMDEwMDc1NVNUUklQ
XFJBTkxJQlxDQ1wtQEAtMTg2NjQsMTIrMTk1MTUsMTRAQGx0X2N2X3N5c19nbG9iYWxfc3ltYm9s
X3BpcGVcK0BALTE4NzQxLDEyKzE5NTkyLDE0QEBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBl
XGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsXGx0X2N2X3N5c19nbG9iYWxfc3ltYm9s
X3RvX2NfbmFtZV9hZGRyZXNzXGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRy
ZXNzX2xpYl9wcmVmaXhcQEAtOTc1Niw3Kzk3NTcsN0BAaW5kZXg4MTExMzRhNTAzYi4uZjQzMmY0
NjM3ZDAxMDA3NTVEU1lNVVRJTFxOTUVESVRcTElQT1wtQEAtMTg2ODUsNysxOTUzOCw2QEBub191
bmRlZmluZWRfZmxhZ1wrQEAtMTg3NjIsNysxOTYxNSw2QEBub191bmRlZmluZWRfZmxhZ1xoYXJk
Y29kZV9saWJkaXJfZmxhZ19zcGVjXGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWNfbGRcaGFyZGNv
ZGVfbGliZGlyX3NlcGFyYXRvclxAQC05NzY0LDcrOTc2NSw3QEBpbmRleDgxMTEzNGE1MDNiLi5m
NDMyZjQ2MzdkMDEwMDc1NWV4Y2x1ZGVfZXhwc3ltc1xpbmNsdWRlX2V4cHN5bXNcZmlsZV9saXN0
X3NwZWNcLUBALTE4NzA3LDgrMTk1NTksOEBATERfQ1hYXCtAQC0xODc4NCw4KzE5NjM2LDhAQExE
X0NYWFxyZWxvYWRfZmxhZ19DWFhcY29tcGlsZXJfQ1hYXGx0X3Byb2dfY29tcGlsZXJfbm9fYnVp
bHRpbl9mbGFnX0NYWFxAQC05Nzc0LDcrOTc3NSw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMyZjQ2
MzdkMDEwMDc1NWx0X3Byb2dfY29tcGlsZXJfc3RhdGljX0NYWFxsdF9jdl9wcm9nX2NvbXBpbGVy
X2Nfb19DWFhcZXhwb3J0X2R5bmFtaWNfZmxhZ19zcGVjX0NYWFwtQEAtMTg3MjAsNysxOTU3Miw2
QEBub191bmRlZmluZWRfZmxhZ19DWFhcK0BALTE4Nzk3LDcrMTk2NDksNkBAbm9fdW5kZWZpbmVk
X2ZsYWdfQ1hYXGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWNfQ1hYXGhhcmRjb2RlX2xpYmRpcl9m
bGFnX3NwZWNfbGRfQ1hYXGhhcmRjb2RlX2xpYmRpcl9zZXBhcmF0b3JfQ1hYXEBALTk3ODIsNys5
NzgzLDdAQGluZGV4ODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwMTAwNzU1ZXhjbHVkZV9leHBzeW1z
X0NYWFxpbmNsdWRlX2V4cHN5bXNfQ1hYXGZpbGVfbGlzdF9zcGVjX0NYWFwtQEAtMTg3NTQsNisx
OTYwNSw3QEBtb2R1bGVfY21kc1wrQEAtMTg4MzEsNisxOTY4Miw3QEBtb2R1bGVfY21kc1xtb2R1
bGVfZXhwc3ltX2NtZHNcZXhwb3J0X3N5bWJvbHNfY21kc1xwcmVsaW5rX2NtZHNcQEAtOTc5MCw3
Kzk3OTEsN0BAaW5kZXg4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTVwb3N0aW5zdGFsbF9j
bWRzXHBvc3R1bmluc3RhbGxfY21kc1xmaW5pc2hfY21kc1wtQEAtMTg3NjgsNysxOTYyMCw4QEBh
cmNoaXZlX2V4cHN5bV9jbWRzX0NYWFwrQEAtMTg4NDUsNysxOTY5Nyw4QEBhcmNoaXZlX2V4cHN5
bV9jbWRzX0NYWFxtb2R1bGVfY21kc19DWFhcbW9kdWxlX2V4cHN5bV9jbWRzX0NYWFxleHBvcnRf
c3ltYm9sc19jbWRzX0NYWFxAQC05ODAwLDcrOTgwMSw3QEBpbmRleDgxMTEzNGE1MDNiLi5mNDMy
ZjQ2MzdkMDEwMDc1NWNhc2VcYGV2YWxcXFxcXCRFQ0hPXFxcXCI+ImAnCi1AQCAtMTg2NTMsOCAr
MTk0OTksMTMgQEAgcmVsb2FkX2ZsYWcgXAorQEAgLTE4NzMwLDggKzE5NTc2LDEzIEBAIHJlbG9h
ZF9mbGFnIFwKICBPQkpEVU1QIFwKICBkZXBsaWJzX2NoZWNrX21ldGhvZCBcCiAgZmlsZV9tYWdp
Y19jbWQgXApAQCAtOTc0MCw3ICs5NzQxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYz
N2QwIDEwMDc1NQogIFNUUklQIFwKICBSQU5MSUIgXAogIENDIFwKLUBAIC0xODY2NCwxMiArMTk1
MTUsMTQgQEAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZSBcCitAQCAtMTg3NDEsMTIgKzE5
NTkyLDE0IEBAIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGUgXAogIGx0X2N2X3N5c19nbG9i
YWxfc3ltYm9sX3RvX2NkZWNsIFwKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVf
YWRkcmVzcyBcCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3NfbGli
X3ByZWZpeCBcCkBAIC05NzU2LDcgKzk3NTcsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0
NjM3ZDAgMTAwNzU1CiAgRFNZTVVUSUwgXAogIE5NRURJVCBcCiAgTElQTyBcCi1AQCAtMTg2ODUs
NyArMTk1MzgsNiBAQCBub191bmRlZmluZWRfZmxhZyBcCitAQCAtMTg3NjIsNyArMTk2MTUsNiBA
QCBub191bmRlZmluZWRfZmxhZyBcCiAgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYyBcCiAgaGFy
ZGNvZGVfbGliZGlyX2ZsYWdfc3BlY19sZCBcCiAgaGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvciBc
CkBAIC05NzY0LDcgKzk3NjUsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAw
NzU1CiAgZXhjbHVkZV9leHBzeW1zIFwKICBpbmNsdWRlX2V4cHN5bXMgXAogIGZpbGVfbGlzdF9z
cGVjIFwKLUBAIC0xODcwNyw4ICsxOTU1OSw4IEBAIExEX0NYWCBcCitAQCAtMTg3ODQsOCArMTk2
MzYsOCBAQCBMRF9DWFggXAogIHJlbG9hZF9mbGFnX0NYWCBcCiAgY29tcGlsZXJfQ1hYIFwKICBs
dF9wcm9nX2NvbXBpbGVyX25vX2J1aWx0aW5fZmxhZ19DWFggXApAQCAtOTc3NCw3ICs5Nzc1LDcg
QEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIGx0X3Byb2dfY29tcGls
ZXJfc3RhdGljX0NYWCBcCiAgbHRfY3ZfcHJvZ19jb21waWxlcl9jX29fQ1hYIFwKICBleHBvcnRf
ZHluYW1pY19mbGFnX3NwZWNfQ1hYIFwKLUBAIC0xODcyMCw3ICsxOTU3Miw2IEBAIG5vX3VuZGVm
aW5lZF9mbGFnX0NYWCBcCitAQCAtMTg3OTcsNyArMTk2NDksNiBAQCBub191bmRlZmluZWRfZmxh
Z19DWFggXAogIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWNfQ1hYIFwKICBoYXJkY29kZV9saWJk
aXJfZmxhZ19zcGVjX2xkX0NYWCBcCiAgaGFyZGNvZGVfbGliZGlyX3NlcGFyYXRvcl9DWFggXApA
QCAtOTc4Miw3ICs5NzgzLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1
NQogIGV4Y2x1ZGVfZXhwc3ltc19DWFggXAogIGluY2x1ZGVfZXhwc3ltc19DWFggXAogIGZpbGVf
bGlzdF9zcGVjX0NYWCBcCi1AQCAtMTg3NTQsNiArMTk2MDUsNyBAQCBtb2R1bGVfY21kcyBcCitA
QCAtMTg4MzEsNiArMTk2ODIsNyBAQCBtb2R1bGVfY21kcyBcCiAgbW9kdWxlX2V4cHN5bV9jbWRz
IFwKICBleHBvcnRfc3ltYm9sc19jbWRzIFwKICBwcmVsaW5rX2NtZHMgXApAQCAtOTc5MCw3ICs5
NzkxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogIHBvc3RpbnN0
YWxsX2NtZHMgXAogIHBvc3R1bmluc3RhbGxfY21kcyBcCiAgZmluaXNoX2NtZHMgXAotQEAgLTE4
NzY4LDcgKzE5NjIwLDggQEAgYXJjaGl2ZV9leHBzeW1fY21kc19DWFggXAorQEAgLTE4ODQ1LDcg
KzE5Njk3LDggQEAgYXJjaGl2ZV9leHBzeW1fY21kc19DWFggXAogIG1vZHVsZV9jbWRzX0NYWCBc
CiAgbW9kdWxlX2V4cHN5bV9jbWRzX0NYWCBcCiAgZXhwb3J0X3N5bWJvbHNfY21kc19DWFggXApA
QCAtOTgwMCw3ICs5ODAxLDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1
NQogICAgICBjYXNlIFxgZXZhbCBcXFxcXCRFQ0hPIFxcXFwiPC9hPiJcXFxcXCRcJHZhciJcXFxc
IlxgIGluCiAgICAgICpbXFxcXFxcXGBcXCJcXFwkXSopCiAgICAgICAgZXZhbCAibHRfXCR2YXI9
XFxcXFxcIlxcXGBcXFwkRUNITyBcXCJcXFwkXCR2YXJcXCIgfCBcXFwkU0VEIC1lIFxcIlxcXCRk
b3VibGVfcXVvdGVfc3Vic3RcXCIgLWUgXFwiXFxcJHNlZF9xdW90ZV9zdWJzdFxcIiAtZSBcXCJc
XFwkZGVsYXlfdmFyaWFibGVfc3Vic3RcXCJcXFxgXFxcXFxcIiIKLUBAIC0xOTUzMyw3ICsyMDM4
Niw4IEBAICRhc19lY2hvIFgiJGZpbGUiIHwKK0BAIC0xOTYxMCw3ICsyMDQ2Myw4IEBAICRhc19l
Y2hvIFgiJGZpbGUiIHwKICAjIE5PVEU6IENoYW5nZXMgbWFkZSB0byB0aGlzIGZpbGUgd2lsbCBi
ZSBsb3N0OiBsb29rIGF0IGx0bWFpbi5zaC4KICAjCiAgIyAgIENvcHlyaWdodCAoQykgMTk5Niwg
MTk5NywgMTk5OCwgMTk5OSwgMjAwMCwgMjAwMSwgMjAwMywgMjAwNCwgMjAwNSwKQEAgLTk4MTAs
NyArOTgxMSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAjICAg
V3JpdHRlbiBieSBHb3Jkb24gTWF0emlna2VpdCwgMTk5NgogICMKICAjICAgVGhpcyBmaWxlIGlz
IHBhcnQgb2YgR05VIExpYnRvb2wuCi1AQCAtMTk2MzYsMTkgKzIwNDkwLDQyIEBAIFNQMk5MPSRs
dF9sdF9TUDJOTAorQEAgLTE5NzEzLDE5ICsyMDU2Nyw0MiBAQCBTUDJOTD0kbHRfbHRfU1AyTkwK
ICAjIHR1cm4gbmV3bGluZXMgaW50byBzcGFjZXMuCiAgTkwyU1A9JGx0X2x0X05MMlNQCiAgCkBA
IC05ODU0LDcgKzk4NTUsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1
CiAgIyBBIHN5bWJvbCBzdHJpcHBpbmcgcHJvZ3JhbS4KICBTVFJJUD0kbHRfU1RSSVAKICAKLUBA
IC0xOTY3OCw2ICsyMDU1NSwxMiBAQCBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzPSRs
dF9sdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcworQEAgLTE5NzU1LDYg
KzIwNjMyLDEyIEBAIGdsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3M9JGx0X2x0X2N2X3N5
c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzCiAgIyBUcmFuc2Zvcm0gdGhlIG91dHB1
dCBvZiBubSBpbiBhIEMgbmFtZSBhZGRyZXNzIHBhaXIgd2hlbiBsaWIgcHJlZml4IGlzIG5lZWRl
ZC4KICBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXg9JGx0X2x0X2N2
X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXgKICAKQEAgLTk4
NjcsNyArOTg2OCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAj
IFRoZSBuYW1lIG9mIHRoZSBkaXJlY3RvcnkgdGhhdCBjb250YWlucyB0ZW1wb3JhcnkgbGlidG9v
bCBmaWxlcy4KICBvYmpkaXI9JG9iamRpcgogIAotQEAgLTE5Njg3LDYgKzIwNTcwLDkgQEAgTUFH
SUNfQ01EPSRNQUdJQ19DTUQKK0BAIC0xOTc2NCw2ICsyMDY0Nyw5IEBAIE1BR0lDX0NNRD0kTUFH
SUNfQ01ECiAgIyBNdXN0IHdlIGxvY2sgZmlsZXMgd2hlbiBkb2luZyBjb21waWxhdGlvbj8KICBu
ZWVkX2xvY2tzPSRsdF9uZWVkX2xvY2tzCiAgCkBAIC05ODc3LDcgKzk4NzgsNyBAQCBpbmRleCA4
MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAgMTAwNzU1CiAgIyBUb29sIHRvIG1hbmlwdWxhdGUgYXJj
aGl2ZWQgRFdBUkYgZGVidWcgc3ltYm9sIGZpbGVzIG9uIE1hYyBPUyBYLgogIERTWU1VVElMPSRs
dF9EU1lNVVRJTAogIAotQEAgLTE5ODAxLDEyICsyMDY4NywxMiBAQCB3aXRoX2djYz0kR0NDCitA
QCAtMTk4NzgsMTIgKzIwNzY0LDEyIEBAIHdpdGhfZ2NjPSRHQ0MKICAjIENvbXBpbGVyIGZsYWcg
dG8gdHVybiBvZmYgYnVpbHRpbiBmdW5jdGlvbnMuCiAgbm9fYnVpbHRpbl9mbGFnPSRsdF9sdF9w
cm9nX2NvbXBpbGVyX25vX2J1aWx0aW5fZmxhZwogIApAQCAtOTg5Myw3ICs5ODk0LDcgQEAgaW5k
ZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2QwIDEwMDc1NQogICMgQ29tcGlsZXIgZmxhZyB0byBw
cmV2ZW50IGR5bmFtaWMgbGlua2luZy4KICBsaW5rX3N0YXRpY19mbGFnPSRsdF9sdF9wcm9nX2Nv
bXBpbGVyX3N0YXRpYwogIAotQEAgLTE5ODkzLDkgKzIwNzc5LDYgQEAgaW5oZXJpdF9ycGF0aD0k
aW5oZXJpdF9ycGF0aAorQEAgLTE5OTcwLDkgKzIwODU2LDYgQEAgaW5oZXJpdF9ycGF0aD0kaW5o
ZXJpdF9ycGF0aAogICMgV2hldGhlciBsaWJ0b29sIG11c3QgbGluayBhIHByb2dyYW0gYWdhaW5z
dCBhbGwgaXRzIGRlcGVuZGVuY3kgbGlicmFyaWVzLgogIGxpbmtfYWxsX2RlcGxpYnM9JGxpbmtf
YWxsX2RlcGxpYnMKICAKQEAgLTk5MDMsNyArOTkwNCw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5m
NDMyZjQ2MzdkMCAxMDA3NTUKICAjIFNldCB0byAieWVzIiBpZiBleHBvcnRlZCBzeW1ib2xzIGFy
ZSByZXF1aXJlZC4KICBhbHdheXNfZXhwb3J0X3N5bWJvbHM9JGFsd2F5c19leHBvcnRfc3ltYm9s
cwogIAotQEAgLTE5OTExLDYgKzIwNzk0LDkgQEAgaW5jbHVkZV9leHBzeW1zPSRsdF9pbmNsdWRl
X2V4cHN5bXMKK0BAIC0xOTk4OCw2ICsyMDg3MSw5IEBAIGluY2x1ZGVfZXhwc3ltcz0kbHRfaW5j
bHVkZV9leHBzeW1zCiAgIyBDb21tYW5kcyBuZWNlc3NhcnkgZm9yIGxpbmtpbmcgcHJvZ3JhbXMg
KGFnYWluc3QgbGlicmFyaWVzKSB3aXRoIHRlbXBsYXRlcy4KICBwcmVsaW5rX2NtZHM9JGx0X3By
ZWxpbmtfY21kcwogIApAQCAtOTkxMyw3ICs5OTE0LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0
MzJmNDYzN2QwIDEwMDc1NQogICMgU3BlY2lmeSBmaWxlbmFtZSBjb250YWluaW5nIGlucHV0IGZp
bGVzLgogIGZpbGVfbGlzdF9zcGVjPSRsdF9maWxlX2xpc3Rfc3BlYwogIAotQEAgLTE5OTU3LDIx
MCArMjA4NDMsMTY5IEBAIGx0bWFpbj0iJGFjX2F1eF9kaXIvbHRtYWluLnNoIgorQEAgLTIwMDM0
LDIxMCArMjA5MjAsMTY5IEBAIGx0bWFpbj0iJGFjX2F1eF9kaXIvbHRtYWluLnNoIgogICAgIyBp
ZiBmaW5kcyBtaXhlZCBDUi9MRiBhbmQgTEYtb25seSBsaW5lcy4gIFNpbmNlIHNlZCBvcGVyYXRl
cyBpbgogICAgIyB0ZXh0IG1vZGUsIGl0IHByb3Blcmx5IGNvbnZlcnRzIGxpbmVzIHRvIENSL0xG
LiAgVGhpcyBiYXNoIHByb2JsZW0KICAgICMgaXMgcmVwb3J0ZWRseSBmaXhlZCwgYnV0IHdoeSBu
b3QgcnVuIG9uIG9sZCB2ZXJzaW9ucyB0b28/CkBAIC0xMDI4Nyw3ICsxMDI4OCw3IEBAIGluZGV4
IDgxMTEzNGE1MDNiLi5mNDMyZjQ2MzdkMCAxMDA3NTUKICAgICAgKHJtIC1mICIkb2ZpbGUiICZh
bXA7JmFtcDsgY3AgIiRjZmdmaWxlIiAiJG9maWxlIiAmYW1wOyZhbXA7IHJtIC1mICIkY2ZnZmls
ZSIpCiAgICBjaG1vZCAreCAiJG9maWxlIgogIAotQEAgLTIwMTg4LDEyICsyMTAzMywxMiBAQCB3
aXRoX2djYz0kR0NDX0NYWAorQEAgLTIwMjY1LDEyICsyMTExMCwxMiBAQCB3aXRoX2djYz0kR0ND
X0NYWAogICMgQ29tcGlsZXIgZmxhZyB0byB0dXJuIG9mZiBidWlsdGluIGZ1bmN0aW9ucy4KICBu
b19idWlsdGluX2ZsYWc9JGx0X2x0X3Byb2dfY29tcGlsZXJfbm9fYnVpbHRpbl9mbGFnX0NYWAog
IApAQCAtMTAzMDMsNyArMTAzMDQsNyBAQCBpbmRleCA4MTExMzRhNTAzYi4uZjQzMmY0NjM3ZDAg
MTAwNzU1CiAgIyBDb21waWxlciBmbGFnIHRvIHByZXZlbnQgZHluYW1pYyBsaW5raW5nLgogIGxp
bmtfc3RhdGljX2ZsYWc9JGx0X2x0X3Byb2dfY29tcGlsZXJfc3RhdGljX0NYWAogIAotQEAgLTIw
MjgwLDkgKzIxMTI1LDYgQEAgaW5oZXJpdF9ycGF0aD0kaW5oZXJpdF9ycGF0aF9DWFgKK0BAIC0y
MDM1Nyw5ICsyMTIwMiw2IEBAIGluaGVyaXRfcnBhdGg9JGluaGVyaXRfcnBhdGhfQ1hYCiAgIyBX
aGV0aGVyIGxpYnRvb2wgbXVzdCBsaW5rIGEgcHJvZ3JhbSBhZ2FpbnN0IGFsbCBpdHMgZGVwZW5k
ZW5jeSBsaWJyYXJpZXMuCiAgbGlua19hbGxfZGVwbGlicz0kbGlua19hbGxfZGVwbGlic19DWFgK
ICAKQEAgLTEwMzEzLDcgKzEwMzE0LDcgQEAgaW5kZXggODExMTM0YTUwM2IuLmY0MzJmNDYzN2Qw
IDEwMDc1NQogICMgU2V0IHRvICJ5ZXM8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86aWZleHBvcnRlZHN5bWJvbHNhcmVyZXF1aXJlZC5hbHdheXNfZXhwb3J0X3N5
bWJvbHM9JGFsd2F5c19leHBvcnRfc3ltYm9sc19DWFgtQEAtMjAyOTgsNisyMTE0MCw5QEBpbmNs
dWRlX2V4cHN5bXM9JGx0X2luY2x1ZGVfZXhwc3ltc19DWFgrQEAtMjAzNzUsNisyMTIxNyw5QEBp
bmNsdWRlX2V4cHN5bXM9JGx0X2luY2x1ZGVfZXhwc3ltc19DWFgjQ29tbWFuZHNuZWNlc3Nhcnlm
b3JsaW5raW5ncHJvZ3JhbXMoYWdhaW5zdGxpYnJhcmllcyl3aXRodGVtcGxhdGVzLnByZWxpbmtf
Y21kcz0kbHRfcHJlbGlua19jbWRzX0NYWEBALTEwMzI0LDcrMTAzMjUsN0BAaW5kZXg4MTExMzRh
NTAzYi4uZjQzMmY0NjM3ZDAxMDA3NTVmaWxlX2xpc3Rfc3BlYz0kbHRfZmlsZV9saXN0X3NwZWNf
Q1hYZGlmZi0tZ2l0YS9saWJjdGYvY29uZmlndXJlYi9saWJjdGYvY29uZmlndXJlLWluZGV4ZTU0
OTNiMzE2OTEuLjk5NzdlNGY3YTQyMTAwNzU1K2luZGV4MWRjMWI2NWZhYzMuLmM1YzJmMzZiYmMw
MTAwNzU1LS0tYS9saWJjdGYvY29uZmlndXJlKysrYi9saWJjdGYvY29uZmlndXJlQEAtNjYzLDYr
NjYzLDhAQE9UT09MQEAtMTAzMzYsNysxMDMzNyw3QEBpbmRleGU1NDkzYjMxNjkxLi45OTc3ZTRm
N2E0MjEwMDc1NU9CSkRVTVBMTl9TTk0tQEAtNzc4LDYrNzgwLDdAQGVuYWJsZV9zdGF0aWMrQEAt
NzkwLDYrNzkyLDdAQGVuYWJsZV9zdGF0aWN3aXRoX3BpY2VuYWJsZV9mYXN0X2luc3RhbGx3aXRo
X2dudV9sZEBALTEwMzQ0LDcrMTAzNDUsN0BAaW5kZXhlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIx
MDA3NTVlbmFibGVfbGlidG9vbF9sb2NrZW5hYmxlX2xhcmdlZmlsZWVuYWJsZV93ZXJyb3JfYWx3
YXlzLUBALTE0MzYsNisxNDM5LDhAQE9wdGlvbmFsUGFja2FnZXM6K0BALTE0NDgsNisxNDUxLDhA
QE9wdGlvbmFsUGFja2FnZXM6LS13aXRoLXBpY3RyeXRvdXNlb25seVBJQy9ub24tUElDb2JqZWN0
c1tkZWZhdWx0PXVzZWJvdGhdLS13aXRoLWdudS1sZGFzc3VtZXRoZUNjb21waWxlcnVzZXNHTlVs
ZFtkZWZhdWx0PW5vXUBALTEwMzUzLDcrMTAzNTQsN0BAaW5kZXhlNTQ5M2IzMTY5MS4uOTk3N2U0
ZjdhNDIxMDA3NTUtLXdpdGgtc3lzdGVtLXpsaWJ1c2VpbnN0YWxsZWRsaWJ6U29tZWluZmx1ZW50
aWFsZW52aXJvbm1lbnR2YXJpYWJsZXM6LUBALTUzMjQsOCs1MzI5LDhAQGVzYWMrQEAtNTQwNiw4
KzU0MTEsOEBAZXNhY0BALTEwMzY0LDcrMTAzNjUsN0BAaW5kZXhlNTQ5M2IzMTY5MS4uOTk3N2U0
ZjdhNDIxMDA3NTUtQEAtNTQzNiw3KzU0NDEsN0BARUNITz0kRUNITyRFQ0hPJEVDSE8kRUNITyRF
Q0hPJEVDSE8rQEAtNTUxOCw3KzU1MjMsN0BARUNITz0kRUNITyRFQ0hPJEVDSE8kRUNITyRFQ0hP
JEVDSE97JGFzX2VjaG8iPiIgaWYgZXhwb3J0ZWQgc3ltYm9scyBhcmUgcmVxdWlyZWQuCiAgYWx3
YXlzX2V4cG9ydF9zeW1ib2xzPSRhbHdheXNfZXhwb3J0X3N5bWJvbHNfQ1hYCiAgCi1AQCAtMjAy
OTgsNiArMjExNDAsOSBAQCBpbmNsdWRlX2V4cHN5bXM9JGx0X2luY2x1ZGVfZXhwc3ltc19DWFgK
K0BAIC0yMDM3NSw2ICsyMTIxNyw5IEBAIGluY2x1ZGVfZXhwc3ltcz0kbHRfaW5jbHVkZV9leHBz
eW1zX0NYWAogICMgQ29tbWFuZHMgbmVjZXNzYXJ5IGZvciBsaW5raW5nIHByb2dyYW1zIChhZ2Fp
bnN0IGxpYnJhcmllcykgd2l0aCB0ZW1wbGF0ZXMuCiAgcHJlbGlua19jbWRzPSRsdF9wcmVsaW5r
X2NtZHNfQ1hYCiAgCkBAIC0xMDMyNCw3ICsxMDMyNSw3IEBAIGluZGV4IDgxMTEzNGE1MDNiLi5m
NDMyZjQ2MzdkMCAxMDA3NTUKICBmaWxlX2xpc3Rfc3BlYz0kbHRfZmlsZV9saXN0X3NwZWNfQ1hY
CiAgCiBkaWZmIC0tZ2l0IGEvbGliY3RmL2NvbmZpZ3VyZSBiL2xpYmN0Zi9jb25maWd1cmUKLWlu
ZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKK2luZGV4IDFkYzFiNjVmYWMzLi5j
NWMyZjM2YmJjMCAxMDA3NTUKIC0tLSBhL2xpYmN0Zi9jb25maWd1cmUKICsrKyBiL2xpYmN0Zi9j
b25maWd1cmUKIEBAIC02NjMsNiArNjYzLDggQEAgT1RPT0wKQEAgLTEwMzM2LDcgKzEwMzM3LDcg
QEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIE9CSkRVTVAKICBMTl9T
CiAgTk0KLUBAIC03NzgsNiArNzgwLDcgQEAgZW5hYmxlX3N0YXRpYworQEAgLTc5MCw2ICs3OTIs
NyBAQCBlbmFibGVfc3RhdGljCiAgd2l0aF9waWMKICBlbmFibGVfZmFzdF9pbnN0YWxsCiAgd2l0
aF9nbnVfbGQKQEAgLTEwMzQ0LDcgKzEwMzQ1LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5Nzdl
NGY3YTQyIDEwMDc1NQogIGVuYWJsZV9saWJ0b29sX2xvY2sKICBlbmFibGVfbGFyZ2VmaWxlCiAg
ZW5hYmxlX3dlcnJvcl9hbHdheXMKLUBAIC0xNDM2LDYgKzE0MzksOCBAQCBPcHRpb25hbCBQYWNr
YWdlczoKK0BAIC0xNDQ4LDYgKzE0NTEsOCBAQCBPcHRpb25hbCBQYWNrYWdlczoKICAgIC0td2l0
aC1waWMgICAgICAgICAgICAgIHRyeSB0byB1c2Ugb25seSBQSUMvbm9uLVBJQyBvYmplY3RzIFtk
ZWZhdWx0PXVzZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgYm90aF0KICAgIC0td2l0aC1n
bnUtbGQgICAgICAgICAgIGFzc3VtZSB0aGUgQyBjb21waWxlciB1c2VzIEdOVSBsZCBbZGVmYXVs
dD1ub10KQEAgLTEwMzUzLDcgKzEwMzU0LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3
YTQyIDEwMDc1NQogICAgLS13aXRoLXN5c3RlbS16bGliICAgICAgdXNlIGluc3RhbGxlZCBsaWJ6
CiAgCiAgU29tZSBpbmZsdWVudGlhbCBlbnZpcm9ubWVudCB2YXJpYWJsZXM6Ci1AQCAtNTMyNCw4
ICs1MzI5LDggQEAgZXNhYworQEAgLTU0MDYsOCArNTQxMSw4IEBAIGVzYWMKICAKICAKICAKQEAg
LTEwMzY0LDcgKzEwMzY1LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1
NQogIAogIAogIAotQEAgLTU0MzYsNyArNTQ0MSw3IEBAIEVDSE89JEVDSE8kRUNITyRFQ0hPJEVD
SE8kRUNITyRFQ0hPCitAQCAtNTUxOCw3ICs1NTIzLDcgQEAgRUNITz0kRUNITyRFQ0hPJEVDSE8k
RUNITyRFQ0hPJEVDSE8KICB7ICRhc19lY2hvICI8L2E+JGFzX21lOiR7YXNfbGluZW5vLSRMSU5F
Tk99OiBjaGVja2luZyBob3cgdG8gcHJpbnQgc3RyaW5ncyIgJmd0OyZhbXA7NQogICRhc19lY2hv
X24gImNoZWNraW5nIGhvdyB0byBwcmludCBzdHJpbmdzLi4uICIgJmd0OyZhbXA7NjsgfQogICMg
VGVzdCBwcmludCBmaXJzdCwgYmVjYXVzZSBpdCB3aWxsIGJlIGEgYnVpbHRpbiBpZiBwcmVzZW50
LgpAQCAtMTAzNzMsNyArMTAzNzQsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIg
MTAwNzU1CiAgICAgdGVzdCAiWGBwcmludCAtciAtLSAkRUNITyAyJmd0Oy9kZXYvbnVsbGAiID0g
IlgkRUNITyI7IHRoZW4KICAgIEVDSE89J3ByaW50IC1yIC0tJwogIGVsaWYgdGVzdCAiWGBwcmlu
dGYgJXMgJEVDSE8gMiZndDsvZGV2L251bGxgIiA9ICJYJEVDSE8iOyB0aGVuCi1AQCAtNjEyMiw4
ICs2MTI3LDggQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgd2hldGhlciB0aGUgc2hlbGwgdW5kZXJz
dGFuZHMgc29tZSBYU0kgY29uc3RydWN0cy4uLiAiICZndDsmYW1wOzY7CitAQCAtNjIwNCw4ICs2
MjA5LDggQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgd2hldGhlciB0aGUgc2hlbGwgdW5kZXJzdGFu
ZHMgc29tZSBYU0kgY29uc3RydWN0cy4uLiAiICZndDsmYW1wOzY7CiAgIyBUcnkgc29tZSBYU0kg
ZmVhdHVyZXMKICB4c2lfc2hlbGw9bm8KICAoIF9sdF9kdW1teT0iYS9iL2M8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86QEAtMTAzODQsNysxMDM4NSw3QEBpbmRl
eGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MjEwMDc1NSZhbXA7JmFtcDtldmFsJ3Rlc3QkKCgxKzEp
KS1lcTJcJmFtcDsmYW1wO3Rlc3QiPiIKQEAgLTEwMzg0LDcgKzEwMzg1LDcgQEAgaW5kZXggZTU0
OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICAgICAmYW1wOyZhbXA7IGV2YWwgJ3Rlc3Qg
JCgoIDEgKyAxICkpIC1lcSAyIFwKICAgICAgJmFtcDsmYW1wOyB0ZXN0ICI8L2E+JHsjX2x0X2R1
bW15fSIgLWVxIDUnICkgJmd0Oy9kZXYvbnVsbCAyJmd0OyZhbXA7MSBcCiAgICAmYW1wOyZhbXA7
IHhzaV9zaGVsbD15ZXMKLUBAIC02MTcyLDYgKzYxNzcsODAgQEAgZXNhYworQEAgLTYyNTQsNiAr
NjI1OSw4MCBAQCBlc2FjCiAgCiAgCiAgCkBAIC0xMDQ2NSw3ICsxMDQ2Niw3IEBAIGluZGV4IGU1
NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICB7ICRhc19lY2hvICIkYXNfbWU6JHthc19s
aW5lbm8tJExJTkVOT306IGNoZWNraW5nIGZvciAkTEQgb3B0aW9uIHRvIHJlbG9hZCBvYmplY3Qg
ZmlsZXMiICZndDsmYW1wOzUKICAkYXNfZWNob19uICJjaGVja2luZyBmb3IgJExEIG9wdGlvbiB0
byByZWxvYWQgb2JqZWN0IGZpbGVzLi4uICIgJmd0OyZhbXA7NjsgfQogIGlmICR7bHRfY3ZfbGRf
cmVsb2FkX2ZsYWcrOn0gZmFsc2U7IHRoZW4gOgotQEAgLTYxODgsNiArNjI2NywxMSBAQCBjYXNl
ICRyZWxvYWRfZmxhZyBpbgorQEAgLTYyNzAsNiArNjM0OSwxMSBAQCBjYXNlICRyZWxvYWRfZmxh
ZyBpbgogIGVzYWMKICByZWxvYWRfY21kcz0nJExEJHJlbG9hZF9mbGFnIC1vICRvdXRwdXQkcmVs
b2FkX29ianMnCiAgY2FzZSAkaG9zdF9vcyBpbgpAQCAtMTA0NzcsNyArMTA0NzgsNyBAQCBpbmRl
eCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgICBkYXJ3aW4qKQogICAgICBpZiB0
ZXN0ICIkR0NDIiA9IHllczsgdGhlbgogICAgICAgIHJlbG9hZF9jbWRzPSckTFRDQyAkTFRDRkxB
R1MgLW5vc3RkbGliICR7d2x9LXIgLW8gJG91dHB1dCRyZWxvYWRfb2JqcycKLUBAIC02MzU2LDcg
KzY0NDAsOCBAQCBtaW5ndyogfCBwdzMyKikKK0BAIC02NDM4LDcgKzY1MjIsOCBAQCBtaW5ndyog
fCBwdzMyKikKICAgICAgbHRfY3ZfZGVwbGlic19jaGVja19tZXRob2Q9J2ZpbGVfbWFnaWMgXng4
NiBhcmNoaXZlIGltcG9ydHxeeDg2IERMTCcKICAgICAgbHRfY3ZfZmlsZV9tYWdpY19jbWQ9J2Z1
bmNfd2luMzJfbGliaWQnCiAgICBlbHNlCkBAIC0xMDQ4Nyw3ICsxMDQ4OCw3IEBAIGluZGV4IGU1
NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAgICAgbHRfY3ZfZmlsZV9tYWdpY19jbWQ9
JyRPQkpEVU1QIC1mJwogICAgZmkKICAgIDs7Ci1AQCAtNjUxMCw2ICs2NTk1LDIxIEBAIGVzYWMK
K0BAIC02NTkyLDYgKzY2NzcsMjEgQEAgZXNhYwogIGZpCiAgeyAkYXNfZWNobyAiJGFzX21lOiR7
YXNfbGluZW5vLSRMSU5FTk99OiByZXN1bHQ6ICRsdF9jdl9kZXBsaWJzX2NoZWNrX21ldGhvZCIg
Jmd0OyZhbXA7NQogICRhc19lY2hvICIkbHRfY3ZfZGVwbGlic19jaGVja19tZXRob2QiICZndDsm
YW1wOzY7IH0KQEAgLTEwNTA5LDcgKzEwNTEwLDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5Nzdl
NGY3YTQyIDEwMDc1NQogIGZpbGVfbWFnaWNfY21kPSRsdF9jdl9maWxlX21hZ2ljX2NtZAogIGRl
cGxpYnNfY2hlY2tfbWV0aG9kPSRsdF9jdl9kZXBsaWJzX2NoZWNrX21ldGhvZAogIHRlc3QgLXog
IiRkZXBsaWJzX2NoZWNrX21ldGhvZCIgJmFtcDsmYW1wOyBkZXBsaWJzX2NoZWNrX21ldGhvZD11
bmtub3duCi1AQCAtNjUyNSw5ICs2NjI1LDE2MiBAQCB0ZXN0IC16ICIkZGVwbGlic19jaGVja19t
ZXRob2QiICZhbXA7JmFtcDsgZGVwbGlic19jaGVja19tZXRob2Q9dW5rbm93bgorQEAgLTY2MDcs
OSArNjcwNywxNjIgQEAgdGVzdCAteiAiJGRlcGxpYnNfY2hlY2tfbWV0aG9kIiAmYW1wOyZhbXA7
IGRlcGxpYnNfY2hlY2tfbWV0aG9kPXVua25vd24KICAKICAKICAKQEAgLTEwNjc0LDcgKzEwNjc1
LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIHsgJGFzX2VjaG8g
IiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcgZm9yICRhY193b3JkIiAmZ3Q7
JmFtcDs1CiAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRhY193b3JkLi4uICIgJmd0OyZhbXA7
NjsgfQogIGlmICR7YWNfY3ZfcHJvZ19BUis6fSBmYWxzZTsgdGhlbiA6Ci1AQCAtNjU0Myw3ICs2
Nzk2LDcgQEAgZG8KK0BAIC02NjI1LDcgKzY4NzgsNyBAQCBkbwogICAgdGVzdCAteiAiJGFzX2Rp
ciIgJmFtcDsmYW1wOyBhc19kaXI9LgogICAgICBmb3IgYWNfZXhlY19leHQgaW4gJycgJGFjX2V4
ZWN1dGFibGVfZXh0ZW5zaW9uczsgZG8KICAgIGlmIGFzX2ZuX2V4ZWN1dGFibGVfcCAiJGFzX2Rp
ci8kYWNfd29yZCRhY19leGVjX2V4dCI7IHRoZW4KQEAgLTEwNjgzLDcgKzEwNjg0LDcgQEAgaW5k
ZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICAgICAkYXNfZWNobyAiJGFzX21l
OiR7YXNfbGluZW5vLSRMSU5FTk99OiBmb3VuZCAkYXNfZGlyLyRhY193b3JkJGFjX2V4ZWNfZXh0
IiAmZ3Q7JmFtcDs1CiAgICAgIGJyZWFrIDIKICAgIGZpCi1AQCAtNjU2MywxMSArNjgxNiwxNSBA
QCAkYXNfZWNobyAibm8iICZndDsmYW1wOzY7IH0KK0BAIC02NjQ1LDExICs2ODk4LDE1IEBAICRh
c19lY2hvICJubyIgJmd0OyZhbXA7NjsgfQogIGZpCiAgCiAgCkBAIC0xMDcwMiw3ICsxMDcwMyw3
IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICB7ICRhc19lY2hvICIk
YXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGNoZWNraW5nIGZvciAkYWNfd29yZCIgJmd0OyZh
bXA7NQogICRhc19lY2hvX24gImNoZWNraW5nIGZvciAkYWNfd29yZC4uLiAiICZndDsmYW1wOzY7
IH0KICBpZiAke2FjX2N2X3Byb2dfYWNfY3RfQVIrOn0gZmFsc2U7IHRoZW4gOgotQEAgLTY1ODMs
NyArNjg0MCw3IEBAIGRvCitAQCAtNjY2NSw3ICs2OTIyLDcgQEAgZG8KICAgIHRlc3QgLXogIiRh
c19kaXIiICZhbXA7JmFtcDsgYXNfZGlyPS4KICAgICAgZm9yIGFjX2V4ZWNfZXh0IGluICcnICRh
Y19leGVjdXRhYmxlX2V4dGVuc2lvbnM7IGRvCiAgICBpZiBhc19mbl9leGVjdXRhYmxlX3AgIiRh
c19kaXIvJGFjX3dvcmQkYWNfZXhlY19leHQiOyB0aGVuCkBAIC0xMDcxMSw3ICsxMDcxMiw3IEBA
IGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAgICAgJGFzX2VjaG8gIiRh
c19tZToke2FzX2xpbmVuby0kTElORU5PfTogZm91bmQgJGFzX2Rpci8kYWNfd29yZCRhY19leGVj
X2V4dCIgJmd0OyZhbXA7NQogICAgICBicmVhayAyCiAgICBmaQotQEAgLTY2MDIsNiArNjg1OSwx
MCBAQCBlbHNlCitAQCAtNjY4NCw2ICs2OTQxLDEwIEBAIGVsc2UKICAkYXNfZWNobyAibm8iICZn
dDsmYW1wOzY7IH0KICBmaQogIApAQCAtMTA3MjIsNyArMTA3MjMsNyBAQCBpbmRleCBlNTQ5M2Iz
MTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgICBpZiB0ZXN0ICJ4JGFjX2N0X0FSIiA9IHg7IHRo
ZW4KICAgICAgQVI9ImZhbHNlIgogICAgZWxzZQotQEAgLTY2MTMsMTYgKzY4NzQsNzIgQEAgYWNf
dG9vbF93YXJuZWQ9eWVzIDs7CitAQCAtNjY5NSwxNiArNjk1Niw3MiBAQCBhY190b29sX3dhcm5l
ZD15ZXMgOzsKICBlc2FjCiAgICAgIEFSPSRhY19jdF9BUgogICAgZmkKQEAgLTEwNzk5LDcgKzEw
ODAwLDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIAogIAogIAot
QEAgLTY5NjQsOCArNzI4MSw4IEBAIGVzYWMKK0BAIC03MDQ2LDggKzczNjMsOCBAQCBlc2FjCiAg
bHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY2RlY2w9InNlZCAtbiAtZSAncy9eVCAuKiBcKC4q
XCkkL2V4dGVybiBpbnQgXDEoKTsvcCcgLWUgJ3MvXiRzeW1jb2RlKiAuKiBcKC4qXCkkL2V4dGVy
biBjaGFyIFwxOy9wJzxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzojVHJhbnNmb3JtYW5leHRyYWN0ZWRzeW1ib2xsaW5laW50b3N5bWJvbG5hbWVhbmRzeW1ib2xh
ZGRyZXNzQEAtMTA4MTAsNysxMDgxMSw3QEBpbmRleGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MjEw
MDc1NSNIYW5kbGVDUkxGaW5taW5nd3Rvb2xjaGFpbm9wdF9jcj0tQEAtNzAwMSw2KzczMTgsN0BA
Zm9yYWNfc3ltcHJmeGluIj4iCiAgCiAgIyBUcmFuc2Zvcm0gYW4gZXh0cmFjdGVkIHN5bWJvbCBs
aW5lIGludG8gc3ltYm9sIG5hbWUgYW5kIHN5bWJvbCBhZGRyZXNzCkBAIC0xMDgxMCw3ICsxMDgx
MSw3IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAKICAjIEhhbmRs
ZSBDUkxGIGluIG1pbmd3IHRvb2wgY2hhaW4KICBvcHRfY3I9Ci1AQCAtNzAwMSw2ICs3MzE4LDcg
QEAgZm9yIGFjX3N5bXByZnggaW4gIjwvYT4iICJfIjsgZG8KK0BAIC03MDgzLDYgKzc0MDAsNyBA
QCBmb3IgYWNfc3ltcHJmeCBpbiAiIiAiXyI7IGRvCiAgICBlbHNlCiAgICAgIGx0X2N2X3N5c19n
bG9iYWxfc3ltYm9sX3BpcGU9InNlZCAtbiAtZSAncy9eLipbCSBdXCgkc3ltY29kZSRzeW1jb2Rl
KlwpWwkgXVsJIF0qJGFjX3N5bXByZngkc3ltcGF0JG9wdF9jciQvJHN5bXhmcm0vcCciCiAgICBm
aQpAQCAtMTA4MTgsNyArMTA4MTksNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIg
MTAwNzU1CiAgCiAgICAjIENoZWNrIHRvIHNlZSB0aGF0IHRoZSBwaXBlIHdvcmtzIGNvcnJlY3Rs
eS4KICAgIHBpcGVfd29ya3M9bm8KLUBAIC03MDQyLDYgKzczNjAsMTggQEAgX0xUX0VPRgorQEAg
LTcxMjQsNiArNzQ0MiwxOCBAQCBfTFRfRU9GCiAgICAgICAgaWYgJEdSRVAgJyBubV90ZXN0X3Zh
ciQnICIkbmxpc3QiICZndDsvZGV2L251bGw7IHRoZW4KICAJaWYgJEdSRVAgJyBubV90ZXN0X2Z1
bmMkJyAiJG5saXN0IiAmZ3Q7L2Rldi9udWxsOyB0aGVuCiAgCSAgY2F0ICZsdDsmbHQ7X0xUX0VP
RiAmZ3Q7IGNvbmZ0ZXN0LiRhY19leHQKQEAgLTEwODM3LDcgKzEwODM4LDcgQEAgaW5kZXggZTU0
OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICNpZmRlZiBfX2NwbHVzcGx1cwogIGV4dGVy
biAiQyIgewogICNlbmRpZgotQEAgLTcwNTMsNyArNzM4Myw3IEBAIF9MVF9FT0YKK0BAIC03MTM1
LDcgKzc0NjUsNyBAQCBfTFRfRU9GCiAgCSAgY2F0ICZsdDsmbHQ7X0xUX0VPRiAmZ3Q7Jmd0OyBj
b25mdGVzdC4kYWNfZXh0CiAgCiAgLyogVGhlIG1hcHBpbmcgYmV0d2VlbiBzeW1ib2wgbmFtZXMg
YW5kIHN5bWJvbHMuICAqLwpAQCAtMTA4NDYsNyArMTA4NDcsNyBAQCBpbmRleCBlNTQ5M2IzMTY5
MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgICBjb25zdCBjaGFyICpuYW1lOwogICAgdm9pZCAgICAg
ICAqYWRkcmVzczsKICB9Ci1AQCAtNzA3OSw4ICs3NDA5LDggQEAgc3RhdGljIGNvbnN0IHZvaWQg
Kmx0X3ByZWxvYWRlZF9zZXR1cCgpIHsKK0BAIC03MTYxLDggKzc0OTEsOCBAQCBzdGF0aWMgY29u
c3Qgdm9pZCAqbHRfcHJlbG9hZGVkX3NldHVwKCkgewogIF9MVF9FT0YKICAJICAjIE5vdyB0cnkg
bGlua2luZyB0aGUgdHdvIGZpbGVzLgogIAkgIG12IGNvbmZ0ZXN0LiRhY19vYmpleHQgY29uZnRz
dG0uJGFjX29iamV4dApAQCAtMTA4NTcsNyArMTA4NTgsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4u
OTk3N2U0ZjdhNDIgMTAwNzU1CiAgCSAgTElCUz0iY29uZnRzdG0uJGFjX29iamV4dCIKICAJICBD
RkxBR1M9IiRDRkxBR1MkbHRfcHJvZ19jb21waWxlcl9ub19idWlsdGluX2ZsYWciCiAgCSAgaWYg
eyB7IGV2YWwgZWNobyAiXCJcJGFzX21lXCI6JHthc19saW5lbm8tJExJTkVOT306IFwiJGFjX2xp
bmtcIiI7IH0gJmd0OyZhbXA7NQotQEAgLTcwOTAsOCArNzQyMCw4IEBAIF9MVF9FT0YKK0BAIC03
MTcyLDggKzc1MDIsOCBAQCBfTFRfRU9GCiAgICB0ZXN0ICRhY19zdGF0dXMgPSAwOyB9ICZhbXA7
JmFtcDsgdGVzdCAtcyBjb25mdGVzdCR7YWNfZXhlZXh0fTsgdGhlbgogIAkgICAgcGlwZV93b3Jr
cz15ZXMKICAJICBmaQpAQCAtMTA4NjgsNyArMTA4NjksNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4u
OTk3N2U0ZjdhNDIgMTAwNzU1CiAgCWVsc2UKICAJICBlY2hvICJjYW5ub3QgZmluZCBubV90ZXN0
X2Z1bmMgaW4gJG5saXN0IiAmZ3Q7JmFtcDs1CiAgCWZpCi1AQCAtNzEyOCw2ICs3NDU4LDE2IEBA
IGVsc2UKK0BAIC03MjEwLDYgKzc1NDAsMTYgQEAgZWxzZQogICRhc19lY2hvICJvayIgJmd0OyZh
bXA7NjsgfQogIGZpCiAgCkBAIC0xMDg4NSw3ICsxMDg4Niw3IEBAIGluZGV4IGU1NDkzYjMxNjkx
Li45OTc3ZTRmN2E0MiAxMDA3NTUKICAKICAKICAKLUBAIC03MTQ0LDYgKzc0ODQsNDUgQEAgZmkK
K0BAIC03MjI2LDYgKzc1NjYsNDUgQEAgZmkKICAKICAKICAKQEAgLTEwOTMxLDcgKzEwOTMyLDcg
QEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIAogIAogIAotQEAgLTcz
NTUsNiArNzczNCwxMjMgQEAgZXNhYworQEAgLTc0MzcsNiArNzgxNiwxMjMgQEAgZXNhYwogIAog
IG5lZWRfbG9ja3M9IiRlbmFibGVfbGlidG9vbF9sb2NrIgogIApAQCAtMTEwNTUsNyArMTEwNTYs
NyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgCiAgICBjYXNlICRo
b3N0X29zIGluCiAgICAgIHJoYXBzb2R5KiB8IGRhcndpbiopCi1AQCAtNzkxOCw2ICs4NDE0LDgg
QEAgX0xUX0VPRgorQEAgLTgwMDAsNiArODQ5Niw4IEBAIF9MVF9FT0YKICAgICAgICAkTFRDQyAk
TFRDRkxBR1MgLWMgLW8gY29uZnRlc3QubyBjb25mdGVzdC5jIDImZ3Q7JmFtcDs1CiAgICAgICAg
ZWNobyAiJEFSIGNydSBsaWJjb25mdGVzdC5hIGNvbmZ0ZXN0Lm8iICZndDsmYW1wOzUKICAgICAg
ICAkQVIgY3J1IGxpYmNvbmZ0ZXN0LmEgY29uZnRlc3QubyAyJmd0OyZhbXA7NQpAQCAtMTEwNjQs
NyArMTEwNjUsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgICAg
ICAgY2F0ICZndDsgY29uZnRlc3QuYyAmbHQ7Jmx0OyBfTFRfRU9GCiAgaW50IG1haW4oKSB7IHJl
dHVybiAwO30KICBfTFRfRU9GCi1AQCAtODA4Myw3ICs4NTgxLDggQEAgZmkKK0BAIC04MTY1LDcg
Kzg2NjMsOCBAQCBmaQogIExJQlRPT0xfREVQUz0iJGx0bWFpbiIKICAKICAjIEFsd2F5cyB1c2Ug
b3VyIG93biBsaWJ0b29sLgpAQCAtMTEwNzQsNyArMTEwNzUsNyBAQCBpbmRleCBlNTQ5M2IzMTY5
MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgCiAgCiAgCi1AQCAtODE3Miw3ICs4NjcxLDcgQEAgYWl4
MyopCitAQCAtODI1NCw3ICs4NzUzLDcgQEAgYWl4MyopCiAgZXNhYwogIAogICMgR2xvYmFsIHZh
cmlhYmxlczoKQEAgLTExMDgzLDcgKzExMDg0LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5Nzdl
NGY3YTQyIDEwMDc1NQogIGNhbl9idWlsZF9zaGFyZWQ9eWVzCiAgCiAgIyBBbGwga25vd24gbGlu
a2VycyByZXF1aXJlIGEgYC5hJyBhcmNoaXZlIGZvciBzdGF0aWMgbGlua2luZyAoZXhjZXB0IE1T
VkMsCi1AQCAtODQ3MCw4ICs4OTY5LDYgQEAgZmkKK0BAIC04NTUyLDggKzkwNTEsNiBAQCBmaQog
IGx0X3Byb2dfY29tcGlsZXJfcGljPQogIGx0X3Byb2dfY29tcGlsZXJfc3RhdGljPQogIApAQCAt
MTEwOTIsNyArMTEwOTMsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1
CiAgCiAgICBpZiB0ZXN0ICIkR0NDIiA9IHllczsgdGhlbgogICAgICBsdF9wcm9nX2NvbXBpbGVy
X3dsPSctV2wsJwotQEAgLTg2MzcsNiArOTEzNCwxMiBAQCAkYXNfZWNob19uICJjaGVja2luZyBm
b3IgJGNvbXBpbGVyIG9wdGlvbiB0byBwcm9kdWNlIFBJQy4uLiAiICZndDsmYW1wOzY7IH0KK0BA
IC04NzE5LDYgKzkyMTYsMTIgQEAgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRjb21waWxlciBv
cHRpb24gdG8gcHJvZHVjZSBQSUMuLi4gIiAmZ3Q7JmFtcDs2OyB9CiAgCWx0X3Byb2dfY29tcGls
ZXJfcGljPSctLXNoYXJlZCcKICAJbHRfcHJvZ19jb21waWxlcl9zdGF0aWM9Jy0tc3RhdGljJwog
IAk7OwpAQCAtMTExMDUsNyArMTExMDYsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0Zjdh
NDIgMTAwNzU1CiAgICAgICAgcGdjYyogfCBwZ2Y3NyogfCBwZ2Y5MCogfCBwZ2Y5NSogfCBwZ2Zv
cnRyYW4qKQogICAgICAgICAgIyBQb3J0bGFuZCBHcm91cCBjb21waWxlcnMgKCpub3QqIHRoZSBQ
ZW50aXVtIGdjYyBjb21waWxlciwKICAJIyB3aGljaCBsb29rcyB0byBiZSBhIGRlYWQgcHJvamVj
dCkKLUBAIC04Njk5LDcgKzkyMDIsNyBAQCAkYXNfZWNob19uICJjaGVja2luZyBmb3IgJGNvbXBp
bGVyIG9wdGlvbiB0byBwcm9kdWNlIFBJQy4uLiAiICZndDsmYW1wOzY7IH0KK0BAIC04NzgxLDcg
KzkyODQsNyBAQCAkYXNfZWNob19uICJjaGVja2luZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBw
cm9kdWNlIFBJQy4uLiAiICZndDsmYW1wOzY7IH0KICAgICAgICBsdF9wcm9nX2NvbXBpbGVyX3Bp
Yz0nLUtQSUMnCiAgICAgICAgbHRfcHJvZ19jb21waWxlcl9zdGF0aWM9Jy1Cc3RhdGljJwogICAg
ICAgIGNhc2UgJGNjX2Jhc2VuYW1lIGluCkBAIC0xMTExNCw3ICsxMTExNSw3IEBAIGluZGV4IGU1
NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAJbHRfcHJvZ19jb21waWxlcl93bD0nLVFv
cHRpb24gbGQgJzs7CiAgICAgICAgKikKICAJbHRfcHJvZ19jb21waWxlcl93bD0nLVdsLCc7Owot
QEAgLTg3NTYsMTMgKzkyNTksMTcgQEAgY2FzZSAkaG9zdF9vcyBpbgorQEAgLTg4MzgsMTMgKzkz
NDEsMTcgQEAgY2FzZSAkaG9zdF9vcyBpbgogICAgICBsdF9wcm9nX2NvbXBpbGVyX3BpYz0iJGx0
X3Byb2dfY29tcGlsZXJfcGljIC1EUElDIgogICAgICA7OwogIGVzYWMKQEAgLTExMTM4LDcgKzEx
MTM5LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIAogICMKICAj
IENoZWNrIHRvIG1ha2Ugc3VyZSB0aGUgUElDIGZsYWcgYWN0dWFsbHkgd29ya3MuCi1AQCAtODgy
Myw2ICs5MzMwLDExIEBAIGZpCitAQCAtODkwNSw2ICs5NDEyLDExIEBAIGZpCiAgCiAgCiAgCkBA
IC0xMTE1MCw3ICsxMTE1MSw3IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3
NTUKICAjCiAgIyBDaGVjayB0byBtYWtlIHN1cmUgdGhlIHN0YXRpYyBmbGFnIGFjdHVhbGx5IHdv
cmtzLgogICMKLUBAIC05MTczLDcgKzk2ODUsOCBAQCBfTFRfRU9GCitAQCAtOTI1NSw3ICs5NzY3
LDggQEAgX0xUX0VPRgogICAgICAgIGFsbG93X3VuZGVmaW5lZF9mbGFnPXVuc3VwcG9ydGVkCiAg
ICAgICAgYWx3YXlzX2V4cG9ydF9zeW1ib2xzPW5vCiAgICAgICAgZW5hYmxlX3NoYXJlZF93aXRo
X3N0YXRpY19ydW50aW1lcz15ZXMKQEAgLTExMTYwLDcgKzExMTYxLDcgQEAgaW5kZXggZTU0OTNi
MzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIAogICAgICAgIGlmICRMRCAtLWhlbHAgMiZndDsm
YW1wOzEgfCAkR1JFUCAnYXV0by1pbXBvcnQnICZndDsgL2Rldi9udWxsOyB0aGVuCiAgICAgICAg
ICBhcmNoaXZlX2NtZHM9JyRDQyAtc2hhcmVkICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9m
bGFncyAtbyAkb3V0cHV0X29iamRpci8kc29uYW1lICR7d2x9LS1lbmFibGUtYXV0by1pbWFnZS1i
YXNlIC1YbGlua2VyIC0tb3V0LWltcGxpYiAtWGxpbmtlciAkbGliJwotQEAgLTkyNzIsMTIgKzk3
ODUsMTIgQEAgX0xUX0VPRgorQEAgLTkzNTQsMTIgKzk4NjcsMTIgQEAgX0xUX0VPRgogIAkgIHdo
b2xlX2FyY2hpdmVfZmxhZ19zcGVjPSctLXdob2xlLWFyY2hpdmUkY29udmVuaWVuY2UgLS1uby13
aG9sZS1hcmNoaXZlJwogIAkgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9CiAgCSAgaGFyZGNv
ZGVfbGliZGlyX2ZsYWdfc3BlY19sZD0nLXJwYXRoICRsaWJkaXInCkBAIC0xMTE3NSw3ICsxMTE3
Niw3IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAJICBmaQogIAkg
IDs7CiAgCWVzYWMKLUBAIC05MjkxLDggKzk4MDQsOCBAQCBfTFRfRU9GCitAQCAtOTM3Myw4ICs5
ODg2LDggQEAgX0xUX0VPRgogIAlhcmNoaXZlX2NtZHM9JyRMRCAtQnNoYXJlYWJsZSAkbGlib2Jq
cyAkZGVwbGlicyAkbGlua2VyX2ZsYWdzIC1vICRsaWInCiAgCXdsYXJjPQogICAgICAgIGVsc2UK
QEAgLTExMTg2LDcgKzExMTg3LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEw
MDc1NQogICAgICAgIGZpCiAgICAgICAgOzsKICAKLUBAIC05MzEwLDggKzk4MjMsOCBAQCBfTFRf
RU9GCitAQCAtOTM5Miw4ICs5OTA1LDggQEAgX0xUX0VPRgogIAogIF9MVF9FT0YKICAgICAgICBl
bGlmICRMRCAtLWhlbHAgMiZndDsmYW1wOzEgfCAkR1JFUCAnOiBzdXBwb3J0ZWQgdGFyZ2V0czou
KiBlbGYnICZndDsgL2Rldi9udWxsOyB0aGVuCkBAIC0xMTE5Nyw3ICsxMTE5OCw3IEBAIGluZGV4
IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAgICAgICBlbHNlCiAgCWxkX3NobGli
cz1ubwogICAgICAgIGZpCi1AQCAtOTM1Nyw4ICs5ODcwLDggQEAgX0xUX0VPRgorQEAgLTk0Mzks
OCArOTk1Miw4IEBAIF9MVF9FT0YKICAKICAgICAgKikKICAgICAgICBpZiAkTEQgLS1oZWxwIDIm
Z3Q7JmFtcDsxIHwgJEdSRVAgJzogc3VwcG9ydGVkIHRhcmdldHM6LiogZWxmJyAmZ3Q7IC9kZXYv
bnVsbDsgdGhlbgpAQCAtMTEyMDgsNyArMTEyMDksNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3
N2U0ZjdhNDIgMTAwNzU1CiAgICAgICAgZWxzZQogIAlsZF9zaGxpYnM9bm8KICAgICAgICBmaQot
QEAgLTk0ODgsNyArMTAwMDEsMTMgQEAgX0xUX0VPRgorQEAgLTk1NzAsNyArMTAwODMsMTMgQEAg
X0xUX0VPRgogIAlhbGxvd191bmRlZmluZWRfZmxhZz0nLWJlcm9rJwogICAgICAgICAgIyBEZXRl
cm1pbmUgdGhlIGRlZmF1bHQgbGlicGF0aCBmcm9tIHRoZSB2YWx1ZSBlbmNvZGVkIGluIGFuCiAg
ICAgICAgICAjIGVtcHR5IGV4ZWN1dGFibGUuCkBAIC0xMTIyMyw3ICsxMTIyNCw3IEBAIGluZGV4
IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAvKiBlbmQgY29uZmRlZnMuaC4gICov
CiAgCiAgaW50Ci1AQCAtOTUwMSwyMiArMTAwMjAsMjkgQEAgbWFpbiAoKQorQEAgLTk1ODMsMjIg
KzEwMTAyLDI5IEBAIG1haW4gKCkKICBfQUNFT0YKICBpZiBhY19mbl9jX3RyeV9saW5rICIkTElO
RU5PIjsgdGhlbiA6CiAgCkBAIC0xMTI2Niw3ICsxMTI2Nyw3IEBAIGluZGV4IGU1NDkzYjMxNjkx
Li45OTc3ZTRmN2E0MiAxMDA3NTUKICAKICAgICAgICAgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3Nw
ZWM9JyR7d2x9LWJsaWJwYXRoOiRsaWJkaXI6JyIkYWl4X2xpYnBhdGgiCiAgICAgICAgICBhcmNo
aXZlX2V4cHN5bV9jbWRzPSckQ0MgLW8gJG91dHB1dF9vYmpkaXIvJHNvbmFtZSAkbGlib2JqcyAk
ZGVwbGlicyAnIlwke3dsfSRub19lbnRyeV9mbGFnIicgJGNvbXBpbGVyX2ZsYWdzIGBpZiB0ZXN0
ICJ4JHthbGxvd191bmRlZmluZWRfZmxhZ30iICE9ICJ4IjsgdGhlbiBmdW5jX2VjaG9fYWxsICIk
e3dsfSR7YWxsb3dfdW5kZWZpbmVkX2ZsYWd9IjsgZWxzZSA6OyBmaWAgJyJcJHt3bH0kZXhwX3N5
bV9mbGFnOlwkZXhwb3J0X3N5bWJvbHMgJHNoYXJlZF9mbGFnIgotQEAgLTk1MjgsNyArMTAwNTQs
MTMgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9s
aWI6L2xpYiI7IGZpCitAQCAtOTYxMCw3ICsxMDEzNiwxMyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xp
YnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAJZWxzZQogIAkg
IyBEZXRlcm1pbmUgdGhlIGRlZmF1bHQgbGlicGF0aCBmcm9tIHRoZSB2YWx1ZSBlbmNvZGVkIGlu
IGFuCiAgCSAjIGVtcHR5IGV4ZWN1dGFibGUuCkBAIC0xMTI4MSw3ICsxMTI4Miw3IEBAIGluZGV4
IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAvKiBlbmQgY29uZmRlZnMuaC4gICov
CiAgCiAgaW50Ci1AQCAtOTU0MSwyMiArMTAwNzMsMjkgQEAgbWFpbiAoKQorQEAgLTk2MjMsMjIg
KzEwMTU1LDI5IEBAIG1haW4gKCkKICBfQUNFT0YKICBpZiBhY19mbl9jX3RyeV9saW5rICIkTElO
RU5PIjsgdGhlbiA6CiAgCkBAIC0xMTMyNCw3ICsxMTMyNSw3IEBAIGluZGV4IGU1NDkzYjMxNjkx
Li45OTc3ZTRmN2E0MiAxMDA3NTUKICAKICAJIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JyR7
d2x9LWJsaWJwYXRoOiRsaWJkaXI6JyIkYWl4X2xpYnBhdGgiCiAgCSAgIyBXYXJuaW5nIC0gd2l0
aG91dCB1c2luZyB0aGUgb3RoZXIgcnVuIHRpbWUgbG9hZGluZyBmbGFncywKLUBAIC05NjAxLDIw
ICsxMDE0MCw2MyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRo
PSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC05NjgzLDIwICsxMDIyMiw2MyBAQCBpZiB0ZXN0IC16
ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKICAg
ICAgICAjIE1pY3Jvc29mdCBWaXN1YWwgQysrLgogICAgICAgICMgaGFyZGNvZGVfbGliZGlyX2Zs
YWdfc3BlYyBpcyBhY3R1YWxseSBtZWFuaW5nbGVzcywgYXMgdGhlcmUgaXMKICAgICAgICAjIG5v
IHNlYXJjaCBwYXRoIGZvciBETExzLgpAQCAtMTE0MDIsNyArMTE0MDMsNyBAQCBpbmRleCBlNTQ5
M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgICAgICAgOzsKICAKICAgICAgZGFyd2luKiB8
IHJoYXBzb2R5KikKLUBAIC05Njc1LDcgKzEwMjU3LDcgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJw
YXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCitAQCAtOTc1Nyw3ICsx
MDMzOSw3IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91
c3IvbGliOi9saWIiOyBmaQogIAogICAgICAjIEZyZWVCU0QgMyBhbmQgZ3JlYXRlciB1c2VzIGdj
YyAtc2hhcmVkIHRvIGRvIHNoYXJlZCBsaWJyYXJpZXMuCiAgICAgIGZyZWVic2QqIHwgZHJhZ29u
Zmx5KikKQEAgLTExNDExLDcgKzExNDEyLDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3
YTQyIDEwMDc1NQogICAgICAgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9Jy1SJGxpYmRpcicK
ICAgICAgICBoYXJkY29kZV9kaXJlY3Q9eWVzCiAgICAgICAgaGFyZGNvZGVfc2hsaWJwYXRoX3Zh
cj1ubwotQEAgLTk2ODMsNyArMTAyNjUsNyBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0
aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC05NzY1LDcgKzEwMzQ3LDcg
QEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6
L2xpYiI7IGZpCiAgCiAgICAgIGhwdXg5KikKICAgICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllczsg
dGhlbgpAQCAtMTE0MjAsNyArMTE0MjEsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0Zjdh
NDIgMTAwNzU1CiAgICAgICAgZWxzZQogIAlhcmNoaXZlX2NtZHM9JyRSTSAkb3V0cHV0X29iamRp
ci8kc29uYW1lfiRMRCAtYiArYiAkaW5zdGFsbF9saWJkaXIgLW8gJG91dHB1dF9vYmpkaXIvJHNv
bmFtZSAkbGlib2JqcyAkZGVwbGlicyAkbGlua2VyX2ZsYWdzfnRlc3QgJG91dHB1dF9vYmpkaXIv
JHNvbmFtZSA9ICRsaWIgfHwgbXYgJG91dHB1dF9vYmpkaXIvJHNvbmFtZSAkbGliJwogICAgICAg
IGZpCi1AQCAtOTY5OSw3ICsxMDI4MSw3IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRo
ZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQorQEAgLTk3ODEsNyArMTAzNjMsNyBA
QCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjov
bGliIjsgZmkKICAKICAgICAgaHB1eDEwKikKICAgICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllcyAm
YW1wOyZhbXA7IHRlc3QgIiR3aXRoX2dudV9sZCIgPSBubzsgdGhlbgpAQCAtMTE0MjksNyArMTE0
MzAsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgICAgICAgZWxz
ZQogIAlhcmNoaXZlX2NtZHM9JyRMRCAtYiAraCAkc29uYW1lICtiICRpbnN0YWxsX2xpYmRpciAt
byAkbGliICRsaWJvYmpzICRkZXBsaWJzICRsaW5rZXJfZmxhZ3MnCiAgICAgICAgZmkKLUBAIC05
NzIzLDEwICsxMDMwNSwxMCBAQCBpZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9s
aWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKK0BAIC05ODA1LDEwICsxMDM4NywxMCBAQCBpZiB0
ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9saWJwYXRoPSIvdXNyL2xpYjovbGliIjsg
ZmkKICAJICBhcmNoaXZlX2NtZHM9JyRDQyAtc2hhcmVkICR7d2x9K2ggJHt3bH0kc29uYW1lIC1v
ICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzJwogIAkgIDs7CiAgCWlhNjQq
KQpAQCAtMTE0NDIsNyArMTE0NDMsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIg
MTAwNzU1CiAgCSAgOzsKICAJZXNhYwogICAgICAgIGVsc2UKLUBAIC05ODA1LDIzICsxMDM4Nywz
NiBAQCBmaQorQEAgLTk4ODcsMjMgKzEwNDY5LDM2IEBAIGZpCiAgCiAgICAgIGlyaXg1KiB8IGly
aXg2KiB8IG5vbnN0b3B1eCopCiAgICAgICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4KQEAg
LTExNDg3LDcgKzExNDg4LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1
NQogICAgICAgIGVsc2UKICAJYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCAkbGlib2JqcyAkZGVw
bGlicyAkY29tcGlsZXJfZmxhZ3MgLXNvbmFtZSAkc29uYW1lIGB0ZXN0IC1uICIkdmVyc3RyaW5n
IiAmYW1wOyZhbXA7IGZ1bmNfZWNob19hbGwgIi1zZXRfdmVyc2lvbiAkdmVyc3RyaW5nImAgLXVw
ZGF0ZV9yZWdpc3RyeSAke291dHB1dF9vYmpkaXJ9L3NvX2xvY2F0aW9ucyAtbyAkbGliJwogIAlh
cmNoaXZlX2V4cHN5bV9jbWRzPSckQ0MgLXNoYXJlZCAkbGlib2JqcyAkZGVwbGlicyAkY29tcGls
ZXJfZmxhZ3MgLXNvbmFtZSAkc29uYW1lIGB0ZXN0IC1uICIkdmVyc3RyaW5nIiAmYW1wOyZhbXA7
IGZ1bmNfZWNob19hbGwgIi1zZXRfdmVyc2lvbiAkdmVyc3RyaW5nPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmAtdXBkYXRlX3JlZ2lzdHJ5JHtvdXRwdXRfb2Jq
ZGlyfS9zb19sb2NhdGlvbnMtZXhwb3J0c19maWxlJGV4cG9ydF9zeW1ib2xzLW8kbGliJy1AQC05
OTA2LDcrMTA1MDEsN0BAcm0tZmNvcmVjb25mdGVzdC5lcnJjb25mdGVzdC4kYWNfb2JqZXh0XCtA
QC05OTg4LDcrMTA1ODMsN0BAcm0tZmNvcmVjb25mdGVzdC5lcnJjb25mdGVzdC4kYWNfb2JqZXh0
XG9zZjQqfG9zZjUqKSNhc29zZjMqd2l0aHRoZWFkZGl0aW9ub2YtbXN5bWZsYWdpZnRlc3QiPiJg
IC11cGRhdGVfcmVnaXN0cnkgJHtvdXRwdXRfb2JqZGlyfS9zb19sb2NhdGlvbnMgLWV4cG9ydHNf
ZmlsZSAkZXhwb3J0X3N5bWJvbHMgLW8gJGxpYicKLUBAIC05OTA2LDcgKzEwNTAxLDcgQEAgcm0g
LWYgY29yZSBjb25mdGVzdC5lcnIgY29uZnRlc3QuJGFjX29iamV4dCBcCitAQCAtOTk4OCw3ICsx
MDU4Myw3IEBAIHJtIC1mIGNvcmUgY29uZnRlc3QuZXJyIGNvbmZ0ZXN0LiRhY19vYmpleHQgXAog
ICAgICBvc2Y0KiB8IG9zZjUqKQkjIGFzIG9zZjMqIHdpdGggdGhlIGFkZGl0aW9uIG9mIC1tc3lt
IGZsYWcKICAgICAgICBpZiB0ZXN0ICI8L2E+JEdDQyIgPSB5ZXM7IHRoZW4KICAJYWxsb3dfdW5k
ZWZpbmVkX2ZsYWc9JyAke3dsfS1leHBlY3RfdW5yZXNvbHZlZCAke3dsfVwqJwpAQCAtMTE0OTYs
NyArMTE0OTcsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgCWhh
cmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JyR7d2x9LXJwYXRoICR7d2x9JGxpYmRpcicKICAgICAg
ICBlbHNlCiAgCWFsbG93X3VuZGVmaW5lZF9mbGFnPScgLWV4cGVjdF91bnJlc29sdmVkIFwqJwot
QEAgLTk5MjUsOSArMTA1MjAsOSBAQCBybSAtZiBjb3JlIGNvbmZ0ZXN0LmVyciBjb25mdGVzdC4k
YWNfb2JqZXh0IFwKK0BAIC0xMDAwNyw5ICsxMDYwMiw5IEBAIHJtIC1mIGNvcmUgY29uZnRlc3Qu
ZXJyIGNvbmZ0ZXN0LiRhY19vYmpleHQgXAogICAgICAgIG5vX3VuZGVmaW5lZF9mbGFnPScgLXog
ZGVmcycKICAgICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllczsgdGhlbgogIAl3bGFyYz0nJHt3bH0n
CkBAIC0xMTUwOCw3ICsxMTUwOSw3IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAx
MDA3NTUKICAgICAgICBlbHNlCiAgCWNhc2UgYCRDQyAtViAyJmd0OyZhbXA7MWAgaW4KICAJKiJD
b21waWxlcnMgNS4wIiopCi1AQCAtMTA1MDMsOCArMTEwOTgsOSBAQCBjeWd3aW4qIHwgbWluZ3cq
IHwgcHczMiogfCBjZWdjYyopCitAQCAtMTA1ODUsOCArMTExODAsOSBAQCBjeWd3aW4qIHwgbWlu
Z3cqIHwgcHczMiogfCBjZWdjYyopCiAgICBuZWVkX3ZlcnNpb249bm8KICAgIG5lZWRfbGliX3By
ZWZpeD1ubwogIApAQCAtMTE1MjAsNyArMTE1MjEsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3
N2U0ZjdhNDIgMTAwNzU1CiAgICAgIGxpYnJhcnlfbmFtZXNfc3BlYz0nJGxpYm5hbWUuZGxsLmEn
CiAgICAgICMgRExMIGlzIGluc3RhbGxlZCB0byAkKGxpYmRpcikvLi4vYmluIGJ5IHBvc3RpbnN0
YWxsX2NtZHMKICAgICAgcG9zdGluc3RhbGxfY21kcz0nYmFzZV9maWxlPWBiYXNlbmFtZSBcJHtm
aWxlfWB+Ci1AQCAtMTA1MzcsMTMgKzExMTMzLDcxIEBAIGN5Z3dpbiogfCBtaW5ndyogfCBwdzMy
KiB8IGNlZ2NjKikKK0BAIC0xMDYxOSwxMyArMTEyMTUsNzEgQEAgY3lnd2luKiB8IG1pbmd3KiB8
IHB3MzIqIHwgY2VnY2MqKQogICAgICAgIGxpYnJhcnlfbmFtZXNfc3BlYz0nYGVjaG8gJHtsaWJu
YW1lfSB8IHNlZCAtZSAncy9ebGliL3B3LydgYGVjaG8gJHtyZWxlYXNlfSB8ICRTRUQgLWUgJ3Mv
Wy5dLy0vZydgJHt2ZXJzdWZmaXh9JHtzaGFyZWRfZXh0fScKICAgICAgICA7OwogICAgICBlc2Fj
CkBAIC0xMTU5Myw3ICsxMTU5NCw3IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAx
MDA3NTUKICAgICMgRklYTUU6IGZpcnN0IHdlIHNob3VsZCBzZWFyY2ggLiBhbmQgdGhlIGRpcmVj
dG9yeSB0aGUgZXhlY3V0YWJsZSBpcyBpbgogICAgc2hsaWJwYXRoX3Zhcj1QQVRICiAgICA7Owot
QEAgLTEwNjM1LDcgKzExMjg5LDcgQEAgaGFpa3UqKQorQEAgLTEwNzE3LDcgKzExMzcxLDcgQEAg
aGFpa3UqKQogICAgc29uYW1lX3NwZWM9JyR7bGlibmFtZX0ke3JlbGVhc2V9JHtzaGFyZWRfZXh0
fSRtYWpvcicKICAgIHNobGlicGF0aF92YXI9TElCUkFSWV9QQVRICiAgICBzaGxpYnBhdGhfb3Zl
cnJpZGVzX3J1bnBhdGg9eWVzCkBAIC0xMTYwMiwxNiArMTE2MDMsMTYgQEAgaW5kZXggZTU0OTNi
MzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICAgaGFyZGNvZGVfaW50b19saWJzPXllcwogICAg
OzsKICAKLUBAIC0xMTQzMSw3ICsxMjA4NSw3IEBAIGVsc2UKK0BAIC0xMTUxMyw3ICsxMjE2Nyw3
IEBAIGVsc2UKICAgIGx0X2RsdW5rbm93bj0wOyBsdF9kbG5vX3VzY29yZT0xOyBsdF9kbG5lZWRf
dXNjb3JlPTIKICAgIGx0X3N0YXR1cz0kbHRfZGx1bmtub3duCiAgICBjYXQgJmd0OyBjb25mdGVz
dC4kYWNfZXh0ICZsdDsmbHQ7X0xUX0VPRgotLSNsaW5lIDExNDM0ICJjb25maWd1cmUiCistI2xp
bmUgMTE1MTYgImNvbmZpZ3VyZSIKICsjbGluZSAkTElORU5PICJjb25maWd1cmUiCiAgI2luY2x1
ZGUgImNvbmZkZWZzLmgiCiAgCiAgI2lmIEhBVkVfRExGQ05fSAotQEAgLTExNDc1LDEwICsxMjEy
OSwxMCBAQCBlbHNlCitAQCAtMTE1NTcsMTAgKzEyMjExLDEwIEBAIGVsc2UKICAvKiBXaGVuIC1m
dmlzYmlsaXR5PWhpZGRlbiBpcyB1c2VkLCBhc3N1bWUgdGhlIGNvZGUgaGFzIGJlZW4gYW5ub3Rh
dGVkCiAgICAgY29ycmVzcG9uZGluZ2x5IGZvciB0aGUgc3ltYm9scyBuZWVkZWQuICAqLwogICNp
ZiBkZWZpbmVkKF9fR05VQ19fKSAmYW1wOyZhbXA7ICgoKF9fR05VQ19fID09IDMpICZhbXA7JmFt
cDsgKF9fR05VQ19NSU5PUl9fICZndDs9IDMpKSB8fCAoX19HTlVDX18gJmd0OyAzKSkKQEAgLTEx
NjI0LDE2ICsxMTYyNSwxNiBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1
CiAgaW50IG1haW4gKCkKICB7CiAgICB2b2lkICpzZWxmID0gZGxvcGVuICgwLCBMVF9ETEdMT0JB
THxMVF9ETExBWllfT1JfTk9XKTsKLUBAIC0xMTUzNyw3ICsxMjE5MSw3IEBAIGVsc2UKK0BAIC0x
MTYxOSw3ICsxMjI3Myw3IEBAIGVsc2UKICAgIGx0X2RsdW5rbm93bj0wOyBsdF9kbG5vX3VzY29y
ZT0xOyBsdF9kbG5lZWRfdXNjb3JlPTIKICAgIGx0X3N0YXR1cz0kbHRfZGx1bmtub3duCiAgICBj
YXQgJmd0OyBjb25mdGVzdC4kYWNfZXh0ICZsdDsmbHQ7X0xUX0VPRgotLSNsaW5lIDExNTQwICJj
b25maWd1cmUiCistI2xpbmUgMTE2MjIgImNvbmZpZ3VyZSIKICsjbGluZSAkTElORU5PICJjb25m
aWd1cmUiCiAgI2luY2x1ZGUgImNvbmZkZWZzLmgiCiAgCiAgI2lmIEhBVkVfRExGQ05fSAotQEAg
LTExNTgxLDEwICsxMjIzNSwxMCBAQCBlbHNlCitAQCAtMTE2NjMsMTAgKzEyMzE3LDEwIEBAIGVs
c2UKICAvKiBXaGVuIC1mdmlzYmlsaXR5PWhpZGRlbiBpcyB1c2VkLCBhc3N1bWUgdGhlIGNvZGUg
aGFzIGJlZW4gYW5ub3RhdGVkCiAgICAgY29ycmVzcG9uZGluZ2x5IGZvciB0aGUgc3ltYm9scyBu
ZWVkZWQuICAqLwogICNpZiBkZWZpbmVkKF9fR05VQ19fKSAmYW1wOyZhbXA7ICgoKF9fR05VQ19f
ID09IDMpICZhbXA7JmFtcDsgKF9fR05VQ19NSU5PUl9fICZndDs9IDMpKSB8fCAoX19HTlVDX18g
Jmd0OyAzKSkKQEAgLTExNjQ2LDcgKzExNjQ3LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5Nzdl
NGY3YTQyIDEwMDc1NQogIGludCBtYWluICgpCiAgewogICAgdm9pZCAqc2VsZiA9IGRsb3BlbiAo
MCwgTFRfRExHTE9CQUx8TFRfRExMQVpZX09SX05PVyk7Ci1AQCAtMTM5OTQsMTMgKzE0NjQ4LDIw
IEBAIGV4ZWV4dD0nYCRFQ0hPICIkZXhlZXh0IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVf
c3Vic3QiYCcKK0BAIC0xNDExMCwxMyArMTQ3NjQsMjAgQEAgZXhlZXh0PSdgJEVDSE8gIiRleGVl
eHQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGx0X3Vuc2V0PSdgJEVD
SE8gIiRsdF91bnNldCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgbHRf
U1AyTkw9J2AkRUNITyAiJGx0X1NQMk5MIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vi
c3QiYCcKICBsdF9OTDJTUD0nYCRFQ0hPICIkbHRfTkwyU1AiIHwgJFNFRCAiJGRlbGF5X3Npbmds
ZV9xdW90ZV9zdWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpgJ0BALTExNjY3LDcrMTE2NjgsN0BAaW5kZXhlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIxMDA3
NTVTVFJJUD0nYCRFQ0hPIj4iYCcKQEAgLTExNjY3LDcgKzExNjY4LDcgQEAgaW5kZXggZTU0OTNi
MzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIFNUUklQPSdgJEVDSE8gIjwvYT4kU1RSSVAiIHwg
JFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIFJBTkxJQj0nYCRFQ0hPICIkUkFO
TElCIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBvbGRfcG9zdGluc3Rh
bGxfY21kcz0nYCRFQ0hPICIkb2xkX3Bvc3RpbnN0YWxsX2NtZHMiIHwgJFNFRCAiJGRlbGF5X3Np
bmdsZV9xdW90ZV9zdWJzdCJgJwotQEAgLTE0MDE1LDE0ICsxNDY3NiwxNyBAQCBsdF9jdl9zeXNf
Z2xvYmFsX3N5bWJvbF9waXBlPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBl
IiB8ICRTRUQgIiRkZQorQEAgLTE0MTMxLDE0ICsxNDc5MiwxNyBAQCBsdF9jdl9zeXNfZ2xvYmFs
X3N5bWJvbF9waXBlPSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9waXBlIiB8ICRT
RUQgIiRkZQogIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsPSdgJEVDSE8gIiRsdF9j
dl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jZGVjbCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3Rl
X3N1YnN0ImAnCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3M9J2Ak
RUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzIiB8ICRTRUQg
IiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90
b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4PSdgJEVDSE8gIiRsdF9jdl9zeXNfZ2xvYmFsX3N5
bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVf
cXVvdGVfc3Vic3Q8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
YCdAQC0xMTY4Niw3KzExNjg3LDdAQGluZGV4ZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyMTAwNzU1
RFNZTVVUSUw9J2AkRUNITyI+ImAnCkBAIC0xMTY4Niw3ICsxMTY4Nyw3IEBAIGluZGV4IGU1NDkz
YjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICBEU1lNVVRJTD0nYCRFQ0hPICI8L2E+JERTWU1V
VElMIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKICBOTUVESVQ9J2AkRUNI
TyAiJE5NRURJVCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgTElQTz0n
YCRFQ0hPICIkTElQTyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCi1AQCAt
MTQwNTUsMTIgKzE0NzE5LDEyIEBAIGhhcmRjb2RlX3NobGlicGF0aF92YXI9J2AkRUNITyAiJGhh
cmRjb2RlX3NobGlicGF0aF92YXIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xCitAQCAtMTQxNzEs
MTIgKzE0ODM1LDEyIEBAIGhhcmRjb2RlX3NobGlicGF0aF92YXI9J2AkRUNITyAiJGhhcmRjb2Rl
X3NobGlicGF0aF92YXIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xCiAgaGFyZGNvZGVfYXV0b21h
dGljPSdgJEVDSE8gIiRoYXJkY29kZV9hdXRvbWF0aWMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9x
dW90ZV9zdWJzdCJgJwogIGluaGVyaXRfcnBhdGg9J2AkRUNITyAiJGluaGVyaXRfcnBhdGgiIHwg
JFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIGxpbmtfYWxsX2RlcGxpYnM9J2Ak
RUNITyAiJGxpbmtfYWxsX2RlcGxpYnMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJz
dDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpgJ0BALTExNzAw
LDcrMTE3MDEsN0BAaW5kZXhlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIxMDA3NTVmaWxlX2xpc3Rf
c3BlYz0nYCRFQ0hPIj4iYCcKQEAgLTExNzAwLDcgKzExNzAxLDcgQEAgaW5kZXggZTU0OTNiMzE2
OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogIGZpbGVfbGlzdF9zcGVjPSdgJEVDSE8gIjwvYT4kZmls
ZV9saXN0X3NwZWMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwogIHZhcmlh
Ymxlc19zYXZlZF9mb3JfcmVsaW5rPSdgJEVDSE8gIiR2YXJpYWJsZXNfc2F2ZWRfZm9yX3JlbGlu
ayIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCiAgbmVlZF9saWJfcHJlZml4
PSdgJEVDSE8gIiRuZWVkX2xpYl9wcmVmaXgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9z
dWJzdDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpgJy1AQC0x
NDExNSw4KzE0Nzc5LDEzQEByZWxvYWRfZmxhZ1wrQEAtMTQyMzEsOCsxNDg5NSwxM0BAcmVsb2Fk
X2ZsYWdcT0JKRFVNUFxkZXBsaWJzX2NoZWNrX21ldGhvZFxmaWxlX21hZ2ljX2NtZFxAQC0xMTcx
NCw3KzExNzE1LDdAQGluZGV4ZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyMTAwNzU1U1RSSVBcUkFO
TElCXENDXC1AQC0xNDEyNiwxMisxNDc5NSwxNEBAbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlw
ZVwrQEAtMTQyNDIsMTIrMTQ5MTEsMTRAQGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGVcbHRf
Y3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY2RlY2xcbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9f
Y19uYW1lX2FkZHJlc3NcbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3Nf
bGliX3ByZWZpeFxAQC0xMTczMCw3KzExNzMxLDdAQGluZGV4ZTU0OTNiMzE2OTEuLjk5NzdlNGY3
YTQyMTAwNzU1RFNZTVVUSUxcTk1FRElUXExJUE9cLUBALTE0MTQ3LDcrMTQ4MTgsNkBAbm9fdW5k
ZWZpbmVkX2ZsYWdcK0BALTE0MjYzLDcrMTQ5MzQsNkBAbm9fdW5kZWZpbmVkX2ZsYWdcaGFyZGNv
ZGVfbGliZGlyX2ZsYWdfc3BlY1xoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjX2xkXGhhcmRjb2Rl
X2xpYmRpcl9zZXBhcmF0b3JcQEAtMTE3MzgsNysxMTczOSw3QEBpbmRleGU1NDkzYjMxNjkxLi45
OTc3ZTRmN2E0MjEwMDc1NWV4Y2x1ZGVfZXhwc3ltc1xpbmNsdWRlX2V4cHN5bXNcZmlsZV9saXN0
X3NwZWNcLUBALTE0MTgzLDYrMTQ4NTMsN0BAbW9kdWxlX2NtZHNcK0BALTE0Mjk5LDYrMTQ5Njks
N0BAbW9kdWxlX2NtZHNcbW9kdWxlX2V4cHN5bV9jbWRzXGV4cG9ydF9zeW1ib2xzX2NtZHNccHJl
bGlua19jbWRzXEBALTExNzQ2LDcrMTE3NDcsN0BAaW5kZXhlNTQ5M2IzMTY5MS4uOTk3N2U0Zjdh
NDIxMDA3NTVwb3N0aW5zdGFsbF9jbWRzXHBvc3R1bmluc3RhbGxfY21kc1xmaW5pc2hfY21kc1wt
QEAtMTQ5MzksNysxNTYxMCw4QEAkYXNfZWNob1giPiJgJwotQEAgLTE0MTE1LDggKzE0Nzc5LDEz
IEBAIHJlbG9hZF9mbGFnIFwKK0BAIC0xNDIzMSw4ICsxNDg5NSwxMyBAQCByZWxvYWRfZmxhZyBc
CiAgT0JKRFVNUCBcCiAgZGVwbGlic19jaGVja19tZXRob2QgXAogIGZpbGVfbWFnaWNfY21kIFwK
QEAgLTExNzE0LDcgKzExNzE1LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEw
MDc1NQogIFNUUklQIFwKICBSQU5MSUIgXAogIENDIFwKLUBAIC0xNDEyNiwxMiArMTQ3OTUsMTQg
QEAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZSBcCitAQCAtMTQyNDIsMTIgKzE0OTExLDE0
IEBAIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGUgXAogIGx0X2N2X3N5c19nbG9iYWxfc3lt
Ym9sX3RvX2NkZWNsIFwKICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVz
cyBcCiAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3NfbGliX3ByZWZp
eCBcCkBAIC0xMTczMCw3ICsxMTczMSw3IEBAIGluZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0
MiAxMDA3NTUKICBEU1lNVVRJTCBcCiAgTk1FRElUIFwKICBMSVBPIFwKLUBAIC0xNDE0Nyw3ICsx
NDgxOCw2IEBAIG5vX3VuZGVmaW5lZF9mbGFnIFwKK0BAIC0xNDI2Myw3ICsxNDkzNCw2IEBAIG5v
X3VuZGVmaW5lZF9mbGFnIFwKICBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjIFwKICBoYXJkY29k
ZV9saWJkaXJfZmxhZ19zcGVjX2xkIFwKICBoYXJkY29kZV9saWJkaXJfc2VwYXJhdG9yIFwKQEAg
LTExNzM4LDcgKzExNzM5LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1
NQogIGV4Y2x1ZGVfZXhwc3ltcyBcCiAgaW5jbHVkZV9leHBzeW1zIFwKICBmaWxlX2xpc3Rfc3Bl
YyBcCi1AQCAtMTQxODMsNiArMTQ4NTMsNyBAQCBtb2R1bGVfY21kcyBcCitAQCAtMTQyOTksNiAr
MTQ5NjksNyBAQCBtb2R1bGVfY21kcyBcCiAgbW9kdWxlX2V4cHN5bV9jbWRzIFwKICBleHBvcnRf
c3ltYm9sc19jbWRzIFwKICBwcmVsaW5rX2NtZHMgXApAQCAtMTE3NDYsNyArMTE3NDcsNyBAQCBp
bmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1CiAgcG9zdGluc3RhbGxfY21kcyBc
CiAgcG9zdHVuaW5zdGFsbF9jbWRzIFwKICBmaW5pc2hfY21kcyBcCi1AQCAtMTQ5MzksNyArMTU2
MTAsOCBAQCAkYXNfZWNobyBYIjwvYT4kZmlsZSIgfAorQEAgLTE1MDU1LDcgKzE1NzI2LDggQEAg
JGFzX2VjaG8gWCIkZmlsZSIgfAogICMgTk9URTogQ2hhbmdlcyBtYWRlIHRvIHRoaXMgZmlsZSB3
aWxsIGJlIGxvc3Q6IGxvb2sgYXQgbHRtYWluLnNoLgogICMKICAjICAgQ29weXJpZ2h0IChDKSAx
OTk2LCAxOTk3LCAxOTk4LCAxOTk5LCAyMDAwLCAyMDAxLCAyMDAzLCAyMDA0LCAyMDA1LApAQCAt
MTE3NTYsNyArMTE3NTcsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0ZjdhNDIgMTAwNzU1
CiAgIyAgIFdyaXR0ZW4gYnkgR29yZG9uIE1hdHppZ2tlaXQsIDE5OTYKICAjCiAgIyAgIFRoaXMg
ZmlsZSBpcyBwYXJ0IG9mIEdOVSBMaWJ0b29sLgotQEAgLTE1MDQyLDE5ICsxNTcxNCw0MiBAQCBT
UDJOTD0kbHRfbHRfU1AyTkwKK0BAIC0xNTE1OCwxOSArMTU4MzAsNDIgQEAgU1AyTkw9JGx0X2x0
X1NQMk5MCiAgIyB0dXJuIG5ld2xpbmVzIGludG8gc3BhY2VzLgogIE5MMlNQPSRsdF9sdF9OTDJT
UAogIApAQCAtMTE4MDAsNyArMTE4MDEsNyBAQCBpbmRleCBlNTQ5M2IzMTY5MS4uOTk3N2U0Zjdh
NDIgMTAwNzU1CiAgIyBBIHN5bWJvbCBzdHJpcHBpbmcgcHJvZ3JhbS4KICBTVFJJUD0kbHRfU1RS
SVAKICAKLUBAIC0xNTA4NCw2ICsxNTc3OSwxMiBAQCBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9h
ZGRyZXNzPSRsdF9sdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcworQEAg
LTE1MjAwLDYgKzE1ODk1LDEyIEBAIGdsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3M9JGx0
X2x0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzCiAgIyBUcmFuc2Zvcm0g
dGhlIG91dHB1dCBvZiBubSBpbiBhIEMgbmFtZSBhZGRyZXNzIHBhaXIgd2hlbiBsaWIgcHJlZml4
IGlzIG5lZWRlZC4KICBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXg9
JGx0X2x0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXgK
ICAKQEAgLTExODEzLDcgKzExODE0LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQy
IDEwMDc1NQogICMgVGhlIG5hbWUgb2YgdGhlIGRpcmVjdG9yeSB0aGF0IGNvbnRhaW5zIHRlbXBv
cmFyeSBsaWJ0b29sIGZpbGVzLgogIG9iamRpcj0kb2JqZGlyCiAgCi1AQCAtMTUwOTMsNiArMTU3
OTQsOSBAQCBNQUdJQ19DTUQ9JE1BR0lDX0NNRAorQEAgLTE1MjA5LDYgKzE1OTEwLDkgQEAgTUFH
SUNfQ01EPSRNQUdJQ19DTUQKICAjIE11c3Qgd2UgbG9jayBmaWxlcyB3aGVuIGRvaW5nIGNvbXBp
bGF0aW9uPwogIG5lZWRfbG9ja3M9JGx0X25lZWRfbG9ja3MKICAKQEAgLTExODIzLDcgKzExODI0
LDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICMgVG9vbCB0byBt
YW5pcHVsYXRlIGFyY2hpdmVkIERXQVJGIGRlYnVnIHN5bWJvbCBmaWxlcyBvbiBNYWMgT1MgWC4K
ICBEU1lNVVRJTD0kbHRfRFNZTVVUSUwKICAKLUBAIC0xNTIwNywxMiArMTU5MTEsMTIgQEAgd2l0
aF9nY2M9JEdDQworQEAgLTE1MzIzLDEyICsxNjAyNywxMiBAQCB3aXRoX2djYz0kR0NDCiAgIyBD
b21waWxlciBmbGFnIHRvIHR1cm4gb2ZmIGJ1aWx0aW4gZnVuY3Rpb25zLgogIG5vX2J1aWx0aW5f
ZmxhZz0kbHRfbHRfcHJvZ19jb21waWxlcl9ub19idWlsdGluX2ZsYWcKICAKQEAgLTExODM5LDcg
KzExODQwLDcgQEAgaW5kZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICMgQ29t
cGlsZXIgZmxhZyB0byBwcmV2ZW50IGR5bmFtaWMgbGlua2luZy4KICBsaW5rX3N0YXRpY19mbGFn
PSRsdF9sdF9wcm9nX2NvbXBpbGVyX3N0YXRpYwogIAotQEAgLTE1Mjk5LDkgKzE2MDAzLDYgQEAg
aW5oZXJpdF9ycGF0aD0kaW5oZXJpdF9ycGF0aAorQEAgLTE1NDE1LDkgKzE2MTE5LDYgQEAgaW5o
ZXJpdF9ycGF0aD0kaW5oZXJpdF9ycGF0aAogICMgV2hldGhlciBsaWJ0b29sIG11c3QgbGluayBh
IHByb2dyYW0gYWdhaW5zdCBhbGwgaXRzIGRlcGVuZGVuY3kgbGlicmFyaWVzLgogIGxpbmtfYWxs
X2RlcGxpYnM9JGxpbmtfYWxsX2RlcGxpYnMKICAKQEAgLTExODQ5LDcgKzExODUwLDcgQEAgaW5k
ZXggZTU0OTNiMzE2OTEuLjk5NzdlNGY3YTQyIDEwMDc1NQogICMgU2V0IHRvICJ5ZXMiIGlmIGV4
cG9ydGVkIHN5bWJvbHMgYXJlIHJlcXVpcmVkLgogIGFsd2F5c19leHBvcnRfc3ltYm9scz0kYWx3
YXlzX2V4cG9ydF9zeW1ib2xzCiAgCi1AQCAtMTUzMTcsNiArMTYwMTgsOSBAQCBpbmNsdWRlX2V4
cHN5bXM9JGx0X2luY2x1ZGVfZXhwc3ltcworQEAgLTE1NDMzLDYgKzE2MTM0LDkgQEAgaW5jbHVk
ZV9leHBzeW1zPSRsdF9pbmNsdWRlX2V4cHN5bXMKICAjIENvbW1hbmRzIG5lY2Vzc2FyeSBmb3Ig
bGlua2luZyBwcm9ncmFtcyAoYWdhaW5zdCBsaWJyYXJpZXMpIHdpdGggdGVtcGxhdGVzLgogIHBy
ZWxpbmtfY21kcz0kbHRfcHJlbGlua19jbWRzCiAgCkBAIC0xMTg1OSw3ICsxMTg2MCw3IEBAIGlu
ZGV4IGU1NDkzYjMxNjkxLi45OTc3ZTRmN2E0MiAxMDA3NTUKICAjIFNwZWNpZnkgZmlsZW5hbWUg
Y29udGFpbmluZyBpbnB1dCBmaWxlcy4KICBmaWxlX2xpc3Rfc3BlYz0kbHRfZmlsZV9saXN0X3Nw
ZWMKICAKLUBAIC0xNTM0OSwyMTAgKzE2MDUzLDE2OSBAQCBsdG1haW49IiRhY19hdXhfZGlyL2x0
bWFpbi5zaCIKK0BAIC0xNTQ2NSwyMTAgKzE2MTY5LDE2OSBAQCBsdG1haW49IiRhY19hdXhfZGly
L2x0bWFpbi5zaCIKICAgICMgaWYgZmluZHMgbWl4ZWQgQ1IvTEYgYW5kIExGLW9ubHkgbGluZXMu
ICBTaW5jZSBzZWQgb3BlcmF0ZXMgaW4KICAgICMgdGV4dCBtb2RlLCBpdCBwcm9wZXJseSBjb252
ZXJ0cyBsaW5lcyB0byBDUi9MRi4gIFRoaXMgYmFzaCBwcm9ibGVtCiAgICAjIGlzIHJlcG9ydGVk
bHkgZml4ZWQsIGJ1dCB3aHkgbm90IHJ1biBvbiBvbGQgdmVyc2lvbnMgdG9vPwpAQCAtMTkzMTcs
NyArMTkzMTgsNyBAQCBpbmRleCBiZjkyYjVlMDc5MC4uYzU3M2RhOTBjNWMgMTAwNjQ0CiAgIyBU
aGVzZSBleGlzdCBlbnRpcmVseSB0byBmb29sIGFjbG9jYWwgd2hlbiBib290c3RyYXBwaW5nIGxp
YnRvb2wuCiAgIwogZGlmZiAtLWdpdCBhL29wY29kZXMvY29uZmlndXJlIGIvb3Bjb2Rlcy9jb25m
aWd1cmUKLWluZGV4IDQ3MjNkY2RjMWU4Li4wMDZjY2RhYTQ1OCAxMDA3NTUKK2luZGV4IDhkMWU1
NjFjOTQyLi5hMDI5MWRmYmZhNyAxMDA3NTUKIC0tLSBhL29wY29kZXMvY29uZmlndXJlCiArKysg
Yi9vcGNvZGVzL2NvbmZpZ3VyZQogQEAgLTY4MCw2ICs2ODAsOSBAQCBPVE9PTApAQCAtMjEyMjks
NiArMjEyMzAsMTkyNCBAQCBpbmRleCA0NzIzZGNkYzFlOC4uMDA2Y2NkYWE0NTggMTAwNzU1CiAg
ICAgIChybSAtZiAiJG9maWxlIiAmYW1wOyZhbXA7IGNwICIkY2ZnZmlsZSIgIiRvZmlsZSIgJmFt
cDsmYW1wOyBybSAtZiAiJGNmZ2ZpbGUiKQogICAgY2htb2QgK3ggIiRvZmlsZTxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzorZGlmZi0tZ2l0YS96bGliL2NvbmZp
Z3VyZWIvemxpYi9jb25maWd1cmUraW5kZXhkZTZmYTdlOTk2MC4uY2NlNDQ4YjZhNTMxMDA3NTUr
LS0tYS96bGliL2NvbmZpZ3VyZSsrKytiL3psaWIvY29uZmlndXJlK0BALTY0Niw4KzY0NiwxMUBA
T1RPT0wrTElQTytOTUVESVQrRFNZTVVUSUwrK01BTklGRVNUX1RPT0wrUkFOTElCKythY19jdF9B
UitBUisrRExMVE9PTCtPQkpEVU1QK0xOX1MrTk0rQEAtNzc0LDYrNzc3LDdAQGVuYWJsZV9zdGF0
aWMrd2l0aF9waWMrZW5hYmxlX2Zhc3RfaW5zdGFsbCt3aXRoX2dudV9sZCsrd2l0aF9saWJ0b29s
X3N5c3Jvb3QrZW5hYmxlX2xpYnRvb2xfbG9jaytlbmFibGVfaG9zdF9zaGFyZWQrJytAQC0xNDI4
LDYrMTQzMiw4QEBPcHRpb25hbFBhY2thZ2VzOistLXdpdGgtcGljdHJ5dG91c2Vvbmx5UElDL25v
bi1QSUNvYmplY3RzW2RlZmF1bHQ9dXNlK2JvdGhdKy0td2l0aC1nbnUtbGRhc3N1bWV0aGVDY29t
cGlsZXJ1c2VzR05VbGRbZGVmYXVsdD1ub10rKy0td2l0aC1saWJ0b29sLXN5c3Jvb3Q9RElSU2Vh
cmNoZm9yZGVwZW5kZW50bGlicmFyaWVzd2l0aGluRElSKysob3J0aGVjb21waWxlcidzc3lzcm9v
dGlmbm90c3BlY2lmaWVkKS4rK1NvbWVpbmZsdWVudGlhbGVudmlyb25tZW50dmFyaWFibGVzOitD
Q0Njb21waWxlcmNvbW1hbmQrQEAtNDE0Nyw4KzQxNTMsOEBAZXNhYysrKystbWFjcm9fdmVyc2lv
bj0nMi4yLjdhJystbWFjcm9fcmV2aXNpb249JzEuMzEzNCcrK21hY3JvX3ZlcnNpb249JzIuNCcr
K21hY3JvX3JldmlzaW9uPScxLjMyOTMnKysrK0BALTQxODgsNys0MTk0LDdAQEVDSE89JEVDSE8k
RUNITyRFQ0hPJEVDSE8kRUNITyRFQ0hPK3skYXNfZWNobyI+IgogIAorZGlmZiAtLWdpdCBhL3ps
aWIvY29uZmlndXJlIGIvemxpYi9jb25maWd1cmUKK2luZGV4IGRlNmZhN2U5OTYwLi5jY2U0NDhi
NmE1MyAxMDA3NTUKKy0tLSBhL3psaWIvY29uZmlndXJlCisrKysgYi96bGliL2NvbmZpZ3VyZQor
QEAgLTY0Niw4ICs2NDYsMTEgQEAgT1RPT0wKKyBMSVBPCisgTk1FRElUCisgRFNZTVVUSUwKKytN
QU5JRkVTVF9UT09MCisgUkFOTElCCisrYWNfY3RfQVIKKyBBUgorK0RMTFRPT0wKKyBPQkpEVU1Q
CisgTE5fUworIE5NCitAQCAtNzc0LDYgKzc3Nyw3IEBAIGVuYWJsZV9zdGF0aWMKKyB3aXRoX3Bp
YworIGVuYWJsZV9mYXN0X2luc3RhbGwKKyB3aXRoX2dudV9sZAorK3dpdGhfbGlidG9vbF9zeXNy
b290CisgZW5hYmxlX2xpYnRvb2xfbG9jaworIGVuYWJsZV9ob3N0X3NoYXJlZAorICcKK0BAIC0x
NDI4LDYgKzE0MzIsOCBAQCBPcHRpb25hbCBQYWNrYWdlczoKKyAgIC0td2l0aC1waWMgICAgICAg
ICAgICAgIHRyeSB0byB1c2Ugb25seSBQSUMvbm9uLVBJQyBvYmplY3RzIFtkZWZhdWx0PXVzZQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYm90aF0KKyAgIC0td2l0aC1nbnUtbGQgICAgICAg
ICAgIGFzc3VtZSB0aGUgQyBjb21waWxlciB1c2VzIEdOVSBsZCBbZGVmYXVsdD1ub10KKysgIC0t
d2l0aC1saWJ0b29sLXN5c3Jvb3Q9RElSIFNlYXJjaCBmb3IgZGVwZW5kZW50IGxpYnJhcmllcyB3
aXRoaW4gRElSCisrICAgICAgICAgICAgICAgICAgICAgICAgKG9yIHRoZSBjb21waWxlcidzIHN5
c3Jvb3QgaWYgbm90IHNwZWNpZmllZCkuCisgCisgU29tZSBpbmZsdWVudGlhbCBlbnZpcm9ubWVu
dCB2YXJpYWJsZXM6CisgICBDQyAgICAgICAgICBDIGNvbXBpbGVyIGNvbW1hbmQKK0BAIC00MTQ3
LDggKzQxNTMsOCBAQCBlc2FjCisgCisgCisgCistbWFjcm9fdmVyc2lvbj0nMi4yLjdhJworLW1h
Y3JvX3JldmlzaW9uPScxLjMxMzQnCisrbWFjcm9fdmVyc2lvbj0nMi40JworK21hY3JvX3Jldmlz
aW9uPScxLjMyOTMnCisgCisgCisgCitAQCAtNDE4OCw3ICs0MTk0LDcgQEAgRUNITz0kRUNITyRF
Q0hPJEVDSE8kRUNITyRFQ0hPJEVDSE8KKyB7ICRhc19lY2hvICI8L2E+JGFzX21lOiR7YXNfbGlu
ZW5vLSRMSU5FTk99OiBjaGVja2luZyBob3cgdG8gcHJpbnQgc3RyaW5ncyIgJmd0OyZhbXA7NQor
ICRhc19lY2hvX24gImNoZWNraW5nIGhvdyB0byBwcmludCBzdHJpbmdzLi4uICIgJmd0OyZhbXA7
NjsgfQorICMgVGVzdCBwcmludCBmaXJzdCwgYmVjYXVzZSBpdCB3aWxsIGJlIGEgYnVpbHRpbiBp
ZiBwcmVzZW50LgorLWlmIHRlc3QgIlhgcHJpbnQgLXIgLS0gLW4gMiZndDsvZGV2L251bGxgIiA9
IFgtbiAmYW1wOyZhbXA7IFwKKytpZiB0ZXN0ICJYYCggcHJpbnQgLXIgLS0gLW4gKSAyJmd0Oy9k
ZXYvbnVsbGAiID0gWC1uICZhbXA7JmFtcDsgXAorICAgIHRlc3QgIlhgcHJpbnQgLXIgLS0gJEVD
SE8gMiZndDsvZGV2L251bGxgIiA9ICJYJEVDSE8iOyB0aGVuCisgICBFQ0hPPSdwcmludCAtciAt
LScKKyBlbGlmIHRlc3QgIlhgcHJpbnRmICVzICRFQ0hPIDImZ3Q7L2Rldi9udWxsYCIgPSAiWCRF
Q0hPIjsgdGhlbgorQEAgLTUwMDQsOCArNTAxMCw4IEBAICRhc19lY2hvX24gImNoZWNraW5nIHdo
ZXRoZXIgdGhlIHNoZWxsIHVuZGVyc3RhbmRzIHNvbWUgWFNJIGNvbnN0cnVjdHMuLi4gIiAmZ3Q7
JmFtcDs2OworICMgVHJ5IHNvbWUgWFNJIGZlYXR1cmVzCisgeHNpX3NoZWxsPW5vCisgKCBfbHRf
ZHVtbXk9ImEvYi9jIgorLSAgdGVzdCAiJHtfbHRfZHVtbXkjIyovfSwke19sdF9kdW1teSUvKn0s
IiR7X2x0X2R1bW15JSIkX2x0X2R1bW15In0sIFwKKy0gICAgICA9IGMsYS9iLCwgXAorKyAgdGVz
dCAiJHtfbHRfZHVtbXkjIyovfSwke19sdF9kdW1teSUvKn0sJHtfbHRfZHVtbXkjPz99IiR7X2x0
X2R1bW15JSIkX2x0X2R1bW15In0sIFwKKysgICAgICA9IGMsYS9iLGIvYywgXAorICAgICAmYW1w
OyZhbXA7IGV2YWwgJ3Rlc3QgJCgoIDEgKyAxICkpIC1lcSAyIFwKKyAgICAgJmFtcDsmYW1wOyB0
ZXN0ICIkeyNfbHRfZHVtbXl9IiAtZXEgNScgKSAmZ3Q7L2Rldi9udWxsIDImZ3Q7JmFtcDsxIFwK
KyAgICZhbXA7JmFtcDsgeHNpX3NoZWxsPXllcworQEAgLTUwNTQsNiArNTA2MCw4MCBAQCBlc2Fj
CisgCisgCisgCisreyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBjaGVj
a2luZyBob3cgdG8gY29udmVydCAkYnVpbGQgZmlsZSBuYW1lcyB0byAkaG9zdCBmb3JtYXQiICZn
dDsmYW1wOzUKKyskYXNfZWNob19uICJjaGVja2luZyBob3cgdG8gY29udmVydCAkYnVpbGQgZmls
ZSBuYW1lcyB0byAkaG9zdCBmb3JtYXQuLi4gIiAmZ3Q7JmFtcDs2OyB9CisraWYgJHtsdF9jdl90
b19ob3N0X2ZpbGVfY21kKzp9IGZhbHNlOyB0aGVuIDoKKysgICRhc19lY2hvX24gIihjYWNoZWQp
ICIgJmd0OyZhbXA7NgorK2Vsc2UKKysgIGNhc2UgJGhvc3QgaW4KKysgICotKi1taW5ndyogKQor
KyAgICBjYXNlICRidWlsZCBpbgorKyAgICAgICotKi1taW5ndyogKSAjIGFjdHVhbGx5IG1zeXMK
KysgICAgICAgIGx0X2N2X3RvX2hvc3RfZmlsZV9jbWQ9ZnVuY19jb252ZXJ0X2ZpbGVfbXN5c190
b193MzIKKysgICAgICAgIDs7CisrICAgICAgKi0qLWN5Z3dpbiogKQorKyAgICAgICAgbHRfY3Zf
dG9faG9zdF9maWxlX2NtZD1mdW5jX2NvbnZlcnRfZmlsZV9jeWd3aW5fdG9fdzMyCisrICAgICAg
ICA7OworKyAgICAgICogKSAjIG90aGVyd2lzZSwgYXNzdW1lICpuaXgKKysgICAgICAgIGx0X2N2
X3RvX2hvc3RfZmlsZV9jbWQ9ZnVuY19jb252ZXJ0X2ZpbGVfbml4X3RvX3czMgorKyAgICAgICAg
OzsKKysgICAgZXNhYworKyAgICA7OworKyAgKi0qLWN5Z3dpbiogKQorKyAgICBjYXNlICRidWls
ZCBpbgorKyAgICAgICotKi1taW5ndyogKSAjIGFjdHVhbGx5IG1zeXMKKysgICAgICAgIGx0X2N2
X3RvX2hvc3RfZmlsZV9jbWQ9ZnVuY19jb252ZXJ0X2ZpbGVfbXN5c190b19jeWd3aW4KKysgICAg
ICAgIDs7CisrICAgICAgKi0qLWN5Z3dpbiogKQorKyAgICAgICAgbHRfY3ZfdG9faG9zdF9maWxl
X2NtZD1mdW5jX2NvbnZlcnRfZmlsZV9ub29wCisrICAgICAgICA7OworKyAgICAgICogKSAjIG90
aGVyd2lzZSwgYXNzdW1lICpuaXgKKysgICAgICAgIGx0X2N2X3RvX2hvc3RfZmlsZV9jbWQ9ZnVu
Y19jb252ZXJ0X2ZpbGVfbml4X3RvX2N5Z3dpbgorKyAgICAgICAgOzsKKysgICAgZXNhYworKyAg
ICA7OworKyAgKiApICMgdW5oYW5kbGVkIGhvc3RzIChhbmQgIm5vcm1hbCIgbmF0aXZlIGJ1aWxk
cykKKysgICAgbHRfY3ZfdG9faG9zdF9maWxlX2NtZD1mdW5jX2NvbnZlcnRfZmlsZV9ub29wCisr
ICAgIDs7CisrZXNhYworKworK2ZpCisrCisrdG9faG9zdF9maWxlX2NtZD0kbHRfY3ZfdG9faG9z
dF9maWxlX2NtZAorK3sgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogcmVz
dWx0OiAkbHRfY3ZfdG9faG9zdF9maWxlX2NtZCIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIkbHRf
Y3ZfdG9faG9zdF9maWxlX2NtZCIgJmd0OyZhbXA7NjsgfQorKworKworKworKworKworK3sgJGFz
X2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcgaG93IHRvIGNvbnZl
cnQgJGJ1aWxkIGZpbGUgbmFtZXMgdG8gdG9vbGNoYWluIGZvcm1hdCIgJmd0OyZhbXA7NQorKyRh
c19lY2hvX24gImNoZWNraW5nIGhvdyB0byBjb252ZXJ0ICRidWlsZCBmaWxlIG5hbWVzIHRvIHRv
b2xjaGFpbiBmb3JtYXQuLi4gIiAmZ3Q7JmFtcDs2OyB9CisraWYgJHtsdF9jdl90b190b29sX2Zp
bGVfY21kKzp9IGZhbHNlOyB0aGVuIDoKKysgICRhc19lY2hvX24gIihjYWNoZWQpICIgJmd0OyZh
bXA7NgorK2Vsc2UKKysgICNhc3N1bWUgb3JkaW5hcnkgY3Jvc3MgdG9vbHMsIG9yIG5hdGl2ZSBi
dWlsZC4KKytsdF9jdl90b190b29sX2ZpbGVfY21kPWZ1bmNfY29udmVydF9maWxlX25vb3AKKytj
YXNlICRob3N0IGluCisrICAqLSotbWluZ3cqICkKKysgICAgY2FzZSAkYnVpbGQgaW4KKysgICAg
ICAqLSotbWluZ3cqICkgIyBhY3R1YWxseSBtc3lzCisrICAgICAgICBsdF9jdl90b190b29sX2Zp
bGVfY21kPWZ1bmNfY29udmVydF9maWxlX21zeXNfdG9fdzMyCisrICAgICAgICA7OworKyAgICBl
c2FjCisrICAgIDs7CisrZXNhYworKworK2ZpCisrCisrdG9fdG9vbF9maWxlX2NtZD0kbHRfY3Zf
dG9fdG9vbF9maWxlX2NtZAorK3sgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5P
fTogcmVzdWx0OiAkbHRfY3ZfdG9fdG9vbF9maWxlX2NtZCIgJmd0OyZhbXA7NQorKyRhc19lY2hv
ICIkbHRfY3ZfdG9fdG9vbF9maWxlX2NtZCIgJmd0OyZhbXA7NjsgfQorKworKworKworKworKwor
IHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcgZm9yICRM
RCBvcHRpb24gdG8gcmVsb2FkIG9iamVjdCBmaWxlcyIgJmd0OyZhbXA7NQorICRhc19lY2hvX24g
ImNoZWNraW5nIGZvciAkTEQgb3B0aW9uIHRvIHJlbG9hZCBvYmplY3QgZmlsZXMuLi4gIiAmZ3Q7
JmFtcDs2OyB9CisgaWYgJHtsdF9jdl9sZF9yZWxvYWRfZmxhZys6fSBmYWxzZTsgdGhlbiA6CitA
QCAtNTA3MCw2ICs1MTUwLDExIEBAIGNhc2UgJHJlbG9hZF9mbGFnIGluCisgZXNhYworIHJlbG9h
ZF9jbWRzPSckTEQkcmVsb2FkX2ZsYWcgLW8gJG91dHB1dCRyZWxvYWRfb2JqcycKKyBjYXNlICRo
b3N0X29zIGluCisrICBjeWd3aW4qIHwgbWluZ3cqIHwgcHczMiogfCBjZWdjYyopCisrICAgIGlm
IHRlc3QgIiRHQ0MiICE9IHllczsgdGhlbgorKyAgICAgIHJlbG9hZF9jbWRzPWZhbHNlCisrICAg
IGZpCisrICAgIDs7CisgICBkYXJ3aW4qKQorICAgICBpZiB0ZXN0ICIkR0NDPGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOj15ZXM7dGhlbityZWxvYWRfY21kcz0n
JExUQ0MkTFRDRkxBR1Mtbm9zdGRsaWIke3dsfS1yLW8kb3V0cHV0JHJlbG9hZF9vYmpzJytAQC01
MjM4LDcrNTMyMyw4QEBtaW5ndyp8cHczMiopK2x0X2N2X2RlcGxpYnNfY2hlY2tfbWV0aG9kPSdm
aWxlX21hZ2ljXng4NmFyY2hpdmVpbXBvcnR8Xng4NkRMTCcrbHRfY3ZfZmlsZV9tYWdpY19jbWQ9
J2Z1bmNfd2luMzJfbGliaWQnK2Vsc2UrLWx0X2N2X2RlcGxpYnNfY2hlY2tfbWV0aG9kPSdmaWxl
X21hZ2ljZmlsZWZvcm1hdHBlaSotaTM4NiguKmFyY2hpdGVjdHVyZTppMzg2KT8nKysjS2VlcHRo
aXNwYXR0ZXJuaW5zeW5jd2l0aHRoZW9uZWluZnVuY193aW4zMl9saWJpZC4rK2x0X2N2X2RlcGxp
YnNfY2hlY2tfbWV0aG9kPSdmaWxlX21hZ2ljZmlsZWZvcm1hdChwZWkqLWkzODYoLiphcmNoaXRl
Y3R1cmU6aTM4Nik/fHBlLWFybS13aW5jZXxwZS14ODYtNjQpJytsdF9jdl9maWxlX21hZ2ljX2Nt
ZD0nJE9CSkRVTVAtZicrZmkrOzsrQEAtNTM5Miw2KzU0NzgsMjFAQGVzYWMrZmkreyRhc19lY2hv
Ij4iID0geWVzOyB0aGVuCisgICAgICAgcmVsb2FkX2NtZHM9JyRMVENDICRMVENGTEFHUyAtbm9z
dGRsaWIgJHt3bH0tciAtbyAkb3V0cHV0JHJlbG9hZF9vYmpzJworQEAgLTUyMzgsNyArNTMyMyw4
IEBAIG1pbmd3KiB8IHB3MzIqKQorICAgICBsdF9jdl9kZXBsaWJzX2NoZWNrX21ldGhvZD0nZmls
ZV9tYWdpYyBeeDg2IGFyY2hpdmUgaW1wb3J0fF54ODYgRExMJworICAgICBsdF9jdl9maWxlX21h
Z2ljX2NtZD0nZnVuY193aW4zMl9saWJpZCcKKyAgIGVsc2UKKy0gICAgbHRfY3ZfZGVwbGlic19j
aGVja19tZXRob2Q9J2ZpbGVfbWFnaWMgZmlsZSBmb3JtYXQgcGVpKi1pMzg2KC4qYXJjaGl0ZWN0
dXJlOiBpMzg2KT8nCisrICAgICMgS2VlcCB0aGlzIHBhdHRlcm4gaW4gc3luYyB3aXRoIHRoZSBv
bmUgaW4gZnVuY193aW4zMl9saWJpZC4KKysgICAgbHRfY3ZfZGVwbGlic19jaGVja19tZXRob2Q9
J2ZpbGVfbWFnaWMgZmlsZSBmb3JtYXQgKHBlaSotaTM4NiguKmFyY2hpdGVjdHVyZTogaTM4Nik/
fHBlLWFybS13aW5jZXxwZS14ODYtNjQpJworICAgICBsdF9jdl9maWxlX21hZ2ljX2NtZD0nJE9C
SkRVTVAgLWYnCisgICBmaQorICAgOzsKK0BAIC01MzkyLDYgKzU0NzgsMjEgQEAgZXNhYworIGZp
CisgeyAkYXNfZWNobyAiPC9hPiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogcmVzdWx0OiAk
bHRfY3ZfZGVwbGlic19jaGVja19tZXRob2QiICZndDsmYW1wOzUKKyAkYXNfZWNobyAiJGx0X2N2
X2RlcGxpYnNfY2hlY2tfbWV0aG9kIiAmZ3Q7JmFtcDs2OyB9CisrCisrZmlsZV9tYWdpY19nbG9i
PQorK3dhbnRfbm9jYXNlZ2xvYj1ubworK2lmIHRlc3QgIiRidWlsZCIgPSAiJGhvc3QiOyB0aGVu
CisrICBjYXNlICRob3N0X29zIGluCisrICBtaW5ndyogfCBwdzMyKikKKysgICAgaWYgKCBzaG9w
dCB8IGdyZXAgbm9jYXNlZ2xvYiApICZndDsvZGV2L251bGwgMiZndDsmYW1wOzE7IHRoZW4KKysg
ICAgICB3YW50X25vY2FzZWdsb2I9eWVzCisrICAgIGVsc2UKKysgICAgICBmaWxlX21hZ2ljX2ds
b2I9YGVjaG8gYUFiQmNDZERlRWZGZ0doSGlJakprS2xMbU1uTm9PcFBxUXJSc1N0VHVVdlZ3V3hY
eVl6WiB8ICRTRUQgLWUgInMvXCguLlwpL3NcL1tcMV1cL1tcMV1cL2c7L2ciYAorKyAgICBmaQor
KyAgICA7OworKyAgZXNhYworK2ZpCisrCisgZmlsZV9tYWdpY19jbWQ9JGx0X2N2X2ZpbGVfbWFn
aWNfY21kCisgZGVwbGlic19jaGVja19tZXRob2Q9JGx0X2N2X2RlcGxpYnNfY2hlY2tfbWV0aG9k
CisgdGVzdCAteiAiJGRlcGxpYnNfY2hlY2tfbWV0aG9kIiAmYW1wOyZhbXA7IGRlcGxpYnNfY2hl
Y2tfbWV0aG9kPXVua25vd24KK0BAIC01NDA1LDExICs1NTA2LDE2NSBAQCB0ZXN0IC16ICIkZGVw
bGlic19jaGVja19tZXRob2QiICZhbXA7JmFtcDsgZGVwbGlic19jaGVja19tZXRob2Q9dW5rbm93
bgorIAorIAorIAorKworKworKworKworKworKworKworKworKworKworIAorIAorIGlmIHRlc3Qg
LW4gIiRhY190b29sX3ByZWZpeCI7IHRoZW4KKy0gICMgRXh0cmFjdCB0aGUgZmlyc3Qgd29yZCBv
ZiAiJHthY190b29sX3ByZWZpeH1hciIsIHNvIGl0IGNhbiBiZSBhIHByb2dyYW0gbmFtZSB3aXRo
IGFyZ3MuCistc2V0IGR1bW15ICR7YWNfdG9vbF9wcmVmaXh9YXI7IGFjX3dvcmQ9JDIKKysgICMg
RXh0cmFjdCB0aGUgZmlyc3Qgd29yZCBvZiAiJHthY190b29sX3ByZWZpeH1kbGx0b29sIiwgc28g
aXQgY2FuIGJlIGEgcHJvZ3JhbSBuYW1lIHdpdGggYXJncy4KKytzZXQgZHVtbXkgJHthY190b29s
X3ByZWZpeH1kbGx0b29sOyBhY193b3JkPSQyCisreyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGlu
ZW5vLSRMSU5FTk99OiBjaGVja2luZyBmb3IgJGFjX3dvcmQiICZndDsmYW1wOzUKKyskYXNfZWNo
b19uICJjaGVja2luZyBmb3IgJGFjX3dvcmQuLi4gIiAmZ3Q7JmFtcDs2OyB9CisraWYgJHthY19j
dl9wcm9nX0RMTFRPT0wrOn0gZmFsc2U7IHRoZW4gOgorKyAgJGFzX2VjaG9fbiAiKGNhY2hlZCkg
IiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAgaWYgdGVzdCAtbiAiJERMTFRPT0wiOyB0aGVuCisrICBh
Y19jdl9wcm9nX0RMTFRPT0w9IiRETExUT09MIiAjIExldCB0aGUgdXNlciBvdmVycmlkZSB0aGUg
dGVzdC4KKytlbHNlCisrYXNfc2F2ZV9JRlM9JElGUzsgSUZTPSRQQVRIX1NFUEFSQVRPUgorK2Zv
ciBhc19kaXIgaW4gJFBBVEgKKytkbworKyAgSUZTPSRhc19zYXZlX0lGUworKyAgdGVzdCAteiAi
JGFzX2RpciIgJmFtcDsmYW1wOyBhc19kaXI9LgorKyAgICBmb3IgYWNfZXhlY19leHQgaW4gJycg
JGFjX2V4ZWN1dGFibGVfZXh0ZW5zaW9uczsgZG8KKysgIGlmIGFzX2ZuX2V4ZWN1dGFibGVfcCAi
JGFzX2Rpci8kYWNfd29yZCRhY19leGVjX2V4dCI7IHRoZW4KKysgICAgYWNfY3ZfcHJvZ19ETExU
T09MPSIke2FjX3Rvb2xfcHJlZml4fWRsbHRvb2wiCisrICAgICRhc19lY2hvICIkYXNfbWU6JHth
c19saW5lbm8tJExJTkVOT306IGZvdW5kICRhc19kaXIvJGFjX3dvcmQkYWNfZXhlY19leHQiICZn
dDsmYW1wOzUKKysgICAgYnJlYWsgMgorKyAgZmkKKytkb25lCisrICBkb25lCisrSUZTPSRhc19z
YXZlX0lGUworKworK2ZpCisrZmkKKytETExUT09MPSRhY19jdl9wcm9nX0RMTFRPT0wKKytpZiB0
ZXN0IC1uICIkRExMVE9PTCI7IHRoZW4KKysgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVu
by0kTElORU5PfTogcmVzdWx0OiAkRExMVE9PTCIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIkRExM
VE9PTCIgJmd0OyZhbXA7NjsgfQorK2Vsc2UKKysgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xp
bmVuby0kTElORU5PfTogcmVzdWx0OiBubyIgJmd0OyZhbXA7NQorKyRhc19lY2hvICJubyIgJmd0
OyZhbXA7NjsgfQorK2ZpCisrCisrCisrZmkKKytpZiB0ZXN0IC16ICIkYWNfY3ZfcHJvZ19ETExU
T09MIjsgdGhlbgorKyAgYWNfY3RfRExMVE9PTD0kRExMVE9PTAorKyAgIyBFeHRyYWN0IHRoZSBm
aXJzdCB3b3JkIG9mICJkbGx0b29sIiwgc28gaXQgY2FuIGJlIGEgcHJvZ3JhbSBuYW1lIHdpdGgg
YXJncy4KKytzZXQgZHVtbXkgZGxsdG9vbDsgYWNfd29yZD0kMgorK3sgJGFzX2VjaG8gIiRhc19t
ZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcgZm9yICRhY193b3JkIiAmZ3Q7JmFtcDs1
CisrJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRhY193b3JkLi4uICIgJmd0OyZhbXA7NjsgfQor
K2lmICR7YWNfY3ZfcHJvZ19hY19jdF9ETExUT09MKzp9IGZhbHNlOyB0aGVuIDoKKysgICRhc19l
Y2hvX24gIihjYWNoZWQpICIgJmd0OyZhbXA7NgorK2Vsc2UKKysgIGlmIHRlc3QgLW4gIiRhY19j
dF9ETExUT09MIjsgdGhlbgorKyAgYWNfY3ZfcHJvZ19hY19jdF9ETExUT09MPSIkYWNfY3RfRExM
VE9PTCIgIyBMZXQgdGhlIHVzZXIgb3ZlcnJpZGUgdGhlIHRlc3QuCisrZWxzZQorK2FzX3NhdmVf
SUZTPSRJRlM7IElGUz0kUEFUSF9TRVBBUkFUT1IKKytmb3IgYXNfZGlyIGluICRQQVRICisrZG8K
KysgIElGUz0kYXNfc2F2ZV9JRlMKKysgIHRlc3QgLXogIiRhc19kaXIiICZhbXA7JmFtcDsgYXNf
ZGlyPS4KKysgICAgZm9yIGFjX2V4ZWNfZXh0IGluICcnICRhY19leGVjdXRhYmxlX2V4dGVuc2lv
bnM7IGRvCisrICBpZiBhc19mbl9leGVjdXRhYmxlX3AgIiRhc19kaXIvJGFjX3dvcmQkYWNfZXhl
Y19leHQiOyB0aGVuCisrICAgIGFjX2N2X3Byb2dfYWNfY3RfRExMVE9PTD0iZGxsdG9vbCIKKysg
ICAgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogZm91bmQgJGFzX2Rpci8k
YWNfd29yZCRhY19leGVjX2V4dCIgJmd0OyZhbXA7NQorKyAgICBicmVhayAyCisrICBmaQorK2Rv
bmUKKysgIGRvbmUKKytJRlM9JGFzX3NhdmVfSUZTCisrCisrZmkKKytmaQorK2FjX2N0X0RMTFRP
T0w9JGFjX2N2X3Byb2dfYWNfY3RfRExMVE9PTAorK2lmIHRlc3QgLW4gIiRhY19jdF9ETExUT09M
IjsgdGhlbgorKyAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiByZXN1
bHQ6ICRhY19jdF9ETExUT09MIiAmZ3Q7JmFtcDs1CisrJGFzX2VjaG8gIiRhY19jdF9ETExUT09M
IiAmZ3Q7JmFtcDs2OyB9CisrZWxzZQorKyAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5v
LSRMSU5FTk99OiByZXN1bHQ6IG5vIiAmZ3Q7JmFtcDs1CisrJGFzX2VjaG8gIm5vIiAmZ3Q7JmFt
cDs2OyB9CisrZmkKKysKKysgIGlmIHRlc3QgIngkYWNfY3RfRExMVE9PTCIgPSB4OyB0aGVuCisr
ICAgIERMTFRPT0w9ImZhbHNlIgorKyAgZWxzZQorKyAgICBjYXNlICRjcm9zc19jb21waWxpbmc6
JGFjX3Rvb2xfd2FybmVkIGluCisreWVzOikKKyt7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5l
bm8tJExJTkVOT306IFdBUk5JTkc6IHVzaW5nIGNyb3NzIHRvb2xzIG5vdCBwcmVmaXhlZCB3aXRo
IGhvc3QgdHJpcGxldCIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIkYXNfbWU6IFdBUk5JTkc6IHVz
aW5nIGNyb3NzIHRvb2xzIG5vdCBwcmVmaXhlZCB3aXRoIGhvc3QgdHJpcGxldCIgJmd0OyZhbXA7
Mjt9CisrYWNfdG9vbF93YXJuZWQ9eWVzIDs7CisrZXNhYworKyAgICBETExUT09MPSRhY19jdF9E
TExUT09MCisrICBmaQorK2Vsc2UKKysgIERMTFRPT0w9IiRhY19jdl9wcm9nX0RMTFRPT0wiCisr
ZmkKKysKKyt0ZXN0IC16ICIkRExMVE9PTCIgJmFtcDsmYW1wOyBETExUT09MPWRsbHRvb2wKKysK
KysKKysKKysKKysKKysKKysKKysKKysKKysKKyt7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5l
bm8tJExJTkVOT306IGNoZWNraW5nIGhvdyB0byBhc3NvY2lhdGUgcnVudGltZSBhbmQgbGluayBs
aWJyYXJpZXMiICZndDsmYW1wOzUKKyskYXNfZWNob19uICJjaGVja2luZyBob3cgdG8gYXNzb2Np
YXRlIHJ1bnRpbWUgYW5kIGxpbmsgbGlicmFyaWVzLi4uICIgJmd0OyZhbXA7NjsgfQorK2lmICR7
bHRfY3Zfc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQrOn0gZmFsc2U7IHRoZW4gOgorKyAgJGFz
X2VjaG9fbiAiKGNhY2hlZCkgIiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAgbHRfY3Zfc2hhcmVkbGli
X2Zyb21fbGlua2xpYl9jbWQ9J3Vua25vd24nCisrCisrY2FzZSAkaG9zdF9vcyBpbgorK2N5Z3dp
biogfCBtaW5ndyogfCBwdzMyKiB8IGNlZ2NjKikKKysgICMgdHdvIGRpZmZlcmVudCBzaGVsbCBm
dW5jdGlvbnMgZGVmaW5lZCBpbiBsdG1haW4uc2gKKysgICMgZGVjaWRlIHdoaWNoIHRvIHVzZSBi
YXNlZCBvbiBjYXBhYmlsaXRpZXMgb2YgJERMTFRPT0wKKysgIGNhc2UgYCRETExUT09MIC0taGVs
cCAyJmd0OyZhbXA7MWAgaW4KKysgICotLWlkZW50aWZ5LXN0cmljdCopCisrICAgIGx0X2N2X3No
YXJlZGxpYl9mcm9tX2xpbmtsaWJfY21kPWZ1bmNfY3lnbWluZ19kbGxfZm9yX2ltcGxpYgorKyAg
ICA7OworKyAgKikKKysgICAgbHRfY3Zfc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQ9ZnVuY19j
eWdtaW5nX2RsbF9mb3JfaW1wbGliX2ZhbGxiYWNrCisrICAgIDs7CisrICBlc2FjCisrICA7Owor
KyopCisrICAjIGZhbGxiYWNrOiBhc3N1bWUgbGlua2xpYiBJUyBzaGFyZWRsaWIKKysgIGx0X2N2
X3NoYXJlZGxpYl9mcm9tX2xpbmtsaWJfY21kPSIkRUNITyIKKysgIDs7CisrZXNhYworKworK2Zp
CisreyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiByZXN1bHQ6ICRsdF9j
dl9zaGFyZWRsaWJfZnJvbV9saW5rbGliX2NtZCIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIkbHRf
Y3Zfc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQiICZndDsmYW1wOzY7IH0KKytzaGFyZWRsaWJf
ZnJvbV9saW5rbGliX2NtZD0kbHRfY3Zfc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQKKyt0ZXN0
IC16ICIkc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQiICZhbXA7JmFtcDsgc2hhcmVkbGliX2Zy
b21fbGlua2xpYl9jbWQ9JEVDSE8KKysKKysKKysKKysKKysKKysKKysKKysKKytpZiB0ZXN0IC1u
ICIkYWNfdG9vbF9wcmVmaXgiOyB0aGVuCisrICBmb3IgYWNfcHJvZyBpbiBhcgorKyAgZG8KKysg
ICAgIyBFeHRyYWN0IHRoZSBmaXJzdCB3b3JkIG9mICIkYWNfdG9vbF9wcmVmaXgkYWNfcHJvZyIs
IHNvIGl0IGNhbiBiZSBhIHByb2dyYW0gbmFtZSB3aXRoIGFyZ3MuCisrc2V0IGR1bW15ICRhY190
b29sX3ByZWZpeCRhY19wcm9nOyBhY193b3JkPSQyCisgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNf
bGluZW5vLSRMSU5FTk99OiBjaGVja2luZyBmb3IgJGFjX3dvcmQiICZndDsmYW1wOzUKKyAkYXNf
ZWNob19uICJjaGVja2luZyBmb3IgJGFjX3dvcmQuLi4gIiAmZ3Q7JmFtcDs2OyB9CisgaWYgJHth
Y19jdl9wcm9nX0FSKzp9IGZhbHNlOyB0aGVuIDoKK0BAIC01NDI1LDcgKzU2ODAsNyBAQCBkbwor
ICAgdGVzdCAteiAiJGFzX2RpciIgJmFtcDsmYW1wOyBhc19kaXI9LgorICAgICBmb3IgYWNfZXhl
Y19leHQgaW4gJycgJGFjX2V4ZWN1dGFibGVfZXh0ZW5zaW9uczsgZG8KKyAgIGlmIGFzX2ZuX2V4
ZWN1dGFibGVfcCAiJGFzX2Rpci8kYWNfd29yZCRhY19leGVjX2V4dCI7IHRoZW4KKy0gICAgYWNf
Y3ZfcHJvZ19BUj0iJHthY190b29sX3ByZWZpeH1hciIKKysgICAgYWNfY3ZfcHJvZ19BUj0iJGFj
X3Rvb2xfcHJlZml4JGFjX3Byb2ciCisgICAgICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8t
JExJTkVOT306IGZvdW5kICRhc19kaXIvJGFjX3dvcmQkYWNfZXhlY19leHQiICZndDsmYW1wOzUK
KyAgICAgYnJlYWsgMgorICAgZmkKK0BAIC01NDQ1LDExICs1NzAwLDE1IEBAICRhc19lY2hvICJu
byIgJmd0OyZhbXA7NjsgfQorIGZpCisgCisgCisrICAgIHRlc3QgLW4gIiRBUiIgJmFtcDsmYW1w
OyBicmVhaworKyAgZG9uZQorIGZpCistaWYgdGVzdCAteiAiJGFjX2N2X3Byb2dfQVIiOyB0aGVu
CisraWYgdGVzdCAteiAiJEFSIjsgdGhlbgorICAgYWNfY3RfQVI9JEFSCistICAjIEV4dHJhY3Qg
dGhlIGZpcnN0IHdvcmQgb2YgImFyIiwgc28gaXQgY2FuIGJlIGEgcHJvZ3JhbSBuYW1lIHdpdGgg
YXJncy4KKy1zZXQgZHVtbXkgYXI7IGFjX3dvcmQ9JDIKKysgIGZvciBhY19wcm9nIGluIGFyCisr
ZG8KKysgICMgRXh0cmFjdCB0aGUgZmlyc3Qgd29yZCBvZiAiJGFjX3Byb2ciLCBzbyBpdCBjYW4g
YmUgYSBwcm9ncmFtIG5hbWUgd2l0aCBhcmdzLgorK3NldCBkdW1teSAkYWNfcHJvZzsgYWNfd29y
ZD0kMgorIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcg
Zm9yICRhY193b3JkIiAmZ3Q7JmFtcDs1CisgJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRhY193
b3JkLi4uICIgJmd0OyZhbXA7NjsgfQorIGlmICR7YWNfY3ZfcHJvZ19hY19jdF9BUis6fSBmYWxz
ZTsgdGhlbiA6CitAQCAtNTQ2NSw3ICs1NzI0LDcgQEAgZG8KKyAgIHRlc3QgLXogIiRhc19kaXIi
ICZhbXA7JmFtcDsgYXNfZGlyPS4KKyAgICAgZm9yIGFjX2V4ZWNfZXh0IGluICcnICRhY19leGVj
dXRhYmxlX2V4dGVuc2lvbnM7IGRvCisgICBpZiBhc19mbl9leGVjdXRhYmxlX3AgIiRhc19kaXIv
JGFjX3dvcmQkYWNfZXhlY19leHQiOyB0aGVuCistICAgIGFjX2N2X3Byb2dfYWNfY3RfQVI9ImFy
IgorKyAgICBhY19jdl9wcm9nX2FjX2N0X0FSPSIkYWNfcHJvZyIKKyAgICAgJGFzX2VjaG8gIiRh
c19tZToke2FzX2xpbmVuby0kTElORU5PfTogZm91bmQgJGFzX2Rpci8kYWNfd29yZCRhY19leGVj
X2V4dCIgJmd0OyZhbXA7NQorICAgICBicmVhayAyCisgICBmaQorQEAgLTU0ODQsNiArNTc0Mywx
MCBAQCBlbHNlCisgJGFzX2VjaG8gIm5vIiAmZ3Q7JmFtcDs2OyB9CisgZmkKKyAKKysKKysgIHRl
c3QgLW4gIiRhY19jdF9BUiIgJmFtcDsmYW1wOyBicmVhaworK2RvbmUKKysKKyAgIGlmIHRlc3Qg
IngkYWNfY3RfQVIiID0geDsgdGhlbgorICAgICBBUj0iZmFsc2UiCisgICBlbHNlCitAQCAtNTQ5
NSwxNiArNTc1OCw3MiBAQCBhY190b29sX3dhcm5lZD15ZXMgOzsKKyBlc2FjCisgICAgIEFSPSRh
Y19jdF9BUgorICAgZmkKKy1lbHNlCistICBBUj0iJGFjX2N2X3Byb2dfQVIiCisgZmkKKyAKKy10
ZXN0IC16ICIkQVIiICZhbXA7JmFtcDsgQVI9YXIKKy10ZXN0IC16ICIkQVJfRkxBR1MiICZhbXA7
JmFtcDsgQVJfRkxBR1M9Y3J1CisrOiAke0FSPWFyfQorKzogJHtBUl9GTEFHUz1jcnV9CisrCisr
CisrCisrCisrCisrCisrCisrCisrCisrCisrCisreyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGlu
ZW5vLSRMSU5FTk99OiBjaGVja2luZyBmb3IgYXJjaGl2ZXIgQEZJTEUgc3VwcG9ydCIgJmd0OyZh
bXA7NQorKyRhc19lY2hvX24gImNoZWNraW5nIGZvciBhcmNoaXZlciBARklMRSBzdXBwb3J0Li4u
ICIgJmd0OyZhbXA7NjsgfQorK2lmICR7bHRfY3ZfYXJfYXRfZmlsZSs6fSBmYWxzZTsgdGhlbiA6
CisrICAkYXNfZWNob19uICIoY2FjaGVkKSAiICZndDsmYW1wOzYKKytlbHNlCisrICBsdF9jdl9h
cl9hdF9maWxlPW5vCisrICAgY2F0IGNvbmZkZWZzLmggLSAmbHQ7Jmx0O19BQ0VPRiAmZ3Q7Y29u
ZnRlc3QuJGFjX2V4dAorKy8qIGVuZCBjb25mZGVmcy5oLiAgKi8KKysKKytpbnQKKyttYWluICgp
CisreworIAorKyAgOworKyAgcmV0dXJuIDA7CisrfQorK19BQ0VPRgorK2lmIGFjX2ZuX2NfdHJ5
X2NvbXBpbGUgIiRMSU5FTk8iOyB0aGVuIDoKKysgIGVjaG8gY29uZnRlc3QuJGFjX29iamV4dCAm
Z3Q7IGNvbmZ0ZXN0LmxzdAorKyAgICAgIGx0X2FyX3RyeT0nJEFSICRBUl9GTEFHUyBsaWJjb25m
dGVzdC5hIEBjb25mdGVzdC5sc3QgJmd0OyZhbXA7NScKKysgICAgICB7IHsgZXZhbCBlY2hvICJc
IlwkYXNfbWVcIjoke2FzX2xpbmVuby0kTElORU5PfTogXCIkbHRfYXJfdHJ5XCIiOyB9ICZndDsm
YW1wOzUKKysgIChldmFsICRsdF9hcl90cnkpIDImZ3Q7JmFtcDs1CisrICBhY19zdGF0dXM9JD8K
KysgICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IFwkPyA9ICRhY19zdGF0
dXMiICZndDsmYW1wOzUKKysgIHRlc3QgJGFjX3N0YXR1cyA9IDA7IH0KKysgICAgICBpZiB0ZXN0
ICIkYWNfc3RhdHVzIiAtZXEgMDsgdGhlbgorKwkjIEVuc3VyZSB0aGUgYXJjaGl2ZXIgZmFpbHMg
dXBvbiBib2d1cyBmaWxlIG5hbWVzLgorKwlybSAtZiBjb25mdGVzdC4kYWNfb2JqZXh0IGxpYmNv
bmZ0ZXN0LmEKKysJeyB7IGV2YWwgZWNobyAiXCJcJGFzX21lXCI6JHthc19saW5lbm8tJExJTkVO
T306IFwiJGx0X2FyX3RyeVwiIjsgfSAmZ3Q7JmFtcDs1CisrICAoZXZhbCAkbHRfYXJfdHJ5KSAy
Jmd0OyZhbXA7NQorKyAgYWNfc3RhdHVzPSQ/CisrICAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGlu
ZW5vLSRMSU5FTk99OiBcJD8gPSAkYWNfc3RhdHVzIiAmZ3Q7JmFtcDs1CisrICB0ZXN0ICRhY19z
dGF0dXMgPSAwOyB9CisrCWlmIHRlc3QgIiRhY19zdGF0dXMiIC1uZSAwOyB0aGVuCisrICAgICAg
ICAgIGx0X2N2X2FyX2F0X2ZpbGU9QAorKyAgICAgICAgZmkKKysgICAgICBmaQorKyAgICAgIHJt
IC1mIGNvbmZ0ZXN0LiogbGliY29uZnRlc3QuYQorIAorK2ZpCisrcm0gLWYgY29yZSBjb25mdGVz
dC5lcnIgY29uZnRlc3QuJGFjX29iamV4dCBjb25mdGVzdC4kYWNfZXh0CisgCisrZmkKKyt7ICRh
c19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IHJlc3VsdDogJGx0X2N2X2FyX2F0
X2ZpbGUiICZndDsmYW1wOzUKKyskYXNfZWNobyAiJGx0X2N2X2FyX2F0X2ZpbGUiICZndDsmYW1w
OzY7IH0KKyAKKytpZiB0ZXN0ICJ4JGx0X2N2X2FyX2F0X2ZpbGUiID0geG5vOyB0aGVuCisrICBh
cmNoaXZlcl9saXN0X3NwZWM9CisrZWxzZQorKyAgYXJjaGl2ZXJfbGlzdF9zcGVjPSRsdF9jdl9h
cl9hdF9maWxlCisrZmkKKyAKKyAKKyAKK0BAIC01ODQ2LDggKzYxNjUsOCBAQCBlc2FjCisgbHRf
Y3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY2RlY2w9InNlZCAtbiAtZSAncy9eVCAuKiBcKC4qXCkk
L2V4dGVybiBpbnQgXDEoKTsvcCcgLWUgJ3MvXiRzeW1jb2RlKiAuKiBcKC4qXCkkL2V4dGVybiBj
aGFyIFwxOy9wJyIKKyAKKyAjIFRyYW5zZm9ybSBhbiBleHRyYWN0ZWQgc3ltYm9sIGxpbmUgaW50
byBzeW1ib2wgbmFtZSBhbmQgc3ltYm9sIGFkZHJlc3MKKy1sdF9jdl9zeXNfZ2xvYmFsX3N5bWJv
bF90b19jX25hbWVfYWRkcmVzcz0ic2VkIC1uIC1lICdzL146IFwoW14gXSpcKSAkLyAge1xcXCJc
MVxcXCIsICh2b2lkICopIDB9LC9wJyAtZSAncy9eJHN5bWNvZGUqIFwoW14gXSpcKSBcKFteIF0q
XCkkLyAge1wiXDJcIiwgKHZvaWQgKikgXCZhbXA7XDJ9LC9wJyIKKy1sdF9jdl9zeXNfZ2xvYmFs
X3N5bWJvbF90b19jX25hbWVfYWRkcmVzc19saWJfcHJlZml4PSJzZWQgLW4gLWUgJ3MvXjogXChb
XiBdKlwpICQvICB7XFxcIlwxXFxcIiwgKHZvaWQgKikgMH0sL3AnIC1lICdzL14kc3ltY29kZSog
XChbXiBdKlwpIFwobGliW14gXSpcKSQvICB7XCJcMlwiLCAodm9pZCAqKSBcJmFtcDtcMn0sL3An
IC1lICdzL14kc3ltY29kZSogXChbXiBdKlwpIFwoW14gXSpcKSQvICB7XCJsaWJcMlwiLCAodm9p
ZCAqKSBcJmFtcDtcMn0sL3AnIgorK2x0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9h
ZGRyZXNzPSJzZWQgLW4gLWUgJ3MvXjogXChbXiBdKlwpWyBdKiQvICB7XFxcIlwxXFxcIiwgKHZv
aWQgKikgMH0sL3AnIC1lICdzL14kc3ltY29kZSogXChbXiBdKlwpIFwoW14gXSpcKSQvICB7XCJc
MlwiLCAodm9pZCAqKSBcJmFtcDtcMn0sL3AnIgorK2x0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3Rv
X2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXg9InNlZCAtbiAtZSAncy9eOiBcKFteIF0qXClbIF0q
JC8gIHtcXFwiXDFcXFwiLCAodm9pZCAqKSAwfSwvcCcgLWUgJ3MvXiRzeW1jb2RlKiBcKFteIF0q
XCkgXChsaWJbXiBdKlwpJC8gIHtcIlwyXCIsICh2b2lkICopIFwmYW1wO1wyfSwvcCcgLWUgJ3Mv
XiRzeW1jb2RlKiBcKFteIF0qXCkgXChbXiBdKlwpJC8gIHtcImxpYlwyXCIsICh2b2lkICopIFwm
YW1wO1wyfSwvcCciCisgCisgIyBIYW5kbGUgQ1JMRiBpbiBtaW5ndyB0b29sIGNoYWluCisgb3B0
X2NyPQorQEAgLTU4ODMsNiArNjIwMiw3IEBAIGZvciBhY19zeW1wcmZ4IGluICIiICJfIjsgZG8K
KyAgIGVsc2UKKyAgICAgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZT0ic2VkIC1uIC1lICdz
L14uKlsJIF1cKCRzeW1jb2RlJHN5bWNvZGUqXClbCSBdWwkgXSokYWNfc3ltcHJmeCRzeW1wYXQk
b3B0X2NyJC8kc3lteGZybS9wJyIKKyAgIGZpCisrICBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF9w
aXBlPSIkbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfcGlwZSB8IHNlZCAnLyBfX2dudV9sdG8vZCci
CisgCisgICAjIENoZWNrIHRvIHNlZSB0aGF0IHRoZSBwaXBlIHdvcmtzIGNvcnJlY3RseS4KKyAg
IHBpcGVfd29ya3M9bm8KK0BAIC01OTI0LDYgKzYyNDQsMTggQEAgX0xUX0VPRgorICAgICAgIGlm
ICRHUkVQICcgbm1fdGVzdF92YXIkJyAiJG5saXN0IiAmZ3Q7L2Rldi9udWxsOyB0aGVuCisgCWlm
ICRHUkVQICcgbm1fdGVzdF9mdW5jJCcgIiRubGlzdCIgJmd0Oy9kZXYvbnVsbDsgdGhlbgorIAkg
IGNhdCAmbHQ7Jmx0O19MVF9FT0YgJmd0OyBjb25mdGVzdC4kYWNfZXh0CisrLyogS2VlcCB0aGlz
IGNvZGUgaW4gc3luYyBiZXR3ZWVuIGxpYnRvb2wubTQsIGx0bWFpbiwgbHRfc3lzdGVtLmgsIGFu
ZCB0ZXN0cy4gICovCisrI2lmIGRlZmluZWQoX1dJTjMyKSB8fCBkZWZpbmVkKF9fQ1lHV0lOX18p
IHx8IGRlZmluZWQoX1dJTjMyX1dDRSkKKysvKiBEQVRBIGltcG9ydHMgZnJvbSBETExzIG9uIFdJ
TjMyIGNvbid0IGJlIGNvbnN0LCBiZWNhdXNlIHJ1bnRpbWUKKysgICByZWxvY2F0aW9ucyBhcmUg
cGVyZm9ybWVkIC0tIHNlZSBsZCdzIGRvY3VtZW50YXRpb24gb24gcHNldWRvLXJlbG9jcy4gICov
CisrIyBkZWZpbmUgTFRfRExTWU1fQ09OU1QKKysjZWxpZiBkZWZpbmVkKF9fb3NmX18pCisrLyog
VGhpcyBzeXN0ZW0gZG9lcyBub3QgY29wZSB3ZWxsIHdpdGggcmVsb2NhdGlvbnMgaW4gY29uc3Qg
ZGF0YS4gICovCisrIyBkZWZpbmUgTFRfRExTWU1fQ09OU1QKKysjZWxzZQorKyMgZGVmaW5lIExU
X0RMU1lNX0NPTlNUIGNvbnN0CisrI2VuZGlmCisrCisgI2lmZGVmIF9fY3BsdXNwbHVzCisgZXh0
ZXJuICJDIiB7CisgI2VuZGlmCitAQCAtNTkzNSw3ICs2MjY3LDcgQEAgX0xUX0VPRgorIAkgIGNh
dCAmbHQ7Jmx0O19MVF9FT0YgJmd0OyZndDsgY29uZnRlc3QuJGFjX2V4dAorIAorIC8qIFRoZSBt
YXBwaW5nIGJldHdlZW4gc3ltYm9sIG5hbWVzIGFuZCBzeW1ib2xzLiAgKi8KKy1jb25zdCBzdHJ1
Y3QgeworK0xUX0RMU1lNX0NPTlNUIHN0cnVjdCB7CisgICBjb25zdCBjaGFyICpuYW1lOworICAg
dm9pZCAgICAgICAqYWRkcmVzczsKKyB9CitAQCAtNTk2MSw4ICs2MjkzLDggQEAgc3RhdGljIGNv
bnN0IHZvaWQgKmx0X3ByZWxvYWRlZF9zZXR1cCgpIHsKKyBfTFRfRU9GCisgCSAgIyBOb3cgdHJ5
IGxpbmtpbmcgdGhlIHR3byBmaWxlcy4KKyAJICBtdiBjb25mdGVzdC4kYWNfb2JqZXh0IGNvbmZ0
c3RtLiRhY19vYmpleHQKKy0JICBsdF9zYXZlX0xJQlM9IiRMSUJTIgorLQkgIGx0X3NhdmVfQ0ZM
QUdTPSIkQ0ZMQUdTIgorKwkgIGx0X2dsb2JzeW1fc2F2ZV9MSUJTPSRMSUJTCisrCSAgbHRfZ2xv
YnN5bV9zYXZlX0NGTEFHUz0kQ0ZMQUdTCisgCSAgTElCUz0iY29uZnRzdG0uJGFjX29iamV4dCIK
KyAJICBDRkxBR1M9IiRDRkxBR1MkbHRfcHJvZ19jb21waWxlcl9ub19idWlsdGluX2ZsYWciCisg
CSAgaWYgeyB7IGV2YWwgZWNobyAiXCJcJGFzX21lXCI6JHthc19saW5lbm8tJExJTkVOT306IFwi
JGFjX2xpbmtcIiI7IH0gJmd0OyZhbXA7NQorQEAgLTU5NzIsOCArNjMwNCw4IEBAIF9MVF9FT0YK
KyAgIHRlc3QgJGFjX3N0YXR1cyA9IDA7IH0gJmFtcDsmYW1wOyB0ZXN0IC1zIGNvbmZ0ZXN0JHth
Y19leGVleHR9OyB0aGVuCisgCSAgICBwaXBlX3dvcmtzPXllcworIAkgIGZpCistCSAgTElCUz0i
JGx0X3NhdmVfTElCUyIKKy0JICBDRkxBR1M9IiRsdF9zYXZlX0NGTEFHUyIKKysJICBMSUJTPSRs
dF9nbG9ic3ltX3NhdmVfTElCUworKwkgIENGTEFHUz0kbHRfZ2xvYnN5bV9zYXZlX0NGTEFHUwor
IAllbHNlCisgCSAgZWNobyAiY2Fubm90IGZpbmQgbm1fdGVzdF9mdW5jIGluICRubGlzdCIgJmd0
OyZhbXA7NQorIAlmaQorQEAgLTYwMTAsNiArNjM0MiwxOSBAQCBlbHNlCisgJGFzX2VjaG8gIm9r
IiAmZ3Q7JmFtcDs2OyB9CisgZmkKKyAKKysjIFJlc3BvbnNlIGZpbGUgc3VwcG9ydC4KKytpZiB0
ZXN0ICIkbHRfY3Zfbm1faW50ZXJmYWNlIiA9ICJNUyBkdW1wYmluIjsgdGhlbgorKyAgbm1fZmls
ZV9saXN0X3NwZWM9J0AnCisrZWxpZiAkTk0gLS1oZWxwIDImZ3Q7L2Rldi9udWxsIHwgZ3JlcCAn
W0BdRklMRScgJmd0Oy9kZXYvbnVsbDsgdGhlbgorKyAgbm1fZmlsZV9saXN0X3NwZWM9J0AnCisr
ZmkKKysKKysKKysKKysKKysKKysKKysKKyAKKyAKKyAKK0BAIC02MDI3LDYgKzYzNzIsNDEgQEAg
ZmkKKyAKKyAKKyAKKysKKysKKysKKyt7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJ
TkVOT306IGNoZWNraW5nIGZvciBzeXNyb290IiAmZ3Q7JmFtcDs1CisrJGFzX2VjaG9fbiAiY2hl
Y2tpbmcgZm9yIHN5c3Jvb3QuLi4gIiAmZ3Q7JmFtcDs2OyB9CisrCisrIyBDaGVjayB3aGV0aGVy
IC0td2l0aC1saWJ0b29sLXN5c3Jvb3Qgd2FzIGdpdmVuLgorK2lmIHRlc3QgIiR7d2l0aF9saWJ0
b29sX3N5c3Jvb3Qrc2V0fSIgPSBzZXQ7IHRoZW4gOgorKyAgd2l0aHZhbD0kd2l0aF9saWJ0b29s
X3N5c3Jvb3Q7CisrZWxzZQorKyAgd2l0aF9saWJ0b29sX3N5c3Jvb3Q9bm8KKytmaQorKworKwor
K2x0X3N5c3Jvb3Q9CisrY2FzZSAke3dpdGhfbGlidG9vbF9zeXNyb290fSBpbiAjKAorKyB5ZXMp
CisrICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4KKysgICAgIGx0X3N5c3Jvb3Q9YCRDQyAt
LXByaW50LXN5c3Jvb3QgMiZndDsvZGV2L251bGxgCisrICAgZmkKKysgICA7OyAjKAorKyAvKikK
KysgICBsdF9zeXNyb290PWBlY2hvICIkd2l0aF9saWJ0b29sX3N5c3Jvb3QiIHwgc2VkIC1lICIk
c2VkX3F1b3RlX3N1YnN0ImAKKysgICA7OyAjKAorKyBub3wnJykKKysgICA7OyAjKAorKyAqKQor
KyAgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogcmVzdWx0OiAke3dp
dGhfbGlidG9vbF9zeXNyb290fSIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIke3dpdGhfbGlidG9v
bF9zeXNyb290fSIgJmd0OyZhbXA7NjsgfQorKyAgIGFzX2ZuX2Vycm9yICQ/ICJUaGUgc3lzcm9v
dCBtdXN0IGJlIGFuIGFic29sdXRlIHBhdGguIiAiJExJTkVOTyIgNQorKyAgIDs7CisrZXNhYwor
KworKyB7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IHJlc3VsdDogJHts
dF9zeXNyb290Oi1ub30iICZndDsmYW1wOzUKKyskYXNfZWNobyAiJHtsdF9zeXNyb290Oi1ub30i
ICZndDsmYW1wOzY7IH0KKyAKKyAKKyAKK0BAIC02MjQxLDYgKzY2MjEsMTIzIEBAIGVzYWMKKyAK
KyBuZWVkX2xvY2tzPSIkZW5hYmxlX2xpYnRvb2xfbG9jayIKKyAKKytpZiB0ZXN0IC1uICIkYWNf
dG9vbF9wcmVmaXgiOyB0aGVuCisrICAjIEV4dHJhY3QgdGhlIGZpcnN0IHdvcmQgb2YgIiR7YWNf
dG9vbF9wcmVmaXh9bXQiLCBzbyBpdCBjYW4gYmUgYSBwcm9ncmFtIG5hbWUgd2l0aCBhcmdzLgor
K3NldCBkdW1teSAke2FjX3Rvb2xfcHJlZml4fW10OyBhY193b3JkPSQyCisreyAkYXNfZWNobyAi
JGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBjaGVja2luZyBmb3IgJGFjX3dvcmQiICZndDsm
YW1wOzUKKyskYXNfZWNob19uICJjaGVja2luZyBmb3IgJGFjX3dvcmQuLi4gIiAmZ3Q7JmFtcDs2
OyB9CisraWYgJHthY19jdl9wcm9nX01BTklGRVNUX1RPT0wrOn0gZmFsc2U7IHRoZW4gOgorKyAg
JGFzX2VjaG9fbiAiKGNhY2hlZCkgIiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAgaWYgdGVzdCAtbiAi
JE1BTklGRVNUX1RPT0wiOyB0aGVuCisrICBhY19jdl9wcm9nX01BTklGRVNUX1RPT0w9IiRNQU5J
RkVTVF9UT09MIiAjIExldCB0aGUgdXNlciBvdmVycmlkZSB0aGUgdGVzdC4KKytlbHNlCisrYXNf
c2F2ZV9JRlM9JElGUzsgSUZTPSRQQVRIX1NFUEFSQVRPUgorK2ZvciBhc19kaXIgaW4gJFBBVEgK
KytkbworKyAgSUZTPSRhc19zYXZlX0lGUworKyAgdGVzdCAteiAiJGFzX2RpciIgJmFtcDsmYW1w
OyBhc19kaXI9LgorKyAgICBmb3IgYWNfZXhlY19leHQgaW4gJycgJGFjX2V4ZWN1dGFibGVfZXh0
ZW5zaW9uczsgZG8KKysgIGlmIGFzX2ZuX2V4ZWN1dGFibGVfcCAiJGFzX2Rpci8kYWNfd29yZCRh
Y19leGVjX2V4dCI7IHRoZW4KKysgICAgYWNfY3ZfcHJvZ19NQU5JRkVTVF9UT09MPSIke2FjX3Rv
b2xfcHJlZml4fW10IgorKyAgICAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99
OiBmb3VuZCAkYXNfZGlyLyRhY193b3JkJGFjX2V4ZWNfZXh0IiAmZ3Q7JmFtcDs1CisrICAgIGJy
ZWFrIDIKKysgIGZpCisrZG9uZQorKyAgZG9uZQorK0lGUz0kYXNfc2F2ZV9JRlMKKysKKytmaQor
K2ZpCisrTUFOSUZFU1RfVE9PTD0kYWNfY3ZfcHJvZ19NQU5JRkVTVF9UT09MCisraWYgdGVzdCAt
biAiJE1BTklGRVNUX1RPT0wiOyB0aGVuCisrICB7ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5l
bm8tJExJTkVOT306IHJlc3VsdDogJE1BTklGRVNUX1RPT0wiICZndDsmYW1wOzUKKyskYXNfZWNo
byAiJE1BTklGRVNUX1RPT0wiICZndDsmYW1wOzY7IH0KKytlbHNlCisrICB7ICRhc19lY2hvICIk
YXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IHJlc3VsdDogbm8iICZndDsmYW1wOzUKKyskYXNf
ZWNobyAibm8iICZndDsmYW1wOzY7IH0KKytmaQorKworKworK2ZpCisraWYgdGVzdCAteiAiJGFj
X2N2X3Byb2dfTUFOSUZFU1RfVE9PTCI7IHRoZW4KKysgIGFjX2N0X01BTklGRVNUX1RPT0w9JE1B
TklGRVNUX1RPT0wKKysgICMgRXh0cmFjdCB0aGUgZmlyc3Qgd29yZCBvZiAibXQiLCBzbyBpdCBj
YW4gYmUgYSBwcm9ncmFtIG5hbWUgd2l0aCBhcmdzLgorK3NldCBkdW1teSBtdDsgYWNfd29yZD0k
MgorK3sgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcgZm9y
ICRhY193b3JkIiAmZ3Q7JmFtcDs1CisrJGFzX2VjaG9fbiAiY2hlY2tpbmcgZm9yICRhY193b3Jk
Li4uICIgJmd0OyZhbXA7NjsgfQorK2lmICR7YWNfY3ZfcHJvZ19hY19jdF9NQU5JRkVTVF9UT09M
Kzp9IGZhbHNlOyB0aGVuIDoKKysgICRhc19lY2hvX24gIihjYWNoZWQpICIgJmd0OyZhbXA7Ngor
K2Vsc2UKKysgIGlmIHRlc3QgLW4gIiRhY19jdF9NQU5JRkVTVF9UT09MIjsgdGhlbgorKyAgYWNf
Y3ZfcHJvZ19hY19jdF9NQU5JRkVTVF9UT09MPSIkYWNfY3RfTUFOSUZFU1RfVE9PTCIgIyBMZXQg
dGhlIHVzZXIgb3ZlcnJpZGUgdGhlIHRlc3QuCisrZWxzZQorK2FzX3NhdmVfSUZTPSRJRlM7IElG
Uz0kUEFUSF9TRVBBUkFUT1IKKytmb3IgYXNfZGlyIGluICRQQVRICisrZG8KKysgIElGUz0kYXNf
c2F2ZV9JRlMKKysgIHRlc3QgLXogIiRhc19kaXIiICZhbXA7JmFtcDsgYXNfZGlyPS4KKysgICAg
Zm9yIGFjX2V4ZWNfZXh0IGluICcnICRhY19leGVjdXRhYmxlX2V4dGVuc2lvbnM7IGRvCisrICBp
ZiBhc19mbl9leGVjdXRhYmxlX3AgIiRhc19kaXIvJGFjX3dvcmQkYWNfZXhlY19leHQiOyB0aGVu
CisrICAgIGFjX2N2X3Byb2dfYWNfY3RfTUFOSUZFU1RfVE9PTD0ibXQiCisrICAgICRhc19lY2hv
ICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IGZvdW5kICRhc19kaXIvJGFjX3dvcmQkYWNf
ZXhlY19leHQiICZndDsmYW1wOzUKKysgICAgYnJlYWsgMgorKyAgZmkKKytkb25lCisrICBkb25l
CisrSUZTPSRhc19zYXZlX0lGUworKworK2ZpCisrZmkKKythY19jdF9NQU5JRkVTVF9UT09MPSRh
Y19jdl9wcm9nX2FjX2N0X01BTklGRVNUX1RPT0wKKytpZiB0ZXN0IC1uICIkYWNfY3RfTUFOSUZF
U1RfVE9PTCI7IHRoZW4KKysgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5P
fTogcmVzdWx0OiAkYWNfY3RfTUFOSUZFU1RfVE9PTCIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIk
YWNfY3RfTUFOSUZFU1RfVE9PTCIgJmd0OyZhbXA7NjsgfQorK2Vsc2UKKysgIHsgJGFzX2VjaG8g
IiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogcmVzdWx0OiBubyIgJmd0OyZhbXA7NQorKyRh
c19lY2hvICJubyIgJmd0OyZhbXA7NjsgfQorK2ZpCisrCisrICBpZiB0ZXN0ICJ4JGFjX2N0X01B
TklGRVNUX1RPT0wiID0geDsgdGhlbgorKyAgICBNQU5JRkVTVF9UT09MPSI6IgorKyAgZWxzZQor
KyAgICBjYXNlICRjcm9zc19jb21waWxpbmc6JGFjX3Rvb2xfd2FybmVkIGluCisreWVzOikKKyt7
ICRhc19lY2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IFdBUk5JTkc6IHVzaW5nIGNy
b3NzIHRvb2xzIG5vdCBwcmVmaXhlZCB3aXRoIGhvc3QgdHJpcGxldCIgJmd0OyZhbXA7NQorKyRh
c19lY2hvICIkYXNfbWU6IFdBUk5JTkc6IHVzaW5nIGNyb3NzIHRvb2xzIG5vdCBwcmVmaXhlZCB3
aXRoIGhvc3QgdHJpcGxldCIgJmd0OyZhbXA7Mjt9CisrYWNfdG9vbF93YXJuZWQ9eWVzIDs7Cisr
ZXNhYworKyAgICBNQU5JRkVTVF9UT09MPSRhY19jdF9NQU5JRkVTVF9UT09MCisrICBmaQorK2Vs
c2UKKysgIE1BTklGRVNUX1RPT0w9IiRhY19jdl9wcm9nX01BTklGRVNUX1RPT0wiCisrZmkKKysK
Kyt0ZXN0IC16ICIkTUFOSUZFU1RfVE9PTCIgJmFtcDsmYW1wOyBNQU5JRkVTVF9UT09MPW10Cisr
eyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBjaGVja2luZyBpZiAkTUFO
SUZFU1RfVE9PTCBpcyBhIG1hbmlmZXN0IHRvb2wiICZndDsmYW1wOzUKKyskYXNfZWNob19uICJj
aGVja2luZyBpZiAkTUFOSUZFU1RfVE9PTCBpcyBhIG1hbmlmZXN0IHRvb2wuLi4gIiAmZ3Q7JmFt
cDs2OyB9CisraWYgJHtsdF9jdl9wYXRoX21haW5mZXN0X3Rvb2wrOn0gZmFsc2U7IHRoZW4gOgor
KyAgJGFzX2VjaG9fbiAiKGNhY2hlZCkgIiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAgbHRfY3ZfcGF0
aF9tYWluZmVzdF90b29sPW5vCisrICBlY2hvICIkYXNfbWU6JExJTkVOTzogJE1BTklGRVNUX1RP
T0wgJy0/JyIgJmd0OyZhbXA7NQorKyAgJE1BTklGRVNUX1RPT0wgJy0/JyAyJmd0O2NvbmZ0ZXN0
LmVyciAmZ3Q7IGNvbmZ0ZXN0Lm91dAorKyAgY2F0IGNvbmZ0ZXN0LmVyciAmZ3Q7JmFtcDs1Cisr
ICBpZiAkR1JFUCAnTWFuaWZlc3QgVG9vbCcgY29uZnRlc3Qub3V0ICZndDsgL2Rldi9udWxsOyB0
aGVuCisrICAgIGx0X2N2X3BhdGhfbWFpbmZlc3RfdG9vbD15ZXMKKysgIGZpCisrICBybSAtZiBj
b25mdGVzdCoKKytmaQorK3sgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTog
cmVzdWx0OiAkbHRfY3ZfcGF0aF9tYWluZmVzdF90b29sIiAmZ3Q7JmFtcDs1CisrJGFzX2VjaG8g
IiRsdF9jdl9wYXRoX21haW5mZXN0X3Rvb2wiICZndDsmYW1wOzY7IH0KKytpZiB0ZXN0ICJ4JGx0
X2N2X3BhdGhfbWFpbmZlc3RfdG9vbCIgIT0geHllczsgdGhlbgorKyAgTUFOSUZFU1RfVE9PTD06
CisrZmkKKysKKysKKysKKysKKysKKyAKKyAgIGNhc2UgJGhvc3Rfb3MgaW4KKyAgICAgcmhhcHNv
ZHkqIHwgZGFyd2luKikKK0BAIC02ODA3LDYgKzczMDQsOCBAQCBfTFRfRU9GCisgICAgICAgJExU
Q0MgJExUQ0ZMQUdTIC1jIC1vIGNvbmZ0ZXN0Lm8gY29uZnRlc3QuYyAyJmd0OyZhbXA7NQorICAg
ICAgIGVjaG8gIiRBUiBjcnUgbGliY29uZnRlc3QuYSBjb25mdGVzdC5vIiAmZ3Q7JmFtcDs1Cisg
ICAgICAgJEFSIGNydSBsaWJjb25mdGVzdC5hIGNvbmZ0ZXN0Lm8gMiZndDsmYW1wOzUKKysgICAg
ICBlY2hvICIkUkFOTElCIGxpYmNvbmZ0ZXN0LmEiICZndDsmYW1wOzUKKysgICAgICAkUkFOTElC
IGxpYmNvbmZ0ZXN0LmEgMiZndDsmYW1wOzUKKyAgICAgICBjYXQgJmd0OyBjb25mdGVzdC5jICZs
dDsmbHQ7IF9MVF9FT0YKKyBpbnQgbWFpbigpIHsgcmV0dXJuIDA7fQorIF9MVF9FT0YKK0BAIC03
MjY5LDcgKzc3NjgsOCBAQCBmaQorIExJQlRPT0xfREVQUz0iJGx0bWFpbiIKKyAKKyAjIEFsd2F5
cyB1c2Ugb3VyIG93biBsaWJ0b29sLgorLUxJQlRPT0w9JyQoU0hFTEwpICQodG9wX2J1aWxkZGly
KS9saWJ0b29sJworK0xJQlRPT0w9JyQoU0hFTEwpICQodG9wX2J1aWxkZGlyKScKKytMSUJUT09M
PSIkTElCVE9PTC8ke2hvc3RfYWxpYXN9LWxpYnRvb2wiCisgCisgCisgCitAQCAtNzM1OCw3ICs3
ODU4LDcgQEAgYWl4MyopCisgZXNhYworIAorICMgR2xvYmFsIHZhcmlhYmxlczoKKy1vZmlsZT1s
aWJ0b29sCisrb2ZpbGU9JHtob3N0X2FsaWFzfS1saWJ0b29sCisgY2FuX2J1aWxkX3NoYXJlZD15
ZXMKKyAKKyAjIEFsbCBrbm93biBsaW5rZXJzIHJlcXVpcmUgYSBgLmEnIGFyY2hpdmUgZm9yIHN0
YXRpYyBsaW5raW5nIChleGNlcHQgTVNWQywKK0BAIC03NjU2LDggKzgxNTYsNiBAQCBmaQorIGx0
X3Byb2dfY29tcGlsZXJfcGljPQorIGx0X3Byb2dfY29tcGlsZXJfc3RhdGljPQorIAorLXsgJGFz
X2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElORU5PfTogY2hlY2tpbmcgZm9yICRjb21waWxl
ciBvcHRpb24gdG8gcHJvZHVjZSBQSUMiICZndDsmYW1wOzUKKy0kYXNfZWNob19uICJjaGVja2lu
ZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBwcm9kdWNlIFBJQy4uLiAiICZndDsmYW1wOzY7IH0K
KyAKKyAgIGlmIHRlc3QgIiRHQ0MiID0geWVzOyB0aGVuCisgICAgIGx0X3Byb2dfY29tcGlsZXJf
d2w9Jy1XbCwnCitAQCAtNzgyMyw2ICs4MzIxLDEyIEBAICRhc19lY2hvX24gImNoZWNraW5nIGZv
ciAkY29tcGlsZXIgb3B0aW9uIHRvIHByb2R1Y2UgUElDLi4uICIgJmd0OyZhbXA7NjsgfQorIAls
dF9wcm9nX2NvbXBpbGVyX3BpYz0nLS1zaGFyZWQnCisgCWx0X3Byb2dfY29tcGlsZXJfc3RhdGlj
PSctLXN0YXRpYycKKyAJOzsKKysgICAgICBuYWdmb3IqKQorKwkjIE5BRyBGb3J0cmFuIGNvbXBp
bGVyCisrCWx0X3Byb2dfY29tcGlsZXJfd2w9Jy1XbCwtV2wsLCcKKysJbHRfcHJvZ19jb21waWxl
cl9waWM9Jy1QSUMnCisrCWx0X3Byb2dfY29tcGlsZXJfc3RhdGljPSctQnN0YXRpYycKKysJOzsK
KyAgICAgICBwZ2NjKiB8IHBnZjc3KiB8IHBnZjkwKiB8IHBnZjk1KiB8IHBnZm9ydHJhbiopCisg
ICAgICAgICAjIFBvcnRsYW5kIEdyb3VwIGNvbXBpbGVycyAoKm5vdCogdGhlIFBlbnRpdW0gZ2Nj
IGNvbXBpbGVyLAorIAkjIHdoaWNoIGxvb2tzIHRvIGJlIGEgZGVhZCBwcm9qZWN0KQorQEAgLTc4
ODUsNyArODM4OSw3IEBAICRhc19lY2hvX24gImNoZWNraW5nIGZvciAkY29tcGlsZXIgb3B0aW9u
IHRvIHByb2R1Y2UgUElDLi4uICIgJmd0OyZhbXA7NjsgfQorICAgICAgIGx0X3Byb2dfY29tcGls
ZXJfcGljPSctS1BJQycKKyAgICAgICBsdF9wcm9nX2NvbXBpbGVyX3N0YXRpYz0nLUJzdGF0aWMn
CisgICAgICAgY2FzZSAkY2NfYmFzZW5hbWUgaW4KKy0gICAgICBmNzcqIHwgZjkwKiB8IGY5NSop
CisrICAgICAgZjc3KiB8IGY5MCogfCBmOTUqIHwgc3VuZjc3KiB8IHN1bmY5MCogfCBzdW5mOTUq
KQorIAlsdF9wcm9nX2NvbXBpbGVyX3dsPSctUW9wdGlvbiBsZCAnOzsKKyAgICAgICAqKQorIAls
dF9wcm9nX2NvbXBpbGVyX3dsPSctV2wsJzs7CitAQCAtNzk0MiwxMyArODQ0NiwxNyBAQCBjYXNl
ICRob3N0X29zIGluCisgICAgIGx0X3Byb2dfY29tcGlsZXJfcGljPSIkbHRfcHJvZ19jb21waWxl
cl9waWMgLURQSUMiCisgICAgIDs7CisgZXNhYworLXsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xp
bmVuby0kTElORU5PfTogcmVzdWx0OiAkbHRfcHJvZ19jb21waWxlcl9waWMiICZndDsmYW1wOzUK
Ky0kYXNfZWNobyAiJGx0X3Byb2dfY29tcGlsZXJfcGljIiAmZ3Q7JmFtcDs2OyB9CistCistCist
CistCisgCisreyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiBjaGVja2lu
ZyBmb3IgJGNvbXBpbGVyIG9wdGlvbiB0byBwcm9kdWNlIFBJQyIgJmd0OyZhbXA7NQorKyRhc19l
Y2hvX24gImNoZWNraW5nIGZvciAkY29tcGlsZXIgb3B0aW9uIHRvIHByb2R1Y2UgUElDLi4uICIg
Jmd0OyZhbXA7NjsgfQorK2lmICR7bHRfY3ZfcHJvZ19jb21waWxlcl9waWMrOn0gZmFsc2U7IHRo
ZW4gOgorKyAgJGFzX2VjaG9fbiAiKGNhY2hlZCkgIiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAgbHRf
Y3ZfcHJvZ19jb21waWxlcl9waWM9JGx0X3Byb2dfY29tcGlsZXJfcGljCisrZmkKKyt7ICRhc19l
Y2hvICIkYXNfbWU6JHthc19saW5lbm8tJExJTkVOT306IHJlc3VsdDogJGx0X2N2X3Byb2dfY29t
cGlsZXJfcGljIiAmZ3Q7JmFtcDs1CisrJGFzX2VjaG8gIiRsdF9jdl9wcm9nX2NvbXBpbGVyX3Bp
YyIgJmd0OyZhbXA7NjsgfQorK2x0X3Byb2dfY29tcGlsZXJfcGljPSRsdF9jdl9wcm9nX2NvbXBp
bGVyX3BpYworIAorICMKKyAjIENoZWNrIHRvIG1ha2Ugc3VyZSB0aGUgUElDIGZsYWcgYWN0dWFs
bHkgd29ya3MuCitAQCAtODAwOSw2ICs4NTE3LDExIEBAIGZpCisgCisgCisgCisrCisrCisrCisr
CisrCisgIworICMgQ2hlY2sgdG8gbWFrZSBzdXJlIHRoZSBzdGF0aWMgZmxhZyBhY3R1YWxseSB3
b3Jrcy4KKyAjCitAQCAtODM1OSw3ICs4ODcyLDggQEAgX0xUX0VPRgorICAgICAgIGFsbG93X3Vu
ZGVmaW5lZF9mbGFnPXVuc3VwcG9ydGVkCisgICAgICAgYWx3YXlzX2V4cG9ydF9zeW1ib2xzPW5v
CisgICAgICAgZW5hYmxlX3NoYXJlZF93aXRoX3N0YXRpY19ydW50aW1lcz15ZXMKKy0gICAgICBl
eHBvcnRfc3ltYm9sc19jbWRzPSckTk0gJGxpYm9ianMgJGNvbnZlbmllbmNlIHwgJGdsb2JhbF9z
eW1ib2xfcGlwZSB8ICRTRUQgLWUgJ1wnJy9eW0JDREdSU11bIF0vcy8uKlsgXVwoW14gXSpcKS9c
MSBEQVRBLydcJycgfCAkU0VEIC1lICdcJycvXltBSVRXXVsgXS9zLy4qWyBdLy8nXCcnIHwgc29y
dCB8IHVuaXEgJmd0OyAkZXhwb3J0X3N5bWJvbHMnCisrICAgICAgZXhwb3J0X3N5bWJvbHNfY21k
cz0nJE5NICRsaWJvYmpzICRjb252ZW5pZW5jZSB8ICRnbG9iYWxfc3ltYm9sX3BpcGUgfCAkU0VE
IC1lICdcJycvXltCQ0RHUlNdWyBdL3MvLipbIF1cKFteIF0qXCkvXDEgREFUQS87cy9eLipbIF1f
X25tX19cKFteIF0qXClbIF1bXiBdKi9cMSBEQVRBLzsvXklbIF0vZDsvXltBSVRXXVsgXS9zLy4q
IC8vJ1wnJyB8IHNvcnQgfCB1bmlxICZndDsgJGV4cG9ydF9zeW1ib2xzJworKyAgICAgIGV4Y2x1
ZGVfZXhwc3ltcz0nW19dK0dMT0JBTF9PRkZTRVRfVEFCTEVffFtfXStHTE9CQUxfX1tGSURdXy4q
fFtfXStoZWFkX1tBLVphLXowLTlfXStfZGxsfFtBLVphLXowLTlfXStfZGxsX2luYW1lJworIAor
ICAgICAgIGlmICRMRCAtLWhlbHAgMiZndDsmYW1wOzEgfCAkR1JFUCAnYXV0by1pbXBvcnQnICZn
dDsgL2Rldi9udWxsOyB0aGVuCisgICAgICAgICBhcmNoaXZlX2NtZHM9JyRDQyAtc2hhcmVkICRs
aWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFncyAtbyAkb3V0cHV0X29iamRpci8kc29uYW1l
ICR7d2x9LS1lbmFibGUtYXV0by1pbWFnZS1iYXNlIC1YbGlua2VyIC0tb3V0LWltcGxpYiAtWGxp
bmtlciAkbGliJworQEAgLTg0NTgsMTIgKzg5NzIsMTIgQEAgX0xUX0VPRgorIAkgIHdob2xlX2Fy
Y2hpdmVfZmxhZ19zcGVjPSctLXdob2xlLWFyY2hpdmUkY29udmVuaWVuY2UgLS1uby13aG9sZS1h
cmNoaXZlJworIAkgIGhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9CisgCSAgaGFyZGNvZGVfbGli
ZGlyX2ZsYWdfc3BlY19sZD0nLXJwYXRoICRsaWJkaXInCistCSAgYXJjaGl2ZV9jbWRzPSckTEQg
LXNoYXJlZCAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MgLXNvbmFtZSAkc29uYW1l
IC1vICRsaWInCisrCSAgYXJjaGl2ZV9jbWRzPSckTEQgLXNoYXJlZCAkbGlib2JqcyAkZGVwbGli
cyAkbGlua2VyX2ZsYWdzIC1zb25hbWUgJHNvbmFtZSAtbyAkbGliJworIAkgIGlmIHRlc3QgIngk
c3VwcG9ydHNfYW5vbl92ZXJzaW9uaW5nIiA9IHh5ZXM7IHRoZW4KKyAJICAgIGFyY2hpdmVfZXhw
c3ltX2NtZHM9J2VjaG8gInsgZ2xvYmFsOiIgJmd0OyAkb3V0cHV0X29iamRpci8kbGlibmFtZS52
ZXJ+CisgCSAgICAgIGNhdCAkZXhwb3J0X3N5bWJvbHMgfCBzZWQgLWUgInMvXCguKlwpL1wxOy8i
ICZndDsmZ3Q7ICRvdXRwdXRfb2JqZGlyLyRsaWJuYW1lLnZlcn4KKyAJICAgICAgZWNobyAibG9j
YWw6ICo7IH07IiAmZ3Q7Jmd0OyAkb3V0cHV0X29iamRpci8kbGlibmFtZS52ZXJ+CistCSAgICAg
ICRMRCAtc2hhcmVkICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFncyAtc29uYW1lICRz
b25hbWUgLXZlcnNpb24tc2NyaXB0ICRvdXRwdXRfb2JqZGlyLyRsaWJuYW1lLnZlciAtbyAkbGli
JworKwkgICAgICAkTEQgLXNoYXJlZCAkbGlib2JqcyAkZGVwbGlicyAkbGlua2VyX2ZsYWdzIC1z
b25hbWUgJHNvbmFtZSAtdmVyc2lvbi1zY3JpcHQgJG91dHB1dF9vYmpkaXIvJGxpYm5hbWUudmVy
IC1vICRsaWInCisgCSAgZmkKKyAJICA7OworIAllc2FjCitAQCAtODQ3Nyw4ICs4OTkxLDggQEAg
X0xUX0VPRgorIAlhcmNoaXZlX2NtZHM9JyRMRCAtQnNoYXJlYWJsZSAkbGlib2JqcyAkZGVwbGli
cyAkbGlua2VyX2ZsYWdzIC1vICRsaWInCisgCXdsYXJjPQorICAgICAgIGVsc2UKKy0JYXJjaGl2
ZV9jbWRzPSckQ0MgLXNoYXJlZCAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MgJHt3
bH0tc29uYW1lICR3bCRzb25hbWUgLW8gJGxpYicKKy0JYXJjaGl2ZV9leHBzeW1fY21kcz0nJEND
IC1zaGFyZWQgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzICR7d2x9LXNvbmFtZSAk
d2wkc29uYW1lICR7d2x9LXJldGFpbi1zeW1ib2xzLWZpbGUgJHdsJGV4cG9ydF9zeW1ib2xzIC1v
ICRsaWInCisrCWFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJHBpY19mbGFnICRsaWJvYmpzICRk
ZXBsaWJzICRjb21waWxlcl9mbGFncyAke3dsfS1zb25hbWUgJHdsJHNvbmFtZSAtbyAkbGliJwor
KwlhcmNoaXZlX2V4cHN5bV9jbWRzPSckQ0MgLXNoYXJlZCAkcGljX2ZsYWcgJGxpYm9ianMgJGRl
cGxpYnMgJGNvbXBpbGVyX2ZsYWdzICR7d2x9LXNvbmFtZSAkd2wkc29uYW1lICR7d2x9LXJldGFp
bi1zeW1ib2xzLWZpbGUgJHdsJGV4cG9ydF9zeW1ib2xzIC1vICRsaWInCisgICAgICAgZmkKKyAg
ICAgICA7OworIAorQEAgLTg0OTYsOCArOTAxMCw4IEBAIF9MVF9FT0YKKyAKKyBfTFRfRU9GCisg
ICAgICAgZWxpZiAkTEQgLS1oZWxwIDImZ3Q7JmFtcDsxIHwgJEdSRVAgJzogc3VwcG9ydGVkIHRh
cmdldHM6LiogZWxmJyAmZ3Q7IC9kZXYvbnVsbDsgdGhlbgorLQlhcmNoaXZlX2NtZHM9JyRDQyAt
c2hhcmVkICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFncyAke3dsfS1zb25hbWUgJHds
JHNvbmFtZSAtbyAkbGliJworLQlhcmNoaXZlX2V4cHN5bV9jbWRzPSckQ0MgLXNoYXJlZCAkbGli
b2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MgJHt3bH0tc29uYW1lICR3bCRzb25hbWUgJHt3
bH0tcmV0YWluLXN5bWJvbHMtZmlsZSAkd2wkZXhwb3J0X3N5bWJvbHMgLW8gJGxpYicKKysJYXJj
aGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCAkcGljX2ZsYWcgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBp
bGVyX2ZsYWdzICR7d2x9LXNvbmFtZSAkd2wkc29uYW1lIC1vICRsaWInCisrCWFyY2hpdmVfZXhw
c3ltX2NtZHM9JyRDQyAtc2hhcmVkICRwaWNfZmxhZyAkbGlib2JqcyAkZGVwbGlicyAkY29tcGls
ZXJfZmxhZ3MgJHt3bH0tc29uYW1lICR3bCRzb25hbWUgJHt3bH0tcmV0YWluLXN5bWJvbHMtZmls
ZSAkd2wkZXhwb3J0X3N5bWJvbHMgLW8gJGxpYicKKyAgICAgICBlbHNlCisgCWxkX3NobGlicz1u
bworICAgICAgIGZpCitAQCAtODU0Myw4ICs5MDU3LDggQEAgX0xUX0VPRgorIAorICAgICAqKQor
ICAgICAgIGlmICRMRCAtLWhlbHAgMiZndDsmYW1wOzEgfCAkR1JFUCAnOiBzdXBwb3J0ZWQgdGFy
Z2V0czouKiBlbGYnICZndDsgL2Rldi9udWxsOyB0aGVuCistCWFyY2hpdmVfY21kcz0nJENDIC1z
aGFyZWQgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzICR7d2x9LXNvbmFtZSAkd2wk
c29uYW1lIC1vICRsaWInCistCWFyY2hpdmVfZXhwc3ltX2NtZHM9JyRDQyAtc2hhcmVkICRsaWJv
YmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFncyAke3dsfS1zb25hbWUgJHdsJHNvbmFtZSAke3ds
fS1yZXRhaW4tc3ltYm9scy1maWxlICR3bCRleHBvcnRfc3ltYm9scyAtbyAkbGliJworKwlhcmNo
aXZlX2NtZHM9JyRDQyAtc2hhcmVkICRwaWNfZmxhZyAkbGlib2JqcyAkZGVwbGlicyAkY29tcGls
ZXJfZmxhZ3MgJHt3bH0tc29uYW1lICR3bCRzb25hbWUgLW8gJGxpYicKKysJYXJjaGl2ZV9leHBz
eW1fY21kcz0nJENDIC1zaGFyZWQgJHBpY19mbGFnICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxl
cl9mbGFncyAke3dsfS1zb25hbWUgJHdsJHNvbmFtZSAke3dsfS1yZXRhaW4tc3ltYm9scy1maWxl
ICR3bCRleHBvcnRfc3ltYm9scyAtbyAkbGliJworICAgICAgIGVsc2UKKyAJbGRfc2hsaWJzPW5v
CisgICAgICAgZmkKK0BAIC04Njc0LDcgKzkxODgsMTMgQEAgX0xUX0VPRgorIAlhbGxvd191bmRl
ZmluZWRfZmxhZz0nLWJlcm9rJworICAgICAgICAgIyBEZXRlcm1pbmUgdGhlIGRlZmF1bHQgbGli
cGF0aCBmcm9tIHRoZSB2YWx1ZSBlbmNvZGVkIGluIGFuCisgICAgICAgICAjIGVtcHR5IGV4ZWN1
dGFibGUuCistICAgICAgICBpZiB0ZXN0IHgkZ2NjX25vX2xpbmsgPSB4eWVzOyB0aGVuCisrICAg
ICAgICBpZiB0ZXN0ICIke2x0X2N2X2FpeF9saWJwYXRoK3NldH0iID0gc2V0OyB0aGVuCisrICBh
aXhfbGlicGF0aD0kbHRfY3ZfYWl4X2xpYnBhdGgKKytlbHNlCisrICBpZiAke2x0X2N2X2FpeF9s
aWJwYXRoXys6fSBmYWxzZTsgdGhlbiA6CisrICAkYXNfZWNob19uICIoY2FjaGVkKSAiICZndDsm
YW1wOzYKKytlbHNlCisrICBpZiB0ZXN0IHgkZ2NjX25vX2xpbmsgPSB4eWVzOyB0aGVuCisgICBh
c19mbl9lcnJvciAkPyAiTGluayB0ZXN0cyBhcmUgbm90IGFsbG93ZWQgYWZ0ZXIgR0NDX05PX0VY
RUNVVEFCTEVTLiIgIiRMSU5FTk8iIDUKKyBmaQorIGNhdCBjb25mZGVmcy5oIC0gJmx0OyZsdDtf
QUNFT0YgJmd0O2NvbmZ0ZXN0LiRhY19leHQKK0BAIC04NjkwLDIyICs5MjEwLDI5IEBAIG1haW4g
KCkKKyBfQUNFT0YKKyBpZiBhY19mbl9jX3RyeV9saW5rICIkTElORU5PIjsgdGhlbiA6CisgCist
bHRfYWl4X2xpYnBhdGhfc2VkPScKKy0gICAgL0ltcG9ydCBGaWxlIFN0cmluZ3MvLC9eJC8gewor
LQkvXjAvIHsKKy0JICAgIHMvXjAgICpcKC4qXCkkL1wxLworLQkgICAgcAorLQl9CistICAgIH0n
CistYWl4X2xpYnBhdGg9YGR1bXAgLUggY29uZnRlc3QkYWNfZXhlZXh0IDImZ3Q7L2Rldi9udWxs
IHwgJFNFRCAtbiAtZSAiJGx0X2FpeF9saWJwYXRoX3NlZCJgCistIyBDaGVjayBmb3IgYSA2NC1i
aXQgb2JqZWN0IGlmIHdlIGRpZG4ndCBmaW5kIGFueXRoaW5nLgorLWlmIHRlc3QgLXogIiRhaXhf
bGlicGF0aCI7IHRoZW4KKy0gIGFpeF9saWJwYXRoPWBkdW1wIC1IWDY0IGNvbmZ0ZXN0JGFjX2V4
ZWV4dCAyJmd0Oy9kZXYvbnVsbCB8ICRTRUQgLW4gLWUgIiRsdF9haXhfbGlicGF0aF9zZWQiYAor
LWZpCisrICBsdF9haXhfbGlicGF0aF9zZWQ9JworKyAgICAgIC9JbXBvcnQgRmlsZSBTdHJpbmdz
LywvXiQvIHsKKysJICAvXjAvIHsKKysJICAgICAgcy9eMCAgKlwoW14gXSpcKSAqJC9cMS8KKysJ
ICAgICAgcAorKwkgIH0KKysgICAgICB9JworKyAgbHRfY3ZfYWl4X2xpYnBhdGhfPWBkdW1wIC1I
IGNvbmZ0ZXN0JGFjX2V4ZWV4dCAyJmd0Oy9kZXYvbnVsbCB8ICRTRUQgLW4gLWUgIiRsdF9haXhf
bGlicGF0aF9zZWQiYAorKyAgIyBDaGVjayBmb3IgYSA2NC1iaXQgb2JqZWN0IGlmIHdlIGRpZG4n
dCBmaW5kIGFueXRoaW5nLgorKyAgaWYgdGVzdCAteiAiJGx0X2N2X2FpeF9saWJwYXRoXyI7IHRo
ZW4KKysgICAgbHRfY3ZfYWl4X2xpYnBhdGhfPWBkdW1wIC1IWDY0IGNvbmZ0ZXN0JGFjX2V4ZWV4
dCAyJmd0Oy9kZXYvbnVsbCB8ICRTRUQgLW4gLWUgIiRsdF9haXhfbGlicGF0aF9zZWQiYAorKyAg
ZmkKKyBmaQorIHJtIC1mIGNvcmUgY29uZnRlc3QuZXJyIGNvbmZ0ZXN0LiRhY19vYmpleHQgXAor
ICAgICBjb25mdGVzdCRhY19leGVleHQgY29uZnRlc3QuJGFjX2V4dAorLWlmIHRlc3QgLXogIiRh
aXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQorKyAgaWYg
dGVzdCAteiAiJGx0X2N2X2FpeF9saWJwYXRoXyI7IHRoZW4KKysgICAgbHRfY3ZfYWl4X2xpYnBh
dGhfPSIvdXNyL2xpYjovbGliIgorKyAgZmkKKysKKytmaQorKworKyAgYWl4X2xpYnBhdGg9JGx0
X2N2X2FpeF9saWJwYXRoXworK2ZpCisgCisgICAgICAgICBoYXJkY29kZV9saWJkaXJfZmxhZ19z
cGVjPScke3dsfS1ibGlicGF0aDokbGliZGlyOiciJGFpeF9saWJwYXRoIgorICAgICAgICAgYXJj
aGl2ZV9leHBzeW1fY21kcz0nJENDIC1vICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxpYm9ianMg
JGRlcGxpYnMgJyJcJHt3bH0kbm9fZW50cnlfZmxhZyInICRjb21waWxlcl9mbGFncyBgaWYgdGVz
dCAieCR7YWxsb3dfdW5kZWZpbmVkX2ZsYWd9IiAhPSAieCI7IHRoZW4gZnVuY19lY2hvX2FsbCAi
JHt3bH0ke2FsbG93X3VuZGVmaW5lZF9mbGFnfSI7IGVsc2UgOjsgZmlgICciXCR7d2x9JGV4cF9z
eW1fZmxhZzpcJGV4cG9ydF9zeW1ib2xzICRzaGFyZWRfZmxhZyIKK0BAIC04NzE3LDcgKzkyNDQs
MTMgQEAgaWYgdGVzdCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9s
aWI6L2xpYiI7IGZpCisgCWVsc2UKKyAJICMgRGV0ZXJtaW5lIHRoZSBkZWZhdWx0IGxpYnBhdGgg
ZnJvbSB0aGUgdmFsdWUgZW5jb2RlZCBpbiBhbgorIAkgIyBlbXB0eSBleGVjdXRhYmxlLgorLQkg
aWYgdGVzdCB4JGdjY19ub19saW5rID0geHllczsgdGhlbgorKwkgaWYgdGVzdCAiJHtsdF9jdl9h
aXhfbGlicGF0aCtzZXR9IiA9IHNldDsgdGhlbgorKyAgYWl4X2xpYnBhdGg9JGx0X2N2X2FpeF9s
aWJwYXRoCisrZWxzZQorKyAgaWYgJHtsdF9jdl9haXhfbGlicGF0aF8rOn0gZmFsc2U7IHRoZW4g
OgorKyAgJGFzX2VjaG9fbiAiKGNhY2hlZCkgIiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAgaWYgdGVz
dCB4JGdjY19ub19saW5rID0geHllczsgdGhlbgorICAgYXNfZm5fZXJyb3IgJD8gIkxpbmsgdGVz
dHMgYXJlIG5vdCBhbGxvd2VkIGFmdGVyIEdDQ19OT19FWEVDVVRBQkxFUy4iICIkTElORU5PIiA1
CisgZmkKKyBjYXQgY29uZmRlZnMuaCAtICZsdDsmbHQ7X0FDRU9GICZndDtjb25mdGVzdC4kYWNf
ZXh0CitAQCAtODczMywyMiArOTI2NiwyOSBAQCBtYWluICgpCisgX0FDRU9GCisgaWYgYWNfZm5f
Y190cnlfbGluayAiJExJTkVOTyI7IHRoZW4gOgorIAorLWx0X2FpeF9saWJwYXRoX3NlZD0nCist
ICAgIC9JbXBvcnQgRmlsZSBTdHJpbmdzLywvXiQvIHsKKy0JL14wLyB7CistCSAgICBzL14wICAq
XCguKlwpJC9cMS8KKy0JICAgIHAKKy0JfQorLSAgICB9JworLWFpeF9saWJwYXRoPWBkdW1wIC1I
IGNvbmZ0ZXN0JGFjX2V4ZWV4dCAyJmd0Oy9kZXYvbnVsbCB8ICRTRUQgLW4gLWUgIiRsdF9haXhf
bGlicGF0aF9zZWQiYAorLSMgQ2hlY2sgZm9yIGEgNjQtYml0IG9iamVjdCBpZiB3ZSBkaWRuJ3Qg
ZmluZCBhbnl0aGluZy4KKy1pZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuCistICBhaXhf
bGlicGF0aD1gZHVtcCAtSFg2NCBjb25mdGVzdCRhY19leGVleHQgMiZndDsvZGV2L251bGwgfCAk
U0VEIC1uIC1lICIkbHRfYWl4X2xpYnBhdGhfc2VkImAKKy1maQorKyAgbHRfYWl4X2xpYnBhdGhf
c2VkPScKKysgICAgICAvSW1wb3J0IEZpbGUgU3RyaW5ncy8sL14kLyB7CisrCSAgL14wLyB7Cisr
CSAgICAgIHMvXjAgICpcKFteIF0qXCkgKiQvXDEvCisrCSAgICAgIHAKKysJICB9CisrICAgICAg
fScKKysgIGx0X2N2X2FpeF9saWJwYXRoXz1gZHVtcCAtSCBjb25mdGVzdCRhY19leGVleHQgMiZn
dDsvZGV2L251bGwgfCAkU0VEIC1uIC1lICIkbHRfYWl4X2xpYnBhdGhfc2VkImAKKysgICMgQ2hl
Y2sgZm9yIGEgNjQtYml0IG9iamVjdCBpZiB3ZSBkaWRuJ3QgZmluZCBhbnl0aGluZy4KKysgIGlm
IHRlc3QgLXogIiRsdF9jdl9haXhfbGlicGF0aF8iOyB0aGVuCisrICAgIGx0X2N2X2FpeF9saWJw
YXRoXz1gZHVtcCAtSFg2NCBjb25mdGVzdCRhY19leGVleHQgMiZndDsvZGV2L251bGwgfCAkU0VE
IC1uIC1lICIkbHRfYWl4X2xpYnBhdGhfc2VkImAKKysgIGZpCisgZmkKKyBybSAtZiBjb3JlIGNv
bmZ0ZXN0LmVyciBjb25mdGVzdC4kYWNfb2JqZXh0IFwKKyAgICAgY29uZnRlc3QkYWNfZXhlZXh0
IGNvbmZ0ZXN0LiRhY19leHQKKy1pZiB0ZXN0IC16ICIkYWl4X2xpYnBhdGgiOyB0aGVuIGFpeF9s
aWJwYXRoPSIvdXNyL2xpYjovbGliIjsgZmkKKysgIGlmIHRlc3QgLXogIiRsdF9jdl9haXhfbGli
cGF0aF8iOyB0aGVuCisrICAgIGx0X2N2X2FpeF9saWJwYXRoXz0iL3Vzci9saWI6L2xpYiIKKysg
IGZpCisrCisrZmkKKysKKysgIGFpeF9saWJwYXRoPSRsdF9jdl9haXhfbGlicGF0aF8KKytmaQor
IAorIAkgaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0nJHt3bH0tYmxpYnBhdGg6JGxpYmRpcjon
IiRhaXhfbGlicGF0aCIKKyAJICAjIFdhcm5pbmcgLSB3aXRob3V0IHVzaW5nIHRoZSBvdGhlciBy
dW4gdGltZSBsb2FkaW5nIGZsYWdzLAorQEAgLTg3OTMsMjAgKzkzMzMsNjMgQEAgaWYgdGVzdCAt
eiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZpCisg
ICAgICAgIyBNaWNyb3NvZnQgVmlzdWFsIEMrKy4KKyAgICAgICAjIGhhcmRjb2RlX2xpYmRpcl9m
bGFnX3NwZWMgaXMgYWN0dWFsbHkgbWVhbmluZ2xlc3MsIGFzIHRoZXJlIGlzCisgICAgICAgIyBu
byBzZWFyY2ggcGF0aCBmb3IgRExMcy4KKy0gICAgICBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVj
PScgJworLSAgICAgIGFsbG93X3VuZGVmaW5lZF9mbGFnPXVuc3VwcG9ydGVkCistICAgICAgIyBU
ZWxsIGx0bWFpbiB0byBtYWtlIC5saWIgZmlsZXMsIG5vdCAuYSBmaWxlcy4KKy0gICAgICBsaWJl
eHQ9bGliCistICAgICAgIyBUZWxsIGx0bWFpbiB0byBtYWtlIC5kbGwgZmlsZXMsIG5vdCAuc28g
ZmlsZXMuCistICAgICAgc2hyZXh0X2NtZHM9Ii5kbGwiCistICAgICAgIyBGSVhNRTogU2V0dGlu
ZyBsaW5rbmFtZXMgaGVyZSBpcyBhIGJhZCBoYWNrLgorLSAgICAgIGFyY2hpdmVfY21kcz0nJEND
IC1vICRsaWIgJGxpYm9ianMgJGNvbXBpbGVyX2ZsYWdzIGBmdW5jX2VjaG9fYWxsICIkZGVwbGli
cyIgfCAkU0VEICdcJydzLyAtbGMkLy8nXCcnYCAtbGluayAtZGxsfmxpbmtuYW1lcz0nCistICAg
ICAgIyBUaGUgbGlua2VyIHdpbGwgYXV0b21hdGljYWxseSBidWlsZCBhIC5saWIgZmlsZSBpZiB3
ZSBidWlsZCBhIERMTC4KKy0gICAgICBvbGRfYXJjaGl2ZV9mcm9tX25ld19jbWRzPSd0cnVlJwor
LSAgICAgICMgRklYTUU6IFNob3VsZCBsZXQgdGhlIHVzZXIgc3BlY2lmeSB0aGUgbGliIHByb2dy
YW0uCistICAgICAgb2xkX2FyY2hpdmVfY21kcz0nbGliIC1PVVQ6JG9sZGxpYiRvbGRvYmpzJG9s
ZF9kZXBsaWJzJworLSAgICAgIGZpeF9zcmNmaWxlX3BhdGg9J2BjeWdwYXRoIC13ICIkc3JjZmls
ZSJgJworLSAgICAgIGVuYWJsZV9zaGFyZWRfd2l0aF9zdGF0aWNfcnVudGltZXM9eWVzCisrICAg
ICAgY2FzZSAkY2NfYmFzZW5hbWUgaW4KKysgICAgICBjbCopCisrCSMgTmF0aXZlIE1TVkMKKysJ
aGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0nICcKKysJYWxsb3dfdW5kZWZpbmVkX2ZsYWc9dW5z
dXBwb3J0ZWQKKysJYWx3YXlzX2V4cG9ydF9zeW1ib2xzPXllcworKwlmaWxlX2xpc3Rfc3BlYz0n
QCcKKysJIyBUZWxsIGx0bWFpbiB0byBtYWtlIC5saWIgZmlsZXMsIG5vdCAuYSBmaWxlcy4KKysJ
bGliZXh0PWxpYgorKwkjIFRlbGwgbHRtYWluIHRvIG1ha2UgLmRsbCBmaWxlcywgbm90IC5zbyBm
aWxlcy4KKysJc2hyZXh0X2NtZHM9Ii5kbGwiCisrCSMgRklYTUU6IFNldHRpbmcgbGlua25hbWVz
IGhlcmUgaXMgYSBiYWQgaGFjay4KKysJYXJjaGl2ZV9jbWRzPSckQ0MgLW8gJG91dHB1dF9vYmpk
aXIvJHNvbmFtZSAkbGlib2JqcyAkY29tcGlsZXJfZmxhZ3MgJGRlcGxpYnMgLVdsLC1kbGx+bGlu
a25hbWVzPScKKysJYXJjaGl2ZV9leHBzeW1fY21kcz0naWYgdGVzdCAieGAkU0VEIDFxICRleHBv
cnRfc3ltYm9sc2AiID0geEVYUE9SVFM7IHRoZW4KKysJICAgIHNlZCAtbiAtZSAncy9cXFxcXFxc
KC4qXFxcXFxcXCkvLWxpbmtcXFwgLUVYUE9SVDpcXFxcXFxcMS8nIC1lICcxXFxcIXAnICZsdDsg
JGV4cG9ydF9zeW1ib2xzICZndDsgJG91dHB1dF9vYmpkaXIvJHNvbmFtZS5leHA7CisrCSAgZWxz
ZQorKwkgICAgc2VkIC1lICdzL1xcXFxcXFwoLipcXFxcXFxcKS8tbGlua1xcXCAtRVhQT1JUOlxc
XFxcXFwxLycgJmx0OyAkZXhwb3J0X3N5bWJvbHMgJmd0OyAkb3V0cHV0X29iamRpci8kc29uYW1l
LmV4cDsKKysJICBmaX4KKysJICAkQ0MgLW8gJHRvb2xfb3V0cHV0X29iamRpciRzb25hbWUgJGxp
Ym9ianMgJGNvbXBpbGVyX2ZsYWdzICRkZXBsaWJzICJAJHRvb2xfb3V0cHV0X29iamRpciRzb25h
bWUuZXhwIiAtV2wsLURMTCwtSU1QTElCOiIkdG9vbF9vdXRwdXRfb2JqZGlyJGxpYm5hbWUuZGxs
LmxpYiJ+CisrCSAgbGlua25hbWVzPScKKysJIyBUaGUgbGlua2VyIHdpbGwgbm90IGF1dG9tYXRp
Y2FsbHkgYnVpbGQgYSBzdGF0aWMgbGliIGlmIHdlIGJ1aWxkIGEgRExMLgorKwkjIF9MVF9UQUdW
QVIob2xkX2FyY2hpdmVfZnJvbV9uZXdfY21kcywgKT0ndHJ1ZScKKysJZW5hYmxlX3NoYXJlZF93
aXRoX3N0YXRpY19ydW50aW1lcz15ZXMKKysJZXhwb3J0X3N5bWJvbHNfY21kcz0nJE5NICRsaWJv
YmpzICRjb252ZW5pZW5jZSB8ICRnbG9iYWxfc3ltYm9sX3BpcGUgfCAkU0VEIC1lICdcJycvXltC
Q0RHUlNdWyBdL3MvLipbIF1cKFteIF0qXCkvXDEsREFUQS8nXCcnIHwgJFNFRCAtZSAnXCcnL15b
QUlUV11bIF0vcy8uKlsgXS8vJ1wnJyB8IHNvcnQgfCB1bmlxICZndDsgJGV4cG9ydF9zeW1ib2xz
JworKwkjIERvbid0IHVzZSByYW5saWIKKysJb2xkX3Bvc3RpbnN0YWxsX2NtZHM9J2NobW9kIDY0
NCAkb2xkbGliJworKwlwb3N0bGlua19jbWRzPSdsdF9vdXRwdXRmaWxlPSJAT1VUUFVUQCJ+Cisr
CSAgbHRfdG9vbF9vdXRwdXRmaWxlPSJAVE9PTF9PVVRQVVRAIn4KKysJICBjYXNlICRsdF9vdXRw
dXRmaWxlIGluCisrCSAgICAqLmV4ZXwqLkVYRSkgOzsKKysJICAgICopCisrCSAgICAgIGx0X291
dHB1dGZpbGU9IiRsdF9vdXRwdXRmaWxlLmV4ZSIKKysJICAgICAgbHRfdG9vbF9vdXRwdXRmaWxl
PSIkbHRfdG9vbF9vdXRwdXRmaWxlLmV4ZSIKKysJICAgICAgOzsKKysJICBlc2FjfgorKwkgIGlm
IHRlc3QgIiRNQU5JRkVTVF9UT09MIiAhPSAiOiIgJmFtcDsmYW1wOyB0ZXN0IC1mICIkbHRfb3V0
cHV0ZmlsZS5tYW5pZmVzdCI7IHRoZW4KKysJICAgICRNQU5JRkVTVF9UT09MIC1tYW5pZmVzdCAi
JGx0X3Rvb2xfb3V0cHV0ZmlsZS5tYW5pZmVzdCIgLW91dHB1dHJlc291cmNlOiIkbHRfdG9vbF9v
dXRwdXRmaWxlIiB8fCBleGl0IDE7CisrCSAgICAkUk0gIiRsdF9vdXRwdXRmaWxlLm1hbmlmZXN0
IjsKKysJICBmaScKKysJOzsKKysgICAgICAqKQorKwkjIEFzc3VtZSBNU1ZDIHdyYXBwZXIKKysJ
aGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYz0nICcKKysJYWxsb3dfdW5kZWZpbmVkX2ZsYWc9dW5z
dXBwb3J0ZWQKKysJIyBUZWxsIGx0bWFpbiB0byBtYWtlIC5saWIgZmlsZXMsIG5vdCAuYSBmaWxl
cy4KKysJbGliZXh0PWxpYgorKwkjIFRlbGwgbHRtYWluIHRvIG1ha2UgLmRsbCBmaWxlcywgbm90
IC5zbyBmaWxlcy4KKysJc2hyZXh0X2NtZHM9Ii5kbGwiCisrCSMgRklYTUU6IFNldHRpbmcgbGlu
a25hbWVzIGhlcmUgaXMgYSBiYWQgaGFjay4KKysJYXJjaGl2ZV9jbWRzPSckQ0MgLW8gJGxpYiAk
bGlib2JqcyAkY29tcGlsZXJfZmxhZ3MgYGZ1bmNfZWNob19hbGwgIiRkZXBsaWJzIiB8ICRTRUQg
J1wnJ3MvIC1sYyQvLydcJydgIC1saW5rIC1kbGx+bGlua25hbWVzPScKKysJIyBUaGUgbGlua2Vy
IHdpbGwgYXV0b21hdGljYWxseSBidWlsZCBhIC5saWIgZmlsZSBpZiB3ZSBidWlsZCBhIERMTC4K
KysJb2xkX2FyY2hpdmVfZnJvbV9uZXdfY21kcz0ndHJ1ZScKKysJIyBGSVhNRTogU2hvdWxkIGxl
dCB0aGUgdXNlciBzcGVjaWZ5IHRoZSBsaWIgcHJvZ3JhbS4KKysJb2xkX2FyY2hpdmVfY21kcz0n
bGliIC1PVVQ6JG9sZGxpYiRvbGRvYmpzJG9sZF9kZXBsaWJzJworKwllbmFibGVfc2hhcmVkX3dp
dGhfc3RhdGljX3J1bnRpbWVzPXllcworKwk7OworKyAgICAgIGVzYWMKKyAgICAgICA7OworIAor
ICAgICBkYXJ3aW4qIHwgcmhhcHNvZHkqKQorQEAgLTg4NjcsNyArOTQ1MCw3IEBAIGlmIHRlc3Qg
LXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIiOyBmaQor
IAorICAgICAjIEZyZWVCU0QgMyBhbmQgZ3JlYXRlciB1c2VzIGdjYyAtc2hhcmVkIHRvIGRvIHNo
YXJlZCBsaWJyYXJpZXMuCisgICAgIGZyZWVic2QqIHwgZHJhZ29uZmx5KikKKy0gICAgICBhcmNo
aXZlX2NtZHM9JyRDQyAtc2hhcmVkIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVy
X2ZsYWdzJworKyAgICAgIGFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJHBpY19mbGFnIC1vICRs
aWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzJworICAgICAgIGhhcmRjb2RlX2xp
YmRpcl9mbGFnX3NwZWM9Jy1SJGxpYmRpcicKKyAgICAgICBoYXJkY29kZV9kaXJlY3Q9eWVzCisg
ICAgICAgaGFyZGNvZGVfc2hsaWJwYXRoX3Zhcj1ubworQEAgLTg4NzUsNyArOTQ1OCw3IEBAIGlm
IHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3IvbGliOi9saWIi
OyBmaQorIAorICAgICBocHV4OSopCisgICAgICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4K
Ky0JYXJjaGl2ZV9jbWRzPSckUk0gJG91dHB1dF9vYmpkaXIvJHNvbmFtZX4kQ0MgLXNoYXJlZCAt
ZlBJQyAke3dsfStiICR7d2x9JGluc3RhbGxfbGliZGlyIC1vICRvdXRwdXRfb2JqZGlyLyRzb25h
bWUgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzfnRlc3QgJG91dHB1dF9vYmpkaXIv
JHNvbmFtZSA9ICRsaWIgfHwgbXYgJG91dHB1dF9vYmpkaXIvJHNvbmFtZSAkbGliJworKwlhcmNo
aXZlX2NtZHM9JyRSTSAkb3V0cHV0X29iamRpci8kc29uYW1lfiRDQyAtc2hhcmVkICRwaWNfZmxh
ZyAke3dsfStiICR7d2x9JGluc3RhbGxfbGliZGlyIC1vICRvdXRwdXRfb2JqZGlyLyRzb25hbWUg
JGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzfnRlc3QgJG91dHB1dF9vYmpkaXIvJHNv
bmFtZSA9ICRsaWIgfHwgbXYgJG91dHB1dF9vYmpkaXIvJHNvbmFtZSAkbGliJworICAgICAgIGVs
c2UKKyAJYXJjaGl2ZV9jbWRzPSckUk0gJG91dHB1dF9vYmpkaXIvJHNvbmFtZX4kTEQgLWIgK2Ig
JGluc3RhbGxfbGliZGlyIC1vICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxpYm9ianMgJGRlcGxp
YnMgJGxpbmtlcl9mbGFnc350ZXN0ICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgPSAkbGliIHx8IG12
ICRvdXRwdXRfb2JqZGlyLyRzb25hbWUgJGxpYicKKyAgICAgICBmaQorQEAgLTg4OTEsNyArOTQ3
NCw3IEBAIGlmIHRlc3QgLXogIiRhaXhfbGlicGF0aCI7IHRoZW4gYWl4X2xpYnBhdGg9Ii91c3Iv
bGliOi9saWIiOyBmaQorIAorICAgICBocHV4MTAqKQorICAgICAgIGlmIHRlc3QgIiRHQ0MiID0g
eWVzICZhbXA7JmFtcDsgdGVzdCAiJHdpdGhfZ251X2xkIiA9IG5vOyB0aGVuCistCWFyY2hpdmVf
Y21kcz0nJENDIC1zaGFyZWQgLWZQSUMgJHt3bH0raCAke3dsfSRzb25hbWUgJHt3bH0rYiAke3ds
fSRpbnN0YWxsX2xpYmRpciAtbyAkbGliICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFn
cycKKysJYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCAkcGljX2ZsYWcgJHt3bH0raCAke3dsfSRz
b25hbWUgJHt3bH0rYiAke3dsfSRpbnN0YWxsX2xpYmRpciAtbyAkbGliICRsaWJvYmpzICRkZXBs
aWJzICRjb21waWxlcl9mbGFncycKKyAgICAgICBlbHNlCisgCWFyY2hpdmVfY21kcz0nJExEIC1i
ICtoICRzb25hbWUgK2IgJGluc3RhbGxfbGliZGlyIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMg
JGxpbmtlcl9mbGFncycKKyAgICAgICBmaQorQEAgLTg5MTUsMTAgKzk0OTgsMTAgQEAgaWYgdGVz
dCAteiAiJGFpeF9saWJwYXRoIjsgdGhlbiBhaXhfbGlicGF0aD0iL3Vzci9saWI6L2xpYiI7IGZp
CisgCSAgYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCAke3dsfStoICR7d2x9JHNvbmFtZSAtbyAk
bGliICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFncycKKyAJICA7OworIAlpYTY0KikK
Ky0JICBhcmNoaXZlX2NtZHM9JyRDQyAtc2hhcmVkIC1mUElDICR7d2x9K2ggJHt3bH0kc29uYW1l
ICR7d2x9K25vZGVmYXVsdHJwYXRoIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVy
X2ZsYWdzJworKwkgIGFyY2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJHBpY19mbGFnICR7d2x9K2gg
JHt3bH0kc29uYW1lICR7d2x9K25vZGVmYXVsdHJwYXRoIC1vICRsaWIgJGxpYm9ianMgJGRlcGxp
YnMgJGNvbXBpbGVyX2ZsYWdzJworIAkgIDs7CisgCSopCistCSAgYXJjaGl2ZV9jbWRzPSckQ0Mg
LXNoYXJlZCAtZlBJQyAke3dsfStoICR7d2x9JHNvbmFtZSAke3dsfStiICR7d2x9JGluc3RhbGxf
bGliZGlyIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzJworKwkgIGFy
Y2hpdmVfY21kcz0nJENDIC1zaGFyZWQgJHBpY19mbGFnICR7d2x9K2ggJHt3bH0kc29uYW1lICR7
d2x9K2IgJHt3bH0kaW5zdGFsbF9saWJkaXIgLW8gJGxpYiAkbGlib2JqcyAkZGVwbGlicyAkY29t
cGlsZXJfZmxhZ3MnCisgCSAgOzsKKyAJZXNhYworICAgICAgIGVsc2UKK0BAIC04OTk3LDI2ICs5
NTgwLDM5IEBAIGZpCisgCisgICAgIGlyaXg1KiB8IGlyaXg2KiB8IG5vbnN0b3B1eCopCisgICAg
ICAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4KKy0JYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJl
ZCAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MgJHt3bH0tc29uYW1lICR7d2x9JHNv
bmFtZSBgdGVzdCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1wOyBmdW5jX2VjaG9fYWxsICIke3ds
fS1zZXRfdmVyc2lvbiAke3dsfSR2ZXJzdHJpbmciYCAke3dsfS11cGRhdGVfcmVnaXN0cnkgJHt3
bH0ke291dHB1dF9vYmpkaXJ9L3NvX2xvY2F0aW9ucyAtbyAkbGliJworKwlhcmNoaXZlX2NtZHM9
JyRDQyAtc2hhcmVkICRwaWNfZmxhZyAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3Mg
JHt3bH0tc29uYW1lICR7d2x9JHNvbmFtZSBgdGVzdCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1w
OyBmdW5jX2VjaG9fYWxsICIke3dsfS1zZXRfdmVyc2lvbiAke3dsfSR2ZXJzdHJpbmciYCAke3ds
fS11cGRhdGVfcmVnaXN0cnkgJHt3bH0ke291dHB1dF9vYmpkaXJ9L3NvX2xvY2F0aW9ucyAtbyAk
bGliJworIAkjIFRyeSB0byB1c2UgdGhlIC1leHBvcnRlZF9zeW1ib2wgbGQgb3B0aW9uLCBpZiBp
dCBkb2VzIG5vdAorIAkjIHdvcmssIGFzc3VtZSB0aGF0IC1leHBvcnRzX2ZpbGUgZG9lcyBub3Qg
d29yayBlaXRoZXIgYW5kCisgCSMgaW1wbGljaXRseSBleHBvcnQgYWxsIHN5bWJvbHMuCistICAg
ICAgICBzYXZlX0xERkxBR1M9IiRMREZMQUdTIgorLSAgICAgICAgTERGTEFHUz0iJExERkxBR1Mg
LXNoYXJlZCAke3dsfS1leHBvcnRlZF9zeW1ib2wgJHt3bH1mb28gJHt3bH0tdXBkYXRlX3JlZ2lz
dHJ5ICR7d2x9L2Rldi9udWxsIgorLSAgICAgICAgaWYgdGVzdCB4JGdjY19ub19saW5rID0geHll
czsgdGhlbgorKwkjIFRoaXMgc2hvdWxkIGJlIHRoZSBzYW1lIGZvciBhbGwgbGFuZ3VhZ2VzLCBz
byBubyBwZXItdGFnIGNhY2hlIHZhcmlhYmxlLgorKwl7ICRhc19lY2hvICIkYXNfbWU6JHthc19s
aW5lbm8tJExJTkVOT306IGNoZWNraW5nIHdoZXRoZXIgdGhlICRob3N0X29zIGxpbmtlciBhY2Nl
cHRzIC1leHBvcnRlZF9zeW1ib2wiICZndDsmYW1wOzUKKyskYXNfZWNob19uICJjaGVja2luZyB3
aGV0aGVyIHRoZSAkaG9zdF9vcyBsaW5rZXIgYWNjZXB0cyAtZXhwb3J0ZWRfc3ltYm9sLi4uICIg
Jmd0OyZhbXA7NjsgfQorK2lmICR7bHRfY3ZfaXJpeF9leHBvcnRlZF9zeW1ib2wrOn0gZmFsc2U7
IHRoZW4gOgorKyAgJGFzX2VjaG9fbiAiKGNhY2hlZCkgIiAmZ3Q7JmFtcDs2CisrZWxzZQorKyAg
c2F2ZV9MREZMQUdTPSIkTERGTEFHUyIKKysJICAgTERGTEFHUz0iJExERkxBR1MgLXNoYXJlZCAk
e3dsfS1leHBvcnRlZF9zeW1ib2wgJHt3bH1mb28gJHt3bH0tdXBkYXRlX3JlZ2lzdHJ5ICR7d2x9
L2Rldi9udWxsIgorKwkgICBpZiB0ZXN0IHgkZ2NjX25vX2xpbmsgPSB4eWVzOyB0aGVuCisgICBh
c19mbl9lcnJvciAkPyAiTGluayB0ZXN0cyBhcmUgbm90IGFsbG93ZWQgYWZ0ZXIgR0NDX05PX0VY
RUNVVEFCTEVTLiIgIiRMSU5FTk8iIDUKKyBmaQorIGNhdCBjb25mZGVmcy5oIC0gJmx0OyZsdDtf
QUNFT0YgJmd0O2NvbmZ0ZXN0LiRhY19leHQKKyAvKiBlbmQgY29uZmRlZnMuaC4gICovCistaW50
IGZvbyh2b2lkKSB7fQorK2ludCBmb28gKHZvaWQpIHsgcmV0dXJuIDA7IH0KKyBfQUNFT0YKKyBp
ZiBhY19mbl9jX3RyeV9saW5rICIkTElORU5PIjsgdGhlbiA6CistICBhcmNoaXZlX2V4cHN5bV9j
bWRzPSckQ0MgLXNoYXJlZCAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MgJHt3bH0t
c29uYW1lICR7d2x9JHNvbmFtZSBgdGVzdCAtbiAiJHZlcnN0cmluZyIgJmFtcDsmYW1wOyBmdW5j
X2VjaG9fYWxsICIke3dsfS1zZXRfdmVyc2lvbiAke3dsfSR2ZXJzdHJpbmciYCAke3dsfS11cGRh
dGVfcmVnaXN0cnkgJHt3bH0ke291dHB1dF9vYmpkaXJ9L3NvX2xvY2F0aW9ucyAke3dsfS1leHBv
cnRzX2ZpbGUgJHt3bH0kZXhwb3J0X3N5bWJvbHMgLW8gJGxpYicKKy0KKysgIGx0X2N2X2lyaXhf
ZXhwb3J0ZWRfc3ltYm9sPXllcworK2Vsc2UKKysgIGx0X2N2X2lyaXhfZXhwb3J0ZWRfc3ltYm9s
PW5vCisgZmkKKyBybSAtZiBjb3JlIGNvbmZ0ZXN0LmVyciBjb25mdGVzdC4kYWNfb2JqZXh0IFwK
KyAgICAgY29uZnRlc3QkYWNfZXhlZXh0IGNvbmZ0ZXN0LiRhY19leHQKKy0gICAgICAgIExERkxB
R1M9IiRzYXZlX0xERkxBR1MiCisrICAgICAgICAgICBMREZMQUdTPSIkc2F2ZV9MREZMQUdTIgor
K2ZpCisreyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRMSU5FTk99OiByZXN1bHQ6ICRs
dF9jdl9pcml4X2V4cG9ydGVkX3N5bWJvbCIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIkbHRfY3Zf
aXJpeF9leHBvcnRlZF9zeW1ib2wiICZndDsmYW1wOzY7IH0KKysJaWYgdGVzdCAiJGx0X2N2X2ly
aXhfZXhwb3J0ZWRfc3ltYm9sIiA9IHllczsgdGhlbgorKyAgICAgICAgICBhcmNoaXZlX2V4cHN5
bV9jbWRzPSckQ0MgLXNoYXJlZCAkcGljX2ZsYWcgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVy
X2ZsYWdzICR7d2x9LXNvbmFtZSAke3dsfSRzb25hbWUgYHRlc3QgLW4gIiR2ZXJzdHJpbmciICZh
bXA7JmFtcDsgZnVuY19lY2hvX2FsbCAiJHt3bH0tc2V0X3ZlcnNpb24gJHt3bH0kdmVyc3RyaW5n
ImAgJHt3bH0tdXBkYXRlX3JlZ2lzdHJ5ICR7d2x9JHtvdXRwdXRfb2JqZGlyfS9zb19sb2NhdGlv
bnMgJHt3bH0tZXhwb3J0c19maWxlICR7d2x9JGV4cG9ydF9zeW1ib2xzIC1vICRsaWInCisrCWZp
CisgICAgICAgZWxzZQorIAlhcmNoaXZlX2NtZHM9JyRDQyAtc2hhcmVkICRsaWJvYmpzICRkZXBs
aWJzICRjb21waWxlcl9mbGFncyAtc29uYW1lICRzb25hbWUgYHRlc3QgLW4gIiR2ZXJzdHJpbmci
ICZhbXA7JmFtcDsgZnVuY19lY2hvX2FsbCAiLXNldF92ZXJzaW9uICR2ZXJzdHJpbmciYCAtdXBk
YXRlX3JlZ2lzdHJ5ICR7b3V0cHV0X29iamRpcn0vc29fbG9jYXRpb25zIC1vICRsaWInCisgCWFy
Y2hpdmVfZXhwc3ltX2NtZHM9JyRDQyAtc2hhcmVkICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxl
cl9mbGFncyAtc29uYW1lICRzb25hbWUgYHRlc3QgLW4gIiR2ZXJzdHJpbmciICZhbXA7JmFtcDsg
ZnVuY19lY2hvX2FsbCAiLXNldF92ZXJzaW9uICR2ZXJzdHJpbmciYCAtdXBkYXRlX3JlZ2lzdHJ5
ICR7b3V0cHV0X29iamRpcn0vc29fbG9jYXRpb25zIC1leHBvcnRzX2ZpbGUgJGV4cG9ydF9zeW1i
b2xzIC1vICRsaWInCitAQCAtOTEwMSw3ICs5Njk3LDcgQEAgcm0gLWYgY29yZSBjb25mdGVzdC5l
cnIgY29uZnRlc3QuJGFjX29iamV4dCBcCisgICAgIG9zZjQqIHwgb3NmNSopCSMgYXMgb3NmMyog
d2l0aCB0aGUgYWRkaXRpb24gb2YgLW1zeW0gZmxhZworICAgICAgIGlmIHRlc3QgIiRHQ0MiID0g
eWVzOyB0aGVuCisgCWFsbG93X3VuZGVmaW5lZF9mbGFnPScgJHt3bH0tZXhwZWN0X3VucmVzb2x2
ZWQgJHt3bH1cKicKKy0JYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCR7YWxsb3dfdW5kZWZpbmVk
X2ZsYWd9ICRsaWJvYmpzICRkZXBsaWJzICRjb21waWxlcl9mbGFncyAke3dsfS1tc3ltICR7d2x9
LXNvbmFtZSAke3dsfSRzb25hbWUgYHRlc3QgLW4gIiR2ZXJzdHJpbmciICZhbXA7JmFtcDsgZnVu
Y19lY2hvX2FsbCAiJHt3bH0tc2V0X3ZlcnNpb24gJHt3bH0kdmVyc3RyaW5nImAgJHt3bH0tdXBk
YXRlX3JlZ2lzdHJ5ICR7d2x9JHtvdXRwdXRfb2JqZGlyfS9zb19sb2NhdGlvbnMgLW8gJGxpYicK
KysJYXJjaGl2ZV9jbWRzPSckQ0MgLXNoYXJlZCR7YWxsb3dfdW5kZWZpbmVkX2ZsYWd9ICRwaWNf
ZmxhZyAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MgJHt3bH0tbXN5bSAke3dsfS1z
b25hbWUgJHt3bH0kc29uYW1lIGB0ZXN0IC1uICIkdmVyc3RyaW5nIiAmYW1wOyZhbXA7IGZ1bmNf
ZWNob19hbGwgIiR7d2x9LXNldF92ZXJzaW9uICR7d2x9JHZlcnN0cmluZyJgICR7d2x9LXVwZGF0
ZV9yZWdpc3RyeSAke3dsfSR7b3V0cHV0X29iamRpcn0vc29fbG9jYXRpb25zIC1vICRsaWInCisg
CWhhcmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9JyR7d2x9LXJwYXRoICR7d2x9JGxpYmRpcicKKyAg
ICAgICBlbHNlCisgCWFsbG93X3VuZGVmaW5lZF9mbGFnPScgLWV4cGVjdF91bnJlc29sdmVkIFwq
JworQEAgLTkxMjAsOSArOTcxNiw5IEBAIHJtIC1mIGNvcmUgY29uZnRlc3QuZXJyIGNvbmZ0ZXN0
LiRhY19vYmpleHQgXAorICAgICAgIG5vX3VuZGVmaW5lZF9mbGFnPScgLXogZGVmcycKKyAgICAg
ICBpZiB0ZXN0ICIkR0NDIiA9IHllczsgdGhlbgorIAl3bGFyYz0nJHt3bH0nCistCWFyY2hpdmVf
Y21kcz0nJENDIC1zaGFyZWQgJHt3bH0teiAke3dsfXRleHQgJHt3bH0taCAke3dsfSRzb25hbWUg
LW8gJGxpYiAkbGlib2JqcyAkZGVwbGlicyAkY29tcGlsZXJfZmxhZ3MnCisrCWFyY2hpdmVfY21k
cz0nJENDIC1zaGFyZWQgJHBpY19mbGFnICR7d2x9LXogJHt3bH10ZXh0ICR7d2x9LWggJHt3bH0k
c29uYW1lIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzJworIAlhcmNo
aXZlX2V4cHN5bV9jbWRzPSdlY2hvICJ7IGdsb2JhbDoiICZndDsgJGxpYi5leHB+Y2F0ICRleHBv
cnRfc3ltYm9scyB8ICRTRUQgLWUgInMvXCguKlwpL1wxOy8iICZndDsmZ3Q7ICRsaWIuZXhwfmVj
aG8gImxvY2FsOiAqOyB9OyIgJmd0OyZndDsgJGxpYi5leHB+CistCSAgJENDIC1zaGFyZWQgJHt3
bH0teiAke3dsfXRleHQgJHt3bH0tTSAke3dsfSRsaWIuZXhwICR7d2x9LWggJHt3bH0kc29uYW1l
IC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMgJGNvbXBpbGVyX2ZsYWdzfiRSTSAkbGliLmV4cCcK
KysJICAkQ0MgLXNoYXJlZCAkcGljX2ZsYWcgJHt3bH0teiAke3dsfXRleHQgJHt3bH0tTSAke3ds
fSRsaWIuZXhwICR7d2x9LWggJHt3bH0kc29uYW1lIC1vICRsaWIgJGxpYm9ianMgJGRlcGxpYnMg
JGNvbXBpbGVyX2ZsYWdzfiRSTSAkbGliLmV4cCcKKyAgICAgICBlbHNlCisgCWNhc2UgYCRDQyAt
ViAyJmd0OyZhbXA7MWAgaW4KKyAJKiJDb21waWxlcnMgNS4wPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOiopK0BALTk2OTgsOCsxMDI5NCw5QEBjeWd3aW4qfG1p
bmd3KnxwdzMyKnxjZWdjYyopK25lZWRfdmVyc2lvbj1ubytuZWVkX2xpYl9wcmVmaXg9bm8rKy1j
YXNlJEdDQywkaG9zdF9vc2luKy15ZXMsY3lnd2luKnx5ZXMsbWluZ3cqfHllcyxwdzMyKnx5ZXMs
Y2VnY2MqKSsrY2FzZSRHQ0MsJGNjX2Jhc2VuYW1laW4rK3llcywqKSsrI2djYytsaWJyYXJ5X25h
bWVzX3NwZWM9JyRsaWJuYW1lLmRsbC5hJysjRExMaXNpbnN0YWxsZWR0byQobGliZGlyKS8uLi9i
aW5ieXBvc3RpbnN0YWxsX2NtZHMrcG9zdGluc3RhbGxfY21kcz0nYmFzZV9maWxlPWBiYXNlbmFt
ZVwke2ZpbGV9YH4rQEAtOTczMiwxMysxMDMyOSw3MUBAY3lnd2luKnxtaW5ndyp8cHczMip8Y2Vn
Y2MqKStsaWJyYXJ5X25hbWVzX3NwZWM9J2BlY2hvJHtsaWJuYW1lfXxzZWQtZSdzL15saWIvcHcv
J2BgZWNobyR7cmVsZWFzZX18JFNFRC1lJ3MvWy5dLy0vZydgJHt2ZXJzdWZmaXh9JHtzaGFyZWRf
ZXh0fScrOzsrZXNhYysrZHluYW1pY19saW5rZXI9J1dpbjMybGQuZXhlJysrOzsrKysrKixjbCop
KysjTmF0aXZlTVNWQysrbGlibmFtZV9zcGVjPSckbmFtZScrK3NvbmFtZV9zcGVjPScke2xpYm5h
bWV9YGVjaG8ke3JlbGVhc2V9fCRTRUQtZSdzL1suXS8tL2cnYCR7dmVyc3VmZml4fSR7c2hhcmVk
X2V4dH0nKytsaWJyYXJ5X25hbWVzX3NwZWM9JyR7bGlibmFtZX0uZGxsLmxpYicrKysrY2FzZSRi
dWlsZF9vc2luKyttaW5ndyopKytzeXNfbGliX3NlYXJjaF9wYXRoX3NwZWM9KytsdF9zYXZlX2lm
cz0kSUZTKytJRlM9JzsnKytmb3JsdF9wYXRoaW4kTElCKytkbysrSUZTPSRsdF9zYXZlX2lmcysr
I0xldERPU3ZhcmlhYmxlZXhwYW5zaW9ucHJpbnR0aGVzaG9ydDguM3N0eWxlZmlsZW5hbWUuKyts
dF9wYXRoPWBjZCI+IiopCitAQCAtOTY5OCw4ICsxMDI5NCw5IEBAIGN5Z3dpbiogfCBtaW5ndyog
fCBwdzMyKiB8IGNlZ2NjKikKKyAgIG5lZWRfdmVyc2lvbj1ubworICAgbmVlZF9saWJfcHJlZml4
PW5vCisgCistICBjYXNlICRHQ0MsJGhvc3Rfb3MgaW4KKy0gIHllcyxjeWd3aW4qIHwgeWVzLG1p
bmd3KiB8IHllcyxwdzMyKiB8IHllcyxjZWdjYyopCisrICBjYXNlICRHQ0MsJGNjX2Jhc2VuYW1l
IGluCisrICB5ZXMsKikKKysgICAgIyBnY2MKKyAgICAgbGlicmFyeV9uYW1lc19zcGVjPSckbGli
bmFtZS5kbGwuYScKKyAgICAgIyBETEwgaXMgaW5zdGFsbGVkIHRvICQobGliZGlyKS8uLi9iaW4g
YnkgcG9zdGluc3RhbGxfY21kcworICAgICBwb3N0aW5zdGFsbF9jbWRzPSdiYXNlX2ZpbGU9YGJh
c2VuYW1lIFwke2ZpbGV9YH4KK0BAIC05NzMyLDEzICsxMDMyOSw3MSBAQCBjeWd3aW4qIHwgbWlu
Z3cqIHwgcHczMiogfCBjZWdjYyopCisgICAgICAgbGlicmFyeV9uYW1lc19zcGVjPSdgZWNobyAk
e2xpYm5hbWV9IHwgc2VkIC1lICdzL15saWIvcHcvJ2BgZWNobyAke3JlbGVhc2V9IHwgJFNFRCAt
ZSAncy9bLl0vLS9nJ2Ake3ZlcnN1ZmZpeH0ke3NoYXJlZF9leHR9JworICAgICAgIDs7CisgICAg
IGVzYWMKKysgICAgZHluYW1pY19saW5rZXI9J1dpbjMyIGxkLmV4ZScKKysgICAgOzsKKysKKysg
ICosY2wqKQorKyAgICAjIE5hdGl2ZSBNU1ZDCisrICAgIGxpYm5hbWVfc3BlYz0nJG5hbWUnCisr
ICAgIHNvbmFtZV9zcGVjPScke2xpYm5hbWV9YGVjaG8gJHtyZWxlYXNlfSB8ICRTRUQgLWUgJ3Mv
Wy5dLy0vZydgJHt2ZXJzdWZmaXh9JHtzaGFyZWRfZXh0fScKKysgICAgbGlicmFyeV9uYW1lc19z
cGVjPScke2xpYm5hbWV9LmRsbC5saWInCisrCisrICAgIGNhc2UgJGJ1aWxkX29zIGluCisrICAg
IG1pbmd3KikKKysgICAgICBzeXNfbGliX3NlYXJjaF9wYXRoX3NwZWM9CisrICAgICAgbHRfc2F2
ZV9pZnM9JElGUworKyAgICAgIElGUz0nOycKKysgICAgICBmb3IgbHRfcGF0aCBpbiAkTElCCisr
ICAgICAgZG8KKysgICAgICAgIElGUz0kbHRfc2F2ZV9pZnMKKysgICAgICAgICMgTGV0IERPUyB2
YXJpYWJsZSBleHBhbnNpb24gcHJpbnQgdGhlIHNob3J0IDguMyBzdHlsZSBmaWxlIG5hbWUuCisr
ICAgICAgICBsdF9wYXRoPWBjZCAiPC9hPiRsdF9wYXRoIiAyJmd0Oy9kZXYvbnVsbCAmYW1wOyZh
bXA7IGNtZCAvL0MgImZvciAlaSBpbiAoIi4iKSBkbyBAZWNobyAlfnNpImAKKysgICAgICAgIHN5
c19saWJfc2VhcmNoX3BhdGhfc3BlYz0iJHN5c19saWJfc2VhcmNoX3BhdGhfc3BlYyAkbHRfcGF0
aCIKKysgICAgICBkb25lCisrICAgICAgSUZTPSRsdF9zYXZlX2lmcworKyAgICAgICMgQ29udmVy
dCB0byBNU1lTIHN0eWxlLgorKyAgICAgIHN5c19saWJfc2VhcmNoX3BhdGhfc3BlYz1gJEVDSE8g
IiRzeXNfbGliX3NlYXJjaF9wYXRoX3NwZWMiIHwgc2VkIC1lICdzfFxcXFx8L3xnJyAtZSAnc3wg
XFwoW2EtekEtWl1cXCk6fCAvXFwxfGcnIC1lICdzfF4gfHwnYAorKyAgICAgIDs7CisrICAgIGN5
Z3dpbiopCisrICAgICAgIyBDb252ZXJ0IHRvIHVuaXggZm9ybSwgdGhlbiB0byBkb3MgZm9ybSwg
dGhlbiBiYWNrIHRvIHVuaXggZm9ybQorKyAgICAgICMgYnV0IHRoaXMgdGltZSBkb3Mgc3R5bGUg
KG5vIHNwYWNlcyEpIHNvIHRoYXQgdGhlIHVuaXggZm9ybSBsb29rcworKyAgICAgICMgbGlrZSAv
Y3lnZHJpdmUvYy9QUk9HUkF+MTovY3lnZHIuLi4KKysgICAgICBzeXNfbGliX3NlYXJjaF9wYXRo
X3NwZWM9YGN5Z3BhdGggLS1wYXRoIC0tdW5peCAiJExJQiJgCisrICAgICAgc3lzX2xpYl9zZWFy
Y2hfcGF0aF9zcGVjPWBjeWdwYXRoIC0tcGF0aCAtLWRvcyAiJHN5c19saWJfc2VhcmNoX3BhdGhf
c3BlYyIgMiZndDsvZGV2L251bGxgCisrICAgICAgc3lzX2xpYl9zZWFyY2hfcGF0aF9zcGVjPWBj
eWdwYXRoIC0tcGF0aCAtLXVuaXggIiRzeXNfbGliX3NlYXJjaF9wYXRoX3NwZWMiIHwgJFNFRCAt
ZSAicy8kUEFUSF9TRVBBUkFUT1IvIC9nImAKKysgICAgICA7OworKyAgICAqKQorKyAgICAgIHN5
c19saWJfc2VhcmNoX3BhdGhfc3BlYz0iJExJQiIKKysgICAgICBpZiAkRUNITyAiJHN5c19saWJf
c2VhcmNoX3BhdGhfc3BlYyIgfCAkR1JFUCAnO1tjLXpDLVpdOi8nICZndDsvZGV2L251bGw7IHRo
ZW4KKysgICAgICAgICMgSXQgaXMgbW9zdCBwcm9iYWJseSBhIFdpbmRvd3MgZm9ybWF0IFBBVEgu
CisrICAgICAgICBzeXNfbGliX3NlYXJjaF9wYXRoX3NwZWM9YCRFQ0hPICIkc3lzX2xpYl9zZWFy
Y2hfcGF0aF9zcGVjIiB8ICRTRUQgLWUgJ3MvOy8gL2cnYAorKyAgICAgIGVsc2UKKysgICAgICAg
IHN5c19saWJfc2VhcmNoX3BhdGhfc3BlYz1gJEVDSE8gIiRzeXNfbGliX3NlYXJjaF9wYXRoX3Nw
ZWMiIHwgJFNFRCAtZSAicy8kUEFUSF9TRVBBUkFUT1IvIC9nImAKKysgICAgICBmaQorKyAgICAg
ICMgRklYTUU6IGZpbmQgdGhlIHNob3J0IG5hbWUgb3IgdGhlIHBhdGggY29tcG9uZW50cywgYXMg
c3BhY2VzIGFyZQorKyAgICAgICMgY29tbW9uLiAoZS5nLiAiUHJvZ3JhbSBGaWxlcyIgLSZndDsg
IlBST0dSQX4xIikKKysgICAgICA7OworKyAgICBlc2FjCisrCisrICAgICMgRExMIGlzIGluc3Rh
bGxlZCB0byAkKGxpYmRpcikvLi4vYmluIGJ5IHBvc3RpbnN0YWxsX2NtZHMKKysgICAgcG9zdGlu
c3RhbGxfY21kcz0nYmFzZV9maWxlPWBiYXNlbmFtZSBcJHtmaWxlfWB+CisrICAgICAgZGxwYXRo
PWAkU0hFTEwgMiZndDsmYW1wOzEgLWMgJ1wnJy4gJGRpci8nXCcnXCR7YmFzZV9maWxlfSdcJydp
OyBlY2hvIFwkZGxuYW1lJ1wnJ2B+CisrICAgICAgZGxkaXI9JGRlc3RkaXIvYGRpcm5hbWUgXCRk
bHBhdGhgfgorKyAgICAgIHRlc3QgLWQgXCRkbGRpciB8fCBta2RpciAtcCBcJGRsZGlyfgorKyAg
ICAgICRpbnN0YWxsX3Byb2cgJGRpci8kZGxuYW1lIFwkZGxkaXIvJGRsbmFtZScKKysgICAgcG9z
dHVuaW5zdGFsbF9jbWRzPSdkbGRsbD1gJFNIRUxMIDImZ3Q7JmFtcDsxIC1jICdcJycuICRmaWxl
OyBlY2hvIFwkZGxuYW1lJ1wnJ2B+CisrICAgICAgZGxwYXRoPSRkaXIvXCRkbGRsbH4KKysgICAg
ICAgJFJNIFwkZGxwYXRoJworKyAgICBzaGxpYnBhdGhfb3ZlcnJpZGVzX3J1bnBhdGg9eWVzCisr
ICAgIGR5bmFtaWNfbGlua2VyPSdXaW4zMiBsaW5rLmV4ZScKKyAgICAgOzsKKyAKKyAgICopCisr
ICAgICMgQXNzdW1lIE1TVkMgd3JhcHBlcgorICAgICBsaWJyYXJ5X25hbWVzX3NwZWM9JyR7bGli
bmFtZX1gZWNobyAke3JlbGVhc2V9IHwgJFNFRCAtZSAncy9bLl0vLS9nJ2Ake3ZlcnN1ZmZpeH0k
e3NoYXJlZF9leHR9ICRsaWJuYW1lLmxpYicKKysgICAgZHluYW1pY19saW5rZXI9J1dpbjMyIGxk
LmV4ZScKKyAgICAgOzsKKyAgIGVzYWMKKy0gIGR5bmFtaWNfbGlua2VyPSdXaW4zMiBsZC5leGUn
CisgICAjIEZJWE1FOiBmaXJzdCB3ZSBzaG91bGQgc2VhcmNoIC4gYW5kIHRoZSBkaXJlY3Rvcnkg
dGhlIGV4ZWN1dGFibGUgaXMgaW4KKyAgIHNobGlicGF0aF92YXI9UEFUSAorICAgOzsKK0BAIC05
ODMwLDcgKzEwNDg1LDcgQEAgaGFpa3UqKQorICAgc29uYW1lX3NwZWM9JyR7bGlibmFtZX0ke3Jl
bGVhc2V9JHtzaGFyZWRfZXh0fSRtYWpvcicKKyAgIHNobGlicGF0aF92YXI9TElCUkFSWV9QQVRI
CisgICBzaGxpYnBhdGhfb3ZlcnJpZGVzX3J1bnBhdGg9eWVzCistICBzeXNfbGliX2Rsc2VhcmNo
X3BhdGhfc3BlYz0nL2Jvb3QvaG9tZS9jb25maWcvbGliIC9ib290L2NvbW1vbi9saWIgL2Jvb3Qv
YmVvcy9zeXN0ZW0vbGliJworKyAgc3lzX2xpYl9kbHNlYXJjaF9wYXRoX3NwZWM9Jy9ib290L2hv
bWUvY29uZmlnL2xpYiAvYm9vdC9jb21tb24vbGliIC9ib290L3N5c3RlbS9saWInCisgICBoYXJk
Y29kZV9pbnRvX2xpYnM9eWVzCisgICA7OworIAorQEAgLTEwNjQ0LDcgKzExMjk5LDcgQEAgZWxz
ZQorICAgbHRfZGx1bmtub3duPTA7IGx0X2Rsbm9fdXNjb3JlPTE7IGx0X2RsbmVlZF91c2NvcmU9
MgorICAgbHRfc3RhdHVzPSRsdF9kbHVua25vd24KKyAgIGNhdCAmZ3Q7IGNvbmZ0ZXN0LiRhY19l
eHQgJmx0OyZsdDtfTFRfRU9GCistI2xpbmUgMTA2NDcgImNvbmZpZ3VyZSIKKysjbGluZSAkTElO
RU5PICJjb25maWd1cmUiCisgI2luY2x1ZGUgImNvbmZkZWZzLmgiCisgCisgI2lmIEhBVkVfRExG
Q05fSAorQEAgLTEwNjg4LDEwICsxMTM0MywxMCBAQCBlbHNlCisgLyogV2hlbiAtZnZpc2JpbGl0
eT1oaWRkZW4gaXMgdXNlZCwgYXNzdW1lIHRoZSBjb2RlIGhhcyBiZWVuIGFubm90YXRlZAorICAg
IGNvcnJlc3BvbmRpbmdseSBmb3IgdGhlIHN5bWJvbHMgbmVlZGVkLiAgKi8KKyAjaWYgZGVmaW5l
ZChfX0dOVUNfXykgJmFtcDsmYW1wOyAoKChfX0dOVUNfXyA9PSAzKSAmYW1wOyZhbXA7IChfX0dO
VUNfTUlOT1JfXyAmZ3Q7PSAzKSkgfHwgKF9fR05VQ19fICZndDsgMykpCistdm9pZCBmbm9yZCAo
KSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJkZWZhdWx0IikpKTsKKytpbnQgZm5vcmQgKCkg
X19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiZGVmYXVsdCIpKSk7CisgI2VuZGlmCisgCistdm9p
ZCBmbm9yZCAoKSB7IGludCBpPTQyOyB9CisraW50IGZub3JkICgpIHsgcmV0dXJuIDQyOyB9Cisg
aW50IG1haW4gKCkKKyB7CisgICB2b2lkICpzZWxmID0gZGxvcGVuICgwLCBMVF9ETEdMT0JBTHxM
VF9ETExBWllfT1JfTk9XKTsKK0BAIC0xMDc1MCw3ICsxMTQwNSw3IEBAIGVsc2UKKyAgIGx0X2Rs
dW5rbm93bj0wOyBsdF9kbG5vX3VzY29yZT0xOyBsdF9kbG5lZWRfdXNjb3JlPTIKKyAgIGx0X3N0
YXR1cz0kbHRfZGx1bmtub3duCisgICBjYXQgJmd0OyBjb25mdGVzdC4kYWNfZXh0ICZsdDsmbHQ7
X0xUX0VPRgorLSNsaW5lIDEwNzUzICJjb25maWd1cmUiCisrI2xpbmUgJExJTkVOTyAiY29uZmln
dXJlIgorICNpbmNsdWRlICJjb25mZGVmcy5oIgorIAorICNpZiBIQVZFX0RMRkNOX0gKK0BAIC0x
MDc5NCwxMCArMTE0NDksMTAgQEAgZWxzZQorIC8qIFdoZW4gLWZ2aXNiaWxpdHk9aGlkZGVuIGlz
IHVzZWQsIGFzc3VtZSB0aGUgY29kZSBoYXMgYmVlbiBhbm5vdGF0ZWQKKyAgICBjb3JyZXNwb25k
aW5nbHkgZm9yIHRoZSBzeW1ib2xzIG5lZWRlZC4gICovCisgI2lmIGRlZmluZWQoX19HTlVDX18p
ICZhbXA7JmFtcDsgKCgoX19HTlVDX18gPT0gMykgJmFtcDsmYW1wOyAoX19HTlVDX01JTk9SX18g
Jmd0Oz0gMykpIHx8IChfX0dOVUNfXyAmZ3Q7IDMpKQorLXZvaWQgZm5vcmQgKCkgX19hdHRyaWJ1
dGVfXygodmlzaWJpbGl0eSgiZGVmYXVsdCIpKSk7CisraW50IGZub3JkICgpIF9fYXR0cmlidXRl
X18oKHZpc2liaWxpdHkoImRlZmF1bHQiKSkpOworICNlbmRpZgorIAorLXZvaWQgZm5vcmQgKCkg
eyBpbnQgaT00MjsgfQorK2ludCBmbm9yZCAoKSB7IHJldHVybiA0MjsgfQorIGludCBtYWluICgp
CisgeworICAgdm9pZCAqc2VsZiA9IGRsb3BlbiAoMCwgTFRfRExHTE9CQUx8TFRfRExMQVpZX09S
X05PVyk7CitAQCAtMTIyNjcsMTMgKzEyOTIyLDIwIEBAIGV4ZWV4dD0nYCRFQ0hPICIkZXhlZXh0
IiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyBsdF91bnNldD0nYCRFQ0hP
ICIkbHRfdW5zZXQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworIGx0X1NQ
Mk5MPSdgJEVDSE8gIiRsdF9TUDJOTCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0
ImAnCisgbHRfTkwyU1A9J2AkRUNITyAiJGx0X05MMlNQIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVf
cXVvdGVfc3Vic3QiYCcKKytsdF9jdl90b19ob3N0X2ZpbGVfY21kPSdgJEVDSE8gIiRsdF9jdl90
b19ob3N0X2ZpbGVfY21kIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyts
dF9jdl90b190b29sX2ZpbGVfY21kPSdgJEVDSE8gIiRsdF9jdl90b190b29sX2ZpbGVfY21kIiB8
ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyByZWxvYWRfZmxhZz0nYCRFQ0hP
ICIkcmVsb2FkX2ZsYWciIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworIHJl
bG9hZF9jbWRzPSdgJEVDSE8gIiRyZWxvYWRfY21kcyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1
b3RlX3N1YnN0ImAnCisgT0JKRFVNUD0nYCRFQ0hPICIkT0JKRFVNUCIgfCAkU0VEICIkZGVsYXlf
c2luZ2xlX3F1b3RlX3N1YnN0ImAnCisgZGVwbGlic19jaGVja19tZXRob2Q9J2AkRUNITyAiJGRl
cGxpYnNfY2hlY2tfbWV0aG9kIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcK
KyBmaWxlX21hZ2ljX2NtZD0nYCRFQ0hPICIkZmlsZV9tYWdpY19jbWQiIHwgJFNFRCAiJGRlbGF5
X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworK2ZpbGVfbWFnaWNfZ2xvYj0nYCRFQ0hPICIkZmlsZV9t
YWdpY19nbG9iIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyt3YW50X25v
Y2FzZWdsb2I9J2AkRUNITyAiJHdhbnRfbm9jYXNlZ2xvYiIgfCAkU0VEICIkZGVsYXlfc2luZ2xl
X3F1b3RlX3N1YnN0ImAnCisrRExMVE9PTD0nYCRFQ0hPICIkRExMVE9PTCIgfCAkU0VEICIkZGVs
YXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCisrc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQ9J2Ak
RUNITyAiJHNoYXJlZGxpYl9mcm9tX2xpbmtsaWJfY21kIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVf
cXVvdGVfc3Vic3QiYCcKKyBBUj0nYCRFQ0hPICIkQVIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9x
dW90ZV9zdWJzdCJgJworIEFSX0ZMQUdTPSdgJEVDSE8gIiRBUl9GTEFHUyIgfCAkU0VEICIkZGVs
YXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCisrYXJjaGl2ZXJfbGlzdF9zcGVjPSdgJEVDSE8gIiRh
cmNoaXZlcl9saXN0X3NwZWMiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwor
IFNUUklQPSdgJEVDSE8gIiRTVFJJUCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0
ImAnCisgUkFOTElCPSdgJEVDSE8gIiRSQU5MSUIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdCJgJworIG9sZF9wb3N0aW5zdGFsbF9jbWRzPSdgJEVDSE8gIiRvbGRfcG9zdGluc3Rh
bGxfY21kcyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCitAQCAtMTIyODgs
MTQgKzEyOTUwLDE3IEBAIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGU9J2AkRUNITyAiJGx0
X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGUiIHwgJFNFRCAiJGRlCisgbHRfY3Zfc3lzX2dsb2Jh
bF9zeW1ib2xfdG9fY2RlY2w9J2AkRUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2Nk
ZWNsIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyBsdF9jdl9zeXNfZ2xv
YmFsX3N5bWJvbF90b19jX25hbWVfYWRkcmVzcz0nYCRFQ0hPICIkbHRfY3Zfc3lzX2dsb2JhbF9z
eW1ib2xfdG9fY19uYW1lX2FkZHJlc3MiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJz
dCJgJworIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVm
aXg9J2AkRUNITyAiJGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xp
Yl9wcmVmaXgiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworK25tX2ZpbGVf
bGlzdF9zcGVjPSdgJEVDSE8gIiRubV9maWxlX2xpc3Rfc3BlYyIgfCAkU0VEICIkZGVsYXlfc2lu
Z2xlX3F1b3RlX3N1YnN0ImAnCisrbHRfc3lzcm9vdD0nYCRFQ0hPICIkbHRfc3lzcm9vdCIgfCAk
U0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCisgb2JqZGlyPSdgJEVDSE8gIiRvYmpk
aXIiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworIE1BR0lDX0NNRD0nYCRF
Q0hPICIkTUFHSUNfQ01EIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyBs
dF9wcm9nX2NvbXBpbGVyX25vX2J1aWx0aW5fZmxhZz0nYCRFQ0hPICIkbHRfcHJvZ19jb21waWxl
cl9ub19idWlsdGluX2ZsYWciIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwor
LWx0X3Byb2dfY29tcGlsZXJfd2w9J2AkRUNITyAiJGx0X3Byb2dfY29tcGlsZXJfd2wiIHwgJFNF
RCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworIGx0X3Byb2dfY29tcGlsZXJfcGljPSdg
JEVDSE8gIiRsdF9wcm9nX2NvbXBpbGVyX3BpYyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3Rl
X3N1YnN0ImAnCisrbHRfcHJvZ19jb21waWxlcl93bD0nYCRFQ0hPICIkbHRfcHJvZ19jb21waWxl
cl93bCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCisgbHRfcHJvZ19jb21w
aWxlcl9zdGF0aWM9J2AkRUNITyAiJGx0X3Byb2dfY29tcGlsZXJfc3RhdGljIiB8ICRTRUQgIiRk
ZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyBsdF9jdl9wcm9nX2NvbXBpbGVyX2Nfbz0nYCRF
Q0hPICIkbHRfY3ZfcHJvZ19jb21waWxlcl9jX28iIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdCJgJworIG5lZWRfbG9ja3M9J2AkRUNITyAiJG5lZWRfbG9ja3MiIHwgJFNFRCAiJGRl
bGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworK01BTklGRVNUX1RPT0w9J2AkRUNITyAiJE1BTklG
RVNUX1RPT0wiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworIERTWU1VVElM
PSdgJEVDSE8gIiREU1lNVVRJTCIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAn
CisgTk1FRElUPSdgJEVDSE8gIiROTUVESVQiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9z
dWJzdCJgJworIExJUE89J2AkRUNITyAiJExJUE8iIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90
ZV9zdWJzdCJgJworQEAgLTEyMzI4LDEyICsxMjk5MywxMiBAQCBoYXJkY29kZV9zaGxpYnBhdGhf
dmFyPSdgJEVDSE8gIiRoYXJkY29kZV9zaGxpYnBhdGhfdmFyIiB8ICRTRUQgIiRkZWxheV9zaW5n
bGVfcQorIGhhcmRjb2RlX2F1dG9tYXRpYz0nYCRFQ0hPICIkaGFyZGNvZGVfYXV0b21hdGljIiB8
ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyBpbmhlcml0X3JwYXRoPSdgJEVD
SE8gIiRpbmhlcml0X3JwYXRoIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcK
KyBsaW5rX2FsbF9kZXBsaWJzPSdgJEVDSE8gIiRsaW5rX2FsbF9kZXBsaWJzIiB8ICRTRUQgIiRk
ZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKy1maXhfc3JjZmlsZV9wYXRoPSdgJEVDSE8gIiRm
aXhfc3JjZmlsZV9wYXRoIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKKyBh
bHdheXNfZXhwb3J0X3N5bWJvbHM9J2AkRUNITyAiJGFsd2F5c19leHBvcnRfc3ltYm9scyIgfCAk
U0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCisgZXhwb3J0X3N5bWJvbHNfY21kcz0n
YCRFQ0hPICIkZXhwb3J0X3N5bWJvbHNfY21kcyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3Rl
X3N1YnN0ImAnCisgZXhjbHVkZV9leHBzeW1zPSdgJEVDSE8gIiRleGNsdWRlX2V4cHN5bXMiIHwg
JFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJworIGluY2x1ZGVfZXhwc3ltcz0nYCRF
Q0hPICIkaW5jbHVkZV9leHBzeW1zIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVfc3Vic3Qi
YCcKKyBwcmVsaW5rX2NtZHM9J2AkRUNITyAiJHByZWxpbmtfY21kcyIgfCAkU0VEICIkZGVsYXlf
c2luZ2xlX3F1b3RlX3N1YnN0ImAnCisrcG9zdGxpbmtfY21kcz0nYCRFQ0hPICIkcG9zdGxpbmtf
Y21kcyIgfCAkU0VEICIkZGVsYXlfc2luZ2xlX3F1b3RlX3N1YnN0ImAnCisgZmlsZV9saXN0X3Nw
ZWM9J2AkRUNITyAiJGZpbGVfbGlzdF9zcGVjIiB8ICRTRUQgIiRkZWxheV9zaW5nbGVfcXVvdGVf
c3Vic3QiYCcKKyB2YXJpYWJsZXNfc2F2ZWRfZm9yX3JlbGluaz0nYCRFQ0hPICIkdmFyaWFibGVz
X3NhdmVkX2Zvcl9yZWxpbmsiIHwgJFNFRCAiJGRlbGF5X3NpbmdsZV9xdW90ZV9zdWJzdCJgJwor
IG5lZWRfbGliX3ByZWZpeD0nYCRFQ0hPICIkbmVlZF9saWJfcHJlZml4IiB8ICRTRUQgIiRkZWxh
eV9zaW5nbGVfcXVvdGVfc3Vic3QiYCcKK0BAIC0xMjM4OCw4ICsxMzA1MywxMyBAQCByZWxvYWRf
ZmxhZyBcCisgT0JKRFVNUCBcCisgZGVwbGlic19jaGVja19tZXRob2QgXAorIGZpbGVfbWFnaWNf
Y21kIFwKKytmaWxlX21hZ2ljX2dsb2IgXAorK3dhbnRfbm9jYXNlZ2xvYiBcCisrRExMVE9PTCBc
Cisrc2hhcmVkbGliX2Zyb21fbGlua2xpYl9jbWQgXAorIEFSIFwKKyBBUl9GTEFHUyBcCisrYXJj
aGl2ZXJfbGlzdF9zcGVjIFwKKyBTVFJJUCBcCisgUkFOTElCIFwKKyBDQyBcCitAQCAtMTIzOTks
MTIgKzEzMDY5LDE0IEBAIGx0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3BpcGUgXAorIGx0X2N2X3N5
c19nbG9iYWxfc3ltYm9sX3RvX2NkZWNsIFwKKyBsdF9jdl9zeXNfZ2xvYmFsX3N5bWJvbF90b19j
X25hbWVfYWRkcmVzcyBcCisgbHRfY3Zfc3lzX2dsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJl
c3NfbGliX3ByZWZpeCBcCisrbm1fZmlsZV9saXN0X3NwZWMgXAorIGx0X3Byb2dfY29tcGlsZXJf
bm9fYnVpbHRpbl9mbGFnIFwKKy1sdF9wcm9nX2NvbXBpbGVyX3dsIFwKKyBsdF9wcm9nX2NvbXBp
bGVyX3BpYyBcCisrbHRfcHJvZ19jb21waWxlcl93bCBcCisgbHRfcHJvZ19jb21waWxlcl9zdGF0
aWMgXAorIGx0X2N2X3Byb2dfY29tcGlsZXJfY19vIFwKKyBuZWVkX2xvY2tzIFwKKytNQU5JRkVT
VF9UT09MIFwKKyBEU1lNVVRJTCBcCisgTk1FRElUIFwKKyBMSVBPIFwKK0BAIC0xMjQyMCw3ICsx
MzA5Miw2IEBAIG5vX3VuZGVmaW5lZF9mbGFnIFwKKyBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVj
IFwKKyBoYXJkY29kZV9saWJkaXJfZmxhZ19zcGVjX2xkIFwKKyBoYXJkY29kZV9saWJkaXJfc2Vw
YXJhdG9yIFwKKy1maXhfc3JjZmlsZV9wYXRoIFwKKyBleGNsdWRlX2V4cHN5bXMgXAorIGluY2x1
ZGVfZXhwc3ltcyBcCisgZmlsZV9saXN0X3NwZWMgXAorQEAgLTEyNDU2LDYgKzEzMTI3LDcgQEAg
bW9kdWxlX2NtZHMgXAorIG1vZHVsZV9leHBzeW1fY21kcyBcCisgZXhwb3J0X3N5bWJvbHNfY21k
cyBcCisgcHJlbGlua19jbWRzIFwKKytwb3N0bGlua19jbWRzIFwKKyBwb3N0aW5zdGFsbF9jbWRz
IFwKKyBwb3N0dW5pbnN0YWxsX2NtZHMgXAorIGZpbmlzaF9jbWRzIFwKK0BAIC0xMzA1NCw3ICsx
MzcyNiw4IEBAICRhc19lY2hvIFgiJGZpbGUiIHwKKyAjIE5PVEU6IENoYW5nZXMgbWFkZSB0byB0
aGlzIGZpbGUgd2lsbCBiZSBsb3N0OiBsb29rIGF0IGx0bWFpbi5zaC4KKyAjCisgIyAgIENvcHly
aWdodCAoQykgMTk5NiwgMTk5NywgMTk5OCwgMTk5OSwgMjAwMCwgMjAwMSwgMjAwMywgMjAwNCwg
MjAwNSwKKy0jICAgICAgICAgICAgICAgICAyMDA2LCAyMDA3LCAyMDA4LCAyMDA5IEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbiwgSW5jLgorKyMgICAgICAgICAgICAgICAgIDIwMDYsIDIwMDcsIDIw
MDgsIDIwMDksIDIwMTAgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLAorKyMgICAgICAgICAgICAg
ICAgIEluYy4KKyAjICAgV3JpdHRlbiBieSBHb3Jkb24gTWF0emlna2VpdCwgMTk5NgorICMKKyAj
ICAgVGhpcyBmaWxlIGlzIHBhcnQgb2YgR05VIExpYnRvb2wuCitAQCAtMTMxNTcsMTkgKzEzODMw
LDQyIEBAIFNQMk5MPSRsdF9sdF9TUDJOTAorICMgdHVybiBuZXdsaW5lcyBpbnRvIHNwYWNlcy4K
KyBOTDJTUD0kbHRfbHRfTkwyU1AKKyAKKysjIGNvbnZlcnQgXCRidWlsZCBmaWxlIG5hbWVzIHRv
IFwkaG9zdCBmb3JtYXQuCisrdG9faG9zdF9maWxlX2NtZD0kbHRfY3ZfdG9faG9zdF9maWxlX2Nt
ZAorKworKyMgY29udmVydCBcJGJ1aWxkIGZpbGVzIHRvIHRvb2xjaGFpbiBmb3JtYXQuCisrdG9f
dG9vbF9maWxlX2NtZD0kbHRfY3ZfdG9fdG9vbF9maWxlX2NtZAorKworICMgQW4gb2JqZWN0IHN5
bWJvbCBkdW1wZXIuCisgT0JKRFVNUD0kbHRfT0JKRFVNUAorIAorICMgTWV0aG9kIHRvIGNoZWNr
IHdoZXRoZXIgZGVwZW5kZW50IGxpYnJhcmllcyBhcmUgc2hhcmVkIG9iamVjdHMuCisgZGVwbGli
c19jaGVja19tZXRob2Q9JGx0X2RlcGxpYnNfY2hlY2tfbWV0aG9kCisgCistIyBDb21tYW5kIHRv
IHVzZSB3aGVuIGRlcGxpYnNfY2hlY2tfbWV0aG9kID09ICJmaWxlX21hZ2ljIi4KKysjIENvbW1h
bmQgdG8gdXNlIHdoZW4gZGVwbGlic19jaGVja19tZXRob2QgPSAiZmlsZV9tYWdpYyIuCisgZmls
ZV9tYWdpY19jbWQ9JGx0X2ZpbGVfbWFnaWNfY21kCisgCisrIyBIb3cgdG8gZmluZCBwb3RlbnRp
YWwgZmlsZXMgd2hlbiBkZXBsaWJzX2NoZWNrX21ldGhvZCA9ICJmaWxlX21hZ2ljIi4KKytmaWxl
X21hZ2ljX2dsb2I9JGx0X2ZpbGVfbWFnaWNfZ2xvYgorKworKyMgRmluZCBwb3RlbnRpYWwgZmls
ZXMgdXNpbmcgbm9jYXNlZ2xvYiB3aGVuIGRlcGxpYnNfY2hlY2tfbWV0aG9kID0gImZpbGVfbWFn
aWMiLgorK3dhbnRfbm9jYXNlZ2xvYj0kbHRfd2FudF9ub2Nhc2VnbG9iCisrCisrIyBETEwgY3Jl
YXRpb24gcHJvZ3JhbS4KKytETExUT09MPSRsdF9ETExUT09MCisrCisrIyBDb21tYW5kIHRvIGFz
c29jaWF0ZSBzaGFyZWQgYW5kIGxpbmsgbGlicmFyaWVzLgorK3NoYXJlZGxpYl9mcm9tX2xpbmts
aWJfY21kPSRsdF9zaGFyZWRsaWJfZnJvbV9saW5rbGliX2NtZAorKworICMgVGhlIGFyY2hpdmVy
LgorIEFSPSRsdF9BUgorKworKyMgRmxhZ3MgdG8gY3JlYXRlIGFuIGFyY2hpdmUuCisgQVJfRkxB
R1M9JGx0X0FSX0ZMQUdTCisgCisrIyBIb3cgdG8gZmVlZCBhIGZpbGUgbGlzdGluZyB0byB0aGUg
YXJjaGl2ZXIuCisrYXJjaGl2ZXJfbGlzdF9zcGVjPSRsdF9hcmNoaXZlcl9saXN0X3NwZWMKKysK
KyAjIEEgc3ltYm9sIHN0cmlwcGluZyBwcm9ncmFtLgorIFNUUklQPSRsdF9TVFJJUAorIAorQEAg
LTEzMTk5LDYgKzEzODk1LDEyIEBAIGdsb2JhbF9zeW1ib2xfdG9fY19uYW1lX2FkZHJlc3M9JGx0
X2x0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzCisgIyBUcmFuc2Zvcm0g
dGhlIG91dHB1dCBvZiBubSBpbiBhIEMgbmFtZSBhZGRyZXNzIHBhaXIgd2hlbiBsaWIgcHJlZml4
IGlzIG5lZWRlZC4KKyBnbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXg9
JGx0X2x0X2N2X3N5c19nbG9iYWxfc3ltYm9sX3RvX2NfbmFtZV9hZGRyZXNzX2xpYl9wcmVmaXgK
KyAKKysjIFNwZWNpZnkgZmlsZW5hbWUgY29udGFpbmluZyBpbnB1dCBmaWxlcyBmb3IgXCROTS4K
KytubV9maWxlX2xpc3Rfc3BlYz0kbHRfbm1fZmlsZV9saXN0X3NwZWMKKysKKysjIFRoZSByb290
IHdoZXJlIHRvIHNlYXJjaCBmb3IgZGVwZW5kZW50IGxpYnJhcmllcyxhbmQgaW4gd2hpY2ggb3Vy
IGxpYnJhcmllcyBzaG91bGQgYmUgaW5zdGFsbGVkLgorK2x0X3N5c3Jvb3Q9JGx0X3N5c3Jvb3QK
KysKKyAjIFRoZSBuYW1lIG9mIHRoZSBkaXJlY3RvcnkgdGhhdCBjb250YWlucyB0ZW1wb3Jhcnkg
bGlidG9vbCBmaWxlcy4KKyBvYmpkaXI9JG9iamRpcgorIAorQEAgLTEzMjA4LDYgKzEzOTEwLDkg
QEAgTUFHSUNfQ01EPSRNQUdJQ19DTUQKKyAjIE11c3Qgd2UgbG9jayBmaWxlcyB3aGVuIGRvaW5n
IGNvbXBpbGF0aW9uPworIG5lZWRfbG9ja3M9JGx0X25lZWRfbG9ja3MKKyAKKysjIE1hbmlmZXN0
IHRvb2wuCisrTUFOSUZFU1RfVE9PTD0kbHRfTUFOSUZFU1RfVE9PTAorKworICMgVG9vbCB0byBt
YW5pcHVsYXRlIGFyY2hpdmVkIERXQVJGIGRlYnVnIHN5bWJvbCBmaWxlcyBvbiBNYWMgT1MgWC4K
KyBEU1lNVVRJTD0kbHRfRFNZTVVUSUwKKyAKK0BAIC0xMzMyMiwxMiArMTQwMjcsMTIgQEAgd2l0
aF9nY2M9JEdDQworICMgQ29tcGlsZXIgZmxhZyB0byB0dXJuIG9mZiBidWlsdGluIGZ1bmN0aW9u
cy4KKyBub19idWlsdGluX2ZsYWc9JGx0X2x0X3Byb2dfY29tcGlsZXJfbm9fYnVpbHRpbl9mbGFn
CisgCistIyBIb3cgdG8gcGFzcyBhIGxpbmtlciBmbGFnIHRocm91Z2ggdGhlIGNvbXBpbGVyLgor
LXdsPSRsdF9sdF9wcm9nX2NvbXBpbGVyX3dsCistCisgIyBBZGRpdGlvbmFsIGNvbXBpbGVyIGZs
YWdzIGZvciBidWlsZGluZyBsaWJyYXJ5IG9iamVjdHMuCisgcGljX2ZsYWc9JGx0X2x0X3Byb2df
Y29tcGlsZXJfcGljCisgCisrIyBIb3cgdG8gcGFzcyBhIGxpbmtlciBmbGFnIHRocm91Z2ggdGhl
IGNvbXBpbGVyLgorK3dsPSRsdF9sdF9wcm9nX2NvbXBpbGVyX3dsCisrCisgIyBDb21waWxlciBm
bGFnIHRvIHByZXZlbnQgZHluYW1pYyBsaW5raW5nLgorIGxpbmtfc3RhdGljX2ZsYWc9JGx0X2x0
X3Byb2dfY29tcGlsZXJfc3RhdGljCisgCitAQCAtMTM0MTQsOSArMTQxMTksNiBAQCBpbmhlcml0
X3JwYXRoPSRpbmhlcml0X3JwYXRoCisgIyBXaGV0aGVyIGxpYnRvb2wgbXVzdCBsaW5rIGEgcHJv
Z3JhbSBhZ2FpbnN0IGFsbCBpdHMgZGVwZW5kZW5jeSBsaWJyYXJpZXMuCisgbGlua19hbGxfZGVw
bGlicz0kbGlua19hbGxfZGVwbGlicworIAorLSMgRml4IHRoZSBzaGVsbCB2YXJpYWJsZSBcJHNy
Y2ZpbGUgZm9yIHRoZSBjb21waWxlci4KKy1maXhfc3JjZmlsZV9wYXRoPSRsdF9maXhfc3JjZmls
ZV9wYXRoCistCisgIyBTZXQgdG8gInllcyIgaWYgZXhwb3J0ZWQgc3ltYm9scyBhcmUgcmVxdWly
ZWQuCisgYWx3YXlzX2V4cG9ydF9zeW1ib2xzPSRhbHdheXNfZXhwb3J0X3N5bWJvbHMKKyAKK0BA
IC0xMzQzMiw2ICsxNDEzNCw5IEBAIGluY2x1ZGVfZXhwc3ltcz0kbHRfaW5jbHVkZV9leHBzeW1z
CisgIyBDb21tYW5kcyBuZWNlc3NhcnkgZm9yIGxpbmtpbmcgcHJvZ3JhbXMgKGFnYWluc3QgbGli
cmFyaWVzKSB3aXRoIHRlbXBsYXRlcy4KKyBwcmVsaW5rX2NtZHM9JGx0X3ByZWxpbmtfY21kcwor
IAorKyMgQ29tbWFuZHMgbmVjZXNzYXJ5IGZvciBmaW5pc2hpbmcgbGlua2luZyBwcm9ncmFtcy4K
Kytwb3N0bGlua19jbWRzPSRsdF9wb3N0bGlua19jbWRzCisrCisgIyBTcGVjaWZ5IGZpbGVuYW1l
IGNvbnRhaW5pbmcgaW5wdXQgZmlsZXMuCisgZmlsZV9saXN0X3NwZWM9JGx0X2ZpbGVfbGlzdF9z
cGVjCisgCitAQCAtMTM0NjQsMjEwICsxNDE2OSwxNjkgQEAgbHRtYWluPSIkYWNfYXV4X2Rpci9s
dG1haW4uc2giCisgICAjIGlmIGZpbmRzIG1peGVkIENSL0xGIGFuZCBMRi1vbmx5IGxpbmVzLiAg
U2luY2Ugc2VkIG9wZXJhdGVzIGluCisgICAjIHRleHQgbW9kZSwgaXQgcHJvcGVybHkgY29udmVy
dHMgbGluZXMgdG8gQ1IvTEYuICBUaGlzIGJhc2ggcHJvYmxlbQorICAgIyBpcyByZXBvcnRlZGx5
IGZpeGVkLCBidXQgd2h5IG5vdCBydW4gb24gb2xkIHZlcnNpb25zIHRvbz8KKy0gIHNlZCAnL14j
IEdlbmVyYXRlZCBzaGVsbCBmdW5jdGlvbnMgaW5zZXJ0ZWQgaGVyZS9xJyAiJGx0bWFpbiIgJmd0
OyZndDsgIiRjZmdmaWxlIiBcCistICAgIHx8IChybSAtZiAiJGNmZ2ZpbGUiOyBleGl0IDEpCist
CistICBjYXNlICR4c2lfc2hlbGwgaW4KKy0gIHllcykKKy0gICAgY2F0ICZsdDsmbHQ7IFxfTFRf
RU9GICZndDsmZ3Q7ICIkY2ZnZmlsZSIKKy0KKy0jIGZ1bmNfZGlybmFtZSBmaWxlIGFwcGVuZCBu
b25kaXJfcmVwbGFjZW1lbnQKKy0jIENvbXB1dGUgdGhlIGRpcm5hbWUgb2YgRklMRS4gIElmIG5v
bmVtcHR5LCBhZGQgQVBQRU5EIHRvIHRoZSByZXN1bHQsCistIyBvdGhlcndpc2Ugc2V0IHJlc3Vs
dCB0byBOT05ESVJfUkVQTEFDRU1FTlQuCistZnVuY19kaXJuYW1lICgpCisteworLSAgY2FzZSAk
ezF9IGluCistICAgICovKikgZnVuY19kaXJuYW1lX3Jlc3VsdD0iJHsxJS8qfSR7Mn0iIDs7Cist
ICAgICogICkgZnVuY19kaXJuYW1lX3Jlc3VsdD0iJHszfSIgOzsKKy0gIGVzYWMKKy19CistCist
IyBmdW5jX2Jhc2VuYW1lIGZpbGUKKy1mdW5jX2Jhc2VuYW1lICgpCisteworLSAgZnVuY19iYXNl
bmFtZV9yZXN1bHQ9IiR7MSMjKi99IgorLX0KKy0KKy0jIGZ1bmNfZGlybmFtZV9hbmRfYmFzZW5h
bWUgZmlsZSBhcHBlbmQgbm9uZGlyX3JlcGxhY2VtZW50CistIyBwZXJmb3JtIGZ1bmNfYmFzZW5h
bWUgYW5kIGZ1bmNfZGlybmFtZSBpbiBhIHNpbmdsZSBmdW5jdGlvbgorLSMgY2FsbDoKKy0jICAg
ZGlybmFtZTogIENvbXB1dGUgdGhlIGRpcm5hbWUgb2YgRklMRS4gIElmIG5vbmVtcHR5LAorLSMg
ICAgICAgICAgICAgYWRkIEFQUEVORCB0byB0aGUgcmVzdWx0LCBvdGhlcndpc2Ugc2V0IHJlc3Vs
dAorLSMgICAgICAgICAgICAgdG8gTk9ORElSX1JFUExBQ0VNRU5ULgorLSMgICAgICAgICAgICAg
dmFsdWUgcmV0dXJuZWQgaW4gIiRmdW5jX2Rpcm5hbWVfcmVzdWx0IgorLSMgICBiYXNlbmFtZTog
Q29tcHV0ZSBmaWxlbmFtZSBvZiBGSUxFLgorLSMgICAgICAgICAgICAgdmFsdWUgcmV0dW5lZCBp
biAiJGZ1bmNfYmFzZW5hbWVfcmVzdWx0IgorLSMgSW1wbGVtZW50YXRpb24gbXVzdCBiZSBrZXB0
IHN5bmNocm9uaXplZCB3aXRoIGZ1bmNfZGlybmFtZQorLSMgYW5kIGZ1bmNfYmFzZW5hbWUuIEZv
ciBlZmZpY2llbmN5LCB3ZSBkbyBub3QgZGVsZWdhdGUgdG8KKy0jIHRob3NlIGZ1bmN0aW9ucyBi
dXQgaW5zdGVhZCBkdXBsaWNhdGUgdGhlIGZ1bmN0aW9uYWxpdHkgaGVyZS4KKy1mdW5jX2Rpcm5h
bWVfYW5kX2Jhc2VuYW1lICgpCisteworLSAgY2FzZSAkezF9IGluCistICAgICovKikgZnVuY19k
aXJuYW1lX3Jlc3VsdD0iJHsxJS8qfSR7Mn0iIDs7CistICAgICogICkgZnVuY19kaXJuYW1lX3Jl
c3VsdD0iJHszfSIgOzsKKy0gIGVzYWMKKy0gIGZ1bmNfYmFzZW5hbWVfcmVzdWx0PSIkezEjIyov
fSIKKy19CistCistIyBmdW5jX3N0cmlwbmFtZSBwcmVmaXggc3VmZml4IG5hbWUKKy0jIHN0cmlw
IFBSRUZJWCBhbmQgU1VGRklYIG9mZiBvZiBOQU1FLgorLSMgUFJFRklYIGFuZCBTVUZGSVggbXVz
dCBub3QgY29udGFpbiBnbG9iYmluZyBvciByZWdleCBzcGVjaWFsCistIyBjaGFyYWN0ZXJzLCBo
YXNoZXMsIHBlcmNlbnQgc2lnbnMsIGJ1dCBTVUZGSVggbWF5IGNvbnRhaW4gYSBsZWFkaW5nCist
IyBkb3QgKGluIHdoaWNoIGNhc2UgdGhhdCBtYXRjaGVzIG9ubHkgYSBkb3QpLgorLWZ1bmNfc3Ry
aXBuYW1lICgpCisteworLSAgIyBwZGtzaCA1LjIuMTQgZG9lcyBub3QgZG8gJHtYJSRZfSBjb3Jy
ZWN0bHkgaWYgYm90aCBYIGFuZCBZIGFyZQorLSAgIyBwb3NpdGlvbmFsIHBhcmFtZXRlcnMsIHNv
IGFzc2lnbiBvbmUgdG8gb3JkaW5hcnkgcGFyYW1ldGVyIGZpcnN0LgorLSAgZnVuY19zdHJpcG5h
bWVfcmVzdWx0PSR7M30KKy0gIGZ1bmNfc3RyaXBuYW1lX3Jlc3VsdD0ke2Z1bmNfc3RyaXBuYW1l
X3Jlc3VsdCMiJHsxfSJ9CistICBmdW5jX3N0cmlwbmFtZV9yZXN1bHQ9JHtmdW5jX3N0cmlwbmFt
ZV9yZXN1bHQlIiR7Mn0ifQorLX0KKy0KKy0jIGZ1bmNfb3B0X3NwbGl0CistZnVuY19vcHRfc3Bs
aXQgKCkKKy17CistICBmdW5jX29wdF9zcGxpdF9vcHQ9JHsxJSU9Kn0KKy0gIGZ1bmNfb3B0X3Nw
bGl0X2FyZz0kezEjKj19CistfQorLQorLSMgZnVuY19sbzJvIG9iamVjdAorLWZ1bmNfbG8ybyAo
KQorLXsKKy0gIGNhc2UgJHsxfSBpbgorLSAgICAqLmxvKSBmdW5jX2xvMm9fcmVzdWx0PSR7MSUu
bG99LiR7b2JqZXh0fSA7OworLSAgICAqKSAgICBmdW5jX2xvMm9fcmVzdWx0PSR7MX0gOzsKKy0g
IGVzYWMKKy19CistCistIyBmdW5jX3hmb3JtIGxpYm9iai1vci1zb3VyY2UKKy1mdW5jX3hmb3Jt
ICgpCisteworLSAgZnVuY194Zm9ybV9yZXN1bHQ9JHsxJS4qfS5sbworLX0KKy0KKy0jIGZ1bmNf
YXJpdGggYXJpdGhtZXRpYy10ZXJtLi4uCistZnVuY19hcml0aCAoKQorLXsKKy0gIGZ1bmNfYXJp
dGhfcmVzdWx0PSQoKCAkKiApKQorLX0KKy0KKy0jIGZ1bmNfbGVuIHN0cmluZworLSMgU1RSSU5H
IG1heSBub3Qgc3RhcnQgd2l0aCBhIGh5cGhlbi4KKy1mdW5jX2xlbiAoKQorLXsKKy0gIGZ1bmNf
bGVuX3Jlc3VsdD0keyMxfQorLX0KKy0KKy1fTFRfRU9GCistICAgIDs7CistICAqKSAjIEJvdXJu
ZSBjb21wYXRpYmxlIGZ1bmN0aW9ucy4KKy0gICAgY2F0ICZsdDsmbHQ7IFxfTFRfRU9GICZndDsm
Z3Q7ICIkY2ZnZmlsZSIKKy0KKy0jIGZ1bmNfZGlybmFtZSBmaWxlIGFwcGVuZCBub25kaXJfcmVw
bGFjZW1lbnQKKy0jIENvbXB1dGUgdGhlIGRpcm5hbWUgb2YgRklMRS4gIElmIG5vbmVtcHR5LCBh
ZGQgQVBQRU5EIHRvIHRoZSByZXN1bHQsCistIyBvdGhlcndpc2Ugc2V0IHJlc3VsdCB0byBOT05E
SVJfUkVQTEFDRU1FTlQuCistZnVuY19kaXJuYW1lICgpCisteworLSAgIyBFeHRyYWN0IHN1YmRp
cmVjdG9yeSBmcm9tIHRoZSBhcmd1bWVudC4KKy0gIGZ1bmNfZGlybmFtZV9yZXN1bHQ9YCRFQ0hP
ICIkezF9IiB8ICRTRUQgIiRkaXJuYW1lImAKKy0gIGlmIHRlc3QgIlgkZnVuY19kaXJuYW1lX3Jl
c3VsdCIgPSAiWCR7MX0iOyB0aGVuCistICAgIGZ1bmNfZGlybmFtZV9yZXN1bHQ9IiR7M30iCist
ICBlbHNlCistICAgIGZ1bmNfZGlybmFtZV9yZXN1bHQ9IiRmdW5jX2Rpcm5hbWVfcmVzdWx0JHsy
fSIKKy0gIGZpCistfQorLQorLSMgZnVuY19iYXNlbmFtZSBmaWxlCistZnVuY19iYXNlbmFtZSAo
KQorLXsKKy0gIGZ1bmNfYmFzZW5hbWVfcmVzdWx0PWAkRUNITyAiJHsxfSIgfCAkU0VEICIkYmFz
ZW5hbWUiYAorLX0KKy0KKy0KKy0jIGZ1bmNfc3RyaXBuYW1lIHByZWZpeCBzdWZmaXggbmFtZQor
LSMgc3RyaXAgUFJFRklYIGFuZCBTVUZGSVggb2ZmIG9mIE5BTUUuCistIyBQUkVGSVggYW5kIFNV
RkZJWCBtdXN0IG5vdCBjb250YWluIGdsb2JiaW5nIG9yIHJlZ2V4IHNwZWNpYWwKKy0jIGNoYXJh
Y3RlcnMsIGhhc2hlcywgcGVyY2VudCBzaWducywgYnV0IFNVRkZJWCBtYXkgY29udGFpbiBhIGxl
YWRpbmcKKy0jIGRvdCAoaW4gd2hpY2ggY2FzZSB0aGF0IG1hdGNoZXMgb25seSBhIGRvdCkuCist
IyBmdW5jX3N0cmlwX3N1ZmZpeCBwcmVmaXggbmFtZQorLWZ1bmNfc3RyaXBuYW1lICgpCistewor
LSAgY2FzZSAkezJ9IGluCistICAgIC4qKSBmdW5jX3N0cmlwbmFtZV9yZXN1bHQ9YCRFQ0hPICIk
ezN9IiB8ICRTRUQgInMlXiR7MX0lJTsgcyVcXFxcJHsyfVwkJSUiYDs7CistICAgICopICBmdW5j
X3N0cmlwbmFtZV9yZXN1bHQ9YCRFQ0hPICIkezN9IiB8ICRTRUQgInMlXiR7MX0lJTsgcyUkezJ9
XCQlJSJgOzsKKy0gIGVzYWMKKy19CistCistIyBzZWQgc2NyaXB0czoKKy1teV9zZWRfbG9uZ19v
cHQ9JzFzL15cKC1bXj1dKlwpPS4qL1wxLztxJworLW15X3NlZF9sb25nX2FyZz0nMXMvXi1bXj1d
Kj0vLycKKy0KKy0jIGZ1bmNfb3B0X3NwbGl0CistZnVuY19vcHRfc3BsaXQgKCkKKy17CistICBm
dW5jX29wdF9zcGxpdF9vcHQ9YCRFQ0hPICIkezF9IiB8ICRTRUQgIiRteV9zZWRfbG9uZ19vcHQi
YAorLSAgZnVuY19vcHRfc3BsaXRfYXJnPWAkRUNITyAiJHsxfSIgfCAkU0VEICIkbXlfc2VkX2xv
bmdfYXJnImAKKy19CistCistIyBmdW5jX2xvMm8gb2JqZWN0CistZnVuY19sbzJvICgpCistewor
LSAgZnVuY19sbzJvX3Jlc3VsdD1gJEVDSE8gIiR7MX0iIHwgJFNFRCAiJGxvMm8iYAorLX0KKy0K
Ky0jIGZ1bmNfeGZvcm0gbGlib2JqLW9yLXNvdXJjZQorLWZ1bmNfeGZvcm0gKCkKKy17CistICBm
dW5jX3hmb3JtX3Jlc3VsdD1gJEVDSE8gIiR7MX0iIHwgJFNFRCAncy9cLlteLl0qJC8ubG8vJ2AK
Ky19CistCistIyBmdW5jX2FyaXRoIGFyaXRobWV0aWMtdGVybS4uLgorLWZ1bmNfYXJpdGggKCkK
Ky17CistICBmdW5jX2FyaXRoX3Jlc3VsdD1gZXhwciAiJEAiYAorLX0KKy0KKy0jIGZ1bmNfbGVu
IHN0cmluZworLSMgU1RSSU5HIG1heSBub3Qgc3RhcnQgd2l0aCBhIGh5cGhlbi4KKy1mdW5jX2xl
biAoKQorLXsKKy0gIGZ1bmNfbGVuX3Jlc3VsdD1gZXhwciAiJDEiIDogIi4qIiAyJmd0Oy9kZXYv
bnVsbCB8fCBlY2hvICRtYXhfY21kX2xlbmAKKy19CistCistX0xUX0VPRgorLWVzYWMKKy0KKy1j
YXNlICRsdF9zaGVsbF9hcHBlbmQgaW4KKy0gIHllcykKKy0gICAgY2F0ICZsdDsmbHQ7IFxfTFRf
RU9GICZndDsmZ3Q7ICIkY2ZnZmlsZSIKKy0KKy0jIGZ1bmNfYXBwZW5kIHZhciB2YWx1ZQorLSMg
QXBwZW5kIFZBTFVFIHRvIHRoZSBlbmQgb2Ygc2hlbGwgdmFyaWFibGUgVkFSLgorLWZ1bmNfYXBw
ZW5kICgpCisteworLSAgZXZhbCAiJDErPVwkMiIKKy19CistX0xUX0VPRgorLSAgICA7OworLSAg
KikKKy0gICAgY2F0ICZsdDsmbHQ7IFxfTFRfRU9GICZndDsmZ3Q7ICIkY2ZnZmlsZSIKKy0KKy0j
IGZ1bmNfYXBwZW5kIHZhciB2YWx1ZQorLSMgQXBwZW5kIFZBTFVFIHRvIHRoZSBlbmQgb2Ygc2hl
bGwgdmFyaWFibGUgVkFSLgorLWZ1bmNfYXBwZW5kICgpCisteworLSAgZXZhbCAiJDE9XCQkMVwk
MiIKKy19CistCistX0xUX0VPRgorLSAgICA7OworLSAgZXNhYworLQorLQorLSAgc2VkIC1uICcv
XiMgR2VuZXJhdGVkIHNoZWxsIGZ1bmN0aW9ucyBpbnNlcnRlZCBoZXJlLywkcCcgIiRsdG1haW4i
ICZndDsmZ3Q7ICIkY2ZnZmlsZSIgXAorLSAgICB8fCAocm0gLWYgIiRjZmdmaWxlIjsgZXhpdCAx
KQorLQorLSAgbXYgLWYgIiRjZmdmaWxlIiAiJG9maWxlIiB8fAorKyAgc2VkICckcScgIiRsdG1h
aW4iICZndDsmZ3Q7ICIkY2ZnZmlsZSIgXAorKyAgICAgfHwgKHJtIC1mICIkY2ZnZmlsZSI7IGV4
aXQgMSkKKysKKysgIGlmIHRlc3QgeCIkeHNpX3NoZWxsIiA9IHh5ZXM7IHRoZW4KKysgIHNlZCAt
ZSAnL15mdW5jX2Rpcm5hbWUgKCkkLywvXn0gIyBmdW5jX2Rpcm5hbWUgL2NcCisrZnVuY19kaXJu
YW1lICgpXAorK3tcCisrXCAgICBjYXNlICR7MX0gaW5cCisrXCAgICAgICovKikgZnVuY19kaXJu
YW1lX3Jlc3VsdD0iJHsxJS8qfSR7Mn0iIDs7XAorK1wgICAgICAqICApIGZ1bmNfZGlybmFtZV9y
ZXN1bHQ9IiR7M30iIDs7XAorK1wgICAgZXNhY1wKKyt9ICMgRXh0ZW5kZWQtc2hlbGwgZnVuY19k
aXJuYW1lIGltcGxlbWVudGF0aW9uJyAiJGNmZ2ZpbGUiICZndDsgJGNmZ2ZpbGUudG1wIFwKKysg
ICZhbXA7JmFtcDsgbXYgLWYgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiBcCisrICAgIHx8IChy
bSAtZiAiJGNmZ2ZpbGUiICZhbXA7JmFtcDsgY3AgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiAm
YW1wOyZhbXA7IHJtIC1mICIkY2ZnZmlsZS50bXAiKQorK3Rlc3QgMCAtZXEgJD8gfHwgX2x0X2Z1
bmN0aW9uX3JlcGxhY2VfZmFpbD06CisrCisrCisrICBzZWQgLWUgJy9eZnVuY19iYXNlbmFtZSAo
KSQvLC9efSAjIGZ1bmNfYmFzZW5hbWUgL2NcCisrZnVuY19iYXNlbmFtZSAoKVwKKyt7XAorK1wg
ICAgZnVuY19iYXNlbmFtZV9yZXN1bHQ9IiR7MSMjKi99IlwKKyt9ICMgRXh0ZW5kZWQtc2hlbGwg
ZnVuY19iYXNlbmFtZSBpbXBsZW1lbnRhdGlvbicgIiRjZmdmaWxlIiAmZ3Q7ICRjZmdmaWxlLnRt
cCBcCisrICAmYW1wOyZhbXA7IG12IC1mICIkY2ZnZmlsZS50bXAiICIkY2ZnZmlsZSIgXAorKyAg
ICB8fCAocm0gLWYgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IGNwICIkY2ZnZmlsZS50bXAiICIkY2Zn
ZmlsZSIgJmFtcDsmYW1wOyBybSAtZiAiJGNmZ2ZpbGUudG1wIikKKyt0ZXN0IDAgLWVxICQ/IHx8
IF9sdF9mdW5jdGlvbl9yZXBsYWNlX2ZhaWw9OgorKworKworKyAgc2VkIC1lICcvXmZ1bmNfZGly
bmFtZV9hbmRfYmFzZW5hbWUgKCkkLywvXn0gIyBmdW5jX2Rpcm5hbWVfYW5kX2Jhc2VuYW1lIC9j
XAorK2Z1bmNfZGlybmFtZV9hbmRfYmFzZW5hbWUgKClcCisre1wKKytcICAgIGNhc2UgJHsxfSBp
blwKKytcICAgICAgKi8qKSBmdW5jX2Rpcm5hbWVfcmVzdWx0PSIkezElLyp9JHsyfSIgOztcCisr
XCAgICAgICogICkgZnVuY19kaXJuYW1lX3Jlc3VsdD0iJHszfSIgOztcCisrXCAgICBlc2FjXAor
K1wgICAgZnVuY19iYXNlbmFtZV9yZXN1bHQ9IiR7MSMjKi99IlwKKyt9ICMgRXh0ZW5kZWQtc2hl
bGwgZnVuY19kaXJuYW1lX2FuZF9iYXNlbmFtZSBpbXBsZW1lbnRhdGlvbicgIiRjZmdmaWxlIiAm
Z3Q7ICRjZmdmaWxlLnRtcCBcCisrICAmYW1wOyZhbXA7IG12IC1mICIkY2ZnZmlsZS50bXAiICIk
Y2ZnZmlsZSIgXAorKyAgICB8fCAocm0gLWYgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IGNwICIkY2Zn
ZmlsZS50bXAiICIkY2ZnZmlsZSIgJmFtcDsmYW1wOyBybSAtZiAiJGNmZ2ZpbGUudG1wIikKKyt0
ZXN0IDAgLWVxICQ/IHx8IF9sdF9mdW5jdGlvbl9yZXBsYWNlX2ZhaWw9OgorKworKworKyAgc2Vk
IC1lICcvXmZ1bmNfc3RyaXBuYW1lICgpJC8sL159ICMgZnVuY19zdHJpcG5hbWUgL2NcCisrZnVu
Y19zdHJpcG5hbWUgKClcCisre1wKKytcICAgICMgcGRrc2ggNS4yLjE0IGRvZXMgbm90IGRvICR7
WCUkWX0gY29ycmVjdGx5IGlmIGJvdGggWCBhbmQgWSBhcmVcCisrXCAgICAjIHBvc2l0aW9uYWwg
cGFyYW1ldGVycywgc28gYXNzaWduIG9uZSB0byBvcmRpbmFyeSBwYXJhbWV0ZXIgZmlyc3QuXAor
K1wgICAgZnVuY19zdHJpcG5hbWVfcmVzdWx0PSR7M31cCisrXCAgICBmdW5jX3N0cmlwbmFtZV9y
ZXN1bHQ9JHtmdW5jX3N0cmlwbmFtZV9yZXN1bHQjIiR7MX0ifVwKKytcICAgIGZ1bmNfc3RyaXBu
YW1lX3Jlc3VsdD0ke2Z1bmNfc3RyaXBuYW1lX3Jlc3VsdCUiJHsyfSJ9XAorK30gIyBFeHRlbmRl
ZC1zaGVsbCBmdW5jX3N0cmlwbmFtZSBpbXBsZW1lbnRhdGlvbicgIiRjZmdmaWxlIiAmZ3Q7ICRj
ZmdmaWxlLnRtcCBcCisrICAmYW1wOyZhbXA7IG12IC1mICIkY2ZnZmlsZS50bXAiICIkY2ZnZmls
ZSIgXAorKyAgICB8fCAocm0gLWYgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IGNwICIkY2ZnZmlsZS50
bXAiICIkY2ZnZmlsZSIgJmFtcDsmYW1wOyBybSAtZiAiJGNmZ2ZpbGUudG1wIikKKyt0ZXN0IDAg
LWVxICQ/IHx8IF9sdF9mdW5jdGlvbl9yZXBsYWNlX2ZhaWw9OgorKworKworKyAgc2VkIC1lICcv
XmZ1bmNfc3BsaXRfbG9uZ19vcHQgKCkkLywvXn0gIyBmdW5jX3NwbGl0X2xvbmdfb3B0IC9jXAor
K2Z1bmNfc3BsaXRfbG9uZ19vcHQgKClcCisre1wKKytcICAgIGZ1bmNfc3BsaXRfbG9uZ19vcHRf
bmFtZT0kezElJT0qfVwKKytcICAgIGZ1bmNfc3BsaXRfbG9uZ19vcHRfYXJnPSR7MSMqPX1cCisr
fSAjIEV4dGVuZGVkLXNoZWxsIGZ1bmNfc3BsaXRfbG9uZ19vcHQgaW1wbGVtZW50YXRpb24nICIk
Y2ZnZmlsZSIgJmd0OyAkY2ZnZmlsZS50bXAgXAorKyAgJmFtcDsmYW1wOyBtdiAtZiAiJGNmZ2Zp
bGUudG1wIiAiJGNmZ2ZpbGUiIFwKKysgICAgfHwgKHJtIC1mICIkY2ZnZmlsZSIgJmFtcDsmYW1w
OyBjcCAiJGNmZ2ZpbGUudG1wIiAiJGNmZ2ZpbGUiICZhbXA7JmFtcDsgcm0gLWYgIiRjZmdmaWxl
LnRtcCIpCisrdGVzdCAwIC1lcSAkPyB8fCBfbHRfZnVuY3Rpb25fcmVwbGFjZV9mYWlsPToKKysK
KysKKysgIHNlZCAtZSAnL15mdW5jX3NwbGl0X3Nob3J0X29wdCAoKSQvLC9efSAjIGZ1bmNfc3Bs
aXRfc2hvcnRfb3B0IC9jXAorK2Z1bmNfc3BsaXRfc2hvcnRfb3B0ICgpXAorK3tcCisrXCAgICBm
dW5jX3NwbGl0X3Nob3J0X29wdF9hcmc9JHsxIz8/fVwKKytcICAgIGZ1bmNfc3BsaXRfc2hvcnRf
b3B0X25hbWU9JHsxJSIkZnVuY19zcGxpdF9zaG9ydF9vcHRfYXJnIn1cCisrfSAjIEV4dGVuZGVk
LXNoZWxsIGZ1bmNfc3BsaXRfc2hvcnRfb3B0IGltcGxlbWVudGF0aW9uJyAiJGNmZ2ZpbGUiICZn
dDsgJGNmZ2ZpbGUudG1wIFwKKysgICZhbXA7JmFtcDsgbXYgLWYgIiRjZmdmaWxlLnRtcCIgIiRj
ZmdmaWxlIiBcCisrICAgIHx8IChybSAtZiAiJGNmZ2ZpbGUiICZhbXA7JmFtcDsgY3AgIiRjZmdm
aWxlLnRtcCIgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IHJtIC1mICIkY2ZnZmlsZS50bXAiKQorK3Rl
c3QgMCAtZXEgJD8gfHwgX2x0X2Z1bmN0aW9uX3JlcGxhY2VfZmFpbD06CisrCisrCisrICBzZWQg
LWUgJy9eZnVuY19sbzJvICgpJC8sL159ICMgZnVuY19sbzJvIC9jXAorK2Z1bmNfbG8ybyAoKVwK
Kyt7XAorK1wgICAgY2FzZSAkezF9IGluXAorK1wgICAgICAqLmxvKSBmdW5jX2xvMm9fcmVzdWx0
PSR7MSUubG99LiR7b2JqZXh0fSA7O1wKKytcICAgICAgKikgICAgZnVuY19sbzJvX3Jlc3VsdD0k
ezF9IDs7XAorK1wgICAgZXNhY1wKKyt9ICMgRXh0ZW5kZWQtc2hlbGwgZnVuY19sbzJvIGltcGxl
bWVudGF0aW9uJyAiJGNmZ2ZpbGUiICZndDsgJGNmZ2ZpbGUudG1wIFwKKysgICZhbXA7JmFtcDsg
bXYgLWYgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiBcCisrICAgIHx8IChybSAtZiAiJGNmZ2Zp
bGUiICZhbXA7JmFtcDsgY3AgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IHJt
IC1mICIkY2ZnZmlsZS50bXAiKQorK3Rlc3QgMCAtZXEgJD8gfHwgX2x0X2Z1bmN0aW9uX3JlcGxh
Y2VfZmFpbD06CisrCisrCisrICBzZWQgLWUgJy9eZnVuY194Zm9ybSAoKSQvLC9efSAjIGZ1bmNf
eGZvcm0gL2NcCisrZnVuY194Zm9ybSAoKVwKKyt7XAorKyAgICBmdW5jX3hmb3JtX3Jlc3VsdD0k
ezElLip9LmxvXAorK30gIyBFeHRlbmRlZC1zaGVsbCBmdW5jX3hmb3JtIGltcGxlbWVudGF0aW9u
JyAiJGNmZ2ZpbGUiICZndDsgJGNmZ2ZpbGUudG1wIFwKKysgICZhbXA7JmFtcDsgbXYgLWYgIiRj
ZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiBcCisrICAgIHx8IChybSAtZiAiJGNmZ2ZpbGUiICZhbXA7
JmFtcDsgY3AgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IHJtIC1mICIkY2Zn
ZmlsZS50bXAiKQorK3Rlc3QgMCAtZXEgJD8gfHwgX2x0X2Z1bmN0aW9uX3JlcGxhY2VfZmFpbD06
CisrCisrCisrICBzZWQgLWUgJy9eZnVuY19hcml0aCAoKSQvLC9efSAjIGZ1bmNfYXJpdGggL2Nc
CisrZnVuY19hcml0aCAoKVwKKyt7XAorKyAgICBmdW5jX2FyaXRoX3Jlc3VsdD0kKCggJCogKSlc
CisrfSAjIEV4dGVuZGVkLXNoZWxsIGZ1bmNfYXJpdGggaW1wbGVtZW50YXRpb24nICIkY2ZnZmls
ZSIgJmd0OyAkY2ZnZmlsZS50bXAgXAorKyAgJmFtcDsmYW1wOyBtdiAtZiAiJGNmZ2ZpbGUudG1w
IiAiJGNmZ2ZpbGUiIFwKKysgICAgfHwgKHJtIC1mICIkY2ZnZmlsZSIgJmFtcDsmYW1wOyBjcCAi
JGNmZ2ZpbGUudG1wIiAiJGNmZ2ZpbGUiICZhbXA7JmFtcDsgcm0gLWYgIiRjZmdmaWxlLnRtcCIp
CisrdGVzdCAwIC1lcSAkPyB8fCBfbHRfZnVuY3Rpb25fcmVwbGFjZV9mYWlsPToKKysKKysKKysg
IHNlZCAtZSAnL15mdW5jX2xlbiAoKSQvLC9efSAjIGZ1bmNfbGVuIC9jXAorK2Z1bmNfbGVuICgp
XAorK3tcCisrICAgIGZ1bmNfbGVuX3Jlc3VsdD0keyMxfVwKKyt9ICMgRXh0ZW5kZWQtc2hlbGwg
ZnVuY19sZW4gaW1wbGVtZW50YXRpb24nICIkY2ZnZmlsZSIgJmd0OyAkY2ZnZmlsZS50bXAgXAor
KyAgJmFtcDsmYW1wOyBtdiAtZiAiJGNmZ2ZpbGUudG1wIiAiJGNmZ2ZpbGUiIFwKKysgICAgfHwg
KHJtIC1mICIkY2ZnZmlsZSIgJmFtcDsmYW1wOyBjcCAiJGNmZ2ZpbGUudG1wIiAiJGNmZ2ZpbGUi
ICZhbXA7JmFtcDsgcm0gLWYgIiRjZmdmaWxlLnRtcCIpCisrdGVzdCAwIC1lcSAkPyB8fCBfbHRf
ZnVuY3Rpb25fcmVwbGFjZV9mYWlsPToKKysKKytmaQorKworK2lmIHRlc3QgeCIkbHRfc2hlbGxf
YXBwZW5kIiA9IHh5ZXM7IHRoZW4KKysgIHNlZCAtZSAnL15mdW5jX2FwcGVuZCAoKSQvLC9efSAj
IGZ1bmNfYXBwZW5kIC9jXAorK2Z1bmNfYXBwZW5kICgpXAorK3tcCisrICAgIGV2YWwgIiR7MX0r
PVxcJHsyfSJcCisrfSAjIEV4dGVuZGVkLXNoZWxsIGZ1bmNfYXBwZW5kIGltcGxlbWVudGF0aW9u
JyAiJGNmZ2ZpbGUiICZndDsgJGNmZ2ZpbGUudG1wIFwKKysgICZhbXA7JmFtcDsgbXYgLWYgIiRj
ZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiBcCisrICAgIHx8IChybSAtZiAiJGNmZ2ZpbGUiICZhbXA7
JmFtcDsgY3AgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IHJtIC1mICIkY2Zn
ZmlsZS50bXAiKQorK3Rlc3QgMCAtZXEgJD8gfHwgX2x0X2Z1bmN0aW9uX3JlcGxhY2VfZmFpbD06
CisrCisrCisrICBzZWQgLWUgJy9eZnVuY19hcHBlbmRfcXVvdGVkICgpJC8sL159ICMgZnVuY19h
cHBlbmRfcXVvdGVkIC9jXAorK2Z1bmNfYXBwZW5kX3F1b3RlZCAoKVwKKyt7XAorK1wgICAgZnVu
Y19xdW90ZV9mb3JfZXZhbCAiJHsyfSJcCisrXCAgICBldmFsICIkezF9Kz1cXFxcIFxcJGZ1bmNf
cXVvdGVfZm9yX2V2YWxfcmVzdWx0IlwKKyt9ICMgRXh0ZW5kZWQtc2hlbGwgZnVuY19hcHBlbmRf
cXVvdGVkIGltcGxlbWVudGF0aW9uJyAiJGNmZ2ZpbGUiICZndDsgJGNmZ2ZpbGUudG1wIFwKKysg
ICZhbXA7JmFtcDsgbXYgLWYgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiBcCisrICAgIHx8IChy
bSAtZiAiJGNmZ2ZpbGUiICZhbXA7JmFtcDsgY3AgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiAm
YW1wOyZhbXA7IHJtIC1mICIkY2ZnZmlsZS50bXAiKQorK3Rlc3QgMCAtZXEgJD8gfHwgX2x0X2Z1
bmN0aW9uX3JlcGxhY2VfZmFpbD06CisrCisrCisrICAjIFNhdmUgYSBgZnVuY19hcHBlbmQnIGZ1
bmN0aW9uIGNhbGwgd2hlcmUgcG9zc2libGUgYnkgZGlyZWN0IHVzZSBvZiAnKz0nCisrICBzZWQg
LWUgJ3MlZnVuY19hcHBlbmQgXChbYS16QS1aX11cezEsXH1cKSAiJVwxKz0iJWcnICRjZmdmaWxl
ICZndDsgJGNmZ2ZpbGUudG1wIFwKKysgICAgJmFtcDsmYW1wOyBtdiAtZiAiJGNmZ2ZpbGUudG1w
IiAiJGNmZ2ZpbGUiIFwKKysgICAgICB8fCAocm0gLWYgIiRjZmdmaWxlIiAmYW1wOyZhbXA7IGNw
ICIkY2ZnZmlsZS50bXAiICIkY2ZnZmlsZSIgJmFtcDsmYW1wOyBybSAtZiAiJGNmZ2ZpbGUudG1w
IikKKysgIHRlc3QgMCAtZXEgJD8gfHwgX2x0X2Z1bmN0aW9uX3JlcGxhY2VfZmFpbD06CisrZWxz
ZQorKyAgIyBTYXZlIGEgYGZ1bmNfYXBwZW5kJyBmdW5jdGlvbiBjYWxsIGV2ZW4gd2hlbiAnKz0n
IGlzIG5vdCBhdmFpbGFibGUKKysgIHNlZCAtZSAncyVmdW5jX2FwcGVuZCBcKFthLXpBLVpfXVx7
MSxcfVwpICIlXDE9IiRcMSVnJyAkY2ZnZmlsZSAmZ3Q7ICRjZmdmaWxlLnRtcCBcCisrICAgICZh
bXA7JmFtcDsgbXYgLWYgIiRjZmdmaWxlLnRtcCIgIiRjZmdmaWxlIiBcCisrICAgICAgfHwgKHJt
IC1mICIkY2ZnZmlsZSIgJmFtcDsmYW1wOyBjcCAiJGNmZ2ZpbGUudG1wIiAiJGNmZ2ZpbGUiICZh
bXA7JmFtcDsgcm0gLWYgIiRjZmdmaWxlLnRtcCIpCisrICB0ZXN0IDAgLWVxICQ/IHx8IF9sdF9m
dW5jdGlvbl9yZXBsYWNlX2ZhaWw9OgorK2ZpCisrCisraWYgdGVzdCB4IiRfbHRfZnVuY3Rpb25f
cmVwbGFjZV9mYWlsIiA9IHgiOiI7IHRoZW4KKysgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xp
bmVuby0kTElORU5PfTogV0FSTklORzogVW5hYmxlIHRvIHN1YnN0aXR1dGUgZXh0ZW5kZWQgc2hl
bGwgZnVuY3Rpb25zIGluICRvZmlsZSIgJmd0OyZhbXA7NQorKyRhc19lY2hvICIkYXNfbWU6IFdB
Uk5JTkc6IFVuYWJsZSB0byBzdWJzdGl0dXRlIGV4dGVuZGVkIHNoZWxsIGZ1bmN0aW9ucyBpbiAk
b2ZpbGUiICZndDsmYW1wOzI7fQorK2ZpCisrCisrCisrICAgbXYgLWYgIiRjZmdmaWxlIiAiJG9m
aWxlIiB8fAorICAgICAocm0gLWYgIiRvZmlsZSIgJmFtcDsmYW1wOyBjcCAiJGNmZ2ZpbGUiICIk
b2ZpbGUiICZhbXA7JmFtcDsgcm0gLWYgIiRjZmdmaWxlIikKKyAgIGNobW9kICt4ICIkb2ZpbGUi
CisgCiAtLSAKLTIuMjYuMAorMi4yOC4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9iaW51dGlscy9iaW51dGlscy8wMDEzLWZpeC10aGUtaW5jb3JyZWN0LWFzc2VtYmxpbmct
Zm9yLXBwYy13YWl0LW1uZW1vbmljLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0
aWxzL2JpbnV0aWxzLzAwMTMtZml4LXRoZS1pbmNvcnJlY3QtYXNzZW1ibGluZy1mb3ItcHBjLXdh
aXQtbW5lbW9uaWMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDQ2M2RlODA2
MzguLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0
aWxzLzAwMTMtZml4LXRoZS1pbmNvcnJlY3QtYXNzZW1ibGluZy1mb3ItcHBjLXdhaXQtbW5lbW9u
aWMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMyArMCwwIEBACi1Gcm9tIGVmNGFkMWNiOWZm
MWI1YTg3MWZmYTc5MmE3MWIzYWQ2ZDE0ZWIzZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBaaGVuaHVhIEx1byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86emhlbmh1YS5sdW9AbnhwLmNvbSI+Jmx0O3poZW5odWEubHVvQG54cC5jb20mZ3Q7PC9h
PgotRGF0ZTogU2F0LCAxMSBKdW4gMjAxNiAyMjowODoyOSAtMDUwMAotU3ViamVjdDogW1BBVENI
XSBmaXggdGhlIGluY29ycmVjdCBhc3NlbWJsaW5nIGZvciBwcGMgd2FpdCBtbmVtb25pYwotCi1T
aWduZWQtb2ZmLWJ5OiBaaGVuaHVhIEx1byA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZF
IiBocmVmPSJtYWlsdG86emhlbmh1YS5sdW9AbnhwLmNvbSI+Jmx0O3poZW5odWEubHVvQG54cC5j
b20mZ3Q7PC9hPgotCi1VcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLS0tLQotIG9wY29kZXMvcHBj
LW9wYy5jIHwgMyArLS0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCi0KLWRpZmYgLS1naXQgYS9vcGNvZGVzL3BwYy1vcGMuYyBiL29wY29kZXMvcHBjLW9w
Yy5jCi1pbmRleCA3ZWY5MWQ4MTliLi4xNDU5NTNkM2M0IDEwMDY0NAotLS0tIGEvb3Bjb2Rlcy9w
cGMtb3BjLmMKLSsrKyBiL29wY29kZXMvcHBjLW9wYy5jCi1AQCAtNTcwOSw3ICs1NzA5LDYgQEAg
Y29uc3Qgc3RydWN0IHBvd2VycGNfb3Bjb2RlIHBvd2VycGNfb3Bjb2Rlc1tdID0gewotIHsibGRl
cHgiLAlYKDMxLDI5KSwJWF9NQVNLLAkgIEU1MDBNQ3xQUENBMiwgMCwJCXtSVCwgUkEwLCBSQn19
LAotIAotIHsid2FpdGFzZWMiLAlYKDMxLDMwKSwgICAgICBYUlRSQVJCX01BU0ssIFBPV0VSOCwJ
UE9XRVI5LAkJezB9fSwKLS17IndhaXQiLAlYKDMxLDMwKSwJWFdDX01BU0ssICAgIFBPV0VSOSwJ
MCwJCXtXQ319LAotIAotIHsibHdlcHgiLAlYKDMxLDMxKSwJWF9NQVNLLAkgIEU1MDBNQ3xQUENB
MiwgMCwJCXtSVCwgUkEwLCBSQn19LAotIAotQEAgLTU3NjMsNyArNTc2Miw3IEBAIGNvbnN0IHN0
cnVjdCBwb3dlcnBjX29wY29kZSBwb3dlcnBjX29wY29kZXNbXSA9IHsKLSAKLSB7IndhaXRyc3Yi
LAlYKDMxLDYyKXwoMSZsdDsmbHQ7MjEpLCAweGZmZmZmZmZmLCBFNTAwTUN8UFBDQTIsIDAsCQl7
MH19LAotIHsid2FpdGltcGwiLAlYKDMxLDYyKXwoMiZsdDsmbHQ7MjEpLCAweGZmZmZmZmZmLCBF
NTAwTUN8UFBDQTIsIDAsCQl7MH19LAotLXsid2FpdCIsCVgoMzEsNjIpLAlYV0NfTUFTSywgICAg
RTUwME1DfFBQQ0EyLCAwLAkJe1dDfX0sCi0reyJ3YWl0IiwJWCgzMSw2MiksCVhXQ19NQVNLLCAg
ICBFNTAwTUN8UFBDQTJ8UE9XRVI5LCAwLAl7V0N9fSwKLSAKLSB7ImRjYnN0ZXAiLAlYUlQoMzEs
NjMsMCksCVhSVF9NQVNLLCAgICBFNTAwTUN8UFBDQTIsIDAsCQl7UkEwLCBSQn19LAotIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTAtRml4
LXJwYXRoLWluLWxpYnRvb2wtd2hlbi1zeXNyb290LWlzLWVuYWJsZWQucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxNC1GaXgtcnBhdGgtaW4tbGlidG9v
bC13aGVuLXN5c3Jvb3QtaXMtZW5hYmxlZC5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxMC1GaXgt
cnBhdGgtaW4tbGlidG9vbC13aGVuLXN5c3Jvb3QtaXMtZW5hYmxlZC5wYXRjaApyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTQtRml4LXJwYXRoLWlu
LWxpYnRvb2wtd2hlbi1zeXNyb290LWlzLWVuYWJsZWQucGF0Y2gKaW5kZXggZjRmMWEwNjhjYi4u
NjlhMjM4Mzc4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2Jp
bnV0aWxzLzAwMTAtRml4LXJwYXRoLWluLWxpYnRvb2wtd2hlbi1zeXNyb290LWlzLWVuYWJsZWQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTQt
Rml4LXJwYXRoLWluLWxpYnRvb2wtd2hlbi1zeXNyb290LWlzLWVuYWJsZWQucGF0Y2gKQEAgLTEs
NyArMSw3IEBACi1Gcm9tIDcwZjNmMmQ5ZTkxMmVhNzc3ZmExMTNlMDJjZGJjMzQ2NWE2NmU0MGQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY3OTFhNWQ4NDQ3NWMwMjM1NmYxNjY3OWI3
ZjRlZTljOWMzNDA4YWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21h
aWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IE1vbiwgMiBNYXIg
MjAxNSAwMTo0MjozOCArMDAwMAotU3ViamVjdDogW1BBVENIXSBGaXggcnBhdGggaW4gbGlidG9v
bCB3aGVuIHN5c3Jvb3QgaXMgZW5hYmxlZAorU3ViamVjdDogW1BBVENIIDE0LzE3XSBGaXggcnBh
dGggaW4gbGlidG9vbCB3aGVuIHN5c3Jvb3QgaXMgZW5hYmxlZAogCiBFbmFibGluZyBzeXNyb290
IHN1cHBvcnQgaW4gbGlidG9vbCBleHBvc2VkIGEgYnVnIHdoZXJlIHRoZSBmaW5hbAogbGlicmFy
eSBoYWQgYW4gUlBBVEggZW5jb2RlZCBpbnRvIGl0IHdoaWNoIHN0aWxsIHBvaW50ZWQgdG8gdGhl
CkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDty
YWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9sdG1haW4uc2ggYi9sdG1haW4uc2gK
LWluZGV4IDcwZTg1NmUwNjUuLjExZWU2ODRjY2MgMTAwNjQ0CitpbmRleCA3MGU4NTZlMDY1OS4u
MTFlZTY4NGNjY2YgMTAwNjQ0CiAtLS0gYS9sdG1haW4uc2gKICsrKyBiL2x0bWFpbi5zaAogQEAg
LTgwMzUsOSArODAzNSwxMSBAQCBFT0YKQEAgLTQ3LDMgKzQ3LDYgQEAgaW5kZXggNzBlODU2ZTA2
NS4uMTFlZTY4NGNjYyAxMDA2NDQKICAJICBpZiB0ZXN0IC1uICIkaGFyZGNvZGVfbGliZGlyX3Nl
cGFyYXRvciI7IHRoZW4KICAJICAgIGlmIHRlc3QgLXogIiRoYXJkY29kZV9saWJkaXJzIjsgdGhl
bgogIAkgICAgICBoYXJkY29kZV9saWJkaXJzPSIkbGliZGlyIgorLS0gCisyLjI4LjAKKwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTUtc3lu
Yy13aXRoLU9FLWxpYnRvb2wtY2hhbmdlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
aW51dGlscy9iaW51dGlscy8wMDE1LXN5bmMtd2l0aC1PRS1saWJ0b29sLWNoYW5nZXMucGF0Y2gK
aW5kZXggYTc5NDcxOWJkMi4uZTg0OGYxNDZiMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTUtc3luYy13aXRoLU9FLWxpYnRvb2wtY2hhbmdl
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAx
NS1zeW5jLXdpdGgtT0UtbGlidG9vbC1jaGFuZ2VzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJv
bSAzOTJkNDc0YTcyZDM3YjY2OWY1M2FiOWYwZmE5MTNiOTU4YWY5M2Y2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBlMDg3Zjk2ZTIxOWQ0N2M0ZDIyNDRjM2YzMjM5N2U1NmQ0MWJmZGVj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbSI+
Jmx0O3Jvc3MuYnVydG9uQGludGVsLmNvbSZndDs8L2E+CiBEYXRlOiBNb24sIDYgTWFyIDIwMTcg
MjM6MzM6MjcgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gc3luYyB3aXRoIE9FIGxpYnRvb2wgY2hh
bmdlcworU3ViamVjdDogW1BBVENIIDE1LzE3XSBzeW5jIHdpdGggT0UgbGlidG9vbCBjaGFuZ2Vz
CiAKIEFwcGx5IHRoZXNlIHBhdGNoZXMgZnJvbSBvdXIgbGlidG9vbCBwYXRjaGVzIGFzIG5vdCBv
bmx5IGFyZSByZWR1bmRhbnQgUlBBVEhzIGEKIHdhc3RlIG9mIHNwYWNlIGJ1dCB0aGV5IGNhbiBj
YXVzZSBpbmNvcnJlY3QgbGlua2luZyB3aGVuIG5hdGl2ZSBwYWNrYWdlcyBhcmUKQEAgLTI2LDcg
KzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdt
YWlsLmNvbSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9sdG1haW4uc2ggYi9sdG1haW4uc2gKLWluZGV4IDEx
ZWU2ODRjY2MuLjNiMTlhYzE1MzIgMTAwNjQ0CitpbmRleCAxMWVlNjg0Y2NjZi4uM2IxOWFjMTUz
MjggMTAwNjQ0CiAtLS0gYS9sdG1haW4uc2gKICsrKyBiL2x0bWFpbi5zaAogQEAgLTgwNTMsOCAr
ODA1MywxNiBAQCBFT0YKQEAgLTg0LDMgKzg0LDYgQEAgaW5kZXggMTFlZTY4NGNjYy4uM2IxOWFj
MTUzMiAxMDA2NDQKICAJICBmaQogIAllbGlmIHRlc3QgLW4gIiRydW5wYXRoX3ZhciI7IHRoZW4K
ICAJICBjYXNlICIkZmluYWxpemVfcGVybV9ycGF0aCAiIGluCistLSAKKzIuMjguMAorCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxNi1DaGVj
ay1mb3ItY2xhbmctYmVmb3JlLWNoZWNraW5nLWdjYy12ZXJzaW9uLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAwMTYtQ2hlY2stZm9yLWNsYW5nLWJlZm9y
ZS1jaGVja2luZy1nY2MtdmVyc2lvbi5wYXRjaAppbmRleCBjNjk0YjQyZGMzLi40MDBiNzk4MjNm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAx
Ni1DaGVjay1mb3ItY2xhbmctYmVmb3JlLWNoZWNraW5nLWdjYy12ZXJzaW9uLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDE2LUNoZWNrLWZvci1j
bGFuZy1iZWZvcmUtY2hlY2tpbmctZ2NjLXZlcnNpb24ucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1G
cm9tIDY3NTkwYTQ0YzEyNTY0OTFmYTY3NDQyNmYwMTcwZDVkMDUzNzdkMDUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGFlNWE3ZDYyMmRjOWFkZGIyY2E5ZmM4NTg4OWM0NTk2NGMwMjVh
OWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7
cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IFdlZCwgMTUgQXByIDIwMjAgMTQ6MTc6
MjAgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCAxNi8xNl0gQ2hlY2sgZm9yIGNsYW5nIGJlZm9yZSBj
aGVja2luZyBnY2MgdmVyc2lvbgorU3ViamVjdDogW1BBVENIIDE2LzE3XSBDaGVjayBmb3IgY2xh
bmcgYmVmb3JlIGNoZWNraW5nIGdjYyB2ZXJzaW9uCiAKIENsYW5nIGFkdmVydGlzZXMgaXRzZWxm
IHRvIGJlIGdjYyA0LjIuMSwgc28gd2hlbiBjb21waWxpbmcgdGhpcyB0ZXN0CiBoZXJlIGZhaWxz
IHNpbmNlIGdjYyAmbHQ7IDQuNC41IGRpZCBub3Qgc3VwcG9ydCAtc3RhdGljLWxpYnN0ZGMrKyBi
dXQgdGhhdHMKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBj
bGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwu
Y29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBi
L2NvbmZpZ3VyZQotaW5kZXggNTkwYjAzYzJkYTAuLjQ2ZjExNmZkYjU0IDEwMDc1NQoraW5kZXgg
Njc4MmY4YjZhYjguLjcyZjU3NjZiMzYzIDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiArKysgYi9j
b25maWd1cmUKLUBAIC01MTQwLDcgKzUxNDAsNyBAQCBhY19jb21waWxlcl9nbnU9JGFjX2N2X2N4
eF9jb21waWxlcl9nbnUKK0BAIC01MTQzLDcgKzUxNDMsNyBAQCBhY19jb21waWxlcl9nbnU9JGFj
X2N2X2N4eF9jb21waWxlcl9nbnUKICBjYXQgY29uZmRlZnMuaCAtICZsdDsmbHQ7X0FDRU9GICZn
dDtjb25mdGVzdC4kYWNfZXh0CiAgLyogZW5kIGNvbmZkZWZzLmguICAqLwogIApAQCAtMzEsMTAg
KzMxLDEwIEBAIGluZGV4IDU5MGIwM2MyZGEwLi40NmYxMTZmZGI1NCAxMDA3NTUKICAjZW5kaWYK
ICBpbnQgbWFpbigpIHt9CiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFj
Ci1pbmRleCBkM2Y4NWU2ZjVkNS4uYzBlYjEzNDMxMjEgMTAwNjQ0CitpbmRleCA1NWJlYjFkZWE0
Ni4uM2Y5ZTYxM2UyZDkgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3Vy
ZS5hYwotQEAgLTEzMDksNyArMTMwOSw3IEBAIGlmIHRlc3QgIiRHQ0MiID0geWVzOyB0aGVuCitA
QCAtMTMxMiw3ICsxMzEyLDcgQEAgaWYgdGVzdCAiJEdDQyIgPSB5ZXM7IHRoZW4KICAgIEFDX01T
R19DSEVDS0lORyhbd2hldGhlciBnKysgYWNjZXB0cyAtc3RhdGljLWxpYnN0ZGMrKyAtc3RhdGlj
LWxpYmdjY10pCiAgICBBQ19MQU5HX1BVU0goQysrKQogICAgQUNfTElOS19JRkVMU0UoW0FDX0xB
TkdfU09VUkNFKFsKQEAgLTQ0LDUgKzQ0LDUgQEAgaW5kZXggZDNmODVlNmY1ZDUuLmMwZWIxMzQz
MTIxIDEwMDY0NAogICNlbmRpZgogIGludCBtYWluKCkge31dKV0sCiAtLSAKLTIuMjYuMQorMi4y
OC4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGls
cy8wMDE3LURvLW5vdC1lbWl0LVJfUklTQ1ZfTk9ORS1yZWxvYy1pbi10aGUtZXh0cmEtdW51c2Vk
LXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAxNy1E
by1ub3QtZW1pdC1SX1JJU0NWX05PTkUtcmVsb2MtaW4tdGhlLWV4dHJhLXVudXNlZC1yLnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjk5YmIzOGViNjcKLS0tIC9k
ZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAx
Ny1Eby1ub3QtZW1pdC1SX1JJU0NWX05PTkUtcmVsb2MtaW4tdGhlLWV4dHJhLXVudXNlZC1yLnBh
dGNoCkBAIC0wLDAgKzEsNDIgQEAKK0Zyb20gNWI2MWM0MGMzNGMzZGI2OTlkZTcyM2MzMTI4YmE3
MDQ1MDFjY2RhYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEtoZW0gUmFqIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgorRGF0ZTogTW9uLCAyMCBBcHIgMjAy
MCAxNDoyMzo1NyAtMDcwMAorU3ViamVjdDogW1BBVENIIDE3LzE3XSBEbyBub3QgZW1pdCBSX1JJ
U0NWX05PTkUgcmVsb2MgaW4gdGhlIGV4dHJhIHVudXNlZAorIHJlbG9jIHNwYWNlLgorCitSZWR1
bmRhbnQgUl9SSVNDVl9EVFBNT0QqIFJfUklTQ1ZfRFRQUkVMKiByZXN1bHRzIGZyb20gR2xvYmFs
IER5bmFtaWMgLSZndDsgTG9jYWwgRXhlYyByZWxheGF0aW9uCit3aGljaCBnZW5lcmF0ZXMKKwor
UGF0Y2ggZnJvbSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczov
L3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0yNDY3MyI+aHR0cHM6Ly9z
b3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MjQ2NzM8L2E+CisKK1Vwc3Ry
ZWFtLVN0YXR1czogUGVuZGluZworCitTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4m
bHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KKy0tLQorIGJmZC9lbGZubi1yaXNjdi5jIHwg
NSArKystLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CisKK2RpZmYgLS1naXQgYS9iZmQvZWxmbm4tcmlzY3YuYyBiL2JmZC9lbGZubi1yaXNjdi5jCitp
bmRleCBhNWZhNDE1MzA5YS4uMWU1ODIwNTJhYTkgMTAwNjQ0CistLS0gYS9iZmQvZWxmbm4tcmlz
Y3YuYworKysrIGIvYmZkL2VsZm5uLXJpc2N2LmMKK0BAIC0yMDkwLDEzICsyMDkwLDE0IEBAIHJp
c2N2X2VsZl9yZWxvY2F0ZV9zZWN0aW9uIChiZmQgKm91dHB1dF9iZmQsCisgCQkgIHBpYyA9IGJm
ZF9saW5rX3BpYyAoaW5mbyk7CisgCisgCQkgIGlmIChXSUxMX0NBTExfRklOSVNIX0RZTkFNSUNf
U1lNQk9MIChkeW4sIHBpYywgaCkKKy0JCSAgICAgICZhbXA7JmFtcDsgKCFwaWMgfHwgIVNZTUJP
TF9SRUZFUkVOQ0VTX0xPQ0FMIChpbmZvLCBoKSkpCisrCQkgICAgICAmYW1wOyZhbXA7IChiZmRf
bGlua19kbGwgKGluZm8pCisrCQkJICB8fCAhU1lNQk9MX1JFRkVSRU5DRVNfTE9DQUwgKGluZm8s
IGgpKSkKKyAJCSAgICBpbmR4ID0gaC0mZ3Q7ZHluaW5keDsKKyAJCX0KKyAKKyAJICAgICAgLyog
VGhlIEdPVCBlbnRyaWVzIGhhdmUgbm90IGJlZW4gaW5pdGlhbGl6ZWQgeWV0LiAgRG8gaXQKKyAJ
CSBub3csIGFuZCBlbWl0IGFueSByZWxvY2F0aW9ucy4gICovCistCSAgICAgIGlmICgoYmZkX2xp
bmtfcGljIChpbmZvKSB8fCBpbmR4ICE9IDApCisrCSAgICAgIGlmICgoYmZkX2xpbmtfZGxsIChp
bmZvKSB8fCBpbmR4ICE9IDApCisgCQkgICZhbXA7JmFtcDsgKGggPT0gTlVMTAorIAkJICAgICAg
fHwgRUxGX1NUX1ZJU0lCSUxJVFkgKGgtJmd0O290aGVyKSA9PSBTVFZfREVGQVVMVAorIAkJICAg
ICAgfHwgaC0mZ3Q7cm9vdC50eXBlICE9IGJmZF9saW5rX2hhc2hfdW5kZWZ3ZWFrKSkKKy0tIAor
Mi4yOC4wCisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51
dGlscy8wMDE3LWJpbnV0aWxzLWRyb3AtcmVkdW5kYW50LXByb2dyYW1fbmFtZS1kZWZpbml0aW9u
LWZuby0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMvMDAx
Ny1iaW51dGlscy1kcm9wLXJlZHVuZGFudC1wcm9ncmFtX25hbWUtZGVmaW5pdGlvbi1mbm8tLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBiZTU5ZjlkY2EwLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscy9iaW51dGlscy8wMDE3LWJpbnV0
aWxzLWRyb3AtcmVkdW5kYW50LXByb2dyYW1fbmFtZS1kZWZpbml0aW9uLWZuby0ucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw2MSArMCwwIEBACi1Gcm9tIDU3YTNlMDU1NjA1YjI4YTk0NDliMWIy
N2VkYTcxMjU3MzdjNDJiMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBTZXJnZWkg
VHJvZmltb3ZpY2ggPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OnNpYXJoZWl0QGdvb2dsZS5jb20iPiZsdDtzaWFyaGVpdEBnb29nbGUuY29tJmd0OzwvYT4KLURh
dGU6IFNhdCwgMSBGZWIgMjAyMCAyMzoxNjoxMSArMDAwMAotU3ViamVjdDogW1BBVENIXSBiaW51
dGlsczogZHJvcCByZWR1bmRhbnQgJ3Byb2dyYW1fbmFtZScgZGVmaW5pdGlvbgotICgtZm5vLWNv
bW1vbikKLQotCSogY29mZmR1bXAuYyAocHJvZ3JhbV9uYW1lKTogRHJvcCByZWR1bmRhbnQgZGVm
aW5pdGlvbi4KLQkqIHNyY29udi5jIChwcm9ncmFtX25hbWUpOiBMaWtld2lzZQotCSogc3lzZHVt
cC5jIChwcm9ncmFtX25hbWUpOiBMaWtld2lzZQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
IChjb21taXQgMGIzOThkNjlhYykKLVNpZ25lZC1vZmYtYnk6IFNlcmdlaSBUcm9maW1vdmljaCA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86c2lhcmhlaXRAZ29v
Z2xlLmNvbSI+Jmx0O3NpYXJoZWl0QGdvb2dsZS5jb20mZ3Q7PC9hPgotU2lnbmVkLW9mZi1ieTog
UmljaGFyZCBMZWl0bmVyIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpyaWNoYXJkLmxlaXRuZXJAc2tpZGF0YS5jb20iPiZsdDtyaWNoYXJkLmxlaXRuZXJAc2tp
ZGF0YS5jb20mZ3Q7PC9hPgotLS0tCi0gYmludXRpbHMvY29mZmR1bXAuYyB8IDIgLS0KLSBiaW51
dGlscy9zcmNvbnYuYyAgIHwgMiAtLQotIGJpbnV0aWxzL3N5c2R1bXAuYyAgfCAyIC0tCi0gMyBm
aWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvYmludXRpbHMvY29m
ZmR1bXAuYyBiL2JpbnV0aWxzL2NvZmZkdW1wLmMKLWluZGV4IDUzMWE0ZTQ2YzMuLjMzNmRhNTdj
YTIgMTAwNjQ0Ci0tLS0gYS9iaW51dGlscy9jb2ZmZHVtcC5jCi0rKysgYi9iaW51dGlscy9jb2Zm
ZHVtcC5jCi1AQCAtNDU2LDggKzQ1Niw2IEBAIGNvZmZfZHVtcCAoc3RydWN0IGNvZmZfb2ZpbGUg
KnB0cikKLSAgICAgZHVtcF9jb2ZmX3NlY3Rpb24gKHB0ci0mZ3Q7c2VjdGlvbnMgKyBpKTsKLSB9
Ci0gCi0tY2hhciAqIHByb2dyYW1fbmFtZTsKLS0KLSBzdGF0aWMgdm9pZAotIHNob3dfdXNhZ2Ug
KEZJTEUgKmZpbGUsIGludCBzdGF0dXMpCi0gewotZGlmZiAtLWdpdCBhL2JpbnV0aWxzL3NyY29u
di5jIGIvYmludXRpbHMvc3Jjb252LmMKLWluZGV4IDU3NDJiMTY3NTkuLmYwNzE3OTRmMGEgMTAw
NjQ0Ci0tLS0gYS9iaW51dGlscy9zcmNvbnYuYwotKysrIGIvYmludXRpbHMvc3Jjb252LmMKLUBA
IC0xNjg3LDggKzE2ODcsNiBAQCBwcmVzY2FuIChzdHJ1Y3QgY29mZl9vZmlsZSAqb3RyZWUpCi0g
ICAgIH0KLSB9Ci0gCi0tY2hhciAqcHJvZ3JhbV9uYW1lOwotLQotIEFUVFJJQlVURV9OT1JFVFVS
TiBzdGF0aWMgdm9pZAotIHNob3dfdXNhZ2UgKEZJTEUgKmZmaWxlLCBpbnQgc3RhdHVzKQotIHsK
LWRpZmYgLS1naXQgYS9iaW51dGlscy9zeXNkdW1wLmMgYi9iaW51dGlscy9zeXNkdW1wLmMKLWlu
ZGV4IGQ0MzNlNzFlZDkuLjdlZWJiZDYxZDMgMTAwNjQ0Ci0tLS0gYS9iaW51dGlscy9zeXNkdW1w
LmMKLSsrKyBiL2JpbnV0aWxzL3N5c2R1bXAuYwotQEAgLTYzMyw4ICs2MzMsNiBAQCBtb2R1bGUg
KHZvaWQpCi0gICAgIH0KLSB9Ci0gCi0tY2hhciAqcHJvZ3JhbV9uYW1lOwotLQotIEFUVFJJQlVU
RV9OT1JFVFVSTiBzdGF0aWMgdm9pZAotIHNob3dfdXNhZ2UgKEZJTEUgKmZmaWxlLCBpbnQgc3Rh
dHVzKQotIHsKLS0tIAotMi4yNi4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9iaW51dGlscy9iaW51dGlscy9DVkUtMjAyMC0wNTUxLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0yMDIwLTA1NTEucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDUzZTNjYWY0NDUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0yMDIwLTA1NTEucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSw1NDkgKzAsMCBAQAotRnJvbSBhZTUzMTA0MWM3YzU5NTY2NzIzNDJmODlj
NDg2YTAxMWM4NGYwMjdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogIkguSi4gTHUi
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpoamwudG9vbHNA
Z21haWwuY29tIj4mbHQ7aGpsLnRvb2xzQGdtYWlsLmNvbSZndDs8L2E+Ci1EYXRlOiBXZWQsIDEx
IE1hciAyMDIwIDA5OjQ2OjE5IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8xXSBpMzg2OiBHZW5l
cmF0ZSBsZmVuY2Ugd2l0aCBsb2FkL2luZGlyZWN0IGJyYW5jaC9yZXQKLSBbQ1ZFLTIwMjAtMDU1
MV0KLQotQWRkIDMgY29tbWFuZC1saW5lIG9wdGlvbnMgdG8gZ2VuZXJhdGUgbGZlbmNlIGZvciBs
b2FkLCBpbmRpcmVjdCBuZWFyCi1icmFuY2ggYW5kIHJldCB0byBoZWxwIG1pdGlnYXRlOgotCi1o
dHRwczovL3d3dy5pbnRlbC5jb20vY29udGVudC93d3cvdXMvZW4vc2VjdXJpdHktY2VudGVyL2Fk
dmlzb3J5L2ludGVsLXNhLTAwMzM0Lmh0bWwKLWh0dHA6Ly9jdmUubWl0cmUub3JnL2NnaS1iaW4v
Y3ZlbmFtZS5jZ2k/bmFtZT1DVkUtMjAyMC0wNTUxCi0KLTEuIC1tbGZlbmNlLWFmdGVyLWxvYWQ9
W25vfHllc106Ci0gIC1tbGZlbmNlLWFmdGVyLWxvYWQ9eWVzIGdlbmVyYXRlcyBsZmVuY2UgYWZ0
ZXIgbG9hZCBpbnN0cnVjdGlvbnMuCi0yLiAtbWxmZW5jZS1iZWZvcmUtaW5kaXJlY3QtYnJhbmNo
PVtub25lfGFsbHxtZW1vcnl8cmVnaXN0ZXJdOgotICBhLiAtbWxmZW5jZS1iZWZvcmUtaW5kaXJl
Y3QtYnJhbmNoPWFsbCBnZW5lcmF0ZXMgbGZlbmNlIGJlZm9yZSBpbmRpcmVjdAotICBuZWFyIGJy
YW5jaGVzIHZpYSByZWdpc3RlciBhbmQgYSB3YXJuaW5nIGJlZm9yZSBpbmRpcmVjdCBuZWFyIGJy
YW5jaGVzCi0gIHZpYSBtZW1vcnkuCi0gIGIuIC1tbGZlbmNlLWJlZm9yZS1pbmRpcmVjdC1icmFu
Y2g9bWVtb3J5IGlzc3VlIGEgd2FybmluZyBiZWZvcmUKLSAgaW5kaXJlY3QgbmVhciBicmFuY2hl
cyB2aWEgbWVtb3J5LgotICBjLiAtbWxmZW5jZS1iZWZvcmUtaW5kaXJlY3QtYnJhbmNoPXJlZ2lz
dGVyIGdlbmVyYXRlcyBsZmVuY2UgYmVmb3JlCi0gIGluZGlyZWN0IG5lYXIgYnJhbmNoZXMgdmlh
IHJlZ2lzdGVyLgotTm90ZSB0aGF0IGxmZW5jZSB3b24ndCBiZSBnZW5lcmF0ZWQgYmVmb3JlIGlu
ZGlyZWN0IG5lYXIgYnJhbmNoZXMgdmlhCi1yZWdpc3RlciB3aXRoIC1tbGZlbmNlLWFmdGVyLWxv
YWQ9eWVzIHNpbmNlIGxmZW5jZSB3aWxsIGJlIGdlbmVyYXRlZAotYWZ0ZXIgbG9hZGluZyBicmFu
Y2ggdGFyZ2V0IHJlZ2lzdGVyLgotMy4gLW1sZmVuY2UtYmVmb3JlLXJldD1bbm9uZXxvcnxub3Rd
Ci0gIGEuIC1tbGZlbmNlLWJlZm9yZS1yZXQ9b3IgZ2VuZXJhdGVzIG9yIHdpdGggbGZlbmNlIGJl
Zm9yZSByZXQuCi0gIGIuIC1tbGZlbmNlLWJlZm9yZS1yZXQ9bm90IGdlbmVyYXRlcyBub3Qgd2l0
aCBsZmVuY2UgYmVmb3JlIHJldC4KLQotQSB3YXJuaW5nIHdpbGwgYmUgaXNzdWVkIGFuZCBsZmVu
Y2Ugd29uJ3QgYmUgZ2VuZXJhdGVkIGJlZm9yZSBpbmRpcmVjdAotbmVhciBicmFuY2ggYW5kIHJl
dCBpZiB0aGUgcHJldmlvdXMgaXRlbSBpcyBhIHByZWZpeCBvciBhIGNvbnN0YW50Ci1kaXJlY3Rp
dmUsIHdoaWNoIG1heSBiZSB1c2VkIHRvIGhhcmRjb2RlIGFuIGluc3RydWN0aW9uLCBzaW5jZSB0
aGVyZQotaXMgbm8gY2xlYXIgaW5zdHJ1Y3Rpb24gYm91bmRhcnkuCi0KLQkqIGNvbmZpZy90Yy1p
Mzg2LmMgKGxmZW5jZV9hZnRlcl9sb2FkKTogTmV3LgotCShsZmVuY2VfYmVmb3JlX2luZGlyZWN0
X2JyYW5jaF9raW5kKTogTmV3LgotCShsZmVuY2VfYmVmb3JlX2luZGlyZWN0X2JyYW5jaCk6IE5l
dy4KLQkobGZlbmNlX2JlZm9yZV9yZXRfa2luZCk6IE5ldy4KLQkobGZlbmNlX2JlZm9yZV9yZXQp
OiBOZXcuCi0JKGxhc3RfaW5zbik6IE5ldy4KLQkobG9hZF9pbnNuX3ApOiBOZXcuCi0JKGluc2Vy
dF9sZmVuY2VfYWZ0ZXIpOiBOZXcuCi0JKGluc2VydF9sZmVuY2VfYmVmb3JlKTogTmV3LgotCSht
ZF9hc3NlbWJsZSk6IENhbGwgaW5zZXJ0X2xmZW5jZV9iZWZvcmUgYW5kIGluc2VydF9sZmVuY2Vf
YWZ0ZXIuCi0JU2V0IGxhc3RfaW5zbi4KLQkoT1BUSU9OX01MRkVOQ0VfQUZURVJfTE9BRCk6IE5l
dy4KLQkoT1BUSU9OX01MRkVOQ0VfQkVGT1JFX0lORElSRUNUX0JSQU5DSCk6IE5ldy4KLQkoT1BU
SU9OX01MRkVOQ0VfQkVGT1JFX1JFVCk6IE5ldy4KLQkobWRfbG9uZ29wdHMpOiBBZGQgLW1sZmVu
Y2UtYWZ0ZXItbG9hZD0sCi0JLW1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD0gYW5kIC1t
bGZlbmNlLWJlZm9yZS1yZXQ9LgotCShtZF9wYXJzZV9vcHRpb24pOiBIYW5kbGUgLW1sZmVuY2Ut
YWZ0ZXItbG9hZD0sCi0JLW1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD0gYW5kIC1tbGZl
bmNlLWJlZm9yZS1yZXQ9LgotCShtZF9zaG93X3VzYWdlKTogRGlzcGxheSAtbWxmZW5jZS1hZnRl
ci1sb2FkPSwKLQktbWxmZW5jZS1iZWZvcmUtaW5kaXJlY3QtYnJhbmNoPSBhbmQgLW1sZmVuY2Ut
YmVmb3JlLXJldD0uCi0JKGkzODZfY29uc19hbGlnbik6IE5ldy4KLQkqIGNvbmZpZy90Yy1pMzg2
LmggKGkzODZfY29uc19hbGlnbik6IE5ldy4KLQkobWRfY29uc19hbGlnbik6IE5ldy4KLQkqIGRv
Yy9jLWkzODYudGV4aTogRG9jdW1lbnQgLW1sZmVuY2UtYWZ0ZXItbG9hZD0sCi0JLW1sZmVuY2Ut
YmVmb3JlLWluZGlyZWN0LWJyYW5jaD0gYW5kIC1tbGZlbmNlLWJlZm9yZS1yZXQ9LgotCi1TaWdu
ZWQtb2ZmLWJ5OiBBbnVqIE1pdHRhbCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86YW51ai5taXR0YWxAaW50ZWwuY29tIj4mbHQ7YW51ai5taXR0YWxAaW50ZWwu
Y29tJmd0OzwvYT4KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWzxhIGNsYXNzPSJtb3otdHh0
LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0
aWxzLWdkYi5naXQ7YT1jb21taXQ7aD1hZTUzMTA0MWM3YzU5NTY2NzIzNDJmODljNDg2YTAxMWM4
NGYwMjdmIj5odHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0O2E9
Y29tbWl0O2g9YWU1MzEwNDFjN2M1OTU2NjcyMzQyZjg5YzQ4NmEwMTFjODRmMDI3ZjwvYT5dCi1D
VkU6IENWRS0yMDIwLTA1NTEKLS0tLQotZGlmZiAtLWdpdCBhL2dhcy9jb25maWcvdGMtaTM4Ni5j
IGIvZ2FzL2NvbmZpZy90Yy1pMzg2LmMKLWluZGV4IGIwMjBmMzljODYzLi4wOTA2M2Y3ODRiNyAx
MDA2NDQKLS0tLSBhL2dhcy9jb25maWcvdGMtaTM4Ni5jCi0rKysgYi9nYXMvY29uZmlnL3RjLWkz
ODYuYwotQEAgLTYyOSw3ICs2MjksMjkgQEAgc3RhdGljIGludCBvbWl0X2xvY2tfcHJlZml4ID0g
MDsKLSAgICAibG9jayBhZGRsICQwLCAoJXtyZX1zcCkiLiAgKi8KLSBzdGF0aWMgaW50IGF2b2lk
X2ZlbmNlID0gMDsKLSAKLS0vKiBUeXBlIG9mIHRoZSBwcmV2aW91cyBpbnN0cnVjdGlvbi4gICov
Ci0rLyogMSBpZiBsZmVuY2Ugc2hvdWxkIGJlIGluc2VydGVkIGFmdGVyIGV2ZXJ5IGxvYWQuICAq
LwotK3N0YXRpYyBpbnQgbGZlbmNlX2FmdGVyX2xvYWQgPSAwOwotKwotKy8qIE5vbi16ZXJvIGlm
IGxmZW5jZSBzaG91bGQgYmUgaW5zZXJ0ZWQgYmVmb3JlIGluZGlyZWN0IGJyYW5jaC4gICovCi0r
c3RhdGljIGVudW0gbGZlbmNlX2JlZm9yZV9pbmRpcmVjdF9icmFuY2hfa2luZAotKyAgewotKyAg
ICBsZmVuY2VfYnJhbmNoX25vbmUgPSAwLAotKyAgICBsZmVuY2VfYnJhbmNoX3JlZ2lzdGVyLAot
KyAgICBsZmVuY2VfYnJhbmNoX21lbW9yeSwKLSsgICAgbGZlbmNlX2JyYW5jaF9hbGwKLSsgIH0K
LStsZmVuY2VfYmVmb3JlX2luZGlyZWN0X2JyYW5jaDsKLSsKLSsvKiBOb24temVybyBpZiBsZmVu
Y2Ugc2hvdWxkIGJlIGluc2VydGVkIGJlZm9yZSByZXQuICAqLwotK3N0YXRpYyBlbnVtIGxmZW5j
ZV9iZWZvcmVfcmV0X2tpbmQKLSsgIHsKLSsgICAgbGZlbmNlX2JlZm9yZV9yZXRfbm9uZSA9IDAs
Ci0rICAgIGxmZW5jZV9iZWZvcmVfcmV0X25vdCwKLSsgICAgbGZlbmNlX2JlZm9yZV9yZXRfb3IK
LSsgIH0KLStsZmVuY2VfYmVmb3JlX3JldDsKLSsKLSsvKiBUeXBlcyBvZiBwcmV2aW91cyBpbnN0
cnVjdGlvbiBpcyAuYnl0ZSBvciBwcmVmaXguICAqLwotIHN0YXRpYyBzdHJ1Y3QKLSAgIHsKLSAg
ICAgc2VnVCBzZWc7Ci1AQCAtNDMxMSw2ICs0MzMzLDI4MyBAQCBvcHRpbWl6ZV9lbmNvZGluZyAo
dm9pZCkKLSAgICAgfQotIH0KLSAKLSsvKiBSZXR1cm4gbm9uLXplcm8gZm9yIGxvYWQgaW5zdHJ1
Y3Rpb24uICAqLwotKwotK3N0YXRpYyBpbnQKLStsb2FkX2luc25fcCAodm9pZCkKLSt7Ci0rICB1
bnNpZ25lZCBpbnQgZGVzdDsKLSsgIGludCBhbnlfdmV4X3AgPSBpc19hbnlfdmV4X2VuY29kaW5n
ICgmYW1wO2kudG0pOwotKyAgdW5zaWduZWQgaW50IGJhc2Vfb3Bjb2RlID0gaS50bS5iYXNlX29w
Y29kZSB8IDE7Ci0rCi0rICBpZiAoIWFueV92ZXhfcCkKLSsgICAgewotKyAgICAgIC8qIGxlYSAg
Ki8KLSsgICAgICBpZiAoaS50bS5iYXNlX29wY29kZSA9PSAweDhkKQotKwlyZXR1cm4gMDsKLSsK
LSsgICAgICAvKiBwb3AgICovCi0rICAgICAgaWYgKChpLnRtLmJhc2Vfb3Bjb2RlICZhbXA7IH43
KSA9PSAweDU4Ci0rCSAgfHwgKGkudG0uYmFzZV9vcGNvZGUgPT0gMHg4ZiAmYW1wOyZhbXA7IGku
dG0uZXh0ZW5zaW9uX29wY29kZSA9PSAwKSkKLSsJcmV0dXJuIDE7Ci0rCi0rICAgICAgLyogbW92
cywgY21wcywgbG9kcywgc2Nhcy4gICovCi0rICAgICAgaWYgKChpLnRtLmJhc2Vfb3Bjb2RlIHwg
MHhiKSA9PSAweGFmKQotKwlyZXR1cm4gMTsKLSsKLSsgICAgICAvKiBvdXRzICovCi0rICAgICAg
aWYgKGJhc2Vfb3Bjb2RlID09IDB4NmYpCi0rCXJldHVybiAxOwotKyAgICB9Ci0rCi0rICAvKiBO
byBtZW1vcnkgb3BlcmFuZC4gICovCi0rICBpZiAoIWkubWVtX29wZXJhbmRzKQotKyAgICByZXR1
cm4gMDsKLSsKLSsgIGlmIChhbnlfdmV4X3ApCi0rICAgIHsKLSsgICAgICAvKiB2bGRteGNzci4g
ICovCi0rICAgICAgaWYgKGkudG0uYmFzZV9vcGNvZGUgPT0gMHhhZQotKwkgICZhbXA7JmFtcDsg
aS50bS5vcGNvZGVfbW9kaWZpZXIudmV4Ci0rCSAgJmFtcDsmYW1wOyBpLnRtLm9wY29kZV9tb2Rp
Zmllci52ZXhvcGNvZGUgPT0gVkVYMEYKLSsJICAmYW1wOyZhbXA7IGkudG0uZXh0ZW5zaW9uX29w
Y29kZSA9PSAyKQotKwlyZXR1cm4gMTsKLSsgICAgfQotKyAgZWxzZQotKyAgICB7Ci0rICAgICAg
LyogdGVzdCwgbm90LCBuZWcsIG11bCwgaW11bCwgZGl2LCBpZGl2LiAgKi8KLSsgICAgICBpZiAo
KGkudG0uYmFzZV9vcGNvZGUgPT0gMHhmNiB8fCBpLnRtLmJhc2Vfb3Bjb2RlID09IDB4ZjcpCi0r
CSAgJmFtcDsmYW1wOyBpLnRtLmV4dGVuc2lvbl9vcGNvZGUgIT0gMSkKLSsJcmV0dXJuIDE7Ci0r
Ci0rICAgICAgLyogaW5jLCBkZWMuICAqLwotKyAgICAgIGlmIChiYXNlX29wY29kZSA9PSAweGZm
ICZhbXA7JmFtcDsgaS50bS5leHRlbnNpb25fb3Bjb2RlICZsdDs9IDEpCi0rCXJldHVybiAxOwot
KwotKyAgICAgIC8qIGFkZCwgb3IsIGFkYywgc2JiLCBhbmQsIHN1YiwgeG9yLCBjbXAuICAqLwot
KyAgICAgIGlmIChpLnRtLmJhc2Vfb3Bjb2RlICZndDs9IDB4ODAgJmFtcDsmYW1wOyBpLnRtLmJh
c2Vfb3Bjb2RlICZsdDs9IDB4ODMpCi0rCXJldHVybiAxOwotKwotKyAgICAgIC8qIGJ0LCBidHMs
IGJ0ciwgYnRjLiAgKi8KLSsgICAgICBpZiAoaS50bS5iYXNlX29wY29kZSA9PSAweGZiYQotKwkg
ICZhbXA7JmFtcDsgKGkudG0uZXh0ZW5zaW9uX29wY29kZSAmZ3Q7PSA0ICZhbXA7JmFtcDsgaS50
bS5leHRlbnNpb25fb3Bjb2RlICZsdDs9IDcpKQotKwlyZXR1cm4gMTsKLSsKLSsgICAgICAvKiBy
b2wsIHJvciwgcmNsLCByY3IsIHNobC9zYWwsIHNociwgc2FyLiAqLwotKyAgICAgIGlmICgoYmFz
ZV9vcGNvZGUgPT0gMHhjMQotKwkgICB8fCAoaS50bS5iYXNlX29wY29kZSAmZ3Q7PSAweGQwICZh
bXA7JmFtcDsgaS50bS5iYXNlX29wY29kZSAmbHQ7PSAweGQzKSkKLSsJICAmYW1wOyZhbXA7IGku
dG0uZXh0ZW5zaW9uX29wY29kZSAhPSA2KQotKwlyZXR1cm4gMTsKLSsKLSsgICAgICAvKiBjbXB4
Y2hnOGIsIGNtcHhjaGcxNmIsIHhyc3RvcnMuICAqLwotKyAgICAgIGlmIChpLnRtLmJhc2Vfb3Bj
b2RlID09IDB4ZmM3Ci0rCSAgJmFtcDsmYW1wOyAoaS50bS5leHRlbnNpb25fb3Bjb2RlID09IDEg
fHwgaS50bS5leHRlbnNpb25fb3Bjb2RlID09IDMpKQotKwlyZXR1cm4gMTsKLSsKLSsgICAgICAv
KiBmeHJzdG9yLCBsZG14Y3NyLCB4cnN0b3IuICAqLwotKyAgICAgIGlmIChpLnRtLmJhc2Vfb3Bj
b2RlID09IDB4ZmFlCi0rCSAgJmFtcDsmYW1wOyAoaS50bS5leHRlbnNpb25fb3Bjb2RlID09IDEK
LSsJICAgICAgfHwgaS50bS5leHRlbnNpb25fb3Bjb2RlID09IDIKLSsJICAgICAgfHwgaS50bS5l
eHRlbnNpb25fb3Bjb2RlID09IDUpKQotKwlyZXR1cm4gMTsKLSsKLSsgICAgICAvKiBsZ2R0LCBs
aWR0LCBsbXN3LiAgKi8KLSsgICAgICBpZiAoaS50bS5iYXNlX29wY29kZSA9PSAweGYwMQotKwkg
ICZhbXA7JmFtcDsgKGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSAyCi0rCSAgICAgIHx8IGkudG0u
ZXh0ZW5zaW9uX29wY29kZSA9PSAzCi0rCSAgICAgIHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9
PSA2KSkKLSsJcmV0dXJuIDE7Ci0rCi0rICAgICAgLyogdm1wdHJsZCAqLwotKyAgICAgIGlmIChp
LnRtLmJhc2Vfb3Bjb2RlID09IDB4ZmM3Ci0rCSAgJmFtcDsmYW1wOyBpLnRtLmV4dGVuc2lvbl9v
cGNvZGUgPT0gNikKLSsJcmV0dXJuIDE7Ci0rCi0rICAgICAgLyogQ2hlY2sgZm9yIHg4NyBpbnN0
cnVjdGlvbnMuICAqLwotKyAgICAgIGlmIChpLnRtLmJhc2Vfb3Bjb2RlICZndDs9IDB4ZDggJmFt
cDsmYW1wOyBpLnRtLmJhc2Vfb3Bjb2RlICZsdDs9IDB4ZGYpCi0rCXsKLSsJICAvKiBTa2lwIGZz
dCwgZnN0cCwgZnN0ZW52LCBmc3Rjdy4gICovCi0rCSAgaWYgKGkudG0uYmFzZV9vcGNvZGUgPT0g
MHhkOQotKwkgICAgICAmYW1wOyZhbXA7IChpLnRtLmV4dGVuc2lvbl9vcGNvZGUgPT0gMgotKwkJ
ICB8fCBpLnRtLmV4dGVuc2lvbl9vcGNvZGUgPT0gMwotKwkJICB8fCBpLnRtLmV4dGVuc2lvbl9v
cGNvZGUgPT0gNgotKwkJICB8fCBpLnRtLmV4dGVuc2lvbl9vcGNvZGUgPT0gNykpCi0rCSAgICBy
ZXR1cm4gMDsKLSsKLSsJICAvKiBTa2lwIGZpc3R0cCwgZmlzdCwgZmlzdHAsIGZzdHAuICAqLwot
KwkgIGlmIChpLnRtLmJhc2Vfb3Bjb2RlID09IDB4ZGIKLSsJICAgICAgJmFtcDsmYW1wOyAoaS50
bS5leHRlbnNpb25fb3Bjb2RlID09IDEKLSsJCSAgfHwgaS50bS5leHRlbnNpb25fb3Bjb2RlID09
IDIKLSsJCSAgfHwgaS50bS5leHRlbnNpb25fb3Bjb2RlID09IDMKLSsJCSAgfHwgaS50bS5leHRl
bnNpb25fb3Bjb2RlID09IDcpKQotKwkgICAgcmV0dXJuIDA7Ci0rCi0rCSAgLyogU2tpcCBmaXN0
dHAsIGZzdCwgZnN0cCwgZnNhdmUsIGZzdHN3LiAgKi8KLSsJICBpZiAoaS50bS5iYXNlX29wY29k
ZSA9PSAweGRkCi0rCSAgICAgICZhbXA7JmFtcDsgKGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSAx
Ci0rCQkgIHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSAyCi0rCQkgIHx8IGkudG0uZXh0ZW5z
aW9uX29wY29kZSA9PSAzCi0rCQkgIHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSA2Ci0rCQkg
IHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSA3KSkKLSsJICAgIHJldHVybiAwOwotKwotKwkg
IC8qIFNraXAgZmlzdHRwLCBmaXN0LCBmaXN0cCwgZmJzdHAsIGZpc3RwLiAgKi8KLSsJICBpZiAo
aS50bS5iYXNlX29wY29kZSA9PSAweGRmCi0rCSAgICAgICZhbXA7JmFtcDsgKGkudG0uZXh0ZW5z
aW9uX29wY29kZSA9PSAxCi0rCQkgIHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSAyCi0rCQkg
IHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSAzCi0rCQkgIHx8IGkudG0uZXh0ZW5zaW9uX29w
Y29kZSA9PSA2Ci0rCQkgIHx8IGkudG0uZXh0ZW5zaW9uX29wY29kZSA9PSA3KSkKLSsJICAgIHJl
dHVybiAwOwotKwotKwkgIHJldHVybiAxOwotKwl9Ci0rICAgIH0KLSsKLSsgIGRlc3QgPSBpLm9w
ZXJhbmRzIC0gMTsKLSsKLSsgIC8qIENoZWNrIGZha2UgaW1tOCBvcGVyYW5kIGFuZCAzIHNvdXJj
ZSBvcGVyYW5kcy4gICovCi0rICBpZiAoKGkudG0ub3Bjb2RlX21vZGlmaWVyLmltbWV4dAotKyAg
ICAgICB8fCBpLnRtLm9wY29kZV9tb2RpZmllci52ZXhzb3VyY2VzID09IFZFWDNTT1VSQ0VTKQot
KyAgICAgICZhbXA7JmFtcDsgaS50eXBlc1tkZXN0XS5iaXRmaWVsZC5pbW04KQotKyAgICBkZXN0
LS07Ci0rCi0rICAvKiBhZGQsIG9yLCBhZGMsIHNiYiwgYW5kLCBzdWIsIHhvciwgY21wLCB0ZXN0
LCB4Y2hnLCB4YWRkICAqLwotKyAgaWYgKCFhbnlfdmV4X3AKLSsgICAgICAmYW1wOyZhbXA7IChi
YXNlX29wY29kZSA9PSAweDEKLSsJICB8fCBiYXNlX29wY29kZSA9PSAweDkKLSsJICB8fCBiYXNl
X29wY29kZSA9PSAweDExCi0rCSAgfHwgYmFzZV9vcGNvZGUgPT0gMHgxOQotKwkgIHx8IGJhc2Vf
b3Bjb2RlID09IDB4MjEKLSsJICB8fCBiYXNlX29wY29kZSA9PSAweDI5Ci0rCSAgfHwgYmFzZV9v
cGNvZGUgPT0gMHgzMQotKwkgIHx8IGJhc2Vfb3Bjb2RlID09IDB4MzkKLSsJICB8fCAoaS50bS5i
YXNlX29wY29kZSAmZ3Q7PSAweDg0ICZhbXA7JmFtcDsgaS50bS5iYXNlX29wY29kZSAmbHQ7PSAw
eDg3KQotKwkgIHx8IGJhc2Vfb3Bjb2RlID09IDB4ZmMxKSkKLSsgICAgcmV0dXJuIDE7Ci0rCi0r
ICAvKiBDaGVjayBmb3IgbG9hZCBpbnN0cnVjdGlvbi4gICovCi0rICByZXR1cm4gKGkudHlwZXNb
ZGVzdF0uYml0ZmllbGQuY2xhc3MgIT0gQ2xhc3NOb25lCi0rCSAgfHwgaS50eXBlc1tkZXN0XS5i
aXRmaWVsZC5pbnN0YW5jZSA9PSBBY2N1bSk7Ci0rfQotKwotKy8qIE91dHB1dCBsZmVuY2UsIDB4
ZmFlZTgsIGFmdGVyIGluc3RydWN0aW9uLiAgKi8KLSsKLStzdGF0aWMgdm9pZAotK2luc2VydF9s
ZmVuY2VfYWZ0ZXIgKHZvaWQpCi0rewotKyAgaWYgKGxmZW5jZV9hZnRlcl9sb2FkICZhbXA7JmFt
cDsgbG9hZF9pbnNuX3AgKCkpCi0rICAgIHsKLSsgICAgICBjaGFyICpwID0gZnJhZ19tb3JlICgz
KTsKLSsgICAgICAqcCsrID0gMHhmOwotKyAgICAgICpwKysgPSAweGFlOwotKyAgICAgICpwID0g
MHhlODsKLSsgICAgfQotK30KLSsKLSsvKiBPdXRwdXQgbGZlbmNlLCAweGZhZWU4LCBiZWZvcmUg
aW5zdHJ1Y3Rpb24uICAqLwotKwotK3N0YXRpYyB2b2lkCi0raW5zZXJ0X2xmZW5jZV9iZWZvcmUg
KHZvaWQpCi0rewotKyAgY2hhciAqcDsKLSsKLSsgIGlmIChpc19hbnlfdmV4X2VuY29kaW5nICgm
YW1wO2kudG0pKQotKyAgICByZXR1cm47Ci0rCi0rICBpZiAoaS50bS5iYXNlX29wY29kZSA9PSAw
eGZmCi0rICAgICAgJmFtcDsmYW1wOyAoaS50bS5leHRlbnNpb25fb3Bjb2RlID09IDIgfHwgaS50
bS5leHRlbnNpb25fb3Bjb2RlID09IDQpKQotKyAgICB7Ci0rICAgICAgLyogSW5zZXJ0IGxmZW5j
ZSBiZWZvcmUgaW5kaXJlY3QgYnJhbmNoIGlmIG5lZWRlZC4gICovCi0rCi0rICAgICAgaWYgKGxm
ZW5jZV9iZWZvcmVfaW5kaXJlY3RfYnJhbmNoID09IGxmZW5jZV9icmFuY2hfbm9uZSkKLSsJcmV0
dXJuOwotKwotKyAgICAgIGlmIChpLm9wZXJhbmRzICE9IDEpCi0rCWFib3J0ICgpOwotKwotKyAg
ICAgIGlmIChpLnJlZ19vcGVyYW5kcyA9PSAxKQotKwl7Ci0rCSAgLyogSW5kaXJlY3QgYnJhbmNo
IHZpYSByZWdpc3Rlci4gIERvbid0IGluc2VydCBsZmVuY2Ugd2l0aAotKwkgICAgIC1tbGZlbmNl
LWFmdGVyLWxvYWQ9eWVzLiAgKi8KLSsJICBpZiAobGZlbmNlX2FmdGVyX2xvYWQKLSsJICAgICAg
fHwgbGZlbmNlX2JlZm9yZV9pbmRpcmVjdF9icmFuY2ggPT0gbGZlbmNlX2JyYW5jaF9tZW1vcnkp
Ci0rCSAgICByZXR1cm47Ci0rCX0KLSsgICAgICBlbHNlIGlmIChpLm1lbV9vcGVyYW5kcyA9PSAx
Ci0rCSAgICAgICAmYW1wOyZhbXA7IGxmZW5jZV9iZWZvcmVfaW5kaXJlY3RfYnJhbmNoICE9IGxm
ZW5jZV9icmFuY2hfcmVnaXN0ZXIpCi0rCXsKLSsJICBhc193YXJuIChfKCJpbmRpcmVjdCBgJXNg
IHdpdGggbWVtb3J5IG9wZXJhbmQgc2hvdWxkIGJlIGF2b2lkZWQiKSwKLSsJCSAgIGkudG0ubmFt
ZSk7Ci0rCSAgcmV0dXJuOwotKwl9Ci0rICAgICAgZWxzZQotKwlyZXR1cm47Ci0rCi0rICAgICAg
aWYgKGxhc3RfaW5zbi5raW5kICE9IGxhc3RfaW5zbl9vdGhlcgotKwkgICZhbXA7JmFtcDsgbGFz
dF9pbnNuLnNlZyA9PSBub3dfc2VnKQotKwl7Ci0rCSAgYXNfd2Fybl93aGVyZSAobGFzdF9pbnNu
LmZpbGUsIGxhc3RfaW5zbi5saW5lLAotKwkJCSBfKCJgJXNgIHNraXBzIC1tbGZlbmNlLWJlZm9y
ZS1pbmRpcmVjdC1icmFuY2ggb24gYCVzYCIpLAotKwkJCSBsYXN0X2luc24ubmFtZSwgaS50bS5u
YW1lKTsKLSsJICByZXR1cm47Ci0rCX0KLSsKLSsgICAgICBwID0gZnJhZ19tb3JlICgzKTsKLSsg
ICAgICAqcCsrID0gMHhmOwotKyAgICAgICpwKysgPSAweGFlOwotKyAgICAgICpwID0gMHhlODsK
LSsgICAgICByZXR1cm47Ci0rICAgIH0KLSsKLSsgIC8qIE91dHB1dCBvci9ub3QgYW5kIGxmZW5j
ZSBiZWZvcmUgcmV0LiAgKi8KLSsgIGlmIChsZmVuY2VfYmVmb3JlX3JldCAhPSBsZmVuY2VfYmVm
b3JlX3JldF9ub25lCi0rICAgICAgJmFtcDsmYW1wOyAoaS50bS5iYXNlX29wY29kZSA9PSAweGMy
Ci0rCSAgfHwgaS50bS5iYXNlX29wY29kZSA9PSAweGMzCi0rCSAgfHwgaS50bS5iYXNlX29wY29k
ZSA9PSAweGNhCi0rCSAgfHwgaS50bS5iYXNlX29wY29kZSA9PSAweGNiKSkKLSsgICAgewotKyAg
ICAgIGlmIChsYXN0X2luc24ua2luZCAhPSBsYXN0X2luc25fb3RoZXIKLSsJICAmYW1wOyZhbXA7
IGxhc3RfaW5zbi5zZWcgPT0gbm93X3NlZykKLSsJewotKwkgIGFzX3dhcm5fd2hlcmUgKGxhc3Rf
aW5zbi5maWxlLCBsYXN0X2luc24ubGluZSwKLSsJCQkgXygiYCVzYCBza2lwcyAtbWxmZW5jZS1i
ZWZvcmUtcmV0IG9uIGAlc2AiKSwKLSsJCQkgbGFzdF9pbnNuLm5hbWUsIGkudG0ubmFtZSk7Ci0r
CSAgcmV0dXJuOwotKwl9Ci0rICAgICAgaWYgKGxmZW5jZV9iZWZvcmVfcmV0ID09IGxmZW5jZV9i
ZWZvcmVfcmV0X29yKQotKwl7Ci0rCSAgLyogb3JsOiAweDgzMGMyNDAwLiAgKi8KLSsJICBwID0g
ZnJhZ19tb3JlICgoZmxhZ19jb2RlID09IENPREVfNjRCSVQgPyAxIDogMCkgKyA0ICsgMyk7Ci0r
CSAgaWYgKGZsYWdfY29kZSA9PSBDT0RFXzY0QklUKQotKwkgICAgKnArKyA9IDB4NDg7Ci0rCSAg
KnArKyA9IDB4ODM7Ci0rCSAgKnArKyA9IDB4YzsKLSsJICAqcCsrID0gMHgyNDsKLSsJICAqcCsr
ID0gMHgwOwotKwl9Ci0rICAgICAgZWxzZQotKwl7Ci0rCSAgcCA9IGZyYWdfbW9yZSAoKGZsYWdf
Y29kZSA9PSBDT0RFXzY0QklUID8gMiA6IDApICsgNiArIDMpOwotKwkgIC8qIG5vdGw6IDB4Zjcx
NDI0LiAgKi8KLSsJICBpZiAoZmxhZ19jb2RlID09IENPREVfNjRCSVQpCi0rCSAgICAqcCsrID0g
MHg0ODsKLSsJICAqcCsrID0gMHhmNzsKLSsJICAqcCsrID0gMHgxNDsKLSsJICAqcCsrID0gMHgy
NDsKLSsJICAvKiBub3RsOiAweGY3MTQyNC4gICovCi0rCSAgaWYgKGZsYWdfY29kZSA9PSBDT0RF
XzY0QklUKQotKwkgICAgKnArKyA9IDB4NDg7Ci0rCSAgKnArKyA9IDB4Zjc7Ci0rCSAgKnArKyA9
IDB4MTQ7Ci0rCSAgKnArKyA9IDB4MjQ7Ci0rCX0KLSsgICAgICAqcCsrID0gMHhmOwotKyAgICAg
ICpwKysgPSAweGFlOwotKyAgICAgICpwID0gMHhlODsKLSsgICAgfQotK30KLSsKLSAvKiBUaGlz
IGlzIHRoZSBndXRzIG9mIHRoZSBtYWNoaW5lLWRlcGVuZGVudCBhc3NlbWJsZXIuICBMSU5FIHBv
aW50cyB0byBhCi0gICAgbWFjaGluZSBkZXBlbmRlbnQgaW5zdHJ1Y3Rpb24uICBUaGlzIGZ1bmN0
aW9uIGlzIHN1cHBvc2VkIHRvIGVtaXQKLSAgICB0aGUgZnJhZ3MvYnl0ZXMgaXQgYXNzZW1ibGVz
IHRvLiAgKi8KLUBAIC00NjI4LDkgKzQ5MjcsMTMgQEAgbWRfYXNzZW1ibGUgKGNoYXIgKmxpbmUp
Ci0gICBpZiAoaS5yZXggIT0gMCkKLSAgICAgYWRkX3ByZWZpeCAoUkVYX09QQ09ERSB8IGkucmV4
KTsKLSAKLSsgIGluc2VydF9sZmVuY2VfYmVmb3JlICgpOwotKwotICAgLyogV2UgYXJlIHJlYWR5
IHRvIG91dHB1dCB0aGUgaW5zbi4gICovCi0gICBvdXRwdXRfaW5zbiAoKTsKLSAKLSsgIGluc2Vy
dF9sZmVuY2VfYWZ0ZXIgKCk7Ci0rCi0gICBsYXN0X2luc24uc2VnID0gbm93X3NlZzsKLSAKLSAg
IGlmIChpLnRtLm9wY29kZV9tb2RpZmllci5pc3ByZWZpeCkKLUBAIC0xMjI1MCw2ICsxMjU1Myw5
IEBAIGNvbnN0IGNoYXIgKm1kX3Nob3J0b3B0cyA9ICJxbk86OiI7Ci0gI2RlZmluZSBPUFRJT05f
TUFMSUdOX0JSQU5DSF9QUkVGSVhfU0laRSAoT1BUSU9OX01EX0JBU0UgKyAyOCkKLSAjZGVmaW5l
IE9QVElPTl9NQUxJR05fQlJBTkNIIChPUFRJT05fTURfQkFTRSArIDI5KQotICNkZWZpbmUgT1BU
SU9OX01CUkFOQ0hFU19XSVRIXzMyQl9CT1VOREFSSUVTIChPUFRJT05fTURfQkFTRSArIDMwKQot
KyNkZWZpbmUgT1BUSU9OX01MRkVOQ0VfQUZURVJfTE9BRCAoT1BUSU9OX01EX0JBU0UgKyAzMSkK
LSsjZGVmaW5lIE9QVElPTl9NTEZFTkNFX0JFRk9SRV9JTkRJUkVDVF9CUkFOQ0ggKE9QVElPTl9N
RF9CQVNFICsgMzIpCi0rI2RlZmluZSBPUFRJT05fTUxGRU5DRV9CRUZPUkVfUkVUIChPUFRJT05f
TURfQkFTRSArIDMzKQotIAotIHN0cnVjdCBvcHRpb24gbWRfbG9uZ29wdHNbXSA9Ci0gewotQEAg
LTEyMjg5LDYgKzEyNTk1LDEwIEBAIHN0cnVjdCBvcHRpb24gbWRfbG9uZ29wdHNbXSA9Ci0gICB7
Im1hbGlnbi1icmFuY2gtcHJlZml4LXNpemUiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BU
SU9OX01BTElHTl9CUkFOQ0hfUFJFRklYX1NJWkV9LAotICAgeyJtYWxpZ24tYnJhbmNoIiwgcmVx
dWlyZWRfYXJndW1lbnQsIE5VTEwsIE9QVElPTl9NQUxJR05fQlJBTkNIfSwKLSAgIHsibWJyYW5j
aGVzLXdpdGhpbi0zMkItYm91bmRhcmllcyIsIG5vX2FyZ3VtZW50LCBOVUxMLCBPUFRJT05fTUJS
QU5DSEVTX1dJVEhfMzJCX0JPVU5EQVJJRVN9LAotKyAgeyJtbGZlbmNlLWFmdGVyLWxvYWQiLCBy
ZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BUSU9OX01MRkVOQ0VfQUZURVJfTE9BRH0sCi0rICB7
Im1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaCIsIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxM
LAotKyAgIE9QVElPTl9NTEZFTkNFX0JFRk9SRV9JTkRJUkVDVF9CUkFOQ0h9LAotKyAgeyJtbGZl
bmNlLWJlZm9yZS1yZXQiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgT1BUSU9OX01MRkVOQ0Vf
QkVGT1JFX1JFVH0sCi0gICB7Im1hbWQ2NCIsIG5vX2FyZ3VtZW50LCBOVUxMLCBPUFRJT05fTUFN
RDY0fSwKLSAgIHsibWludGVsNjQiLCBub19hcmd1bWVudCwgTlVMTCwgT1BUSU9OX01JTlRFTDY0
fSwKLSAgIHtOVUxMLCBub19hcmd1bWVudCwgTlVMTCwgMH0KLUBAIC0xMjY2OCw2ICsxMjk3OCw0
MSBAQCBtZF9wYXJzZV9vcHRpb24gKGludCBjLCBjb25zdCBjaGFyICphcmcpCi0gICAgICAgICBh
c19mYXRhbCAoXygiaW52YWxpZCAtbWZlbmNlLWFzLWxvY2stYWRkPSBvcHRpb246IGAlcyciKSwg
YXJnKTsKLSAgICAgICBicmVhazsKLSAKLSsgICAgY2FzZSBPUFRJT05fTUxGRU5DRV9BRlRFUl9M
T0FEOgotKyAgICAgIGlmIChzdHJjYXNlY21wIChhcmcsICJ5ZXMiKSA9PSAwKQotKwlsZmVuY2Vf
YWZ0ZXJfbG9hZCA9IDE7Ci0rICAgICAgZWxzZSBpZiAoc3RyY2FzZWNtcCAoYXJnLCAibm8iKSA9
PSAwKQotKwlsZmVuY2VfYWZ0ZXJfbG9hZCA9IDA7Ci0rICAgICAgZWxzZQotKyAgICAgICAgYXNf
ZmF0YWwgKF8oImludmFsaWQgLW1sZmVuY2UtYWZ0ZXItbG9hZD0gb3B0aW9uOiBgJXMnIiksIGFy
Zyk7Ci0rICAgICAgYnJlYWs7Ci0rCi0rICAgIGNhc2UgT1BUSU9OX01MRkVOQ0VfQkVGT1JFX0lO
RElSRUNUX0JSQU5DSDoKLSsgICAgICBpZiAoc3RyY2FzZWNtcCAoYXJnLCAiYWxsIikgPT0gMCkK
LSsJbGZlbmNlX2JlZm9yZV9pbmRpcmVjdF9icmFuY2ggPSBsZmVuY2VfYnJhbmNoX2FsbDsKLSsg
ICAgICBlbHNlIGlmIChzdHJjYXNlY21wIChhcmcsICJtZW1vcnkiKSA9PSAwKQotKwlsZmVuY2Vf
YmVmb3JlX2luZGlyZWN0X2JyYW5jaCA9IGxmZW5jZV9icmFuY2hfbWVtb3J5OwotKyAgICAgIGVs
c2UgaWYgKHN0cmNhc2VjbXAgKGFyZywgInJlZ2lzdGVyIikgPT0gMCkKLSsJbGZlbmNlX2JlZm9y
ZV9pbmRpcmVjdF9icmFuY2ggPSBsZmVuY2VfYnJhbmNoX3JlZ2lzdGVyOwotKyAgICAgIGVsc2Ug
aWYgKHN0cmNhc2VjbXAgKGFyZywgIm5vbmUiKSA9PSAwKQotKwlsZmVuY2VfYmVmb3JlX2luZGly
ZWN0X2JyYW5jaCA9IGxmZW5jZV9icmFuY2hfbm9uZTsKLSsgICAgICBlbHNlCi0rICAgICAgICBh
c19mYXRhbCAoXygiaW52YWxpZCAtbWxmZW5jZS1iZWZvcmUtaW5kaXJlY3QtYnJhbmNoPSBvcHRp
b246IGAlcyciKSwKLSsJCSAgYXJnKTsKLSsgICAgICBicmVhazsKLSsKLSsgICAgY2FzZSBPUFRJ
T05fTUxGRU5DRV9CRUZPUkVfUkVUOgotKyAgICAgIGlmIChzdHJjYXNlY21wIChhcmcsICJvciIp
ID09IDApCi0rCWxmZW5jZV9iZWZvcmVfcmV0ID0gbGZlbmNlX2JlZm9yZV9yZXRfb3I7Ci0rICAg
ICAgZWxzZSBpZiAoc3RyY2FzZWNtcCAoYXJnLCAibm90IikgPT0gMCkKLSsJbGZlbmNlX2JlZm9y
ZV9yZXQgPSBsZmVuY2VfYmVmb3JlX3JldF9ub3Q7Ci0rICAgICAgZWxzZSBpZiAoc3RyY2FzZWNt
cCAoYXJnLCAibm9uZSIpID09IDApCi0rCWxmZW5jZV9iZWZvcmVfcmV0ID0gbGZlbmNlX2JlZm9y
ZV9yZXRfbm9uZTsKLSsgICAgICBlbHNlCi0rICAgICAgICBhc19mYXRhbCAoXygiaW52YWxpZCAt
bWxmZW5jZS1iZWZvcmUtcmV0PSBvcHRpb246IGAlcyciKSwKLSsJCSAgYXJnKTsKLSsgICAgICBi
cmVhazsKLSsKLSAgICAgY2FzZSBPUFRJT05fTVJFTEFYX1JFTE9DQVRJT05TOgotICAgICAgIGlm
IChzdHJjYXNlY21wIChhcmcsICJ5ZXMiKSA9PSAwKQotICAgICAgICAgZ2VuZXJhdGVfcmVsYXhf
cmVsb2NhdGlvbnMgPSAxOwotQEAgLTEzMDI1LDYgKzEzMzcwLDE1IEBAIG1kX3Nob3dfdXNhZ2Ug
KEZJTEUgKnN0cmVhbSkKLSAgIC1tYnJhbmNoZXMtd2l0aGluLTMyQi1ib3VuZGFyaWVzXG5cCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICBhbGlnbiBicmFuY2hlcyB3aXRoaW4gMzIgYnl0ZSBi
b3VuZGFyeVxuIikpOwotICAgZnByaW50ZiAoc3RyZWFtLCBfKCJcCi0rICAtbWxmZW5jZS1hZnRl
ci1sb2FkPVtub3x5ZXNdIChkZWZhdWx0OiBubylcblwKLSsgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdlbmVyYXRlIGxmZW5jZSBhZnRlciBsb2FkXG4iKSk7Ci0rICBmcHJpbnRmIChzdHJlYW0s
IF8oIlwKLSsgIC1tbGZlbmNlLWJlZm9yZS1pbmRpcmVjdC1icmFuY2g9W25vbmV8YWxsfHJlZ2lz
dGVyfG1lbW9yeV0gKGRlZmF1bHQ6IG5vbmUpXG5cCi0rICAgICAgICAgICAgICAgICAgICAgICAg
ICBnZW5lcmF0ZSBsZmVuY2UgYmVmb3JlIGluZGlyZWN0IG5lYXIgYnJhbmNoXG4iKSk7Ci0rICBm
cHJpbnRmIChzdHJlYW0sIF8oIlwKLSsgIC1tbGZlbmNlLWJlZm9yZS1yZXQ9W25vbmV8b3J8bm90
XSAoZGVmYXVsdDogbm9uZSlcblwKLSsgICAgICAgICAgICAgICAgICAgICAgICAgIGdlbmVyYXRl
IGxmZW5jZSBiZWZvcmUgcmV0XG4iKSk7Ci0rICBmcHJpbnRmIChzdHJlYW0sIF8oIlwKLSAgIC1t
YW1kNjQgICAgICAgICAgICAgICAgIGFjY2VwdCBvbmx5IEFNRDY0IElTQSBbZGVmYXVsdF1cbiIp
KTsKLSAgIGZwcmludGYgKHN0cmVhbSwgXygiXAotICAgLW1pbnRlbDY0ICAgICAgICAgICAgICAg
YWNjZXB0IG9ubHkgSW50ZWw2NCBJU0FcbjxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzopKTstQEAtMTMyNTQsNisxMzYwOCwxNkBAaTM4Nl9jb25zX2FsaWduKGlu
dGlnbm9yZUFUVFJJQlVURV9VTlVTRUQpLWxhc3RfaW5zbi5raW5kPWxhc3RfaW5zbl9kaXJlY3Rp
dmU7LWxhc3RfaW5zbi5uYW1lPSI+IikpOwotQEAgLTEzMjU0LDYgKzEzNjA4LDE2IEBAIGkzODZf
Y29uc19hbGlnbiAoaW50IGlnbm9yZSBBVFRSSUJVVEVfVU5VU0VEKQotICAgICAgIGxhc3RfaW5z
bi5raW5kID0gbGFzdF9pbnNuX2RpcmVjdGl2ZTsKLSAgICAgICBsYXN0X2luc24ubmFtZSA9ICI8
L2E+Y29uc3RhbnQgZGlyZWN0aXZlIjsKLSAgICAgICBsYXN0X2luc24uZmlsZSA9IGFzX3doZXJl
ICgmYW1wO2xhc3RfaW5zbi5saW5lKTsKLSsgICAgICBpZiAobGZlbmNlX2JlZm9yZV9yZXQgIT0g
bGZlbmNlX2JlZm9yZV9yZXRfbm9uZSkKLSsJewotKwkgIGlmIChsZmVuY2VfYmVmb3JlX2luZGly
ZWN0X2JyYW5jaCAhPSBsZmVuY2VfYnJhbmNoX25vbmUpCi0rCSAgICBhc193YXJuIChfKCJjb25z
dGFudCBkaXJlY3RpdmUgc2tpcHMgLW1sZmVuY2UtYmVmb3JlLXJldCAiCi0rCQkgICAgICAgImFu
ZCAtbWxmZW5jZS1iZWZvcmUtaW5kaXJlY3QtYnJhbmNoIikpOwotKwkgIGVsc2UKLSsJICAgIGFz
X3dhcm4gKF8oImNvbnN0YW50IGRpcmVjdGl2ZSBza2lwcyAtbWxmZW5jZS1iZWZvcmUtcmV0Iikp
OwotKwl9Ci0rICAgICAgZWxzZSBpZiAobGZlbmNlX2JlZm9yZV9pbmRpcmVjdF9icmFuY2ggIT0g
bGZlbmNlX2JyYW5jaF9ub25lKQotKwlhc193YXJuIChfKCJjb25zdGFudCBkaXJlY3RpdmUgc2tp
cHMgLW1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaCIpKTsKLSAgICAgfQotIH0KLSAKLWRp
ZmYgLS1naXQgYS9nYXMvZG9jL2MtaTM4Ni50ZXhpIGIvZ2FzL2RvYy9jLWkzODYudGV4aQotaW5k
ZXggYzUzNjc1OWNiMzguLjFkZDk5ZjkxYmIwIDEwMDY0NAotLS0tIGEvZ2FzL2RvYy9jLWkzODYu
dGV4aQotKysrIGIvZ2FzL2RvYy9jLWkzODYudGV4aQotQEAgLTQ2NCw2ICs0NjQsNDkgQEAgb24g
YW4gaW5zdHJ1Y3Rpb24uICBJdCBpcyBlcXVpdmFsZW50IHRvCi0gQG9wdGlvbnstbWFsaWduLWJy
YW5jaC1wcmVmaXgtc2l6ZT01fS4KLSBUaGUgZGVmYXVsdCBkb2Vzbid0IGFsaWduIGJyYW5jaGVz
LgotIAotK0BjaW5kZXggQHNhbXB7LW1sZmVuY2UtYWZ0ZXItbG9hZD19IG9wdGlvbiwgaTM4Ngot
K0BjaW5kZXggQHNhbXB7LW1sZmVuY2UtYWZ0ZXItbG9hZD19IG9wdGlvbiwgeDg2LTY0Ci0rQGl0
ZW0gLW1sZmVuY2UtYWZ0ZXItbG9hZD1AdmFye25vfQotK0BpdGVteCAtbWxmZW5jZS1hZnRlci1s
b2FkPUB2YXJ7eWVzfQotK1RoZXNlIG9wdGlvbnMgY29udHJvbCB3aGV0aGVyIHRoZSBhc3NlbWJs
ZXIgc2hvdWxkIGdlbmVyYXRlIGxmZW5jZQotK2FmdGVyIGxvYWQgaW5zdHJ1Y3Rpb25zLiAgQG9w
dGlvbnstbWxmZW5jZS1hZnRlci1sb2FkPUB2YXJ7eWVzfX0gd2lsbAotK2dlbmVyYXRlIGxmZW5j
ZS4gIEBvcHRpb257LW1sZmVuY2UtYWZ0ZXItbG9hZD1AdmFye25vfX0gd2lsbCBub3QgZ2VuZXJh
dGUKLStsZmVuY2UsIHdoaWNoIGlzIHRoZSBkZWZhdWx0LgotKwotK0BjaW5kZXggQHNhbXB7LW1s
ZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD19IG9wdGlvbiwgaTM4NgotK0BjaW5kZXggQHNh
bXB7LW1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD19IG9wdGlvbiwgeDg2LTY0Ci0rQGl0
ZW0gLW1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD1AdmFye25vbmV9Ci0rQGl0ZW0gLW1s
ZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD1AdmFye2FsbH0KLStAaXRlbSAtbWxmZW5jZS1i
ZWZvcmUtaW5kaXJlY3QtYnJhbmNoPUB2YXJ7cmVnaXN0ZXJ9Ci0rQGl0ZW14IC1tbGZlbmNlLWJl
Zm9yZS1pbmRpcmVjdC1icmFuY2g9QHZhcnttZW1vcnl9Ci0rVGhlc2Ugb3B0aW9ucyBjb250cm9s
IHdoZXRoZXIgdGhlIGFzc2VtYmxlciBzaG91bGQgZ2VuZXJhdGUgbGZlbmNlCi0rYWZ0ZXIgaW5k
aXJlY3QgbmVhciBicmFuY2ggaW5zdHJ1Y3Rpb25zLgotK0BvcHRpb257LW1sZmVuY2UtYmVmb3Jl
LWluZGlyZWN0LWJyYW5jaD1AdmFye2FsbH19IHdpbGwgZ2VuZXJhdGUgbGZlbmNlCi0rYWZ0ZXIg
aW5kaXJlY3QgbmVhciBicmFuY2ggdmlhIHJlZ2lzdGVyIGFuZCBpc3N1ZSBhIHdhcm5pbmcgYmVm
b3JlCi0raW5kaXJlY3QgbmVhciBicmFuY2ggdmlhIG1lbW9yeS4KLStAb3B0aW9uey1tbGZlbmNl
LWJlZm9yZS1pbmRpcmVjdC1icmFuY2g9QHZhcntyZWdpc3Rlcn19IHdpbGwgZ2VuZXJhdGUKLSts
ZmVuY2UgYWZ0ZXIgaW5kaXJlY3QgbmVhciBicmFuY2ggdmlhIHJlZ2lzdGVyLgotK0BvcHRpb257
LW1sZmVuY2UtYmVmb3JlLWluZGlyZWN0LWJyYW5jaD1AdmFye21lbW9yeX19IHdpbGwgaXNzdWUg
YQotK3dhcm5pbmcgYmVmb3JlIGluZGlyZWN0IG5lYXIgYnJhbmNoIHZpYSBtZW1vcnkuCi0rQG9w
dGlvbnstbWxmZW5jZS1iZWZvcmUtaW5kaXJlY3QtYnJhbmNoPUB2YXJ7bm9uZX19IHdpbGwgbm90
IGdlbmVyYXRlCi0rbGZlbmNlIG5vciBpc3N1ZSB3YXJuaW5nLCB3aGljaCBpcyB0aGUgZGVmYXVs
dC4gIE5vdGUgdGhhdCBsZmVuY2Ugd29uJ3QKLStiZSBnZW5lcmF0ZWQgYmVmb3JlIGluZGlyZWN0
IG5lYXIgYnJhbmNoIHZpYSByZWdpc3RlciB3aXRoCi0rQG9wdGlvbnstbWxmZW5jZS1hZnRlci1s
b2FkPUB2YXJ7eWVzfX0gc2luY2UgbGZlbmNlIHdpbGwgYmUgZ2VuZXJhdGVkCi0rYWZ0ZXIgbG9h
ZGluZyBicmFuY2ggdGFyZ2V0IHJlZ2lzdGVyLgotKwotK0BjaW5kZXggQHNhbXB7LW1sZmVuY2Ut
YmVmb3JlLXJldD19IG9wdGlvbiwgaTM4NgotK0BjaW5kZXggQHNhbXB7LW1sZmVuY2UtYmVmb3Jl
LXJldD19IG9wdGlvbiwgeDg2LTY0Ci0rQGl0ZW0gLW1sZmVuY2UtYmVmb3JlLXJldD1AdmFye25v
bmV9Ci0rQGl0ZW0gLW1sZmVuY2UtYmVmb3JlLXJldD1AdmFye29yfQotK0BpdGVteCAtbWxmZW5j
ZS1iZWZvcmUtcmV0PUB2YXJ7bm90fQotK1RoZXNlIG9wdGlvbnMgY29udHJvbCB3aGV0aGVyIHRo
ZSBhc3NlbWJsZXIgc2hvdWxkIGdlbmVyYXRlIGxmZW5jZQotK2JlZm9yZSByZXQuICBAb3B0aW9u
ey1tbGZlbmNlLWJlZm9yZS1yZXQ9QHZhcntvcn19IHdpbGwgZ2VuZXJhdGUKLStnZW5lcmF0ZSBv
ciBpbnN0cnVjdGlvbiB3aXRoIGxmZW5jZS4KLStAb3B0aW9uey1tbGZlbmNlLWJlZm9yZS1yZXQ9
QHZhcntub3R9fSB3aWxsIGdlbmVyYXRlIG5vdCBpbnN0cnVjdGlvbgotK3dpdGggbGZlbmNlLgot
K0BvcHRpb257LW1sZmVuY2UtYmVmb3JlLXJldD1AdmFye25vbmV9fSB3aWxsIG5vdCBnZW5lcmF0
ZSBsZmVuY2UsCi0rd2hpY2ggaXMgdGhlIGRlZmF1bHQuCi0rCi0gQGNpbmRleCBAc2FtcHstbXg4
Ni11c2VkLW5vdGU9fSBvcHRpb24sIGkzODYKLSBAY2luZGV4IEBzYW1wey1teDg2LXVzZWQtbm90
ZT19IG9wdGlvbiwgeDg2LTY0Ci0gQGl0ZW0gLW14ODYtdXNlZC1ub3RlPUB2YXJ7bm99Ci0tLSAK
LTIuMTguMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0
aWxzXzIuMzQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHNfMi4z
NS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2JpbnV0aWxzL2JpbnV0aWxzXzIuMzQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9iaW51dGlscy9iaW51dGlsc18yLjM1LmJiCjwvcHJlPgogICAgICA8YnI+CiAgICAgIDxm
aWVsZHNldCBjbGFzcz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRzZXQ+CiAgICAgIDxw
cmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CjwvcHJlPgogICAgPC9ibG9ja3F1b3Rl
PgogICAgPGJyPgogIDwvYm9keT4KPC9odG1sPgo=

--------------17047460B27431B495A01220--
