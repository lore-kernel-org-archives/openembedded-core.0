Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 65F4D60661
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 17:32:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a6so19297676wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 09:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s3rFNSwnoyfuMkjLVOGXP9ASI97lCncUTFM5a/bIrsI=;
	b=NOhGp779lE+u/8mWokQUfuTrB24QaJXKizbL/4EDlfUtMe/UF+Mft7huNDw1Hnaeiq
	LB3/7eKXJmm4Zw0iwhVjh/h43+08zfI4TGBwiizW5G+BJM2EduhFr1I1j2NxoefuozFL
	tgniLji6nwACh5CQBuN1ebHVQI0EM0Lz4bhZ8DLBklHyfAyqSS2iJA8Zeko+ABxaHdbu
	QnSZLuIjG4tTg9yXmIHJdWWCUh3mHerMkIcLy8mYl81u+yOUx2Rj5lhS7XK+SNIsgQNO
	wNnri5ShVKGEOuLQ1cV3onkzr10IS7AAYdxRwniFVbcr+uBlknHlXDypNOUYWxU3cRqC
	6XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s3rFNSwnoyfuMkjLVOGXP9ASI97lCncUTFM5a/bIrsI=;
	b=IOUGgBZLCWv+rMojkZvB18420KbWwAyWi7d7z4KxbOKHiyw7eM2cmcWKT3m4rnzKpl
	vxHel2fJBYK5bugJTssHI9GUjjO3kP1LUiML20b1EV6lyZQqxTLOMOckfH6ZjRBKb2pF
	enFtYAnbugp3hgkf1OPLionggBzUsfIf3wn+JiXpDUMtXK22c2AmFEPZ1Xmfm9WgF+Gi
	GGuWk7m8j3hZeCg6l3f4YMvALUZf4XpFVTNr7fXMBrW49daeuiPIvIck3fLnJv6Izylh
	NTdOOTtaWET5/s5K4xaPpUqB5ZNsfWENeeVLv/SuHvakhy3QCPDkn1oapuWtX0iXDqrl
	d5JQ==
X-Gm-Message-State: APjAAAUmIBsxlA3k8eV5RQCdbzkOnHZaZ+CReV7DkchsGPLkfvBaLe+x
	ZLnjPgrjHjrxhUaiG0GtQno=
X-Google-Smtp-Source: APXvYqzy1fIm2oV6vmZsrI9uevopTcnXE4odZKbbyLMK1Or8Bv/Ig1ib97Al2l27/ElwWNT6dlakBA==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr16448303wrt.408.1580751153917;
	Mon, 03 Feb 2020 09:32:33 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id n3sm25736868wrs.8.2020.02.03.09.32.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 09:32:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Feb 2020 18:32:32 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200203173232.yal36errexiq3dn4@jama>
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<e6b6484beb730f63714567d89da06834fbbbbd3c.1580248809.git.bruce.ashfield@gmail.com>
	<CAMKF1so3M-Zza8Oz54Z=pXmykU4686nKWL3JLK8f-bBde-ueiA@mail.gmail.com>
	<CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
	<CAMKF1srWkwKOAeP2+nxmuyMCO40zZ6Q5U9s04i8fhoFyLXPr9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srWkwKOAeP2+nxmuyMCO40zZ6Q5U9s04i8fhoFyLXPr9A@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
X-List-Received-Date: Mon, 03 Feb 2020 17:32:33 -0000
X-Groupsio-MsgNum: 134450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q6sadjh3yirmuis3"
Content-Disposition: inline

--q6sadjh3yirmuis3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 08:45:40AM -0800, Khem Raj wrote:
> On Mon, Feb 3, 2020 at 8:42 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > It fails to build with gold enabled (ld-is-gold in DISTRO_FEATURES)
> >
> > First olddefconfig fails with "gold linker 'x86_64-oe-linux-ld' not
> > supported" and then it fails with a bit misleading error about oldnocon=
fig
> > (which is called only when oddefconfig fails) and then the whole log
> > repeats itself again, whole log.do_configure.4075 follows:
> >
>=20
> Since it=E2=80=99s a kernel piece I think asking for gold might be out of=
 scope
> perhaps
>=20
> I have staged a fix in master next which helps a bit with eg mips I had to
> disable bpf

I haven't found your fix in either oe-core/master-next nor
yoe/master-next. But I'll send my own fix.

