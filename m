Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5F271A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 08:00:17 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id z19so33656172qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NQD6I9Qdgw+1CiF63X8IoLS4ID2filB34eYQqX/dEhY=;
	b=esXs7SuZubhTk9PXKF4wIfnCDIfCMvYC4Ikn8wECFI1VIVPrJwZErql+/ObfuoUou3
	D/+8dfdFAS0xjYeV89KDOzAGHX5BX4shpYncZGIT+h2Ig4UQIDwQ6K3YlExBlmvk9h5P
	tMbdIbNn9jWvGz3PQM8CfJnAkn1QLjLsX7QJ7r40T5fPESgsTT1MeJ4JvFAdmozBt/xC
	xHRDknH5eu1c3d1V81bLk1fh8rCqnQYyQLLll2Q0k2yaGCWERtjCHmWNJpM0OhIDeBqO
	IuAtK7QlCo0s9KqMylwpn9hMovT3PbMUgSg+zsCjzSWBfWweArPacldpZBo4GCNtSymN
	6lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NQD6I9Qdgw+1CiF63X8IoLS4ID2filB34eYQqX/dEhY=;
	b=M+Tj9sG4jXuT2PX17IhpAzbOfxf85mCbIJvdrvN1GKCZpEKYF35wURfOJaxrnFFz+4
	RZqPrOQWuY6+aUB4gFb3djSZ9boq+vS7yoiGmPsbdvh1/Mh9SU1O9xZ24gCTGLCO6hyL
	4z+58mz7wmcycvjvjYW/l6GOFpPj+EJcO7GULZWEIuJKGjz/bq7do+Wt0Psud9YF9bKA
	JbVKSF3G9fyaqQjurDKatlRG/z+ZfdtmKx5ZDX0N0IKzM5ZJUr7CVygwVfJNDfl6Qaw8
	hOEJp9rIFoKVO5PqdMx9i8r/x/kIZiLI6KxqiRvaspyL8CC1YX2b5V24KAYyadBSRXgv
	A6tg==
X-Gm-Message-State: AMCzsaUB0nH9DIlQA8OoPhtxcZo3zijgq7/8EQxE9tcwGyGaocQb4NAa
	GBRizJ93q5oAteSCyw+q2S1xul7pP9j4pdDER7Q=
X-Google-Smtp-Source: ABhQp+RDpBaX4pFBfpaNkfeAsXAISzqcmuukomCjc69E9Ksh0Nbpw44VQJE1uE4IWEgau6znsOJaT3C7LkhfHEOZoxk=
X-Received: by 10.200.48.103 with SMTP id g36mr29479820qte.289.1508918415283; 
	Wed, 25 Oct 2017 01:00:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 25 Oct 2017 01:00:14 -0700 (PDT)
