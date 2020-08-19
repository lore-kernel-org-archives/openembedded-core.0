Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.83194.1597819220964163197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 23:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z618sJlm;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d27so17045702qtg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qa0R0VDz0G/7Drpn8wok1nuKSjZGbzWwEjG5X1Hkt8s=;
        b=Z618sJlmz19lphBPOdGXi9lBVrcVQXwqbwiseAO2+iDAuh2BNizFQ33jDmRADJMFxK
         7cIXPoaYD+GJjHZ8EI9ict33JpNsigmLn5a2etfKaYhi4C25D1DYFrU5bVu9WDVk9GlY
         h2k9JE+ikyDLsP8QmptVoglY1XQa44LS+kRFdGadI53yGxXa0hjsw3DSmrz82k49zZSi
         jcfpw9lm1Alunz55cxZ9Kjr7gpKYMa8VeqFjJAiAUCXu/K44W/m4sNGBJE5Bg+PLzkJP
         Z48O7oIqoIu/Lmv9kJ0OB3kj8/GvjZZYiGcC6tq8CYN6u8EMuwz6Q9x61Bfuu9kWQ3VS
         DWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qa0R0VDz0G/7Drpn8wok1nuKSjZGbzWwEjG5X1Hkt8s=;
        b=Dqfet16zke7vvgkvKBiDVIo6hrqP2JK7FLOIUoxcxo2IU/eVmQgoKAh7qm2b+yW736
         uM24DHrCnibiZQ8ufeDdvELBBhsehPEylR6sCTnNPtB+zea12rA13GyP4RdRDPUuGQLF
         3kcPGredjgWRlEal5qfuk1YVYKWWEHyZfim8JOEgxvYd12PNu++Y62ijYYerSjZK9nmr
         vKKOKpJMd/7hrU91yETU9DlKOEbNBOPD4yLYqUXHCIPageN4D+VjaihlH9SM/WSps9LN
         HFEIsh41/UTgLTsG12oNA9rmaepqINB3HusOV96CzlVUkD23n2OVmn04PK3cvyrapwZH
         XiHQ==
X-Gm-Message-State: AOAM532+tSSooUTU1J6Y4a/xYtaD1npwt3UY2uFdYTgKMjvLMd+eB8l0
	J+mUI+uviS0gB7z4QJIw5kgipzs9MK8hVwQL+9I=
X-Google-Smtp-Source: ABdhPJxFfruIHn8wOWQpNRQJ/0NUfiIvkZfsIwyLoD0R8jxzBDB84P8PPKXBTgCn27OzKqyElOnH0QAsReMoldbGS6s=
X-Received: by 2002:ac8:7b51:: with SMTP id m17mr20916191qtu.80.1597819217591;
 Tue, 18 Aug 2020 23:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200730075343.2118722-1-raj.khem@gmail.com> <68235453-696a-155f-1fa8-d7b5873f235b@broadcom.com>
 <CAKmqyKOqSodh1_zfyUpzuPx_nLxERbraV2ds5-LTygwKBkWDhA@mail.gmail.com>
In-Reply-To: <CAKmqyKOqSodh1_zfyUpzuPx_nLxERbraV2ds5-LTygwKBkWDhA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 23:39:49 -0700
Message-ID: <CAMKF1so9bQ5_k-hwA9SiSNkL4GvYRse0FBd2P6g57MygGbsHxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.35 release
To: Alistair Francis <alistair23@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Jonathan Richardson <jonathan.richardson@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 10:09 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> On Tue, Aug 18, 2020 at 9:26 PM Scott Branden via
> lists.openembedded.org
> <scott.branden=3Dbroadcom.com@lists.openembedded.org> wrote:>
> > Hi Khem,
> >
> > Has this complete binutils 2.35 change been well tested?
> >
> > This patch causes my system to not work entirely.
> > It appears that modprobe is not working properly on kernel objects.
>
> I had the same problem. For me (I'm guessing you have the same issue)
> it's a kernel bug in the 5.8 kernel.
>
> The patch is in the 5.8 release, but the kernel devs know it's a
> problem. This is the patch that breaks everything for me:
> https://lore.kernel.org/lkml/20200403171303.GK20760@hirez.programming.ki=
cks-ass.net/
>
> Reverting that patch (or downgrading binutils) fixes the problem for
> me. For now I'm just reverting the Linux patch in the meta-pine64
> layer and waiting to see what the kernel devs do.

I think kernel has to check for special sections like .text* in
addition to above patch
reverting kernel patch is right thing to do in interim
>
> Alistair
>
> > Without this patch everything works fine.
> > It would take me some time to debug what in this change breaks things.
> >
> > Also, when you regenerated the patches for this recipe your renamed th=
em which makes them more difficult to diff with a directory compare.
> > But there are new changes in them beyond just being regenerated for 2.=
35?
> >
> > Regards,
> > Scott
> >
> > On 2020-07-30 12:53 a.m., Khem Raj wrote:
> >
> > assembler supports dwarf-5 format line numbers
> > linker has -M -MP gcc-like option
> >
> > for detailed release notes see [1]
> >
> > [1] https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00008.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   |    2 +-
> >  .../{binutils-2.34.inc =3D> binutils-2.35.inc}  |   27 +-
> >  ....34.bb =3D> binutils-cross-canadian_2.35.bb} |    0
> >  ...34.bb =3D> binutils-cross-testsuite_2.35.bb} |    0
> >  ...s-cross_2.34.bb =3D> binutils-cross_2.35.bb} |    0
> >  ...ssdk_2.34.bb =3D> binutils-crosssdk_2.35.bb} |    0
> >  ...s-crosssdk-Generate-relocatable-SDKs.patch |   11 +-
> >  ...o-not-generate-linker-script-directo.patch |   10 +-
> >  ...dk-Search-for-alternative-ld.so.conf.patch |   29 +-
> >  ...iden-the-regexp-for-SH-architectures.patch |   15 +-
> >  ...005-Point-scripts-location-to-libdir.patch |   15 +-
> >  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   14 +-
> >  ...tro-compiler-point-to-the-wrong-ins.patch} |   13 +-
> >  ...system-directories-when-cross-linki.patch} |   72 +-
> >  ...-default-emulation-for-mips64-linux.patch} |   15 +-
> >  ...> 0010-Add-support-for-Netlogic-XLP.patch} |   55 +-
> >  ...ect-assembling-for-ppc-wait-mnemonic.patch |   37 +
> >  ... =3D> 0012-Detect-64-bit-MIPS-targets.patch} |    9 +-
> >  ...l-2.4.patch =3D> 0013-Use-libtool-2.4.patch} | 2529 ++++++++++++++=
+--
> >  ...ect-assembling-for-ppc-wait-mnemonic.patch |   33 -
> >  ...-in-libtool-when-sysroot-is-enabled.patch} |    9 +-
> >  .../0015-sync-with-OE-libtool-changes.patch   |    9 +-
> >  ...or-clang-before-checking-gcc-version.patch |   14 +-
> >  ...SCV_NONE-reloc-in-the-extra-unused-r.patch |   42 +
> >  ...dundant-program_name-definition-fno-.patch |   61 -
> >  .../binutils/binutils/CVE-2020-0551.patch     |  549 ----
> >  .../{binutils_2.34.bb =3D> binutils_2.35.bb}    |    0
> >  27 files changed, 2490 insertions(+), 1080 deletions(-)
> >  rename meta/recipes-devtools/binutils/{binutils-2.34.inc =3D> binutil=
s-2.35.inc} (68%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.34.b=
b =3D> binutils-cross-canadian_2.35.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.34.=
bb =3D> binutils-cross-testsuite_2.35.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross_2.34.bb =3D> bi=
nutils-cross_2.35.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.34.bb =3D>=
 binutils-crosssdk_2.35.bb} (100%)
> >  rename meta/recipes-devtools/binutils/binutils/{0008-don-t-let-the-di=
stro-compiler-point-to-the-wrong-ins.patch =3D> 0007-don-t-let-the-distro-c=
ompiler-point-to-the-wrong-ins.patch} (78%)
> >  rename meta/recipes-devtools/binutils/binutils/{0009-warn-for-uses-of=
-system-directories-when-cross-linki.patch =3D> 0008-warn-for-uses-of-syste=
m-directories-when-cross-linki.patch} (81%)
> >  rename meta/recipes-devtools/binutils/binutils/{0011-Change-default-e=
mulation-for-mips64-linux.patch =3D> 0009-Change-default-emulation-for-mips=
64-linux.patch} (87%)
> >  rename meta/recipes-devtools/binutils/binutils/{0012-Add-support-for-=
Netlogic-XLP.patch =3D> 0010-Add-support-for-Netlogic-XLP.patch} (93%)
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0011-fix-t=
he-incorrect-assembling-for-ppc-wait-mnemonic.patch
> >  rename meta/recipes-devtools/binutils/binutils/{0014-Detect-64-bit-MI=
PS-targets.patch =3D> 0012-Detect-64-bit-MIPS-targets.patch} (86%)
> >  rename meta/recipes-devtools/binutils/binutils/{0007-Use-libtool-2.4.=
patch =3D> 0013-Use-libtool-2.4.patch} (90%)
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-fix-t=
he-incorrect-assembling-for-ppc-wait-mnemonic.patch
> >  rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-lib=
tool-when-sysroot-is-enabled.patch =3D> 0014-Fix-rpath-in-libtool-when-sysr=
oot-is-enabled.patch} (89%)
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Do-no=
t-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-binut=
ils-drop-redundant-program_name-definition-fno-.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-0=
551.patch
> >  rename meta/recipes-devtools/binutils/{binutils_2.34.bb =3D> binutils=
_2.35.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc
> > index 79f523ff3d..c5cc4bdcdf 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
> >
> >  GCCVERSION ?=3D "10.%"
> >  SDKGCCVERSION ?=3D "${GCCVERSION}"
> > -BINUVERSION ?=3D "2.34%"
> > +BINUVERSION ?=3D "2.35%"
> >  GDBVERSION ?=3D "9.%"
> >  GLIBCVERSION ?=3D "2.32"
> >  LINUXLIBCVERSION ?=3D "5.4%"
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.35.inc
> > similarity index 68%
> > rename from meta/recipes-devtools/binutils/binutils-2.34.inc
> > rename to meta/recipes-devtools/binutils/binutils-2.35.inc
> > index f65fdb7328..9aa5e7efe3 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.34.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
> > @@ -16,32 +16,31 @@ def binutils_branch_version(d):
> >
> >  # When upgrading to 2.35, please make sure there is no trailing .0, s=
o
> >  # that upstream version check can work correctly.
> > -PV =3D "2.34"
> > -CVE_VERSION =3D "2.34"
> > +PV =3D "2.35"
> > +CVE_VERSION =3D "2.35"
> >  BINUPV =3D "${@binutils_branch_version(d)}"
> >  #BRANCH =3D "binutils-${BINUPV}-branch"
> > -BRANCH ?=3D "binutils-2_34-branch"
> > +BRANCH ?=3D "binutils-2_35-branch"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
> >
> > -SRCREV ?=3D "d4b50999b3b287b5f984ade2f8734aa8c9359440"
> > +SRCREV ?=3D "89a9065674a14a8bd94bb326b27d19a2f3583efb"
> >  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;bran=
ch=3D${BRANCH};protocol=3Dgit"
> >  SRC_URI =3D "\
> >       ${BINUTILS_GIT_URI} \
> >       file://0004-configure-widen-the-regexp-for-SH-architectures.patc=
h \
> >       file://0005-Point-scripts-location-to-libdir.patch \
> >       file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e=
.patch \
> > -     file://0007-Use-libtool-2.4.patch \
> > -     file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins=
.patch \
> > -     file://0009-warn-for-uses-of-system-directories-when-cross-linki=
.patch \
> > -     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> > -     file://0011-Change-default-emulation-for-mips64-linux.patch \
> > -     file://0012-Add-support-for-Netlogic-XLP.patch \
> > -     file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.p=
atch \
> > -     file://0014-Detect-64-bit-MIPS-targets.patch \
> > +     file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins=
.patch \
> > +     file://0008-warn-for-uses-of-system-directories-when-cross-linki=
.patch \
> > +     file://0009-Change-default-emulation-for-mips64-linux.patch \
> > +     file://0010-Add-support-for-Netlogic-XLP.patch \
> > +     file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.p=
atch \
> > +     file://0012-Detect-64-bit-MIPS-targets.patch \
> > +     file://0013-Use-libtool-2.4.patch \
> > +     file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> >       file://0015-sync-with-OE-libtool-changes.patch \
> >       file://0016-Check-for-clang-before-checking-gcc-version.patch \
> > -     file://0017-binutils-drop-redundant-program_name-definition-fno-=
.patch \
> > -     file://CVE-2020-0551.patch \
> > +     file://0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r=
.patch \
> >  "
> >  S  =3D "${WORKDIR}/git"
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.=
34.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.3=
4.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.=
bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2=
.34.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.=
34.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35=
.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.34.bb b/m=
eta/recipes-devtools/binutils/binutils-cross_2.35.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross_2.34.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross_2.35.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.34.bb =
b/meta/recipes-devtools/binutils/binutils-crosssdk_2.35.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.34.bb
> > rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.35.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-cro=
sssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binu=
tils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> > index 14e84215e0..0e62d47616 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-G=
enerate-relocatable-SDKs.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-G=
enerate-relocatable-SDKs.patch
> > @@ -1,7 +1,7 @@
> > -From b05f0be13aadf0b26a0b39dfe7daf2c47a300338 Mon Sep 17 00:00:00 200=
1
> > +From b8d182865081d17549fb9a4b9bc3062b526caf65 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:58:54 +0000
> > -Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> > +Subject: [PATCH 01/17] binutils-crosssdk: Generate relocatable SDKs
> >
> >  This patch will modify the ELF linker scripts so that the crosssdk
> >  linker will generate binaries with a 4096 bytes PT_INTERP section. Wh=
en the binaries
> > @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 5 insertions(+), 2 deletions(-)
> >
> >  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> > -index 03392d265c..435689ea14 100755
> > +index 03392d265c7..435689ea144 100755
> >  --- a/ld/genscripts.sh
> >  +++ b/ld/genscripts.sh
> >  @@ -304,6 +304,7 @@ DATA_ALIGNMENT_u=3D"${DATA_ALIGNMENT_u-${DATA_ALI=
GNMENT_r}}"
> > @@ -43,7 +43,7 @@ index 03392d265c..435689ea14 100755
> >   DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}
> >   RELOCATING=3D" "
> >  diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> > -index 0b8b32a440..ee6b71075d 100644
> > +index 0b8b32a4407..ee6b71075d7 100644
> >  --- a/ld/scripttempl/elf.sc
> >  +++ b/ld/scripttempl/elf.sc
> >  @@ -140,8 +140,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> > @@ -57,3 +57,6 @@ index 0b8b32a440..ee6b71075d 100644
> >   fi
> >   if test -z "$PLT"; then
> >     IPLT=3D".iplt         ${RELOCATING-0} : { *(.iplt) }"
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cro=
ss-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binu=
tils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.pat=
ch
> > index 91de94b768..41dff05b25 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-n=
ot-generate-linker-script-directo.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-n=
ot-generate-linker-script-directo.patch
> > @@ -1,7 +1,8 @@
> > -From 6d79f81336e7cbe727b5a51134f5d314a455379d Mon Sep 17 00:00:00 200=
1
> > +From 0d14f8f333a9b519202246ce779f3e380491826c Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 6 Mar 2017 23:37:05 -0800
> > -Subject: [PATCH] binutils-cross: Do not generate linker script direct=
ories
> > +Subject: [PATCH 02/17] binutils-cross: Do not generate linker script
> > + directories
> >
> >  We don't place target libraries within ${exec_prefix}, we'd always pl=
ace these
> >  within the target sysroot within the standard library directories. Wo=
rse, the
> > @@ -22,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 25 deletions(-)
> >
> >  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> > -index 435689ea14..cff8a1467f 100755
> > +index 435689ea144..cff8a1467f9 100755
> >  --- a/ld/genscripts.sh
> >  +++ b/ld/genscripts.sh
> >  @@ -235,31 +235,6 @@ append_to_lib_path()
> > @@ -57,3 +58,6 @@ index 435689ea14..cff8a1467f 100755
> >   if [ "x${LIB_PATH}" =3D "x" ] && [ "x${USE_LIBPATH}" =3D xyes ] ; th=
en
> >     libs=3D${NATIVE_LIB_DIRS}
> >     if [ "x${NATIVE}" =3D "xyes" ] ; then
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nat=
ivesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binu=
tils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.pat=
ch
> > index 4b4d73d21d..28daf58f74 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-=
Search-for-alternative-ld.so.conf.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-=
Search-for-alternative-ld.so.conf.patch
> > @@ -1,8 +1,8 @@
> > -From d057b215f114f6158b4010ab44a19cae9dcc8386 Mon Sep 17 00:00:00 200=
1
> > +From 3bbec749ec9fe681ade6812c48c541a752fcffd5 Mon Sep 17 00:00:00 200=
1
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Wed, 19 Feb 2020 09:51:16 -0800
> > -Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.con=
f in SDK
> > - installation
> > +Subject: [PATCH 03/17] binutils-nativesdk: Search for alternative ld.=
so.conf
> > + in SDK installation
> >
> >  We need binutils to look at our ld.so.conf file within the SDK to ens=
ure
> >  we search the SDK's libdirs as well as those from the host system.
> > @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   5 files changed, 7 insertions(+), 3 deletions(-)
> >
> >  diff --git a/ld/Makefile.am b/ld/Makefile.am
> > -index 4a9b8404b7..1c132d3ce4 100644
> > +index 02c4fc16395..a5762227f0a 100644
> >  --- a/ld/Makefile.am
> >  +++ b/ld/Makefile.am
> >  @@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@
> > @@ -43,10 +43,10 @@ index 4a9b8404b7..1c132d3ce4 100644
> >   NO_WERROR =3D @NO_WERROR@
> >   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> >  diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index 46d9b14077..e453bc1b33 100644
> > +index 2fe12e14f63..8f0c83ac8d2 100644
> >  --- a/ld/Makefile.in
> >  +++ b/ld/Makefile.in
> > -@@ -555,7 +555,8 @@ ZLIB =3D @zlibdir@ -lz
> > +@@ -548,7 +548,8 @@ ZLIB =3D @zlibdir@ -lz
> >   ZLIBINC =3D @zlibinc@
> >   ELF_CLFAGS =3D -DELF_LIST_OPTIONS=3D@elf_list_options@ \
> >     -DELF_SHLIB_LIST_OPTIONS=3D@elf_shlib_list_options@ \
> > @@ -55,25 +55,25 @@ index 46d9b14077..e453bc1b33 100644
> >  +           -DSYSCONFDIR=3D"\"$(sysconfdir)\""
> >
> >   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> > - @ENABLE_PLUGINS_FALSE@PLUGIN_C =3D
> > +
> >  diff --git a/ld/ldelf.c b/ld/ldelf.c
> > -index 2e27cf48a8..a095d6aac5 100644
> > +index bada3ade2d7..b4784009d7a 100644
> >  --- a/ld/ldelf.c
> >  +++ b/ld/ldelf.c
> > -@@ -907,7 +907,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_nee=
ded_list *l, int force,
> > +@@ -911,7 +911,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_nee=
ded_list *l, int force,
> >
> >         info.path =3D NULL;
> >         info.len =3D info.alloc =3D 0;
> >  -      tmppath =3D concat (ld_sysroot, prefix, "/etc/ld.so.conf",
> > -+      tmppath =3D concat (ld_sysconfdir, "/ld.so.conf",
> > ++      tmppath =3D concat (ld_sysconfdir, "/etc/ld.so.conf",
> >   (const char *) NULL);
> >         if (!ldelf_parse_ld_so_conf (&info, tmppath))
> >   {
> >  diff --git a/ld/ldmain.c b/ld/ldmain.c
> > -index c4af10f4e9..da1ad17763 100644
> > +index 08be9030cb5..f5c5a336320 100644
> >  --- a/ld/ldmain.c
> >  +++ b/ld/ldmain.c
> > -@@ -69,6 +69,7 @@ char *program_name;
> > +@@ -70,6 +70,7 @@ char *program_name;
> >
> >   /* The prefix for system library directories.  */
> >   const char *ld_sysroot;
> > @@ -82,7 +82,7 @@ index c4af10f4e9..da1ad17763 100644
> >   /* The canonical representation of ld_sysroot.  */
> >   char *ld_canon_sysroot;
> >  diff --git a/ld/ldmain.h b/ld/ldmain.h
> > -index 0f05821d1e..54c36a94ce 100644
> > +index ac7db5720d5..1cbe1771912 100644
> >  --- a/ld/ldmain.h
> >  +++ b/ld/ldmain.h
> >  @@ -23,6 +23,7 @@
> > @@ -93,3 +93,6 @@ index 0f05821d1e..54c36a94ce 100644
> >   extern char *ld_canon_sysroot;
> >   extern int ld_canon_sysroot_len;
> >   extern FILE *saved_script_handle;
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0004-configure-wi=
den-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/=
binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
> > index d10a144ed5..2381c7b85e 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the=
-regexp-for-SH-architectures.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the=
-regexp-for-SH-architectures.patch
> > @@ -1,7 +1,7 @@
> > -From f7ad8a44c10f01e03680f093fd7af71c9f5e8606 Mon Sep 17 00:00:00 200=
1
> > +From 361c2c313196c095d12d17cecf0a069107dd629b Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:07:33 +0000
> > -Subject: [PATCH] configure: widen the regexp for SH architectures
> > +Subject: [PATCH 04/17] configure: widen the regexp for SH architectur=
es
> >
> >  gprof needs to know about uclibc
> >
> > @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure b/configure
> > -index 91dc42f6c7..7c1b747e7c 100755
> > +index 54d0339ab9e..6782f8b6ab8 100755
> >  --- a/configure
> >  +++ b/configure
> > -@@ -3915,7 +3915,7 @@ case "${target}" in
> > +@@ -3937,7 +3937,7 @@ case "${target}" in
> >     nvptx*-*-*)
> >       noconfigdirs=3D"$noconfigdirs target-libssp target-libstdc++-v3 =
target-libobjc"
> >       ;;
> > @@ -27,10 +27,10 @@ index 91dc42f6c7..7c1b747e7c 100755
> >         sh*-*-elf)
> >            ;;
> >  diff --git a/configure.ac b/configure.ac
> > -index 4bd869a63a..7187b34dfc 100644
> > +index a910c4fd6ba..55beb1dea46 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1159,7 +1159,7 @@ case "${target}" in
> > +@@ -1178,7 +1178,7 @@ case "${target}" in
> >     nvptx*-*-*)
> >       noconfigdirs=3D"$noconfigdirs target-libssp target-libstdc++-v3 =
target-libobjc"
> >       ;;
> > @@ -39,3 +39,6 @@ index 4bd869a63a..7187b34dfc 100644
> >       case "${target}" in
> >         sh*-*-elf)
> >            ;;
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0005-Point-script=
s-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0005-P=
oint-scripts-location-to-libdir.patch
> > index 3ba0ba63f1..c31a0bc9a6 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-locat=
ion-to-libdir.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-locat=
ion-to-libdir.patch
> > @@ -1,7 +1,7 @@
> > -From 08b088b7dd3d9707ed66948a7271ffb438eeddf5 Mon Sep 17 00:00:00 200=
1
> > +From 39b478b7e52fb1b892a392f3c3750b9023cfabc8 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:09:58 +0000
> > -Subject: [PATCH] Point scripts location to libdir
> > +Subject: [PATCH 05/17] Point scripts location to libdir
> >
> >  Upstream-Status: Inappropriate [debian patch]
> >
> > @@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/ld/Makefile.am b/ld/Makefile.am
> > -index 1c132d3ce4..8d82cf2e16 100644
> > +index a5762227f0a..e1c665898f3 100644
> >  --- a/ld/Makefile.am
> >  +++ b/ld/Makefile.am
> > -@@ -64,7 +64,7 @@ endif
> > +@@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> >   # We put the scripts in the directory $(scriptdir)/ldscripts.
> >   # We can't put the scripts in $(datadir) because the SEARCH_DIR
> >   # directives need to be different for native and cross linkers.
> > @@ -25,10 +25,10 @@ index 1c132d3ce4..8d82cf2e16 100644
> >   EMUL =3D @EMUL@
> >   EMULATION_OFILES =3D @EMULATION_OFILES@
> >  diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index e453bc1b33..2dcd72f809 100644
> > +index 8f0c83ac8d2..acc24ec4130 100644
> >  --- a/ld/Makefile.in
> >  +++ b/ld/Makefile.in
> > -@@ -573,7 +573,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> > +@@ -556,7 +556,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> >   # We put the scripts in the directory $(scriptdir)/ldscripts.
> >   # We can't put the scripts in $(datadir) because the SEARCH_DIR
> >   # directives need to be different for native and cross linkers.
> > @@ -37,3 +37,6 @@ index e453bc1b33..2dcd72f809 100644
> >   BASEDIR =3D $(srcdir)/..
> >   BFDDIR =3D $(BASEDIR)/bfd
> >   INCDIR =3D $(BASEDIR)/include
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0006-Only-generat=
e-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binu=
tils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pat=
ch
> > index d920729204..654b64ff78 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RP=
ATH-entry-if-LD_RUN_PATH-is-not-e.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RP=
ATH-entry-if-LD_RUN_PATH-is-not-e.patch
> > @@ -1,7 +1,8 @@
> > -From 13791636abf518f0db209dc51c29445d80421f2e Mon Sep 17 00:00:00 200=
1
> > +From 59640ddf11104a604ccf7c078a48359d711c2f9c Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:27:17 +0000
> > -Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not e=
mpty
> > +Subject: [PATCH 06/17] Only generate an RPATH entry if LD_RUN_PATH is=
 not
