Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 471366FFCD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 21:04:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id b66so1490806itd.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Feb 2018 13:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pmq/nCmXB+2VOKSy4LDcyP3d1ABKM1yN5O8p2smCRaI=;
	b=ot1aJaOkLhH9uyU20ZrQ3C1L8dJkf2YHuCa61ks06zRUJiipIQBMHhhRFLyuM2k/TY
	nyos2PPFn5pHrH1o3QSb9/eJnbcI66LnNkJ4MyhBanLshR6UVTwTZXoU4tJYzMpU4P6b
	0UpWjEGq9jhX1c0wlJCApCgdO2hYOCNfbzKUmm3QFe3OVeqzzggvSozUaW0c7ICgoJBb
	qO1NvkFblBQ+OBV9dXRJFchgQ3YVT5unk2kOjr60MG204DbJ9Mb6tSBCZIHXLRVI/u2U
	MlPgJlaMsGUsCPOELjekHEXu7Uu44cvRHoNbaSdENyGG62kTw9KlmuAB+D0LJoVow++Y
	k70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pmq/nCmXB+2VOKSy4LDcyP3d1ABKM1yN5O8p2smCRaI=;
	b=lTIo9F/etu/TmSbTSi2FdDQRKa5u/fBJVrZw0vEIMbMhHoSyTKf2cz9sfXUlYfl3XB
	TjPcNQfftxwdZ7zIuR0OXvJRGRfOfZz9QwwnejK4SjE2IlMR4e+kYuY+OuPBp5l0VhPk
	tKPeCiTfI8Pp34xVuBffn0Le7Bg6FrpxmlGZKibnUDj/JniJuSYPMkrwp9uZkuvSbXP3
	Obagw4QlP7QNbQKdQPuNb61ZHq7OWDTd6LJAlPtGwC+th641tn34+xKqu4P1BRQf23WQ
	EXIDWdkaEGdAi2eCsbSrje6L7aUwNf8hOlDlEQaaytnAOKPeeuN9qZSnBnU8qm2DOXag
	qf9g==
X-Gm-Message-State: AKwxytfaZmQPn7AXo8SVvZDYc1Z0z64XCwKO1/apNeQVItze5daL7dH2
	Mi25plAMXG7kEURjV2WE/debNsiZw7WTMxnK6kB2dw==
X-Google-Smtp-Source: AH8x227os7s5HIukMkpy2D+wBTLy/QfQDCkkK7qTkd7Bujz0DuNlBX0lZvmzhbCZq0hdNqdDNwTvzGW4j4daUJQyQdE=
X-Received: by 10.36.0.23 with SMTP id 23mr17457569ita.53.1517691896163; Sat,
	03 Feb 2018 13:04:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Sat, 3 Feb 2018 13:04:35 -0800 (PST)
In-Reply-To: <ffea6c04b1daafcc2889ee89e25dbd409ea43102.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
	<ffea6c04b1daafcc2889ee89e25dbd409ea43102.1517286478.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 3 Feb 2018 21:04:35 +0000
Message-ID: <CAJTo0LZ0TFW5csbKtiUDwPdd5u+ye-kTniJNqL3nQ_q5wrYGrA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] binutils: Upgrade to 2.30 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Feb 2018 21:04:56 -0000
Content-Type: multipart/alternative; boundary="001a11c0122e5984010564552e14"

--001a11c0122e5984010564552e14
Content-Type: text/plain; charset="UTF-8"

This is causing glibc on ARM64 to explode:

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tmp/work/aarch64-poky-linux/glibc/2.26-r0/build-aarch64-poky-linux/elf/librtld.os:(.
data.rel.ro+0x498): dangerous relocation: unsupported relocation

Pages more available at
https://autobuilder.yocto.io/builders/nightly-arm64/builds/724/steps/BuildImages/logs/stdio

Ross

