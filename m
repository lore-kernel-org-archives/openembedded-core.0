Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84FFC77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 14:33:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.29907.1685284425658741053
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 07:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KL7dbUkU;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so2354030f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685284424; x=1687876424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cZSmd/OLjXVrw7Wvj9pdOSq+rH9CTUqtrKkFfJVI6Eg=;
        b=KL7dbUkU2rt3fd7+++WhAM6lryQfYDld7mE2YkvHEtZ7sMoPmLlybGN5CDPRIIpNgw
         dQqI8gMU7ZRiio5gPfixWG5iCwmdlj1CxLLKzNykTwKbvULjv9P/iuSyQ+xXeubMQXRA
         uZEIML6wab8h/6ZaIoTZKu2PPQo7l8E3xHJ9oUMh1Hqrp+grqwEl25zReRQMlmleGtsj
         CVY8F3vV1XlwQkplg245U8X5dZuv06p5x0U+zo6lu69lcZEJDOR8RUHIctSI1F5FSKwQ
         8pfwXKGfqqX+f3q5pxVFUuLFzLfcgIjr+yi6DTalKozBg75lD1bYlU8NMIw9LTsIys8w
         LySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685284424; x=1687876424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZSmd/OLjXVrw7Wvj9pdOSq+rH9CTUqtrKkFfJVI6Eg=;
        b=FgwYJHVyCs4aMb5aY4NGgU9MshbN8c4JVqSBOEkA5w/jxzuMwJyxH4zMBvqqfU+duS
         S8t+94AxT0pd528X0a9C89XYdmDfLzWZxA7vvfPdkUrq0drKsLkYW0BaeEaLFB3kjReZ
         /LiNVfK83hzlNDs1S4jPhK9HWScQxbeI9rIpyNUHfmLRafcfpPhR+zEXUxdY7ETLEvc9
         f+930n5ZsivOJcDeKm3jx8c8AAtwik+qUoAADunOMQT0cUdHK//DSuOEJO8wP0xLY+/x
         jkR+AbZI3VwbPXrA1m1laUoe/EqrlJZ9tCqECPcFv2vXv09VXAD9z2mzXipDWNh8nRGY
         AEzQ==
X-Gm-Message-State: AC+VfDwYPDMAqtV6V/DijdiJilo/q7zWat/ip4KQxtAUf01HH9j82Qr6
	hR77bxUOvsA8Ww0r11e9mKQ/0mMoDRKT6Km/I1E=
X-Google-Smtp-Source: ACHHUZ7ITI8/fsZ0afknVNpIG7/ZV3uKqrinyf1JOX9PBNiqIZnked3ywuw4aHEMkracBLjbaod9hrstauKDFZH1hH0=
X-Received: by 2002:a05:6000:11c9:b0:30a:eadb:790c with SMTP id
 i9-20020a05600011c900b0030aeadb790cmr404126wrx.28.1685284423800; Sun, 28 May
 2023 07:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230527022115.143341-1-raj.khem@gmail.com> <CANNYZj_SsnoOiaGwu5Zy8=zpO0vW7ScC2XeTTOW3ZHsNBqhs7A@mail.gmail.com>
In-Reply-To: <CANNYZj_SsnoOiaGwu5Zy8=zpO0vW7ScC2XeTTOW3ZHsNBqhs7A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 28 May 2023 16:33:32 +0200
Message-ID: <CA+chaQeb1y0n_QK_ZMkaYa7pT8pYm6fYH_zZMdCtO6RZN-kOaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to 13.1.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006d199005fcc1db84"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 14:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181830

--0000000000006d199005fcc1db84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The BINV needs to match with BASE_VER set in gcc which is 13.1.1 since:
https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D2295ad5898aabc652b247446=
be5769e4a43184f1
otherwise do_install fails.

You're right that PV could be set to something lower than 13.1.1, but then
it might confuse someone that the files are installed in 13.1.1 directory
while PV says something else.

gentoo installs files to just "13" directory avoiding this issue.

