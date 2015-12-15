Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0326573199
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:01:02 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l126so7465916wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qat3Csxclaxu1cqrTQvfSPdPVLWovXbXsfqzsj0p3LI=;
	b=Fjm6wJMidJSpujKYrvGCdyg+AmgO8GBEJ8O0Q/suB0RX1LdETxm0nKQzLVRNiJ0oaQ
	SxOxOhVd4PddmNTzNDbw37fDdduvA1gFzIenQ5ZV7gouVFzI7tDwzGA73gJC8RUevg+E
	iTYqAJS+fQBJIXRVeB6BEilXSVfcZya0H4Qe32Hsy0dTy459jdIw16IjwRYbWRtg7hMc
	RIn70GHL6vV+COHqLpaRaexlv2ZeS6bdyclVVJZT0670wh8t8cR+gwziGkbM8/HbsA8q
	fw5Jw+VX9LmuPoN2GTvXHfFeDym0G8NWoF5taL44AeR4Yixr/SPKhCwrqP9Sfsu2WdtO
	cH7A==
X-Received: by 10.28.158.75 with SMTP id h72mr6711319wme.74.1450206062988;
	Tue, 15 Dec 2015 11:01:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z66sm22370275wmz.7.2015.12.15.11.01.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 11:01:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Dec 2015 20:03:10 +0100
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20151215190310.GD2556@jama>
References: <1450119998-2912-1-git-send-email-haris.okanovic@ni.com>
	<CADkTA4OFzBpvo_fSnf-0h85erobO=DY4cJcc05+=Gg+Ua9xHyQ@mail.gmail.com>
	<CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<20151215165826.GN13597@denix.org>
MIME-Version: 1.0
In-Reply-To: <20151215165826.GN13597@denix.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	Gratian Crisan <gratian.crisan@ni.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 15 Dec 2015 19:01:08 -0000
X-Groupsio-MsgNum: 74801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline

--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 11:58:26AM -0500, Denys Dmytriyenko wrote:
> On Mon, Dec 14, 2015 at 03:02:44PM -0500, Bruce Ashfield wrote:
> > On Mon, Dec 14, 2015 at 2:17 PM, Bruce Ashfield <bruce.ashfield@gmail.c=
om>
> > wrote:
> >=20
> > >
> > >
> > > On Mon, Dec 14, 2015 at 2:06 PM, Haris Okanovic <haris.okanovic@ni.co=
m>
> > > wrote:
> > >
> > >> From: Gratian Crisan <gratian.crisan@ni.com>
> > >>
> > >> Templetize kernel package name:
> > >>
> > >> Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for =
kernel
> > >> packages. It defaults to the old hard-coded name 'kernel' but it can=
 be
> > >> redefined by recipes that provide additional kernel packages in order
> > >> to avoid build conflicts.
> > >>
> > >> Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
> > >> kernel bbclass-es.
> > >>
> > >> Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:
> > >>
> > >> Prior to this change, kernel recipes would all fetch source to
> > >> STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
> > >> parallel builds when more than one kernel recipes are defined in
> > >> the distribution, since they all attempted to fetch() and patch()
> > >> in a shared source dir.
> > >>
> > >> With this change, alternate kernel recipes fetch source into their
> > >> ${WORKDIR} so that they may build in parallel to each other and the
> > >> default kernel recipe, which still fetches to STAGING_KERNEL_DIR.
> > >>
> > >
> > >
> > > But what's the system level use case for this capability ? Honestly, =
it
> > > just
> > > looks complicated .. and I'm not seeing exactly multiple kernels are =
being
> > > built in parallel in a single build. We've been forcing everything
> > > explicitly
> > > to be in a single, shared location .. and I see that this is both
> > > complicating
> > > and a possible source of errors.
> > >
> > > It's probably that I'm just misunderstanding the point of the change.
> > >
> > > If I had to guess, you are building recovery, or kexec/kdump kernels =
along
> > > side the main kernel ?
> > >
> >=20
> > Aha. I see the debug kernel reference in the comments (as one example).
> >=20
> > As a follow up. If these kernel's are building via kernel.bbclass, how =
are
> > you
> > avoiding the artifacts all ending up in STAGING_KERNEL_BUILDDIR ? I did
> > a quick scan, and couldn't see if it was being considered.
>=20
> And the next question would be - how can you build/rebuild and package=20
> out-of-tree modules against all the alternatives?
>=20
>=20
> I've looked at doing the same for our needs and ran out of time and patie=
nce=20
> to cover all the corner cases... :)

When I was implementing this for SHR, I ended with the default kernel in
default images and other kernels + out-of-tree modules built in separate
build directories with separate binary feed.

