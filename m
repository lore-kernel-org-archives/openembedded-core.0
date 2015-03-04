Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id D21986017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 20:31:08 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so1767477qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 12:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=P03hmEqTrUVTAOZ40vxLa83K7THQT4fm65UXXcCxCkM=;
	b=l8QZKchbthZ0vTh9pTJeefweVw6l5Zj4YX1Ga4B5Yr1AVgYPc179m7XkcUBql4Ds/V
	r7R26uG7qQdkNyCZcxX14Ryy9pcoo+W0cynkg43dWsN77yqUCQKbQz9SEtFSZzDbW6Mh
	niOSaJbBuGPSXJdJBx12vG0UW90DoPgu7dqeZr8iJdf9Lh97dzppM+T86eidTYpPgvcU
	jZyBYcIMaSbL4U1idIq2lKOcGCa8IP2zZfxXR8X9bt5qbcH5qHv60zR7ObEnQ99v/xNj
	R6lZMRvdn3GHlFmdLghmrFY285hAB3bSuijLyGHMjhv4IMEFzONvg076kyretVsC9IQs
	wQvA==
X-Gm-Message-State: ALoCoQnOxjKM/isb2qBvkpEDc5IJKTNbiVHt09BUplvogxTEgD35pFtiJOkGYrKm6NMOmtXa0TnQ
X-Received: by 10.229.173.7 with SMTP id n7mr8371287qcz.20.1425501069249; Wed,
	04 Mar 2015 12:31:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 12:30:47 -0800 (PST)
In-Reply-To: <1425262260-15211-1-git-send-email-raj.khem@gmail.com>
References: <1425262260-15211-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 20:30:47 +0000
Message-ID: <CAJTo0Law_dn_48_Oa+PW_YU0-mYX8a_Tb30KYj0oZUwRA3Drfg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] binutils: upgrade to 2.25
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
X-List-Received-Date: Wed, 04 Mar 2015 20:31:15 -0000
Content-Type: multipart/alternative; boundary=089e016337aadc225405107c54ae

--089e016337aadc225405107c54ae
Content-Type: text/plain; charset=UTF-8

Hi Khem,

We're feature frozen now, I'm assuming there are no amazing reasons to
upgrade and this can be merged early in 1.9 M1?

Ross

On 2 March 2015 at 02:10, Khem Raj <raj.khem@gmail.com> wrote:

> From: Robert Yang <liezhi.yang@windriver.com>
>
> * Remove the following patches since they are already in the new code:
>   binutils/fix-pr15815.patch
>   binutils/fix-pr16428.patch
>   binutils/fix-pr16476.patch
>   binutils/fix-pr2404.patch
>   binutils/replace_macros_with_static_inline.patch
>   binutils/binutils_CVE-2014-8484.patch
>   binutils/binutils_CVE-2014-8485.patch
>   binutils/binutils_CVE-2014-8501.patch
>   binutils/binutils_CVE-2014-8502.patch
>   binutils/binutils_CVE-2014-8502_1.patch
>   binutils/binutils_CVE-2014-8503.patch
>   binutils/binutils_CVE-2014-8504.patch
>   binutils/binutils_CVE-2014-8737.patch
>
> * The file src-release is gone.
>
> * Updated patches for the new code.
>
> Conflicts:
>         meta/conf/distro/include/tcmode-default.inc
>
> Change-Id: Ifd88f07771238755081a993b843ace423742eb85
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |   2 +-
>  .../{binutils-2.24.inc => binutils-2.25.inc}       |  20 +-
>  ...ian_2.24.bb => binutils-cross-canadian_2.25.bb} |   0
>  ...nutils-cross_2.24.bb => binutils-cross_2.25.bb} |   0
>  ...-crosssdk_2.24.bb => binutils-crosssdk_2.25.bb} |   0
>  .../binutils/binutils/binutils-poison.patch        |  40 +-
>  .../binutils/binutils/binutils-xlp-support.patch   | 296 ++++++------
>  .../binutils/binutils/binutils_CVE-2014-8484.patch |  67 ---
>  .../binutils/binutils/binutils_CVE-2014-8485.patch | 102 ----
>  .../binutils/binutils/binutils_CVE-2014-8501.patch |  60 ---
>  .../binutils/binutils/binutils_CVE-2014-8502.patch |  89 ----
>  .../binutils/binutils_CVE-2014-8502_1.patch        | 523
> ---------------------
>  .../binutils/binutils/binutils_CVE-2014-8503.patch |  47 --
>  .../binutils/binutils/binutils_CVE-2014-8504.patch |  75 ---
>  .../binutils/binutils/binutils_CVE-2014-8737.patch | 177 -------
>  .../binutils/binutils/fix-pr15815.patch            |  36 --
>  .../binutils/binutils/fix-pr16428.patch            | 123 -----
>  .../binutils/binutils/fix-pr16476.patch            | 220 ---------
>  .../binutils/binutils/fix-pr2404.patch             |  76 ---
>  .../binutils/binutils/libtool-2.4-update.patch     | 301 ++++++------
>  .../binutils/mips64-default-ld-emulation.patch     |  38 +-
>  .../replace_macros_with_static_inline.patch        | 188 --------
>  .../{binutils_2.24.bb => binutils_2.25.bb}         |   0
>  23 files changed, 340 insertions(+), 2140 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.24.inc =>
> binutils-2.25.inc} (58%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.24.bb
> => binutils-cross-canadian_2.25.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.24.bb =>
> binutils-cross_2.25.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.24.bb =>
> binutils-crosssdk_2.25.bb} (100%)
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.24.bb =>
> binutils_2.25.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 6b602d2..c17e0eb 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>
>  GCCVERSION ?= "4.9%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.24"
> +BINUVERSION ?= "2.25"
>  GLIBCVERSION ?= "2.21"
>  UCLIBCVERSION ?= "0.9.33+git%"
>  LINUXLIBCVERSION ?= "3.19"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc
> b/meta/recipes-devtools/binutils/binutils-2.25.inc
> similarity index 58%
> rename from meta/recipes-devtools/binutils/binutils-2.24.inc
> rename to meta/recipes-devtools/binutils/binutils-2.25.inc
> index 63c9287..d69b519 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.24.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.25.inc
> @@ -1,5 +1,4 @@
>  LIC_FILES_CHKSUM="\
> -    file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
>      file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
>      file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674\
>      file://COPYING3;md5=d32239bcb673463ab874e80d47fae504\
> @@ -25,22 +24,7 @@ SRC_URI = "\
>       file://binutils-armv5e.patch \
>       file://mips64-default-ld-emulation.patch \
>       file://binutils-xlp-support.patch \
> -     file://fix-pr15815.patch \
> -     file://fix-pr2404.patch \
> -     file://fix-pr16476.patch \
> -     file://fix-pr16428.patch \
> -     file://replace_macros_with_static_inline.patch \
> -
>  file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
> -     file://binutils-uninitialised-warning.patch \
> -     file://binutils_CVE-2014-8484.patch \
> -     file://binutils_CVE-2014-8485.patch \
> -     file://binutils_CVE-2014-8501.patch \
> -     file://binutils_CVE-2014-8502_1.patch \
> -     file://binutils_CVE-2014-8502.patch \
> -     file://binutils_CVE-2014-8503.patch \
> -     file://binutils_CVE-2014-8504.patch \
> -     file://binutils_CVE-2014-8737.patch \
>       "
> +SRC_URI[md5sum] = "d9f3303f802a5b6b0bb73a335ab89d66"
> +SRC_URI[sha256sum] =
> "22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacfed3e2ec17b08c882923"
>
> -SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
> -SRC_URI[sha256sum] =
> "e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1809871177a0f0f14137"
> diff --git a/meta/recipes-devtools/binutils/
> binutils-cross-canadian_2.24.bb b/meta/recipes-devtools/binutils/
> binutils-cross-canadian_2.25.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.24.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.24.bb
> b/meta/recipes-devtools/binutils/binutils-cross_2.25.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.24.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.25.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
> b/meta/recipes-devtools/binutils/binutils-crosssdk_2.25.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.25.bb
> diff --git a/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
> b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
> index 996c023..eb54076 100644
> --- a/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
> +++ b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
> @@ -106,10 +106,10 @@ Index: binutils-2.24/ld/configure
>
>   # Check whether --enable-got was given.
>   if test "${enable_got+set}" = set; then :
> -Index: binutils-2.24/ld/configure.in
> +Index: binutils-2.24/ld/configure.ac
>  ===================================================================
> ---- binutils-2.24.orig/ld/configure.in 2013-12-15 11:46:17.000000000
> -0800
> -+++ binutils-2.24/ld/configure.in      2013-12-15 11:46:59.810435651
> -0800
> +--- binutils-2.24.orig/ld/configure.ac 2013-12-15 11:46:17.000000000
> -0800
> ++++ binutils-2.24/ld/configure.ac      2013-12-15 11:46:59.810435651
> -0800
>  @@ -87,6 +87,16 @@
>   AC_SUBST(TARGET_SYSTEM_ROOT)
>   AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
> @@ -214,10 +214,10 @@ Index: binutils-2.24/ld/lexsup.c
>  ===================================================================
>  --- binutils-2.24.orig/ld/lexsup.c     2013-12-15 11:46:17.000000000 -0800
>  +++ binutils-2.24/ld/lexsup.c  2013-12-15 11:49:28.950434490 -0800
> -@@ -507,6 +507,14 @@
> -     OPTION_IGNORE_UNRESOLVED_SYMBOL},
> -     '\0', N_("SYMBOL"),
> -     N_("Unresolved SYMBOL will not cause an error or warning"),
> TWO_DASHES },
> +@@ -513,6 +513,14 @@ static const struct ld_option ld_options[] =
> +   { {"pop-state", no_argument, NULL, OPTION_POP_STATE},
> +     '\0', NULL, N_("Pop state of flags governing input file handling"),
> +     TWO_DASHES },
>  +  { {"no-poison-system-directories", no_argument, NULL,
>  +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
>  +    '\0', NULL, N_("Do not warn for -L options using system
> directories"),
> @@ -229,18 +229,18 @@ Index: binutils-2.24/ld/lexsup.c
>   };
>
>   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1442,6 +1450,14 @@
> -               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
> -           }
> -           break;
> +@@ -1474,6 +1482,14 @@ parse_args (unsigned argc, char **argv)
> +             free (oldp);
> +           }
> +         break;
>  +
> -+   case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> -+     command_line.poison_system_directories = FALSE;
> -+     break;
> ++      case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> ++        command_line.poison_system_directories = FALSE;
> ++        break;
>  +
> -+   case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> -+     command_line.error_poison_system_directories = TRUE;
> -+     break;
> ++      case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> ++        command_line.error_poison_system_directories = TRUE;
> ++        break;
>         }
>       }
>
> @@ -248,10 +248,10 @@ Index: binutils-2.24/ld/ldlex.h
>  ===================================================================
>  --- binutils-2.24.orig/ld/ldlex.h      2013-12-15 11:46:17.000000000 -0800
>  +++ binutils-2.24/ld/ldlex.h   2013-12-15 11:47:43.230435299 -0800
> -@@ -138,6 +138,8 @@
> -   OPTION_DEFAULT_SCRIPT,
> -   OPTION_PRINT_OUTPUT_FORMAT,
> +@@ -140,6 +140,8 @@ enum option_values
>     OPTION_IGNORE_UNRESOLVED_SYMBOL,
> +   OPTION_PUSH_STATE,
> +   OPTION_POP_STATE,
>  +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
>  +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
>   };
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
> b/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
> index a199918..b03bb28 100644
> --- a/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
> +++ b/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
> @@ -16,75 +16,73 @@ Netlogic. Also, update vendor name to NLM wherever
> applicable.
>   bfd/cpu-mips.c        |    6 ++++--
>   bfd/elfxx-mips.c      |    8 ++++++++
>   binutils/readelf.c    |    1 +
> - config.sub            |    6 ++++++
> - gas/config/tc-mips.c  |    7 ++++++-
> + gas/config/tc-mips.c  |    4 +++-
>   gas/configure         |    3 +++
>   gas/configure.tgt     |    2 +-
> - gas/doc/c-mips.texi   |    3 ++-
>   include/elf/mips.h    |    1 +
> - include/opcode/mips.h |    6 +++++-
> + include/opcode/mips.h |   10 ++++++++--
>   ld/configure.tgt      |    2 ++
> - opcodes/mips-dis.c    |    6 ++++++
> - opcodes/mips-opc.c    |   31 ++++++++++++++++++++-----------
> - 17 files changed, 73 insertions(+), 17 deletions(-)
> + opcodes/mips-dis.c    |   12 +++++-------
> + opcodes/mips-opc.c    |   33 +++++++++++++++++++++------------
> + 15 files changed, 65 insertions(+), 25 deletions(-)
>
> -Index: binutils-2.24/bfd/aoutx.h
> -===================================================================
> ---- binutils-2.24.orig/bfd/aoutx.h     2013-12-15 13:07:57.180399300 -0800
> -+++ binutils-2.24/bfd/aoutx.h  2013-12-15 13:08:03.397065919 -0800
> -@@ -798,6 +798,7 @@
> -       case bfd_mach_mipsisa64r2:
> +diff --git a/bfd/aoutx.h b/bfd/aoutx.h
> +index 9385a98..a88df99 100644
> +--- a/bfd/aoutx.h
> ++++ b/bfd/aoutx.h
> +@@ -802,6 +802,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
> +       case bfd_mach_mipsisa64r6:
>         case bfd_mach_mips_sb1:
>         case bfd_mach_mips_xlr:
>  +      case bfd_mach_mips_xlp:
>           /* FIXME: These should be MIPS3, MIPS4, MIPS16, MIPS32, etc.  */
>           arch_flags = M_MIPS2;
>           break;
> -Index: binutils-2.24/bfd/archures.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/archures.c  2013-12-15 13:07:57.180399300 -0800
> -+++ binutils-2.24/bfd/archures.c       2013-12-15 13:08:03.397065919 -0800
> -@@ -178,6 +178,7 @@
> +diff --git a/bfd/archures.c b/bfd/archures.c
> +index c9fd6c8..547bd09 100644
> +--- a/bfd/archures.c
> ++++ b/bfd/archures.c
> +@@ -180,6 +180,7 @@ DESCRIPTION
>   .#define bfd_mach_mips_octeonp                6601
>   .#define bfd_mach_mips_octeon2                6502
>   .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
>  +.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *}
>   .#define bfd_mach_mipsisa32             32
>   .#define bfd_mach_mipsisa32r2           33
> - .#define bfd_mach_mipsisa64             64
> -Index: binutils-2.24/bfd/bfd-in2.h
> -===================================================================
> ---- binutils-2.24.orig/bfd/bfd-in2.h   2013-12-15 13:07:57.180399300 -0800
> -+++ binutils-2.24/bfd/bfd-in2.h        2013-12-15 13:08:03.400399254 -0800
> -@@ -1933,6 +1933,7 @@
> + .#define bfd_mach_mipsisa32r3           34
> +diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> +index c7a2bb5..413b773 100644
> +--- a/bfd/bfd-in2.h
> ++++ b/bfd/bfd-in2.h
> +@@ -1967,6 +1967,7 @@ enum bfd_architecture
>   #define bfd_mach_mips_octeonp          6601
>   #define bfd_mach_mips_octeon2          6502
>   #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
>  +#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
>   #define bfd_mach_mipsisa32             32
>   #define bfd_mach_mipsisa32r2           33
> - #define bfd_mach_mipsisa64             64
> -Index: binutils-2.24/bfd/config.bfd
> -===================================================================
> ---- binutils-2.24.orig/bfd/config.bfd  2013-12-15 13:08:03.047065922 -0800
> -+++ binutils-2.24/bfd/config.bfd       2013-12-15 13:08:03.400399254 -0800
> -@@ -1032,6 +1032,11 @@
> -     targ_defvec=bfd_elf32_littlemips_vec
> -     targ_selvecs="bfd_elf32_bigmips_vec bfd_elf64_bigmips_vec
> bfd_elf64_littlemips_vec"
> + #define bfd_mach_mipsisa32r3           34
> +diff --git a/bfd/config.bfd b/bfd/config.bfd
> +index 03d2c6f..91cedb8 100644
> +--- a/bfd/config.bfd
> ++++ b/bfd/config.bfd
> +@@ -1041,6 +1041,11 @@ case "${targ}" in
> +     targ_defvec=mips_elf32_le_vec
> +     targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
>       ;;
>  +  mipsisa64*-*-elf*)
> -+      targ_defvec=bfd_elf32_tradbigmips_vec
> -+      targ_selvecs="bfd_elf32_tradlittlemips_vec
> bfd_elf64_tradbigmips_vec bfd_elf64_tradlittlemips_vec"
> ++      targ_defvec=mips_elf32_trad_be_vec
> ++      targ_selvecs="mips_elf32_trad_le_vec mips_elf64_trad_be_vec
> mips_elf64_trad_le_vec"
>  +      want64=true
>  +      ;;
>     mips*-*-elf* | mips*-*-rtems* | mips*-*-vxworks | mips*-*-windiss)
> -     targ_defvec=bfd_elf32_bigmips_vec
> -     targ_selvecs="bfd_elf32_littlemips_vec bfd_elf64_bigmips_vec
> bfd_elf64_littlemips_vec"
> -Index: binutils-2.24/bfd/cpu-mips.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/cpu-mips.c  2013-12-15 13:07:57.180399300 -0800
> -+++ binutils-2.24/bfd/cpu-mips.c       2013-12-15 13:08:03.400399254 -0800
> -@@ -99,7 +99,8 @@
> +     targ_defvec=mips_elf32_be_vec
> +     targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
> +diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
> +index b617aaa..19a99d1 100644
> +--- a/bfd/cpu-mips.c
> ++++ b/bfd/cpu-mips.c
> +@@ -103,7 +103,8 @@ enum
>     I_mipsocteonp,
>     I_mipsocteon2,
>     I_xlr,
> @@ -94,7 +92,7 @@ Index: binutils-2.24/bfd/cpu-mips.c
>   };
>
>   #define NN(index) (&arch_info_struct[(index) + 1])
> -@@ -143,7 +144,8 @@
> +@@ -153,7 +154,8 @@ static const bfd_arch_info_type arch_info_struct[] =
>     N (64, 64, bfd_mach_mips_octeonp,"mips:octeon+",  FALSE,
> NN(I_mipsocteonp)),
>     N (64, 64, bfd_mach_mips_octeon2,"mips:octeon2",  FALSE,
> NN(I_mipsocteon2)),
>     N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
> @@ -104,11 +102,11 @@ Index: binutils-2.24/bfd/cpu-mips.c
>   };
>
>   /* The default architecture is mips:3000, but with a machine number of
> -Index: binutils-2.24/bfd/elfxx-mips.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/elfxx-mips.c        2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/bfd/elfxx-mips.c     2013-12-15 13:08:03.400399254 -0800
> -@@ -6404,6 +6404,9 @@
> +diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
> +index a0cc26e..672d5b3 100644
> +--- a/bfd/elfxx-mips.c
> ++++ b/bfd/elfxx-mips.c
> +@@ -6608,6 +6608,9 @@ _bfd_elf_mips_mach (flagword flags)
>       case E_MIPS_MACH_XLR:
>         return bfd_mach_mips_xlr;
>
> @@ -118,7 +116,7 @@ Index: binutils-2.24/bfd/elfxx-mips.c
>       default:
>         switch (flags & EF_MIPS_ARCH)
>         {
> -@@ -11622,6 +11625,10 @@
> +@@ -11878,6 +11881,10 @@ mips_set_isa_flags (bfd *abfd)
>         val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
>         break;
>
> @@ -129,31 +127,31 @@ Index: binutils-2.24/bfd/elfxx-mips.c
>       case bfd_mach_mipsisa32:
>         val = E_MIPS_ARCH_32;
>         break;
> -@@ -14202,6 +14209,7 @@
> -   { bfd_mach_mips_octeon2, bfd_mach_mips_octeonp },
> +@@ -14753,6 +14760,7 @@ static const struct mips_mach_extension
> mips_mach_extensions[] =
>     { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
>     { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
> +   { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
>  +  { bfd_mach_mips_xlp, bfd_mach_mipsisa64r2 },
>
>     /* MIPS64 extensions.  */
>     { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
> -Index: binutils-2.24/binutils/readelf.c
> -===================================================================
> ---- binutils-2.24.orig/binutils/readelf.c      2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/binutils/readelf.c   2013-12-15 13:08:03.403732587 -0800
> -@@ -2602,6 +2602,7 @@
> -           case E_MIPS_MACH_OCTEON: strcat (buf, ", octeon"); break;
> +diff --git a/binutils/readelf.c b/binutils/readelf.c
> +index 0c00b2f..6e9d5e4 100644
> +--- a/binutils/readelf.c
> ++++ b/binutils/readelf.c
> +@@ -2898,6 +2898,7 @@ get_machine_flags (unsigned e_flags, unsigned
> e_machine)
>             case E_MIPS_MACH_OCTEON2: strcat (buf, ", octeon2"); break;
> +           case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
>             case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
>  +              case E_MIPS_MACH_XLP:  strcat (buf, ", xlp"); break;
>             case 0:
>             /* We simply ignore the field in this case to avoid confusion:
>                MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
> -Index: binutils-2.24/gas/config/tc-mips.c
> -===================================================================
> ---- binutils-2.24.orig/gas/config/tc-mips.c    2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/gas/config/tc-mips.c 2013-12-15 13:17:19.943728439 -0800
> -@@ -486,6 +486,7 @@
> +diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
> +index c3e3e2a..8d64344 100644
> +--- a/gas/config/tc-mips.c
> ++++ b/gas/config/tc-mips.c
> +@@ -551,6 +551,7 @@ static int mips_32bitmode = 0;
>      || mips_opts.arch == CPU_RM7000                    \
>      || mips_opts.arch == CPU_VR5500                    \
>      || mips_opts.micromips                             \
> @@ -161,7 +159,7 @@ Index: binutils-2.24/gas/config/tc-mips.c
>      )
>
>   /* Whether the processor uses hardware interlocks to protect reads
> -@@ -515,6 +516,7 @@
> +@@ -580,6 +581,7 @@ static int mips_32bitmode = 0;
>       && mips_opts.isa != ISA_MIPS3)                    \
>      || mips_opts.arch == CPU_R4300                     \
>      || mips_opts.micromips                             \
> @@ -169,7 +167,7 @@ Index: binutils-2.24/gas/config/tc-mips.c
>      )
>
>   /* Whether the processor uses hardware interlocks to protect reads
> -@@ -17794,7 +17796,7 @@
> +@@ -18682,7 +18684,7 @@ static const struct mips_cpu_info
> mips_cpu_info_table[] =
>     /* Broadcom XLP.
>        XLP is mostly like XLR, with the prominent exception that it is
>        MIPS64R2 rather than MIPS64.  */
> @@ -178,13 +176,13 @@ Index: binutils-2.24/gas/config/tc-mips.c
>
>     /* End marker */
>     { NULL, 0, 0, 0, 0 }
> -Index: binutils-2.24/gas/configure
> -===================================================================
> ---- binutils-2.24.orig/gas/configure   2013-12-15 13:08:01.127065936 -0800
> -+++ binutils-2.24/gas/configure        2013-12-15 13:08:03.407065920 -0800
> -@@ -12697,6 +12697,9 @@
> -         mipsisa64r2 | mipsisa64r2el)
> -           mips_cpu=mips64r2
> +diff --git a/gas/configure b/gas/configure
> +index 9529f1a..63bba5b 100755
> +--- a/gas/configure
> ++++ b/gas/configure
> +@@ -12808,6 +12808,9 @@ _ACEOF
> +         mipsisa64r6 | mipsisa64r6el)
> +           mips_cpu=mips64r6
>             ;;
>  +        mipsisa64r2nlm | mipsisa64r2nlmel)
>  +              mips_cpu=xlp
> @@ -192,36 +190,36 @@ Index: binutils-2.24/gas/configure
>           mipstx39 | mipstx39el)
>             mips_cpu=r3900
>             ;;
> -Index: binutils-2.24/gas/configure.tgt
> -===================================================================
> ---- binutils-2.24.orig/gas/configure.tgt       2013-12-15
> 13:08:00.783732605 -0800
> -+++ binutils-2.24/gas/configure.tgt    2013-12-15 13:08:03.407065920 -0800
> -@@ -325,7 +325,7 @@
> -                                       fmt=elf em=freebsd ;;
> +diff --git a/gas/configure.tgt b/gas/configure.tgt
> +index 05546ca..bb859d6 100644
> +--- a/gas/configure.tgt
> ++++ b/gas/configure.tgt
> +@@ -332,7 +332,7 @@ case ${generic_target} in
>     mips-*-sysv4*MP* | mips-*-gnu*)     fmt=elf em=tmips ;;
> -   mips*-sde-elf* | mips*-mti-elf*)    fmt=elf em=tmips ;;
> +   mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
> +                                       fmt=elf em=tmips ;;
>  -  mips-*-elf* | mips-*-rtems*)                fmt=elf ;;
>  +  mips-*-elf* | mips-*-rtems*)                fmt=elf em=tmips ;;
>     mips-*-netbsd*)                     fmt=elf em=tmips ;;
>     mips-*-openbsd*)                    fmt=elf em=tmips ;;
>
> -Index: binutils-2.24/include/elf/mips.h
> -===================================================================
> ---- binutils-2.24.orig/include/elf/mips.h      2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/include/elf/mips.h   2013-12-15 13:08:03.407065920 -0800
> -@@ -274,6 +274,7 @@
> +diff --git a/include/elf/mips.h b/include/elf/mips.h
> +index 2ed6acd..899b1e5 100644
> +--- a/include/elf/mips.h
> ++++ b/include/elf/mips.h
> +@@ -285,6 +285,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
>   #define E_MIPS_MACH_SB1         0x008a0000
>   #define E_MIPS_MACH_OCTEON    0x008b0000
>   #define E_MIPS_MACH_XLR       0x008c0000
> -+#define E_MIPS_MACH_XLP         0x008e0000
> ++#define E_MIPS_MACH_XLP         0x008f0000
>   #define E_MIPS_MACH_OCTEON2   0x008d0000
> + #define E_MIPS_MACH_OCTEON3   0x008e0000
>   #define E_MIPS_MACH_5400      0x00910000
> - #define E_MIPS_MACH_5900      0x00920000
> -Index: binutils-2.24/include/opcode/mips.h
> -===================================================================
> ---- binutils-2.24.orig/include/opcode/mips.h   2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/include/opcode/mips.h        2013-12-15
> 13:40:11.130384844 -0800
> -@@ -1092,8 +1092,10 @@
> +diff --git a/include/opcode/mips.h b/include/opcode/mips.h
> +index ef26167..ef53ec6 100644
> +--- a/include/opcode/mips.h
> ++++ b/include/opcode/mips.h
> +@@ -1227,8 +1227,10 @@ static const unsigned int mips_isa_table[] = {
>   #define INSN_LOONGSON_2F          0x80000000
>   /* Loongson 3A.  */
>   #define INSN_LOONGSON_3A          0x00000400
> @@ -234,7 +232,7 @@ Index: binutils-2.24/include/opcode/mips.h
>
>   /* DSP ASE */
>   #define ASE_DSP                       0x00000001
> -@@ -1172,6 +1174,7 @@
> +@@ -1324,6 +1326,7 @@ static const unsigned int mips_isa_table[] = {
>   #define CPU_OCTEONP   6601
>   #define CPU_OCTEON2   6502
>   #define CPU_XLR       887682          /* decimal 'XLR'   */
> @@ -242,9 +240,9 @@ Index: binutils-2.24/include/opcode/mips.h
>
>   /* Return true if the given CPU is included in INSN_* mask MASK.  */
>
> -@@ -1239,6 +1242,9 @@
> -     case CPU_XLR:
> -       return (mask & INSN_XLR) != 0;
> +@@ -1398,6 +1401,9 @@ cpu_is_member (int cpu, unsigned int mask)
> +       return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
> +            || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
>
>  +    case CPU_XLP:
>  +      return (mask & INSN_XLP) != 0;
> @@ -252,12 +250,12 @@ Index: binutils-2.24/include/opcode/mips.h
>       default:
>         return FALSE;
>       }
> -Index: binutils-2.24/ld/configure.tgt
> -===================================================================
> ---- binutils-2.24.orig/ld/configure.tgt        2013-12-15
> 13:08:03.047065922 -0800
> -+++ binutils-2.24/ld/configure.tgt     2013-12-15 13:08:03.407065920 -0800
> -@@ -457,6 +457,8 @@
> - mips*-sde-elf* | mips*-mti-elf*)
> +diff --git a/ld/configure.tgt b/ld/configure.tgt
> +index 740b2ea..4df13a7 100644
> +--- a/ld/configure.tgt
> ++++ b/ld/configure.tgt
> +@@ -462,6 +462,8 @@ mips*el-sde-elf*)  targ_emul=elf32ltsmip
> + mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
>                         targ_emul=elf32btsmip
>                         targ_extra_emuls="elf32ltsmip elf32btsmipn32
> elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
>  +mipsisa64*-*-elf*)    targ_emul=elf32btsmip
> @@ -265,13 +263,13 @@ Index: binutils-2.24/ld/configure.tgt
>   mips64*el-ps2-elf*)   targ_emul=elf32lr5900n32
>                         targ_extra_emuls="elf32lr5900"
>                         targ_extra_libpath=$targ_extra_emuls ;;
> -Index: binutils-2.24/opcodes/mips-dis.c
> -===================================================================
> ---- binutils-2.24.orig/opcodes/mips-dis.c      2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/opcodes/mips-dis.c   2013-12-15 13:39:50.243718329 -0800
> -@@ -554,13 +554,11 @@
> +diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
> +index 1eb1d45..d6881af 100644
> +--- a/opcodes/mips-dis.c
> ++++ b/opcodes/mips-dis.c
> +@@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
>       mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
> -     mips_hwr_names_numeric },
> +     mips_cp1_names_mips3264, mips_hwr_names_numeric },
>
>  -  /* XLP is mostly like XLR, with the prominent exception it is being
>  -     MIPS64R2.  */
> @@ -279,7 +277,7 @@ Index: binutils-2.24/opcodes/mips-dis.c
>  -    ISA_MIPS64R2 | INSN_XLR, 0,
>  -    mips_cp0_names_xlr,
>  -    mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
> --    mips_hwr_names_numeric },
> +-    mips_cp1_names_mips3264, mips_hwr_names_numeric },
>  +  { "xlp", 1, bfd_mach_mips_xlp, CPU_XLP,
>  +    ISA_MIPS64R2 | INSN_XLP, 0,
>  +    mips_cp0_names_mips3264r2,
> @@ -288,11 +286,11 @@ Index: binutils-2.24/opcodes/mips-dis.c
>
>     /* This entry, mips16, is here only for ISA/processor selection; do
>        not print its name.  */
> -Index: binutils-2.24/opcodes/mips-opc.c
> -===================================================================
> ---- binutils-2.24.orig/opcodes/mips-opc.c      2013-12-15
> 13:07:57.180399300 -0800
> -+++ binutils-2.24/opcodes/mips-opc.c   2013-12-15 13:27:30.573724118 -0800
> -@@ -262,7 +262,8 @@
> +diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
> +index 2c3bbad..86eb95b 100644
> +--- a/opcodes/mips-opc.c
> ++++ b/opcodes/mips-opc.c
> +@@ -319,7 +319,8 @@ decode_mips_operand (const char *p)
>   #define IOCT  (INSN_OCTEON | INSN_OCTEONP | INSN_OCTEON2)
>   #define IOCTP (INSN_OCTEONP | INSN_OCTEON2)
>   #define IOCT2 INSN_OCTEON2
> @@ -302,67 +300,69 @@ Index: binutils-2.24/opcodes/mips-opc.c
>   #define IVIRT ASE_VIRT
>   #define IVIRT64       ASE_VIRT64
>
> -@@ -881,6 +882,7 @@
> - {"cins",              "t,r,+p,+S",    0x70000032, 0xfc00003f,
> WR_1|RD_2,              0,              IOCT,           0,      0 },
> - {"clo",                       "U,s",          0x70000021, 0xfc0007ff,
> WR_1|RD_2,      0,              I32|N55,        0,      0 },
> - {"clz",                       "U,s",          0x70000020, 0xfc0007ff,
> WR_1|RD_2,      0,              I32|N55,        0,      0 },
> +@@ -956,6 +957,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
> + {"clo",                       "U,s",          0x70000021, 0xfc0007ff,
> WR_1|RD_2,              0,              I32|N55,        0,      I37 },
> + {"clz",                       "d,s",          0x00000050, 0xfc1f07ff,
> WR_1|RD_2,              0,              I37,            0,      0 },
> + {"clz",                       "U,s",          0x70000020, 0xfc0007ff,
> WR_1|RD_2,              0,              I32|N55,        0,      I37 },
>  +{"crc",                       "d,s,t",        0x7000001c, 0xfc0007ff,
> WR_1|RD_2|RD_3, 0,              XLP,            0,      0 },
> - {"ctc0",              "t,G",          0x40c00000, 0xffe007ff,
> RD_1|WR_CC|COD,         0,              I1,             0,
> IOCT|IOCTP|IOCT2 },
> - {"ctc1",              "t,G",          0x44c00000, 0xffe007ff,
> RD_1|WR_CC|COD|FP_S,    0,              I1,             0,      0 },
> - {"ctc1",              "t,S",          0x44c00000, 0xffe007ff,
> RD_1|WR_CC|COD|FP_S,    0,              I1,             0,      0 },
> -@@ -913,10 +915,11 @@
> + /* ctc0 is at the bottom of the table.  */
> + {"ctc1",              "t,G",          0x44c00000, 0xffe007ff,
> RD_1|WR_CC|CM,          0,              I1,             0,      0 },
> + {"ctc1",              "t,S",          0x44c00000, 0xffe007ff,
> RD_1|WR_CC|CM,          0,              I1,             0,      0 },
> +@@ -988,12 +990,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"daddiu",            "t,r,j",        0x64000000, 0xfc000000,
> WR_1|RD_2,              0,              I3,             0,      0 },
>   {"daddu",             "d,v,t",        0x0000002d, 0xfc0007ff,
> WR_1|RD_2|RD_3,         0,              I3,             0,      0 },
>   {"daddu",             "t,r,I",        0,    (int) M_DADDU_I,
> INSN_MACRO,             0,              I3,             0,      0 },
>  -{"daddwc",            "d,s,t",        0x70000038, 0xfc0007ff,
> WR_1|RD_2|RD_3|WR_C0|RD_C0, 0,          XLR,            0,      0 },
>  +{"daddwc",            "d,s,t",        0x70000038, 0xfc0007ff,
> WR_1|RD_2|RD_3|WR_C0|RD_C0, 0,          XLR|XLP,        0,      0 },
>   {"dbreak",            "",             0x7000003f, 0xffffffff, 0,
>               0,              N5,             0,      0 },
> - {"dclo",              "U,s",          0x70000025, 0xfc0007ff,
> WR_1|RD_2,      0,              I64|N55,        0,      0 },
> - {"dclz",              "U,s",          0x70000024, 0xfc0007ff,
> WR_1|RD_2,      0,              I64|N55,        0,      0 },
> + {"dclo",              "d,s",          0x00000053, 0xfc1f07ff,
> WR_1|RD_2,              0,              I69,            0,      0 },
> + {"dclo",              "U,s",          0x70000025, 0xfc0007ff,
> WR_1|RD_2,      0,              I64|N55,        0,      I69 },
> + {"dclz",              "d,s",          0x00000052, 0xfc1f07ff,
> WR_1|RD_2,              0,              I69,            0,      0 },
> + {"dclz",              "U,s",          0x70000024, 0xfc0007ff,
> WR_1|RD_2,      0,              I64|N55,        0,      I69 },
>  +{"dcrc",              "d,s,t",        0x7000001d, 0xfc0007ff,
> WR_1|RD_2|RD_3, 0,              XLP,            0,      0 },
>   /* dctr and dctw are used on the r5000.  */
>   {"dctr",              "o(b)",         0xbc050000, 0xfc1f0000, RD_2,
>              0,              I3,             0,      0 },
>   {"dctw",              "o(b)",         0xbc090000, 0xfc1f0000, RD_2,
>              0,              I3,             0,      0 },
> -@@ -980,6 +983,7 @@
> - {"dmfc0",             "t,G,H",        0x40200000, 0xffe007f8,
> WR_1|RD_C0|LCD,         0,              I64,            0,      0 },
> - {"dmfgc0",            "t,G",          0x40600100, 0xffe007ff,
> WR_1|RD_C0|LCD,         0,              0,              IVIRT64, 0 },
> - {"dmfgc0",            "t,G,H",        0x40600100, 0xffe007f8,
> WR_1|RD_C0|LCD,         0,              0,              IVIRT64, 0 },
> +@@ -1065,6 +1068,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
> + {"dmfc0",             "t,G,H",        0x40200000, 0xffe007f8,
> WR_1|RD_C0|LC,          0,              I64,            0,      0 },
> + {"dmfgc0",            "t,G",          0x40600100, 0xffe007ff,
> WR_1|RD_C0|LC,          0,              0,              IVIRT64, 0 },
> + {"dmfgc0",            "t,G,H",        0x40600100, 0xffe007f8,
> WR_1|RD_C0|LC,          0,              0,              IVIRT64, 0 },
>  +{"dmfur",             "t,d",          0x7000001e, 0xffe007ff, WR_1,
>              0,              XLP,            0,      0 },
>   {"dmt",                       "",             0x41600bc1, 0xffffffff,
> TRAP,                   0,              0,              MT32,   0 },
>   {"dmt",                       "t",            0x41600bc1, 0xffe0ffff,
> WR_1|TRAP,              0,              0,              MT32,   0 },
> - {"dmtc0",             "t,G",          0x40a00000, 0xffe007ff,
> RD_1|WR_C0|WR_CC|COD,   0,              I3,             0,      EE },
> -@@ -994,6 +998,8 @@
> + {"dmtc0",             "t,G",          0x40a00000, 0xffe007ff,
> RD_1|WR_C0|WR_CC|CM,    0,              I3,             0,      EE },
> +@@ -1079,6 +1083,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   /* dmtc2 is at the bottom of the table.  */
>   /* dmfc3 is at the bottom of the table.  */
>   /* dmtc3 is at the bottom of the table.  */
> + {"dmuh",              "d,s,t",        0x000000dc, 0xfc0007ff,
> WR_1|RD_2|RD_3,         0,              I69,            0,      0 },
>  +{"dmtur",             "t,d",          0x7000001f, 0xffe007ff, RD_1,
>              0,              XLP,            0,      0 },
>  +{"dmul",              "d,s,t",        0x70000006, 0xfc0007ff,
> WR_1|RD_2|RD_3,         0,              XLP,            0,      0 },
> + {"dmul",              "d,s,t",        0x0000009c, 0xfc0007ff,
> WR_1|RD_2|RD_3,         0,              I69,            0,      0 },
>   {"dmul",              "d,v,t",        0x70000003, 0xfc0007ff,
> WR_1|RD_2|RD_3|WR_HILO, 0,              IOCT,           0,      0 },
> - {"dmul",              "d,v,t",        0,    (int) M_DMUL,
>  INSN_MACRO,             0,              I3,             0,      M32 },
> - {"dmul",              "d,v,I",        0,    (int) M_DMUL_I,
>  INSN_MACRO,             0,              I3,             0,      M32 },
> -@@ -1134,9 +1140,9 @@
> - /* The macro has to be first to handle o32 correctly.  */
> +@@ -1229,9 +1235,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
> + {"ld",                        "s,-b(+R)",     0xec180000, 0xfc1c0000,
> WR_1,                   RD_pc,          I69,            0,      0 },
>   {"ld",                        "t,A(b)",       0,    (int) M_LD_AB,
> INSN_MACRO,             0,              I1,             0,      0 },
> - {"ld",                        "t,o(b)",       0xdc000000, 0xfc000000,
> WR_1|RD_3,              0,              I3,             0,      0 },
> --{"ldaddw",            "t,b",          0x70000010, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR,            0,      0 },
> --{"ldaddwu",           "t,b",          0x70000011, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR,            0,      0 },
> --{"ldaddd",            "t,b",          0x70000012, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR,            0,      0 },
> + {"ld",                        "t,o(b)",       0xdc000000, 0xfc000000,
> WR_1|RD_3|LM,           0,              I3,             0,      0 },
> +-{"ldaddw",            "t,b",          0x70000010, 0xfc00ffff,
> MOD_1|RD_2|LM|SM,       0,              XLR,            0,      0 },
> +-{"ldaddwu",           "t,b",          0x70000011, 0xfc00ffff,
> MOD_1|RD_2|LM|SM,       0,              XLR,            0,      0 },
> +-{"ldaddd",            "t,b",          0x70000012, 0xfc00ffff,
> MOD_1|RD_2|LM|SM,       0,              XLR,            0,      0 },
>  +{"ldaddw",            "t,b",          0x70000010, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR|XLP,        0,      0 },
>  +{"ldaddwu",           "t,b",          0x70000011, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR|XLP,        0,      0 },
>  +{"ldaddd",            "t,b",          0x70000012, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR|XLP,        0,      0 },
>   {"ldc1",              "T,o(b)",       0xd4000000, 0xfc000000,
> WR_1|RD_3|CLD|FP_D,     0,              I2,             0,      SF },
>   {"ldc1",              "E,o(b)",       0xd4000000, 0xfc000000,
> WR_1|RD_3|CLD|FP_D,     0,              I2,             0,      SF },
>   {"ldc1",              "T,A(b)",       0,    (int) M_LDC1_AB,
> INSN_MACRO,             INSN2_M_FP_D,   I2,             0,      SF },
> -@@ -1288,7 +1294,7 @@
> +@@ -1396,7 +1402,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"mflo",              "d,9",          0x00000012, 0xff9f07ff,
> WR_1|RD_LO,             0,              0,              D32,    0 },
>   {"mflo1",             "d",            0x70000012, 0xffff07ff,
> WR_1|RD_LO,             0,              EE,             0,      0 },
>   {"mflhxu",            "d",            0x00000052, 0xffff07ff,
> WR_1|MOD_HILO,          0,              0,              SMT,    0 },
> --{"mfcr",              "t,s",          0x70000018, 0xfc00ffff, WR_1,
>              0,              XLR,            0,      0 },
> +-{"mfcr",              "t,s",          0x70000018, 0xfc00ffff,
> WR_1|RD_2,              0,              XLR,            0,      0 },
>  +{"mfcr",              "t,s",          0x70000018, 0xfc00ffff, WR_1,
>              0,              XLR|XLP,        0,      0 },
>   {"mfsa",              "d",            0x00000028, 0xffff07ff, WR_1,
>              0,              EE,             0,      0 },
>   {"min.ob",            "X,Y,Q",        0x78000006, 0xfc20003f,
> WR_1|RD_2|RD_3|FP_D,    0,              SB1,            MX,     0 },
>   {"min.ob",            "D,S,Q",        0x48000006, 0xfc20003f,
> WR_1|RD_2|RD_3|FP_D,    0,              N54,            0,      0 },
> -@@ -1332,10 +1338,13 @@
> +@@ -1441,10 +1447,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   /* move is at the top of the table.  */
>   {"msgn.qh",           "X,Y,Q",        0x78200000, 0xfc20003f,
> WR_1|RD_2|RD_3|FP_D,    0,              0,              MX,     0 },
>   {"msgsnd",            "t",            0,    (int) M_MSGSND,
>  INSN_MACRO,             0,              XLR,            0,      0 },
> @@ -375,28 +375,28 @@ Index: binutils-2.24/opcodes/mips-opc.c
>  +{"msgwait",           "",             0,    (int) M_MSGWAIT,
> INSN_MACRO,             0,              XLR|XLP,        0,      0 },
>  +{"msgwait",           "t",            0,    (int)
> M_MSGWAIT_T,INSN_MACRO,             0,              XLR|XLP,        0,
> 0 },
>  +{"msgsync",           "",             0x4a000004, 0xffffffff,0,
>              0,              XLP,            0,      0 },
> - {"msub.d",            "D,R,S,T",      0x4c000029, 0xfc00003f,
> WR_1|RD_2|RD_3|RD_4|FP_D, 0,            I4_33,          0,      0 },
> + {"msub.d",            "D,R,S,T",      0x4c000029, 0xfc00003f,
> WR_1|RD_2|RD_3|RD_4|FP_D, 0,            I4_33,          0,      I37 },
>   {"msub.d",            "D,S,T",        0x46200019, 0xffe0003f,
> WR_1|RD_2|RD_3|FP_D,    0,              IL2E,           0,      0 },
>   {"msub.d",            "D,S,T",        0x72200019, 0xffe0003f,
> WR_1|RD_2|RD_3|FP_D,    0,              IL2F,           0,      0 },
> -@@ -1381,7 +1390,7 @@
> +@@ -1494,7 +1503,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
>   {"mtlo",              "s,7",          0x00000013, 0xfc1fe7ff,
> RD_1|WR_LO,             0,              0,              D32,    0 },
>   {"mtlo1",             "s",            0x70000013, 0xfc1fffff,
> RD_1|WR_LO,             0,              EE,             0,      0 },
>   {"mtlhx",             "s",            0x00000053, 0xfc1fffff,
> RD_1|MOD_HILO,          0,              0,              SMT,    0 },
> --{"mtcr",              "t,s",          0x70000019, 0xfc00ffff, RD_1,
>              0,              XLR,            0,      0 },
> +-{"mtcr",              "t,s",          0x70000019, 0xfc00ffff,
> RD_1|RD_2,              0,              XLR,            0,      0 },
>  +{"mtcr",              "t,s",          0x70000019, 0xfc00ffff, RD_1,
>              0,              XLR|XLP,        0,      0 },
>   {"mtm0",              "s",            0x70000008, 0xfc1fffff, RD_1,
>              0,              IOCT,           0,      0 },
>   {"mtm1",              "s",            0x7000000c, 0xfc1fffff, RD_1,
>              0,              IOCT,           0,      0 },
>   {"mtm2",              "s",            0x7000000d, 0xfc1fffff, RD_1,
>              0,              IOCT,           0,      0 },
> -@@ -1802,9 +1811,9 @@
> - {"suxc1",             "S,t(b)",       0x4c00000d, 0xfc0007ff,
> RD_1|RD_2|RD_3|SM|FP_D, 0,              I5_33|N55,      0,      0},
> +@@ -1924,9 +1933,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
> + {"suxc1",             "S,t(b)",       0x4c00000d, 0xfc0007ff,
> RD_1|RD_2|RD_3|SM|FP_D, 0,              I5_33|N55,      0,      I37},
>   {"sw",                        "t,o(b)",       0xac000000, 0xfc000000,
> RD_1|RD_3|SM,           0,              I1,             0,      0 },
>   {"sw",                        "t,A(b)",       0,    (int) M_SW_AB,
> INSN_MACRO,             0,              I1,             0,      0 },
> --{"swapw",             "t,b",          0x70000014, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR,            0,      0 },
> --{"swapwu",            "t,b",          0x70000015, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR,            0,      0 },
> --{"swapd",             "t,b",          0x70000016, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR,            0,      0 },
> +-{"swapw",             "t,b",          0x70000014, 0xfc00ffff,
> MOD_1|RD_2|LM|SM,       0,              XLR,            0,      0 },
> +-{"swapwu",            "t,b",          0x70000015, 0xfc00ffff,
> MOD_1|RD_2|LM|SM,       0,              XLR,            0,      0 },
> +-{"swapd",             "t,b",          0x70000016, 0xfc00ffff,
> MOD_1|RD_2|LM|SM,       0,              XLR,            0,      0 },
>  +{"swapw",             "t,b",          0x70000014, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR|XLP,        0,      0 },
>  +{"swapwu",            "t,b",          0x70000015, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR|XLP,        0,      0 },
>  +{"swapd",             "t,b",          0x70000016, 0xfc00ffff,
> MOD_1|RD_2|SM,          0,              XLR|XLP,        0,      0 },
> - {"swc0",              "E,o(b)",       0xe0000000, 0xfc000000,
> RD_3|RD_C0|SM,          0,              I1,             0,
> IOCT|IOCTP|IOCT2 },
> - {"swc0",              "E,A(b)",       0,    (int) M_SWC0_AB,
> INSN_MACRO,             0,              I1,             0,
> IOCT|IOCTP|IOCT2 },
> + {"swc0",              "E,o(b)",       0xe0000000, 0xfc000000,
> RD_3|RD_C0|SM,          0,              I1,             0,
> IOCT|IOCTP|IOCT2|I37 },
> + {"swc0",              "E,A(b)",       0,    (int) M_SWC0_AB,
> INSN_MACRO,             0,              I1,             0,
> IOCT|IOCTP|IOCT2|I37 },
>   {"swc1",              "T,o(b)",       0xe4000000, 0xfc000000,
> RD_1|RD_3|SM|FP_S,      0,              I1,             0,      0 },
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
> deleted file mode 100644
> index e789499..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8484 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From bd25671c6f202c4a5108883caa2adb24ff6f361f Mon Sep 17 00:00:00 2001
> -From: Alan Modra <amodra@gmail.com>
> -Date: Fri, 29 Aug 2014 10:36:29 +0930
> -Subject: [PATCH] Report an error for S-records with less than the miniumum
> - size
> -
> -       * srec.c (srec_scan): Revert last change.  Report an error for
> -       S-records with less than the miniumum byte count.
> ----
> - bfd/ChangeLog |  5 +++++
> - bfd/srec.c    | 18 +++++++++++++++---
> - 2 files changed, 20 insertions(+), 3 deletions(-)
> -
> -Index: binutils-2.24/bfd/srec.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/srec.c
> -+++ binutils-2.24/bfd/srec.c
> -@@ -455,7 +455,7 @@ srec_scan (bfd *abfd)
> -         {
> -           file_ptr pos;
> -           char hdr[3];
> --          unsigned int bytes;
> -+          unsigned int bytes, min_bytes;
> -           bfd_vma address;
> -           bfd_byte *data;
> -           unsigned char check_sum;
> -@@ -478,6 +478,19 @@ srec_scan (bfd *abfd)
> -             }
> -
> -           check_sum = bytes = HEX (hdr + 1);
> -+          min_bytes = 3;
> -+          if (hdr[0] == '2' || hdr[0] == '8')
> -+            min_bytes = 4;
> -+          else if (hdr[0] == '3' || hdr[0] == '7')
> -+            min_bytes = 5;
> -+          if (bytes < min_bytes)
> -+            {
> -+              (*_bfd_error_handler) (_("%B:%d: byte count %d too
> small\n"),
> -+                                     abfd, lineno, bytes);
> -+              bfd_set_error (bfd_error_bad_value);
> -+              goto error_return;
> -+            }
> -+
> -           if (bytes * 2 > bufsize)
> -             {
> -               if (buf != NULL)
> -Index: binutils-2.24/bfd/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/bfd/ChangeLog
> -+++ binutils-2.24/bfd/ChangeLog
> -@@ -1,3 +1,8 @@
> -+2014-08-29  Alan Modra  <amodra@gmail.com>
> -+
> -+       * srec.c (srec_scan): Revert last change.  Report an error for
> -+       S-records with less than the miniumum byte count.
> -+
> - 2013-12-02  Tristan Gingold  <gingold@adacore.com>
> -
> -       * configure.in: Bump version to 2.24
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
> deleted file mode 100644
> index ec3308b..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8485 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From 493a33860c71cac998f1a56d6d87d6faa801fbaa Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Mon, 27 Oct 2014 12:43:16 +0000
> -Subject: [PATCH] This patch closes a potential security hole in
> applications
> - that use the bfd library to parse binaries containing maliciously corrupt
> - section group headers.
> -
> -       PR binutils/17510
> -       * elf.c (setup_group): Improve handling of corrupt group
> -       sections.
> ----
> - bfd/ChangeLog |  6 ++++++
> - bfd/elf.c     | 34 ++++++++++++++++++++++++++++++----
> - 2 files changed, 36 insertions(+), 4 deletions(-)
> -
> -Index: binutils-2.24/bfd/elf.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/elf.c
> -+++ binutils-2.24/bfd/elf.c
> -@@ -608,9 +608,10 @@ setup_group (bfd *abfd, Elf_Internal_Shd
> -                 if (shdr->contents == NULL)
> -                   {
> -                     _bfd_error_handler
> --                      (_("%B: Corrupt size field in group section
> header: 0x%lx"), abfd, shdr->sh_size);
> -+                      (_("%B: corrupt size field in group section
> header: 0x%lx"), abfd, shdr->sh_size);
> -                     bfd_set_error (bfd_error_bad_value);
> --                    return FALSE;
> -+                    -- num_group;
> -+                    continue;
> -                   }
> -
> -                 memset (shdr->contents, 0, amt);
> -@@ -618,7 +619,16 @@ setup_group (bfd *abfd, Elf_Internal_Shd
> -                 if (bfd_seek (abfd, shdr->sh_offset, SEEK_SET) != 0
> -                     || (bfd_bread (shdr->contents, shdr->sh_size, abfd)
> -                         != shdr->sh_size))
> --                  return FALSE;
> -+                  {
> -+                    _bfd_error_handler
> -+                      (_("%B: invalid size field in group section
> header: 0x%lx"), abfd, shdr->sh_size);
> -+                    bfd_set_error (bfd_error_bad_value);
> -+                    -- num_group;
> -+                    /* PR 17510: If the group contents are even partially
> -+                       corrupt, do not allow any of the contents to be
> used.  */
> -+                    memset (shdr->contents, 0, amt);
> -+                    continue;
> -+                  }
> -
> -                 /* Translate raw contents, a flag word followed by an
> -                    array of elf section indices all in target byte order,
> -@@ -651,6 +661,21 @@ setup_group (bfd *abfd, Elf_Internal_Shd
> -                   }
> -               }
> -           }
> -+
> -+        /* PR 17510: Corrupt binaries might contain invalid groups.  */
> -+        if (num_group != (unsigned) elf_tdata (abfd)->num_group)
> -+          {
> -+            elf_tdata (abfd)->num_group = num_group;
> -+
> -+            /* If all groups are invalid then fail.  */
> -+            if (num_group == 0)
> -+              {
> -+                elf_tdata (abfd)->group_sect_ptr = NULL;
> -+                elf_tdata (abfd)->num_group = num_group = -1;
> -+                (*_bfd_error_handler) (_("%B: no valid group sections
> found"), abfd);
> -+                bfd_set_error (bfd_error_bad_value);
> -+              }
> -+          }
> -       }
> -     }
> -
> -@@ -716,6 +741,7 @@ setup_group (bfd *abfd, Elf_Internal_Shd
> -     {
> -       (*_bfd_error_handler) (_("%B: no group info for section %A"),
> -                            abfd, newsect);
> -+      return FALSE;
> -     }
> -   return TRUE;
> - }
> -Index: binutils-2.24/bfd/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/bfd/ChangeLog
> -+++ binutils-2.24/bfd/ChangeLog
> -@@ -1,3 +1,9 @@
> -+2014-10-27  Nick Clifton  <nickc@redhat.com>
> -+
> -+       PR binutils/17510
> -+       * elf.c (setup_group): Improve handling of corrupt group
> -+       sections.
> -+
> - 2014-08-29  Alan Modra  <amodra@gmail.com>
> -
> -        * srec.c (srec_scan): Revert last change.  Report an error for
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
> deleted file mode 100644
> index a48fe9b..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8501 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From 7e1e19887abd24aeb15066b141cdff5541e0ec8e Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Mon, 27 Oct 2014 14:45:06 +0000
> -Subject: [PATCH] Fix a seg-fault in strings and other binutuils when
> parsing a
> - corrupt PE executable with an invalid value in the NumberOfRvaAndSizes
> field
> - of the AOUT header.
> -
> -       PR binutils/17512
> -       * peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle corrupt binaries
> -       with an invalid value for NumberOfRvaAndSizes.
> ----
> - bfd/ChangeLog  |  4 ++++
> - bfd/peXXigen.c | 12 ++++++++++++
> - 2 files changed, 16 insertions(+)
> -
> -Index: binutils-2.24/bfd/peXXigen.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/peXXigen.c
> -+++ binutils-2.24/bfd/peXXigen.c
> -@@ -460,6 +460,18 @@ _bfd_XXi_swap_aouthdr_in (bfd * abfd,
> -   {
> -     int idx;
> -
> -+    /* PR 17512: Corrupt PE binaries can cause seg-faults.  */
> -+    if (a->NumberOfRvaAndSizes > 16)
> -+      {
> -+      (*_bfd_error_handler)
> -+        (_("%B: aout header specifies an invalid number of
> data-directory entries: %d"),
> -+         abfd, a->NumberOfRvaAndSizes);
> -+      /* Paranoia: If the number is corrupt, then assume that the
> -+         actual entries themselves might be corrupt as well.  */
> -+      a->NumberOfRvaAndSizes = 0;
> -+      }
> -+
> -+
> -     for (idx = 0; idx < a->NumberOfRvaAndSizes; idx++)
> -       {
> -         /* If data directory is empty, rva also should be 0.  */
> -Index: binutils-2.24/bfd/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/bfd/ChangeLog
> -+++ binutils-2.24/bfd/ChangeLog
> -@@ -1,5 +1,9 @@
> - 2014-10-27  Nick Clifton  <nickc@redhat.com>
> -
> -+       PR binutils/17512
> -+       * peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle corrupt binaries
> -+       with an invalid value for NumberOfRvaAndSizes.
> -+
> -        PR binutils/17510
> -        * elf.c (setup_group): Improve handling of corrupt group
> -        sections.
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
> deleted file mode 100644
> index 05af65b..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8502 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From 5a4b0ccc20ba30caef53b01bee2c0aaa5b855339 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Tue, 28 Oct 2014 15:42:56 +0000
> -Subject: [PATCH] More fixes for corrupt binaries crashing the binutils.
> -
> -       PR binutils/17512
> -       * elf.c (bfd_section_from_shdr): Allocate and free the recursion
> -       detection table on a per-bfd basis.
> -       * peXXigen.c (pe_print_edata): Handle binaries with a truncated
> -       export table.
> ----
> - bfd/ChangeLog  |  8 ++++++++
> - bfd/elf.c      | 16 +++++++++++++---
> - bfd/peXXigen.c |  9 +++++++++
> - 3 files changed, 30 insertions(+), 3 deletions(-)
> -
> -Index: binutils-2.24/bfd/peXXigen.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/peXXigen.c
> -+++ binutils-2.24/bfd/peXXigen.c
> -@@ -1438,6 +1438,15 @@ pe_print_edata (bfd * abfd, void * vfile
> -       }
> -     }
> -
> -+  /* PR 17512: Handle corrupt PE binaries.  */
> -+  if (datasize < 36)
> -+    {
> -+      fprintf (file,
> -+             _("\nThere is an export table in %s, but it is too small
> (%d)\n"),
> -+             section->name, (int) datasize);
> -+      return TRUE;
> -+    }
> -+
> -   fprintf (file, _("\nThere is an export table in %s at 0x%lx\n"),
> -          section->name, (unsigned long) addr);
> -
> -Index: binutils-2.24/bfd/elf.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/elf.c
> -+++ binutils-2.24/bfd/elf.c
> -@@ -1576,6 +1576,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -   const char *name;
> -   bfd_boolean ret = TRUE;
> -   static bfd_boolean * sections_being_created = NULL;
> -+  static bfd * sections_being_created_abfd = NULL;
> -   static unsigned int nesting = 0;
> -
> -   if (shindex >= elf_numsections (abfd))
> -@@ -1588,13 +1589,20 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -        loop.  Detect this here, by refusing to load a section that we are
> -        already in the process of loading.  We only trigger this test if
> -        we have nested at least three sections deep as normal ELF binaries
> --       can expect to recurse at least once.  */
> -+       can expect to recurse at least once.
> -+
> -+     FIXME: It would be better if this array was attached to the bfd,
> -+     rather than being held in a static pointer.  */
> -+
> -+      if (sections_being_created_abfd != abfd)
> -+        sections_being_created = NULL;
> -
> -       if (sections_being_created == NULL)
> -       {
> -         /* FIXME: It would be more efficient to attach this array to the
> bfd somehow.  */
> -         sections_being_created = (bfd_boolean *)
> -           bfd_zalloc (abfd, elf_numsections (abfd) * sizeof
> (bfd_boolean));
> -+        sections_being_created_abfd = abfd;
> -       }
> -       if (sections_being_created [shindex])
> -       {
> -@@ -2098,7 +2106,10 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -   if (sections_being_created)
> -     sections_being_created [shindex] = FALSE;
> -   if (-- nesting == 0)
> -+  {
> -     sections_being_created = NULL;
> -+    sections_being_created_abfd = abfd;
> -+  }
> -   return ret;
> - }
> -
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
> deleted file mode 100644
> index 9e0c9c8..0000000
> ---
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
> +++ /dev/null
> @@ -1,523 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8502 supporting patch.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From bf67003b4567600ed3022a439207ac8f26454f91 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Mon, 27 Oct 2014 18:05:37 +0000
> -Subject: [PATCH] This fixes more seg-faults in tools like "strings" and
> - "objdump" when presented with corrupt binaries.
> -
> -       PR binutils/17512
> -       * elf.c (bfd_section_from_shdr): Detect and warn about ELF
> -       binaries with a group of sections linked by the string table
> -       indicies.
> -       * peXXigen.c (pe_print_edata): Detect out of range rvas and
> -       entry counts for the Export Address table, Name Pointer table
> -        and Ordinal table.
> ----
> - bfd/ChangeLog  |   5 ++
> - bfd/elf.c      | 194
> ++++++++++++++++++++++++++++++++++++++-------------------
> - bfd/peXXigen.c |  18 +++++-
> - 3 files changed, 150 insertions(+), 67 deletions(-)
> -
> -Index: binutils-2.24/bfd/elf.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/elf.c
> -+++ binutils-2.24/bfd/elf.c
> -@@ -1574,38 +1574,67 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -   Elf_Internal_Ehdr *ehdr;
> -   const struct elf_backend_data *bed;
> -   const char *name;
> -+  bfd_boolean ret = TRUE;
> -+  static bfd_boolean * sections_being_created = NULL;
> -+  static unsigned int nesting = 0;
> -
> -   if (shindex >= elf_numsections (abfd))
> -     return FALSE;
> -
> -+  if (++ nesting > 3)
> -+    {
> -+      /* PR17512: A corrupt ELF binary might contain a recursive group of
> -+       sections, each the string indicies pointing to the next in the
> -+       loop.  Detect this here, by refusing to load a section that we are
> -+       already in the process of loading.  We only trigger this test if
> -+       we have nested at least three sections deep as normal ELF binaries
> -+       can expect to recurse at least once.  */
> -+
> -+      if (sections_being_created == NULL)
> -+      {
> -+        /* FIXME: It would be more efficient to attach this array to the
> bfd somehow.  */
> -+        sections_being_created = (bfd_boolean *)
> -+          bfd_zalloc (abfd, elf_numsections (abfd) * sizeof
> (bfd_boolean));
> -+      }
> -+      if (sections_being_created [shindex])
> -+      {
> -+        (*_bfd_error_handler)
> -+          (_("%B: warning: loop in section dependencies detected"),
> abfd);
> -+        return FALSE;
> -+      }
> -+      sections_being_created [shindex] = TRUE;
> -+    }
> -+
> -   hdr = elf_elfsections (abfd)[shindex];
> -   ehdr = elf_elfheader (abfd);
> -   name = bfd_elf_string_from_elf_section (abfd, ehdr->e_shstrndx,
> -                                         hdr->sh_name);
> -   if (name == NULL)
> --    return FALSE;
> -+    goto fail;
> -
> -   bed = get_elf_backend_data (abfd);
> -   switch (hdr->sh_type)
> -     {
> -     case SHT_NULL:
> -       /* Inactive section. Throw it away.  */
> --      return TRUE;
> -+      goto success;
> -
> --    case SHT_PROGBITS:        /* Normal section with contents.  */
> --    case SHT_NOBITS:  /* .bss section.  */
> --    case SHT_HASH:    /* .hash section.  */
> --    case SHT_NOTE:    /* .note section.  */
> -+    case SHT_PROGBITS:                /* Normal section with contents.
> */
> -+    case SHT_NOBITS:          /* .bss section.  */
> -+    case SHT_HASH:            /* .hash section.  */
> -+    case SHT_NOTE:            /* .note section.  */
> -     case SHT_INIT_ARRAY:      /* .init_array section.  */
> -     case SHT_FINI_ARRAY:      /* .fini_array section.  */
> -     case SHT_PREINIT_ARRAY:   /* .preinit_array section.  */
> -     case SHT_GNU_LIBLIST:     /* .gnu.liblist section.  */
> -     case SHT_GNU_HASH:                /* .gnu.hash section.  */
> --      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      goto success;
> -
> -     case SHT_DYNAMIC: /* Dynamic linking information.  */
> -       if (! _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex))
> --      return FALSE;
> -+      goto fail;
> -+
> -       if (hdr->sh_link > elf_numsections (abfd))
> -       {
> -         /* PR 10478: Accept Solaris binaries with a sh_link
> -@@ -1619,11 +1648,11 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -               break;
> -             /* Otherwise fall through.  */
> -           default:
> --            return FALSE;
> -+            goto fail;
> -           }
> -       }
> -       else if (elf_elfsections (abfd)[hdr->sh_link] == NULL)
> --      return FALSE;
> -+      goto fail;
> -       else if (elf_elfsections (abfd)[hdr->sh_link]->sh_type !=
> SHT_STRTAB)
> -       {
> -         Elf_Internal_Shdr *dynsymhdr;
> -@@ -1652,24 +1681,26 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -               }
> -           }
> -       }
> --      break;
> -+      goto success;
> -
> --    case SHT_SYMTAB:          /* A symbol table */
> -+    case SHT_SYMTAB:          /* A symbol table.  */
> -       if (elf_onesymtab (abfd) == shindex)
> --      return TRUE;
> -+      goto success;
> -
> -       if (hdr->sh_entsize != bed->s->sizeof_sym)
> --      return FALSE;
> -+      goto fail;
> -+
> -       if (hdr->sh_info * hdr->sh_entsize > hdr->sh_size)
> -       {
> -         if (hdr->sh_size != 0)
> --          return FALSE;
> -+          goto fail;
> -         /* Some assemblers erroneously set sh_info to one with a
> -            zero sh_size.  ld sees this as a global symbol count
> -            of (unsigned) -1.  Fix it here.  */
> -         hdr->sh_info = 0;
> --        return TRUE;
> -+        goto success;
> -       }
> -+
> -       BFD_ASSERT (elf_onesymtab (abfd) == 0);
> -       elf_onesymtab (abfd) = shindex;
> -       elf_tdata (abfd)->symtab_hdr = *hdr;
> -@@ -1686,7 +1717,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -         && (abfd->flags & DYNAMIC) != 0
> -         && ! _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> -                                               shindex))
> --      return FALSE;
> -+      goto fail;
> -
> -       /* Go looking for SHT_SYMTAB_SHNDX too, since if there is one we
> -        can't read symbols without that section loaded as well.  It
> -@@ -1712,26 +1743,29 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -                 break;
> -             }
> -         if (i != shindex)
> --          return bfd_section_from_shdr (abfd, i);
> -+          ret = bfd_section_from_shdr (abfd, i);
> -       }
> --      return TRUE;
> -+      goto success;
> -
> --    case SHT_DYNSYM:          /* A dynamic symbol table */
> -+    case SHT_DYNSYM:          /* A dynamic symbol table.  */
> -       if (elf_dynsymtab (abfd) == shindex)
> --      return TRUE;
> -+      goto success;
> -
> -       if (hdr->sh_entsize != bed->s->sizeof_sym)
> --      return FALSE;
> -+      goto fail;
> -+
> -       if (hdr->sh_info * hdr->sh_entsize > hdr->sh_size)
> -       {
> -         if (hdr->sh_size != 0)
> --          return FALSE;
> -+          goto fail;
> -+
> -         /* Some linkers erroneously set sh_info to one with a
> -            zero sh_size.  ld sees this as a global symbol count
> -            of (unsigned) -1.  Fix it here.  */
> -         hdr->sh_info = 0;
> --        return TRUE;
> -+        goto success;
> -       }
> -+
> -       BFD_ASSERT (elf_dynsymtab (abfd) == 0);
> -       elf_dynsymtab (abfd) = shindex;
> -       elf_tdata (abfd)->dynsymtab_hdr = *hdr;
> -@@ -1740,34 +1774,38 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -
> -       /* Besides being a symbol table, we also treat this as a regular
> -        section, so that objcopy can handle it.  */
> --      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      goto success;
> -
> --    case SHT_SYMTAB_SHNDX:    /* Symbol section indices when >64k
> sections */
> -+    case SHT_SYMTAB_SHNDX:    /* Symbol section indices when >64k
> sections.  */
> -       if (elf_symtab_shndx (abfd) == shindex)
> --      return TRUE;
> -+      goto success;
> -
> -       BFD_ASSERT (elf_symtab_shndx (abfd) == 0);
> -       elf_symtab_shndx (abfd) = shindex;
> -       elf_tdata (abfd)->symtab_shndx_hdr = *hdr;
> -       elf_elfsections (abfd)[shindex] = &elf_tdata
> (abfd)->symtab_shndx_hdr;
> --      return TRUE;
> -+      goto success;
> -
> --    case SHT_STRTAB:          /* A string table */
> -+    case SHT_STRTAB:          /* A string table.  */
> -       if (hdr->bfd_section != NULL)
> --      return TRUE;
> -+      goto success;
> -+
> -       if (ehdr->e_shstrndx == shindex)
> -       {
> -         elf_tdata (abfd)->shstrtab_hdr = *hdr;
> -         elf_elfsections (abfd)[shindex] = &elf_tdata
> (abfd)->shstrtab_hdr;
> --        return TRUE;
> -+        goto success;
> -       }
> -+
> -       if (elf_elfsections (abfd)[elf_onesymtab (abfd)]->sh_link ==
> shindex)
> -       {
> -       symtab_strtab:
> -         elf_tdata (abfd)->strtab_hdr = *hdr;
> -         elf_elfsections (abfd)[shindex] = &elf_tdata (abfd)->strtab_hdr;
> --        return TRUE;
> -+        goto success;
> -       }
> -+
> -       if (elf_elfsections (abfd)[elf_dynsymtab (abfd)]->sh_link ==
> shindex)
> -       {
> -       dynsymtab_strtab:
> -@@ -1776,8 +1814,9 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -         elf_elfsections (abfd)[shindex] = hdr;
> -         /* We also treat this as a regular section, so that objcopy
> -            can handle it.  */
> --        return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> --                                                shindex);
> -+        ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> -+                                               shindex);
> -+        goto success;
> -       }
> -
> -       /* If the string table isn't one of the above, then treat it as a
> -@@ -1795,9 +1834,9 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -               {
> -                 /* Prevent endless recursion on broken objects.  */
> -                 if (i == shindex)
> --                  return FALSE;
> -+                  goto fail;
> -                 if (! bfd_section_from_shdr (abfd, i))
> --                  return FALSE;
> -+                  goto fail;
> -                 if (elf_onesymtab (abfd) == i)
> -                   goto symtab_strtab;
> -                 if (elf_dynsymtab (abfd) == i)
> -@@ -1805,7 +1844,8 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -               }
> -           }
> -       }
> --      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      goto success;
> -
> -     case SHT_REL:
> -     case SHT_RELA:
> -@@ -1820,7 +1860,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -       if (hdr->sh_entsize
> -           != (bfd_size_type) (hdr->sh_type == SHT_REL
> -                               ? bed->s->sizeof_rel :
> bed->s->sizeof_rela))
> --        return FALSE;
> -+        goto fail;
> -
> -       /* Check for a bogus link to avoid crashing.  */
> -       if (hdr->sh_link >= num_sec)
> -@@ -1828,8 +1868,9 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -           ((*_bfd_error_handler)
> -            (_("%B: invalid link %lu for reloc section %s (index %u)"),
> -             abfd, hdr->sh_link, name, shindex));
> --          return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> --                                                  shindex);
> -+          ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> -+                                                 shindex);
> -+          goto success;
> -         }
> -
> -       /* For some incomprehensible reason Oracle distributes
> -@@ -1870,7 +1911,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -       if ((elf_elfsections (abfd)[hdr->sh_link]->sh_type == SHT_SYMTAB
> -            || elf_elfsections (abfd)[hdr->sh_link]->sh_type ==
> SHT_DYNSYM)
> -           && ! bfd_section_from_shdr (abfd, hdr->sh_link))
> --        return FALSE;
> -+        goto fail;
> -
> -       /* If this reloc section does not use the main symbol table we
> -          don't treat it as a reloc section.  BFD can't adequately
> -@@ -1885,14 +1926,18 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -           || hdr->sh_info >= num_sec
> -           || elf_elfsections (abfd)[hdr->sh_info]->sh_type == SHT_REL
> -           || elf_elfsections (abfd)[hdr->sh_info]->sh_type == SHT_RELA)
> --        return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> --                                                shindex);
> -+        {
> -+          ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> -+                                                 shindex);
> -+          goto success;
> -+        }
> -
> -       if (! bfd_section_from_shdr (abfd, hdr->sh_info))
> --        return FALSE;
> -+        goto fail;
> -+
> -       target_sect = bfd_section_from_elf_index (abfd, hdr->sh_info);
> -       if (target_sect == NULL)
> --        return FALSE;
> -+        goto fail;
> -
> -       esdt = elf_section_data (target_sect);
> -       if (hdr->sh_type == SHT_RELA)
> -@@ -1904,7 +1949,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -       amt = sizeof (*hdr2);
> -       hdr2 = (Elf_Internal_Shdr *) bfd_alloc (abfd, amt);
> -       if (hdr2 == NULL)
> --        return FALSE;
> -+        goto fail;
> -       *hdr2 = *hdr;
> -       *p_hdr = hdr2;
> -       elf_elfsections (abfd)[shindex] = hdr2;
> -@@ -1920,34 +1965,40 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -             target_sect->use_rela_p = 1;
> -         }
> -       abfd->flags |= HAS_RELOC;
> --      return TRUE;
> -+      goto success;
> -       }
> -
> -     case SHT_GNU_verdef:
> -       elf_dynverdef (abfd) = shindex;
> -       elf_tdata (abfd)->dynverdef_hdr = *hdr;
> --      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      goto success;
> -
> -     case SHT_GNU_versym:
> -       if (hdr->sh_entsize != sizeof (Elf_External_Versym))
> --      return FALSE;
> -+      goto fail;
> -+
> -       elf_dynversym (abfd) = shindex;
> -       elf_tdata (abfd)->dynversym_hdr = *hdr;
> --      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      goto success;
> -
> -     case SHT_GNU_verneed:
> -       elf_dynverref (abfd) = shindex;
> -       elf_tdata (abfd)->dynverref_hdr = *hdr;
> --      return _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex);
> -+      goto success;
> -
> -     case SHT_SHLIB:
> --      return TRUE;
> -+      goto success;
> -
> -     case SHT_GROUP:
> -       if (! IS_VALID_GROUP_SECTION_HEADER (hdr, GRP_ENTRY_SIZE))
> --      return FALSE;
> -+      goto fail;
> -+
> -       if (!_bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex))
> --      return FALSE;
> -+      goto fail;
> -+
> -       if (hdr->contents != NULL)
> -       {
> -         Elf_Internal_Group *idx = (Elf_Internal_Group *) hdr->contents;
> -@@ -1973,7 +2024,7 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -               }
> -           }
> -       }
> --      break;
> -+      goto success;
> -
> -     default:
> -       /* Possibly an attributes section.  */
> -@@ -1981,14 +2032,14 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -         || hdr->sh_type == bed->obj_attrs_section_type)
> -       {
> -         if (! _bfd_elf_make_section_from_shdr (abfd, hdr, name, shindex))
> --          return FALSE;
> -+          goto fail;
> -         _bfd_elf_parse_attributes (abfd, hdr);
> --        return TRUE;
> -+        goto success;
> -       }
> -
> -       /* Check for any processor-specific section types.  */
> -       if (bed->elf_backend_section_from_shdr (abfd, hdr, name, shindex))
> --      return TRUE;
> -+      goto success;
> -
> -       if (hdr->sh_type >= SHT_LOUSER && hdr->sh_type <= SHT_HIUSER)
> -       {
> -@@ -2000,9 +2051,12 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -                "specific section `%s' [0x%8x]"),
> -              abfd, name, hdr->sh_type);
> -         else
> --          /* Allow sections reserved for applications.  */
> --          return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> --                                                  shindex);
> -+          {
> -+            /* Allow sections reserved for applications.  */
> -+            ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> -+                                                   shindex);
> -+            goto success;
> -+          }
> -       }
> -       else if (hdr->sh_type >= SHT_LOPROC
> -              && hdr->sh_type <= SHT_HIPROC)
> -@@ -2023,8 +2077,11 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -                "`%s' [0x%8x]"),
> -              abfd, name, hdr->sh_type);
> -         else
> --          /* Otherwise it should be processed.  */
> --          return _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> shindex);
> -+          {
> -+            /* Otherwise it should be processed.  */
> -+            ret = _bfd_elf_make_section_from_shdr (abfd, hdr, name,
> shindex);
> -+            goto success;
> -+          }
> -       }
> -       else
> -       /* FIXME: We should handle this section.  */
> -@@ -2032,10 +2089,17 @@ bfd_section_from_shdr (bfd *abfd, unsign
> -         (_("%B: don't know how to handle section `%s' [0x%8x]"),
> -          abfd, name, hdr->sh_type);
> -
> --      return FALSE;
> -+      goto fail;
> -     }
> -
> --  return TRUE;
> -+ fail:
> -+  ret = FALSE;
> -+ success:
> -+  if (sections_being_created)
> -+    sections_being_created [shindex] = FALSE;
> -+  if (-- nesting == 0)
> -+    sections_being_created = NULL;
> -+  return ret;
> - }
> -
> - /* Return the local symbol specified by ABFD, R_SYMNDX.  */
> -Index: binutils-2.24/bfd/peXXigen.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/peXXigen.c
> -+++ binutils-2.24/bfd/peXXigen.c
> -@@ -1528,7 +1528,12 @@ pe_print_edata (bfd * abfd, void * vfile
> -         _("\nExport Address Table -- Ordinal Base %ld\n"),
> -         edt.base);
> -
> --  for (i = 0; i < edt.num_functions; ++i)
> -+  /* PR 17512: Handle corrupt PE binaries.  */
> -+  if (edt.eat_addr + (edt.num_functions * 4) - adj >= datasize)
> -+    fprintf (file, _("\tInvalid Export Address Table rva (0x%lx) or
> entry count (0x%lx)\n"),
> -+           (long) edt.eat_addr,
> -+           (long) edt.num_functions);
> -+  else for (i = 0; i < edt.num_functions; ++i)
> -     {
> -       bfd_vma eat_member = bfd_get_32 (abfd,
> -                                      data + edt.eat_addr + (i * 4) -
> adj);
> -@@ -1564,7 +1569,16 @@ pe_print_edata (bfd * abfd, void * vfile
> -   fprintf (file,
> -          _("\n[Ordinal/Name Pointer] Table\n"));
> -
> --  for (i = 0; i < edt.num_names; ++i)
> -+  /* PR 17512: Handle corrupt PE binaries.  */
> -+  if (edt.npt_addr + (edt.num_names * 4) - adj >= datasize)
> -+    fprintf (file, _("\tInvalid Name Pointer Table rva (0x%lx) or entry
> count (0x%lx)\n"),
> -+           (long) edt.npt_addr,
> -+           (long) edt.num_names);
> -+  else if (edt.ot_addr + (edt.num_names * 2) - adj >= datasize)
> -+    fprintf (file, _("\tInvalid Ordinal Table rva (0x%lx) or entry count
> (0x%lx)\n"),
> -+           (long) edt.ot_addr,
> -+           (long) edt.num_names);
> -+  else for (i = 0; i < edt.num_names; ++i)
> -     {
> -       bfd_vma name_ptr = bfd_get_32 (abfd,
> -                                   data +
> -Index: binutils-2.24/bfd/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/bfd/ChangeLog
> -+++ binutils-2.24/bfd/ChangeLog
> -@@ -1,8 +1,13 @@
> - 2014-10-27  Nick Clifton  <nickc@redhat.com>
> -
> -        PR binutils/17512
> -+       * elf.c (bfd_section_from_shdr): Detect and warn about ELF
> -+       binaries with a group of sections linked by the string table
> -+       indicies.
> -        * peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle corrupt binaries
> -        with an invalid value for NumberOfRvaAndSizes.
> -+       (pe_print_edata): Detect out of range rvas and entry counts for
> -+       the Export Address table, Name Pointer table and Ordinal table.
> -
> -        PR binutils/17510
> -        * elf.c (setup_group): Improve handling of corrupt group
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
> deleted file mode 100644
> index 2dd3354..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8503 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From 0102ea8cec5fc509bba6c91df61b7ce23a799d32 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Thu, 30 Oct 2014 17:16:17 +0000
> -Subject: [PATCH] Fixes a seg-fault in the ihex parser when it encounters a
> - malformed ihex file.
> -
> -       PR binutils/17512
> -       * ihex.c (ihex_scan): Fix typo in invocation of ihex_bad_byte.
> ----
> - bfd/ChangeLog | 1 +
> - bfd/ihex.c    | 2 +-
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -Index: binutils-2.24/bfd/ihex.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/ihex.c
> -+++ binutils-2.24/bfd/ihex.c
> -@@ -322,7 +322,7 @@ ihex_scan (bfd *abfd)
> -           {
> -             if (! ISHEX (buf[i]))
> -               {
> --                ihex_bad_byte (abfd, lineno, hdr[i], error);
> -+                ihex_bad_byte (abfd, lineno, buf[i], error);
> -                 goto error_return;
> -               }
> -           }
> -Index: binutils-2.24/bfd/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/bfd/ChangeLog
> -+++ binutils-2.24/bfd/ChangeLog
> -@@ -1,3 +1,8 @@
> -+2014-10-30  Nick Clifton  <nickc@redhat.com>
> -+
> -+    PR binutils/17512
> -+    * ihex.c (ihex_scan): Fix typo in invocation of ihex_bad_byte.
> -+
> - 2014-10-27  Nick Clifton  <nickc@redhat.com>
> -
> -        PR binutils/17512
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
> deleted file mode 100644
> index b4d1d1f..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8504 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From 708d7d0d11f0f2d776171979aa3479e8e12a38a0 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Tue, 28 Oct 2014 10:48:14 +0000
> -Subject: [PATCH] This patch fixes a flaw in the SREC parser which could
> cause
> - a stack overflow and potential secuiryt breach.
> -
> -       PR binutils/17510
> -       * srec.c (srec_bad_byte): Increase size of buf to allow for
> -       negative values.
> -       (srec_scan): Use an unsigned char buffer to hold header bytes.
> ----
> - bfd/ChangeLog  | 8 ++++++++
> - bfd/elf.c      | 2 +-
> - bfd/peXXigen.c | 1 -
> - bfd/srec.c     | 4 ++--
> - 4 files changed, 11 insertions(+), 4 deletions(-)
> -
> -Index: binutils-2.24/bfd/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/bfd/ChangeLog
> -+++ binutils-2.24/bfd/ChangeLog
> -@@ -1,3 +1,11 @@
> -+2014-10-28  Andreas Schwab  <schwab@suse.de>
> -+       Nick Clifton  <nickc@redhat.com>
> -+
> -+   PR binutils/17510
> -+   * srec.c (srec_bad_byte): Increase size of buf to allow for
> -+   negative values.
> -+   (srec_scan): Use an unsigned char buffer to hold header bytes.
> -+
> - 2014-10-30  Nick Clifton  <nickc@redhat.com>
> -
> -     PR binutils/17512
> -Index: binutils-2.24/bfd/peXXigen.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/peXXigen.c
> -+++ binutils-2.24/bfd/peXXigen.c
> -@@ -471,7 +471,6 @@ _bfd_XXi_swap_aouthdr_in (bfd * abfd,
> -       a->NumberOfRvaAndSizes = 0;
> -       }
> -
> --
> -     for (idx = 0; idx < a->NumberOfRvaAndSizes; idx++)
> -       {
> -         /* If data directory is empty, rva also should be 0.  */
> -Index: binutils-2.24/bfd/srec.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/srec.c
> -+++ binutils-2.24/bfd/srec.c
> -@@ -248,7 +248,7 @@ srec_bad_byte (bfd *abfd,
> -     }
> -   else
> -     {
> --      char buf[10];
> -+      char buf[40];
> -
> -       if (! ISPRINT (c))
> -       sprintf (buf, "\\%03o", (unsigned int) c);
> -@@ -454,7 +454,7 @@ srec_scan (bfd *abfd)
> -       case 'S':
> -         {
> -           file_ptr pos;
> --          char hdr[3];
> -+          unsigned char hdr[3];
> -           unsigned int bytes, min_bytes;
> -           bfd_vma address;
> -           bfd_byte *data;
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
> b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
> deleted file mode 100644
> index 4a84562..0000000
> --- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -Upstream-Status: Backport
> -
> -CVE-2014-8737 fix.
> -
> -[YOCTO #7084]
> -
> -Signed-off-by: Armin Kuster <akuster808@gmail.com>
> -
> -From dd9b91de2149ee81d47f708e7b0bbf57da10ad42 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Thu, 6 Nov 2014 14:49:10 +0000
> -Subject: [PATCH] Prevent archive memebers with illegal pathnames from
> being
> - extracted from an archive.
> -
> -       PR binutils/17552, binutils/17533
> -       * bucomm.c (is_valid_archive_path): New function.  Returns false
> -       for absolute pathnames and pathnames that include /../.
> -       * bucomm.h (is_valid_archive_path): Add prototype.
> -       * ar.c (extract_file): Use new function to check for valid
> -       pathnames when extracting files from an archive.
> -       * objcopy.c (copy_archive): Likewise.
> -       * doc/binutils.texi: Update documentation to mention the
> -       limitation on pathname of archive members.
> ----
> - binutils/ChangeLog         | 16 ++++++++++++++--
> - binutils/ar.c              |  9 +++++++++
> - binutils/bucomm.c          | 26 ++++++++++++++++++++++++++
> - binutils/bucomm.h          | 12 ++++++++----
> - binutils/doc/binutils.texi |  3 ++-
> - binutils/objcopy.c         |  6 ++++++
> - 6 files changed, 65 insertions(+), 7 deletions(-)
> -
> -Index: binutils-2.24/binutils/ar.c
> -===================================================================
> ---- binutils-2.24.orig/binutils/ar.c
> -+++ binutils-2.24/binutils/ar.c
> -@@ -1031,6 +1031,15 @@ extract_file (bfd *abfd)
> -   bfd_size_type size;
> -   struct stat buf;
> -
> -+  /* PR binutils/17533: Do not allow directory traversal
> -+     outside of the current directory tree.  */
> -+  if (! is_valid_archive_path (bfd_get_filename (abfd)))
> -+    {
> -+      non_fatal (_("illegal pathname found in archive member: %s"),
> -+               bfd_get_filename (abfd));
> -+      return;
> -+    }
> -+
> -   if (bfd_stat_arch_elt (abfd, &buf) != 0)
> -     /* xgettext:c-format */
> -     fatal (_("internal stat error on %s"), bfd_get_filename (abfd));
> -Index: binutils-2.24/binutils/bucomm.c
> -===================================================================
> ---- binutils-2.24.orig/binutils/bucomm.c
> -+++ binutils-2.24/binutils/bucomm.c
> -@@ -624,3 +624,29 @@ bfd_get_archive_filename (const bfd *abf
> -          bfd_get_filename (abfd));
> -   return buf;
> - }
> -+
> -+/* Returns TRUE iff PATHNAME, a filename of an archive member,
> -+   is valid for writing.  For security reasons absolute paths
> -+   and paths containing /../ are not allowed.  See PR 17533.  */
> -+
> -+bfd_boolean
> -+is_valid_archive_path (char const * pathname)
> -+{
> -+  const char * n = pathname;
> -+
> -+  if (IS_ABSOLUTE_PATH (n))
> -+    return FALSE;
> -+
> -+  while (*n)
> -+    {
> -+      if (*n == '.' && *++n == '.' && ( ! *++n || IS_DIR_SEPARATOR (*n)))
> -+      return FALSE;
> -+
> -+      while (*n && ! IS_DIR_SEPARATOR (*n))
> -+      n++;
> -+      while (IS_DIR_SEPARATOR (*n))
> -+      n++;
> -+    }
> -+
> -+  return TRUE;
> -+}
> -Index: binutils-2.24/binutils/bucomm.h
> -===================================================================
> ---- binutils-2.24.orig/binutils/bucomm.h
> -+++ binutils-2.24/binutils/bucomm.h
> -@@ -23,6 +23,8 @@
> - #ifndef _BUCOMM_H
> - #define _BUCOMM_H
> -
> -+/* In bucomm.c.  */
> -+
> - /* Return the filename in a static buffer.  */
> - const char *bfd_get_archive_filename (const bfd *);
> -
> -@@ -58,20 +60,22 @@ bfd_vma parse_vma (const char *, const c
> -
> - off_t get_file_size (const char *);
> -
> -+bfd_boolean is_valid_archive_path (char const *);
> -+
> - extern char *program_name;
> -
> --/* filemode.c */
> -+/* In filemode.c.  */
> - void mode_string (unsigned long, char *);
> -
> --/* version.c */
> -+/* In version.c.  */
> - extern void print_version (const char *);
> -
> --/* rename.c */
> -+/* In rename.c.  */
> - extern void set_times (const char *, const struct stat *);
> -
> - extern int smart_rename (const char *, const char *, int);
> -
> --/* libiberty.  */
> -+/* In libiberty.  */
> - void *xmalloc (size_t);
> -
> - void *xrealloc (void *, size_t);
> -Index: binutils-2.24/binutils/doc/binutils.texi
> -===================================================================
> ---- binutils-2.24.orig/binutils/doc/binutils.texi
> -+++ binutils-2.24/binutils/doc/binutils.texi
> -@@ -234,7 +234,8 @@ a normal archive.  Instead the elements
> - individually to the second archive.
> -
> - The paths to the elements of the archive are stored relative to the
> --archive itself.
> -+archive itself.  For security reasons absolute paths and paths with a
> -+@code{/../} component are not allowed.
> -
> - @cindex compatibility, @command{ar}
> - @cindex @command{ar} compatibility
> -Index: binutils-2.24/binutils/objcopy.c
> -===================================================================
> ---- binutils-2.24.orig/binutils/objcopy.c
> -+++ binutils-2.24/binutils/objcopy.c
> -@@ -2206,6 +2206,12 @@ copy_archive (bfd *ibfd, bfd *obfd, cons
> -       bfd_boolean del = TRUE;
> -       bfd_boolean ok_object;
> -
> -+      /* PR binutils/17533: Do not allow directory traversal
> -+       outside of the current directory tree by archive members.  */
> -+      if (! is_valid_archive_path (bfd_get_filename (this_element)))
> -+      fatal (_("illegal pathname found in archive member: %s"),
> -+             bfd_get_filename (this_element));
> -+
> -       /* Create an output file for this member.  */
> -       output_name = concat (dir, "/",
> -                           bfd_get_filename (this_element), (char *) 0);
> -Index: binutils-2.24/binutils/ChangeLog
> -===================================================================
> ---- binutils-2.24.orig/binutils/ChangeLog
> -+++ binutils-2.24/binutils/ChangeLog
> -@@ -1,3 +1,15 @@
> -+2014-11-06  Nick Clifton  <nickc@redhat.com>
> -+
> -+       PR binutils/17552, binutils/17533
> -+       * bucomm.c (is_valid_archive_path): New function.  Returns false
> -+       for absolute pathnames and pathnames that include /../.
> -+       * bucomm.h (is_valid_archive_path): Add prototype.
> -+       * ar.c (extract_file): Use new function to check for valid
> -+       pathnames when extracting files from an archive.
> -+       * objcopy.c (copy_archive): Likewise.
> -+       * doc/binutils.texi: Update documentation to mention the
> -+       limitation on pathname of archive members.
> -+
> - 2013-11-22  Cory Fields  <cory@coryfields.com>
> -
> -       * windres.c (define_resource): Use zero for timestamp, making
> diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
> b/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
> deleted file mode 100644
> index 9f53f41..0000000
> --- a/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -This patch fixes the problem where libiberty is not installed in spite of
> -asking it via --enable-install-libiberty, the problem is that
> target_header_dir
> -is reset explicitly which means libiberty.a will never get installed
> -
> -also check
> -
> -https://sourceware.org/bugzilla/show_bug.cgi?id=15815
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: binutils-2.24/libiberty/configure
> -===================================================================
> ---- binutils-2.24.orig/libiberty/configure     2013-12-16
> 00:08:09.280103157 -0800
> -+++ binutils-2.24/libiberty/configure  2013-12-16 00:08:29.753436339 -0800
> -@@ -5507,7 +5507,6 @@
> -
> - setobjs=
> - CHECK=
> --target_header_dir=
> - if test -n "${with_target_subdir}"; then
> -
> -   # We are being configured as a target library.  AC_REPLACE_FUNCS
> -Index: binutils-2.24/libiberty/configure.ac
> -===================================================================
> ---- binutils-2.24.orig/libiberty/configure.ac  2013-11-08
> 02:13:49.000000000 -0800
> -+++ binutils-2.24/libiberty/configure.ac       2013-12-16
> 00:07:45.133436672 -0800
> -@@ -405,7 +405,6 @@
> -
> - setobjs=
> - CHECK=
> --target_header_dir=
> - if test -n "${with_target_subdir}"; then
> -
> -   # We are being configured as a target library.  AC_REPLACE_FUNCS
> diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
> b/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
> deleted file mode 100644
> index 4584748..0000000
> --- a/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -commit 4199e3b8669d0a36448687850374fdc2ad7240b6
> -Author: Alan Modra <amodra@gmail.com>
> -Date:   Wed Jan 15 21:50:55 2014 +1030
> -
> -    non-PIC references to __ehdr_start in pie and shared
> -
> -    Rather than hacking every backend to not discard dynamic relocations
> -    against an undefined hidden __ehdr_start, make it appear to be defined
> -    early.  We want __ehdr_start hidden before size_dynamic_sections so
> -    that it isn't put in .dynsym, but we do need the dynamic relocations
> -    for a PIE or shared library with a non-PIC reference.  Defining it
> -    early is wrong if we don't actually define the symbol later to its
> -    proper value.  (In some cases we want to leave the symbol undefined,
> -    for example, when the ELF header isn't loaded, and we don't have this
> -    infomation available in before_allocation.)
> -
> -    ld/
> -       * emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
> Define
> -       __ehdr_start before size_dynamic_sections and restore afterwards.
> -    ld/testsuite/
> -       * ld-elf/ehdr_start-shared.d: New.
> -       * ld-elf/ehdr_start-userdef.d: xfail frv.
> -       * ld-elf/ehdr_start-weak.d: Likewise.
> -       * ld-elf/ehdr_start.d: Likewise.
> -
> -Upstream-Status: Backport
> -
> -diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
> -index 9a2fe89..13f86f0 100644
> ---- a/ld/emultempl/elf32.em
> -+++ b/ld/emultempl/elf32.em
> -@@ -1480,6 +1480,8 @@ gld${EMULATION_NAME}_before_allocation (void)
> -   const char *rpath;
> -   asection *sinterp;
> -   bfd *abfd;
> -+  struct elf_link_hash_entry *ehdr_start = NULL;
> -+  struct bfd_link_hash_entry ehdr_start_save;
> -
> -   if (is_elf_hash_table (link_info.hash))
> -     {
> -@@ -1504,6 +1506,16 @@ gld${EMULATION_NAME}_before_allocation (void)
> -              _bfd_elf_link_hash_hide_symbol (&link_info, h, TRUE);
> -              if (ELF_ST_VISIBILITY (h->other) != STV_INTERNAL)
> -                h->other = (h->other & ~ELF_ST_VISIBILITY (-1)) |
> STV_HIDDEN;
> -+           /* Don't leave the symbol undefined.  Undefined hidden
> -+              symbols typically won't have dynamic relocations, but
> -+              we most likely will need dynamic relocations for
> -+              __ehdr_start if we are building a PIE or shared
> -+              library.  */
> -+           ehdr_start = h;
> -+           ehdr_start_save = h->root;
> -+           h->root.type = bfd_link_hash_defined;
> -+           h->root.u.def.section = bfd_abs_section_ptr;
> -+           h->root.u.def.value = 0;
> -            }
> -        }
> -
> -@@ -1620,6 +1632,14 @@ ${ELF_INTERPRETER_SET_DEFAULT}
> -
> -   if (!bfd_elf_size_dynsym_hash_dynstr (link_info.output_bfd,
> &link_info))
> -     einfo ("%P%F: failed to set dynamic section sizes: %E\n");
> -+
> -+  if (ehdr_start != NULL)
> -+    {
> -+      /* If we twiddled __ehdr_start to defined earlier, put it back
> -+       as it was.  */
> -+      ehdr_start->root.type = ehdr_start_save.type;
> -+      ehdr_start->root.u = ehdr_start_save.u;
> -+    }
> - }
> -
> - EOF
> -diff --git a/ld/testsuite/ld-elf/ehdr_start-shared.d
> b/ld/testsuite/ld-elf/ehdr_start-shared.d
> -new file mode 100644
> -index 0000000..c17516a
> ---- /dev/null
> -+++ b/ld/testsuite/ld-elf/ehdr_start-shared.d
> -@@ -0,0 +1,9 @@
> -+#source: ehdr_start.s
> -+#ld: -e _start -shared
> -+#nm: -n
> -+#target: *-*-linux* *-*-gnu* *-*-nacl*
> -+#xfail: cris*-*-* frv-*-*
> -+
> -+#...
> -+[0-9a-f]*000 [Adrt] __ehdr_start
> -+#pass
> -diff --git a/ld/testsuite/ld-elf/ehdr_start-userdef.d
> b/ld/testsuite/ld-elf/ehdr_start-userdef.d
> -index 2a88e98..b58ae3f 100644
> ---- a/ld/testsuite/ld-elf/ehdr_start-userdef.d
> -+++ b/ld/testsuite/ld-elf/ehdr_start-userdef.d
> -@@ -2,6 +2,7 @@
> - #ld: -e _start -T ehdr_start-userdef.t
> - #readelf: -Ws
> - #target: *-*-linux* *-*-gnu* *-*-nacl*
> -+#xfail: frv-*-*
> -
> - #...
> - Symbol table '\.symtab' contains [0-9]+ entries:
> -diff --git a/ld/testsuite/ld-elf/ehdr_start-weak.d
> b/ld/testsuite/ld-elf/ehdr_start-weak.d
> -index 8bd9035..24ae34c 100644
> ---- a/ld/testsuite/ld-elf/ehdr_start-weak.d
> -+++ b/ld/testsuite/ld-elf/ehdr_start-weak.d
> -@@ -2,6 +2,7 @@
> - #ld: -e _start -T ehdr_start-missing.t
> - #nm: -n
> - #target: *-*-linux* *-*-gnu* *-*-nacl*
> -+#xfail: frv-*-*
> -
> - #...
> - \s+[wU] __ehdr_start
> -diff --git a/ld/testsuite/ld-elf/ehdr_start.d
> b/ld/testsuite/ld-elf/ehdr_start.d
> -index 52e5b54..d538b66 100644
> ---- a/ld/testsuite/ld-elf/ehdr_start.d
> -+++ b/ld/testsuite/ld-elf/ehdr_start.d
> -@@ -2,6 +2,7 @@
> - #ld: -e _start
> - #nm: -n
> - #target: *-*-linux* *-*-gnu* *-*-nacl*
> -+#xfail: frv-*-*
> -
> - #...
> - [0-9a-f]*000 [Adrt] __ehdr_start
> diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
> b/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
> deleted file mode 100644
> index 65d62bc..0000000
> --- a/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
> +++ /dev/null
> @@ -1,220 +0,0 @@
> -From: H.J. Lu <hjl.tools@gmail.com>
> -Date: Tue, 21 Jan 2014 23:42:43 +0000 (-0800)
> -Subject: Check incompatible existing default symbol definition
> -X-Git-Tag: hjl/linux/release/2.24.51.0.3~1^2~8^2~16
> -X-Git-Url:
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff_plain;h=4584ec12076e088cf36965b88ef8710ca85491f9
> -
> -Check incompatible existing default symbol definition
> -
> -After resolving a versioned reference, foo@VER1, to a default versioned
> -definition, foo@@VER1, from a shared object, we also merge it with
> -the existing regular default symbol definition, foo.  When foo is IFUNC
> -and foo@@VER1 aren't, we will merge 2 incompatible definitions.  This
> -patch avoids merging foo@@VER1 definition with foo definition if
> -one is IFUNC and the other isn't.
> -
> -Upstream-Status: Backport
> ----
> -
> -#diff --git a/bfd/ChangeLog b/bfd/ChangeLog
> -#index 5923bc3..c70a7db 100644
> -#--- a/bfd/ChangeLog
> -#+++ b/bfd/ChangeLog
> -#@@ -1,5 +1,13 @@
> -# 2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
> -#
> -#+     PR ld/16467
> -#+     * elflink.c (_bfd_elf_merge_symbol): When types of the existing
> -#+     regular default symbol definition and the versioned dynamic
> -#+     symbol definition mismatch, skip the default symbol definition
> -#+     if one of them is IFUNC.
> -#+
> -#+2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
> -#+
> -#      PR ld/2404
> -#      * elflink.c (_bfd_elf_merge_symbol): Don't check info->shared,
> -#      info->export_dynamic nor h->ref_dynamic for type mismatch when
> -diff --git a/bfd/elflink.c b/bfd/elflink.c
> -index d0006da..792e14e 100644
> ---- a/bfd/elflink.c
> -+++ b/bfd/elflink.c
> -@@ -1092,11 +1092,14 @@ _bfd_elf_merge_symbol (bfd *abfd,
> -       && newdyn
> -       && newdef
> -       && !olddyn
> --      && (olddef || h->root.type == bfd_link_hash_common)
> --      && ELF_ST_TYPE (sym->st_info) != h->type
> --      && ELF_ST_TYPE (sym->st_info) != STT_NOTYPE
> --      && h->type != STT_NOTYPE
> --      && !(newfunc && oldfunc))
> -+      && (((olddef || h->root.type == bfd_link_hash_common)
> -+         && ELF_ST_TYPE (sym->st_info) != h->type
> -+         && ELF_ST_TYPE (sym->st_info) != STT_NOTYPE
> -+         && h->type != STT_NOTYPE
> -+         && !(newfunc && oldfunc))
> -+        || (olddef
> -+            && ((h->type == STT_GNU_IFUNC)
> -+                != (ELF_ST_TYPE (sym->st_info) == STT_GNU_IFUNC)))))
> -     {
> -       *skip = TRUE;
> -       return TRUE;
> -#diff --git a/ld/testsuite/ChangeLog b/ld/testsuite/ChangeLog
> -#index ac65a3a..a092428 100644
> -#--- a/ld/testsuite/ChangeLog
> -#+++ b/ld/testsuite/ChangeLog
> -#@@ -1,5 +1,19 @@
> -# 2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
> -#
> -#+     PR ld/16467
> -#+     * ld-ifunc/dummy.c: New file.
> -#+     * ld-ifunc/pr16467.out: Likewise.
> -##+    * ld-ifunc/pr16467a.c: Likewise.
> -#+     * ld-ifunc/pr16467a.map: Likewise.
> -#+     * ld-ifunc/pr16467b.c: Likewise.
> -#+     * ld-ifunc/pr16467b.map: Likewise.
> -#+     * ld-ifunc/pr16467c.c: Likewise.
> -#+
> -#+     * ld-ifunc/ifunc.exp (run_cc_link_tests): New.
> -#+     (run_ld_link_exec_tests): Run pr16467.
> -#+
> -#+2014-01-21  H.J. Lu  <hongjiu.lu@intel.com>
> -#+
> -#      PR ld/2404
> -#      * ld-elf/shared.exp: Add a PIE test for PR ld/2404.
> -#
> -diff --git a/ld/testsuite/ld-ifunc/dummy.c b/ld/testsuite/ld-ifunc/dummy.c
> -new file mode 100644
> -index 0000000..5c03287
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/dummy.c
> -@@ -0,0 +1 @@
> -+/* An empty file.  */
> -diff --git a/ld/testsuite/ld-ifunc/ifunc.exp
> b/ld/testsuite/ld-ifunc/ifunc.exp
> -index fb106c6..d7ff445 100644
> ---- a/ld/testsuite/ld-ifunc/ifunc.exp
> -+++ b/ld/testsuite/ld-ifunc/ifunc.exp
> -@@ -349,6 +349,42 @@ if { $verbose < 1 } {
> -     remote_file host delete "tmpdir/static_nonifunc_prog"
> - }
> -
> -+run_cc_link_tests [list \
> -+    [list \
> -+      "Build libpr16467a.so" \
> -+      "-shared -Wl,--version-script=pr16467a.map" \
> -+      "-fPIC" \
> -+      { pr16467a.c } \
> -+      {} \
> -+      "libpr16467a.so" \
> -+    ] \
> -+    [list \
> -+      "Build libpr16467b.a" \
> -+      "" \
> -+      "-fPIC" \
> -+      { pr16467b.c } \
> -+      {} \
> -+      "libpr16467b.a" \
> -+    ] \
> -+    [list \
> -+      "Build libpr16467b.so" \
> -+      "-shared tmpdir/pr16467b.o tmpdir/libpr16467a.so \
> -+       -Wl,--version-script=pr16467b.map" \
> -+      "-fPIC" \
> -+      { dummy.c } \
> -+      {} \
> -+      "libpr16467b.so" \
> -+    ] \
> -+    [list \
> -+      "Build libpr16467c.a" \
> -+      "" \
> -+      "" \
> -+      { pr16467c.c } \
> -+      {} \
> -+      "libpr16467c.a" \
> -+    ] \
> -+]
> -+
> - run_ld_link_exec_tests [] [list \
> -     [list \
> -       "Common symbol override ifunc test 1a" \
> -@@ -368,6 +404,15 @@ run_ld_link_exec_tests [] [list \
> -       "ifunc-common-1.out" \
> -       "-g" \
> -     ] \
> -+    [list \
> -+      "Run pr16467" \
> -+      "tmpdir/pr16467c.o tmpdir/libpr16467b.so tmpdir/libpr16467a.so" \
> -+      "" \
> -+      { dummy.c } \
> -+      "pr16467" \
> -+      "pr16467.out" \
> -+      "" \
> -+    ] \
> - ]
> -
> - set test_list [lsort [glob -nocomplain $srcdir/$subdir/*.d]]
> -diff --git a/ld/testsuite/ld-ifunc/pr16467.out
> b/ld/testsuite/ld-ifunc/pr16467.out
> -new file mode 100644
> -index 0000000..d86bac9
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/pr16467.out
> -@@ -0,0 +1 @@
> -+OK
> -diff --git a/ld/testsuite/ld-ifunc/pr16467a.c
> b/ld/testsuite/ld-ifunc/pr16467a.c
> -new file mode 100644
> -index 0000000..ae3f084
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/pr16467a.c
> -@@ -0,0 +1,5 @@
> -+const char *
> -+sd_get_seats(void)
> -+{
> -+  return "OK";
> -+}
> -diff --git a/ld/testsuite/ld-ifunc/pr16467a.map
> b/ld/testsuite/ld-ifunc/pr16467a.map
> -new file mode 100644
> -index 0000000..d677f37
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/pr16467a.map
> -@@ -0,0 +1,4 @@
> -+LIBSYSTEMD_209 {
> -+global:
> -+        sd_get_seats;
> -+};
> -diff --git a/ld/testsuite/ld-ifunc/pr16467b.c
> b/ld/testsuite/ld-ifunc/pr16467b.c
> -new file mode 100644
> -index 0000000..264f6cf
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/pr16467b.c
> -@@ -0,0 +1,7 @@
> -+void new_sd_get_seats(void);
> -+__asm__(".symver new_sd_get_seats,sd_get_seats@LIBSYSTEMD_209");
> -+void (*resolve_sd_get_seats(void)) (void) __asm__ ("sd_get_seats");
> -+void (*resolve_sd_get_seats(void)) (void) {
> -+        return new_sd_get_seats;
> -+}
> -+__asm__(".type sd_get_seats, %gnu_indirect_function");
> -diff --git a/ld/testsuite/ld-ifunc/pr16467b.map
> b/ld/testsuite/ld-ifunc/pr16467b.map
> -new file mode 100644
> -index 0000000..1f263de
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/pr16467b.map
> -@@ -0,0 +1,4 @@
> -+LIBSYSTEMD_208 {
> -+global:
> -+        sd_get_seats;
> -+};
> -diff --git a/ld/testsuite/ld-ifunc/pr16467c.c
> b/ld/testsuite/ld-ifunc/pr16467c.c
> -new file mode 100644
> -index 0000000..e2a901c
> ---- /dev/null
> -+++ b/ld/testsuite/ld-ifunc/pr16467c.c
> -@@ -0,0 +1,9 @@
> -+#include <stdio.h>
> -+const char* sd_get_seats(void);
> -+
> -+int
> -+main (int argc, char **argv)
> -+{
> -+  printf("%s\n", sd_get_seats());
> -+  return 0;
> -+}
> diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
> b/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
> deleted file mode 100644
> index 41f3504..0000000
> --- a/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -From: H.J. Lu <hjl.tools@gmail.com>
> -Date: Tue, 21 Jan 2014 13:33:48 +0000 (-0800)
> -Subject: Don't check shared/export_dynamic/ref_dynamic for type mismatch
> -X-Git-Tag: hjl/linux/release/2.24.51.0.3~1^2~8^2~22
> -X-Git-Url:
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff_plain;h=22ef172a21663abb477d72284b4d59c8eabcbb82
> -
> -Don't check shared/export_dynamic/ref_dynamic for type mismatch
> -
> -There is nothing linker can do when a type mismatched default definition
> -are made dynamic by info->shared, info->export_dynamic or h->ref_dynamic.
> -But we do want to avoid exporting it when building PIE.  Let's remove
> -those checks.
> -
> -bfd/
> -
> -       PR ld/2404
> -       * elflink.c (_bfd_elf_merge_symbol): Don't check info->shared,
> -       info->export_dynamic, nor !h->ref_dynamic for type mismatch when
> -       adding the default version.
> -
> -ld/testsuite/
> -
> -       PR ld/2404
> -       * ld-elf/shared.exp: Add a PIE test for PR ld/2404.
> -
> -Upstream-Status: Backport
> ----
> -
> -Index: binutils-2.24/bfd/elflink.c
> -===================================================================
> ---- binutils-2.24.orig/bfd/elflink.c   2014-02-08 13:20:08.628378267 +0000
> -+++ binutils-2.24/bfd/elflink.c        2014-02-08 13:20:08.624378267 +0000
> -@@ -1090,9 +1090,6 @@
> -      the type of existing regular definition mismatch.  We only do it
> -      if the existing regular definition won't be dynamic.  */
> -   if (pold_alignment == NULL
> --      && !info->shared
> --      && !info->export_dynamic
> --      && !h->ref_dynamic
> -       && newdyn
> -       && newdef
> -       && !olddyn
> -Index: binutils-2.24/ld/testsuite/ld-elf/shared.exp
> -===================================================================
> ---- binutils-2.24.orig/ld/testsuite/ld-elf/shared.exp  2014-02-08
> 13:20:08.628378267 +0000
> -+++ binutils-2.24/ld/testsuite/ld-elf/shared.exp       2014-02-08
> 13:20:08.624378267 +0000
> -@@ -432,3 +432,29 @@
> -
> - run_cc_link_tests $build_cxx_tests
> - run_ld_link_exec_tests [] $run_cxx_tests
> -+
> -+if { [istarget *-*-linux*]
> -+     || [istarget *-*-nacl*]
> -+     || [istarget *-*-gnu*] } {
> -+    run_cc_link_tests [list \
> -+      [list \
> -+          "Build libpr2404b.a with PIE" \
> -+          "" \
> -+          "-fPIE" \
> -+          { pr2404b.c } \
> -+          {} \
> -+          "libpr2404b.a" \
> -+      ] \
> -+    ]
> -+    run_ld_link_exec_tests [] [list \
> -+      [list \
> -+          "Run pr2404 with PIE" \
> -+          "-pie tmpdir/pr2404b.o tmpdir/libpr2404a.so" \
> -+          "" \
> -+          { dummy.c } \
> -+          "pr2404pie" \
> -+          "pr2404.out" \
> -+          "-fPIE" \
> -+      ] \
> -+    ]
> -+}
> diff --git
> a/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
> b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
> index 2e621f1..9aaecd9 100644
> --- a/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
> +++ b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
> @@ -16661,7 +16661,7 @@ Index: binutils-2.24/ld/configure
>  ===================================================================
>  --- binutils-2.24.orig/ld/configure    2013-11-04 07:33:39.000000000 -0800
>  +++ binutils-2.24/ld/configure 2013-12-15 11:12:06.120451266 -0800
> -@@ -646,8 +646,11 @@
> +@@ -654,8 +654,11 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -16673,24 +16673,24 @@ Index: binutils-2.24/ld/configure
>   OBJDUMP
>   LN_S
>   NM
> -@@ -785,6 +788,7 @@
> +@@ -776,6 +779,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
>  +with_libtool_sysroot
>   enable_libtool_lock
> - enable_nls
> - enable_initfini_array
> -@@ -1452,6 +1456,8 @@
> + enable_plugins
> + enable_largefile
> +@@ -1453,6 +1457,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects
> [default=use
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
>  +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>  +                        (or the compiler's sysroot if not specified).
> +   --with-lib-path=dir1:dir2...  set default LIB_PATH
> +   --with-sysroot=DIR Search for usr/lib et al within DIR.
>     --with-zlib             include zlib support (auto/yes/no) default=auto
> -
> - Some influential environment variables:
> -@@ -6125,8 +6131,8 @@
> +@@ -5645,8 +5651,8 @@ esac
>
>
>
> @@ -16701,7 +16701,7 @@ Index: binutils-2.24/ld/configure
>
>
>
> -@@ -6166,7 +6172,7 @@
> +@@ -5686,7 +5692,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"
> >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -16710,7 +16710,7 @@ Index: binutils-2.24/ld/configure
>      test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
>     ECHO='print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
> -@@ -6852,8 +6858,8 @@
> +@@ -6372,8 +6378,8 @@ $as_echo_n "checking whether the shell understands
> some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=no
>   ( _lt_dummy="a/b/c"
> @@ -16721,7 +16721,7 @@ Index: binutils-2.24/ld/configure
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=yes
> -@@ -6902,6 +6908,80 @@
> +@@ -6422,6 +6428,80 @@ esac
>
>
>
> @@ -16802,7 +16802,7 @@ Index: binutils-2.24/ld/configure
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to
> reload object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if test "${lt_cv_ld_reload_flag+set}" = set; then :
> -@@ -6918,6 +6998,11 @@
> +@@ -6438,6 +6518,11 @@ case $reload_flag in
>   esac
>   reload_cmds='$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -16814,7 +16814,7 @@ Index: binutils-2.24/ld/configure
>     darwin*)
>       if test "$GCC" = yes; then
>         reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o
> $output$reload_objs'
> -@@ -7086,7 +7171,8 @@
> +@@ -6606,7 +6691,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
>       lt_cv_file_magic_cmd='func_win32_libid'
>     else
> @@ -16824,7 +16824,7 @@ Index: binutils-2.24/ld/configure
>       lt_cv_file_magic_cmd='$OBJDUMP -f'
>     fi
>     ;;
> -@@ -7240,6 +7326,21 @@
> +@@ -6760,6 +6846,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> $lt_cv_deplibs_check_method" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -16846,7 +16846,7 @@ Index: binutils-2.24/ld/configure
>   file_magic_cmd=$lt_cv_file_magic_cmd
>   deplibs_check_method=$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=unknown
> -@@ -7255,9 +7356,162 @@
> +@@ -6775,9 +6876,162 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=unknown
>
>
>
> @@ -16860,9 +16860,7 @@ Index: binutils-2.24/ld/configure
>  +
>  +
>  +
> - if test -n "$ac_tool_prefix"; then
> --  # Extract the first word of "${ac_tool_prefix}ar", so it can be a
> program name with args.
> --set dummy ${ac_tool_prefix}ar; ac_word=$2
> ++if test -n "$ac_tool_prefix"; then
>  +  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a
> program name with args.
>  +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
>  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> @@ -17003,7 +17001,9 @@ Index: binutils-2.24/ld/configure
>  +
>  +
>  +
> -+if test -n "$ac_tool_prefix"; then
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a
> program name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=$2
>  +  for ac_prog in ar
>  +  do
>  +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be
> a program name with args.
> @@ -17011,7 +17011,7 @@ Index: binutils-2.24/ld/configure
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if test "${ac_cv_prog_AR+set}" = set; then :
> -@@ -7273,7 +7527,7 @@
> +@@ -6793,7 +7047,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x
> "$as_dir/$ac_word$ac_exec_ext"; }; then
> @@ -17020,7 +17020,7 @@ Index: binutils-2.24/ld/configure
>       $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7293,11 +7547,15 @@
> +@@ -6813,11 +7067,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -17039,7 +17039,7 @@ Index: binutils-2.24/ld/configure
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
> -@@ -7313,7 +7571,7 @@
> +@@ -6833,7 +7091,7 @@ do
>     test -z "$as_dir" && as_dir=.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x
> "$as_dir/$ac_word$ac_exec_ext"; }; then
> @@ -17048,7 +17048,7 @@ Index: binutils-2.24/ld/configure
>       $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
>       break 2
>     fi
> -@@ -7332,6 +7590,10 @@
> +@@ -6852,6 +7110,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -17059,7 +17059,7 @@ Index: binutils-2.24/ld/configure
>     if test "x$ac_ct_AR" = x; then
>       AR="false"
>     else
> -@@ -7343,12 +7605,10 @@
> +@@ -6863,12 +7125,12 @@ ac_tool_warned=yes ;;
>   esac
>       AR=$ac_ct_AR
>     fi
> @@ -17071,10 +17071,12 @@ Index: binutils-2.24/ld/configure
>  -test -z "$AR_FLAGS" && AR_FLAGS=cru
>  +: ${AR=ar}
>  +: ${AR_FLAGS=cru}
> ++
> ++
>
>
>
> -@@ -7360,6 +7620,64 @@
> +@@ -6878,6 +7140,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
>
>
>
> @@ -17134,12 +17136,10 @@ Index: binutils-2.24/ld/configure
>  +
>  +
>  +
> -+
> -+
> +
> +
>   if test -n "$ac_tool_prefix"; then
> -   # Extract the first word of "${ac_tool_prefix}strip", so it can be a
> program name with args.
> - set dummy ${ac_tool_prefix}strip; ac_word=$2
> -@@ -7694,8 +8012,8 @@
> +@@ -7214,8 +7532,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int
> \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol address
> @@ -17150,7 +17150,7 @@ Index: binutils-2.24/ld/configure
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=
> -@@ -7731,6 +8049,7 @@
> +@@ -7251,6 +7569,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[
> ]\($symcode$symcode*\)[         ][
> ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -17158,7 +17158,7 @@ Index: binutils-2.24/ld/configure
>
>     # Check to see that the pipe works correctly.
>     pipe_works=no
> -@@ -7772,6 +8091,18 @@
> +@@ -7292,6 +7611,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -17177,7 +17177,7 @@ Index: binutils-2.24/ld/configure
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7783,7 +8114,7 @@
> +@@ -7303,7 +7634,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -17186,7 +17186,7 @@ Index: binutils-2.24/ld/configure
>     const char *name;
>     void       *address;
>   }
> -@@ -7809,8 +8140,8 @@
> +@@ -7329,8 +7660,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -17197,7 +17197,7 @@ Index: binutils-2.24/ld/configure
>           LIBS="conftstm.$ac_objext"
>           CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}:
> \"$ac_link\""; } >&5
> -@@ -7820,8 +8151,8 @@
> +@@ -7340,8 +7671,8 @@ _LT_EOF
>     test $ac_status = 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=yes
>           fi
> @@ -17208,7 +17208,7 @@ Index: binutils-2.24/ld/configure
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -7858,6 +8189,23 @@
> +@@ -7378,6 +7709,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -17225,14 +17225,10 @@ Index: binutils-2.24/ld/configure
>  +
>  +
>  +
> -+
> -+
> -+
> -+
>
>
>
> -@@ -7874,6 +8222,38 @@
> +@@ -7398,6 +7742,42 @@ fi
>
>
>
> @@ -17268,10 +17264,14 @@ Index: binutils-2.24/ld/configure
>  +
>  + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
>  +$as_echo "${lt_sysroot:-no}" >&6; }
> ++
> ++
> ++
> ++
>
> -
> -
> -@@ -8085,6 +8465,123 @@
> + # Check whether --enable-libtool-lock was given.
> + if test "${enable_libtool_lock+set}" = set; then :
> +@@ -7605,6 +7985,123 @@ esac
>
>   need_locks="$enable_libtool_lock"
>
> @@ -17395,7 +17395,7 @@ Index: binutils-2.24/ld/configure
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8648,6 +9145,8 @@
> +@@ -8168,6 +8665,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -17404,7 +17404,7 @@ Index: binutils-2.24/ld/configure
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8716,6 +9215,16 @@
> +@@ -8236,6 +8735,16 @@ done
>
>
>
> @@ -17421,7 +17421,7 @@ Index: binutils-2.24/ld/configure
>
>
>   # Set options
> -@@ -8844,7 +9353,8 @@
> +@@ -8364,7 +8873,8 @@ fi
>   LIBTOOL_DEPS="$ltmain"
>
>   # Always use our own libtool.
> @@ -17431,7 +17431,7 @@ Index: binutils-2.24/ld/configure
>
>
>
> -@@ -8933,7 +9443,7 @@
> +@@ -8453,7 +8963,7 @@ aix3*)
>   esac
>
>   # Global variables:
> @@ -17440,7 +17440,7 @@ Index: binutils-2.24/ld/configure
>   can_build_shared=yes
>
>   # All known linkers require a `.a' archive for static linking (except
> MSVC,
> -@@ -9231,8 +9741,6 @@
> +@@ -8751,8 +9261,6 @@ fi
>   lt_prog_compiler_pic=
>   lt_prog_compiler_static=
>
> @@ -17449,7 +17449,7 @@ Index: binutils-2.24/ld/configure
>
>     if test "$GCC" = yes; then
>       lt_prog_compiler_wl='-Wl,'
> -@@ -9398,6 +9906,12 @@
> +@@ -8918,6 +9426,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>         lt_prog_compiler_pic='--shared'
>         lt_prog_compiler_static='--static'
>         ;;
> @@ -17462,7 +17462,7 @@ Index: binutils-2.24/ld/configure
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -9460,7 +9974,7 @@
> +@@ -8980,7 +9494,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>         lt_prog_compiler_pic='-KPIC'
>         lt_prog_compiler_static='-Bstatic'
>         case $cc_basename in
> @@ -17471,7 +17471,7 @@ Index: binutils-2.24/ld/configure
>         lt_prog_compiler_wl='-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl='-Wl,';;
> -@@ -9517,13 +10031,17 @@
> +@@ -9037,13 +9551,17 @@ case $host_os in
>       lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -17495,7 +17495,7 @@ Index: binutils-2.24/ld/configure
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -9584,6 +10102,11 @@
> +@@ -9104,6 +9622,11 @@ fi
>
>
>
> @@ -17507,7 +17507,7 @@ Index: binutils-2.24/ld/configure
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9934,7 +10457,8 @@
> +@@ -9454,7 +9977,8 @@ _LT_EOF
>         allow_undefined_flag=unsupported
>         always_export_symbols=no
>         enable_shared_with_static_runtimes=yes
> @@ -17517,7 +17517,7 @@ Index: binutils-2.24/ld/configure
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o
> $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib
> -Xlinker $lib'
> -@@ -9982,7 +10506,7 @@
> +@@ -9502,7 +10026,7 @@ _LT_EOF
>         if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' >
> /dev/null \
>          && test "$tmp_diet" = no
>         then
> @@ -17526,7 +17526,7 @@ Index: binutils-2.24/ld/configure
>         tmp_sharedflag='-shared'
>         case $cc_basename,$host_cpu in
>           pgcc*)                                # Portland Group C compiler
> -@@ -10033,12 +10557,12 @@
> +@@ -9553,12 +10077,12 @@ _LT_EOF
>           whole_archive_flag_spec='--whole-archive$convenience
> --no-whole-archive'
>           hardcode_libdir_flag_spec=
>           hardcode_libdir_flag_spec_ld='-rpath $libdir'
> @@ -17541,7 +17541,7 @@ Index: binutils-2.24/ld/configure
>           fi
>           ;;
>         esac
> -@@ -10052,8 +10576,8 @@
> +@@ -9572,8 +10096,8 @@ _LT_EOF
>         archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o
> $lib'
>         wlarc=
>         else
> @@ -17552,7 +17552,7 @@ Index: binutils-2.24/ld/configure
>         fi
>         ;;
>
> -@@ -10071,8 +10595,8 @@
> +@@ -9591,8 +10115,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> @@ -17563,7 +17563,7 @@ Index: binutils-2.24/ld/configure
>         else
>         ld_shlibs=no
>         fi
> -@@ -10118,8 +10642,8 @@
> +@@ -9638,8 +10162,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> @@ -17574,7 +17574,7 @@ Index: binutils-2.24/ld/configure
>         else
>         ld_shlibs=no
>         fi
> -@@ -10249,7 +10773,13 @@
> +@@ -9769,7 +10293,13 @@ _LT_EOF
>         allow_undefined_flag='-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -17589,7 +17589,7 @@ Index: binutils-2.24/ld/configure
>   /* end confdefs.h.  */
>
>   int
> -@@ -10262,22 +10792,29 @@
> +@@ -9782,22 +10312,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -17632,7 +17632,7 @@ Index: binutils-2.24/ld/configure
>
>           hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs
> $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test
> "x${allow_undefined_flag}" != "x"; then func_echo_all
> "${wl}${allow_undefined_flag}"; else :; fi`
> '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -10289,7 +10826,13 @@
> +@@ -9809,7 +10346,13 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -17647,7 +17647,7 @@ Index: binutils-2.24/ld/configure
>   /* end confdefs.h.  */
>
>   int
> -@@ -10302,22 +10845,29 @@
> +@@ -9822,22 +10365,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -17690,10 +17690,11 @@ Index: binutils-2.24/ld/configure
>
>          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
>           # Warning - without using the other run time loading flags,
> -@@ -10362,20 +10912,63 @@
> +@@ -9881,21 +10431,64 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
> +       # When not using gcc, we currently assume that we are using
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
> -       # no search path for DLLs.
> +-      # no search path for DLLs.
>  -      hardcode_libdir_flag_spec=' '
>  -      allow_undefined_flag=unsupported
>  -      # Tell ltmain to make .lib files, not .a files.
> @@ -17708,6 +17709,7 @@ Index: binutils-2.24/ld/configure
>  -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
>  -      fix_srcfile_path='`cygpath -w "$srcfile"`'
>  -      enable_shared_with_static_runtimes=yes
> ++      # no search path for DLLs.
>  +      case $cc_basename in
>  +      cl*)
>  +      # Native MSVC
> @@ -17768,7 +17770,7 @@ Index: binutils-2.24/ld/configure
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -10436,7 +11029,7 @@
> +@@ -9956,7 +10549,7 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -17777,7 +17779,7 @@ Index: binutils-2.24/ld/configure
>         hardcode_libdir_flag_spec='-R$libdir'
>         hardcode_direct=yes
>         hardcode_shlibpath_var=no
> -@@ -10444,7 +11037,7 @@
> +@@ -9964,7 +10557,7 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" = yes; then
> @@ -17786,7 +17788,7 @@ Index: binutils-2.24/ld/configure
>         else
>         archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir
> -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test
> $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -10460,7 +11053,7 @@
> +@@ -9980,7 +10573,7 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" = yes && test "$with_gnu_ld" = no; then
> @@ -17795,7 +17797,7 @@ Index: binutils-2.24/ld/configure
>         else
>         archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib
> $libobjs $deplibs $linker_flags'
>         fi
> -@@ -10484,10 +11077,10 @@
> +@@ -10004,10 +10597,10 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>           archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs
> $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -17808,7 +17810,7 @@ Index: binutils-2.24/ld/configure
>           ;;
>         esac
>         else
> -@@ -10566,23 +11159,36 @@
> +@@ -10086,23 +10679,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" = yes; then
> @@ -17853,7 +17855,7 @@ Index: binutils-2.24/ld/configure
>         else
>         archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags
> -soname $soname `test -n "$verstring" && func_echo_all "-set_version
> $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags
> -soname $soname `test -n "$verstring" && func_echo_all "-set_version
> $verstring"` -update_registry ${output_objdir}/so_locations -exports_file
> $export_symbols -o $lib'
> -@@ -10667,7 +11273,7 @@
> +@@ -10187,7 +10793,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" = yes; then
>         allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
> @@ -17862,7 +17864,7 @@ Index: binutils-2.24/ld/configure
>         hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=' -expect_unresolved \*'
> -@@ -10686,9 +11292,9 @@
> +@@ -10206,9 +10812,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=' -z defs'
>         if test "$GCC" = yes; then
>         wlarc='${wl}'
> @@ -17874,7 +17876,7 @@ Index: binutils-2.24/ld/configure
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -11264,8 +11870,9 @@
> +@@ -10784,8 +11390,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>
> @@ -17886,7 +17888,7 @@ Index: binutils-2.24/ld/configure
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -11298,13 +11905,71 @@
> +@@ -10818,13 +11425,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo
> ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -17959,7 +17961,7 @@ Index: binutils-2.24/ld/configure
>     # FIXME: first we should search . and the directory the executable is
> in
>     shlibpath_var=PATH
>     ;;
> -@@ -11396,7 +12061,7 @@
> +@@ -10916,7 +11581,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -17968,16 +17970,16 @@ Index: binutils-2.24/ld/configure
>     hardcode_into_libs=yes
>     ;;
>
> -@@ -12192,7 +12857,7 @@
> +@@ -11712,7 +12377,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12195 "configure"
> +-#line 11715 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -12236,10 +12901,10 @@
> +@@ -11756,10 +12421,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) ||
> (__GNUC__ > 3))
> @@ -17990,16 +17992,16 @@ Index: binutils-2.24/ld/configure
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12298,7 +12963,7 @@
> +@@ -11818,7 +12483,7 @@ else
>     lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>     lt_status=$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 12301 "configure"
> +-#line 11821 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -12342,10 +13007,10 @@
> +@@ -11862,10 +12527,10 @@ else
>   /* When -fvisbility=hidden is used, assume the code has been annotated
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) ||
> (__GNUC__ > 3))
> @@ -18012,7 +18014,7 @@ Index: binutils-2.24/ld/configure
>   int main ()
>   {
>     void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12737,6 +13402,7 @@
> +@@ -12257,6 +12922,7 @@ $RM -r conftest*
>
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=$CC
> @@ -18020,7 +18022,7 @@ Index: binutils-2.24/ld/configure
>     lt_save_LD=$LD
>     lt_save_GCC=$GCC
>     GCC=$GXX
> -@@ -12754,6 +13420,7 @@
> +@@ -12274,6 +12940,7 @@ $RM -r conftest*
>     fi
>     test -z "${LDCXX+set}" || LD=$LDCXX
>     CC=${CXX-"c++"}
> @@ -18028,7 +18030,7 @@ Index: binutils-2.24/ld/configure
>     compiler=$CC
>     compiler_CXX=$CC
>     for cc_temp in $compiler""; do
> -@@ -12893,8 +13560,8 @@
> +@@ -12413,8 +13080,8 @@ with_gnu_ld=$lt_cv_prog_gnu_ld
>         # Check if GNU C++ uses GNU ld as the underlying linker, since the
>         # archiving commands below assume that GNU ld is being used.
>         if test "$with_gnu_ld" = yes; then
> @@ -18039,7 +18041,7 @@ Index: binutils-2.24/ld/configure
>
>           hardcode_libdir_flag_spec_CXX='${wl}-rpath ${wl}$libdir'
>           export_dynamic_flag_spec_CXX='${wl}--export-dynamic'
> -@@ -13036,7 +13703,13 @@
> +@@ -12556,7 +13223,13 @@ $as_echo_n "checking whether the $compiler
> linker ($LD) supports shared librarie
>             allow_undefined_flag_CXX='-berok'
>             # Determine the default libpath from the value encoded in an
> empty
>             # executable.
> @@ -18054,7 +18056,7 @@ Index: binutils-2.24/ld/configure
>   /* end confdefs.h.  */
>
>   int
> -@@ -13049,22 +13722,29 @@
> +@@ -12569,22 +13242,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>
> @@ -18097,7 +18099,7 @@ Index: binutils-2.24/ld/configure
>
>
> hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>
> -@@ -13077,7 +13757,13 @@
> +@@ -12597,7 +13277,13 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>             else
>             # Determine the default libpath from the value encoded in an
>             # empty executable.
> @@ -18112,7 +18114,7 @@ Index: binutils-2.24/ld/configure
>   /* end confdefs.h.  */
>
>   int
> -@@ -13090,22 +13776,29 @@
> +@@ -12610,22 +13296,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>
> @@ -18155,7 +18157,7 @@ Index: binutils-2.24/ld/configure
>
>
> hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
>             # Warning - without using the other run time loading flags,
> -@@ -13148,29 +13841,75 @@
> +@@ -12668,29 +13361,75 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>           ;;
>
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -18254,7 +18256,7 @@ Index: binutils-2.24/ld/configure
>         darwin* | rhapsody*)
>
>
> -@@ -13276,7 +14015,7 @@
> +@@ -12796,7 +13535,7 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>               ;;
>             *)
>               if test "$GXX" = yes; then
> @@ -18263,7 +18265,7 @@ Index: binutils-2.24/ld/configure
>               else
>                 # FIXME: insert proper C++ library support
>                 ld_shlibs_CXX=no
> -@@ -13347,10 +14086,10 @@
> +@@ -12867,10 +13606,10 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>                     archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h
> ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects
> $compiler_flags'
>                     ;;
>                   ia64*)
> @@ -18276,7 +18278,7 @@ Index: binutils-2.24/ld/configure
>                     ;;
>                 esac
>               fi
> -@@ -13391,9 +14130,9 @@
> +@@ -12911,9 +13650,9 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>             *)
>             if test "$GXX" = yes; then
>               if test "$with_gnu_ld" = no; then
> @@ -18288,7 +18290,7 @@ Index: binutils-2.24/ld/configure
>               fi
>             fi
>             link_all_deplibs_CXX=yes
> -@@ -13463,20 +14202,20 @@
> +@@ -12983,20 +13722,20 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>               prelink_cmds_CXX='tpldir=Template.dir~
>                 rm -rf $tpldir~
>                 $CC --prelink_objects --instantiation_dir $tpldir $objs
> $libobjs $compile_deplibs~
> @@ -18313,7 +18315,7 @@ Index: binutils-2.24/ld/configure
>               ;;
>             *) # Version 6 and above use weak symbols
>               archive_cmds_CXX='$CC -shared $pic_flag $predep_objects
> $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname
> ${wl}$soname -o $lib'
> -@@ -13671,7 +14410,7 @@
> +@@ -13191,7 +13930,7 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>                   archive_cmds_CXX='$CC -shared -nostdlib
> ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects
> $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" &&
> func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry
> ${wl}${output_objdir}/so_locations -o $lib'
>                   ;;
>                 *)
> @@ -18322,7 +18324,7 @@ Index: binutils-2.24/ld/configure
>                   ;;
>               esac
>
> -@@ -13717,7 +14456,7 @@
> +@@ -13237,7 +13976,7 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>
>         solaris*)
>           case $cc_basename in
> @@ -18331,7 +18333,7 @@ Index: binutils-2.24/ld/configure
>             # Sun C++ 4.2, 5.x and Centerline C++
>               archive_cmds_need_lc_CXX=yes
>             no_undefined_flag_CXX=' -zdefs'
> -@@ -13758,9 +14497,9 @@
> +@@ -13278,9 +14017,9 @@ if test -z "$aix_libpath"; then
> aix_libpath="/usr/lib:/lib"; fi
>             if test "$GXX" = yes && test "$with_gnu_ld" = no; then
>               no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
>               if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -18343,7 +18345,7 @@ Index: binutils-2.24/ld/configure
>
>                 # Commands to make compiler produce verbose output that
> lists
>                 # what "hidden" libraries, object files and flags are used
> when
> -@@ -13895,6 +14634,13 @@
> +@@ -13415,6 +14154,13 @@ private:
>   };
>   _LT_EOF
>
> @@ -18357,7 +18359,7 @@ Index: binutils-2.24/ld/configure
>   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; }
> >&5
>     (eval $ac_compile) 2>&5
>     ac_status=$?
> -@@ -13908,7 +14654,7 @@
> +@@ -13428,7 +14174,7 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>     pre_test_object_deps_done=no
>
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -18366,7 +18368,7 @@ Index: binutils-2.24/ld/configure
>
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -13917,13 +14663,22 @@
> +@@ -13437,13 +14183,22 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>             test $p = "-R"; then
>          prev=$p
>          continue
> @@ -18393,7 +18395,7 @@ Index: binutils-2.24/ld/configure
>            # Internal compiler library paths should come after those
>            # provided the user.  The postdeps already come after the
>            # user supplied libs so there is no need to process them.
> -@@ -13943,8 +14698,10 @@
> +@@ -13463,8 +14218,10 @@ if { { eval echo
> "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
>            postdeps_CXX="${postdeps_CXX} ${prev}${p}"
>          fi
>          fi
> @@ -18404,7 +18406,7 @@ Index: binutils-2.24/ld/configure
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -13980,6 +14737,7 @@
> +@@ -13500,6 +14257,7 @@ else
>   fi
>
>   $RM -f confest.$objext
> @@ -18412,7 +18414,7 @@ Index: binutils-2.24/ld/configure
>
>   # PORTME: override above test on systems where it is broken
>   case $host_os in
> -@@ -14015,7 +14773,7 @@
> +@@ -13535,7 +14293,7 @@ linux*)
>
>   solaris*)
>     case $cc_basename in
> @@ -18421,7 +18423,7 @@ Index: binutils-2.24/ld/configure
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -14080,8 +14838,6 @@
> +@@ -13600,8 +14358,6 @@ fi
>   lt_prog_compiler_pic_CXX=
>   lt_prog_compiler_static_CXX=
>
> @@ -18430,7 +18432,7 @@ Index: binutils-2.24/ld/configure
>
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" = yes; then
> -@@ -14186,6 +14942,11 @@
> +@@ -13706,6 +14462,11 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>           ;;
>         esac
>         ;;
> @@ -18442,7 +18444,7 @@ Index: binutils-2.24/ld/configure
>         dgux*)
>         case $cc_basename in
>           ec++*)
> -@@ -14338,7 +15099,7 @@
> +@@ -13858,7 +14619,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
>         ;;
>         solaris*)
>         case $cc_basename in
> @@ -18451,7 +18453,7 @@ Index: binutils-2.24/ld/configure
>             # Sun C++ 4.2, 5.x and Centerline C++
>             lt_prog_compiler_pic_CXX='-KPIC'
>             lt_prog_compiler_static_CXX='-Bstatic'
> -@@ -14403,10 +15164,17 @@
> +@@ -13923,10 +14684,17 @@ case $host_os in
>       lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
>       ;;
>   esac
> @@ -18472,7 +18474,7 @@ Index: binutils-2.24/ld/configure
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -14464,6 +15232,8 @@
> +@@ -13984,6 +14752,8 @@ fi
>
>
>
> @@ -18481,7 +18483,7 @@ Index: binutils-2.24/ld/configure
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -14641,6 +15411,7 @@
> +@@ -14161,6 +14931,7 @@ fi
>   $as_echo_n "checking whether the $compiler linker ($LD) supports shared
> libraries... " >&6; }
>
>     export_symbols_cmds_CXX='$NM $libobjs $convenience |
> $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -18489,7 +18491,7 @@ Index: binutils-2.24/ld/configure
>     case $host_os in
>     aix[4-9]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -14655,15 +15426,20 @@
> +@@ -14175,15 +14946,20 @@ $as_echo_n "checking whether the $compiler
> linker ($LD) supports shared librarie
>       ;;
>     pw32*)
>       export_symbols_cmds_CXX="$ltdll_cmds"
> @@ -18515,7 +18517,7 @@ Index: binutils-2.24/ld/configure
>
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
>   $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14926,8 +15702,9 @@
> +@@ -14446,8 +15222,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=no
>     need_lib_prefix=no
>
> @@ -18527,7 +18529,7 @@ Index: binutils-2.24/ld/configure
>       library_names_spec='$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds='base_file=`basename \${file}`~
> -@@ -14959,13 +15736,71 @@
> +@@ -14479,13 +15256,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo
> ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -18600,7 +18602,7 @@ Index: binutils-2.24/ld/configure
>     # FIXME: first we should search . and the directory the executable is
> in
>     shlibpath_var=PATH
>     ;;
> -@@ -15056,7 +15891,7 @@
> +@@ -14576,7 +15411,7 @@ haiku*)
>     soname_spec='${libname}${release}${shared_ext}$major'
>     shlibpath_var=LIBRARY_PATH
>     shlibpath_overrides_runpath=yes
> @@ -18609,7 +18611,7 @@ Index: binutils-2.24/ld/configure
>     hardcode_into_libs=yes
>     ;;
>
> -@@ -15515,6 +16350,7 @@
> +@@ -15035,6 +15870,7 @@ fi
>     fi # test -n "$compiler"
>
>     CC=$lt_save_CC
> @@ -18617,7 +18619,7 @@ Index: binutils-2.24/ld/configure
>     LDCXX=$LD
>     LD=$lt_save_LD
>     GCC=$lt_save_GCC
> -@@ -17754,13 +18590,20 @@
> +@@ -17807,13 +18643,20 @@ exeext='`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
>   lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -18638,7 +18640,7 @@ Index: binutils-2.24/ld/configure
>   STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED
> "$delay_single_quote_subst"`'
> -@@ -17775,14 +18618,17 @@
> +@@ -17828,14 +18671,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl='`$ECHO
> "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address='`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address" | $SED
> "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> @@ -18657,7 +18659,7 @@ Index: binutils-2.24/ld/configure
>   DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17815,12 +18661,12 @@
> +@@ -17868,12 +18714,12 @@ hardcode_shlibpath_var='`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
>   hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED
> "$delay_single_quote_subst"`'
>   inherit_rpath='`$ECHO "$inherit_rpath" | $SED
> "$delay_single_quote_subst"`'
>   link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED
> "$delay_single_quote_subst"`'
> @@ -18671,7 +18673,7 @@ Index: binutils-2.24/ld/configure
>   file_list_spec='`$ECHO "$file_list_spec" | $SED
> "$delay_single_quote_subst"`'
>   variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED
> "$delay_single_quote_subst"`'
>   need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> -@@ -17859,8 +18705,8 @@
> +@@ -17912,8 +18758,8 @@ old_archive_cmds_CXX='`$ECHO
> "$old_archive_cmds_CXX" | $SED "$delay_single_quote
>   compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
>   GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
>   lt_prog_compiler_no_builtin_flag_CXX='`$ECHO
> "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> @@ -18681,7 +18683,7 @@ Index: binutils-2.24/ld/configure
>   lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" |
> $SED "$delay_single_quote_subst"`'
>   lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" |
> $SED "$delay_single_quote_subst"`'
>   archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED
> "$delay_single_quote_subst"`'
> -@@ -17887,12 +18733,12 @@
> +@@ -17940,12 +18786,12 @@ hardcode_shlibpath_var_CXX='`$ECHO
> "$hardcode_shlibpath_var_CXX" | $SED "$delay_
>   hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED
> "$delay_single_quote_subst"`'
>   inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED
> "$delay_single_quote_subst"`'
>   link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED
> "$delay_single_quote_subst"`'
> @@ -18695,7 +18697,7 @@ Index: binutils-2.24/ld/configure
>   file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED
> "$delay_single_quote_subst"`'
>   hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED
> "$delay_single_quote_subst"`'
>   compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" |
> $SED "$delay_single_quote_subst"`'
> -@@ -17930,8 +18776,13 @@
> +@@ -17983,8 +18829,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -18709,7 +18711,7 @@ Index: binutils-2.24/ld/configure
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -17941,12 +18792,14 @@
> +@@ -17994,12 +18845,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -18725,7 +18727,7 @@ Index: binutils-2.24/ld/configure
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -17962,7 +18815,6 @@
> +@@ -18015,7 +18868,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -18733,7 +18735,7 @@ Index: binutils-2.24/ld/configure
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -17984,8 +18836,8 @@
> +@@ -18037,8 +18889,8 @@ LD_CXX \
>   reload_flag_CXX \
>   compiler_CXX \
>   lt_prog_compiler_no_builtin_flag_CXX \
> @@ -18743,7 +18745,7 @@ Index: binutils-2.24/ld/configure
>   lt_prog_compiler_static_CXX \
>   lt_cv_prog_compiler_c_o_CXX \
>   export_dynamic_flag_spec_CXX \
> -@@ -17997,7 +18849,6 @@
> +@@ -18050,7 +18902,6 @@ no_undefined_flag_CXX \
>   hardcode_libdir_flag_spec_CXX \
>   hardcode_libdir_flag_spec_ld_CXX \
>   hardcode_libdir_separator_CXX \
> @@ -18751,7 +18753,7 @@ Index: binutils-2.24/ld/configure
>   exclude_expsyms_CXX \
>   include_expsyms_CXX \
>   file_list_spec_CXX \
> -@@ -18031,6 +18882,7 @@
> +@@ -18084,6 +18935,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -18759,7 +18761,7 @@ Index: binutils-2.24/ld/configure
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18045,7 +18897,8 @@
> +@@ -18098,7 +18950,8 @@ archive_expsym_cmds_CXX \
>   module_cmds_CXX \
>   module_expsym_cmds_CXX \
>   export_symbols_cmds_CXX \
> @@ -18769,7 +18771,7 @@ Index: binutils-2.24/ld/configure
>       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
>       *[\\\\\\\`\\"\\\$]*)
>         eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e
> \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e
> \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
> -@@ -18838,7 +19691,8 @@
> +@@ -18891,7 +19744,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -18779,7 +18781,7 @@ Index: binutils-2.24/ld/configure
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -18941,19 +19795,42 @@
> +@@ -18994,19 +19848,42 @@ SP2NL=$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=$lt_lt_NL2SP
>
> @@ -18823,7 +18825,7 @@ Index: binutils-2.24/ld/configure
>   # A symbol stripping program.
>   STRIP=$lt_STRIP
>
> -@@ -18983,6 +19860,12 @@
> +@@ -19036,6 +19913,12 @@
> global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix is
> needed.
>
> global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
>
> @@ -18836,7 +18838,7 @@ Index: binutils-2.24/ld/configure
>   # The name of the directory that contains temporary libtool files.
>   objdir=$objdir
>
> -@@ -18992,6 +19875,9 @@
> +@@ -19045,6 +19928,9 @@ MAGIC_CMD=$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=$lt_need_locks
>
> @@ -18846,7 +18848,7 @@ Index: binutils-2.24/ld/configure
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=$lt_DSYMUTIL
>
> -@@ -19106,12 +19992,12 @@
> +@@ -19159,12 +20045,12 @@ with_gcc=$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -18862,7 +18864,7 @@ Index: binutils-2.24/ld/configure
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static
>
> -@@ -19198,9 +20084,6 @@
> +@@ -19251,9 +20137,6 @@ inherit_rpath=$inherit_rpath
>   # Whether libtool must link a program against all its dependency
> libraries.
>   link_all_deplibs=$link_all_deplibs
>
> @@ -18872,7 +18874,7 @@ Index: binutils-2.24/ld/configure
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols
>
> -@@ -19216,6 +20099,9 @@
> +@@ -19269,6 +20152,9 @@ include_expsyms=$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with
> templates.
>   prelink_cmds=$lt_prelink_cmds
>
> @@ -18882,7 +18884,7 @@ Index: binutils-2.24/ld/configure
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec
>
> -@@ -19262,210 +20148,169 @@
> +@@ -19315,210 +20201,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -19084,9 +19086,15 @@ Index: binutils-2.24/ld/configure
>  -_LT_EOF
>  -    ;;
>  -  esac
> +-
> +-
> +-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >>
> "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  mv -f "$cfgfile" "$ofile" ||
>  +  sed '$q' "$ltmain" >> "$cfgfile" \
>  +     || (rm -f "$cfgfile"; exit 1)
> -
> ++
>  +  if test x"$xsi_shell" = xyes; then
>  +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
>  +func_dirname ()\
> @@ -19244,16 +19252,13 @@ Index: binutils-2.24/ld/configure
>  +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute
> extended shell functions in $ofile" >&5
>  +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions
> in $ofile" >&2;}
>  +fi
> -
> --  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >>
> "$cfgfile" \
> --    || (rm -f "$cfgfile"; exit 1)
> -
> --  mv -f "$cfgfile" "$ofile" ||
> ++
> ++
>  +   mv -f "$cfgfile" "$ofile" ||
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>
> -@@ -19493,12 +20338,12 @@
> +@@ -19546,12 +20391,12 @@ with_gcc=$GCC_CXX
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
>
> @@ -19269,7 +19274,7 @@ Index: binutils-2.24/ld/configure
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=$lt_lt_prog_compiler_static_CXX
>
> -@@ -19585,9 +20430,6 @@
> +@@ -19638,9 +20483,6 @@ inherit_rpath=$inherit_rpath_CXX
>   # Whether libtool must link a program against all its dependency
> libraries.
>   link_all_deplibs=$link_all_deplibs_CXX
>
> @@ -19279,7 +19284,7 @@ Index: binutils-2.24/ld/configure
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=$always_export_symbols_CXX
>
> -@@ -19603,6 +20445,9 @@
> +@@ -19656,6 +20498,9 @@ include_expsyms=$lt_include_expsyms_CXX
>   # Commands necessary for linking programs (against libraries) with
> templates.
>   prelink_cmds=$lt_prelink_cmds_CXX
>
> @@ -19289,10 +19294,10 @@ Index: binutils-2.24/ld/configure
>   # Specify filename containing input files.
>   file_list_spec=$lt_file_list_spec_CXX
>
> -Index: binutils-2.24/bfd/configure.in
> +Index: binutils-2.24/bfd/configure.ac
>  ===================================================================
> ---- binutils-2.24.orig/bfd/configure.in        2013-12-02
> 01:30:28.000000000 -0800
> -+++ binutils-2.24/bfd/configure.in     2013-12-15 11:10:23.887118697
> -0800
> +--- binutils-2.24.orig/bfd/configure.ac        2013-12-02
> 01:30:28.000000000 -0800
> ++++ binutils-2.24/bfd/configure.ac     2013-12-15 11:10:23.887118697
> -0800
>  @@ -568,7 +568,7 @@
>     x=`sed -n -e 's/^[  ]*PICFLAG[      ]*=[    ]*//p' <
> ../libiberty/Makefile | sed -n '$p'`
>   changequote([,])dnl
> @@ -19302,10 +19307,10 @@ Index: binutils-2.24/bfd/configure.in
>     fi
>
>   # More hacks to build DLLs on Windows.
> -Index: binutils-2.24/opcodes/configure.in
> +Index: binutils-2.24/opcodes/configure.ac
>  ===================================================================
> ---- binutils-2.24.orig/opcodes/configure.in    2013-11-04
> 07:33:40.000000000 -0800
> -+++ binutils-2.24/opcodes/configure.in 2013-12-15 11:10:23.887118697
> -0800
> +--- binutils-2.24.orig/opcodes/configure.ac    2013-11-04
> 07:33:40.000000000 -0800
> ++++ binutils-2.24/opcodes/configure.ac 2013-12-15 11:10:23.887118697
> -0800
>  @@ -162,7 +162,7 @@
>     x=`sed -n -e 's/^[  ]*PICFLAG[      ]*=[    ]*//p' <
> ../libiberty/Makefile | sed -n '$p'`
>   changequote([,])dnl
> diff --git
> a/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
> b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
> index 51eaf0b..e668faa 100644
> ---
> a/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
> +++
> b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
> @@ -9,30 +9,24 @@ Index: binutils-2.24/bfd/config.bfd
>  ===================================================================
>  --- binutils-2.24.orig/bfd/config.bfd  2013-11-04 07:33:37.000000000 -0800
>  +++ binutils-2.24/bfd/config.bfd       2013-12-15 11:54:57.113765374 -0800
> -@@ -1052,14 +1052,14 @@
> -     targ_defvec=bfd_elf32_bigmips_vec
> -     targ_selvecs="bfd_elf32_littlemips_vec bfd_elf64_bigmips_vec
> bfd_elf64_littlemips_vec ecoff_big_vec ecoff_little_vec"
> +Index: binutils-2.24/ld/configure.tgt
> +@@ -1062,12 +1062,12 @@ case "${targ}" in
> +     targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec
> mips_ecoff_be_vec mips_ecoff_le_vec"
> +     ;;
> +   mips64*el-*-linux*)
> +-    targ_defvec=mips_elf32_ntrad_le_vec
> +-    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_trad_le_vec
> mips_elf32_trad_be_vec mips_elf64_trad_le_vec mips_elf64_trad_be_vec"
> ++    targ_defvec=mips_elf64_trad_le_vec
> ++    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_le_vec
> mips_elf32_trad_le_vec mips_elf32_trad_be_vec mips_elf64_trad_be_vec"
> +     ;;
> +   mips64*-*-linux*)
> +-    targ_defvec=mips_elf32_ntrad_be_vec
> +-    targ_selvecs="mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec
> mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_vec"
> ++    targ_defvec=mips_elf64_trad_be_vec
> ++    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_be_vec
> mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
>       ;;
> --  mips64*el-*-linux*)
> --    targ_defvec=bfd_elf32_ntradlittlemips_vec
> --    targ_selvecs="bfd_elf32_ntradbigmips_vec
> bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec
> bfd_elf64_tradlittlemips_vec bfd_elf64_tradbigmips_vec"
> --    ;;
> --  mips64*-*-linux*)
> --    targ_defvec=bfd_elf32_ntradbigmips_vec
> --    targ_selvecs="bfd_elf32_ntradlittlemips_vec
> bfd_elf32_tradbigmips_vec bfd_elf32_tradlittlemips_vec
> bfd_elf64_tradbigmips_vec bfd_elf64_tradlittlemips_vec"
> --    ;;
> -+   mips64*el-*-linux*)
> -+    targ_defvec=bfd_elf64_tradlittlemips_vec
> -+    targ_selvecs="bfd_elf32_ntradbigmips_vec
> bfd_elf32_ntradlittlemips_vec bfd_elf32_tradlittlemips_vec
> bfd_elf32_tradbigmips_vec bfd_elf64_tradbigmips_vec"
> -+     ;;
> -+   mips64*-*-linux*)
> -+    targ_defvec=bfd_elf64_tradbigmips_vec
> -+    targ_selvecs="bfd_elf32_ntradbigmips_vec
> bfd_elf32_ntradlittlemips_vec bfd_elf32_tradbigmips_vec
> bfd_elf32_tradlittlemips_vec bfd_elf64_tradlittlemips_vec"
> -+     ;;
>     mips*el-*-linux*)
> -     targ_defvec=bfd_elf32_tradlittlemips_vec
> -     targ_selvecs="bfd_elf32_tradbigmips_vec ecoff_little_vec
> ecoff_big_vec bfd_elf32_ntradlittlemips_vec bfd_elf64_tradlittlemips_vec
> bfd_elf32_ntradbigmips_vec bfd_elf64_tradbigmips_vec"
> -Index: binutils-2.24/ld/configure.tgt
> +     targ_defvec=mips_elf32_trad_le_vec
>  ===================================================================
>  --- binutils-2.24.orig/ld/configure.tgt        2013-11-26
> 03:37:33.000000000 -0800
>  +++ binutils-2.24/ld/configure.tgt     2013-12-15 11:50:52.273766155 -0800
> diff --git
> a/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
> b/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
> deleted file mode 100644
> index 834f55c..0000000
> ---
> a/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
> +++ /dev/null
> @@ -1,188 +0,0 @@
> -Upstream-Status: Backport
> -
> -From 27b829ee701e29804216b3803fbaeb629be27491 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Wed, 29 Jan 2014 13:46:39 +0000
> -Subject: [PATCH 1/1] Following up on Tom's suggestion I am checking in a
> patch to replace the various
> - bfd_xxx_set macros with static inline functions, so that we can avoid
> compile time
> - warnings about comma expressions with unused values.
> -
> -       * bfd-in.h (bfd_set_section_vma): Delete.
> -       (bfd_set_section_alignment): Delete.
> -       (bfd_set_section_userdata): Delete.
> -       (bfd_set_cacheable): Delete.
> -       * bfd.c (bfd_set_cacheable): New static inline function.
> -       * section.c (bfd_set_section_userdata): Likewise.
> -       (bfd_set_section_vma): Likewise.
> -       (bfd_set_section_alignment): Likewise.
> -       * bfd-in2.h: Regenerate.
> ----
> - bfd/ChangeLog |   12 ++++++++++++
> - bfd/bfd-in.h  |    5 -----
> - bfd/bfd-in2.h |   41 +++++++++++++++++++++++++++++++++++------
> - bfd/bfd.c     |    8 ++++++++
> - bfd/section.c |   26 ++++++++++++++++++++++++++
> - 5 files changed, 81 insertions(+), 11 deletions(-)
> -
> -diff --git a/bfd/bfd-in.h b/bfd/bfd-in.h
> -index 3afd71b..c7c5a7d 100644
> ---- a/bfd/bfd-in.h
> -+++ b/bfd/bfd-in.h
> -@@ -292,9 +292,6 @@ typedef struct bfd_section *sec_ptr;
> -
> - #define bfd_is_com_section(ptr) (((ptr)->flags & SEC_IS_COMMON) != 0)
> -
> --#define bfd_set_section_vma(bfd, ptr, val) (((ptr)->vma = (ptr)->lma =
> (val)), ((ptr)->user_set_vma = TRUE), TRUE)
> --#define bfd_set_section_alignment(bfd, ptr, val)
> (((ptr)->alignment_power = (val)),TRUE)
> --#define bfd_set_section_userdata(bfd, ptr, val) (((ptr)->userdata =
> (val)),TRUE)
> - /* Find the address one past the end of SEC.  */
> - #define bfd_get_section_limit(bfd, sec) \
> -   (((bfd)->direction != write_direction && (sec)->rawsize != 0        \
> -@@ -517,8 +514,6 @@ extern void warn_deprecated (const char *, const char
> *, int, const char *);
> -
> - #define bfd_get_symbol_leading_char(abfd)
> ((abfd)->xvec->symbol_leading_char)
> -
> --#define bfd_set_cacheable(abfd,bool) (((abfd)->cacheable = bool), TRUE)
> --
> - extern bfd_boolean bfd_cache_close
> -   (bfd *abfd);
> - /* NB: This declaration should match the autogenerated one in libbfd.h.
> */
> -diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> -index 71996db..b5aeb40 100644
> ---- a/bfd/bfd-in2.h
> -+++ b/bfd/bfd-in2.h
> -@@ -299,9 +299,6 @@ typedef struct bfd_section *sec_ptr;
> -
> - #define bfd_is_com_section(ptr) (((ptr)->flags & SEC_IS_COMMON) != 0)
> -
> --#define bfd_set_section_vma(bfd, ptr, val) (((ptr)->vma = (ptr)->lma =
> (val)), ((ptr)->user_set_vma = TRUE), TRUE)
> --#define bfd_set_section_alignment(bfd, ptr, val)
> (((ptr)->alignment_power = (val)),TRUE)
> --#define bfd_set_section_userdata(bfd, ptr, val) (((ptr)->userdata =
> (val)),TRUE)
> - /* Find the address one past the end of SEC.  */
> - #define bfd_get_section_limit(bfd, sec) \
> -   (((bfd)->direction != write_direction && (sec)->rawsize != 0        \
> -@@ -524,8 +521,6 @@ extern void warn_deprecated (const char *, const char
> *, int, const char *);
> -
> - #define bfd_get_symbol_leading_char(abfd)
> ((abfd)->xvec->symbol_leading_char)
> -
> --#define bfd_set_cacheable(abfd,bool) (((abfd)->cacheable = bool), TRUE)
> --
> - extern bfd_boolean bfd_cache_close
> -   (bfd *abfd);
> - /* NB: This declaration should match the autogenerated one in libbfd.h.
> */
> -@@ -1029,7 +1024,7 @@ bfd *bfd_openr (const char *filename, const char
> *target);
> -
> - bfd *bfd_fdopenr (const char *filename, const char *target, int fd);
> -
> --bfd *bfd_openstreamr (const char *, const char *, void *);
> -+bfd *bfd_openstreamr (const char * filename, const char * target, void *
> stream);
> -
> - bfd *bfd_openr_iovec (const char *filename, const char *target,
> -     void *(*open_func) (struct bfd *nbfd,
> -@@ -1596,6 +1591,32 @@ struct relax_table {
> -   int size;
> - };
> -
> -+/* Note: the following are provided as inline functions rather than
> macros
> -+   because not all callers use the return value.  A macro implementation
> -+   would use a comma expression, eg: "((ptr)->foo = val, TRUE)" and some
> -+   compilers will complain about comma expressions that have no effect.
> */
> -+static inline bfd_boolean
> -+bfd_set_section_userdata (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr,
> void * val)
> -+{
> -+  ptr->userdata = val;
> -+  return TRUE;
> -+}
> -+
> -+static inline bfd_boolean
> -+bfd_set_section_vma (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr,
> bfd_vma val)
> -+{
> -+  ptr->vma = ptr->lma = val;
> -+  ptr->user_set_vma = TRUE;
> -+  return TRUE;
> -+}
> -+
> -+static inline bfd_boolean
> -+bfd_set_section_alignment (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr,
> unsigned int val)
> -+{
> -+  ptr->alignment_power = val;
> -+  return TRUE;
> -+}
> -+
> - /* These sections are global, and are managed by BFD.  The application
> -    and target back end are not permitted to change the values in
> -    these sections.  */
> -@@ -6415,6 +6436,14 @@ struct bfd
> -   unsigned int selective_search : 1;
> - };
> -
> -+/* See note beside bfd_set_section_userdata.  */
> -+static inline bfd_boolean
> -+bfd_set_cacheable (bfd * abfd, bfd_boolean val)
> -+{
> -+  abfd->cacheable = val;
> -+  return TRUE;
> -+}
> -+
> - typedef enum bfd_error
> - {
> -   bfd_error_no_error = 0,
> -diff --git a/bfd/bfd.c b/bfd/bfd.c
> -index 8d0580c..2d174f3 100644
> ---- a/bfd/bfd.c
> -+++ b/bfd/bfd.c
> -@@ -311,6 +311,14 @@ CODE_FRAGMENT
> - .  unsigned int selective_search : 1;
> - .};
> - .
> -+.{* See note beside bfd_set_section_userdata.  *}
> -+.static inline bfd_boolean
> -+.bfd_set_cacheable (bfd * abfd, bfd_boolean val)
> -+.{
> -+.  abfd->cacheable = val;
> -+.  return TRUE;
> -+.}
> -+.
> - */
> -
> - #include "sysdep.h"
> -diff --git a/bfd/section.c b/bfd/section.c
> -index fb19d8c..a661228 100644
> ---- a/bfd/section.c
> -+++ b/bfd/section.c
> -@@ -542,6 +542,32 @@ CODE_FRAGMENT
> - .  int size;
> - .};
> - .
> -+.{* Note: the following are provided as inline functions rather than
> macros
> -+.   because not all callers use the return value.  A macro implementation
> -+.   would use a comma expression, eg: "((ptr)->foo = val, TRUE)" and some
> -+.   compilers will complain about comma expressions that have no
> effect.  *}
> -+.static inline bfd_boolean
> -+.bfd_set_section_userdata (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr,
> void * val)
> -+.{
> -+.  ptr->userdata = val;
> -+.  return TRUE;
> -+.}
> -+.
> -+.static inline bfd_boolean
> -+.bfd_set_section_vma (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr,
> bfd_vma val)
> -+.{
> -+.  ptr->vma = ptr->lma = val;
> -+.  ptr->user_set_vma = TRUE;
> -+.  return TRUE;
> -+.}
> -+.
> -+.static inline bfd_boolean
> -+.bfd_set_section_alignment (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr,
> unsigned int val)
> -+.{
> -+.  ptr->alignment_power = val;
> -+.  return TRUE;
> -+.}
> -+.
> - .{* These sections are global, and are managed by BFD.  The application
> - .   and target back end are not permitted to change the values in
> - .   these sections.  *}
> ---
> -1.7.1
> -
> diff --git a/meta/recipes-devtools/binutils/binutils_2.24.bb
> b/meta/recipes-devtools/binutils/binutils_2.25.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.24.bb
> rename to meta/recipes-devtools/binutils/binutils_2.25.bb
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e016337aadc225405107c54ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Khem,<div><br></div><div>We&#39;re feature frozen now, =
I&#39;m assuming there are no amazing reasons to upgrade and this can be me=
rged early in 1.9 M1?</div><div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2 March 2015 at 02:10, K=
hem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver=
.com">liezhi.yang@windriver.com</a>&gt;<br>
<br>
* Remove the following patches since they are already in the new code:<br>
=C2=A0 binutils/fix-pr15815.patch<br>
=C2=A0 binutils/fix-pr16428.patch<br>
=C2=A0 binutils/fix-pr16476.patch<br>
=C2=A0 binutils/fix-pr2404.patch<br>
=C2=A0 binutils/replace_macros_with_static_inline.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8484.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8485.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8501.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8502.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8502_1.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8503.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8504.patch<br>
=C2=A0 binutils/binutils_CVE-2014-8737.patch<br>
<br>
* The file src-release is gone.<br>
<br>
* Updated patches for the new code.<br>
<br>
Conflicts:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/conf/distro/include/tcmode-default.inc<br>
<br>
Change-Id: Ifd88f07771238755081a993b843ace423742eb85<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../{binutils-2.24.inc =3D&gt; binutils-2.25.inc}=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 20 +-<br>
=C2=A0...<a href=3D"http://ian_2.24.bb" target=3D"_blank">ian_2.24.bb</a> =
=3D&gt; <a href=3D"http://binutils-cross-canadian_2.25.bb" target=3D"_blank=
">binutils-cross-canadian_2.25.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://nutils-cross_2.24.bb" target=3D"_blank">nutils-c=
ross_2.24.bb</a> =3D&gt; <a href=3D"http://binutils-cross_2.25.bb" target=
=3D"_blank">binutils-cross_2.25.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0...-<a href=3D"http://crosssdk_2.24.bb" target=3D"_blank">crosssdk_2.=
24.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.25.bb" target=3D"_b=
lank">binutils-crosssdk_2.25.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0.../binutils/binutils/binutils-poison.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 40 +-<br>
=C2=A0.../binutils/binutils/binutils-xlp-support.patch=C2=A0 =C2=A0| 296 ++=
++++------<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8484.patch |=C2=A0 67 ---<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8485.patch | 102 ----<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8501.patch |=C2=A0 60 ---<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8502.patch |=C2=A0 89 ----<br=
>
=C2=A0.../binutils/binutils_CVE-2014-8502_1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 523 ---------------------<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8503.patch |=C2=A0 47 --<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8504.patch |=C2=A0 75 ---<br>
=C2=A0.../binutils/binutils/binutils_CVE-2014-8737.patch | 177 -------<br>
=C2=A0.../binutils/binutils/fix-pr15815.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 36 --<br>
=C2=A0.../binutils/binutils/fix-pr16428.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 123 -----<br>
=C2=A0.../binutils/binutils/fix-pr16476.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 220 ---------<br>
=C2=A0.../binutils/binutils/fix-pr2404.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 76 ---<br>
=C2=A0.../binutils/binutils/libtool-2.4-update.patch=C2=A0 =C2=A0 =C2=A0| 3=
01 ++++++------<br>
=C2=A0.../binutils/mips64-default-ld-emulation.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 38 +-<br>
=C2=A0.../replace_macros_with_static_inline.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 188 --------<br>
=C2=A0.../{<a href=3D"http://binutils_2.24.bb" target=3D"_blank">binutils_2=
.24.bb</a> =3D&gt; <a href=3D"http://binutils_2.25.bb" target=3D"_blank">bi=
nutils_2.25.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A023 files changed, 340 insertions(+), 2140 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/binutils/{binutils-2.24.inc =3D&gt; binu=
tils-2.25.inc} (58%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
ss-canadian_2.24.bb" target=3D"_blank">binutils-cross-canadian_2.24.bb</a> =
=3D&gt; <a href=3D"http://binutils-cross-canadian_2.25.bb" target=3D"_blank=
">binutils-cross-canadian_2.25.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
ss_2.24.bb" target=3D"_blank">binutils-cross_2.24.bb</a> =3D&gt; <a href=3D=
"http://binutils-cross_2.25.bb" target=3D"_blank">binutils-cross_2.25.bb</a=
>} (100%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
sssdk_2.24.bb" target=3D"_blank">binutils-crosssdk_2.24.bb</a> =3D&gt; <a h=
ref=3D"http://binutils-crosssdk_2.25.bb" target=3D"_blank">binutils-crosssd=
k_2.25.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8484.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8485.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8501.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8502.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8502_1.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8503.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8504.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_C=
VE-2014-8737.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr1581=
5.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr1642=
8.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr1647=
6.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr2404=
.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/replace_ma=
cros_with_static_inline.patch<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils_2.2=
4.bb" target=3D"_blank">binutils_2.24.bb</a> =3D&gt; <a href=3D"http://binu=
tils_2.25.bb" target=3D"_blank">binutils_2.25.bb</a>} (100%)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 6b602d2..c17e0eb 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&qu=
ot;<br>
<br>
=C2=A0GCCVERSION ?=3D &quot;4.9%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
-BINUVERSION ?=3D &quot;2.24&quot;<br>
+BINUVERSION ?=3D &quot;2.25&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.21&quot;<br>
=C2=A0UCLIBCVERSION ?=3D &quot;0.9.33+git%&quot;<br>
=C2=A0LINUXLIBCVERSION ?=3D &quot;3.19&quot;<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipe=
s-devtools/binutils/binutils-2.25.inc<br>
similarity index 58%<br>
rename from meta/recipes-devtools/binutils/binutils-2.24.inc<br>
rename to meta/recipes-devtools/binutils/binutils-2.25.inc<br>
index 63c9287..d69b519 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.25.inc<br>
@@ -1,5 +1,4 @@<br>
=C2=A0LIC_FILES_CHKSUM=3D&quot;\<br>
-=C2=A0 =C2=A0 file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9f=
2c00db2d35\<br>
=C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552\<=
br>
=C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b66=
74\<br>
=C2=A0 =C2=A0 =C2=A0file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504\=
<br>
@@ -25,22 +24,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://binutils-armv5e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://mips64-default-ld-emulation.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://binutils-xlp-support.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://fix-pr15815.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://fix-pr2404.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://fix-pr16476.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://fix-pr16428.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://replace_macros_with_static_inline.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://0001-Fix-MMIX-build-breakage-from-bfd_set_secti=
on_vma-cha.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils-uninitialised-warning.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8484.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8485.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8501.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8502_1.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8502.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8503.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8504.patch \<br>
-=C2=A0 =C2=A0 =C2=A0file://binutils_CVE-2014-8737.patch \<br>
=C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI[md5sum] =3D &quot;d9f3303f802a5b6b0bb73a335ab89d66&quot;<br>
+SRC_URI[sha256sum] =3D &quot;22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacf=
ed3e2ec17b08c882923&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;e0f71a7b2ddab0f8612336ac81d9636b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1=
809871177a0f0f14137&quot;<br>
diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils-cros=
s-canadian_2.24.bb" target=3D"_blank">binutils-cross-canadian_2.24.bb</a> b=
/meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross-canadian_2=
.25.bb" target=3D"_blank">binutils-cross-canadian_2.25.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross=
-canadian_2.24.bb" target=3D"_blank">binutils-cross-canadian_2.24.bb</a><br=
>
rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross-c=
anadian_2.25.bb" target=3D"_blank">binutils-cross-canadian_2.25.bb</a><br>
diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils-cros=
s_2.24.bb" target=3D"_blank">binutils-cross_2.24.bb</a> b/meta/recipes-devt=
ools/binutils/<a href=3D"http://binutils-cross_2.25.bb" target=3D"_blank">b=
inutils-cross_2.25.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross=
_2.24.bb" target=3D"_blank">binutils-cross_2.24.bb</a><br>
rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross_2=
.25.bb" target=3D"_blank">binutils-cross_2.25.bb</a><br>
diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils-cros=
ssdk_2.24.bb" target=3D"_blank">binutils-crosssdk_2.24.bb</a> b/meta/recipe=
s-devtools/binutils/<a href=3D"http://binutils-crosssdk_2.25.bb" target=3D"=
_blank">binutils-crosssdk_2.25.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross=
sdk_2.24.bb" target=3D"_blank">binutils-crosssdk_2.24.bb</a><br>
rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-crosssd=
k_2.25.bb" target=3D"_blank">binutils-crosssdk_2.25.bb</a><br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-poison.patch =
b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch<br>
index 996c023..eb54076 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils-poison.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch<br>
@@ -106,10 +106,10 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 # Check whether --enable-got was given.<br>
=C2=A0 if test &quot;${enable_got+set}&quot; =3D set; then :<br>
-Index: binutils-2.24/ld/<a href=3D"http://configure.in" target=3D"_blank">=
configure.in</a><br>
+Index: binutils-2.24/ld/<a href=3D"http://configure.ac" target=3D"_blank">=
configure.ac</a><br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/ld/<a href=3D"http://configure.in" target=3D"_blank=
">configure.in</a> 2013-12-15 11:46:17.000000000 -0800<br>
-+++ binutils-2.24/ld/<a href=3D"http://configure.in" target=3D"_blank">con=
figure.in</a>=C2=A0 =C2=A0 =C2=A0 2013-12-15 11:46:59.810435651 -0800<br>
+--- binutils-2.24.orig/ld/<a href=3D"http://configure.ac" target=3D"_blank=
">configure.ac</a> 2013-12-15 11:46:17.000000000 -0800<br>
++++ binutils-2.24/ld/<a href=3D"http://configure.ac" target=3D"_blank">con=
figure.ac</a>=C2=A0 =C2=A0 =C2=A0 2013-12-15 11:46:59.810435651 -0800<br>
=C2=A0@@ -87,6 +87,16 @@<br>
=C2=A0 AC_SUBST(TARGET_SYSTEM_ROOT)<br>
=C2=A0 AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)<br>
@@ -214,10 +214,10 @@ Index: binutils-2.24/ld/lexsup.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- binutils-2.24.orig/ld/lexsup.c=C2=A0 =C2=A0 =C2=A02013-12-15 11:4=
6:17.000000000 -0800<br>
=C2=A0+++ binutils-2.24/ld/lexsup.c=C2=A0 2013-12-15 11:49:28.950434490 -08=
00<br>
-@@ -507,6 +507,14 @@<br>
-=C2=A0 =C2=A0 =C2=A0OPTION_IGNORE_UNRESOLVED_SYMBOL},<br>
-=C2=A0 =C2=A0 =C2=A0&#39;\0&#39;, N_(&quot;SYMBOL&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0N_(&quot;Unresolved SYMBOL will not cause an error or =
warning&quot;), TWO_DASHES },<br>
+@@ -513,6 +513,14 @@ static const struct ld_option ld_options[] =3D<br>
+=C2=A0 =C2=A0{ {&quot;pop-state&quot;, no_argument, NULL, OPTION_POP_STATE=
},<br>
+=C2=A0 =C2=A0 =C2=A0&#39;\0&#39;, NULL, N_(&quot;Pop state of flags govern=
ing input file handling&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0TWO_DASHES },<br>
=C2=A0+=C2=A0 { {&quot;no-poison-system-directories&quot;, no_argument, NUL=
L,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0OPTION_NO_POISON_SYSTEM_DIRECTORIES},<br>
=C2=A0+=C2=A0 =C2=A0 &#39;\0&#39;, NULL, N_(&quot;Do not warn for -L option=
s using system directories&quot;),<br>
@@ -229,18 +229,18 @@ Index: binutils-2.24/ld/lexsup.c<br>
=C2=A0 };<br>
<br>
=C2=A0 #define OPTION_COUNT ARRAY_SIZE (ld_options)<br>
-@@ -1442,6 +1450,14 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0einfo (_(&quot;%P%X=
: --hash-size needs a numeric argument\n&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -1474,6 +1482,14 @@ parse_args (unsigned argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (oldp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0case OPTION_NO_POISON_SYSTEM_DIRECTORIES:<br>
-+=C2=A0 =C2=A0 =C2=A0command_line.poison_system_directories =3D FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 case OPTION_NO_POISON_SYSTEM_DIRECTORIES:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_line.poison_system_directories =3D FA=
LSE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:<br>
-+=C2=A0 =C2=A0 =C2=A0command_line.error_poison_system_directories =3D TRUE=
;<br>
-+=C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_line.error_poison_system_directories =
=3D TRUE;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -248,10 +248,10 @@ Index: binutils-2.24/ld/ldlex.h<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- binutils-2.24.orig/ld/ldlex.h=C2=A0 =C2=A0 =C2=A0 2013-12-15 11:4=
6:17.000000000 -0800<br>
=C2=A0+++ binutils-2.24/ld/ldlex.h=C2=A0 =C2=A02013-12-15 11:47:43.23043529=
9 -0800<br>
-@@ -138,6 +138,8 @@<br>
-=C2=A0 =C2=A0OPTION_DEFAULT_SCRIPT,<br>
-=C2=A0 =C2=A0OPTION_PRINT_OUTPUT_FORMAT,<br>
+@@ -140,6 +140,8 @@ enum option_values<br>
=C2=A0 =C2=A0 OPTION_IGNORE_UNRESOLVED_SYMBOL,<br>
+=C2=A0 =C2=A0OPTION_PUSH_STATE,<br>
+=C2=A0 =C2=A0OPTION_POP_STATE,<br>
=C2=A0+=C2=A0 OPTION_NO_POISON_SYSTEM_DIRECTORIES,<br>
=C2=A0+=C2=A0 OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,<br>
=C2=A0 };<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.p=
atch b/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch<b=
r>
index a199918..b03bb28 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch<br=
>
+++ b/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch<br=
>
@@ -16,75 +16,73 @@ Netlogic. Also, update vendor name to NLM wherever appl=
icable.<br>
=C2=A0 bfd/cpu-mips.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 ++++--<br=
>
=C2=A0 bfd/elfxx-mips.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 ++++++++<br>
=C2=A0 binutils/readelf.c=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
- config.sub=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 ++++=
++<br>
- gas/config/tc-mips.c=C2=A0 |=C2=A0 =C2=A0 7 ++++++-<br>
+ gas/config/tc-mips.c=C2=A0 |=C2=A0 =C2=A0 4 +++-<br>
=C2=A0 gas/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +++<=
br>
=C2=A0 gas/configure.tgt=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
- gas/doc/c-mips.texi=C2=A0 =C2=A0|=C2=A0 =C2=A0 3 ++-<br>
=C2=A0 include/elf/mips.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
- include/opcode/mips.h |=C2=A0 =C2=A0 6 +++++-<br>
+ include/opcode/mips.h |=C2=A0 =C2=A010 ++++++++--<br>
=C2=A0 ld/configure.tgt=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 ++<br>
- opcodes/mips-dis.c=C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 ++++++<br>
- opcodes/mips-opc.c=C2=A0 =C2=A0 |=C2=A0 =C2=A031 ++++++++++++++++++++----=
-------<br>
- 17 files changed, 73 insertions(+), 17 deletions(-)<br>
+ opcodes/mips-dis.c=C2=A0 =C2=A0 |=C2=A0 =C2=A012 +++++-------<br>
+ opcodes/mips-opc.c=C2=A0 =C2=A0 |=C2=A0 =C2=A033 +++++++++++++++++++++---=
---------<br>
+ 15 files changed, 65 insertions(+), 25 deletions(-)<br>
<br>
-Index: binutils-2.24/bfd/aoutx.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/aoutx.h=C2=A0 =C2=A0 =C2=A02013-12-15 13:07:57.=
180399300 -0800<br>
-+++ binutils-2.24/bfd/aoutx.h=C2=A0 2013-12-15 13:08:03.397065919 -0800<br=
>
-@@ -798,6 +798,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case bfd_mach_mipsisa64r2:<br>
+diff --git a/bfd/aoutx.h b/bfd/aoutx.h<br>
+index 9385a98..a88df99 100644<br>
+--- a/bfd/aoutx.h<br>
++++ b/bfd/aoutx.h<br>
+@@ -802,6 +802,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case bfd_mach_mipsisa64r6:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case bfd_mach_mips_sb1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case bfd_mach_mips_xlr:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 case bfd_mach_mips_xlp:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: These should be MIPS3, MIPS4, =
MIPS16, MIPS32, etc.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch_flags =3D M_MIPS2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-Index: binutils-2.24/bfd/archures.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/archures.c=C2=A0 2013-12-15 13:07:57.180399300 =
-0800<br>
-+++ binutils-2.24/bfd/archures.c=C2=A0 =C2=A0 =C2=A0 =C2=A02013-12-15 13:0=
8:03.397065919 -0800<br>
-@@ -178,6 +178,7 @@<br>
+diff --git a/bfd/archures.c b/bfd/archures.c<br>
+index c9fd6c8..547bd09 100644<br>
+--- a/bfd/archures.c<br>
++++ b/bfd/archures.c<br>
+@@ -180,6 +180,7 @@ DESCRIPTION<br>
=C2=A0 .#define bfd_mach_mips_octeonp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 6601<br>
=C2=A0 .#define bfd_mach_mips_octeon2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 6502<br>
=C2=A0 .#define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887682=C2=A0 =C2=A0{* decimal &#39;XLR&#39;=C2=A0 *}<br>
=C2=A0+.#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887680=C2=A0 =C2=A0{* decimal &#39;XLP&#39;=C2=A0 *}<br>
=C2=A0 .#define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A032<br>
=C2=A0 .#define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A033<br>
- .#define bfd_mach_mipsisa64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A064<br>
-Index: binutils-2.24/bfd/bfd-in2.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/bfd-in2.h=C2=A0 =C2=A02013-12-15 13:07:57.18039=
9300 -0800<br>
-+++ binutils-2.24/bfd/bfd-in2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12-15 13:0=
8:03.400399254 -0800<br>
-@@ -1933,6 +1933,7 @@<br>
+ .#define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A034<=
br>
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h<br>
+index c7a2bb5..413b773 100644<br>
+--- a/bfd/bfd-in2.h<br>
++++ b/bfd/bfd-in2.h<br>
+@@ -1967,6 +1967,7 @@ enum bfd_architecture<br>
=C2=A0 #define bfd_mach_mips_octeonp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6601=
<br>
=C2=A0 #define bfd_mach_mips_octeon2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6502=
<br>
=C2=A0 #define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887682=C2=A0 =C2=A0/* decimal &#39;XLR&#39;=C2=A0 */<br>
=C2=A0+#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887680=C2=A0 =C2=A0/* decimal &#39;XLP&#39;=C2=A0 */<br>
=C2=A0 #define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A032<br>
=C2=A0 #define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A033<br>
- #define bfd_mach_mipsisa64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A064<br>
-Index: binutils-2.24/bfd/config.bfd<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/config.bfd=C2=A0 2013-12-15 13:08:03.047065922 =
-0800<br>
-+++ binutils-2.24/bfd/config.bfd=C2=A0 =C2=A0 =C2=A0 =C2=A02013-12-15 13:0=
8:03.400399254 -0800<br>
-@@ -1032,6 +1032,11 @@<br>
-=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dbfd_elf32_littlemips_vec<br>
-=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;bfd_elf32_bigmips_vec bfd_elf64_b=
igmips_vec bfd_elf64_littlemips_vec&quot;<br>
+ #define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A034<b=
r>
+diff --git a/bfd/config.bfd b/bfd/config.bfd<br>
+index 03d2c6f..91cedb8 100644<br>
+--- a/bfd/config.bfd<br>
++++ b/bfd/config.bfd<br>
+@@ -1041,6 +1041,11 @@ case &quot;${targ}&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dmips_elf32_le_vec<br>
+=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;mips_elf32_be_vec mips_elf64_be_v=
ec mips_elf64_le_vec&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0+=C2=A0 mipsisa64*-*-elf*)<br>
-+=C2=A0 =C2=A0 =C2=A0 targ_defvec=3Dbfd_elf32_tradbigmips_vec<br>
-+=C2=A0 =C2=A0 =C2=A0 targ_selvecs=3D&quot;bfd_elf32_tradlittlemips_vec bf=
d_elf64_tradbigmips_vec bfd_elf64_tradlittlemips_vec&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 targ_defvec=3Dmips_elf32_trad_be_vec<br>
++=C2=A0 =C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_trad_le_vec mips_elf=
64_trad_be_vec mips_elf64_trad_le_vec&quot;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 want64=3Dtrue<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 mips*-*-elf* | mips*-*-rtems* | mips*-*-vxworks | mips*-*-win=
diss)<br>
-=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dbfd_elf32_bigmips_vec<br>
-=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;bfd_elf32_littlemips_vec bfd_elf6=
4_bigmips_vec bfd_elf64_littlemips_vec&quot;<br>
-Index: binutils-2.24/bfd/cpu-mips.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/cpu-mips.c=C2=A0 2013-12-15 13:07:57.180399300 =
-0800<br>
-+++ binutils-2.24/bfd/cpu-mips.c=C2=A0 =C2=A0 =C2=A0 =C2=A02013-12-15 13:0=
8:03.400399254 -0800<br>
-@@ -99,7 +99,8 @@<br>
+=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dmips_elf32_be_vec<br>
+=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;mips_elf32_le_vec mips_elf64_be_v=
ec mips_elf64_le_vec&quot;<br>
+diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c<br>
+index b617aaa..19a99d1 100644<br>
+--- a/bfd/cpu-mips.c<br>
++++ b/bfd/cpu-mips.c<br>
+@@ -103,7 +103,8 @@ enum<br>
=C2=A0 =C2=A0 I_mipsocteonp,<br>
=C2=A0 =C2=A0 I_mipsocteon2,<br>
=C2=A0 =C2=A0 I_xlr,<br>
@@ -94,7 +92,7 @@ Index: binutils-2.24/bfd/cpu-mips.c<br>
=C2=A0 };<br>
<br>
=C2=A0 #define NN(index) (&amp;arch_info_struct[(index) + 1])<br>
-@@ -143,7 +144,8 @@<br>
+@@ -153,7 +154,8 @@ static const bfd_arch_info_type arch_info_struct[] =3D=
<br>
=C2=A0 =C2=A0 N (64, 64, bfd_mach_mips_octeonp,&quot;mips:octeon+&quot;,=C2=
=A0 FALSE, NN(I_mipsocteonp)),<br>
=C2=A0 =C2=A0 N (64, 64, bfd_mach_mips_octeon2,&quot;mips:octeon2&quot;,=C2=
=A0 FALSE, NN(I_mipsocteon2)),<br>
=C2=A0 =C2=A0 N (64, 64, bfd_mach_mips_xlr, &quot;mips:xlr&quot;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0FALSE, NN(I_xlr)),<br>
@@ -104,11 +102,11 @@ Index: binutils-2.24/bfd/cpu-mips.c<br>
=C2=A0 };<br>
<br>
=C2=A0 /* The default architecture is mips:3000, but with a machine number =
of<br>
-Index: binutils-2.24/bfd/elfxx-mips.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/elfxx-mips.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12=
-15 13:07:57.180399300 -0800<br>
-+++ binutils-2.24/bfd/elfxx-mips.c=C2=A0 =C2=A0 =C2=A02013-12-15 13:08:03.=
400399254 -0800<br>
-@@ -6404,6 +6404,9 @@<br>
+diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c<br>
+index a0cc26e..672d5b3 100644<br>
+--- a/bfd/elfxx-mips.c<br>
++++ b/bfd/elfxx-mips.c<br>
+@@ -6608,6 +6608,9 @@ _bfd_elf_mips_mach (flagword flags)<br>
=C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_XLR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bfd_mach_mips_xlr;<br>
<br>
@@ -118,7 +116,7 @@ Index: binutils-2.24/bfd/elfxx-mips.c<br>
=C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (flags &amp; EF_MIPS_ARCH)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-@@ -11622,6 +11625,10 @@<br>
+@@ -11878,6 +11881,10 @@ mips_set_isa_flags (bfd *abfd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
@@ -129,31 +127,31 @@ Index: binutils-2.24/bfd/elfxx-mips.c<br>
=C2=A0 =C2=A0 =C2=A0 case bfd_mach_mipsisa32:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D E_MIPS_ARCH_32;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-@@ -14202,6 +14209,7 @@<br>
-=C2=A0 =C2=A0{ bfd_mach_mips_octeon2, bfd_mach_mips_octeonp },<br>
+@@ -14753,6 +14760,7 @@ static const struct mips_mach_extension mips_mach_=
extensions[] =3D<br>
=C2=A0 =C2=A0 { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },<br>
=C2=A0 =C2=A0 { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },<br>
+=C2=A0 =C2=A0{ bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },<br>
=C2=A0+=C2=A0 { bfd_mach_mips_xlp, bfd_mach_mipsisa64r2 },<br>
<br>
=C2=A0 =C2=A0 /* MIPS64 extensions.=C2=A0 */<br>
=C2=A0 =C2=A0 { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },<br>
-Index: binutils-2.24/binutils/readelf.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/readelf.c=C2=A0 =C2=A0 =C2=A0 2013-12-15 1=
3:07:57.180399300 -0800<br>
-+++ binutils-2.24/binutils/readelf.c=C2=A0 =C2=A02013-12-15 13:08:03.40373=
2587 -0800<br>
-@@ -2602,6 +2602,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case E_MIPS_MACH_OCTEON: strcat (=
buf, &quot;, octeon&quot;); break;<br>
+diff --git a/binutils/readelf.c b/binutils/readelf.c<br>
+index 0c00b2f..6e9d5e4 100644<br>
+--- a/binutils/readelf.c<br>
++++ b/binutils/readelf.c<br>
+@@ -2898,6 +2898,7 @@ get_machine_flags (unsigned e_flags, unsigned e_mach=
ine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_OCTEON2: strcat =
(buf, &quot;, octeon2&quot;); break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case E_MIPS_MACH_OCTEON3: strcat =
(buf, &quot;, octeon3&quot;); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_XLR:=C2=A0 strca=
t (buf, &quot;, xlr&quot;); break;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case E_MIPS_MACH_XL=
P:=C2=A0 strcat (buf, &quot;, xlp&quot;); break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We simply ignore the field in =
this case to avoid confusion:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPS ELF does not sp=
ecify EF_MIPS_MACH, it is a GNU<br>
-Index: binutils-2.24/gas/config/tc-mips.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/gas/config/tc-mips.c=C2=A0 =C2=A0 2013-12-15 13:07:=
57.180399300 -0800<br>
-+++ binutils-2.24/gas/config/tc-mips.c 2013-12-15 13:17:19.943728439 -0800=
<br>
-@@ -486,6 +486,7 @@<br>
+diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c<br>
+index c3e3e2a..8d64344 100644<br>
+--- a/gas/config/tc-mips.c<br>
++++ b/gas/config/tc-mips.c<br>
+@@ -551,6 +551,7 @@ static int mips_32bitmode =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0|| mips_opts.arch =3D=3D CPU_RM7000=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0|| mips_opts.arch =3D=3D CPU_VR5500=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0|| mips_opts.micromips=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
@@ -161,7 +159,7 @@ Index: binutils-2.24/gas/config/tc-mips.c<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 /* Whether the processor uses hardware interlocks to protect reads<b=
r>
-@@ -515,6 +516,7 @@<br>
+@@ -580,6 +581,7 @@ static int mips_32bitmode =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 &amp;&amp; mips_opts.isa !=3D ISA_MIPS3)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0|| mips_opts.arch =3D=3D CPU_R4300=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0|| mips_opts.micromips=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
@@ -169,7 +167,7 @@ Index: binutils-2.24/gas/config/tc-mips.c<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 /* Whether the processor uses hardware interlocks to protect reads<b=
r>
-@@ -17794,7 +17796,7 @@<br>
+@@ -18682,7 +18684,7 @@ static const struct mips_cpu_info mips_cpu_info_ta=
ble[] =3D<br>
=C2=A0 =C2=A0 /* Broadcom XLP.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0XLP is mostly like XLR, with the prominent excep=
tion that it is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0MIPS64R2 rather than MIPS64.=C2=A0 */<br>
@@ -178,13 +176,13 @@ Index: binutils-2.24/gas/config/tc-mips.c<br>
<br>
=C2=A0 =C2=A0 /* End marker */<br>
=C2=A0 =C2=A0 { NULL, 0, 0, 0, 0 }<br>
-Index: binutils-2.24/gas/configure<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/gas/configure=C2=A0 =C2=A02013-12-15 13:08:01.12706=
5936 -0800<br>
-+++ binutils-2.24/gas/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12-15 13:0=
8:03.407065920 -0800<br>
-@@ -12697,6 +12697,9 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mipsisa64r2 | mipsisa64r2el)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mips_cpu=3Dmips64r2<br>
+diff --git a/gas/configure b/gas/configure<br>
+index 9529f1a..63bba5b 100755<br>
+--- a/gas/configure<br>
++++ b/gas/configure<br>
+@@ -12808,6 +12808,9 @@ _ACEOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mipsisa64r6 | mipsisa64r6el)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mips_cpu=3Dmips64r6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mipsisa64r2nlm | mipsisa64r2nlmel)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mips_cpu=3Dxlp<br>
@@ -192,36 +190,36 @@ Index: binutils-2.24/gas/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mipstx39 | mipstx39el)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mips_cpu=3Dr3900<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-Index: binutils-2.24/gas/configure.tgt<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/gas/configure.tgt=C2=A0 =C2=A0 =C2=A0 =C2=A02013-12=
-15 13:08:00.783732605 -0800<br>
-+++ binutils-2.24/gas/configure.tgt=C2=A0 =C2=A0 2013-12-15 13:08:03.40706=
5920 -0800<br>
-@@ -325,7 +325,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt=3Delf=
 em=3Dfreebsd ;;<br>
+diff --git a/gas/configure.tgt b/gas/configure.tgt<br>
+index 05546ca..bb859d6 100644<br>
+--- a/gas/configure.tgt<br>
++++ b/gas/configure.tgt<br>
+@@ -332,7 +332,7 @@ case ${generic_target} in<br>
=C2=A0 =C2=A0 mips-*-sysv4*MP* | mips-*-gnu*)=C2=A0 =C2=A0 =C2=A0fmt=3Delf =
em=3Dtmips ;;<br>
-=C2=A0 =C2=A0mips*-sde-elf* | mips*-mti-elf*)=C2=A0 =C2=A0 fmt=3Delf em=3D=
tmips ;;<br>
+=C2=A0 =C2=A0mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt=3Delf=
 em=3Dtmips ;;<br>
=C2=A0-=C2=A0 mips-*-elf* | mips-*-rtems*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 fmt=3Delf ;;<br>
=C2=A0+=C2=A0 mips-*-elf* | mips-*-rtems*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 fmt=3Delf em=3Dtmips ;;<br>
=C2=A0 =C2=A0 mips-*-netbsd*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt=3Delf em=3Dtmips ;;<br>
=C2=A0 =C2=A0 mips-*-openbsd*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 fmt=3Delf em=3Dtmips ;;<br>
<br>
-Index: binutils-2.24/include/elf/mips.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/include/elf/mips.h=C2=A0 =C2=A0 =C2=A0 2013-12-15 1=
3:07:57.180399300 -0800<br>
-+++ binutils-2.24/include/elf/mips.h=C2=A0 =C2=A02013-12-15 13:08:03.40706=
5920 -0800<br>
-@@ -274,6 +274,7 @@<br>
+diff --git a/include/elf/mips.h b/include/elf/mips.h<br>
+index 2ed6acd..899b1e5 100644<br>
+--- a/include/elf/mips.h<br>
++++ b/include/elf/mips.h<br>
+@@ -285,6 +285,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)<br>
=C2=A0 #define E_MIPS_MACH_SB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x008a0000<=
br>
=C2=A0 #define E_MIPS_MACH_OCTEON=C2=A0 =C2=A0 0x008b0000<br>
=C2=A0 #define E_MIPS_MACH_XLR=C2=A0 =C2=A0 =C2=A0 =C2=A00x008c0000<br>
-+#define E_MIPS_MACH_XLP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x008e0000<br>
++#define E_MIPS_MACH_XLP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x008f0000<br>
=C2=A0 #define E_MIPS_MACH_OCTEON2=C2=A0 =C2=A00x008d0000<br>
+ #define E_MIPS_MACH_OCTEON3=C2=A0 =C2=A00x008e0000<br>
=C2=A0 #define E_MIPS_MACH_5400=C2=A0 =C2=A0 =C2=A0 0x00910000<br>
- #define E_MIPS_MACH_5900=C2=A0 =C2=A0 =C2=A0 0x00920000<br>
-Index: binutils-2.24/include/opcode/mips.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/include/opcode/mips.h=C2=A0 =C2=A02013-12-15 13:07:=
57.180399300 -0800<br>
-+++ binutils-2.24/include/opcode/mips.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12=
-15 13:40:11.130384844 -0800<br>
-@@ -1092,8 +1092,10 @@<br>
+diff --git a/include/opcode/mips.h b/include/opcode/mips.h<br>
+index ef26167..ef53ec6 100644<br>
+--- a/include/opcode/mips.h<br>
++++ b/include/opcode/mips.h<br>
+@@ -1227,8 +1227,10 @@ static const unsigned int mips_isa_table[] =3D {<br=
>
=C2=A0 #define INSN_LOONGSON_2F=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x8000000=
0<br>
=C2=A0 /* Loongson 3A.=C2=A0 */<br>
=C2=A0 #define INSN_LOONGSON_3A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000040=
0<br>
@@ -234,7 +232,7 @@ Index: binutils-2.24/include/opcode/mips.h<br>
<br>
=C2=A0 /* DSP ASE */<br>
=C2=A0 #define ASE_DSP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000001<br>
-@@ -1172,6 +1174,7 @@<br>
+@@ -1324,6 +1326,7 @@ static const unsigned int mips_isa_table[] =3D {<br>
=C2=A0 #define CPU_OCTEONP=C2=A0 =C2=A06601<br>
=C2=A0 #define CPU_OCTEON2=C2=A0 =C2=A06502<br>
=C2=A0 #define CPU_XLR=C2=A0 =C2=A0 =C2=A0 =C2=A0887682=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* decimal &#39;XLR&#39;=C2=A0 =C2=A0*/<br>
@@ -242,9 +240,9 @@ Index: binutils-2.24/include/opcode/mips.h<br>
<br>
=C2=A0 /* Return true if the given CPU is included in INSN_* mask MASK.=C2=
=A0 */<br>
<br>
-@@ -1239,6 +1242,9 @@<br>
-=C2=A0 =C2=A0 =C2=A0case CPU_XLR:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (mask &amp; INSN_XLR) !=3D 0;<br>
+@@ -1398,6 +1401,9 @@ cpu_is_member (int cpu, unsigned int mask)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((mask &amp; INSN_ISA_MASK) =3D=3D INSN_=
ISA32R6)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || ((mask &amp; INSN_ISA_MASK) =
=3D=3D INSN_ISA64R6);<br>
<br>
=C2=A0+=C2=A0 =C2=A0 case CPU_XLP:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 return (mask &amp; INSN_XLP) !=3D 0;<br>
@@ -252,12 +250,12 @@ Index: binutils-2.24/include/opcode/mips.h<br>
=C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
-Index: binutils-2.24/ld/configure.tgt<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/ld/configure.tgt=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12=
-15 13:08:03.047065922 -0800<br>
-+++ binutils-2.24/ld/configure.tgt=C2=A0 =C2=A0 =C2=A02013-12-15 13:08:03.=
407065920 -0800<br>
-@@ -457,6 +457,8 @@<br>
- mips*-sde-elf* | mips*-mti-elf*)<br>
+diff --git a/ld/configure.tgt b/ld/configure.tgt<br>
+index 740b2ea..4df13a7 100644<br>
+--- a/ld/configure.tgt<br>
++++ b/ld/configure.tgt<br>
+@@ -462,6 +462,8 @@ mips*el-sde-elf*)=C2=A0 targ_emul=3Delf32ltsmip<br>
+ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_emul=3Delf32btsmip<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32ltsmip elf32btsmipn32 elf64btsmip =
elf32ltsmipn32 elf64ltsmip&quot; ;;<br>
=C2=A0+mipsisa64*-*-elf*)=C2=A0 =C2=A0 targ_emul=3Delf32btsmip<br>
@@ -265,13 +263,13 @@ Index: binutils-2.24/ld/configure.tgt<br>
=C2=A0 mips64*el-ps2-elf*)=C2=A0 =C2=A0targ_emul=3Delf32lr5900n32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32lr5900&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 targ_extra_libpath=3D$targ_extra_emuls ;;<br>
-Index: binutils-2.24/opcodes/mips-dis.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/opcodes/mips-dis.c=C2=A0 =C2=A0 =C2=A0 2013-12-15 1=
3:07:57.180399300 -0800<br>
-+++ binutils-2.24/opcodes/mips-dis.c=C2=A0 =C2=A02013-12-15 13:39:50.24371=
8329 -0800<br>
-@@ -554,13 +554,11 @@<br>
+diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c<br>
+index 1eb1d45..d6881af 100644<br>
+--- a/opcodes/mips-dis.c<br>
++++ b/opcodes/mips-dis.c<br>
+@@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
=3D<br>
=C2=A0 =C2=A0 =C2=A0 mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_x=
lr),<br>
-=C2=A0 =C2=A0 =C2=A0mips_hwr_names_numeric },<br>
+=C2=A0 =C2=A0 =C2=A0mips_cp1_names_mips3264, mips_hwr_names_numeric },<br>
<br>
=C2=A0-=C2=A0 /* XLP is mostly like XLR, with the prominent exception it is=
 being<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0MIPS64R2.=C2=A0 */<br>
@@ -279,7 +277,7 @@ Index: binutils-2.24/opcodes/mips-dis.c<br>
=C2=A0-=C2=A0 =C2=A0 ISA_MIPS64R2 | INSN_XLR, 0,<br>
=C2=A0-=C2=A0 =C2=A0 mips_cp0_names_xlr,<br>
=C2=A0-=C2=A0 =C2=A0 mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_x=
lr),<br>
--=C2=A0 =C2=A0 mips_hwr_names_numeric },<br>
+-=C2=A0 =C2=A0 mips_cp1_names_mips3264, mips_hwr_names_numeric },<br>
=C2=A0+=C2=A0 { &quot;xlp&quot;, 1, bfd_mach_mips_xlp, CPU_XLP,<br>
=C2=A0+=C2=A0 =C2=A0 ISA_MIPS64R2 | INSN_XLP, 0,<br>
=C2=A0+=C2=A0 =C2=A0 mips_cp0_names_mips3264r2,<br>
@@ -288,11 +286,11 @@ Index: binutils-2.24/opcodes/mips-dis.c<br>
<br>
=C2=A0 =C2=A0 /* This entry, mips16, is here only for ISA/processor selecti=
on; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0not print its name.=C2=A0 */<br>
-Index: binutils-2.24/opcodes/mips-opc.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/opcodes/mips-opc.c=C2=A0 =C2=A0 =C2=A0 2013-12-15 1=
3:07:57.180399300 -0800<br>
-+++ binutils-2.24/opcodes/mips-opc.c=C2=A0 =C2=A02013-12-15 13:27:30.57372=
4118 -0800<br>
-@@ -262,7 +262,8 @@<br>
+diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c<br>
+index 2c3bbad..86eb95b 100644<br>
+--- a/opcodes/mips-opc.c<br>
++++ b/opcodes/mips-opc.c<br>
+@@ -319,7 +319,8 @@ decode_mips_operand (const char *p)<br>
=C2=A0 #define IOCT=C2=A0 (INSN_OCTEON | INSN_OCTEONP | INSN_OCTEON2)<br>
=C2=A0 #define IOCTP (INSN_OCTEONP | INSN_OCTEON2)<br>
=C2=A0 #define IOCT2 INSN_OCTEON2<br>
@@ -302,67 +300,69 @@ Index: binutils-2.24/opcodes/mips-opc.c<br>
=C2=A0 #define IVIRT ASE_VIRT<br>
=C2=A0 #define IVIRT64=C2=A0 =C2=A0 =C2=A0 =C2=A0ASE_VIRT64<br>
<br>
-@@ -881,6 +882,7 @@<br>
- {&quot;cins&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,r,+p,+S&quot;,=C2=A0 =C2=A0 0x70000032, 0xfc00003f, WR_1|RD_2,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 IOCT,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 0 },<br>
- {&quot;clo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x70000021, 0xfc0007ff, WR_1|RD_2,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I32|N55,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
- {&quot;clz&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x70000020, 0xfc0007ff, WR_1|RD_2,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I32|N55,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
+@@ -956,6 +957,7 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<br=
>
+ {&quot;clo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x70000021, 0xfc0007ff, WR_1|RD_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I32|N55,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 I37 },<br>
+ {&quot;clz&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;d,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00000050, 0xfc1f07ff, WR_1|RD_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I37,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+ {&quot;clz&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x70000020, 0xfc0007ff, WR_1|RD_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I32|N55,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 I37 },<br>
=C2=A0+{&quot;crc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x7000001c, 0xfc0007ff, WR_1|RD_2|RD_3, 0,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
- {&quot;ctc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,G&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40c00000, 0xffe007ff, RD_1|W=
R_CC|COD,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 IOCT|IOCTP|IOCT2 },<br>
- {&quot;ctc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,G&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x44c00000, 0xffe007ff, RD_1|W=
R_CC|COD|FP_S,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=
=A0 0 },<br>
- {&quot;ctc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,S&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x44c00000, 0xffe007ff, RD_1|W=
R_CC|COD|FP_S,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=
=A0 0 },<br>
-@@ -913,10 +915,11 @@<br>
+ /* ctc0 is at the bottom of the table.=C2=A0 */<br>
+ {&quot;ctc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,G&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x44c00000, 0xffe007ff, RD_1|W=
R_CC|CM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
+ {&quot;ctc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,S&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x44c00000, 0xffe007ff, RD_1|W=
R_CC|CM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
+@@ -988,12 +990,13 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
=C2=A0 {&quot;daddiu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,r,j&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x64000000, 0xfc000000, WR_1|RD_2,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;daddu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;d,v,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000002d, 0xfc0007ff, WR_1|R=
D_2|RD_3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;daddu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;t,r,I&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 (int) M_DADDU_=
I,=C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0-{&quot;daddwc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000038, 0xfc0007ff, WR_1|RD_2|R=
D_3|WR_C0|RD_C0, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;daddwc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000038, 0xfc0007ff, WR_1|RD_2|R=
D_3|WR_C0|RD_C0, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;dbreak&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7000003f, 0xffffff=
ff, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N5,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
- {&quot;dclo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000025, 0xfc0007ff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 I64|N55,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
- {&quot;dclz&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000024, 0xfc0007ff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 I64|N55,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+ {&quot;dclo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000053, 0xfc1f07ff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I69,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+ {&quot;dclo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000025, 0xfc0007ff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 I64|N55,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 I69 },<br>
+ {&quot;dclz&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000052, 0xfc1f07ff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I69,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+ {&quot;dclz&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
U,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000024, 0xfc0007ff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 I64|N55,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 I69 },<br>
=C2=A0+{&quot;dcrc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7000001d, 0xfc0007ff, WR_1|R=
D_2|RD_3, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLP,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 /* dctr and dctw are used on the r5000.=C2=A0 */<br>
=C2=A0 {&quot;dctr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xbc050000, 0xfc1f0000, R=
D_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;dctw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xbc090000, 0xfc1f0000, R=
D_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
-@@ -980,6 +983,7 @@<br>
- {&quot;dmfc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,G,H&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40200000, 0xffe007f8, WR_1|RD_C0|=
LCD,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 I64,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
- {&quot;dmfgc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,G&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40600100, 0xffe007ff, WR_1|RD_C0|=
LCD,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IVIRT64, 0=
 },<br>
- {&quot;dmfgc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,G,H=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40600100, 0xffe007f8, WR_1|RD_C0|LCD,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IVIRT64, 0 },=
<br>
+@@ -1065,6 +1068,7 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
+ {&quot;dmfc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,G,H&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40200000, 0xffe007f8, WR_1|RD_C0|=
LC,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 I64,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
+ {&quot;dmfgc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,G&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40600100, 0xffe007ff, WR_1|RD_C0|=
LC,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IVIRT64, 0=
 },<br>
+ {&quot;dmfgc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,G,H=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40600100, 0xffe007f8, WR_1|RD_C0|LC,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IVIRT64, 0 },=
<br>
=C2=A0+{&quot;dmfur&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;t,d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7000001e, 0xffe007ff, W=
R_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLP,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;dmt&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x41600bc1, 0xffffffff, TRAP,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MT3=
2,=C2=A0 =C2=A00 },<br>
=C2=A0 {&quot;dmt&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x41600bc1, 0xffe0ffff, WR_1|TRAP,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MT32,=C2=A0 =C2=A00 },<=
br>
- {&quot;dmtc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,G&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40a00000, 0xffe007ff, RD_1|W=
R_C0|WR_CC|COD,=C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 I3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=
=A0 EE },<br>
-@@ -994,6 +998,8 @@<br>
+ {&quot;dmtc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,G&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40a00000, 0xffe007ff, RD_1|W=
R_C0|WR_CC|CM,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 I3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=
=A0 EE },<br>
+@@ -1079,6 +1083,8 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
=C2=A0 /* dmtc2 is at the bottom of the table.=C2=A0 */<br>
=C2=A0 /* dmfc3 is at the bottom of the table.=C2=A0 */<br>
=C2=A0 /* dmtc3 is at the bottom of the table.=C2=A0 */<br>
+ {&quot;dmuh&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000dc, 0xfc0007ff, WR_1|RD_2|R=
D_3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 I69,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
=C2=A0+{&quot;dmtur&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;t,d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7000001f, 0xffe007ff, R=
D_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLP,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;dmul&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000006, 0xfc0007ff, WR_1|R=
D_2|RD_3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0=
 =C2=A0 =C2=A0 0 },<br>
+ {&quot;dmul&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,s,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000009c, 0xfc0007ff, WR_1|RD_2|R=
D_3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 I69,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
=C2=A0 {&quot;dmul&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;d,v,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000003, 0xfc0007ff, WR_1|R=
D_2|RD_3|WR_HILO, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IOCT,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
- {&quot;dmul&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,v,t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 (int) M_DMUL,=C2=A0=
 =C2=A0 =C2=A0INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 M32 },<br>
- {&quot;dmul&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d,v,I&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 (int) M_DMUL_I,=C2=
=A0 =C2=A0INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 M32 },<br>
-@@ -1134,9 +1140,9 @@<br>
- /* The macro has to be first to handle o32 correctly.=C2=A0 */<br>
+@@ -1229,9 +1235,9 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
+ {&quot;ld&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;s,-b(+R)&quot;,=C2=A0 =C2=A0 =C2=A00xec18=
0000, 0xfc1c0000, WR_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0RD_pc,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I69,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;ld&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 (int) M_LD_AB,=C2=A0 =C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
- {&quot;ld&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00=
xdc000000, 0xfc000000, WR_1|RD_3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
--{&quot;ldaddw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000010, 0xfc00ffff, MOD_1|RD_2|=
SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
--{&quot;ldaddwu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000011, 0xfc00ffff, MOD_1|RD_2|=
SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
--{&quot;ldaddd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000012, 0xfc00ffff, MOD_1|RD_2|=
SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
+ {&quot;ld&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00=
xdc000000, 0xfc000000, WR_1|RD_3|LM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I3,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+-{&quot;ldaddw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000010, 0xfc00ffff, MOD_1|RD_2|=
LM|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
+-{&quot;ldaddwu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000011, 0xfc00ffff, MOD_1|RD_2|=
LM|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
+-{&quot;ldaddd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000012, 0xfc00ffff, MOD_1|RD_2|=
LM|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
=C2=A0+{&quot;ldaddw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000010, 0xfc00ffff, MOD_1|=
RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
=C2=A0+{&quot;ldaddwu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000011, 0xfc00ffff, MOD_1|=
RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
=C2=A0+{&quot;ldaddd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000012, 0xfc00ffff, MOD_1|=
RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
=C2=A0 {&quot;ldc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;T,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xd4000000, 0xfc000000, WR_1|R=
D_3|CLD|FP_D,=C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 I2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 SF },<br>
=C2=A0 {&quot;ldc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;E,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xd4000000, 0xfc000000, WR_1|R=
D_3|CLD|FP_D,=C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 I2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 SF },<br>
=C2=A0 {&quot;ldc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;T,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 (int) M_LDC1_A=
B,=C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSN2_M=
_FP_D,=C2=A0 =C2=A0I2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 SF },<br>
-@@ -1288,7 +1294,7 @@<br>
+@@ -1396,7 +1402,7 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
=C2=A0 {&quot;mflo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;d,9&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000012, 0xff9f07ff, W=
R_1|RD_LO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 D32,=C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mflo1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000012, 0xffff07=
ff, WR_1|RD_LO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EE,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mflhxu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000052, 0xffff07ff, W=
R_1|MOD_HILO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 SMT,=C2=A0 =C2=A0 0 },<br>
--{&quot;mfcr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000018, 0xfc00ffff, WR_1,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+-{&quot;mfcr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000018, 0xfc00ffff, WR_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;mfcr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;t,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000018, 0xfc00ffff, W=
R_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mfsa&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000028, 0xffff07=
ff, WR_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EE,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;min.ob&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
X,Y,Q&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x78000006, 0xfc20003f, WR_1|RD_2|R=
D_3|FP_D,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
B1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MX,=C2=A0 =C2=A0 =C2=A00 },<br=
>
=C2=A0 {&quot;min.ob&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
D,S,Q&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x48000006, 0xfc20003f, WR_1|RD_2|R=
D_3|FP_D,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N=
54,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br=
>
-@@ -1332,10 +1338,13 @@<br>
+@@ -1441,10 +1447,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
=3D<br>
=C2=A0 /* move is at the top of the table.=C2=A0 */<br>
=C2=A0 {&quot;msgn.qh&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
X,Y,Q&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x78200000, 0xfc20003f, WR_1|RD_2|R=
D_3|FP_D,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MX,=C2=A0 =C2=A0 =C2=A00 =
},<br>
=C2=A0 {&quot;msgsnd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 (int) M_M=
SGSND,=C2=A0 =C2=A0INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
@@ -375,28 +375,28 @@ Index: binutils-2.24/opcodes/mips-opc.c<br>
=C2=A0+{&quot;msgwait&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 (int=
) M_MSGWAIT,=C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;msgwait&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 (int) M_M=
SGWAIT_T,INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;msgsync&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4a000004, 0xffffff=
ff,0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLP,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
- {&quot;msub.d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;D,R,S=
,T&quot;,=C2=A0 =C2=A0 =C2=A0 0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|F=
P_D, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I4_33,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+ {&quot;msub.d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;D,R,S=
,T&quot;,=C2=A0 =C2=A0 =C2=A0 0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|F=
P_D, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I4_33,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 I37 },<br>
=C2=A0 {&quot;msub.d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
D,S,T&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x46200019, 0xffe0003f, WR_1|RD_2|R=
D_3|FP_D,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I=
L2E,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br=
>
=C2=A0 {&quot;msub.d&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
D,S,T&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x72200019, 0xffe0003f, WR_1|RD_2|R=
D_3|FP_D,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I=
L2F,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br=
>
-@@ -1381,7 +1390,7 @@<br>
+@@ -1494,7 +1503,7 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
=C2=A0 {&quot;mtlo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;s,7&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000013, 0xfc1fe7ff, R=
D_1|WR_LO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 D32,=C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mtlo1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000013, 0xfc1fff=
ff, RD_1|WR_LO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EE,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mtlhx&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000053, 0xfc1fff=
ff, RD_1|MOD_HILO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 SMT,=C2=A0 =C2=A0 0 },<br>
--{&quot;mtcr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000019, 0xfc00ffff, RD_1,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
+-{&quot;mtcr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000019, 0xfc00ffff, RD_1|R=
D_2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;mtcr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;t,s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000019, 0xfc00ffff, R=
D_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mtm0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000008, 0xfc1fff=
ff, RD_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IOCT,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mtm1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7000000c, 0xfc1fff=
ff, RD_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IOCT,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;mtm2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;s&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7000000d, 0xfc1fff=
ff, RD_1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IOCT,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
-@@ -1802,9 +1811,9 @@<br>
- {&quot;suxc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
S,t(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x4c00000d, 0xfc0007ff, RD_1|RD_2|R=
D_3|SM|FP_D, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I5_33|N55,=
=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 0},<br>
+@@ -1924,9 +1933,9 @@ const struct mips_opcode mips_builtin_opcodes[] =3D<=
br>
+ {&quot;suxc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
S,t(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x4c00000d, 0xfc0007ff, RD_1|RD_2|R=
D_3|SM|FP_D, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I5_33|N55,=
=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 I37},<br>
=C2=A0 {&quot;sw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A00xac000000, 0xfc000000, RD_1|RD_3|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 0 },<br>
=C2=A0 {&quot;sw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A00,=C2=A0 =C2=A0 (int) M_SW_AB,=C2=A0 =C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
--{&quot;swapw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000014, 0xfc00ffff, MOD_1|=
RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0=
 =C2=A0 =C2=A0 0 },<br>
--{&quot;swapwu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000015, 0xfc00ffff, MOD_1|RD_2|=
SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
--{&quot;swapd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000016, 0xfc00ffff, MOD_1|=
RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0=
 =C2=A0 =C2=A0 0 },<br>
+-{&quot;swapw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000014, 0xfc00ffff, MOD_1|=
RD_2|LM|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
+-{&quot;swapwu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t,b&q=
uot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000015, 0xfc00ffff, MOD_1|RD_2|=
LM|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
+-{&quot;swapd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000016, 0xfc00ffff, MOD_1|=
RD_2|LM|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 XLR,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0=
 =C2=A0 0 },<br>
=C2=A0+{&quot;swapw&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000014, 0xfc00ffff, M=
OD_1|RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=
=A0 =C2=A0 0 },<br>
=C2=A0+{&quot;swapwu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000015, 0xfc00ffff, MOD_1|=
RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=C2=A0 0 },<br>
=C2=A0+{&quot;swapd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;t,b&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000016, 0xfc00ffff, M=
OD_1|RD_2|SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 XLR|XLP,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=
=A0 =C2=A0 0 },<br>
- {&quot;swc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
E,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xe0000000, 0xfc000000, RD_3|RD_C0|=
SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =
=C2=A0 =C2=A0 IOCT|IOCTP|IOCT2 },<br>
- {&quot;swc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
E,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 (int) M_SWC0_AB,=C2=
=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 IOCT|IOCTP|IOCT2 },<br>
+ {&quot;swc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
E,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xe0000000, 0xfc000000, RD_3|RD_C0|=
SM,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =
=C2=A0 =C2=A0 IOCT|IOCTP|IOCT2|I37 },<br>
+ {&quot;swc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
E,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 (int) M_SWC0_AB,=C2=
=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 IOCT|IOCTP|IOCT2|I37 },<br>
=C2=A0 {&quot;swc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;T,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xe4000000, 0xfc000000, RD_1|R=
D_3|SM|FP_S,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 =C2=A0 0 },<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.pat=
ch<br>
deleted file mode 100644<br>
index e789499..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch<=
br>
+++ /dev/null<br>
@@ -1,67 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8484 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From bd25671c6f202c4a5108883caa2adb24ff6f361f Mon Sep 17 00:00:00 2001<br>
-From: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com">amodra@gmail.com<=
/a>&gt;<br>
-Date: Fri, 29 Aug 2014 10:36:29 +0930<br>
-Subject: [PATCH] Report an error for S-records with less than the miniumum=
<br>
- size<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* srec.c (srec_scan): Revert last change.=C2=A0=
 Report an error for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0S-records with less than the miniumum byte coun=
t.<br>
----<br>
- bfd/ChangeLog |=C2=A0 5 +++++<br>
- bfd/srec.c=C2=A0 =C2=A0 | 18 +++++++++++++++---<br>
- 2 files changed, 20 insertions(+), 3 deletions(-)<br>
-<br>
-Index: binutils-2.24/bfd/srec.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/srec.c<br>
-+++ binutils-2.24/bfd/srec.c<br>
-@@ -455,7 +455,7 @@ srec_scan (bfd *abfd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_ptr pos;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char hdr[3];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int bytes;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int bytes, min_bytes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_vma address;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_byte *data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char check_sum;<br>
-@@ -478,6 +478,19 @@ srec_scan (bfd *abfd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_sum =3D bytes =3D HEX (hdr =
+ 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_bytes =3D 3;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hdr[0] =3D=3D &#39;2&#39; || hdr[0=
] =3D=3D &#39;8&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_bytes =3D 4;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (hdr[0] =3D=3D &#39;3&#39; || =
hdr[0] =3D=3D &#39;7&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_bytes =3D 5;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes &lt; min_bytes)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler) (_=
(&quot;%B:%d: byte count %d too small\n&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abfd, lineno, by=
tes);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_set_error (bfd_error=
_bad_value);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bytes * 2 &gt; bufsize)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf !=3D NULL)<=
br>
-Index: binutils-2.24/bfd/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ChangeLog<br>
-+++ binutils-2.24/bfd/ChangeLog<br>
-@@ -1,3 +1,8 @@<br>
-+2014-08-29=C2=A0 Alan Modra=C2=A0 &lt;<a href=3D"mailto:amodra@gmail.com"=
>amodra@gmail.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* srec.c (srec_scan): Revert last change.=C2=
=A0 Report an error for<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0S-records with less than the miniumum byte cou=
nt.<br>
-+<br>
- 2013-12-02=C2=A0 Tristan Gingold=C2=A0 &lt;<a href=3D"mailto:gingold@adac=
ore.com">gingold@adacore.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"http://configure.in" target=3D"_bl=
ank">configure.in</a>: Bump version to 2.24<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.pat=
ch<br>
deleted file mode 100644<br>
index ec3308b..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch<=
br>
+++ /dev/null<br>
@@ -1,102 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8485 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From 493a33860c71cac998f1a56d6d87d6faa801fbaa Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Mon, 27 Oct 2014 12:43:16 +0000<br>
-Subject: [PATCH] This patch closes a potential security hole in applicatio=
ns<br>
- that use the bfd library to parse binaries containing maliciously corrupt=
<br>
- section group headers.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17510<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf.c (setup_group): Improve handling of corr=
upt group<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sections.<br>
----<br>
- bfd/ChangeLog |=C2=A0 6 ++++++<br>
- bfd/elf.c=C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++++++++++++++++----<br>
- 2 files changed, 36 insertions(+), 4 deletions(-)<br>
-<br>
-Index: binutils-2.24/bfd/elf.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/elf.c<br>
-+++ binutils-2.24/bfd/elf.c<br>
-@@ -608,9 +608,10 @@ setup_group (bfd *abfd, Elf_Internal_Shd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (shdr-&gt=
;contents =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0_bfd_error_handler<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (_(&quot;%B: Corrupt size field in group section header: 0x%lx&quot;), =
abfd, shdr-&gt;sh_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (_(&quot;%B: corrupt size field in group section header: 0x%lx&quot;), =
abfd, shdr-&gt;sh_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bfd_set_error (bfd_error_bad_value);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- =
num_group;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
tinue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset (shdr=
-&gt;contents, 0, amt);<br>
-@@ -618,7 +619,16 @@ setup_group (bfd *abfd, Elf_Internal_Shd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bfd_seek=
 (abfd, shdr-&gt;sh_offset, SEEK_SET) !=3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|| (bfd_bread (shdr-&gt;contents, shdr-&gt;sh_size, abfd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0!=3D shdr-&gt;sh_size))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAL=
SE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _bf=
d_error_handler<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (_(&quot;%B: invalid size field in group section header: 0x%lx&quot;), =
abfd, shdr-&gt;sh_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd=
_set_error (bfd_error_bad_value);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- =
num_group;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
PR 17510: If the group contents are even partially<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0corrupt, do not allow any of the contents to be used.=C2=A0 */<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem=
set (shdr-&gt;contents, 0, amt);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
tinue;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Translate=
 raw contents, a flag word followed by an<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arra=
y of elf section indices all in target byte order,<br>
-@@ -651,6 +661,21 @@ setup_group (bfd *abfd, Elf_Internal_Shd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PR 17510: Corrupt binaries might contain i=
nvalid groups.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num_group !=3D (unsigned) elf_tdata (abfd=
)-&gt;num_group)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_tdata (abfd)-&gt;num_group =
=3D num_group;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If all groups are invalid th=
en fail.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num_group =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_tdata (abfd)-=
&gt;group_sect_ptr =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_tdata (abfd)-=
&gt;num_group =3D num_group =3D -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_hand=
ler) (_(&quot;%B: no valid group sections found&quot;), abfd);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_set_error (bf=
d_error_bad_value);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-@@ -716,6 +741,7 @@ setup_group (bfd *abfd, Elf_Internal_Shd<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(*_bfd_error_handler) (_(&quot;%B: no group inf=
o for section %A&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 abfd, newsect);<br>
-+=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0return TRUE;<br>
- }<br>
-Index: binutils-2.24/bfd/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ChangeLog<br>
-+++ binutils-2.24/bfd/ChangeLog<br>
-@@ -1,3 +1,9 @@<br>
-+2014-10-27=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17510<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf.c (setup_group): Improve handling of cor=
rupt group<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0sections.<br>
-+<br>
- 2014-08-29=C2=A0 Alan Modra=C2=A0 &lt;<a href=3D"mailto:amodra@gmail.com"=
>amodra@gmail.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * srec.c (srec_scan): Revert last change.=C2=
=A0 Report an error for<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.pat=
ch<br>
deleted file mode 100644<br>
index a48fe9b..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch<=
br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8501 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From 7e1e19887abd24aeb15066b141cdff5541e0ec8e Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Mon, 27 Oct 2014 14:45:06 +0000<br>
-Subject: [PATCH] Fix a seg-fault in strings and other binutuils when parsi=
ng a<br>
- corrupt PE executable with an invalid value in the NumberOfRvaAndSizes fi=
eld<br>
- of the AOUT header.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17512<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handle=
 corrupt binaries<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0with an invalid value for NumberOfRvaAndSizes.<=
br>
----<br>
- bfd/ChangeLog=C2=A0 |=C2=A0 4 ++++<br>
- bfd/peXXigen.c | 12 ++++++++++++<br>
- 2 files changed, 16 insertions(+)<br>
-<br>
-Index: binutils-2.24/bfd/peXXigen.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/peXXigen.c<br>
-+++ binutils-2.24/bfd/peXXigen.c<br>
-@@ -460,6 +460,18 @@ _bfd_XXi_swap_aouthdr_in (bfd * abfd,<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0int idx;<br>
-<br>
-+=C2=A0 =C2=A0 /* PR 17512: Corrupt PE binaries can cause seg-faults.=C2=
=A0 */<br>
-+=C2=A0 =C2=A0 if (a-&gt;NumberOfRvaAndSizes &gt; 16)<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (_(&quot;%B: aout header specifies an invalid=
 number of data-directory entries: %d&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abfd, a-&gt;NumberOfRvaAndSizes);<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Paranoia: If the number is corrupt, then assume t=
hat the<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0actual entries themselves might be corr=
upt as well.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 a-&gt;NumberOfRvaAndSizes =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0for (idx =3D 0; idx &lt; a-&gt;NumberOfRvaAndSizes; id=
x++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If data directory is empty, rva also =
should be 0.=C2=A0 */<br>
-Index: binutils-2.24/bfd/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ChangeLog<br>
-+++ binutils-2.24/bfd/ChangeLog<br>
-@@ -1,5 +1,9 @@<br>
- 2014-10-27=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17512<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handl=
e corrupt binaries<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0with an invalid value for NumberOfRvaAndSizes.=
<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PR binutils/17510<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * elf.c (setup_group): Improve handling of cor=
rupt group<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sections.<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.pat=
ch<br>
deleted file mode 100644<br>
index 05af65b..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch<=
br>
+++ /dev/null<br>
@@ -1,89 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8502 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From 5a4b0ccc20ba30caef53b01bee2c0aaa5b855339 Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Tue, 28 Oct 2014 15:42:56 +0000<br>
-Subject: [PATCH] More fixes for corrupt binaries crashing the binutils.<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17512<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf.c (bfd_section_from_shdr): Allocate and f=
ree the recursion<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0detection table on a per-bfd basis.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* peXXigen.c (pe_print_edata): Handle binaries =
with a truncated<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export table.<br>
----<br>
- bfd/ChangeLog=C2=A0 |=C2=A0 8 ++++++++<br>
- bfd/elf.c=C2=A0 =C2=A0 =C2=A0 | 16 +++++++++++++---<br>
- bfd/peXXigen.c |=C2=A0 9 +++++++++<br>
- 3 files changed, 30 insertions(+), 3 deletions(-)<br>
-<br>
-Index: binutils-2.24/bfd/peXXigen.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/peXXigen.c<br>
-+++ binutils-2.24/bfd/peXXigen.c<br>
-@@ -1438,6 +1438,15 @@ pe_print_edata (bfd * abfd, void * vfile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 /* PR 17512: Handle corrupt PE binaries.=C2=A0 */<br>
-+=C2=A0 if (datasize &lt; 36)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 fprintf (file,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;\nThere is an exp=
ort table in %s, but it is too small (%d)\n&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section-&gt;name, (int) d=
atasize);<br>
-+=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0fprintf (file, _(&quot;\nThere is an export table in %s at 0x=
%lx\n&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&gt;name, (unsigned long) addr)=
;<br>
-<br>
-Index: binutils-2.24/bfd/elf.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/elf.c<br>
-+++ binutils-2.24/bfd/elf.c<br>
-@@ -1576,6 +1576,7 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0const char *name;<br>
-=C2=A0 =C2=A0bfd_boolean ret =3D TRUE;<br>
-=C2=A0 =C2=A0static bfd_boolean * sections_being_created =3D NULL;<br>
-+=C2=A0 static bfd * sections_being_created_abfd =3D NULL;<br>
-=C2=A0 =C2=A0static unsigned int nesting =3D 0;<br>
-<br>
-=C2=A0 =C2=A0if (shindex &gt;=3D elf_numsections (abfd))<br>
-@@ -1588,13 +1589,20 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 loop.=C2=A0 Detect this here, by refusing to l=
oad a section that we are<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 already in the process of loading.=C2=A0 We on=
ly trigger this test if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 we have nested at least three sections deep as=
 normal ELF binaries<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0can expect to recurse at least once.=C2=A0 */<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0can expect to recurse at least once.<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0FIXME: It would be better if this array was attached =
to the bfd,<br>
-+=C2=A0 =C2=A0 =C2=A0rather than being held in a static pointer.=C2=A0 */<=
br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sections_being_created_abfd !=3D abfd)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sections_being_created =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sections_being_created =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: It would be more efficient to =
attach this array to the bfd somehow.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sections_being_created =3D (bfd_boolean =
*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_zalloc (abfd, elf_numsections=
 (abfd) * sizeof (bfd_boolean));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sections_being_created_abfd =3D abfd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sections_being_created [shindex])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -2098,7 +2106,10 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0if (sections_being_created)<br>
-=C2=A0 =C2=A0 =C2=A0sections_being_created [shindex] =3D FALSE;<br>
-=C2=A0 =C2=A0if (-- nesting =3D=3D 0)<br>
-+=C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0sections_being_created =3D NULL;<br>
-+=C2=A0 =C2=A0 sections_being_created_abfd =3D abfd;<br>
-+=C2=A0 }<br>
-=C2=A0 =C2=A0return ret;<br>
- }<br>
-<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502=
_1.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1=
.patch<br>
deleted file mode 100644<br>
index 9e0c9c8..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patc=
h<br>
+++ /dev/null<br>
@@ -1,523 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8502 supporting patch.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From bf67003b4567600ed3022a439207ac8f26454f91 Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Mon, 27 Oct 2014 18:05:37 +0000<br>
-Subject: [PATCH] This fixes more seg-faults in tools like &quot;strings&qu=
ot; and<br>
- &quot;objdump&quot; when presented with corrupt binaries.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17512<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf.c (bfd_section_from_shdr): Detect and war=
n about ELF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0binaries with a group of sections linked by the=
 string table<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0indicies.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* peXXigen.c (pe_print_edata): Detect out of ra=
nge rvas and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0entry counts for the Export Address table, Name=
 Pointer table<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 and Ordinal table.<br>
----<br>
- bfd/ChangeLog=C2=A0 |=C2=A0 =C2=A05 ++<br>
- bfd/elf.c=C2=A0 =C2=A0 =C2=A0 | 194 +++++++++++++++++++++++++++++++++++++=
+-------------------<br>
- bfd/peXXigen.c |=C2=A0 18 +++++-<br>
- 3 files changed, 150 insertions(+), 67 deletions(-)<br>
-<br>
-Index: binutils-2.24/bfd/elf.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/elf.c<br>
-+++ binutils-2.24/bfd/elf.c<br>
-@@ -1574,38 +1574,67 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0Elf_Internal_Ehdr *ehdr;<br>
-=C2=A0 =C2=A0const struct elf_backend_data *bed;<br>
-=C2=A0 =C2=A0const char *name;<br>
-+=C2=A0 bfd_boolean ret =3D TRUE;<br>
-+=C2=A0 static bfd_boolean * sections_being_created =3D NULL;<br>
-+=C2=A0 static unsigned int nesting =3D 0;<br>
-<br>
-=C2=A0 =C2=A0if (shindex &gt;=3D elf_numsections (abfd))<br>
-=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
-<br>
-+=C2=A0 if (++ nesting &gt; 3)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 /* PR17512: A corrupt ELF binary might contain a rec=
ursive group of<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0sections, each the string indicies pointing to=
 the next in the<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0loop.=C2=A0 Detect this here, by refusing to l=
oad a section that we are<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0already in the process of loading.=C2=A0 We on=
ly trigger this test if<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0we have nested at least three sections deep as=
 normal ELF binaries<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0can expect to recurse at least once.=C2=A0 */<=
br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sections_being_created =3D=3D NULL)<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: It would be more efficient to attac=
h this array to the bfd somehow.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sections_being_created =3D (bfd_boolean *)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_zalloc (abfd, elf_numsections (abf=
d) * sizeof (bfd_boolean));<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sections_being_created [shindex])<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_(&quot;%B: warning: loop in section =
dependencies detected&quot;), abfd);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 sections_being_created [shindex] =3D TRUE;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0hdr =3D elf_elfsections (abfd)[shindex];<br>
-=C2=A0 =C2=A0ehdr =3D elf_elfheader (abfd);<br>
-=C2=A0 =C2=A0name =3D bfd_elf_string_from_elf_section (abfd, ehdr-&gt;e_sh=
strndx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hd=
r-&gt;sh_name);<br>
-=C2=A0 =C2=A0if (name =3D=3D NULL)<br>
--=C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 goto fail;<br>
-<br>
-=C2=A0 =C2=A0bed =3D get_elf_backend_data (abfd);<br>
-=C2=A0 =C2=A0switch (hdr-&gt;sh_type)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_NULL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Inactive section. Throw it away.=C2=A0 */<br=
>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
--=C2=A0 =C2=A0 case SHT_PROGBITS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Normal sec=
tion with contents.=C2=A0 */<br>
--=C2=A0 =C2=A0 case SHT_NOBITS:=C2=A0 /* .bss section.=C2=A0 */<br>
--=C2=A0 =C2=A0 case SHT_HASH:=C2=A0 =C2=A0 /* .hash section.=C2=A0 */<br>
--=C2=A0 =C2=A0 case SHT_NOTE:=C2=A0 =C2=A0 /* .note section.=C2=A0 */<br>
-+=C2=A0 =C2=A0 case SHT_PROGBITS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Normal section with contents.=C2=A0 */<br>
-+=C2=A0 =C2=A0 case SHT_NOBITS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* .bss =
section.=C2=A0 */<br>
-+=C2=A0 =C2=A0 case SHT_HASH:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
.hash section.=C2=A0 */<br>
-+=C2=A0 =C2=A0 case SHT_NOTE:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
.note section.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_INIT_ARRAY:=C2=A0 =C2=A0 =C2=A0 /* .init_arra=
y section.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_FINI_ARRAY:=C2=A0 =C2=A0 =C2=A0 /* .fini_arra=
y section.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_PREINIT_ARRAY:=C2=A0 =C2=A0/* .preinit_array =
section.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_GNU_LIBLIST:=C2=A0 =C2=A0 =C2=A0/* .gnu.libli=
st section.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_GNU_HASH:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* .gnu.hash section.=C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd, hdr, n=
ame, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd, hdr, =
name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_DYNAMIC: /* Dynamic linking information.=C2=
=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! _bfd_elf_make_section_from_shdr (abfd, hd=
r, name, shindex))<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_link &gt; elf_numsections (abfd)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PR 10478: Accept Solaris binaries wit=
h a sh_link<br>
-@@ -1619,11 +1648,11 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Otherwise fall through.=
=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (elf_elfsections (abfd)[hdr-&gt;sh_link=
] =3D=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (elf_elfsections (abfd)[hdr-&gt;sh_link=
]-&gt;sh_type !=3D SHT_STRTAB)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Elf_Internal_Shdr *dynsymhdr;<br>
-@@ -1652,24 +1681,26 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
--=C2=A0 =C2=A0 case SHT_SYMTAB:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A sym=
bol table */<br>
-+=C2=A0 =C2=A0 case SHT_SYMTAB:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A sym=
bol table.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_onesymtab (abfd) =3D=3D shindex)<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_entsize !=3D bed-&gt;s-&gt;sizeo=
f_sym)<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_info * hdr-&gt;sh_entsize &gt; h=
dr-&gt;sh_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_size !=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Some assemblers erroneously set sh_in=
fo to one with a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zero sh_size.=C2=A0 ld sees this=
 as a global symbol count<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of (unsigned) -1.=C2=A0 Fix it h=
ere.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdr-&gt;sh_info =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BFD_ASSERT (elf_onesymtab (abfd) =3D=3D 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_onesymtab (abfd) =3D shindex;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;symtab_hdr =3D *hdr;<br>
-@@ -1686,7 +1717,7 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (abfd-&gt;flags &amp; DYNAMIC=
) !=3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ! _bfd_elf_make_section_from_=
shdr (abfd, hdr, name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0shindex))<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Go looking for SHT_SYMTAB_SHNDX too, since i=
f there is one we<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 can&#39;t read symbols without that section lo=
aded as well.=C2=A0 It<br>
-@@ -1712,26 +1743,29 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i !=3D shindex)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bfd_section_from_shdr (abfd, i)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bfd_section_from_shdr (abfd, i=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
--=C2=A0 =C2=A0 case SHT_DYNSYM:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A dyn=
amic symbol table */<br>
-+=C2=A0 =C2=A0 case SHT_DYNSYM:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A dyn=
amic symbol table.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_dynsymtab (abfd) =3D=3D shindex)<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_entsize !=3D bed-&gt;s-&gt;sizeo=
f_sym)<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_info * hdr-&gt;sh_entsize &gt; h=
dr-&gt;sh_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_size !=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Some linkers erroneously set sh_info =
to one with a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zero sh_size.=C2=A0 ld sees this=
 as a global symbol count<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of (unsigned) -1.=C2=A0 Fix it h=
ere.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdr-&gt;sh_info =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BFD_ASSERT (elf_dynsymtab (abfd) =3D=3D 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_dynsymtab (abfd) =3D shindex;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;dynsymtab_hdr =3D *hdr;<br=
>
-@@ -1740,34 +1774,38 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Besides being a symbol table, we also treat =
this as a regular<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section, so that objcopy can handle it.=C2=A0 =
*/<br>
--=C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd, hdr, n=
ame, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd, hdr, =
name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
--=C2=A0 =C2=A0 case SHT_SYMTAB_SHNDX:=C2=A0 =C2=A0 /* Symbol section indic=
es when &gt;64k sections */<br>
-+=C2=A0 =C2=A0 case SHT_SYMTAB_SHNDX:=C2=A0 =C2=A0 /* Symbol section indic=
es when &gt;64k sections.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_symtab_shndx (abfd) =3D=3D shindex)<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BFD_ASSERT (elf_symtab_shndx (abfd) =3D=3D 0);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_symtab_shndx (abfd) =3D shindex;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;symtab_shndx_hdr =3D *hdr;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_elfsections (abfd)[shindex] =3D &amp;elf_td=
ata (abfd)-&gt;symtab_shndx_hdr;<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
--=C2=A0 =C2=A0 case SHT_STRTAB:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A str=
ing table */<br>
-+=C2=A0 =C2=A0 case SHT_STRTAB:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A str=
ing table.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;bfd_section !=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ehdr-&gt;e_shstrndx =3D=3D shindex)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;shstrtab_hdr =3D *h=
dr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_elfsections (abfd)[shindex] =3D &amp=
;elf_tdata (abfd)-&gt;shstrtab_hdr;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_elfsections (abfd)[elf_onesymtab (abfd)=
]-&gt;sh_link =3D=3D shindex)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0symtab_strtab:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;strtab_hdr =3D *hdr=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_elfsections (abfd)[shindex] =3D &amp=
;elf_tdata (abfd)-&gt;strtab_hdr;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_elfsections (abfd)[elf_dynsymtab (abfd)=
]-&gt;sh_link =3D=3D shindex)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dynsymtab_strtab:<br>
-@@ -1776,8 +1814,9 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_elfsections (abfd)[shindex] =3D hdr;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We also treat this as a regular secti=
on, so that objcopy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 can handle it.=C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd,=
 hdr, name,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd=
, hdr, name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the string table isn&#39;t one of the abo=
ve, then treat it as a<br>
-@@ -1795,9 +1834,9 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Prevent e=
ndless recursion on broken objects.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D=
 shindex)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAL=
SE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! bfd_se=
ction_from_shdr (abfd, i))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAL=
SE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_ones=
ymtab (abfd) =3D=3D i)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto =
symtab_strtab;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (elf_dyns=
ymtab (abfd) =3D=3D i)<br>
-@@ -1805,7 +1844,8 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd, hdr, n=
ame, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd, hdr, =
name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_REL:<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_RELA:<br>
-@@ -1820,7 +1860,7 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_entsize<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D (bfd_size_type) (hdr-&gt;sh_=
type =3D=3D SHT_REL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? bed-&gt;s-&gt;sizeof_rel : bed-&gt;=
s-&gt;sizeof_rela))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check for a bogus link to avoid crashing.=C2=
=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_link &gt;=3D num_sec)<br>
-@@ -1828,8 +1868,9 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((*_bfd_error_handler)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_(&quot;%B: invalid link %lu fo=
r reloc section %s (index %u)&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abfd, hdr-&gt;sh_link, nam=
e, shindex));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr=
 (abfd, hdr, name,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shd=
r (abfd, hdr, name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* For some incomprehensible reason Oracle dist=
ributes<br>
-@@ -1870,7 +1911,7 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((elf_elfsections (abfd)[hdr-&gt;sh_link]-&g=
t;sh_type =3D=3D SHT_SYMTAB<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || elf_elfsections (abfd)[hdr-&g=
t;sh_link]-&gt;sh_type =3D=3D SHT_DYNSYM)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ! bfd_section_from_shd=
r (abfd, hdr-&gt;sh_link))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this reloc section does not use the main =
symbol table we<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 don&#39;t treat it as a reloc section.=
=C2=A0 BFD can&#39;t adequately<br>
-@@ -1885,14 +1926,18 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| hdr-&gt;sh_info &gt;=3D num_se=
c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| elf_elfsections (abfd)[hdr-&gt=
;sh_info]-&gt;sh_type =3D=3D SHT_REL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| elf_elfsections (abfd)[hdr-&gt=
;sh_info]-&gt;sh_type =3D=3D SHT_RELA)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd,=
 hdr, name,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shd=
r (abfd, hdr, name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! bfd_section_from_shdr (abfd, hdr-&gt;sh_i=
nfo))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0target_sect =3D bfd_section_from_elf_index (abf=
d, hdr-&gt;sh_info);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (target_sect =3D=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0esdt =3D elf_section_data (target_sect);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_type =3D=3D SHT_RELA)<br>
-@@ -1904,7 +1949,7 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0amt =3D sizeof (*hdr2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdr2 =3D (Elf_Internal_Shdr *) bfd_alloc (abfd,=
 amt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr2 =3D=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*hdr2 =3D *hdr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*p_hdr =3D hdr2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_elfsections (abfd)[shindex] =3D hdr2;<br>
-@@ -1920,34 +1965,40 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_sect-&gt;use_rela_p=
 =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0abfd-&gt;flags |=3D HAS_RELOC;<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_GNU_verdef:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_dynverdef (abfd) =3D shindex;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;dynverdef_hdr =3D *hdr;<br=
>
--=C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd, hdr, n=
ame, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd, hdr, =
name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_GNU_versym:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_entsize !=3D sizeof (Elf_Externa=
l_Versym))<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_dynversym (abfd) =3D shindex;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;dynversym_hdr =3D *hdr;<br=
>
--=C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd, hdr, n=
ame, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd, hdr, =
name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_GNU_verneed:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_dynverref (abfd) =3D shindex;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_tdata (abfd)-&gt;dynverref_hdr =3D *hdr;<br=
>
--=C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr (abfd, hdr, n=
ame, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_from_shdr (abfd, hdr, =
name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_SHLIB:<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0case SHT_GROUP:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! IS_VALID_GROUP_SECTION_HEADER (hdr, GRP_E=
NTRY_SIZE))<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!_bfd_elf_make_section_from_shdr (abfd, hdr=
, name, shindex))<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;contents !=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Elf_Internal_Group *idx =3D (Elf_Interna=
l_Group *) hdr-&gt;contents;<br>
-@@ -1973,7 +2024,7 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Possibly an attributes section.=C2=A0 */<br>
-@@ -1981,14 +2032,14 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| hdr-&gt;sh_type =3D=3D bed-&gt;obj_at=
trs_section_type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! _bfd_elf_make_section_from_shdr (a=
bfd, hdr, name, shindex))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_bfd_elf_parse_attributes (abfd, hdr);<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check for any processor-specific section typ=
es.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bed-&gt;elf_backend_section_from_shdr (abfd=
, hdr, name, shindex))<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto success;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;sh_type &gt;=3D SHT_LOUSER &amp;&am=
p; hdr-&gt;sh_type &lt;=3D SHT_HIUSER)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -2000,9 +2051,12 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;specific sec=
tion `%s&#39; [0x%8x]&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abfd, name, hdr-&gt;sh_ty=
pe);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allow sections reserved for applica=
tions.=C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr=
 (abfd, hdr, name,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allow sections reserved for =
applications.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_f=
rom_shdr (abfd, hdr, name,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (hdr-&gt;sh_type &gt;=3D SHT_LOPROC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; hdr-&gt;sh_typ=
e &lt;=3D SHT_HIPROC)<br>
-@@ -2023,8 +2077,11 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`%s&#39; [0x=
%8x]&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abfd, name, hdr-&gt;sh_ty=
pe);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Otherwise it should be processed.=
=C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return _bfd_elf_make_section_from_shdr=
 (abfd, hdr, name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Otherwise it should be proce=
ssed.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D _bfd_elf_make_section_f=
rom_shdr (abfd, hdr, name, shindex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: We should handle this section.=C2=A0 =
*/<br>
-@@ -2032,10 +2089,17 @@ bfd_section_from_shdr (bfd *abfd, unsign<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_(&quot;%B: don&#39;t know how to handl=
e section `%s&#39; [0x%8x]&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abfd, name, hdr-&gt;sh_type);<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 return TRUE;<br>
-+ fail:<br>
-+=C2=A0 ret =3D FALSE;<br>
-+ success:<br>
-+=C2=A0 if (sections_being_created)<br>
-+=C2=A0 =C2=A0 sections_being_created [shindex] =3D FALSE;<br>
-+=C2=A0 if (-- nesting =3D=3D 0)<br>
-+=C2=A0 =C2=A0 sections_being_created =3D NULL;<br>
-+=C2=A0 return ret;<br>
- }<br>
-<br>
- /* Return the local symbol specified by ABFD, R_SYMNDX.=C2=A0 */<br>
-Index: binutils-2.24/bfd/peXXigen.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/peXXigen.c<br>
-+++ binutils-2.24/bfd/peXXigen.c<br>
-@@ -1528,7 +1528,12 @@ pe_print_edata (bfd * abfd, void * vfile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_(&quot;\nExport Address Table -- Ordina=
l Base %ld\n&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edt.base);<br>
-<br>
--=C2=A0 for (i =3D 0; i &lt; edt.num_functions; ++i)<br>
-+=C2=A0 /* PR 17512: Handle corrupt PE binaries.=C2=A0 */<br>
-+=C2=A0 if (edt.eat_addr + (edt.num_functions * 4) - adj &gt;=3D datasize)=
<br>
-+=C2=A0 =C2=A0 fprintf (file, _(&quot;\tInvalid Export Address Table rva (=
0x%lx) or entry count (0x%lx)\n&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long) edt.eat_addr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long) edt.num_functions);<br>
-+=C2=A0 else for (i =3D 0; i &lt; edt.num_functions; ++i)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_vma eat_member =3D bfd_get_32 (abfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data + edt.eat_=
addr + (i * 4) - adj);<br>
-@@ -1564,7 +1569,16 @@ pe_print_edata (bfd * abfd, void * vfile<br>
-=C2=A0 =C2=A0fprintf (file,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _(&quot;\n[Ordinal/Name Pointer] Table\=
n&quot;));<br>
-<br>
--=C2=A0 for (i =3D 0; i &lt; edt.num_names; ++i)<br>
-+=C2=A0 /* PR 17512: Handle corrupt PE binaries.=C2=A0 */<br>
-+=C2=A0 if (edt.npt_addr + (edt.num_names * 4) - adj &gt;=3D datasize)<br>
-+=C2=A0 =C2=A0 fprintf (file, _(&quot;\tInvalid Name Pointer Table rva (0x=
%lx) or entry count (0x%lx)\n&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long) edt.npt_addr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long) edt.num_names);<br>
-+=C2=A0 else if (edt.ot_addr + (edt.num_names * 2) - adj &gt;=3D datasize)=
<br>
-+=C2=A0 =C2=A0 fprintf (file, _(&quot;\tInvalid Ordinal Table rva (0x%lx) =
or entry count (0x%lx)\n&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long) edt.ot_addr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long) edt.num_names);<br>
-+=C2=A0 else for (i =3D 0; i &lt; edt.num_names; ++i)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_vma name_ptr =3D bfd_get_32 (abfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data +<br>
-Index: binutils-2.24/bfd/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ChangeLog<br>
-+++ binutils-2.24/bfd/ChangeLog<br>
-@@ -1,8 +1,13 @@<br>
- 2014-10-27=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PR binutils/17512<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf.c (bfd_section_from_shdr): Detect and wa=
rn about ELF<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0binaries with a group of sections linked by th=
e string table<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0indicies.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * peXXigen.c (_bfd_XXi_swap_aouthdr_in): Handl=
e corrupt binaries<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with an invalid value for NumberOfRvaAndSizes.=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0(pe_print_edata): Detect out of range rvas and=
 entry counts for<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0the Export Address table, Name Pointer table a=
nd Ordinal table.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PR binutils/17510<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * elf.c (setup_group): Improve handling of cor=
rupt group<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.pat=
ch<br>
deleted file mode 100644<br>
index 2dd3354..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch<=
br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8503 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From 0102ea8cec5fc509bba6c91df61b7ce23a799d32 Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Thu, 30 Oct 2014 17:16:17 +0000<br>
-Subject: [PATCH] Fixes a seg-fault in the ihex parser when it encounters a=
<br>
- malformed ihex file.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17512<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ihex.c (ihex_scan): Fix typo in invocation of=
 ihex_bad_byte.<br>
----<br>
- bfd/ChangeLog | 1 +<br>
- bfd/ihex.c=C2=A0 =C2=A0 | 2 +-<br>
- 2 files changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-Index: binutils-2.24/bfd/ihex.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ihex.c<br>
-+++ binutils-2.24/bfd/ihex.c<br>
-@@ -322,7 +322,7 @@ ihex_scan (bfd *abfd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! ISHEX (buf[i]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ihex_bad_byte (ab=
fd, lineno, hdr[i], error);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ihex_bad_byte (ab=
fd, lineno, buf[i], error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_r=
eturn;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-Index: binutils-2.24/bfd/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ChangeLog<br>
-+++ binutils-2.24/bfd/ChangeLog<br>
-@@ -1,3 +1,8 @@<br>
-+2014-10-30=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 PR binutils/17512<br>
-+=C2=A0 =C2=A0 * ihex.c (ihex_scan): Fix typo in invocation of ihex_bad_by=
te.<br>
-+<br>
- 2014-10-27=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PR binutils/17512<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.pat=
ch<br>
deleted file mode 100644<br>
index b4d1d1f..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch<=
br>
+++ /dev/null<br>
@@ -1,75 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8504 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From 708d7d0d11f0f2d776171979aa3479e8e12a38a0 Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Tue, 28 Oct 2014 10:48:14 +0000<br>
-Subject: [PATCH] This patch fixes a flaw in the SREC parser which could ca=
use<br>
- a stack overflow and potential secuiryt breach.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17510<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* srec.c (srec_bad_byte): Increase size of buf =
to allow for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0negative values.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(srec_scan): Use an unsigned char buffer to hol=
d header bytes.<br>
----<br>
- bfd/ChangeLog=C2=A0 | 8 ++++++++<br>
- bfd/elf.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- bfd/peXXigen.c | 1 -<br>
- bfd/srec.c=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
- 4 files changed, 11 insertions(+), 4 deletions(-)<br>
-<br>
-Index: binutils-2.24/bfd/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/ChangeLog<br>
-+++ binutils-2.24/bfd/ChangeLog<br>
-@@ -1,3 +1,11 @@<br>
-+2014-10-28=C2=A0 Andreas Schwab=C2=A0 &lt;<a href=3D"mailto:schwab@suse.d=
e">schwab@suse.de</a>&gt;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc=
@redhat.com">nickc@redhat.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0PR binutils/17510<br>
-+=C2=A0 =C2=A0* srec.c (srec_bad_byte): Increase size of buf to allow for<=
br>
-+=C2=A0 =C2=A0negative values.<br>
-+=C2=A0 =C2=A0(srec_scan): Use an unsigned char buffer to hold header byte=
s.<br>
-+<br>
- 2014-10-30=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0PR binutils/17512<br>
-Index: binutils-2.24/bfd/peXXigen.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/peXXigen.c<br>
-+++ binutils-2.24/bfd/peXXigen.c<br>
-@@ -471,7 +471,6 @@ _bfd_XXi_swap_aouthdr_in (bfd * abfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0a-&gt;NumberOfRvaAndSizes =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0for (idx =3D 0; idx &lt; a-&gt;NumberOfRvaAndSizes; id=
x++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If data directory is empty, rva also =
should be 0.=C2=A0 */<br>
-Index: binutils-2.24/bfd/srec.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/srec.c<br>
-+++ binutils-2.24/bfd/srec.c<br>
-@@ -248,7 +248,7 @@ srec_bad_byte (bfd *abfd,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 char buf[10];<br>
-+=C2=A0 =C2=A0 =C2=A0 char buf[40];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (! ISPRINT (c))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf (buf, &quot;\\%03o&quot;, (unsigned int=
) c);<br>
-@@ -454,7 +454,7 @@ srec_scan (bfd *abfd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;S&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_ptr pos;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char hdr[3];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char hdr[3];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int bytes, min_bytes;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_vma address;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_byte *data;<br>
diff --git a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737=
.patch b/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.pat=
ch<br>
deleted file mode 100644<br>
index 4a84562..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch<=
br>
+++ /dev/null<br>
@@ -1,177 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-CVE-2014-8737 fix.<br>
-<br>
-[YOCTO #7084]<br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt;<br>
-<br>
-From dd9b91de2149ee81d47f708e7b0bbf57da10ad42 Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Thu, 6 Nov 2014 14:49:10 +0000<br>
-Subject: [PATCH] Prevent archive memebers with illegal pathnames from bein=
g<br>
- extracted from an archive.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17552, binutils/17533<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* bucomm.c (is_valid_archive_path): New functio=
n.=C2=A0 Returns false<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for absolute pathnames and pathnames that inclu=
de /../.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* bucomm.h (is_valid_archive_path): Add prototy=
pe.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ar.c (extract_file): Use new function to chec=
k for valid<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathnames when extracting files from an archive=
.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* objcopy.c (copy_archive): Likewise.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/binutils.texi: Update documentation to me=
ntion the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0limitation on pathname of archive members.<br>
----<br>
- binutils/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++++++++++++--=
<br>
- binutils/ar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +=
++++++++<br>
- binutils/bucomm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++=
++++++++++<br>
- binutils/bucomm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++++----<br>
- binutils/doc/binutils.texi |=C2=A0 3 ++-<br>
- binutils/objcopy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
- 6 files changed, 65 insertions(+), 7 deletions(-)<br>
-<br>
-Index: binutils-2.24/binutils/ar.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/ar.c<br>
-+++ binutils-2.24/binutils/ar.c<br>
-@@ -1031,6 +1031,15 @@ extract_file (bfd *abfd)<br>
-=C2=A0 =C2=A0bfd_size_type size;<br>
-=C2=A0 =C2=A0struct stat buf;<br>
-<br>
-+=C2=A0 /* PR binutils/17533: Do not allow directory traversal<br>
-+=C2=A0 =C2=A0 =C2=A0outside of the current directory tree.=C2=A0 */<br>
-+=C2=A0 if (! is_valid_archive_path (bfd_get_filename (abfd)))<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 non_fatal (_(&quot;illegal pathname found in archive=
 member: %s&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_get_filename (=
abfd));<br>
-+=C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0if (bfd_stat_arch_elt (abfd, &amp;buf) !=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0/* xgettext:c-format */<br>
-=C2=A0 =C2=A0 =C2=A0fatal (_(&quot;internal stat error on %s&quot;), bfd_g=
et_filename (abfd));<br>
-Index: binutils-2.24/binutils/bucomm.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/bucomm.c<br>
-+++ binutils-2.24/binutils/bucomm.c<br>
-@@ -624,3 +624,29 @@ bfd_get_archive_filename (const bfd *abf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_get_filename (abfd));<br>
-=C2=A0 =C2=A0return buf;<br>
- }<br>
-+<br>
-+/* Returns TRUE iff PATHNAME, a filename of an archive member,<br>
-+=C2=A0 =C2=A0is valid for writing.=C2=A0 For security reasons absolute pa=
ths<br>
-+=C2=A0 =C2=A0and paths containing /../ are not allowed.=C2=A0 See PR 1753=
3.=C2=A0 */<br>
-+<br>
-+bfd_boolean<br>
-+is_valid_archive_path (char const * pathname)<br>
-+{<br>
-+=C2=A0 const char * n =3D pathname;<br>
-+<br>
-+=C2=A0 if (IS_ABSOLUTE_PATH (n))<br>
-+=C2=A0 =C2=A0 return FALSE;<br>
-+<br>
-+=C2=A0 while (*n)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (*n =3D=3D &#39;.&#39; &amp;&amp; *++n =3D=3D &#3=
9;.&#39; &amp;&amp; ( ! *++n || IS_DIR_SEPARATOR (*n)))<br>
-+=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 while (*n &amp;&amp; ! IS_DIR_SEPARATOR (*n))<br>
-+=C2=A0 =C2=A0 =C2=A0 n++;<br>
-+=C2=A0 =C2=A0 =C2=A0 while (IS_DIR_SEPARATOR (*n))<br>
-+=C2=A0 =C2=A0 =C2=A0 n++;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 return TRUE;<br>
-+}<br>
-Index: binutils-2.24/binutils/bucomm.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/bucomm.h<br>
-+++ binutils-2.24/binutils/bucomm.h<br>
-@@ -23,6 +23,8 @@<br>
- #ifndef _BUCOMM_H<br>
- #define _BUCOMM_H<br>
-<br>
-+/* In bucomm.c.=C2=A0 */<br>
-+<br>
- /* Return the filename in a static buffer.=C2=A0 */<br>
- const char *bfd_get_archive_filename (const bfd *);<br>
-<br>
-@@ -58,20 +60,22 @@ bfd_vma parse_vma (const char *, const c<br>
-<br>
- off_t get_file_size (const char *);<br>
-<br>
-+bfd_boolean is_valid_archive_path (char const *);<br>
-+<br>
- extern char *program_name;<br>
-<br>
--/* filemode.c */<br>
-+/* In filemode.c.=C2=A0 */<br>
- void mode_string (unsigned long, char *);<br>
-<br>
--/* version.c */<br>
-+/* In version.c.=C2=A0 */<br>
- extern void print_version (const char *);<br>
-<br>
--/* rename.c */<br>
-+/* In rename.c.=C2=A0 */<br>
- extern void set_times (const char *, const struct stat *);<br>
-<br>
- extern int smart_rename (const char *, const char *, int);<br>
-<br>
--/* libiberty.=C2=A0 */<br>
-+/* In libiberty.=C2=A0 */<br>
- void *xmalloc (size_t);<br>
-<br>
- void *xrealloc (void *, size_t);<br>
-Index: binutils-2.24/binutils/doc/binutils.texi<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/doc/binutils.texi<br>
-+++ binutils-2.24/binutils/doc/binutils.texi<br>
-@@ -234,7 +234,8 @@ a normal archive.=C2=A0 Instead the elements<br>
- individually to the second archive.<br>
-<br>
- The paths to the elements of the archive are stored relative to the<br>
--archive itself.<br>
-+archive itself.=C2=A0 For security reasons absolute paths and paths with =
a<br>
-+@code{/../} component are not allowed.<br>
-<br>
- @cindex compatibility, @command{ar}<br>
- @cindex @command{ar} compatibility<br>
-Index: binutils-2.24/binutils/objcopy.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/objcopy.c<br>
-+++ binutils-2.24/binutils/objcopy.c<br>
-@@ -2206,6 +2206,12 @@ copy_archive (bfd *ibfd, bfd *obfd, cons<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_boolean del =3D TRUE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_boolean ok_object;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 /* PR binutils/17533: Do not allow directory travers=
al<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0outside of the current directory tree by archi=
ve members.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 if (! is_valid_archive_path (bfd_get_filename (this_=
element)))<br>
-+=C2=A0 =C2=A0 =C2=A0 fatal (_(&quot;illegal pathname found in archive mem=
ber: %s&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_get_filename (this_el=
ement));<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Create an output file for this member.=C2=A0=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0output_name =3D concat (dir, &quot;/&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bfd_get_filename (this_element), (char *) 0);<br>
-Index: binutils-2.24/binutils/ChangeLog<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/binutils/ChangeLog<br>
-+++ binutils-2.24/binutils/ChangeLog<br>
-@@ -1,3 +1,15 @@<br>
-+2014-11-06=C2=A0 Nick Clifton=C2=A0 &lt;<a href=3D"mailto:nickc@redhat.co=
m">nickc@redhat.com</a>&gt;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR binutils/17552, binutils/17533<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* bucomm.c (is_valid_archive_path): New functi=
on.=C2=A0 Returns false<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0for absolute pathnames and pathnames that incl=
ude /../.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* bucomm.h (is_valid_archive_path): Add protot=
ype.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* ar.c (extract_file): Use new function to che=
ck for valid<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0pathnames when extracting files from an archiv=
e.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* objcopy.c (copy_archive): Likewise.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/binutils.texi: Update documentation to m=
ention the<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0limitation on pathname of archive members.<br>
-+<br>
- 2013-11-22=C2=A0 Cory Fields=C2=A0 &lt;<a href=3D"mailto:cory@coryfields.=
com">cory@coryfields.com</a>&gt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* windres.c (define_resource): Use zero for tim=
estamp, making<br>
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch b/me=
ta/recipes-devtools/binutils/binutils/fix-pr15815.patch<br>
deleted file mode 100644<br>
index 9f53f41..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-This patch fixes the problem where libiberty is not installed in spite of<=
br>
-asking it via --enable-install-libiberty, the problem is that target_heade=
r_dir<br>
-is reset explicitly which means libiberty.a will never get installed<br>
-<br>
-also check<br>
-<br>
-<a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D15815" target=
=3D"_blank">https://sourceware.org/bugzilla/show_bug.cgi?id=3D15815</a><br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
-Index: binutils-2.24/libiberty/configure<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/libiberty/configure=C2=A0 =C2=A0 =C2=A02013-12-16 0=
0:08:09.280103157 -0800<br>
-+++ binutils-2.24/libiberty/configure=C2=A0 2013-12-16 00:08:29.753436339 =
-0800<br>
-@@ -5507,7 +5507,6 @@<br>
-<br>
- setobjs=3D<br>
- CHECK=3D<br>
--target_header_dir=3D<br>
- if test -n &quot;${with_target_subdir}&quot;; then<br>
-<br>
-=C2=A0 =C2=A0# We are being configured as a target library.=C2=A0 AC_REPLA=
CE_FUNCS<br>
-Index: binutils-2.24/libiberty/<a href=3D"http://configure.ac" target=3D"_=
blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/libiberty/<a href=3D"http://configure.ac" target=3D=
"_blank">configure.ac</a>=C2=A0 2013-11-08 02:13:49.000000000 -0800<br>
-+++ binutils-2.24/libiberty/<a href=3D"http://configure.ac" target=3D"_bla=
nk">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02013-12-16 00:07:45.13343667=
2 -0800<br>
-@@ -405,7 +405,6 @@<br>
-<br>
- setobjs=3D<br>
- CHECK=3D<br>
--target_header_dir=3D<br>
- if test -n &quot;${with_target_subdir}&quot;; then<br>
-<br>
-=C2=A0 =C2=A0# We are being configured as a target library.=C2=A0 AC_REPLA=
CE_FUNCS<br>
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch b/me=
ta/recipes-devtools/binutils/binutils/fix-pr16428.patch<br>
deleted file mode 100644<br>
index 4584748..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/fix-pr16428.patch<br>
+++ /dev/null<br>
@@ -1,123 +0,0 @@<br>
-commit 4199e3b8669d0a36448687850374fdc2ad7240b6<br>
-Author: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com">amodra@gmail.co=
m</a>&gt;<br>
-Date:=C2=A0 =C2=A0Wed Jan 15 21:50:55 2014 +1030<br>
-<br>
-=C2=A0 =C2=A0 non-PIC references to __ehdr_start in pie and shared<br>
-<br>
-=C2=A0 =C2=A0 Rather than hacking every backend to not discard dynamic rel=
ocations<br>
-=C2=A0 =C2=A0 against an undefined hidden __ehdr_start, make it appear to =
be defined<br>
-=C2=A0 =C2=A0 early.=C2=A0 We want __ehdr_start hidden before size_dynamic=
_sections so<br>
-=C2=A0 =C2=A0 that it isn&#39;t put in .dynsym, but we do need the dynamic=
 relocations<br>
-=C2=A0 =C2=A0 for a PIE or shared library with a non-PIC reference.=C2=A0 =
Defining it<br>
-=C2=A0 =C2=A0 early is wrong if we don&#39;t actually define the symbol la=
ter to its<br>
-=C2=A0 =C2=A0 proper value.=C2=A0 (In some cases we want to leave the symb=
ol undefined,<br>
-=C2=A0 =C2=A0 for example, when the ELF header isn&#39;t loaded, and we do=
n&#39;t have this<br>
-=C2=A0 =C2=A0 infomation available in before_allocation.)<br>
-<br>
-=C2=A0 =C2=A0 ld/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* emultempl/elf32.em (gld${EMULATION_NAME}_befo=
re_allocation): Define<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__ehdr_start before size_dynamic_sections and r=
estore afterwards.<br>
-=C2=A0 =C2=A0 ld/testsuite/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ld-elf/ehdr_start-shared.d: New.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ld-elf/ehdr_start-userdef.d: xfail frv.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ld-elf/ehdr_start-weak.d: Likewise.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ld-elf/ehdr_start.d: Likewise.<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em<br>
-index 9a2fe89..13f86f0 100644<br>
---- a/ld/emultempl/elf32.em<br>
-+++ b/ld/emultempl/elf32.em<br>
-@@ -1480,6 +1480,8 @@ gld${EMULATION_NAME}_before_allocation (void)<br>
-=C2=A0 =C2=A0const char *rpath;<br>
-=C2=A0 =C2=A0asection *sinterp;<br>
-=C2=A0 =C2=A0bfd *abfd;<br>
-+=C2=A0 struct elf_link_hash_entry *ehdr_start =3D NULL;<br>
-+=C2=A0 struct bfd_link_hash_entry ehdr_start_save;<br>
-<br>
-=C2=A0 =C2=A0if (is_elf_hash_table (link_info.hash))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -1504,6 +1506,16 @@ gld${EMULATION_NAME}_before_allocation (void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _bfd_elf_link_hash_hide_s=
ymbol (&amp;link_info, h, TRUE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ELF_ST_VISIBILITY (h-=
&gt;other) !=3D STV_INTERNAL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;other =3D (h=
-&gt;other &amp; ~ELF_ST_VISIBILITY (-1)) | STV_HIDDEN;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t leave the symbol un=
defined.=C2=A0 Undefined hidden<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 symbols typically won&#3=
9;t have dynamic relocations, but<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 we most likely will need=
 dynamic relocations for<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ehdr_start if we are b=
uilding a PIE or shared<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 library.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ehdr_start =3D h;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ehdr_start_save =3D h-&gt;root;<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h-&gt;root.type =3D bfd_link_has=
h_defined;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h-&gt;root.u.def.section =3D bfd=
_abs_section_ptr;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h-&gt;root.u.def.value =3D 0;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-@@ -1620,6 +1632,14 @@ ${ELF_INTERPRETER_SET_DEFAULT}<br>
-<br>
-=C2=A0 =C2=A0if (!bfd_elf_size_dynsym_hash_dynstr (link_info.output_bfd, &=
amp;link_info))<br>
-=C2=A0 =C2=A0 =C2=A0einfo (&quot;%P%F: failed to set dynamic section sizes=
: %E\n&quot;);<br>
-+<br>
-+=C2=A0 if (ehdr_start !=3D NULL)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 /* If we twiddled __ehdr_start to defined earlier, p=
ut it back<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0as it was.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 ehdr_start-&gt;root.type =3D ehdr_start_save.type;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 ehdr_start-&gt;root.u =3D ehdr_start_save.u;<br>
-+=C2=A0 =C2=A0 }<br>
- }<br>
-<br>
- EOF<br>
-diff --git a/ld/testsuite/ld-elf/ehdr_start-shared.d b/ld/testsuite/ld-elf=
/ehdr_start-shared.d<br>
-new file mode 100644<br>
-index 0000000..c17516a<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-elf/ehdr_start-shared.d<br>
-@@ -0,0 +1,9 @@<br>
-+#source: ehdr_start.s<br>
-+#ld: -e _start -shared<br>
-+#nm: -n<br>
-+#target: *-*-linux* *-*-gnu* *-*-nacl*<br>
-+#xfail: cris*-*-* frv-*-*<br>
-+<br>
-+#...<br>
-+[0-9a-f]*000 [Adrt] __ehdr_start<br>
-+#pass<br>
-diff --git a/ld/testsuite/ld-elf/ehdr_start-userdef.d b/ld/testsuite/ld-el=
f/ehdr_start-userdef.d<br>
-index 2a88e98..b58ae3f 100644<br>
---- a/ld/testsuite/ld-elf/ehdr_start-userdef.d<br>
-+++ b/ld/testsuite/ld-elf/ehdr_start-userdef.d<br>
-@@ -2,6 +2,7 @@<br>
- #ld: -e _start -T ehdr_start-userdef.t<br>
- #readelf: -Ws<br>
- #target: *-*-linux* *-*-gnu* *-*-nacl*<br>
-+#xfail: frv-*-*<br>
-<br>
- #...<br>
- Symbol table &#39;\.symtab&#39; contains [0-9]+ entries:<br>
-diff --git a/ld/testsuite/ld-elf/ehdr_start-weak.d b/ld/testsuite/ld-elf/e=
hdr_start-weak.d<br>
-index 8bd9035..24ae34c 100644<br>
---- a/ld/testsuite/ld-elf/ehdr_start-weak.d<br>
-+++ b/ld/testsuite/ld-elf/ehdr_start-weak.d<br>
-@@ -2,6 +2,7 @@<br>
- #ld: -e _start -T ehdr_start-missing.t<br>
- #nm: -n<br>
- #target: *-*-linux* *-*-gnu* *-*-nacl*<br>
-+#xfail: frv-*-*<br>
-<br>
- #...<br>
- \s+[wU] __ehdr_start<br>
-diff --git a/ld/testsuite/ld-elf/ehdr_start.d b/ld/testsuite/ld-elf/ehdr_s=
tart.d<br>
-index 52e5b54..d538b66 100644<br>
---- a/ld/testsuite/ld-elf/ehdr_start.d<br>
-+++ b/ld/testsuite/ld-elf/ehdr_start.d<br>
-@@ -2,6 +2,7 @@<br>
- #ld: -e _start<br>
- #nm: -n<br>
- #target: *-*-linux* *-*-gnu* *-*-nacl*<br>
-+#xfail: frv-*-*<br>
-<br>
- #...<br>
- [0-9a-f]*000 [Adrt] __ehdr_start<br>
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch b/me=
ta/recipes-devtools/binutils/binutils/fix-pr16476.patch<br>
deleted file mode 100644<br>
index 65d62bc..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/fix-pr16476.patch<br>
+++ /dev/null<br>
@@ -1,220 +0,0 @@<br>
-From: H.J. Lu &lt;<a href=3D"mailto:hjl.tools@gmail.com">hjl.tools@gmail.c=
om</a>&gt;<br>
-Date: Tue, 21 Jan 2014 23:42:43 +0000 (-0800)<br>
-Subject: Check incompatible existing default symbol definition<br>
-X-Git-Tag: hjl/linux/release/2.24.51.0.3~1^2~8^2~16<br>
-X-Git-Url: <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-g=
db.git;a=3Dcommitdiff_plain;h=3D4584ec12076e088cf36965b88ef8710ca85491f9" t=
arget=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff_plain;h=3D4584ec12076e088cf36965b88ef8710ca85491f9</a><br>
-<br>
-Check incompatible existing default symbol definition<br>
-<br>
-After resolving a versioned reference, foo@VER1, to a default versioned<br=
>
-definition, foo@@VER1, from a shared object, we also merge it with<br>
-the existing regular default symbol definition, foo.=C2=A0 When foo is IFU=
NC<br>
-and foo@@VER1 aren&#39;t, we will merge 2 incompatible definitions.=C2=A0 =
This<br>
-patch avoids merging foo@@VER1 definition with foo definition if<br>
-one is IFUNC and the other isn&#39;t.<br>
-<br>
-Upstream-Status: Backport<br>
----<br>
-<br>
-#diff --git a/bfd/ChangeLog b/bfd/ChangeLog<br>
-#index 5923bc3..c70a7db 100644<br>
-#--- a/bfd/ChangeLog<br>
-#+++ b/bfd/ChangeLog<br>
-#@@ -1,5 +1,13 @@<br>
-# 2014-01-21=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"mailto:hongjiu.lu@intel.co=
m">hongjiu.lu@intel.com</a>&gt;<br>
-#<br>
-#+=C2=A0 =C2=A0 =C2=A0PR ld/16467<br>
-#+=C2=A0 =C2=A0 =C2=A0* elflink.c (_bfd_elf_merge_symbol): When types of t=
he existing<br>
-#+=C2=A0 =C2=A0 =C2=A0regular default symbol definition and the versioned =
dynamic<br>
-#+=C2=A0 =C2=A0 =C2=A0symbol definition mismatch, skip the default symbol =
definition<br>
-#+=C2=A0 =C2=A0 =C2=A0if one of them is IFUNC.<br>
-#+<br>
-#+2014-01-21=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"mailto:hongjiu.lu@intel.co=
m">hongjiu.lu@intel.com</a>&gt;<br>
-#+<br>
-#=C2=A0 =C2=A0 =C2=A0 PR ld/2404<br>
-#=C2=A0 =C2=A0 =C2=A0 * elflink.c (_bfd_elf_merge_symbol): Don&#39;t check=
 info-&gt;shared,<br>
-#=C2=A0 =C2=A0 =C2=A0 info-&gt;export_dynamic nor h-&gt;ref_dynamic for ty=
pe mismatch when<br>
-diff --git a/bfd/elflink.c b/bfd/elflink.c<br>
-index d0006da..792e14e 100644<br>
---- a/bfd/elflink.c<br>
-+++ b/bfd/elflink.c<br>
-@@ -1092,11 +1092,14 @@ _bfd_elf_merge_symbol (bfd *abfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; newdyn<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; newdef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !olddyn<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (olddef || h-&gt;root.type =3D=3D bfd_lin=
k_hash_common)<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; ELF_ST_TYPE (sym-&gt;st_info) !=3D h-&gt;=
type<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; ELF_ST_TYPE (sym-&gt;st_info) !=3D STT_NO=
TYPE<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; h-&gt;type !=3D STT_NOTYPE<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; !(newfunc &amp;&amp; oldfunc))<br>
-+=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (((olddef || h-&gt;root.type =3D=3D bfd_l=
ink_hash_common)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ELF_ST_TYPE (sym-&gt;st_info=
) !=3D h-&gt;type<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ELF_ST_TYPE (sym-&gt;st_info=
) !=3D STT_NOTYPE<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; h-&gt;type !=3D STT_NOTYPE<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !(newfunc &amp;&amp; oldfunc=
))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || (olddef<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((h-&gt;type =3D=3D =
STT_GNU_IFUNC)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D (ELF_ST_TYPE=
 (sym-&gt;st_info) =3D=3D STT_GNU_IFUNC)))))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*skip =3D TRUE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
-#diff --git a/ld/testsuite/ChangeLog b/ld/testsuite/ChangeLog<br>
-#index ac65a3a..a092428 100644<br>
-#--- a/ld/testsuite/ChangeLog<br>
-#+++ b/ld/testsuite/ChangeLog<br>
-#@@ -1,5 +1,19 @@<br>
-# 2014-01-21=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"mailto:hongjiu.lu@intel.co=
m">hongjiu.lu@intel.com</a>&gt;<br>
-#<br>
-#+=C2=A0 =C2=A0 =C2=A0PR ld/16467<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/dummy.c: New file.<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/pr16467.out: Likewise.<br>
-##+=C2=A0 =C2=A0 * ld-ifunc/pr16467a.c: Likewise.<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/pr16467a.map: Likewise.<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/pr16467b.c: Likewise.<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/pr16467b.map: Likewise.<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/pr16467c.c: Likewise.<br>
-#+<br>
-#+=C2=A0 =C2=A0 =C2=A0* ld-ifunc/ifunc.exp (run_cc_link_tests): New.<br>
-#+=C2=A0 =C2=A0 =C2=A0(run_ld_link_exec_tests): Run pr16467.<br>
-#+<br>
-#+2014-01-21=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"mailto:hongjiu.lu@intel.co=
m">hongjiu.lu@intel.com</a>&gt;<br>
-#+<br>
-#=C2=A0 =C2=A0 =C2=A0 PR ld/2404<br>
-#=C2=A0 =C2=A0 =C2=A0 * ld-elf/shared.exp: Add a PIE test for PR ld/2404.<=
br>
-#<br>
-diff --git a/ld/testsuite/ld-ifunc/dummy.c b/ld/testsuite/ld-ifunc/dummy.c=
<br>
-new file mode 100644<br>
-index 0000000..5c03287<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/dummy.c<br>
-@@ -0,0 +1 @@<br>
-+/* An empty file.=C2=A0 */<br>
-diff --git a/ld/testsuite/ld-ifunc/ifunc.exp b/ld/testsuite/ld-ifunc/ifunc=
.exp<br>
-index fb106c6..d7ff445 100644<br>
---- a/ld/testsuite/ld-ifunc/ifunc.exp<br>
-+++ b/ld/testsuite/ld-ifunc/ifunc.exp<br>
-@@ -349,6 +349,42 @@ if { $verbose &lt; 1 } {<br>
-=C2=A0 =C2=A0 =C2=A0remote_file host delete &quot;tmpdir/static_nonifunc_p=
rog&quot;<br>
- }<br>
-<br>
-+run_cc_link_tests [list \<br>
-+=C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;Build libpr16467a.so&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;-shared -Wl,--version-script=3Dpr16467a.map&qu=
ot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;-fPIC&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 { pr16467a.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 {} \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;libpr16467a.so&quot; \<br>
-+=C2=A0 =C2=A0 ] \<br>
-+=C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;Build libpr16467b.a&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;-fPIC&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 { pr16467b.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 {} \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;libpr16467b.a&quot; \<br>
-+=C2=A0 =C2=A0 ] \<br>
-+=C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;Build libpr16467b.so&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;-shared tmpdir/pr16467b.o tmpdir/libpr16467a.s=
o \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,--version-script=3Dpr16467b.map&quot; \<br=
>
-+=C2=A0 =C2=A0 =C2=A0 &quot;-fPIC&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 { dummy.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 {} \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;libpr16467b.so&quot; \<br>
-+=C2=A0 =C2=A0 ] \<br>
-+=C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;Build libpr16467c.a&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 { pr16467c.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 {} \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;libpr16467c.a&quot; \<br>
-+=C2=A0 =C2=A0 ] \<br>
-+]<br>
-+<br>
- run_ld_link_exec_tests [] [list \<br>
-=C2=A0 =C2=A0 =C2=A0[list \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Common symbol override ifunc test 1a&quot=
; \<br>
-@@ -368,6 +404,15 @@ run_ld_link_exec_tests [] [list \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ifunc-common-1.out&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-g&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0] \<br>
-+=C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;Run pr16467&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;tmpdir/pr16467c.o tmpdir/libpr16467b.so tmpdir=
/libpr16467a.so&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 { dummy.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;pr16467&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;pr16467.out&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 ] \<br>
- ]<br>
-<br>
- set test_list [lsort [glob -nocomplain $srcdir/$subdir/*.d]]<br>
-diff --git a/ld/testsuite/ld-ifunc/pr16467.out b/ld/testsuite/ld-ifunc/pr1=
6467.out<br>
-new file mode 100644<br>
-index 0000000..d86bac9<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/pr16467.out<br>
-@@ -0,0 +1 @@<br>
-+OK<br>
-diff --git a/ld/testsuite/ld-ifunc/pr16467a.c b/ld/testsuite/ld-ifunc/pr16=
467a.c<br>
-new file mode 100644<br>
-index 0000000..ae3f084<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/pr16467a.c<br>
-@@ -0,0 +1,5 @@<br>
-+const char *<br>
-+sd_get_seats(void)<br>
-+{<br>
-+=C2=A0 return &quot;OK&quot;;<br>
-+}<br>
-diff --git a/ld/testsuite/ld-ifunc/pr16467a.map b/ld/testsuite/ld-ifunc/pr=
16467a.map<br>
-new file mode 100644<br>
-index 0000000..d677f37<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/pr16467a.map<br>
-@@ -0,0 +1,4 @@<br>
-+LIBSYSTEMD_209 {<br>
-+global:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sd_get_seats;<br>
-+};<br>
-diff --git a/ld/testsuite/ld-ifunc/pr16467b.c b/ld/testsuite/ld-ifunc/pr16=
467b.c<br>
-new file mode 100644<br>
-index 0000000..264f6cf<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/pr16467b.c<br>
-@@ -0,0 +1,7 @@<br>
-+void new_sd_get_seats(void);<br>
-+__asm__(&quot;.symver new_sd_get_seats,sd_get_seats@LIBSYSTEMD_209&quot;)=
;<br>
-+void (*resolve_sd_get_seats(void)) (void) __asm__ (&quot;sd_get_seats&quo=
t;);<br>
-+void (*resolve_sd_get_seats(void)) (void) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return new_sd_get_seats;<br>
-+}<br>
-+__asm__(&quot;.type sd_get_seats, %gnu_indirect_function&quot;);<br>
-diff --git a/ld/testsuite/ld-ifunc/pr16467b.map b/ld/testsuite/ld-ifunc/pr=
16467b.map<br>
-new file mode 100644<br>
-index 0000000..1f263de<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/pr16467b.map<br>
-@@ -0,0 +1,4 @@<br>
-+LIBSYSTEMD_208 {<br>
-+global:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sd_get_seats;<br>
-+};<br>
-diff --git a/ld/testsuite/ld-ifunc/pr16467c.c b/ld/testsuite/ld-ifunc/pr16=
467c.c<br>
-new file mode 100644<br>
-index 0000000..e2a901c<br>
---- /dev/null<br>
-+++ b/ld/testsuite/ld-ifunc/pr16467c.c<br>
-@@ -0,0 +1,9 @@<br>
-+#include &lt;stdio.h&gt;<br>
-+const char* sd_get_seats(void);<br>
-+<br>
-+int<br>
-+main (int argc, char **argv)<br>
-+{<br>
-+=C2=A0 printf(&quot;%s\n&quot;, sd_get_seats());<br>
-+=C2=A0 return 0;<br>
-+}<br>
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch b/met=
a/recipes-devtools/binutils/binutils/fix-pr2404.patch<br>
deleted file mode 100644<br>
index 41f3504..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/fix-pr2404.patch<br>
+++ /dev/null<br>
@@ -1,76 +0,0 @@<br>
-From: H.J. Lu &lt;<a href=3D"mailto:hjl.tools@gmail.com">hjl.tools@gmail.c=
om</a>&gt;<br>
-Date: Tue, 21 Jan 2014 13:33:48 +0000 (-0800)<br>
-Subject: Don&#39;t check shared/export_dynamic/ref_dynamic for type mismat=
ch<br>
-X-Git-Tag: hjl/linux/release/2.24.51.0.3~1^2~8^2~22<br>
-X-Git-Url: <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-g=
db.git;a=3Dcommitdiff_plain;h=3D22ef172a21663abb477d72284b4d59c8eabcbb82" t=
arget=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff_plain;h=3D22ef172a21663abb477d72284b4d59c8eabcbb82</a><br>
-<br>
-Don&#39;t check shared/export_dynamic/ref_dynamic for type mismatch<br>
-<br>
-There is nothing linker can do when a type mismatched default definition<b=
r>
-are made dynamic by info-&gt;shared, info-&gt;export_dynamic or h-&gt;ref_=
dynamic.<br>
-But we do want to avoid exporting it when building PIE.=C2=A0 Let&#39;s re=
move<br>
-those checks.<br>
-<br>
-bfd/<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR ld/2404<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* elflink.c (_bfd_elf_merge_symbol): Don&#39;t =
check info-&gt;shared,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;export_dynamic, nor !h-&gt;ref_dynamic=
 for type mismatch when<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0adding the default version.<br>
-<br>
-ld/testsuite/<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR ld/2404<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* ld-elf/shared.exp: Add a PIE test for PR ld/2=
404.<br>
-<br>
-Upstream-Status: Backport<br>
----<br>
-<br>
-Index: binutils-2.24/bfd/elflink.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/elflink.c=C2=A0 =C2=A02014-02-08 13:20:08.62837=
8267 +0000<br>
-+++ binutils-2.24/bfd/elflink.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2014-02-08 13:2=
0:08.624378267 +0000<br>
-@@ -1090,9 +1090,6 @@<br>
-=C2=A0 =C2=A0 =C2=A0 the type of existing regular definition mismatch.=C2=
=A0 We only do it<br>
-=C2=A0 =C2=A0 =C2=A0 if the existing regular definition won&#39;t be dynam=
ic.=C2=A0 */<br>
-=C2=A0 =C2=A0if (pold_alignment =3D=3D NULL<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; !info-&gt;shared<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; !info-&gt;export_dynamic<br>
--=C2=A0 =C2=A0 =C2=A0 &amp;&amp; !h-&gt;ref_dynamic<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; newdyn<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; newdef<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; !olddyn<br>
-Index: binutils-2.24/ld/testsuite/ld-elf/shared.exp<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/ld/testsuite/ld-elf/shared.exp=C2=A0 2014-02-08 13:=
20:08.628378267 +0000<br>
-+++ binutils-2.24/ld/testsuite/ld-elf/shared.exp=C2=A0 =C2=A0 =C2=A0 =C2=
=A02014-02-08 13:20:08.624378267 +0000<br>
-@@ -432,3 +432,29 @@<br>
-<br>
- run_cc_link_tests $build_cxx_tests<br>
- run_ld_link_exec_tests [] $run_cxx_tests<br>
-+<br>
-+if { [istarget *-*-linux*]<br>
-+=C2=A0 =C2=A0 =C2=A0|| [istarget *-*-nacl*]<br>
-+=C2=A0 =C2=A0 =C2=A0|| [istarget *-*-gnu*] } {<br>
-+=C2=A0 =C2=A0 run_cc_link_tests [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Build libpr2404b.a with PIE&quot=
; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-fPIE&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { pr2404b.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {} \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;libpr2404b.a&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 ] \<br>
-+=C2=A0 =C2=A0 ]<br>
-+=C2=A0 =C2=A0 run_ld_link_exec_tests [] [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 [list \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Run pr2404 with PIE&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-pie tmpdir/pr2404b.o tmpdir/lib=
pr2404a.so&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { dummy.c } \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pr2404pie&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pr2404.out&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-fPIE&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 ] \<br>
-+=C2=A0 =C2=A0 ]<br>
-+}<br>
diff --git a/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.pat=
ch b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch<br>
index 2e621f1..9aaecd9 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch<br>
+++ b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch<br>
@@ -16661,7 +16661,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- binutils-2.24.orig/ld/configure=C2=A0 =C2=A0 2013-11-04 07:33:39.=
000000000 -0800<br>
=C2=A0+++ binutils-2.24/ld/configure 2013-12-15 11:12:06.120451266 -0800<br=
>
-@@ -646,8 +646,11 @@<br>
+@@ -654,8 +654,11 @@ OTOOL<br>
=C2=A0 LIPO<br>
=C2=A0 NMEDIT<br>
=C2=A0 DSYMUTIL<br>
@@ -16673,24 +16673,24 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 OBJDUMP<br>
=C2=A0 LN_S<br>
=C2=A0 NM<br>
-@@ -785,6 +788,7 @@<br>
+@@ -776,6 +779,7 @@ enable_static<br>
=C2=A0 with_pic<br>
=C2=A0 enable_fast_install<br>
=C2=A0 with_gnu_ld<br>
=C2=A0+with_libtool_sysroot<br>
=C2=A0 enable_libtool_lock<br>
- enable_nls<br>
- enable_initfini_array<br>
-@@ -1452,6 +1456,8 @@<br>
+ enable_plugins<br>
+ enable_largefile<br>
+@@ -1453,6 +1457,8 @@ Optional Packages:<br>
=C2=A0 =C2=A0 --with-pic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tr=
y to use only PIC/non-PIC objects [default=3Duse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 both]<br>
=C2=A0 =C2=A0 --with-gnu-ld=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assume =
the C compiler uses GNU ld [default=3Dno]<br>
=C2=A0+=C2=A0 --with-libtool-sysroot=3DDIR Search for dependent libraries w=
ithin DIR<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (or the compiler&#39;s sysroot if not specified).<br>
+=C2=A0 =C2=A0--with-lib-path=3Ddir1:dir2...=C2=A0 set default LIB_PATH<br>
+=C2=A0 =C2=A0--with-sysroot=3DDIR Search for usr/lib et al within DIR.<br>
=C2=A0 =C2=A0 --with-zlib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
clude zlib support (auto/yes/no) default=3Dauto<br>
-<br>
- Some influential environment variables:<br>
-@@ -6125,8 +6131,8 @@<br>
+@@ -5645,8 +5651,8 @@ esac<br>
<br>
<br>
<br>
@@ -16701,7 +16701,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
<br>
<br>
-@@ -6166,7 +6172,7 @@<br>
+@@ -5686,7 +5692,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking how to print =
strings&quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking how to print strings... &quot; &gt;&amp;6;=
 }<br>
=C2=A0 # Test print first, because it will be a builtin if present.<br>
@@ -16710,7 +16710,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0test &quot;X`print -r -- $ECHO 2&gt;/dev/null`&quot; =
=3D &quot;X$ECHO&quot;; then<br>
=C2=A0 =C2=A0 ECHO=3D&#39;print -r --&#39;<br>
=C2=A0 elif test &quot;X`printf %s $ECHO 2&gt;/dev/null`&quot; =3D &quot;X$=
ECHO&quot;; then<br>
-@@ -6852,8 +6858,8 @@<br>
+@@ -6372,8 +6378,8 @@ $as_echo_n &quot;checking whether the shell understa=
nds some XSI constructs... &quot; &gt;&amp;6;<br>
=C2=A0 # Try some XSI features<br>
=C2=A0 xsi_shell=3Dno<br>
=C2=A0 ( _lt_dummy=3D&quot;a/b/c&quot;<br>
@@ -16721,7 +16721,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 &amp;&amp; eval &#39;test $(( 1 + 1 )) -eq 2 \<br>
=C2=A0 =C2=A0 =C2=A0 &amp;&amp; test &quot;${#_lt_dummy}&quot; -eq 5&#39; )=
 &gt;/dev/null 2&gt;&amp;1 \<br>
=C2=A0 =C2=A0 &amp;&amp; xsi_shell=3Dyes<br>
-@@ -6902,6 +6908,80 @@<br>
+@@ -6422,6 +6428,80 @@ esac<br>
<br>
<br>
<br>
@@ -16802,7 +16802,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $LD optio=
n to reload object files&quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking for $LD option to reload object files... &=
quot; &gt;&amp;6; }<br>
=C2=A0 if test &quot;${lt_cv_ld_reload_flag+set}&quot; =3D set; then :<br>
-@@ -6918,6 +6998,11 @@<br>
+@@ -6438,6 +6518,11 @@ case $reload_flag in<br>
=C2=A0 esac<br>
=C2=A0 reload_cmds=3D&#39;$LD$reload_flag -o $output$reload_objs&#39;<br>
=C2=A0 case $host_os in<br>
@@ -16814,7 +16814,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 darwin*)<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reload_cmds=3D&#39;$LTCC $LTCFLAGS -nostdlib ${=
wl}-r -o $output$reload_objs&#39;<br>
-@@ -7086,7 +7171,8 @@<br>
+@@ -6606,7 +6691,8 @@ mingw* | pw32*)<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_deplibs_check_method=3D&#39;file_magic ^x86 arch=
ive import|^x86 DLL&#39;<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;func_win32_libid&#39;<br>
=C2=A0 =C2=A0 else<br>
@@ -16824,7 +16824,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;$OBJDUMP -f&#39;<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 ;;<br>
-@@ -7240,6 +7326,21 @@<br>
+@@ -6760,6 +6846,21 @@ esac<br>
=C2=A0 fi<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs=
_check_method&quot; &gt;&amp;5<br>
=C2=A0 $as_echo &quot;$lt_cv_deplibs_check_method&quot; &gt;&amp;6; }<br>
@@ -16846,7 +16846,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 file_magic_cmd=3D$lt_cv_file_magic_cmd<br>
=C2=A0 deplibs_check_method=3D$lt_cv_deplibs_check_method<br>
=C2=A0 test -z &quot;$deplibs_check_method&quot; &amp;&amp; deplibs_check_m=
ethod=3Dunknown<br>
-@@ -7255,9 +7356,162 @@<br>
+@@ -6775,9 +6876,162 @@ test -z &quot;$deplibs_check_method&quot; &amp;&am=
p; deplibs_check_method=3Dunknown<br>
<br>
<br>
<br>
@@ -16860,9 +16860,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0+<br>
=C2=A0+<br>
=C2=A0+<br>
- if test -n &quot;$ac_tool_prefix&quot;; then<br>
--=C2=A0 # Extract the first word of &quot;${ac_tool_prefix}ar&quot;, so it=
 can be a program name with args.<br>
--set dummy ${ac_tool_prefix}ar; ac_word=3D$2<br>
++if test -n &quot;$ac_tool_prefix&quot;; then<br>
=C2=A0+=C2=A0 # Extract the first word of &quot;${ac_tool_prefix}dlltool&qu=
ot;, so it can be a program name with args.<br>
=C2=A0+set dummy ${ac_tool_prefix}dlltool; ac_word=3D$2<br>
=C2=A0+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $ac_word&=
quot; &gt;&amp;5<br>
@@ -17003,7 +17001,9 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0+<br>
=C2=A0+<br>
=C2=A0+<br>
-+if test -n &quot;$ac_tool_prefix&quot;; then<br>
+ if test -n &quot;$ac_tool_prefix&quot;; then<br>
+-=C2=A0 # Extract the first word of &quot;${ac_tool_prefix}ar&quot;, so it=
 can be a program name with args.<br>
+-set dummy ${ac_tool_prefix}ar; ac_word=3D$2<br>
=C2=A0+=C2=A0 for ac_prog in ar<br>
=C2=A0+=C2=A0 do<br>
=C2=A0+=C2=A0 =C2=A0 # Extract the first word of &quot;$ac_tool_prefix$ac_p=
rog&quot;, so it can be a program name with args.<br>
@@ -17011,7 +17011,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $ac_word&=
quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp;6; }<br>
=C2=A0 if test &quot;${ac_cv_prog_AR+set}&quot; =3D set; then :<br>
-@@ -7273,7 +7527,7 @@<br>
+@@ -6793,7 +7047,7 @@ do<br>
=C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<br>
=C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executable_extension=
s; do<br>
=C2=A0 =C2=A0 if { test -f &quot;$as_dir/$ac_word$ac_exec_ext&quot; &amp;&a=
mp; $as_test_x &quot;$as_dir/$ac_word$ac_exec_ext&quot;; }; then<br>
@@ -17020,7 +17020,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}: found $as_=
dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 break 2<br>
=C2=A0 =C2=A0 fi<br>
-@@ -7293,11 +7547,15 @@<br>
+@@ -6813,11 +7067,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
=C2=A0 fi<br>
<br>
<br>
@@ -17039,7 +17039,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking for $ac_word&=
quot; &gt;&amp;5<br>
=C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp;6; }<br>
=C2=A0 if test &quot;${ac_cv_prog_ac_ct_AR+set}&quot; =3D set; then :<br>
-@@ -7313,7 +7571,7 @@<br>
+@@ -6833,7 +7091,7 @@ do<br>
=C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<br>
=C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executable_extension=
s; do<br>
=C2=A0 =C2=A0 if { test -f &quot;$as_dir/$ac_word$ac_exec_ext&quot; &amp;&a=
mp; $as_test_x &quot;$as_dir/$ac_word$ac_exec_ext&quot;; }; then<br>
@@ -17048,7 +17048,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}: found $as_=
dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 break 2<br>
=C2=A0 =C2=A0 fi<br>
-@@ -7332,6 +7590,10 @@<br>
+@@ -6852,6 +7110,10 @@ else<br>
=C2=A0 $as_echo &quot;no&quot; &gt;&amp;6; }<br>
=C2=A0 fi<br>
<br>
@@ -17059,7 +17059,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 if test &quot;x$ac_ct_AR&quot; =3D x; then<br>
=C2=A0 =C2=A0 =C2=A0 AR=3D&quot;false&quot;<br>
=C2=A0 =C2=A0 else<br>
-@@ -7343,12 +7605,10 @@<br>
+@@ -6863,12 +7125,12 @@ ac_tool_warned=3Dyes ;;<br>
=C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 AR=3D$ac_ct_AR<br>
=C2=A0 =C2=A0 fi<br>
@@ -17071,10 +17071,12 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0-test -z &quot;$AR_FLAGS&quot; &amp;&amp; AR_FLAGS=3Dcru<br>
=C2=A0+: ${AR=3Dar}<br>
=C2=A0+: ${AR_FLAGS=3Dcru}<br>
++<br>
++<br>
<br>
<br>
<br>
-@@ -7360,6 +7620,64 @@<br>
+@@ -6878,6 +7140,62 @@ test -z &quot;$AR_FLAGS&quot; &amp;&amp; AR_FLAGS=
=3Dcru<br>
<br>
<br>
<br>
@@ -17134,12 +17136,10 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0+<br>
=C2=A0+<br>
=C2=A0+<br>
-+<br>
-+<br>
+<br>
+<br>
=C2=A0 if test -n &quot;$ac_tool_prefix&quot;; then<br>
-=C2=A0 =C2=A0# Extract the first word of &quot;${ac_tool_prefix}strip&quot=
;, so it can be a program name with args.<br>
- set dummy ${ac_tool_prefix}strip; ac_word=3D$2<br>
-@@ -7694,8 +8012,8 @@<br>
+@@ -7214,8 +7532,8 @@ esac<br>
=C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&quot;sed -n -e &#39;s/^T .* \(.*=
\)$/extern int \1();/p&#39; -e &#39;s/^$symcode* .* \(.*\)$/extern char \1;=
/p&#39;&quot;<br>
<br>
=C2=A0 # Transform an extracted symbol line into symbol name and symbol add=
ress<br>
@@ -17150,7 +17150,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 # Handle CRLF in mingw tool chain<br>
=C2=A0 opt_cr=3D<br>
-@@ -7731,6 +8049,7 @@<br>
+@@ -7251,6 +7569,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; do<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 lt_cv_sys_global_symbol_pipe=3D&quot;sed -n -e &#39;s/=
^.*[=C2=A0 =C2=A0 ]\($symcode$symcode*\)[=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
][=C2=A0 =C2=A0 =C2=A0 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p&#39;&quot;<b=
r>
=C2=A0 =C2=A0 fi<br>
@@ -17158,7 +17158,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 # Check to see that the pipe works correctly.<br>
=C2=A0 =C2=A0 pipe_works=3Dno<br>
-@@ -7772,6 +8091,18 @@<br>
+@@ -7292,6 +7611,18 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $GREP &#39; nm_test_var$&#39; &quot;$nlist&q=
uot; &gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $GREP &#39; nm_test_func$&#39; &quot;$nlist&=
quot; &gt;/dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;_LT_EOF &gt; conftest.$ac_ex=
t<br>
@@ -17177,7 +17177,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 #ifdef __cplusplus<br>
=C2=A0 extern &quot;C&quot; {<br>
=C2=A0 #endif<br>
-@@ -7783,7 +8114,7 @@<br>
+@@ -7303,7 +7634,7 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt;_LT_EOF &gt;&gt; conftest.$a=
c_ext<br>
<br>
=C2=A0 /* The mapping between symbol names and symbols.=C2=A0 */<br>
@@ -17186,7 +17186,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 const char *name;<br>
=C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0*address;<br>
=C2=A0 }<br>
-@@ -7809,8 +8140,8 @@<br>
+@@ -7329,8 +7660,8 @@ static const void *lt_preloaded_setup() {<br>
=C2=A0 _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Now try linking the two files.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv conftest.$ac_objext conftstm.$ac_obje=
xt<br>
@@ -17197,7 +17197,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;conftstm.$ac_objext&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS$lt_prog_compiler_=
no_builtin_flag&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if { { eval echo &quot;\&quot;\$as_me\&q=
uot;:${as_lineno-$LINENO}: \&quot;$ac_link\&quot;&quot;; } &gt;&amp;5<br>
-@@ -7820,8 +8151,8 @@<br>
+@@ -7340,8 +7671,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 test $ac_status =3D 0; } &amp;&amp; test -s conftest${ac_exee=
xt}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe_works=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -17208,7 +17208,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;cannot find nm_test_func in $=
nlist&quot; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -7858,6 +8189,23 @@<br>
+@@ -7378,6 +7709,19 @@ else<br>
=C2=A0 $as_echo &quot;ok&quot; &gt;&amp;6; }<br>
=C2=A0 fi<br>
<br>
@@ -17225,14 +17225,10 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0+<br>
=C2=A0+<br>
=C2=A0+<br>
-+<br>
-+<br>
-+<br>
-+<br>
<br>
<br>
<br>
-@@ -7874,6 +8222,38 @@<br>
+@@ -7398,6 +7742,42 @@ fi<br>
<br>
<br>
<br>
@@ -17268,10 +17264,14 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0+<br>
=C2=A0+ { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:=
-no}&quot; &gt;&amp;5<br>
=C2=A0+$as_echo &quot;${lt_sysroot:-no}&quot; &gt;&amp;6; }<br>
++<br>
++<br>
++<br>
++<br>
<br>
-<br>
-<br>
-@@ -8085,6 +8465,123 @@<br>
+ # Check whether --enable-libtool-lock was given.<br>
+ if test &quot;${enable_libtool_lock+set}&quot; =3D set; then :<br>
+@@ -7605,6 +7985,123 @@ esac<br>
<br>
=C2=A0 need_locks=3D&quot;$enable_libtool_lock&quot;<br>
<br>
@@ -17395,7 +17395,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 case $host_os in<br>
=C2=A0 =C2=A0 =C2=A0 rhapsody* | darwin*)<br>
-@@ -8648,6 +9145,8 @@<br>
+@@ -8168,6 +8665,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2&g=
t;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$AR cru libconftest.a conftest.o&quo=
t; &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $AR cru libconftest.a conftest.o 2&gt;&amp;5<br=
>
@@ -17404,7 +17404,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; conftest.c &lt;&lt; _LT_EOF<br>
=C2=A0 int main() { return 0;}<br>
=C2=A0 _LT_EOF<br>
-@@ -8716,6 +9215,16 @@<br>
+@@ -8236,6 +8735,16 @@ done<br>
<br>
<br>
<br>
@@ -17421,7 +17421,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
<br>
=C2=A0 # Set options<br>
-@@ -8844,7 +9353,8 @@<br>
+@@ -8364,7 +8873,8 @@ fi<br>
=C2=A0 LIBTOOL_DEPS=3D&quot;$ltmain&quot;<br>
<br>
=C2=A0 # Always use our own libtool.<br>
@@ -17431,7 +17431,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
<br>
<br>
-@@ -8933,7 +9443,7 @@<br>
+@@ -8453,7 +8963,7 @@ aix3*)<br>
=C2=A0 esac<br>
<br>
=C2=A0 # Global variables:<br>
@@ -17440,7 +17440,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 can_build_shared=3Dyes<br>
<br>
=C2=A0 # All known linkers require a `.a&#39; archive for static linking (e=
xcept MSVC,<br>
-@@ -9231,8 +9741,6 @@<br>
+@@ -8751,8 +9261,6 @@ fi<br>
=C2=A0 lt_prog_compiler_pic=3D<br>
=C2=A0 lt_prog_compiler_static=3D<br>
<br>
@@ -17449,7 +17449,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Wl,&#39;<br>
-@@ -9398,6 +9906,12 @@<br>
+@@ -8918,6 +9426,12 @@ $as_echo_n &quot;checking for $compiler option to p=
roduce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&#39;--shared&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static=3D&#39;--static&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
@@ -17462,7 +17462,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Portland Group compilers (*not* the Pe=
ntium gcc compiler,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # which looks to be a dead project)<br>
-@@ -9460,7 +9974,7 @@<br>
+@@ -8980,7 +9494,7 @@ $as_echo_n &quot;checking for $compiler option to pr=
oduce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&#39;-KPIC&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static=3D&#39;-Bstatic&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
@@ -17471,7 +17471,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Qoption ld &#39;;;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Wl,&#39;;;<br>
-@@ -9517,13 +10031,17 @@<br>
+@@ -9037,13 +9551,17 @@ case $host_os in<br>
=C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&quot;$lt_prog_compiler_pic -DP=
IC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
@@ -17495,7 +17495,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the PIC flag actually works.<br>
-@@ -9584,6 +10102,11 @@<br>
+@@ -9104,6 +9622,11 @@ fi<br>
<br>
<br>
<br>
@@ -17507,7 +17507,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the static flag actually works.<br>
=C2=A0 #<br>
-@@ -9934,7 +10457,8 @@<br>
+@@ -9454,7 +9977,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3Dunsupported<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 always_export_symbols=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_shared_with_static_runtimes=3Dyes<br>
@@ -17517,7 +17517,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#39;auto-imp=
ort&#39; &gt; /dev/null; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shared $libobjs=
 $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-imag=
e-base -Xlinker --out-implib -Xlinker $lib&#39;<br>
-@@ -9982,7 +10506,7 @@<br>
+@@ -9502,7 +10026,7 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $EGREP &#39;: suppo=
rted targets:.* elf&#39; &gt; /dev/null \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; test &quot;$tmp_diet&quot; =3D=
 no<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
@@ -17526,7 +17526,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_sharedflag=3D&#39;-shared&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename,$host_cpu in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgcc*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Portland Group C compiler<br>
-@@ -10033,12 +10557,12 @@<br>
+@@ -9553,12 +10077,12 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 whole_archive_flag_spec=3D&#39;--whole-a=
rchive$convenience --no-whole-archive&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_ld=3D&#39;-rpa=
th $libdir&#39;<br>
@@ -17541,7 +17541,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-@@ -10052,8 +10576,8 @@<br>
+@@ -9572,8 +10096,8 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$LD -Bshareable $libobjs $d=
eplibs $linker_flags -o $lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlarc=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
@@ -17552,7 +17552,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
<br>
-@@ -10071,8 +10595,8 @@<br>
+@@ -9591,8 +10115,8 @@ _LT_EOF<br>
<br>
=C2=A0 _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif $LD --help 2&gt;&amp;1 | $GREP &#39;: supp=
orted targets:.* elf&#39; &gt; /dev/null; then<br>
@@ -17563,7 +17563,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_shlibs=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10118,8 +10642,8 @@<br>
+@@ -9638,8 +10162,8 @@ _LT_EOF<br>
<br>
=C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#39;: suppor=
ted targets:.* elf&#39; &gt; /dev/null; then<br>
@@ -17574,7 +17574,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_shlibs=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10249,7 +10773,13 @@<br>
+@@ -9769,7 +10293,13 @@ _LT_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3D&#39;-berok&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath from the=
 value encoded in an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
@@ -17589,7 +17589,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -10262,22 +10792,29 @@<br>
+@@ -9782,22 +10312,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -17632,7 +17632,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;${wl}-b=
libpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_expsym_cmds=3D&#39;$CC -o $outpu=
t_objdir/$soname $libobjs $deplibs &#39;&quot;\${wl}$no_entry_flag&quot;&#3=
9; $compiler_flags `if test &quot;x${allow_undefined_flag}&quot; !=3D &quot=
;x&quot;; then func_echo_all &quot;${wl}${allow_undefined_flag}&quot;; else=
 :; fi` &#39;&quot;\${wl}$exp_sym_flag:\$export_symbols $shared_flag&quot;<=
br>
-@@ -10289,7 +10826,13 @@<br>
+@@ -9809,7 +10346,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Determine the default libpath from the =
value encoded in an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# empty executable.<br>
@@ -17647,7 +17647,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -10302,22 +10845,29 @@<br>
+@@ -9822,22 +10365,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -17690,10 +17690,11 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec=3D&#39;${wl}-bl=
ibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warning - without using the other run =
time loading flags,<br>
-@@ -10362,20 +10912,63 @@<br>
+@@ -9881,21 +10431,64 @@ if test -z &quot;$aix_libpath&quot;; then aix_lib=
path=3D&quot;/usr/lib:/lib&quot;; fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# When not using gcc, we currently assume that =
we are using<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Microsoft Visual C++.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # hardcode_libdir_flag_spec is actually meaning=
less, as there is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# no search path for DLLs.<br>
+-=C2=A0 =C2=A0 =C2=A0 # no search path for DLLs.<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39; &#39;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3Dunsupported<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 # Tell ltmain to make .lib files, not .a files.=
<br>
@@ -17708,6 +17709,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 old_archive_cmds=3D&#39;lib -OUT:$oldlib$oldobj=
s$old_deplibs&#39;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 fix_srcfile_path=3D&#39;`cygpath -w &quot;$srcf=
ile&quot;`&#39;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 enable_shared_with_static_runtimes=3Dyes<br>
++=C2=A0 =C2=A0 =C2=A0 # no search path for DLLs.<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 cl*)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 # Native MSVC<br>
@@ -17768,7 +17770,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 darwin* | rhapsody*)<br>
-@@ -10436,7 +11029,7 @@<br>
+@@ -9956,7 +10549,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libpa=
th=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 # FreeBSD 3 and greater uses gcc -shared to do shared =
libraries.<br>
=C2=A0 =C2=A0 =C2=A0 freebsd* | dragonfly*)<br>
@@ -17777,7 +17779,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;-R$libdir&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_direct=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_shlibpath_var=3Dno<br>
-@@ -10444,7 +11037,7 @@<br>
+@@ -9964,7 +10557,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libpa=
th=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 hpux9*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
@@ -17786,7 +17788,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$RM $output_objdir/$soname~=
$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $link=
er_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$soname =
$lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10460,7 +11053,7 @@<br>
+@@ -9980,7 +10573,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libpa=
th=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 hpux10*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes &amp;&amp; tes=
t &quot;$with_gnu_ld&quot; =3D no; then<br>
@@ -17795,7 +17797,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$LD -b +h $soname +b $insta=
ll_libdir -o $lib $libobjs $deplibs $linker_flags&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -10484,10 +11077,10 @@<br>
+@@ -10004,10 +10597,10 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shared ${wl}+h =
${wl}$soname -o $lib $libobjs $deplibs $compiler_flags&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ia64*)<br>
@@ -17808,7 +17810,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-@@ -10566,23 +11159,36 @@<br>
+@@ -10086,23 +10679,36 @@ fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 irix5* | irix6* | nonstopux*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
@@ -17853,7 +17855,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shared $libobjs $depli=
bs $compiler_flags -soname $soname `test -n &quot;$verstring&quot; &amp;&am=
p; func_echo_all &quot;-set_version $verstring&quot;` -update_registry ${ou=
tput_objdir}/so_locations -o $lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_expsym_cmds=3D&#39;$CC -shared $libobjs=
 $deplibs $compiler_flags -soname $soname `test -n &quot;$verstring&quot; &=
amp;&amp; func_echo_all &quot;-set_version $verstring&quot;` -update_regist=
ry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib&#39;=
<br>
-@@ -10667,7 +11273,7 @@<br>
+@@ -10187,7 +10793,7 @@ rm -f core conftest.err conftest.$ac_objext \<br>
=C2=A0 =C2=A0 =C2=A0 osf4* | osf5*)=C2=A0 =C2=A0 # as osf3* with the additi=
on of -msym flag<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3D&#39; ${wl}-expect_unres=
olved ${wl}\*&#39;<br>
@@ -17862,7 +17864,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;${wl}-rpath ${=
wl}$libdir&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3D&#39; -expect_unresolved=
 \*&#39;<br>
-@@ -10686,9 +11292,9 @@<br>
+@@ -10206,9 +10812,9 @@ rm -f core conftest.err conftest.$ac_objext \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag=3D&#39; -z defs&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wlarc=3D&#39;${wl}&#39;<br>
@@ -17874,7 +17876,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case `$CC -V 2&gt;&amp;1` in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *&quot;Compilers 5.0&quot;*)<br>
-@@ -11264,8 +11870,9 @@<br>
+@@ -10784,8 +11390,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 need_version=3Dno<br>
=C2=A0 =C2=A0 need_lib_prefix=3Dno<br>
<br>
@@ -17886,7 +17888,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;$libname.dll.a&#39;<br>
=C2=A0 =C2=A0 =C2=A0 # DLL is installed to $(libdir)/../bin by postinstall_=
cmds<br>
=C2=A0 =C2=A0 =C2=A0 postinstall_cmds=3D&#39;base_file=3D`basename \${file}=
`~<br>
-@@ -11298,13 +11905,71 @@<br>
+@@ -10818,13 +11425,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;`echo ${libname} | se=
d -e &#39;s/^lib/pw/&#39;``echo ${release} | $SED -e &#39;s/[.]/-/g&#39;`${=
versuffix}${shared_ext}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 esac<br>
@@ -17959,7 +17961,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 # FIXME: first we should search . and the directory the execu=
table is in<br>
=C2=A0 =C2=A0 shlibpath_var=3DPATH<br>
=C2=A0 =C2=A0 ;;<br>
-@@ -11396,7 +12061,7 @@<br>
+@@ -10916,7 +11581,7 @@ haiku*)<br>
=C2=A0 =C2=A0 soname_spec=3D&#39;${libname}${release}${shared_ext}$major&#3=
9;<br>
=C2=A0 =C2=A0 shlibpath_var=3DLIBRARY_PATH<br>
=C2=A0 =C2=A0 shlibpath_overrides_runpath=3Dyes<br>
@@ -17968,16 +17970,16 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 hardcode_into_libs=3Dyes<br>
=C2=A0 =C2=A0 ;;<br>
<br>
-@@ -12192,7 +12857,7 @@<br>
+@@ -11712,7 +12377,7 @@ else<br>
=C2=A0 =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2<br=
>
=C2=A0 =C2=A0 lt_status=3D$lt_dlunknown<br>
=C2=A0 =C2=A0 cat &gt; conftest.$ac_ext &lt;&lt;_LT_EOF<br>
--#line 12195 &quot;configure&quot;<br>
+-#line 11715 &quot;configure&quot;<br>
=C2=A0+#line $LINENO &quot;configure&quot;<br>
=C2=A0 #include &quot;confdefs.h&quot;<br>
<br>
=C2=A0 #if HAVE_DLFCN_H<br>
-@@ -12236,10 +12901,10 @@<br>
+@@ -11756,10 +12421,10 @@ else<br>
=C2=A0 /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated<br>
=C2=A0 =C2=A0 =C2=A0correspondingly for the symbols needed.=C2=A0 */<br>
=C2=A0 #if defined(__GNUC__) &amp;&amp; (((__GNUC__ =3D=3D 3) &amp;&amp; (_=
_GNUC_MINOR__ &gt;=3D 3)) || (__GNUC__ &gt; 3))<br>
@@ -17990,16 +17992,16 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 int main ()<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);<br>
-@@ -12298,7 +12963,7 @@<br>
+@@ -11818,7 +12483,7 @@ else<br>
=C2=A0 =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2<br=
>
=C2=A0 =C2=A0 lt_status=3D$lt_dlunknown<br>
=C2=A0 =C2=A0 cat &gt; conftest.$ac_ext &lt;&lt;_LT_EOF<br>
--#line 12301 &quot;configure&quot;<br>
+-#line 11821 &quot;configure&quot;<br>
=C2=A0+#line $LINENO &quot;configure&quot;<br>
=C2=A0 #include &quot;confdefs.h&quot;<br>
<br>
=C2=A0 #if HAVE_DLFCN_H<br>
-@@ -12342,10 +13007,10 @@<br>
+@@ -11862,10 +12527,10 @@ else<br>
=C2=A0 /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated<br>
=C2=A0 =C2=A0 =C2=A0correspondingly for the symbols needed.=C2=A0 */<br>
=C2=A0 #if defined(__GNUC__) &amp;&amp; (((__GNUC__ =3D=3D 3) &amp;&amp; (_=
_GNUC_MINOR__ &gt;=3D 3)) || (__GNUC__ &gt; 3))<br>
@@ -18012,7 +18014,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 int main ()<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);<br>
-@@ -12737,6 +13402,7 @@<br>
+@@ -12257,6 +12922,7 @@ $RM -r conftest*<br>
<br>
=C2=A0 =C2=A0 # Allow CC to be a program name with arguments.<br>
=C2=A0 =C2=A0 lt_save_CC=3D$CC<br>
@@ -18020,7 +18022,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 lt_save_LD=3D$LD<br>
=C2=A0 =C2=A0 lt_save_GCC=3D$GCC<br>
=C2=A0 =C2=A0 GCC=3D$GXX<br>
-@@ -12754,6 +13420,7 @@<br>
+@@ -12274,6 +12940,7 @@ $RM -r conftest*<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 test -z &quot;${LDCXX+set}&quot; || LD=3D$LDCXX<br>
=C2=A0 =C2=A0 CC=3D${CXX-&quot;c++&quot;}<br>
@@ -18028,7 +18030,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 compiler=3D$CC<br>
=C2=A0 =C2=A0 compiler_CXX=3D$CC<br>
=C2=A0 =C2=A0 for cc_temp in $compiler&quot;&quot;; do<br>
-@@ -12893,8 +13560,8 @@<br>
+@@ -12413,8 +13080,8 @@ with_gnu_ld=3D$lt_cv_prog_gnu_ld<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if GNU C++ uses GNU ld as the underlyin=
g linker, since the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # archiving commands below assume that GNU ld i=
s being used.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$with_gnu_ld&quot; =3D yes; then<=
br>
@@ -18039,7 +18041,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_CXX=3D&#39;${w=
l}-rpath ${wl}$libdir&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export_dynamic_flag_spec_CXX=3D&#39;${wl=
}--export-dynamic&#39;<br>
-@@ -13036,7 +13703,13 @@<br>
+@@ -12556,7 +13223,13 @@ $as_echo_n &quot;checking whether the $compiler l=
inker ($LD) supports shared librarie<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag_CXX=3D&#39;-=
berok&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath f=
rom the value encoded in an empty<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # executable.<br>
@@ -18054,7 +18056,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -13049,22 +13722,29 @@<br>
+@@ -12569,22 +13242,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_cxx_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -18097,7 +18099,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_CXX=3D&=
#39;${wl}-blibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
<br>
-@@ -13077,7 +13757,13 @@<br>
+@@ -12597,7 +13277,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_lib=
path=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath f=
rom the value encoded in an<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
@@ -18112,7 +18114,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 /* end confdefs.h.=C2=A0 */<br>
<br>
=C2=A0 int<br>
-@@ -13090,22 +13776,29 @@<br>
+@@ -12610,22 +13296,29 @@ main ()<br>
=C2=A0 _ACEOF<br>
=C2=A0 if ac_fn_cxx_try_link &quot;$LINENO&quot;; then :<br>
<br>
@@ -18155,7 +18157,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec_CXX=3D&=
#39;${wl}-blibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Warning - without using the oth=
er run time loading flags,<br>
-@@ -13148,29 +13841,75 @@<br>
+@@ -12668,29 +13361,75 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cygwin* | mingw* | pw32* | cegcc*)<br>
@@ -18254,7 +18256,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin* | rhapsody*)<br>
<br>
<br>
-@@ -13276,7 +14015,7 @@<br>
+@@ -12796,7 +13535,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GXX&quot; =
=3D yes; then<br>
@@ -18263,7 +18265,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: insert pro=
per C++ library support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_shlibs_CXX=3Dno<=
br>
-@@ -13347,10 +14086,10 @@<br>
+@@ -12867,10 +13606,10 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archi=
ve_cmds_CXX=3D&#39;$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib=
 $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ia64*)<br>
@@ -18276,7 +18278,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-@@ -13391,9 +14130,9 @@<br>
+@@ -12911,9 +13650,9 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GXX&quot; =3D yes;=
 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$with_gnu_ld=
&quot; =3D no; then<br>
@@ -18288,7 +18290,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_all_deplibs_CXX=3Dyes<br>
-@@ -13463,20 +14202,20 @@<br>
+@@ -12983,20 +13722,20 @@ if test -z &quot;$aix_libpath&quot;; then aix_li=
bpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prelink_cmds_CXX=3D&#39;tp=
ldir=3DTemplate.dir~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $tpldir~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $CC --prelink_objec=
ts --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~<br>
@@ -18313,7 +18315,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) # Version 6 and above use weak=
 symbols<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds_CXX=3D&#39;$C=
C -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $com=
piler_flags ${wl}-soname ${wl}$soname -o $lib&#39;<br>
-@@ -13671,7 +14410,7 @@<br>
+@@ -13191,7 +13930,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=
_CXX=3D&#39;$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $=
libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname=
 `test -n &quot;$verstring&quot; &amp;&amp; func_echo_all &quot;${wl}-set_v=
ersion ${wl}$verstring&quot;` ${wl}-update_registry ${wl}${output_objdir}/s=
o_locations -o $lib&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
@@ -18322,7 +18324,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
<br>
-@@ -13717,7 +14456,7 @@<br>
+@@ -13237,7 +13976,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 solaris*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
@@ -18331,7 +18333,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sun C++ 4.2, 5.x and Centerline=
 C++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds_need_lc_CXX=
=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag_CXX=3D&#39; -zd=
efs&#39;<br>
-@@ -13758,9 +14497,9 @@<br>
+@@ -13278,9 +14017,9 @@ if test -z &quot;$aix_libpath&quot;; then aix_libp=
ath=3D&quot;/usr/lib:/lib&quot;; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GXX&quot; =3D yes =
&amp;&amp; test &quot;$with_gnu_ld&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag_CXX=3D&#=
39; ${wl}-z ${wl}defs&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $CC --version | $GREP -=
v &#39;^2\.7&#39; &gt; /dev/null; then<br>
@@ -18343,7 +18345,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Commands to make =
compiler produce verbose output that lists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # what &quot;hidden=
&quot; libraries, object files and flags are used when<br>
-@@ -13895,6 +14634,13 @@<br>
+@@ -13415,6 +14154,13 @@ private:<br>
=C2=A0 };<br>
=C2=A0 _LT_EOF<br>
<br>
@@ -18357,7 +18359,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 if { { eval echo &quot;\&quot;\$as_me\&quot;:${as_lineno-$LINENO}: \=
&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 (eval $ac_compile) 2&gt;&amp;5<br>
=C2=A0 =C2=A0 ac_status=3D$?<br>
-@@ -13908,7 +14654,7 @@<br>
+@@ -13428,7 +14174,7 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${as_=
lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 pre_test_object_deps_done=3Dno<br>
<br>
=C2=A0 =C2=A0 for p in `eval &quot;$output_verbose_link_cmd&quot;`; do<br>
@@ -18366,7 +18368,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 =C2=A0 -L* | -R* | -l*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Some compilers place space between &quo=
t;-{L,R}&quot; and the path.<br>
-@@ -13917,13 +14663,22 @@<br>
+@@ -13437,13 +14183,22 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${a=
s_lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test $p =3D &quot;-R&quot;; then<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prev=3D$p<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
@@ -18393,7 +18395,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Internal compiler library paths =
should come after those<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# provided the user.=C2=A0 The pos=
tdeps already come after the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# user supplied libs so there is n=
o need to process them.<br>
-@@ -13943,8 +14698,10 @@<br>
+@@ -13463,8 +14218,10 @@ if { { eval echo &quot;\&quot;\$as_me\&quot;:${as=
_lineno-$LINENO}: \&quot;$ac_compile\&quot;&quot;; } &gt;&amp;5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postdeps_CXX=3D&quot;${postdeps_CX=
X} ${prev}${p}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
@@ -18404,7 +18406,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 *.$objext)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This assumes that the test object file =
only shows up<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# once in the compiler output.<br>
-@@ -13980,6 +14737,7 @@<br>
+@@ -13500,6 +14257,7 @@ else<br>
=C2=A0 fi<br>
<br>
=C2=A0 $RM -f confest.$objext<br>
@@ -18412,7 +18414,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 # PORTME: override above test on systems where it is broken<br>
=C2=A0 case $host_os in<br>
-@@ -14015,7 +14773,7 @@<br>
+@@ -13535,7 +14293,7 @@ linux*)<br>
<br>
=C2=A0 solaris*)<br>
=C2=A0 =C2=A0 case $cc_basename in<br>
@@ -18421,7 +18423,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 # The more standards-conforming stlport4 library is<br=
>
=C2=A0 =C2=A0 =C2=A0 # incompatible with the Cstd library. Avoid specifying=
<br>
=C2=A0 =C2=A0 =C2=A0 # it if it&#39;s in CXXFLAGS. Ignore libCrun as<br>
-@@ -14080,8 +14838,6 @@<br>
+@@ -13600,8 +14358,6 @@ fi<br>
=C2=A0 lt_prog_compiler_pic_CXX=3D<br>
=C2=A0 lt_prog_compiler_static_CXX=3D<br>
<br>
@@ -18430,7 +18432,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 =C2=A0 # C++ specific cases for pic, static, wl, etc.<br>
=C2=A0 =C2=A0 if test &quot;$GXX&quot; =3D yes; then<br>
-@@ -14186,6 +14942,11 @@<br>
+@@ -13706,6 +14462,11 @@ $as_echo_n &quot;checking for $compiler option to=
 produce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
@@ -18442,7 +18444,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dgux*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ec++*)<br>
-@@ -14338,7 +15099,7 @@<br>
+@@ -13858,7 +14619,7 @@ $as_echo_n &quot;checking for $compiler option to =
produce PIC... &quot; &gt;&amp;6; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 solaris*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
@@ -18451,7 +18453,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sun C++ 4.2, 5.x and Centerline=
 C++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic_CXX=3D&#39;-=
KPIC&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static_CXX=3D&#3=
9;-Bstatic&#39;<br>
-@@ -14403,10 +15164,17 @@<br>
+@@ -13923,10 +14684,17 @@ case $host_os in<br>
=C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic_CXX=3D&quot;$lt_prog_compiler_pic=
_CXX -DPIC&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
@@ -18472,7 +18474,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the PIC flag actually works.<br>
-@@ -14464,6 +15232,8 @@<br>
+@@ -13984,6 +14752,8 @@ fi<br>
<br>
<br>
<br>
@@ -18481,7 +18483,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 #<br>
=C2=A0 # Check to make sure the static flag actually works.<br>
=C2=A0 #<br>
-@@ -14641,6 +15411,7 @@<br>
+@@ -14161,6 +14931,7 @@ fi<br>
=C2=A0 $as_echo_n &quot;checking whether the $compiler linker ($LD) support=
s shared libraries... &quot; &gt;&amp;6; }<br>
<br>
=C2=A0 =C2=A0 export_symbols_cmds_CXX=3D&#39;$NM $libobjs $convenience | $g=
lobal_symbol_pipe | $SED &#39;\&#39;&#39;s/.* //&#39;\&#39;&#39; | sort | u=
niq &gt; $export_symbols&#39;<br>
@@ -18489,7 +18491,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 case $host_os in<br>
=C2=A0 =C2=A0 aix[4-9]*)<br>
=C2=A0 =C2=A0 =C2=A0 # If we&#39;re using GNU nm, then we don&#39;t want th=
e &quot;-C&quot; option.<br>
-@@ -14655,15 +15426,20 @@<br>
+@@ -14175,15 +14946,20 @@ $as_echo_n &quot;checking whether the $compiler =
linker ($LD) supports shared librarie<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 pw32*)<br>
=C2=A0 =C2=A0 =C2=A0 export_symbols_cmds_CXX=3D&quot;$ltdll_cmds&quot;<br>
@@ -18515,7 +18517,7 @@ Index: binutils-2.24/ld/configure<br>
<br>
=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX=
&quot; &gt;&amp;5<br>
=C2=A0 $as_echo &quot;$ld_shlibs_CXX&quot; &gt;&amp;6; }<br>
-@@ -14926,8 +15702,9 @@<br>
+@@ -14446,8 +15222,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 need_version=3Dno<br>
=C2=A0 =C2=A0 need_lib_prefix=3Dno<br>
<br>
@@ -18527,7 +18529,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;$libname.dll.a&#39;<br>
=C2=A0 =C2=A0 =C2=A0 # DLL is installed to $(libdir)/../bin by postinstall_=
cmds<br>
=C2=A0 =C2=A0 =C2=A0 postinstall_cmds=3D&#39;base_file=3D`basename \${file}=
`~<br>
-@@ -14959,13 +15736,71 @@<br>
+@@ -14479,13 +15256,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;`echo ${libname} | se=
d -e &#39;s/^lib/pw/&#39;``echo ${release} | $SED -e &#39;s/[.]/-/g&#39;`${=
versuffix}${shared_ext}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 esac<br>
@@ -18600,7 +18602,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 # FIXME: first we should search . and the directory the execu=
table is in<br>
=C2=A0 =C2=A0 shlibpath_var=3DPATH<br>
=C2=A0 =C2=A0 ;;<br>
-@@ -15056,7 +15891,7 @@<br>
+@@ -14576,7 +15411,7 @@ haiku*)<br>
=C2=A0 =C2=A0 soname_spec=3D&#39;${libname}${release}${shared_ext}$major&#3=
9;<br>
=C2=A0 =C2=A0 shlibpath_var=3DLIBRARY_PATH<br>
=C2=A0 =C2=A0 shlibpath_overrides_runpath=3Dyes<br>
@@ -18609,7 +18611,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 hardcode_into_libs=3Dyes<br>
=C2=A0 =C2=A0 ;;<br>
<br>
-@@ -15515,6 +16350,7 @@<br>
+@@ -15035,6 +15870,7 @@ fi<br>
=C2=A0 =C2=A0 fi # test -n &quot;$compiler&quot;<br>
<br>
=C2=A0 =C2=A0 CC=3D$lt_save_CC<br>
@@ -18617,7 +18619,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 LDCXX=3D$LD<br>
=C2=A0 =C2=A0 LD=3D$lt_save_LD<br>
=C2=A0 =C2=A0 GCC=3D$lt_save_GCC<br>
-@@ -17754,13 +18590,20 @@<br>
+@@ -17807,13 +18643,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 lt_unset=3D&#39;`$ECHO &quot;$lt_unset&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_SP2NL=3D&#39;`$ECHO &quot;$lt_SP2NL&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 lt_NL2SP=3D&#39;`$ECHO &quot;$lt_NL2SP&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
@@ -18638,7 +18640,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 STRIP=3D&#39;`$ECHO &quot;$STRIP&quot; | $SED &quot;$delay_single_qu=
ote_subst&quot;`&#39;<br>
=C2=A0 RANLIB=3D&#39;`$ECHO &quot;$RANLIB&quot; | $SED &quot;$delay_single_=
quote_subst&quot;`&#39;<br>
=C2=A0 old_postinstall_cmds=3D&#39;`$ECHO &quot;$old_postinstall_cmds&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17775,14 +18618,17 @@<br>
+@@ -17828,14 +18671,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;`$ECHO &quot=
;$lt_cv_sys_global_symbol_pipe&quot; | $SED &quot;$de<br>
=C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&#39;`$ECHO &quot;$lt_cv_sys_glob=
al_symbol_to_cdecl&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;=
<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address=3D&#39;`$ECHO &quot;$lt_cv=
_sys_global_symbol_to_c_name_address&quot; | $SED &quot;$delay_single_quote=
_subst&quot;`&#39;<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D&#39;`$ECHO &=
quot;$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix&quot; | $SED &qu=
ot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -18657,7 +18659,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 DSYMUTIL=3D&#39;`$ECHO &quot;$DSYMUTIL&quot; | $SED &quot;$delay_sin=
gle_quote_subst&quot;`&#39;<br>
=C2=A0 NMEDIT=3D&#39;`$ECHO &quot;$NMEDIT&quot; | $SED &quot;$delay_single_=
quote_subst&quot;`&#39;<br>
=C2=A0 LIPO=3D&#39;`$ECHO &quot;$LIPO&quot; | $SED &quot;$delay_single_quot=
e_subst&quot;`&#39;<br>
-@@ -17815,12 +18661,12 @@<br>
+@@ -17868,12 +18714,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;$hard=
code_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
=C2=A0 hardcode_automatic=3D&#39;`$ECHO &quot;$hardcode_automatic&quot; | $=
SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 inherit_rpath=3D&#39;`$ECHO &quot;$inherit_rpath&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 link_all_deplibs=3D&#39;`$ECHO &quot;$link_all_deplibs&quot; | $SED =
&quot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -18671,7 +18673,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 file_list_spec=3D&#39;`$ECHO &quot;$file_list_spec&quot; | $SED &quo=
t;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 variables_saved_for_relink=3D&#39;`$ECHO &quot;$variables_saved_for_=
relink&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 need_lib_prefix=3D&#39;`$ECHO &quot;$need_lib_prefix&quot; | $SED &q=
uot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17859,8 +18705,8 @@<br>
+@@ -17912,8 +18758,8 @@ old_archive_cmds_CXX=3D&#39;`$ECHO &quot;$old_arch=
ive_cmds_CXX&quot; | $SED &quot;$delay_single_quote<br>
=C2=A0 compiler_CXX=3D&#39;`$ECHO &quot;$compiler_CXX&quot; | $SED &quot;$d=
elay_single_quote_subst&quot;`&#39;<br>
=C2=A0 GCC_CXX=3D&#39;`$ECHO &quot;$GCC_CXX&quot; | $SED &quot;$delay_singl=
e_quote_subst&quot;`&#39;<br>
=C2=A0 lt_prog_compiler_no_builtin_flag_CXX=3D&#39;`$ECHO &quot;$lt_prog_co=
mpiler_no_builtin_flag_CXX&quot; | $SED &quot;$delay_single_quote_subst&quo=
t;`&#39;<br>
@@ -18681,7 +18683,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 lt_prog_compiler_static_CXX=3D&#39;`$ECHO &quot;$lt_prog_compiler_st=
atic_CXX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 lt_cv_prog_compiler_c_o_CXX=3D&#39;`$ECHO &quot;$lt_cv_prog_compiler=
_c_o_CXX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 archive_cmds_need_lc_CXX=3D&#39;`$ECHO &quot;$archive_cmds_need_lc_C=
XX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17887,12 +18733,12 @@<br>
+@@ -17940,12 +18786,12 @@ hardcode_shlibpath_var_CXX=3D&#39;`$ECHO &quot;$=
hardcode_shlibpath_var_CXX&quot; | $SED &quot;$delay_<br>
=C2=A0 hardcode_automatic_CXX=3D&#39;`$ECHO &quot;$hardcode_automatic_CXX&q=
uot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 inherit_rpath_CXX=3D&#39;`$ECHO &quot;$inherit_rpath_CXX&quot; | $SE=
D &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 link_all_deplibs_CXX=3D&#39;`$ECHO &quot;$link_all_deplibs_CXX&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
@@ -18695,7 +18697,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 file_list_spec_CXX=3D&#39;`$ECHO &quot;$file_list_spec_CXX&quot; | $=
SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 hardcode_action_CXX=3D&#39;`$ECHO &quot;$hardcode_action_CXX&quot; |=
 $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
=C2=A0 compiler_lib_search_dirs_CXX=3D&#39;`$ECHO &quot;$compiler_lib_searc=
h_dirs_CXX&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
-@@ -17930,8 +18776,13 @@<br>
+@@ -17983,8 +18829,13 @@ reload_flag \<br>
=C2=A0 OBJDUMP \<br>
=C2=A0 deplibs_check_method \<br>
=C2=A0 file_magic_cmd \<br>
@@ -18709,7 +18711,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 STRIP \<br>
=C2=A0 RANLIB \<br>
=C2=A0 CC \<br>
-@@ -17941,12 +18792,14 @@<br>
+@@ -17994,12 +18845,14 @@ lt_cv_sys_global_symbol_pipe \<br>
=C2=A0 lt_cv_sys_global_symbol_to_cdecl \<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address \<br>
=C2=A0 lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \<br>
@@ -18725,7 +18727,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 DSYMUTIL \<br>
=C2=A0 NMEDIT \<br>
=C2=A0 LIPO \<br>
-@@ -17962,7 +18815,6 @@<br>
+@@ -18015,7 +18868,6 @@ no_undefined_flag \<br>
=C2=A0 hardcode_libdir_flag_spec \<br>
=C2=A0 hardcode_libdir_flag_spec_ld \<br>
=C2=A0 hardcode_libdir_separator \<br>
@@ -18733,7 +18735,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 exclude_expsyms \<br>
=C2=A0 include_expsyms \<br>
=C2=A0 file_list_spec \<br>
-@@ -17984,8 +18836,8 @@<br>
+@@ -18037,8 +18889,8 @@ LD_CXX \<br>
=C2=A0 reload_flag_CXX \<br>
=C2=A0 compiler_CXX \<br>
=C2=A0 lt_prog_compiler_no_builtin_flag_CXX \<br>
@@ -18743,7 +18745,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 lt_prog_compiler_static_CXX \<br>
=C2=A0 lt_cv_prog_compiler_c_o_CXX \<br>
=C2=A0 export_dynamic_flag_spec_CXX \<br>
-@@ -17997,7 +18849,6 @@<br>
+@@ -18050,7 +18902,6 @@ no_undefined_flag_CXX \<br>
=C2=A0 hardcode_libdir_flag_spec_CXX \<br>
=C2=A0 hardcode_libdir_flag_spec_ld_CXX \<br>
=C2=A0 hardcode_libdir_separator_CXX \<br>
@@ -18751,7 +18753,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 exclude_expsyms_CXX \<br>
=C2=A0 include_expsyms_CXX \<br>
=C2=A0 file_list_spec_CXX \<br>
-@@ -18031,6 +18882,7 @@<br>
+@@ -18084,6 +18935,7 @@ module_cmds \<br>
=C2=A0 module_expsym_cmds \<br>
=C2=A0 export_symbols_cmds \<br>
=C2=A0 prelink_cmds \<br>
@@ -18759,7 +18761,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 postinstall_cmds \<br>
=C2=A0 postuninstall_cmds \<br>
=C2=A0 finish_cmds \<br>
-@@ -18045,7 +18897,8 @@<br>
+@@ -18098,7 +18950,8 @@ archive_expsym_cmds_CXX \<br>
=C2=A0 module_cmds_CXX \<br>
=C2=A0 module_expsym_cmds_CXX \<br>
=C2=A0 export_symbols_cmds_CXX \<br>
@@ -18769,7 +18771,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 =C2=A0 =C2=A0 case \`eval \\\\\$ECHO \\\\&quot;&quot;\\\\\$\$var&quo=
t;\\\\&quot;\` in<br>
=C2=A0 =C2=A0 =C2=A0 *[\\\\\\\`\\&quot;\\\$]*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval &quot;lt_\$var=3D\\\\\\&quot;\\\`\\\$ECHO =
\\&quot;\\\$\$var\\&quot; | \\\$SED -e \\&quot;\\\$double_quote_subst\\&quo=
t; -e \\&quot;\\\$sed_quote_subst\\&quot; -e \\&quot;\\\$delay_variable_sub=
st\\&quot;\\\`\\\\\\&quot;&quot;<br>
-@@ -18838,7 +19691,8 @@<br>
+@@ -18891,7 +19744,8 @@ $as_echo X&quot;$file&quot; |<br>
=C2=A0 # NOTE: Changes made to this file will be lost: look at ltmain.sh.<b=
r>
=C2=A0 #<br>
=C2=A0 #=C2=A0 =C2=A0Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003=
, 2004, 2005,<br>
@@ -18779,7 +18781,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 #=C2=A0 =C2=A0Written by Gordon Matzigkeit, 1996<br>
=C2=A0 #<br>
=C2=A0 #=C2=A0 =C2=A0This file is part of GNU Libtool.<br>
-@@ -18941,19 +19795,42 @@<br>
+@@ -18994,19 +19848,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
=C2=A0 # turn newlines into spaces.<br>
=C2=A0 NL2SP=3D$lt_lt_NL2SP<br>
<br>
@@ -18823,7 +18825,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # A symbol stripping program.<br>
=C2=A0 STRIP=3D$lt_STRIP<br>
<br>
-@@ -18983,6 +19860,12 @@<br>
+@@ -19036,6 +19913,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys_g=
lobal_symbol_to_c_name_address<br>
=C2=A0 # Transform the output of nm in a C name address pair when lib prefi=
x is needed.<br>
=C2=A0 global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix<br>
<br>
@@ -18836,7 +18838,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # The name of the directory that contains temporary libtool files.<b=
r>
=C2=A0 objdir=3D$objdir<br>
<br>
-@@ -18992,6 +19875,9 @@<br>
+@@ -19045,6 +19928,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
=C2=A0 # Must we lock files when doing compilation?<br>
=C2=A0 need_locks=3D$lt_need_locks<br>
<br>
@@ -18846,7 +18848,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Tool to manipulate archived DWARF debug symbol files on Mac OS X.<=
br>
=C2=A0 DSYMUTIL=3D$lt_DSYMUTIL<br>
<br>
-@@ -19106,12 +19992,12 @@<br>
+@@ -19159,12 +20045,12 @@ with_gcc=3D$GCC<br>
=C2=A0 # Compiler flag to turn off builtin functions.<br>
=C2=A0 no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag<br>
<br>
@@ -18862,7 +18864,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Compiler flag to prevent dynamic linking.<br>
=C2=A0 link_static_flag=3D$lt_lt_prog_compiler_static<br>
<br>
-@@ -19198,9 +20084,6 @@<br>
+@@ -19251,9 +20137,6 @@ inherit_rpath=3D$inherit_rpath<br>
=C2=A0 # Whether libtool must link a program against all its dependency lib=
raries.<br>
=C2=A0 link_all_deplibs=3D$link_all_deplibs<br>
<br>
@@ -18872,7 +18874,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Set to &quot;yes&quot; if exported symbols are required.<br>
=C2=A0 always_export_symbols=3D$always_export_symbols<br>
<br>
-@@ -19216,6 +20099,9 @@<br>
+@@ -19269,6 +20152,9 @@ include_expsyms=3D$lt_include_expsyms<br>
=C2=A0 # Commands necessary for linking programs (against libraries) with t=
emplates.<br>
=C2=A0 prelink_cmds=3D$lt_prelink_cmds<br>
<br>
@@ -18882,7 +18884,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Specify filename containing input files.<br>
=C2=A0 file_list_spec=3D$lt_file_list_spec<br>
<br>
-@@ -19262,210 +20148,169 @@<br>
+@@ -19315,210 +20201,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot;<br>
=C2=A0 =C2=A0 # if finds mixed CR/LF and LF-only lines.=C2=A0 Since sed ope=
rates in<br>
=C2=A0 =C2=A0 # text mode, it properly converts lines to CR/LF.=C2=A0 This =
bash problem<br>
=C2=A0 =C2=A0 # is reportedly fixed, but why not run on old versions too?<b=
r>
@@ -19084,9 +19086,15 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0-_LT_EOF<br>
=C2=A0-=C2=A0 =C2=A0 ;;<br>
=C2=A0-=C2=A0 esac<br>
+-<br>
+-<br>
+-=C2=A0 sed -n &#39;/^# Generated shell functions inserted here/,$p&#39; &=
quot;$ltmain&quot; &gt;&gt; &quot;$cfgfile&quot; \<br>
+-=C2=A0 =C2=A0 || (rm -f &quot;$cfgfile&quot;; exit 1)<br>
+-<br>
+-=C2=A0 mv -f &quot;$cfgfile&quot; &quot;$ofile&quot; ||<br>
=C2=A0+=C2=A0 sed &#39;$q&#39; &quot;$ltmain&quot; &gt;&gt; &quot;$cfgfile&=
quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0|| (rm -f &quot;$cfgfile&quot;; exit 1)<br>
-<br>
++<br>
=C2=A0+=C2=A0 if test x&quot;$xsi_shell&quot; =3D xyes; then<br>
=C2=A0+=C2=A0 sed -e &#39;/^func_dirname ()$/,/^} # func_dirname /c\<br>
=C2=A0+func_dirname ()\<br>
@@ -19244,16 +19252,13 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0+=C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: WARNING: Unable=
 to substitute extended shell functions in $ofile&quot; &gt;&amp;5<br>
=C2=A0+$as_echo &quot;$as_me: WARNING: Unable to substitute extended shell =
functions in $ofile&quot; &gt;&amp;2;}<br>
=C2=A0+fi<br>
-<br>
--=C2=A0 sed -n &#39;/^# Generated shell functions inserted here/,$p&#39; &=
quot;$ltmain&quot; &gt;&gt; &quot;$cfgfile&quot; \<br>
--=C2=A0 =C2=A0 || (rm -f &quot;$cfgfile&quot;; exit 1)<br>
-<br>
--=C2=A0 mv -f &quot;$cfgfile&quot; &quot;$ofile&quot; ||<br>
++<br>
++<br>
=C2=A0+=C2=A0 =C2=A0mv -f &quot;$cfgfile&quot; &quot;$ofile&quot; ||<br>
=C2=A0 =C2=A0 =C2=A0 (rm -f &quot;$ofile&quot; &amp;&amp; cp &quot;$cfgfile=
&quot; &quot;$ofile&quot; &amp;&amp; rm -f &quot;$cfgfile&quot;)<br>
=C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
<br>
-@@ -19493,12 +20338,12 @@<br>
+@@ -19546,12 +20391,12 @@ with_gcc=3D$GCC_CXX<br>
=C2=A0 # Compiler flag to turn off builtin functions.<br>
=C2=A0 no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX<br>
<br>
@@ -19269,7 +19274,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Compiler flag to prevent dynamic linking.<br>
=C2=A0 link_static_flag=3D$lt_lt_prog_compiler_static_CXX<br>
<br>
-@@ -19585,9 +20430,6 @@<br>
+@@ -19638,9 +20483,6 @@ inherit_rpath=3D$inherit_rpath_CXX<br>
=C2=A0 # Whether libtool must link a program against all its dependency lib=
raries.<br>
=C2=A0 link_all_deplibs=3D$link_all_deplibs_CXX<br>
<br>
@@ -19279,7 +19284,7 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Set to &quot;yes&quot; if exported symbols are required.<br>
=C2=A0 always_export_symbols=3D$always_export_symbols_CXX<br>
<br>
-@@ -19603,6 +20445,9 @@<br>
+@@ -19656,6 +20498,9 @@ include_expsyms=3D$lt_include_expsyms_CXX<br>
=C2=A0 # Commands necessary for linking programs (against libraries) with t=
emplates.<br>
=C2=A0 prelink_cmds=3D$lt_prelink_cmds_CXX<br>
<br>
@@ -19289,10 +19294,10 @@ Index: binutils-2.24/ld/configure<br>
=C2=A0 # Specify filename containing input files.<br>
=C2=A0 file_list_spec=3D$lt_file_list_spec_CXX<br>
<br>
-Index: binutils-2.24/bfd/<a href=3D"http://configure.in" target=3D"_blank"=
>configure.in</a><br>
+Index: binutils-2.24/bfd/<a href=3D"http://configure.ac" target=3D"_blank"=
>configure.ac</a><br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/bfd/<a href=3D"http://configure.in" target=3D"_blan=
k">configure.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12-02 01:30:28.00000000=
0 -0800<br>
-+++ binutils-2.24/bfd/<a href=3D"http://configure.in" target=3D"_blank">co=
nfigure.in</a>=C2=A0 =C2=A0 =C2=A02013-12-15 11:10:23.887118697 -0800<br>
+--- binutils-2.24.orig/bfd/<a href=3D"http://configure.ac" target=3D"_blan=
k">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-12-02 01:30:28.00000000=
0 -0800<br>
++++ binutils-2.24/bfd/<a href=3D"http://configure.ac" target=3D"_blank">co=
nfigure.ac</a>=C2=A0 =C2=A0 =C2=A02013-12-15 11:10:23.887118697 -0800<br>
=C2=A0@@ -568,7 +568,7 @@<br>
=C2=A0 =C2=A0 x=3D`sed -n -e &#39;s/^[=C2=A0 ]*PICFLAG[=C2=A0 =C2=A0 =C2=A0=
 ]*=3D[=C2=A0 =C2=A0 ]*//p&#39; &lt; ../libiberty/Makefile | sed -n &#39;$p=
&#39;`<br>
=C2=A0 changequote([,])dnl<br>
@@ -19302,10 +19307,10 @@ Index: binutils-2.24/bfd/<a href=3D"http://config=
ure.in" target=3D"_blank">configure.in</a><br>
=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 # More hacks to build DLLs on Windows.<br>
-Index: binutils-2.24/opcodes/<a href=3D"http://configure.in" target=3D"_bl=
ank">configure.in</a><br>
+Index: binutils-2.24/opcodes/<a href=3D"http://configure.ac" target=3D"_bl=
ank">configure.ac</a><br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- binutils-2.24.orig/opcodes/<a href=3D"http://configure.in" target=3D"_=
blank">configure.in</a>=C2=A0 =C2=A0 2013-11-04 07:33:40.000000000 -0800<br=
>
-+++ binutils-2.24/opcodes/<a href=3D"http://configure.in" target=3D"_blank=
">configure.in</a> 2013-12-15 11:10:23.887118697 -0800<br>
+--- binutils-2.24.orig/opcodes/<a href=3D"http://configure.ac" target=3D"_=
blank">configure.ac</a>=C2=A0 =C2=A0 2013-11-04 07:33:40.000000000 -0800<br=
>
++++ binutils-2.24/opcodes/<a href=3D"http://configure.ac" target=3D"_blank=
">configure.ac</a> 2013-12-15 11:10:23.887118697 -0800<br>
=C2=A0@@ -162,7 +162,7 @@<br>
=C2=A0 =C2=A0 x=3D`sed -n -e &#39;s/^[=C2=A0 ]*PICFLAG[=C2=A0 =C2=A0 =C2=A0=
 ]*=3D[=C2=A0 =C2=A0 ]*//p&#39; &lt; ../libiberty/Makefile | sed -n &#39;$p=
&#39;`<br>
=C2=A0 changequote([,])dnl<br>
diff --git a/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emul=
ation.patch b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emu=
lation.patch<br>
index 51eaf0b..e668faa 100644<br>
--- a/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.p=
atch<br>
+++ b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.p=
atch<br>
@@ -9,30 +9,24 @@ Index: binutils-2.24/bfd/config.bfd<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- binutils-2.24.orig/bfd/config.bfd=C2=A0 2013-11-04 07:33:37.00000=
0000 -0800<br>
=C2=A0+++ binutils-2.24/bfd/config.bfd=C2=A0 =C2=A0 =C2=A0 =C2=A02013-12-15=
 11:54:57.113765374 -0800<br>
-@@ -1052,14 +1052,14 @@<br>
-=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dbfd_elf32_bigmips_vec<br>
-=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;bfd_elf32_littlemips_vec bfd_elf6=
4_bigmips_vec bfd_elf64_littlemips_vec ecoff_big_vec ecoff_little_vec&quot;=
<br>
+Index: binutils-2.24/ld/configure.tgt<br>
+@@ -1062,12 +1062,12 @@ case &quot;${targ}&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;mips_elf32_le_vec mips_elf64_be_v=
ec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec&quot;<br>
+=C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0mips64*el-*-linux*)<br>
+-=C2=A0 =C2=A0 targ_defvec=3Dmips_elf32_ntrad_le_vec<br>
+-=C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_ntrad_be_vec mips_elf32_tra=
d_le_vec mips_elf32_trad_be_vec mips_elf64_trad_le_vec mips_elf64_trad_be_v=
ec&quot;<br>
++=C2=A0 =C2=A0 targ_defvec=3Dmips_elf64_trad_le_vec<br>
++=C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_ntrad_be_vec mips_elf32_ntr=
ad_le_vec mips_elf32_trad_le_vec mips_elf32_trad_be_vec mips_elf64_trad_be_=
vec&quot;<br>
+=C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0mips64*-*-linux*)<br>
+-=C2=A0 =C2=A0 targ_defvec=3Dmips_elf32_ntrad_be_vec<br>
+-=C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_ntrad_le_vec mips_elf32_tra=
d_be_vec mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_v=
ec&quot;<br>
++=C2=A0 =C2=A0 targ_defvec=3Dmips_elf64_trad_be_vec<br>
++=C2=A0 =C2=A0 targ_selvecs=3D&quot;mips_elf32_ntrad_be_vec mips_elf32_ntr=
ad_be_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_=
vec&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
--=C2=A0 mips64*el-*-linux*)<br>
--=C2=A0 =C2=A0 targ_defvec=3Dbfd_elf32_ntradlittlemips_vec<br>
--=C2=A0 =C2=A0 targ_selvecs=3D&quot;bfd_elf32_ntradbigmips_vec bfd_elf32_t=
radlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf64_tradlittlemips_vec bf=
d_elf64_tradbigmips_vec&quot;<br>
--=C2=A0 =C2=A0 ;;<br>
--=C2=A0 mips64*-*-linux*)<br>
--=C2=A0 =C2=A0 targ_defvec=3Dbfd_elf32_ntradbigmips_vec<br>
--=C2=A0 =C2=A0 targ_selvecs=3D&quot;bfd_elf32_ntradlittlemips_vec bfd_elf3=
2_tradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf64_tradbigmips_vec bf=
d_elf64_tradlittlemips_vec&quot;<br>
--=C2=A0 =C2=A0 ;;<br>
-+=C2=A0 =C2=A0mips64*el-*-linux*)<br>
-+=C2=A0 =C2=A0 targ_defvec=3Dbfd_elf64_tradlittlemips_vec<br>
-+=C2=A0 =C2=A0 targ_selvecs=3D&quot;bfd_elf32_ntradbigmips_vec bfd_elf32_n=
tradlittlemips_vec bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec b=
fd_elf64_tradbigmips_vec&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0;;<br>
-+=C2=A0 =C2=A0mips64*-*-linux*)<br>
-+=C2=A0 =C2=A0 targ_defvec=3Dbfd_elf64_tradbigmips_vec<br>
-+=C2=A0 =C2=A0 targ_selvecs=3D&quot;bfd_elf32_ntradbigmips_vec bfd_elf32_n=
tradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf32_tradlittlemips_vec b=
fd_elf64_tradlittlemips_vec&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 mips*el-*-linux*)<br>
-=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dbfd_elf32_tradlittlemips_vec<br>
-=C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;bfd_elf32_tradbigmips_vec ecoff_l=
ittle_vec ecoff_big_vec bfd_elf32_ntradlittlemips_vec bfd_elf64_tradlittlem=
ips_vec bfd_elf32_ntradbigmips_vec bfd_elf64_tradbigmips_vec&quot;<br>
-Index: binutils-2.24/ld/configure.tgt<br>
+=C2=A0 =C2=A0 =C2=A0targ_defvec=3Dmips_elf32_trad_le_vec<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0--- binutils-2.24.orig/ld/configure.tgt=C2=A0 =C2=A0 =C2=A0 =C2=A0 20=
13-11-26 03:37:33.000000000 -0800<br>
=C2=A0+++ binutils-2.24/ld/configure.tgt=C2=A0 =C2=A0 =C2=A02013-12-15 11:5=
0:52.273766155 -0800<br>
diff --git a/meta/recipes-devtools/binutils/binutils/replace_macros_with_st=
atic_inline.patch b/meta/recipes-devtools/binutils/binutils/replace_macros_=
with_static_inline.patch<br>
deleted file mode 100644<br>
index 834f55c..0000000<br>
--- a/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_in=
line.patch<br>
+++ /dev/null<br>
@@ -1,188 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-From 27b829ee701e29804216b3803fbaeb629be27491 Mon Sep 17 00:00:00 2001<br>
-From: Nick Clifton &lt;<a href=3D"mailto:nickc@redhat.com">nickc@redhat.co=
m</a>&gt;<br>
-Date: Wed, 29 Jan 2014 13:46:39 +0000<br>
-Subject: [PATCH 1/1] Following up on Tom&#39;s suggestion I am checking in=
 a patch to replace the various<br>
- bfd_xxx_set macros with static inline functions, so that we can avoid com=
pile time<br>
- warnings about comma expressions with unused values.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* bfd-in.h (bfd_set_section_vma): Delete.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(bfd_set_section_alignment): Delete.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(bfd_set_section_userdata): Delete.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(bfd_set_cacheable): Delete.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* bfd.c (bfd_set_cacheable): New static inline =
function.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* section.c (bfd_set_section_userdata): Likewis=
e.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(bfd_set_section_vma): Likewise.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0(bfd_set_section_alignment): Likewise.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* bfd-in2.h: Regenerate.<br>
----<br>
- bfd/ChangeLog |=C2=A0 =C2=A012 ++++++++++++<br>
- bfd/bfd-in.h=C2=A0 |=C2=A0 =C2=A0 5 -----<br>
- bfd/bfd-in2.h |=C2=A0 =C2=A041 +++++++++++++++++++++++++++++++++++------<=
br>
- bfd/bfd.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 ++++++++<br>
- bfd/section.c |=C2=A0 =C2=A026 ++++++++++++++++++++++++++<br>
- 5 files changed, 81 insertions(+), 11 deletions(-)<br>
-<br>
-diff --git a/bfd/bfd-in.h b/bfd/bfd-in.h<br>
-index 3afd71b..c7c5a7d 100644<br>
---- a/bfd/bfd-in.h<br>
-+++ b/bfd/bfd-in.h<br>
-@@ -292,9 +292,6 @@ typedef struct bfd_section *sec_ptr;<br>
-<br>
- #define bfd_is_com_section(ptr) (((ptr)-&gt;flags &amp; SEC_IS_COMMON) !=
=3D 0)<br>
-<br>
--#define bfd_set_section_vma(bfd, ptr, val) (((ptr)-&gt;vma =3D (ptr)-&gt;=
lma =3D (val)), ((ptr)-&gt;user_set_vma =3D TRUE), TRUE)<br>
--#define bfd_set_section_alignment(bfd, ptr, val) (((ptr)-&gt;alignment_po=
wer =3D (val)),TRUE)<br>
--#define bfd_set_section_userdata(bfd, ptr, val) (((ptr)-&gt;userdata =3D =
(val)),TRUE)<br>
- /* Find the address one past the end of SEC.=C2=A0 */<br>
- #define bfd_get_section_limit(bfd, sec) \<br>
-=C2=A0 =C2=A0(((bfd)-&gt;direction !=3D write_direction &amp;&amp; (sec)-&=
gt;rawsize !=3D 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-@@ -517,8 +514,6 @@ extern void warn_deprecated (const char *, const char =
*, int, const char *);<br>
-<br>
- #define bfd_get_symbol_leading_char(abfd) ((abfd)-&gt;xvec-&gt;symbol_lea=
ding_char)<br>
-<br>
--#define bfd_set_cacheable(abfd,bool) (((abfd)-&gt;cacheable =3D bool), TR=
UE)<br>
--<br>
- extern bfd_boolean bfd_cache_close<br>
-=C2=A0 =C2=A0(bfd *abfd);<br>
- /* NB: This declaration should match the autogenerated one in libbfd.h.=
=C2=A0 */<br>
-diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h<br>
-index 71996db..b5aeb40 100644<br>
---- a/bfd/bfd-in2.h<br>
-+++ b/bfd/bfd-in2.h<br>
-@@ -299,9 +299,6 @@ typedef struct bfd_section *sec_ptr;<br>
-<br>
- #define bfd_is_com_section(ptr) (((ptr)-&gt;flags &amp; SEC_IS_COMMON) !=
=3D 0)<br>
-<br>
--#define bfd_set_section_vma(bfd, ptr, val) (((ptr)-&gt;vma =3D (ptr)-&gt;=
lma =3D (val)), ((ptr)-&gt;user_set_vma =3D TRUE), TRUE)<br>
--#define bfd_set_section_alignment(bfd, ptr, val) (((ptr)-&gt;alignment_po=
wer =3D (val)),TRUE)<br>
--#define bfd_set_section_userdata(bfd, ptr, val) (((ptr)-&gt;userdata =3D =
(val)),TRUE)<br>
- /* Find the address one past the end of SEC.=C2=A0 */<br>
- #define bfd_get_section_limit(bfd, sec) \<br>
-=C2=A0 =C2=A0(((bfd)-&gt;direction !=3D write_direction &amp;&amp; (sec)-&=
gt;rawsize !=3D 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-@@ -524,8 +521,6 @@ extern void warn_deprecated (const char *, const char =
*, int, const char *);<br>
-<br>
- #define bfd_get_symbol_leading_char(abfd) ((abfd)-&gt;xvec-&gt;symbol_lea=
ding_char)<br>
-<br>
--#define bfd_set_cacheable(abfd,bool) (((abfd)-&gt;cacheable =3D bool), TR=
UE)<br>
--<br>
- extern bfd_boolean bfd_cache_close<br>
-=C2=A0 =C2=A0(bfd *abfd);<br>
- /* NB: This declaration should match the autogenerated one in libbfd.h.=
=C2=A0 */<br>
-@@ -1029,7 +1024,7 @@ bfd *bfd_openr (const char *filename, const char *ta=
rget);<br>
-<br>
- bfd *bfd_fdopenr (const char *filename, const char *target, int fd);<br>
-<br>
--bfd *bfd_openstreamr (const char *, const char *, void *);<br>
-+bfd *bfd_openstreamr (const char * filename, const char * target, void * =
stream);<br>
-<br>
- bfd *bfd_openr_iovec (const char *filename, const char *target,<br>
-=C2=A0 =C2=A0 =C2=A0void *(*open_func) (struct bfd *nbfd,<br>
-@@ -1596,6 +1591,32 @@ struct relax_table {<br>
-=C2=A0 =C2=A0int size;<br>
- };<br>
-<br>
-+/* Note: the following are provided as inline functions rather than macro=
s<br>
-+=C2=A0 =C2=A0because not all callers use the return value.=C2=A0 A macro =
implementation<br>
-+=C2=A0 =C2=A0would use a comma expression, eg: &quot;((ptr)-&gt;foo =3D v=
al, TRUE)&quot; and some<br>
-+=C2=A0 =C2=A0compilers will complain about comma expressions that have no=
 effect.=C2=A0 */<br>
-+static inline bfd_boolean<br>
-+bfd_set_section_userdata (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, vo=
id * val)<br>
-+{<br>
-+=C2=A0 ptr-&gt;userdata =3D val;<br>
-+=C2=A0 return TRUE;<br>
-+}<br>
-+<br>
-+static inline bfd_boolean<br>
-+bfd_set_section_vma (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, bfd_vma=
 val)<br>
-+{<br>
-+=C2=A0 ptr-&gt;vma =3D ptr-&gt;lma =3D val;<br>
-+=C2=A0 ptr-&gt;user_set_vma =3D TRUE;<br>
-+=C2=A0 return TRUE;<br>
-+}<br>
-+<br>
-+static inline bfd_boolean<br>
-+bfd_set_section_alignment (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, u=
nsigned int val)<br>
-+{<br>
-+=C2=A0 ptr-&gt;alignment_power =3D val;<br>
-+=C2=A0 return TRUE;<br>
-+}<br>
-+<br>
- /* These sections are global, and are managed by BFD.=C2=A0 The applicati=
on<br>
-=C2=A0 =C2=A0 and target back end are not permitted to change the values i=
n<br>
-=C2=A0 =C2=A0 these sections.=C2=A0 */<br>
-@@ -6415,6 +6436,14 @@ struct bfd<br>
-=C2=A0 =C2=A0unsigned int selective_search : 1;<br>
- };<br>
-<br>
-+/* See note beside bfd_set_section_userdata.=C2=A0 */<br>
-+static inline bfd_boolean<br>
-+bfd_set_cacheable (bfd * abfd, bfd_boolean val)<br>
-+{<br>
-+=C2=A0 abfd-&gt;cacheable =3D val;<br>
-+=C2=A0 return TRUE;<br>
-+}<br>
-+<br>
- typedef enum bfd_error<br>
- {<br>
-=C2=A0 =C2=A0bfd_error_no_error =3D 0,<br>
-diff --git a/bfd/bfd.c b/bfd/bfd.c<br>
-index 8d0580c..2d174f3 100644<br>
---- a/bfd/bfd.c<br>
-+++ b/bfd/bfd.c<br>
-@@ -311,6 +311,14 @@ CODE_FRAGMENT<br>
- .=C2=A0 unsigned int selective_search : 1;<br>
- .};<br>
- .<br>
-+.{* See note beside bfd_set_section_userdata.=C2=A0 *}<br>
-+.static inline bfd_boolean<br>
-+.bfd_set_cacheable (bfd * abfd, bfd_boolean val)<br>
-+.{<br>
-+.=C2=A0 abfd-&gt;cacheable =3D val;<br>
-+.=C2=A0 return TRUE;<br>
-+.}<br>
-+.<br>
- */<br>
-<br>
- #include &quot;sysdep.h&quot;<br>
-diff --git a/bfd/section.c b/bfd/section.c<br>
-index fb19d8c..a661228 100644<br>
---- a/bfd/section.c<br>
-+++ b/bfd/section.c<br>
-@@ -542,6 +542,32 @@ CODE_FRAGMENT<br>
- .=C2=A0 int size;<br>
- .};<br>
- .<br>
-+.{* Note: the following are provided as inline functions rather than macr=
os<br>
-+.=C2=A0 =C2=A0because not all callers use the return value.=C2=A0 A macro=
 implementation<br>
-+.=C2=A0 =C2=A0would use a comma expression, eg: &quot;((ptr)-&gt;foo =3D =
val, TRUE)&quot; and some<br>
-+.=C2=A0 =C2=A0compilers will complain about comma expressions that have n=
o effect.=C2=A0 *}<br>
-+.static inline bfd_boolean<br>
-+.bfd_set_section_userdata (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, v=
oid * val)<br>
-+.{<br>
-+.=C2=A0 ptr-&gt;userdata =3D val;<br>
-+.=C2=A0 return TRUE;<br>
-+.}<br>
-+.<br>
-+.static inline bfd_boolean<br>
-+.bfd_set_section_vma (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, bfd_vm=
a val)<br>
-+.{<br>
-+.=C2=A0 ptr-&gt;vma =3D ptr-&gt;lma =3D val;<br>
-+.=C2=A0 ptr-&gt;user_set_vma =3D TRUE;<br>
-+.=C2=A0 return TRUE;<br>
-+.}<br>
-+.<br>
-+.static inline bfd_boolean<br>
-+.bfd_set_section_alignment (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, =
unsigned int val)<br>
-+.{<br>
-+.=C2=A0 ptr-&gt;alignment_power =3D val;<br>
-+.=C2=A0 return TRUE;<br>
-+.}<br>
-+.<br>
- .{* These sections are global, and are managed by BFD.=C2=A0 The applicat=
ion<br>
- .=C2=A0 =C2=A0and target back end are not permitted to change the values =
in<br>
- .=C2=A0 =C2=A0these sections.=C2=A0 *}<br>
---<br>
-1.7.1<br>
-<br>
diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.24=
.bb" target=3D"_blank">binutils_2.24.bb</a> b/meta/recipes-devtools/binutil=
s/<a href=3D"http://binutils_2.25.bb" target=3D"_blank">binutils_2.25.bb</a=
><br>
similarity index 100%<br>
rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.24.=
bb" target=3D"_blank">binutils_2.24.bb</a><br>
rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils_2.25.bb=
" target=3D"_blank">binutils_2.25.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--089e016337aadc225405107c54ae--
