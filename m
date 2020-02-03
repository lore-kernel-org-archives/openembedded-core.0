Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8CE60DAB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 16:45:52 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id w25so14865167qki.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 08:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bq0VrRj13jX8UvfVZsSNpB0ALJD+MJkulz46W8ouBWQ=;
	b=XDeOnXCkaG903nq+YqYFEAn8VNyDldEgsfLesVwppnOVRui6xCeSaKmd9wLgA6sdTW
	NWrY/w28CCXcCMGRlYM1f+zClGCFEN3kLdXVoV3zzDJ+coht6Nl/if8vKjKZQFq5/s2n
	Bh1HVfCfHRpZaP+ELxwM+2bSdtLspdstZqoTVJ8QuSD3mBneFGcqJ4Sxqdc5JuZD2FE7
	Ng6WYXT899uuA1pS9vXauUV7WMkKySfsUKq8CvRSC5lvUGx8IAYeOf57wqPpIRN9NouH
	eoBDoB+BadYW11jHFsbtjtMWW2qYa4tp7Sq/Y0Ua8unHcrBbT6op/zIYXwzSU7UKke86
	8ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bq0VrRj13jX8UvfVZsSNpB0ALJD+MJkulz46W8ouBWQ=;
	b=O235Y2C0JFQk/+dOFXpqSlzyA/CGE3gDgX6JOgaFgffDX0h/EAOgHAoN53hbsffywa
	Hpl1tpSJZntjTfEOdDeL3xu5ZPdocStUB0eXkl/ZVnlvfJCTF/0jMY+BQCWMFk3sFxGs
	pcyGhsFQDZGd/znfow6fo4e1xJRb1PCAoOj3Eo8hqKno+g00oH8KH2SaVfiv1tfgpHgG
	6lxiOSRE/ktCpsPnZHpiV3jkgs+97mKObxc0b5BYdaS4BtGlLGs4tV7onxIkBaGhmnrV
	pan1ETQ8jNXLPLR1dHOB+2f8ITAO5/PMi89RocyhUZRSAubUFBH5O/G4u1hwLmf5vM6l
	SiHg==
X-Gm-Message-State: APjAAAXwPZMJesgZCgAS+LIiWQlEL58YNcqnqucYBFScQVCiUu7LtD0S
	pYd1LcOBoR55mIavyApd7X0VbYE0IajmpuokMfk=
X-Google-Smtp-Source: APXvYqwjSHe0yk+F4VHYTUMC2L+wWT1yUl6CSueUHKv4WJfQJZnnTp6qcF3PWRsWASw3/f0tS4IZ4b8jQ5oE1hopGoo=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr25067585qkh.9.1580748351708; 
	Mon, 03 Feb 2020 08:45:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<e6b6484beb730f63714567d89da06834fbbbbd3c.1580248809.git.bruce.ashfield@gmail.com>
	<CAMKF1so3M-Zza8Oz54Z=pXmykU4686nKWL3JLK8f-bBde-ueiA@mail.gmail.com>
	<CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
In-Reply-To: <CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2020 08:45:40 -0800
Message-ID: <CAMKF1srWkwKOAeP2+nxmuyMCO40zZ6Q5U9s04i8fhoFyLXPr9A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Mon, 03 Feb 2020 16:45:52 -0000
Content-Type: multipart/alternative; boundary="000000000000fba02c059daea763"

--000000000000fba02c059daea763
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2020 at 8:42 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> It fails to build with gold enabled (ld-is-gold in DISTRO_FEATURES)
>
> First olddefconfig fails with "gold linker 'x86_64-oe-linux-ld' not
> supported" and then it fails with a bit misleading error about oldnoconfi=
g
> (which is called only when oddefconfig fails) and then the whole log
> repeats itself again, whole log.do_configure.4075 follows:
>

Since it=E2=80=99s a kernel piece I think asking for gold might be out of s=
cope
perhaps

I have staged a fix in master next which helps a bit with eg mips I had to
disable bpf