Having just separate kernel image users deploy manually is nice and
still useful, but to cover all corner cases and upgrade-able package
feeds providing different kernel flavors is indeed nightmare.

> As of the use cases - we have a need to provide multiple variants of the =
same=20
> kernel per platform:
>=20
> 1. Production
> 2. All debugging options enabled
> 3. RT patch applied
> 4. Any other major feature, like LPAE
>=20
> It is common for Linux distros to provide multiple kernel variants:
>=20
> https://wiki.ubuntu.com/Kernel/Dev/Flavours
>=20
> So, it's not entirely unheard of...
>=20
> --=20
> Denys
>=20
>=20
> > >> Testing:
> > >>
> > >> Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
> > >> image and modules packages. Added kernel recipe with non-default
> > >> KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
> > >> packages with alternate name next to default kernel.
> > >>
> > >> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> > >> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> > >> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
> > >> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
> > >> Natinst-ReviewBoard-ID: 120348
> > >> Natinst-ReviewBoard-ID: 120447
> > >> ---
> > >>  meta/classes/kernel-module-split.bbclass |  9 ++--
> > >>  meta/classes/kernel.bbclass              | 71
> > >> ++++++++++++++++++--------------
> > >>  meta/conf/documentation.conf             |  1 +
> > >>  meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
> > >>  4 files changed, 49 insertions(+), 34 deletions(-)
> > >>
> > >> diff --git a/meta/classes/kernel-module-split.bbclass
> > >> b/meta/classes/kernel-module-split.bbclass
> > >> index e1a70e6..7415ec8 100644
> > >> --- a/meta/classes/kernel-module-split.bbclass
> > >> +++ b/meta/classes/kernel-module-split.bbclass
> > >> @@ -28,7 +28,7 @@ do_install_append() {
> > >>
> > >>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_module_packages "
> > >>
> > >> -KERNEL_MODULES_META_PACKAGE ?=3D "kernel-modules"
> > >> +KERNEL_MODULES_META_PACKAGE ?=3D "${KERNEL_PACKAGE_NAME}-modules"
> > >>
> > >>  python split_kernel_module_packages () {
> > >>      import re
> > >> @@ -179,14 +179,17 @@ python split_kernel_module_packages () {
> > >>          # Avoid automatic -dev recommendations for modules ending w=
ith
> > >> -dev.
> > >>          d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
> > >>
> > >> +    kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME", True)
> > >> +    kernel_version =3D d.getVar("KERNEL_VERSION", True)
> > >> +
> > >>      module_deps =3D parse_depmod()
> > >>      module_regex =3D '^(.*)\.k?o$'
> > >> -    module_pattern =3D 'kernel-module-%s'
> > >> +    module_pattern =3D '%s-module-%%s' % kernel_package_name
> > >>
> > >>      postinst =3D d.getVar('pkg_postinst_modules', True)
> > >>      postrm =3D d.getVar('pkg_postrm_modules', True)
> > >>
> > >> -    modules =3D do_split_packages(d, root=3D'/lib/modules',
> > >> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descript=
ion=3D'%s
> > >> kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTr=
ue,
> > >> hook=3Dfrob_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNE=
L_VERSION",
> > >> True)))
> > >> +    modules =3D do_split_packages(d, root=3D'/lib/modules',
> > >> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descript=
ion=3D'%s
> > >> kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTr=
ue,
> > >> hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,
> > >> kernel_version))
> > >>      if modules:
> > >>          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
> > >>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> > >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbcla=
ss
> > >> index b75a462..cc27364 100644
> > >> --- a/meta/classes/kernel.bbclass
> > >> +++ b/meta/classes/kernel.bbclass
> > >> @@ -3,7 +3,6 @@ inherit linux-kernel-base kernel-module-split
> > >>  PROVIDES +=3D "virtual/kernel"
> > >>  DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PRE=
FIX}gcc
> > >> kmod-native depmodwrapper-cross bc-native"
> > >>
> > >> -S =3D "${STAGING_KERNEL_DIR}"
> > >>  B =3D "${WORKDIR}/build"
> > >>  KBUILD_OUTPUT =3D "${B}"
> > >>  OE_TERMINAL_EXPORTS +=3D "KBUILD_OUTPUT"
> > >> @@ -11,6 +10,7 @@ OE_TERMINAL_EXPORTS +=3D "KBUILD_OUTPUT"
> > >>  # we include gcc above, we dont need virtual/libc
> > >>  INHIBIT_DEFAULT_DEPS =3D "1"
> > >>
> > >> +KERNEL_PACKAGE_NAME ??=3D "kernel"
> > >>  KERNEL_IMAGETYPE ?=3D "zImage"
> > >>  INITRAMFS_IMAGE ?=3D ""
> > >>  INITRAMFS_TASK ?=3D ""
> > >> @@ -34,6 +34,17 @@ python __anonymous () {
> > >>      image_task =3D d.getVar('INITRAMFS_TASK', True)
> > >>      if image_task:
> > >>          d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TA=
SK}')
> > >> +
> > >> +    # The default kernel recipe fetches it's source to
> > >> +    # STAGING_KERNEL_DIR as defined by bitbake/distro confs.
> > >> +    # Alternate kernel recipes (E.g. debug kernels) fetch source in=
to
> > >> +    # their work dir so that they may build in parallel.
> > >> +    if d.getVar("KERNEL_PACKAGE_NAME", True) =3D=3D "kernel":
> > >> +        d.setVar("S", d.getVar("STAGING_KERNEL_DIR", True))
> > >> +    else:
> > >> +        workdir =3D d.getVar("WORKDIR", True)
> > >> +        kernelSourceDir =3D os.path.join(workdir, 'kernel-source')
> > >> +        d.setVar("S", kernelSourceDir)
> > >>  }
> > >>
> > >>  # Here we pull in all various kernel image types which we support.
> > >> @@ -79,9 +90,9 @@ base_do_unpack_append () {
> > >>
> > >>  inherit kernel-arch deploy
> > >>
> > >> -PACKAGES_DYNAMIC +=3D "^kernel-module-.*"
> > >> -PACKAGES_DYNAMIC +=3D "^kernel-image-.*"
> > >> -PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
> > >> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
> > >> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
> > >> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
> > >>
> > >>  export OS =3D "${TARGET_OS}"
> > >>  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> > >> @@ -270,9 +281,9 @@ do_shared_workdir_setscene () {
> > >>
> > >>  emit_depmod_pkgdata() {
> > >>         # Stash data for depmod
> > >> -       install -d ${PKGDESTWORK}/kernel-depmod/
> > >> -       echo "${KERNEL_VERSION}" >
> > >> ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
> > >> -       cp ${B}/System.map
> > >> ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
> > >> +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
> > >> +       echo "${KERNEL_VERSION}" >
> > >> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-=
abiversion
> > >> +       cp ${B}/System.map
> > >> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VER=
SION}
> > >>  }
> > >>
> > >>  PACKAGEFUNCS +=3D "emit_depmod_pkgdata"
> > >> @@ -287,7 +298,7 @@ do_shared_workdir () {
> > >>         # Store the kernel version in sysroots for module-base.bbcla=
ss
> > >>         #
> > >>
> > >> -       echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> > >> +       echo "${KERNEL_VERSION}" >
> > >> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
> > >>
> > >>         # Copy files required for module builds
> > >>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > >> @@ -361,28 +372,28 @@ EXPORT_FUNCTIONS do_compile do_install do_conf=
igure
> > >>
> > >>  # kernel-base becomes kernel-${KERNEL_VERSION}
> > >>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
> > >> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel=
-dev
> > >> kernel-modules"
> > >> +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > >> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > >> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
> > >>  FILES_${PN} =3D ""
> > >> -FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order
> > >> /lib/modules/${KERNEL_VERSION}/modules.builtin"
> > >> -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> > >> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers*
> > >> /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/buil=
d"
> > >> -FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> > >> -FILES_kernel-modules =3D ""
> > >> -RDEPENDS_kernel =3D "kernel-base"
> > >> +FILES_${KERNEL_PACKAGE_NAME}-base =3D
> > >> "/lib/modules/${KERNEL_VERSION}/modules.order
> > >> /lib/modules/${KERNEL_VERSION}/modules.builtin"
> > >> +FILES_${KERNEL_PACKAGE_NAME}-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> > >> +FILES_${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map*
> > >> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
> > >> /lib/modules/${KERNEL_VERSION}/build"
> > >> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux*"
> > >> +FILES_${KERNEL_PACKAGE_NAME}-modules =3D ""
> > >> +RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
> > >>  # Allow machines to override this dependency if kernel image files =
are
> > >>  # not wanted in images as standard
> > >> -RDEPENDS_kernel-base ?=3D "kernel-image"
> > >> -PKG_kernel-image =3D
> > >> "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> > >> -RDEPENDS_kernel-image +=3D "${@base_conditional('KERNEL_IMAGETYPE',
> > >> 'vmlinux', 'kernel-vmlinux', '', d)}"
> > >> -PKG_kernel-base =3D
> > >> "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
> > >> -RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
> > >> -ALLOW_EMPTY_kernel =3D "1"
> > >> -ALLOW_EMPTY_kernel-base =3D "1"
> > >> -ALLOW_EMPTY_kernel-image =3D "1"
> > >> -ALLOW_EMPTY_kernel-modules =3D "1"
> > >> -DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
> > >> -
> > >> -pkg_postinst_kernel-base () {
> > >> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-i=
mage"
> > >> +PKG_${KERNEL_PACKAGE_NAME}-image =3D
> > >> "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_V=
ERSION}')}"
> > >> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=3D
> > >> "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux',
> > >> '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
> > >> +PKG_${KERNEL_PACKAGE_NAME}-base =3D
> > >> "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION=
}')}"
> > >> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=3D
> > >> "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
> > >> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} =3D "1"
> > >> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base =3D "1"
> > >> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image =3D "1"
> > >> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules =3D "1"
> > >> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta
> > >> package"
> > >> +
> > >> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
> > >>         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > >>                 mkdir -p $D/lib/modules/${KERNEL_VERSION}
> > >>         fi
> > >> @@ -393,18 +404,18 @@ pkg_postinst_kernel-base () {
> > >>         fi
> > >>  }
> > >>
> > >> -pkg_postinst_kernel-image () {
> > >> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
> > >>         update-alternatives --install
> > >> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
> > >> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> > >> ${KERNEL_PRIORITY} || true
> > >>  }
> > >>
> > >> -pkg_postrm_kernel-image () {
> > >> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
> > >>         update-alternatives --remove ${KERNEL_IMAGETYPE}
> > >> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> > >>  }
> > >>
> > >>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
> > >>
> > >>  python split_kernel_packages () {
> > >> -    do_split_packages(d, root=3D'/lib/firmware',
> > >> file_regex=3D'^(.*)\.(bin|fw|cis|dsp)$', output_pattern=3D'kernel-fi=
rmware-%s',
> > >> description=3D'Firmware for %s', recursive=3DTrue, extra_depends=3D'=
')
> > >> +    do_split_packages(d, root=3D'/lib/firmware',
> > >> file_regex=3D'^(.*)\.(bin|fw|cis|dsp)$',
> > >> output_pattern=3D'${KERNEL_PACKAGE_NAME}-firmware-%s', description=
=3D'Firmware
> > >> for %s', recursive=3DTrue, extra_depends=3D'')
> > >>  }
> > >>
> > >>  do_strip() {
> > >> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.=
conf
> > >> index 1b5c071..fb5e03f 100644
> > >> --- a/meta/conf/documentation.conf
> > >> +++ b/meta/conf/documentation.conf
> > >> @@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] =3D "Includes additional me=
tadata
> > >> from the Yocto Project kern
> > >>  KERNEL_IMAGETYPE[doc] =3D "The type of kernel to build for a device,
> > >> usually set by the machine configuration files and defaults to 'zIma=
ge'."
> > >>  KERNEL_MODULE_AUTOLOAD[doc] =3D "Lists kernel modules that need to =
be
> > >> auto-loaded during boot"
> > >>  KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel modules for which th=
e build
> > >> system expects to find module_conf_* values that specify configurati=
on for
> > >> each of the modules"
> > >> +KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. Defa=
ults to
> > >> 'kernel'."
> > >>  KERNEL_PATH[doc] =3D "The location of the kernel sources. This vari=
able is
> > >> set to the value of the STAGING_KERNEL_DIR within the module class
> > >> (module.bbclass)."
> > >>  KERNEL_SRC[doc] =3D "The location of the kernel sources. This varia=
ble is
> > >> set to the value of the STAGING_KERNEL_DIR within the module class
> > >> (module.bbclass)."
> > >>  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a
> > >> configuration fragment. You use this variable in the .scc file that
> > >> describes a configuration fragment file."
> > >> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> > >> b/meta/recipes-kernel/linux/linux-dtb.inc
> > >> index 772adcb..c27a3cb 100644
> > >> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > >> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > >> @@ -2,7 +2,7 @@
> > >>  FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/devicetree*"
> > >>
> > >>  python __anonymous () {
> > >> -    d.appendVar("PACKAGES", " kernel-devicetree")
> > >> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
> > >>  }
> > >>
> > >>  normalize_dtb () {
> > >> --
> > >> 2.6.2
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >>
> > >
> > >
> > >
> > > --
> > > "Thou shalt not follow the NULL pointer, for chaos and madness await =
thee
> > > at its end"
> > >
> >=20
> >=20
> >=20
> > --=20
> > "Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee
> > at its end"
>=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZwY+0ACgkQN1Ujt2V2gBzISgCeOuaz17/x0+BluaJW7VuHOQcd
kOgAoKE0BKdMUKAlkOMKUWEaKPzaRwOc
=pJWz
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