On 30 January 2018 at 04:31, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>  .../{binutils-2.29.1.inc => binutils-2.30.inc}     |  2 +-
>  ...n_2.29.1.bb => binutils-cross-canadian_2.30.bb} |  0
>  ...tils-cross_2.29.1.bb => binutils-cross_2.30.bb} |  0
>  ...rosssdk_2.29.1.bb => binutils-crosssdk_2.30.bb} |  0
>  ...nutils-crosssdk-Generate-relocatable-SDKs.patch | 14 ++---
>  ...oss-Do-not-generate-linker-script-directo.patch |  6 +-
>  ...ure-widen-the-regexp-for-SH-architectures.patch | 14 ++---
>  .../0004-Point-scripts-location-to-libdir.patch    |  8 +--
>  ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch | 10 ++--
>  .../binutils/binutils/0006-Use-libtool-2.4.patch   | 66
> ++++++++------------
>  ...7-Add-the-armv5e-architecture-to-binutils.patch |  8 +--
>  ...he-distro-compiler-point-to-the-wrong-ins.patch |  6 +-
>  ...es-of-system-directories-when-cross-linki.patch | 24 ++++----
>  ...-rpath-in-libtool-when-sysroot-is-enabled.patch |  4 +-
>  ...Change-default-emulation-for-mips64-linux.patch | 14 ++---
>  .../0012-Add-support-for-Netlogic-XLP.patch        | 70
> +++++++++++-----------
>  ...ncorrect-assembling-for-ppc-wait-mnemonic.patch | 10 ++--
>  .../binutils/0014-Detect-64-bit-MIPS-targets.patch |  6 +-
>  .../0015-sync-with-OE-libtool-changes.patch        |  4 +-
>  .../{binutils_2.29.1.bb => binutils_2.30.bb}       |  0
>  21 files changed, 127 insertions(+), 141 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.29.1.inc =>
> binutils-2.30.inc} (97%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.1.bb
> => binutils-cross-canadian_2.30.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.29.1.bb =>
> binutils-cross_2.30.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.1.bb =>
> binutils-crosssdk_2.30.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils_2.29.1.bb =>
> binutils_2.30.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 1787a8248d..98b1a2a7ba 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>
>  GCCVERSION ?= "7.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.29%"
> +BINUVERSION ?= "2.30%"
>  GDBVERSION ?= "8.0%"
>  GLIBCVERSION ?= "2.26%"
>  LINUXLIBCVERSION ?= "4.12%"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> b/meta/recipes-devtools/binutils/binutils-2.30.inc
> similarity index 97%
> rename from meta/recipes-devtools/binutils/binutils-2.29.1.inc
> rename to meta/recipes-devtools/binutils/binutils-2.30.inc
> index 07a72e2b5a..74c65f5473 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
> @@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV ?= "90276f15379d380761fc499da2ba24cfb3c12a94"
> +SRCREV ?= "8db5daf9efe8a6174d3b10ac7bba8c178836e9ce"
>  BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=
> binutils-${BINUPV}-branch;protocol=git"
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.29.1.bb b/meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.30.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.29.1.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
> b/meta/recipes-devtools/binutils/binutils-cross_2.30.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.30.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
> b/meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-
> binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/
> binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 0b515d83c7..2df836057d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-
> binutils-crosssdk-Generate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-
> binutils-crosssdk-Generate-relocatable-SDKs.patch
> @@ -1,4 +1,4 @@
> -From 58ac9f95a3d83c29efaf7a8906fb6aefea8c8e79 Mon Sep 17 00:00:00 2001
> +From 2e1b5e24a6759de7f73aa6060a574848d9131b5a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:58:54 +0000
>  Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
> @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
>  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index b6940d376d..a42c4d7a4b 100755
> +index 8732422b3a..1f257e99ca 100755
>  --- a/ld/genscripts.sh
>  +++ b/ld/genscripts.sh
>  @@ -277,6 +277,7 @@ DATA_ALIGNMENT_u="${DATA_
> ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
> @@ -37,16 +37,16 @@ index b6940d376d..a42c4d7a4b 100755
>   ( echo "/* Script for ld -Ur: link w/out relocation, do create
> constructors */"
>     . ${CUSTOMIZER_SCRIPT}
>     . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
> - ) | sed -e '/^ *$/d;s/[       ]*$//' > ldscripts/${EMULATION_NAME}.xu
> + ) | sed -e '/^ *$/d;s/[        ]*$//' > ldscripts/${EMULATION_NAME}.xu
>  +unset PARTIAL_LINKING
>
> - LD_FLAG=
>   DATA_ALIGNMENT=${DATA_ALIGNMENT_}
> + RELOCATING=" "
>  diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> -index d9138bc059..e48faeca43 100644
> +index 9787ab5dac..0c8a93c2c8 100644
>  --- a/ld/scripttempl/elf.sc
>  +++ b/ld/scripttempl/elf.sc
> -@@ -138,8 +138,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> +@@ -139,8 +139,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
>       DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END
> (${SEPARATE_GOTPLT-0}, .);"
>     fi
>   fi
> @@ -58,5 +58,5 @@ index d9138bc059..e48faeca43 100644
>   if test -z "$PLT"; then
>     IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0002-
> binutils-cross-Do-not-generate-linker-script-directo.patch
> b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-
> generate-linker-script-directo.patch
> index 370333d5d0..bac7fb2d1a 100644
> --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-
> generate-linker-script-directo.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-
> generate-linker-script-directo.patch
> @@ -1,4 +1,4 @@
> -From 8f929c616208351d0971d7dfd7574d48d3144603 Mon Sep 17 00:00:00 2001
> +From 58ddf38fa53abb48b69dd76e398c73451ad1a5eb Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Mar 2017 23:37:05 -0800
>  Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
> @@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 23 deletions(-)
>
>  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index a42c4d7a4b..d727b4d07e 100755
> +index 1f257e99ca..1583b73a2b 100755
>  --- a/ld/genscripts.sh
>  +++ b/ld/genscripts.sh
>  @@ -189,29 +189,6 @@ append_to_lib_path()
> @@ -57,5 +57,5 @@ index a42c4d7a4b..d727b4d07e 100755
>     libs=${NATIVE_LIB_DIRS}
>     if [ "x${NATIVE}" = "xyes" ] ; then
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0003-
> configure-widen-the-regexp-for-SH-architectures.patch
> b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-
> for-SH-architectures.patch
> index b6c09ccf19..306afe7018 100644
> --- a/meta/recipes-devtools/binutils/binutils/0003-
> configure-widen-the-regexp-for-SH-architectures.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0003-
> configure-widen-the-regexp-for-SH-architectures.patch
> @@ -1,4 +1,4 @@
> -From e5a806aae02a10290c71deb72f6294c98068368d Mon Sep 17 00:00:00 2001
> +From 5089be88f670bcadf7db0e778894f900b2c05d7b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:07:33 +0000
>  Subject: [PATCH 03/15] configure: widen the regexp for SH architectures
> @@ -14,12 +14,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
>  diff --git a/configure b/configure
> -index be9dd89d9b..d8af155ab5 100755
> +index 2d615a9996..c4ad45c06c 100755
>  --- a/configure
>  +++ b/configure
> -@@ -3844,7 +3844,7 @@ case "${target}" in
> -   or1k*-*-*)
> -     noconfigdirs="$noconfigdirs gdb"
> +@@ -3835,7 +3835,7 @@ case "${target}" in
> +   nvptx*-*-*)
> +     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3
> target-libobjc"
>       ;;
>  -  sh-*-*)
>  +  sh*-*-* | sh64-*-*)
> @@ -27,7 +27,7 @@ index be9dd89d9b..d8af155ab5 100755
>         sh*-*-elf)
>            ;;
>  diff --git a/gprof/configure b/gprof/configure
> -index e71fe8b9e4..679e0dce77 100755
> +index 1e25102976..6b43bf2b18 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
> @@ -43,5 +43,5 @@ index e71fe8b9e4..679e0dce77 100755
>     if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
>       lt_cv_deplibs_check_method='match_pattern
> /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-
> scripts-location-to-libdir.patch b/meta/recipes-devtools/
> binutils/binutils/0004-Point-scripts-location-to-libdir.patch
> index 38eee30855..3e29c5815a 100644
> --- a/meta/recipes-devtools/binutils/binutils/0004-Point-
> scripts-location-to-libdir.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-
> scripts-location-to-libdir.patch
> @@ -1,4 +1,4 @@
> -From 3634ec3547bc0f8a5d1b8ad15365e2f836cda642 Mon Sep 17 00:00:00 2001
> +From a0e893ea094c48fa803046ffa89e31907aee0597 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:09:58 +0000
>  Subject: [PATCH 04/15] Point scripts location to libdir
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index 625347ff62..d5334d2681 100644
> +index 6243c12528..3c5d6c8202 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -57,7 +57,7 @@ endif
> @@ -25,7 +25,7 @@ index 625347ff62..d5334d2681 100644
>   EMUL = @EMUL@
>   EMULATION_OFILES = @EMULATION_OFILES@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index ba251777b0..a2cf2282b5 100644
> +index 760c037f9d..6dea692869 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
>  @@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
> @@ -38,5 +38,5 @@ index ba251777b0..a2cf2282b5 100644
>   BFDDIR = $(BASEDIR)/bfd
>   INCDIR = $(BASEDIR)/include
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-
> generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> b/meta/recipes-devtools/binutils/binutils/0005-Only-
> generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> index 59150a2e4d..2f49969371 100644
> --- a/meta/recipes-devtools/binutils/binutils/0005-Only-
> generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0005-Only-
> generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,4 +1,4 @@
> -From 9d37c8f68c07da63186cb993f1221f6c11eca422 Mon Sep 17 00:00:00 2001
> +From 518abb195d0eb47d8eef581d7fd0a5fd9fa73f7d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:27:17 +0000
>  Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
> @@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
> -index 9ac1840316..9dc4c149bc 100644
> +index c0925fc9b9..7d7670a89f 100644
>  --- a/ld/emultempl/elf32.em
>  +++ b/ld/emultempl/elf32.em
> -@@ -1463,6 +1463,8 @@ fragment <<EOF
> +@@ -1470,6 +1470,8 @@ fragment <<EOF
>               && command_line.rpath == NULL)
>             {
>               path = (const char *) getenv ("LD_RUN_PATH");
> @@ -27,7 +27,7 @@ index 9ac1840316..9dc4c149bc 100644
>               if (path
>                   && gld${EMULATION_NAME}_search_needed (path, &n, force))
>                 break;
> -@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_allocation (void)
> +@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_allocation (void)
>     rpath = command_line.rpath;
>     if (rpath == NULL)
>       rpath = (const char *) getenv ("LD_RUN_PATH");
> @@ -37,5 +37,5 @@ index 9ac1840316..9dc4c149bc 100644
>     for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
>       if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> index e87efe653b..333e2ee176 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
> @@ -1,4 +1,4 @@
> -From 71c734bb3754319029dcfc898cedbade42274dcb Mon Sep 17 00:00:00 2001
> +From fad053cc59baa6277182b0fc90415a214060ba99 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:04:07 +0000
>  Subject: [PATCH 06/15] Use libtool 2.4
> @@ -12,7 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   bfd/configure        | 1318 +++++++++++++++++------
>   bfd/configure.ac     |    2 +-
>   binutils/configure   | 1316 +++++++++++++++++------
> - configure            |    2 +-
>   gas/configure        | 1314 +++++++++++++++++------
>   gprof/configure      | 1321 +++++++++++++++++------
>   ld/configure         | 1691 +++++++++++++++++++++--------
> @@ -24,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   opcodes/configure    | 1318 +++++++++++++++++------
>   opcodes/configure.ac |    2 +-
>   zlib/configure       | 1316 +++++++++++++++++------
> - 15 files changed, 9927 insertions(+), 3694 deletions(-)
> + 14 files changed, 9926 insertions(+), 3693 deletions(-)
>
>  diff --git a/bfd/configure b/bfd/configure
> -index 48276594ed..3ece8943f3 100755
> +index 6c2b24ebe3..5fdd723b7f 100755
>  --- a/bfd/configure
>  +++ b/bfd/configure
>  @@ -672,6 +672,9 @@ OTOOL
> @@ -1931,7 +1930,7 @@ index 48276594ed..3ece8943f3 100755
>     chmod +x "$ofile"
>
>  diff --git a/bfd/configure.ac b/bfd/configure.ac
> -index 8fd03a7ea8..8816c3286c 100644
> +index 2342f3faea..a6451fccda 100644
>  --- a/bfd/configure.ac
>  +++ b/bfd/configure.ac
>  @@ -254,7 +254,7 @@ changequote(,)dnl
> @@ -1944,7 +1943,7 @@ index 8fd03a7ea8..8816c3286c 100644
>
>   # More hacks to build DLLs on Windows.
>  diff --git a/binutils/configure b/binutils/configure
> -index 22e1b1736e..321b63535b 100755
> +index 5d9c9105a7..a65b2b4518 100755
>  --- a/binutils/configure
>  +++ b/binutils/configure
>  @@ -659,8 +659,11 @@ OTOOL
> @@ -3841,21 +3840,8 @@ index 22e1b1736e..321b63535b 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>
> -diff --git a/configure b/configure
> -index d8af155ab5..005ed827ab 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3844,7 +3844,7 @@ case "${target}" in
> -   or1k*-*-*)
> -     noconfigdirs="$noconfigdirs gdb"
> -     ;;
> --  sh*-*-* | sh64-*-*)
> -+  sh-*-* | sh64-*-*)
> -     case "${target}" in
> -       sh*-*-elf)
> -          ;;
>  diff --git a/gas/configure b/gas/configure
> -index 93afb20c8f..81dd4cbd97 100755
> +index fbac8f44d5..a40ac2144f 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -650,8 +650,11 @@ OTOOL
> @@ -5156,7 +5142,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15436,13 +16089,20 @@ exeext='`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
> +@@ -15437,13 +16090,20 @@ exeext='`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -5177,7 +5163,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED
> "$delay_single_quote_subst"`'
> -@@ -15457,14 +16117,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> +@@ -15458,14 +16118,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl"
> | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address" | $SED
> "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> @@ -5196,7 +5182,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15497,12 +16160,12 @@ hardcode_shlibpath_var='`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
> +@@ -15498,12 +16161,12 @@ hardcode_shlibpath_var='`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED
> "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED
> "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED
> "$delay_single_quote_subst"`'
> @@ -5210,7 +5196,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   file_list_spec='`$ECHO "$file_list_spec" | $SED
> "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED
> "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> -@@ -15557,8 +16220,13 @@ reload_flag \
> +@@ -15558,8 +16221,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -5224,7 +5210,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -15568,12 +16236,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15569,12 +16237,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -5240,7 +5226,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -15589,7 +16259,6 @@ no_undefined_flag \
> +@@ -15590,7 +16260,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -5248,7 +5234,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -15625,6 +16294,7 @@ module_cmds \
> +@@ -15626,6 +16295,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -5256,7 +5242,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16389,7 +17059,8 @@ $as_echo X"$file" |
> +@@ -16390,7 +17060,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -5266,7 +5252,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -16492,19 +17163,42 @@ SP2NL=$lt_lt_SP2NL
> +@@ -16493,19 +17164,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>
> @@ -5310,7 +5296,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>
> -@@ -16534,6 +17228,12 @@ global_symbol_to_c_name_
> address=$lt_lt_cv_sys_global_symbol_to_c_name_address
> +@@ -16535,6 +17229,12 @@ global_symbol_to_c_name_
> address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is
> needed.
>   global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_
> sys_global_symbol_to_c_name_address_lib_prefix
>
> @@ -5323,7 +5309,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>
> -@@ -16543,6 +17243,9 @@ MAGIC_CMD=$MAGIC_CMD
> +@@ -16544,6 +17244,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>
> @@ -5333,7 +5319,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>
> -@@ -16657,12 +17360,12 @@ with_gcc=$GCC
> +@@ -16658,12 +17361,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -5349,7 +5335,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>
> -@@ -16749,9 +17452,6 @@ inherit_rpath=$inherit_rpath
> +@@ -16750,9 +17453,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency
> libraries.
>   link_all_deplibs=$link_all_deplibs
>
> @@ -5359,7 +5345,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>
> -@@ -16767,6 +17467,9 @@ include_expsyms=$lt_include_expsyms
> +@@ -16768,6 +17468,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with
> templates.
>   prelink_cmds=$lt_prelink_cmds
>
> @@ -5369,7 +5355,7 @@ index 93afb20c8f..81dd4cbd97 100755
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>
> -@@ -16799,210 +17502,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
> +@@ -16800,210 +17503,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -5744,7 +5730,7 @@ index 93afb20c8f..81dd4cbd97 100755
>     chmod +x "$ofile"
>
>  diff --git a/gprof/configure b/gprof/configure
> -index 679e0dce77..ac4c016a63 100755
> +index 6b43bf2b18..245ee48bc3 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -631,8 +631,11 @@ OTOOL
> @@ -7654,7 +7640,7 @@ index 679e0dce77..ac4c016a63 100755
>     chmod +x "$ofile"
>
>  diff --git a/ld/configure b/ld/configure
> -index d7f66f8cdc..4e71511bd1 100755
> +index 0cc6e8a50f..db8b998722 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -655,8 +655,11 @@ OTOOL
> @@ -17336,7 +17322,7 @@ index bf92b5e079..c573da90c5 100644
>   # These exist entirely to fool aclocal when bootstrapping libtool.
>   #
>  diff --git a/opcodes/configure b/opcodes/configure
> -index 17530f54b9..79b39611c2 100755
> +index 4f29887098..2127d39288 100755
>  --- a/opcodes/configure
>  +++ b/opcodes/configure
>  @@ -650,6 +650,9 @@ OTOOL
> @@ -19240,7 +19226,7 @@ index 17530f54b9..79b39611c2 100755
>     chmod +x "$ofile"
>
>  diff --git a/opcodes/configure.ac b/opcodes/configure.ac
> -index a9fbfd61f1..c43780f64d 100644
> +index b07f3f3629..5a32d9b1fc 100644
>  --- a/opcodes/configure.ac
>  +++ b/opcodes/configure.ac
>  @@ -167,7 +167,7 @@ changequote(,)dnl
> @@ -21153,5 +21139,5 @@ index dc2d9ed383..ed9a492f5c 100755
>     chmod +x "$ofile"
>
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-
> the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/
> binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
> index 88019606f7..4a5127380f 100644
> --- a/meta/recipes-devtools/binutils/binutils/0007-Add-
> the-armv5e-architecture-to-binutils.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0007-Add-
> the-armv5e-architecture-to-binutils.patch
> @@ -1,4 +1,4 @@
> -From 2b87aad1741bc481dd0982f100ad5ea7f937bb61 Mon Sep 17 00:00:00 2001
> +From 697903256e09533778baa8af66402c44d70219d9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:37:10 +0000
>  Subject: [PATCH 07/15] Add the armv5e architecture to binutils
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
> -index a885efe4fc..735eaa7447 100644
> +index ec50420518..a25d1721af 100644
>  --- a/gas/config/tc-arm.c
>  +++ b/gas/config/tc-arm.c
> -@@ -25990,6 +25990,7 @@ static const struct arm_arch_option_table
> arm_archs[] =
> +@@ -26195,6 +26195,7 @@ static const struct arm_arch_option_table
> arm_archs[] =
>     ARM_ARCH_OPT ("armv4t",     ARM_ARCH_V4T,    FPU_ARCH_FPA),
>     ARM_ARCH_OPT ("armv4txm",   ARM_ARCH_V4TxM,  FPU_ARCH_FPA),
>     ARM_ARCH_OPT ("armv5",      ARM_ARCH_V5,     FPU_ARCH_VFP),
> @@ -31,5 +31,5 @@ index a885efe4fc..735eaa7447 100644
>     ARM_ARCH_OPT ("armv5txm",   ARM_ARCH_V5TxM,  FPU_ARCH_VFP),
>     ARM_ARCH_OPT ("armv5te",    ARM_ARCH_V5TE,   FPU_ARCH_VFP),
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-
> let-the-distro-compiler-point-to-the-wrong-ins.patch
> b/meta/recipes-devtools/binutils/binutils/0008-don-t-
> let-the-distro-compiler-point-to-the-wrong-ins.patch
> index 30a22b504f..939be67b58 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-don-t-
> let-the-distro-compiler-point-to-the-wrong-ins.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-
> let-the-distro-compiler-point-to-the-wrong-ins.patch
> @@ -1,4 +1,4 @@
> -From 331443a87a31ec504e5652fc099d9129a9a4deb8 Mon Sep 17 00:00:00 2001
> +From 622d66634eb2e509d4126f5bdcab26de367241a1 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:39:01 +0000
>  Subject: [PATCH 08/15] don't let the distro compiler point to the wrong
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> -index 25cfa29ad5..ce67a710e3 100644
> +index ed1b334c36..d4ffd8b57b 100644
>  --- a/libiberty/Makefile.in
>  +++ b/libiberty/Makefile.in
>  @@ -364,7 +364,8 @@ install-strip: install
> @@ -31,5 +31,5 @@ index 25cfa29ad5..ce67a710e3 100644
>         if test -n "${target_header_dir}"; then \
>                 ${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-
> for-uses-of-system-directories-when-cross-linki.patch
> b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-
> directories-when-cross-linki.patch
> index e0e257880d..e75104722b 100644
> --- a/meta/recipes-devtools/binutils/binutils/0009-warn-
> for-uses-of-system-directories-when-cross-linki.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0009-warn-
> for-uses-of-system-directories-when-cross-linki.patch
> @@ -1,4 +1,4 @@
> -From 0a4afdcf0700efd45963568e2d0049127cdf4434 Mon Sep 17 00:00:00 2001
> +From 27e38ee92c24fca86b1c3f6ef156a1892dd06bfd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 Jan 2016 06:31:09 +0000
>  Subject: [PATCH 09/15] warn for uses of system directories when cross
> linking
> @@ -77,7 +77,7 @@ index a846743da6..df3cd5fb60 100644
>   #undef EXTRA_SHLIB_EXTENSION
>
>  diff --git a/ld/configure b/ld/configure
> -index 4e71511bd1..71c6ad1fd1 100755
> +index db8b998722..489ead5c13 100755
>  --- a/ld/configure
>  +++ b/ld/configure
>  @@ -789,6 +789,7 @@ with_lib_path
> @@ -118,7 +118,7 @@ index 4e71511bd1..71c6ad1fd1 100755
>   if test "${enable_gold+set}" = set; then :
>     enableval=$enable_gold; case "${enableval}" in
>  diff --git a/ld/configure.ac b/ld/configure.ac
> -index 00080f85fd..3aa98e37fb 100644
> +index bada1b50b0..d074a3820b 100644
>  --- a/ld/configure.ac
>  +++ b/ld/configure.ac
>  @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
> @@ -139,10 +139,10 @@ index 00080f85fd..3aa98e37fb 100644
>   dnl "install_as_default" is set to false if gold is the default linker.
>   dnl "installed_linker" is the installed BFD linker name.
>  diff --git a/ld/ld.h b/ld/ld.h
> -index c6fa1247f0..01c373498f 100644
> +index ba914b921e..9df17dab6c 100644
>  --- a/ld/ld.h
>  +++ b/ld/ld.h
> -@@ -174,6 +174,14 @@ typedef struct
> +@@ -180,6 +180,14 @@ typedef struct
>        in the linker script.  */
>     bfd_boolean force_group_allocation;
>
> @@ -158,10 +158,10 @@ index c6fa1247f0..01c373498f 100644
>     enum endian_enum endian;
>
>  diff --git a/ld/ld.texinfo b/ld/ld.texinfo
> -index ebe7e7b7bd..33aa2c62fa 100644
> +index c89915f1aa..df430837e2 100644
>  --- a/ld/ld.texinfo
>  +++ b/ld/ld.texinfo
> -@@ -2480,6 +2480,18 @@ string identifying the original linked file does
> not change.
> +@@ -2498,6 +2498,18 @@ string identifying the original linked file does
> not change.
>
>   Passing @code{none} for @var{style} disables the setting from any
>   @code{--build-id} options earlier on the command line.
> @@ -181,7 +181,7 @@ index ebe7e7b7bd..33aa2c62fa 100644
>
>   @c man end
>  diff --git a/ld/ldfile.c b/ld/ldfile.c
> -index 3b37a0a3e2..5c85b01849 100644
> +index 6532a57d96..f943f0b2e5 100644
>  --- a/ld/ldfile.c
>  +++ b/ld/ldfile.c
>  @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name,
> bfd_boolean cmdline)
> @@ -209,7 +209,7 @@ index 3b37a0a3e2..5c85b01849 100644
>
>   /* Try to open a BFD for a lang_input_statement.  */
>  diff --git a/ld/ldlex.h b/ld/ldlex.h
> -index 5aa7f6bc3e..cb655e0399 100644
> +index 140ed1d9da..9965cbc04f 100644
>  --- a/ld/ldlex.h
>  +++ b/ld/ldlex.h
>  @@ -147,6 +147,8 @@ enum option_values
> @@ -222,7 +222,7 @@ index 5aa7f6bc3e..cb655e0399 100644
>
>   /* The initial parser states.  */
>  diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 2b09f20413..89e2a3a805 100644
> +index c473ed24c3..adae0b4610 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
>  @@ -261,6 +261,8 @@ main (int argc, char **argv)
> @@ -235,7 +235,7 @@ index 2b09f20413..89e2a3a805 100644
>     /* We initialize DEMANGLING based on the environment variable
>        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
>  diff --git a/ld/lexsup.c b/ld/lexsup.c
> -index effa277b16..e4929607e9 100644
> +index f2191602d4..bccb3bdeef 100644
>  --- a/ld/lexsup.c
>  +++ b/ld/lexsup.c
>  @@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
> @@ -269,5 +269,5 @@ index effa277b16..e4929607e9 100644
>       }
>
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-
> rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/
> binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> index 496242efa4..33dfff9bd7 100644
> --- a/meta/recipes-devtools/binutils/binutils/0010-Fix-
> rpath-in-libtool-when-sysroot-is-enabled.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-
> rpath-in-libtool-when-sysroot-is-enabled.patch
> @@ -1,4 +1,4 @@
> -From 88fac08f1c472c612f381cbb9408756f2f58b4ff Mon Sep 17 00:00:00 2001
> +From e205ae05c41a8cc8d47708f0a3b6f740e2bf2526 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:42:38 +0000
>  Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled
> @@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644
>             if test -z "$hardcode_libdirs"; then
>               hardcode_libdirs="$libdir"
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-
> default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/
> binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
> index ac87a2d1de..80fcbc1194 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-Change-
> default-emulation-for-mips64-linux.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0011-Change-
> default-emulation-for-mips64-linux.patch
> @@ -1,4 +1,4 @@
> -From 497660bdbeb6788786553a5d733105f7f898dc62 Mon Sep 17 00:00:00 2001
> +From 7978c1299021033c35c29c94e0997235f7ede248 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:44:14 +0000
>  Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index dc24aabad5..4511024f22 100644
> +index f04a993f06..8777f96bd2 100644
>  --- a/bfd/config.bfd
>  +++ b/bfd/config.bfd
> -@@ -1186,12 +1186,12 @@ case "${targ}" in
> +@@ -1189,12 +1189,12 @@ case "${targ}" in
>       targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec
> mips_ecoff_be_vec mips_ecoff_le_vec"
>       ;;
>     mips64*el-*-linux*)
> @@ -35,12 +35,12 @@ index dc24aabad5..4511024f22 100644
>     mips*el-*-linux*)
>       targ_defvec=mips_elf32_trad_le_vec
>  diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index 47c719cd05..fe7b9238b2 100644
> +index 6183a85b3d..1d78465590 100644
>  --- a/ld/configure.tgt
>  +++ b/ld/configure.tgt
> -@@ -530,11 +530,11 @@ mips*el-*-vxworks*)      targ_emul=elf32elmipvxworks
> +@@ -535,11 +535,11 @@ mips*el-*-vxworks*)      targ_emul=elf32elmipvxworks
>   mips*-*-vxworks*)     targ_emul=elf32ebmipvxworks
> -                       targ_extra_emuls="elf32elmipvxworks" ;;
> +                       targ_extra_emuls="elf32elmipvxworks" ;;
>   mips*-*-windiss)      targ_emul=elf32mipswindiss ;;
>  -mips64*el-*-linux-*)  targ_emul=elf32ltsmipn32
>  -                      targ_extra_emuls="elf32btsmipn32 elf32ltsmip
> elf32btsmip elf64ltsmip elf64btsmip"
> @@ -55,5 +55,5 @@ index 47c719cd05..fe7b9238b2 100644
>   mips*el-*-linux-*)    targ_emul=elf32ltsmip
>                         targ_extra_emuls="elf32btsmip elf32ltsmipn32
> elf64ltsmip elf32btsmipn32 elf64btsmip"
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
> b/meta/recipes-devtools/binutils/binutils/0012-Add-
> support-for-Netlogic-XLP.patch
> index dc5e580739..1fefb680f8 100644
> --- a/meta/recipes-devtools/binutils/binutils/0012-Add-
> support-for-Netlogic-XLP.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Add-
> support-for-Netlogic-XLP.patch
> @@ -1,4 +1,4 @@
> -From 8c60a55d3678589d93739bd27fec216911d80968 Mon Sep 17 00:00:00 2001
> +From 3b40bf584615f794b85fd50d4d0a5c0a1d2ee7bf Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:06:19 +0000
>  Subject: [PATCH 12/15] Add support for Netlogic XLP
> @@ -34,7 +34,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>   14 files changed, 61 insertions(+), 21 deletions(-)
>
>  diff --git a/bfd/aoutx.h b/bfd/aoutx.h
> -index 3d38fda14b..0aec49bbb3 100644
> +index eec9c4ad2a..3bf0a71e63 100644
>  --- a/bfd/aoutx.h
>  +++ b/bfd/aoutx.h
>  @@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
> @@ -46,34 +46,34 @@ index 3d38fda14b..0aec49bbb3 100644
>           arch_flags = M_MIPS2;
>           break;
>  diff --git a/bfd/archures.c b/bfd/archures.c
> -index 433b95fa08..063b7943a1 100644
> +index e83c57a2f3..3016ea1bae 100644
>  --- a/bfd/archures.c
>  +++ b/bfd/archures.c
>  @@ -201,6 +201,7 @@ DESCRIPTION
> - .#define bfd_mach_mips_octeon3          6503
> - .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
> - .#define bfd_mach_mips_interaptiv_mr2   736550   {* decimal 'IA2'  *}
> -+.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *}
> - .#define bfd_mach_mipsisa32             32
> - .#define bfd_mach_mipsisa32r2           33
> - .#define bfd_mach_mipsisa32r3           34
> + .#define bfd_mach_mips_octeon3                6503
> + .#define bfd_mach_mips_xlr            887682   {* decimal 'XLR'.  *}
> + .#define bfd_mach_mips_interaptiv_mr2 736550   {* decimal 'IA2'.  *}
> ++.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'.  *}
> + .#define bfd_mach_mipsisa32           32
> + .#define bfd_mach_mipsisa32r2         33
> + .#define bfd_mach_mipsisa32r3         34
>  diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> -index d126aed086..2b753b3a93 100644
> +index 42991e7848..27abc5d5a8 100644
>  --- a/bfd/bfd-in2.h
>  +++ b/bfd/bfd-in2.h
> -@@ -2060,6 +2060,7 @@ enum bfd_architecture
> +@@ -2062,6 +2062,7 @@ enum bfd_architecture
>   #define bfd_mach_mips_octeon3          6503
> - #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
> - #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'  */
> -+#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
> + #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
> + #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
> ++#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'.  */
>   #define bfd_mach_mipsisa32             32
>   #define bfd_mach_mipsisa32r2           33
>   #define bfd_mach_mipsisa32r3           34
>  diff --git a/bfd/config.bfd b/bfd/config.bfd
> -index 4511024f22..f0f9072f10 100644
> +index 8777f96bd2..7b80bda8c9 100644
>  --- a/bfd/config.bfd
>  +++ b/bfd/config.bfd
> -@@ -1169,6 +1169,11 @@ case "${targ}" in
> +@@ -1172,6 +1172,11 @@ case "${targ}" in
>       targ_defvec=mips_elf32_le_vec
>       targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
>       ;;
> @@ -86,7 +86,7 @@ index 4511024f22..f0f9072f10 100644
>       targ_defvec=mips_elf32_be_vec
>       targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
>  diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
> -index 2493094bef..8375d1ae96 100644
> +index cb50c64371..2b9d1d6ecf 100644
>  --- a/bfd/cpu-mips.c
>  +++ b/bfd/cpu-mips.c
>  @@ -105,7 +105,8 @@ enum
> @@ -100,7 +100,7 @@ index 2493094bef..8375d1ae96 100644
>
>   #define NN(index) (&arch_info_struct[(index) + 1])
>  @@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_struct[] =
> -   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
> +   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",     FALSE, NN(I_xlr)),
>     N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
>        NN(I_interaptiv_mr2)),
>  -  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
> @@ -110,10 +110,10 @@ index 2493094bef..8375d1ae96 100644
>
>   /* The default architecture is mips:3000, but with a machine number of
>  diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
> -index fddf68c816..354c85d00b 100644
> +index 285401367d..14ebb5f175 100644
>  --- a/bfd/elfxx-mips.c
>  +++ b/bfd/elfxx-mips.c
> -@@ -6796,6 +6796,9 @@ _bfd_elf_mips_mach (flagword flags)
> +@@ -6806,6 +6806,9 @@ _bfd_elf_mips_mach (flagword flags)
>       case E_MIPS_MACH_IAMR2:
>         return bfd_mach_mips_interaptiv_mr2;
>
> @@ -123,7 +123,7 @@ index fddf68c816..354c85d00b 100644
>       default:
>         switch (flags & EF_MIPS_ARCH)
>         {
> -@@ -11956,6 +11959,10 @@ mips_set_isa_flags (bfd *abfd)
> +@@ -11963,6 +11966,10 @@ mips_set_isa_flags (bfd *abfd)
>         val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
>         break;
>
> @@ -134,7 +134,7 @@ index fddf68c816..354c85d00b 100644
>       case bfd_mach_mipsisa32:
>         val = E_MIPS_ARCH_32;
>         break;
> -@@ -13989,6 +13996,7 @@ static const struct mips_mach_extension
> mips_mach_extensions[] =
> +@@ -13936,6 +13943,7 @@ static const struct mips_mach_extension
> mips_mach_extensions[] =
>     { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
>     { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
>     { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
> @@ -143,10 +143,10 @@ index fddf68c816..354c85d00b 100644
>     /* MIPS64 extensions.  */
>     { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
>  diff --git a/binutils/readelf.c b/binutils/readelf.c
> -index 2b15f0f2cb..092744708e 100644
> +index ae1cda9a7b..fed0387a94 100644
>  --- a/binutils/readelf.c
>  +++ b/binutils/readelf.c
> -@@ -3335,6 +3335,7 @@ get_machine_flags (unsigned e_flags, unsigned
> e_machine)
> +@@ -3370,6 +3370,7 @@ get_machine_flags (Filedata * filedata, unsigned
> e_flags, unsigned e_machine)
>             case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
>             case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
>             case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2");
> break;
> @@ -155,7 +155,7 @@ index 2b15f0f2cb..092744708e 100644
>             /* We simply ignore the field in this case to avoid confusion:
>                MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
>  diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
> -index 3804df2958..9576c986db 100644
> +index c135131b59..d8fbda8e31 100644
>  --- a/gas/config/tc-mips.c
>  +++ b/gas/config/tc-mips.c
>  @@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
> @@ -174,7 +174,7 @@ index 3804df2958..9576c986db 100644
>      )
>
>   /* Whether the processor uses hardware interlocks to protect reads
> -@@ -19738,7 +19740,7 @@ static const struct mips_cpu_info
> mips_cpu_info_table[] =
> +@@ -19737,7 +19739,7 @@ static const struct mips_cpu_info
> mips_cpu_info_table[] =
>     /* Broadcom XLP.
>        XLP is mostly like XLR, with the prominent exception that it is
>        MIPS64R2 rather than MIPS64.  */
> @@ -184,7 +184,7 @@ index 3804df2958..9576c986db 100644
>     /* MIPS 64 Release 6 */
>     { "i6400",        0, ASE_MSA,               ISA_MIPS64R6,
> CPU_MIPS64R6},
>  diff --git a/gas/configure b/gas/configure
> -index 81dd4cbd97..95bdf3b19b 100755
> +index a40ac2144f..65a6995243 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -12989,6 +12989,9 @@ _ACEOF
> @@ -198,7 +198,7 @@ index 81dd4cbd97..95bdf3b19b 100755
>             mips_cpu=r3900
>             ;;
>  diff --git a/include/elf/mips.h b/include/elf/mips.h
> -index a4bea43ff8..73d904e25f 100644
> +index 9de0b4e175..74fc4f7e55 100644
>  --- a/include/elf/mips.h
>  +++ b/include/elf/mips.h
>  @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
> @@ -210,7 +210,7 @@ index a4bea43ff8..73d904e25f 100644
>   #define E_MIPS_MACH_OCTEON3   0x008e0000
>   #define E_MIPS_MACH_5400      0x00910000
>  diff --git a/include/opcode/mips.h b/include/opcode/mips.h
> -index ceae9ec50a..276ee3c6c1 100644
> +index 5eea72f139..90f6d57e15 100644
>  --- a/include/opcode/mips.h
>  +++ b/include/opcode/mips.h
>  @@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[] = {
> @@ -241,10 +241,10 @@ index ceae9ec50a..276ee3c6c1 100644
>         return FALSE;
>       }
>  diff --git a/ld/configure.tgt b/ld/configure.tgt
> -index fe7b9238b2..2adf108b17 100644
> +index 1d78465590..307e787b64 100644
>  --- a/ld/configure.tgt
>  +++ b/ld/configure.tgt
> -@@ -516,6 +516,8 @@ mips*el-sde-elf* | mips*el-mti-elf* |
> mips*el-img-elf*)
> +@@ -521,6 +521,8 @@ mips*el-sde-elf* | mips*el-mti-elf* |
> mips*el-img-elf*)
>   mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
>                         targ_emul=elf32btsmip
>                         targ_extra_emuls="elf32ltsmip elf32btsmipn32
> elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
> @@ -254,7 +254,7 @@ index fe7b9238b2..2adf108b17 100644
>                         targ_extra_emuls="elf32lr5900"
>                         targ_extra_libpath=$targ_extra_emuls ;;
>  diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
> -index 45195007c1..4a80a05d19 100644
> +index 984fcbb802..95b107d216 100644
>  --- a/opcodes/mips-dis.c
>  +++ b/opcodes/mips-dis.c
>  @@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
> @@ -277,7 +277,7 @@ index 45195007c1..4a80a05d19 100644
>     /* This entry, mips16, is here only for ISA/processor selection; do
>        not print its name.  */
>  diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
> -index 19fca408c9..d02069c528 100644
> +index 180d613c93..65b7b8cc23 100644
>  --- a/opcodes/mips-opc.c
>  +++ b/opcodes/mips-opc.c
>  @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
> @@ -389,5 +389,5 @@ index 19fca408c9..d02069c528 100644
>   {"swc0",              "E,A(b)",       0,    (int) M_SWC0_AB,
> INSN_MACRO,             0,              I1,             0,
> IOCT|IOCTP|IOCT2|I37 },
>   {"swc1",              "T,o(b)",       0xe4000000, 0xfc000000,
> RD_1|RD_3|SM|FP_S,      0,              I1,             0,      0 },
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-
> the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> b/meta/recipes-devtools/binutils/binutils/0013-fix-
> the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> index 247376b7ed..c3e1b13841 100644
> --- a/meta/recipes-devtools/binutils/binutils/0013-fix-
> the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0013-fix-
> the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -1,4 +1,4 @@
> -From e46202becab625c6c08caf91e08ccbbc1bf799c4 Mon Sep 17 00:00:00 2001
> +From 27ec22ca3cd56cfdf060d2e1f414bedce269b322 Mon Sep 17 00:00:00 2001
>  From: Zhenhua Luo <zhenhua.luo@nxp.com>
>  Date: Sat, 11 Jun 2016 22:08:29 -0500
>  Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait mnemonic
> @@ -11,10 +11,10 @@ Upstream-Status: Pending
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>  diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> -index 426261ab21..0d35916cdd 100644
> +index bb17f26c2e..dbdd762b4e 100644
>  --- a/opcodes/ppc-opc.c
>  +++ b/opcodes/ppc-opc.c
> -@@ -4881,7 +4881,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +@@ -5338,7 +5338,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   {"ldepx",     X(31,29),       X_MASK,   E500MC|PPCA2, 0,
> {RT, RA0, RB}},
>
>   {"waitasec",  X(31,30),      XRTRARB_MASK, POWER8,    POWER9,
>  {0}},
> @@ -22,7 +22,7 @@ index 426261ab21..0d35916cdd 100644
>
>   {"lwepx",     X(31,31),       X_MASK,   E500MC|PPCA2, 0,
> {RT, RA0, RB}},
>
> -@@ -4935,7 +4934,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +@@ -5392,7 +5391,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>
>   {"waitrsv",   X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,
> {0}},
>   {"waitimpl",  X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,
> {0}},
> @@ -32,5 +32,5 @@ index 426261ab21..0d35916cdd 100644
>   {"dcbstep",   XRT(31,63,0),   XRT_MASK,    E500MC|PPCA2, 0,
>  {RA0, RB}},
>
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
> b/meta/recipes-devtools/binutils/binutils/0014-Detect-
> 64-bit-MIPS-targets.patch
> index 42b1065f8d..cf3690f25d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0014-Detect-
> 64-bit-MIPS-targets.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0014-Detect-
> 64-bit-MIPS-targets.patch
> @@ -1,4 +1,4 @@
> -From bf20d5823662d1f2eb47de2cdfd173627a205b17 Mon Sep 17 00:00:00 2001
> +From 7dfbd6889d868a09d695dd2736104848c1a9c9c3 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 31 Mar 2017 11:42:03 -0700
>  Subject: [PATCH 14/15] Detect 64-bit MIPS targets
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 14 insertions(+)
>
>  diff --git a/gold/configure.tgt b/gold/configure.tgt
> -index 3d63027297..c1f92a1360 100644
> +index 8aef22a318..7030026ffa 100644
>  --- a/gold/configure.tgt
>  +++ b/gold/configure.tgt
>  @@ -153,6 +153,13 @@ aarch64*-*)
> @@ -46,5 +46,5 @@ index 3d63027297..c1f92a1360 100644
>    targ_obj=mips
>    targ_machine=EM_MIPS
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
> b/meta/recipes-devtools/binutils/binutils/0015-sync-
> with-OE-libtool-changes.patch
> index 2c8900cb66..8c9fd237e7 100644
> --- a/meta/recipes-devtools/binutils/binutils/0015-sync-
> with-OE-libtool-changes.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0015-sync-
> with-OE-libtool-changes.patch
> @@ -1,4 +1,4 @@
> -From 9b456a0e4f284fd41ac36595144ed44dc82410ee Mon Sep 17 00:00:00 2001
> +From 298804f430939d6cc94b09732ee93e64c5e6be18 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 6 Mar 2017 23:33:27 -0800
>  Subject: [PATCH 15/15] sync with OE libtool changes
> @@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644
>         elif test -n "$runpath_var"; then
>           case "$finalize_perm_rpath " in
>  --
> -2.14.0
> +2.16.1
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.29.1.bb
> b/meta/recipes-devtools/binutils/binutils_2.30.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.29.1.bb
> rename to meta/recipes-devtools/binutils/binutils_2.30.bb
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c0122e5984010564552e14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is causing glibc on ARM64 to explode:<br><br>| /home/=
pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tmp/work=
/aarch64-poky-linux/glibc/2.26-r0/build-aarch64-poky-linux/elf/librtld.os:(=
.<a href=3D"http://data.rel.ro">data.rel.ro</a>+0x498): dangerous relocatio=
n: unsupported relocation<div><br></div><div>Pages more available at=C2=A0<=
a href=3D"https://autobuilder.yocto.io/builders/nightly-arm64/builds/724/st=
eps/BuildImages/logs/stdio">https://autobuilder.yocto.io/builders/nightly-a=
rm64/builds/724/steps/BuildImages/logs/stdio</a></div><div><br></div><div>R=
oss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 30 January 2018 at 04:31, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/<wbr>tcmode-default.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../{binutils-2.29.1.inc =3D&gt; binutils-2.30.inc}=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://n_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank=
">n_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadian_2.30.bb=
" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_2.30.<wbr>bb=
</a>} |=C2=A0 0<br>
=C2=A0...<a href=3D"http://tils-cross_2.29.1.bb" rel=3D"noreferrer" target=
=3D"_blank">tils-cross_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cro=
ss_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.30.bb</a>=
} |=C2=A0 0<br>
=C2=A0...<a href=3D"http://rosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"=
_blank">rosssdk_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2=
.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.30.bb</a>}=
 |=C2=A0 0<br>
