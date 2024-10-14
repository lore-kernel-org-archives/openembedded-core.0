Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34CDD1813A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 19:24:52 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.447.1728933883691137954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 12:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8STs57C;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e4d624ac28so2881175b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728933883; x=1729538683; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fLuKL4+HywF32Qov9CEIgDE4sAfHNNjVUz3jwOYeGg=;
        b=B8STs57CFjotdku3pbeBmWnPdbwb9VnzRe5L9bx9IChUfCDS6Hxhg4hwPB4fFZD3aP
         R+KxtzHLIeARymgjSdbyc6ezyOAK0nIR+RIdQHJNiaqwmP6Ou0uOJGbLdkyGRc6NuuQb
         Pr4GuQj7TFGTrL57tiC7wFS1M4+ybP81PC3jEB2tFZjalix2KS2961ZJpOYlDCWydBEH
         k/H1I4YixlP/gCQfCFi3f3c2DKSyQyb/qunCNaZckOFti8Tmez7gar+5yPWbK/v+iG/W
         AKt9GGOPv1p55YM1wLc6dTg8heph3OSImjAoHf/9AnDra5yp9G5pel0qU47OTLw25Jgc
         TlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728933883; x=1729538683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fLuKL4+HywF32Qov9CEIgDE4sAfHNNjVUz3jwOYeGg=;
        b=QxQnvs41d9dwkb2Kb3eCv++6ZApkJTW8JTo2awtFkLujwskWMZd/8+YBmGE0mQvFRv
         OUdQHgk55waG/E1eILqZ+eYGwIBlFlYWiVo0avI/In0bJRZmasC3K21BZCE4nNQD1/0U
         r++ots+TELGS+I61yXTKBq+Z/BblJ9QRfUzSzYaKoEx+WriRJN689Ohen35G12OGuzOb
         YyDKP7Pdy/gxzCU5auKawN63BQMmBmXAGdQFIkGNIvQg/cLQwv42FldbMSqapU4pS8fj
         NMjAvOztOSp2G7IlTFCIAKsV5FZJo3B8k8jVaGwpbBplRSIiWLUmVc8POL06ReUkLCll
         UcpA==
X-Gm-Message-State: AOJu0YyAHxF5FkeVjsQseKvZ5PK1JvoXVnOMzJMQUorsEDAIaxEzr5xZ
	VmwaipqhX9owj8+3hMfpjkjkLz4dngXcm3WopcLOK9apKUI90LOo4wKpGGBzyEFqTimY6RNTckC
	eTXG2bhoPiFLF+v3OjrbFIoIgumE=
X-Google-Smtp-Source: AGHT+IHOaA+V8VD+K7GyB2w/4SwAHkXgZ6nvX7e4K4lgKdnzb+54Mo2T26wTCEGdnH64n30k+DCUEnGIqRkCz49Ymg8=
X-Received: by 2002:a05:6808:2e43:b0:3e0:3946:b85 with SMTP id
 5614622812f47-3e5e6f941eemr288334b6e.14.1728933882780; Mon, 14 Oct 2024
 12:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241014091117.2953622-2-ecordonnier@snap.com>
In-Reply-To: <20241014091117.2953622-2-ecordonnier@snap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Oct 2024 12:24:16 -0700
Message-ID: <CAMKF1sqkq=em-M6qxAkWdL6hWfMgS0ZsDLQtkM8fhwEUT5ZDgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 19:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205793

don't forget to send a patch to remove it from meta-oe at the same time.