> > + empty
> >
> >  for cases where -rpath isn't specified. debian (#151024)
> >
> > @@ -14,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 4 insertions(+)
> >
> >  diff --git a/ld/ldelf.c b/ld/ldelf.c
> > -index a095d6aac5..a2455a8793 100644
> > +index b4784009d7a..541772f4604 100644
> >  --- a/ld/ldelf.c
> >  +++ b/ld/ldelf.c
> > -@@ -1229,6 +1229,8 @@ ldelf_after_open (int use_libpath, int native, =
int is_linux, int is_freebsd,
> > +@@ -1247,6 +1247,8 @@ ldelf_after_open (int use_libpath, int native, =
int is_linux, int is_freebsd,
> >    && command_line.rpath =3D=3D NULL)
> >   {
> >    path =3D (const char *) getenv ("LD_RUN_PATH");
> > @@ -26,7 +27,7 @@ index a095d6aac5..a2455a8793 100644
> >    if (path
> >        && ldelf_search_needed (path, &n, force,
> >        is_linux, elfsize))
> > -@@ -1573,6 +1575,8 @@ ldelf_before_allocation (char *audit, char *dep=
audit,
> > +@@ -1605,6 +1607,8 @@ ldelf_before_allocation (char *audit, char *dep=
audit,
> >     rpath =3D command_line.rpath;
> >     if (rpath =3D=3D NULL)
> >       rpath =3D (const char *) getenv ("LD_RUN_PATH");
> > @@ -35,3 +36,6 @@ index a095d6aac5..a2455a8793 100644
> >
> >     for (abfd =3D link_info.input_bfds; abfd; abfd =3D abfd->link.next=
)
> >       if (bfd_get_flavour (abfd) =3D=3D bfd_target_elf_flavour)
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-th=
e-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binu=
tils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.pat=
ch
> > similarity index 78%
> > rename from meta/recipes-devtools/binutils/binutils/0008-don-t-let-the=
-distro-compiler-point-to-the-wrong-ins.patch
> > rename to meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-d=
istro-compiler-point-to-the-wrong-ins.patch
> > index b0e94ab1cb..7f8fc9a5c0 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distr=
o-compiler-point-to-the-wrong-ins.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distr=
o-compiler-point-to-the-wrong-ins.patch
> > @@ -1,8 +1,8 @@
> > -From e36a4e05f900bbe6a8d744a93f3a407bc55c96f7 Mon Sep 17 00:00:00 200=
1
> > +From 2b81508b9af76db292cd756432b03035cb8157e0 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:39:01 +0000
> > -Subject: [PATCH] don't let the distro compiler point to the wrong ins=
tallation
> > - location
> > +Subject: [PATCH 07/17] don't let the distro compiler point to the wro=
ng
> > + installation location
> >
> >  Thanks to RP for helping find the source code causing the issue.
> >
> > @@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >  diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> > -index fe738d0db4..27d818f253 100644
> > +index 895f701bcd0..97a53f15bb6 100644
> >  --- a/libiberty/Makefile.in
> >  +++ b/libiberty/Makefile.in
> > -@@ -365,7 +365,8 @@ install-strip: install
> > +@@ -367,7 +367,8 @@ install-strip: install
> >   # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
> >   # default multilib, so we have to take CFLAGS into account as well,
> >   # since it will be passed the multilib flags.
> > @@ -30,3 +30,6 @@ index fe738d0db4..27d818f253 100644
> >   install_to_libdir: all
> >   if test -n "${target_header_dir}"; then \
> >   ${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-use=
s-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binu=
tils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.pat=
ch
> > similarity index 81%
> > rename from meta/recipes-devtools/binutils/binutils/0009-warn-for-uses=
-of-system-directories-when-cross-linki.patch
> > rename to meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-o=
f-system-directories-when-cross-linki.patch
> > index 11a8110d40..2356c6a60f 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-sy=
stem-directories-when-cross-linki.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-sy=
stem-directories-when-cross-linki.patch
> > @@ -1,7 +1,7 @@
> > -From 7b24f81e04c9d00d96de7dbd250beade6d2c6e44 Mon Sep 17 00:00:00 200=
1
> > +From 413075afbdb16e7cc05511682ca9e3c880acb5a7 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 15 Jan 2016 06:31:09 +0000
> > -Subject: [PATCH] warn for uses of system directories when cross linki=
ng
> > +Subject: [PATCH 08/17] warn for uses of system directories when cross=
 linking
> >
> >  2008-07-02  Joseph Myers  <joseph@codesourcery.com>
> >
> > @@ -57,16 +57,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   ld/ld.h         |  8 ++++++++
> >   ld/ld.texi      | 12 ++++++++++++
> >   ld/ldfile.c     | 17 +++++++++++++++++
> > - ld/ldlex.h      |  2 ++
> > + ld/ldlex.h      |  5 +++++
> >   ld/ldmain.c     |  2 ++
> > - ld/lexsup.c     | 15 +++++++++++++++
> > - 9 files changed, 85 insertions(+)
> > + ld/lexsup.c     | 27 +++++++++++++++++++++++++++
> > + 9 files changed, 100 insertions(+)
> >
> >  diff --git a/ld/config.in b/ld/config.in
> > -index d93c9b0830..5da2742bea 100644
> > +index f1712107367..308e0173c16 100644
> >  --- a/ld/config.in
> >  +++ b/ld/config.in
> > -@@ -31,6 +31,9 @@
> > +@@ -40,6 +40,9 @@
> >      language is requested. */
> >   #undef ENABLE_NLS
> >
> > @@ -77,7 +77,7 @@ index d93c9b0830..5da2742bea 100644
> >   #undef EXTRA_SHLIB_EXTENSION
> >
> >  diff --git a/ld/configure b/ld/configure
> > -index 811134a503..f8c17c19ae 100755
> > +index f08ce9969ea..1c872c0db5f 100755
> >  --- a/ld/configure
> >  +++ b/ld/configure
> >  @@ -826,6 +826,7 @@ with_lib_path
> > @@ -88,7 +88,7 @@ index 811134a503..f8c17c19ae 100755
> >   enable_gold
> >   enable_got
> >   enable_compressed_debug_sections
> > -@@ -1491,6 +1492,8 @@ Optional Features:
> > +@@ -1493,6 +1494,8 @@ Optional Features:
> >     --disable-largefile     omit support for large files
> >     --enable-targets        alternative target configurations
> >     --enable-64-bit-bfd     64-bit support (on hosts with narrower wor=
d sizes)
> > @@ -97,7 +97,7 @@ index 811134a503..f8c17c19ae 100755
> >     --enable-gold[=3DARG]     build gold [ARG=3D{default,yes,no}]
> >     --enable-got=3D<type>     GOT handling scheme (target, single, neg=
ative,
> >                             multigot)
> > -@@ -15788,6 +15791,19 @@ fi
> > +@@ -15793,6 +15796,19 @@ fi
> >
> >
> >
> > @@ -118,7 +118,7 @@ index 811134a503..f8c17c19ae 100755
> >   if test "${enable_gold+set}" =3D set; then :
> >     enableval=3D$enable_gold; case "${enableval}" in
> >  diff --git a/ld/configure.ac b/ld/configure.ac
> > -index b5e849d84a..22e022ec03 100644
> > +index 5a4938afdb0..dbbbde74b04 100644
> >  --- a/ld/configure.ac
> >  +++ b/ld/configure.ac
> >  @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
> > @@ -139,7 +139,7 @@ index b5e849d84a..22e022ec03 100644
> >   dnl "install_as_default" is set to false if gold is the default link=
er.
> >   dnl "installed_linker" is the installed BFD linker name.
> >  diff --git a/ld/ld.h b/ld/ld.h
> > -index 71fd781267..5c7843100b 100644
> > +index 1790dc81a66..73f832eb169 100644
> >  --- a/ld/ld.h
> >  +++ b/ld/ld.h
> >  @@ -166,6 +166,14 @@ typedef struct
> > @@ -158,10 +158,10 @@ index 71fd781267..5c7843100b 100644
> >     enum endian_enum endian;
> >
> >  diff --git a/ld/ld.texi b/ld/ld.texi
> > -index eb7bcb9933..3c73d445a0 100644
> > +index 2a93e9456ac..3eeb70607fd 100644
> >  --- a/ld/ld.texi
> >  +++ b/ld/ld.texi
> > -@@ -2551,6 +2551,18 @@ string identifying the original linked file do=
es not change.
> > +@@ -2655,6 +2655,18 @@ string identifying the original linked file do=
es not change.
> >
> >   Passing @code{none} for @var{style} disables the setting from any
> >   @code{--build-id} options earlier on the command line.
> > @@ -181,7 +181,7 @@ index eb7bcb9933..3c73d445a0 100644
> >
> >   @c man end
> >  diff --git a/ld/ldfile.c b/ld/ldfile.c
> > -index 411f7ddf97..17db16c2cc 100644
> > +index e39170b5d94..fadc248a140 100644
> >  --- a/ld/ldfile.c
> >  +++ b/ld/ldfile.c
> >  @@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_b=
oolean cmdline)
> > @@ -209,23 +209,26 @@ index 411f7ddf97..17db16c2cc 100644
> >
> >   /* Try to open a BFD for a lang_input_statement.  */
> >  diff --git a/ld/ldlex.h b/ld/ldlex.h
> > -index 5287f19a7f..55096e4fc9 100644
> > +index 5ea083ebeb3..941dc5f3dc8 100644
> >  --- a/ld/ldlex.h
> >  +++ b/ld/ldlex.h
> > -@@ -150,6 +150,8 @@ enum option_values
> > -   OPTION_FORCE_GROUP_ALLOCATION,
> > -   OPTION_PRINT_MAP_DISCARDED,
> > -   OPTION_NO_PRINT_MAP_DISCARDED,
> > +@@ -155,6 +155,11 @@ enum option_values
> > +   OPTION_NON_CONTIGUOUS_REGIONS,
> > +   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
> > +   OPTION_DEPENDENCY_FILE,
> > ++  OPTION_CTF_VARIABLES,
> > ++  OPTION_NO_CTF_VARIABLES,
> > ++  OPTION_CTF_SHARE_TYPES,
> >  +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> >  +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> >   };
> >
> >   /* The initial parser states.  */
> >  diff --git a/ld/ldmain.c b/ld/ldmain.c
> > -index da1ad17763..12d0b07d8a 100644
> > +index f5c5a336320..516ba0360e2 100644
> >  --- a/ld/ldmain.c
> >  +++ b/ld/ldmain.c
> > -@@ -274,6 +274,8 @@ main (int argc, char **argv)
> > +@@ -322,6 +322,8 @@ main (int argc, char **argv)
> >     command_line.warn_mismatch =3D TRUE;
> >     command_line.warn_search_mismatch =3D TRUE;
> >     command_line.check_section_addresses =3D -1;
> > @@ -235,13 +238,25 @@ index da1ad17763..12d0b07d8a 100644
> >     /* We initialize DEMANGLING based on the environment variable
> >        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle th=
e
> >  diff --git a/ld/lexsup.c b/ld/lexsup.c
> > -index 3d15cc491d..0e8b4f2b7a 100644
> > +index 58c6c078325..879e7bb7658 100644
> >  --- a/ld/lexsup.c
> >  +++ b/ld/lexsup.c
> > -@@ -550,6 +550,14 @@ static const struct ld_option ld_options[] =3D
> > +@@ -572,6 +572,26 @@ static const struct ld_option ld_options[] =3D
> >     { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MA=
P_DISCARDED},
> >       '\0', NULL, N_("Do not show discarded sections in map file outpu=
t"),
> >       TWO_DASHES },
> > ++  { {"ctf-variables", no_argument, NULL, OPTION_CTF_VARIABLES},
> > ++    '\0', NULL, N_("Emit names and types of static variables in CTF"=
),
> > ++    TWO_DASHES },
> > ++  { {"no-ctf-variables", no_argument, NULL, OPTION_NO_CTF_VARIABLES}=
,
> > ++    '\0', NULL, N_("Do not emit names and types of static variables =
in CTF"),
> > ++    TWO_DASHES },
> > ++  { {"ctf-share-types=3D<method>", required_argument, NULL,
> > ++     OPTION_CTF_SHARE_TYPES},
> > ++    '\0', NULL, N_("How to share CTF types between translation units=
.\n"
> > ++   "                                <method> is: share-unconflicted =
(default),\n"
> > ++   "                                             share-duplicated"),
> > ++    TWO_DASHES },
> >  +  { {"no-poison-system-directories", no_argument, NULL,
> >  +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
> >  +    '\0', NULL, N_("Do not warn for -L options using system director=
ies"),
> > @@ -253,7 +268,7 @@ index 3d15cc491d..0e8b4f2b7a 100644
> >   };
> >
> >   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> > -@@ -1603,6 +1611,13 @@ parse_args (unsigned argc, char **argv)
> > +@@ -1632,6 +1652,13 @@ parse_args (unsigned argc, char **argv)
> >
> >   case OPTION_PRINT_MAP_DISCARDED:
> >    config.print_map_discarded =3D TRUE;
> > @@ -265,5 +280,8 @@ index 3d15cc491d..0e8b4f2b7a 100644
> >  + case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> >  +  command_line.error_poison_system_directories =3D TRUE;
> >    break;
> > - }
> > -     }
> > +
> > + case OPTION_DEPENDENCY_FILE:
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-defau=
lt-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binuti=
ls/0009-Change-default-emulation-for-mips64-linux.patch
> > similarity index 87%
> > rename from meta/recipes-devtools/binutils/binutils/0011-Change-defaul=
t-emulation-for-mips64-linux.patch
> > rename to meta/recipes-devtools/binutils/binutils/0009-Change-default-=
emulation-for-mips64-linux.patch
> > index c49b8e863f..fb5276e183 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emul=
ation-for-mips64-linux.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emul=
ation-for-mips64-linux.patch
> > @@ -1,7 +1,7 @@
> > -From 2182791a453f34bee6968b3e72848608cf7d7abe Mon Sep 17 00:00:00 200=
1
> > +From 13a67e9040c01abd284fe506471e0eab668ee3dc Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:44:14 +0000
> > -Subject: [PATCH] Change default emulation for mips64*-*-linux
> > +Subject: [PATCH 09/17] Change default emulation for mips64*-*-linux
> >
> >  we change the default emulations to be N64 instead of N32
> >
> > @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 8 insertions(+), 8 deletions(-)
> >
> >  diff --git a/bfd/config.bfd b/bfd/config.bfd
> > -index b96931f52e..847f9f0ba9 100644
> > +index 14523caf0c5..e5233cd1f7e 100644
> >  --- a/bfd/config.bfd
> >  +++ b/bfd/config.bfd
> > -@@ -911,12 +911,12 @@ case "${targ}" in
> > +@@ -894,12 +894,12 @@ case "${targ}" in
> >       targ_selvecs=3D"mips_elf32_le_vec mips_elf64_be_vec mips_elf64_l=
e_vec mips_ecoff_be_vec mips_ecoff_le_vec"
> >       ;;
> >     mips64*el-*-linux*)
> > @@ -35,10 +35,10 @@ index b96931f52e..847f9f0ba9 100644
> >     mips*el-*-linux*)
> >       targ_defvec=3Dmips_elf32_trad_le_vec
> >  diff --git a/ld/configure.tgt b/ld/configure.tgt
> > -index 23194e357f..f4f0eaf9b2 100644
> > +index 87c7d9a4cad..9b4bf2ca964 100644
> >  --- a/ld/configure.tgt
> >  +++ b/ld/configure.tgt
> > -@@ -541,12 +541,12 @@ mips*-*-vxworks*) targ_emul=3Delf32ebmipvxworks
> > +@@ -531,12 +531,12 @@ mips*-*-vxworks*) targ_emul=3Delf32ebmipvxworks
> >   ;;
> >   mips*-*-windiss) targ_emul=3Delf32mipswindiss
> >   ;;
> > @@ -55,3 +55,6 @@ index 23194e357f..f4f0eaf9b2 100644
> >   targ_extra_libpath=3D$targ_extra_emuls
> >   ;;
> >   mips*el-*-linux-*) targ_emul=3Delf32ltsmip
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-=
for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0010-Add-s=
upport-for-Netlogic-XLP.patch
> > similarity index 93%
> > rename from meta/recipes-devtools/binutils/binutils/0012-Add-support-f=
or-Netlogic-XLP.patch
> > rename to meta/recipes-devtools/binutils/binutils/0010-Add-support-for=
-Netlogic-XLP.patch
> > index c32867a238..277db4ec5c 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Net=
logic-XLP.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Net=
logic-XLP.patch
> > @@ -1,7 +1,7 @@
> > -From a0237ec2d1e58bd35c236df39dd5a06504c6d2ed Mon Sep 17 00:00:00 200=
1
> > +From 69ab45c16f80f18fa78121f6e774750b9e9a200b Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 14 Feb 2016 17:06:19 +0000
> > -Subject: [PATCH] Add support for Netlogic XLP
> > +Subject: [PATCH 10/17] Add support for Netlogic XLP
> >
> >  Patch From: Nebu Philips <nphilips@netlogicmicro.com>
> >
> > @@ -35,10 +35,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.co=
m>
> >   15 files changed, 65 insertions(+), 21 deletions(-)
> >
> >  diff --git a/bfd/aoutx.h b/bfd/aoutx.h
> > -index fa3a9746b6..5078024fd5 100644
> > +index d352a1a3e44..2e2c3c1af86 100644
> >  --- a/bfd/aoutx.h
> >  +++ b/bfd/aoutx.h
> > -@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_architecture =
arch,
> > +@@ -810,6 +810,7 @@ NAME (aout, machine_type) (enum bfd_architecture =
arch,
> >   case bfd_mach_mipsisa64r6:
> >   case bfd_mach_mips_sb1:
> >   case bfd_mach_mips_xlr:
> > @@ -47,7 +47,7 @@ index fa3a9746b6..5078024fd5 100644
> >    arch_flags =3D M_MIPS2;
> >    break;
> >  diff --git a/bfd/archures.c b/bfd/archures.c
> > -index 232103817c..b2b3b8c124 100644
> > +index 551ec8732f0..2665b378623 100644
> >  --- a/bfd/archures.c
> >  +++ b/bfd/archures.c
> >  @@ -185,6 +185,7 @@ DESCRIPTION
> > @@ -59,10 +59,10 @@ index 232103817c..b2b3b8c124 100644
> >   .#define bfd_mach_mipsisa32r2 33
> >   .#define bfd_mach_mipsisa32r3 34
> >  diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> > -index 7c13bc8c91..2e453c50c1 100644
> > +index 35ef4d755bb..48db00af80b 100644
> >  --- a/bfd/bfd-in2.h
> >  +++ b/bfd/bfd-in2.h
> > -@@ -1568,6 +1568,7 @@ enum bfd_architecture
> > +@@ -1585,6 +1585,7 @@ enum bfd_architecture
> >   #define bfd_mach_mips_octeon3          6503
> >   #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  *=
/
> >   #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  *=
/
> > @@ -71,10 +71,10 @@ index 7c13bc8c91..2e453c50c1 100644
> >   #define bfd_mach_mipsisa32r2           33
> >   #define bfd_mach_mipsisa32r3           34
> >  diff --git a/bfd/config.bfd b/bfd/config.bfd
> > -index 847f9f0ba9..a12707f827 100644
> > +index e5233cd1f7e..2e4ae6bbdff 100644
> >  --- a/bfd/config.bfd
> >  +++ b/bfd/config.bfd
> > -@@ -894,6 +894,11 @@ case "${targ}" in
> > +@@ -877,6 +877,11 @@ case "${targ}" in
> >       targ_defvec=3Dmips_elf32_le_vec
> >       targ_selvecs=3D"mips_elf32_be_vec mips_elf64_be_vec mips_elf64_l=
e_vec"
> >       ;;
> > @@ -87,7 +87,7 @@ index 847f9f0ba9..a12707f827 100644
> >       targ_defvec=3Dmips_elf32_be_vec
> >       targ_selvecs=3D"mips_elf32_le_vec mips_elf64_be_vec mips_elf64_l=
e_vec"
> >  diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
> > -index 802acb45f1..fd9ec4c0ad 100644
> > +index 802acb45f1e..fd9ec4c0ad4 100644
> >  --- a/bfd/cpu-mips.c
> >  +++ b/bfd/cpu-mips.c
> >  @@ -108,7 +108,8 @@ enum
> > @@ -111,10 +111,10 @@ index 802acb45f1..fd9ec4c0ad 100644
> >
> >   /* The default architecture is mips:3000, but with a machine number =
of
> >  diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
> > -index d7e3aed3b6..7baeee9ee3 100644
> > +index 160febec94c..4c9499cc2cf 100644
> >  --- a/bfd/elfxx-mips.c
> >  +++ b/bfd/elfxx-mips.c
> > -@@ -6999,6 +6999,9 @@ _bfd_elf_mips_mach (flagword flags)
> > +@@ -6982,6 +6982,9 @@ _bfd_elf_mips_mach (flagword flags)
> >       case E_MIPS_MACH_IAMR2:
> >         return bfd_mach_mips_interaptiv_mr2;
> >
> > @@ -124,7 +124,7 @@ index d7e3aed3b6..7baeee9ee3 100644
> >       default:
> >         switch (flags & EF_MIPS_ARCH)
> >   {
> > -@@ -12355,6 +12358,10 @@ mips_set_isa_flags (bfd *abfd)
> > +@@ -12356,6 +12359,10 @@ mips_set_isa_flags (bfd *abfd)
> >         val =3D E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
> >         break;
> >
> > @@ -135,7 +135,7 @@ index d7e3aed3b6..7baeee9ee3 100644
> >       case bfd_mach_mipsisa32:
> >         val =3D E_MIPS_ARCH_32;
> >         break;
> > -@@ -14379,6 +14386,7 @@ static const struct mips_mach_extension mips_=
mach_extensions[] =3D
> > +@@ -14373,6 +14380,7 @@ static const struct mips_mach_extension mips_=
mach_extensions[] =3D
> >     { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
> >     { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
> >     { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
> > @@ -144,10 +144,10 @@ index d7e3aed3b6..7baeee9ee3 100644
> >     /* MIPS64 extensions.  */
> >     { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
> >  diff --git a/binutils/readelf.c b/binutils/readelf.c
> > -index 6b5bebe743..d15a7828db 100644
> > +index 6057515a89b..ea119b0b254 100644
> >  --- a/binutils/readelf.c
> >  +++ b/binutils/readelf.c
> > -@@ -3440,6 +3440,7 @@ get_machine_flags (Filedata * filedata, unsigne=
d e_flags, unsigned e_machine)
> > +@@ -3483,6 +3483,7 @@ get_machine_flags (Filedata * filedata, unsigne=
d e_flags, unsigned e_machine)
> >      case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
> >      case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
> >      case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
> > @@ -156,7 +156,7 @@ index 6b5bebe743..d15a7828db 100644
> >      /* We simply ignore the field in this case to avoid confusion:
> >         MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
> >  diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
> > -index fc6898834e..2c7151ccdb 100644
> > +index 31acb77d78a..0ead168d51e 100644
> >  --- a/gas/config/tc-mips.c
> >  +++ b/gas/config/tc-mips.c
> >  @@ -568,6 +568,7 @@ static int mips_32bitmode =3D 0;
> > @@ -175,7 +175,7 @@ index fc6898834e..2c7151ccdb 100644
> >      )
> >
> >   /* Whether the processor uses hardware interlocks to protect reads
> > -@@ -20135,7 +20137,7 @@ static const struct mips_cpu_info mips_cpu_in=
fo_table[] =3D
> > +@@ -20174,7 +20176,7 @@ static const struct mips_cpu_info mips_cpu_in=
fo_table[] =3D
> >     /* Broadcom XLP.
> >        XLP is mostly like XLR, with the prominent exception that it is
> >        MIPS64R2 rather than MIPS64.  */
> > @@ -185,7 +185,7 @@ index fc6898834e..2c7151ccdb 100644
> >     /* MIPS 64 Release 6.  */
> >     { "i6400",      0, ASE_VIRT | ASE_MSA, ISA_MIPS64R6, CPU_MIPS64R6}=
,
> >  diff --git a/gas/configure b/gas/configure
> > -index 60c1a055ae..59d6d11215 100755
> > +index 5bccfd9d1b7..d4b13e6fc8b 100755
> >  --- a/gas/configure
> >  +++ b/gas/configure
> >  @@ -12722,6 +12722,9 @@ _ACEOF
> > @@ -199,7 +199,7 @@ index 60c1a055ae..59d6d11215 100755
> >      mips_cpu=3Dr3900
> >      ;;
> >  diff --git a/gas/configure.ac b/gas/configure.ac
> > -index 6f32e55a1a..11c2e0d273 100644
> > +index b65108fecb2..ce1f2dad9bc 100644
> >  --- a/gas/configure.ac
> >  +++ b/gas/configure.ac
> >  @@ -325,6 +325,9 @@ changequote([,])dnl
> > @@ -213,7 +213,7 @@ index 6f32e55a1a..11c2e0d273 100644
> >      mips_cpu=3Dr3900
> >      ;;
> >  diff --git a/include/elf/mips.h b/include/elf/mips.h
> > -index d116b036b6..dceeb3f156 100644
> > +index cc08ebd4318..bb518575ce1 100644
> >  --- a/include/elf/mips.h
> >  +++ b/include/elf/mips.h
> >  @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
> > @@ -225,7 +225,7 @@ index d116b036b6..dceeb3f156 100644
> >   #define E_MIPS_MACH_OCTEON3 0x008e0000
> >   #define E_MIPS_MACH_5400 0x00910000
> >  diff --git a/include/opcode/mips.h b/include/opcode/mips.h
> > -index fd031f3758..a96a44df84 100644
> > +index fd031f37588..a96a44df840 100644
> >  --- a/include/opcode/mips.h
> >  +++ b/include/opcode/mips.h
> >  @@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] =3D =
{
> > @@ -256,10 +256,10 @@ index fd031f3758..a96a44df84 100644
> >         return FALSE;
> >       }
> >  diff --git a/ld/configure.tgt b/ld/configure.tgt
> > -index f4f0eaf9b2..0da3eca19c 100644
> > +index 9b4bf2ca964..f6d7171dff7 100644
> >  --- a/ld/configure.tgt
> >  +++ b/ld/configure.tgt
> > -@@ -520,6 +520,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
> > +@@ -510,6 +510,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
> >   targ_emul=3Delf32btsmip
> >   targ_extra_emuls=3D"elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsm=
ipn32 elf64ltsmip"
> >   ;;
> > @@ -270,7 +270,7 @@ index f4f0eaf9b2..0da3eca19c 100644
> >   targ_extra_emuls=3D"elf32lr5900"
> >   targ_extra_libpath=3D$targ_extra_emuls
> >  diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
> > -index 755bbe294b..ce22ef683a 100644
> > +index 755bbe294bd..ce22ef683a6 100644
> >  --- a/opcodes/mips-dis.c
> >  +++ b/opcodes/mips-dis.c
> >  @@ -674,13 +674,11 @@ const struct mips_arch_choice mips_arch_choices=
[] =3D
> > @@ -293,7 +293,7 @@ index 755bbe294b..ce22ef683a 100644
> >     /* This entry, mips16, is here only for ISA/processor selection; d=
o
> >        not print its name.  */
> >  diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
> > -index 5270aeefa8..d17dc78cd7 100644
> > +index 5270aeefa80..d17dc78cd71 100644
> >  --- a/opcodes/mips-opc.c
> >  +++ b/opcodes/mips-opc.c
> >  @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
> > @@ -404,3 +404,6 @@ index 5270aeefa8..d17dc78cd7 100644
> >   {"swc0", "E,o(b)", 0xe0000000, 0xfc000000, RD_3|RD_C0|SM, 0, I1, 0, =
IOCT|IOCTP|IOCT2|I37 },
> >   {"swc0", "E,A(b)", 0,    (int) M_SWC0_AB, INSN_MACRO, 0, I1, 0, IOCT=
|IOCTP|IOCT2|I37 },
> >   {"swc1", "T,o(b)", 0xe4000000, 0xfc000000, RD_1|RD_3|SM|FP_S, 0, I1,=
 0, 0 },
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-inco=
rrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binuti=
ls/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> > new file mode 100644
> > index 0000000000..10c3d80865
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-a=
ssembling-for-ppc-wait-mnemonic.patch
> > @@ -0,0 +1,37 @@
> > +From 7836f8aa56ef0f18c8658dc7e4952a9d097ba7e8 Mon Sep 17 00:00:00 200=
1
> > +From: Zhenhua Luo <zhenhua.luo@nxp.com>
> > +Date: Sat, 11 Jun 2016 22:08:29 -0500
> > +Subject: [PATCH 11/17] fix the incorrect assembling for ppc wait mnem=
onic
> > +
> > +Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + opcodes/ppc-opc.c | 4 +---
> > + 1 file changed, 1 insertion(+), 3 deletions(-)
> > +
> > +diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> > +index 5e20d617664..4c9656ecf08 100644
> > +--- a/opcodes/ppc-opc.c
> > ++++ b/opcodes/ppc-opc.c
> > +@@ -6265,8 +6265,6 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
> > + {"waitasec", X(31,30),      XRTRARB_MASK, POWER8, POWER9, {0}},
> > + {"waitrsv", XWCPL(31,30,1,0),0xffffffff, POWER10, 0, {0}},
> > + {"pause_short", XWCPL(31,30,2,0),0xffffffff, POWER10, 0, {0}},
> > +-{"wait", X(31,30), XWCPL_MASK,  POWER10, 0, {WC, PL}},
> > +-{"wait", X(31,30), XWC_MASK,    POWER9, POWER10, {WC}},
> > +
> > + {"lwepx", X(31,31), X_MASK,  E500MC|PPCA2, 0, {RT, RA0, RB}},
> > +
> > +@@ -6326,7 +6324,7 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
> > +
> > + {"waitrsv", X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0, {0}},
> > + {"waitimpl", X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0, {0}},
> > +-{"wait", X(31,62), XWC_MASK,    E500MC|PPCA2, 0, {WC}},
> > ++{"wait", X(31,62), XWC_MASK,    E500MC|PPCA2|POWER9|POWER10, 0, {WC}=
},
> > +
> > + {"dcbstep", XRT(31,63,0), XRT_MASK,    E500MC|PPCA2, 0, {RA0, RB}},
> > +
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bi=
t-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0012-Detect-=
64-bit-MIPS-targets.patch
> > similarity index 86%
> > rename from meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit=
-MIPS-targets.patch
> > rename to meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-M=
IPS-targets.patch
> > index 6acde1f781..ef8b253b6a 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-=
targets.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-=
targets.patch
> > @@ -1,7 +1,7 @@
> > -From 2f7f2389764ef1d699f6ad32057314024b7e84e7 Mon Sep 17 00:00:00 200=
1
> > +From dbff6bdf2123f5495b8be930304d9aa5e88006a7 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 31 Mar 2017 11:42:03 -0700
> > -Subject: [PATCH] Detect 64-bit MIPS targets
> > +Subject: [PATCH 12/17] Detect 64-bit MIPS targets
> >
> >  Add mips64 target triplets and default to N64
> >
> > @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 14 insertions(+)
> >
> >  diff --git a/gold/configure.tgt b/gold/configure.tgt
> > -index aa7ec552ae..470515062e 100644
> > +index aa7ec552aec..470515062e4 100644
> >  --- a/gold/configure.tgt
> >  +++ b/gold/configure.tgt
> >  @@ -153,6 +153,13 @@ aarch64*-*)
> > @@ -45,3 +45,6 @@ index aa7ec552ae..470515062e 100644
> >   mips*-*-*)
> >    targ_obj=3Dmips
> >    targ_machine=3DEM_MIPS
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-=
2.4.patch b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.pa=
tch
> > similarity index 90%
> > rename from meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2=
.4.patch
> > rename to meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4=
.patch
> > index 89da62fbf7..987a96f4b7 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.pat=
ch
> > +++ b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.pat=
ch
> > @@ -1,7 +1,7 @@
> > -From b8fafd8ce6c47c9a551ed796176d884a34930086 Mon Sep 17 00:00:00 200=
1
> > +From 7e2ddee8704c9c3b73760dd9464b18fade563d85 Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 14 Feb 2016 17:04:07 +0000
> > -Subject: [PATCH 07/15] Use libtool 2.4
> > +Subject: [PATCH 13/17] Use libtool 2.4
> >
> >  get libtool sysroot support
> >
> > @@ -22,10 +22,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   ltversion.m4       |   12 +-
> >   lt~obsolete.m4     |    2 +-
> >   opcodes/configure  | 1320 +++++++++++++++-----
> > - 13 files changed, 9939 insertions(+), 3700 deletions(-)
> > + zlib/configure     | 1320 +++++++++++++++-----
> > + 14 files changed, 10931 insertions(+), 4028 deletions(-)
> >
> >  diff --git a/bfd/configure b/bfd/configure
> > -index bc576b7894a..cd036638081 100755
> > +index 0340ed541b5..2012656b3b7 100755
> >  --- a/bfd/configure
> >  +++ b/bfd/configure
> >  @@ -704,6 +704,9 @@ OTOOL
> > @@ -1350,7 +1351,7 @@ index bc576b7894a..cd036638081 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -14554,7 +15209,7 @@ SHARED_LDFLAGS=3D
> > +@@ -14578,7 +15233,7 @@ SHARED_LDFLAGS=3D
> >   if test "$enable_shared" =3D "yes"; then
> >     x=3D`sed -n -e 's/^[ ]*PICFLAG[ ]*=3D[ ]*//p' < ../libiberty/Makef=
ile | sed -n '$p'`
> >     if test -n "$x"; then
> > @@ -1359,7 +1360,7 @@ index bc576b7894a..cd036638081 100755
> >     fi
> >
> >     case "${host}" in
> > -@@ -17176,13 +17831,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> > +@@ -17197,13 +17852,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -1380,7 +1381,7 @@ index bc576b7894a..cd036638081 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$dela=
y_single_quote_subst"`'
> > -@@ -17197,14 +17859,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -17218,14 +17880,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol=
_to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_glob=
al_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_=
cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > @@ -1399,7 +1400,7 @@ index bc576b7894a..cd036638081 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -17237,12 +17902,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> > +@@ -17258,12 +17923,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_si=
ngle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote=
_subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single=
_quote_subst"`'
> > @@ -1413,7 +1414,7 @@ index bc576b7894a..cd036638081 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quo=
te_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |=
 $SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_q=
uote_subst"`'
> > -@@ -17297,8 +17962,13 @@ reload_flag \
> > +@@ -17318,8 +17983,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -1427,7 +1428,7 @@ index bc576b7894a..cd036638081 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -17308,12 +17978,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -17329,12 +17999,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -1443,7 +1444,7 @@ index bc576b7894a..cd036638081 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -17329,7 +18001,6 @@ no_undefined_flag \
> > +@@ -17350,7 +18022,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -1451,7 +1452,7 @@ index bc576b7894a..cd036638081 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -17365,6 +18036,7 @@ module_cmds \
> > +@@ -17386,6 +18057,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -1459,7 +1460,7 @@ index bc576b7894a..cd036638081 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -18153,7 +18825,8 @@ $as_echo X"$file" |
> > +@@ -18174,7 +18846,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 20=
05,
> > @@ -1469,7 +1470,7 @@ index bc576b7894a..cd036638081 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -18256,19 +18929,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -18277,19 +18950,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -1513,7 +1514,7 @@ index bc576b7894a..cd036638081 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -18298,6 +18994,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> > +@@ -18319,6 +19015,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefi=
x is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix
> >
> > @@ -1526,7 +1527,7 @@ index bc576b7894a..cd036638081 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -18307,6 +19009,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -18328,6 +19030,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -1536,7 +1537,7 @@ index bc576b7894a..cd036638081 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -18421,12 +19126,12 @@ with_gcc=3D$GCC
> > +@@ -18442,12 +19147,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -1552,7 +1553,7 @@ index bc576b7894a..cd036638081 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -18513,9 +19218,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -18534,9 +19239,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency lib=
raries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -1562,7 +1563,7 @@ index bc576b7894a..cd036638081 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -18531,6 +19233,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -18552,6 +19254,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with t=
emplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -1572,7 +1573,7 @@ index bc576b7894a..cd036638081 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -18563,210 +19268,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -18584,210 +19289,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -1947,10 +1948,10 @@ index bc576b7894a..cd036638081 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/bfd/configure.ac b/bfd/configure.ac
> > -index c5bfbd5d129..e666b1cc106 100644
> > +index 8e86f8399ce..e8700c9d4d2 100644
> >  --- a/bfd/configure.ac
> >  +++ b/bfd/configure.ac
> > -@@ -290,7 +290,7 @@ changequote(,)dnl
> > +@@ -314,7 +314,7 @@ changequote(,)dnl
> >     x=3D`sed -n -e 's/^[ ]*PICFLAG[ ]*=3D[ ]*//p' < ../libiberty/Makef=
ile | sed -n '$p'`
> >   changequote([,])dnl
> >     if test -n "$x"; then
> > @@ -1960,10 +1961,10 @@ index c5bfbd5d129..e666b1cc106 100644
> >
> >     case "${host}" in
> >  diff --git a/binutils/configure b/binutils/configure
> > -index a8dfd4bd68c..82316496953 100755
> > +index 89c99abfeba..d3289a5efcd 100755
> >  --- a/binutils/configure
> >  +++ b/binutils/configure
> > -@@ -690,8 +690,11 @@ OTOOL
> > +@@ -692,8 +692,11 @@ OTOOL
> >   LIPO
> >   NMEDIT
> >   DSYMUTIL
> > @@ -1975,7 +1976,7 @@ index a8dfd4bd68c..82316496953 100755
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -808,6 +811,7 @@ enable_static
> > +@@ -810,6 +813,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> > @@ -1983,7 +1984,7 @@ index a8dfd4bd68c..82316496953 100755
> >   enable_libtool_lock
> >   enable_plugins
> >   enable_largefile
> > -@@ -1485,6 +1489,8 @@ Optional Packages:
> > +@@ -1490,6 +1494,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defau=
lt=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=
=3Dno]
> > @@ -1992,7 +1993,7 @@ index a8dfd4bd68c..82316496953 100755
> >     --with-debuginfod       Enable debuginfo lookups with debuginfod
> >                             (auto/yes/no)
> >     --with-system-zlib      use installed libz
> > -@@ -5461,8 +5467,8 @@ esac
> > +@@ -5467,8 +5473,8 @@ esac
> >
> >
> >
> > @@ -2003,7 +2004,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >
> >
> > -@@ -5502,7 +5508,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -5508,7 +5514,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strin=
gs" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -2012,7 +2013,7 @@ index a8dfd4bd68c..82316496953 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6188,8 +6194,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> > +@@ -6194,8 +6200,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -2023,7 +2024,7 @@ index a8dfd4bd68c..82316496953 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6238,6 +6244,80 @@ esac
> > +@@ -6244,6 +6250,80 @@ esac
> >
> >
> >
> > @@ -2104,7 +2105,7 @@ index a8dfd4bd68c..82316496953 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to =
reload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6;=
 }
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6254,6 +6334,11 @@ case $reload_flag in
> > +@@ -6260,6 +6340,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -2116,7 +2117,7 @@ index a8dfd4bd68c..82316496953 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$re=
load_objs'
> > -@@ -6422,7 +6507,8 @@ mingw* | pw32*)
> > +@@ -6428,7 +6513,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x8=
6 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -2126,7 +2127,7 @@ index a8dfd4bd68c..82316496953 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -6576,6 +6662,21 @@ esac
> > +@@ -6582,6 +6668,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_chec=
k_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -2148,7 +2149,7 @@ index a8dfd4bd68c..82316496953 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6591,9 +6692,162 @@ test -z "$deplibs_check_method" && deplibs_ch=
eck_method=3Dunknown
> > +@@ -6597,9 +6698,162 @@ test -z "$deplibs_check_method" && deplibs_ch=
eck_method=3Dunknown
> >
> >
> >
> > @@ -2313,7 +2314,7 @@ index a8dfd4bd68c..82316496953 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6609,7 +6863,7 @@ do
> > +@@ -6615,7 +6869,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -2322,7 +2323,7 @@ index a8dfd4bd68c..82316496953 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6629,11 +6883,15 @@ $as_echo "no" >&6; }
> > +@@ -6635,11 +6889,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -2341,7 +2342,7 @@ index a8dfd4bd68c..82316496953 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6649,7 +6907,7 @@ do
> > +@@ -6655,7 +6913,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -2350,7 +2351,7 @@ index a8dfd4bd68c..82316496953 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6668,6 +6926,10 @@ else
> > +@@ -6674,6 +6932,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -2361,7 +2362,7 @@ index a8dfd4bd68c..82316496953 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -6679,12 +6941,10 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6685,12 +6947,10 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -2376,7 +2377,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >
> >
> > -@@ -6696,6 +6956,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > +@@ -6702,6 +6962,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> >
> >
> >
> > @@ -2441,7 +2442,7 @@ index a8dfd4bd68c..82316496953 100755
> >   if test -n "$ac_tool_prefix"; then
> >     # Extract the first word of "${ac_tool_prefix}strip", so it can be=
 a program name with args.
