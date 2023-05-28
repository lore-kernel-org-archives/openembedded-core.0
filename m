Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB98C7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 13:31:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.28811.1685280689112881619
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 06:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QOBpreHB;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so2544263e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685280687; x=1687872687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rMmAvqUBFxFNPuZe+/xrneqZFHey5Z3kjSBisAfzc04=;
        b=QOBpreHBrPrkbQdOwODTGnubvoDjr4Nrnv57HvRA0BIbQoSPA8LslGUB5dy8eK60GU
         jvdqU96J2VnwEB1dabtOUhyqGM3uqBLSQFaJbiXAn1f5hTQQsx0Gud3RLjX1YGDW1vJO
         M5WvfwCScaftvV5O5UZxfmNt2gTpvpEbKL4jq+VaXUghUpkg1g3S+yu89xG0xSIV4mWa
         0N7tjfmyhZ6RlIeAkJKroP4YodzekQSgBdytOG5bzNO1WsB/7jUUpXGvki+XIS3Y3CpF
         HAW99x3C+UPtza6j/UqCzsiyJodgjZyGrTY7KJN+HIEmlHPuZ7Ex+wVgAc/FTrwlHHJ1
         0Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685280687; x=1687872687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMmAvqUBFxFNPuZe+/xrneqZFHey5Z3kjSBisAfzc04=;
        b=gxcRtkl5a+xQQn/dOZeKN8+7F1VggKm1BWrWuyvoIiQSa5SKUqf+DehKtvrbwC3u4S
         RF6wXYs/CRu+3+IQioxr6hOiP6XPesbs0YoZS1ysVGGiuZ879M1ADjVZM3V/HvqGjD+D
         wivF9tj4rNO/EnMD2FJG0vj8VHLO2uPFItE7x63F5yEU6/JwGNfBEpDQWHQMlJII1AFr
         ys5aV3kOVnTlwscndmoabIKwK8Aqh6wNLkX7SE6OpQNLKpRxMIhpAWg+6AlpCZtm6B8r
         cOIzzl7FqG5zZxo5TavFeHvFeGaB/1NLhe8/CrmJafPbuqElr1MLpQpfdh6V8xEPuG0U
         8j6A==
X-Gm-Message-State: AC+VfDzAr+QRlCBGV6TUyZsYC1V3OcT/ihdffGXphWQw9VBUFCEUf+rj
	6/KyWaU06saoyt8UnMsUDDfyjeFFHTVJPSaSnlk=
X-Google-Smtp-Source: ACHHUZ5ok/gmGp87fxRAl/Op6TM3+kFx/Duw0mzc/Z7oZvvL/7WtsPQGzw+bLkFRz5GnXr/+xaRbPrcG/1MdSfYucRI=
X-Received: by 2002:ac2:48b7:0:b0:4f3:b32d:f742 with SMTP id
 u23-20020ac248b7000000b004f3b32df742mr2720917lfg.34.1685280686957; Sun, 28
 May 2023 06:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230527022115.143341-1-raj.khem@gmail.com> <1763507B4DCD1D63.6918@lists.openembedded.org>
In-Reply-To: <1763507B4DCD1D63.6918@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 May 2023 15:31:15 +0200
Message-ID: <CANNYZj-nn8DiFaUjxyVTkhHxPy9Bm+Rqnf=tbJxiXBa1p0qgvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to 13.1.1
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181822

On the other hand, official 13.2.0 will show up soon enough and the
issue will be moot. Still, we shouldn't be using gcc versions that
don't exist (I still have unpleasant memories of red hat's 'gcc 2.96'
fiasco).

Alex

