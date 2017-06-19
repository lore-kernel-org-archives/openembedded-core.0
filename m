Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 248EF77FA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 10:42:42 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id m47so64004852iti.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IbO5k5h1WsytL28Knl0xKmkYCiJ1uBtAODiqomh+xoc=;
	b=lc1kqbBW51CSmduJXfUByEBvzclep40OjTW7qPVtsduOLlH8pXDw5VZLpEijJnrYcp
	2lfIYvDckL0hqV8LS76PXWRpY6WGVUK3T9bAmZCE+UFHYFcovhfdwedlBFn00ESokVoK
	DMVMmoRVtwOG+U8hiyrJkLHyLvrN38YKBlMHP3XRvtKEUaK0oUnTThfOvTvyM9MeQyrg
	5fwW+AQvX+p0sW5oQO4a0zEFzCLVYeVbyv26AboF1HpywqyoemiMrllOdGe2TOIePhdj
	/LqRjbti4ji6QU+ifqfvzvfIZUCu+h9PzGvvcBEWjqoPjpcoy+VrN1Sncn3BJhDAj2ip
	mncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IbO5k5h1WsytL28Knl0xKmkYCiJ1uBtAODiqomh+xoc=;
	b=cLK92LMzOvfDha7Hz/zI6sFXL/DrIUwhvjpJpzKmXMyfBQ2WtjJVSoH+/XuMvUCPvf
	21lUSL6Ip137rlWRgmIa94SK08LWvvYXAOgVSpt625M5QbwvPBflz8nL7Ed0bpXA0+Co
	aJX0BHBlOo/nIsAt0bNzVRh6VwT/llNdPTsy2VyQSCWiiIJTLs1xovARCpK0S9MfP9kF
	mg9OCPdVcfBU7oETw7DgJnf/6eEohExI0XeBGoOwfOBaTcQDGg/5nU0n/30DAzM9E6/j
	qD6pi0HGvO8jw2+aaddxDq0Y1fioMlm5u/4ic6QNggr5bc6j8//k8wA2dQTkHR5eMoJd
	v+7Q==
X-Gm-Message-State: AKS2vOyHieZ7/RkvnGED4i5ztSAV/qURctQGisBPunOq+S13l3zLh8Y1
	V1cr1ADYXiO3u076md3qccRHpmE7BaoV
X-Received: by 10.36.167.65 with SMTP id s1mr21802620iti.98.1497868964189;
	Mon, 19 Jun 2017 03:42:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Mon, 19 Jun 2017 03:42:13 -0700 (PDT)
In-Reply-To: <a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
	<a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 19 Jun 2017 13:42:13 +0300
Message-ID: <CAHiDW_Fc_7XCjnG4Fhrd+itFygNVqY1_NjfEPCx2TT_u-W44xg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] ovmf: Update to latest
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
X-List-Received-Date: Mon, 19 Jun 2017 10:42:43 -0000
Content-Type: multipart/alternative; boundary="f403045fbfd887eaa905524dcb7c"

--f403045fbfd887eaa905524dcb7c
Content-Type: text/plain; charset="UTF-8"

This seems to be in master now. I'm not sure if we have a new master build
after that but ross/mut has some sort of linker failure in ofmv (in
nightly-world-lsb only):

| GenFw: ERROR 3000: Invalid
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/i586-poky-linux/ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/AcpiTables/AcpiTables/OUTPUT/./Madt.dll:
Bad definition for symbol '<unknown>'@0 or unsupported symbol type.  For
example, absolute and undefined symbols are not supported.

https://autobuilder.yocto.io/builders/nightly-world-lsb/builds/304/steps/BuildImages/logs/stdio

Looks like a check for symbol table alignment is failing? The LSB distro
configuration requires security_flags.inc so that may be related.

Jussi