> >   set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> > -@@ -7030,8 +7348,8 @@ esac
> > +@@ -7036,8 +7354,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/exter=
n int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol add=
ress
> > @@ -2452,7 +2453,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7067,6 +7385,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7073,6 +7391,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[ ]\($symcode$sy=
mcode*\)[ ][ ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -2460,7 +2461,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7108,6 +7427,18 @@ _LT_EOF
> > +@@ -7114,6 +7433,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >   if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >    cat <<_LT_EOF > conftest.$ac_ext
> > @@ -2479,7 +2480,7 @@ index a8dfd4bd68c..82316496953 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7119,7 +7450,7 @@ _LT_EOF
> > +@@ -7125,7 +7456,7 @@ _LT_EOF
> >    cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -2488,7 +2489,7 @@ index a8dfd4bd68c..82316496953 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7145,8 +7476,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7151,8 +7482,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >    # Now try linking the two files.
> >    mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -2499,7 +2500,7 @@ index a8dfd4bd68c..82316496953 100755
> >    LIBS=3D"conftstm.$ac_objext"
> >    CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >    if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; =
} >&5
> > -@@ -7156,8 +7487,8 @@ _LT_EOF
> > +@@ -7162,8 +7493,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >      pipe_works=3Dyes
> >    fi
> > @@ -2510,7 +2511,7 @@ index a8dfd4bd68c..82316496953 100755
> >   else
> >    echo "cannot find nm_test_func in $nlist" >&5
> >   fi
> > -@@ -7194,6 +7525,21 @@ else
> > +@@ -7200,6 +7531,21 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -2532,7 +2533,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >
> >
> > -@@ -7210,6 +7556,40 @@ fi
> > +@@ -7216,6 +7562,40 @@ fi
> >
> >
> >
> > @@ -2573,7 +2574,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >
> >
> > -@@ -7421,6 +7801,123 @@ esac
> > +@@ -7427,6 +7807,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -2697,7 +2698,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -7984,6 +8481,8 @@ _LT_EOF
> > +@@ -7990,6 +8487,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -2706,7 +2707,7 @@ index a8dfd4bd68c..82316496953 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8179,7 +8678,8 @@ fi
> > +@@ -8185,7 +8684,8 @@ fi
> >   LIBTOOL_DEPS=3D"$ltmain"
> >
> >   # Always use our own libtool.
> > @@ -2716,7 +2717,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >
> >
> > -@@ -8268,7 +8768,7 @@ aix3*)
> > +@@ -8274,7 +8774,7 @@ aix3*)
> >   esac
> >
> >   # Global variables:
> > @@ -2725,7 +2726,7 @@ index a8dfd4bd68c..82316496953 100755
> >   can_build_shared=3Dyes
> >
> >   # All known linkers require a `.a' archive for static linking (excep=
t MSVC,
> > -@@ -8566,8 +9066,6 @@ fi
> > +@@ -8572,8 +9072,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -2734,7 +2735,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8733,6 +9231,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > +@@ -8739,6 +9237,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> >   lt_prog_compiler_pic=3D'--shared'
> >   lt_prog_compiler_static=3D'--static'
> >   ;;
> > @@ -2747,7 +2748,7 @@ index a8dfd4bd68c..82316496953 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >   # which looks to be a dead project)
> > -@@ -8795,7 +9299,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -8801,7 +9305,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -2756,7 +2757,7 @@ index a8dfd4bd68c..82316496953 100755
> >   lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >   lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8852,13 +9356,17 @@ case $host_os in
> > +@@ -8858,13 +9362,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -2780,7 +2781,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -8919,6 +9427,11 @@ fi
> > +@@ -8925,6 +9433,11 @@ fi
> >
> >
> >
> > @@ -2792,7 +2793,7 @@ index a8dfd4bd68c..82316496953 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9269,7 +9782,8 @@ _LT_EOF
> > +@@ -9275,7 +9788,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -2802,7 +2803,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-im=
plib -Xlinker $lib'
> > -@@ -9368,12 +9882,12 @@ _LT_EOF
> > +@@ -9374,12 +9888,12 @@ _LT_EOF
> >    whole_archive_flag_spec=3D'--whole-archive$convenience --no-whole-a=
rchive'
> >    hardcode_libdir_flag_spec=3D
> >    hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -2817,7 +2818,7 @@ index a8dfd4bd68c..82316496953 100755
> >    fi
> >    ;;
> >   esac
> > -@@ -9387,8 +9901,8 @@ _LT_EOF
> > +@@ -9393,8 +9907,8 @@ _LT_EOF
> >   archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -o $=
lib'
> >   wlarc=3D
> >         else
> > @@ -2828,7 +2829,7 @@ index a8dfd4bd68c..82316496953 100755
> >         fi
> >         ;;
> >
> > -@@ -9406,8 +9920,8 @@ _LT_EOF
> > +@@ -9412,8 +9926,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /d=
ev/null; then
> > @@ -2839,7 +2840,7 @@ index a8dfd4bd68c..82316496953 100755
> >         else
> >   ld_shlibs=3Dno
> >         fi
> > -@@ -9453,8 +9967,8 @@ _LT_EOF
> > +@@ -9459,8 +9973,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev=
/null; then
> > @@ -2850,7 +2851,7 @@ index a8dfd4bd68c..82316496953 100755
> >         else
> >   ld_shlibs=3Dno
> >         fi
> > -@@ -9584,7 +10098,13 @@ _LT_EOF
> > +@@ -9590,7 +10104,13 @@ _LT_EOF
> >   allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -2865,7 +2866,7 @@ index a8dfd4bd68c..82316496953 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9597,22 +10117,29 @@ main ()
> > +@@ -9603,22 +10123,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -2908,7 +2909,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_l=
ibpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobj=
s $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_unde=
fined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; e=
lse :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9624,7 +10151,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9630,7 +10157,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >   else
> >   # Determine the default libpath from the value encoded in an
> >   # empty executable.
> > @@ -2923,7 +2924,7 @@ index a8dfd4bd68c..82316496953 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9637,22 +10170,29 @@ main ()
> > +@@ -9643,22 +10176,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -2966,7 +2967,7 @@ index a8dfd4bd68c..82316496953 100755
> >
> >   hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
> >    # Warning - without using the other run time loading flags,
> > -@@ -9697,20 +10237,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9703,20 +10243,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there =
is
> >         # no search path for DLLs.
> > @@ -3044,7 +3045,7 @@ index a8dfd4bd68c..82316496953 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -9771,7 +10354,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9777,7 +10360,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -3053,7 +3054,7 @@ index a8dfd4bd68c..82316496953 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -9779,7 +10362,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9785,7 +10368,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -3062,7 +3063,7 @@ index a8dfd4bd68c..82316496953 100755
> >         else
> >   archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_libdir=
 -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_obj=
dir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -9795,7 +10378,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9801,7 +10384,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -3071,7 +3072,7 @@ index a8dfd4bd68c..82316496953 100755
> >         else
> >   archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $libobj=
s $deplibs $linker_flags'
> >         fi
> > -@@ -9819,10 +10402,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9825,10 +10408,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >    archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $=
deplibs $compiler_flags'
> >    ;;
> >   ia64*)
> > @@ -3084,7 +3085,7 @@ index a8dfd4bd68c..82316496953 100755
> >    ;;
> >   esac
> >         else
> > -@@ -9901,23 +10484,36 @@ fi
> > +@@ -9907,23 +10490,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -3129,7 +3130,7 @@ index a8dfd4bd68c..82316496953 100755
> >         else
> >   archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -sonam=
e $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"`=
 -update_registry ${output_objdir}/so_locations -o $lib'
> >   archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -soname $soname `test -n "$verstring" && func_echo_all "-set_version $vers=
tring"` -update_registry ${output_objdir}/so_locations -exports_file $expor=
t_symbols -o $lib'
> > -@@ -10002,7 +10598,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10008,7 +10604,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*) # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >   allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -3138,7 +3139,7 @@ index a8dfd4bd68c..82316496953 100755
> >   hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >   allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10021,9 +10617,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10027,9 +10623,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >   wlarc=3D'${wl}'
> > @@ -3150,7 +3151,7 @@ index a8dfd4bd68c..82316496953 100755
> >         else
> >   case `$CC -V 2>&1` in
> >   *"Compilers 5.0"*)
> > -@@ -10599,8 +11195,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10605,8 +11201,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -3162,7 +3163,7 @@ index a8dfd4bd68c..82316496953 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10633,13 +11230,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10639,13 +11236,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``=
echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -3235,7 +3236,7 @@ index a8dfd4bd68c..82316496953 100755
> >     # FIXME: first we should search . and the directory the executable=
 is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -10731,7 +11386,7 @@ haiku*)
> > +@@ -10737,7 +11392,7 @@ haiku*)
> >     soname_spec=3D'${libname}${release}${shared_ext}$major'
> >     shlibpath_var=3DLIBRARY_PATH
> >     shlibpath_overrides_runpath=3Dyes
> > @@ -3244,16 +3245,16 @@ index a8dfd4bd68c..82316496953 100755
> >     hardcode_into_libs=3Dyes
> >     ;;
> >
> > -@@ -11527,7 +12182,7 @@ else
> > +@@ -11533,7 +12188,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11530 "configure"
> > +-#line 11536 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11571,10 +12226,10 @@ else
> > +@@ -11577,10 +12232,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -3266,16 +3267,16 @@ index a8dfd4bd68c..82316496953 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11633,7 +12288,7 @@ else
> > +@@ -11639,7 +12294,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11636 "configure"
> > +-#line 11642 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11677,10 +12332,10 @@ else
> > +@@ -11683,10 +12338,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -3288,7 +3289,7 @@ index a8dfd4bd68c..82316496953 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -16024,13 +16679,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> > +@@ -16076,13 +16731,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -3309,7 +3310,7 @@ index a8dfd4bd68c..82316496953 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$dela=
y_single_quote_subst"`'
> > -@@ -16045,14 +16707,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -16097,14 +16759,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol=
_to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_glob=
al_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_=
cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > @@ -3328,7 +3329,7 @@ index a8dfd4bd68c..82316496953 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -16085,12 +16750,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> > +@@ -16137,12 +16802,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_si=
ngle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote=
_subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single=
_quote_subst"`'
> > @@ -3342,7 +3343,7 @@ index a8dfd4bd68c..82316496953 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quo=
te_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |=
 $SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_q=
uote_subst"`'
> > -@@ -16145,8 +16810,13 @@ reload_flag \
> > +@@ -16197,8 +16862,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -3356,7 +3357,7 @@ index a8dfd4bd68c..82316496953 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -16156,12 +16826,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -16208,12 +16878,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -3372,7 +3373,7 @@ index a8dfd4bd68c..82316496953 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -16177,7 +16849,6 @@ no_undefined_flag \
> > +@@ -16229,7 +16901,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -3380,7 +3381,7 @@ index a8dfd4bd68c..82316496953 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -16213,6 +16884,7 @@ module_cmds \
> > +@@ -16265,6 +16936,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -3388,7 +3389,7 @@ index a8dfd4bd68c..82316496953 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -16979,7 +17651,8 @@ $as_echo X"$file" |
> > +@@ -17031,7 +17703,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 20=
05,
> > @@ -3398,7 +3399,7 @@ index a8dfd4bd68c..82316496953 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -17082,19 +17755,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -17134,19 +17807,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -3442,7 +3443,7 @@ index a8dfd4bd68c..82316496953 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -17124,6 +17820,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> > +@@ -17176,6 +17872,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefi=
x is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix
> >
> > @@ -3455,7 +3456,7 @@ index a8dfd4bd68c..82316496953 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -17133,6 +17835,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -17185,6 +17887,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -3465,7 +3466,7 @@ index a8dfd4bd68c..82316496953 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -17247,12 +17952,12 @@ with_gcc=3D$GCC
> > +@@ -17299,12 +18004,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -3481,7 +3482,7 @@ index a8dfd4bd68c..82316496953 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -17339,9 +18044,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -17391,9 +18096,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency lib=
raries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -3491,7 +3492,7 @@ index a8dfd4bd68c..82316496953 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -17357,6 +18059,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -17409,6 +18111,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with t=
emplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -3501,7 +3502,7 @@ index a8dfd4bd68c..82316496953 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -17389,210 +18094,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -17441,210 +18146,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -3876,7 +3877,7 @@ index a8dfd4bd68c..82316496953 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/gas/configure b/gas/configure
> > -index 60c1a055ae2..0e0ce4c0e23 100755
> > +index d4b13e6fc8b..dd5224c5c81 100755
> >  --- a/gas/configure
> >  +++ b/gas/configure
> >  @@ -681,8 +681,11 @@ OTOOL
> > @@ -5204,7 +5205,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -15928,13 +16583,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> > +@@ -15981,13 +16636,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -5225,7 +5226,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$dela=
y_single_quote_subst"`'
> > -@@ -15949,14 +16611,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -16002,14 +16664,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol=
_to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_glob=
al_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_=
cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > @@ -5244,7 +5245,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -15989,12 +16654,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> > +@@ -16042,12 +16707,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_si=
ngle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote=
_subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single=
_quote_subst"`'
> > @@ -5258,7 +5259,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quo=
te_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |=
 $SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_q=
uote_subst"`'
> > -@@ -16049,8 +16714,13 @@ reload_flag \
> > +@@ -16102,8 +16767,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -5272,7 +5273,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -16060,12 +16730,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -16113,12 +16783,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -5288,7 +5289,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -16081,7 +16753,6 @@ no_undefined_flag \
> > +@@ -16134,7 +16806,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -5296,7 +5297,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -16117,6 +16788,7 @@ module_cmds \
> > +@@ -16170,6 +16841,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -5304,7 +5305,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -16890,7 +17562,8 @@ $as_echo X"$file" |
> > +@@ -16943,7 +17615,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 20=
05,
> > @@ -5314,7 +5315,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -16993,19 +17666,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -17046,19 +17719,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -5358,7 +5359,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -17035,6 +17731,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> > +@@ -17088,6 +17784,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefi=
x is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix
> >
> > @@ -5371,7 +5372,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -17044,6 +17746,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -17097,6 +17799,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -5381,7 +5382,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -17158,12 +17863,12 @@ with_gcc=3D$GCC
> > +@@ -17211,12 +17916,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -5397,7 +5398,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -17250,9 +17955,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -17303,9 +18008,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency lib=
raries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -5407,7 +5408,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -17268,6 +17970,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -17321,6 +18023,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with t=
emplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -5417,7 +5418,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -17300,210 +18005,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -17353,210 +18058,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -5792,7 +5793,7 @@ index 60c1a055ae2..0e0ce4c0e23 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/gprof/configure b/gprof/configure
> > -index c23692e5c3d..9f936a5b03d 100755
> > +index 3cf41b79116..e5d57f52912 100755
> >  --- a/gprof/configure
> >  +++ b/gprof/configure
> >  @@ -662,8 +662,11 @@ OTOOL
> > @@ -7707,7 +7708,7 @@ index c23692e5c3d..9f936a5b03d 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/ld/configure b/ld/configure
> > -index 811134a503b..f432f4637d0 100755
> > +index 1c872c0db5f..fe938e6c99f 100755
> >  --- a/ld/configure
> >  +++ b/ld/configure
> >  @@ -691,8 +691,11 @@ OTOOL
> > @@ -7730,7 +7731,7 @@ index 811134a503b..f432f4637d0 100755
> >   enable_libtool_lock
> >   enable_plugins
> >   enable_largefile
> > -@@ -1512,6 +1516,8 @@ Optional Packages:
> > +@@ -1520,6 +1524,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defau=
lt=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=
=3Dno]
> > @@ -7739,7 +7740,7 @@ index 811134a503b..f432f4637d0 100755
> >     --with-lib-path=3Ddir1:dir2...  set default LIB_PATH
> >     --with-sysroot=3DDIR Search for usr/lib et al within DIR.
> >     --with-system-zlib      use installed libz
> > -@@ -5965,8 +5971,8 @@ esac
> > +@@ -5973,8 +5979,8 @@ esac
> >
> >
> >
> > @@ -7750,7 +7751,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >
> > -@@ -6006,7 +6012,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -6014,7 +6020,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strin=
gs" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -7759,7 +7760,7 @@ index 811134a503b..f432f4637d0 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6692,8 +6698,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> > +@@ -6700,8 +6706,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -7770,7 +7771,7 @@ index 811134a503b..f432f4637d0 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6742,6 +6748,80 @@ esac
> > +@@ -6750,6 +6756,80 @@ esac
> >
> >
> >
> > @@ -7851,7 +7852,7 @@ index 811134a503b..f432f4637d0 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to =
reload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6;=
 }
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6758,6 +6838,11 @@ case $reload_flag in
> > +@@ -6766,6 +6846,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -7863,7 +7864,7 @@ index 811134a503b..f432f4637d0 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$re=
load_objs'
> > -@@ -6926,7 +7011,8 @@ mingw* | pw32*)
> > +@@ -6934,7 +7019,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x8=
6 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -7873,7 +7874,7 @@ index 811134a503b..f432f4637d0 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -7080,6 +7166,21 @@ esac
> > +@@ -7088,6 +7174,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_chec=
k_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -7895,7 +7896,7 @@ index 811134a503b..f432f4637d0 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -7095,9 +7196,162 @@ test -z "$deplibs_check_method" && deplibs_ch=
eck_method=3Dunknown
> > +@@ -7103,9 +7204,162 @@ test -z "$deplibs_check_method" && deplibs_ch=
eck_method=3Dunknown
> >
> >
> >
> > @@ -8060,7 +8061,7 @@ index 811134a503b..f432f4637d0 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -7113,7 +7367,7 @@ do
> > +@@ -7121,7 +7375,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -8069,7 +8070,7 @@ index 811134a503b..f432f4637d0 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -7133,11 +7387,15 @@ $as_echo "no" >&6; }
> > +@@ -7141,11 +7395,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -8088,7 +8089,7 @@ index 811134a503b..f432f4637d0 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -7153,7 +7411,7 @@ do
> > +@@ -7161,7 +7419,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -8097,7 +8098,7 @@ index 811134a503b..f432f4637d0 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -7172,6 +7430,10 @@ else
> > +@@ -7180,6 +7438,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -8108,7 +8109,7 @@ index 811134a503b..f432f4637d0 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -7183,12 +7445,12 @@ ac_tool_warned=3Dyes ;;
> > +@@ -7191,12 +7453,12 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -8125,7 +8126,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >
> > -@@ -7198,6 +7460,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > +@@ -7206,6 +7468,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> >
> >
> >
> > @@ -8188,7 +8189,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >   if test -n "$ac_tool_prefix"; then
> > -@@ -7534,8 +7852,8 @@ esac
> > +@@ -7542,8 +7860,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/exter=
n int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol add=
ress
> > @@ -8199,7 +8200,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7571,6 +7889,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7579,6 +7897,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[ ]\($symcode$sy=
mcode*\)[ ][ ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -8207,7 +8208,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7612,6 +7931,18 @@ _LT_EOF
> > +@@ -7620,6 +7939,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >   if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >    cat <<_LT_EOF > conftest.$ac_ext
> > @@ -8226,7 +8227,7 @@ index 811134a503b..f432f4637d0 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7623,7 +7954,7 @@ _LT_EOF
> > +@@ -7631,7 +7962,7 @@ _LT_EOF
> >    cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -8235,7 +8236,7 @@ index 811134a503b..f432f4637d0 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7649,8 +7980,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7657,8 +7988,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >    # Now try linking the two files.
> >    mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -8246,7 +8247,7 @@ index 811134a503b..f432f4637d0 100755
> >    LIBS=3D"conftstm.$ac_objext"
> >    CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >    if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; =
} >&5
> > -@@ -7660,8 +7991,8 @@ _LT_EOF
> > +@@ -7668,8 +7999,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >      pipe_works=3Dyes
> >    fi
> > @@ -8257,7 +8258,7 @@ index 811134a503b..f432f4637d0 100755
> >   else
> >    echo "cannot find nm_test_func in $nlist" >&5
> >   fi
> > -@@ -7698,6 +8029,19 @@ else
> > +@@ -7706,6 +8037,19 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -8277,7 +8278,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >
> > -@@ -7714,6 +8058,42 @@ fi
> > +@@ -7722,6 +8066,42 @@ fi
> >
> >
> >
> > @@ -8320,7 +8321,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >
> > -@@ -7925,6 +8305,123 @@ esac
> > +@@ -7933,6 +8313,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -8444,7 +8445,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -8488,6 +8985,8 @@ _LT_EOF
> > +@@ -8496,6 +8993,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -8453,7 +8454,7 @@ index 811134a503b..f432f4637d0 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8556,6 +9055,16 @@ done
> > +@@ -8564,6 +9063,16 @@ done
> >
> >
> >
> > @@ -8470,7 +8471,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >   # Set options
> > -@@ -8684,7 +9193,8 @@ fi
> > +@@ -8692,7 +9201,8 @@ fi
> >   LIBTOOL_DEPS=3D"$ltmain"
> >
> >   # Always use our own libtool.
> > @@ -8480,7 +8481,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >
> >
> > -@@ -8773,7 +9283,7 @@ aix3*)
> > +@@ -8781,7 +9291,7 @@ aix3*)
> >   esac
> >
> >   # Global variables:
> > @@ -8489,7 +8490,7 @@ index 811134a503b..f432f4637d0 100755
> >   can_build_shared=3Dyes
> >
> >   # All known linkers require a `.a' archive for static linking (excep=
t MSVC,
> > -@@ -9071,8 +9581,6 @@ fi
> > +@@ -9079,8 +9589,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -8498,7 +8499,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -9238,6 +9746,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > +@@ -9246,6 +9754,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> >   lt_prog_compiler_pic=3D'--shared'
> >   lt_prog_compiler_static=3D'--static'
> >   ;;
> > @@ -8511,7 +8512,7 @@ index 811134a503b..f432f4637d0 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >   # which looks to be a dead project)
> > -@@ -9300,7 +9814,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -9308,7 +9822,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -8520,7 +8521,7 @@ index 811134a503b..f432f4637d0 100755
> >   lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >   lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -9357,13 +9871,17 @@ case $host_os in
> > +@@ -9365,13 +9879,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -8544,7 +8545,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -9424,6 +9942,11 @@ fi
> > +@@ -9432,6 +9950,11 @@ fi
> >
> >
> >
> > @@ -8556,7 +8557,7 @@ index 811134a503b..f432f4637d0 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9774,7 +10297,8 @@ _LT_EOF
> > +@@ -9782,7 +10305,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -8566,7 +8567,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-im=
plib -Xlinker $lib'
> > -@@ -9873,12 +10397,12 @@ _LT_EOF
> > +@@ -9881,12 +10405,12 @@ _LT_EOF
> >    whole_archive_flag_spec=3D'--whole-archive$convenience --no-whole-a=
rchive'
> >    hardcode_libdir_flag_spec=3D
> >    hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -8581,7 +8582,7 @@ index 811134a503b..f432f4637d0 100755
> >    fi
> >    ;;
> >   esac
> > -@@ -9892,8 +10416,8 @@ _LT_EOF
> > +@@ -9900,8 +10424,8 @@ _LT_EOF
> >   archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -o $=
lib'
> >   wlarc=3D
> >         else
> > @@ -8592,7 +8593,7 @@ index 811134a503b..f432f4637d0 100755
> >         fi
> >         ;;
> >
> > -@@ -9911,8 +10435,8 @@ _LT_EOF
> > +@@ -9919,8 +10443,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /d=
ev/null; then
> > @@ -8603,7 +8604,7 @@ index 811134a503b..f432f4637d0 100755
> >         else
> >   ld_shlibs=3Dno
> >         fi
> > -@@ -9958,8 +10482,8 @@ _LT_EOF
> > +@@ -9966,8 +10490,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev=
/null; then
> > @@ -8614,7 +8615,7 @@ index 811134a503b..f432f4637d0 100755
> >         else
> >   ld_shlibs=3Dno
> >         fi
> > -@@ -10089,7 +10613,13 @@ _LT_EOF
> > +@@ -10097,7 +10621,13 @@ _LT_EOF
> >   allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -8629,7 +8630,7 @@ index 811134a503b..f432f4637d0 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10102,22 +10632,29 @@ main ()
> > +@@ -10110,22 +10640,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -8672,7 +8673,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_l=
ibpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobj=
s $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_unde=
fined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; e=
lse :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -10129,7 +10666,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10137,7 +10674,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >   else
> >   # Determine the default libpath from the value encoded in an
> >   # empty executable.
> > @@ -8687,7 +8688,7 @@ index 811134a503b..f432f4637d0 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10142,22 +10685,29 @@ main ()
> > +@@ -10150,22 +10693,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -8730,7 +8731,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >   hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
> >    # Warning - without using the other run time loading flags,
> > -@@ -10201,21 +10751,64 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> > +@@ -10209,21 +10759,64 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> >         # When not using gcc, we currently assume that we are using
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there =
is
> > @@ -8810,7 +8811,7 @@ index 811134a503b..f432f4637d0 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -10276,7 +10869,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10284,7 +10877,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -8819,7 +8820,7 @@ index 811134a503b..f432f4637d0 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -10284,7 +10877,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10292,7 +10885,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -8828,7 +8829,7 @@ index 811134a503b..f432f4637d0 100755
> >         else
> >   archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_libdir=
 -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_obj=
dir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -10300,7 +10893,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10308,7 +10901,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -8837,7 +8838,7 @@ index 811134a503b..f432f4637d0 100755
> >         else
> >   archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $libobj=
s $deplibs $linker_flags'
> >         fi
> > -@@ -10324,10 +10917,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> > +@@ -10332,10 +10925,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> >    archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $=
deplibs $compiler_flags'
> >    ;;
> >   ia64*)
> > @@ -8850,7 +8851,7 @@ index 811134a503b..f432f4637d0 100755
> >    ;;
> >   esac
> >         else
> > -@@ -10406,23 +10999,36 @@ fi
> > +@@ -10414,23 +11007,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -8895,7 +8896,7 @@ index 811134a503b..f432f4637d0 100755
> >         else
> >   archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -sonam=
e $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"`=
 -update_registry ${output_objdir}/so_locations -o $lib'