On Sun, May 28, 2023 at 3:06=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

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
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108969
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
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 619fe073810..359a29c0768 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -188,7 +188,7 @@
> RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "Kh=
em
> Raj <r
> >  RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <
> raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>=
"
> > -RECIPE_MAINTAINER:pn-gcc-source-13.1.0 =3D "Khem Raj <raj.khem@gmail.c=
om
> >"
> > +RECIPE_MAINTAINER:pn-gcc-source-13.1.1 =3D "Khem Raj <raj.khem@gmail.c=
om
> >"
> >  RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-gcr3 =3D "Markus Volk <f_l_k@t-online.de>"
> >  RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.co=
m>"
> > diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc
> b/meta/recipes-devtools/gcc/gcc-13.1.inc
> > index d361b680f47..4da703db52e 100644
> > --- a/meta/recipes-devtools/gcc/gcc-13.1.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-13.1.inc
> > @@ -2,11 +2,11 @@ require gcc-common.inc
> >
> >  # Third digit in PV should be incremented after a minor release
> >
> > -PV =3D "13.1.0"
> > +PV =3D "13.1.1"
> >
> >  # BINV should be incremented to a revision after a minor gcc release
> >
> > -BINV =3D "13.1.0"
> > +BINV =3D "13.1.1"
> >
> >  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport=
:"
> >
> > @@ -30,14 +30,14 @@ LIC_FILES_CHKSUM =3D "\
> >  #SOURCEDIR ?=3D "official-gcc-${@'${RELEASE}'[0:7]}"
> >
> >  # from snapshot
> > -#RELEASE ?=3D "13.1.0-RC-20230421"
> > -#SOURCEDIR ?=3D "gcc-${RELEASE}"
> > -#BASEURI ?=3D "
> https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
> > +RELEASE ?=3D "13-20230520"
> > +SOURCEDIR ?=3D "gcc-${RELEASE}"
> > +BASEURI ?=3D "
> https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
> >
> >  # official release
> > -RELEASE ?=3D "${PV}"
> > -BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > -SOURCEDIR ?=3D "gcc-${PV}"
> > +#RELEASE ?=3D "${PV}"
> > +#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > +#SOURCEDIR ?=3D "gcc-${PV}"
> >
> >  SRC_URI =3D "${BASEURI} \
> >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > @@ -65,7 +65,7 @@ SRC_URI =3D "${BASEURI} \
> >             file://0023-Fix-install-path-of-linux64.h.patch \
> >
>  file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
> >  "
> > -SRC_URI[sha256sum] =3D
> "61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f85492286c4dfc13ee86"
> > +SRC_URI[sha256sum] =3D
> "b8716f92e468086fca5aea8873f7405f1cd7d309ad0719f0a90c57b3483e448c"
> >
> >  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
> >  B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> > index a42a0441424..e3af0bf161f 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLI=
BC_DYNAMIC_LINKE.patch
> > @@ -35,8 +35,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   gcc/config/sparc/linux64.h         |  4 ++--
> >   18 files changed, 53 insertions(+), 58 deletions(-)
> >
> > -diff --git a/gcc/config/aarch64/aarch64-linux.h
> b/gcc/config/aarch64/aarch64-linux.h
> > -index 4277f03da2a..e4c92c03291 100644
> >  --- a/gcc/config/aarch64/aarch64-linux.h
> >  +++ b/gcc/config/aarch64/aarch64-linux.h
> >  @@ -21,10 +21,10 @@
> > @@ -52,11 +50,9 @@ index 4277f03da2a..e4c92c03291 100644
> >
> >   #undef  ASAN_CC1_SPEC
> >   #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf=
.h
> > -index 03f783f2ad1..4fa02668aa7 100644
> >  --- a/gcc/config/alpha/linux-elf.h
> >  +++ b/gcc/config/alpha/linux-elf.h
> > -@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
> >   #define EXTRA_SPECS \
> >   { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> >
> > @@ -67,8 +63,6 @@ index 03f783f2ad1..4fa02668aa7 100644
> >   #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> >   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> >   #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
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
> > -@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
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
> > -@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> > +@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTI
> >      GLIBC_DYNAMIC_LINKER must be defined for each target using them, o=
r
> >      GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> >      supporting both 32-bit and 64-bit compilation.  */
> > @@ -161,11 +147,9 @@ index e3aca79cccc..6491c6b84f5 100644
> >   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> >   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> >   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > -diff --git a/gcc/config/loongarch/gnu-user.h
> b/gcc/config/loongarch/gnu-user.h
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
> > -diff --git a/gcc/config/microblaze/linux.h
> b/gcc/config/microblaze/linux.h
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
> >       GNU_USER_TARGET_OS_CPP_BUILTINS();                               =
 \
> >     } while (0)
> >
> > @@ -274,17 +250,15 @@ index b9557a75dc7..e10ca1f97e7 100644
> >
> >   #define MUSL_ABI_SUFFIX \
> >     "%{mabi=3Dilp32:-sf}" \
> > -@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.  If not see
> > +@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.
> >     "%{mabi=3Dlp64d:}"
> >
> >   #undef MUSL_DYNAMIC_LINKER
> >  -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC
> MUSL_ABI_SUFFIX ".so.1"
> >  +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC
> MUSL_ABI_SUFFIX ".so.1"
> >
> > - /* Because RISC-V only has word-sized atomics, it requries libatomic
> where
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
> > -@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc,
> const char **argv);
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
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#181786):
> https://lists.openembedded.org/g/openembedded-core/message/181786
> > Mute This Topic: https://lists.openembedded.org/mt/99162012/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000006d199005fcc1db84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The BINV needs to match with BASE_VER set in gcc which is =
13.1.1 since:<div><a href=3D"https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git=
;h=3D2295ad5898aabc652b247446be5769e4a43184f1">https://gcc.gnu.org/git/gitw=
eb.cgi?p=3Dgcc.git;h=3D2295ad5898aabc652b247446be5769e4a43184f1</a><br></di=
v><div>otherwise do_install fails.</div><div><br></div><div>You&#39;re righ=
t that PV could be set to something lower than 13.1.1, but then it might co=
nfuse someone that the files are installed in 13.1.1 directory while PV say=
s something else.</div><div><br></div><div>gentoo installs files to just &q=
uot;13&quot; directory avoiding this issue.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 28, 2023 at 3:=
06=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.co=
m">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Where does &#39;13.1.1&#39; come from though? This=
 updates to a &#39;13-20230520&#39;<br>
weekly snapshot, so it shouldn&#39;t be assigned a non-existent version,<br=
>
especially if upstream does release a real 13.1.1 later on.<br>
<br>
I&#39;ll queue a patch to reset PV to &quot;13.1.0~20230520&quot;.<br>
<br>
Alex<br>
<br>
On Sat, 27 May 2023 at 04:21, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Some distros e.g. gentoo have latest on gcc-13 branch and we have a<br=
>
&gt; situation where libstdc++ ABI is changed between 13.1 and 13.2 so<br>
&gt; official 13.1 release based uninative will no longer work on these<br>
&gt; distros, therefore switch to a snapshot that includes [1] which fixes<=
br>
&gt; it<br>
&gt;<br>
&gt; [1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108969" =
rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.=
cgi?id=3D108969</a><br>
&gt;<br>
&gt; Reported-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com=
" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-13.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 18 +++---<br>
&gt;=C2=A0 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 64 ++++---------=
------<br>
&gt;=C2=A0 3 files changed, 24 insertions(+), 60 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 619fe073810..359a29c0768 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -188,7 +188,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH} =3D &quot;Khem Raj &lt;r<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D &quot;Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcc-runtime =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D &quot;Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-gcc-source-13.1.0 =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-gcc-source-13.1.1 =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gconf =3D &quot;Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&q=
uot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcr3 =3D &quot;Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;&quot;<=
br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcr =3D &quot;Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc b/meta/recipes-dev=
tools/gcc/gcc-13.1.inc<br>
&gt; index d361b680f47..4da703db52e 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-13.1.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-13.1.inc<br>
&gt; @@ -2,11 +2,11 @@ require gcc-common.inc<br>
&gt;<br>
&gt;=C2=A0 # Third digit in PV should be incremented after a minor release<=
br>
&gt;<br>
&gt; -PV =3D &quot;13.1.0&quot;<br>
&gt; +PV =3D &quot;13.1.1&quot;<br>
&gt;<br>
&gt;=C2=A0 # BINV should be incremented to a revision after a minor gcc rel=
ease<br>
&gt;<br>
&gt; -BINV =3D &quot;13.1.0&quot;<br>
&gt; +BINV =3D &quot;13.1.1&quot;<br>
&gt;<br>
&gt;=C2=A0 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/g=
cc/backport:&quot;<br>
&gt;<br>
&gt; @@ -30,14 +30,14 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
&gt;=C2=A0 #SOURCEDIR ?=3D &quot;official-gcc-${@&#39;${RELEASE}&#39;[0:7]}=
&quot;<br>
&gt;<br>
&gt;=C2=A0 # from snapshot<br>
&gt; -#RELEASE ?=3D &quot;13.1.0-RC-20230421&quot;<br>
&gt; -#SOURCEDIR ?=3D &quot;gcc-${RELEASE}&quot;<br>
&gt; -#BASEURI ?=3D &quot;<a href=3D"https://gcc.gnu.org/pub/gcc/snapshots/=
$%7BRELEASE%7D/gcc-$%7BRELEASE%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz<=
/a>&quot;<br>
&gt; +RELEASE ?=3D &quot;13-20230520&quot;<br>
&gt; +SOURCEDIR ?=3D &quot;gcc-${RELEASE}&quot;<br>
&gt; +BASEURI ?=3D &quot;<a href=3D"https://gcc.gnu.org/pub/gcc/snapshots/$=
%7BRELEASE%7D/gcc-$%7BRELEASE%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz</=
a>&quot;<br>
&gt;<br>
&gt;=C2=A0 # official release<br>
&gt; -RELEASE ?=3D &quot;${PV}&quot;<br>
&gt; -BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz&quot;=
<br>
&gt; -SOURCEDIR ?=3D &quot;gcc-${PV}&quot;<br>
&gt; +#RELEASE ?=3D &quot;${PV}&quot;<br>
&gt; +#BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz&quot=
;<br>
&gt; +#SOURCEDIR ?=3D &quot;gcc-${PV}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${BASEURI} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcc-4.3.1-A=
RCH_FLAGS_FOR_TARGET.patch \<br>
&gt; @@ -65,7 +65,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0023-Fix-install=
-path-of-linux64.h.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0024-Avoid-hardc=
oded-build-paths-into-ppc-libgcc.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;61d684f0aa5e76ac6585ad8898a2427aade8979e=
d5e7f85492286c4dfc13ee86&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b8716f92e468086fca5aea8873f7405f1cd7d309=
ad0719f0a90c57b3483e448c&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}&q=
uot;<br>
&gt;=C2=A0 B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}=
&quot;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_L=
INKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-D=
efine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; index a42a0441424..e3af0bf161f 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-a=
nd-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-a=
nd-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; @@ -35,8 +35,6 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0gcc/config/sparc/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A018 files changed, 53 insertions(+), 58 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h<br>
&gt; -index 4277f03da2a..e4c92c03291 100644<br>
&gt;=C2=A0 --- a/gcc/config/aarch64/aarch64-linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/aarch64/aarch64-linux.h<br>
&gt;=C2=A0 @@ -21,10 +21,10 @@<br>
&gt; @@ -52,11 +50,9 @@ index 4277f03da2a..e4c92c03291 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 ASAN_CC1_SPEC<br>
&gt;=C2=A0 =C2=A0#define ASAN_CC1_SPEC &quot;%{%:sanitize(address):-funwind=
-tables}&quot;<br>
&gt; -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-el=
f.h<br>
&gt; -index 03f783f2ad1..4fa02668aa7 100644<br>
&gt;=C2=A0 --- a/gcc/config/alpha/linux-elf.h<br>
&gt;=C2=A0 +++ b/gcc/config/alpha/linux-elf.h<br>
&gt; -@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.=C2=A0 If not=
 see<br>
&gt; +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0#define EXTRA_SPECS \<br>
&gt;=C2=A0 =C2=A0{ &quot;elf_dynamic_linker&quot;, ELF_DYNAMIC_LINKER },<br=
>
&gt;<br>
&gt; @@ -67,8 +63,6 @@ index 03f783f2ad1..4fa02668aa7 100644<br>
&gt;=C2=A0 =C2=A0#if DEFAULT_LIBC =3D=3D LIBC_UCLIBC<br>
&gt;=C2=A0 =C2=A0#define CHOOSE_DYNAMIC_LINKER(G, U) &quot;%{mglibc:&quot; =
G &quot;;:&quot; U &quot;}&quot;<br>
&gt;=C2=A0 =C2=A0#elif DEFAULT_LIBC =3D=3D LIBC_GLIBC<br>
&gt; -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h<br>
&gt; -index a119875599d..dce7f59eeea 100644<br>
&gt;=C2=A0 --- a/gcc/config/arm/linux-eabi.h<br>
&gt;=C2=A0 +++ b/gcc/config/arm/linux-eabi.h<br>
&gt;=C2=A0 @@ -62,8 +62,8 @@<br>
&gt; @@ -91,8 +85,6 @@ index a119875599d..dce7f59eeea 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* At this point, bpabi.h will have clobbered LINK_SPEC.=
=C2=A0 We want to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 use the GNU/Linux version, not the generic BPABI v=
ersion.=C2=A0 */<br>
&gt; -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h<=
br>
&gt; -index 7b7b7cbbe14..98ef2267117 100644<br>
&gt;=C2=A0 --- a/gcc/config/arm/linux-elf.h<br>
&gt;=C2=A0 +++ b/gcc/config/arm/linux-elf.h<br>
&gt;=C2=A0 @@ -60,7 +60,7 @@<br>
&gt; @@ -104,11 +96,9 @@ index 7b7b7cbbe14..98ef2267117 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define LINUX_TARGET_LINK_SPEC=C2=A0 &quot;%{h*} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %{static:-Bstatic} \<br>
&gt; -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h<br>
&gt; -index bbb7cc7115e..7d9272040ee 100644<br>
&gt;=C2=A0 --- a/gcc/config/i386/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/i386/linux.h<br>
&gt; -@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not=
 see<br>