In-Reply-To: <20171019191901.13245-1-haris.okanovic@ni.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171019191901.13245-1-haris.okanovic@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Oct 2017 04:00:14 -0400
Message-ID: <CADkTA4MToFo5X28sZPYBg1xAZJuGV5B-K334iTtkNCyeuqTzGw@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, josh.hernstrom@ni.com
Subject: Re: [PATCH v8] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Wed, 25 Oct 2017 08:00:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2017 at 3:19 PM, Haris Okanovic <haris.okanovic@ni.com> wro=
te:
> Some distros may want to provide alternate kernel "flavors" via feeds or
> within bootable images. For example, readily available builds which
> provide certain diagnostic features can enable developers and testers to
> more quickly resolve issues by avoiding lengthy kernel builds.
>
> This change allows for building multiple flavors of the kernel and
> module packages by templatizing kernel package names via a new
> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the old
> name of "kernel", but can be overridden by certain recipes providing
> alternate kernel flavors.
>
> To maintain compatibility, recipes providing alternate kernel flavors
> cannot be the "preferred provider" for virtual/kernel. This is because
> OE puts the preferred provider's build and source at
> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes using the
> default KERNEL_PACKAGE_NAME=3D"kernel" follows the old semantics -- build
> in the old location and may be preferred provider -- while recipes using
> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and don't
> provide "virtual/kernel".
>
> Testing:
>  1. Prepended `KERNEL_PACKAGE_NAME =3D "tiny-linux"` to
>     linux-yocto-tiny_4.9.bb so that it may build alongside
>     the main kernel.
>  2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel flavors.
>  3. Verified image and modules IPKs exist for both:
>     tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>     tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-tiny
>  4. Verified linux-yocto is the "preferred provider", and was built in
>     shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>  5. Appended `CORE_IMAGE_BASE_INSTALL +=3D "tiny-linux"` to
>     core-image-base.bb to include both kernel flavors.
>  6. `bitbake core-image-base` to build an image.
>  7. Verified image contains two bzImage's under /boot/, with
>     "yocto-standard" selected to boot via symlink.
>
> Discussion threads:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-December/t=
hread.html#114122
> http://lists.openembedded.org/pipermail/openembedded-core/2017-July/threa=
d.html#139130
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
> ---
> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to the
> "work" directory in alternate kernel builds, instead of "work-shared",
> so
> that the two builds don't clobber each other.
>
> [PATCH v3] An updated version of this change rebased onto the current
> OE-core master. Changes:
>  - Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate
>    kernel builds, since alternate kernels aren't the
>    PREFERRED_PROVIDER for virtual/kernel by definition.
>  - Remove "virtual/kernel" from PROVIDES in alternate kernel builds.
>
> [PATCH v4] Another rebase onto master; no functional change.
> Improved description and testing steps.
>
> [PATCH v5]
>  - Warn when PN =3D=3D KERNEL_PACKAGE_NAME (bug # 11905)
>  - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions
>
> [PATCH v6] Add KERNEL_PACKAGE_NAME to kernel-module-split.bbclass for
> module recipes; fixes lttng-modules build.
>
> [PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from
> kernel-module-split.bbclass; apply a default in two places where
> KERNEL_PACKAGE_NAME is referenced.
>
> [PATCH v8] Rebase onto current master and more fixups.
>  - kernel-devicetree.bbclass: Fixup package names
>  - depmodwrapper-cross: don't error when called from alt kernel recipes
>  - kernel.bbclass: Don't install /boot/image symlink in alt recipes
>
> https://github.com/harisokanovic/openembedded-core/tree/dev/hokanovi/mult=
i-kernel-packages-v8
> ---
>  meta/classes/kernel-devicetree.bbclass             |   8 +-
>  meta/classes/kernel-module-split.bbclass           |   9 +-
>  meta/classes/kernel.bbclass                        | 114 +++++++++++++--=
------
>  meta/conf/documentation.conf                       |   1 +
>  .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  14 +--
>  meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>  6 files changed, 90 insertions(+), 58 deletions(-)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel=
-devicetree.bbclass
> index 6e08be4b70..4f80cc62eb 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -1,10 +1,10 @@
>  # Support for device tree generation
>  PACKAGES_append =3D " \
> -    kernel-devicetree \
> -    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BU=
NDLE') !=3D '1']} \
> +    ${KERNEL_PACKAGE_NAME}-devicetree \
> +    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.=
getVar('KERNEL_DEVICETREE_BUNDLE') !=3D '1']} \
>  "
> -FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGED=
EST}/*.dtbo"
> -FILES_kernel-image-zimage-bundle =3D "/${KERNEL_IMAGEDEST}/zImage-*.dtb.=
bin"
> +FILES_${KERNEL_PACKAGE_NAME}-devicetree =3D "/${KERNEL_IMAGEDEST}/*.dtb =
/${KERNEL_IMAGEDEST}/*.dtbo"
> +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle =3D "/${KERNEL_IMAGEDES=
T}/zImage-*.dtb.bin"
>
>  # Generate kernel+devicetree bundle
>  KERNEL_DEVICETREE_BUNDLE ?=3D "0"
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 1035525dac..73c7f18c78 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -30,7 +30,7 @@ do_install_append() {
>
>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_module_packages "
>
> -KERNEL_MODULES_META_PACKAGE ?=3D "kernel-modules"
> +KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME", Tr=
ue) or "kernel" }-modules"
>
>  KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
>  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>             postfix =3D format.split('%s')[1]
>             d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>
> +    kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME", True) or "ke=
rnel"
> +    kernel_version =3D d.getVar("KERNEL_VERSION", True)

Minor 'nit, is this just a cleanup and not part of the technical bits
of the patch ?
When making changes to a complex recipe .. it really is a better idea to do=
 this
in a separate patch.

If I've missed how this is related to the new KERNEL_PACKAGE_NAME, then
disregard that comment. i.e. you really can't mix the new variable and
the d.getVar
call in the do_split_packages. Either way, no issue .. that use of a
variable just
jumped out to me as unrelated to the actual package name varying.

> +
>      module_regex =3D '^(.*)\.k?o$'
>
>      module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>      module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> -    module_pattern =3D module_pattern_prefix + 'kernel-module-%s' + modu=
le_pattern_suffix
> +    module_pattern =3D module_pattern_prefix + kernel_package_name + '-m=
odule-%s' + module_pattern_suffix
>
>      postinst =3D d.getVar('pkg_postinst_modules')
>      postrm =3D d.getVar('pkg_postrm_modules')
>
> -    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL=
_VERSION")))
> +    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,=
 kernel_version))
>      if modules:
>          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
>          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 756707a3c2..48b718d777 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,6 +1,9 @@
>  inherit linux-kernel-base kernel-module-split
>
> -PROVIDES +=3D "virtual/kernel"
> +KERNEL_PACKAGE_NAME ??=3D "kernel"
> +KERNEL_DEPLOYSUBDIR ??=3D "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME", Tr=
ue) =3D=3D "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
> +
> +PROVIDES +=3D "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME", =
True) =3D=3D "kernel") else "" }"
>  DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}g=
cc kmod-native bc-native lzop-native"
>  PACKAGE_WRITE_DEPS +=3D "depmodwrapper-cross"
>
> @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_na=
me(d.getVar('KERNEL_VERSION')
>  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
>
>  python __anonymous () {
> +    pn =3D d.getVar("PN", True)
> +    kpn =3D d.getVar("KERNEL_PACKAGE_NAME", True)
> +
> +    # XXX Remove this after bug 11905 is resolved
> +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
> +    if kpn =3D=3D pn:
> +        bb.warn("Some packages (E.g. *-dev) might be missing due to "
> +                "bug 11905 (variable KERNEL_PACKAGE_NAME =3D=3D PN)")
> +
> +    # The default kernel recipe builds in a shared location defined by
> +    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDD=
IR.
> +    # Set these variables to directories under ${WORKDIR} in alternate
> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel) so tha=
t they
> +    # may build in parallel with the default kernel without clobbering.
> +    if kpn !=3D "kernel":
> +        workdir =3D d.getVar("WORKDIR", True)
> +        sourceDir =3D os.path.join(workdir, 'kernel-source')
> +        artifactsDir =3D os.path.join(workdir, 'kernel-build-artifacts')
> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>
>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGET=
YPES
>      type =3D d.getVar('KERNEL_IMAGETYPE') or ""
>      alttype =3D d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>      types =3D d.getVar('KERNEL_IMAGETYPES') or ""
> +    kname =3D d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>      if type not in types.split():
>          types =3D (type + ' ' + types).strip()
>      if alttype not in types.split():
> @@ -55,15 +79,15 @@ python __anonymous () {
>          typelower =3D type.lower()
>          imagedest =3D d.getVar('KERNEL_IMAGEDEST')
>
> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>
> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/=
' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagede=
st + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type=
)
>
> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typ=
elower)
> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname=
, typelower))
>
> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + type=
lower + '-${KERNEL_VERSION_PKG_NAME}')
> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${K=
ERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>
> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
>
>      image =3D d.getVar('INITRAMFS_IMAGE')
>      if image:
> @@ -121,9 +145,9 @@ base_do_unpack_append () {
>
>  inherit kernel-arch deploy
>
> -PACKAGES_DYNAMIC +=3D "^kernel-module-.*"
> -PACKAGES_DYNAMIC +=3D "^kernel-image-.*"
> -PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-image-.*"
> +PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>
>  export OS =3D "${TARGET_OS}"
>  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> @@ -339,7 +363,9 @@ kernel_do_install() {
>         install -d ${D}/boot
>         for type in ${KERNEL_IMAGETYPES} ; do
>                 install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNE=
L_IMAGEDEST}/${type}-${KERNEL_VERSION}
> -               ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}=
/${type}
> +               if [ "${KERNEL_PACKAGE_NAME}" =3D=3D "kernel" ]; then
> +                       ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IM=
AGEDEST}/${type}
> +               fi
>         done
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>
>  emit_depmod_pkgdata() {
>         # Stash data for depmod
> -       install -d ${PKGDESTWORK}/kernel-depmod/
> -       echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-ab=
iversion
> -       cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERN=
EL_VERSION}
> +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
> +       echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-=
depmod/${KERNEL_PACKAGE_NAME}-abiversion
> +       cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/S=
ystem.map-${KERNEL_VERSION}
>  }
>
>  PACKAGEFUNCS +=3D "emit_depmod_pkgdata"
> @@ -410,7 +436,7 @@ do_shared_workdir () {
>         # Store the kernel version in sysroots for module-base.bbclass
>         #
>
> -       echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> +       echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiv=
ersion
>
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev =
kernel-modules"
> +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNE=
L_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}=
-dev ${KERNEL_PACKAGE_NAME}-modules"
>  FILES_${PN} =3D ""
> -FILES_kernel-base =3D "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/=
modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.buil=
tin"
> -FILES_kernel-image =3D ""
> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/bui=
ld"
> -FILES_kernel-vmlinux =3D "/boot/vmlinux-${KERNEL_VERSION_NAME}"
> -FILES_kernel-modules =3D ""
> -RDEPENDS_kernel =3D "kernel-base"
> +FILES_${KERNEL_PACKAGE_NAME}-base =3D "${nonarch_base_libdir}/modules/${=
KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSI=
ON}/modules.builtin"
> +FILES_${KERNEL_PACKAGE_NAME}-image =3D ""
> +FILES_${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* /boot/Module.sym=
vers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KER=
NEL_VERSION}/build"
> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux-${KERNEL_VERSION=
_NAME}"
> +FILES_${KERNEL_PACKAGE_NAME}-modules =3D ""
> +RDEPENDS_${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> -RDEPENDS_kernel-base ?=3D "kernel-image"
> -PKG_kernel-image =3D "kernel-image-${@legitimize_package_name('${KERNEL_=
VERSION}')}"
> -RDEPENDS_kernel-image +=3D "${@base_conditional('KERNEL_IMAGETYPE', 'vml=
inux', 'kernel-vmlinux', '', d)}"
> -PKG_kernel-base =3D "kernel-${@legitimize_package_name('${KERNEL_VERSION=
}')}"
> -RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
> -ALLOW_EMPTY_kernel =3D "1"
> -ALLOW_EMPTY_kernel-base =3D "1"
> -ALLOW_EMPTY_kernel-image =3D "1"
> -ALLOW_EMPTY_kernel-modules =3D "1"
> -DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
> -
> -pkg_postinst_kernel-base () {
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image"
> +PKG_${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@le=
gitimize_package_name('${KERNEL_VERSION}')}"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image +=3D "${@base_conditional('KERNEL_=
IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
> +PKG_${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimiz=
e_package_name('${KERNEL_VERSION}')}"
> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KER=
NEL_VERSION}"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image =3D "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules =3D "1"
> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta pack=
age"
> +
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>                 mkdir -p $D/lib/modules/${KERNEL_VERSION}
>         fi
> @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
>
>  python split_kernel_packages () {
> -    do_split_packages(d, root=3D'${nonarch_base_libdir}/firmware', file_=
regex=3D'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern=3D'kernel-firmware-%=
s', description=3D'Firmware for %s', recursive=3DTrue, extra_depends=3D'')
> +    do_split_packages(d, root=3D'${nonarch_base_libdir}/firmware', file_=
regex=3D'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern=3D'${KERNEL_PACKAGE_=
NAME}-firmware-%s', description=3D'Firmware for %s', recursive=3DTrue, extr=
a_depends=3D'')
>  }
>
>  # Many scripts want to look in arch/$arch/boot for the bootable
> @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE=
}.tgz"
>  MODULE_TARBALL_DEPLOY ?=3D "1"
>
>  kernel_do_deploy() {
> +       deployDir=3D"${DEPLOYDIR}"
> +       if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
> +               deployDir=3D"${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
> +               mkdir "$deployDir"
> +       fi
> +
>         for type in ${KERNEL_IMAGETYPES} ; do
>                 base_name=3D${type}-${KERNEL_IMAGE_BASE_NAME}
> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${DEPLOYDIR}=
/${base_name}.bin
> +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/$=
{base_name}.bin
>         done
>         if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e '^CONFI=
G_MODULES=3Dy$' .config); then
>                 mkdir -p ${D}/lib
> -               tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D=
} lib
> -               ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_=
TARBALL_SYMLINK_NAME}
> +               tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C ${D} =
lib
> +               ln -sf ${MODULE_TARBALL_BASE_NAME} $deployDir/${MODULE_TA=
RBALL_SYMLINK_NAME}
>         fi
>
>         for type in ${KERNEL_IMAGETYPES} ; do
>                 base_name=3D${type}-${KERNEL_IMAGE_BASE_NAME}
>                 symlink_name=3D${type}-${KERNEL_IMAGE_SYMLINK_NAME}
> -               ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
> -               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
> +               ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
> +               ln -sf ${base_name}.bin $deployDir/${type}
>         done
>
>         cd ${B}
> @@ -650,8 +682,8 @@ kernel_do_deploy() {
>                         echo "Copying deploy ${type} kernel-initramfs ima=
ge and setting up links..."
>                         initramfs_base_name=3D${type}-${INITRAMFS_BASE_NA=
ME}
>                         initramfs_symlink_name=3D${type}-initramfs-${MACH=
INE}
> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.init=
ramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
> -                       ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${=
initramfs_symlink_name}.bin
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.init=
ramfs $deployDir/${initramfs_base_name}.bin
> +                       ln -sf ${initramfs_base_name}.bin $deployDir/${in=
itramfs_symlink_name}.bin
>                 fi
>         done
>  }
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index a55e2836b5..2c88504fb9 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] =3D "The type of kernel to buil=
d for a device, usually set b
>  KERNEL_IMAGETYPES[doc] =3D "The list of types of kernel to build for a d=
evice, usually set by the machine configuration files and defaults to KERNE=
L_IMAGETYPE."
>  KERNEL_MODULE_AUTOLOAD[doc] =3D "Lists kernel modules that need to be au=
to-loaded during boot"
>  KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel modules for which the bui=
ld system expects to find module_conf_* values that specify configuration f=
or each of the modules"
> +KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. Defaults =
to 'kernel'."
>  KERNEL_PATH[doc] =3D "The location of the kernel sources. This variable =
is set to the value of the STAGING_KERNEL_DIR within the module class (modu=
le.bbclass)."
>  KERNEL_SRC[doc] =3D "The location of the kernel sources. This variable i=
s set to the value of the STAGING_KERNEL_DIR within the module class (modul=
e.bbclass)."
>  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a configu=
ration fragment. You use this variable in the .scc file that describes a co=
nfiguration fragment file."
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/r=
ecipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index 44d013f29d..2eec921728 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -23,17 +23,13 @@ if [ "\$1" !=3D "-a" -o "\$2" !=3D "-b" ]; then
>      echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>      exit 1
>  fi
> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
> -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion=
" >&2
> -else
> -    kernelabi=3D\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
> -    if [ "\$kernelabi" !=3D "\$4" ]; then
> -        echo "Error: Kernel version \$4 does not match kernel-abiversion=
 (\$kernelabi)" >&2
> -        exit 1

Why is the kernel abi check being dropped ? Or is is somehow relocated and =
the
diff is just hiding it from me ?

I see you referencing the depmod wrapper change in the v8 summary, but it
isn't clear to me that removing the check completely is a good idea.

The changes look good to me in general, just my comment and question
above.

Bruce

> -    fi
> +
> +kernelabi=3D""
> +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
> +    kernelabi=3D\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
>  fi
>
> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelab=
i" !=3D "\$4" ]; then
>      echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >=
&2
>      exec env depmod "\$1" "\$2" "\$3" "\$4"
>  else
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 9c1f61be75..8a70eb5018 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -12,7 +12,7 @@ INC_PR =3D "r4"
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids network access requ=
ired
>  # by the use of AUTOREV SRCREVs, which are the default for this recipe.
>  python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=3D d.getVar("PN")=
:
> +    if d.getVar("KERNEL_PACKAGE_NAME", True) =3D=3D "kernel" and d.getVa=
r("PREFERRED_PROVIDER_virtual/kernel", True) !=3D d.getVar("PN", True):
>          d.delVar("BB_DONT_CACHE")
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kerne=
l to %s to enable it" % (d.getVar("PN")))
>  }
> --
> 2.14.2
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