On Mon, Oct 14, 2024 at 2:12=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The kdump script from kexec-tools does not work without makedumpfile (see=
 https://git.yoctoproject.org/poky/tree/meta/recipes-kernel/kexec/kexec-too=
ls/kdump#n14 ).
> Thus, let's import makedumpfile from meta-openembedded/meta-oe/recipes-ke=
rnel/makedumpfile and make kexec-tools RDEPENDS on makedumpfile.
>
> makedumpfile is the utility which reads /proc/vmcore after a kernel panic=
 and creates a kdump file under /var/crash/.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../kexec/kexec-tools_2.0.29.bb               |   1 +
>  ...makedumpfile-replace-hardcode-CFLAGS.patch | 139 ++++++++++++++++++
>  .../makedumpfile/makedumpfile_1.7.5.bb        |  62 ++++++++
>  4 files changed, 203 insertions(+)
>  create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-ma=
kedumpfile-replace-hardcode-CFLAGS.patch
>  create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.b=
b
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index b529786214..ad2544741f 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -490,6 +490,7 @@ RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liez=
hi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-make =3D "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-makedepend =3D "Robert Yang <liezhi.yang@windriver.=
com>"
>  RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
> +RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <ecordonnier@s=
nap.com>"
>  RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
>  RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-man-pages =3D "Hongxu Jia <hongxu.jia@windriver.com=
>"
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb b/meta/recip=
es-kernel/kexec/kexec-tools_2.0.29.bb
> index 2c2901f19e..be24d064bb 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>                      file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=
=3Daf10f6ae4a8715965e648aa687ad3e09 \
>                      "
>  DEPENDS =3D "zlib xz"
> +RDEPENDS:${PN} =3D "makedumpfile"
>
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${=
PV}.tar.gz \
>             file://kdump \
> diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpf=
ile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedu=
mpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
> new file mode 100644
> index 0000000000..96a996f616
> --- /dev/null
> +++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-rep=
lace-hardcode-CFLAGS.patch
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
> +-CFLAGS      :=3D $(CFLAGS_BASE) -DVERSION=3D'"$(VERSION)"' -DRELEASE_DA=
TE=3D'"$(DATE)"'
> +-CFLAGS_ARCH :=3D $(CFLAGS_BASE)
> +-# LDFLAGS =3D -L/usr/local/lib -I/usr/local/include
> +-
> + HOST_ARCH :=3D $(shell uname -m)
> + # Use TARGET as the target architecture if specified.
> + # Defaults to uname -m
> +@@ -24,26 +18,34 @@ endif
> + ARCH :=3D $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc=
64/ \
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
> + SRC_BASE =3D makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h =
sadump_info.h
> + SRC_PART =3D print_info.c dwarf_info.c elf_info.c erase_info.c sadump_i=
nfo.c cache.c tools.c printk.c detect_cycle.c
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
@ $< $(LIBS)
> ++      $(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynam=
ic -o $@ $< $(LIBS)
> +       @sed -e "s/@DATE@/$(DATE)/" \
> +            -e "s/@VERSION@/$(VERSION)/" \
> +            $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
> +@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
> +            $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
> +
> + eppic_makedumpfile.so: extension_eppic.c
> +-      $(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppi=
c.c -fPIC -leppic -ltinfo
> ++      $(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic -o $@ extensi=
on_eppic.c -fPIC -leppic -ltinfo
> +
> + clean:
> +       rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8 =
makedumpfile.conf.5
> diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb b/met=
a/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
> new file mode 100644
> index 0000000000..85b44c4941
> --- /dev/null
> +++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
> @@ -0,0 +1,62 @@
> +SUMMARY =3D "VMcore extraction tool"
> +DESCRIPTION =3D "\
> +    This program is used to extract a subset of the memory available eit=
her \
> +    via /dev/mem or /proc/vmcore (for crashdumps). It is used to get mem=
ory \
> +    images without extra uneeded information (zero pages, userspace prog=
rams, \
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
> +    git://github.com/makedumpfile/makedumpfile;branch=3D${SRCBRANCH};pro=
tocol=3Dhttps \
> +    file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
> +
> +SECTION =3D "base"
> +
> +# If we do not specify TARGET, makedumpfile will build for the host but =
use the
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
> +    install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.conf.sam=
ple
> +}
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205734): https://lists.openembedded.org/g/openembedde=
d-core/message/205734
> Mute This Topic: https://lists.openembedded.org/mt/108998255/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