> >   archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -soname $soname `test -n "$verstring" && func_echo_all "-set_version $vers=
tring"` -update_registry ${output_objdir}/so_locations -exports_file $expor=
t_symbols -o $lib'
> > -@@ -10507,7 +11113,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10515,7 +11121,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*) # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >   allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -8904,7 +8905,7 @@ index 811134a503b..f432f4637d0 100755
> >   hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >   allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10526,9 +11132,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10534,9 +11140,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >   wlarc=3D'${wl}'
> > @@ -8916,7 +8917,7 @@ index 811134a503b..f432f4637d0 100755
> >         else
> >   case `$CC -V 2>&1` in
> >   *"Compilers 5.0"*)
> > -@@ -11104,8 +11710,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -11112,8 +11718,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -8928,7 +8929,7 @@ index 811134a503b..f432f4637d0 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -11138,13 +11745,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -11146,13 +11753,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``=
echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -9001,7 +9002,7 @@ index 811134a503b..f432f4637d0 100755
> >     # FIXME: first we should search . and the directory the executable=
 is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -11236,7 +11901,7 @@ haiku*)
> > +@@ -11244,7 +11909,7 @@ haiku*)
> >     soname_spec=3D'${libname}${release}${shared_ext}$major'
> >     shlibpath_var=3DLIBRARY_PATH
> >     shlibpath_overrides_runpath=3Dyes
> > @@ -9010,16 +9011,16 @@ index 811134a503b..f432f4637d0 100755
> >     hardcode_into_libs=3Dyes
> >     ;;
> >
> > -@@ -12032,7 +12697,7 @@ else
> > +@@ -12040,7 +12705,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12035 "configure"
> > +-#line 12040 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12076,10 +12741,10 @@ else
> > +@@ -12084,10 +12749,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -9032,16 +9033,16 @@ index 811134a503b..f432f4637d0 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12138,7 +12803,7 @@ else
> > +@@ -12146,7 +12811,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12141 "configure"
> > +-#line 12146 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12182,10 +12847,10 @@ else
> > +@@ -12190,10 +12855,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -9054,7 +9055,7 @@ index 811134a503b..f432f4637d0 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12577,6 +13242,7 @@ $RM -r conftest*
> > +@@ -12585,6 +13250,7 @@ $RM -r conftest*
> >
> >     # Allow CC to be a program name with arguments.
> >     lt_save_CC=3D$CC
> > @@ -9062,7 +9063,7 @@ index 811134a503b..f432f4637d0 100755
> >     lt_save_LD=3D$LD
> >     lt_save_GCC=3D$GCC
> >     GCC=3D$GXX
> > -@@ -12594,6 +13260,7 @@ $RM -r conftest*
> > +@@ -12602,6 +13268,7 @@ $RM -r conftest*
> >     fi
> >     test -z "${LDCXX+set}" || LD=3D$LDCXX
> >     CC=3D${CXX-"c++"}
> > @@ -9070,7 +9071,7 @@ index 811134a503b..f432f4637d0 100755
> >     compiler=3D$CC
> >     compiler_CXX=3D$CC
> >     for cc_temp in $compiler""; do
> > -@@ -12876,7 +13543,13 @@ $as_echo_n "checking whether the $compiler l=
inker ($LD) supports shared librarie
> > +@@ -12884,7 +13551,13 @@ $as_echo_n "checking whether the $compiler l=
inker ($LD) supports shared librarie
> >             allow_undefined_flag_CXX=3D'-berok'
> >             # Determine the default libpath from the value encoded in =
an empty
> >             # executable.
> > @@ -9085,7 +9086,7 @@ index 811134a503b..f432f4637d0 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -12889,22 +13562,29 @@ main ()
> > +@@ -12897,22 +13570,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_cxx_try_link "$LINENO"; then :
> >
> > @@ -9128,7 +9129,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >             hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"=
$aix_libpath"
> >
> > -@@ -12917,7 +13597,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -12925,7 +13605,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >             else
> >      # Determine the default libpath from the value encoded in an
> >      # empty executable.
> > @@ -9143,7 +9144,7 @@ index 811134a503b..f432f4637d0 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -12930,22 +13616,29 @@ main ()
> > +@@ -12938,22 +13624,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_cxx_try_link "$LINENO"; then :
> >
> > @@ -9186,7 +9187,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >      hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >      # Warning - without using the other run time loading flags,
> > -@@ -12988,29 +13681,75 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> > +@@ -12996,29 +13689,75 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> >           ;;
> >
> >         cygwin* | mingw* | pw32* | cegcc*)
> > @@ -9285,7 +9286,7 @@ index 811134a503b..f432f4637d0 100755
> >         darwin* | rhapsody*)
> >
> >
> > -@@ -13116,7 +13855,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13124,7 +13863,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >               ;;
> >             *)
> >               if test "$GXX" =3D yes; then
> > @@ -9294,7 +9295,7 @@ index 811134a503b..f432f4637d0 100755
> >               else
> >                 # FIXME: insert proper C++ library support
> >                 ld_shlibs_CXX=3Dno
> > -@@ -13187,10 +13926,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> > +@@ -13195,10 +13934,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> >              archive_cmds_CXX=3D'$CC -shared -nostdlib -fPIC ${wl}+h $=
{wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $com=
piler_flags'
> >              ;;
> >            ia64*)
> > @@ -9307,7 +9308,7 @@ index 811134a503b..f432f4637d0 100755
> >              ;;
> >          esac
> >        fi
> > -@@ -13231,9 +13970,9 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13239,9 +13978,9 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >             *)
> >      if test "$GXX" =3D yes; then
> >        if test "$with_gnu_ld" =3D no; then
> > @@ -9319,7 +9320,7 @@ index 811134a503b..f432f4637d0 100755
> >        fi
> >      fi
> >      link_all_deplibs_CXX=3Dyes
> > -@@ -13303,20 +14042,20 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> > +@@ -13311,20 +14050,20 @@ if test -z "$aix_libpath"; then aix_libpath=
=
=3D"/usr/lib:/lib"; fi
> >        prelink_cmds_CXX=3D'tpldir=3DTemplate.dir~
> >   rm -rf $tpldir~
> >   $CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $co=
mpile_deplibs~
> > @@ -9344,7 +9345,7 @@ index 811134a503b..f432f4637d0 100755
> >        ;;
> >      *) # Version 6 and above use weak symbols
> >        archive_cmds_CXX=3D'$CC -shared $pic_flag $predep_objects $libo=
bjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o =
$lib'
> > -@@ -13511,7 +14250,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13519,7 +14258,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >            archive_cmds_CXX=3D'$CC -shared -nostdlib ${allow_undefined=
_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags $=
{wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_=
version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_lo=
cations -o $lib'
> >    ;;
> >          *)
> > @@ -9353,7 +9354,7 @@ index 811134a503b..f432f4637d0 100755
> >    ;;
> >        esac
> >
> > -@@ -13557,7 +14296,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13565,7 +14304,7 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >
> >         solaris*)
> >           case $cc_basename in
> > @@ -9362,7 +9363,7 @@ index 811134a503b..f432f4637d0 100755
> >      # Sun C++ 4.2, 5.x and Centerline C++
> >               archive_cmds_need_lc_CXX=3Dyes
> >      no_undefined_flag_CXX=3D' -zdefs'
> > -@@ -13598,9 +14337,9 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13606,9 +14345,9 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >      if test "$GXX" =3D yes && test "$with_gnu_ld" =3D no; then
> >        no_undefined_flag_CXX=3D' ${wl}-z ${wl}defs'
> >        if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> > @@ -9374,7 +9375,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >          # Commands to make compiler produce verbose output that lists
> >          # what "hidden" libraries, object files and flags are used wh=
en
> > -@@ -13735,6 +14474,13 @@ private:
> > +@@ -13743,6 +14482,13 @@ private:
> >   };
> >   _LT_EOF
> >
> > @@ -9388,7 +9389,7 @@ index 811134a503b..f432f4637d0 100755
> >   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""=
; } >&5
> >     (eval $ac_compile) 2>&5
> >     ac_status=3D$?
> > -@@ -13748,7 +14494,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LI=
NENO}: \"$ac_compile\""; } >&5
> > +@@ -13756,7 +14502,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LI=
NENO}: \"$ac_compile\""; } >&5
> >     pre_test_object_deps_done=3Dno
> >
> >     for p in `eval "$output_verbose_link_cmd"`; do
> > @@ -9397,7 +9398,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >       -L* | -R* | -l*)
> >          # Some compilers place space between "-{L,R}" and the path.
> > -@@ -13757,13 +14503,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$=
LINENO}: \"$ac_compile\""; } >&5
> > +@@ -13765,13 +14511,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$=
LINENO}: \"$ac_compile\""; } >&5
> >             test $p =3D "-R"; then
> >   prev=3D$p
> >   continue
> > @@ -9424,7 +9425,7 @@ index 811134a503b..f432f4637d0 100755
> >     # Internal compiler library paths should come after those
> >     # provided the user.  The postdeps already come after the
> >     # user supplied libs so there is no need to process them.
> > -@@ -13783,8 +14538,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$L=
INENO}: \"$ac_compile\""; } >&5
> > +@@ -13791,8 +14546,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$L=
INENO}: \"$ac_compile\""; } >&5
> >     postdeps_CXX=3D"${postdeps_CXX} ${prev}${p}"
> >   fi
> >          fi
> > @@ -9435,7 +9436,7 @@ index 811134a503b..f432f4637d0 100755
> >       *.$objext)
> >          # This assumes that the test object file only shows up
> >          # once in the compiler output.
> > -@@ -13820,6 +14577,7 @@ else
> > +@@ -13828,6 +14585,7 @@ else
> >   fi
> >
> >   $RM -f confest.$objext
> > @@ -9443,7 +9444,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >   # PORTME: override above test on systems where it is broken
> >   case $host_os in
> > -@@ -13855,7 +14613,7 @@ linux*)
> > +@@ -13863,7 +14621,7 @@ linux*)
> >
> >   solaris*)
> >     case $cc_basename in
> > @@ -9452,7 +9453,7 @@ index 811134a503b..f432f4637d0 100755
> >       # The more standards-conforming stlport4 library is
> >       # incompatible with the Cstd library. Avoid specifying
> >       # it if it's in CXXFLAGS. Ignore libCrun as
> > -@@ -13920,8 +14678,6 @@ fi
> > +@@ -13928,8 +14686,6 @@ fi
> >   lt_prog_compiler_pic_CXX=3D
> >   lt_prog_compiler_static_CXX=3D
> >
> > @@ -9461,7 +9462,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >     # C++ specific cases for pic, static, wl, etc.
> >     if test "$GXX" =3D yes; then
> > -@@ -14026,6 +14782,11 @@ $as_echo_n "checking for $compiler option to=
 produce PIC... " >&6; }
> > +@@ -14034,6 +14790,11 @@ $as_echo_n "checking for $compiler option to=
 produce PIC... " >&6; }
> >    ;;
> >   esac
> >   ;;
> > @@ -9473,7 +9474,7 @@ index 811134a503b..f432f4637d0 100755
> >         dgux*)
> >   case $cc_basename in
> >    ec++*)
> > -@@ -14178,7 +14939,7 @@ $as_echo_n "checking for $compiler option to =
produce PIC... " >&6; }
> > +@@ -14186,7 +14947,7 @@ $as_echo_n "checking for $compiler option to =
produce PIC... " >&6; }
> >   ;;
> >         solaris*)
> >   case $cc_basename in
> > @@ -9482,7 +9483,7 @@ index 811134a503b..f432f4637d0 100755
> >      # Sun C++ 4.2, 5.x and Centerline C++
> >      lt_prog_compiler_pic_CXX=3D'-KPIC'
> >      lt_prog_compiler_static_CXX=3D'-Bstatic'
> > -@@ -14243,10 +15004,17 @@ case $host_os in
> > +@@ -14251,10 +15012,17 @@ case $host_os in
> >       lt_prog_compiler_pic_CXX=3D"$lt_prog_compiler_pic_CXX -DPIC"
> >       ;;
> >   esac
> > @@ -9503,7 +9504,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -14304,6 +15072,8 @@ fi
> > +@@ -14312,6 +15080,8 @@ fi
> >
> >
> >
> > @@ -9512,7 +9513,7 @@ index 811134a503b..f432f4637d0 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -14481,6 +15251,7 @@ fi
> > +@@ -14489,6 +15259,7 @@ fi
> >   $as_echo_n "checking whether the $compiler linker ($LD) supports sha=
red libraries... " >&6; }
> >
> >     export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_sym=
bol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> > @@ -9520,7 +9521,7 @@ index 811134a503b..f432f4637d0 100755
> >     case $host_os in
> >     aix[4-9]*)
> >       # If we're using GNU nm, then we don't want the "-C" option.
> > -@@ -14495,15 +15266,20 @@ $as_echo_n "checking whether the $compiler =
linker ($LD) supports shared librarie
> > +@@ -14503,15 +15274,20 @@ $as_echo_n "checking whether the $compiler =
linker ($LD) supports shared librarie
> >       ;;
> >     pw32*)
> >       export_symbols_cmds_CXX=3D"$ltdll_cmds"
> > @@ -9546,7 +9547,7 @@ index 811134a503b..f432f4637d0 100755
> >
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> >   $as_echo "$ld_shlibs_CXX" >&6; }
> > -@@ -14766,8 +15542,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -14774,8 +15550,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -9558,7 +9559,7 @@ index 811134a503b..f432f4637d0 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -14799,13 +15576,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -14807,13 +15584,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``=
echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -9631,7 +9632,7 @@ index 811134a503b..f432f4637d0 100755
> >     # FIXME: first we should search . and the directory the executable=
 is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -14896,7 +15731,7 @@ haiku*)
> > +@@ -14904,7 +15739,7 @@ haiku*)
> >     soname_spec=3D'${libname}${release}${shared_ext}$major'
> >     shlibpath_var=3DLIBRARY_PATH
> >     shlibpath_overrides_runpath=3Dyes
> > @@ -9640,7 +9641,7 @@ index 811134a503b..f432f4637d0 100755
> >     hardcode_into_libs=3Dyes
> >     ;;
> >
> > -@@ -15355,6 +16190,7 @@ fi
> > +@@ -15363,6 +16198,7 @@ fi
> >     fi # test -n "$compiler"
> >
> >     CC=3D$lt_save_CC
> > @@ -9648,7 +9649,7 @@ index 811134a503b..f432f4637d0 100755
> >     LDCXX=3D$LD
> >     LD=3D$lt_save_LD
> >     GCC=3D$lt_save_GCC
> > -@@ -18477,13 +19313,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> > +@@ -18554,13 +19390,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -9669,7 +9670,7 @@ index 811134a503b..f432f4637d0 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$dela=
y_single_quote_subst"`'
> > -@@ -18498,14 +19341,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -18575,14 +19418,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol=
_to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_glob=
al_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_=
cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > @@ -9688,7 +9689,7 @@ index 811134a503b..f432f4637d0 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -18538,12 +19384,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> > +@@ -18615,12 +19461,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_si=
ngle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote=
_subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single=
_quote_subst"`'
> > @@ -9702,7 +9703,7 @@ index 811134a503b..f432f4637d0 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quo=
te_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |=
 $SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_q=
uote_subst"`'
> > -@@ -18582,8 +19428,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_=
cmds_CXX" | $SED "$delay_single_quote
> > +@@ -18659,8 +19505,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_=
cmds_CXX" | $SED "$delay_single_quote
> >   compiler_CXX=3D'`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_s=
ubst"`'
> >   GCC_CXX=3D'`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> >   lt_prog_compiler_no_builtin_flag_CXX=3D'`$ECHO "$lt_prog_compiler_no=
_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> > @@ -9712,7 +9713,7 @@ index 811134a503b..f432f4637d0 100755
> >   lt_prog_compiler_static_CXX=3D'`$ECHO "$lt_prog_compiler_static_CXX"=
 | $SED "$delay_single_quote_subst"`'
> >   lt_cv_prog_compiler_c_o_CXX=3D'`$ECHO "$lt_cv_prog_compiler_c_o_CXX"=
 | $SED "$delay_single_quote_subst"`'
> >   archive_cmds_need_lc_CXX=3D'`$ECHO "$archive_cmds_need_lc_CXX" | $SE=
D "$delay_single_quote_subst"`'
> > -@@ -18610,12 +19456,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hard=
code_shlibpath_var_CXX" | $SED "$delay_
> > +@@ -18687,12 +19533,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hard=
code_shlibpath_var_CXX" | $SED "$delay_
> >   hardcode_automatic_CXX=3D'`$ECHO "$hardcode_automatic_CXX" | $SED "$=
delay_single_quote_subst"`'
> >   inherit_rpath_CXX=3D'`$ECHO "$inherit_rpath_CXX" | $SED "$delay_sing=
le_quote_subst"`'
> >   link_all_deplibs_CXX=3D'`$ECHO "$link_all_deplibs_CXX" | $SED "$dela=
y_single_quote_subst"`'
> > @@ -9726,7 +9727,7 @@ index 811134a503b..f432f4637d0 100755
> >   file_list_spec_CXX=3D'`$ECHO "$file_list_spec_CXX" | $SED "$delay_si=
ngle_quote_subst"`'
> >   hardcode_action_CXX=3D'`$ECHO "$hardcode_action_CXX" | $SED "$delay_=
single_quote_subst"`'
> >   compiler_lib_search_dirs_CXX=3D'`$ECHO "$compiler_lib_search_dirs_CX=
X" | $SED "$delay_single_quote_subst"`'
> > -@@ -18653,8 +19499,13 @@ reload_flag \
> > +@@ -18730,8 +19576,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -9740,7 +9741,7 @@ index 811134a503b..f432f4637d0 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -18664,12 +19515,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -18741,12 +19592,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -9756,7 +9757,7 @@ index 811134a503b..f432f4637d0 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -18685,7 +19538,6 @@ no_undefined_flag \
> > +@@ -18762,7 +19615,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -9764,7 +9765,7 @@ index 811134a503b..f432f4637d0 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -18707,8 +19559,8 @@ LD_CXX \
> > +@@ -18784,8 +19636,8 @@ LD_CXX \
> >   reload_flag_CXX \
> >   compiler_CXX \
> >   lt_prog_compiler_no_builtin_flag_CXX \
> > @@ -9774,7 +9775,7 @@ index 811134a503b..f432f4637d0 100755
> >   lt_prog_compiler_static_CXX \
> >   lt_cv_prog_compiler_c_o_CXX \
> >   export_dynamic_flag_spec_CXX \
> > -@@ -18720,7 +19572,6 @@ no_undefined_flag_CXX \
> > +@@ -18797,7 +19649,6 @@ no_undefined_flag_CXX \
> >   hardcode_libdir_flag_spec_CXX \
> >   hardcode_libdir_flag_spec_ld_CXX \
> >   hardcode_libdir_separator_CXX \
> > @@ -9782,7 +9783,7 @@ index 811134a503b..f432f4637d0 100755
> >   exclude_expsyms_CXX \
> >   include_expsyms_CXX \
> >   file_list_spec_CXX \
> > -@@ -18754,6 +19605,7 @@ module_cmds \
> > +@@ -18831,6 +19682,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -9790,7 +9791,7 @@ index 811134a503b..f432f4637d0 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -18768,7 +19620,8 @@ archive_expsym_cmds_CXX \
> > +@@ -18845,7 +19697,8 @@ archive_expsym_cmds_CXX \
> >   module_cmds_CXX \
> >   module_expsym_cmds_CXX \
> >   export_symbols_cmds_CXX \
> > @@ -9800,7 +9801,7 @@ index 811134a503b..f432f4637d0 100755
> >       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> >       *[\\\\\\\`\\"\\\$]*)
> >         eval "lt_\$var=3D\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED=
 -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$del=
ay_variable_subst\\"\\\`\\\\\\""
> > -@@ -19533,7 +20386,8 @@ $as_echo X"$file" |
> > +@@ -19610,7 +20463,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 20=
05,
> > @@ -9810,7 +9811,7 @@ index 811134a503b..f432f4637d0 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -19636,19 +20490,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -19713,19 +20567,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -9854,7 +9855,7 @@ index 811134a503b..f432f4637d0 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -19678,6 +20555,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> > +@@ -19755,6 +20632,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefi=
x is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix
> >
> > @@ -9867,7 +9868,7 @@ index 811134a503b..f432f4637d0 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -19687,6 +20570,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -19764,6 +20647,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -9877,7 +9878,7 @@ index 811134a503b..f432f4637d0 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -19801,12 +20687,12 @@ with_gcc=3D$GCC
> > +@@ -19878,12 +20764,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -9893,7 +9894,7 @@ index 811134a503b..f432f4637d0 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -19893,9 +20779,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -19970,9 +20856,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency lib=
raries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -9903,7 +9904,7 @@ index 811134a503b..f432f4637d0 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -19911,6 +20794,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -19988,6 +20871,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with t=
emplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -9913,7 +9914,7 @@ index 811134a503b..f432f4637d0 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -19957,210 +20843,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -20034,210 +20920,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -10287,7 +10288,7 @@ index 811134a503b..f432f4637d0 100755
> >       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> >     chmod +x "$ofile"
> >
> > -@@ -20188,12 +21033,12 @@ with_gcc=3D$GCC_CXX
> > +@@ -20265,12 +21110,12 @@ with_gcc=3D$GCC_CXX
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX
> >
> > @@ -10303,7 +10304,7 @@ index 811134a503b..f432f4637d0 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static_CXX
> >
> > -@@ -20280,9 +21125,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> > +@@ -20357,9 +21202,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> >   # Whether libtool must link a program against all its dependency lib=
raries.
> >   link_all_deplibs=3D$link_all_deplibs_CXX
> >
> > @@ -10313,7 +10314,7 @@ index 811134a503b..f432f4637d0 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols_CXX
> >
> > -@@ -20298,6 +21140,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> > +@@ -20375,6 +21217,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> >   # Commands necessary for linking programs (against libraries) with t=
emplates.
> >   prelink_cmds=3D$lt_prelink_cmds_CXX
> >
> > @@ -10324,7 +10325,7 @@ index 811134a503b..f432f4637d0 100755
> >   file_list_spec=3D$lt_file_list_spec_CXX
> >
> >  diff --git a/libctf/configure b/libctf/configure
> > -index e5493b31691..9977e4f7a42 100755
> > +index 1dc1b65fac3..c5c2f36bbc0 100755
> >  --- a/libctf/configure
> >  +++ b/libctf/configure
> >  @@ -663,6 +663,8 @@ OTOOL
> > @@ -10336,7 +10337,7 @@ index e5493b31691..9977e4f7a42 100755
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -778,6 +780,7 @@ enable_static
> > +@@ -790,6 +792,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> > @@ -10344,7 +10345,7 @@ index e5493b31691..9977e4f7a42 100755
> >   enable_libtool_lock
> >   enable_largefile
> >   enable_werror_always
> > -@@ -1436,6 +1439,8 @@ Optional Packages:
> > +@@ -1448,6 +1451,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defau=
lt=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=
=3Dno]
> > @@ -10353,7 +10354,7 @@ index e5493b31691..9977e4f7a42 100755
> >     --with-system-zlib      use installed libz
> >
> >   Some influential environment variables:
> > -@@ -5324,8 +5329,8 @@ esac
> > +@@ -5406,8 +5411,8 @@ esac
> >
> >
> >
> > @@ -10364,7 +10365,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >
> >
> > -@@ -5436,7 +5441,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -5518,7 +5523,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strin=
gs" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -10373,7 +10374,7 @@ index e5493b31691..9977e4f7a42 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6122,8 +6127,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> > +@@ -6204,8 +6209,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -10384,7 +10385,7 @@ index e5493b31691..9977e4f7a42 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6172,6 +6177,80 @@ esac
> > +@@ -6254,6 +6259,80 @@ esac
> >
> >
> >
> > @@ -10465,7 +10466,7 @@ index e5493b31691..9977e4f7a42 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to =
reload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6;=
 }
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6188,6 +6267,11 @@ case $reload_flag in
> > +@@ -6270,6 +6349,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -10477,7 +10478,7 @@ index e5493b31691..9977e4f7a42 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$re=
load_objs'
> > -@@ -6356,7 +6440,8 @@ mingw* | pw32*)
> > +@@ -6438,7 +6522,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x8=
6 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -10487,7 +10488,7 @@ index e5493b31691..9977e4f7a42 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -6510,6 +6595,21 @@ esac
> > +@@ -6592,6 +6677,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_chec=
k_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -10509,7 +10510,7 @@ index e5493b31691..9977e4f7a42 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6525,9 +6625,162 @@ test -z "$deplibs_check_method" && deplibs_ch=
eck_method=3Dunknown
> > +@@ -6607,9 +6707,162 @@ test -z "$deplibs_check_method" && deplibs_ch=
eck_method=3Dunknown
> >
> >
> >
> > @@ -10674,7 +10675,7 @@ index e5493b31691..9977e4f7a42 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6543,7 +6796,7 @@ do
> > +@@ -6625,7 +6878,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -10683,7 +10684,7 @@ index e5493b31691..9977e4f7a42 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6563,11 +6816,15 @@ $as_echo "no" >&6; }
> > +@@ -6645,11 +6898,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -10702,7 +10703,7 @@ index e5493b31691..9977e4f7a42 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6583,7 +6840,7 @@ do
> > +@@ -6665,7 +6922,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -10711,7 +10712,7 @@ index e5493b31691..9977e4f7a42 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6602,6 +6859,10 @@ else
> > +@@ -6684,6 +6941,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -10722,7 +10723,7 @@ index e5493b31691..9977e4f7a42 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -6613,16 +6874,72 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6695,16 +6956,72 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -10799,7 +10800,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >
> >
> > -@@ -6964,8 +7281,8 @@ esac
> > +@@ -7046,8 +7363,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/exter=
n int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol add=
ress
> > @@ -10810,7 +10811,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7001,6 +7318,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7083,6 +7400,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[ ]\($symcode$sy=
mcode*\)[ ][ ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -10818,7 +10819,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7042,6 +7360,18 @@ _LT_EOF
> > +@@ -7124,6 +7442,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >   if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >    cat <<_LT_EOF > conftest.$ac_ext
> > @@ -10837,7 +10838,7 @@ index e5493b31691..9977e4f7a42 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7053,7 +7383,7 @@ _LT_EOF
> > +@@ -7135,7 +7465,7 @@ _LT_EOF
> >    cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -10846,7 +10847,7 @@ index e5493b31691..9977e4f7a42 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7079,8 +7409,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7161,8 +7491,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >    # Now try linking the two files.
> >    mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -10857,7 +10858,7 @@ index e5493b31691..9977e4f7a42 100755
> >    LIBS=3D"conftstm.$ac_objext"
> >    CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >    if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; =
} >&5
> > -@@ -7090,8 +7420,8 @@ _LT_EOF
> > +@@ -7172,8 +7502,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >      pipe_works=3Dyes
> >    fi
> > @@ -10868,7 +10869,7 @@ index e5493b31691..9977e4f7a42 100755
> >   else
> >    echo "cannot find nm_test_func in $nlist" >&5
> >   fi
> > -@@ -7128,6 +7458,16 @@ else
> > +@@ -7210,6 +7540,16 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -10885,7 +10886,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >
> >
> > -@@ -7144,6 +7484,45 @@ fi
> > +@@ -7226,6 +7566,45 @@ fi
> >
> >
> >
> > @@ -10931,7 +10932,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >
> >
> > -@@ -7355,6 +7734,123 @@ esac
> > +@@ -7437,6 +7816,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -11055,7 +11056,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -7918,6 +8414,8 @@ _LT_EOF
> > +@@ -8000,6 +8496,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -11064,7 +11065,7 @@ index e5493b31691..9977e4f7a42 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8083,7 +8581,8 @@ fi
> > +@@ -8165,7 +8663,8 @@ fi
> >   LIBTOOL_DEPS=3D"$ltmain"
> >
> >   # Always use our own libtool.
> > @@ -11074,7 +11075,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >
> >
> > -@@ -8172,7 +8671,7 @@ aix3*)
> > +@@ -8254,7 +8753,7 @@ aix3*)
> >   esac
> >
> >   # Global variables:
> > @@ -11083,7 +11084,7 @@ index e5493b31691..9977e4f7a42 100755
> >   can_build_shared=3Dyes
> >
> >   # All known linkers require a `.a' archive for static linking (excep=
t MSVC,
> > -@@ -8470,8 +8969,6 @@ fi
> > +@@ -8552,8 +9051,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -11092,7 +11093,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8637,6 +9134,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > +@@ -8719,6 +9216,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> >   lt_prog_compiler_pic=3D'--shared'
> >   lt_prog_compiler_static=3D'--static'
> >   ;;
> > @@ -11105,7 +11106,7 @@ index e5493b31691..9977e4f7a42 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >   # which looks to be a dead project)
> > -@@ -8699,7 +9202,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -8781,7 +9284,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -11114,7 +11115,7 @@ index e5493b31691..9977e4f7a42 100755
> >   lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >   lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8756,13 +9259,17 @@ case $host_os in
> > +@@ -8838,13 +9341,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -11138,7 +11139,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -8823,6 +9330,11 @@ fi
> > +@@ -8905,6 +9412,11 @@ fi
> >
> >
> >
> > @@ -11150,7 +11151,7 @@ index e5493b31691..9977e4f7a42 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9173,7 +9685,8 @@ _LT_EOF
> > +@@ -9255,7 +9767,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -11160,7 +11161,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-im=
plib -Xlinker $lib'
> > -@@ -9272,12 +9785,12 @@ _LT_EOF
> > +@@ -9354,12 +9867,12 @@ _LT_EOF
> >    whole_archive_flag_spec=3D'--whole-archive$convenience --no-whole-a=
rchive'
> >    hardcode_libdir_flag_spec=3D
> >    hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -11175,7 +11176,7 @@ index e5493b31691..9977e4f7a42 100755
> >    fi
> >    ;;
> >   esac
> > -@@ -9291,8 +9804,8 @@ _LT_EOF
> > +@@ -9373,8 +9886,8 @@ _LT_EOF
> >   archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -o $=
lib'
> >   wlarc=3D
> >         else
> > @@ -11186,7 +11187,7 @@ index e5493b31691..9977e4f7a42 100755
> >         fi
> >         ;;
> >
> > -@@ -9310,8 +9823,8 @@ _LT_EOF
> > +@@ -9392,8 +9905,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /d=
ev/null; then
> > @@ -11197,7 +11198,7 @@ index e5493b31691..9977e4f7a42 100755
> >         else
> >   ld_shlibs=3Dno
> >         fi
> > -@@ -9357,8 +9870,8 @@ _LT_EOF
> > +@@ -9439,8 +9952,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev=
/null; then
> > @@ -11208,7 +11209,7 @@ index e5493b31691..9977e4f7a42 100755
> >         else
> >   ld_shlibs=3Dno
> >         fi
> > -@@ -9488,7 +10001,13 @@ _LT_EOF
> > +@@ -9570,7 +10083,13 @@ _LT_EOF
> >   allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -11223,7 +11224,7 @@ index e5493b31691..9977e4f7a42 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9501,22 +10020,29 @@ main ()
> > +@@ -9583,22 +10102,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -11266,7 +11267,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_l=
ibpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobj=
s $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_unde=
fined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; e=
lse :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9528,7 +10054,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9610,7 +10136,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >   else
> >   # Determine the default libpath from the value encoded in an
> >   # empty executable.
> > @@ -11281,7 +11282,7 @@ index e5493b31691..9977e4f7a42 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9541,22 +10073,29 @@ main ()
> > +@@ -9623,22 +10155,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -11324,7 +11325,7 @@ index e5493b31691..9977e4f7a42 100755
> >
> >   hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
> >    # Warning - without using the other run time loading flags,
> > -@@ -9601,20 +10140,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9683,20 +10222,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there =
is
> >         # no search path for DLLs.
> > @@ -11402,7 +11403,7 @@ index e5493b31691..9977e4f7a42 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -9675,7 +10257,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9757,7 +10339,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -11411,7 +11412,7 @@ index e5493b31691..9977e4f7a42 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -9683,7 +10265,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9765,7 +10347,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -11420,7 +11421,7 @@ index e5493b31691..9977e4f7a42 100755
> >         else
> >   archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_libdir=
 -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_obj=
dir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -9699,7 +10281,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9781,7 +10363,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -11429,7 +11430,7 @@ index e5493b31691..9977e4f7a42 100755
> >         else
> >   archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $libobj=
s $deplibs $linker_flags'
> >         fi
> > -@@ -9723,10 +10305,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9805,10 +10387,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >    archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $=
deplibs $compiler_flags'
> >    ;;
> >   ia64*)
> > @@ -11442,7 +11443,7 @@ index e5493b31691..9977e4f7a42 100755
> >    ;;
> >   esac
> >         else
> > -@@ -9805,23 +10387,36 @@ fi
> > +@@ -9887,23 +10469,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -11487,7 +11488,7 @@ index e5493b31691..9977e4f7a42 100755
> >         else
> >   archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -sonam=
e $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"`=
 -update_registry ${output_objdir}/so_locations -o $lib'
