Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEA5D1A45F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:03:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.52346.1728903784699574303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L08URwtU;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e7e73740so1304991e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728903783; x=1729508583; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qXtpe2NAdtXByg3uvIVEs0Z0N/zYkIneCObef3XYZaA=;
        b=L08URwtUPaXHuHtM+ky2lfQUbRWvJbM3AW9fTSZMyP+8TVLsXcYB290O7UKFuzP2dg
         /2W1L3ehvOKo9riuBlV5MTJxm52k1uG4UjG0auzpxeD6nop3ysE6ZK6mTd6jpolgSIAf
         7wU+Wzfn5JC7BAEVfjpMVVna3WCzkqQP1cQWFeIPq4jmxZt+aBeKMQisRnkhvrE/K01i
         eL64D3PA68atTwpVoVbMGvRUV9NvHQIdy7gq0lDXM+tQI2RTAldqUVy1vWSU+8euQrWq
         K4/p97UD/E8C3meyjylAtFobV6+xG4FZwttoPK85e+RvHu1WArfATZ0zeKzE+ghZysAS
         vtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903783; x=1729508583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXtpe2NAdtXByg3uvIVEs0Z0N/zYkIneCObef3XYZaA=;
        b=mds8ZIfKkOBoQr6vF3cH1PE7gWe27dk8HWMwwferqqzmchVPeWaTAXBiuz4eibKaec
         heS8EUebtDvzK8HMsEarxjmhXO7ang94LfFf5MKw93rcqHLAnmUyWohPQ9g1zgIRMQV2
         EBJd5fMuDbSFF45Bj69Nr10VoNpIRHoxjxrsbFEVdZN9Uxv1L1TbfSv0yDXzbBOG4dij
         Cx80mRi5Yn3PiTOrU7g6VserKYYm4S4kulI4P8WlG92vLSRxSI3OGbwslzOdgkh6PuuL
         Tb4ATdRNdH4r5TexZ6gt4fS/AaLJSiz2GcCuaf0cSdHhmwewXqCs2Nkw/fRmt8X+/hXY
         o3MQ==
X-Gm-Message-State: AOJu0Yw+7o+b2AidX+608uDEL7yBzd049m905YI77NORW7gT3K/EWhaZ
	cYwwKAOtpO0iz+k2w++TCy8oaMkP9rX/pNqWbJ+LbwanitnTwuES9lA1nDQjUZ8B2fgnuf6uusn
	jX9Xl8TK9bWw0LHDoSDs/D/8m2xk=
X-Google-Smtp-Source: AGHT+IGksqeeAIoeRjNd0Rc+UFWTVxmodsRjJmGqpi5vLoR1D6vVGLu3MAI6mwqXLJs81Ob7+Y7Bh3+o+kXYMrjDIwc=
X-Received: by 2002:a05:6512:a8a:b0:536:54d6:e6d6 with SMTP id
 2adb3069b0e04-539da3c5ecbmr5007044e87.17.1728903782189; Mon, 14 Oct 2024
 04:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241014091117.2953622-2-ecordonnier@snap.com>
In-Reply-To: <20241014091117.2953622-2-ecordonnier@snap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 13:02:50 +0200
Message-ID: <CANNYZj8hY_DcBbbp1XVdURFp5k8C0vTkGZba684vAdvW70bQOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c9d36706246dc72f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205750

--000000000000c9d36706246dc72f
Content-Type: text/plain; charset="UTF-8"

How was this added in the first place without bringing in this required
dependency?

Alex