>
> make[1]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
>   GEN     Makefile
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --olddefconfig Kconfig
> scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not support=
ed
> make[2]: ***
> [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scripts=
/kconfig/Makefile:73:
> olddefconfig] Error 1
> make[1]: ***
> [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefil=
e:567:
> olddefconfig] Error 2
> make[1]: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
> make: *** [Makefile:179: sub-make] Error 2
> make: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> NOTE: make HOSTCC=3Dgcc
>  -isystem/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto=
/5.4.15-r0/recipe-sysroot-native/usr/include
> -O2 -pipe
> -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15=
-r0/recipe-sysroot-native/usr/lib
>
> -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15=
-r0/recipe-sysroot-native/lib
>                         -Wl,--enable-new-dtags
> -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linu=
x-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib
>
> -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linu=
x-yocto/5.4.15-r0/recipe-sysroot-native/lib
>
> -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoc=
to/5.4.15-r0/recipe-sysroot-native/usr/lib
>
> -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoc=
to/5.4.15-r0/recipe-sysroot-native/lib
>                         -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3D/OE/build/oe-core/tmp-glibc/sysroots-uninative/x86=
_64-linux/lib/ld-linux-x86-64.so.2
> HOSTCPP=3Dgcc  -E -C
> /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source
> O=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.=
15-r0/linux-qemux86_64-standard-build
> CC=3Dx86_64-oe-linux-gcc  -fuse-ld=3Dbfd
> -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux=
/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0
>
>  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0
>
>  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/linux-yocto/5.4.15-r0/recipe-sysroot=3D
>
>  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/linux-yocto/5.4.15-r0/recipe-sysroot-native=3D
>  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/=
kernel-source=3D/usr/src/kernel
> oldnoconfig
> make: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> make[1]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
>   GEN     Makefile
> make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> make[1]: ***
> [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefil=
e:567:
> oldnoconfig] Error 2
> make[1]: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
> make: *** [Makefile:179: sub-make] Error 2
> make: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
> ERROR: Execution of
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/temp/run.do_configure.4075'
> failed with exit code 1:
> make: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> make[1]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
>   GEN     Makefile
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --olddefconfig Kconfig
> scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not support=
ed
> make[2]: ***
> [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scripts=
/kconfig/Makefile:73:
> olddefconfig] Error 1
> make[1]: ***
> [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefil=
e:567:
> olddefconfig] Error 2
> make[1]: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
> make: *** [Makefile:179: sub-make] Error 2
> make: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> make: Entering directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> make[1]: Entering directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
>   GEN     Makefile
> make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> make[1]: ***
> [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makefil=
e:567:
> oldnoconfig] Error 2
> make[1]: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/linux-qemux86_64-standard-build'
> make: *** [Makefile:179: sub-make] Error 2
> make: Leaving directory
> '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> WARNING: exit code 1 from a shell command.
>
> On Fri, Jan 31, 2020 at 10:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> kernel-seltest fails now to build
>>
>> https://errors.yoctoproject.org/Errors/Details/308578/
>>
>> On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
>> >
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > This creates recipes for the v5.4/* branches of the linux-yocto
>> > reference kernel.
>> >
>> > preempt-rt, yaffs2, aufs5 and reference board specific patches are
>> > part of these branches. All major architectures: x86,x86-64,ARM,
>> > ARM64,ppc,mips and mips64 have been feature tested against this
>> > reference.
>> >
>> > 5.4 is a LTS release, and as such will receive -stable updates
>> > for the duration of upstream korg support.
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
>> >  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
>> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 ++++++++++++++++++=
+
>> >  3 files changed, 130 insertions(+)
>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>> > new file mode 100644
>> > index 0000000000..52f0e3b833
>> > --- /dev/null
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>> > @@ -0,0 +1,44 @@
>> > +KBRANCH ?=3D "v5.4/standard/preempt-rt/base"
>> > +
>> > +require recipes-kernel/linux/linux-yocto.inc
>> > +
>> > +# Skip processing of this recipe if it is not explicitly specified as
>> the
>> > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when tryi=
ng
>> > +# to build multiple virtual/kernel providers, e.g. as dependency of
>> > +# core-image-rt-sdk, core-image-rt.
>> > +python () {
>> > +    if d.getVar("KERNEL_PACKAGE_NAME") =3D=3D "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-rt":
>> > +        raise bb.parse.SkipRecipe("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>> > +}
>> > +
>> > +SRCREV_machine ?=3D "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
>> > +
>> > +SRC_URI =3D "git://
>> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;nam=
e=3Dmachine>
>> \
>> > +           git://
>> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.4;destsuffix=3D${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D>
>> "
>> > +
>> > +LINUX_VERSION ?=3D "5.4.15"
>> > +
>> > +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>> > +
>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', =
'',
>> d)}"
>> > +DEPENDS +=3D "openssl-native util-linux-native"
>> > +
>> > +PV =3D "5.4.15"
>> > +
>> > +KMETA =3D "kernel-meta"
>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
>> > +
>> > +LINUX_KERNEL_TYPE =3D "preempt-rt"
>> > +
>> > +COMPATIBLE_MACHINE =3D
>> "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
>> > +
>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
>> > +
>> > +# Functionality flags
>> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc
>> features/taskstats/taskstats.scc"
>> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
>> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc
>> features/drm-bochs/drm-bochs.scc"
>> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
>> > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES",
>> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>> > new file mode 100644
>> > index 0000000000..a028b37548
>> > --- /dev/null
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>> > @@ -0,0 +1,32 @@
>> > +KBRANCH ?=3D "v5.4/standard/tiny/base"
>> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/tiny/arm-versatile-926ejs"
>> > +
>> > +LINUX_KERNEL_TYPE =3D "tiny"
>> > +KCONFIG_MODE =3D "--allnoconfig"
>> > +
>> > +require recipes-kernel/linux/linux-yocto.inc
>> > +
>> > +LINUX_VERSION ?=3D "5.4.15"
>> > +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>> > +
>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', =
'',
>> d)}"
>> > +DEPENDS +=3D "openssl-native util-linux-native"
>> > +
>> > +KMETA =3D "kernel-meta"
>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
>> > +
>> > +SRCREV_machine_qemuarm ?=3D "9eeafafc19278b5c5376ba1fd9eae26626730458=
"
>> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
>> > +
>> > +PV =3D "5.4.15"
>> > +
>> > +SRC_URI =3D "git://
>> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;nam=
e=3Dmachine>
>> \
>> > +           git://
>> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.4;destsuffix=3D${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D>
>> "
>> > +
>> > +COMPATIBLE_MACHINE =3D "qemux86|qemux86-64|qemuarm|qemuarmv5"
>> > +
>> > +# Functionality flags
>> > +KERNEL_FEATURES =3D ""
>> > +
>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> > new file mode 100644
>> > index 0000000000..9fbc47d79e
>> > --- /dev/null
>> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
>> > @@ -0,0 +1,54 @@
>> > +KBRANCH ?=3D "v5.4/standard/base"
>> > +
>> > +require recipes-kernel/linux/linux-yocto.inc
>> > +
>> > +# board specific branches
>> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/arm-versatile-926ejs"
>> > +KBRANCH_qemuarm64 ?=3D "v5.4/standard/qemuarm64"
>> > +KBRANCH_qemumips ?=3D "v5.4/standard/mti-malta32"
>> > +KBRANCH_qemuppc  ?=3D "v5.4/standard/qemuppc"
>> > +KBRANCH_qemuriscv64  ?=3D "v5.4/standard/base"
>> > +KBRANCH_qemux86  ?=3D "v5.4/standard/base"
>> > +KBRANCH_qemux86-64 ?=3D "v5.4/standard/base"
>> > +KBRANCH_qemumips64 ?=3D "v5.4/standard/mti-malta64"
>> > +
>> > +SRCREV_machine_qemuarm ?=3D "637086def651a00b1274a80cd3ca740e271eb0f9=
"
>> > +SRCREV_machine_qemuarm64 ?=3D "cdda35317561d2741b396efa623ace0bd2212c=
16"
>> > +SRCREV_machine_qemumips ?=3D "bfe04753d00b0f36848bb8204020b69d0e78f02=
a"
>> > +SRCREV_machine_qemuppc ?=3D "cdda35317561d2741b396efa623ace0bd2212c16=
"
>> > +SRCREV_machine_qemuriscv64 ?=3D
>> "cdda35317561d2741b396efa623ace0bd2212c16"
>> > +SRCREV_machine_qemux86 ?=3D "cdda35317561d2741b396efa623ace0bd2212c16=
"
>> > +SRCREV_machine_qemux86-64 ?=3D "cdda35317561d2741b396efa623ace0bd2212=
c16"
>> > +SRCREV_machine_qemumips64 ?=3D "81cd255c72add4dcf06603250869f739bb4f0=
5cb"
>> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
>> > +
>> > +# remap qemuarm to qemuarma15 for the 5.4 kernel
>> > +# KMACHINE_qemuarm ?=3D "qemuarma15"
>> > +
>> > +SRC_URI =3D "git://
>> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRANCH}
>> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7=
BKBRANCH%7D>;
>> \
>> > +           git://
>> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.4;destsuffix=3D${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta=
;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D>
>> "
>> > +
>> > +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>> > +LINUX_VERSION ?=3D "5.4.15"
>> > +
>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', =
'',
>> d)}"
>> > +DEPENDS +=3D "openssl-native util-linux-native"
>> > +
>> > +PV =3D "5.4.15"
>> > +
>> > +KMETA =3D "kernel-meta"
>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
>> > +
>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
>> > +
>> > +COMPATIBLE_MACHINE =3D
>> "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86=
-64|qemuriscv64"
>> > +
>> > +# Functionality flags
>> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
>> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
>> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc
>> features/drm-bochs/drm-bochs.scc"
>> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
>> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
>> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES",
>> "mx32", " cfg/x32.scc", "" ,d)}"
>> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
>> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
>> > --
>> > 2.19.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000fba02c059daea763
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 3, 2020 at 8:42 AM Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">It fails to build with g=
old enabled (ld-is-gold in DISTRO_FEATURES)<div><br></div><div>First olddef=
config fails with &quot;gold linker &#39;x86_64-oe-linux-ld&#39; not suppor=
ted&quot; and then it fails with a bit misleading error about=C2=A0oldnocon=
fig (which is called only when oddefconfig fails) and then the whole log re=
peats itself again, whole=C2=A0log.do_configure.4075 follows:</div></div></=
blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Since it=E2=80=99s=
 a kernel piece I think asking for gold might be out of scope perhaps=C2=A0=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have staged a fix in =
master next which helps a bit with eg mips I had to disable bpf=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div></div><div><div></div>=
</div><div><br></div><div>make[1]: Entering directory &#39;/OE/build/oe-cor=
e/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64=
-standard-build&#39;<br>=C2=A0 GEN =C2=A0 =C2=A0 Makefile<br>=C2=A0 HOSTCC =
=C2=A0scripts/basic/fixdep<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/conf.o<br=
>=C2=A0 HOSTCC =C2=A0scripts/kconfig/confdata.o<br>=C2=A0 HOSTCC =C2=A0scri=
pts/kconfig/expr.o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/lexer.lex.o<br>=
=C2=A0 HOSTCC =C2=A0scripts/kconfig/parser.tab.o<br>=C2=A0 HOSTCC =C2=A0scr=
ipts/kconfig/preprocess.o<br>=C2=A0 HOSTCC =C2=A0scripts/kconfig/symbol.o<b=
r>=C2=A0 HOSTLD =C2=A0scripts/kconfig/conf<br>scripts/kconfig/conf =C2=A0--=
olddefconfig Kconfig<br>scripts/Kconfig.include:39: =C2=A0gold linker &#39;=
x86_64-oe-linux-ld&#39; not supported<br>make[2]: *** [/OE/build/oe-core/tm=
p-glibc/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makefile:73: o=
lddefconfig] Error 1<br>make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shar=
ed/qemux86-64/kernel-source/Makefile:567: olddefconfig] Error 2<br>make[1]:=
 Leaving directory &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#39;<br>make: *** [=
Makefile:179: sub-make] Error 2<br></div><div>make: Leaving directory &#39;=
/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source&#39;<br>NO=
TE: make HOSTCC=3Dgcc =C2=A0-isystem/OE/build/oe-core/tmp-glibc/work/qemux8=
6_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/include -O2 -=
pipe -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4=
.15-r0/recipe-sysroot-native/usr/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L/OE/build/oe-core/tmp-glibc=
/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -Wl,--enable-new-dtags =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath-link,/OE/build/oe-cor=
e/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-n=
ative/usr/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/q=
emux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-y=
octo/5.4.15-r0/recipe-sysroot-native/usr/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath,/OE/buil=
d/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-s=
ysroot-native/lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynam=
ic-linker=3D/OE/build/oe-core/tmp-glibc/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2 HOSTCPP=3Dgcc =C2=A0-E -C /OE/build/oe-core/tmp-glibc=
/work-shared/qemux86-64/kernel-source O=3D/OE/build/oe-core/tmp-glibc/work/=
qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build C=
C=3Dx86_64-oe-linux-gcc =C2=A0-fuse-ld=3Dbfd -fmacro-prefix-map=3D/OE/build=
/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0=3D/usr/sr=
c/debug/linux-yocto/5.4.15-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tmp-g=
libc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-=
yocto/5.4.15-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot=3D =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/recipe-sysroot-native=3D =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/=
tmp-glibc/work-shared/qemux86-64/kernel-source=3D/usr/src/kernel oldnoconfi=
g<br>make: Entering directory &#39;/OE/build/oe-core/tmp-glibc/work-shared/=
qemux86-64/kernel-source&#39;<br>make[1]: Entering directory &#39;/OE/build=
/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qem=
ux86_64-standard-build&#39;<br>=C2=A0 GEN =C2=A0 =C2=A0 Makefile<br>make[2]=
: *** No rule to make target &#39;oldnoconfig&#39;.=C2=A0 Stop.<br>make[1]:=
 *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Make=
file:567: oldnoconfig] Error 2<br>make[1]: Leaving directory &#39;/OE/build=
/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qem=
ux86_64-standard-build&#39;<br>make: *** [Makefile:179: sub-make] Error 2<b=
r>make: Leaving directory &#39;/OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source&#39;<br>ERROR: oe_runmake failed<br>WARNING: exit code=
 1 from a shell command.<br>ERROR: Execution of &#39;/OE/build/oe-core/tmp-=
glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/temp/run.do_configure.=
4075&#39; failed with exit code 1:<br>make: Entering directory &#39;/OE/bui=
ld/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source&#39;<br></div><di=
v>make[1]: Entering directory &#39;/OE/build/oe-core/tmp-glibc/work/qemux86=
_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#39;<br>=
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
Error 2<br>make: Leaving directory &#39;/OE/build/oe-core/tmp-glibc/work-sh=
ared/qemux86-64/kernel-source&#39;<br>make: Entering directory &#39;/OE/bui=
ld/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source&#39;<br>make[1]: =
Entering directory &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#39;<br>=C2=A0 GEN =
=C2=A0 =C2=A0 Makefile<br>make[2]: *** No rule to make target &#39;oldnocon=
fig&#39;.=C2=A0 Stop.<br>make[1]: *** [/OE/build/oe-core/tmp-glibc/work-sha=
red/qemux86-64/kernel-source/Makefile:567: oldnoconfig] Error 2<br>make[1]:=
 Leaving directory &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build&#39;<br>make: *** [=
Makefile:179: sub-make] Error 2<br>make: Leaving directory &#39;/OE/build/o=
e-core/tmp-glibc/work-shared/qemux86-64/kernel-source&#39;<br>WARNING: exit=
 code 1 from a shell command.<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 31, 2020 at 10:37 AM Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">kernel-seltest fails now to build<br>
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
</blockquote></div></div>

--000000000000fba02c059daea763--