> >   archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -soname $soname `test -n "$verstring" && func_echo_all "-set_version $vers=
tring"` -update_registry ${output_objdir}/so_locations -exports_file $expor=
t_symbols -o $lib'
> > -@@ -9906,7 +10501,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9988,7 +10583,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*) # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >   allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -11496,7 +11497,7 @@ index e5493b31691..9977e4f7a42 100755
> >   hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >   allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -9925,9 +10520,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10007,9 +10602,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >   wlarc=3D'${wl}'
> > @@ -11508,7 +11509,7 @@ index e5493b31691..9977e4f7a42 100755
> >         else
> >   case `$CC -V 2>&1` in
> >   *"Compilers 5.0"*)
> > -@@ -10503,8 +11098,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10585,8 +11180,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -11520,7 +11521,7 @@ index e5493b31691..9977e4f7a42 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10537,13 +11133,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10619,13 +11215,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``=
echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -11593,7 +11594,7 @@ index e5493b31691..9977e4f7a42 100755
> >     # FIXME: first we should search . and the directory the executable=
 is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -10635,7 +11289,7 @@ haiku*)
> > +@@ -10717,7 +11371,7 @@ haiku*)
> >     soname_spec=3D'${libname}${release}${shared_ext}$major'
> >     shlibpath_var=3DLIBRARY_PATH
> >     shlibpath_overrides_runpath=3Dyes
> > @@ -11602,16 +11603,16 @@ index e5493b31691..9977e4f7a42 100755
> >     hardcode_into_libs=3Dyes
> >     ;;
> >
> > -@@ -11431,7 +12085,7 @@ else
> > +@@ -11513,7 +12167,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11434 "configure"
> > +-#line 11516 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11475,10 +12129,10 @@ else
> > +@@ -11557,10 +12211,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -11624,16 +11625,16 @@ index e5493b31691..9977e4f7a42 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11537,7 +12191,7 @@ else
> > +@@ -11619,7 +12273,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11540 "configure"
> > +-#line 11622 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11581,10 +12235,10 @@ else
> > +@@ -11663,10 +12317,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -11646,7 +11647,7 @@ index e5493b31691..9977e4f7a42 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -13994,13 +14648,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> > +@@ -14110,13 +14764,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -11667,7 +11668,7 @@ index e5493b31691..9977e4f7a42 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$dela=
y_single_quote_subst"`'
> > -@@ -14015,14 +14676,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -14131,14 +14792,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol=
_to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_glob=
al_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_=
cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > @@ -11686,7 +11687,7 @@ index e5493b31691..9977e4f7a42 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -14055,12 +14719,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> > +@@ -14171,12 +14835,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_si=
ngle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote=
_subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single=
_quote_subst"`'
> > @@ -11700,7 +11701,7 @@ index e5493b31691..9977e4f7a42 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quo=
te_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |=
 $SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_q=
uote_subst"`'
> > -@@ -14115,8 +14779,13 @@ reload_flag \
> > +@@ -14231,8 +14895,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -11714,7 +11715,7 @@ index e5493b31691..9977e4f7a42 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -14126,12 +14795,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -14242,12 +14911,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -11730,7 +11731,7 @@ index e5493b31691..9977e4f7a42 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -14147,7 +14818,6 @@ no_undefined_flag \
> > +@@ -14263,7 +14934,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -11738,7 +11739,7 @@ index e5493b31691..9977e4f7a42 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -14183,6 +14853,7 @@ module_cmds \
> > +@@ -14299,6 +14969,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -11746,7 +11747,7 @@ index e5493b31691..9977e4f7a42 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -14939,7 +15610,8 @@ $as_echo X"$file" |
> > +@@ -15055,7 +15726,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 20=
05,
> > @@ -11756,7 +11757,7 @@ index e5493b31691..9977e4f7a42 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -15042,19 +15714,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -15158,19 +15830,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -11800,7 +11801,7 @@ index e5493b31691..9977e4f7a42 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -15084,6 +15779,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> > +@@ -15200,6 +15895,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefi=
x is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix
> >
> > @@ -11813,7 +11814,7 @@ index e5493b31691..9977e4f7a42 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -15093,6 +15794,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -15209,6 +15910,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -11823,7 +11824,7 @@ index e5493b31691..9977e4f7a42 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -15207,12 +15911,12 @@ with_gcc=3D$GCC
> > +@@ -15323,12 +16027,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -11839,7 +11840,7 @@ index e5493b31691..9977e4f7a42 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -15299,9 +16003,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -15415,9 +16119,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency lib=
raries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -11849,7 +11850,7 @@ index e5493b31691..9977e4f7a42 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -15317,6 +16018,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -15433,6 +16134,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with t=
emplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -11859,7 +11860,7 @@ index e5493b31691..9977e4f7a42 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -15349,210 +16053,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -15465,210 +16169,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -19317,7 +19318,7 @@ index bf92b5e0790..c573da90c5c 100644
> >   # These exist entirely to fool aclocal when bootstrapping libtool.
> >   #
> >  diff --git a/opcodes/configure b/opcodes/configure
> > -index 4723dcdc1e8..006ccdaa458 100755
> > +index 8d1e561c942..a0291dfbfa7 100755
> >  --- a/opcodes/configure
> >  +++ b/opcodes/configure
> >  @@ -680,6 +680,9 @@ OTOOL
> > @@ -21229,6 +21230,1924 @@ index 4723dcdc1e8..006ccdaa458 100755
> >       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> >     chmod +x "$ofile"
> >
> > +diff --git a/zlib/configure b/zlib/configure
> > +index de6fa7e9960..cce448b6a53 100755
> > +--- a/zlib/configure
> > ++++ b/zlib/configure
> > +@@ -646,8 +646,11 @@ OTOOL
> > + LIPO
> > + NMEDIT
> > + DSYMUTIL
> > ++MANIFEST_TOOL
> > + RANLIB
> > ++ac_ct_AR
> > + AR
> > ++DLLTOOL
> > + OBJDUMP
> > + LN_S
> > + NM
> > +@@ -774,6 +777,7 @@ enable_static
> > + with_pic
> > + enable_fast_install
> > + with_gnu_ld
> > ++with_libtool_sysroot
> > + enable_libtool_lock
> > + enable_host_shared
> > + '
> > +@@ -1428,6 +1432,8 @@ Optional Packages:
> > +   --with-pic              try to use only PIC/non-PIC objects [defau=
lt=3Duse
> > +                           both]
> > +   --with-gnu-ld           assume the C compiler uses GNU ld [default=
=
=3Dno]
> > ++  --with-libtool-sysroot=3DDIR Search for dependent libraries within=
 DIR
> > ++                        (or the compiler's sysroot if not specified)=
.
> > +
> > + Some influential environment variables:
> > +   CC          C compiler command
> > +@@ -4147,8 +4153,8 @@ esac
> > +
> > +
> > +
> > +-macro_version=3D'2.2.7a'
> > +-macro_revision=3D'1.3134'
> > ++macro_version=3D'2.4'
> > ++macro_revision=3D'1.3293'
> > +
> > +
> > +
> > +@@ -4188,7 +4194,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strin=
gs" >&5
> > + $as_echo_n "checking how to print strings... " >&6; }
> > + # Test print first, because it will be a builtin if present.
> > +-if test "X`print -r -- -n 2>/dev/null`" =3D X-n && \
> > ++if test "X`( print -r -- -n ) 2>/dev/null`" =3D X-n && \
> > +    test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > +   ECHO=3D'print -r --'
> > + elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > +@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell understa=
nds some XSI constructs... " >&6;
> > + # Try some XSI features
> > + xsi_shell=3Dno
> > + ( _lt_dummy=3D"a/b/c"
> > +-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"},=
 \
> > +-      =3D c,a/b,, \
> > ++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy=
%"$_lt_dummy"}, \
> > ++      =3D c,a/b,b/c, \
> > +     && eval 'test $(( 1 + 1 )) -eq 2 \
> > +     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> > +   && xsi_shell=3Dyes
> > +@@ -5054,6 +5060,80 @@ esac
> > +
> > +
> > +
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bu=
ild file names to $host format" >&5
> > ++$as_echo_n "checking how to convert $build file names to $host forma=
t... " >&6; }
> > ++if ${lt_cv_to_host_file_cmd+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  case $host in
> > ++  *-*-mingw* )
> > ++    case $build in
> > ++      *-*-mingw* ) # actually msys
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_w32
> > ++        ;;
> > ++      *-*-cygwin* )
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_cygwin_to_w32
> > ++        ;;
> > ++      * ) # otherwise, assume *nix
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_w32
> > ++        ;;
> > ++    esac
> > ++    ;;
> > ++  *-*-cygwin* )
> > ++    case $build in
> > ++      *-*-mingw* ) # actually msys
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_cygwin
> > ++        ;;
> > ++      *-*-cygwin* )
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > ++        ;;
> > ++      * ) # otherwise, assume *nix
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_cygwin
> > ++        ;;
> > ++    esac
> > ++    ;;
> > ++  * ) # unhandled hosts (and "normal" native builds)
> > ++    lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > ++    ;;
> > ++esac
> > ++
> > ++fi
> > ++
> > ++to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file=
_cmd" >&5
> > ++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bu=
ild file names to toolchain format" >&5
> > ++$as_echo_n "checking how to convert $build file names to toolchain f=
ormat... " >&6; }
> > ++if ${lt_cv_to_tool_file_cmd+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  #assume ordinary cross tools, or native build.
> > ++lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
> > ++case $host in
> > ++  *-*-mingw* )
> > ++    case $build in
> > ++      *-*-mingw* ) # actually msys
> > ++        lt_cv_to_tool_file_cmd=3Dfunc_convert_file_msys_to_w32
> > ++        ;;
> > ++    esac
> > ++    ;;
> > ++esac
> > ++
> > ++fi
> > ++
> > ++to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file=
_cmd" >&5
> > ++$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> > ++
> > ++
> > ++
> > ++
> > ++
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to =
reload object files" >&5
> > + $as_echo_n "checking for $LD option to reload object files... " >&6;=
 }
> > + if ${lt_cv_ld_reload_flag+:} false; then :
> > +@@ -5070,6 +5150,11 @@ case $reload_flag in
> > + esac
> > + reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> > + case $host_os in
> > ++  cygwin* | mingw* | pw32* | cegcc*)
> > ++    if test "$GCC" !=3D yes; then
> > ++      reload_cmds=3Dfalse
> > ++    fi
> > ++    ;;
> > +   darwin*)
> > +     if test "$GCC" =3D yes; then
> > +       reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$re=
load_objs'
> > +@@ -5238,7 +5323,8 @@ mingw* | pw32*)
> > +     lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x8=
6 DLL'
> > +     lt_cv_file_magic_cmd=3D'func_win32_libid'
> > +   else
> > +-    lt_cv_deplibs_check_method=3D'file_magic file format pei*-i386(.=
*architecture: i386)?'
> > ++    # Keep this pattern in sync with the one in func_win32_libid.
> > ++    lt_cv_deplibs_check_method=3D'file_magic file format (pei*-i386(=
.*architecture: i386)?|pe-arm-wince|pe-x86-64)'
> > +     lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> > +   fi
> > +   ;;
> > +@@ -5392,6 +5478,21 @@ esac
> > + fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_chec=
k_method" >&5
> > + $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > ++
> > ++file_magic_glob=3D
> > ++want_nocaseglob=3Dno
> > ++if test "$build" =3D "$host"; then
> > ++  case $host_os in
> > ++  mingw* | pw32*)
> > ++    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
> > ++      want_nocaseglob=3Dyes
> > ++    else
> > ++      file_magic_glob=3D`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsS=
tTuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
> > ++    fi
> > ++    ;;
> > ++  esac
> > ++fi
> > ++
> > + file_magic_cmd=3D$lt_cv_file_magic_cmd
> > + deplibs_check_method=3D$lt_cv_deplibs_check_method
> > + test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > +@@ -5405,11 +5506,165 @@ test -z "$deplibs_check_method" && deplibs_c=
heck_method=3Dunknown
> > +
> > +
> > +
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > +
> > +
> > + if test -n "$ac_tool_prefix"; then
> > +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a =
program name with args.
> > +-set dummy ${ac_tool_prefix}ar; ac_word=3D$2
> > ++  # Extract the first word of "${ac_tool_prefix}dlltool", so it can =
be a program name with args.
> > ++set dummy ${ac_tool_prefix}dlltool; ac_word=3D$2
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > ++$as_echo_n "checking for $ac_word... " >&6; }
> > ++if ${ac_cv_prog_DLLTOOL+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  if test -n "$DLLTOOL"; then
> > ++  ac_cv_prog_DLLTOOL=3D"$DLLTOOL" # Let the user override the test.
> > ++else
> > ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > ++for as_dir in $PATH
> > ++do
> > ++  IFS=3D$as_save_IFS
> > ++  test -z "$as_dir" && as_dir=3D.
> > ++    for ac_exec_ext in '' $ac_executable_extensions; do
> > ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > ++    ac_cv_prog_DLLTOOL=3D"${ac_tool_prefix}dlltool"
> > ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> > ++    break 2
> > ++  fi
> > ++done
> > ++  done
> > ++IFS=3D$as_save_IFS
> > ++
> > ++fi
> > ++fi
> > ++DLLTOOL=3D$ac_cv_prog_DLLTOOL
> > ++if test -n "$DLLTOOL"; then
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
> > ++$as_echo "$DLLTOOL" >&6; }
> > ++else
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > ++$as_echo "no" >&6; }
> > ++fi
> > ++
> > ++
> > ++fi
> > ++if test -z "$ac_cv_prog_DLLTOOL"; then
> > ++  ac_ct_DLLTOOL=3D$DLLTOOL
> > ++  # Extract the first word of "dlltool", so it can be a program name=
 with args.
> > ++set dummy dlltool; ac_word=3D$2
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > ++$as_echo_n "checking for $ac_word... " >&6; }
> > ++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  if test -n "$ac_ct_DLLTOOL"; then
> > ++  ac_cv_prog_ac_ct_DLLTOOL=3D"$ac_ct_DLLTOOL" # Let the user overrid=
e the test.
> > ++else
> > ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > ++for as_dir in $PATH
> > ++do
> > ++  IFS=3D$as_save_IFS
> > ++  test -z "$as_dir" && as_dir=3D.
> > ++    for ac_exec_ext in '' $ac_executable_extensions; do
> > ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > ++    ac_cv_prog_ac_ct_DLLTOOL=3D"dlltool"
> > ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> > ++    break 2
> > ++  fi
> > ++done
> > ++  done
> > ++IFS=3D$as_save_IFS
> > ++
> > ++fi
> > ++fi
> > ++ac_ct_DLLTOOL=3D$ac_cv_prog_ac_ct_DLLTOOL
> > ++if test -n "$ac_ct_DLLTOOL"; then
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >=
&5
> > ++$as_echo "$ac_ct_DLLTOOL" >&6; }
> > ++else
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > ++$as_echo "no" >&6; }
> > ++fi
> > ++
> > ++  if test "x$ac_ct_DLLTOOL" =3D x; then
> > ++    DLLTOOL=3D"false"
> > ++  else
> > ++    case $cross_compiling:$ac_tool_warned in
> > ++yes:)
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools =
not prefixed with host triplet" >&5
> > ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host =
triplet" >&2;}
> > ++ac_tool_warned=3Dyes ;;
> > ++esac
> > ++    DLLTOOL=3D$ac_ct_DLLTOOL
> > ++  fi
> > ++else
> > ++  DLLTOOL=3D"$ac_cv_prog_DLLTOOL"
> > ++fi
> > ++
> > ++test -z "$DLLTOOL" && DLLTOOL=3Ddlltool
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate r=
untime and link libraries" >&5
> > ++$as_echo_n "checking how to associate runtime and link libraries... =
" >&6; }
> > ++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  lt_cv_sharedlib_from_linklib_cmd=3D'unknown'
> > ++
> > ++case $host_os in
> > ++cygwin* | mingw* | pw32* | cegcc*)
> > ++  # two different shell functions defined in ltmain.sh
> > ++  # decide which to use based on capabilities of $DLLTOOL
> > ++  case `$DLLTOOL --help 2>&1` in
> > ++  *--identify-strict*)
> > ++    lt_cv_sharedlib_from_linklib_cmd=3Dfunc_cygming_dll_for_implib
> > ++    ;;
> > ++  *)
> > ++    lt_cv_sharedlib_from_linklib_cmd=3Dfunc_cygming_dll_for_implib_f=
allback
> > ++    ;;
> > ++  esac
> > ++  ;;
> > ++*)
> > ++  # fallback: assume linklib IS sharedlib
> > ++  lt_cv_sharedlib_from_linklib_cmd=3D"$ECHO"
> > ++  ;;
> > ++esac
> > ++
> > ++fi
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_fr=
om_linklib_cmd" >&5
> > ++$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
> > ++sharedlib_from_linklib_cmd=3D$lt_cv_sharedlib_from_linklib_cmd
> > ++test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=
=3D$ECHO
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++if test -n "$ac_tool_prefix"; then
> > ++  for ac_prog in ar
> > ++  do
> > ++    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can=
 be a program name with args.
> > ++set dummy $ac_tool_prefix$ac_prog; ac_word=3D$2
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > + $as_echo_n "checking for $ac_word... " >&6; }
> > + if ${ac_cv_prog_AR+:} false; then :
> > +@@ -5425,7 +5680,7 @@ do
> > +   test -z "$as_dir" && as_dir=3D.
> > +     for ac_exec_ext in '' $ac_executable_extensions; do
> > +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > +-    ac_cv_prog_AR=3D"${ac_tool_prefix}ar"
> > ++    ac_cv_prog_AR=3D"$ac_tool_prefix$ac_prog"
> > +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> > +     break 2
> > +   fi
> > +@@ -5445,11 +5700,15 @@ $as_echo "no" >&6; }
> > + fi
> > +
> > +
> > ++    test -n "$AR" && break
> > ++  done
> > + fi
> > +-if test -z "$ac_cv_prog_AR"; then
> > ++if test -z "$AR"; then
> > +   ac_ct_AR=3D$AR
> > +-  # Extract the first word of "ar", so it can be a program name with=
 args.
> > +-set dummy ar; ac_word=3D$2
> > ++  for ac_prog in ar
> > ++do
> > ++  # Extract the first word of "$ac_prog", so it can be a program nam=
e with args.
> > ++set dummy $ac_prog; ac_word=3D$2
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > + $as_echo_n "checking for $ac_word... " >&6; }
> > + if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > +@@ -5465,7 +5724,7 @@ do
> > +   test -z "$as_dir" && as_dir=3D.
> > +     for ac_exec_ext in '' $ac_executable_extensions; do
> > +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > +-    ac_cv_prog_ac_ct_AR=3D"ar"
> > ++    ac_cv_prog_ac_ct_AR=3D"$ac_prog"
> > +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> > +     break 2
> > +   fi
> > +@@ -5484,6 +5743,10 @@ else
> > + $as_echo "no" >&6; }
> > + fi
> > +
> > ++
> > ++  test -n "$ac_ct_AR" && break
> > ++done
> > ++
> > +   if test "x$ac_ct_AR" =3D x; then
> > +     AR=3D"false"
> > +   else
> > +@@ -5495,16 +5758,72 @@ ac_tool_warned=3Dyes ;;
> > + esac
> > +     AR=3D$ac_ct_AR
> > +   fi
> > +-else
> > +-  AR=3D"$ac_cv_prog_AR"
> > + fi
> > +
> > +-test -z "$AR" && AR=3Dar
> > +-test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > ++: ${AR=3Dar}
> > ++: ${AR_FLAGS=3Dcru}
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE=
 support" >&5
> > ++$as_echo_n "checking for archiver @FILE support... " >&6; }
> > ++if ${lt_cv_ar_at_file+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  lt_cv_ar_at_file=3Dno
> > ++   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > ++/* end confdefs.h.  */
> > ++
> > ++int
> > ++main ()
> > ++{
> > +
> > ++  ;
> > ++  return 0;
> > ++}
> > ++_ACEOF
> > ++if ac_fn_c_try_compile "$LINENO"; then :
> > ++  echo conftest.$ac_objext > conftest.lst
> > ++      lt_ar_try=3D'$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
> > ++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\=
""; } >&5
> > ++  (eval $lt_ar_try) 2>&5
> > ++  ac_status=3D$?
> > ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> > ++  test $ac_status =3D 0; }
> > ++      if test "$ac_status" -eq 0; then
> > ++ # Ensure the archiver fails upon bogus file names.
> > ++ rm -f conftest.$ac_objext libconftest.a
> > ++ { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; }=
 >&5
> > ++  (eval $lt_ar_try) 2>&5
> > ++  ac_status=3D$?
> > ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> > ++  test $ac_status =3D 0; }
> > ++ if test "$ac_status" -ne 0; then
> > ++          lt_cv_ar_at_file=3D@
> > ++        fi
> > ++      fi
> > ++      rm -f conftest.* libconftest.a
> > +
> > ++fi
> > ++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> > +
> > ++fi
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" =
>&5
> > ++$as_echo "$lt_cv_ar_at_file" >&6; }
> > +
> > ++if test "x$lt_cv_ar_at_file" =3D xno; then
> > ++  archiver_list_spec=3D
> > ++else
> > ++  archiver_list_spec=3D$lt_cv_ar_at_file
> > ++fi
> > +
> > +
> > +
> > +@@ -5846,8 +6165,8 @@ esac
> > + lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/exter=
n int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> > +
> > + # Transform an extracted symbol line into symbol name and symbol add=
ress
> > +-lt_cv_sys_global_symbol_to_c_name_address=3D"sed -n -e 's/^: \([^ ]*=
\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/ =
 {\"\2\", (void *) \&\2},/p'"
> > +-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D"sed -n -e 's=
/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \=
(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ =
]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> > ++lt_cv_sys_global_symbol_to_c_name_address=3D"sed -n -e 's/^: \([^ ]*=
\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)=
$/  {\"\2\", (void *) \&\2},/p'"
> > ++lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D"sed -n -e 's=
/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\=
) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \(=
[^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> > +
> > + # Handle CRLF in mingw tool chain
> > + opt_cr=3D
> > +@@ -5883,6 +6202,7 @@ for ac_symprfx in "" "_"; do
> > +   else
> > +     lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[ ]\($symcode$sy=
mcode*\)[ ][ ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> > +   fi
> > ++  lt_cv_sys_global_symbol_pipe=3D"$lt_cv_sys_global_symbol_pipe | se=
d '/ __gnu_lto/d'"
> > +
> > +   # Check to see that the pipe works correctly.
> > +   pipe_works=3Dno
> > +@@ -5924,6 +6244,18 @@ _LT_EOF
> > +       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> > + if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> > +  cat <<_LT_EOF > conftest.$ac_ext
> > ++/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, a=
nd tests.  */
> > ++#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
> > ++/* DATA imports from DLLs on WIN32 con't be const, because runtime
> > ++   relocations are performed -- see ld's documentation on pseudo-rel=
ocs.  */
> > ++# define LT_DLSYM_CONST
> > ++#elif defined(__osf__)
> > ++/* This system does not cope well with relocations in const data.  *=
/
> > ++# define LT_DLSYM_CONST
> > ++#else
> > ++# define LT_DLSYM_CONST const
> > ++#endif
> > ++
> > + #ifdef __cplusplus
> > + extern "C" {
> > + #endif
> > +@@ -5935,7 +6267,7 @@ _LT_EOF
> > +  cat <<_LT_EOF >> conftest.$ac_ext
> > +
> > + /* The mapping between symbol names and symbols.  */
> > +-const struct {
> > ++LT_DLSYM_CONST struct {
> > +   const char *name;
> > +   void       *address;
> > + }
> > +@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup() {
> > + _LT_EOF
> > +  # Now try linking the two files.
> > +  mv conftest.$ac_objext conftstm.$ac_objext
> > +-  lt_save_LIBS=3D"$LIBS"
> > +-  lt_save_CFLAGS=3D"$CFLAGS"
> > ++  lt_globsym_save_LIBS=3D$LIBS
> > ++  lt_globsym_save_CFLAGS=3D$CFLAGS
> > +  LIBS=3D"conftstm.$ac_objext"
> > +  CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> > +  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; =
} >&5
> > +@@ -5972,8 +6304,8 @@ _LT_EOF
> > +   test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> > +    pipe_works=3Dyes
> > +  fi
> > +-  LIBS=3D"$lt_save_LIBS"
> > +-  CFLAGS=3D"$lt_save_CFLAGS"
> > ++  LIBS=3D$lt_globsym_save_LIBS
> > ++  CFLAGS=3D$lt_globsym_save_CFLAGS
> > + else
> > +  echo "cannot find nm_test_func in $nlist" >&5
> > + fi
> > +@@ -6010,6 +6342,19 @@ else
> > + $as_echo "ok" >&6; }
> > + fi
> > +
> > ++# Response file support.
> > ++if test "$lt_cv_nm_interface" =3D "MS dumpbin"; then
> > ++  nm_file_list_spec=3D'@'
> > ++elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
> > ++  nm_file_list_spec=3D'@'
> > ++fi
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> > +
> > +
> > +
> > +@@ -6027,6 +6372,41 @@ fi
> > +
> > +
> > +
> > ++
> > ++
> > ++
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> > ++$as_echo_n "checking for sysroot... " >&6; }
> > ++
> > ++# Check whether --with-libtool-sysroot was given.
> > ++if test "${with_libtool_sysroot+set}" =3D set; then :
> > ++  withval=3D$with_libtool_sysroot;
> > ++else
> > ++  with_libtool_sysroot=3Dno
> > ++fi
> > ++
> > ++
> > ++lt_sysroot=3D
> > ++case ${with_libtool_sysroot} in #(
> > ++ yes)
> > ++   if test "$GCC" =3D yes; then
> > ++     lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
> > ++   fi
> > ++   ;; #(
> > ++ /*)
> > ++   lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_s=
ubst"`
> > ++   ;; #(
> > ++ no|'')
> > ++   ;; #(
> > ++ *)
> > ++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_s=
ysroot}" >&5
> > ++$as_echo "${with_libtool_sysroot}" >&6; }
> > ++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" =
5
> > ++   ;;
> > ++esac
> > ++
> > ++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}"=
 >&5
> > ++$as_echo "${lt_sysroot:-no}" >&6; }
> > +
> > +
> > +
> > +@@ -6241,6 +6621,123 @@ esac
> > +
> > + need_locks=3D"$enable_libtool_lock"
> > +
> > ++if test -n "$ac_tool_prefix"; then
> > ++  # Extract the first word of "${ac_tool_prefix}mt", so it can be a =
program name with args.
> > ++set dummy ${ac_tool_prefix}mt; ac_word=3D$2
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > ++$as_echo_n "checking for $ac_word... " >&6; }
> > ++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  if test -n "$MANIFEST_TOOL"; then
> > ++  ac_cv_prog_MANIFEST_TOOL=3D"$MANIFEST_TOOL" # Let the user overrid=
e the test.
> > ++else
> > ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > ++for as_dir in $PATH
> > ++do
> > ++  IFS=3D$as_save_IFS
> > ++  test -z "$as_dir" && as_dir=3D.
> > ++    for ac_exec_ext in '' $ac_executable_extensions; do
> > ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > ++    ac_cv_prog_MANIFEST_TOOL=3D"${ac_tool_prefix}mt"
> > ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> > ++    break 2
> > ++  fi
> > ++done
> > ++  done
> > ++IFS=3D$as_save_IFS
> > ++
> > ++fi
> > ++fi
> > ++MANIFEST_TOOL=3D$ac_cv_prog_MANIFEST_TOOL
> > ++if test -n "$MANIFEST_TOOL"; then
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >=
&5
> > ++$as_echo "$MANIFEST_TOOL" >&6; }
> > ++else
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > ++$as_echo "no" >&6; }
> > ++fi
> > ++
> > ++
> > ++fi
> > ++if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
> > ++  ac_ct_MANIFEST_TOOL=3D$MANIFEST_TOOL
> > ++  # Extract the first word of "mt", so it can be a program name with=
 args.