On 12 June 2017 at 17:59, Khem Raj <raj.khem@gmail.com> wrote:
>
> Fix build with gcc7
>
> clang can not compile it therefore mark it gcc only recipe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...g-UefiHiiLib-Fix-incorrect-comparison-exp.patch | 45
----------------------
>  .../ovmf/ovmf/0001-ia32-Dont-use-pie.patch         | 37
++++++++++++++++++
>  ...makefile-adjust-to-build-in-under-bitbake.patch | 25 ++++++------
>  .../ovmf/ovmf/no-stack-protector-all-archs.patch   | 19 +++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb                 |  6 ++-
>  5 files changed, 72 insertions(+), 60 deletions(-)
>  delete mode 100644
meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
>  create mode 100644
meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
>  create mode 100644
meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
>
> diff --git
a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
> deleted file mode 100644
> index 0529a27b16..0000000000
> ---
a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 73692710d50da1f421b0e6ddff784ca3135389b3 Mon Sep 17 00:00:00 2001
> -From: Dandan Bi <dandan.bi@intel.com>
> -Date: Sat, 1 Apr 2017 10:31:14 +0800
> -Subject: [PATCH] MdeModulePkg/UefiHiiLib:Fix incorrect comparison
expression
> -
> -Fix the incorrect comparison between pointer and constant zero character.
> -
> -https://bugzilla.tianocore.org/show_bug.cgi?id=416
> -
> -V2: The pointer StringPtr points to a string returned
> -by ExtractConfig/ExportConfig, if it is NULL, function
> -InternalHiiIfrValueAction will return FALSE. So in
> -current usage model, the StringPtr can not be NULL before
> -using it, so we can add ASSERT here.
> -
> -Cc: Eric Dong <eric.dong@intel.com>
> -Cc: Liming Gao <liming.gao@intel.com>
> -Contributed-under: TianoCore Contribution Agreement 1.0
> -Signed-off-by: Dandan Bi <dandan.bi@intel.com>
> -Reviewed-by: Eric Dong <eric.dong@intel.com>
> ----
> -Upstream-Status: Backport
> -
> - MdeModulePkg/Library/UefiHiiLib/HiiLib.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
b/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
> -index 8579501..46ca7bc 100644
> ---- a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
> -+++ b/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
> -@@ -2180,8 +2180,9 @@ InternalHiiIfrValueAction (
> -   }
> -
> -   StringPtr = ConfigAltResp;
> --
> --  while (StringPtr != L'\0') {
> -+  ASSERT (StringPtr != NULL);
> -+
> -+  while (*StringPtr != L'\0') {
> -     //
> -     // 1. Find <ConfigHdr> GUID=...&NAME=...&PATH=...
> -     //
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
> new file mode 100644
> index 0000000000..7ce20be54c
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
> @@ -0,0 +1,37 @@
> +From f65e9cc025278387b494c2383c5d9ff3bed98687 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 11 Jun 2017 00:47:24 -0700
> +Subject: [PATCH] ia32: Dont use -pie
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + BaseTools/Conf/tools_def.template | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Conf/tools_def.template
b/BaseTools/Conf/tools_def.template
> +index 04a1bcb210..84c5f84f93 100755
> +--- a/BaseTools/Conf/tools_def.template
> ++++ b/BaseTools/Conf/tools_def.template
> +@@ -4336,7 +4336,7 @@ RELEASE_*_*_OBJCOPY_ADDDEBUGFLAG   =
> + NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =
--add-gnu-debuglink=$(DEBUG_DIR)/$(MODULE_NAME).debug
> +
> + DEFINE GCC_ALL_CC_FLAGS            = -g -Os -fshort-wchar -fno-builtin
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h
-fno-common
> +-DEFINE GCC_IA32_CC_FLAGS           = DEF(GCC_ALL_CC_FLAGS) -m32
-malign-double -freorder-blocks -freorder-blocks-and-partition -O2
-mno-stack-arg-probe
> ++DEFINE GCC_IA32_CC_FLAGS           = DEF(GCC_ALL_CC_FLAGS) -m32
-malign-double -freorder-blocks -freorder-blocks-and-partition -O2
-mno-stack-arg-probe -fno-PIE -no-pie
> + DEFINE GCC_X64_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS)
-mno-red-zone -Wno-address -mno-stack-arg-probe
> + DEFINE GCC_IPF_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS)
-minline-int-divide-min-latency
> + DEFINE GCC_ARM_CC_FLAGS            = DEF(GCC_ALL_CC_FLAGS)
-mlittle-endian -mabi=aapcs -fno-short-enums -funsigned-char
-ffunction-sections -fdata-sections -fomit-frame-pointer -Wno-address
-mthumb -mfloat-abi=soft -fno-pic -fno-pie
> +@@ -4369,7 +4369,7 @@ DEFINE GCC_ARM_RC_FLAGS            = -I binary -O
elf32-littlearm     -B arm
> + DEFINE GCC_AARCH64_RC_FLAGS        = -I binary -O elf64-littleaarch64
-B aarch64 --rename-section .data=.hii
> +
> + DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections
-fdata-sections -include AutoGen.h -fno-common
-DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
> +-DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32
-march=i586 -malign-double -fno-stack-protector -D EFI32
-fno-asynchronous-unwind-tables
> ++DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32
-march=i586 -malign-double -fno-stack-protector -D EFI32
-fno-asynchronous-unwind-tables -fno-PIE -no-pie
> + DEFINE GCC44_X64_CC_FLAGS            = DEF(GCC44_ALL_CC_FLAGS) -m64
-fno-stack-protector "-DEFIAPI=__attribute__((ms_abi))"
-maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie
-fno-asynchronous-unwind-tables
> + DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib
-Wl,-n,-q,--gc-sections -z common-page-size=0x20
> + DEFINE GCC44_IA32_X64_ASLDLINK_FLAGS = DEF(GCC44_IA32_X64_DLINK_COMMON)
-Wl,--entry,ReferenceAcpiTable -u ReferenceAcpiTable
> +--
> +2.13.1
> +
> diff --git
a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
> index 0fdc278ce2..1f8332ef56 100644
> ---
a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
> +++
b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
> @@ -11,29 +11,28 @@ Signed-off-by: Ricardo Neri <
ricardo.neri@linux.intel.com>
>   BaseTools/Source/C/Makefiles/header.makefile | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/BaseTools/Source/C/Makefiles/header.makefile
b/BaseTools/Source/C/Makefiles/header.makefile
> -index 821d114..fe0f08b 100644
> ---- a/BaseTools/Source/C/Makefiles/header.makefile
> -+++ b/BaseTools/Source/C/Makefiles/header.makefile
> -@@ -44,14 +44,14 @@ ARCH_INCLUDE = -I $(MAKEROOT)/Include/AArch64/
> +Index: git/BaseTools/Source/C/Makefiles/header.makefile
> +===================================================================
> +--- git.orig/BaseTools/Source/C/Makefiles/header.makefile
> ++++ git/BaseTools/Source/C/Makefiles/header.makefile
> +@@ -44,15 +44,15 @@ ARCH_INCLUDE = -I $(MAKEROOT)/Include/AA
>   endif
>
>   INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common
-I $(MAKEROOT)/Include/ -I $(MAKEROOT)/Include/IndustryStandard -I
$(MAKEROOT)/Common/ -I .. -I . $(ARCH_INCLUDE)
>  -BUILD_CPPFLAGS = $(INCLUDE) -O2
> -+BUILD_CPPFLAGS := $(BUILD_CPPFLAGS) $(INCLUDE) -O2
> ++BUILD_CPPFLAGS += $(INCLUDE) -O2
>   ifeq ($(DARWIN),Darwin)
>   # assume clang or clang compatible flags on OS X
>  -BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror
-Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib
-c -g
> -+BUILD_CFLAGS := $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing
-Wall -Werror -Wno-deprecated-declarations -Wno-self-assign
-Wno-unused-result -nostdlib -c -g
> ++BUILD_CFLAGS += -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror
-Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib
-c -g
>   else
>  -BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror
-Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
> -+BUILD_CFLAGS := $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing
-Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c
-g
> ++BUILD_CFLAGS += -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror
-Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
>   endif
>  -BUILD_LFLAGS =
> -+BUILD_LFLAGS := $(LDFLAGS)
> - BUILD_CXXFLAGS =
> +-BUILD_CXXFLAGS = -Wno-unused-result
> ++BUILD_LFLAGS = $(LDFLAGS)
> ++BUILD_CXXFLAGS += -Wno-unused-result
>
>   ifeq ($(ARCH), IA32)
> ---
> -2.9.3
> -
> + #
> diff --git
a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
> new file mode 100644
> index 0000000000..25a09c5ce3
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
> @@ -0,0 +1,19 @@
> +Author: Steve Langasek <steve.langasek@ubuntu.com>
> +Description: pass -fno-stack-protector to all GCC toolchains
> + The upstream build rules inexplicably pass -fno-stack-protector only
> + when building for i386 and amd64.  Add this essential argument to the
> + generic rules for gcc 4.4 and later.
> +Last-Updated: 2016-04-12
> +Index: git/BaseTools/Conf/tools_def.template
> +===================================================================
> +--- git.orig/BaseTools/Conf/tools_def.template
> ++++ git/BaseTools/Conf/tools_def.template
> +@@ -4368,7 +4368,7 @@ DEFINE GCC_IPF_RC_FLAGS            = -I
> + DEFINE GCC_ARM_RC_FLAGS            = -I binary -O elf32-littlearm
-B arm     --rename-section .data=.hii
> + DEFINE GCC_AARCH64_RC_FLAGS        = -I binary -O elf64-littleaarch64
-B aarch64 --rename-section .data=.hii
> +
> +-DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections
-fdata-sections -include AutoGen.h -fno-common
-DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
> ++DEFINE GCC44_ALL_CC_FLAGS            = -g -fshort-wchar -fno-builtin
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections
-fdata-sections -fno-stack-protector -include AutoGen.h -fno-common
-DSTRING_ARRAY_NAME=$(BASE_NAME)Strings
> + DEFINE GCC44_IA32_CC_FLAGS           = DEF(GCC44_ALL_CC_FLAGS) -m32
-march=i586 -malign-double -fno-stack-protector -D EFI32
-fno-asynchronous-unwind-tables -fno-PIE -no-pie
> + DEFINE GCC44_X64_CC_FLAGS            = DEF(GCC44_ALL_CC_FLAGS) -m64
-fno-stack-protector "-DEFIAPI=__attribute__((ms_abi))"
-maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=small -fpie
-fno-asynchronous-unwind-tables
> + DEFINE GCC44_IA32_X64_DLINK_COMMON   = -nostdlib
-Wl,-n,-q,--gc-sections -z common-page-size=0x20
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/
ovmf_git.bb
> index 9d988e9d41..5d7216e80e 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -14,7 +14,8 @@ SRC_URI = "git://
github.com/tianocore/edk2.git;branch=master \
>         file://0002-ovmf-update-path-to-native-BaseTools.patch \
>
file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
>         file://VfrCompile-increase-path-length-limit.patch \
> -
 file://0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch \
> +       file://0001-ia32-Dont-use-pie.patch \
> +       file://no-stack-protector-all-archs.patch \
>          "
>
>  SRC_URI_append_class-target = " \
> @@ -22,7 +23,7 @@ SRC_URI_append_class-target = " \
>
file://0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch \
>  "
>
> -SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
> +SRCREV="ec4910cd3336565fdb61dafdd9ec4ae7a6160ba3"
>  SRC_URI[openssl.md5sum] = "96322138f0b69e61b7212bc53d5e912b"
>  SRC_URI[openssl.sha256sum] =
"e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
>
> @@ -241,3 +242,4 @@ do_deploy_class-target() {
>  addtask do_deploy after do_compile before do_build
>
>  BBCLASSEXTEND = "native"
> +TOOLCHAIN = "gcc"
> --
> 2.13.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--f403045fbfd887eaa905524dcb7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This seems to be in master now. I&#39;m not sure if w=
e have a new master build after that but ross/mut has some sort of linker f=
ailure in ofmv (in nightly-world-lsb only):</div><div><br>| GenFw: ERROR 30=
00: Invalid<br>| =C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-world-lsb/build/build/tmp/work/i586-poky-linux/ovmf/git-r0/git/Build/Ov=
mfIa32/RELEASE_GCC5/IA32/OvmfPkg/AcpiTables/AcpiTables/OUTPUT/./Madt.dll: B=
ad definition for symbol &#39;&lt;unknown&gt;&#39;@0 or unsupported symbol =
type.=C2=A0 For example, absolute and undefined symbols are not supported.<=
br><br></div><div><a href=3D"https://autobuilder.yocto.io/builders/nightly-=
world-lsb/builds/304/steps/BuildImages/logs/stdio">https://autobuilder.yoct=
o.io/builders/nightly-world-lsb/builds/304/steps/BuildImages/logs/stdio</a>=
<br><br>Looks like a check for symbol table alignment is failing? The LSB d=
istro configuration requires security_flags.inc so that may be related. =C2=
=A0<br><br>Jussi<br><br>On 12 June 2017 at 17:59, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>&gt;<b=
r>&gt; Fix build with gcc7<br>&gt;<br>&gt; clang can not compile it therefo=
re mark it gcc only recipe<br>&gt;<br>&gt; Signed-off-by: Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt; ---<br=
>&gt; =C2=A0...g-UefiHiiLib-Fix-incorrect-comparison-exp.patch | 45 -------=
---------------<br>&gt; =C2=A0.../ovmf/ovmf/0001-ia32-Dont-use-pie.patch =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 ++++++++++++++++++<br>&gt; =C2=A0...makefi=
le-adjust-to-build-in-under-bitbake.patch | 25 ++++++------<br>&gt; =C2=A0.=
../ovmf/ovmf/no-stack-protector-all-archs.patch =C2=A0 | 19 +++++++++<br>&g=
t; =C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb">ovmf_git.bb<=
/a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A06 ++-<b=
r>&gt; =C2=A05 files changed, 72 insertions(+), 60 deletions(-)<br>&gt; =C2=
=A0delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHii=
Lib-Fix-incorrect-comparison-exp.patch<br>&gt; =C2=A0create mode 100644 met=
a/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch<br>&gt; =C2=A0create =
mode 100644 meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch<=
br>&gt;<br>&gt; diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-=
UefiHiiLib-Fix-incorrect-comparison-exp.patch b/meta/recipes-core/ovmf/ovmf=
/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch<br>&gt; de=
leted file mode 100644<br>&gt; index 0529a27b16..0000000000<br>&gt; --- a/m=
eta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-compa=
rison-exp.patch<br>&gt; +++ /dev/null<br>&gt; @@ -1,45 +0,0 @@<br>&gt; -Fro=
m 73692710d50da1f421b0e6ddff784ca3135389b3 Mon Sep 17 00:00:00 2001<br>&gt;=
 -From: Dandan Bi &lt;<a href=3D"mailto:dandan.bi@intel.com">dandan.bi@inte=
l.com</a>&gt;<br>&gt; -Date: Sat, 1 Apr 2017 10:31:14 +0800<br>&gt; -Subjec=
t: [PATCH] MdeModulePkg/UefiHiiLib:Fix incorrect comparison expression<br>&=
gt; -<br>&gt; -Fix the incorrect comparison between pointer and constant ze=
ro character.<br>&gt; -<br>&gt; -<a href=3D"https://bugzilla.tianocore.org/=
show_bug.cgi?id=3D416">https://bugzilla.tianocore.org/show_bug.cgi?id=3D416=
</a><br>&gt; -<br>&gt; -V2: The pointer StringPtr points to a string return=
ed<br>&gt; -by ExtractConfig/ExportConfig, if it is NULL, function<br>&gt; =
-InternalHiiIfrValueAction will return FALSE. So in<br>&gt; -current usage =
model, the StringPtr can not be NULL before<br>&gt; -using it, so we can ad=
d ASSERT here.<br>&gt; -<br>&gt; -Cc: Eric Dong &lt;<a href=3D"mailto:eric.=
dong@intel.com">eric.dong@intel.com</a>&gt;<br>&gt; -Cc: Liming Gao &lt;<a =
href=3D"mailto:liming.gao@intel.com">liming.gao@intel.com</a>&gt;<br>&gt; -=
Contributed-under: TianoCore Contribution Agreement 1.0<br>&gt; -Signed-off=
-by: Dandan Bi &lt;<a href=3D"mailto:dandan.bi@intel.com">dandan.bi@intel.c=
om</a>&gt;<br>&gt; -Reviewed-by: Eric Dong &lt;<a href=3D"mailto:eric.dong@=
intel.com">eric.dong@intel.com</a>&gt;<br>&gt; ----<br>&gt; -Upstream-Statu=
s: Backport<br>&gt; -<br>&gt; - MdeModulePkg/Library/UefiHiiLib/HiiLib.c | =
5 +++--<br>&gt; - 1 file changed, 3 insertions(+), 2 deletions(-)<br>&gt; -=
<br>&gt; -diff --git a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c b/MdeModule=
Pkg/Library/UefiHiiLib/HiiLib.c<br>&gt; -index 8579501..46ca7bc 100644<br>&=
gt; ---- a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c<br>&gt; -+++ b/MdeModul=
ePkg/Library/UefiHiiLib/HiiLib.c<br>&gt; -@@ -2180,8 +2180,9 @@ InternalHii=
IfrValueAction (<br>&gt; - =C2=A0 }<br>&gt; -<br>&gt; - =C2=A0 StringPtr =
=3D ConfigAltResp;<br>&gt; --<br>&gt; -- =C2=A0while (StringPtr !=3D L&#39;=
\0&#39;) {<br>&gt; -+ =C2=A0ASSERT (StringPtr !=3D NULL);<br>&gt; -+<br>&gt=
; -+ =C2=A0while (*StringPtr !=3D L&#39;\0&#39;) {<br>&gt; - =C2=A0 =C2=A0 =
//<br>&gt; - =C2=A0 =C2=A0 // 1. Find &lt;ConfigHdr&gt; GUID=3D...&amp;NAME=
=3D...&amp;PATH=3D...<br>&gt; - =C2=A0 =C2=A0 //<br>&gt; ---<br>&gt; -1.9.1=
<br>&gt; -<br>&gt; diff --git a/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-=
use-pie.patch b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch<br=
>&gt; new file mode 100644<br>&gt; index 0000000000..7ce20be54c<br>&gt; ---=
 /dev/null<br>&gt; +++ b/meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie=
.patch<br>&gt; @@ -0,0 +1,37 @@<br>&gt; +From f65e9cc025278387b494c2383c5d9=
ff3bed98687 Mon Sep 17 00:00:00 2001<br>&gt; +From: Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt; +Date: Sun, =
11 Jun 2017 00:47:24 -0700<br>&gt; +Subject: [PATCH] ia32: Dont use -pie<br=
>&gt; +<br>&gt; +Upstream-Status: Pending<br>&gt; +<br>&gt; +Signed-off-by:=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt;<br>&gt; +---<br>&gt; + BaseTools/Conf/tools_def.template | 4 ++--<br>&g=
t; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>&gt; +<br>&gt; +dif=
f --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.temp=
late<br>&gt; +index 04a1bcb210..84c5f84f93 100755<br>&gt; +--- a/BaseTools/=
Conf/tools_def.template<br>&gt; ++++ b/BaseTools/Conf/tools_def.template<br=
>&gt; +@@ -4336,7 +4336,7 @@ RELEASE_*_*_OBJCOPY_ADDDEBUGFLAG =C2=A0 =3D<br=
>&gt; + NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG =C2=A0 =C2=A0 =3D --add-gnu-debuglin=
k=3D$(DEBUG_DIR)/$(MODULE_NAME).debug<br>&gt; +<br>&gt; + DEFINE GCC_ALL_CC=
_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -g -Os -fshort-wchar -f=
no-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include Au=
toGen.h -fno-common<br>&gt; +-DEFINE GCC_IA32_CC_FLAGS =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D DEF(GCC_ALL_CC_FLAGS) -m32 -malign-double -freorder-bloc=
ks -freorder-blocks-and-partition -O2 -mno-stack-arg-probe<br>&gt; ++DEFINE=
 GCC_IA32_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GCC_ALL_CC_FL=
AGS) -m32 -malign-double -freorder-blocks -freorder-blocks-and-partition -O=
2 -mno-stack-arg-probe -fno-PIE -no-pie<br>&gt; + DEFINE GCC_X64_CC_FLAGS =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC_ALL_CC_FLAGS) -mno-red=
-zone -Wno-address -mno-stack-arg-probe<br>&gt; + DEFINE GCC_IPF_CC_FLAGS =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC_ALL_CC_FLAGS) -minline=
-int-divide-min-latency<br>&gt; + DEFINE GCC_ARM_CC_FLAGS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -mabi=3Da=
apcs -fno-short-enums -funsigned-char -ffunction-sections -fdata-sections -=
fomit-frame-pointer -Wno-address -mthumb -mfloat-abi=3Dsoft -fno-pic -fno-p=
ie<br>&gt; +@@ -4369,7 +4369,7 @@ DEFINE GCC_ARM_RC_FLAGS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D -I binary -O elf32-littlearm =C2=A0 =C2=A0 -B a=
rm<br>&gt; + DEFINE GCC_AARCH64_RC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -I =
binary -O elf64-littleaarch64 -B aarch64 --rename-section .data=3D.hii<br>&=
gt; +<br>&gt; + DEFINE GCC44_ALL_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D -g -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Wer=
ror -Wno-array-bounds -ffunction-sections -fdata-sections -include AutoGen.=
h -fno-common -DSTRING_ARRAY_NAME=3D$(BASE_NAME)Strings<br>&gt; +-DEFINE GC=
C44_IA32_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GCC44_ALL_CC_F=
LAGS) -m32 -march=3Di586 -malign-double -fno-stack-protector -D EFI32 -fno-=
asynchronous-unwind-tables<br>&gt; ++DEFINE GCC44_IA32_CC_FLAGS =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GCC44_ALL_CC_FLAGS) -m32 -march=3Di586 -ma=
lign-double -fno-stack-protector -D EFI32 -fno-asynchronous-unwind-tables -=
fno-PIE -no-pie<br>&gt; + DEFINE GCC44_X64_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D DEF(GCC44_ALL_CC_FLAGS) -m64 -fno-stack-protector &=
quot;-DEFIAPI=3D__attribute__((ms_abi))&quot; -maccumulate-outgoing-args -m=
no-red-zone -Wno-address -mcmodel=3Dsmall -fpie -fno-asynchronous-unwind-ta=
bles<br>&gt; + DEFINE GCC44_IA32_X64_DLINK_COMMON =C2=A0 =3D -nostdlib -Wl,=
-n,-q,--gc-sections -z common-page-size=3D0x20<br>&gt; + DEFINE GCC44_IA32_=
X64_ASLDLINK_FLAGS =3D DEF(GCC44_IA32_X64_DLINK_COMMON) -Wl,--entry,Referen=
ceAcpiTable -u ReferenceAcpiTable<br>&gt; +--<br>&gt; +2.13.1<br>&gt; +<br>=
&gt; diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjus=
t-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0003-BaseTo=
ols-makefile-adjust-to-build-in-under-bitbake.patch<br>&gt; index 0fdc278ce=
2..1f8332ef56 100644<br>&gt; --- a/meta/recipes-core/ovmf/ovmf/0003-BaseToo=
ls-makefile-adjust-to-build-in-under-bitbake.patch<br>&gt; +++ b/meta/recip=
es-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.=
patch<br>&gt; @@ -11,29 +11,28 @@ Signed-off-by: Ricardo Neri &lt;<a href=
=3D"mailto:ricardo.neri@linux.intel.com">ricardo.neri@linux.intel.com</a>&g=
t;<br>&gt; =C2=A0 BaseTools/Source/C/Makefiles/header.makefile | 8 ++++----=
<br>&gt; =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>&gt;<br>=
&gt; -diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools=
/Source/C/Makefiles/header.makefile<br>&gt; -index 821d114..fe0f08b 100644<=
br>&gt; ---- a/BaseTools/Source/C/Makefiles/header.makefile<br>&gt; -+++ b/=
BaseTools/Source/C/Makefiles/header.makefile<br>&gt; -@@ -44,14 +44,14 @@ A=
RCH_INCLUDE =3D -I $(MAKEROOT)/Include/AArch64/<br>&gt; +Index: git/BaseToo=
ls/Source/C/Makefiles/header.makefile<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; +--- git.orig/BaseTools/Source/C/Makefiles=
/header.makefile<br>&gt; ++++ git/BaseTools/Source/C/Makefiles/header.makef=
ile<br>&gt; +@@ -44,15 +44,15 @@ ARCH_INCLUDE =3D -I $(MAKEROOT)/Include/AA=
<br>&gt; =C2=A0 endif<br>&gt;<br>&gt; =C2=A0 INCLUDE =3D $(TOOL_INCLUDE) -I=
 $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKEROOT)/Include/ -I $(MAK=
EROOT)/Include/IndustryStandard -I $(MAKEROOT)/Common/ -I .. -I . $(ARCH_IN=
CLUDE)<br>&gt; =C2=A0-BUILD_CPPFLAGS =3D $(INCLUDE) -O2<br>&gt; -+BUILD_CPP=
FLAGS :=3D $(BUILD_CPPFLAGS) $(INCLUDE) -O2<br>&gt; ++BUILD_CPPFLAGS +=3D $=
(INCLUDE) -O2<br>&gt; =C2=A0 ifeq ($(DARWIN),Darwin)<br>&gt; =C2=A0 # assum=
e clang or clang compatible flags on OS X<br>&gt; =C2=A0-BUILD_CFLAGS =3D -=
MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declara=
tions -Wno-self-assign -Wno-unused-result -nostdlib -c -g<br>&gt; -+BUILD_C=
FLAGS :=3D $(BUILD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing -Wall -We=
rror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nost=
dlib -c -g<br>&gt; ++BUILD_CFLAGS +=3D -MD -fshort-wchar -fno-strict-aliasi=
ng -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-=
result -nostdlib -c -g<br>&gt; =C2=A0 else<br>&gt; =C2=A0-BUILD_CFLAGS =3D =
-MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declar=
ations -Wno-unused-result -nostdlib -c -g<br>&gt; -+BUILD_CFLAGS :=3D $(BUI=
LD_CFLAGS) -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprec=
ated-declarations -Wno-unused-result -nostdlib -c -g<br>&gt; ++BUILD_CFLAGS=
 +=3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-=
declarations -Wno-unused-result -nostdlib -c -g<br>&gt; =C2=A0 endif<br>&gt=
; =C2=A0-BUILD_LFLAGS =3D<br>&gt; -+BUILD_LFLAGS :=3D $(LDFLAGS)<br>&gt; - =
BUILD_CXXFLAGS =3D<br>&gt; +-BUILD_CXXFLAGS =3D -Wno-unused-result<br>&gt; =
++BUILD_LFLAGS =3D $(LDFLAGS)<br>&gt; ++BUILD_CXXFLAGS +=3D -Wno-unused-res=
ult<br>&gt;<br>&gt; =C2=A0 ifeq ($(ARCH), IA32)<br>&gt; ---<br>&gt; -2.9.3<=
br>&gt; -<br>&gt; + #<br>&gt; diff --git a/meta/recipes-core/ovmf/ovmf/no-s=
tack-protector-all-archs.patch b/meta/recipes-core/ovmf/ovmf/no-stack-prote=
ctor-all-archs.patch<br>&gt; new file mode 100644<br>&gt; index 0000000000.=
.25a09c5ce3<br>&gt; --- /dev/null<br>&gt; +++ b/meta/recipes-core/ovmf/ovmf=
/no-stack-protector-all-archs.patch<br>&gt; @@ -0,0 +1,19 @@<br>&gt; +Autho=
r: Steve Langasek &lt;<a href=3D"mailto:steve.langasek@ubuntu.com">steve.la=
ngasek@ubuntu.com</a>&gt;<br>&gt; +Description: pass -fno-stack-protector t=
o all GCC toolchains<br>&gt; + The upstream build rules inexplicably pass -=
fno-stack-protector only<br>&gt; + when building for i386 and amd64.=C2=A0 =
Add this essential argument to the<br>&gt; + generic rules for gcc 4.4 and =
later.<br>&gt; +Last-Updated: 2016-04-12<br>&gt; +Index: git/BaseTools/Conf=
/tools_def.template<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>&gt; +--- git.orig/BaseTools/Conf/tools_def.template<br>&gt; ++++=
 git/BaseTools/Conf/tools_def.template<br>&gt; +@@ -4368,7 +4368,7 @@ DEFIN=
E GCC_IPF_RC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -I<br>&gt; =
+ DEFINE GCC_ARM_RC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -I b=
inary -O elf32-littlearm =C2=A0 =C2=A0 -B arm =C2=A0 =C2=A0 --rename-sectio=
n .data=3D.hii<br>&gt; + DEFINE GCC_AARCH64_RC_FLAGS =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D -I binary -O elf64-littleaarch64 -B aarch64 --rename-section .dat=
a=3D.hii<br>&gt; +<br>&gt; +-DEFINE GCC44_ALL_CC_FLAGS =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D -g -fshort-wchar -fno-builtin -fno-strict-aliasing=
 -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -inclu=
de AutoGen.h -fno-common -DSTRING_ARRAY_NAME=3D$(BASE_NAME)Strings<br>&gt; =
++DEFINE GCC44_ALL_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -g=
 -fshort-wchar -fno-builtin -fno-strict-aliasing -Wall -Werror -Wno-array-b=
ounds -ffunction-sections -fdata-sections -fno-stack-protector -include Aut=
oGen.h -fno-common -DSTRING_ARRAY_NAME=3D$(BASE_NAME)Strings<br>&gt; + DEFI=
NE GCC44_IA32_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DEF(GCC44_ALL=
_CC_FLAGS) -m32 -march=3Di586 -malign-double -fno-stack-protector -D EFI32 =
-fno-asynchronous-unwind-tables -fno-PIE -no-pie<br>&gt; + DEFINE GCC44_X64=
_CC_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DEF(GCC44_ALL_CC_FLA=
GS) -m64 -fno-stack-protector &quot;-DEFIAPI=3D__attribute__((ms_abi))&quot=
; -maccumulate-outgoing-args -mno-red-zone -Wno-address -mcmodel=3Dsmall -f=
pie -fno-asynchronous-unwind-tables<br>&gt; + DEFINE GCC44_IA32_X64_DLINK_C=
OMMON =C2=A0 =3D -nostdlib -Wl,-n,-q,--gc-sections -z common-page-size=3D0x=
20<br>&gt; diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.b=
b">ovmf_git.bb</a> b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb">=
ovmf_git.bb</a><br>&gt; index 9d988e9d41..5d7216e80e 100644<br>&gt; --- a/m=
eta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb">ovmf_git.bb</a><br>&gt=
; +++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb">ovmf_git.bb</=
a><br>&gt; @@ -14,7 +14,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://gith=
ub.com/tianocore/edk2.git;branch=3Dmaster">github.com/tianocore/edk2.git;br=
anch=3Dmaster</a> \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ovmf-up=
date-path-to-native-BaseTools.patch \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
ile://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://VfrCompile-increase-path-length-limi=
t.patch \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-MdeModulePkg-Uef=
iHiiLib-Fix-incorrect-comparison-exp.patch \<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 file://0001-ia32-Dont-use-pie.patch \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 file:=
//no-stack-protector-all-archs.patch \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>&gt;<br>&gt; =C2=A0SRC_URI_append_class-target =3D &quot; \=
<br>&gt; @@ -22,7 +23,7 @@ SRC_URI_append_class-target =3D &quot; \<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-OvmfPkg-EnrollDefaultKeys-applicat=
ion-for-enrolling-.patch \<br>&gt; =C2=A0&quot;<br>&gt;<br>&gt; -SRCREV=3D&=
quot;4575a602ca6072ee9d04150b38bfb143cbff8588&quot;<br>&gt; +SRCREV=3D&quot=
;ec4910cd3336565fdb61dafdd9ec4ae7a6160ba3&quot;<br>&gt; =C2=A0SRC_URI[opens=
sl.md5sum] =3D &quot;96322138f0b69e61b7212bc53d5e912b&quot;<br>&gt; =C2=A0S=
RC_URI[openssl.sha256sum] =3D &quot;e7aff292be21c259c6af26469c7a9b3ba26e9ab=
aaffd325e3dccc9785256c431&quot;<br>&gt;<br>&gt; @@ -241,3 +242,4 @@ do_depl=
oy_class-target() {<br>&gt; =C2=A0addtask do_deploy after do_compile before=
 do_build<br>&gt;<br>&gt; =C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>&gt=
; +TOOLCHAIN =3D &quot;gcc&quot;<br>&gt; --<br>&gt; 2.13.1<br>&gt;<br>&gt; =
--<br>&gt; _______________________________________________<br>&gt; Openembe=
dded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.op=
enembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a hre=
f=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core">http=
://lists.openembedded.org/mailman/listinfo/openembedded-core</a></div>

--f403045fbfd887eaa905524dcb7c--