On Sun, 28 May 2023 at 15:06, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Where does '13.1.1' come from though? This updates to a '13-20230520'
> weekly snapshot, so it shouldn't be assigned a non-existent version,
> especially if upstream does release a real 13.1.1 later on.
>
> I'll queue a patch to reset PV to "13.1.0~20230520".
>
> Alex
>
> On Sat, 27 May 2023 at 04:21, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Some distros e.g. gentoo have latest on gcc-13 branch and we have a
> > situation where libstdc++ ABI is changed between 13.1 and 13.2 so
> > official 13.1 release based uninative will no longer work on these
> > distros, therefore switch to a snapshot that includes [1] which fixes
> > it
> >
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108969
> >
> > Reported-by: Martin Jansa <Martin.Jansa@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  2 +-
> >  meta/recipes-devtools/gcc/gcc-13.1.inc        | 18 +++---
> >  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 64 ++++---------------
> >  3 files changed, 24 insertions(+), 60 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 619fe073810..359a29c0768 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -188,7 +188,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
> >  RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
> > -RECIPE_MAINTAINER:pn-gcc-source-13.1.0 = "Khem Raj <raj.khem@gmail.com>"
> > +RECIPE_MAINTAINER:pn-gcc-source-13.1.1 = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-gcr3 = "Markus Volk <f_l_k@t-online.de>"
> >  RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc b/meta/recipes-devtools/gcc/gcc-13.1.inc
> > index d361b680f47..4da703db52e 100644
> > --- a/meta/recipes-devtools/gcc/gcc-13.1.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-13.1.inc
> > @@ -2,11 +2,11 @@ require gcc-common.inc
> >
> >  # Third digit in PV should be incremented after a minor release
> >
> > -PV = "13.1.0"
> > +PV = "13.1.1"
> >
> >  # BINV should be incremented to a revision after a minor gcc release
> >
> > -BINV = "13.1.0"
> > +BINV = "13.1.1"
> >
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> >
> > @@ -30,14 +30,14 @@ LIC_FILES_CHKSUM = "\
> >  #SOURCEDIR ?= "official-gcc-${@'${RELEASE}'[0:7]}"
> >
> >  # from snapshot
> > -#RELEASE ?= "13.1.0-RC-20230421"
> > -#SOURCEDIR ?= "gcc-${RELEASE}"
> > -#BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
> > +RELEASE ?= "13-20230520"
> > +SOURCEDIR ?= "gcc-${RELEASE}"
> > +BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
> >
> >  # official release
> > -RELEASE ?= "${PV}"
> > -BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > -SOURCEDIR ?= "gcc-${PV}"
> > +#RELEASE ?= "${PV}"
> > +#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > +#SOURCEDIR ?= "gcc-${PV}"
> >
> >  SRC_URI = "${BASEURI} \
> >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > @@ -65,7 +65,7 @@ SRC_URI = "${BASEURI} \
> >             file://0023-Fix-install-path-of-linux64.h.patch \
> >             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
> >  "
> > -SRC_URI[sha256sum] = "61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f85492286c4dfc13ee86"
> > +SRC_URI[sha256sum] = "b8716f92e468086fca5aea8873f7405f1cd7d309ad0719f0a90c57b3483e448c"
> >
> >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
> >  B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > index a42a0441424..e3af0bf161f 100644
> > --- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > +++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -35,8 +35,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   gcc/config/sparc/linux64.h         |  4 ++--
> >   18 files changed, 53 insertions(+), 58 deletions(-)
> >
> > -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
> > -index 4277f03da2a..e4c92c03291 100644
> >  --- a/gcc/config/aarch64/aarch64-linux.h
> >  +++ b/gcc/config/aarch64/aarch64-linux.h
> >  @@ -21,10 +21,10 @@
> > @@ -52,11 +50,9 @@ index 4277f03da2a..e4c92c03291 100644
> >
> >   #undef  ASAN_CC1_SPEC
> >   #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> > -index 03f783f2ad1..4fa02668aa7 100644
> >  --- a/gcc/config/alpha/linux-elf.h
> >  +++ b/gcc/config/alpha/linux-elf.h
> > -@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
> >   #define EXTRA_SPECS \
> >   { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> >
> > @@ -67,8 +63,6 @@ index 03f783f2ad1..4fa02668aa7 100644
> >   #if DEFAULT_LIBC == LIBC_UCLIBC
> >   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> >   #elif DEFAULT_LIBC == LIBC_GLIBC
> > -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> > -index a119875599d..dce7f59eeea 100644
> >  --- a/gcc/config/arm/linux-eabi.h
> >  +++ b/gcc/config/arm/linux-eabi.h
> >  @@ -62,8 +62,8 @@
> > @@ -91,8 +85,6 @@ index a119875599d..dce7f59eeea 100644
> >
> >   /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> >      use the GNU/Linux version, not the generic BPABI version.  */
> > -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> > -index 7b7b7cbbe14..98ef2267117 100644
> >  --- a/gcc/config/arm/linux-elf.h
> >  +++ b/gcc/config/arm/linux-elf.h
> >  @@ -60,7 +60,7 @@
> > @@ -104,11 +96,9 @@ index 7b7b7cbbe14..98ef2267117 100644
> >
> >   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> >      %{static:-Bstatic} \
> > -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> > -index bbb7cc7115e..7d9272040ee 100644
> >  --- a/gcc/config/i386/linux.h
> >  +++ b/gcc/config/i386/linux.h
> > -@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
> >   <http://www.gnu.org/licenses/>.  */
> >
> >   #define GNU_USER_LINK_EMULATION "elf_i386"
> > @@ -118,11 +108,9 @@ index bbb7cc7115e..7d9272040ee 100644
> >   #undef MUSL_DYNAMIC_LINKER
> >  -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> >  +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> > -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> > -index 2bd9f48e271..dbbe7ca5440 100644
> >  --- a/gcc/config/i386/linux64.h
> >  +++ b/gcc/config/i386/linux64.h
> > -@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> > +@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
> >   #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> >   #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> >
> > @@ -142,11 +130,9 @@ index 2bd9f48e271..dbbe7ca5440 100644
> >   #undef MUSL_DYNAMIC_LINKERX32
> >  -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
> >  +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
> > -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > -index e3aca79cccc..6491c6b84f5 100644
> >  --- a/gcc/config/linux.h
> >  +++ b/gcc/config/linux.h
> > -@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> > +@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTI
> >      GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
> >      GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> >      supporting both 32-bit and 64-bit compilation.  */
> > @@ -161,11 +147,9 @@ index e3aca79cccc..6491c6b84f5 100644
> >   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> >   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> >   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > -diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-user.h
> > -index aecaa02a199..62f88f7f9a2 100644
> >  --- a/gcc/config/loongarch/gnu-user.h
> >  +++ b/gcc/config/loongarch/gnu-user.h
> > -@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.
> >
> >   #undef GLIBC_DYNAMIC_LINKER
> >   #define GLIBC_DYNAMIC_LINKER \
> > @@ -179,8 +163,6 @@ index aecaa02a199..62f88f7f9a2 100644
> >
> >   #undef GNU_USER_TARGET_LINK_SPEC
> >   #define GNU_USER_TARGET_LINK_SPEC \
> > -diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
> > -index e2e2c421c52..6f26480e3b5 100644
> >  --- a/gcc/config/microblaze/linux.h
> >  +++ b/gcc/config/microblaze/linux.h
> >  @@ -28,7 +28,7 @@
> > @@ -201,11 +183,9 @@ index e2e2c421c52..6f26480e3b5 100644
> >
> >   #undef  SUBTARGET_EXTRA_SPECS
> >   #define SUBTARGET_EXTRA_SPECS \
> > -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> > -index 5add34ea134..34692b433b8 100644
> >  --- a/gcc/config/mips/linux.h
> >  +++ b/gcc/config/mips/linux.h
> > -@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
> >   #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> >
> >   #define GLIBC_DYNAMIC_LINKER32 \
> > @@ -244,8 +224,6 @@ index 5add34ea134..34692b433b8 100644
> >
> >   #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
> >   #define GNU_USER_DYNAMIC_LINKERN32 \
> > -diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> > -index 2ce097ebbce..1d45d7b4962 100644
> >  --- a/gcc/config/nios2/linux.h
> >  +++ b/gcc/config/nios2/linux.h
> >  @@ -29,10 +29,10 @@
> > @@ -261,11 +239,9 @@ index 2ce097ebbce..1d45d7b4962 100644
> >
> >   #undef LINK_SPEC
> >   #define LINK_SPEC LINK_SPEC_ENDIAN \
> > -diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> > -index b9557a75dc7..e10ca1f97e7 100644
> >  --- a/gcc/config/riscv/linux.h
> >  +++ b/gcc/config/riscv/linux.h
> > -@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
> >       GNU_USER_TARGET_OS_CPP_BUILTINS();                                \
> >     } while (0)
> >
> > @@ -274,17 +250,15 @@ index b9557a75dc7..e10ca1f97e7 100644
> >
> >   #define MUSL_ABI_SUFFIX \
> >     "%{mabi=ilp32:-sf}" \
> > -@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.
> >     "%{mabi=lp64d:}"
> >
> >   #undef MUSL_DYNAMIC_LINKER
> >  -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
> >  +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
> >
> > - /* Because RISC-V only has word-sized atomics, it requries libatomic where
> > -    others do not.  So link libatomic by default, as needed.  */
> > -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> > -index 9e457033d11..2ddab7c99c1 100644
> > + #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
> > +
> >  --- a/gcc/config/rs6000/linux64.h
> >  +++ b/gcc/config/rs6000/linux64.h
> >  @@ -339,24 +339,19 @@ extern int dot_symbols;
> > @@ -317,8 +291,6 @@ index 9e457033d11..2ddab7c99c1 100644
> >
> >   #undef  DEFAULT_ASM_ENDIAN
> >   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> > -diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
> > -index ae932fc22f0..26db003cb3a 100644
> >  --- a/gcc/config/rs6000/sysv4.h
> >  +++ b/gcc/config/rs6000/sysv4.h
> >  @@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC
> > @@ -334,11 +306,9 @@ index ae932fc22f0..26db003cb3a 100644
> >
> >   #ifndef GNU_USER_DYNAMIC_LINKER
> >   #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
> > -diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
> > -index 02aa1edaff8..fab268d61f4 100644
> >  --- a/gcc/config/s390/linux.h
> >  +++ b/gcc/config/s390/linux.h
> > -@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
> >   #define MULTILIB_DEFAULTS { "m31" }
> >   #endif
> >
> > @@ -356,11 +326,9 @@ index 02aa1edaff8..fab268d61f4 100644
> >
> >   #undef  LINK_SPEC
> >   #define LINK_SPEC \
> > -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> > -index 29f5902b98b..83d1e53e6e2 100644
> >  --- a/gcc/config/sh/linux.h
> >  +++ b/gcc/config/sh/linux.h
> > -@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
> >
> >   #undef MUSL_DYNAMIC_LINKER
> >   #define MUSL_DYNAMIC_LINKER \
> > @@ -373,11 +341,9 @@ index 29f5902b98b..83d1e53e6e2 100644
> >
> >   #undef SUBTARGET_LINK_EMUL_SUFFIX
> >   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> > -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> > -index 0e33b3cac2c..84f29adbb35 100644
> >  --- a/gcc/config/sparc/linux.h
> >  +++ b/gcc/config/sparc/linux.h
> > -@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
> > +@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
> >      When the -shared link option is used a final link is not being
> >      done.  */
> >
> > @@ -386,11 +352,9 @@ index 0e33b3cac2c..84f29adbb35 100644
> >
> >   #undef  LINK_SPEC
> >   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> > -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> > -index f1cc0a19e49..94bc2032803 100644
> >  --- a/gcc/config/sparc/linux64.h
> >  +++ b/gcc/config/sparc/linux64.h
> > -@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
> >      When the -shared link option is used a final link is not being
> >      done.  */
> >
> > --
> > 2.40.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181820): https://lists.openembedded.org/g/openembedded-core/message/181820
> Mute This Topic: https://lists.openembedded.org/mt/99162012/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