&gt; +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"norefe=
rrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define GNU_USER_LINK_EMULATION &quot;elf_i386&quot;<br>
&gt; @@ -118,11 +108,9 @@ index bbb7cc7115e..7d9272040ee 100644<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKER<br>
&gt;=C2=A0 -#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-i386.so.1&quot;<=
br>
&gt;=C2=A0 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-i386.s=
o.1&quot;<br>
&gt; -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h<br=
>
&gt; -index 2bd9f48e271..dbbe7ca5440 100644<br>
&gt;=C2=A0 --- a/gcc/config/i386/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/i386/linux64.h<br>
&gt; -@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.=C2=A0 If not, see<br>
&gt; +@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI<br>
&gt;=C2=A0 =C2=A0#define GNU_USER_LINK_EMULATION64 &quot;elf_x86_64&quot;<b=
r>
&gt;=C2=A0 =C2=A0#define GNU_USER_LINK_EMULATIONX32 &quot;elf32_x86_64&quot=
;<br>
&gt;<br>
&gt; @@ -142,11 +130,9 @@ index 2bd9f48e271..dbbe7ca5440 100644<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKERX32<br>
&gt;=C2=A0 -#define MUSL_DYNAMIC_LINKERX32 &quot;/lib/ld-musl-x32.so.1&quot=
;<br>
&gt;=C2=A0 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR &quot;ld-musl-x32=
.so.1&quot;<br>
&gt; -diff --git a/gcc/config/linux.h b/gcc/config/linux.h<br>
&gt; -index e3aca79cccc..6491c6b84f5 100644<br>
&gt;=C2=A0 --- a/gcc/config/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/linux.h<br>
&gt; -@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.=C2=A0 If not, see<br>
&gt; +@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GLIBC_DYNAMIC_LINKER must be defined for each targ=
et using them, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 =
for targets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 supporting both 32-bit and 64-bit compilation.=C2=
=A0 */<br>
&gt; @@ -161,11 +147,9 @@ index e3aca79cccc..6491c6b84f5 100644<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKER &quot;/system/bin/linker&quo=
t;<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKER32 &quot;/system/bin/linker&q=
uot;<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKER64 &quot;/system/bin/linker64=
&quot;<br>
&gt; -diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/g=
nu-user.h<br>
&gt; -index aecaa02a199..62f88f7f9a2 100644<br>
&gt;=C2=A0 --- a/gcc/config/loongarch/gnu-user.h<br>
&gt;=C2=A0 +++ b/gcc/config/loongarch/gnu-user.h<br>
&gt; -@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.=C2=A0 If n=
ot see<br>
&gt; +@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef GLIBC_DYNAMIC_LINKER<br>
&gt;=C2=A0 =C2=A0#define GLIBC_DYNAMIC_LINKER \<br>
&gt; @@ -179,8 +163,6 @@ index aecaa02a199..62f88f7f9a2 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef GNU_USER_TARGET_LINK_SPEC<br>
&gt;=C2=A0 =C2=A0#define GNU_USER_TARGET_LINK_SPEC \<br>
&gt; -diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/li=
nux.h<br>
&gt; -index e2e2c421c52..6f26480e3b5 100644<br>
&gt;=C2=A0 --- a/gcc/config/microblaze/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/microblaze/linux.h<br>
&gt;=C2=A0 @@ -28,7 +28,7 @@<br>
&gt; @@ -201,11 +183,9 @@ index e2e2c421c52..6f26480e3b5 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 SUBTARGET_EXTRA_SPECS<br>
&gt;=C2=A0 =C2=A0#define SUBTARGET_EXTRA_SPECS \<br>
&gt; -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h<br>
&gt; -index 5add34ea134..34692b433b8 100644<br>
&gt;=C2=A0 --- a/gcc/config/mips/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/mips/linux.h<br>
&gt; -@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.=C2=A0 If n=
ot see<br>
&gt; +@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0#define GNU_USER_LINK_EMULATIONN32 &quot;elf32%{EB:b}%{EL:=
l}tsmipn32&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define GLIBC_DYNAMIC_LINKER32 \<br>
&gt; @@ -244,8 +224,6 @@ index 5add34ea134..34692b433b8 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKERN32 &quot;/system/bin/linker3=
2&quot;<br>
&gt;=C2=A0 =C2=A0#define GNU_USER_DYNAMIC_LINKERN32 \<br>
&gt; -diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h<br>
&gt; -index 2ce097ebbce..1d45d7b4962 100644<br>
&gt;=C2=A0 --- a/gcc/config/nios2/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/nios2/linux.h<br>
&gt;=C2=A0 @@ -29,10 +29,10 @@<br>
&gt; @@ -261,11 +239,9 @@ index 2ce097ebbce..1d45d7b4962 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef LINK_SPEC<br>
&gt;=C2=A0 =C2=A0#define LINK_SPEC LINK_SPEC_ENDIAN \<br>
&gt; -diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h<br>
&gt; -index b9557a75dc7..e10ca1f97e7 100644<br>
&gt;=C2=A0 --- a/gcc/config/riscv/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/riscv/linux.h<br>
&gt; -@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not=
 see<br>
