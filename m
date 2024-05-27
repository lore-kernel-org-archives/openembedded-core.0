Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F66C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 23:12:18 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.10094.1716851531530269244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 16:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d1b7ad2283so140115b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716851531; x=1717456331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOVq4s60Nq7e1SbPul+/wh3VGNv2q3OOAY1lD5Qjbyk=;
        b=E2NVY6Zeo9y4KY1OlSu6y6iJfSAS3riz7MGwsXKsn/McZvg1HeD4XwKhSWEh0EiJ4r
         sizkyNb51QpewR5YMRJYorbPHb9eCiEozaqB8+w9UMpi3kv5IyIlFe4r/GI32PHolLtc
         Fg/HOtL9gKOjo/uve+hS0BYuq4PaJXxPVZgxIqQPGXZyjGVScF9Y95tM90p1KFAz0NXo
         QGuiECP8xyl7X6+RBEnwjORN0Fvs7Hw03DPsNomqgkEGYZyZkZk7XIMQEi7Fq7RHnX++
         xOrv0R/pkBLVQuqUOe4iIE5x/MuaM6iGqmEOwSlOYzUHvzp1Yn7tk3d8CsCYVLOiMo9A
         ie0g==
X-Gm-Message-State: AOJu0YwuR/cO4hfw4+DJ6I0Shn0iXgIKbe9yRToIsaSjuyDa1SpKesvZ
	LwdCN02Cgt2CD9cjfOih4Ftw0nkg6gt4Qh6W59+QT7sCg1RhRYYzSL0hxYInB0g=
X-Google-Smtp-Source: AGHT+IH0vrpfVnsAp25NgdTnSZrd1ShnpVJmqvyFwh9H/RqaPXS8iqwvCEkmjwppkoz8DzDEk4i4fA==
X-Received: by 2002:a05:6808:a8d:b0:3c9:9fda:37f1 with SMTP id 5614622812f47-3d1a6110d91mr9970031b6e.29.1716851529807;
        Mon, 27 May 2024 16:12:09 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d1b36c1eeesm1191178b6e.23.2024.05.27.16.12.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 16:12:09 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b97a071c92so122425eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:12:09 -0700 (PDT)
X-Received: by 2002:a05:6820:80a:b0:5af:36ef:27d0 with SMTP id
 006d021491bc7-5b95fd9c650mr11593067eaf.1.1716851529126; Mon, 27 May 2024
 16:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240522203306.2241962-1-alejandro@enedino.org> <202405262006264e2aa991@mail.local>
In-Reply-To: <202405262006264e2aa991@mail.local>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Mon, 27 May 2024 17:11:58 -0600
X-Gmail-Original-Message-ID: <CAHMutraEG7w3pjK8j_Xf7_57RqSKsg0tVj2T8L1RySBq9hCL=w@mail.gmail.com>
Message-ID: <CAHMutraEG7w3pjK8j_Xf7_57RqSKsg0tVj2T8L1RySBq9hCL=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000086a363061977a5ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 23:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199947

--00000000000086a363061977a5ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024, 2:06=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Please always resend the whole series, I'm not cherry-picking patches
> once they have been dropped.
>

Done

Cheers,

Alejandro