> > ++set dummy mt; ac_word=3D$2
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > ++$as_echo_n "checking for $ac_word... " >&6; }
> > ++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  if test -n "$ac_ct_MANIFEST_TOOL"; then
> > ++  ac_cv_prog_ac_ct_MANIFEST_TOOL=3D"$ac_ct_MANIFEST_TOOL" # Let the =
user override the test.
> > ++else
> > ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > ++for as_dir in $PATH
> > ++do
> > ++  IFS=3D$as_save_IFS
> > ++  test -z "$as_dir" && as_dir=3D.
> > ++    for ac_exec_ext in '' $ac_executable_extensions; do
> > ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > ++    ac_cv_prog_ac_ct_MANIFEST_TOOL=3D"mt"
> > ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac=
_exec_ext" >&5
> > ++    break 2
> > ++  fi
> > ++done
> > ++  done
> > ++IFS=3D$as_save_IFS
> > ++
> > ++fi
> > ++fi
> > ++ac_ct_MANIFEST_TOOL=3D$ac_cv_prog_ac_ct_MANIFEST_TOOL
> > ++if test -n "$ac_ct_MANIFEST_TOOL"; then
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_T=
OOL" >&5
> > ++$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
> > ++else
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > ++$as_echo "no" >&6; }
> > ++fi
> > ++
> > ++  if test "x$ac_ct_MANIFEST_TOOL" =3D x; then
> > ++    MANIFEST_TOOL=3D":"
> > ++  else
> > ++    case $cross_compiling:$ac_tool_warned in
> > ++yes:)
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools =
not prefixed with host triplet" >&5
> > ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host =
triplet" >&2;}
> > ++ac_tool_warned=3Dyes ;;
> > ++esac
> > ++    MANIFEST_TOOL=3D$ac_ct_MANIFEST_TOOL
> > ++  fi
> > ++else
> > ++  MANIFEST_TOOL=3D"$ac_cv_prog_MANIFEST_TOOL"
> > ++fi
> > ++
> > ++test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=3Dmt
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL =
is a manifest tool" >&5
> > ++$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; =
}
> > ++if ${lt_cv_path_mainfest_tool+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  lt_cv_path_mainfest_tool=3Dno
> > ++  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
> > ++  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
> > ++  cat conftest.err >&5
> > ++  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> > ++    lt_cv_path_mainfest_tool=3Dyes
> > ++  fi
> > ++  rm -f conftest*
> > ++fi
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfes=
t_tool" >&5
> > ++$as_echo "$lt_cv_path_mainfest_tool" >&6; }
> > ++if test "x$lt_cv_path_mainfest_tool" !=3D xyes; then
> > ++  MANIFEST_TOOL=3D:
> > ++fi
> > ++
> > ++
> > ++
> > ++
> > ++
> > +
> > +   case $host_os in
> > +     rhapsody* | darwin*)
> > +@@ -6807,6 +7304,8 @@ _LT_EOF
> > +       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> > +       echo "$AR cru libconftest.a conftest.o" >&5
> > +       $AR cru libconftest.a conftest.o 2>&5
> > ++      echo "$RANLIB libconftest.a" >&5
> > ++      $RANLIB libconftest.a 2>&5
> > +       cat > conftest.c << _LT_EOF
> > + int main() { return 0;}
> > + _LT_EOF
> > +@@ -7269,7 +7768,8 @@ fi
> > + LIBTOOL_DEPS=3D"$ltmain"
> > +
> > + # Always use our own libtool.
> > +-LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
> > ++LIBTOOL=3D'$(SHELL) $(top_builddir)'
> > ++LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
> > +
> > +
> > +
> > +@@ -7358,7 +7858,7 @@ aix3*)
> > + esac
> > +
> > + # Global variables:
> > +-ofile=3Dlibtool
> > ++ofile=3D${host_alias}-libtool
> > + can_build_shared=3Dyes
> > +
> > + # All known linkers require a `.a' archive for static linking (excep=
t MSVC,
> > +@@ -7656,8 +8156,6 @@ fi
> > + lt_prog_compiler_pic=3D
> > + lt_prog_compiler_static=3D
> > +
> > +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler opti=
on to produce PIC" >&5
> > +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> > +
> > +   if test "$GCC" =3D yes; then
> > +     lt_prog_compiler_wl=3D'-Wl,'
> > +@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > + lt_prog_compiler_pic=3D'--shared'
> > + lt_prog_compiler_static=3D'--static'
> > + ;;
> > ++      nagfor*)
> > ++ # NAG Fortran compiler
> > ++ lt_prog_compiler_wl=3D'-Wl,-Wl,,'
> > ++ lt_prog_compiler_pic=3D'-PIC'
> > ++ lt_prog_compiler_static=3D'-Bstatic'
> > ++ ;;
> > +       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> > +         # Portland Group compilers (*not* the Pentium gcc compiler,
> > + # which looks to be a dead project)
> > +@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +       lt_prog_compiler_pic=3D'-KPIC'
> > +       lt_prog_compiler_static=3D'-Bstatic'
> > +       case $cc_basename in
> > +-      f77* | f90* | f95*)
> > ++      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
> > + lt_prog_compiler_wl=3D'-Qoption ld ';;
> > +       *)
> > + lt_prog_compiler_wl=3D'-Wl,';;
> > +@@ -7942,13 +8446,17 @@ case $host_os in
> > +     lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> > +     ;;
> > + esac
> > +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_p=
ic" >&5
> > +-$as_echo "$lt_prog_compiler_pic" >&6; }
> > +-
> > +-
> > +-
> > +-
> > +
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler opti=
on to produce PIC" >&5
> > ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> > ++if ${lt_cv_prog_compiler_pic+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  lt_cv_prog_compiler_pic=3D$lt_prog_compiler_pic
> > ++fi
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compile=
r_pic" >&5
> > ++$as_echo "$lt_cv_prog_compiler_pic" >&6; }
> > ++lt_prog_compiler_pic=3D$lt_cv_prog_compiler_pic
> > +
> > + #
> > + # Check to make sure the PIC flag actually works.
> > +@@ -8009,6 +8517,11 @@ fi
> > +
> > +
> > +
> > ++
> > ++
> > ++
> > ++
> > ++
> > + #
> > + # Check to make sure the static flag actually works.
> > + #
> > +@@ -8359,7 +8872,8 @@ _LT_EOF
> > +       allow_undefined_flag=3Dunsupported
> > +       always_export_symbols=3Dno
> > +       enable_shared_with_static_runtimes=3Dyes
> > +-      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_sym=
bol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -=
e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> > ++      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_sym=
bol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm=
__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq=
 > $export_symbols'
> > ++      exclude_expsyms=3D'[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_=
.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> > +
> > +       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> > +         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-im=
plib -Xlinker $lib'
> > +@@ -8458,12 +8972,12 @@ _LT_EOF
> > +  whole_archive_flag_spec=3D'--whole-archive$convenience --no-whole-a=
rchive'
> > +  hardcode_libdir_flag_spec=3D
> > +  hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > +-  archive_cmds=3D'$LD -shared $libobjs $deplibs $compiler_flags -son=
ame $soname -o $lib'
> > ++  archive_cmds=3D'$LD -shared $libobjs $deplibs $linker_flags -sonam=
e $soname -o $lib'
> > +  if test "x$supports_anon_versioning" =3D xyes; then
> > +    archive_expsym_cmds=3D'echo "{ global:" > $output_objdir/$libname=
.ver~
> > +      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/=
$libname.ver~
> > +      echo "local: *; };" >> $output_objdir/$libname.ver~
> > +-      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname =
-version-script $output_objdir/$libname.ver -o $lib'
> > ++      $LD -shared $libobjs $deplibs $linker_flags -soname $soname -v=
ersion-script $output_objdir/$libname.ver -o $lib'
> > +  fi
> > +  ;;
> > + esac
> > +@@ -8477,8 +8991,8 @@ _LT_EOF
> > + archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -o $=
lib'
> > + wlarc=3D
> > +       else
> > +- archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${wl}=
-soname $wl$soname -o $lib'
> > +- archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $=
lib'
> > ++ archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler_f=
lags ${wl}-soname $wl$soname -o $lib'
> > ++ archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $com=
piler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_sy=
mbols -o $lib'
> > +       fi
> > +       ;;
> > +
> > +@@ -8496,8 +9010,8 @@ _LT_EOF
> > +
> > + _LT_EOF
> > +       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /d=
ev/null; then
> > +- archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${wl}=
-soname $wl$soname -o $lib'
> > +- archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $=
lib'
> > ++ archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler_f=
lags ${wl}-soname $wl$soname -o $lib'
> > ++ archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $com=
piler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_sy=
mbols -o $lib'
> > +       else
> > + ld_shlibs=3Dno
> > +       fi
> > +@@ -8543,8 +9057,8 @@ _LT_EOF
> > +
> > +     *)
> > +       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev=
/null; then
> > +- archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${wl}=
-soname $wl$soname -o $lib'
> > +- archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $=
lib'
> > ++ archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler_f=
lags ${wl}-soname $wl$soname -o $lib'
> > ++ archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $com=
piler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_sy=
mbols -o $lib'
> > +       else
> > + ld_shlibs=3Dno
> > +       fi
> > +@@ -8674,7 +9188,13 @@ _LT_EOF
> > + allow_undefined_flag=3D'-berok'
> > +         # Determine the default libpath from the value encoded in an
> > +         # empty executable.
> > +-        if test x$gcc_no_link =3D xyes; then
> > ++        if test "${lt_cv_aix_libpath+set}" =3D set; then
> > ++  aix_libpath=3D$lt_cv_aix_libpath
> > ++else
> > ++  if ${lt_cv_aix_libpath_+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  if test x$gcc_no_link =3D xyes; then
> > +   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLE=
S." "$LINENO" 5
> > + fi
> > + cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > +@@ -8690,22 +9210,29 @@ main ()
> > + _ACEOF
> > + if ac_fn_c_try_link "$LINENO"; then :
> > +
> > +-lt_aix_libpath_sed=3D'
> > +-    /Import File Strings/,/^$/ {
> > +- /^0/ {
> > +-    s/^0  *\(.*\)$/\1/
> > +-    p
> > +- }
> > +-    }'
> > +-aix_libpath=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "=
$lt_aix_libpath_sed"`
> > +-# Check for a 64-bit object if we didn't find anything.
> > +-if test -z "$aix_libpath"; then
> > +-  aix_libpath=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n=
 -e "$lt_aix_libpath_sed"`
> > +-fi
> > ++  lt_aix_libpath_sed=3D'
> > ++      /Import File Strings/,/^$/ {
> > ++  /^0/ {
> > ++      s/^0  *\([^ ]*\) *$/\1/
> > ++      p
> > ++  }
> > ++      }'
> > ++  lt_cv_aix_libpath_=3D`dump -H conftest$ac_exeext 2>/dev/null | $SE=
D -n -e "$lt_aix_libpath_sed"`
> > ++  # Check for a 64-bit object if we didn't find anything.
> > ++  if test -z "$lt_cv_aix_libpath_"; then
> > ++    lt_cv_aix_libpath_=3D`dump -HX64 conftest$ac_exeext 2>/dev/null =
| $SED -n -e "$lt_aix_libpath_sed"`
> > ++  fi
> > + fi
> > + rm -f core conftest.err conftest.$ac_objext \
> > +     conftest$ac_exeext conftest.$ac_ext
> > +-if test -z "$aix_libpath"; then aix_libpath=3D"/usr/lib:/lib"; fi
> > ++  if test -z "$lt_cv_aix_libpath_"; then
> > ++    lt_cv_aix_libpath_=3D"/usr/lib:/lib"
> > ++  fi
> > ++
> > ++fi
> > ++
> > ++  aix_libpath=3D$lt_cv_aix_libpath_
> > ++fi
> > +
> > +         hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_l=
ibpath"
> > +         archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobj=
s $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_unde=
fined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; e=
lse :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > +@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > + else
> > + # Determine the default libpath from the value encoded in an
> > + # empty executable.
> > +- if test x$gcc_no_link =3D xyes; then
> > ++ if test "${lt_cv_aix_libpath+set}" =3D set; then
> > ++  aix_libpath=3D$lt_cv_aix_libpath
> > ++else
> > ++  if ${lt_cv_aix_libpath_+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  if test x$gcc_no_link =3D xyes; then
> > +   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLE=
S." "$LINENO" 5
> > + fi
> > + cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > +@@ -8733,22 +9266,29 @@ main ()
> > + _ACEOF
> > + if ac_fn_c_try_link "$LINENO"; then :
> > +
> > +-lt_aix_libpath_sed=3D'
> > +-    /Import File Strings/,/^$/ {
> > +- /^0/ {
> > +-    s/^0  *\(.*\)$/\1/
> > +-    p
> > +- }
> > +-    }'
> > +-aix_libpath=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "=
$lt_aix_libpath_sed"`
> > +-# Check for a 64-bit object if we didn't find anything.
> > +-if test -z "$aix_libpath"; then
> > +-  aix_libpath=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n=
 -e "$lt_aix_libpath_sed"`
> > +-fi
> > ++  lt_aix_libpath_sed=3D'
> > ++      /Import File Strings/,/^$/ {
> > ++  /^0/ {
> > ++      s/^0  *\([^ ]*\) *$/\1/
> > ++      p
> > ++  }
> > ++      }'
> > ++  lt_cv_aix_libpath_=3D`dump -H conftest$ac_exeext 2>/dev/null | $SE=
D -n -e "$lt_aix_libpath_sed"`
> > ++  # Check for a 64-bit object if we didn't find anything.
> > ++  if test -z "$lt_cv_aix_libpath_"; then
> > ++    lt_cv_aix_libpath_=3D`dump -HX64 conftest$ac_exeext 2>/dev/null =
| $SED -n -e "$lt_aix_libpath_sed"`
> > ++  fi
> > + fi
> > + rm -f core conftest.err conftest.$ac_objext \
> > +     conftest$ac_exeext conftest.$ac_ext
> > +-if test -z "$aix_libpath"; then aix_libpath=3D"/usr/lib:/lib"; fi
> > ++  if test -z "$lt_cv_aix_libpath_"; then
> > ++    lt_cv_aix_libpath_=3D"/usr/lib:/lib"
> > ++  fi
> > ++
> > ++fi
> > ++
> > ++  aix_libpath=3D$lt_cv_aix_libpath_
> > ++fi
> > +
> > + hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
> > +  # Warning - without using the other run time loading flags,
> > +@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +       # Microsoft Visual C++.
> > +       # hardcode_libdir_flag_spec is actually meaningless, as there =
is
> > +       # no search path for DLLs.
> > +-      hardcode_libdir_flag_spec=3D' '
> > +-      allow_undefined_flag=3Dunsupported
> > +-      # Tell ltmain to make .lib files, not .a files.
> > +-      libext=3Dlib
> > +-      # Tell ltmain to make .dll files, not .so files.
> > +-      shrext_cmds=3D".dll"
> > +-      # FIXME: Setting linknames here is a bad hack.
> > +-      archive_cmds=3D'$CC -o $lib $libobjs $compiler_flags `func_ech=
o_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames=3D'
> > +-      # The linker will automatically build a .lib file if we build =
a DLL.
> > +-      old_archive_from_new_cmds=3D'true'
> > +-      # FIXME: Should let the user specify the lib program.
> > +-      old_archive_cmds=3D'lib -OUT:$oldlib$oldobjs$old_deplibs'
> > +-      fix_srcfile_path=3D'`cygpath -w "$srcfile"`'
> > +-      enable_shared_with_static_runtimes=3Dyes
> > ++      case $cc_basename in
> > ++      cl*)
> > ++ # Native MSVC
> > ++ hardcode_libdir_flag_spec=3D' '
> > ++ allow_undefined_flag=3Dunsupported
> > ++ always_export_symbols=3Dyes
> > ++ file_list_spec=3D'@'
> > ++ # Tell ltmain to make .lib files, not .a files.
> > ++ libext=3Dlib
> > ++ # Tell ltmain to make .dll files, not .so files.
> > ++ shrext_cmds=3D".dll"
> > ++ # FIXME: Setting linknames here is a bad hack.
> > ++ archive_cmds=3D'$CC -o $output_objdir/$soname $libobjs $compiler_fl=
ags $deplibs -Wl,-dll~linknames=3D'
> > ++ archive_expsym_cmds=3D'if test "x`$SED 1q $export_symbols`" =3D xEX=
PORTS; then
> > ++    sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '=
1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> > ++  else
> > ++    sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $expo=
rt_symbols > $output_objdir/$soname.exp;
> > ++  fi~
> > ++  $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplib=
s "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$l=
ibname.dll.lib"~
> > ++  linknames=3D'
> > ++ # The linker will not automatically build a static lib if we build =
a DLL.
> > ++ # _LT_TAGVAR(old_archive_from_new_cmds, )=3D'true'
> > ++ enable_shared_with_static_runtimes=3Dyes
> > ++ export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symbol_p=
ipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '\'=
'/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> > ++ # Don't use ranlib
> > ++ old_postinstall_cmds=3D'chmod 644 $oldlib'
> > ++ postlink_cmds=3D'lt_outputfile=3D"@OUTPUT@"~
> > ++  lt_tool_outputfile=3D"@TOOL_OUTPUT@"~
> > ++  case $lt_outputfile in
> > ++    *.exe|*.EXE) ;;
> > ++    *)
> > ++      lt_outputfile=3D"$lt_outputfile.exe"
> > ++      lt_tool_outputfile=3D"$lt_tool_outputfile.exe"
> > ++      ;;
> > ++  esac~
> > ++  if test "$MANIFEST_TOOL" !=3D ":" && test -f "$lt_outputfile.manif=
est"; then
> > ++    $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputr=
esource:"$lt_tool_outputfile" || exit 1;
> > ++    $RM "$lt_outputfile.manifest";
> > ++  fi'
> > ++ ;;
> > ++      *)
> > ++ # Assume MSVC wrapper
> > ++ hardcode_libdir_flag_spec=3D' '
> > ++ allow_undefined_flag=3Dunsupported
> > ++ # Tell ltmain to make .lib files, not .a files.
> > ++ libext=3Dlib
> > ++ # Tell ltmain to make .dll files, not .so files.
> > ++ shrext_cmds=3D".dll"
> > ++ # FIXME: Setting linknames here is a bad hack.
> > ++ archive_cmds=3D'$CC -o $lib $libobjs $compiler_flags `func_echo_all=
 "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames=3D'
> > ++ # The linker will automatically build a .lib file if we build a DLL=
.
> > ++ old_archive_from_new_cmds=3D'true'
> > ++ # FIXME: Should let the user specify the lib program.
> > ++ old_archive_cmds=3D'lib -OUT:$oldlib$oldobjs$old_deplibs'
> > ++ enable_shared_with_static_runtimes=3Dyes
> > ++ ;;
> > ++      esac
> > +       ;;
> > +
> > +     darwin* | rhapsody*)
> > +@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +
> > +     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> > +     freebsd* | dragonfly*)
> > +-      archive_cmds=3D'$CC -shared -o $lib $libobjs $deplibs $compile=
r_flags'
> > ++      archive_cmds=3D'$CC -shared $pic_flag -o $lib $libobjs $deplib=
s $compiler_flags'
> > +       hardcode_libdir_flag_spec=3D'-R$libdir'
> > +       hardcode_direct=3Dyes
> > +       hardcode_shlibpath_var=3Dno
> > +@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +
> > +     hpux9*)
> > +       if test "$GCC" =3D yes; then
> > +- archive_cmds=3D'$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+=
b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compile=
r_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$soname $=
lib'
> > ++ archive_cmds=3D'$RM $output_objdir/$soname~$CC -shared $pic_flag ${=
wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $com=
piler_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$sona=
me $lib'
> > +       else
> > + archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_libdir=
 -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_obj=
dir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> > +       fi
> > +@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +
> > +     hpux10*)
> > +       if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > +- archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl=
}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > ++ archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b =
${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > +       else
> > + archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $libobj=
s $deplibs $linker_flags'
> > +       fi
> > +@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +  archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $=
deplibs $compiler_flags'
> > +  ;;
> > + ia64*)
> > +-  archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodef=
aultrpath -o $lib $libobjs $deplibs $compiler_flags'
> > ++  archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+n=
odefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> > +  ;;
> > + *)
> > +-  archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${w=
l}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > ++  archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b=
 ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > +  ;;
> > + esac
> > +       else
> > +@@ -8997,26 +9580,39 @@ fi
> > +
> > +     irix5* | irix6* | nonstopux*)
> > +       if test "$GCC" =3D yes; then
> > +- archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${wl}=
-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_vers=
ion ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locati=
ons -o $lib'
> > ++ archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler_f=
lags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl=
}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}=
/so_locations -o $lib'
> > + # Try to use the -exported_symbol ld option, if it does not
> > + # work, assume that -exports_file does not work either and
> > + # implicitly export all symbols.
> > +-        save_LDFLAGS=3D"$LDFLAGS"
> > +-        LDFLAGS=3D"$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo $=
{wl}-update_registry ${wl}/dev/null"
> > +-        if test x$gcc_no_link =3D xyes; then
> > ++ # This should be the same for all languages, so no per-tag cache va=
riable.
> > ++ { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host=
_os linker accepts -exported_symbol" >&5
> > ++$as_echo_n "checking whether the $host_os linker accepts -exported_s=
ymbol... " >&6; }
> > ++if ${lt_cv_irix_exported_symbol+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  save_LDFLAGS=3D"$LDFLAGS"
> > ++   LDFLAGS=3D"$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-=
update_registry ${wl}/dev/null"
> > ++   if test x$gcc_no_link =3D xyes; then
> > +   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLE=
S." "$LINENO" 5
> > + fi
> > + cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > + /* end confdefs.h.  */
> > +-int foo(void) {}
> > ++int foo (void) { return 0; }
> > + _ACEOF
> > + if ac_fn_c_try_link "$LINENO"; then :
> > +-  archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fla=
gs ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-=
set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/s=
o_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> > +-
> > ++  lt_cv_irix_exported_symbol=3Dyes
> > ++else
> > ++  lt_cv_irix_exported_symbol=3Dno
> > + fi
> > + rm -f core conftest.err conftest.$ac_objext \
> > +     conftest$ac_exeext conftest.$ac_ext
> > +-        LDFLAGS=3D"$save_LDFLAGS"
> > ++           LDFLAGS=3D"$save_LDFLAGS"
> > ++fi
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exporte=
d_symbol" >&5
> > ++$as_echo "$lt_cv_irix_exported_symbol" >&6; }
> > ++ if test "$lt_cv_irix_exported_symbol" =3D yes; then
> > ++          archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $dep=
libs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && fun=
c_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}=
${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $l=
ib'
> > ++ fi
> > +       else
> > + archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -sonam=
e $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"`=
 -update_registry ${output_objdir}/so_locations -o $lib'
> > + archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -soname $soname `test -n "$verstring" && func_echo_all "-set_version $vers=
tring"` -update_registry ${output_objdir}/so_locations -exports_file $expor=
t_symbols -o $lib'
> > +@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +     osf4* | osf5*) # as osf3* with the addition of -msym flag
> > +       if test "$GCC" =3D yes; then
> > + allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > +- archive_cmds=3D'$CC -shared${allow_undefined_flag} $libobjs $deplib=
s $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring=
" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_regist=
ry ${wl}${output_objdir}/so_locations -o $lib'
> > ++ archive_cmds=3D'$CC -shared${allow_undefined_flag} $pic_flag $libob=
js $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "=
$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-upd=
ate_registry ${wl}${output_objdir}/so_locations -o $lib'
> > + hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> > +       else
> > + allow_undefined_flag=3D' -expect_unresolved \*'
> > +@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +       no_undefined_flag=3D' -z defs'
> > +       if test "$GCC" =3D yes; then
> > + wlarc=3D'${wl}'
> > +- archive_cmds=3D'$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname =
-o $lib $libobjs $deplibs $compiler_flags'
> > ++ archive_cmds=3D'$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h ${w=
l}$soname -o $lib $libobjs $deplibs $compiler_flags'
> > + archive_expsym_cmds=3D'echo "{ global:" > $lib.exp~cat $export_symbo=
ls | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
> > +-  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$=
soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> > ++  $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl=
}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> > +       else
> > + case `$CC -V 2>&1` in
> > + *"Compilers 5.0"*)
> > +@@ -9698,8 +10294,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +   need_version=3Dno
> > +   need_lib_prefix=3Dno
> > +
> > +-  case $GCC,$host_os in
> > +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> > ++  case $GCC,$cc_basename in
> > ++  yes,*)
> > ++    # gcc
> > +     library_names_spec=3D'$libname.dll.a'
> > +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> > +     postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > +@@ -9732,13 +10329,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +       library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``=
echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> > +       ;;
> > +     esac
> > ++    dynamic_linker=3D'Win32 ld.exe'
> > ++    ;;
> > ++
> > ++  *,cl*)
> > ++    # Native MSVC
> > ++    libname_spec=3D'$name'
> > ++    soname_spec=3D'${libname}`echo ${release} | $SED -e 's/[.]/-/g'`=
${versuffix}${shared_ext}'
> > ++    library_names_spec=3D'${libname}.dll.lib'
> > ++
> > ++    case $build_os in
> > ++    mingw*)
> > ++      sys_lib_search_path_spec=3D
> > ++      lt_save_ifs=3D$IFS
> > ++      IFS=3D';'
> > ++      for lt_path in $LIB
> > ++      do
> > ++        IFS=3D$lt_save_ifs
> > ++        # Let DOS variable expansion print the short 8.3 style file =
name.
> > ++        lt_path=3D`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (=
".") do @echo %~si"`
> > ++        sys_lib_search_path_spec=3D"$sys_lib_search_path_spec $lt_pa=
th"
> > ++      done
> > ++      IFS=3D$lt_save_ifs
> > ++      # Convert to MSYS style.
> > ++      sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec" =
| sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> > ++      ;;
> > ++    cygwin*)
> > ++      # Convert to unix form, then to dos form, then back to unix fo=
rm
> > ++      # but this time dos style (no spaces!) so that the unix form l=
ooks
> > ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> > ++      sys_lib_search_path_spec=3D`cygpath --path --unix "$LIB"`
> > ++      sys_lib_search_path_spec=3D`cygpath --path --dos "$sys_lib_sea=
rch_path_spec" 2>/dev/null`
> > ++      sys_lib_search_path_spec=3D`cygpath --path --unix "$sys_lib_se=
arch_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> > ++      ;;
> > ++    *)
> > ++      sys_lib_search_path_spec=3D"$LIB"
> > ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/d=
ev/null; then
> > ++        # It is most probably a Windows format PATH.
> > ++        sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec=
" | $SED -e 's/;/ /g'`
> > ++      else
> > ++        sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec=
" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> > ++      fi
> > ++      # FIXME: find the short name or the path components, as spaces=
 are
> > ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> > ++      ;;
> > ++    esac
> > ++
> > ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> > ++    postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > ++      dlpath=3D`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; ec=
ho \$dlname'\''`~
> > ++      dldir=3D$destdir/`dirname \$dlpath`~
> > ++      test -d \$dldir || mkdir -p \$dldir~
> > ++      $install_prog $dir/$dlname \$dldir/$dlname'
> > ++    postuninstall_cmds=3D'dldll=3D`$SHELL 2>&1 -c '\''. $file; echo =
\$dlname'\''`~
> > ++      dlpath=3D$dir/\$dldll~
> > ++       $RM \$dlpath'
> > ++    shlibpath_overrides_runpath=3Dyes
> > ++    dynamic_linker=3D'Win32 link.exe'
> > +     ;;
> > +
> > +   *)
> > ++    # Assume MSVC wrapper
> > +     library_names_spec=3D'${libname}`echo ${release} | $SED -e 's/[.=
]/-/g'`${versuffix}${shared_ext} $libname.lib'
> > ++    dynamic_linker=3D'Win32 ld.exe'
> > +     ;;
> > +   esac
> > +-  dynamic_linker=3D'Win32 ld.exe'
> > +   # FIXME: first we should search . and the directory the executable=
 is in