>=20
> >
> > make[1]: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> >   GEN     Makefile
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/kconfig/conf.o
> >   HOSTCC  scripts/kconfig/confdata.o
> >   HOSTCC  scripts/kconfig/expr.o
> >   HOSTCC  scripts/kconfig/lexer.lex.o
> >   HOSTCC  scripts/kconfig/parser.tab.o
> >   HOSTCC  scripts/kconfig/preprocess.o
> >   HOSTCC  scripts/kconfig/symbol.o
> >   HOSTLD  scripts/kconfig/conf
> > scripts/kconfig/conf  --olddefconfig Kconfig
> > scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not suppo=
rted
> > make[2]: ***
> > [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scrip=
ts/kconfig/Makefile:73:
> > olddefconfig] Error 1
> > make[1]: ***
> > [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makef=
ile:567:
> > olddefconfig] Error 2
> > make[1]: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> > make: *** [Makefile:179: sub-make] Error 2
> > make: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > NOTE: make HOSTCC=3Dgcc
> >  -isystem/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoc=
to/5.4.15-r0/recipe-sysroot-native/usr/include
> > -O2 -pipe
> > -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.=
15-r0/recipe-sysroot-native/usr/lib
> >
> > -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.=
15-r0/recipe-sysroot-native/lib
> >                         -Wl,--enable-new-dtags
> > -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/li=
nux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib
> >
> > -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/li=
nux-yocto/5.4.15-r0/recipe-sysroot-native/lib
> >
> > -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-y=
octo/5.4.15-r0/recipe-sysroot-native/usr/lib
> >
> > -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-y=
octo/5.4.15-r0/recipe-sysroot-native/lib
> >                         -Wl,-O1 -Wl,--allow-shlib-undefined
> > -Wl,--dynamic-linker=3D/OE/build/oe-core/tmp-glibc/sysroots-uninative/x=
86_64-linux/lib/ld-linux-x86-64.so.2
> > HOSTCPP=3Dgcc  -E -C
> > /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source
> > O=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.=
4.15-r0/linux-qemux86_64-standard-build
> > CC=3Dx86_64-oe-linux-gcc  -fuse-ld=3Dbfd
> > -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-lin=
ux/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0
> >
> >  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-li=
nux/linux-yocto/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0
> >
> >  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-li=
nux/linux-yocto/5.4.15-r0/recipe-sysroot=3D
> >
> >  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-li=
nux/linux-yocto/5.4.15-r0/recipe-sysroot-native=3D
> >  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work-shared/qemux86-6=
4/kernel-source=3D/usr/src/kernel
> > oldnoconfig
> > make: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > make[1]: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> >   GEN     Makefile
> > make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> > make[1]: ***
> > [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makef=
ile:567:
> > oldnoconfig] Error 2
> > make[1]: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> > make: *** [Makefile:179: sub-make] Error 2
> > make: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > ERROR: oe_runmake failed
> > WARNING: exit code 1 from a shell command.
> > ERROR: Execution of
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/temp/run.do_configure.4075'
> > failed with exit code 1:
> > make: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > make[1]: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> >   GEN     Makefile
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/kconfig/conf.o
> >   HOSTCC  scripts/kconfig/confdata.o
> >   HOSTCC  scripts/kconfig/expr.o
> >   HOSTCC  scripts/kconfig/lexer.lex.o
> >   HOSTCC  scripts/kconfig/parser.tab.o
> >   HOSTCC  scripts/kconfig/preprocess.o
> >   HOSTCC  scripts/kconfig/symbol.o
> >   HOSTLD  scripts/kconfig/conf
> > scripts/kconfig/conf  --olddefconfig Kconfig
> > scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not suppo=
rted
> > make[2]: ***
> > [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/scrip=
ts/kconfig/Makefile:73:
> > olddefconfig] Error 1
> > make[1]: ***
> > [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makef=
ile:567:
> > olddefconfig] Error 2
> > make[1]: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> > make: *** [Makefile:179: sub-make] Error 2
> > make: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > make: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > make[1]: Entering directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> >   GEN     Makefile
> > make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> > make[1]: ***
> > [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/Makef=
ile:567:
> > oldnoconfig] Error 2
> > make[1]: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.1=
5-r0/linux-qemux86_64-standard-build'
> > make: *** [Makefile:179: sub-make] Error 2
> > make: Leaving directory
> > '/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source'
> > WARNING: exit code 1 from a shell command.
> >
> > On Fri, Jan 31, 2020 at 10:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> kernel-seltest fails now to build
> >>
> >> https://errors.yoctoproject.org/Errors/Details/308578/
> >>
> >> On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
> >> >
> >> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> >
> >> > This creates recipes for the v5.4/* branches of the linux-yocto
> >> > reference kernel.
> >> >
> >> > preempt-rt, yaffs2, aufs5 and reference board specific patches are
> >> > part of these branches. All major architectures: x86,x86-64,ARM,
> >> > ARM64,ppc,mips and mips64 have been feature tested against this
> >> > reference.
> >> >
> >> > 5.4 is a LTS release, and as such will receive -stable updates
> >> > for the duration of upstream korg support.
> >> >
> >> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > ---
> >> >  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
> >> >  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> >> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 ++++++++++++++++=
+++
> >> >  3 files changed, 130 insertions(+)
> >> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> >
> >> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> > new file mode 100644
> >> > index 0000000000..52f0e3b833
> >> > --- /dev/null
> >> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> > @@ -0,0 +1,44 @@
> >> > +KBRANCH ?=3D "v5.4/standard/preempt-rt/base"
> >> > +
> >> > +require recipes-kernel/linux/linux-yocto.inc
> >> > +
> >> > +# Skip processing of this recipe if it is not explicitly specified =
as
> >> the
> >> > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when tr=
ying
> >> > +# to build multiple virtual/kernel providers, e.g. as dependency of
> >> > +# core-image-rt-sdk, core-image-rt.
> >> > +python () {
> >> > +    if d.getVar("KERNEL_PACKAGE_NAME") =3D=3D "kernel" and
> >> d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-rt":
> >> > +        raise bb.parse.SkipRecipe("Set
> >> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >> > +}
> >> > +
> >> > +SRCREV_machine ?=3D "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
> >> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> >> > +
> >> > +SRC_URI =3D "git://
> >> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine
> >> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;n=
ame=3Dmachine>
> >> \
> >> > +           git://
> >> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branc=
h=3Dyocto-5.4;destsuffix=3D${KMETA}
> >> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dme=
ta;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D>
> >> "
> >> > +
> >> > +LINUX_VERSION ?=3D "5.4.15"
> >> > +
> >> > +LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
> >> > +
> >> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native'=
, '',
> >> d)}"
> >> > +DEPENDS +=3D "openssl-native util-linux-native"
> >> > +
> >> > +PV =3D "5.4.15"
> >> > +
> >> > +KMETA =3D "kernel-meta"
> >> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> >> > +
> >> > +LINUX_KERNEL_TYPE =3D "preempt-rt"
> >> > +
> >> > +COMPATIBLE_MACHINE =3D
> >> "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
> >> > +
> >> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> >> > +
> >> > +# Functionality flags
> >> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc
> >> features/taskstats/taskstats.scc"
> >> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
> >> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc
> >> features/drm-bochs/drm-bochs.scc"
> >> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.s=
cc"
> >> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kv=
m.scc"
> >> > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES",
> >> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >> > new file mode 100644
> >> > index 0000000000..a028b37548
> >> > --- /dev/null
> >> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >> > @@ -0,0 +1,32 @@
> >> > +KBRANCH ?=3D "v5.4/standard/tiny/base"
> >> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/tiny/arm-versatile-926ejs"
> >> > +
> >> > +LINUX_KERNEL_TYPE =3D "tiny"
> >> > +KCONFIG_MODE =3D "--allnoconfig"
> >> > +
> >> > +require recipes-kernel/linux/linux-yocto.inc
> >> > +
> >> > +LINUX_VERSION ?=3D "5.4.15"
> >> > +LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
> >> > +
> >> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native'=
, '',
> >> d)}"
> >> > +DEPENDS +=3D "openssl-native util-linux-native"
> >> > +
> >> > +KMETA =3D "kernel-meta"
> >> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> >> > +
> >> > +SRCREV_machine_qemuarm ?=3D "9eeafafc19278b5c5376ba1fd9eae266267304=
58"
> >> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
> >> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> >> > +
> >> > +PV =3D "5.4.15"
> >> > +
> >> > +SRC_URI =3D "git://
> >> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine
> >> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;n=
ame=3Dmachine>
> >> \
> >> > +           git://
> >> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branc=
h=3Dyocto-5.4;destsuffix=3D${KMETA}
> >> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dme=
ta;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D>
> >> "
> >> > +
> >> > +COMPATIBLE_MACHINE =3D "qemux86|qemux86-64|qemuarm|qemuarmv5"
> >> > +
> >> > +# Functionality flags
> >> > +KERNEL_FEATURES =3D ""
> >> > +
> >> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> >> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> > new file mode 100644
> >> > index 0000000000..9fbc47d79e
> >> > --- /dev/null
> >> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> > @@ -0,0 +1,54 @@
> >> > +KBRANCH ?=3D "v5.4/standard/base"
> >> > +
> >> > +require recipes-kernel/linux/linux-yocto.inc
> >> > +
> >> > +# board specific branches
> >> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/arm-versatile-926ejs"
> >> > +KBRANCH_qemuarm64 ?=3D "v5.4/standard/qemuarm64"
> >> > +KBRANCH_qemumips ?=3D "v5.4/standard/mti-malta32"
> >> > +KBRANCH_qemuppc  ?=3D "v5.4/standard/qemuppc"
> >> > +KBRANCH_qemuriscv64  ?=3D "v5.4/standard/base"
> >> > +KBRANCH_qemux86  ?=3D "v5.4/standard/base"
> >> > +KBRANCH_qemux86-64 ?=3D "v5.4/standard/base"
> >> > +KBRANCH_qemumips64 ?=3D "v5.4/standard/mti-malta64"
> >> > +
> >> > +SRCREV_machine_qemuarm ?=3D "637086def651a00b1274a80cd3ca740e271eb0=
f9"
> >> > +SRCREV_machine_qemuarm64 ?=3D "cdda35317561d2741b396efa623ace0bd221=
2c16"
> >> > +SRCREV_machine_qemumips ?=3D "bfe04753d00b0f36848bb8204020b69d0e78f=
02a"
> >> > +SRCREV_machine_qemuppc ?=3D "cdda35317561d2741b396efa623ace0bd2212c=
16"
> >> > +SRCREV_machine_qemuriscv64 ?=3D
> >> "cdda35317561d2741b396efa623ace0bd2212c16"
> >> > +SRCREV_machine_qemux86 ?=3D "cdda35317561d2741b396efa623ace0bd2212c=
16"
> >> > +SRCREV_machine_qemux86-64 ?=3D "cdda35317561d2741b396efa623ace0bd22=
12c16"
> >> > +SRCREV_machine_qemumips64 ?=3D "81cd255c72add4dcf06603250869f739bb4=
f05cb"
> >> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
> >> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> >> > +
> >> > +# remap qemuarm to qemuarma15 for the 5.4 kernel
> >> > +# KMACHINE_qemuarm ?=3D "qemuarma15"
> >> > +
> >> > +SRC_URI =3D "git://
> >> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRANCH}
> >> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$=
%7BKBRANCH%7D>;
> >> \
> >> > +           git://
> >> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branc=
h=3Dyocto-5.4;destsuffix=3D${KMETA}
> >> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dme=
ta;branch=3Dyocto-5.4;destsuffix=3D$%7BKMETA%7D>
> >> "
> >> > +
> >> > +LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
> >> > +LINUX_VERSION ?=3D "5.4.15"
> >> > +
> >> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native'=
, '',
> >> d)}"
> >> > +DEPENDS +=3D "openssl-native util-linux-native"
> >> > +
> >> > +PV =3D "5.4.15"
> >> > +
> >> > +KMETA =3D "kernel-meta"
> >> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> >> > +
> >> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> >> > +
> >> > +COMPATIBLE_MACHINE =3D
> >> "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux=
86-64|qemuriscv64"
> >> > +
> >> > +# Functionality flags
> >> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
> >> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
> >> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc
> >> features/drm-bochs/drm-bochs.scc"
> >> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.s=
cc"
> >> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kv=
m.scc"
> >> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES",
> >> "mx32", " cfg/x32.scc", "" ,d)}"
> >> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> >> "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >> > --
> >> > 2.19.1
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >

--q6sadjh3yirmuis3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjhZLgAKCRA3VSO3ZXaA
HNBBAKC0meizfR7hQRMV0riI8cyoY34vlQCdHOncT1eFA5p/aJyQ1h8Ai6jmuaU=
=6482
-----END PGP SIGNATURE-----

--q6sadjh3yirmuis3--