=C2=A0...nutils-crosssdk-Generate-<wbr>relocatable-SDKs.patch | 14 ++---<br=
>
=C2=A0...oss-Do-not-generate-linker-<wbr>script-directo.patch |=C2=A0 6 +-<=
br>
=C2=A0...ure-widen-the-regexp-for-<wbr>SH-architectures.patch | 14 ++---<br=
>
=C2=A0.../0004-Point-scripts-<wbr>location-to-libdir.patch=C2=A0 =C2=A0 |=
=C2=A0 8 +--<br>
=C2=A0...te-an-RPATH-entry-if-LD_<wbr>RUN_PATH-is-not-e.patch | 10 ++--<br>
=C2=A0.../binutils/binutils/0006-<wbr>Use-libtool-2.4.patch=C2=A0 =C2=A0| 6=
6 ++++++++------------<br>
=C2=A0...7-Add-the-armv5e-<wbr>architecture-to-binutils.patch |=C2=A0 8 +--=
<br>
=C2=A0...he-distro-compiler-point-<wbr>to-the-wrong-ins.patch |=C2=A0 6 +-<=
br>
=C2=A0...es-of-system-directories-<wbr>when-cross-linki.patch | 24 ++++----=
<br>
=C2=A0...-rpath-in-libtool-when-<wbr>sysroot-is-enabled.patch |=C2=A0 4 +-<=
br>
=C2=A0...Change-default-emulation-<wbr>for-mips64-linux.patch | 14 ++---<br=
>
=C2=A0.../0012-Add-support-for-<wbr>Netlogic-XLP.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 70 +++++++++++-----------<br>
=C2=A0...ncorrect-assembling-for-<wbr>ppc-wait-mnemonic.patch | 10 ++--<br>
=C2=A0.../binutils/0014-Detect-64-<wbr>bit-MIPS-targets.patch |=C2=A0 6 +-<=
br>
=C2=A0.../0015-sync-with-OE-libtool-<wbr>changes.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +-<br>
=C2=A0.../{<a href=3D"http://binutils_2.29.1.bb" rel=3D"noreferrer" target=
=3D"_blank">binutils_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils_2.30.=
bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.30.bb</a>}=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A021 files changed, 127 insertions(+), 141 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/<wbr>binutils/{binutils-2.29.1.inc =3D&g=
t; binutils-2.30.inc} (97%)<br>
=C2=A0rename meta/recipes-devtools/<wbr>binutils/{<a href=3D"http://binutil=
s-cross-canadian_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-c=
ross-<wbr>canadian_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cross-c=
anadian_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadi=
an_2.30.<wbr>bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/<wbr>binutils/{<a href=3D"http://binutil=
s-cross_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.29=
.<wbr>1.bb</a> =3D&gt; <a href=3D"http://binutils-cross_2.30.bb" rel=3D"nor=
eferrer" target=3D"_blank">binutils-cross_2.30.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/<wbr>binutils/{<a href=3D"http://binutil=
s-crosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssd=
k_2.<wbr>29.1.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.30.bb" r=
el=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.30.bb</a>} (100%)<b=
r>
=C2=A0rename meta/recipes-devtools/<wbr>binutils/{<a href=3D"http://binutil=
s_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.29.1.bb</a> =
=3D&gt; <a href=3D"http://binutils_2.30.bb" rel=3D"noreferrer" target=3D"_b=
lank">binutils_2.30.bb</a>} (100%)<br>
<br>
diff --git a/meta/conf/distro/include/<wbr>tcmode-default.inc b/meta/conf/d=
istro/include/<wbr>tcmode-default.inc<br>
index 1787a8248d..98b1a2a7ba 100644<br>
--- a/meta/conf/distro/include/<wbr>tcmode-default.inc<br>
+++ b/meta/conf/distro/include/<wbr>tcmode-default.inc<br>
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/<wbr>gettext ??=3D &quot;gette=
xt&quot;<br>
<br>
=C2=A0GCCVERSION ?=3D &quot;7.%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
-BINUVERSION ?=3D &quot;2.29%&quot;<br>
+BINUVERSION ?=3D &quot;2.30%&quot;<br>
=C2=A0GDBVERSION ?=3D &quot;8.0%&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.26%&quot;<br>
=C2=A0LINUXLIBCVERSION ?=3D &quot;4.12%&quot;<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-2.29.1.inc b/meta=
/recipes-devtools/<wbr>binutils/binutils-2.30.inc<br>
similarity index 97%<br>
rename from meta/recipes-devtools/<wbr>binutils/binutils-2.29.1.inc<br>
rename to meta/recipes-devtools/<wbr>binutils/binutils-2.30.inc<br>
index 07a72e2b5a..74c65f5473 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils-2.29.1.inc<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils-2.30.inc<br>
@@ -18,7 +18,7 @@ BINUPV =3D &quot;${@binutils_branch_version(d)<wbr>}&quot=
;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&gt;\d+_(\d_=
?)*<wbr>)&quot;<br>
<br>
-SRCREV ?=3D &quot;<wbr>90276f15379d380761fc499da2ba24<wbr>cfb3c12a94&quot;=
<br>
+SRCREV ?=3D &quot;<wbr>8db5daf9efe8a6174d3b10ac7bba8c<wbr>178836e9ce&quot;=
<br>
=C2=A0BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/gi=
t/binutils-gdb.git;branch=3Dbinutils-${BINUPV}-branch;protocol=3Dgit" rel=
=3D"noreferrer" target=3D"_blank">sourceware.org/git/<wbr>binutils-gdb.git;=
branch=3D<wbr>binutils-${BINUPV}-branch;<wbr>protocol=3Dgit</a>&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 ${BINUTILS_GIT_URI} \<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils=
-cross-canadian_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cr=
oss-<wbr>canadian_2.29.1.bb</a> b/meta/recipes-devtools/<wbr>binutils/<a hr=
ef=3D"http://binutils-cross-canadian_2.30.bb" rel=3D"noreferrer" target=3D"=
_blank">binutils-cross-<wbr>canadian_2.30.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils-=
cross-canadian_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cro=
ss-<wbr>canadian_2.29.1.bb</a><br>
rename to meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils-cr=
oss-canadian_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-<=
wbr>canadian_2.30.bb</a><br>
diff --git a/meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils=
-cross_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.29.=
<wbr>1.bb</a> b/meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binut=
ils-cross_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.30=
.<wbr>bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils-=
cross_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.29.<=
wbr>1.bb</a><br>
rename to meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils-cr=
oss_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.30.<wbr>=
bb</a><br>
diff --git a/meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils=
-crosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk=
_2.<wbr>29.1.bb</a> b/meta/recipes-devtools/<wbr>binutils/<a href=3D"http:/=
/binutils-crosssdk_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-c=
rosssdk_2.<wbr>30.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils-=
crosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_=
2.<wbr>29.1.bb</a><br>
rename to meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils-cr=
osssdk_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.<w=
br>30.bb</a><br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0001-<wbr>binutil=
s-crosssdk-Generate-<wbr>relocatable-SDKs.patch b/meta/recipes-devtools/<wb=
r>binutils/binutils/0001-<wbr>binutils-crosssdk-Generate-<wbr>relocatable-S=
DKs.patch<br>
index 0b515d83c7..2df836057d 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0001-<wbr>binutils-cross=
sdk-Generate-<wbr>relocatable-SDKs.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0001-<wbr>binutils-cross=
sdk-Generate-<wbr>relocatable-SDKs.patch<br>
@@ -1,4 +1,4 @@<br>
-From 58ac9f95a3d83c29efaf7a8906fb6a<wbr>efea8c8e79 Mon Sep 17 00:00:00 200=
1<br>
+From 2e1b5e24a6759de7f73aa6060a5748<wbr>48d9131b5a Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:58:54 +0000<br>
=C2=A0Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs<b=
r>
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 5 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/ld/genscripts.sh b/ld/genscripts.sh<br>
-index b6940d376d..a42c4d7a4b 100755<br>
+index 8732422b3a..1f257e99ca 100755<br>
=C2=A0--- a/ld/genscripts.sh<br>
=C2=A0+++ b/ld/genscripts.sh<br>
=C2=A0@@ -277,6 +277,7 @@ DATA_ALIGNMENT_u=3D&quot;${DATA_<wbr>ALIGNMENT_u-=
${DATA_ALIGNMENT_<wbr>r}}&quot;<br>
@@ -37,16 +37,16 @@ index b6940d376d..a42c4d7a4b 100755<br>
=C2=A0 ( echo &quot;/* Script for ld -Ur: link w/out relocation, do create =
constructors */&quot;<br>
=C2=A0 =C2=A0 . ${CUSTOMIZER_SCRIPT}<br>
=C2=A0 =C2=A0 . ${srcdir}/scripttempl/${<wbr>SCRIPT_NAME}.sc<br>
- ) | sed -e &#39;/^ *$/d;s/[=C2=A0 =C2=A0 =C2=A0 =C2=A0]*$//&#39; &gt; lds=
cripts/${EMULATION_NAME}.xu<br>
+ ) | sed -e &#39;/^ *$/d;s/[=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]*$//&#39; &gt; ld=
scripts/${EMULATION_NAME}.xu<br>
=C2=A0+unset PARTIAL_LINKING<br>
<br>
- LD_FLAG=3D<br>
=C2=A0 DATA_ALIGNMENT=3D${DATA_<wbr>ALIGNMENT_}<br>
+ RELOCATING=3D&quot; &quot;<br>
=C2=A0diff --git a/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"noreferr=
er" target=3D"_blank">elf.sc</a> b/ld/scripttempl/<a href=3D"http://elf.sc"=
 rel=3D"noreferrer" target=3D"_blank">elf.sc</a><br>
