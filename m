Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1D17D278
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:39:29 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id v22so31282386qkj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JX0EC/QaWs62JM7ci7Ce55WCCV5N2vRmVD5MGPQBV+Y=;
	b=E2KnHTQQcIV3serX6Hf1b3igU0yM5Uen6RQecNNv4RALiR5JyLx+oQBjK+0M2daXIe
	XReqbzJnMmy3+xntNNiI9ABLmnBAbOgutDW1hdr6FSX99RakTM51CiwaXFiD9zYLogyb
	Qb48BEhXvNp34+9v+NH3YH4v0oUTEtP335lDN7cUup8r1Mb4yIqG5d/SIvEQzKB62nXu
	z4zMnb04tI/TN61iqoHWWWh69ywzrmF0QY+Dc7WVRx26NgujuhXCBf/4pQ6Hu+glX1Lw
	9ZVULm3X/lng4zb5pXeUE732m0bnW4vvY9S1gAc993FpdOTZaamTllMKqyinmC/uS98y
	ZbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JX0EC/QaWs62JM7ci7Ce55WCCV5N2vRmVD5MGPQBV+Y=;
	b=DLUhPLkXFBQeZBcsdmcduzq6RZZPOqCwHClf3+OJFhE6fdNVpKNUb8MmftgrmnGEjX
	S5IPBg6x6eV5E/FKOTkLreLB15FL9Rm2g0I1geapN60KhxC0oVUDgBT8im60rgb+Wuz+
	/yufqs/57NDcXvBSrbzzK9ktdlDH0mMyujEg1wpX1vu0jFD3iiS6Ndufc81+Ru9Ci6mw
	nx21RiKLp/PCw/F9QxsbOWU2h/2NH8O3m6ihfzyB28cMbMsAGz59CmQCHrbKLF40Ehs2
	NLfm84xjs4eNtT1mNESkjZT59I7ZWeIjEUkd+2mwa4WgTgFgEtEwQCOZXFBCWsd3f5b3
	rhPA==
X-Gm-Message-State: APjAAAXvcK4zAKVIs2OnsAk25tQlPiC8zEClBgzHu1vW9nWDxWfoP2xf
	bsNLKAT9pmUD3zS2l7ZgDI0AekgfYzNIASoIIfHZca1z
X-Google-Smtp-Source: APXvYqyplfU1XEwDgLAnqyUxnKYHIoJ1kGb7Q/XJfVptMAyYHphR/Wuct4sWUyacmBJPWssxaAArzoE67jNOM0aKedQ=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr17181600qkg.337.1563892769621; 
	Tue, 23 Jul 2019 07:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190723123802.24182-1-ricardo@ribalda.com>
