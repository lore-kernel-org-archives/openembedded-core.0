Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA17C2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 18:11:57 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.1365.1718734316645562419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 11:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: aehs29@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2550aa6f994so3540263fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 11:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718734316; x=1719339116;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3YPvMW1StWa6w+IdiuftXbdM6rNp46JnaQvMlc+RSo=;
        b=GMhnXgERDOwLpntdmquwt0CoHpHiGWbpr+XRy29PIzw1ZIE6qdx8uWb0xzolfBSVCC
         iw1/76jejb+Y63UYQlO08xhRajHazXDQPX9AGGeGqdQfI5AFxq8/w1+d9tpzWBYo/H87
         9+FU8tBqOjEJqQm0Gb4jhxkPmYXrTN7BODKsh9rgydhizDNCXIOQ/MtQgFuS17TryguA
         ZNQcVcLiZJkbljLlTZZY9LBjIv//npOmAm3gEaj58my5IHZ/9Abfw8hYralYbxG564nW
         qg38imLh3LXZSUTTDoHtxNUVD/wGyKEbkoOL6k56bH1mVISyVku7L2SQZnqcBjt+zicJ
         HNkA==
X-Gm-Message-State: AOJu0YyjNrxDIbUehhAFezQ48QendPkIrD+jTTNdHYWEwyQEBn2FzEyR
	0wkxE/LWat0NZM0I6/6W26d5Xxd5qKgKKvY64ZjOIBc5t7mF6eN3t9v9XOeI7OU=
X-Google-Smtp-Source: AGHT+IHcvw2L6m141F3f8lbhT8rXFE7LV8CDSWUGuVsDQQ/DDbZiPE+7RSe3uyTmWGkSfbezrM2Sfw==
X-Received: by 2002:a05:6870:5247:b0:254:adee:216a with SMTP id 586e51a60fabf-25c94dfe3d4mr690212fac.41.1718734314487;
        Tue, 18 Jun 2024 11:11:54 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2567aa14162sm3263491fac.26.2024.06.18.11.11.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:11:54 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2550aa6f994so3540240fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 11:11:54 -0700 (PDT)
X-Received: by 2002:a05:6870:a2cc:b0:259:8321:243b with SMTP id
 586e51a60fabf-25c94ad37bdmr714956fac.24.1718734313907; Tue, 18 Jun 2024
 11:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240618181226.2693197-1-alejandro@enedino.org>
In-Reply-To: <20240618181226.2693197-1-alejandro@enedino.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Tue, 18 Jun 2024 12:11:42 -0600
X-Gmail-Original-Message-ID: <CAHMutrbukkrY7L1QpQ7WbFyZ9c2vzYmC_MxU9AXnjYGbR+RqHQ@mail.gmail.com>
Message-ID: <CAHMutrbukkrY7L1QpQ7WbFyZ9c2vzYmC_MxU9AXnjYGbR+RqHQ@mail.gmail.com>
Subject: Re: [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant to build
 with picolibc as C library
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003e77a6061b2e04a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 18:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200883

--0000000000003e77a6061b2e04a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This version is rebased on top of master after the UNPACKDIR changes.

Alejandro

On Tue, Jun 18, 2024, 12:09=E2=80=AFPM Alejandro Enedino Hernandez Samanieg=
o <
alejandro@enedino.org> wrote:

> Enables usage of TCLIBC=3Dpicolibc extending OE functionality to build an=
d
> use
> picolibc based toolchains to build baremetal applications.
>
> Picolibc is a set of standard C libraries, both libc and libm, designed f=
or
> smaller embedded systems with limited ROM and RAM. Picolibc includes code
> from Newlib and AVR Libc, but adresses some of newlibs concerns, it retai=
ns
> newlibs directory structure, math, string and locale implementations, but
> removed the GPL bits used to build the library, swiches old C style code
> for
> C18 and replaces autotools with meson.
>
> This patch adds a picolibc recipe for the C library, a picolibc-helloworl=
d
> recipe that contains an example application and a testcase that builds it=
.
>
> Picolibc can be built for ARM and RISCV architectures, its been tested bo=
th
> for 32 and 64 bits, the provided example recipe produces the following
> output:
>
> hello, world
>
> Runqemu does not automatically show any output since it hides QEMU stderr
> which
> is where the QEMU monitors output is directed to when using semihosting,
> but,
> manually running the same QEMU command does work properly.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> ---
>  meta/classes-recipe/baremetal-image.bbclass   |   4 +-
>  meta/classes-recipe/cross-canadian.bbclass    |   2 +-
>  meta/conf/distro/include/maintainers.inc      |   2 +
>  meta/conf/distro/include/tclibc-picolibc.inc  |  40 ++++++
>  meta/conf/documentation.conf                  |   2 +-
>  .../conf/machine/include/riscv/arch-riscv.inc |   1 +
>  meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
>  meta/lib/oeqa/selftest/cases/picolibc.py      |  18 +++
>  .../picolibc/picolibc-helloworld_git.bb       |  40 ++++++
>  meta/recipes-core/picolibc/picolibc.inc       |  21 ++++
>  .../avoid_polluting_cross_directories.patch   | 119 ++++++++++++++++++
>  .../picolibc/no-early-compiler-checks.cross   |   6 +
>  meta/recipes-core/picolibc/picolibc_git.bb    |  35 ++++++
>  meta/recipes-devtools/gcc/gcc-cross.inc       |   1 +
>  meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +
>  meta/recipes-devtools/gcc/libgcc-common.inc   |   5 +
>  16 files changed, 296 insertions(+), 5 deletions(-)
>  create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc
>  create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py
>  create mode 100644 meta/recipes-core/picolibc/picolibc-helloworld_git.bb
>  create mode 100644 meta/recipes-core/picolibc/picolibc.inc
>  create mode 100644
> meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.pat=
ch
>  create mode 100644
> meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
>  create mode 100644 meta/recipes-core/picolibc/picolibc_git.bb
>
> diff --git a/meta/classes-recipe/baremetal-image.bbclass
> b/meta/classes-recipe/baremetal-image.bbclass
> index 4e7d413626..27f2d2d10a 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -16,8 +16,8 @@
>  # See meta-skeleton for a working example.
>
>
> -# Toolchain should be baremetal or newlib based.
> -# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
> +# Toolchain should be baremetal or newlib/picolibc based.
> +# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib" or TCLIBC=3D"picolibc"
>  COMPATIBLE_HOST:libc-musl:class-target =3D "null"
>  COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
>
> diff --git a/meta/classes-recipe/cross-canadian.bbclass
> b/meta/classes-recipe/cross-canadian.bbclass
> index 1670217d69..059d9aa95f 100644
> --- a/meta/classes-recipe/cross-canadian.bbclass
> +++ b/meta/classes-recipe/cross-canadian.bbclass
> @@ -36,7 +36,7 @@ python () {
>      if d.getVar("MODIFYTOS") !=3D "1":
>          return
>
> -    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
> +    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', 'picolibc' ]:
>          return
>
>      tos =3D d.getVar("TARGET_OS")
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 42599267c1..ff24597723 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -578,6 +578,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-perf =3D "Bruce Ashfield <bruce.ashfield@gmail.com>=
"
>  RECIPE_MAINTAINER:pn-perl =3D "Alexander Kanavin <alex.kanavin@gmail.com=
>"
>  RECIPE_MAINTAINER:pn-perlcross =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER:pn-picolibc =3D "Alejandro Hernandez <
> alejandro@enedino.org>"
> +RECIPE_MAINTAINER:pn-picolibc-helloworld =3D "Alejandro Hernandez <
> alejandro@enedino.org>"
>  RECIPE_MAINTAINER:pn-piglit =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
> diff --git a/meta/conf/distro/include/tclibc-picolibc.inc
> b/meta/conf/distro/include/tclibc-picolibc.inc
> new file mode 100644
> index 0000000000..203765dfcb
> --- /dev/null
> +++ b/meta/conf/distro/include/tclibc-picolibc.inc
> @@ -0,0 +1,40 @@
> +#
> +# Picolibc configuration
> +#
> +
> +LIBCEXTENSION =3D "-picolibc"
> +LIBCOVERRIDE =3D ":libc-picolibc"
> +
> +PREFERRED_PROVIDER_virtual/libc ?=3D "picolibc"
> +PREFERRED_PROVIDER_virtual/libiconv ?=3D "picolibc"
> +PREFERRED_PROVIDER_virtual/libintl ?=3D "picolibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> +
> +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
> +
> +IMAGE_LINGUAS =3D ""
> +
> +LIBC_DEPENDENCIES =3D " \
> +    picolibc-dbg \
> +    picolibc-dev \
> +    libgcc-dev \
> +    libgcc-dbg \
> +    libstdc++-dev  \
> +    libstdc++-staticdev \
> +"
> +
> +ASSUME_PROVIDED +=3D "virtual/crypt"
> +
> +TARGET_OS =3D "elf"
> +TARGET_OS:arm =3D "eabi"
> +
> +TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE}
> nativesdk-qemu nativesdk-sdk-provides-dummy"
> +TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "zlib ncurses"
> +
> +# RISCV linker doesnt support PIE
> +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D "${SECURITY_NOPIE_CFLAGS}"
> +
> +
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index b0591881ba..ad89142934 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D "Specifies the method for handlin=
g
> FPU code. For FPU-less targ
>  TARGET_OS[doc] =3D "Specifies the target's operating system."
>  TARGET_PREFIX[doc] =3D "The prefix for the cross-compile toolchain (e.g.
> arm-linux-)."
>  TARGET_SYS[doc] =3D "The target system is comprised of
> TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
> -TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the bu=
ild
> process. You can select 'baremetal', 'glibc', 'musl' or 'newlib'."
> +TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the bu=
ild
> process. You can select 'baremetal', 'glibc', 'musl', 'newlib', or
> 'picolibc'."
>  TCMODE[doc] =3D "Enables an external toolchain (where provided by an
> additional layer) if set to a value other than 'default'."
>  TESTIMAGE_AUTO[doc] =3D "Enables test booting of virtual machine images
> under the QEMU emulator after any root filesystems are created and runs
> tests against those images each time an image is built."
>  TEST_QEMUBOOT_TIMEOUT[doc] =3D "The time in seconds allowed for an image=
 to
