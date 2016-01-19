Return-Path: <harisokn@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F51C6080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 22:40:12 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id e195so28492217oig.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:reply-to:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=BTyX8k0w3TxibhX6gXyBdH6uP0zKVIEl2A5eP1yQzto=;
	b=1Gk44VM5kzFFRRl3jZw2pyuwte+QG9a3XsuD/fOO2WuwbUChTZ6OplKm7UIfeWTU6z
	rOmNuHZ+pm8MB9TgHB1pi1Yh/W6ELOt98UEz0fbOclGF+/lg7tzA2TdCsnD0BAKuIsZd
	jYF90jHyK2LYYO6K/vX78YUEqVBQjobSLYGHqkXYOlamSFVqfM229NvybEs4PDFuDpGC
	l+bqXi83mWhrRGVS4dn06f+lpD/gQ/oecJn17K1Rm3SIHEataE87gbUsRS8GiAKL87OV
	XkfGP+nN7EbBqUsB7Vfokq2voMHZaugn1Ap8AVg1Gg1Ssn9qMYgVjqQCRMe2JmaVNioY
	BKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:reply-to:from
	:message-id:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=BTyX8k0w3TxibhX6gXyBdH6uP0zKVIEl2A5eP1yQzto=;
	b=FjS2zmDvwPUrSrmWA+2OxKy3Rv4BfOyD70Zwne3VIywRCzEhSuG9kd3/By/hdwPZHd
	rFWW31/UJRt3ESohchE6GDgr1K6m+eT4jR3eybUDL9QGleHmB3M8yRB48HscuiWNUTuX
	OFiblAKrNEagRzggAAkrK+cvENUwhuHaR/0w/humnArlzSqjjD0UH4IfaB0tx7me1vKi
	Utl9Zc+nFeP55yOVmlm0NXIxYm4GFpqH4z3QvdZQisuC7VckGRIxawcfunvlX8K31wET
	WupdfT1zsrnhcI3KKkgaeKFw7/4DEt6JKHGP/s1pOjmWpV98V0yj0SztHnID9sRSegQC
	kECw==
X-Gm-Message-State: ALoCoQmEXcq56BXk1EKi98TCWD/BE/JKCoUQ0R3CtqmejdGh50C0AkCAS0BQ+br+MFRnDitY1B9EuhGS3bMGSH77kH62R5/lPg==
X-Received: by 10.202.230.197 with SMTP id d188mr24185725oih.59.1453243213163; 
	Tue, 19 Jan 2016 14:40:13 -0800 (PST)
Received: from [192.168.1.100] (cpe-72-182-40-142.austin.res.rr.com.
	[72.182.40.142]) by smtp.gmail.com with ESMTPSA id
	wu6sm16664115obb.16.2016.01.19.14.40.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 14:40:12 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
Reply-To: Haris Okanovic <haris.okanovic@ni.com>
From: Haris Okanovic <harisokn@gmail.com>
Message-ID: <569EBB4B.7020606@gmail.com>
Date: Tue, 19 Jan 2016 16:40:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	Gratian Crisan <gratian.crisan@ni.com>
Subject: Re: [PATCH v2] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 19 Jan 2016 22:40:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Any concerns pulling this into master as-is?

We briefly discussed the possibility of building out-of-tree modules
against multiple kernels back in December, right before this thread
died. This change certainly doesn't preclude that improvement if someone
would like to implement it, nor does it change current behavior.
More importantly, it provides a useful function as-is in our opinion --
E.g. to provide a debug kernel in a feed for testing/development activities.

Thread: http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72908

Thanks,
Haris