In-Reply-To: <20190723123802.24182-1-ricardo@ribalda.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 07:39:13 -0700
Message-ID: <CAMKF1srPfqty5AVn=JvxuAnUu9xFK4VDQMYrxUQxfj8X6oGMPQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fwts: Update to 19.06.00
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
X-List-Received-Date: Tue, 23 Jul 2019 14:39:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 23, 2019 at 5:38 AM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Update to latest release.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  .../fwts/0001-Remove-Werror-from-build.patch  | 22 ++---
>  ...t-logical-operand-warning-with-clang.patch | 84 -------------------
>  .../fwts/{fwts_git.bb => fwts_19.06.00.bb}    | 11 +--
>  3 files changed, 15 insertions(+), 102 deletions(-)
>  delete mode 100644 meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
>  rename meta-oe/recipes-test/fwts/{fwts_git.bb => fwts_19.06.00.bb} (83%)
>
> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
> index 611ccc8fc..6795ba849 100644
> --- a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
> +++ b/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
> @@ -12,33 +12,33 @@ Upstream-Status: Pending
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index 4daa9e8f..873f23eb 100644
> +index 62c9ba8..435ec23 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
>  @@ -14,7 +14,7 @@ AM_CPPFLAGS = \
> -       `pkg-config --silence-errors --cflags json` \
> -       `pkg-config --silence-errors --cflags json-c` \
> +       `pkg-config --silence-errors --cflags json`     \
> +       `pkg-config --silence-errors --cflags json-c`   \
>         -pthread `pkg-config --cflags glib-2.0 gio-2.0` \
> --      -Wall -Werror -Wextra
> -+      -Wall -Wextra
> +-      -Wall -Werror -Wextra                           \
> ++      -Wall -Wextra                           \
> +       -Wno-address-of-packed-member
>
>   bin_PROGRAMS = fwts
> -
>  diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
> -index fa232451..082403a2 100644
> +index 6bcf9f8..de89bf1 100644
>  --- a/src/lib/src/Makefile.am
>  +++ b/src/lib/src/Makefile.am
>  @@ -24,7 +24,7 @@ AM_CPPFLAGS = \
>         `pkg-config --silence-errors --cflags json-c`   \
>         `pkg-config --cflags glib-2.0 gio-2.0`          \
>         -DDATAROOTDIR=\"$(datarootdir)\"                \
> --      -Wall -Werror -Wextra
> -+      -Wall -Wextra
> +-      -Wall -Werror -Wextra                           \
> ++      -Wall -Wextra                           \
> +       -Wno-address-of-packed-member
>
>   pkglib_LTLIBRARIES = libfwts.la
> -
>  diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
> -index aa37de55..4d5297cc 100644
> +index 21f969e..82009a0 100644
>  --- a/src/utilities/Makefile.am
>  +++ b/src/utilities/Makefile.am
>  @@ -16,7 +16,7 @@
> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
> deleted file mode 100644
> index ae3665b4d..000000000
> --- a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From 5bd05ad8569880985ddf6d4c06ed927d388c297f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 19 Oct 2016 01:57:16 +0000
> -Subject: [PATCH] ignore constant-logical-operand warning with clang
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - src/dmi/dmicheck/dmicheck.c            | 3 +++
> - src/lib/src/fwts_acpi_tables.c         | 5 +++++
> - src/uefi/uefirtauthvar/uefirtauthvar.c | 5 +++++
> - 3 files changed, 13 insertions(+)
> -
> -diff --git a/src/dmi/dmicheck/dmicheck.c b/src/dmi/dmicheck/dmicheck.c
> -index 3cca9db9..60fb758f 100644
> ---- a/src/dmi/dmicheck/dmicheck.c
> -+++ b/src/dmi/dmicheck/dmicheck.c
> -@@ -211,6 +211,8 @@ static const char *uuid_patterns[] = {
> -       "0A0A0A0A-0A0A-0A0A-0A0A-0A0A0A0A0A0A",
> -       NULL,
> - };
> -+#pragma clang diagnostic push
> -+#pragma clang diagnostic ignored "-Wunneeded-internal-declaration"
> -
> - static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
> -       { "Invalid",            FWTS_SMBIOS_CHASSIS_INVALID },
> -@@ -251,6 +253,7 @@ static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
> -       { "Mini PC",            FWTS_SMBIOS_CHASSIS_MINI_PC },
> -       { "Stick PC",           FWTS_SMBIOS_CHASSIS_STICK_PC },
> - };
> -+#pragma clang diagnostic pop
> -
> - /* Remapping table from buggy version numbers to correct values */
> - static const fwts_dmi_version dmi_versions[] = {
> -diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
> -index c7ba59be..bdd224aa 100644
> ---- a/src/lib/src/fwts_acpi_tables.c
> -+++ b/src/lib/src/fwts_acpi_tables.c
> -@@ -393,10 +393,14 @@ static int fwts_acpi_handle_fadt(
> -       /* Determine FACS addr and load it.
> -        * Will ignore the missing FACS in the hardware-reduced mode.
> -        */
> -+#pragma clang diagnostic push
> -+#pragma clang diagnostic ignored "-Waddress-of-packed-member"
> -+
> -       result = fwts_acpi_handle_fadt_tables(fw, fadt,
> -                       "FACS", "FIRMWARE_CTRL", "X_FIRMWARE_CTRL",
> -                       &fadt->firmware_control, &fadt->x_firmware_ctrl,
> -                       provenance);
> -+
> -       if (result != FWTS_OK) {
> -               if ((result == FWTS_NULL_POINTER) &&
> -                               fwts_acpi_is_reduced_hardware(fadt)) {
> -@@ -415,6 +419,7 @@ static int fwts_acpi_handle_fadt(
> -               return FWTS_ERROR;
> -       }
> -       return FWTS_OK;
> -+#pragma clang diagnostic pop
> - }
> -
> - /*
> -diff --git a/src/uefi/uefirtauthvar/uefirtauthvar.c b/src/uefi/uefirtauthvar/uefirtauthvar.c
> -index c2031741..7a33d19d 100644
> ---- a/src/uefi/uefirtauthvar/uefirtauthvar.c
> -+++ b/src/uefi/uefirtauthvar/uefirtauthvar.c
> -@@ -142,6 +142,9 @@ static int uefirtauthvar_deinit(fwts_framework *fw)
> -       return FWTS_OK;
> - }
> -
> -+#pragma clang diagnostic push
> -+#pragma clang diagnostic ignored "-Wconstant-logical-operand"
> -+
> - static int check_fw_support(fwts_framework *fw, uint64_t status)
> - {
> -       if ((status == EFI_INVALID_PARAMETER) &&
> -@@ -172,6 +175,8 @@ static int check_fw_support(fwts_framework *fw, uint64_t status)
> -       return FWTS_OK;
> - }
> -
> -+#pragma clang diagnostic pop
> -+
> - /*
> -  * Set the created authenticated variable, AuthVarCreate,
> -  * and checking the data size and data.
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_19.06.00.bb
> similarity index 83%
> rename from meta-oe/recipes-test/fwts/fwts_git.bb
> rename to meta-oe/recipes-test/fwts/fwts_19.06.00.bb
> index d3fb644df..88a89fb0b 100644
> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-test/fwts/fwts_19.06.00.bb
> @@ -5,11 +5,8 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
>
> -PV = "18.05.00+git${SRCPV}"
> -
>  SRCREV = "b0ec7aa2ef743d113fd8c5e57c0ca3d5edd86f0e"
> -SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
> -           file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
> +SRC_URI = "http://fwts.ubuntu.com/release/fwts-V19.06.00.tar.gz;subdir=${BPN}-${PV} \
>             file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
>             file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
>             file://0003-Undefine-PAGE_SIZE.patch \
> @@ -17,12 +14,12 @@ SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
>             file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
>             file://0001-Remove-Werror-from-build.patch \
>             "
> -
> -S = "${WORKDIR}/git"
> +SRC_URI[md5sum] = "012f933329510cc5a71817ede681eee2"
> +SRC_URI[sha256sum] = "13aa991f12c69f48df368aae5e5d0fbc9136413b4bfe115421bc3216d919f8a2"
>
>  COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
>
> -DEPENDS = "libpcre json-c glib-2.0 dtc bison-native"
> +DEPENDS = "libpcre json-c glib-2.0 dtc bison-native libbsd"

Mention this in commit message please

>  DEPENDS_append_libc-musl = " libexecinfo"
>
>  inherit autotools bash-completion pkgconfig
> --
> 2.20.1
>