> On 22/05/2024 14:33:06-0600, Alejandro Hernandez Samaniego wrote:
> > Enables usage of TCLIBC=3Dpicolibc extending OE functionality to build =
and
> use
> > picolibc based toolchains to build baremetal applications.
> >
> > Picolibc is a set of standard C libraries, both libc and libm, designed
> for
> > smaller embedded systems with limited ROM and RAM. Picolibc includes co=
de
> > from Newlib and AVR Libc, but adresses some of newlibs concerns, it
> retains
> > newlibs directory structure, math, string and locale implementations, b=
ut
> > removed the GPL bits used to build the library, swiches old C style cod=
e
> for
> > C18 and replaces autotools with meson.
> >
> > This patch adds a picolibc recipe for the C library, a
> picolibc-helloworld
> > recipe that contains an example application and a testcase that builds
> it.
> >
> > Picolibc can be built for ARM and RISCV architectures, its been tested
> both
> > for 32 and 64 bits, the provided example recipe produces the following
> output:
> >
> > hello, world
> >
> > Runqemu does not automatically show any output since it hides QEMU
> stderr which
> > is where the QEMU monitors output is directed to when using semihosting=
,
> but,
> > manually running the same QEMU command does work properly.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  meta/classes-recipe/baremetal-image.bbclass   |   4 +-
> >  meta/classes-recipe/cross-canadian.bbclass    |   2 +-
> >  meta/conf/distro/include/maintainers.inc      |   2 +
> >  meta/conf/distro/include/tclibc-picolibc.inc  |  40 ++++++
> >  meta/conf/documentation.conf                  |   2 +-
> >  .../conf/machine/include/riscv/arch-riscv.inc |   1 +
> >  meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
> >  meta/lib/oeqa/selftest/cases/picolibc.py      |  18 +++
> >  .../picolibc/picolibc-helloworld_git.bb       |  40 ++++++
> >  meta/recipes-core/picolibc/picolibc.inc       |  21 ++++
> >  .../avoid_polluting_cross_directories.patch   | 119 ++++++++++++++++++
> >  .../picolibc/no-early-compiler-checks.cross   |   6 +
> >  meta/recipes-core/picolibc/picolibc_git.bb    |  35 ++++++
> >  meta/recipes-devtools/gcc/gcc-cross.inc       |   1 +
> >  meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +
> >  meta/recipes-devtools/gcc/libgcc-common.inc   |   5 +
> >  16 files changed, 296 insertions(+), 5 deletions(-)
> >  create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc
> >  create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py
> >  create mode 100644 meta/recipes-core/picolibc/
> picolibc-helloworld_git.bb
> >  create mode 100644 meta/recipes-core/picolibc/picolibc.inc
> >  create mode 100644
> meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.pat=
ch
> >  create mode 100644
> meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> >  create mode 100644 meta/recipes-core/picolibc/picolibc_git.bb
> >
> > diff --git a/meta/classes-recipe/baremetal-image.bbclass
> b/meta/classes-recipe/baremetal-image.bbclass
> > index 4e7d413626..27f2d2d10a 100644
> > --- a/meta/classes-recipe/baremetal-image.bbclass
> > +++ b/meta/classes-recipe/baremetal-image.bbclass
> > @@ -16,8 +16,8 @@
> >  # See meta-skeleton for a working example.
> >
> >
> > -# Toolchain should be baremetal or newlib based.
> > -# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"
> > +# Toolchain should be baremetal or newlib/picolibc based.
> > +# TCLIBC=3D"baremetal" or TCLIBC=3D"newlib" or TCLIBC=3D"picolibc"
> >  COMPATIBLE_HOST:libc-musl:class-target =3D "null"
> >  COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
> >
> > diff --git a/meta/classes-recipe/cross-canadian.bbclass
> b/meta/classes-recipe/cross-canadian.bbclass
> > index 1670217d69..059d9aa95f 100644
> > --- a/meta/classes-recipe/cross-canadian.bbclass
> > +++ b/meta/classes-recipe/cross-canadian.bbclass
> > @@ -36,7 +36,7 @@ python () {
> >      if d.getVar("MODIFYTOS") !=3D "1":
> >          return
> >
> > -    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
> > +    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib', 'picolibc' ]:
> >          return
> >
> >      tos =3D d.getVar("TARGET_OS")
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 014cf32e40..bb75d147fe 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -579,6 +579,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D "Alexander Kanavin=
 <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-perf =3D "Bruce Ashfield <bruce.ashfield@gmail.co=
m>"
> >  RECIPE_MAINTAINER:pn-perl =3D "Alexander Kanavin <alex.kanavin@gmail.c=
om
> >"
> >  RECIPE_MAINTAINER:pn-perlcross =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> > +RECIPE_MAINTAINER:pn-picolibc =3D "Alejandro Hernandez <
> alejandro@enedino.org>"
> > +RECIPE_MAINTAINER:pn-picolibc-helloworld =3D "Alejandro Hernandez <
> alejandro@enedino.org>"
> >  RECIPE_MAINTAINER:pn-piglit =3D "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> >  RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned <
> unassigned@yoctoproject.org>"
> > diff --git a/meta/conf/distro/include/tclibc-picolibc.inc
> b/meta/conf/distro/include/tclibc-picolibc.inc
> > new file mode 100644
> > index 0000000000..203765dfcb
> > --- /dev/null
> > +++ b/meta/conf/distro/include/tclibc-picolibc.inc
> > @@ -0,0 +1,40 @@
> > +#
> > +# Picolibc configuration
> > +#
> > +
> > +LIBCEXTENSION =3D "-picolibc"
> > +LIBCOVERRIDE =3D ":libc-picolibc"
> > +
> > +PREFERRED_PROVIDER_virtual/libc ?=3D "picolibc"
> > +PREFERRED_PROVIDER_virtual/libiconv ?=3D "picolibc"
> > +PREFERRED_PROVIDER_virtual/libintl ?=3D "picolibc"
> > +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
> > +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> > +
> > +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
> > +
> > +IMAGE_LINGUAS =3D ""
> > +
> > +LIBC_DEPENDENCIES =3D " \
> > +    picolibc-dbg \
> > +    picolibc-dev \
> > +    libgcc-dev \
> > +    libgcc-dbg \
> > +    libstdc++-dev  \
> > +    libstdc++-staticdev \
> > +"
> > +
> > +ASSUME_PROVIDED +=3D "virtual/crypt"
> > +
> > +TARGET_OS =3D "elf"
> > +TARGET_OS:arm =3D "eabi"
> > +
> > +TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE}
> nativesdk-qemu nativesdk-sdk-provides-dummy"
> > +TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
> > +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "zlib ncurses"
> > +
> > +# RISCV linker doesnt support PIE
> > +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D "${SECURITY_NOPIE_CFLAGS=
}"
> > +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D "${SECURITY_NOPIE_CFLAGS=
}"
> > +
> > +
> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.con=
f
> > index b0591881ba..ad89142934 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D "Specifies the method for handl=
ing
> FPU code. For FPU-less targ
> >  TARGET_OS[doc] =3D "Specifies the target's operating system."
> >  TARGET_PREFIX[doc] =3D "The prefix for the cross-compile toolchain (e.=
g.
> arm-linux-)."
> >  TARGET_SYS[doc] =3D "The target system is comprised of
> TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
> > -TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the
> build process. You can select 'baremetal', 'glibc', 'musl' or 'newlib'."
> > +TCLIBC[doc] =3D "Specifies C library (libc) variant to use during the
> build process. You can select 'baremetal', 'glibc', 'musl', 'newlib', or
> 'picolibc'."
> >  TCMODE[doc] =3D "Enables an external toolchain (where provided by an
> additional layer) if set to a value other than 'default'."
> >  TESTIMAGE_AUTO[doc] =3D "Enables test booting of virtual machine image=
s
> under the QEMU emulator after any root filesystems are created and runs
> tests against those images each time an image is built."
> >  TEST_QEMUBOOT_TIMEOUT[doc] =3D "The time in seconds allowed for an ima=
ge
> to boot before automated runtime tests begin to run against an image."
> > diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> > index 230a266563..b34064e78f 100644
> > --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> > +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> > @@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -marc
> >
> >  # Fix: ld: unrecognized option '--hash-style=3Dsysv'
> >  LINKER_HASH_STYLE:libc-newlib =3D ""
> > +LINKER_HASH_STYLE:libc-picolibc =3D ""
> >  # Fix: ld: unrecognized option '--hash-style=3Dgnu'
> >  LINKER_HASH_STYLE:libc-baremetal =3D ""
> > diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
> b/meta/lib/oeqa/selftest/cases/distrodata.py
> > index ad952c004b..043953757f 100644
> > --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> > +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> > @@ -55,7 +55,7 @@ but their recipes claim otherwise by setting
> UPSTREAM_VERSION_UNKNOWN. Please re
> >              return False
> >
> >          def is_maintainer_exception(entry):
> > -            exceptions =3D ["musl", "newlib", "linux-yocto",
> "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
> > +            exceptions =3D ["musl", "newlib", "picolibc", "linux-yocto=
",
> "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
> >                            "cve-update-nvd2-native",]
> >              for i in exceptions:
> >                   if i in entry:
> > diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py
> b/meta/lib/oeqa/selftest/cases/picolibc.py
> > new file mode 100644
> > index 0000000000..e40b4fc3d3
> > --- /dev/null
> > +++ b/meta/lib/oeqa/selftest/cases/picolibc.py
> > @@ -0,0 +1,18 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +from oeqa.selftest.case import OESelftestTestCase
> > +from oeqa.utils.commands import bitbake, get_bb_var
> > +
> > +class PicolibcTest(OESelftestTestCase):
> > +
> > +    def test_picolibc(self):
> > +        compatible_machines =3D ['qemuarm', 'qemuarm64', 'qemuriscv32'=
,
> 'qemuriscv64']
> > +        machine =3D get_bb_var('MACHINE')
> > +        if machine not in compatible_machines:
> > +            self.skipTest('This test only works with machines : %s' % =
'
> '.join(compatible_machines))
> > +        self.write_config('TCLIBC =3D "picolibc"')
> > +        bitbake("picolibc-helloworld")
> > diff --git a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> > new file mode 100644
> > index 0000000000..573a571c24
> > --- /dev/null
> > +++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
> > @@ -0,0 +1,40 @@
> > +require picolibc.inc
> > +
> > +# baremetal-image overrides
> > +BAREMETAL_BINNAME ?=3D "hello_picolibc_${MACHINE}"
> > +IMAGE_LINK_NAME ?=3D "baremetal-picolibc-image-${MACHINE}"
> > +IMAGE_NAME_SUFFIX ?=3D ""
> > +QB_DEFAULT_KERNEL ?=3D "${IMAGE_LINK_NAME}.elf"
> > +
> > +inherit baremetal-image
> > +
> > +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> > +
> > +# Use semihosting to test via QEMU
> > +QB_OPT_APPEND:append =3D " -semihosting-config enable=3Don"
> > +
> > +# picolibc comes with a set of linker scripts, set the file
> > +# according to the architecture being built.
> > +PICOLIBC_LINKERSCRIPT:qemuarm64 =3D "aarch64.ld"
> > +PICOLIBC_LINKERSCRIPT:qemuarm =3D "arm.ld"
> > +PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D "riscv.ld"
> > +PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D "riscv.ld"
> > +
> > +# Simple compile function that manually exemplifies usage; as noted,
> > +# use a custom linker script, the GCC specs provided by picolibc
> > +# and semihost to be able to test via QEMU's monitor
> > +do_compile(){
> > +    ${CC} ${CFLAGS} ${LDFLAGS} --verbose
> -T${S}/hello-world/${PICOLIBC_LINKERSCRIPT} -specs=3Dpicolibc.specs
> --oslib=3Dsemihost -o ${BAREMETAL_BINNAME}.elf ${S}/hello-world/hello-wor=
ld.c
> > +    ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf
> ${BAREMETAL_BINNAME}.bin
> > +}
> > +
> > +do_install(){
> > +    install -d ${D}/${base_libdir}/firmware
> > +    install -m 755 ${B}/${BAREMETAL_BINNAME}.elf
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> > +    install -m 755 ${B}/${BAREMETAL_BINNAME}.bin
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> > +}
> > +
> > +FILES:${PN} +=3D " \
> > +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
> > +    ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
> > +"
> > diff --git a/meta/recipes-core/picolibc/picolibc.inc
> b/meta/recipes-core/picolibc/picolibc.inc
> > new file mode 100644
> > index 0000000000..3b380fe7af
> > --- /dev/null
> > +++ b/meta/recipes-core/picolibc/picolibc.inc
> > @@ -0,0 +1,21 @@
> > +SUMMARY =3D "C Libraries for Smaller Embedded Systems"
> > +HOMEPAGE =3D "https://keithp.com/picolibc"
> > +DESCRIPTION =3D "Picolibc is a set of standard C libraries, both libc =
and
> libm, designed for smaller embedded systems with limited ROM and RAM.
> Picolibc includes code from Newlib and AVR Libc."
> > +SECTION =3D "libs"
> > +
> > +# Newlib based code but GPL related bits removed, test/printf-tests.c
> and test/testcases.c
> > +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of
> the artifacts.
> > +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D " \
> > +             file://COPYING.GPL2;md5=3D59530bdf33659b29e73d4adb9f9f655=
2 \
> > +             file://COPYING.NEWLIB;md5=3D08ae03456feb75b81cfdb359e0f1e=
f85
> \
> > +
>  file://COPYING.picolibc;md5=3De50fa9458a40929689861ed472d46bc7 \
> > +             "
> > +
> > +BASEVER =3D "1.8.6"
> > +PV =3D "${BASEVER}+git"
> > +SRC_URI =3D "git://
> github.com/picolibc/picolibc.git;protocol=3Dhttps;branch=3Dmain"
> > +SRCREV=3D"764ef4e401a8f4c6a86ab723533841f072885a5b"
> > +
> > +S =3D "${WORKDIR}/git"
> > +B =3D "${WORKDIR}/build"
> > diff --git
> a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
> b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
> > new file mode 100644
> > index 0000000000..da6460c95c
> > --- /dev/null
> > +++
> b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.p=
atch
> > @@ -0,0 +1,119 @@
> > +Upstream-Status: Pending
> > +
> > +Picolibc uses its own specs file: picolibc.specs to facilitate
> compilation, this
> > +needs to be passed down to GCC via the -specs argument.
> > +
> > +Using this specs file overrides some of the default options our
> toolchain was
> > +built with, in this case, they modify the include_dir and lib_dir path=
s
> used for
> > +compilation, their intention was to add support for -picolibc-prefix a=
nd
> > +-picolibc-buildtype arguments via the C preprocessor.
> > +
> > +-isystem %{-picolibc-prefix=3D*:%*/include/;
> -picolibc-buildtype=3D*:/usr/include/%*; :/usr/include} %(picolibc_cpp)
> > +
> > +This had the unwanted effect of defaulting to /usr/include for
> include_dir if
> > +those arguments are not being passed, this works fine for their flow
> but for us
> > +it pollutes the include directories with paths from the host. The same
> effect is
> > +applicable for lib_dir and for the c runtime file.
> > +
> > +Our toolchain relies on --sysroot to avoid using any paths from the
> host, here we
> > +manually add support for a third possible argument: -sysroot , if this
> is passed
> > +then the paths used by the compiler will be relative to the path passe=
d
> by the
> > +--sysroot=3D cmdline argument, setting back the behavior that we inten=
ded
> in the
> > +first place.
> > +
> > +
> > +Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > +
> > +Index: git/meson.build
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- git.orig/meson.build
> > ++++ git/meson.build
> > +@@ -622,12 +622,13 @@ else
> > + #
> > + picolibc_prefix_format =3D '-picolibc-prefix=3D*:@0@'
> > + picolibc_buildtype_format =3D '-picolibc-buildtype=3D*:@0@'
> > ++sysroot_format =3D '-sysroot=3D*:@0@'
> > + gen_format =3D '@0@'
> > +
> > + #
> > + # How to glue the three options together
> > + #
> > +-specs_option_format =3D '%{@0@; @1@; :@2@}'
> > ++specs_option_format =3D '%{@0@; @1@; @2@; :@3@}'
> > +
> > + #
> > + # Build the -isystem value
> > +@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.
> > + buildtype_include_dir =3D
> specs_prefix_format.format(get_option('includedir') / '%*')
> > + isystem_buildtype =3D
> picolibc_buildtype_format.format(buildtype_include_dir)
> > +
> > ++sysroot_include_dir =3D '%*'
> > ++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)
> > ++
> > + gen_include_dir =3D specs_prefix_format.format(get_option('includedir=
'))
> > + isystem_gen =3D gen_format.format(gen_include_dir)
> > +
> > +-specs_isystem =3D '-isystem ' +
> specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_gen=
)
> > ++specs_isystem =3D '-isystem ' +
> specs_option_format.format(isystem_prefix, isystem_buildtype,
> isystem_sysroot, isystem_gen)
> > +
> > + #
> > + # Build the non-multilib -L value
> > +@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form
> > + buildtype_lib_dir =3D specs_prefix_format.format(get_option('libdir')=
 /
> '%*')
> > + lib_buildtype =3D picolibc_buildtype_format.format(buildtype_lib_dir)
> > +
> > ++sysroot_lib_dir =3D '%*'
> > ++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)
> > ++
> > + gen_lib_dir =3D specs_prefix_format.format(get_option('libdir'))
> > + lib_gen =3D gen_format.format(gen_lib_dir)
> > +
> > +-specs_libpath =3D '-L' + specs_option_format.format(lib_prefix,
> lib_buildtype, lib_gen)
> > ++specs_libpath =3D '-L' + specs_option_format.format(lib_prefix,
> lib_buildtype, lib_sysroot, lib_gen)
> > +
> > + #
> > + # Build the non-multilib *startfile options
> > +@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for
> > + buildtype_crt0_path =3D specs_prefix_format.format(get_option('libdir=
')
> / '%*' / crt0_expr)
> > + crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_crt0_pa=
th)
> > +
> > ++sysroot_crt0_path =3D '%*' + '/' + get_option('libdir') + '/' + '%*' =
+
> '/' + crt0_expr
> > ++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_path)
> > ++
> > + gen_crt0_path =3D specs_prefix_format.format(get_option('libdir') /
> crt0_expr)
> > + crt0_gen =3D gen_format.format(gen_crt0_path)
> > +
> > +@@ -686,10 +696,13 @@ if enable_multilib
> > +   buildtype_multilib_dir =3D
> specs_prefix_format.format(get_option('libdir') / '%*/%M')
> > +   multilib_buildtype =3D
> picolibc_buildtype_format.format(buildtype_multilib_dir)
> > +
> > ++  sysroot_multilib_dir =3D '%*' + '/' + get_option('libdir') + '/' +
> '%*/%M'
> > ++  multilib_sysroot =3D sysroot_format.format(sysroot_multilib_dir)
> > ++
> > +   gen_multilib_dir =3D specs_prefix_format.format(get_option('libdir'=
) /
> '%M')
> > +   multilib_gen =3D gen_format.format(gen_multilib_dir)
> > +
> > +-  specs_multilibpath =3D '-L' +
> specs_option_format.format(multilib_prefix, multilib_buildtype,
> multilib_gen)
> > ++  specs_multilibpath =3D '-L' +
> specs_option_format.format(multilib_prefix, multilib_buildtype,
> multilib_sysroot, multilib_gen)
> > +
> > +   #
> > +   # Prepend the multilib -L option to the non-multilib option
> > +@@ -705,6 +718,9 @@ if enable_multilib
> > +   buildtype_multilib_crt0_path =3D
> specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_expr)
> > +   crt0_buildtype =3D
> picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
> > +
> > ++  sysroot_multilib_crt0_path =3D '%*' + prefix + '/' +
> get_option('libdir') + '/' + '/%M' + '/' + crt0_expr
> > ++  crt0_sysroot =3D sysroot_format.format(sysroot_multilib_crt0_path)
> > ++
> > +   gen_multilib_crt0_path =3D
> specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
> > +   crt0_gen =3D gen_format.format(gen_multilib_crt0_path)
> > + endif
> > +@@ -714,7 +730,7 @@ endif
> > + # above. As there's only one value, it's either the
> > + # multilib path or the non-multilib path
> > + #
> > +-specs_startfile =3D specs_option_format.format(crt0_prefix,
> crt0_buildtype, crt0_gen)
> > ++specs_startfile =3D specs_option_format.format(crt0_prefix,
> crt0_buildtype, crt0_sysroot, crt0_gen)
> > + endif
> > +
> > + specs_data =3D configuration_data()
> > diff --git
> a/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cross
> > new file mode 100644
> > index 0000000000..87bfbad3c5
> > --- /dev/null
> > +++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cros=
s
> > @@ -0,0 +1,6 @@
> > +# We need to explicitly bypass mesons sanity check to avoid early
> compiler errors
> > +# otherwise meson will try to compile AND run test applications:
> > +# ../git/meson.build:35:0: ERROR: Executables created by c compiler ar=
e
> not runnable...
> > +
> > +[properties]
> > +skip_sanity_check=3Dtrue
> > \ No newline at end of file
> > diff --git a/meta/recipes-core/picolibc/picolibc_git.bb
> b/meta/recipes-core/picolibc/picolibc_git.bb
> > new file mode 100644
> > index 0000000000..a17abbc534
> > --- /dev/null
> > +++ b/meta/recipes-core/picolibc/picolibc_git.bb
> > @@ -0,0 +1,35 @@
> > +require picolibc.inc
> > +
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
> > +
> > +PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl"
> > +
> > +COMPATIBLE_HOST:libc-musl:class-target =3D "null"
> > +COMPATIBLE_HOST:libc-glibc:class-target =3D "null"
> > +COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> > +
> > +SRC_URI:append =3D " file://avoid_polluting_cross_directories.patch"
> > +SRC_URI:append =3D " file://no-early-compiler-checks.cross"
> > +
> > +# This is being added by picolibc meson files as well to avoid
> > +# early compiler tests from failing, cant remember why I added it
> > +# to the newlib recipe but I would assume it was for the same reason
> > +TARGET_CC_ARCH:append =3D " -nostdlib"
> > +
> > +# When using RISCV64 use medany for both C library and application
> recipes
> > +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> > +
> > +inherit meson
> > +
> > +MESON_CROSS_FILE:append =3D "
> --cross-file=3D${WORKDIR}/no-early-compiler-checks.cross"
> > +
> > +PACKAGECONFIG ??=3D " specsdir"
> > +# Install GCC specs on libdir
> > +PACKAGECONFIG[specsdir] =3D "-Dspecsdir=3D${libdir},-Dspecsdir=3Dnone"
> > +
> > +
> > +FILES:${PN}-dev:append =3D " ${libdir}/*.specs ${libdir}/*.ld"
> > +
> > +# No rpm package is actually created but -dev depends on it, avoid dnf
> error
> > +DEV_PKG_DEPENDENCY:libc-picolibc =3D ""
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> b/meta/recipes-devtools/gcc/gcc-cross.inc
> > index a540fb2434..e492dea1b8 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -34,6 +34,7 @@ EXTRA_OECONF +=3D "\
> >  EXTRA_OECONF:append:libc-baremetal =3D " --without-headers"
> >  EXTRA_OECONF:remove:libc-baremetal =3D "--enable-threads=3Dposix"
> >  EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=3Dposix"
> > +EXTRA_OECONF:remove:libc-picolibc =3D "--enable-threads=3Dposix"
> >
> >  EXTRA_OECONF_PATHS =3D "\
> >      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV=
} \
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index dbc9141000..7885eb40dd 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D "\
> >  EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
> >  EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
> >  EXTRA_OECONF:append:libc-newlib =3D " --with-newlib --with-target-subd=
ir"
> > +EXTRA_OECONF:append:libc-picolibc =3D " --with-newlib
> --with-target-subdir"
> >  EXTRA_OECONF:append:libc-baremetal =3D " --with-target-subdir"
> >
> >  # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> > @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D ""
> >
> >  # Newlib does not support symbol versioning on libsdtcc++
> >  SYMVERS_CONF:libc-newlib =3D ""
> > +SYMVERS_CONF:libc-picolibc =3D ""
> >
> >  # Building with thumb enabled on armv6t fails
> >  ARM_INSTRUCTION_SET:armv6 =3D "arm"
> > @@ -47,6 +49,7 @@ RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v3 libg=
omp
> libatomic ${RUNTIMELIBITM
> >  "
> >  # Only build libstdc++ for newlib
> >  RUNTIMETARGET:libc-newlib =3D "libstdc++-v3"
> > +RUNTIMETARGET:libc-picolibc =3D "libstdc++-v3"
> >
> >  # libiberty
> >  # libgfortran needs separate recipe due to libquadmath dependency
> > diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
> b/meta/recipes-devtools/gcc/libgcc-common.inc
> > index d9084af51a..e3db17d700 100644
> > --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> > +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> > @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {
> >               rmdir ${D}${base_libdir}
> >       fi
> >  }
> > +do_install:append:libc-picolibc () {
> > +     if [ "${base_libdir}" !=3D "${libdir}" ]; then
> > +             rmdir ${D}${base_libdir}
> > +     fi
> > +}
> >
> >  # No rpm package is actually created but -dev depends on it, avoid dnf
> error
> >  DEV_PKG_DEPENDENCY:libc-baremetal =3D ""
> > --
> > 2.45.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199768):
> https://lists.openembedded.org/g/openembedded-core/message/199768
> > Mute This Topic: https://lists.openembedded.org/mt/106250650/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000086a363061977a5ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, May 26, 2024, 2:06=E2=80=AFPM Alexandre Bellon=
i &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bo=
otlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Please always resend the whole series, I&#39;m not cherry-pickin=
g patches<br>
once they have been dropped.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Done</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejan=
dro=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 22/05/2024 14:33:06-0600, Alejandro Hernandez Samaniego wrote:<br>
&gt; Enables usage of TCLIBC=3Dpicolibc extending OE functionality to build=
 and use<br>