On Mon 14. Oct 2024 at 11.12, Etienne Cordonnier via lists.openembedded.org
<ecordonnier=snap.com@lists.openembedded.org> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The kdump script from kexec-tools does not work without makedumpfile (see
> https://git.yoctoproject.org/poky/tree/meta/recipes-kernel/kexec/kexec-tools/kdump#n14
> ).
> Thus, let's import makedumpfile from
> meta-openembedded/meta-oe/recipes-kernel/makedumpfile and make kexec-tools
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
> meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
>  create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index b529786214..ad2544741f 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -490,6 +490,7 @@ RECIPE_MAINTAINER:pn-m4-native = "Robert Yang <
> liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-make = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-makedepend = "Robert Yang <liezhi.yang@windriver.com
> >"
>  RECIPE_MAINTAINER:pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
> +RECIPE_MAINTAINER:pn-makedumpfile = "Etienne Cordonnier <
> ecordonnier@snap.com>"
>  RECIPE_MAINTAINER:pn-make-mod-scripts = "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-man-db = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-man-pages = "Hongxu Jia <hongxu.jia@windriver.com>"
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> index 2c2901f19e..be24d064bb 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09
> \
>                      "
>  DEPENDS = "zlib xz"
> +RDEPENDS:${PN} = "makedumpfile"
>
>  SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
>             file://kdump \
> diff --git
> a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
> b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
> new file mode 100644
> index 0000000000..96a996f616
> --- /dev/null
> +++
> b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
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
> + CC    = gcc
> + endif
> +
> +-CFLAGS_BASE := $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
> +-              -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> +-CFLAGS      := $(CFLAGS_BASE) -DVERSION='"$(VERSION)"'
> -DRELEASE_DATE='"$(DATE)"'
> +-CFLAGS_ARCH := $(CFLAGS_BASE)
> +-# LDFLAGS = -L/usr/local/lib -I/usr/local/include
> +-
> + HOST_ARCH := $(shell uname -m)
> + # Use TARGET as the target architecture if specified.
> + # Defaults to uname -m
> +@@ -24,26 +18,34 @@ endif
> + ARCH := $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/
> \
> +                              -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                              -e s/s390x/s390/ -e s/parisc64/parisc/ \
> +-                             -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)
> ++                             -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ \
> ++                             -e s/_powerpc_/_powerpc32_/)
> +
> + CROSS :=
> + ifneq ($(TARGET), $(HOST_ARCH))
> + CROSS := -U__$(HOST_ARCH)__
> + endif
> +
> +-CFLAGS += -D__$(ARCH)__ $(CROSS)
> + CFLAGS_ARCH += -D__$(ARCH)__ $(CROSS)
> +
> +-ifeq ($(ARCH), powerpc64)
> +-CFLAGS += -m64
> ++ifeq ($(ARCH), __powerpc64__)
> + CFLAGS_ARCH += -m64
> + endif
> +
> +-ifeq ($(ARCH), powerpc32)
> +-CFLAGS += -m32
> ++ifeq ($(ARCH), __powerpc32__)
> + CFLAGS_ARCH += -m32
> + endif
> +
> ++CFLAGS_ARCH += $(CFLAGS) \
> ++              -D_FILE_OFFSET_BITS=64 \
> ++              -D_LARGEFILE_SOURCE \
> ++              -D_LARGEFILE64_SOURCE
> ++
> ++CFLAGS_COMMON = $(CFLAGS_ARCH) \
> ++              -DVERSION='"$(VERSION)"' \
> ++              -DRELEASE_DATE='"$(DATE)"'
> ++
> ++
> + SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h
> sadump_info.h
> + SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c
> sadump_info.c cache.c tools.c printk.c detect_cycle.c
> + OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
> +@@ -52,12 +54,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
> +
> + LIBS = -ldw -lbz2 -ldl -lelf -lz
> + ifneq ($(LINKTYPE), dynamic)
> +-LIBS := -static $(LIBS) -llzma
> ++LIBS := $(LIBS) -llzma
> + endif
> +
> + ifeq ($(USELZO), on)
> + LIBS := -llzo2 $(LIBS)
> +-CFLAGS += -DUSELZO
> ++CFLAGS_COMMON += -DUSELZO
> + endif
> +
> + ifeq ($(USESNAPPY), on)
> +@@ -65,12 +67,12 @@ LIBS := -lsnappy $(LIBS)
> + ifneq ($(LINKTYPE), dynamic)
> + LIBS := $(LIBS) -lstdc++
> + endif
> +-CFLAGS += -DUSESNAPPY
> ++CFLAGS_COMMON += -DUSESNAPPY
> + endif
> +
> + ifeq ($(USEZSTD), on)
> + LIBS := -lzstd $(LIBS)
> +-CFLAGS += -DUSEZSTD
> ++CFLAGS_COMMON += -DUSEZSTD
> + endif
> +
> + ifeq ($(DEBUG), on)
> +@@ -104,14 +106,14 @@ LIBS := $(LIBS) $(call try-run,\
> + all: makedumpfile
> +
> + $(OBJ_PART): $(SRC_PART)
> +-      $(CC) $(CFLAGS) -c -o ./$@ $(VPATH)$(@:.o=.c)
> ++      $(CC) $(CFLAGS_COMMON) -c -o ./$@ $(VPATH)$(@:.o=.c)
> +
> + $(OBJ_ARCH): $(SRC_ARCH)
> +       @mkdir -p $(@D)
> +       $(CC) $(CFLAGS_ARCH) -c -o ./$@ $(VPATH)$(@:.o=.c)
> +
> + makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
> +-      $(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@
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
> +SUMMARY = "VMcore extraction tool"
> +DESCRIPTION = "\
> +    This program is used to extract a subset of the memory available
> either \
> +    via /dev/mem or /proc/vmcore (for crashdumps). It is used to get
> memory \
> +    images without extra uneeded information (zero pages, userspace
> programs, \
> +    etc). \
> +"
> +HOMEPAGE = "https://github.com/makedumpfile/makedumpfile"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +LICENSE = "GPL-2.0-only"
> +
> +SRCBRANCH ?= "master"
> +SRCREV = "c266469347d49287be38059d45e7aaa454db9cb2"
> +
> +DEPENDS = "bzip2 zlib elfutils xz"
> +RDEPENDS:${PN}-tools = "perl ${PN}"
> +
> +# mips/rv32 would not compile.
> +COMPATIBLE_HOST:mipsarcho32 = "null"
> +COMPATIBLE_HOST:riscv32 = "null"
> +
> +PACKAGES =+ "${PN}-tools"
> +FILES:${PN}-tools = "${bindir}/*.pl"
> +
> +SRC_URI = "\
> +    git://
> github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https
> <http://github.com/makedumpfile/makedumpfile;branch=$%7BSRCBRANCH%7D;protocol=https>
> \
> +    file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> +
> +SECTION = "base"
> +
> +# If we do not specify TARGET, makedumpfile will build for the host but
> use the
> +# target gcc.
> +#
> +
> +MAKEDUMPFILE_TARGET ?= "${TARGET_ARCH}"
> +MAKEDUMPFILE_TARGET:powerpc = "ppc"
> +
> +EXTRA_OEMAKE = "\
> +    LINKTYPE=static \
> +    TARGET=${MAKEDUMPFILE_TARGET} \
> +    ${PACKAGECONFIG_CONFARGS} \
> +"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[lzo] = "USELZO=on,USELZO=off,lzo"
> +PACKAGECONFIG[snappy] = "USESNAPPY=on,USESNAPPY=off,snappy"
> +PACKAGECONFIG[zstd] = "USEZSTD=on,USEZSTD=off,zstd"
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205734):
> https://lists.openembedded.org/g/openembedded-core/message/205734
> Mute This Topic: https://lists.openembedded.org/mt/108998255/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c9d36706246dc72f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">How was this added in the first place wi=
thout bringing in this required dependency?<br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Alex</div></div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon 14. Oct 2024 at 11.12, Etienn=
e Cordonnier via <a href=3D"http://lists.openembedded.org" target=3D"_blank=
">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@l=
ists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D=
"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
The kdump script from kexec-tools does not work without makedumpfile (see <=
a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-kernel/kexec/=
kexec-tools/kdump#n14" rel=3D"noreferrer" target=3D"_blank">https://git.yoc=
toproject.org/poky/tree/meta/recipes-kernel/kexec/kexec-tools/kdump#n14</a>=
 ).<br>
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
View/Reply Online (#205734): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205734" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205734</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108998255/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108998255/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c9d36706246dc72f--

