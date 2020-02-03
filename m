Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id D5CC161061
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 16:42:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id p23so16727227edr.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 08:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I1FDADDQKjCdMbmJysz5COh35XWEuXLPZruZg+FyYsg=;
	b=TkFtUZxHfDg6Oi26JY0m2ZhN86TTW9oP4eMH28LFNI2gV+EciNREOgbNpozBNKHlRG
	l09+9R/dfozImKcxG5XbEtUmSnr6wQGaFHWzNTmIxhWEA8pjLIt8fcThBAE67PNFDvUu
	OIzoyXNGDnbIcAqgGtHMYV0GXyvmrdYoAo3vPlYGulw8u69fP1WHOmxLickglfM5sZ/w
	istctAf+z5lnTh/57qwtxrvu09N1mYJ5GX9NnxGgAwP7CH7GhinR+M/fxn3UBGqEFDrz
	RBJBcp3lkhxBIEQBTDIM/EWRwFdmawmbdgniXx6ggIhhz6J4GX9isw6KnJ2nbusxTZld
	SLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I1FDADDQKjCdMbmJysz5COh35XWEuXLPZruZg+FyYsg=;
	b=aPolxk2Uijv0Us2sMZk06XGPrgtds53H1/E/QlV0kE5Jg5G8ofPISDd8hRtzDor8TQ
	6WNKUM/EUF9tiz6tZCOwOtw/lg2QXVfWgc9SwC0UOODeB9L82pQlQ6W/8kPsje2CzJ5m
	xNlnpCd403YB1XV+j/3hgKj3c6ArUguZ631tVx9c97Zti+P5AYVx/PCkXz1XAKCj8uPF
	pU1I3cKPzhc2Q0UwXCCXb+8Qg8v+2ghhTmqnC35jL6oJyAPhINdCDXsuAgFcb7OAt8s9
	YcWgn4pXswQPyk4bLI7m0pySBRlkEfbYy5ioxPMjwTq4P8Cy8N11G2Hsl/nMlCJCa08d
	aSbA==
X-Gm-Message-State: APjAAAVmERqkv11up6HIBmJCoUvfH8b7DfVQ14F3UemtCRWy6fhACo/d
	EH1POW5mwwJ/mSccp9jgmXkLI/aKUzTUrGljQ2fl6aMW
X-Google-Smtp-Source: APXvYqz0PQC1kJLPDmf93br+ieSLEte4qae00MVXQ+N2YPcQ/LWXTpoxK64hjonYJ2eq31joUK1rqWlV48tf712ZBlw=
X-Received: by 2002:a17:906:5a94:: with SMTP id
	l20mr22216156ejq.192.1580748162001; 
	Mon, 03 Feb 2020 08:42:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<e6b6484beb730f63714567d89da06834fbbbbd3c.1580248809.git.bruce.ashfield@gmail.com>
	<CAMKF1so3M-Zza8Oz54Z=pXmykU4686nKWL3JLK8f-bBde-ueiA@mail.gmail.com>
In-Reply-To: <CAMKF1so3M-Zza8Oz54Z=pXmykU4686nKWL3JLK8f-bBde-ueiA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 3 Feb 2020 17:42:31 +0100
Message-ID: <CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto: introduce 5.4 recipes
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
X-List-Received-Date: Mon, 03 Feb 2020 16:42:42 -0000
Content-Type: multipart/alternative; boundary="000000000000acee17059dae9c10"

--000000000000acee17059dae9c10
Content-Type: text/plain; charset="UTF-8"

It fails to build with gold enabled (ld-is-gold in DISTRO_FEATURES)

First olddefconfig fails with "gold linker 'x86_64-oe-linux-ld' not
supported" and then it fails with a bit misleading error about oldnoconfig
(which is called only when oddefconfig fails) and then the whole log
repeats itself again, whole log.do_configure.4075 follows:

make[1]: Entering directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --olddefconfig Kconfig
scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not supported
make[2]: ***
[/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:73:
olddefconfig] Error 1
make[1]: ***
[/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefile:567:
olddefconfig] Error 2
make[1]: Leaving directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
make: *** [Makefile:179: sub-make] Error 2
make: Leaving directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
NOTE: make HOSTCC=gcc
 -isystem/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/include
-O2 -pipe
-L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib

-L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib
                        -Wl,--enable-new-dtags
-Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib

-Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib

-Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib

-Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib
                        -Wl,-O1 -Wl,--allow-shlib-undefined
-Wl,--dynamic-linker=/OE/build/oe-core/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
HOSTCPP=gcc  -E -C
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source
O=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build
CC=x86_64-oe-linux-gcc  -fuse-ld=bfd
-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0=/usr/src/debug/linux-yocto/5.4.15-r0

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0=/usr/src/debug/linux-yocto/5.4.15-r0

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot=

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native=
 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source=/usr/src/kernel
oldnoconfig
make: Entering directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
make[1]: Entering directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
  GEN     Makefile
make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
make[1]: ***
[/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefile:567:
oldnoconfig] Error 2
make[1]: Leaving directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
make: *** [Makefile:179: sub-make] Error 2
make: Leaving directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Execution of
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/temp/run.do_configure.4075'
failed with exit code 1:
make: Entering directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
make[1]: Entering directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --olddefconfig Kconfig
scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not supported
make[2]: ***
[/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:73:
olddefconfig] Error 1
make[1]: ***
[/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefile:567:
olddefconfig] Error 2
make[1]: Leaving directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
make: *** [Makefile:179: sub-make] Error 2
make: Leaving directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
make: Entering directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
make[1]: Entering directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
  GEN     Makefile
make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
make[1]: ***
[/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefile:567:
oldnoconfig] Error 2
make[1]: Leaving directory
'/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
make: *** [Makefile:179: sub-make] Error 2
make: Leaving directory
'/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
WARNING: exit code 1 from a shell command.

On Fri, Jan 31, 2020 at 10:37 AM Khem Raj <raj.khem@gmail.com> wrote:

> kernel-seltest fails now to build
>
> https://errors.yoctoproject.org/Errors/Details/308578/
>
> On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > This creates recipes for the v5.4/* branches of the linux-yocto
> > reference kernel.
> >
> > preempt-rt, yaffs2, aufs5 and reference board specific patches are
> > part of these branches. All major architectures: x86,x86-64,ARM,
> > ARM64,ppc,mips and mips64 have been feature tested against this
> > reference.
> >
> > 5.4 is a LTS release, and as such will receive -stable updates
> > for the duration of upstream korg support.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
> >  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
> >  3 files changed, 130 insertions(+)
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > new file mode 100644
> > index 0000000000..52f0e3b833
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > @@ -0,0 +1,44 @@
> > +KBRANCH ?= "v5.4/standard/preempt-rt/base"
> > +
> > +require recipes-kernel/linux/linux-yocto.inc
> > +
> > +# Skip processing of this recipe if it is not explicitly specified as
> the
> > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> > +# to build multiple virtual/kernel providers, e.g. as dependency of
> > +# core-image-rt-sdk, core-image-rt.
> > +python () {
> > +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and
> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> > +        raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > +}
> > +
> > +SRCREV_machine ?= "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
> > +SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
> > +
> > +SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
> > +           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=$%7BKMETA%7D>
> "
> > +
> > +LINUX_VERSION ?= "5.4.15"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > +
> > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> > +DEPENDS += "openssl-native util-linux-native"
> > +
> > +PV = "5.4.15"
> > +
> > +KMETA = "kernel-meta"
> > +KCONF_BSP_AUDIT_LEVEL = "2"
> > +
> > +LINUX_KERNEL_TYPE = "preempt-rt"
> > +
> > +COMPATIBLE_MACHINE =
> "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
> > +
> > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > +
> > +# Functionality flags
> > +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
> features/taskstats/taskstats.scc"
> > +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc
> features/drm-bochs/drm-bochs.scc"
> > +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > new file mode 100644
> > index 0000000000..a028b37548
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > @@ -0,0 +1,32 @@
> > +KBRANCH ?= "v5.4/standard/tiny/base"
> > +KBRANCH_qemuarm  ?= "v5.4/standard/tiny/arm-versatile-926ejs"
> > +
> > +LINUX_KERNEL_TYPE = "tiny"
> > +KCONFIG_MODE = "--allnoconfig"
> > +
> > +require recipes-kernel/linux/linux-yocto.inc
> > +
> > +LINUX_VERSION ?= "5.4.15"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > +
> > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> > +DEPENDS += "openssl-native util-linux-native"
> > +
> > +KMETA = "kernel-meta"
> > +KCONF_BSP_AUDIT_LEVEL = "2"
> > +
> > +SRCREV_machine_qemuarm ?= "9eeafafc19278b5c5376ba1fd9eae26626730458"
> > +SRCREV_machine ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
> > +
> > +PV = "5.4.15"
> > +
> > +SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
> > +           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=$%7BKMETA%7D>
> "
> > +
> > +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> > +
> > +# Functionality flags
> > +KERNEL_FEATURES = ""
> > +
> > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > new file mode 100644
> > index 0000000000..9fbc47d79e
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > @@ -0,0 +1,54 @@
> > +KBRANCH ?= "v5.4/standard/base"
> > +
> > +require recipes-kernel/linux/linux-yocto.inc
> > +
> > +# board specific branches
> > +KBRANCH_qemuarm  ?= "v5.4/standard/arm-versatile-926ejs"
> > +KBRANCH_qemuarm64 ?= "v5.4/standard/qemuarm64"
> > +KBRANCH_qemumips ?= "v5.4/standard/mti-malta32"
> > +KBRANCH_qemuppc  ?= "v5.4/standard/qemuppc"
> > +KBRANCH_qemuriscv64  ?= "v5.4/standard/base"
> > +KBRANCH_qemux86  ?= "v5.4/standard/base"
> > +KBRANCH_qemux86-64 ?= "v5.4/standard/base"
> > +KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
> > +
> > +SRCREV_machine_qemuarm ?= "637086def651a00b1274a80cd3ca740e271eb0f9"
> > +SRCREV_machine_qemuarm64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_machine_qemumips ?= "bfe04753d00b0f36848bb8204020b69d0e78f02a"
> > +SRCREV_machine_qemuppc ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_machine_qemuriscv64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_machine_qemux86 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_machine_qemux86-64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_machine_qemumips64 ?= "81cd255c72add4dcf06603250869f739bb4f05cb"
> > +SRCREV_machine ?= "cdda35317561d2741b396efa623ace0bd2212c16"
> > +SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
> > +
> > +# remap qemuarm to qemuarma15 for the 5.4 kernel
> > +# KMACHINE_qemuarm ?= "qemuarma15"
> > +
> > +SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>;
> \
> > +           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=$%7BKMETA%7D>
> "
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > +LINUX_VERSION ?= "5.4.15"
> > +
> > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> > +DEPENDS += "openssl-native util-linux-native"
> > +
> > +PV = "5.4.15"
> > +
> > +KMETA = "kernel-meta"
> > +KCONF_BSP_AUDIT_LEVEL = "2"
> > +
> > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > +
> > +COMPATIBLE_MACHINE =
> "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> > +
> > +# Functionality flags
> > +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc
> features/drm-bochs/drm-bochs.scc"
> > +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES",
> "mx32", " cfg/x32.scc", "" ,d)}"
> > +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000acee17059dae9c10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It fails to build with gold enabled (ld-is-gold in DISTRO_=
FEATURES)<div><br></div><div>First olddefconfig fails with &quot;gold linke=
r &#39;x86_64-oe-linux-ld&#39; not supported&quot; and then it fails with a=
 bit misleading error about=C2=A0oldnoconfig (which is called only when odd=
efconfig fails) and then the whole log repeats itself again, whole=C2=A0log=
.do_configure.4075 follows:</div><div><div></div></div><div><br></div><div>=
make[1]: Entering directory &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_6=
4-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#39;<br>=
=C2=A0 GEN =C2=A0 =C2=A0 Makefile<br>=C2=A0 HOSTCC =C2=A0scripts/basic/fixd=
ep<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/conf.o<br>=C2=A0 HOSTCC =C2=A0scr=
ipts/kconfig/confdata.o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/expr.o<br>=
=C2=A0 HOSTCC =C2=A0scripts/kconfig/lexer.lex.o<br>=C2=A0 HOSTCC =C2=A0scri=
pts/kconfig/parser.tab.o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/preprocess.=
o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/symbol.o<br>=C2=A0 HOSTLD =C2=A0sc=
ripts/kconfig/conf<br>scripts/kconfig/conf =C2=A0--olddefconfig Kconfig<br>=
scripts/Kconfig.include:39: =C2=A0gold linker &#39;x86_64-oe-linux-ld&#39; =
not supported<br>make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source/scripts/kconfig/Makefile:73: olddefconfig] Error 1<br>=
make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-sou=
rce/Makefile:567: olddefconfig] Error 2<br>make[1]: Leaving directory &#39;=
/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/=
linux-qemux86_64-standard-build&#39;<br>make: *** [Makefile:179: sub-make] =
Error 2<br></div><div>make: Leaving directory &#39;/OE/build/oe-core/tmp-gl=
ibc/work-shared/qemux86-64/kernel-source&#39;<br>NOTE: make HOSTCC=3Dgcc =
=C2=A0-isystem/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yo=
cto/5.4.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -L/OE/build/oe-co=
re/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-=
native/usr/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-l=
inux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,--enable=
-new-dtags =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux=
86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/li=
nux-yocto/5.4.15-r0/recipe-sysroot-native/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath,/OE/buil=
d/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-s=
ysroot-native/usr/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work=
/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/OE/build/oe=
-core/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 HO=
STCPP=3Dgcc =C2=A0-E -C /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/=
kernel-source O=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linu=
x-yocto/5.4.15-r0/linux-qemux86_64-standard-build CC=3Dx86_64-oe-linux-gcc =
=C2=A0-fuse-ld=3Dbfd -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/=
qemux86_64-oe-linux/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.=
15-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-=
linux/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebu=
g-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-y=
octo/5.4.15-r0/recipe-sysroot=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tm=
p-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-nativ=
e=3D =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work-shared/qem=
ux86-64/kernel-source=3D/usr/src/kernel oldnoconfig<br>make: Entering direc=
tory &#39;/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source&=
#39;<br>make[1]: Entering directory &#39;/OE/build/oe-core/tmp-glibc/work/q=
emux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#3=
9;<br>=C2=A0 GEN =C2=A0 =C2=A0 Makefile<br>make[2]: *** No rule to make tar=
get &#39;oldnoconfig&#39;.=C2=A0 Stop.<br>make[1]: *** [/OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/Makefile:567: oldnoconfig] Er=
ror 2<br>make[1]: Leaving directory &#39;/OE/build/oe-core/tmp-glibc/work/q=
emux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#3=
9;<br>make: *** [Makefile:179: sub-make] Error 2<br>make: Leaving directory=
 &#39;/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source&#39;=
<br>ERROR: oe_runmake failed<br>WARNING: exit code 1 from a shell command.<=
br>ERROR: Execution of &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-=
linux/linux-yocto/5.4.15-r0/temp/run.do_configure.4075&#39; failed with exi=
t code 1:<br>make: Entering directory &#39;/OE/build/oe-core/tmp-glibc/work=
-shared/qemux86-64/kernel-source&#39;<br></div><div>make[1]: Entering direc=
tory &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/=
5.4.15-r0/linux-qemux86_64-standard-build&#39;<br>=C2=A0 GEN =C2=A0 =C2=A0 =
Makefile<br>=C2=A0 HOSTCC =C2=A0scripts/basic/fixdep<br>=C2=A0 HOSTCC =C2=
=A0scripts/kconfig/conf.o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/confdata.o=
<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/expr.o<br>=C2=A0 HOSTCC =C2=A0scrip=
ts/kconfig/lexer.lex.o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/parser.tab.o<=
br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/preprocess.o<br>=C2=A0 HOSTCC =C2=A0=
scripts/kconfig/symbol.o<br>=C2=A0 HOSTLD =C2=A0scripts/kconfig/conf<br>scr=
ipts/kconfig/conf =C2=A0--olddefconfig Kconfig<br>scripts/Kconfig.include:3=
9: =C2=A0gold linker &#39;x86_64-oe-linux-ld&#39; not supported<br>make[2]:=
 *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scri=
pts/kconfig/Makefile:73: olddefconfig] Error 1<br>make[1]: *** [/OE/build/o=
e-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefile:567: olddefc=
onfig] Error 2<br>make[1]: Leaving directory &#39;/OE/build/oe-core/tmp-gli=
bc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard=
-build&#39;<br>make: *** [Makefile:179: sub-make] Error 2<br>make: Leaving =
directory &#39;/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-so=
urce&#39;<br>make: Entering directory &#39;/OE/build/oe-core/tmp-glibc/work=
-shared/qemux86-64/kernel-source&#39;<br>make[1]: Entering directory &#39;/=
OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/l=
inux-qemux86_64-standard-build&#39;<br>=C2=A0 GEN =C2=A0 =C2=A0 Makefile<br=
>make[2]: *** No rule to make target &#39;oldnoconfig&#39;.=C2=A0 Stop.<br>=
make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-sou=
rce/Makefile:567: oldnoconfig] Error 2<br>make[1]: Leaving directory &#39;/=
OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/l=
inux-qemux86_64-standard-build&#39;<br>make: *** [Makefile:179: sub-make] E=
rror 2<br>make: Leaving directory &#39;/OE/build/oe-core/tmp-glibc/work-sha=
red/qemux86-64/kernel-source&#39;<br>WARNING: exit code 1 from a shell comm=
and.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 31, 2020 at 10:37 AM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">kernel-seltest fails now to buil=
d<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/308578/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/308578/</a><br>
<br>
On Tue, Jan 28, 2020 at 2:14 PM &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This creates recipes for the v5.4/* branches of the linux-yocto<br>
&gt; reference kernel.<br>
&gt;<br>
&gt; preempt-rt, yaffs2, aufs5 and reference board specific patches are<br>
&gt; part of these branches. All major architectures: x86,x86-64,ARM,<br>
&gt; ARM64,ppc,mips and mips64 have been feature tested against this<br>
&gt; reference.<br>
&gt;<br>
&gt; 5.4 is a LTS release, and as such will receive -stable updates<br>
&gt; for the duration of upstream korg support.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 44 +++++++++++++++<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_5.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">linux-yocto-tiny_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 +++++++++++<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 | 54 ++++=
+++++++++++++++<br>
&gt;=C2=A0 3 files changed, 130 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://l=
inux-yocto-rt_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5=
.4.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://l=
inux-yocto-tiny_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-ti=
ny_5.4.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://l=
inux-yocto_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb<=
/a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-r=
t_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.4.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-yocto-rt_5.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..52f0e3b833<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.4.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.4.bb</a><br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +KBRANCH ?=3D &quot;v5.4/standard/preempt-rt/base&quot;<br>
&gt; +<br>
&gt; +require recipes-kernel/linux/linux-yocto.inc<br>
&gt; +<br>
&gt; +# Skip processing of this recipe if it is not explicitly specified as=
 the<br>
&gt; +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when tryi=
ng<br>
&gt; +# to build multiple virtual/kernel providers, e.g. as dependency of<b=
r>
&gt; +# core-image-rt-sdk, core-image-rt.<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) =3D=3D &qu=
ot;kernel&quot; and d.getVar(&quot;PREFERRED_PROVIDER_virtual/kernel&quot;)=
 !=3D &quot;linux-yocto-rt&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Set PREFE=
RRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
&gt; +}<br>
&gt; +<br>
&gt; +SRCREV_machine ?=3D &quot;5d5d4070c5f8b10a4c6bda37e77071ce37f102d5&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;a48522779fae4887c47268e5f650bf10c94a165c&quot;=
<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=
=3Dmachine</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.=
yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto=
-5.4;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yo=
ctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5=
.4;destsuffix=3D${KMETA}</a>&quot;<br>
&gt; +<br>
&gt; +LINUX_VERSION ?=3D &quot;5.4.15&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f42308=
26c0c6b8814&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;5.4.15&quot;<br>
&gt; +<br>
&gt; +KMETA =3D &quot;kernel-meta&quot;<br>
&gt; +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt; +<br>
&gt; +LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm|qemuarmv5|qe=
muarm64|qemuppc|qemumips)&quot;<br>
&gt; +<br>
&gt; +KERNEL_DEVICETREE_qemuarmv5 =3D &quot;versatile-pb.dtb&quot;<br>
&gt; +<br>
&gt; +# Functionality flags<br>
&gt; +KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc fea=
tures/taskstats/taskstats.scc&quot;<br>
&gt; +KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
&gt; +KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc features/drm-b=
ochs/drm-bochs.scc&quot;<br>
&gt; +KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
&gt; +KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
&gt; +KERNEL_FEATURES_append =3D &quot;${@bb.utils.contains(&quot;DISTRO_FE=
ATURES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;,=
 &quot;&quot; ,d)}&quot;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-t=
iny_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.4.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a028b37548<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.4.bb</a><br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +KBRANCH ?=3D &quot;v5.4/standard/tiny/base&quot;<br>
&gt; +KBRANCH_qemuarm=C2=A0 ?=3D &quot;v5.4/standard/tiny/arm-versatile-926=
ejs&quot;<br>
&gt; +<br>
&gt; +LINUX_KERNEL_TYPE =3D &quot;tiny&quot;<br>
&gt; +KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
&gt; +<br>
&gt; +require recipes-kernel/linux/linux-yocto.inc<br>
&gt; +<br>
&gt; +LINUX_VERSION ?=3D &quot;5.4.15&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f42308=
26c0c6b8814&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
&gt; +<br>
&gt; +KMETA =3D &quot;kernel-meta&quot;<br>
&gt; +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt; +<br>
&gt; +SRCREV_machine_qemuarm ?=3D &quot;9eeafafc19278b5c5376ba1fd9eae266267=
30458&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;cdda35317561d2741b396efa623ace0bd2212c16&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;a48522779fae4887c47268e5f650bf10c94a165c&quot;=
<br>
&gt; +<br>
&gt; +PV =3D &quot;5.4.15&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=
=3Dmachine</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.=
yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto=
-5.4;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yo=
ctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5=
.4;destsuffix=3D${KMETA}</a>&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemux86|qemux86-64|qemuarm|qemuarmv5&quo=
t;<br>
&gt; +<br>
&gt; +# Functionality flags<br>
&gt; +KERNEL_FEATURES =3D &quot;&quot;<br>
&gt; +<br>
&gt; +KERNEL_DEVICETREE_qemuarmv5 =3D &quot;versatile-pb.dtb&quot;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto_5.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9fbc47d79e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +KBRANCH ?=3D &quot;v5.4/standard/base&quot;<br>
&gt; +<br>
&gt; +require recipes-kernel/linux/linux-yocto.inc<br>
&gt; +<br>
&gt; +# board specific branches<br>
&gt; +KBRANCH_qemuarm=C2=A0 ?=3D &quot;v5.4/standard/arm-versatile-926ejs&q=
uot;<br>
&gt; +KBRANCH_qemuarm64 ?=3D &quot;v5.4/standard/qemuarm64&quot;<br>
&gt; +KBRANCH_qemumips ?=3D &quot;v5.4/standard/mti-malta32&quot;<br>
&gt; +KBRANCH_qemuppc=C2=A0 ?=3D &quot;v5.4/standard/qemuppc&quot;<br>
&gt; +KBRANCH_qemuriscv64=C2=A0 ?=3D &quot;v5.4/standard/base&quot;<br>
&gt; +KBRANCH_qemux86=C2=A0 ?=3D &quot;v5.4/standard/base&quot;<br>
&gt; +KBRANCH_qemux86-64 ?=3D &quot;v5.4/standard/base&quot;<br>
&gt; +KBRANCH_qemumips64 ?=3D &quot;v5.4/standard/mti-malta64&quot;<br>
&gt; +<br>
&gt; +SRCREV_machine_qemuarm ?=3D &quot;637086def651a00b1274a80cd3ca740e271=
eb0f9&quot;<br>
&gt; +SRCREV_machine_qemuarm64 ?=3D &quot;cdda35317561d2741b396efa623ace0bd=
2212c16&quot;<br>
&gt; +SRCREV_machine_qemumips ?=3D &quot;bfe04753d00b0f36848bb8204020b69d0e=
78f02a&quot;<br>
&gt; +SRCREV_machine_qemuppc ?=3D &quot;cdda35317561d2741b396efa623ace0bd22=
12c16&quot;<br>
&gt; +SRCREV_machine_qemuriscv64 ?=3D &quot;cdda35317561d2741b396efa623ace0=
bd2212c16&quot;<br>
&gt; +SRCREV_machine_qemux86 ?=3D &quot;cdda35317561d2741b396efa623ace0bd22=
12c16&quot;<br>
&gt; +SRCREV_machine_qemux86-64 ?=3D &quot;cdda35317561d2741b396efa623ace0b=
d2212c16&quot;<br>
&gt; +SRCREV_machine_qemumips64 ?=3D &quot;81cd255c72add4dcf06603250869f739=
bb4f05cb&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;cdda35317561d2741b396efa623ace0bd2212c16&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;a48522779fae4887c47268e5f650bf10c94a165c&quot;=
<br>
&gt; +<br>
&gt; +# remap qemuarm to qemuarma15 for the 5.4 kernel<br>
&gt; +# KMACHINE_qemuarm ?=3D &quot;qemuarma15&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${=
KBRANCH}</a>; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.=
yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto=
-5.4;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yo=
ctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5=
.4;destsuffix=3D${KMETA}</a>&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f42308=
26c0c6b8814&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.4.15&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;5.4.15&quot;<br>
&gt; +<br>
&gt; +KMETA =3D &quot;kernel-meta&quot;<br>
&gt; +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt; +<br>
&gt; +KERNEL_DEVICETREE_qemuarmv5 =3D &quot;versatile-pb.dtb&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarmv5|qemuarm64|qemux86|qemu=
ppc|qemumips|qemumips64|qemux86-64|qemuriscv64&quot;<br>
&gt; +<br>
&gt; +# Functionality flags<br>
&gt; +KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc&quo=
t;<br>
&gt; +KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
&gt; +KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc features/drm-b=
ochs/drm-bochs.scc&quot;<br>
&gt; +KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
&gt; +KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
&gt; +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
&gt; +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_F=
EATURES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;=
, &quot;&quot; ,d)}&quot;<br>
&gt; --<br>
&gt; 2.19.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000acee17059dae9c10--