On 12/14/2015 04:35 PM, Haris Okanovic wrote:
> From: Gratian Crisan <gratian.crisan@ni.com>
>
> This change allows distributions to provide multiple builds of kernel
> and module packages. For example, a distro may want provide an alternate
> debug kernel in a package feed for debug/testing.
>
> Templetize kernel package name:
>
> Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for kernel
> packages. It defaults to the old hard-coded name 'kernel' but it can be
> redefined by recipes that provide additional kernel packages in order
> to avoid build conflicts.
>
> Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
> kernel bbclass-es.
>
> Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:
>
> Prior to this change, kernel recipes would all fetch source to
> STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
> parallel builds when more than one kernel recipes are defined in
> the distribution, since they all attempted to fetch() and patch()
> in a shared source dir.
>
> With this change, alternate kernel recipes fetch source into their
> ${WORKDIR} so that they may build in parallel to each other and the
> default kernel recipe, which still fetches to STAGING_KERNEL_DIR.
>
> Testing:
>
> Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
> image and modules packages. Added kernel recipe with non-default
> KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
> packages with alternate name next to default kernel.
>
> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
> Natinst-ReviewBoard-ID: 120348
> Natinst-ReviewBoard-ID: 120447
> ---
>   meta/classes/kernel-module-split.bbclass |  9 ++--
>   meta/classes/kernel.bbclass              | 76 ++++++++++++++++++++------------
>   meta/conf/documentation.conf             |  1 +
>   meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
>   4 files changed, 55 insertions(+), 33 deletions(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> index e1a70e6..7415ec8 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -28,7 +28,7 @@ do_install_append() {
>
>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>
> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>
>   python split_kernel_module_packages () {
>       import re
> @@ -179,14 +179,17 @@ python split_kernel_module_packages () {
>           # Avoid automatic -dev recommendations for modules ending with -dev.
>           d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
>
> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
> +    kernel_version = d.getVar("KERNEL_VERSION", True)
> +
>       module_deps = parse_depmod()
>       module_regex = '^(.*)\.k?o$'
> -    module_pattern = 'kernel-module-%s'
> +    module_pattern = '%s-module-%%s' % kernel_package_name
>
>       postinst = d.getVar('pkg_postinst_modules', True)
>       postrm = d.getVar('pkg_postrm_modules', True)
>
> -    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
> +    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>       if modules:
>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b75a462..281519e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,5 +1,23 @@
>   inherit linux-kernel-base kernel-module-split
>
> +KERNEL_PACKAGE_NAME ??= "kernel"
> +
> +# The default kernel recipe builds in a shared location defined by
> +# bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
> +# Set these variables to directories under ${WORKDIR} in alternate
> +# kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
> +# may build in parallel with the default kernel without clobbering.
> +python __anonymous () {
> +    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
> +        workdir = d.getVar("WORKDIR", True)
> +
> +        sourceDir = os.path.join(workdir, 'kernel-source')
> +        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
> +
> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
> +}
> +
>   PROVIDES += "virtual/kernel"
>   DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
>
> @@ -79,9 +97,9 @@ base_do_unpack_append () {
>
>   inherit kernel-arch deploy
>
> -PACKAGES_DYNAMIC += "^kernel-module-.*"
> -PACKAGES_DYNAMIC += "^kernel-image-.*"
> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>
>   export OS = "${TARGET_OS}"
>   export CROSS_COMPILE = "${TARGET_PREFIX}"
> @@ -270,9 +288,9 @@ do_shared_workdir_setscene () {
>
>   emit_depmod_pkgdata() {
>   	# Stash data for depmod
> -	install -d ${PKGDESTWORK}/kernel-depmod/
> -	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
> -	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
> +	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
> +	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
>   }
>
>   PACKAGEFUNCS += "emit_depmod_pkgdata"
> @@ -287,7 +305,7 @@ do_shared_workdir () {
>   	# Store the kernel version in sysroots for module-base.bbclass
>   	#
>
> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> +	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>
>   	# Copy files required for module builds
>   	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> @@ -361,28 +379,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>   # kernel-base becomes kernel-${KERNEL_VERSION}
>   # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>   FILES_${PN} = ""
> -FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> -FILES_kernel-vmlinux = "/boot/vmlinux*"
> -FILES_kernel-modules = ""
> -RDEPENDS_kernel = "kernel-base"
> +FILES_${KERNEL_PACKAGE_NAME}-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
> +FILES_${KERNEL_PACKAGE_NAME}-image = "/boot/${KERNEL_IMAGETYPE}*"
> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux*"
> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>   # Allow machines to override this dependency if kernel image files are
>   # not wanted in images as standard
> -RDEPENDS_kernel-base ?= "kernel-image"
> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
> -ALLOW_EMPTY_kernel = "1"
> -ALLOW_EMPTY_kernel-base = "1"
> -ALLOW_EMPTY_kernel-image = "1"
> -ALLOW_EMPTY_kernel-modules = "1"
> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
> -
> -pkg_postinst_kernel-base () {
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
> +
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>   	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>   		mkdir -p $D/lib/modules/${KERNEL_VERSION}
>   	fi
> @@ -393,18 +411,18 @@ pkg_postinst_kernel-base () {
>   	fi
>   }
>
> -pkg_postinst_kernel-image () {
> +pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
>   	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>   }
>
> -pkg_postrm_kernel-image () {
> +pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
>   	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>   }
>
>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>
>   python split_kernel_packages () {
> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> +    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>   }
>
>   do_strip() {
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 1b5c071..fb5e03f 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kern
>   KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
>   KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 772adcb..c27a3cb 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -2,7 +2,7 @@
>   FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
>
>   python __anonymous () {
> -    d.appendVar("PACKAGES", " kernel-devicetree")
> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
>   }
>
>   normalize_dtb () {
>