> > +   shlibpath_var=3DPATH
> > +   ;;
> > +@@ -9830,7 +10485,7 @@ haiku*)
> > +   soname_spec=3D'${libname}${release}${shared_ext}$major'
> > +   shlibpath_var=3DLIBRARY_PATH
> > +   shlibpath_overrides_runpath=3Dyes
> > +-  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/l=
ib /boot/beos/system/lib'
> > ++  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/l=
ib /boot/system/lib'
> > +   hardcode_into_libs=3Dyes
> > +   ;;
> > +
> > +@@ -10644,7 +11299,7 @@ else
> > +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> > +   lt_status=3D$lt_dlunknown
> > +   cat > conftest.$ac_ext <<_LT_EOF
> > +-#line 10647 "configure"
> > ++#line $LINENO "configure"
> > + #include "confdefs.h"
> > +
> > + #if HAVE_DLFCN_H
> > +@@ -10688,10 +11343,10 @@ else
> > + /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> > +    correspondingly for the symbols needed.  */
> > + #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > +-void fnord () __attribute__((visibility("default")));
> > ++int fnord () __attribute__((visibility("default")));
> > + #endif
> > +
> > +-void fnord () { int i=3D42; }
> > ++int fnord () { return 42; }
> > + int main ()
> > + {
> > +   void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > +@@ -10750,7 +11405,7 @@ else
> > +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> > +   lt_status=3D$lt_dlunknown
> > +   cat > conftest.$ac_ext <<_LT_EOF
> > +-#line 10753 "configure"
> > ++#line $LINENO "configure"
> > + #include "confdefs.h"
> > +
> > + #if HAVE_DLFCN_H
> > +@@ -10794,10 +11449,10 @@ else
> > + /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> > +    correspondingly for the symbols needed.  */
> > + #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > +-void fnord () __attribute__((visibility("default")));
> > ++int fnord () __attribute__((visibility("default")));
> > + #endif
> > +
> > +-void fnord () { int i=3D42; }
> > ++int fnord () { return 42; }
> > + int main ()
> > + {
> > +   void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > +@@ -12267,13 +12922,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_s=
ingle_quote_subst"`'
> > + lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> > + lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> > + lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > ++lt_cv_to_host_file_cmd=3D'`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$=
delay_single_quote_subst"`'
> > ++lt_cv_to_tool_file_cmd=3D'`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$=
delay_single_quote_subst"`'
> > + reload_flag=3D'`$ECHO "$reload_flag" | $SED "$delay_single_quote_sub=
st"`'
> > + reload_cmds=3D'`$ECHO "$reload_cmds" | $SED "$delay_single_quote_sub=
st"`'
> > + OBJDUMP=3D'`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
> > + deplibs_check_method=3D'`$ECHO "$deplibs_check_method" | $SED "$dela=
y_single_quote_subst"`'
> > + file_magic_cmd=3D'`$ECHO "$file_magic_cmd" | $SED "$delay_single_quo=
te_subst"`'
> > ++file_magic_glob=3D'`$ECHO "$file_magic_glob" | $SED "$delay_single_q=
uote_subst"`'
> > ++want_nocaseglob=3D'`$ECHO "$want_nocaseglob" | $SED "$delay_single_q=
uote_subst"`'
> > ++DLLTOOL=3D'`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
> > ++sharedlib_from_linklib_cmd=3D'`$ECHO "$sharedlib_from_linklib_cmd" |=
 $SED "$delay_single_quote_subst"`'
> > + AR=3D'`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
> > + AR_FLAGS=3D'`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
> > ++archiver_list_spec=3D'`$ECHO "$archiver_list_spec" | $SED "$delay_si=
ngle_quote_subst"`'
> > + STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> > + RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> > + old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$dela=
y_single_quote_subst"`'
> > +@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt=
_cv_sys_global_symbol_pipe" | $SED "$de
> > + lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol=
_to_cdecl" | $SED "$delay_single_quote_subst"`'
> > + lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_glob=
al_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> > + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_=
cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > ++nm_file_list_spec=3D'`$ECHO "$nm_file_list_spec" | $SED "$delay_sing=
le_quote_subst"`'
> > ++lt_sysroot=3D'`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst=
"`'
> > + objdir=3D'`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
> > + MAGIC_CMD=3D'`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`=
'
> > + lt_prog_compiler_no_builtin_flag=3D'`$ECHO "$lt_prog_compiler_no_bui=
ltin_flag" | $SED "$delay_single_quote_subst"`'
> > +-lt_prog_compiler_wl=3D'`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_=
single_quote_subst"`'
> > + lt_prog_compiler_pic=3D'`$ECHO "$lt_prog_compiler_pic" | $SED "$dela=
y_single_quote_subst"`'
> > ++lt_prog_compiler_wl=3D'`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_=
single_quote_subst"`'
> > + lt_prog_compiler_static=3D'`$ECHO "$lt_prog_compiler_static" | $SED =
"$delay_single_quote_subst"`'
> > + lt_cv_prog_compiler_c_o=3D'`$ECHO "$lt_cv_prog_compiler_c_o" | $SED =
"$delay_single_quote_subst"`'
> > + need_locks=3D'`$ECHO "$need_locks" | $SED "$delay_single_quote_subst=
"`'
> > ++MANIFEST_TOOL=3D'`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote=
_subst"`'
> > + DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> > + NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> > + LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > +@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode=
_shlibpath_var" | $SED "$delay_single_q
> > + hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_si=
ngle_quote_subst"`'
> > + inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote=
_subst"`'
> > + link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single=
_quote_subst"`'
> > +-fix_srcfile_path=3D'`$ECHO "$fix_srcfile_path" | $SED "$delay_single=
_quote_subst"`'
> > + always_export_symbols=3D'`$ECHO "$always_export_symbols" | $SED "$de=
lay_single_quote_subst"`'
> > + export_symbols_cmds=3D'`$ECHO "$export_symbols_cmds" | $SED "$delay_=
single_quote_subst"`'
> > + exclude_expsyms=3D'`$ECHO "$exclude_expsyms" | $SED "$delay_single_q=
uote_subst"`'
> > + include_expsyms=3D'`$ECHO "$include_expsyms" | $SED "$delay_single_q=
uote_subst"`'
> > + prelink_cmds=3D'`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_s=
ubst"`'
> > ++postlink_cmds=3D'`$ECHO "$postlink_cmds" | $SED "$delay_single_quote=
_subst"`'
> > + file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quo=
te_subst"`'
> > + variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |=
 $SED "$delay_single_quote_subst"`'
> > + need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_q=
uote_subst"`'
> > +@@ -12388,8 +13053,13 @@ reload_flag \
> > + OBJDUMP \
> > + deplibs_check_method \
> > + file_magic_cmd \
> > ++file_magic_glob \
> > ++want_nocaseglob \
> > ++DLLTOOL \
> > ++sharedlib_from_linklib_cmd \
> > + AR \
> > + AR_FLAGS \
> > ++archiver_list_spec \
> > + STRIP \
> > + RANLIB \
> > + CC \
> > +@@ -12399,12 +13069,14 @@ lt_cv_sys_global_symbol_pipe \
> > + lt_cv_sys_global_symbol_to_cdecl \
> > + lt_cv_sys_global_symbol_to_c_name_address \
> > + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > ++nm_file_list_spec \
> > + lt_prog_compiler_no_builtin_flag \
> > +-lt_prog_compiler_wl \
> > + lt_prog_compiler_pic \
> > ++lt_prog_compiler_wl \
> > + lt_prog_compiler_static \
> > + lt_cv_prog_compiler_c_o \
> > + need_locks \
> > ++MANIFEST_TOOL \
> > + DSYMUTIL \
> > + NMEDIT \
> > + LIPO \
> > +@@ -12420,7 +13092,6 @@ no_undefined_flag \
> > + hardcode_libdir_flag_spec \
> > + hardcode_libdir_flag_spec_ld \
> > + hardcode_libdir_separator \
> > +-fix_srcfile_path \
> > + exclude_expsyms \
> > + include_expsyms \
> > + file_list_spec \
> > +@@ -12456,6 +13127,7 @@ module_cmds \
> > + module_expsym_cmds \
> > + export_symbols_cmds \
> > + prelink_cmds \
> > ++postlink_cmds \
> > + postinstall_cmds \
> > + postuninstall_cmds \
> > + finish_cmds \
> > +@@ -13054,7 +13726,8 @@ $as_echo X"$file" |
> > + # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> > + #
> > + #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 20=
05,
> > +-#                 2006, 2007, 2008, 2009 Free Software Foundation, I=
nc.
> > ++#                 2006, 2007, 2008, 2009, 2010 Free Software Foundat=
ion,
> > ++#                 Inc.
> > + #   Written by Gordon Matzigkeit, 1996
> > + #
> > + #   This file is part of GNU Libtool.
> > +@@ -13157,19 +13830,42 @@ SP2NL=3D$lt_lt_SP2NL
> > + # turn newlines into spaces.
> > + NL2SP=3D$lt_lt_NL2SP
> > +
> > ++# convert \$build file names to \$host format.
> > ++to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> > ++
> > ++# convert \$build files to toolchain format.
> > ++to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> > ++
> > + # An object symbol dumper.
> > + OBJDUMP=3D$lt_OBJDUMP
> > +
> > + # Method to check whether dependent libraries are shared objects.
> > + deplibs_check_method=3D$lt_deplibs_check_method
> > +
> > +-# Command to use when deplibs_check_method =3D=3D "file_magic".
> > ++# Command to use when deplibs_check_method =3D "file_magic".
> > + file_magic_cmd=3D$lt_file_magic_cmd
> > +
> > ++# How to find potential files when deplibs_check_method =3D "file_ma=
gic".
> > ++file_magic_glob=3D$lt_file_magic_glob
> > ++
> > ++# Find potential files using nocaseglob when deplibs_check_method =
=3D "file_magic".
> > ++want_nocaseglob=3D$lt_want_nocaseglob
> > ++
> > ++# DLL creation program.
> > ++DLLTOOL=3D$lt_DLLTOOL
> > ++
> > ++# Command to associate shared and link libraries.
> > ++sharedlib_from_linklib_cmd=3D$lt_sharedlib_from_linklib_cmd
> > ++
> > + # The archiver.
> > + AR=3D$lt_AR
> > ++
> > ++# Flags to create an archive.
> > + AR_FLAGS=3D$lt_AR_FLAGS
> > +
> > ++# How to feed a file listing to the archiver.
> > ++archiver_list_spec=3D$lt_archiver_list_spec
> > ++
> > + # A symbol stripping program.
> > + STRIP=3D$lt_STRIP
> > +
> > +@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address
> > + # Transform the output of nm in a C name address pair when lib prefi=
x is needed.
> > + global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sy=
mbol_to_c_name_address_lib_prefix
> > +
> > ++# Specify filename containing input files for \$NM.
> > ++nm_file_list_spec=3D$lt_nm_file_list_spec
> > ++
> > ++# The root where to search for dependent libraries,and in which our =
libraries should be installed.
> > ++lt_sysroot=3D$lt_sysroot
> > ++
> > + # The name of the directory that contains temporary libtool files.
> > + objdir=3D$objdir
> > +
> > +@@ -13208,6 +13910,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > + # Must we lock files when doing compilation?
> > + need_locks=3D$lt_need_locks
> > +
> > ++# Manifest tool.
> > ++MANIFEST_TOOL=3D$lt_MANIFEST_TOOL
> > ++
> > + # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> > + DSYMUTIL=3D$lt_DSYMUTIL
> > +
> > +@@ -13322,12 +14027,12 @@ with_gcc=3D$GCC
> > + # Compiler flag to turn off builtin functions.
> > + no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> > +
> > +-# How to pass a linker flag through the compiler.
> > +-wl=3D$lt_lt_prog_compiler_wl
> > +-
> > + # Additional compiler flags for building library objects.
> > + pic_flag=3D$lt_lt_prog_compiler_pic
> > +
> > ++# How to pass a linker flag through the compiler.
> > ++wl=3D$lt_lt_prog_compiler_wl
> > ++
> > + # Compiler flag to prevent dynamic linking.
> > + link_static_flag=3D$lt_lt_prog_compiler_static
> > +
> > +@@ -13414,9 +14119,6 @@ inherit_rpath=3D$inherit_rpath
> > + # Whether libtool must link a program against all its dependency lib=
raries.
> > + link_all_deplibs=3D$link_all_deplibs
> > +
> > +-# Fix the shell variable \$srcfile for the compiler.
> > +-fix_srcfile_path=3D$lt_fix_srcfile_path
> > +-
> > + # Set to "yes" if exported symbols are required.
> > + always_export_symbols=3D$always_export_symbols
> > +
> > +@@ -13432,6 +14134,9 @@ include_expsyms=3D$lt_include_expsyms
> > + # Commands necessary for linking programs (against libraries) with t=
emplates.
> > + prelink_cmds=3D$lt_prelink_cmds
> > +
> > ++# Commands necessary for finishing linking programs.
> > ++postlink_cmds=3D$lt_postlink_cmds
> > ++
> > + # Specify filename containing input files.
> > + file_list_spec=3D$lt_file_list_spec
> > +
> > +@@ -13464,210 +14169,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> > +   # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> > +   # is reportedly fixed, but why not run on old versions too?
> > +-  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "=
$cfgfile" \
> > +-    || (rm -f "$cfgfile"; exit 1)
> > +-
> > +-  case $xsi_shell in
> > +-  yes)
> > +-    cat << \_LT_EOF >> "$cfgfile"
> > +-
> > +-# func_dirname file append nondir_replacement
> > +-# Compute the dirname of FILE.  If nonempty, add APPEND to the resul=
t,
> > +-# otherwise set result to NONDIR_REPLACEMENT.
> > +-func_dirname ()
> > +-{
> > +-  case ${1} in
> > +-    */*) func_dirname_result=3D"${1%/*}${2}" ;;
> > +-    *  ) func_dirname_result=3D"${3}" ;;
> > +-  esac
> > +-}
> > +-
> > +-# func_basename file
> > +-func_basename ()
> > +-{
> > +-  func_basename_result=3D"${1##*/}"
> > +-}
> > +-
> > +-# func_dirname_and_basename file append nondir_replacement
> > +-# perform func_basename and func_dirname in a single function
> > +-# call:
> > +-#   dirname:  Compute the dirname of FILE.  If nonempty,
> > +-#             add APPEND to the result, otherwise set result
> > +-#             to NONDIR_REPLACEMENT.
> > +-#             value returned in "$func_dirname_result"
> > +-#   basename: Compute filename of FILE.
> > +-#             value retuned in "$func_basename_result"
> > +-# Implementation must be kept synchronized with func_dirname
> > +-# and func_basename. For efficiency, we do not delegate to
> > +-# those functions but instead duplicate the functionality here.
> > +-func_dirname_and_basename ()
> > +-{
> > +-  case ${1} in
> > +-    */*) func_dirname_result=3D"${1%/*}${2}" ;;
> > +-    *  ) func_dirname_result=3D"${3}" ;;
> > +-  esac
> > +-  func_basename_result=3D"${1##*/}"
> > +-}
> > +-
> > +-# func_stripname prefix suffix name
> > +-# strip PREFIX and SUFFIX off of NAME.
> > +-# PREFIX and SUFFIX must not contain globbing or regex special
> > +-# characters, hashes, percent signs, but SUFFIX may contain a leadin=
g
> > +-# dot (in which case that matches only a dot).
> > +-func_stripname ()
> > +-{
> > +-  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
> > +-  # positional parameters, so assign one to ordinary parameter first=
.
> > +-  func_stripname_result=3D${3}
> > +-  func_stripname_result=3D${func_stripname_result#"${1}"}
> > +-  func_stripname_result=3D${func_stripname_result%"${2}"}
> > +-}
> > +-
> > +-# func_opt_split
> > +-func_opt_split ()
> > +-{
> > +-  func_opt_split_opt=3D${1%%=3D*}
> > +-  func_opt_split_arg=3D${1#*=3D}
> > +-}
> > +-
> > +-# func_lo2o object
> > +-func_lo2o ()
> > +-{
> > +-  case ${1} in
> > +-    *.lo) func_lo2o_result=3D${1%.lo}.${objext} ;;
> > +-    *)    func_lo2o_result=3D${1} ;;
> > +-  esac
> > +-}
> > +-
> > +-# func_xform libobj-or-source
> > +-func_xform ()
> > +-{
> > +-  func_xform_result=3D${1%.*}.lo
> > +-}
> > +-
> > +-# func_arith arithmetic-term...
> > +-func_arith ()
> > +-{
> > +-  func_arith_result=3D$(( $* ))
> > +-}
> > +-
> > +-# func_len string
> > +-# STRING may not start with a hyphen.
> > +-func_len ()
> > +-{
> > +-  func_len_result=3D${#1}
> > +-}
> > +-
> > +-_LT_EOF
> > +-    ;;
> > +-  *) # Bourne compatible functions.
> > +-    cat << \_LT_EOF >> "$cfgfile"
> > +-
> > +-# func_dirname file append nondir_replacement
> > +-# Compute the dirname of FILE.  If nonempty, add APPEND to the resul=
t,
> > +-# otherwise set result to NONDIR_REPLACEMENT.
> > +-func_dirname ()
> > +-{
> > +-  # Extract subdirectory from the argument.
> > +-  func_dirname_result=3D`$ECHO "${1}" | $SED "$dirname"`
> > +-  if test "X$func_dirname_result" =3D "X${1}"; then
> > +-    func_dirname_result=3D"${3}"
> > +-  else
> > +-    func_dirname_result=3D"$func_dirname_result${2}"
> > +-  fi
> > +-}
> > +-
> > +-# func_basename file
> > +-func_basename ()
> > +-{
> > +-  func_basename_result=3D`$ECHO "${1}" | $SED "$basename"`
> > +-}
> > +-
> > +-
> > +-# func_stripname prefix suffix name
> > +-# strip PREFIX and SUFFIX off of NAME.
> > +-# PREFIX and SUFFIX must not contain globbing or regex special
> > +-# characters, hashes, percent signs, but SUFFIX may contain a leadin=
g
> > +-# dot (in which case that matches only a dot).
> > +-# func_strip_suffix prefix name
> > +-func_stripname ()
> > +-{
> > +-  case ${2} in
> > +-    .*) func_stripname_result=3D`$ECHO "${3}" | $SED "s%^${1}%%; s%\=
\\\${2}\$%%"`;;
> > +-    *)  func_stripname_result=3D`$ECHO "${3}" | $SED "s%^${1}%%; s%$=
{2}\$%%"`;;
> > +-  esac
> > +-}
> > +-
> > +-# sed scripts:
> > +-my_sed_long_opt=3D'1s/^\(-[^=3D]*\)=3D.*/\1/;q'
> > +-my_sed_long_arg=3D'1s/^-[^=3D]*=3D//'
> > +-
> > +-# func_opt_split
> > +-func_opt_split ()
> > +-{
> > +-  func_opt_split_opt=3D`$ECHO "${1}" | $SED "$my_sed_long_opt"`
> > +-  func_opt_split_arg=3D`$ECHO "${1}" | $SED "$my_sed_long_arg"`
> > +-}
> > +-
> > +-# func_lo2o object
> > +-func_lo2o ()
> > +-{
> > +-  func_lo2o_result=3D`$ECHO "${1}" | $SED "$lo2o"`
> > +-}
> > +-
> > +-# func_xform libobj-or-source
> > +-func_xform ()
> > +-{
> > +-  func_xform_result=3D`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
> > +-}
> > +-
> > +-# func_arith arithmetic-term...
> > +-func_arith ()
> > +-{
> > +-  func_arith_result=3D`expr "$@"`
> > +-}
> > +-
> > +-# func_len string
> > +-# STRING may not start with a hyphen.
> > +-func_len ()
> > +-{
> > +-  func_len_result=3D`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_l=
en`
> > +-}
> > +-
> > +-_LT_EOF
> > +-esac
> > +-
> > +-case $lt_shell_append in
> > +-  yes)
> > +-    cat << \_LT_EOF >> "$cfgfile"
> > +-
> > +-# func_append var value
> > +-# Append VALUE to the end of shell variable VAR.
> > +-func_append ()
> > +-{
> > +-  eval "$1+=3D\$2"
> > +-}
> > +-_LT_EOF
> > +-    ;;
> > +-  *)
> > +-    cat << \_LT_EOF >> "$cfgfile"
> > +-
> > +-# func_append var value
> > +-# Append VALUE to the end of shell variable VAR.
> > +-func_append ()
> > +-{
> > +-  eval "$1=3D\$$1\$2"
> > +-}
> > +-
> > +-_LT_EOF
> > +-    ;;
> > +-  esac
> > +-
> > +-
> > +-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain"=
 >> "$cfgfile" \
> > +-    || (rm -f "$cfgfile"; exit 1)
> > +-
> > +-  mv -f "$cfgfile" "$ofile" ||
> > ++  sed '$q' "$ltmain" >> "$cfgfile" \
> > ++     || (rm -f "$cfgfile"; exit 1)
> > ++
> > ++  if test x"$xsi_shell" =3D xyes; then
> > ++  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
> > ++func_dirname ()\
> > ++{\
> > ++\    case ${1} in\
> > ++\      */*) func_dirname_result=3D"${1%/*}${2}" ;;\
> > ++\      *  ) func_dirname_result=3D"${3}" ;;\
> > ++\    esac\
> > ++} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfil=
e.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_basename ()$/,/^} # func_basename /c\
> > ++func_basename ()\
> > ++{\
> > ++\    func_basename_result=3D"${1##*/}"\
> > ++} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfi=
le.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_ba=
sename /c\
> > ++func_dirname_and_basename ()\
> > ++{\
> > ++\    case ${1} in\
> > ++\      */*) func_dirname_result=3D"${1%/*}${2}" ;;\
> > ++\      *  ) func_dirname_result=3D"${3}" ;;\
> > ++\    esac\
> > ++\    func_basename_result=3D"${1##*/}"\
> > ++} # Extended-shell func_dirname_and_basename implementation' "$cfgfi=
le" > $cfgfile.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
> > ++func_stripname ()\
> > ++{\
> > ++\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y ar=
e\
> > ++\    # positional parameters, so assign one to ordinary parameter fi=
rst.\
> > ++\    func_stripname_result=3D${3}\
> > ++\    func_stripname_result=3D${func_stripname_result#"${1}"}\
> > ++\    func_stripname_result=3D${func_stripname_result%"${2}"}\
> > ++} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgf=
ile.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
> > ++func_split_long_opt ()\
> > ++{\
> > ++\    func_split_long_opt_name=3D${1%%=3D*}\
> > ++\    func_split_long_opt_arg=3D${1#*=3D}\
> > ++} # Extended-shell func_split_long_opt implementation' "$cfgfile" > =
$cfgfile.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
> > ++func_split_short_opt ()\
> > ++{\
> > ++\    func_split_short_opt_arg=3D${1#??}\
> > ++\    func_split_short_opt_name=3D${1%"$func_split_short_opt_arg"}\
> > ++} # Extended-shell func_split_short_opt implementation' "$cfgfile" >=
 $cfgfile.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
> > ++func_lo2o ()\
> > ++{\
> > ++\    case ${1} in\
> > ++\      *.lo) func_lo2o_result=3D${1%.lo}.${objext} ;;\
> > ++\      *)    func_lo2o_result=3D${1} ;;\
> > ++\    esac\
> > ++} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.t=
mp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_xform ()$/,/^} # func_xform /c\
> > ++func_xform ()\
> > ++{\
> > ++    func_xform_result=3D${1%.*}.lo\
> > ++} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.=
tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_arith ()$/,/^} # func_arith /c\
> > ++func_arith ()\
> > ++{\
> > ++    func_arith_result=3D$(( $* ))\
> > ++} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.=
tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_len ()$/,/^} # func_len /c\
> > ++func_len ()\
> > ++{\
> > ++    func_len_result=3D${#1}\
> > ++} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tm=
p \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++fi
> > ++
> > ++if test x"$lt_shell_append" =3D xyes; then
> > ++  sed -e '/^func_append ()$/,/^} # func_append /c\
> > ++func_append ()\
> > ++{\
> > ++    eval "${1}+=3D\\${2}"\
> > ++} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile=
.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
> > ++func_append_quoted ()\
> > ++{\
> > ++\    func_quote_for_eval "${2}"\
> > ++\    eval "${1}+=3D\\\\ \\$func_quote_for_eval_result"\
> > ++} # Extended-shell func_append_quoted implementation' "$cfgfile" > $=
cfgfile.tmp \
> > ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$=
cfgfile.tmp")
> > ++test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++
> > ++
> > ++  # Save a `func_append' function call where possible by direct use =
of '+=3D'
> > ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+=3D"%g' $cfgfile > =
$cfgfile.tmp \
> > ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f =
"$cfgfile.tmp")
> > ++  test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++else
> > ++  # Save a `func_append' function call even when '+=3D' is not avail=
able
> > ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1=3D"$\1%g' $cfgfile =
> $cfgfile.tmp \
> > ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> > ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f =
"$cfgfile.tmp")
> > ++  test 0 -eq $? || _lt_function_replace_fail=3D:
> > ++fi
> > ++
> > ++if test x"$_lt_function_replace_fail" =3D x":"; then
> > ++  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substi=
tute extended shell functions in $ofile" >&5
> > ++$as_echo "$as_me: WARNING: Unable to substitute extended shell funct=
ions in $ofile" >&2;}
> > ++fi
> > ++
> > ++
> > ++   mv -f "$cfgfile" "$ofile" ||
> > +     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> > +   chmod +x "$ofile"
> > +
> >  --
> > -2.26.0
> > +2.28.0
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-inco=
rrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binuti=
ls/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> > deleted file mode 100644
> > index 463de80638..0000000000
> > --- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-a=
ssembling-for-ppc-wait-mnemonic.patch
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -From ef4ad1cb9ff1b5a871ffa792a71b3ad6d14eb3dc Mon Sep 17 00:00:00 200=
1
> > -From: Zhenhua Luo <zhenhua.luo@nxp.com>
> > -Date: Sat, 11 Jun 2016 22:08:29 -0500
> > -Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> > -
> > -Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> > -
> > -Upstream-Status: Pending
> > ----
> > - opcodes/ppc-opc.c | 3 +--
> > - 1 file changed, 1 insertion(+), 2 deletions(-)
> > -
> > -diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> > -index 7ef91d819b..145953d3c4 100644
> > ---- a/opcodes/ppc-opc.c
> > -+++ b/opcodes/ppc-opc.c
> > -@@ -5709,7 +5709,6 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
> > - {"ldepx", X(31,29), X_MASK,  E500MC|PPCA2, 0, {RT, RA0, RB}},
> > -
> > - {"waitasec", X(31,30),      XRTRARB_MASK, POWER8, POWER9, {0}},
> > --{"wait", X(31,30), XWC_MASK,    POWER9, 0, {WC}},
> > -
> > - {"lwepx", X(31,31), X_MASK,  E500MC|PPCA2, 0, {RT, RA0, RB}},
> > -
> > -@@ -5763,7 +5762,7 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
> > -
> > - {"waitrsv", X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0, {0}},
> > - {"waitimpl", X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0, {0}},
> > --{"wait", X(31,62), XWC_MASK,    E500MC|PPCA2, 0, {WC}},
> > -+{"wait", X(31,62), XWC_MASK,    E500MC|PPCA2|POWER9, 0, {WC}},
> > -
> > - {"dcbstep", XRT(31,63,0), XRT_MASK,    E500MC|PPCA2, 0, {RA0, RB}},
> > -
> > diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in=
-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/bin=
utils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> > similarity index 89%
> > rename from meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-=
libtool-when-sysroot-is-enabled.patch
> > rename to meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-li=
btool-when-sysroot-is-enabled.patch
> > index f4f1a068cb..69a2383782 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtoo=
l-when-sysroot-is-enabled.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtoo=
l-when-sysroot-is-enabled.patch
> > @@ -1,7 +1,7 @@
> > -From 70f3f2d9e912ea777fa113e02cdbc3465a66e40d Mon Sep 17 00:00:00 200=
1
> > +From f791a5d84475c02356f16679b7f4ee9c9c3408aa Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:42:38 +0000
> > -Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> > +Subject: [PATCH 14/17] Fix rpath in libtool when sysroot is enabled
> >
> >  Enabling sysroot support in libtool exposed a bug where the final
> >  library had an RPATH encoded into it which still pointed to the
> > @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> >  diff --git a/ltmain.sh b/ltmain.sh
> > -index 70e856e065..11ee684ccc 100644
> > +index 70e856e0659..11ee684cccf 100644
> >  --- a/ltmain.sh
> >  +++ b/ltmain.sh
> >  @@ -8035,9 +8035,11 @@ EOF
> > @@ -47,3 +47,6 @@ index 70e856e065..11ee684ccc 100644
> >    if test -n "$hardcode_libdir_separator"; then
> >      if test -z "$hardcode_libdirs"; then
> >        hardcode_libdirs=3D"$libdir"
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE=
-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-=
with-OE-libtool-changes.patch
> > index a794719bd2..e848f146b0 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtoo=
l-changes.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtoo=
l-changes.patch
> > @@ -1,7 +1,7 @@
> > -From 392d474a72d37b669f53ab9f0fa913b958af93f6 Mon Sep 17 00:00:00 200=
1
> > +From e087f96e219d47c4d2244c3f32397e56d41bfdec Mon Sep 17 00:00:00 200=
1
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Mon, 6 Mar 2017 23:33:27 -0800
> > -Subject: [PATCH] sync with OE libtool changes
> > +Subject: [PATCH 15/17] sync with OE libtool changes
> >
> >  Apply these patches from our libtool patches as not only are redundan=
t RPATHs a
> >  waste of space but they can cause incorrect linking when native packa=
ges are
> > @@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 28 insertions(+), 6 deletions(-)
> >
> >  diff --git a/ltmain.sh b/ltmain.sh
> > -index 11ee684ccc..3b19ac1532 100644
> > +index 11ee684cccf..3b19ac15328 100644
> >  --- a/ltmain.sh
> >  +++ b/ltmain.sh
> >  @@ -8053,8 +8053,16 @@ EOF
> > @@ -84,3 +84,6 @@ index 11ee684ccc..3b19ac1532 100644
> >    fi
> >   elif test -n "$runpath_var"; then
> >    case "$finalize_perm_rpath " in
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0016-Check-for-cl=
ang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binu=
tils/0016-Check-for-clang-before-checking-gcc-version.patch
> > index c694b42dc3..400b79823f 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-bef=
ore-checking-gcc-version.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-bef=
ore-checking-gcc-version.patch
> > @@ -1,7 +1,7 @@
> > -From 67590a44c1256491fa674426f0170d5d05377d05 Mon Sep 17 00:00:00 200=
1
> > +From ae5a7d622dc9addb2ca9fc85889c45964c025a9c Mon Sep 17 00:00:00 200=
1
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 15 Apr 2020 14:17:20 -0700
> > -Subject: [PATCH 16/16] Check for clang before checking gcc version
> > +Subject: [PATCH 16/17] Check for clang before checking gcc version
> >
> >  Clang advertises itself to be gcc 4.2.1, so when compiling this test
> >  here fails since gcc < 4.4.5 did not support -static-libstdc++ but th=
ats
> > @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure b/configure
> > -index 590b03c2da0..46f116fdb54 100755
> > +index 6782f8b6ab8..72f5766b363 100755
> >  --- a/configure
> >  +++ b/configure
> > -@@ -5140,7 +5140,7 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu
> > +@@ -5143,7 +5143,7 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu
> >   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> >   /* end confdefs.h.  */
> >
> > @@ -31,10 +31,10 @@ index 590b03c2da0..46f116fdb54 100755
> >   #endif
> >   int main() {}
> >  diff --git a/configure.ac b/configure.ac
> > -index d3f85e6f5d5..c0eb1343121 100644
> > +index 55beb1dea46..3f9e613e2d9 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1309,7 +1309,7 @@ if test "$GCC" =3D yes; then
> > +@@ -1312,7 +1312,7 @@ if test "$GCC" =3D yes; then
> >     AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-lib=
gcc])
> >     AC_LANG_PUSH(C++)
> >     AC_LINK_IFELSE([AC_LANG_SOURCE([
> > @@ -44,5 +44,5 @@ index d3f85e6f5d5..c0eb1343121 100644
> >   #endif
> >   int main() {}])],
> >  --
> > -2.26.1
> > +2.28.0
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-=
R_RISCV_NONE-reloc-in-the-extra-unused-r.patch b/meta/recipes-devtools/binu=
tils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.pat=
ch
> > new file mode 100644
> > index 0000000000..99bb38eb67
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV=
_NONE-reloc-in-the-extra-unused-r.patch
> > @@ -0,0 +1,42 @@
> > +From 5b61c40c34c3db699de723c3128ba704501ccdac Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 20 Apr 2020 14:23:57 -0700
> > +Subject: [PATCH 17/17] Do not emit R_RISCV_NONE reloc in the extra un=
used
> > + reloc space.
> > +
> > +Redundant R_RISCV_DTPMOD* R_RISCV_DTPREL* results from Global Dynamic=
 -> Local Exec relaxation
> > +which generates
> > +
> > +Patch from https://sourceware.org/bugzilla/show_bug.cgi?id=3D24673
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + bfd/elfnn-riscv.c | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/bfd/elfnn-riscv.c b/bfd/elfnn-riscv.c
> > +index a5fa415309a..1e582052aa9 100644
> > +--- a/bfd/elfnn-riscv.c
> > ++++ b/bfd/elfnn-riscv.c
> > +@@ -2090,13 +2090,14 @@ riscv_elf_relocate_section (bfd *output_bfd,
> > +  pic =3D bfd_link_pic (info);
> > +
> > +  if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (dyn, pic, h)
> > +-      && (!pic || !SYMBOL_REFERENCES_LOCAL (info, h)))
> > ++      && (bfd_link_dll (info)
> > ++  || !SYMBOL_REFERENCES_LOCAL (info, h)))
> > +    indx =3D h->dynindx;
> > + }
> > +
> > +      /* The GOT entries have not been initialized yet.  Do it
> > + now, and emit any relocations.  */
> > +-      if ((bfd_link_pic (info) || indx !=3D 0)
> > ++      if ((bfd_link_dll (info) || indx !=3D 0)
> > +  && (h =3D=3D NULL
> > +      || ELF_ST_VISIBILITY (h->other) =3D=3D STV_DEFAULT
> > +      || h->root.type !=3D bfd_link_hash_undefweak))
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-dro=
p-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binu=
tils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.pat=
ch
> > deleted file mode 100644
> > index be59f9dca0..0000000000
> > --- a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redun=
dant-program_name-definition-fno-.patch
> > +++ /dev/null
> > @@ -1,61 +0,0 @@
> > -From 57a3e055605b28a9449b1b27eda7125737c42b00 Mon Sep 17 00:00:00 200=
1
> > -From: Sergei Trofimovich <siarheit@google.com>
> > -Date: Sat, 1 Feb 2020 23:16:11 +0000
> > -Subject: [PATCH] binutils: drop redundant 'program_name' definition
> > - (-fno-common)
> > -
> > - * coffdump.c (program_name): Drop redundant definition.
> > - * srconv.c (program_name): Likewise
> > - * sysdump.c (program_name): Likewise
> > -
> > -Upstream-Status: Backport (commit 0b398d69ac)
> > -Signed-off-by: Sergei Trofimovich <siarheit@google.com>
> > -Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ----
> > - binutils/coffdump.c | 2 --
> > - binutils/srconv.c   | 2 --
> > - binutils/sysdump.c  | 2 --
> > - 3 files changed, 6 deletions(-)
> > -
> > -diff --git a/binutils/coffdump.c b/binutils/coffdump.c
> > -index 531a4e46c3..336da57ca2 100644
> > ---- a/binutils/coffdump.c
> > -+++ b/binutils/coffdump.c
> > -@@ -456,8 +456,6 @@ coff_dump (struct coff_ofile *ptr)
> > -     dump_coff_section (ptr->sections + i);
> > - }
> > -
> > --char * program_name;
> > --
> > - static void
> > - show_usage (FILE *file, int status)
> > - {
> > -diff --git a/binutils/srconv.c b/binutils/srconv.c
> > -index 5742b16759..f071794f0a 100644
> > ---- a/binutils/srconv.c
> > -+++ b/binutils/srconv.c
> > -@@ -1687,8 +1687,6 @@ prescan (struct coff_ofile *otree)
> > -     }
> > - }
> > -
> > --char *program_name;
> > --
> > - ATTRIBUTE_NORETURN static void
> > - show_usage (FILE *ffile, int status)
> > - {
> > -diff --git a/binutils/sysdump.c b/binutils/sysdump.c
> > -index d433e71ed9..7eebbd61d3 100644
> > ---- a/binutils/sysdump.c
> > -+++ b/binutils/sysdump.c
> > -@@ -633,8 +633,6 @@ module (void)
> > -     }
> > - }
> > -
> > --char *program_name;
> > --
> > - ATTRIBUTE_NORETURN static void
> > - show_usage (FILE *ffile, int status)
> > - {
> > ---
> > -2.26.2
> > -
> > diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.pat=
ch b/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
> > deleted file mode 100644
> > index 53e3caf445..0000000000
> > --- a/meta/recipes-devtools/binutils/binutils/CVE-2020-0551.patch
> > +++ /dev/null
> > @@ -1,549 +0,0 @@
> > -From ae531041c7c5956672342f89c486a011c84f027f Mon Sep 17 00:00:00 200=
1
> > -From: "H.J. Lu" <hjl.tools@gmail.com>
> > -Date: Wed, 11 Mar 2020 09:46:19 -0700
> > -Subject: [PATCH 1/1] i386: Generate lfence with load/indirect branch/=
ret
> > - [CVE-2020-0551]
> > -
> > -Add 3 command-line options to generate lfence for load, indirect near
> > -branch and ret to help mitigate:
> > -
> > -https://www.intel.com/content/www/us/en/security-center/advisory/inte=
l-sa-00334.html
> > -http://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2020-0551
> > -
> > -1. -mlfence-after-load=3D[no|yes]:
> > -  -mlfence-after-load=3Dyes generates lfence after load instructions.
> > -2. -mlfence-before-indirect-branch=3D[none|all|memory|register]:
> > -  a. -mlfence-before-indirect-branch=3Dall generates lfence before in=
direct
> > -  near branches via register and a warning before indirect near branc=
hes
> > -  via memory.
> > -  b. -mlfence-before-indirect-branch=3Dmemory issue a warning before
> > -  indirect near branches via memory.
> > -  c. -mlfence-before-indirect-branch=3Dregister generates lfence befo=
re
> > -  indirect near branches via register.
> > -Note that lfence won't be generated before indirect near branches via
> > -register with -mlfence-after-load=3Dyes since lfence will be generate=
d
> > -after loading branch target register.
> > -3. -mlfence-before-ret=3D[none|or|not]
> > -  a. -mlfence-before-ret=3Dor generates or with lfence before ret.
> > -  b. -mlfence-before-ret=3Dnot generates not with lfence before ret.
> > -
> > -A warning will be issued and lfence won't be generated before indirec=
t
> > -near branch and ret if the previous item is a prefix or a constant
> > -directive, which may be used to hardcode an instruction, since there
> > -is no clear instruction boundary.
> > -
> > - * config/tc-i386.c (lfence_after_load): New.
> > - (lfence_before_indirect_branch_kind): New.
> > - (lfence_before_indirect_branch): New.
> > - (lfence_before_ret_kind): New.
> > - (lfence_before_ret): New.
> > - (last_insn): New.
> > - (load_insn_p): New.
> > - (insert_lfence_after): New.
> > - (insert_lfence_before): New.
> > - (md_assemble): Call insert_lfence_before and insert_lfence_after.
> > - Set last_insn.
> > - (OPTION_MLFENCE_AFTER_LOAD): New.
> > - (OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH): New.
> > - (OPTION_MLFENCE_BEFORE_RET): New.
> > - (md_longopts): Add -mlfence-after-load=3D,
> > - -mlfence-before-indirect-branch=3D and -mlfence-before-ret=3D.
> > - (md_parse_option): Handle -mlfence-after-load=3D,
> > - -mlfence-before-indirect-branch=3D and -mlfence-before-ret=3D.
> > - (md_show_usage): Display -mlfence-after-load=3D,
> > - -mlfence-before-indirect-branch=3D and -mlfence-before-ret=3D.
> > - (i386_cons_align): New.
> > - * config/tc-i386.h (i386_cons_align): New.
> > - (md_cons_align): New.
> > - * doc/c-i386.texi: Document -mlfence-after-load=3D,
> > - -mlfence-before-indirect-branch=3D and -mlfence-before-ret=3D.
> > -
> > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > -Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommit;h=3Dae531041c7c5956672342f89c486a011c84f027f]
> > -CVE: CVE-2020-0551
> > ----
> > -diff --git a/gas/config/tc-i386.c b/gas/config/tc-i386.c
> > -index b020f39c863..09063f784b7 100644
> > ---- a/gas/config/tc-i386.c
> > -+++ b/gas/config/tc-i386.c
> > -@@ -629,7 +629,29 @@ static int omit_lock_prefix =3D 0;
> > -    "lock addl $0, (%{re}sp)".  */
> > - static int avoid_fence =3D 0;
> > -
> > --/* Type of the previous instruction.  */
> > -+/* 1 if lfence should be inserted after every load.  */
> > -+static int lfence_after_load =3D 0;
> > -+
> > -+/* Non-zero if lfence should be inserted before indirect branch.  */
> > -+static enum lfence_before_indirect_branch_kind
> > -+  {
> > -+    lfence_branch_none =3D 0,
> > -+    lfence_branch_register,
> > -+    lfence_branch_memory,
> > -+    lfence_branch_all
> > -+  }
> > -+lfence_before_indirect_branch;
> > -+
> > -+/* Non-zero if lfence should be inserted before ret.  */
> > -+static enum lfence_before_ret_kind
> > -+  {
> > -+    lfence_before_ret_none =3D 0,
> > -+    lfence_before_ret_not,
> > -+    lfence_before_ret_or
> > -+  }
> > -+lfence_before_ret;
> > -+
> > -+/* Types of previous instruction is .byte or prefix.  */
> > - static struct
> > -   {
> > -     segT seg;
> > -@@ -4311,6 +4333,283 @@ optimize_encoding (void)
> > -     }
> > - }
> > -
> > -+/* Return non-zero for load instruction.  */
> > -+
> > -+static int
> > -+load_insn_p (void)
> > -+{
> > -+  unsigned int dest;
> > -+  int any_vex_p =3D is_any_vex_encoding (&i.tm);
> > -+  unsigned int base_opcode =3D i.tm.base_opcode | 1;
> > -+
> > -+  if (!any_vex_p)
> > -+    {
> > -+      /* lea  */
> > -+      if (i.tm.base_opcode =3D=3D 0x8d)
> > -+ return 0;
> > -+
> > -+      /* pop  */
> > -+      if ((i.tm.base_opcode & ~7) =3D=3D 0x58
> > -+  || (i.tm.base_opcode =3D=3D 0x8f && i.tm.extension_opcode =3D=3D 0=
))
> > -+ return 1;
> > -+
> > -+      /* movs, cmps, lods, scas.  */
> > -+      if ((i.tm.base_opcode | 0xb) =3D=3D 0xaf)
> > -+ return 1;
> > -+
> > -+      /* outs */
> > -+      if (base_opcode =3D=3D 0x6f)
> > -+ return 1;
> > -+    }
> > -+
> > -+  /* No memory operand.  */
> > -+  if (!i.mem_operands)
> > -+    return 0;
> > -+
> > -+  if (any_vex_p)
> > -+    {
> > -+      /* vldmxcsr.  */
> > -+      if (i.tm.base_opcode =3D=3D 0xae
> > -+  && i.tm.opcode_modifier.vex
> > -+  && i.tm.opcode_modifier.vexopcode =3D=3D VEX0F
> > -+  && i.tm.extension_opcode =3D=3D 2)
> > -+ return 1;
> > -+    }
> > -+  else
> > -+    {
> > -+      /* test, not, neg, mul, imul, div, idiv.  */
> > -+      if ((i.tm.base_opcode =3D=3D 0xf6 || i.tm.base_opcode =3D=3D 0=
xf7)
> > -+  && i.tm.extension_opcode !=3D 1)
> > -+ return 1;
> > -+
> > -+      /* inc, dec.  */
> > -+      if (base_opcode =3D=3D 0xff && i.tm.extension_opcode <=3D 1)
> > -+ return 1;
> > -+
> > -+      /* add, or, adc, sbb, and, sub, xor, cmp.  */
> > -+      if (i.tm.base_opcode >=3D 0x80 && i.tm.base_opcode <=3D 0x83)
> > -+ return 1;
> > -+
> > -+      /* bt, bts, btr, btc.  */
> > -+      if (i.tm.base_opcode =3D=3D 0xfba
> > -+  && (i.tm.extension_opcode >=3D 4 && i.tm.extension_opcode <=3D 7))
> > -+ return 1;
> > -+
> > -+      /* rol, ror, rcl, rcr, shl/sal, shr, sar. */
> > -+      if ((base_opcode =3D=3D 0xc1
> > -+   || (i.tm.base_opcode >=3D 0xd0 && i.tm.base_opcode <=3D 0xd3))
> > -+  && i.tm.extension_opcode !=3D 6)
> > -+ return 1;
> > -+
> > -+      /* cmpxchg8b, cmpxchg16b, xrstors.  */
> > -+      if (i.tm.base_opcode =3D=3D 0xfc7
> > -+  && (i.tm.extension_opcode =3D=3D 1 || i.tm.extension_opcode =3D=3D=
 3))
> > -+ return 1;
> > -+
> > -+      /* fxrstor, ldmxcsr, xrstor.  */
> > -+      if (i.tm.base_opcode =3D=3D 0xfae
> > -+  && (i.tm.extension_opcode =3D=3D 1
> > -+      || i.tm.extension_opcode =3D=3D 2
> > -+      || i.tm.extension_opcode =3D=3D 5))
> > -+ return 1;
> > -+
> > -+      /* lgdt, lidt, lmsw.  */
> > -+      if (i.tm.base_opcode =3D=3D 0xf01
> > -+  && (i.tm.extension_opcode =3D=3D 2
> > -+      || i.tm.extension_opcode =3D=3D 3
> > -+      || i.tm.extension_opcode =3D=3D 6))
> > -+ return 1;
> > -+
> > -+      /* vmptrld */
> > -+      if (i.tm.base_opcode =3D=3D 0xfc7
> > -+  && i.tm.extension_opcode =3D=3D 6)
> > -+ return 1;
> > -+
> > -+      /* Check for x87 instructions.  */
> > -+      if (i.tm.base_opcode >=3D 0xd8 && i.tm.base_opcode <=3D 0xdf)
> > -+ {
> > -+  /* Skip fst, fstp, fstenv, fstcw.  */
> > -+  if (i.tm.base_opcode =3D=3D 0xd9
> > -+      && (i.tm.extension_opcode =3D=3D 2
> > -+  || i.tm.extension_opcode =3D=3D 3
> > -+  || i.tm.extension_opcode =3D=3D 6
> > -+  || i.tm.extension_opcode =3D=3D 7))
> > -+    return 0;
> > -+
> > -+  /* Skip fisttp, fist, fistp, fstp.  */
> > -+  if (i.tm.base_opcode =3D=3D 0xdb
> > -+      && (i.tm.extension_opcode =3D=3D 1
> > -+  || i.tm.extension_opcode =3D=3D 2
> > -+  || i.tm.extension_opcode =3D=3D 3
> > -+  || i.tm.extension_opcode =3D=3D 7))
> > -+    return 0;
> > -+
> > -+  /* Skip fisttp, fst, fstp, fsave, fstsw.  */
> > -+  if (i.tm.base_opcode =3D=3D 0xdd
> > -+      && (i.tm.extension_opcode =3D=3D 1
> > -+  || i.tm.extension_opcode =3D=3D 2
> > -+  || i.tm.extension_opcode =3D=3D 3
> > -+  || i.tm.extension_opcode =3D=3D 6
> > -+  || i.tm.extension_opcode =3D=3D 7))
> > -+    return 0;
> > -+
> > -+  /* Skip fisttp, fist, fistp, fbstp, fistp.  */
> > -+  if (i.tm.base_opcode =3D=3D 0xdf
> > -+      && (i.tm.extension_opcode =3D=3D 1
> > -+  || i.tm.extension_opcode =3D=3D 2
> > -+  || i.tm.extension_opcode =3D=3D 3
> > -+  || i.tm.extension_opcode =3D=3D 6
> > -+  || i.tm.extension_opcode =3D=3D 7))
> > -+    return 0;
> > -+
> > -+  return 1;
> > -+ }
> > -+    }
> > -+
> > -+  dest =3D i.operands - 1;
> > -+
> > -+  /* Check fake imm8 operand and 3 source operands.  */
> > -+  if ((i.tm.opcode_modifier.immext
> > -+       || i.tm.opcode_modifier.vexsources =3D=3D VEX3SOURCES)
> > -+      && i.types[dest].bitfield.imm8)
> > -+    dest--;
> > -+
> > -+  /* add, or, adc, sbb, and, sub, xor, cmp, test, xchg, xadd  */
> > -+  if (!any_vex_p
> > -+      && (base_opcode =3D=3D 0x1
> > -+  || base_opcode =3D=3D 0x9
> > -+  || base_opcode =3D=3D 0x11
> > -+  || base_opcode =3D=3D 0x19
> > -+  || base_opcode =3D=3D 0x21
> > -+  || base_opcode =3D=3D 0x29
> > -+  || base_opcode =3D=3D 0x31
> > -+  || base_opcode =3D=3D 0x39
> > -+  || (i.tm.base_opcode >=3D 0x84 && i.tm.base_opcode <=3D 0x87)
> > -+  || base_opcode =3D=3D 0xfc1))
> > -+    return 1;
> > -+
> > -+  /* Check for load instruction.  */
> > -+  return (i.types[dest].bitfield.class !=3D ClassNone
> > -+  || i.types[dest].bitfield.instance =3D=3D Accum);
> > -+}
> > -+
> > -+/* Output lfence, 0xfaee8, after instruction.  */
> > -+
> > -+static void
> > -+insert_lfence_after (void)
> > -+{
> > -+  if (lfence_after_load && load_insn_p ())
> > -+    {
> > -+      char *p =3D frag_more (3);
> > -+      *p++ =3D 0xf;
> > -+      *p++ =3D 0xae;
> > -+      *p =3D 0xe8;
> > -+    }
> > -+}
> > -+
> > -+/* Output lfence, 0xfaee8, before instruction.  */
> > -+
> > -+static void
> > -+insert_lfence_before (void)
> > -+{
> > -+  char *p;
> > -+
> > -+  if (is_any_vex_encoding (&i.tm))
> > -+    return;
> > -+
> > -+  if (i.tm.base_opcode =3D=3D 0xff
> > -+      && (i.tm.extension_opcode =3D=3D 2 || i.tm.extension_opcode =
=3D=3D 4))
> > -+    {
> > -+      /* Insert lfence before indirect branch if needed.  */
> > -+
> > -+      if (lfence_before_indirect_branch =3D=3D lfence_branch_none)
> > -+ return;
> > -+
> > -+      if (i.operands !=3D 1)
> > -+ abort ();
> > -+
> > -+      if (i.reg_operands =3D=3D 1)
> > -+ {
> > -+  /* Indirect branch via register.  Don't insert lfence with
> > -+     -mlfence-after-load=3Dyes.  */
> > -+  if (lfence_after_load
> > -+      || lfence_before_indirect_branch =3D=3D lfence_branch_memory)
> > -+    return;
> > -+ }
> > -+      else if (i.mem_operands =3D=3D 1
> > -+       && lfence_before_indirect_branch !=3D lfence_branch_register)
> > -+ {
> > -+  as_warn (_("indirect `%s` with memory operand should be avoided"),
> > -+   i.tm.name);
> > -+  return;
> > -+ }
> > -+      else
> > -+ return;
> > -+
> > -+      if (last_insn.kind !=3D last_insn_other
> > -+  && last_insn.seg =3D=3D now_seg)
> > -+ {
> > -+  as_warn_where (last_insn.file, last_insn.line,
> > -+ _("`%s` skips -mlfence-before-indirect-branch on `%s`"),
> > -+ last_insn.name, i.tm.name);
> > -+  return;
> > -+ }
> > -+
> > -+      p =3D frag_more (3);
> > -+      *p++ =3D 0xf;
> > -+      *p++ =3D 0xae;
> > -+      *p =3D 0xe8;
> > -+      return;
> > -+    }
> > -+
> > -+  /* Output or/not and lfence before ret.  */
> > -+  if (lfence_before_ret !=3D lfence_before_ret_none
> > -+      && (i.tm.base_opcode =3D=3D 0xc2
> > -+  || i.tm.base_opcode =3D=3D 0xc3
> > -+  || i.tm.base_opcode =3D=3D 0xca
> > -+  || i.tm.base_opcode =3D=3D 0xcb))
> > -+    {
> > -+      if (last_insn.kind !=3D last_insn_other
> > -+  && last_insn.seg =3D=3D now_seg)
> > -+ {
> > -+  as_warn_where (last_insn.file, last_insn.line,
> > -+ _("`%s` skips -mlfence-before-ret on `%s`"),
> > -+ last_insn.name, i.tm.name);
> > -+  return;
> > -+ }
> > -+      if (lfence_before_ret =3D=3D lfence_before_ret_or)
> > -+ {
> > -+  /* orl: 0x830c2400.  */
> > -+  p =3D frag_more ((flag_code =3D=3D CODE_64BIT ? 1 : 0) + 4 + 3);
> > -+  if (flag_code =3D=3D CODE_64BIT)
> > -+    *p++ =3D 0x48;
> > -+  *p++ =3D 0x83;
> > -+  *p++ =3D 0xc;
> > -+  *p++ =3D 0x24;
> > -+  *p++ =3D 0x0;
> > -+ }
> > -+      else
> > -+ {
> > -+  p =3D frag_more ((flag_code =3D=3D CODE_64BIT ? 2 : 0) + 6 + 3);
> > -+  /* notl: 0xf71424.  */
> > -+  if (flag_code =3D=3D CODE_64BIT)
> > -+    *p++ =3D 0x48;
> > -+  *p++ =3D 0xf7;
> > -+  *p++ =3D 0x14;
> > -+  *p++ =3D 0x24;
> > -+  /* notl: 0xf71424.  */
> > -+  if (flag_code =3D=3D CODE_64BIT)
> > -+    *p++ =3D 0x48;
> > -+  *p++ =3D 0xf7;
> > -+  *p++ =3D 0x14;
> > -+  *p++ =3D 0x24;
> > -+ }
> > -+      *p++ =3D 0xf;
> > -+      *p++ =3D 0xae;
> > -+      *p =3D 0xe8;
> > -+    }
> > -+}
> > -+
> > - /* This is the guts of the machine-dependent assembler.  LINE points=
 to a
> > -    machine dependent instruction.  This function is supposed to emit
> > -    the frags/bytes it assembles to.  */
> > -@@ -4628,9 +4927,13 @@ md_assemble (char *line)
> > -   if (i.rex !=3D 0)
> > -     add_prefix (REX_OPCODE | i.rex);
> > -
> > -+  insert_lfence_before ();
> > -+
> > -   /* We are ready to output the insn.  */
> > -   output_insn ();
> > -
> > -+  insert_lfence_after ();
> > -+
> > -   last_insn.seg =3D now_seg;
> > -
> > -   if (i.tm.opcode_modifier.isprefix)
> > -@@ -12250,6 +12553,9 @@ const char *md_shortopts =3D "qnO::";
> > - #define OPTION_MALIGN_BRANCH_PREFIX_SIZE (OPTION_MD_BASE + 28)
> > - #define OPTION_MALIGN_BRANCH (OPTION_MD_BASE + 29)
> > - #define OPTION_MBRANCHES_WITH_32B_BOUNDARIES (OPTION_MD_BASE + 30)
> > -+#define OPTION_MLFENCE_AFTER_LOAD (OPTION_MD_BASE + 31)
> > -+#define OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH (OPTION_MD_BASE + 32)
> > -+#define OPTION_MLFENCE_BEFORE_RET (OPTION_MD_BASE + 33)
> > -
> > - struct option md_longopts[] =3D
> > - {
> > -@@ -12289,6 +12595,10 @@ struct option md_longopts[] =3D
> > -   {"malign-branch-prefix-size", required_argument, NULL, OPTION_MALI=
GN_BRANCH_PREFIX_SIZE},
> > -   {"malign-branch", required_argument, NULL, OPTION_MALIGN_BRANCH},
> > -   {"mbranches-within-32B-boundaries", no_argument, NULL, OPTION_MBRA=
NCHES_WITH_32B_BOUNDARIES},
> > -+  {"mlfence-after-load", required_argument, NULL, OPTION_MLFENCE_AFT=
ER_LOAD},
> > -+  {"mlfence-before-indirect-branch", required_argument, NULL,
> > -+   OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH},
> > -+  {"mlfence-before-ret", required_argument, NULL, OPTION_MLFENCE_BEF=
ORE_RET},
> > -   {"mamd64", no_argument, NULL, OPTION_MAMD64},
> > -   {"mintel64", no_argument, NULL, OPTION_MINTEL64},
> > -   {NULL, no_argument, NULL, 0}
> > -@@ -12668,6 +12978,41 @@ md_parse_option (int c, const char *arg)
> > -         as_fatal (_("invalid -mfence-as-lock-add=3D option: `%s'"), =
arg);
> > -       break;
> > -
> > -+    case OPTION_MLFENCE_AFTER_LOAD:
> > -+      if (strcasecmp (arg, "yes") =3D=3D 0)
> > -+ lfence_after_load =3D 1;
> > -+      else if (strcasecmp (arg, "no") =3D=3D 0)
> > -+ lfence_after_load =3D 0;
> > -+      else
> > -+        as_fatal (_("invalid -mlfence-after-load=3D option: `%s'"), =
arg);
> > -+      break;
> > -+
> > -+    case OPTION_MLFENCE_BEFORE_INDIRECT_BRANCH:
> > -+      if (strcasecmp (arg, "all") =3D=3D 0)
> > -+ lfence_before_indirect_branch =3D lfence_branch_all;
> > -+      else if (strcasecmp (arg, "memory") =3D=3D 0)
> > -+ lfence_before_indirect_branch =3D lfence_branch_memory;
> > -+      else if (strcasecmp (arg, "register") =3D=3D 0)
> > -+ lfence_before_indirect_branch =3D lfence_branch_register;
> > -+      else if (strcasecmp (arg, "none") =3D=3D 0)
> > -+ lfence_before_indirect_branch =3D lfence_branch_none;
> > -+      else
> > -+        as_fatal (_("invalid -mlfence-before-indirect-branch=3D opti=
on: `%s'"),
> > -+  arg);
> > -+      break;
> > -+
> > -+    case OPTION_MLFENCE_BEFORE_RET:
> > -+      if (strcasecmp (arg, "or") =3D=3D 0)
> > -+ lfence_before_ret =3D lfence_before_ret_or;
> > -+      else if (strcasecmp (arg, "not") =3D=3D 0)
> > -+ lfence_before_ret =3D lfence_before_ret_not;
> > -+      else if (strcasecmp (arg, "none") =3D=3D 0)
> > -+ lfence_before_ret =3D lfence_before_ret_none;
> > -+      else
> > -+        as_fatal (_("invalid -mlfence-before-ret=3D option: `%s'"),
> > -+  arg);
> > -+      break;
> > -+
> > -     case OPTION_MRELAX_RELOCATIONS:
> > -       if (strcasecmp (arg, "yes") =3D=3D 0)
> > -         generate_relax_relocations =3D 1;
> > -@@ -13025,6 +13370,15 @@ md_show_usage (FILE *stream)
> > -   -mbranches-within-32B-boundaries\n\
> > -                           align branches within 32 byte boundary\n")=
);
> > -   fprintf (stream, _("\
> > -+  -mlfence-after-load=3D[no|yes] (default: no)\n\
> > -+                          generate lfence after load\n"));
> > -+  fprintf (stream, _("\
> > -+  -mlfence-before-indirect-branch=3D[none|all|register|memory] (defa=
ult: none)\n\
> > -+                          generate lfence before indirect near branc=
h\n"));
> > -+  fprintf (stream, _("\
> > -+  -mlfence-before-ret=3D[none|or|not] (default: none)\n\
> > -+                          generate lfence before ret\n"));
> > -+  fprintf (stream, _("\
> > -   -mamd64                 accept only AMD64 ISA [default]\n"));
> > -   fprintf (stream, _("\
> > -   -mintel64               accept only Intel64 ISA\n"));
> > -@@ -13254,6 +13608,16 @@ i386_cons_align (int ignore ATTRIBUTE_UNUSED=
)
> > -       last_insn.kind =3D last_insn_directive;
> > -       last_insn.name =3D "constant directive";
> > -       last_insn.file =3D as_where (&last_insn.line);
> > -+      if (lfence_before_ret !=3D lfence_before_ret_none)
> > -+ {
> > -+  if (lfence_before_indirect_branch !=3D lfence_branch_none)
> > -+    as_warn (_("constant directive skips -mlfence-before-ret "
> > -+       "and -mlfence-before-indirect-branch"));
> > -+  else
> > -+    as_warn (_("constant directive skips -mlfence-before-ret"));
> > -+ }
> > -+      else if (lfence_before_indirect_branch !=3D lfence_branch_none=
)
> > -+ as_warn (_("constant directive skips -mlfence-before-indirect-branc=
h"));
> > -     }
> > - }
> > -
> > -diff --git a/gas/doc/c-i386.texi b/gas/doc/c-i386.texi
> > -index c536759cb38..1dd99f91bb0 100644
> > ---- a/gas/doc/c-i386.texi
> > -+++ b/gas/doc/c-i386.texi
> > -@@ -464,6 +464,49 @@ on an instruction.  It is equivalent to
> > - @option{-malign-branch-prefix-size=3D5}.
> > - The default doesn't align branches.
> > -
> > -+@cindex @samp{-mlfence-after-load=3D} option, i386
> > -+@cindex @samp{-mlfence-after-load=3D} option, x86-64
> > -+@item -mlfence-after-load=3D@var{no}
> > -+@itemx -mlfence-after-load=3D@var{yes}
> > -+These options control whether the assembler should generate lfence
> > -+after load instructions.  @option{-mlfence-after-load=3D@var{yes}} w=
ill
> > -+generate lfence.  @option{-mlfence-after-load=3D@var{no}} will not g=
enerate
> > -+lfence, which is the default.
> > -+
> > -+@cindex @samp{-mlfence-before-indirect-branch=3D} option, i386
> > -+@cindex @samp{-mlfence-before-indirect-branch=3D} option, x86-64
> > -+@item -mlfence-before-indirect-branch=3D@var{none}
> > -+@item -mlfence-before-indirect-branch=3D@var{all}
> > -+@item -mlfence-before-indirect-branch=3D@var{register}
> > -+@itemx -mlfence-before-indirect-branch=3D@var{memory}
> > -+These options control whether the assembler should generate lfence
> > -+after indirect near branch instructions.
> > -+@option{-mlfence-before-indirect-branch=3D@var{all}} will generate l=
fence
> > -+after indirect near branch via register and issue a warning before
> > -+indirect near branch via memory.
> > -+@option{-mlfence-before-indirect-branch=3D@var{register}} will gener=
ate
> > -+lfence after indirect near branch via register.
> > -+@option{-mlfence-before-indirect-branch=3D@var{memory}} will issue a
> > -+warning before indirect near branch via memory.
> > -+@option{-mlfence-before-indirect-branch=3D@var{none}} will not gener=
ate
> > -+lfence nor issue warning, which is the default.  Note that lfence wo=
n't
> > -+be generated before indirect near branch via register with
> > -+@option{-mlfence-after-load=3D@var{yes}} since lfence will be genera=
ted
> > -+after loading branch target register.
> > -+
> > -+@cindex @samp{-mlfence-before-ret=3D} option, i386
> > -+@cindex @samp{-mlfence-before-ret=3D} option, x86-64
> > -+@item -mlfence-before-ret=3D@var{none}
> > -+@item -mlfence-before-ret=3D@var{or}
> > -+@itemx -mlfence-before-ret=3D@var{not}
> > -+These options control whether the assembler should generate lfence
> > -+before ret.  @option{-mlfence-before-ret=3D@var{or}} will generate
> > -+generate or instruction with lfence.
> > -+@option{-mlfence-before-ret=3D@var{not}} will generate not instructi=
on
> > -+with lfence.
> > -+@option{-mlfence-before-ret=3D@var{none}} will not generate lfence,
> > -+which is the default.
> > -+
> > - @cindex @samp{-mx86-used-note=3D} option, i386
> > - @cindex @samp{-mx86-used-note=3D} option, x86-64
> > - @item -mx86-used-note=3D@var{no}
> > ---
> > -2.18.2
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.34.bb b/meta/re=
cipes-devtools/binutils/binutils_2.35.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils_2.34.bb
> > rename to meta/recipes-devtools/binutils/binutils_2.35.bb
> >
> >
> >
> >=20