&gt; picolibc based toolchains to build baremetal applications.<br>
&gt; <br>
&gt; Picolibc is a set of standard C libraries, both libc and libm, designe=
d for<br>
&gt; smaller embedded systems with limited ROM and RAM. Picolibc includes c=
ode<br>
&gt; from Newlib and AVR Libc, but adresses some of newlibs concerns, it re=
tains<br>
&gt; newlibs directory structure, math, string and locale implementations, =
but<br>
&gt; removed the GPL bits used to build the library, swiches old C style co=
de for<br>
&gt; C18 and replaces autotools with meson.<br>
&gt; <br>
&gt; This patch adds a picolibc recipe for the C library, a picolibc-hellow=
orld<br>
&gt; recipe that contains an example application and a testcase that builds=
 it.<br>
&gt; <br>
&gt; Picolibc can be built for ARM and RISCV architectures, its been tested=
 both<br>
&gt; for 32 and 64 bits, the provided example recipe produces the following=
 output:<br>
&gt; <br>
&gt; hello, world<br>
&gt; <br>
&gt; Runqemu does not automatically show any output since it hides QEMU std=
err which<br>
&gt; is where the QEMU monitors output is directed to when using semihostin=
g, but,<br>
&gt; manually running the same QEMU command does work properly.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/baremetal-image.bbclass=C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +-<br>
&gt;=C2=A0 meta/classes-recipe/cross-canadian.bbclass=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 meta/conf/distro/include/tclibc-picolibc.inc=C2=A0 |=C2=A0 40 ++=
++++<br>
&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/include/riscv/arch-riscv.inc |=C2=A0 =C2=A01 +<=
br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/distrodata.py=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/picolibc.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 18 +++<br>
&gt;=C2=A0 .../picolibc/<a href=3D"http://picolibc-helloworld_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">picolibc-helloworld_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++++++<br>
&gt;=C2=A0 meta/recipes-core/picolibc/picolibc.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 21 ++++<br>
&gt;=C2=A0 .../avoid_polluting_cross_directories.patch=C2=A0 =C2=A0| 119 ++=
++++++++++++++++<br>
&gt;=C2=A0 .../picolibc/no-early-compiler-checks.cross=C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +<br>
&gt;=C2=A0 meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">picolibc_git.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 35 ++++++<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-cross.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/libgcc-common.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +<br>
&gt;=C2=A0 16 files changed, 296 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/conf/distro/include/tclibc-picolibc.inc<=
br>
&gt;=C2=A0 create mode 100644 meta/lib/oeqa/selftest/cases/picolibc.py<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/picolibc/<a href=3D"http://=
picolibc-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>picolibc-helloworld_git.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/picolibc/picolibc.inc<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/picolibc/picolibc/avoid_pol=
luting_cross_directories.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/picolibc/picolibc/no-early-=
compiler-checks.cross<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/picolibc/<a href=3D"http://=
picolibc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc_g=
it.bb</a><br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classe=
s-recipe/baremetal-image.bbclass<br>
&gt; index 4e7d413626..27f2d2d10a 100644<br>
&gt; --- a/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; +++ b/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; @@ -16,8 +16,8 @@<br>
&gt;=C2=A0 # See meta-skeleton for a working example.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -# Toolchain should be baremetal or newlib based.<br>
&gt; -# TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib&quot;<br>
&gt; +# Toolchain should be baremetal or newlib/picolibc based.<br>
&gt; +# TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib&quot; or TC=
LIBC=3D&quot;picolibc&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:libc-musl:class-target =3D &quot;null&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:libc-glibc:class-target =3D &quot;null&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes=
-recipe/cross-canadian.bbclass<br>
&gt; index 1670217d69..059d9aa95f 100644<br>
&gt; --- a/meta/classes-recipe/cross-canadian.bbclass<br>
&gt; +++ b/meta/classes-recipe/cross-canadian.bbclass<br>
&gt; @@ -36,7 +36,7 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;MODIFYTOS&quot;) !=3D &quot;1&qu=
ot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if d.getVar(&quot;TCLIBC&quot;) in [ &#39;baremetal&#39=
;, &#39;newlib&#39; ]:<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&quot;TCLIBC&quot;) in [ &#39;baremetal&#39=
;, &#39;newlib&#39;, &#39;picolibc&#39; ]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 tos =3D d.getVar(&quot;TARGET_OS&quot;)<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 014cf32e40..bb75d147fe 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -579,6 +579,8 @@ RECIPE_MAINTAINER:pn-pcmanfm =3D &quot;Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-perf =3D &quot;Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">b=
ruce.ashfield@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-perl =3D &quot;Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">al=
ex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-perlcross =3D &quot;Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferre=
r">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-picolibc =3D &quot;Alejandro Hernandez &lt;<a hr=
ef=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">al=
ejandro@enedino.org</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-picolibc-helloworld =3D &quot;Alejandro Hernande=
z &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"nor=
eferrer">alejandro@enedino.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-piglit =3D &quot;Ross Burton &lt;<a href=3D=
"mailto:ross.burton@arm.com" target=3D"_blank" rel=3D"noreferrer">ross.burt=
on@arm.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-pigz =3D &quot;Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">hongxu.=
jia@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-pinentry =3D &quot;Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank" rel=3D"noreferrer=
">unassigned@yoctoproject.org</a>&gt;&quot;<br>
&gt; diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/=
distro/include/tclibc-picolibc.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..203765dfcb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/conf/distro/include/tclibc-picolibc.inc<br>
&gt; @@ -0,0 +1,40 @@<br>
&gt; +#<br>
&gt; +# Picolibc configuration<br>
&gt; +#<br>
&gt; +<br>
&gt; +LIBCEXTENSION =3D &quot;-picolibc&quot;<br>
&gt; +LIBCOVERRIDE =3D &quot;:libc-picolibc&quot;<br>
&gt; +<br>
&gt; +PREFERRED_PROVIDER_virtual/libc ?=3D &quot;picolibc&quot;<br>
&gt; +PREFERRED_PROVIDER_virtual/libiconv ?=3D &quot;picolibc&quot;<br>
&gt; +PREFERRED_PROVIDER_virtual/libintl ?=3D &quot;picolibc&quot;<br>
&gt; +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-gli=
bc&quot;<br>
&gt; +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-gl=
ibc&quot;<br>
&gt; +<br>
&gt; +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&quot;<br>
&gt; +<br>
&gt; +IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt; +<br>
&gt; +LIBC_DEPENDENCIES =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 picolibc-dbg \<br>
&gt; +=C2=A0 =C2=A0 picolibc-dev \<br>
&gt; +=C2=A0 =C2=A0 libgcc-dev \<br>
&gt; +=C2=A0 =C2=A0 libgcc-dbg \<br>
&gt; +=C2=A0 =C2=A0 libstdc++-dev=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 libstdc++-staticdev \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +ASSUME_PROVIDED +=3D &quot;virtual/crypt&quot;<br>
&gt; +<br>
&gt; +TARGET_OS =3D &quot;elf&quot;<br>
&gt; +TARGET_OS:arm =3D &quot;eabi&quot;<br>
&gt; +<br>
&gt; +TOOLCHAIN_HOST_TASK ?=3D &quot;packagegroup-cross-canadian-${MACHINE}=
 nativesdk-qemu nativesdk-sdk-provides-dummy&quot;<br>
&gt; +TOOLCHAIN_TARGET_TASK ?=3D &quot;${LIBC_DEPENDENCIES}&quot;<br>
&gt; +TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D &quot;zlib ncurses&quot;<b=
r>
&gt; +<br>
&gt; +# RISCV linker doesnt support PIE<br>
&gt; +SECURITY_CFLAGS:libc-picolibc:qemuriscv32 =3D &quot;${SECURITY_NOPIE_=
CFLAGS}&quot;<br>
&gt; +SECURITY_CFLAGS:libc-picolibc:qemuriscv64 =3D &quot;${SECURITY_NOPIE_=
CFLAGS}&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.co=
nf<br>
&gt; index b0591881ba..ad89142934 100644<br>
&gt; --- a/meta/conf/documentation.conf<br>
&gt; +++ b/meta/conf/documentation.conf<br>
&gt; @@ -421,7 +421,7 @@ TARGET_FPU[doc] =3D &quot;Specifies the method for=
 handling FPU code. For FPU-less targ<br>
&gt;=C2=A0 TARGET_OS[doc] =3D &quot;Specifies the target&#39;s operating sy=
stem.&quot;<br>
&gt;=C2=A0 TARGET_PREFIX[doc] =3D &quot;The prefix for the cross-compile to=
olchain (e.g. arm-linux-).&quot;<br>
&gt;=C2=A0 TARGET_SYS[doc] =3D &quot;The target system is comprised of TARG=
ET_ARCH,TARGET_VENDOR and TARGET_OS.&quot;<br>
&gt; -TCLIBC[doc] =3D &quot;Specifies C library (libc) variant to use durin=
g the build process. You can select &#39;baremetal&#39;, &#39;glibc&#39;, &=
#39;musl&#39; or &#39;newlib&#39;.&quot;<br>
&gt; +TCLIBC[doc] =3D &quot;Specifies C library (libc) variant to use durin=
g the build process. You can select &#39;baremetal&#39;, &#39;glibc&#39;, &=
#39;musl&#39;, &#39;newlib&#39;, or &#39;picolibc&#39;.&quot;<br>
&gt;=C2=A0 TCMODE[doc] =3D &quot;Enables an external toolchain (where provi=
ded by an additional layer) if set to a value other than &#39;default&#39;.=
&quot;<br>
&gt;=C2=A0 TESTIMAGE_AUTO[doc] =3D &quot;Enables test booting of virtual ma=
chine images under the QEMU emulator after any root filesystems are created=
 and runs tests against those images each time an image is built.&quot;<br>
&gt;=C2=A0 TEST_QEMUBOOT_TIMEOUT[doc] =3D &quot;The time in seconds allowed=
 for an image to boot before automated runtime tests begin to run against a=
n image.&quot;<br>
&gt; diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/con=
f/machine/include/riscv/arch-riscv.inc<br>
&gt; index 230a266563..b34064e78f 100644<br>
&gt; --- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
&gt; +++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
&gt; @@ -11,5 +11,6 @@ TUNE_CCARGS:append =3D &quot;${@bb.utils.contains(&#=
39;TUNE_FEATURES&#39;, &#39;riscv64nc&#39;, &#39; -marc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Fix: ld: unrecognized option &#39;--hash-style=3Dsysv&#39;<br>
&gt;=C2=A0 LINKER_HASH_STYLE:libc-newlib =3D &quot;&quot;<br>
&gt; +LINKER_HASH_STYLE:libc-picolibc =3D &quot;&quot;<br>
&gt;=C2=A0 # Fix: ld: unrecognized option &#39;--hash-style=3Dgnu&#39;<br>
&gt;=C2=A0 LINKER_HASH_STYLE:libc-baremetal =3D &quot;&quot;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeq=
a/selftest/cases/distrodata.py<br>
&gt; index ad952c004b..043953757f 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/distrodata.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/distrodata.py<br>
&gt; @@ -55,7 +55,7 @@ but their recipes claim otherwise by setting UPSTREA=
M_VERSION_UNKNOWN. Please re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def is_maintainer_exception(entry):<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exceptions =3D [&quot;musl&=
quot;, &quot;newlib&quot;, &quot;linux-yocto&quot;, &quot;linux-dummy&quot;=
, &quot;mesa-gl&quot;, &quot;libgfortran&quot;, &quot;libx11-compose-data&q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exceptions =3D [&quot;musl&=
quot;, &quot;newlib&quot;, &quot;picolibc&quot;, &quot;linux-yocto&quot;, &=
quot;linux-dummy&quot;, &quot;mesa-gl&quot;, &quot;libgfortran&quot;, &quot=
;libx11-compose-data&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cve-update-nvd2-native&quot;,]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in exceptions:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 i in entry:<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/picolibc.py b/meta/lib/oeqa/=
selftest/cases/picolibc.py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e40b4fc3d3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/picolibc.py<br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +from oeqa.selftest.case import OESelftestTestCase<br>
&gt; +from oeqa.utils.commands import bitbake, get_bb_var<br>
&gt; +<br>
&gt; +class PicolibcTest(OESelftestTestCase):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def test_picolibc(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible_machines =3D [&#39;qemuarm&#39=
;, &#39;qemuarm64&#39;, &#39;qemuriscv32&#39;, &#39;qemuriscv64&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D get_bb_var(&#39;MACHINE&#39;)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if machine not in compatible_machines:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;This tes=
t only works with machines : %s&#39; % &#39; &#39;.join(compatible_machines=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;TCLIBC =3D &quot;p=
icolibc&quot;&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;picolibc-helloworld&quot;)<=
br>
&gt; diff --git a/meta/recipes-core/picolibc/<a href=3D"http://picolibc-hel=
loworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc-he=
lloworld_git.bb</a> b/meta/recipes-core/picolibc/<a href=3D"http://picolibc=
-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolib=
c-helloworld_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..573a571c24<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/picolibc/<a href=3D"http://picolibc-helloworld=
_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc-helloworl=
d_git.bb</a><br>
&gt; @@ -0,0 +1,40 @@<br>
&gt; +require picolibc.inc<br>
&gt; +<br>
&gt; +# baremetal-image overrides<br>
&gt; +BAREMETAL_BINNAME ?=3D &quot;hello_picolibc_${MACHINE}&quot;<br>
&gt; +IMAGE_LINK_NAME ?=3D &quot;baremetal-picolibc-image-${MACHINE}&quot;<=
br>
&gt; +IMAGE_NAME_SUFFIX ?=3D &quot;&quot;<br>
&gt; +QB_DEFAULT_KERNEL ?=3D &quot;${IMAGE_LINK_NAME}.elf&quot;<br>
&gt; +<br>
&gt; +inherit baremetal-image<br>
&gt; +<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemuriscv32|qemuriscv6=
4&quot;<br>
&gt; +<br>
&gt; +# Use semihosting to test via QEMU<br>
&gt; +QB_OPT_APPEND:append =3D &quot; -semihosting-config enable=3Don&quot;=
<br>
&gt; +<br>
&gt; +# picolibc comes with a set of linker scripts, set the file<br>
&gt; +# according to the architecture being built.<br>
&gt; +PICOLIBC_LINKERSCRIPT:qemuarm64 =3D &quot;aarch64.ld&quot;<br>
&gt; +PICOLIBC_LINKERSCRIPT:qemuarm =3D &quot;arm.ld&quot;<br>
&gt; +PICOLIBC_LINKERSCRIPT:qemuriscv32 =3D &quot;riscv.ld&quot;<br>
&gt; +PICOLIBC_LINKERSCRIPT:qemuriscv64 =3D &quot;riscv.ld&quot;<br>
&gt; +<br>
&gt; +# Simple compile function that manually exemplifies usage; as noted,<=
br>
&gt; +# use a custom linker script, the GCC specs provided by picolibc<br>
&gt; +# and semihost to be able to test via QEMU&#39;s monitor<br>
&gt; +do_compile(){<br>
&gt; +=C2=A0 =C2=A0 ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${S}/hello-world=
/${PICOLIBC_LINKERSCRIPT} -specs=3Dpicolibc.specs --oslib=3Dsemihost -o ${B=
AREMETAL_BINNAME}.elf ${S}/hello-world/hello-world.c<br>
&gt; +=C2=A0 =C2=A0 ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMET=
AL_BINNAME}.bin<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install(){<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}/${base_libdir}/firmware<br>
&gt; +=C2=A0 =C2=A0 install -m 755 ${B}/${BAREMETAL_BINNAME}.elf ${D}/${bas=
e_libdir}/firmware/${BAREMETAL_BINNAME}.elf<br>
&gt; +=C2=A0 =C2=A0 install -m 755 ${B}/${BAREMETAL_BINNAME}.bin ${D}/${bas=
e_libdir}/firmware/${BAREMETAL_BINNAME}.bin<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \<br>
&gt; +=C2=A0 =C2=A0 ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \<br>
&gt; +&quot;<br>
&gt; diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-co=
re/picolibc/picolibc.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3b380fe7af<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/picolibc/picolibc.inc<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +SUMMARY =3D &quot;C Libraries for Smaller Embedded Systems&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://keithp.com/picolibc" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://keithp.com/picolibc</a>&quot;=
<br>
&gt; +DESCRIPTION =3D &quot;Picolibc is a set of standard C libraries, both=
 libc and libm, designed for smaller embedded systems with limited ROM and =
RAM. Picolibc includes code from Newlib and AVR Libc.&quot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +<br>
&gt; +# Newlib based code but GPL related bits removed, test/printf-tests.c=
 and test/testcases.c<br>
&gt; +# are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of=
 the artifacts.<br>
&gt; +LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.GPL2;m=
d5=3D59530bdf33659b29e73d4adb9f9f6552 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.NEWLIB=
;md5=3D08ae03456feb75b81cfdb359e0f1ef85 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.picoli=
bc;md5=3De50fa9458a40929689861ed472d46bc7 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +BASEVER =3D &quot;1.8.6&quot;<br>
&gt; +PV =3D &quot;${BASEVER}+git&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/picolibc/picolib=
c.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/picolibc/picolibc.git;protocol=3Dhttps;branch=3Dmain=
</a>&quot;<br>
&gt; +SRCREV=3D&quot;764ef4e401a8f4c6a86ab723533841f072885a5b&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross=
_directories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cr=
oss_directories.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..da6460c95c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_direct=
ories.patch<br>
&gt; @@ -0,0 +1,119 @@<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Picolibc uses its own specs file: picolibc.specs to facilitate compil=
ation, this<br>
&gt; +needs to be passed down to GCC via the -specs argument.<br>
&gt; +<br>
&gt; +Using this specs file overrides some of the default options our toolc=
hain was<br>
&gt; +built with, in this case, they modify the include_dir and lib_dir pat=
hs used for<br>
&gt; +compilation, their intention was to add support for -picolibc-prefix =
and<br>
&gt; +-picolibc-buildtype arguments via the C preprocessor.<br>
&gt; +<br>
&gt; +-isystem %{-picolibc-prefix=3D*:%*/include/; -picolibc-buildtype=3D*:=
/usr/include/%*; :/usr/include} %(picolibc_cpp)<br>
&gt; +<br>
&gt; +This had the unwanted effect of defaulting to /usr/include for includ=
e_dir if<br>
&gt; +those arguments are not being passed, this works fine for their flow =
but for us<br>
&gt; +it pollutes the include directories with paths from the host. The sam=
e effect is<br>
&gt; +applicable for lib_dir and for the c runtime file.<br>
&gt; +<br>
&gt; +Our toolchain relies on --sysroot to avoid using any paths from the h=
ost, here we<br>
&gt; +manually add support for a third possible argument: -sysroot , if thi=
s is passed<br>
&gt; +then the paths used by the compiler will be relative to the path pass=
ed by the<br>
&gt; +--sysroot=3D cmdline argument, setting back the behavior that we inte=
nded in the<br>
&gt; +first place.<br>
&gt; +<br>
&gt; +<br>
&gt; +Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"m=
ailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro=
@enedino.org</a>&gt;<br>
&gt; +<br>
&gt; +Index: git/meson.build<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/meson.build<br>
&gt; ++++ git/meson.build<br>
&gt; +@@ -622,12 +622,13 @@ else<br>
&gt; + #<br>
&gt; + picolibc_prefix_format =3D &#39;-picolibc-prefix=3D*:@0@&#39;<br>
&gt; + picolibc_buildtype_format =3D &#39;-picolibc-buildtype=3D*:@0@&#39;<=
br>
&gt; ++sysroot_format =3D &#39;-sysroot=3D*:@0@&#39;<br>
&gt; + gen_format =3D &#39;@0@&#39;<br>
&gt; + <br>
&gt; + #<br>
&gt; + # How to glue the three options together<br>
&gt; + #<br>
&gt; +-specs_option_format =3D &#39;%{@0@; @1@; :@2@}&#39;<br>
&gt; ++specs_option_format =3D &#39;%{@0@; @1@; @2@; :@3@}&#39;<br>
&gt; + <br>
&gt; + #<br>
&gt; + # Build the -isystem value<br>
&gt; +@@ -639,10 +640,13 @@ isystem_prefix =3D picolibc_prefix_format.<br>
&gt; + buildtype_include_dir =3D specs_prefix_format.format(get_option(&#39=
;includedir&#39;) / &#39;%*&#39;)<br>
&gt; + isystem_buildtype =3D picolibc_buildtype_format.format(buildtype_inc=
lude_dir)<br>
&gt; + <br>
&gt; ++sysroot_include_dir =3D &#39;%*&#39;<br>
&gt; ++isystem_sysroot =3D sysroot_format.format(sysroot_include_dir)<br>
&gt; ++<br>
&gt; + gen_include_dir =3D specs_prefix_format.format(get_option(&#39;inclu=
dedir&#39;))<br>
&gt; + isystem_gen =3D gen_format.format(gen_include_dir)<br>
&gt; + <br>
&gt; +-specs_isystem =3D &#39;-isystem &#39; + specs_option_format.format(i=
system_prefix, isystem_buildtype, isystem_gen)<br>
&gt; ++specs_isystem =3D &#39;-isystem &#39; + specs_option_format.format(i=
system_prefix, isystem_buildtype, isystem_sysroot, isystem_gen)<br>
&gt; + <br>
&gt; + #<br>
&gt; + # Build the non-multilib -L value<br>
&gt; +@@ -654,10 +658,13 @@ lib_prefix =3D picolibc_prefix_format.form<br>
&gt; + buildtype_lib_dir =3D specs_prefix_format.format(get_option(&#39;lib=
dir&#39;) / &#39;%*&#39;)<br>
&gt; + lib_buildtype =3D picolibc_buildtype_format.format(buildtype_lib_dir=
)<br>
&gt; + <br>
&gt; ++sysroot_lib_dir =3D &#39;%*&#39;<br>
&gt; ++lib_sysroot =3D sysroot_format.format(sysroot_lib_dir)<br>
&gt; ++<br>
&gt; + gen_lib_dir =3D specs_prefix_format.format(get_option(&#39;libdir&#3=
9;))<br>
&gt; + lib_gen =3D gen_format.format(gen_lib_dir)<br>
&gt; + <br>
&gt; +-specs_libpath =3D &#39;-L&#39; + specs_option_format.format(lib_pref=
ix, lib_buildtype, lib_gen)<br>
&gt; ++specs_libpath =3D &#39;-L&#39; + specs_option_format.format(lib_pref=
ix, lib_buildtype, lib_sysroot, lib_gen)<br>
&gt; + <br>
&gt; + #<br>
&gt; + # Build the non-multilib *startfile options<br>
&gt; +@@ -669,6 +676,9 @@ crt0_prefix =3D picolibc_prefix_format.for<br>
&gt; + buildtype_crt0_path =3D specs_prefix_format.format(get_option(&#39;l=
ibdir&#39;) / &#39;%*&#39; / crt0_expr)<br>
&gt; + crt0_buildtype =3D picolibc_buildtype_format.format(buildtype_crt0_p=
ath)<br>
&gt; + <br>
&gt; ++sysroot_crt0_path =3D &#39;%*&#39; + &#39;/&#39; + get_option(&#39;l=
ibdir&#39;) + &#39;/&#39; + &#39;%*&#39; + &#39;/&#39; + crt0_expr<br>
&gt; ++crt0_sysroot =3D picolibc_buildtype_format.format(sysroot_crt0_path)=
<br>
&gt; ++<br>
&gt; + gen_crt0_path =3D specs_prefix_format.format(get_option(&#39;libdir&=
#39;) / crt0_expr)<br>
&gt; + crt0_gen =3D gen_format.format(gen_crt0_path)<br>
&gt; + <br>
&gt; +@@ -686,10 +696,13 @@ if enable_multilib<br>
&gt; +=C2=A0 =C2=A0buildtype_multilib_dir =3D specs_prefix_format.format(ge=
t_option(&#39;libdir&#39;) / &#39;%*/%M&#39;)<br>
&gt; +=C2=A0 =C2=A0multilib_buildtype =3D picolibc_buildtype_format.format(=
buildtype_multilib_dir)<br>
&gt; + <br>
&gt; ++=C2=A0 sysroot_multilib_dir =3D &#39;%*&#39; + &#39;/&#39; + get_opt=
ion(&#39;libdir&#39;) + &#39;/&#39; + &#39;%*/%M&#39;<br>
&gt; ++=C2=A0 multilib_sysroot =3D sysroot_format.format(sysroot_multilib_d=
ir)<br>
&gt; ++=C2=A0 <br>
&gt; +=C2=A0 =C2=A0gen_multilib_dir =3D specs_prefix_format.format(get_opti=
on(&#39;libdir&#39;) / &#39;%M&#39;)<br>
&gt; +=C2=A0 =C2=A0multilib_gen =3D gen_format.format(gen_multilib_dir)<br>
&gt; + <br>
&gt; +-=C2=A0 specs_multilibpath =3D &#39;-L&#39; + specs_option_format.for=
mat(multilib_prefix, multilib_buildtype, multilib_gen)<br>
&gt; ++=C2=A0 specs_multilibpath =3D &#39;-L&#39; + specs_option_format.for=
mat(multilib_prefix, multilib_buildtype, multilib_sysroot, multilib_gen)<br=
>
&gt; + <br>
&gt; +=C2=A0 =C2=A0#<br>
&gt; +=C2=A0 =C2=A0# Prepend the multilib -L option to the non-multilib opt=
ion<br>
&gt; +@@ -705,6 +718,9 @@ if enable_multilib<br>
&gt; +=C2=A0 =C2=A0buildtype_multilib_crt0_path =3D specs_prefix_format.for=
mat(get_option(&#39;libdir&#39;) / &#39;%*/%M&#39; / crt0_expr)<br>
&gt; +=C2=A0 =C2=A0crt0_buildtype =3D picolibc_buildtype_format.format(buil=
dtype_multilib_crt0_path)<br>
&gt; + <br>
&gt; ++=C2=A0 sysroot_multilib_crt0_path =3D &#39;%*&#39; + prefix + &#39;/=
&#39; + get_option(&#39;libdir&#39;) + &#39;/&#39; + &#39;/%M&#39; + &#39;/=
&#39; + crt0_expr<br>
&gt; ++=C2=A0 crt0_sysroot =3D sysroot_format.format(sysroot_multilib_crt0_=
path)<br>
&gt; ++=C2=A0 <br>
&gt; +=C2=A0 =C2=A0gen_multilib_crt0_path =3D specs_prefix_format.format(ge=
t_option(&#39;libdir&#39;) / &#39;%M&#39; / crt0_expr)<br>
&gt; +=C2=A0 =C2=A0crt0_gen =3D gen_format.format(gen_multilib_crt0_path)<b=
r>
&gt; + endif<br>
&gt; +@@ -714,7 +730,7 @@ endif<br>
&gt; + # above. As there&#39;s only one value, it&#39;s either the<br>
&gt; + # multilib path or the non-multilib path<br>
&gt; + #<br>
&gt; +-specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_bui=
ldtype, crt0_gen)<br>
&gt; ++specs_startfile =3D specs_option_format.format(crt0_prefix, crt0_bui=
ldtype, crt0_sysroot, crt0_gen)<br>
&gt; + endif<br>
&gt; + <br>
&gt; + specs_data =3D configuration_data()<br>
&gt; diff --git a/meta/recipes-core/picolibc/picolibc/no-early-compiler-che=
cks.cross b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cr=
oss<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..87bfbad3c5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/picolibc/picolibc/no-early-compiler-checks.cro=
ss<br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +# We need to explicitly bypass mesons sanity check to avoid early com=
piler errors<br>
&gt; +# otherwise meson will try to compile AND run test applications:<br>
&gt; +# ../git/meson.build:35:0: ERROR: Executables created by c compiler a=
re not runnable...<br>
&gt; +<br>
&gt; +[properties]<br>
&gt; +skip_sanity_check=3Dtrue<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/meta/recipes-core/picolibc/<a href=3D"http://picolibc_git=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">picolibc_git.bb</a> b/=
meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">picolibc_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a17abbc534<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/picolibc/<a href=3D"http://picolibc_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">picolibc_git.bb</a><br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +require picolibc.inc<br>
&gt; +<br>
&gt; +INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt; +DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc&quot;<br>
&gt; +<br>
&gt; +PROVIDES +=3D &quot;virtual/libc virtual/libiconv virtual/libintl&quo=
t;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST:libc-musl:class-target =3D &quot;null&quot;<br>
&gt; +COMPATIBLE_HOST:libc-glibc:class-target =3D &quot;null&quot;<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemuriscv32|qemuriscv6=
4&quot;<br>
&gt; +<br>
&gt; +SRC_URI:append =3D &quot; file://avoid_polluting_cross_directories.pa=
tch&quot;<br>
&gt; +SRC_URI:append =3D &quot; file://no-early-compiler-checks.cross&quot;=
<br>
&gt; +<br>
&gt; +# This is being added by picolibc meson files as well to avoid<br>
&gt; +# early compiler tests from failing, cant remember why I added it<br>
&gt; +# to the newlib recipe but I would assume it was for the same reason<=
br>
&gt; +TARGET_CC_ARCH:append =3D &quot; -nostdlib&quot;<br>
&gt; +<br>
&gt; +# When using RISCV64 use medany for both C library and application re=
cipes<br>
&gt; +TARGET_CFLAGS:append:qemuriscv64 =3D &quot; -mcmodel=3Dmedany&quot;<b=
r>
&gt; +<br>
&gt; +inherit meson<br>
&gt; +<br>
&gt; +MESON_CROSS_FILE:append =3D &quot; --cross-file=3D${WORKDIR}/no-early=
-compiler-checks.cross&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot; specsdir&quot;<br>
&gt; +# Install GCC specs on libdir<br>
&gt; +PACKAGECONFIG[specsdir] =3D &quot;-Dspecsdir=3D${libdir},-Dspecsdir=
=3Dnone&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +FILES:${PN}-dev:append =3D &quot; ${libdir}/*.specs ${libdir}/*.ld&qu=
ot;<br>
&gt; +<br>
&gt; +# No rpm package is actually created but -dev depends on it, avoid dn=
f error<br>
&gt; +DEV_PKG_DEPENDENCY:libc-picolibc =3D &quot;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-de=
vtools/gcc/gcc-cross.inc<br>
&gt; index a540fb2434..e492dea1b8 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; @@ -34,6 +34,7 @@ EXTRA_OECONF +=3D &quot;\<br>
&gt;=C2=A0 EXTRA_OECONF:append:libc-baremetal =3D &quot; --without-headers&=
quot;<br>
&gt;=C2=A0 EXTRA_OECONF:remove:libc-baremetal =3D &quot;--enable-threads=3D=
posix&quot;<br>
&gt;=C2=A0 EXTRA_OECONF:remove:libc-newlib =3D &quot;--enable-threads=3Dpos=
ix&quot;<br>
&gt; +EXTRA_OECONF:remove:libc-picolibc =3D &quot;--enable-threads=3Dposix&=
quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-gxx-include-dir=3D/not/exist${target_includ=
edir}/c++/${BINV} \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-=
devtools/gcc/gcc-runtime.inc<br>
&gt; index dbc9141000..7885eb40dd 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; @@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt;=C2=A0 EXTRA_OECONF:append:linuxstdbase =3D &quot; --enable-clocale=3Dg=
nu&quot;<br>
&gt;=C2=A0 EXTRA_OECONF:append =3D &quot; --cache-file=3D${B}/config.cache&=
quot;<br>
&gt;=C2=A0 EXTRA_OECONF:append:libc-newlib =3D &quot; --with-newlib --with-=
target-subdir&quot;<br>
&gt; +EXTRA_OECONF:append:libc-picolibc =3D &quot; --with-newlib --with-tar=
get-subdir&quot;<br>
&gt;=C2=A0 EXTRA_OECONF:append:libc-baremetal =3D &quot; --with-target-subd=
ir&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu<br>
&gt; @@ -27,6 +28,7 @@ DISABLE_STATIC:class-nativesdk ?=3D &quot;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Newlib does not support symbol versioning on libsdtcc++<br>
&gt;=C2=A0 SYMVERS_CONF:libc-newlib =3D &quot;&quot;<br>
&gt; +SYMVERS_CONF:libc-picolibc =3D &quot;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Building with thumb enabled on armv6t fails<br>
&gt;=C2=A0 ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
&gt; @@ -47,6 +49,7 @@ RUNTIMETARGET =3D &quot;${RUNTIMELIBSSP} libstdc++-v=
3 libgomp libatomic ${RUNTIMELIBITM<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 # Only build libstdc++ for newlib<br>
&gt;=C2=A0 RUNTIMETARGET:libc-newlib =3D &quot;libstdc++-v3&quot;<br>
&gt; +RUNTIMETARGET:libc-picolibc =3D &quot;libstdc++-v3&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # libiberty<br>
&gt;=C2=A0 # libgfortran needs separate recipe due to libquadmath dependenc=
y<br>
&gt; diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipe=
s-devtools/gcc/libgcc-common.inc<br>
&gt; index d9084af51a..e3db17d700 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/libgcc-common.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/libgcc-common.inc<br>
&gt; @@ -53,6 +53,11 @@ do_install:append:libc-newlib () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${base=
_libdir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt; +do_install:append:libc-picolibc () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;${base_libdir}&quot; !=3D &quot;${libd=
ir}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${base_libd=
ir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # No rpm package is actually created but -dev depends on it, avo=
id dnf error<br>
&gt;=C2=A0 DEV_PKG_DEPENDENCY:libc-baremetal =3D &quot;&quot;<br>
&gt; -- <br>
&gt; 2.45.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#199768): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/199768" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1997=
68</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10625065=
0/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/106250650/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexandre.belloni=
@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div></div></div>

--00000000000086a363061977a5ac--