&gt; +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GNU_USER_TARGET_OS_CPP_BUILTINS();=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0} while (0)<br>
&gt;<br>
&gt; @@ -274,17 +250,15 @@ index b9557a75dc7..e10ca1f97e7 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define MUSL_ABI_SUFFIX \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;%{mabi=3Dilp32:-sf}&quot; \<br>
&gt; -@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not=
 see<br>
&gt; +@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;%{mabi=3Dlp64d:}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKER<br>
&gt;=C2=A0 -#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-riscv&quot; XLEN=
_SPEC MUSL_ABI_SUFFIX &quot;.so.1&quot;<br>
&gt;=C2=A0 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-riscv&=
quot; XLEN_SPEC MUSL_ABI_SUFFIX &quot;.so.1&quot;<br>
&gt;<br>
&gt; - /* Because RISC-V only has word-sized atomics, it requries libatomic=
 where<br>
&gt; -=C2=A0 =C2=A0 others do not.=C2=A0 So link libatomic by default, as n=
eeded.=C2=A0 */<br>
&gt; -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h<br>
&gt; -index 9e457033d11..2ddab7c99c1 100644<br>
&gt; + #define ICACHE_FLUSH_FUNC &quot;__riscv_flush_icache&quot;<br>
&gt; +<br>
&gt;=C2=A0 --- a/gcc/config/rs6000/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/rs6000/linux64.h<br>
&gt;=C2=A0 @@ -339,24 +339,19 @@ extern int dot_symbols;<br>
&gt; @@ -317,8 +291,6 @@ index 9e457033d11..2ddab7c99c1 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 DEFAULT_ASM_ENDIAN<br>
&gt;=C2=A0 =C2=A0#if (TARGET_DEFAULT &amp; MASK_LITTLE_ENDIAN)<br>
&gt; -diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h<br=
>
&gt; -index ae932fc22f0..26db003cb3a 100644<br>
&gt;=C2=A0 --- a/gcc/config/rs6000/sysv4.h<br>
&gt;=C2=A0 +++ b/gcc/config/rs6000/sysv4.h<br>
&gt;=C2=A0 @@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC<br>
&gt; @@ -334,11 +306,9 @@ index ae932fc22f0..26db003cb3a 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#ifndef GNU_USER_DYNAMIC_LINKER<br>
&gt;=C2=A0 =C2=A0#define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER<br>
&gt; -diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h<br>
&gt; -index 02aa1edaff8..fab268d61f4 100644<br>
&gt;=C2=A0 --- a/gcc/config/s390/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/s390/linux.h<br>
&gt; -@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.=C2=A0 If n=
ot see<br>
&gt; +@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0#define MULTILIB_DEFAULTS { &quot;m31&quot; }<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;<br>
&gt; @@ -356,11 +326,9 @@ index 02aa1edaff8..fab268d61f4 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 LINK_SPEC<br>
&gt;=C2=A0 =C2=A0#define LINK_SPEC \<br>
&gt; -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h<br>
&gt; -index 29f5902b98b..83d1e53e6e2 100644<br>
&gt;=C2=A0 --- a/gcc/config/sh/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/sh/linux.h<br>
&gt; -@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.=C2=A0 If n=
ot see<br>
&gt; +@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKER<br>
&gt;=C2=A0 =C2=A0#define MUSL_DYNAMIC_LINKER \<br>
&gt; @@ -373,11 +341,9 @@ index 29f5902b98b..83d1e53e6e2 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef SUBTARGET_LINK_EMUL_SUFFIX<br>
&gt;=C2=A0 =C2=A0#define SUBTARGET_LINK_EMUL_SUFFIX &quot;%{mfdpic:_fd;:_li=
nux}&quot;<br>
&gt; -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h<br>
&gt; -index 0e33b3cac2c..84f29adbb35 100644<br>
&gt;=C2=A0 --- a/gcc/config/sparc/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/sparc/linux.h<br>
&gt; -@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc,=
 const char **argv);<br>
&gt; +@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 When the -shared link option is used a final link =
is not being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done.=C2=A0 */<br>
&gt;<br>
&gt; @@ -386,11 +352,9 @@ index 0e33b3cac2c..84f29adbb35 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 LINK_SPEC<br>
&gt;=C2=A0 =C2=A0#define LINK_SPEC &quot;-m elf32_sparc %{shared:-shared} \=
<br>
&gt; -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h<=
br>
&gt; -index f1cc0a19e49..94bc2032803 100644<br>
&gt;=C2=A0 --- a/gcc/config/sparc/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/sparc/linux64.h<br>
&gt; -@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.=C2=A0 If not=
 see<br>
&gt; +@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 When the -shared link option is used a final link =
is not being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done.=C2=A0 */<br>
&gt;<br>
&gt; --<br>
&gt; 2.40.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#181786): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/181786" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/181786</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99162012=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/99162012/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000006d199005fcc1db84--