-index d9138bc059..e48faeca43 100644<br>
+index 9787ab5dac..0c8a93c2c8 100644<br>
=C2=A0--- a/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"noreferrer" tar=
get=3D"_blank">elf.sc</a><br>
=C2=A0+++ b/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"noreferrer" tar=
get=3D"_blank">elf.sc</a><br>
-@@ -138,8 +138,8 @@ if test -z &quot;$DATA_SEGMENT_ALIGN&quot;; then<br>
+@@ -139,8 +139,8 @@ if test -z &quot;$DATA_SEGMENT_ALIGN&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 DATA_SEGMENT_RELRO_END=3D&quot;. =3D DATA_SEGMENT_RELR=
O_END (${SEPARATE_GOTPLT-0}, .);&quot;<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 fi<br>
@@ -58,5 +58,5 @@ index d9138bc059..e48faeca43 100644<br>
=C2=A0 if test -z &quot;$PLT&quot;; then<br>
=C2=A0 =C2=A0 IPLT=3D&quot;.iplt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${RELOCAT=
ING-0} : { *(.iplt) }&quot;<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0002-<wbr>binutil=
s-cross-Do-not-<wbr>generate-linker-script-<wbr>directo.patch b/meta/recipe=
s-devtools/<wbr>binutils/binutils/0002-<wbr>binutils-cross-Do-not-<wbr>gene=
rate-linker-script-<wbr>directo.patch<br>
index 370333d5d0..bac7fb2d1a 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0002-<wbr>binutils-cross=
-Do-not-<wbr>generate-linker-script-<wbr>directo.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0002-<wbr>binutils-cross=
-Do-not-<wbr>generate-linker-script-<wbr>directo.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8f929c616208351d0971d7dfd7574d<wbr>48d3144603 Mon Sep 17 00:00:00 200=
1<br>
+From 58ddf38fa53abb48b69dd76e398c73<wbr>451ad1a5eb Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 6 Mar 2017 23:37:05 -0800<br>
=C2=A0Subject: [PATCH 02/15] binutils-cross: Do not generate linker script<=
br>
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 23 deletions(-)<br>
<br>
=C2=A0diff --git a/ld/genscripts.sh b/ld/genscripts.sh<br>
-index a42c4d7a4b..d727b4d07e 100755<br>
+index 1f257e99ca..1583b73a2b 100755<br>
=C2=A0--- a/ld/genscripts.sh<br>
=C2=A0+++ b/ld/genscripts.sh<br>
=C2=A0@@ -189,29 +189,6 @@ append_to_lib_path()<br>
@@ -57,5 +57,5 @@ index a42c4d7a4b..d727b4d07e 100755<br>
=C2=A0 =C2=A0 libs=3D${NATIVE_LIB_DIRS}<br>
=C2=A0 =C2=A0 if [ &quot;x${NATIVE}&quot; =3D &quot;xyes&quot; ] ; then<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0003-<wbr>configu=
re-widen-the-regexp-<wbr>for-SH-architectures.patch b/meta/recipes-devtools=
/<wbr>binutils/binutils/0003-<wbr>configure-widen-the-regexp-<wbr>for-SH-ar=
chitectures.patch<br>
index b6c09ccf19..306afe7018 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0003-<wbr>configure-wide=
n-the-regexp-<wbr>for-SH-architectures.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0003-<wbr>configure-wide=
n-the-regexp-<wbr>for-SH-architectures.patch<br>
@@ -1,4 +1,4 @@<br>
-From e5a806aae02a10290c71deb72f6294<wbr>c98068368d Mon Sep 17 00:00:00 200=
1<br>
+From 5089be88f670bcadf7db0e778894f9<wbr>00b2c05d7b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:07:33 +0000<br>
=C2=A0Subject: [PATCH 03/15] configure: widen the regexp for SH architectur=
es<br>
@@ -14,12 +14,12 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 6 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/configure b/configure<br>
-index be9dd89d9b..d8af155ab5 100755<br>
+index 2d615a9996..c4ad45c06c 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
-@@ -3844,7 +3844,7 @@ case &quot;${target}&quot; in<br>
-=C2=A0 =C2=A0or1k*-*-*)<br>
-=C2=A0 =C2=A0 =C2=A0noconfigdirs=3D&quot;$noconfigdirs gdb&quot;<br>
+@@ -3835,7 +3835,7 @@ case &quot;${target}&quot; in<br>
+=C2=A0 =C2=A0nvptx*-*-*)<br>
+=C2=A0 =C2=A0 =C2=A0noconfigdirs=3D&quot;$noconfigdirs target-libssp targe=
t-libstdc++-v3 target-libobjc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0-=C2=A0 sh-*-*)<br>
=C2=A0+=C2=A0 sh*-*-* | sh64-*-*)<br>
@@ -27,7 +27,7 @@ index be9dd89d9b..d8af155ab5 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh*-*-elf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0diff --git a/gprof/configure b/gprof/configure<br>
-index e71fe8b9e4..679e0dce77 100755<br>
+index 1e25102976..6b43bf2b18 100755<br>
=C2=A0--- a/gprof/configure<br>
=C2=A0+++ b/gprof/configure<br>
=C2=A0@@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)<br>
@@ -43,5 +43,5 @@ index e71fe8b9e4..679e0dce77 100755<br>
=C2=A0 =C2=A0 if echo __ELF__ | $CC -E - | $GREP __ELF__ &gt; /dev/null; th=
en<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_deplibs_check_method=3D&#39;<wbr>match_pattern /=
lib[^/]+(\.so\.[0-9]+\.[0-9]+<wbr>|_pic\.a)$&#39;<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0004-Point-<wbr>s=
cripts-location-to-libdir.<wbr>patch b/meta/recipes-devtools/<wbr>binutils/=
binutils/0004-Point-<wbr>scripts-location-to-libdir.<wbr>patch<br>
index 38eee30855..3e29c5815a 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0004-Point-<wbr>scripts-=
location-to-libdir.<wbr>patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0004-Point-<wbr>scripts-=
location-to-libdir.<wbr>patch<br>
@@ -1,4 +1,4 @@<br>
-From 3634ec3547bc0f8a5d1b8ad15365e2<wbr>f836cda642 Mon Sep 17 00:00:00 200=
1<br>
+From a0e893ea094c48fa803046ffa89e31<wbr>907aee0597 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:09:58 +0000<br>
=C2=A0Subject: [PATCH 04/15] Point scripts location to libdir<br>
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/ld/Makefile.am b/ld/Makefile.am<br>
-index 625347ff62..d5334d2681 100644<br>
+index 6243c12528..3c5d6c8202 100644<br>
=C2=A0--- a/ld/Makefile.am<br>
=C2=A0+++ b/ld/Makefile.am<br>
=C2=A0@@ -57,7 +57,7 @@ endif<br>
@@ -25,7 +25,7 @@ index 625347ff62..d5334d2681 100644<br>
=C2=A0 EMUL =3D @EMUL@<br>
=C2=A0 EMULATION_OFILES =3D @EMULATION_OFILES@<br>
=C2=A0diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
-index ba251777b0..a2cf2282b5 100644<br>
+index 760c037f9d..6dea692869 100644<br>
=C2=A0--- a/ld/Makefile.in<br>
=C2=A0+++ b/ld/Makefile.in<br>
=C2=A0@@ -446,7 +446,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)<br>
@@ -38,5 +38,5 @@ index ba251777b0..a2cf2282b5 100644<br>
=C2=A0 BFDDIR =3D $(BASEDIR)/bfd<br>
=C2=A0 INCDIR =3D $(BASEDIR)/include<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0005-Only-<wbr>ge=
nerate-an-RPATH-entry-if-LD_<wbr>RUN_PATH-is-not-e.patch b/meta/recipes-dev=
tools/<wbr>binutils/binutils/0005-Only-<wbr>generate-an-RPATH-entry-if-LD_<=
wbr>RUN_PATH-is-not-e.patch<br>
index 59150a2e4d..2f49969371 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0005-Only-<wbr>generate-=
an-RPATH-entry-if-LD_<wbr>RUN_PATH-is-not-e.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0005-Only-<wbr>generate-=
an-RPATH-entry-if-LD_<wbr>RUN_PATH-is-not-e.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9d37c8f68c07da63186cb993f1221f<wbr>6c11eca422 Mon Sep 17 00:00:00 200=
1<br>
+From 518abb195d0eb47d8eef581d7fd0a5<wbr>fd9fa73f7d Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:27:17 +0000<br>
=C2=A0Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is=
 not<br>
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em<br>
-index 9ac1840316..9dc4c149bc 100644<br>
+index c0925fc9b9..7d7670a89f 100644<br>
=C2=A0--- a/ld/emultempl/elf32.em<br>
=C2=A0+++ b/ld/emultempl/elf32.em<br>
-@@ -1463,6 +1463,8 @@ fragment &lt;&lt;EOF<br>
+@@ -1470,6 +1470,8 @@ fragment &lt;&lt;EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; command_line.rp=
ath =3D=3D NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D (const char *) ge=
tenv (&quot;LD_RUN_PATH&quot;);<br>
@@ -27,7 +27,7 @@ index 9ac1840316..9dc4c149bc 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; g=
ld${EMULATION_NAME}_search_<wbr>needed (path, &amp;n, force))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_<wbr>allocation (void)<b=
r>
+@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_<wbr>allocation (void)<b=
r>
=C2=A0 =C2=A0 rpath =3D command_line.rpath;<br>
=C2=A0 =C2=A0 if (rpath =3D=3D NULL)<br>
=C2=A0 =C2=A0 =C2=A0 rpath =3D (const char *) getenv (&quot;LD_RUN_PATH&quo=
t;);<br>
@@ -37,5 +37,5 @@ index 9ac1840316..9dc4c149bc 100644<br>
=C2=A0 =C2=A0 for (abfd =3D link_info.input_bfds; abfd; abfd =3D abfd-&gt;l=
ink.next)<br>
=C2=A0 =C2=A0 =C2=A0 if (bfd_get_flavour (abfd) =3D=3D bfd_target_elf_flavo=
ur)<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>lib=
tool-2.4.patch b/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr=
>libtool-2.4.patch<br>
index e87efe653b..333e2ee176 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>libtool-2.=
4.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0006-Use-<wbr>libtool-2.=
4.patch<br>
@@ -1,4 +1,4 @@<br>
-From 71c734bb3754319029dcfc898cedba<wbr>de42274dcb Mon Sep 17 00:00:00 200=
1<br>
+From fad053cc59baa6277182b0fc90415a<wbr>214060ba99 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Sun, 14 Feb 2016 17:04:07 +0000<br>
=C2=A0Subject: [PATCH 06/15] Use libtool 2.4<br>
@@ -12,7 +12,6 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 bfd/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1318 +++++++++++++++++---=
---<br>
=C2=A0 bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0 binutils/configure=C2=A0 =C2=A0| 1316 +++++++++++++++++------<br>
- configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br=
>
=C2=A0 gas/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1314 +++++++++++++++++---=
---<br>
=C2=A0 gprof/configure=C2=A0 =C2=A0 =C2=A0 | 1321 +++++++++++++++++------<b=
r>
=C2=A0 ld/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1691 +++++++++++++++=
++++++--------<br>
@@ -24,10 +23,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 opcodes/configure=C2=A0 =C2=A0 | 1318 +++++++++++++++++------<br>
=C2=A0 opcodes/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a> |=C2=A0 =C2=A0 2 +-<br>
=C2=A0 zlib/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1316 +++++++++++++++++---=
---<br>
- 15 files changed, 9927 insertions(+), 3694 deletions(-)<br>
+ 14 files changed, 9926 insertions(+), 3693 deletions(-)<br>
<br>
=C2=A0diff --git a/bfd/configure b/bfd/configure<br>
-index 48276594ed..3ece8943f3 100755<br>
+index 6c2b24ebe3..5fdd723b7f 100755<br>
=C2=A0--- a/bfd/configure<br>
=C2=A0+++ b/bfd/configure<br>
=C2=A0@@ -672,6 +672,9 @@ OTOOL<br>
@@ -1931,7 +1930,7 @@ index 48276594ed..3ece8943f3 100755<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
=C2=A0diff --git a/bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a> b/bfd/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
-index 8fd03a7ea8..8816c3286c 100644<br>
+index 2342f3faea..a6451fccda 100644<br>
=C2=A0--- a/bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
=C2=A0+++ b/bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
=C2=A0@@ -254,7 +254,7 @@ changequote(,)dnl<br>
@@ -1944,7 +1943,7 @@ index 8fd03a7ea8..8816c3286c 100644<br>
<br>
=C2=A0 # More hacks to build DLLs on Windows.<br>
=C2=A0diff --git a/binutils/configure b/binutils/configure<br>
-index 22e1b1736e..321b63535b 100755<br>
+index 5d9c9105a7..a65b2b4518 100755<br>
=C2=A0--- a/binutils/configure<br>
=C2=A0+++ b/binutils/configure<br>
=C2=A0@@ -659,8 +659,11 @@ OTOOL<br>
@@ -3841,21 +3840,8 @@ index 22e1b1736e..321b63535b 100755<br>
=C2=A0 =C2=A0 =C2=A0 (rm -f &quot;$ofile&quot; &amp;&amp; cp &quot;$cfgfile=
&quot; &quot;$ofile&quot; &amp;&amp; rm -f &quot;$cfgfile&quot;)<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
-diff --git a/configure b/configure<br>
-index d8af155ab5..005ed827ab 100755<br>
---- a/configure<br>
-+++ b/configure<br>
-@@ -3844,7 +3844,7 @@ case &quot;${target}&quot; in<br>
-=C2=A0 =C2=A0or1k*-*-*)<br>
-=C2=A0 =C2=A0 =C2=A0noconfigdirs=3D&quot;$noconfigdirs gdb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0;;<br>
--=C2=A0 sh*-*-* | sh64-*-*)<br>
-+=C2=A0 sh-*-* | sh64-*-*)<br>
-=C2=A0 =C2=A0 =C2=A0case &quot;${target}&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sh*-*-elf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0diff --git a/gas/configure b/gas/configure<br>
-index 93afb20c8f..81dd4cbd97 100755<br>
+index fbac8f44d5..a40ac2144f 100755<br>
=C2=A0--- a/gas/configure<br>
=C2=A0+++ b/gas/configure<br>
=C2=A0@@ -650,8 +650,11 @@ OTOOL<br>
@@ -5156,7 +5142,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 int main ()<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);<br>
-@@ -15436,13 +16089,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
+@@ -15437,13 +16090,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 lt_unset=3D&#39;`$ECHO &quot;$lt_unset&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_SP2NL=3D&#39;`$ECHO &quot;$lt_SP2NL&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_NL2SP=3D&#39;`$ECHO &quot;$lt_NL2SP&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
@@ -5177,7 +5163,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 STRIP=3D&#39;`$ECHO &quot;$STRIP&quot; | $SED &quot;$delay_single_qu=
ote_subst&quot;`&#39;<br>
=C2=A0 RANLIB=3D&#39;`$ECHO &quot;$RANLIB&quot; | $SED &quot;$delay_single_=
quote_subst&quot;`&#39;<br>
=C2=A0 old_postinstall_cmds=3D&#39;`$ECHO &quot;$old_postinstall_cmds&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -15457,14 +16117,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;<wbr>`$ECHO =
&quot;$lt_cv_sys_global_symbol_<wbr>pipe&quot; | $SED &quot;$de<br>
+@@ -15458,14 +16118,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;<wbr>`$ECHO =
&quot;$lt_cv_sys_global_symbol_<wbr>pipe&quot; | $SED &quot;$de<br>
=C2=A0 lt_cv_sys_global_symbol_to_<wbr>cdecl=3D&#39;`$ECHO &quot;$lt_cv_sys=
_global_symbol_to_<wbr>cdecl&quot; | $SED &quot;$delay_single_quote_subst&q=
uot;`&#39;<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_<wbr>name_address=3D&#39;`$ECHO &quot;$=
lt_cv_sys_global_symbol_to_<wbr>c_name_address&quot; | $SED &quot;$delay_si=
ngle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_<wbr>name_address_lib_prefix=3D&#39;`$<=
wbr>ECHO &quot;$lt_cv_sys_global_symbol_to_<wbr>c_name_address_lib_prefix&q=
uot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -5196,7 +5182,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 DSYMUTIL=3D&#39;`$ECHO &quot;$DSYMUTIL&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 NMEDIT=3D&#39;`$ECHO &quot;$NMEDIT&quot; | $SED &quot;$delay_single_=
quote_subst&quot;`&#39;<br>
=C2=A0 LIPO=3D&#39;`$ECHO &quot;$LIPO&quot; | $SED &quot;$delay_single_quot=
e_subst&quot;`&#39;<br>
-@@ -15497,12 +16160,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;$hard=
code_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
+@@ -15498,12 +16161,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;$hard=
code_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
=C2=A0 hardcode_automatic=3D&#39;`$ECHO &quot;$hardcode_automatic&quot; | $=
SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 inherit_rpath=3D&#39;`$ECHO &quot;$inherit_rpath&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 link_all_deplibs=3D&#39;`$ECHO &quot;$link_all_deplibs&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -5210,7 +5196,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 file_list_spec=3D&#39;`$ECHO &quot;$file_list_spec&quot; | $SED &quo=
t;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 variables_saved_for_relink=3D&#39;`$<wbr>ECHO &quot;$variables_saved=
_for_relink&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 need_lib_prefix=3D&#39;`$ECHO &quot;$need_lib_prefix&quot; | $SED &q=
uot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -15557,8 +16220,13 @@ reload_flag \<br>
+@@ -15558,8 +16221,13 @@ reload_flag \<br>
=C2=A0 OBJDUMP \<br>
=C2=A0 deplibs_check_method \<br>
=C2=A0 file_magic_cmd \<br>
@@ -5224,7 +5210,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 STRIP \<br>
=C2=A0 RANLIB \<br>
=C2=A0 CC \<br>
-@@ -15568,12 +16236,14 @@ lt_cv_sys_global_symbol_pipe \<br>
+@@ -15569,12 +16237,14 @@ lt_cv_sys_global_symbol_pipe \<br>
=C2=A0 lt_cv_sys_global_symbol_to_<wbr>cdecl \<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_<wbr>name_address \<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_<wbr>name_address_lib_prefix \<br>
@@ -5240,7 +5226,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 DSYMUTIL \<br>
=C2=A0 NMEDIT \<br>
=C2=A0 LIPO \<br>
-@@ -15589,7 +16259,6 @@ no_undefined_flag \<br>
+@@ -15590,7 +16260,6 @@ no_undefined_flag \<br>
=C2=A0 hardcode_libdir_flag_spec \<br>
=C2=A0 hardcode_libdir_flag_spec_ld \<br>
=C2=A0 hardcode_libdir_separator \<br>
@@ -5248,7 +5234,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 exclude_expsyms \<br>
=C2=A0 include_expsyms \<br>
=C2=A0 file_list_spec \<br>
-@@ -15625,6 +16294,7 @@ module_cmds \<br>
+@@ -15626,6 +16295,7 @@ module_cmds \<br>
=C2=A0 module_expsym_cmds \<br>
=C2=A0 export_symbols_cmds \<br>
=C2=A0 prelink_cmds \<br>
@@ -5256,7 +5242,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 postinstall_cmds \<br>
=C2=A0 postuninstall_cmds \<br>
=C2=A0 finish_cmds \<br>
-@@ -16389,7 +17059,8 @@ $as_echo X&quot;$file&quot; |<br>
+@@ -16390,7 +17060,8 @@ $as_echo X&quot;$file&quot; |<br>
=C2=A0 # NOTE: Changes made to this file will be lost: look at ltmain.sh.<b=
r>
=C2=A0 #<br>
=C2=A0 #=C2=A0 =C2=A0Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003=
, 2004, 2005,<br>
@@ -5266,7 +5252,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 #=C2=A0 =C2=A0Written by Gordon Matzigkeit, 1996<br>
=C2=A0 #<br>
=C2=A0 #=C2=A0 =C2=A0This file is part of GNU Libtool.<br>
-@@ -16492,19 +17163,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
+@@ -16493,19 +17164,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
=C2=A0 # turn newlines into spaces.<br>
=C2=A0 NL2SP=3D$lt_lt_NL2SP<br>
<br>
@@ -5310,7 +5296,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 # A symbol stripping program.<br>
=C2=A0 STRIP=3D$lt_STRIP<br>
<br>
-@@ -16534,6 +17228,12 @@ global_symbol_to_c_name_<wbr>address=3D$lt_lt_cv_=
sys_global_<wbr>symbol_to_c_name_address<br>
+@@ -16535,6 +17229,12 @@ global_symbol_to_c_name_<wbr>address=3D$lt_lt_cv_=
sys_global_<wbr>symbol_to_c_name_address<br>
=C2=A0 # Transform the output of nm in a C name address pair when lib prefi=
x is needed.<br>
=C2=A0 global_symbol_to_c_name_<wbr>address_lib_prefix=3D$lt_lt_cv_<wbr>sys=
_global_symbol_to_c_name_<wbr>address_lib_prefix<br>
<br>
@@ -5323,7 +5309,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 # The name of the directory that contains temporary libtool files.<b=
r>
=C2=A0 objdir=3D$objdir<br>
<br>
-@@ -16543,6 +17243,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
+@@ -16544,6 +17244,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
=C2=A0 # Must we lock files when doing compilation?<br>
=C2=A0 need_locks=3D$lt_need_locks<br>
<br>
@@ -5333,7 +5319,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 # Tool to manipulate archived DWARF debug symbol files on Mac OS X.<=
br>
=C2=A0 DSYMUTIL=3D$lt_DSYMUTIL<br>
<br>
-@@ -16657,12 +17360,12 @@ with_gcc=3D$GCC<br>
+@@ -16658,12 +17361,12 @@ with_gcc=3D$GCC<br>
=C2=A0 # Compiler flag to turn off builtin functions.<br>
=C2=A0 no_builtin_flag=3D$lt_lt_prog_<wbr>compiler_no_builtin_flag<br>
<br>
@@ -5349,7 +5335,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 # Compiler flag to prevent dynamic linking.<br>
=C2=A0 link_static_flag=3D$lt_lt_prog_<wbr>compiler_static<br>
<br>
-@@ -16749,9 +17452,6 @@ inherit_rpath=3D$inherit_rpath<br>
+@@ -16750,9 +17453,6 @@ inherit_rpath=3D$inherit_rpath<br>
=C2=A0 # Whether libtool must link a program against all its dependency lib=
raries.<br>
=C2=A0 link_all_deplibs=3D$link_all_<wbr>deplibs<br>
<br>
@@ -5359,7 +5345,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 # Set to &quot;yes&quot; if exported symbols are required.<br>
=C2=A0 always_export_symbols=3D$always_<wbr>export_symbols<br>
<br>
-@@ -16767,6 +17467,9 @@ include_expsyms=3D$lt_include_<wbr>expsyms<br>
+@@ -16768,6 +17468,9 @@ include_expsyms=3D$lt_include_<wbr>expsyms<br>
=C2=A0 # Commands necessary for linking programs (against libraries) with t=
emplates.<br>
=C2=A0 prelink_cmds=3D$lt_prelink_cmds<br>
<br>
@@ -5369,7 +5355,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 # Specify filename containing input files.<br>
=C2=A0 file_list_spec=3D$lt_file_list_<wbr>spec<br>
<br>
-@@ -16799,210 +17502,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot;<br>
+@@ -16800,210 +17503,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot;<br>
=C2=A0 =C2=A0 # if finds mixed CR/LF and LF-only lines.=C2=A0 Since sed ope=
rates in<br>
=C2=A0 =C2=A0 # text mode, it properly converts lines to CR/LF.=C2=A0 This =
bash problem<br>
=C2=A0 =C2=A0 # is reportedly fixed, but why not run on old versions too?<b=
r>
@@ -5744,7 +5730,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
=C2=A0diff --git a/gprof/configure b/gprof/configure<br>
-index 679e0dce77..ac4c016a63 100755<br>
+index 6b43bf2b18..245ee48bc3 100755<br>
=C2=A0--- a/gprof/configure<br>
=C2=A0+++ b/gprof/configure<br>
=C2=A0@@ -631,8 +631,11 @@ OTOOL<br>
@@ -7654,7 +7640,7 @@ index 679e0dce77..ac4c016a63 100755<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
=C2=A0diff --git a/ld/configure b/ld/configure<br>
-index d7f66f8cdc..4e71511bd1 100755<br>
+index 0cc6e8a50f..db8b998722 100755<br>
=C2=A0--- a/ld/configure<br>
=C2=A0+++ b/ld/configure<br>
=C2=A0@@ -655,8 +655,11 @@ OTOOL<br>
@@ -17336,7 +17322,7 @@ index bf92b5e079..c573da90c5 100644<br>
=C2=A0 # These exist entirely to fool aclocal when bootstrapping libtool.<b=
r>
=C2=A0 #<br>
=C2=A0diff --git a/opcodes/configure b/opcodes/configure<br>
-index 17530f54b9..79b39611c2 100755<br>
+index 4f29887098..2127d39288 100755<br>
=C2=A0--- a/opcodes/configure<br>
=C2=A0+++ b/opcodes/configure<br>
=C2=A0@@ -650,6 +650,9 @@ OTOOL<br>
@@ -19240,7 +19226,7 @@ index 17530f54b9..79b39611c2 100755<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
=C2=A0diff --git a/opcodes/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a> b/opcodes/<a href=3D"http://configure=
.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
-index a9fbfd61f1..c43780f64d 100644<br>
+index b07f3f3629..5a32d9b1fc 100644<br>
=C2=A0--- a/opcodes/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
=C2=A0+++ b/opcodes/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
=C2=A0@@ -167,7 +167,7 @@ changequote(,)dnl<br>
@@ -21153,5 +21139,5 @@ index dc2d9ed383..ed9a492f5c 100755<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0007-Add-<wbr>the=
-armv5e-architecture-to-<wbr>binutils.patch b/meta/recipes-devtools/<wbr>bi=
nutils/binutils/0007-Add-<wbr>the-armv5e-architecture-to-<wbr>binutils.patc=
h<br>
index 88019606f7..4a5127380f 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0007-Add-<wbr>the-armv5e=
-architecture-to-<wbr>binutils.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0007-Add-<wbr>the-armv5e=
-architecture-to-<wbr>binutils.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2b87aad1741bc481dd0982f100ad5e<wbr>a7f937bb61 Mon Sep 17 00:00:00 200=
1<br>
+From 697903256e09533778baa8af66402c<wbr>44d70219d9 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:37:10 +0000<br>
=C2=A0Subject: [PATCH 07/15] Add the armv5e architecture to binutils<br>
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c<br>
-index a885efe4fc..735eaa7447 100644<br>
+index ec50420518..a25d1721af 100644<br>
=C2=A0--- a/gas/config/tc-arm.c<br>
=C2=A0+++ b/gas/config/tc-arm.c<br>
-@@ -25990,6 +25990,7 @@ static const struct arm_arch_option_table arm_arch=
s[] =3D<br>
+@@ -26195,6 +26195,7 @@ static const struct arm_arch_option_table arm_arch=
s[] =3D<br>
=C2=A0 =C2=A0 ARM_ARCH_OPT (&quot;armv4t&quot;,=C2=A0 =C2=A0 =C2=A0ARM_ARCH=
_V4T,=C2=A0 =C2=A0 FPU_ARCH_FPA),<br>
=C2=A0 =C2=A0 ARM_ARCH_OPT (&quot;armv4txm&quot;,=C2=A0 =C2=A0ARM_ARCH_V4Tx=
M,=C2=A0 FPU_ARCH_FPA),<br>
=C2=A0 =C2=A0 ARM_ARCH_OPT (&quot;armv5&quot;,=C2=A0 =C2=A0 =C2=A0 ARM_ARCH=
_V5,=C2=A0 =C2=A0 =C2=A0FPU_ARCH_VFP),<br>
@@ -31,5 +31,5 @@ index a885efe4fc..735eaa7447 100644<br>
=C2=A0 =C2=A0 ARM_ARCH_OPT (&quot;armv5txm&quot;,=C2=A0 =C2=A0ARM_ARCH_V5Tx=
M,=C2=A0 FPU_ARCH_VFP),<br>
=C2=A0 =C2=A0 ARM_ARCH_OPT (&quot;armv5te&quot;,=C2=A0 =C2=A0 ARM_ARCH_V5TE=
,=C2=A0 =C2=A0FPU_ARCH_VFP),<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0008-don-t-<wbr>l=
et-the-distro-compiler-point-<wbr>to-the-wrong-ins.patch b/meta/recipes-dev=
tools/<wbr>binutils/binutils/0008-don-t-<wbr>let-the-distro-compiler-point-=
<wbr>to-the-wrong-ins.patch<br>
index 30a22b504f..939be67b58 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0008-don-t-<wbr>let-the-=
distro-compiler-point-<wbr>to-the-wrong-ins.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0008-don-t-<wbr>let-the-=
distro-compiler-point-<wbr>to-the-wrong-ins.patch<br>
@@ -1,4 +1,4 @@<br>
-From 331443a87a31ec504e5652fc099d91<wbr>29a9a4deb8 Mon Sep 17 00:00:00 200=
1<br>
+From 622d66634eb2e509d4126f5bdcab26<wbr>de367241a1 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:39:01 +0000<br>
=C2=A0Subject: [PATCH 08/15] don&#39;t let the distro compiler point to the=
 wrong<br>
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in<br>
-index 25cfa29ad5..ce67a710e3 100644<br>
+index ed1b334c36..d4ffd8b57b 100644<br>
=C2=A0--- a/libiberty/Makefile.in<br>
=C2=A0+++ b/libiberty/Makefile.in<br>
=C2=A0@@ -364,7 +364,8 @@ install-strip: install<br>
@@ -31,5 +31,5 @@ index 25cfa29ad5..ce67a710e3 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -n &quot;${target_header_dir}&quot;; th=
en \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${mkinstalldirs} $(=
DESTDIR)$(libdir)/$(<wbr>MULTIOSDIR); \<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0009-warn-<wbr>fo=
r-uses-of-system-<wbr>directories-when-cross-linki.<wbr>patch b/meta/recipe=
s-devtools/<wbr>binutils/binutils/0009-warn-<wbr>for-uses-of-system-<wbr>di=
rectories-when-cross-linki.<wbr>patch<br>
index e0e257880d..e75104722b 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0009-warn-<wbr>for-uses-=
of-system-<wbr>directories-when-cross-linki.<wbr>patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0009-warn-<wbr>for-uses-=
of-system-<wbr>directories-when-cross-linki.<wbr>patch<br>
@@ -1,4 +1,4 @@<br>
-From 0a4afdcf0700efd45963568e2d0049<wbr>127cdf4434 Mon Sep 17 00:00:00 200=
1<br>
+From 27e38ee92c24fca86b1c3f6ef156a1<wbr>892dd06bfd Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Fri, 15 Jan 2016 06:31:09 +0000<br>
=C2=A0Subject: [PATCH 09/15] warn for uses of system directories when cross=
 linking<br>