> boot before automated runtime tests begin to run against an image."
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> index 230a266563..b34064e78f 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -marc
>
>  # Fix: ld: unrecognized option '--hash-style=3Dsysv'
>  LINKER_HASH_STYLE:libc-newlib =3D ""
> +LINKER_HASH_STYLE:libc-picolibc =3D ""
>  # Fix: ld: unrecognized option '--hash-style=3Dgnu'
>  LINKER_HASH_STYLE:libc-baremetal =3D ""
> diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
> b/meta/lib/oeqa/selftest/cases/distrodata.py
> index ad952c004b..043953757f 100644
> --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> @@ -55,7 +55,7 @@ but their recipes claim otherwise by setting
> UPSTREAM_VERSION_UNKNOWN. Please re
>              return False
>
>          def is_maintainer_exception(entry):
> -            exceptions =3D ["musl", "newlib", "linux-yocto", "linux-dumm=
y",
> "mesa-gl", "libgfortran", "libx11-compose-data",
> +            exceptions =3D ["musl", "newlib", "picolibc", "linux-yocto",
> "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
>                            "cve-update-nvd2-native",]
>              for i in exceptions:
>                   if i in entry:
> diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py
> b/meta/lib/oeqa/selftest/cases/picolibc.py
> new file mode 100644
> index 0000000000..e40b4fc3d3
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/picolibc.py
> @@ -0,0 +1,18 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, get_bb_var
> +
> +class PicolibcTest(OESelftestTestCase):
> +
> +    def test_picolibc(self):
> +        compatible_machines =3D ['qemuarm', 'qemuarm64', 'qemuriscv32',
> 'qemuriscv64']
> +        machine =3D get_bb_var('MACHINE')
> +        if machine not in compatible_machines:
> +            self.skipTest('This test only works with machines : %s' % '
> '.join(compatible_machines))
> +        self.write_config('TCLIBC =3D "picolibc"')
> +        bitbake("picolibc-helloworld")
> diff --git a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> new file mode 100644
> index 0000000000..573a571c24
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> @@ -0,0 +1,40 @@
> +require picolibc.inc
> +
> +# baremetal-image overrides
> +BAREMETAL_BINNAME ?=3D "hello_picolibc_${MACHINE}"
> +IMAGE_LINK_NAME ?=3D "baremetal-picolibc-image-${MACHINE}"
> +IMAGE_NAME_SUFFIX ?=3D ""
> +QB_DEFAULT_KERNEL ?=3D "${IMAGE_LINK_NAME}.elf"
> +
> +inherit baremetal-image
> +
> +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> +
> +# Use semihosting to test via QEMU
> +QB_OPT_APPEND:append =3D " -semihosting-config enable=3Don"
> +
> +# picolibc comes with a set of linker scripts, set the file
> +# according to the architecture being built.
> +PICOLIBC_LINKERSCRIPT:qemuarm64 =3D "aarch64.ld"
> +PICOLIBC_LINKERSCRIPT:qemuarm =3D "arm.ld"
> +PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D "riscv.ld"
> +PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D "riscv.ld"
> +
> +# Simple compile function that manually exemplifies usage; as noted,
> +# use a custom linker script, the GCC specs provided by picolibc
> +# and semihost to be able to test via QEMU's monitor
> +do_compile(){
> +    ${CC} ${CFLAGS} ${LDFLAGS} --verbose
> -T${S}/hello-world/${PICOLIBC_LINKERSCRIPT} -specs=3Dpicolibc.specs
> --oslib=3Dsemihost -o ${BAREMETAL_BINNAME}.elf ${S}/hello-world/hello-wor=
ld.c
> +    ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMETAL_BINNAME}.b=
in
> +}
> +
> +do_install(){
> +    install -d ${D}/${base_libdir}/firmware
> +    install -m 755 ${B}/${BAREMETAL_BINNAME}.elf
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> +    install -m 755 ${B}/${BAREMETAL_BINNAME}.bin
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> +}
> +
> +FILES:${PN} +=3D " \
> +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
> +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
> +"
> diff --git a/meta/recipes-core/picolibc/picolibc.inc
> b/meta/recipes-core/picolibc/picolibc.inc
> new file mode 100644
> index 0000000000..3b380fe7af
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc.inc
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "C Libraries for Smaller Embedded Systems"
> +HOMEPAGE =3D "https://keithp.com/picolibc"
> +DESCRIPTION =3D "Picolibc is a set of standard C libraries, both libc an=
d
> libm, designed for smaller embedded systems with limited ROM and RAM.
> Picolibc includes code from Newlib and AVR Libc."
> +SECTION =3D "libs"
> +
> +# Newlib based code but GPL related bits removed, test/printf-tests.c an=
d
> test/testcases.c
> +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of th=
e
> artifacts.
> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D " \
> +               file://COPYING.GPL2;md5=3D59530bdf33659b29e73d4adb9f9f655=
2 \
> +               file://COPYING.NEWLIB;md5=3D08ae03456feb75b81cfdb359e0f1e=
f85
> \
> +
>  file://COPYING.picolibc;md5=3De50fa9458a40929689861ed472d46bc7 \
> +               "
> +
> +BASEVER =3D "1.8.6"
> +PV =3D "${BASEVER}+git"
> +SRC_URI =3D "git://
> github.com/picolibc/picolibc.git;protocol=3Dhttps;branch=3Dmain"
> +SRCREV=3D"764ef4e401a8f4c6a86ab723533841f072885a5b"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> diff --git
> a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
> b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
> new file mode 100644
> index 0000000000..da6460c95c
> --- /dev/null
> +++
> b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
> @@ -0,0 +1,119 @@
> +Upstream-Status: Pending
> +
> +Picolibc uses its own specs file: picolibc.specs to facilitate
> compilation, this
> +needs to be passed down to GCC via the -specs argument.
> +
> +Using this specs file overrides some of the default options our toolchai=
n
> was
> +built with, in this case, they modify the include_dir and lib_dir paths
> used for
> +compilation, their intention was to add support for -picolibc-prefix and
> +-picolibc-buildtype arguments via the C preprocessor.
> +
> +-isystem %{-picolibc-prefix=3D*:%*/include/;
> -picolibc-buildtype=3D*:/usr/include/%*; :/usr/include} %(picolibc_cpp)
> +
> +This had the unwanted effect of defaulting to /usr/include for
> include_dir if
> +those arguments are not being passed, this works fine for their flow but
> for us
> +it pollutes the include directories with paths from the host. The same
> effect is
> +applicable for lib_dir and for the c runtime file.
> +
> +Our toolchain relies on --sysroot to avoid using any paths from the host=
,
> here we
> +manually add support for a third possible argument: -sysroot , if this i=
s
> passed
> +then the paths used by the compiler will be relative to the path passed
> by the
> +--sysroot=3D cmdline argument, setting back the behavior that we intende=
d
> in the
> +first place.
> +
> +
> +Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> +
> +Index: git/meson.build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/meson.build
> ++++ git/meson.build
> +@@ -622,12 +622,13 @@ else
> + #
> + picolibc_prefix_format =3D '-picolibc-prefix=3D*:@0@'
> + picolibc_buildtype_format =3D '-picolibc-buildtype=3D*:@0@'
> ++sysroot_format =3D '-sysroot=3D*:@0@'
> + gen_format =3D '@0@'
> +
> + #
> + # How to glue the three options together
> + #
> +-specs_option_format =3D '%{@0@; @1@; :@2@}'
> ++specs_option_format =3D '%{@0@; @1@; @2@; :@3@}'
> +
> + #
> + # Build the -isystem value
> +@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.
> + buildtype_include_dir =3D
> specs_prefix_format.format(get_option('includedir') / '%*')
> + isystem_buildtype =3D
> picolibc_buildtype_format.format(buildtype_include_dir)
> +
> ++sysroot_include_dir =3D '%*'
> ++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)
> ++
> + gen_include_dir =3D specs_prefix_format.format(get_option('includedir')=
)
> + isystem_gen =3D gen_format.format(gen_include_dir)
> +
> +-specs_isystem =3D '-isystem ' + specs_option_format.format(isystem_pref=
ix,
> isystem_buildtype, isystem_gen)
> ++specs_isystem =3D '-isystem ' + specs_option_format.format(isystem_pref=
ix,
> isystem_buildtype, isystem_sysroot, isystem_gen)
> +
> + #
> + # Build the non-multilib -L value
> +@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form
> + buildtype_lib_dir =3D specs_prefix_format.format(get_option('libdir') /
> '%*')
> + lib_buildtype =3D picolibc_buildtype_format.format(buildtype_lib_dir)
> +
> ++sysroot_lib_dir =3D '%*'
> ++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)
> ++
> + gen_lib_dir =3D specs_prefix_format.format(get_option('libdir'))
> + lib_gen =3D gen_format.format(gen_lib_dir)
> +
> +-specs_libpath =3D '-L' + specs_option_format.format(lib_prefix,
> lib_buildtype, lib_gen)
> ++specs_libpath =3D '-L' + specs_option_format.format(lib_prefix,
> lib_buildtype, lib_sysroot, lib_gen)
> +
> + #
> + # Build the non-multilib *startfile options
> +@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for
> + buildtype_crt0_path =3D specs_prefix_format.format(get_option('libdir')=
 /
> '%*' / crt0_expr)
> + crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_crt0_path=
)
> +
> ++sysroot_crt0_path =3D '%*' + '/' + get_option('libdir') + '/' + '%*' + =
'/'
> + crt0_expr
> ++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_path)
> ++
> + gen_crt0_path =3D specs_prefix_format.format(get_option('libdir') /
> crt0_expr)
> + crt0_gen =3D gen_format.format(gen_crt0_path)
> +
> +@@ -686,10 +696,13 @@ if enable_multilib
> +   buildtype_multilib_dir =3D
> specs_prefix_format.format(get_option('libdir') / '%*/%M')
> +   multilib_buildtype =3D
> picolibc_buildtype_format.format(buildtype_multilib_dir)
> +
> ++  sysroot_multilib_dir =3D '%*' + '/' + get_option('libdir') + '/' +
> '%*/%M'
> ++  multilib_sysroot =3D sysroot_format.format(sysroot_multilib_dir)
> ++
> +   gen_multilib_dir =3D specs_prefix_format.format(get_option('libdir') =
/
> '%M')
> +   multilib_gen =3D gen_format.format(gen_multilib_dir)
> +
> +-  specs_multilibpath =3D '-L' +
> specs_option_format.format(multilib_prefix, multilib_buildtype,
> multilib_gen)
> ++  specs_multilibpath =3D '-L' +
> specs_option_format.format(multilib_prefix, multilib_buildtype,
> multilib_sysroot, multilib_gen)
> +
> +   #
> +   # Prepend the multilib -L option to the non-multilib option
> +@@ -705,6 +718,9 @@ if enable_multilib
> +   buildtype_multilib_crt0_path =3D
> specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_expr)
> +   crt0_buildtype =3D
> picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
> +
> ++  sysroot_multilib_crt0_path =3D '%*' + prefix + '/' +
> get_option('libdir') + '/' + '/%M' + '/' + crt0_expr
> ++  crt0_sysroot =3D sysroot_format.format(sysroot_multilib_crt0_path)
> ++
> +   gen_multilib_crt0_path =3D
> specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
> +   crt0_gen =3D gen_format.format(gen_multilib_crt0_path)
> + endif
> +@@ -714,7 +730,7 @@ endif
> + # above. As there's only one value, it's either the
> + # multilib path or the non-multilib path
> + #
> +-specs_startfile =3D specs_option_format.format(crt0_prefix,
> crt0_buildtype, crt0_gen)
> ++specs_startfile =3D specs_option_format.format(crt0_prefix,
> crt0_buildtype, crt0_sysroot, crt0_gen)
> + endif
> +
> + specs_data =3D configuration_data()
> diff --git
> a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> new file mode 100644
> index 0000000000..87bfbad3c5
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> @@ -0,0 +1,6 @@
> +# We need to explicitly bypass mesons sanity check to avoid early
> compiler errors
> +# otherwise meson will try to compile AND run test applications:
> +# ../git/meson.build:35:0: ERROR: Executables created by c compiler are
> not runnable...
> +
> +[properties]
> +skip_sanity_check=3Dtrue
> \ No newline at end of file
> diff --git a/meta/recipes-core/picolibc/picolibc_git.bb
> b/meta/recipes-core/picolibc/picolibc_git.bb
> new file mode 100644
> index 0000000000..fdb159328f
> --- /dev/null
> +++ b/meta/recipes-core/picolibc/picolibc_git.bb
> @@ -0,0 +1,35 @@
> +require picolibc.inc
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
> +
> +PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl"
> +
> +COMPATIBLE_HOST:libc-musl:class-target =3D "null"
> +COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
> +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> +
> +SRC_URI:append =3D " file://avoid_polluting_cross_directories.patch"
> +SRC_URI:append =3D " file://no-early-compiler-checks.cross"
> +
> +# This is being added by picolibc meson files as well to avoid
> +# early compiler tests from failing, cant remember why I added it
> +# to the newlib recipe but I would assume it was for the same reason
> +TARGET_CC_ARCH:append =3D " -nostdlib"
> +
> +# When using RISCV64 use medany for both C library and application recip=
es
> +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> +
> +inherit meson
> +
> +MESON_CROSS_FILE:append =3D "
> --cross-file=3D${UNPACKDIR}/no-early-compiler-checks.cross"
> +
> +PACKAGECONFIG ??=3D " specsdir"
> +# Install GCC specs on libdir
> +PACKAGECONFIG[specsdir] =3D "-Dspecsdir=3D${libdir},-Dspecsdir=3Dnone"
> +
> +
> +FILES:${PN}-dev:append =3D " ${libdir}/*.specs ${libdir}/*.ld"
> +
> +# No rpm package is actually created but -dev depends on it, avoid dnf
> error
> +DEV_PKG_DEPENDENCY:libc-picolibc =3D ""
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 5b0ca15d47..c04177df5a 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -34,6 +34,7 @@ EXTRA_OECONF +=3D "\
>  EXTRA_OECONF:append:libc-baremetal =3D " --without-headers"
>  EXTRA_OECONF:remove:libc-baremetal =3D "--enable-threads=3Dposix"
>  EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=3Dposix"
> +EXTRA_OECONF:remove:libc-picolibc =3D "--enable-threads=3Dposix"
>
>  EXTRA_OECONF_PATHS =3D "\
>      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} =
\
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 89b0bebcfb..1fca00f5f0 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D "\
>  EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
>  EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
>  EXTRA_OECONF:append:libc-newlib =3D " --with-newlib --with-target-subdir=
"
> +EXTRA_OECONF:append:libc-picolibc =3D " --with-newlib --with-target-subd=
ir"
>  EXTRA_OECONF:append:libc-baremetal =3D " --with-target-subdir"
>
>  # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D ""
>
>  # Newlib does not support symbol versioning on libsdtcc++
>  SYMVERS_CONF:libc-newlib =3D ""
> +SYMVERS_CONF:libc-picolibc =3D ""
>
>  # Building with thumb enabled on armv6t fails
>  ARM_INSTRUCTION_SET:armv6 =3D "arm"
> @@ -47,6 +49,7 @@ RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v3 libgom=
p
> libatomic ${RUNTIMELIBITM
>  "
>  # Only build libstdc++ for newlib
>  RUNTIMETARGET:libc-newlib =3D "libstdc++-v3"
> +RUNTIMETARGET:libc-picolibc =3D "libstdc++-v3"
>
>  # libiberty
>  # libgfortran needs separate recipe due to libquadmath dependency
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
> b/meta/recipes-devtools/gcc/libgcc-common.inc
> index d9084af51a..e3db17d700 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {
>                 rmdir ${D}${base_libdir}
>         fi
>  }
> +do_install:append:libc-picolibc () {
> +       if [ "${base_libdir}" !=3D "${libdir}" ]; then
> +               rmdir ${D}${base_libdir}
> +       fi
> +}
>
>  # No rpm package is actually created but -dev depends on it, avoid dnf
> error
>  DEV_PKG_DEPENDENCY:libc-baremetal =3D ""
> --
> 2.45.2
>
>
>

--0000000000003e77a6061b2e04a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This version is rebased on top of master after the UNPACK=
DIR changes.<div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro=C2=A0</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Jun 18, 2024, 12:09=E2=80=AFPM Alejandro Enedino Hernandez Sama=
niego &lt;<a href=3D"mailto:alejandro@enedino.org">alejandro@enedino.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Enables usage of TCLIB=
C=3Dpicolibc extending OE functionality to build and use<br>
picolibc based toolchains to build baremetal applications.<br>
<br>
Picolibc is a set of standard C libraries, both libc and libm, designed for=
<br>
smaller embedded systems with limited ROM and RAM. Picolibc includes code<b=
r>
from Newlib and AVR Libc, but adresses some of newlibs concerns, it retains=
<br>
newlibs directory structure, math, string and locale implementations, but<b=
r>
removed the GPL bits used to build the library, swiches old C style code fo=
r<br>
C18 and replaces autotools with meson.<br>
<br>
This patch adds a picolibc recipe for the C library, a picolibc-helloworld<=
br>
recipe that contains an example application and a testcase that builds it.<=
br>
<br>
Picolibc can be built for ARM and RISCV architectures, its been tested both=
<br>
for 32 and 64 bits, the provided example recipe produces the following outp=
ut:<br>
<br>
hello, world<br>
<br>
Runqemu does not automatically show any output since it hides QEMU stderr w=
hich<br>
is where the QEMU monitors output is directed to when using semihosting, bu=
t,<br>
manually running the same QEMU command does work properly.<br>
<br>
Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:=
alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@enedi=
no.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/baremetal-image.bbclass=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +-<br>
=C2=A0meta/classes-recipe/cross-canadian.bbclass=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0meta/conf/distro/include/tclibc-picolibc.inc=C2=A0 |=C2=A0 40 ++++++<=
br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../conf/machine/include/riscv/arch-riscv.inc |=C2=A0 =C2=A01 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/distrodata.py=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/picolibc.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
18 +++<br>
=C2=A0.../picolibc/<a href=3D"http://picolibc-helloworld_git.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">picolibc-helloworld_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++++++<br>
=C2=A0meta/recipes-core/picolibc/picolibc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 21 ++++<br>
=C2=A0.../avoid_polluting_cross_directories.patch=C2=A0 =C2=A0| 119 +++++++=
+++++++++++<br>
=C2=A0.../picolibc/no-early-compiler-checks.cross=C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
=C2=A0meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">picolibc_git.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 35 ++++++<br>
=C2=A0meta/recipes-devtools/gcc/gcc-cross.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0meta/recipes-devtools/gcc/libgcc-common.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A05 +<br>
=C2=A016 files changed, 296 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py<br>
=C2=A0create mode 100644 meta/recipes-core/picolibc/<a href=3D"http://picol=
ibc-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pico=
libc-helloworld_git.bb</a><br>
=C2=A0create mode 100644 meta/recipes-core/picolibc/picolibc.inc<br>
=C2=A0create mode 100644 meta/recipes-core/picolibc/picolibc/avoid_pollutin=
g_cross_directories.patch<br>
=C2=A0create mode 100644 meta/recipes-core/picolibc/picolibc/no-early-compi=
ler-checks.cross<br>
=C2=A0create mode 100644 meta/recipes-core/picolibc/<a href=3D"http://picol=
ibc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc_git.bb=
</a><br>
<br>
diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-rec=
ipe/baremetal-image.bbclass<br>
index 4e7d413626..27f2d2d10a 100644<br>
--- a/meta/classes-recipe/baremetal-image.bbclass<br>
+++ b/meta/classes-recipe/baremetal-image.bbclass<br>
@@ -16,8 +16,8 @@<br>
=C2=A0# See meta-skeleton for a working example.<br>
<br>
<br>
-# Toolchain should be baremetal or newlib based.<br>
-# TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib&quot;<br>
+# Toolchain should be baremetal or newlib/picolibc based.<br>
+# TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib&quot; or TCLIBC=
=3D&quot;picolibc&quot;<br>
=C2=A0COMPATIBLE_HOST:libc-musl:class-target =3D &quot;null&quot;<br>
=C2=A0COMPATIBLE_HOST:libc-glibc:class-target =3D &quot;null&quot;<br>
<br>
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-reci=
pe/cross-canadian.bbclass<br>
index 1670217d69..059d9aa95f 100644<br>
--- a/meta/classes-recipe/cross-canadian.bbclass<br>
+++ b/meta/classes-recipe/cross-canadian.bbclass<br>
@@ -36,7 +36,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;MODIFYTOS&quot;) !=3D &quot;1&quot;:<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;TCLIBC&quot;) in [ &#39;baremetal&#39;, &#=
39;newlib&#39; ]:<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;TCLIBC&quot;) in [ &#39;baremetal&#39;, &#=
39;newlib&#39;, &#39;picolibc&#39; ]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
=C2=A0 =C2=A0 =C2=A0tos =3D d.getVar(&quot;TARGET_OS&quot;)<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 42599267c1..ff24597723 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -578,6 +578,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D &quot;Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"no=
referrer">alex.kanavin@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-perf =3D &quot;Bruce Ashfield &lt;<a href=3D"mai=
lto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.as=
hfield@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-perl =3D &quot;Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.ka=
navin@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-perlcross =3D &quot;Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">al=
ex.kanavin@gmail.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-picolibc =3D &quot;Alejandro Hernandez &lt;<a href=3D=
"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejand=
ro@enedino.org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-picolibc-helloworld =3D &quot;Alejandro Hernandez &lt=
;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferr=
er">alejandro@enedino.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-piglit =3D &quot;Ross Burton &lt;<a href=3D"mail=
to:ross.burton@arm.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@ar=
m.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-pigz =3D &quot;Hongxu Jia &lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">hongxu.jia@w=
indriver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-pinentry =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank" rel=3D"noreferrer">unass=
igned@yoctoproject.org</a>&gt;&quot;<br>
diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/distr=
o/include/tclibc-picolibc.inc<br>
new file mode 100644<br>
index 0000000000..203765dfcb<br>
--- /dev/null<br>
+++ b/meta/conf/distro/include/tclibc-picolibc.inc<br>
@@ -0,0 +1,40 @@<br>
+#<br>
+# Picolibc configuration<br>
+#<br>
+<br>
+LIBCEXTENSION =3D &quot;-picolibc&quot;<br>
+LIBCOVERRIDE =3D &quot;:libc-picolibc&quot;<br>
+<br>
+PREFERRED_PROVIDER_virtual/libc ?=3D &quot;picolibc&quot;<br>
+PREFERRED_PROVIDER_virtual/libiconv ?=3D &quot;picolibc&quot;<br>
+PREFERRED_PROVIDER_virtual/libintl ?=3D &quot;picolibc&quot;<br>
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-glibc&qu=
ot;<br>
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-glibc&q=
uot;<br>
+<br>
+DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&quot;<br>
+<br>
+IMAGE_LINGUAS =3D &quot;&quot;<br>
+<br>
+LIBC_DEPENDENCIES =3D &quot; \<br>
+=C2=A0 =C2=A0 picolibc-dbg \<br>
+=C2=A0 =C2=A0 picolibc-dev \<br>
+=C2=A0 =C2=A0 libgcc-dev \<br>
+=C2=A0 =C2=A0 libgcc-dbg \<br>
+=C2=A0 =C2=A0 libstdc++-dev=C2=A0 \<br>
+=C2=A0 =C2=A0 libstdc++-staticdev \<br>
+&quot;<br>
+<br>
+ASSUME_PROVIDED +=3D &quot;virtual/crypt&quot;<br>
+<br>
+TARGET_OS =3D &quot;elf&quot;<br>
+TARGET_OS:arm =3D &quot;eabi&quot;<br>
+<br>
+TOOLCHAIN_HOST_TASK ?=3D &quot;packagegroup-cross-canadian-${MACHINE} nati=
vesdk-qemu nativesdk-sdk-provides-dummy&quot;<br>
+TOOLCHAIN_TARGET_TASK ?=3D &quot;${LIBC_DEPENDENCIES}&quot;<br>
+TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D &quot;zlib ncurses&quot;<br>
+<br>
+# RISCV linker doesnt support PIE<br>
+SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D &quot;${SECURITY_NOPIE_CFLAG=
S}&quot;<br>
+SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D &quot;${SECURITY_NOPIE_CFLAG=
S}&quot;<br>
+<br>
+<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index b0591881ba..ad89142934 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D &quot;Specifies the method for hand=
ling FPU code. For FPU-less targ<br>
=C2=A0TARGET_OS[doc] =3D &quot;Specifies the target&#39;s operating system.=
&quot;<br>
=C2=A0TARGET_PREFIX[doc] =3D &quot;The prefix for the cross-compile toolcha=
in (e.g. arm-linux-).&quot;<br>
=C2=A0TARGET_SYS[doc] =3D &quot;The target system is comprised of TARGET_AR=
CH,TARGET_VENDOR and TARGET_OS.&quot;<br>
-TCLIBC[doc] =3D &quot;Specifies C library (libc) variant to use during the=
 build process. You can select &#39;baremetal&#39;, &#39;glibc&#39;, &#39;m=
usl&#39; or &#39;newlib&#39;.&quot;<br>
+TCLIBC[doc] =3D &quot;Specifies C library (libc) variant to use during the=
 build process. You can select &#39;baremetal&#39;, &#39;glibc&#39;, &#39;m=
usl&#39;, &#39;newlib&#39;, or &#39;picolibc&#39;.&quot;<br>
=C2=A0TCMODE[doc] =3D &quot;Enables an external toolchain (where provided b=
y an additional layer) if set to a value other than &#39;default&#39;.&quot=
;<br>
=C2=A0TESTIMAGE_AUTO[doc] =3D &quot;Enables test booting of virtual machine=
 images under the QEMU emulator after any root filesystems are created and =
runs tests against those images each time an image is built.&quot;<br>
=C2=A0TEST_QEMUBOOT_TIMEOUT[doc] =3D &quot;The time in seconds allowed for =
an image to boot before automated runtime tests begin to run against an ima=
ge.&quot;<br>
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/mac=
hine/include/riscv/arch-riscv.inc<br>
index 230a266563..b34064e78f 100644<br>
--- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
@@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D &quot;${@bb.utils.contains(&#39;TU=
NE_FEATURES&#39;, &#39;riscv64nc&#39;, &#39; -marc<br>
<br>
=C2=A0# Fix: ld: unrecognized option &#39;--hash-style=3Dsysv&#39;<br>
=C2=A0LINKER_HASH_STYLE:libc-newlib =3D &quot;&quot;<br>
+LINKER_HASH_STYLE:libc-picolibc =3D &quot;&quot;<br>
=C2=A0# Fix: ld: unrecognized option &#39;--hash-style=3Dgnu&#39;<br>
=C2=A0LINKER_HASH_STYLE:libc-baremetal =3D &quot;&quot;<br>
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/sel=
ftest/cases/distrodata.py<br>
index ad952c004b..043953757f 100644<br>
--- a/meta/lib/oeqa/selftest/cases/distrodata.py<br>
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py<br>
@@ -55,7 +55,7 @@ but their recipes claim otherwise by setting UPSTREAM_VER=
SION_UNKNOWN. Please re<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def is_maintainer_exception(entry):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exceptions =3D [&quot;musl&quot;=
, &quot;newlib&quot;, &quot;linux-yocto&quot;, &quot;linux-dummy&quot;, &qu=
ot;mesa-gl&quot;, &quot;libgfortran&quot;, &quot;libx11-compose-data&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exceptions =3D [&quot;musl&quot;=
, &quot;newlib&quot;, &quot;picolibc&quot;, &quot;linux-yocto&quot;, &quot;=
linux-dummy&quot;, &quot;mesa-gl&quot;, &quot;libgfortran&quot;, &quot;libx=
11-compose-data&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;cve-update-nvd2-native&quot;,]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in exceptions:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i in entr=
y:<br>
diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py b/meta/lib/oeqa/selft=
est/cases/picolibc.py<br>
new file mode 100644<br>
index 0000000000..e40b4fc3d3<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/picolibc.py<br>
@@ -0,0 +1,18 @@<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import bitbake, get_bb_var<br>
+<br>
+class PicolibcTest(OESelftestTestCase):<br>
+<br>
+=C2=A0 =C2=A0 def test_picolibc(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible_machines =3D [&#39;qemuarm&#39;, &#=
39;qemuarm64&#39;, &#39;qemuriscv32&#39;, &#39;qemuriscv64&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D get_bb_var(&#39;MACHINE&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if machine not in compatible_machines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;This test onl=
y works with machines : %s&#39; % &#39; &#39;.join(compatible_machines))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;TCLIBC =3D &quot;picoli=
bc&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;picolibc-helloworld&quot;)<br>
diff --git a/meta/recipes-core/picolibc/<a href=3D"http://picolibc-hellowor=
ld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc-hellowo=
rld_git.bb</a> b/meta/recipes-core/picolibc/<a href=3D"http://picolibc-hell=
oworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc-hel=
loworld_git.bb</a><br>
new file mode 100644<br>
index 0000000000..573a571c24<br>
--- /dev/null<br>
+++ b/meta/recipes-core/picolibc/<a href=3D"http://picolibc-helloworld_git.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc-helloworld_git=
.bb</a><br>
@@ -0,0 +1,40 @@<br>
+require picolibc.inc<br>
+<br>
+# baremetal-image overrides<br>
+BAREMETAL_BINNAME ?=3D &quot;hello_picolibc_${MACHINE}&quot;<br>
+IMAGE_LINK_NAME ?=3D &quot;baremetal-picolibc-image-${MACHINE}&quot;<br>
+IMAGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
+QB_DEFAULT_KERNEL ?=3D &quot;${IMAGE_LINK_NAME}.elf&quot;<br>
+<br>
+inherit baremetal-image<br>
+<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemuriscv32|qemuriscv64&quo=
t;<br>
+<br>
+# Use semihosting to test via QEMU<br>
+QB_OPT_APPEND:append =3D &quot; -semihosting-config enable=3Don&quot;<br>
+<br>
+# picolibc comes with a set of linker scripts, set the file<br>
+# according to the architecture being built.<br>
+PICOLIBC_LINKERSCRIPT:qemuarm64 =3D &quot;aarch64.ld&quot;<br>
+PICOLIBC_LINKERSCRIPT:qemuarm =3D &quot;arm.ld&quot;<br>
+PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D &quot;riscv.ld&quot;<br>
+PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D &quot;riscv.ld&quot;<br>
+<br>
+# Simple compile function that manually exemplifies usage; as noted,<br>
+# use a custom linker script, the GCC specs provided by picolibc<br>
+# and semihost to be able to test via QEMU&#39;s monitor<br>
+do_compile(){<br>
+=C2=A0 =C2=A0 ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${S}/hello-world/${PI=
COLIBC_LINKERSCRIPT} -specs=3Dpicolibc.specs --oslib=3Dsemihost -o ${BAREME=
TAL_BINNAME}.elf ${S}/hello-world/hello-world.c<br>
+=C2=A0 =C2=A0 ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMETAL_BI=
NNAME}.bin<br>
+}<br>
+<br>
+do_install(){<br>
+=C2=A0 =C2=A0 install -d ${D}/${base_libdir}/firmware<br>
+=C2=A0 =C2=A0 install -m 755 ${B}/${BAREMETAL_BINNAME}.elf ${D}/${base_lib=
dir}/firmware/${BAREMETAL_BINNAME}.elf<br>
+=C2=A0 =C2=A0 install -m 755 ${B}/${BAREMETAL_BINNAME}.bin ${D}/${base_lib=
dir}/firmware/${BAREMETAL_BINNAME}.bin<br>
+}<br>
+<br>
+FILES:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \<br>
+=C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \<br>
+&quot;<br>
diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/pi=
colibc/picolibc.inc<br>
new file mode 100644<br>
index 0000000000..3b380fe7af<br>
--- /dev/null<br>
+++ b/meta/recipes-core/picolibc/picolibc.inc<br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;C Libraries for Smaller Embedded Systems&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://keithp.com/picolibc" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://keithp.com/picolibc</a>&quot;<br>
+DESCRIPTION =3D &quot;Picolibc is a set of standard C libraries, both libc=
 and libm, designed for smaller embedded systems with limited ROM and RAM. =
Picolibc includes code from Newlib and AVR Libc.&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+# Newlib based code but GPL related bits removed, test/printf-tests.c and =
test/testcases.c<br>
+# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of the =
artifacts.<br>
+LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.GPL2=
;md5=3D59530bdf33659b29e73d4adb9f9f6552 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.NEWL=
IB;md5=3D08ae03456feb75b81cfdb359e0f1ef85 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.pico=
libc;md5=3De50fa9458a40929689861ed472d46bc7 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+BASEVER =3D &quot;1.8.6&quot;<br>
+PV =3D &quot;${BASEVER}+git&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/picolibc/picolibc.git=
;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">github.com/picolibc/picolibc.git;protocol=3Dhttps;branch=3Dmain</a>&q=
uot;<br>
+SRCREV=3D&quot;764ef4e401a8f4c6a86ab723533841f072885a5b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_dire=
ctories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_d=
irectories.patch<br>
new file mode 100644<br>
index 0000000000..da6460c95c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories=
.patch<br>
@@ -0,0 +1,119 @@<br>
+Upstream-Status: Pending<br>
+<br>
+Picolibc uses its own specs file: picolibc.specs to facilitate compilation=
, this<br>
+needs to be passed down to GCC via the -specs argument.<br>
+<br>
+Using this specs file overrides some of the default options our toolchain =
was<br>
+built with, in this case, they modify the include_dir and lib_dir paths us=
ed for<br>
+compilation, their intention was to add support for -picolibc-prefix and<b=
r>
+-picolibc-buildtype arguments via the C preprocessor.<br>
+<br>
+-isystem %{-picolibc-prefix=3D*:%*/include/; -picolibc-buildtype=3D*:/usr/=
include/%*; :/usr/include} %(picolibc_cpp)<br>
+<br>
+This had the unwanted effect of defaulting to /usr/include for include_dir=
 if<br>
+those arguments are not being passed, this works fine for their flow but f=
or us<br>
+it pollutes the include directories with paths from the host. The same eff=
ect is<br>
+applicable for lib_dir and for the c runtime file.<br>
+<br>
+Our toolchain relies on --sysroot to avoid using any paths from the host, =
here we<br>
+manually add support for a third possible argument: -sysroot , if this is =
passed<br>
+then the paths used by the compiler will be relative to the path passed by=
 the<br>
+--sysroot=3D cmdline argument, setting back the behavior that we intended =
in the<br>
+first place.<br>
+<br>
+<br>
+Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto=
:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@ened=
ino.org</a>&gt;<br>
+<br>
+Index: git/meson.build<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/meson.build<br>
++++ git/meson.build<br>
+@@ -622,12 +622,13 @@ else<br>
+ #<br>
+ picolibc_prefix_format =3D &#39;-picolibc-prefix=3D*:@0@&#39;<br>
+ picolibc_buildtype_format =3D &#39;-picolibc-buildtype=3D*:@0@&#39;<br>
++sysroot_format =3D &#39;-sysroot=3D*:@0@&#39;<br>
+ gen_format =3D &#39;@0@&#39;<br>
+ <br>
+ #<br>
+ # How to glue the three options together<br>
+ #<br>
+-specs_option_format =3D &#39;%{@0@; @1@; :@2@}&#39;<br>
++specs_option_format =3D &#39;%{@0@; @1@; @2@; :@3@}&#39;<br>
+ <br>
+ #<br>
+ # Build the -isystem value<br>
+@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.<br>
+ buildtype_include_dir =3D specs_prefix_format.format(get_option(&#39;incl=
udedir&#39;) / &#39;%*&#39;)<br>
+ isystem_buildtype =3D picolibc_buildtype_format.format(buildtype_include_=
dir)<br>
+ <br>
++sysroot_include_dir =3D &#39;%*&#39;<br>
++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)<br>
++<br>
+ gen_include_dir =3D specs_prefix_format.format(get_option(&#39;includedir=
&#39;))<br>
+ isystem_gen =3D gen_format.format(gen_include_dir)<br>
+ <br>
+-specs_isystem =3D &#39;-isystem &#39; + specs_option_format.format(isyste=
m_prefix, isystem_buildtype, isystem_gen)<br>
++specs_isystem =3D &#39;-isystem &#39; + specs_option_format.format(isyste=
m_prefix, isystem_buildtype, isystem_sysroot, isystem_gen)<br>
+ <br>
+ #<br>
+ # Build the non-multilib -L value<br>
+@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form<br>
+ buildtype_lib_dir =3D specs_prefix_format.format(get_option(&#39;libdir&#=
39;) / &#39;%*&#39;)<br>
+ lib_buildtype =3D picolibc_buildtype_format.format(buildtype_lib_dir)<br>
+ <br>
++sysroot_lib_dir =3D &#39;%*&#39;<br>
++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)<br>
++<br>
+ gen_lib_dir =3D specs_prefix_format.format(get_option(&#39;libdir&#39;))<=
br>
+ lib_gen =3D gen_format.format(gen_lib_dir)<br>
+ <br>
+-specs_libpath =3D &#39;-L&#39; + specs_option_format.format(lib_prefix, l=
ib_buildtype, lib_gen)<br>
++specs_libpath =3D &#39;-L&#39; + specs_option_format.format(lib_prefix, l=
ib_buildtype, lib_sysroot, lib_gen)<br>
+ <br>
+ #<br>
+ # Build the non-multilib *startfile options<br>
+@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for<br>
+ buildtype_crt0_path =3D specs_prefix_format.format(get_option(&#39;libdir=
&#39;) / &#39;%*&#39; / crt0_expr)<br>
+ crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_crt0_path)<=
br>
+ <br>
++sysroot_crt0_path =3D &#39;%*&#39; + &#39;/&#39; + get_option(&#39;libdir=
&#39;) + &#39;/&#39; + &#39;%*&#39; + &#39;/&#39; + crt0_expr<br>
++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_path)<br>
++<br>
+ gen_crt0_path =3D specs_prefix_format.format(get_option(&#39;libdir&#39;)=
 / crt0_expr)<br>
+ crt0_gen =3D gen_format.format(gen_crt0_path)<br>
+ <br>
+@@ -686,10 +696,13 @@ if enable_multilib<br>
+=C2=A0 =C2=A0buildtype_multilib_dir =3D specs_prefix_format.format(get_opt=
ion(&#39;libdir&#39;) / &#39;%*/%M&#39;)<br>
+=C2=A0 =C2=A0multilib_buildtype =3D picolibc_buildtype_format.format(build=
type_multilib_dir)<br>
+ <br>
++=C2=A0 sysroot_multilib_dir =3D &#39;%*&#39; + &#39;/&#39; + get_option(&=
#39;libdir&#39;) + &#39;/&#39; + &#39;%*/%M&#39;<br>
++=C2=A0 multilib_sysroot =3D sysroot_format.format(sysroot_multilib_dir)<b=
r>
++=C2=A0 <br>
+=C2=A0 =C2=A0gen_multilib_dir =3D specs_prefix_format.format(get_option(&#=
39;libdir&#39;) / &#39;%M&#39;)<br>
+=C2=A0 =C2=A0multilib_gen =3D gen_format.format(gen_multilib_dir)<br>
+ <br>
+-=C2=A0 specs_multilibpath =3D &#39;-L&#39; + specs_option_format.format(m=
ultilib_prefix, multilib_buildtype, multilib_gen)<br>
++=C2=A0 specs_multilibpath =3D &#39;-L&#39; + specs_option_format.format(m=
ultilib_prefix, multilib_buildtype, multilib_sysroot, multilib_gen)<br>
+ <br>
+=C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0# Prepend the multilib -L option to the non-multilib option<b=
r>
+@@ -705,6 +718,9 @@ if enable_multilib<br>
+=C2=A0 =C2=A0buildtype_multilib_crt0_path =3D specs_prefix_format.format(g=
et_option(&#39;libdir&#39;) / &#39;%*/%M&#39; / crt0_expr)<br>
+=C2=A0 =C2=A0crt0_buildtype =3D picolibc_buildtype_format.format(buildtype=
_multilib_crt0_path)<br>
+ <br>
++=C2=A0 sysroot_multilib_crt0_path =3D &#39;%*&#39; + prefix + &#39;/&#39;=
 + get_option(&#39;libdir&#39;) + &#39;/&#39; + &#39;/%M&#39; + &#39;/&#39;=
 + crt0_expr<br>
++=C2=A0 crt0_sysroot =3D sysroot_format.format(sysroot_multilib_crt0_path)=
<br>
++=C2=A0 <br>
+=C2=A0 =C2=A0gen_multilib_crt0_path =3D specs_prefix_format.format(get_opt=
ion(&#39;libdir&#39;) / &#39;%M&#39; / crt0_expr)<br>
+=C2=A0 =C2=A0crt0_gen =3D gen_format.format(gen_multilib_crt0_path)<br>
+ endif<br>
+@@ -714,7 +730,7 @@ endif<br>
+ # above. As there&#39;s only one value, it&#39;s either the<br>
+ # multilib path or the non-multilib path<br>
+ #<br>
+-specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_buildtyp=
e, crt0_gen)<br>
++specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_buildtyp=
e, crt0_sysroot, crt0_gen)<br>
+ endif<br>
+ <br>
+ specs_data =3D configuration_data()<br>
diff --git a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.c=
ross b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross<b=
r>
new file mode 100644<br>
index 0000000000..87bfbad3c5<br>
--- /dev/null<br>
+++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross<br=
>
@@ -0,0 +1,6 @@<br>
+# We need to explicitly bypass mesons sanity check to avoid early compiler=
 errors<br>
+# otherwise meson will try to compile AND run test applications:<br>
+# ../git/meson.build:35:0: ERROR: Executables created by c compiler are no=
t runnable...<br>
+<br>
+[properties]<br>
+skip_sanity_check=3Dtrue<br>
\ No newline at end of file<br>
diff --git a/meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc_git.bb</a> b/meta/=
recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">picolibc_git.bb</a><br>
new file mode 100644<br>
index 0000000000..fdb159328f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">picolibc_git.bb</a><br>
@@ -0,0 +1,35 @@<br>
+require picolibc.inc<br>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc&quot;<br>
+<br>
+PROVIDES +=3D &quot;virtual/libc virtual/libiconv virtual/libintl&quot;<br=
>
+<br>
+COMPATIBLE_HOST:libc-musl:class-target =3D &quot;null&quot;<br>
+COMPATIBLE_HOST:libc-glibc:class-target =3D &quot;null&quot;<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemuriscv32|qemuriscv64&quo=
t;<br>
+<br>
+SRC_URI:append =3D &quot; file://avoid_polluting_cross_directories.patch&q=
uot;<br>
+SRC_URI:append =3D &quot; file://no-early-compiler-checks.cross&quot;<br>
+<br>
+# This is being added by picolibc meson files as well to avoid<br>
+# early compiler tests from failing, cant remember why I added it<br>
+# to the newlib recipe but I would assume it was for the same reason<br>
+TARGET_CC_ARCH:append =3D &quot; -nostdlib&quot;<br>
+<br>
+# When using RISCV64 use medany for both C library and application recipes=
<br>
+TARGET_CFLAGS:append:qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<br>
+<br>
+inherit meson<br>
+<br>
+MESON_CROSS_FILE:append =3D &quot; --cross-file=3D${UNPACKDIR}/no-early-co=
mpiler-checks.cross&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot; specsdir&quot;<br>
+# Install GCC specs on libdir<br>
+PACKAGECONFIG[specsdir] =3D &quot;-Dspecsdir=3D${libdir},-Dspecsdir=3Dnone=
&quot;<br>
+<br>
+<br>
+FILES:${PN}-dev:append =3D &quot; ${libdir}/*.specs ${libdir}/*.ld&quot;<b=
r>
+<br>
+# No rpm package is actually created but -dev depends on it, avoid dnf err=
or<br>
+DEV_PKG_DEPENDENCY:libc-picolibc =3D &quot;&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtool=
s/gcc/gcc-cross.inc<br>
index 5b0ca15d47..c04177df5a 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
@@ -34,6 +34,7 @@ EXTRA_OECONF +=3D &quot;\<br>
=C2=A0EXTRA_OECONF:append:libc-baremetal =3D &quot; --without-headers&quot;=
<br>
=C2=A0EXTRA_OECONF:remove:libc-baremetal =3D &quot;--enable-threads=3Dposix=
&quot;<br>
=C2=A0EXTRA_OECONF:remove:libc-newlib =3D &quot;--enable-threads=3Dposix&qu=
ot;<br>
+EXTRA_OECONF:remove:libc-picolibc =3D &quot;--enable-threads=3Dposix&quot;=
<br>
<br>
=C2=A0EXTRA_OECONF_PATHS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--with-gxx-include-dir=3D/not/exist${target_includedir}=
/c++/${BINV} \<br>
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc<br>
index 89b0bebcfb..1fca00f5f0 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
@@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
=C2=A0EXTRA_OECONF:append:linuxstdbase =3D &quot; --enable-clocale=3Dgnu&qu=
ot;<br>
=C2=A0EXTRA_OECONF:append =3D &quot; --cache-file=3D${B}/config.cache&quot;=
<br>
=C2=A0EXTRA_OECONF:append:libc-newlib =3D &quot; --with-newlib --with-targe=
t-subdir&quot;<br>
+EXTRA_OECONF:append:libc-picolibc =3D &quot; --with-newlib --with-target-s=
ubdir&quot;<br>
=C2=A0EXTRA_OECONF:append:libc-baremetal =3D &quot; --with-target-subdir&qu=
ot;<br>
<br>
=C2=A0# Disable ifuncs for libatomic on arm conflicts -march/-mcpu<br>
@@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D &quot;&quot;<br>
<br>
=C2=A0# Newlib does not support symbol versioning on libsdtcc++<br>
=C2=A0SYMVERS_CONF:libc-newlib =3D &quot;&quot;<br>
+SYMVERS_CONF:libc-picolibc =3D &quot;&quot;<br>
<br>
=C2=A0# Building with thumb enabled on armv6t fails<br>
=C2=A0ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
@@ -47,6 +49,7 @@ RUNTIMETARGET =3D &quot;${RUNTIMELIBSSP} libstdc++-v3 lib=
gomp libatomic ${RUNTIMELIBITM<br>
=C2=A0&quot;<br>
=C2=A0# Only build libstdc++ for newlib<br>
=C2=A0RUNTIMETARGET:libc-newlib =3D &quot;libstdc++-v3&quot;<br>
+RUNTIMETARGET:libc-picolibc =3D &quot;libstdc++-v3&quot;<br>
<br>
=C2=A0# libiberty<br>
=C2=A0# libgfortran needs separate recipe due to libquadmath dependency<br>
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-dev=
tools/gcc/libgcc-common.inc<br>
index d9084af51a..e3db17d700 100644<br>
--- a/meta/recipes-devtools/gcc/libgcc-common.inc<br>
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc<br>
@@ -53,6 +53,11 @@ do_install:append:libc-newlib () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir ${D}${base_li=
bdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+do_install:append:libc-picolibc () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_libdir}&quot; !=3D &quot;${li=
bdir}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${base_li=
bdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
<br>
=C2=A0# No rpm package is actually created but -dev depends on it, avoid dn=
f error<br>
=C2=A0DEV_PKG_DEPENDENCY:libc-baremetal =3D &quot;&quot;<br>
-- <br>
2.45.2<br>
<br>
<br>
</blockquote></div>

--0000000000003e77a6061b2e04a5--

