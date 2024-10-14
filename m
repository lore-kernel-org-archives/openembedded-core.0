Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E68ECFC52A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 09:29:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.50852.1728898152018123671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 02:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ZtYVfuw7;
 spf=pass (domain: snapchat.com, ip: 209.85.218.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0cee600aso98929466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1728898150; x=1729502950; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/eadXi9TpYfX9P/jZaKWB8LamJp21sBPdoLLj4o6do0=;
        b=ZtYVfuw7Q+zGboqhJ2xpm+O9D5oUsxpdMwhzgg9a+FEZcR17chMDtxA58EkSem5ef8
         azJtiteNkj4e+U4rRAenTRpzaEz9FtO+gFbvK/qxA/yLEn1XqO3PE9PCz5474A/M1C1h
         uvRi3GMJsevgKqOGnOf94v7NY+8PZ00bgym+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728898150; x=1729502950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eadXi9TpYfX9P/jZaKWB8LamJp21sBPdoLLj4o6do0=;
        b=ReBQkr+kAyfpyrXLqZu339CpOp559TJtWr5Sv0YiJUCAkhU8FMqN3htUOc8WboEtFh
         cZdJpjwVzoIGBqzy0c7nrEImhOLda/SgXrzZxSFI09z8AP7ft9CAj9GYu//3j+cpUUpc
         ug9WrsSAddfsz32An2YARMTlqXYr8W56nmt1Yk7T9CGEXIeXRNeI4cFIzlw02ikVKWIU
         OhwlpOwXuDZGWqRmESOcygOWLIQBRZyYITvqA7QkFolhKGvLYa5tJ/YCQNDefY8jQhd1
         yISBnVG5ozGyfERZbXqjXTa0Hj06LRxVGO+de6Xp5vcLkIAgr9Rro6EBF3f1grUkgi5Z
         P3DA==
X-Gm-Message-State: AOJu0Yw3QC15VoEAKnHylT/TqPSUIOLJx3pytQ2cFEzJyx3aRU/cZzki
	qO+D++Z+hWoisC/4wQbHF2aAvLBzyExyBzjzoaIMKgJfFUYIEBSgxQtcEkuFqz8gcbjoJnRwf/A
	bb8cR2I5+RT5amm8wIfqWuxW4elaBelRX0uK/8Q==
X-Google-Smtp-Source: AGHT+IEcMP0jDs29e+mgRcJQIAQEvRNMDEO7IrTVredpzuTQdkRn5M1HP0ZV0UL9QBHZR/Gk1G3MuTMjaw6amQDKzJk=
X-Received: by 2002:a17:907:1c92:b0:a99:fdb7:4822 with SMTP id
 a640c23a62f3a-a99fdb748bdmr480352366b.45.1728898150177; Mon, 14 Oct 2024
 02:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <17FE46CB57E16FF2.24631@lists.openembedded.org>
In-Reply-To: <17FE46CB57E16FF2.24631@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 14 Oct 2024 11:28:59 +0200
Message-ID: <CAHUKmYZMBYitFCwQ+MTw4J8YdBt6c8qT7zi4V=hRNobnPncH4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="00000000000018412106246c78f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205735

--00000000000018412106246c78f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Khem Raj and Wang My in CC

Hi all,
for context: Wang Mingyu has been maintaining the recipe in
meta-openembedded. I proposed to her to add them as maintainer in poky per
email, but have not heard back. Because of that, I wrote down my name
instead. I am completely open to having someone else written down as the
maintainer of makedumpfile in poky, in case it makes more sense.

=C3=89tienne

On Mon, Oct 14, 2024 at 11:12=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The kdump script from kexec-tools does not work without makedumpfile (see
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_poky_tree_meta_recipes-2Dkernel_kexec_kexec-2Dtools_kdump-23n14&d=3DDwID=
Ag&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&m=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYSCthF8=
ucEUy5NbXbB1A1gBJ&s=3DpvS8H6faoTDdXL0OP37Fg3OC8xR0mhtz-148E4m1HIs&e=3D
> ).
> Thus, let's import makedumpfile from
> meta-openembedded/meta-oe/recipes-kernel/makedumpfile and make kexec-tool=
s
> RDEPENDS on makedumpfile.
>
> makedumpfile is the utility which reads /proc/vmcore after a kernel panic
> and creates a kdump file under /var/crash/.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../kexec/kexec-tools_2.0.29.bb               |   1 +
>  ...makedumpfile-replace-hardcode-CFLAGS.patch | 139 ++++++++++++++++++
>  .../makedumpfile/makedumpfile_1.7.5.bb        |  62 ++++++++
>  4 files changed, 203 insertions(+)
>  create mode 100644
> meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-h=
ardcode-CFLAGS.patch
>  create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.b=
b
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index b529786214..ad2544741f 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -490,6 +490,7 @@ RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <
> liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-make =3D "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-makedepend =3D "Robert Yang <liezhi.yang@windriver.=
com
> >"
>  RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
> +RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <
> ecordonnier@snap.com>"
>  RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-man-pages =3D "Hongxu Jia <hongxu.jia@windriver.com=
>"
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> index 2c2901f19e..be24d064bb 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>
>  file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=3Daf10f6ae4a8715965e=
648aa687ad3e09
> \
>                      "
>  DEPENDS =3D "zlib xz"
> +RDEPENDS:${PN} =3D "makedumpfile"
>
>  SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
>             file://kdump \
> diff --git
> a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace=
-hardcode-CFLAGS.patch
> b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace=
-hardcode-CFLAGS.patch
> new file mode 100644
> index 0000000000..96a996f616
> --- /dev/null
> +++
> b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace=
-hardcode-CFLAGS.patch
> @@ -0,0 +1,139 @@
> +From 6d16911316cb576db0239f607e60918a222e4436 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Sun, 24 Apr 2022 17:25:33 +0800
> +Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
> +
> +* Create alias for target such as powerpc as powerpc32
> +* Remove hardcode CFLAGS
> +* Add CFLAGS_COMMON to instead of CFLAGS so can flexibly
> +  customize CFLAGS and not hardcode the CFLAGS as previously
> +* Forcibly to link dynamic library as the poky build
> +  system doesn't build static library by default
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +
> +[2021-11-18] Patch updated to use CFLAGS_COMMON for zstd
> +Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> +
> +Rebase to 1.7.1
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile | 40 +++++++++++++++++++++-------------------
> + 1 file changed, 21 insertions(+), 19 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 71d8548..22acdd5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
> + CC    =3D gcc
> + endif
> +
> +-CFLAGS_BASE :=3D $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=3D64 \
> +-              -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> +-CFLAGS      :=3D $(CFLAGS_BASE) -DVERSION=3D'"$(VERSION)"'
> -DRELEASE_DATE=3D'"$(DATE)"'
> +-CFLAGS_ARCH :=3D $(CFLAGS_BASE)
> +-# LDFLAGS =3D -L/usr/local/lib -I/usr/local/include
> +-
> + HOST_ARCH :=3D $(shell uname -m)
> + # Use TARGET as the target architecture if specified.
> + # Defaults to uname -m
> +@@ -24,26 +18,34 @@ endif
> + ARCH :=3D $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc=
64/
> \
> +                              -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                              -e s/s390x/s390/ -e s/parisc64/parisc/ \
> +-                             -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)
> ++                             -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ =
\
> ++                             -e s/_powerpc_/_powerpc32_/)
> +
> + CROSS :=3D
> + ifneq ($(TARGET), $(HOST_ARCH))
> + CROSS :=3D -U__$(HOST_ARCH)__
> + endif
> +
> +-CFLAGS +=3D -D__$(ARCH)__ $(CROSS)
> + CFLAGS_ARCH +=3D -D__$(ARCH)__ $(CROSS)
> +
> +-ifeq ($(ARCH), powerpc64)
> +-CFLAGS +=3D -m64
> ++ifeq ($(ARCH), __powerpc64__)
> + CFLAGS_ARCH +=3D -m64
> + endif
> +
> +-ifeq ($(ARCH), powerpc32)
> +-CFLAGS +=3D -m32
> ++ifeq ($(ARCH), __powerpc32__)
> + CFLAGS_ARCH +=3D -m32
> + endif
> +
> ++CFLAGS_ARCH +=3D $(CFLAGS) \
> ++              -D_FILE_OFFSET_BITS=3D64 \
> ++              -D_LARGEFILE_SOURCE \
> ++              -D_LARGEFILE64_SOURCE
> ++
> ++CFLAGS_COMMON =3D $(CFLAGS_ARCH) \
> ++              -DVERSION=3D'"$(VERSION)"' \
> ++              -DRELEASE_DATE=3D'"$(DATE)"'
> ++
> ++
> + SRC_BASE =3D makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h
> sadump_info.h
> + SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c
> sadump_info.c cache.c tools.c printk.c detect_cycle.c
> + OBJ_PART=3D$(patsubst %.c,%.o,$(SRC_PART))
> +@@ -52,12 +54,12 @@ OBJ_ARCH=3D$(patsubst %.c,%.o,$(SRC_ARCH))
> +
> + LIBS =3D -ldw -lbz2 -ldl -lelf -lz
> + ifneq ($(LINKTYPE), dynamic)
> +-LIBS :=3D -static $(LIBS) -llzma
> ++LIBS :=3D $(LIBS) -llzma
> + endif
> +
> + ifeq ($(USELZO), on)
> + LIBS :=3D -llzo2 $(LIBS)
> +-CFLAGS +=3D -DUSELZO
> ++CFLAGS_COMMON +=3D -DUSELZO
> + endif
> +
> + ifeq ($(USESNAPPY), on)
> +@@ -65,12 +67,12 @@ LIBS :=3D -lsnappy $(LIBS)
> + ifneq ($(LINKTYPE), dynamic)
> + LIBS :=3D $(LIBS) -lstdc++
> + endif
> +-CFLAGS +=3D -DUSESNAPPY
> ++CFLAGS_COMMON +=3D -DUSESNAPPY
> + endif
> +
> + ifeq ($(USEZSTD), on)
> + LIBS :=3D -lzstd $(LIBS)
> +-CFLAGS +=3D -DUSEZSTD
> ++CFLAGS_COMMON +=3D -DUSEZSTD
> + endif
> +
> + ifeq ($(DEBUG), on)
> +@@ -104,14 +106,14 @@ LIBS :=3D $(LIBS) $(call try-run,\
> + all: makedumpfile
> +
> + $(OBJ_PART): $(SRC_PART)
> +-      $(CC) $(CFLAGS) -c -o ./$@ $(VPATH)$(@:.o=3D.c)
> ++      $(CC) $(CFLAGS_COMMON) -c -o ./$@ $(VPATH)$(@:.o=3D.c)
> +
> + $(OBJ_ARCH): $(SRC_ARCH)
> +       @mkdir -p $(@D)
> +       $(CC) $(CFLAGS_ARCH) -c -o ./$@ $(VPATH)$(@:.o=3D.c)
> +
> + makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
> +-      $(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $=
@
> $< $(LIBS)
> ++      $(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH)
> -rdynamic -o $@ $< $(LIBS)
> +       @sed -e "s/@DATE@/$(DATE)/" \
> +            -e "s/@VERSION@/$(VERSION)/" \
> +            $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
> +@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
> +            $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
> +
> + eppic_makedumpfile.so: extension_eppic.c
> +-      $(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@
> extension_eppic.c -fPIC -leppic -ltinfo
> ++      $(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic -o $@
> extension_eppic.c -fPIC -leppic -ltinfo
> +
> + clean:
> +       rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8
> makedumpfile.conf.5
> diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
> b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
> new file mode 100644
> index 0000000000..85b44c4941
> --- /dev/null
> +++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
> @@ -0,0 +1,62 @@
> +SUMMARY =3D "VMcore extraction tool"
> +DESCRIPTION =3D "\
> +    This program is used to extract a subset of the memory available
> either \
> +    via /dev/mem or /proc/vmcore (for crashdumps). It is used to get
> memory \
> +    images without extra uneeded information (zero pages, userspace
> programs, \
> +    etc). \
> +"
> +HOMEPAGE =3D "https://github.com/makedumpfile/makedumpfile"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +LICENSE =3D "GPL-2.0-only"
> +
> +SRCBRANCH ?=3D "master"
> +SRCREV =3D "c266469347d49287be38059d45e7aaa454db9cb2"
> +
> +DEPENDS =3D "bzip2 zlib elfutils xz"
> +RDEPENDS:${PN}-tools =3D "perl ${PN}"
> +
> +# mips/rv32 would not compile.
> +COMPATIBLE_HOST:mipsarcho32 =3D "null"
> +COMPATIBLE_HOST:riscv32 =3D "null"
> +
> +PACKAGES =3D+ "${PN}-tools"
> +FILES:${PN}-tools =3D "${bindir}/*.pl"
> +
> +SRC_URI =3D "\
> +    git://
> github.com/makedumpfile/makedumpfile;branch=3D${SRCBRANCH};protocol=3Dhtt=
ps
> <http://github.com/makedumpfile/makedumpfile;branch=3D$%7BSRCBRANCH%7D;pr=
otocol=3Dhttps>
> \
> +    file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
> +
> +SECTION =3D "base"
> +
> +# If we do not specify TARGET, makedumpfile will build for the host but
> use the
> +# target gcc.
> +#
> +
> +MAKEDUMPFILE_TARGET ?=3D "${TARGET_ARCH}"
> +MAKEDUMPFILE_TARGET:powerpc =3D "ppc"
> +
> +EXTRA_OEMAKE =3D "\
> +    LINKTYPE=3Dstatic \
> +    TARGET=3D${MAKEDUMPFILE_TARGET} \
> +    ${PACKAGECONFIG_CONFARGS} \
> +"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[lzo] =3D "USELZO=3Don,USELZO=3Doff,lzo"
> +PACKAGECONFIG[snappy] =3D "USESNAPPY=3Don,USESNAPPY=3Doff,snappy"
> +PACKAGECONFIG[zstd] =3D "USEZSTD=3Don,USEZSTD=3Doff,zstd"
> +
> +do_install () {
> +    mkdir -p ${D}/usr/bin
> +    install -m 755 ${S}/makedumpfile ${D}/usr/bin
> +    install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin
> +
> +    mkdir -p ${D}/etc/
> +    install -m 644 ${S}/makedumpfile.conf
> ${D}/etc/makedumpfile.conf.sample
> +}
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205734):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_205734&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&s=3DiuX=
TW-Ub_9vMeZzXZwrw8VEXnx4g51o3Jh70b0xyT98&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_108998255_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP-43Iy1a-1QaU=
USrWN6DEeLWV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&s=3DWw14-pFkYrpTaEl3oHF=
2KZ1bJvEYFxeiKM_D1gK68Us&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP-43Iy=
1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&s=3D7BYZqSteRGpT=
5fqGqp91yM52TDwqc9A6f3yp_DAy8FU&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000018412106246c78f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+Khem Raj and Wang My in CC<br><br>Hi all,<br>for context:=
 Wang Mingyu has been maintaining the recipe in meta-openembedded. I propos=
ed to her to add them as maintainer in poky per email, but have not heard b=
ack. Because of that, I wrote down my name instead. I am completely open to=
 having someone else written down as the maintainer of makedumpfile in poky=
, in case it makes more sense.<br><br>=C3=89tienne</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 14, 2024 at 1=
1:12=E2=80=AFAM Etienne Cordonnier via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.c=
om@lists.openembedded.org">snap.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Cor=
donnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecord=
onnier@snap.com</a>&gt;<br>
<br>
The kdump script from kexec-tools does not work without makedumpfile (see <=
a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctop=
roject.org_poky_tree_meta_recipes-2Dkernel_kexec_kexec-2Dtools_kdump-23n14&=
amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6DEeL=
WV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&amp;s=3DpvS8H6faoTDdXL0OP37Fg3OC8=
xR0mhtz-148E4m1HIs&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_poky_tre=
e_meta_recipes-2Dkernel_kexec_kexec-2Dtools_kdump-23n14&amp;d=3DDwIDAg&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYS=
CthF8ucEUy5NbXbB1A1gBJ&amp;s=3DpvS8H6faoTDdXL0OP37Fg3OC8xR0mhtz-148E4m1HIs&=
amp;e=3D</a>=C2=A0 ).<br>
Thus, let&#39;s import makedumpfile from meta-openembedded/meta-oe/recipes-=
kernel/makedumpfile and make kexec-tools RDEPENDS on makedumpfile.<br>
<br>
makedumpfile is the utility which reads /proc/vmcore after a kernel panic a=
nd creates a kdump file under /var/crash/.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../kexec/<a href=3D"http://kexec-tools_2.0.29.bb" rel=3D"noreferrer"=
 target=3D"_blank">kexec-tools_2.0.29.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...makedumpfile-replace-hardcode-CFLAGS.patch | 139 +++++++++++++++++=
+<br>
=C2=A0.../makedumpfile/<a href=3D"http://makedumpfile_1.7.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">makedumpfile_1.7.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 62 ++++++++<br>
=C2=A04 files changed, 203 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001=
-makedumpfile-replace-hardcode-CFLAGS.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/makedumpfile/<a href=3D"http:/=
/makedumpfile_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">makedumpfile_1=
.7.5.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index b529786214..ad2544741f 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -490,6 +490,7 @@ RECIPE_MAINTAINER:pn-m4-native =3D &quot;Robert Yang &l=
t;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yan=
g@windriver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-make =3D &quot;Robert Yang &lt;<a href=3D"mailto=
:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-makedepend =3D &quot;Robert Yang &lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-makedevs =3D &quot;Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;&quo=
t;<br>
+RECIPE_MAINTAINER:pn-makedumpfile =3D &quot;Etienne Cordonnier &lt;<a href=
=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-make-mod-scripts =3D &quot;Bruce Ashfield &lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@=
gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-man-db =3D &quot;Hongxu Jia &lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-man-pages =3D &quot;Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;&quot;<br>
diff --git a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.29=
.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.29.bb</a> b/meta/=
recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.29.bb" rel=3D"norefe=
rrer" target=3D"_blank">kexec-tools_2.0.29.bb</a><br>
index 2c2901f19e..be24d064bb 100644<br>
--- a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.29.bb" re=
l=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.29.bb</a><br>
+++ b/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.29.bb" re=
l=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.29.bb</a><br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=3Daf10f6ae4a8715965e=
648aa687ad3e09 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
=C2=A0DEPENDS =3D &quot;zlib xz&quot;<br>
+RDEPENDS:${PN} =3D &quot;makedumpfile&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-=
tools-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://kdump \<br>
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfil=
e-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedump=
file/0001-makedumpfile-replace-hardcode-CFLAGS.patch<br>
new file mode 100644<br>
index 0000000000..96a996f616<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-repla=
ce-hardcode-CFLAGS.patch<br>
@@ -0,0 +1,139 @@<br>
+From 6d16911316cb576db0239f607e60918a222e4436 Mon Sep 17 00:00:00 2001<br>
+From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_=
blank">mingli.yu@windriver.com</a>&gt;<br>
+Date: Sun, 24 Apr 2022 17:25:33 +0800<br>
+Subject: [PATCH] makedumpfile: replace hardcode CFLAGS<br>
+<br>
+* Create alias for target such as powerpc as powerpc32<br>
+* Remove hardcode CFLAGS<br>
+* Add CFLAGS_COMMON to instead of CFLAGS so can flexibly<br>
+=C2=A0 customize CFLAGS and not hardcode the CFLAGS as previously<br>
+* Forcibly to link dynamic library as the poky build<br>
+=C2=A0 system doesn&#39;t build static library by default<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+<br>
+[2021-11-18] Patch updated to use CFLAGS_COMMON for zstd<br>
+Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org"=
 target=3D"_blank">fathi.boudra@linaro.org</a>&gt;<br>
+<br>
+Rebase to 1.7.1<br>
+Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+---<br>
+ Makefile | 40 +++++++++++++++++++++-------------------<br>
+ 1 file changed, 21 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 71d8548..22acdd5 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -8,12 +8,6 @@ ifeq ($(strip $CC),)<br>
+ CC=C2=A0 =C2=A0 =3D gcc<br>
+ endif<br>
+ <br>
+-CFLAGS_BASE :=3D $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=3D64 \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D_LARGEFILE_SOURCE -D_L=
ARGEFILE64_SOURCE<br>
+-CFLAGS=C2=A0 =C2=A0 =C2=A0 :=3D $(CFLAGS_BASE) -DVERSION=3D&#39;&quot;$(V=
ERSION)&quot;&#39; -DRELEASE_DATE=3D&#39;&quot;$(DATE)&quot;&#39;<br>
+-CFLAGS_ARCH :=3D $(CFLAGS_BASE)<br>
+-# LDFLAGS =3D -L/usr/local/lib -I/usr/local/include<br>
+-<br>
+ HOST_ARCH :=3D $(shell uname -m)<br>
+ # Use TARGET as the target architecture if specified.<br>
+ # Defaults to uname -m<br>
+@@ -24,26 +18,34 @@ endif<br>
+ ARCH :=3D $(shell echo ${TARGET}=C2=A0 | sed -e s/i.86/x86/ -e s/sun4u/sp=
arc64/ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e s/arm.*/arm/ -e s/sa110/arm/ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e s/s390x/s390/ -e s/parisc64/parisc/ \<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ \<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s/_powerpc_/_powerpc32_/)<br>
+ <br>
+ CROSS :=3D<br>
+ ifneq ($(TARGET), $(HOST_ARCH))<br>
+ CROSS :=3D -U__$(HOST_ARCH)__<br>
+ endif<br>
+ <br>
+-CFLAGS +=3D -D__$(ARCH)__ $(CROSS)<br>
+ CFLAGS_ARCH +=3D -D__$(ARCH)__ $(CROSS)<br>
+ <br>
+-ifeq ($(ARCH), powerpc64)<br>
+-CFLAGS +=3D -m64<br>
++ifeq ($(ARCH), __powerpc64__)<br>
+ CFLAGS_ARCH +=3D -m64<br>
+ endif<br>
+ <br>
+-ifeq ($(ARCH), powerpc32)<br>
+-CFLAGS +=3D -m32<br>
++ifeq ($(ARCH), __powerpc32__)<br>
+ CFLAGS_ARCH +=3D -m32<br>
+ endif<br>
+ <br>
++CFLAGS_ARCH +=3D $(CFLAGS) \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D_FILE_OFFSET_BITS=3D64=
 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D_LARGEFILE_SOURCE \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D_LARGEFILE64_SOURCE<br=
>
++<br>
++CFLAGS_COMMON =3D $(CFLAGS_ARCH) \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DVERSION=3D&#39;&quot;$=
(VERSION)&quot;&#39; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DRELEASE_DATE=3D&#39;&q=
uot;$(DATE)&quot;&#39;<br>
++<br>
++<br>
+ SRC_BASE =3D makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sa=
dump_info.h<br>
+ SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c sadump_inf=
o.c cache.c tools.c printk.c detect_cycle.c<br>
+ OBJ_PART=3D$(patsubst %.c,%.o,$(SRC_PART))<br>
+@@ -52,12 +54,12 @@ OBJ_ARCH=3D$(patsubst %.c,%.o,$(SRC_ARCH))<br>
+ <br>
+ LIBS =3D -ldw -lbz2 -ldl -lelf -lz<br>
+ ifneq ($(LINKTYPE), dynamic)<br>
+-LIBS :=3D -static $(LIBS) -llzma<br>
++LIBS :=3D $(LIBS) -llzma<br>
+ endif<br>
+ <br>
+ ifeq ($(USELZO), on)<br>
+ LIBS :=3D -llzo2 $(LIBS)<br>
+-CFLAGS +=3D -DUSELZO<br>
++CFLAGS_COMMON +=3D -DUSELZO<br>
+ endif<br>
+ <br>
+ ifeq ($(USESNAPPY), on)<br>
+@@ -65,12 +67,12 @@ LIBS :=3D -lsnappy $(LIBS)<br>
+ ifneq ($(LINKTYPE), dynamic)<br>
+ LIBS :=3D $(LIBS) -lstdc++<br>
+ endif<br>
+-CFLAGS +=3D -DUSESNAPPY<br>
++CFLAGS_COMMON +=3D -DUSESNAPPY<br>
+ endif<br>
+ <br>
+ ifeq ($(USEZSTD), on)<br>
+ LIBS :=3D -lzstd $(LIBS)<br>
+-CFLAGS +=3D -DUSEZSTD<br>
++CFLAGS_COMMON +=3D -DUSEZSTD<br>
+ endif<br>
+ <br>
+ ifeq ($(DEBUG), on)<br>
+@@ -104,14 +106,14 @@ LIBS :=3D $(LIBS) $(call try-run,\<br>
+ all: makedumpfile<br>
+ <br>
+ $(OBJ_PART): $(SRC_PART)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) -c -o ./$@ $(VPATH)$(@:.o=3D.c)<br>
++=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS_COMMON) -c -o ./$@ $(VPATH)$(@:.o=3D.=
c)<br>
+ <br>
+ $(OBJ_ARCH): $(SRC_ARCH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p $(@D)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS_ARCH) -c -o ./$@ $(VPATH)$(@:.o=
=3D.c)<br>
+ <br>
+ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -=
rdynamic -o $@ $&lt; $(LIBS)<br>
++=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_=
ARCH) -rdynamic -o $@ $&lt; $(LIBS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@sed -e &quot;s/@DATE@/$(DATE)/&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s/@VERSION@/$(VERSION)/=
&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(VPATH)<a href=3D"http://makedu=
mpfile.8.in" rel=3D"noreferrer" target=3D"_blank">makedumpfile.8.in</a> &gt=
; $(VPATH)makedumpfile.8<br>
+@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(VPATH)<a href=3D"http://makedu=
mpfile.conf.5.in" rel=3D"noreferrer" target=3D"_blank">makedumpfile.conf.5.=
in</a> &gt; $(VPATH)makedumpfile.conf.5<br>
+ <br>
+ eppic_makedumpfile.so: extension_eppic.c<br>
+-=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@ e=
xtension_eppic.c -fPIC -leppic -ltinfo<br>
++=C2=A0 =C2=A0 =C2=A0 $(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic =
-o $@ extension_eppic.c -fPIC -leppic -ltinfo<br>
+ <br>
+ clean:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfi=
le makedumpfile.8 makedumpfile.conf.5<br>
diff --git a/meta/recipes-kernel/makedumpfile/<a href=3D"http://makedumpfil=
e_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">makedumpfile_1.7.5.bb</a> =
b/meta/recipes-kernel/makedumpfile/<a href=3D"http://makedumpfile_1.7.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">makedumpfile_1.7.5.bb</a><br>
new file mode 100644<br>
index 0000000000..85b44c4941<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/makedumpfile/<a href=3D"http://makedumpfile_1.7.5=
.bb" rel=3D"noreferrer" target=3D"_blank">makedumpfile_1.7.5.bb</a><br>
@@ -0,0 +1,62 @@<br>
+SUMMARY =3D &quot;VMcore extraction tool&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 This program is used to extract a subset of the memory avail=
able either \<br>
+=C2=A0 =C2=A0 via /dev/mem or /proc/vmcore (for crashdumps). It is used to=
 get memory \<br>
+=C2=A0 =C2=A0 images without extra uneeded information (zero pages, usersp=
ace programs, \<br>
+=C2=A0 =C2=A0 etc). \<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/makedumpfile/makedumpfile=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/makedumpfile/make=
dumpfile</a>&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+<br>
+SRCBRANCH ?=3D &quot;master&quot;<br>
+SRCREV =3D &quot;c266469347d49287be38059d45e7aaa454db9cb2&quot;<br>
+<br>
+DEPENDS =3D &quot;bzip2 zlib elfutils xz&quot;<br>
+RDEPENDS:${PN}-tools =3D &quot;perl ${PN}&quot;<br>
+<br>
+# mips/rv32 would not compile.<br>
+COMPATIBLE_HOST:mipsarcho32 =3D &quot;null&quot;<br>
+COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-tools&quot;<br>
+FILES:${PN}-tools =3D &quot;${bindir}/*.pl&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/makedumpfile/makedumpfile=
;branch=3D$%7BSRCBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/makedumpfile/makedumpfile;branch=3D${SRCBRANCH};protocol=
=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \<br>
+&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
+<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+# If we do not specify TARGET, makedumpfile will build for the host but us=
e the<br>
+# target gcc.<br>
+#<br>
+<br>
+MAKEDUMPFILE_TARGET ?=3D &quot;${TARGET_ARCH}&quot;<br>
+MAKEDUMPFILE_TARGET:powerpc =3D &quot;ppc&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 LINKTYPE=3Dstatic \<br>
+=C2=A0 =C2=A0 TARGET=3D${MAKEDUMPFILE_TARGET} \<br>
+=C2=A0 =C2=A0 ${PACKAGECONFIG_CONFARGS} \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[lzo] =3D &quot;USELZO=3Don,USELZO=3Doff,lzo&quot;<br>
+PACKAGECONFIG[snappy] =3D &quot;USESNAPPY=3Don,USESNAPPY=3Doff,snappy&quot=
;<br>
+PACKAGECONFIG[zstd] =3D &quot;USEZSTD=3Don,USEZSTD=3Doff,zstd&quot;<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 mkdir -p ${D}/usr/bin<br>
+=C2=A0 =C2=A0 install -m 755 ${S}/makedumpfile ${D}/usr/bin<br>
+=C2=A0 =C2=A0 install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin<br>
+<br>
+=C2=A0 =C2=A0 mkdir -p ${D}/etc/<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.=
conf.sample<br>
+}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205734): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_20=
5734&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN=
6DEeLWV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&amp;s=3DiuXTW-Ub_9vMeZzXZwrw=
8VEXnx4g51o3Jh70b0xyT98&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_205734&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1g=
BJ&amp;s=3DiuXTW-Ub_9vMeZzXZwrw8VEXnx4g51o3Jh70b0xyT98&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_108998255_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYSCthF=
8ucEUy5NbXbB1A1gBJ&amp;s=3DWw14-pFkYrpTaEl3oHF2KZ1bJvEYFxeiKM_D1gK68Us&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_108998255_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-Xt=
wZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&amp;s=3DWw14-pFkYrpTaEl3oHF2KZ1bJvEYFxeiK=
M_D1gK68Us&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6DEeLWV4aG-XtwZpHqKi3mYSC=
thF8ucEUy5NbXbB1A1gBJ&amp;s=3D7BYZqSteRGpT5fqGqp91yM52TDwqc9A6f3yp_DAy8FU&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP-43Iy1a-1QaUUSrWN6D=
EeLWV4aG-XtwZpHqKi3mYSCthF8ucEUy5NbXbB1A1gBJ&amp;s=3D7BYZqSteRGpT5fqGqp91yM=
52TDwqc9A6f3yp_DAy8FU&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000018412106246c78f9--