@@ -77,7 +77,7 @@ index a846743da6..df3cd5fb60 100644<br>
=C2=A0 #undef EXTRA_SHLIB_EXTENSION<br>
<br>
=C2=A0diff --git a/ld/configure b/ld/configure<br>
-index 4e71511bd1..71c6ad1fd1 100755<br>
+index db8b998722..489ead5c13 100755<br>
=C2=A0--- a/ld/configure<br>
=C2=A0+++ b/ld/configure<br>
=C2=A0@@ -789,6 +789,7 @@ with_lib_path<br>
@@ -118,7 +118,7 @@ index 4e71511bd1..71c6ad1fd1 100755<br>
=C2=A0 if test &quot;${enable_gold+set}&quot; =3D set; then :<br>
=C2=A0 =C2=A0 enableval=3D$enable_gold; case &quot;${enableval}&quot; in<br=
>
=C2=A0diff --git a/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a> b/ld/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
-index 00080f85fd..3aa98e37fb 100644<br>
+index bada1b50b0..d074a3820b 100644<br>
=C2=A0--- a/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a><br>
=C2=A0+++ b/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a><br>
=C2=A0@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)<br>
@@ -139,10 +139,10 @@ index 00080f85fd..3aa98e37fb 100644<br>
=C2=A0 dnl &quot;install_as_default&quot; is set to false if gold is the de=
fault linker.<br>
=C2=A0 dnl &quot;installed_linker&quot; is the installed BFD linker name.<b=
r>
=C2=A0diff --git a/ld/ld.h b/ld/ld.h<br>
-index c6fa1247f0..01c373498f 100644<br>
+index ba914b921e..9df17dab6c 100644<br>
=C2=A0--- a/ld/ld.h<br>
=C2=A0+++ b/ld/ld.h<br>
-@@ -174,6 +174,14 @@ typedef struct<br>
+@@ -180,6 +180,14 @@ typedef struct<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0in the linker script.=C2=A0 */<br>
=C2=A0 =C2=A0 bfd_boolean force_group_allocation;<br>
<br>
@@ -158,10 +158,10 @@ index c6fa1247f0..01c373498f 100644<br>
=C2=A0 =C2=A0 enum endian_enum endian;<br>
<br>
=C2=A0diff --git a/ld/ld.texinfo b/ld/ld.texinfo<br>
-index ebe7e7b7bd..33aa2c62fa 100644<br>
+index c89915f1aa..df430837e2 100644<br>
=C2=A0--- a/ld/ld.texinfo<br>
=C2=A0+++ b/ld/ld.texinfo<br>
-@@ -2480,6 +2480,18 @@ string identifying the original linked file does no=
t change.<br>
+@@ -2498,6 +2498,18 @@ string identifying the original linked file does no=
t change.<br>
<br>
=C2=A0 Passing @code{none} for @var{style} disables the setting from any<br=
>
=C2=A0 @code{--build-id} options earlier on the command line.<br>
@@ -181,7 +181,7 @@ index ebe7e7b7bd..33aa2c62fa 100644<br>
<br>
=C2=A0 @c man end<br>
=C2=A0diff --git a/ld/ldfile.c b/ld/ldfile.c<br>
-index 3b37a0a3e2..5c85b01849 100644<br>
+index 6532a57d96..f943f0b2e5 100644<br>
=C2=A0--- a/ld/ldfile.c<br>
=C2=A0+++ b/ld/ldfile.c<br>
=C2=A0@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_b=
oolean cmdline)<br>
@@ -209,7 +209,7 @@ index 3b37a0a3e2..5c85b01849 100644<br>
<br>
=C2=A0 /* Try to open a BFD for a lang_input_statement.=C2=A0 */<br>
=C2=A0diff --git a/ld/ldlex.h b/ld/ldlex.h<br>
-index 5aa7f6bc3e..cb655e0399 100644<br>
+index 140ed1d9da..9965cbc04f 100644<br>
=C2=A0--- a/ld/ldlex.h<br>
=C2=A0+++ b/ld/ldlex.h<br>
=C2=A0@@ -147,6 +147,8 @@ enum option_values<br>
@@ -222,7 +222,7 @@ index 5aa7f6bc3e..cb655e0399 100644<br>
<br>
=C2=A0 /* The initial parser states.=C2=A0 */<br>
=C2=A0diff --git a/ld/ldmain.c b/ld/ldmain.c<br>
-index 2b09f20413..89e2a3a805 100644<br>
+index c473ed24c3..adae0b4610 100644<br>
=C2=A0--- a/ld/ldmain.c<br>
=C2=A0+++ b/ld/ldmain.c<br>
=C2=A0@@ -261,6 +261,8 @@ main (int argc, char **argv)<br>
@@ -235,7 +235,7 @@ index 2b09f20413..89e2a3a805 100644<br>
=C2=A0 =C2=A0 /* We initialize DEMANGLING based on the environment variable=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0COLLECT_NO_DEMANGLE.=C2=A0 The gcc collect2 prog=
ram will demangle the<br>
=C2=A0diff --git a/ld/lexsup.c b/ld/lexsup.c<br>
-index effa277b16..e4929607e9 100644<br>
+index f2191602d4..bccb3bdeef 100644<br>
=C2=A0--- a/ld/lexsup.c<br>
=C2=A0+++ b/ld/lexsup.c<br>
=C2=A0@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =3D<b=
r>
@@ -269,5 +269,5 @@ index effa277b16..e4929607e9 100644<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0010-Fix-<wbr>rpa=
th-in-libtool-when-sysroot-<wbr>is-enabled.patch b/meta/recipes-devtools/<w=
br>binutils/binutils/0010-Fix-<wbr>rpath-in-libtool-when-sysroot-<wbr>is-en=
abled.patch<br>
index 496242efa4..33dfff9bd7 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0010-Fix-<wbr>rpath-in-l=
ibtool-when-sysroot-<wbr>is-enabled.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0010-Fix-<wbr>rpath-in-l=
ibtool-when-sysroot-<wbr>is-enabled.patch<br>
@@ -1,4 +1,4 @@<br>
-From 88fac08f1c472c612f381cbb940875<wbr>6f2f58b4ff Mon Sep 17 00:00:00 200=
1<br>
+From e205ae05c41a8cc8d47708f0a3b6f7<wbr>40e2bf2526 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:42:38 +0000<br>
=C2=A0Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled<b=
r>
@@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$hardcode_libdir=
s&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdirs=3D&quot;$=
libdir&quot;<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0011-Change-<wbr>=
default-emulation-for-mips64-<wbr>linux.patch b/meta/recipes-devtools/<wbr>=
binutils/binutils/0011-Change-<wbr>default-emulation-for-mips64-<wbr>linux.=
patch<br>
index ac87a2d1de..80fcbc1194 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0011-Change-<wbr>default=
-emulation-for-mips64-<wbr>linux.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0011-Change-<wbr>default=
-emulation-for-mips64-<wbr>linux.patch<br>
@@ -1,4 +1,4 @@<br>
-From 497660bdbeb6788786553a5d733105<wbr>f7f898dc62 Mon Sep 17 00:00:00 200=
1<br>
+From 7978c1299021033c35c29c94e09972<wbr>35f7ede248 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Mon, 2 Mar 2015 01:44:14 +0000<br>
=C2=A0Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux<b=
r>
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 2 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/bfd/config.bfd b/bfd/config.bfd<br>
-index dc24aabad5..4511024f22 100644<br>
+index f04a993f06..8777f96bd2 100644<br>
=C2=A0--- a/bfd/config.bfd<br>
=C2=A0+++ b/bfd/config.bfd<br>
-@@ -1186,12 +1186,12 @@ case &quot;${targ}&quot; in<br>
+@@ -1189,12 +1189,12 @@ case &quot;${targ}&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_le_<wbr>vec mips_elf64=
_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 mips64*el-*-linux*)<br>
@@ -35,12 +35,12 @@ index dc24aabad5..4511024f22 100644<br>
=C2=A0 =C2=A0 mips*el-*-linux*)<br>
=C2=A0 =C2=A0 =C2=A0 targ_defvec=3Dmips_elf32_trad_<wbr>le_vec<br>
=C2=A0diff --git a/ld/configure.tgt b/ld/configure.tgt<br>
-index 47c719cd05..fe7b9238b2 100644<br>
+index 6183a85b3d..1d78465590 100644<br>
=C2=A0--- a/ld/configure.tgt<br>
=C2=A0+++ b/ld/configure.tgt<br>
-@@ -530,11 +530,11 @@ mips*el-*-vxworks*)=C2=A0 =C2=A0 =C2=A0 targ_emul=3D=
elf32elmipvxworks<br>
+@@ -535,11 +535,11 @@ mips*el-*-vxworks*)=C2=A0 =C2=A0 =C2=A0 targ_emul=3D=
elf32elmipvxworks<br>
=C2=A0 mips*-*-vxworks*)=C2=A0 =C2=A0 =C2=A0targ_emul=3Delf32ebmipvxworks<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0targ_extra_emuls=3D&quot;<wbr>elf32elmipvxworks&quot; ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0targ_extra_emuls=3D&quot;<wbr>elf32elmipvxworks&quot; ;;<br>
=C2=A0 mips*-*-windiss)=C2=A0 =C2=A0 =C2=A0 targ_emul=3Delf32mipswindiss ;;=
<br>
=C2=A0-mips64*el-*-linux-*)=C2=A0 targ_emul=3Delf32ltsmipn32<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;<wbr>elf32btsmipn32 elf32ltsmip elf32bt=
smip elf64ltsmip elf64btsmip&quot;<br>
@@ -55,5 +55,5 @@ index 47c719cd05..fe7b9238b2 100644<br>
=C2=A0 mips*el-*-linux-*)=C2=A0 =C2=A0 targ_emul=3Delf32ltsmip<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32btsmip elf32ltsmipn32 elf64ltsmip =
elf32btsmipn32 elf64btsmip&quot;<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0012-Add-<wbr>sup=
port-for-Netlogic-XLP.patch b/meta/recipes-devtools/<wbr>binutils/binutils/=
0012-Add-<wbr>support-for-Netlogic-XLP.patch<br>
index dc5e580739..1fefb680f8 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0012-Add-<wbr>support-fo=
r-Netlogic-XLP.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0012-Add-<wbr>support-fo=
r-Netlogic-XLP.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8c60a55d3678589d93739bd27fec21<wbr>6911d80968 Mon Sep 17 00:00:00 200=
1<br>
+From 3b40bf584615f794b85fd50d4d0a5c<wbr>0a1d2ee7bf Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Sun, 14 Feb 2016 17:06:19 +0000<br>
=C2=A0Subject: [PATCH 12/15] Add support for Netlogic XLP<br>
@@ -34,7 +34,7 @@ Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatl=
e@windriver.com">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0 14 files changed, 61 insertions(+), 21 deletions(-)<br>
<br>
=C2=A0diff --git a/bfd/aoutx.h b/bfd/aoutx.h<br>
-index 3d38fda14b..0aec49bbb3 100644<br>
+index eec9c4ad2a..3bf0a71e63 100644<br>
=C2=A0--- a/bfd/aoutx.h<br>
=C2=A0+++ b/bfd/aoutx.h<br>
=C2=A0@@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architecture =
arch,<br>
@@ -46,34 +46,34 @@ index 3d38fda14b..0aec49bbb3 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch_flags =3D M_MIPS2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0diff --git a/bfd/archures.c b/bfd/archures.c<br>
-index 433b95fa08..063b7943a1 100644<br>
+index e83c57a2f3..3016ea1bae 100644<br>
=C2=A0--- a/bfd/archures.c<br>
=C2=A0+++ b/bfd/archures.c<br>
=C2=A0@@ -201,6 +201,7 @@ DESCRIPTION<br>
- .#define bfd_mach_mips_octeon3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6503<br>
- .#define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 887682=C2=A0 =C2=A0{* decimal &#39;XLR&#39;=C2=A0 *}<br>
- .#define bfd_mach_mips_interaptiv_mr2=C2=A0 =C2=A0736550=C2=A0 =C2=A0{* d=
ecimal &#39;IA2&#39;=C2=A0 *}<br>
-+.#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 887680=C2=A0 =C2=A0{* decimal &#39;XLP&#39;=C2=A0 *}<br>
- .#define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A032<br>
- .#define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A033<=
br>
- .#define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A034<=
br>
+ .#define bfd_mach_mips_octeon3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 6503<br>
+ .#define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 88768=
2=C2=A0 =C2=A0{* decimal &#39;XLR&#39;.=C2=A0 *}<br>
+ .#define bfd_mach_mips_interaptiv_mr2 736550=C2=A0 =C2=A0{* decimal &#39;=
IA2&#39;.=C2=A0 *}<br>
++.#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 887680=C2=A0 =C2=A0{* decimal &#39;XLP&#39;.=C2=A0 *}<br>
+ .#define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032<br=
>
+ .#define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A033<br>
+ .#define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A034<br>
=C2=A0diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h<br>
-index d126aed086..2b753b3a93 100644<br>
+index 42991e7848..27abc5d5a8 100644<br>
=C2=A0--- a/bfd/bfd-in2.h<br>
=C2=A0+++ b/bfd/bfd-in2.h<br>
-@@ -2060,6 +2060,7 @@ enum bfd_architecture<br>
+@@ -2062,6 +2062,7 @@ enum bfd_architecture<br>
=C2=A0 #define bfd_mach_mips_octeon3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6503=
<br>
- #define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 887682=C2=A0 =C2=A0/* decimal &#39;XLR&#39;=C2=A0 */<br>
- #define bfd_mach_mips_interaptiv_mr2=C2=A0 =C2=A0736550=C2=A0 =C2=A0/* de=
cimal &#39;IA2&#39;=C2=A0 */<br>
-+#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 887680=C2=A0 =C2=A0/* decimal &#39;XLP&#39;=C2=A0 */<br>
+ #define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 887682=C2=A0 =C2=A0/* decimal &#39;XLR&#39;.=C2=A0 */<br>
+ #define bfd_mach_mips_interaptiv_mr2=C2=A0 =C2=A0736550=C2=A0 =C2=A0/* de=
cimal &#39;IA2&#39;.=C2=A0 */<br>
++#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 887680=C2=A0 =C2=A0/* decimal &#39;XLP&#39;.=C2=A0 */<br>
=C2=A0 #define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A032<br>
=C2=A0 #define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A033<br>
=C2=A0 #define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A034<br>
=C2=A0diff --git a/bfd/config.bfd b/bfd/config.bfd<br>
-index 4511024f22..f0f9072f10 100644<br>
+index 8777f96bd2..7b80bda8c9 100644<br>
=C2=A0--- a/bfd/config.bfd<br>
=C2=A0+++ b/bfd/config.bfd<br>
-@@ -1169,6 +1169,11 @@ case &quot;${targ}&quot; in<br>
+@@ -1172,6 +1172,11 @@ case &quot;${targ}&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 targ_defvec=3Dmips_elf32_le_vec<br>
=C2=A0 =C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_be_<wbr>vec mips_elf64=
_be_vec mips_elf64_le_vec&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
@@ -86,7 +86,7 @@ index 4511024f22..f0f9072f10 100644<br>
=C2=A0 =C2=A0 =C2=A0 targ_defvec=3Dmips_elf32_be_vec<br>
=C2=A0 =C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_le_<wbr>vec mips_elf64=
_be_vec mips_elf64_le_vec&quot;<br>
=C2=A0diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c<br>
-index 2493094bef..8375d1ae96 100644<br>
+index cb50c64371..2b9d1d6ecf 100644<br>
=C2=A0--- a/bfd/cpu-mips.c<br>
=C2=A0+++ b/bfd/cpu-mips.c<br>
=C2=A0@@ -105,7 +105,8 @@ enum<br>
@@ -100,7 +100,7 @@ index 2493094bef..8375d1ae96 100644<br>
<br>
=C2=A0 #define NN(index) (&amp;arch_info_struct[(index) + 1])<br>
=C2=A0@@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_struct[=
] =3D<br>
-=C2=A0 =C2=A0N (64, 64, bfd_mach_mips_xlr, &quot;mips:xlr&quot;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0FALSE, NN(I_xlr)),<br>
+=C2=A0 =C2=A0N (64, 64, bfd_mach_mips_xlr, &quot;mips:xlr&quot;,=C2=A0 =C2=
=A0 =C2=A0FALSE, NN(I_xlr)),<br>
=C2=A0 =C2=A0 N (32, 32, bfd_mach_mips_interaptiv_mr2, &quot;mips:interapti=
v-mr2&quot;, FALSE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0NN(I_interaptiv_mr2)),<br>
=C2=A0-=C2=A0 N (64, 64, bfd_mach_mips_micromips,&quot;mips:<wbr>micromips&=
quot;,FALSE,0)<br>
@@ -110,10 +110,10 @@ index 2493094bef..8375d1ae96 100644<br>
<br>
=C2=A0 /* The default architecture is mips:3000, but with a machine number =
of<br>
=C2=A0diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c<br>
-index fddf68c816..354c85d00b 100644<br>
+index 285401367d..14ebb5f175 100644<br>
=C2=A0--- a/bfd/elfxx-mips.c<br>
=C2=A0+++ b/bfd/elfxx-mips.c<br>
-@@ -6796,6 +6796,9 @@ _bfd_elf_mips_mach (flagword flags)<br>
+@@ -6806,6 +6806,9 @@ _bfd_elf_mips_mach (flagword flags)<br>
=C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_IAMR2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bfd_mach_mips_interaptiv_mr2;<br>
<br>
@@ -123,7 +123,7 @@ index fddf68c816..354c85d00b 100644<br>
=C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (flags &amp; EF_MIPS_ARCH)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-@@ -11956,6 +11959,10 @@ mips_set_isa_flags (bfd *abfd)<br>
+@@ -11963,6 +11966,10 @@ mips_set_isa_flags (bfd *abfd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
@@ -134,7 +134,7 @@ index fddf68c816..354c85d00b 100644<br>
=C2=A0 =C2=A0 =C2=A0 case bfd_mach_mipsisa32:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D E_MIPS_ARCH_32;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -13989,6 +13996,7 @@ static const struct mips_mach_extension mips_mach_=
extensions[] =3D<br>
+@@ -13936,6 +13943,7 @@ static const struct mips_mach_extension mips_mach_=
extensions[] =3D<br>
=C2=A0 =C2=A0 { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },<br>
=C2=A0 =C2=A0 { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },<br>
=C2=A0 =C2=A0 { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },<br>
@@ -143,10 +143,10 @@ index fddf68c816..354c85d00b 100644<br>
=C2=A0 =C2=A0 /* MIPS64 extensions.=C2=A0 */<br>
=C2=A0 =C2=A0 { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },<br>
=C2=A0diff --git a/binutils/readelf.c b/binutils/readelf.c<br>
-index 2b15f0f2cb..092744708e 100644<br>
+index ae1cda9a7b..fed0387a94 100644<br>
=C2=A0--- a/binutils/readelf.c<br>
=C2=A0+++ b/binutils/readelf.c<br>
-@@ -3335,6 +3335,7 @@ get_machine_flags (unsigned e_flags, unsigned e_mach=
ine)<br>
+@@ -3370,6 +3370,7 @@ get_machine_flags (Filedata * filedata, unsigned e_f=
lags, unsigned e_machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_OCTEON3: strcat =
(buf, &quot;, octeon3&quot;); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_XLR:=C2=A0 strca=
t (buf, &quot;, xlr&quot;); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_IAMR2:=C2=A0 str=
cat (buf, &quot;, interaptiv-mr2&quot;); break;<br>
@@ -155,7 +155,7 @@ index 2b15f0f2cb..092744708e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We simply ignore the field in =
this case to avoid confusion:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPS ELF does not sp=
ecify EF_MIPS_MACH, it is a GNU<br>
=C2=A0diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c<br>
-index 3804df2958..9576c986db 100644<br>
+index c135131b59..d8fbda8e31 100644<br>
=C2=A0--- a/gas/config/tc-mips.c<br>
=C2=A0+++ b/gas/config/tc-mips.c<br>
=C2=A0@@ -552,6 +552,7 @@ static int mips_32bitmode =3D 0;<br>
@@ -174,7 +174,7 @@ index 3804df2958..9576c986db 100644<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 /* Whether the processor uses hardware interlocks to protect reads<b=
r>
-@@ -19738,7 +19740,7 @@ static const struct mips_cpu_info mips_cpu_info_ta=
ble[] =3D<br>
+@@ -19737,7 +19739,7 @@ static const struct mips_cpu_info mips_cpu_info_ta=
ble[] =3D<br>
=C2=A0 =C2=A0 /* Broadcom XLP.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0XLP is mostly like XLR, with the prominent excep=
tion that it is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0MIPS64R2 rather than MIPS64.=C2=A0 */<br>
@@ -184,7 +184,7 @@ index 3804df2958..9576c986db 100644<br>
=C2=A0 =C2=A0 /* MIPS 64 Release 6 */<br>
=C2=A0 =C2=A0 { &quot;i6400&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0, ASE_MSA,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_MIPS64R6, CPU_MI=
PS64R6},<br>
=C2=A0diff --git a/gas/configure b/gas/configure<br>
-index 81dd4cbd97..95bdf3b19b 100755<br>
+index a40ac2144f..65a6995243 100755<br>
=C2=A0--- a/gas/configure<br>
=C2=A0+++ b/gas/configure<br>
=C2=A0@@ -12989,6 +12989,9 @@ _ACEOF<br>
@@ -198,7 +198,7 @@ index 81dd4cbd97..95bdf3b19b 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mips_cpu=3Dr3900<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0diff --git a/include/elf/mips.h b/include/elf/mips.h<br>
-index a4bea43ff8..73d904e25f 100644<br>
+index 9de0b4e175..74fc4f7e55 100644<br>
=C2=A0--- a/include/elf/mips.h<br>
=C2=A0+++ b/include/elf/mips.h<br>
=C2=A0@@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)<br>
@@ -210,7 +210,7 @@ index a4bea43ff8..73d904e25f 100644<br>
=C2=A0 #define E_MIPS_MACH_OCTEON3=C2=A0 =C2=A00x008e0000<br>
=C2=A0 #define E_MIPS_MACH_5400=C2=A0 =C2=A0 =C2=A0 0x00910000<br>
=C2=A0diff --git a/include/opcode/mips.h b/include/opcode/mips.h<br>
-index ceae9ec50a..276ee3c6c1 100644<br>
+index 5eea72f139..90f6d57e15 100644<br>
=C2=A0--- a/include/opcode/mips.h<br>
=C2=A0+++ b/include/opcode/mips.h<br>
=C2=A0@@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[] =3D =
{<br>
@@ -241,10 +241,10 @@ index ceae9ec50a..276ee3c6c1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0diff --git a/ld/configure.tgt b/ld/configure.tgt<br>
-index fe7b9238b2..2adf108b17 100644<br>
+index 1d78465590..307e787b64 100644<br>
=C2=A0--- a/ld/configure.tgt<br>
=C2=A0+++ b/ld/configure.tgt<br>
-@@ -516,6 +516,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*=
)<br>
+@@ -521,6 +521,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*=
)<br>
=C2=A0 mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_emul=3Delf32btsmip<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32ltsmip elf32btsmipn32 elf64btsmip =
elf32ltsmipn32 elf64ltsmip&quot; ;;<br>
@@ -254,7 +254,7 @@ index fe7b9238b2..2adf108b17 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32lr5900&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_libpath=3D$targ_<wbr>extra_emuls ;;<br>
=C2=A0diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c<br>
-index 45195007c1..4a80a05d19 100644<br>
+index 984fcbb802..95b107d216 100644<br>
=C2=A0--- a/opcodes/mips-dis.c<br>
=C2=A0+++ b/opcodes/mips-dis.c<br>
=C2=A0@@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices=
[] =3D<br>
@@ -277,7 +277,7 @@ index 45195007c1..4a80a05d19 100644<br>
=C2=A0 =C2=A0 /* This entry, mips16, is here only for ISA/processor selecti=
on; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0not print its name.=C2=A0 */<br>
=C2=A0diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c<br>
-index 19fca408c9..d02069c528 100644<br>
+index 180d613c93..65b7b8cc23 100644<br>
=C2=A0--- a/opcodes/mips-opc.c<br>
=C2=A0+++ b/opcodes/mips-opc.c<br>
=C2=A0@@ -328,6 +328,7 @@ decode_mips_operand (const char *p)<br>
@@ -389,5 +389,5 @@ index 19fca408c9..d02069c528 100644<br>
=C2=A0 {&quot;swc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;E,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 (int) M_SWC0_A=
B,=C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 IOCT|IOCTP|IOCT2|I37 },<br>
=C2=A0 {&quot;swc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;T,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xe4000000, 0xfc000000, RD_1|R=
D_3|SM|FP_S,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 0 },<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0013-fix-<wbr>the=
-incorrect-assembling-for-<wbr>ppc-wait-mnemonic.patch b/meta/recipes-devto=
ols/<wbr>binutils/binutils/0013-fix-<wbr>the-incorrect-assembling-for-<wbr>=
ppc-wait-mnemonic.patch<br>
index 247376b7ed..c3e1b13841 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0013-fix-<wbr>the-incorr=
ect-assembling-for-<wbr>ppc-wait-mnemonic.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0013-fix-<wbr>the-incorr=
ect-assembling-for-<wbr>ppc-wait-mnemonic.patch<br>
@@ -1,4 +1,4 @@<br>
-From e46202becab625c6c08caf91e08ccb<wbr>bc1bf799c4 Mon Sep 17 00:00:00 200=
1<br>
+From 27ec22ca3cd56cfdf060d2e1f414be<wbr>dce269b322 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Zhenhua Luo &lt;<a href=3D"mailto:zhenhua.luo@nxp.com">zhenhua.=
luo@nxp.com</a>&gt;<br>
=C2=A0Date: Sat, 11 Jun 2016 22:08:29 -0500<br>
=C2=A0Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait mnem=
onic<br>
@@ -11,10 +11,10 @@ Upstream-Status: Pending<br>
=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c<br>
-index 426261ab21..0d35916cdd 100644<br>
+index bb17f26c2e..dbdd762b4e 100644<br>
=C2=A0--- a/opcodes/ppc-opc.c<br>
=C2=A0+++ b/opcodes/ppc-opc.c<br>
-@@ -4881,7 +4881,6 @@ const struct powerpc_opcode powerpc_opcodes[] =3D {<=
br>
+@@ -5338,7 +5338,6 @@ const struct powerpc_opcode powerpc_opcodes[] =3D {<=
br>
=C2=A0 {&quot;ldepx&quot;,=C2=A0 =C2=A0 =C2=A0X(31,29),=C2=A0 =C2=A0 =C2=A0=
 =C2=A0X_MASK,=C2=A0 =C2=A0E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 {RT, RA0, RB}},<br>
<br>
=C2=A0 {&quot;waitasec&quot;,=C2=A0 X(31,30),=C2=A0 =C2=A0 =C2=A0 XRTRARB_M=
ASK, POWER8,=C2=A0 =C2=A0 POWER9,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{0}},<br=
>
@@ -22,7 +22,7 @@ index 426261ab21..0d35916cdd 100644<br>
<br>
=C2=A0 {&quot;lwepx&quot;,=C2=A0 =C2=A0 =C2=A0X(31,31),=C2=A0 =C2=A0 =C2=A0=
 =C2=A0X_MASK,=C2=A0 =C2=A0E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 {RT, RA0, RB}},<br>
<br>
-@@ -4935,7 +4934,7 @@ const struct powerpc_opcode powerpc_opcodes[] =3D {<=
br>
+@@ -5392,7 +5391,7 @@ const struct powerpc_opcode powerpc_opcodes[] =3D {<=
br>
<br>
=C2=A0 {&quot;waitrsv&quot;,=C2=A0 =C2=A0X(31,62)|(1&lt;&lt;21), 0xffffffff=
, E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0}},<br>
=C2=A0 {&quot;waitimpl&quot;,=C2=A0 X(31,62)|(2&lt;&lt;21), 0xffffffff, E50=
0MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0}},<br>
@@ -32,5 +32,5 @@ index 426261ab21..0d35916cdd 100644<br>
=C2=A0 {&quot;dcbstep&quot;,=C2=A0 =C2=A0XRT(31,63,0),=C2=A0 =C2=A0XRT_MASK=
,=C2=A0 =C2=A0 E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{RA=
0, RB}},<br>
<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0014-Detect-<wbr>=
64-bit-MIPS-targets.patch b/meta/recipes-devtools/<wbr>binutils/binutils/00=
14-Detect-<wbr>64-bit-MIPS-targets.patch<br>
index 42b1065f8d..cf3690f25d 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0014-Detect-<wbr>64-bit-=
MIPS-targets.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0014-Detect-<wbr>64-bit-=
MIPS-targets.patch<br>
@@ -1,4 +1,4 @@<br>
-From bf20d5823662d1f2eb47de2cdfd173<wbr>627a205b17 Mon Sep 17 00:00:00 200=
1<br>
+From 7dfbd6889d868a09d695dd27361048<wbr>48c1a9c9c3 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Fri, 31 Mar 2017 11:42:03 -0700<br>
=C2=A0Subject: [PATCH 14/15] Detect 64-bit MIPS targets<br>
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 14 insertions(+)<br>
<br>
=C2=A0diff --git a/gold/configure.tgt b/gold/configure.tgt<br>
-index 3d63027297..c1f92a1360 100644<br>
+index 8aef22a318..7030026ffa 100644<br>
=C2=A0--- a/gold/configure.tgt<br>
=C2=A0+++ b/gold/configure.tgt<br>
=C2=A0@@ -153,6 +153,13 @@ aarch64*-*)<br>
@@ -46,5 +46,5 @@ index 3d63027297..c1f92a1360 100644<br>
=C2=A0 =C2=A0targ_obj=3Dmips<br>
=C2=A0 =C2=A0targ_machine=3DEM_MIPS<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/binutils/0015-sync-<wbr>wi=
th-OE-libtool-changes.patch b/meta/recipes-devtools/<wbr>binutils/binutils/=
0015-sync-<wbr>with-OE-libtool-changes.patch<br>
index 2c8900cb66..8c9fd237e7 100644<br>
--- a/meta/recipes-devtools/<wbr>binutils/binutils/0015-sync-<wbr>with-OE-l=
ibtool-changes.patch<br>
+++ b/meta/recipes-devtools/<wbr>binutils/binutils/0015-sync-<wbr>with-OE-l=
ibtool-changes.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9b456a0e4f284fd41ac36595144ed4<wbr>4dc82410ee Mon Sep 17 00:00:00 200=
1<br>
+From 298804f430939d6cc94b09732ee93e<wbr>64c5e6be18 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.b=
urton@intel.com</a>&gt;<br>
=C2=A0Date: Mon, 6 Mar 2017 23:33:27 -0800<br>
=C2=A0Subject: [PATCH 15/15] sync with OE libtool changes<br>
@@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif test -n &quot;$runpath_var&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$finalize_perm_rpath &quot; i=
n<br>
=C2=A0--<br>
-2.14.0<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils=
_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.29.1.bb</a> b/m=
eta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils_2.30.bb" rel=
=3D"noreferrer" target=3D"_blank">binutils_2.30.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils_=
2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.29.1.bb</a><br>
rename to meta/recipes-devtools/<wbr>binutils/<a href=3D"http://binutils_2.=
30.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.30.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11c0122e5984010564552e14--
