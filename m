Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BF09F731E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 03:37:04 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a4so6559089wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 19:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OTavFccpKAJK4hNAB/JFIsFVDQ/R2kf0uHfOx1gDC3k=;
	b=ETaMl2aG750oYpon8xwxlqMHvMWjpImYdSNZVvPkxp1LDjbnnC8TgHEW4UjPYY6UdN
	T2xWgWQpQWj0XV4ajlh9ayfQIcxxpXgqDx6f6OXXmnnBGvfE/w+GOPKkYu7+W17Zdd1F
	UowfSdNjQqdk2W/mzbXp76e5Vz447HEus5a5zDop9QaJK4r0MWSgVBkEhxZS3PUHp6n8
	4jPY1S2fLSAvbBmmLrmuPB8YAFndVsSGrp2WbnTSueEghnmsY5aZ40mN8VhDuhvPIoFK
	uqZKoy2cExNN6fEfGdjwy1F0U6VG8aSnpWSf+h6MUyWilsETbrouXgroUJzM9oAdJtQC
	cb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OTavFccpKAJK4hNAB/JFIsFVDQ/R2kf0uHfOx1gDC3k=;
	b=Tvo+o8mb5SvQyTLay94WIAwwdUMq8/8suSfTfCn7hpGCaC5M4c73lv48OmxUhuhECx
	Smkf5Kq+k2sRXrRBoZhEKGyFUa4z5DjOH1uh6/Bh4caMkQioaOW7k77m3P+xMOpTCHmt
	daBmNYq6XjBN9o+YVF0yAjThi7KS08/mEEe0GINDCir8PGK5EzD76W/0nID2D9yCApWZ
	TOZa+PMhAPxmy+ypfduszQfZSYlRwhiF477dKe2PIv8hgR7ueirBiZWHgs0L86IxlD0G
	pnSGuOQB4Y86wbwpZMKN8jjlqUuO6vaEw9+IjwcnXT/lN+vvc3HyDjsgRZsZaG01Vpaw
	gIMA==
X-Gm-Message-State: AG10YOSuc/dm+dGs8TipacSCISeuV6wKt2pfYmgk/LEYvcBgGly5HeUg1Mj0R3T85JlFI6hYxMkynON5XDTaFA==
MIME-Version: 1.0
X-Received: by 10.28.103.197 with SMTP id b188mr851601wmc.4.1455766624612;
	Wed, 17 Feb 2016 19:37:04 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 17 Feb 2016 19:37:04 -0800 (PST)
In-Reply-To: <d36ac8034f8914c57c27a514b9a692c3c1377f42.1455702479.git.zhe.he@windriver.com>
References: <cover.1455702479.git.zhe.he@windriver.com>
	<d36ac8034f8914c57c27a514b9a692c3c1377f42.1455702479.git.zhe.he@windriver.com>
Date: Wed, 17 Feb 2016 19:37:04 -0800
Message-ID: <CAJ86T=VjXe3ocpzQ7n7ZQLbYRiihtG9Yu49cti2vRTpKFDSFqw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: zhe.he@windriver.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
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
X-List-Received-Date: Thu, 18 Feb 2016 03:37:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 17, 2016 at 2:01 AM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Add KERNEL_IMAGETYPES to support building packaging and installing
> multi types of kernel images, such as zImage uImage, at one time.
> KERNEL_IMAGETYPE works as before.
>
> Fixes [YOCTO #6945].
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/classes/kernel-fitimage.bbclass    |  20 ++--
>  meta/classes/kernel-grub.bbclass        |  44 ++++++---
>  meta/classes/kernel-uimage.bbclass      |  22 +++--
>  meta/classes/kernel.bbclass             | 169 ++++++++++++++++++++++----------
>  meta/conf/documentation.conf            |   1 +
>  meta/recipes-kernel/linux/linux-dtb.inc |  49 +++++----
>  6 files changed, 202 insertions(+), 103 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index f1b409c..51df19d 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -1,8 +1,8 @@
>  inherit kernel-uboot
>
>  python __anonymous () {
> -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> -    if kerneltype == 'fitImage':
> +    kerneltypes = d.getVar('KERNEL_IMAGETYPES', True) or ""
> +    if 'fitImage' in kerneltypes.split():
>          depends = d.getVar("DEPENDS", True)
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
> @@ -10,7 +10,9 @@ python __anonymous () {
>         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
>         # to kernel.bbclass . We have to override it, since we pack zImage
>         # (at least for now) into the fitImage .
> -        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
> +        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
> +        if 'fitImage' in typeformake.split():
> +            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', 'zImage'))
>
>          image = d.getVar('INITRAMFS_IMAGE', True)
>          if image:
> @@ -154,7 +156,7 @@ EOF
>  }
>
>  do_assemble_fitimage() {
> -       if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> +       if echo ${KERNEL_IMAGETYPES} | grep -Pq "\bfitImage\b"; then
>                 kernelcount=1
>                 dtbcount=""
>                 rm -f fit-image.its
> @@ -217,14 +219,14 @@ addtask assemble_fitimage before do_install after do_compile
>
>  kernel_do_deploy_append() {
>         # Update deploy directory
> -       if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> +       if echo ${KERNEL_IMAGETYPES} | grep -Pq "\bfitImage\b"; then
>                 cd ${B}
>                 echo "Copying fit-image.its source file..."
> -               its_base_name="${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -               its_symlink_name=${KERNEL_IMAGETYPE}-its-${MACHINE}
> +               its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +               its_symlink_name=fitImage-its-${MACHINE}
>                 install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
> -               linux_bin_base_name="${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -               linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
> +               linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +               linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>                 install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
>
>                 cd ${DEPLOYDIR}
> diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
> index a63f482..f7dcc07 100644
> --- a/meta/classes/kernel-grub.bbclass
> +++ b/meta/classes/kernel-grub.bbclass
> @@ -10,41 +10,44 @@
>  #   updates the new kernel as the boot priority.
>  #
>
> -pkg_preinst_kernel-image_append () {
> +python __anonymous () {
> +    import re
> +
> +    preinst = '''
>         # Parsing confliction
>         [ -f "$D/boot/grub/menu.list" ] && grubcfg="$D/boot/grub/menu.list"
>         [ -f "$D/boot/grub/grub.cfg" ] && grubcfg="$D/boot/grub/grub.cfg"
>         if [ -n "$grubcfg" ]; then
>                 # Dereference symlink to avoid confliction with new kernel name.
> -               if grep -q "/${KERNEL_IMAGETYPE} \+root=" $grubcfg; then
> -                       if [ -L "$D/boot/${KERNEL_IMAGETYPE}" ]; then
> -                               kimage=`realpath $D/boot/${KERNEL_IMAGETYPE} 2>/dev/null`
> +               if grep -q "/KERNEL_IMAGETYPE \+root=" $grubcfg; then
> +                       if [ -L "$D/boot/KERNEL_IMAGETYPE" ]; then
> +                               kimage=`realpath $D/boot/KERNEL_IMAGETYPE 2>/dev/null`
>                                 if [ -f "$D$kimage" ]; then
> -                                       sed -i "s:${KERNEL_IMAGETYPE} \+root=:${kimage##*/} root=:" $grubcfg
> +                                       sed -i "s:KERNEL_IMAGETYPE \+root=:${kimage##*/} root=:" $grubcfg
>                                 fi
>                         fi
>                 fi
>
>                 # Rename old kernel if it conflicts with new kernel name.
> -               if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=" $grubcfg; then
> -                       if [ -f "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" ]; then
> +               if grep -q "/KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=" $grubcfg; then
> +                       if [ -f "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" ]; then
>                                 timestamp=`date +%s`
> -                               kimage="$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
> -                               sed -i "s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=:${kimage##*/} root=:" $grubcfg
> -                               mv "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" "$kimage"
> +                               kimage="$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}-$timestamp-back"
> +                               sed -i "s:KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=:${kimage##*/} root=:" $grubcfg
> +                               mv "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" "$kimage"
>                         fi
>                 fi
>         fi
> -}
> +'''
>
> -pkg_postinst_kernel-image_prepend () {
> +    postinst = '''
>         get_new_grub_cfg() {
>                 grubcfg="$1"
>                 old_image="$2"
> -               title="Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
> +               title="Update KERNEL_IMAGETYPE-${KERNEL_VERSION}-${PV}"
>                 if [ "${grubcfg##*/}" = "grub.cfg" ]; then
>                         rootfs=`grep " *linux \+[^ ]\+ \+root=" $grubcfg -m 1 | \
> -                                sed "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
> +                                sed "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
>
>                         echo "menuentry \"$title\" {"
>                         echo "    set root=(hd0,1)"
> @@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend () {
>                         echo "}"
>                 elif [ "${grubcfg##*/}" = "menu.list" ]; then
>                         rootfs=`grep "kernel \+[^ ]\+ \+root=" $grubcfg -m 1 | \
> -                                sed "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
> +                                sed "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
>
>                         echo "default 0"
>                         echo "timeout 30"
> @@ -87,5 +90,16 @@ pkg_postinst_kernel-image_prepend () {
>                 mv $grubcfgtmp $grubcfg
>                 echo "Caution! Update kernel may affect kernel-module!"
>         fi
> +'''
> +
> +    imagetypes = d.getVar('KERNEL_IMAGETYPES', True)
> +    imagetypes = re.sub(r'\.gz$', '', imagetypes)
> +
> +    for type in imagetypes.split():
> +        typelower = type.lower()
> +        preinst_append = preinst.replace('KERNEL_IMAGETYPE', type)
> +        postinst_prepend = postinst.replace('KERNEL_IMAGETYPE', type)
> +        d.setVar('pkg_preinst_kernel-image-' + typelower + '_append', preinst_append)
> +        d.setVar('pkg_postinst_kernel-image-' + typelower + '_prepend', postinst_prepend)
>  }
>
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
> index f73965b..a238ce4 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -1,23 +1,25 @@
>  inherit kernel-uboot
>
>  python __anonymous () {
> -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> -    if kerneltype == 'uImage':
> +    if "uImage" in (d.getVar('KERNEL_IMAGETYPES', True) or "").split():
>          depends = d.getVar("DEPENDS", True)
>          depends = "%s u-boot-mkimage-native" % depends
>          d.setVar("DEPENDS", depends)
>
> -       # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> -       # to kernel.bbclass . We override the variable here, since we need
> -       # to build uImage using the kernel build system if and only if
> -       # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
> -       # the uImage .
> -       if d.getVar("KEEPUIMAGE", True) != 'yes':
> -            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
> +        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> +        # to kernel.bbclass . We override the variable here, since we need
> +        # to build uImage using the kernel build system if and only if
> +        # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
> +        # the uImage .
> +        if d.getVar("KEEPUIMAGE", True) != 'yes':
> +            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
> +            if "uImage" in typeformake.split():
> +                typeformake.replace('uImage', 'zImage')
> +            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>  }
>
>  do_uboot_mkimage() {
> -       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> +       if echo "${KERNEL_IMAGETYPES}" | grep -Pq "\buImage\b"; then
>                 if test "x${KEEPUIMAGE}" != "xyes" ; then
>                         uboot_prep_kimage
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c3eab50..7f0e292 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -16,12 +16,48 @@ INITRAMFS_IMAGE ?= ""
>  INITRAMFS_TASK ?= ""
>  INITRAMFS_IMAGE_BUNDLE ?= ""
>
> +# KERNEL_VERSION is extracted from source code. It is evaluated as
> +# None for the first parsing, since the code has not been fetched.
> +# After the code is fetched, it will be evaluated as real version
> +# number and cause kernel to be rebuilt. To avoid this, make
> +# KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
> +# LINUX_VERSION which is a constant.
> +KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION', True) or ""}"
> +KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
> +KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION', True))}"
> +KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
> +
>  python __anonymous () {
>      import re
>
> -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> +    type = d.getVar('KERNEL_IMAGETYPE', True) or ""
> +    types = d.getVar('KERNEL_IMAGETYPES', True) or ""
> +    if type not in types.split():
> +        types = (type + ' ' + types).strip()
> +        d.setVar('KERNEL_IMAGETYPES', types)
> +    typeformake = re.sub(r'\.gz', '', types)
> +    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
> +
> +    for type in typeformake.split():
> +        typelower = type.lower()
> +
> +        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
> +
> +        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '*')
> +
> +        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
> +
> +        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
> +
> +        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>
> -    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
> +        imagedest = d.getVar('KERNEL_IMAGEDEST', True)
> +        priority = d.getVar('KERNEL_PRIORITY', True)
> +        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> +        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
> +
> +        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> +        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>
>      image = d.getVar('INITRAMFS_IMAGE', True)
>      if image:
> @@ -93,7 +129,7 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>
>  # Where built kernel lies in the kernel tree
> -KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> +KERNEL_OUTPUT ?= "arch/${ARCH}/boot"

Have you considered the typical case for MIPS when KERNEL_IMAGETYPE is
vmlinux and the image gets created in the top level of the kernel
build directory (instead of arch/${ARCH}/boot/) ? There are two ways
in which that's normally handled - either by enabling the
do_kernel_link_vmlinux() task (as kernels based on linux-yocto.inc do)
or by over-riding the default value of KERNEL_OUTPUT to set it to
"vmlinux" (as I've seen some out of tree kernel recipes based directly
on kernel.bbclass do).

It looks like the "over-ride KERNEL_OUTPUT" method is going to stop
working as a result of this commit, so maybe change the assignment of
KERNEL_OUTPUT from ?'=' to '=' to make that clear. Perhaps rename the
variable to KERNEL_OUTPUT_DIR and update the comment too.


>  KERNEL_IMAGEDEST = "boot"
>
>  #
> @@ -119,8 +155,6 @@ KERNEL_EXTRA_ARGS ?= ""
>  # We don't want to override kernel Makefile variables from the environment
>  EXTRA_OEMAKE = ""
>
> -KERNEL_ALT_IMAGETYPE ??= ""

Do the qemumips and qemumips64 machines need fixing if support for
KERNEL_ALT_IMAGETYPE is removed?

> -
>  # Define where the kernel headers are installed on the target as well as where
>  # they are staged.
>  KERNEL_SRC_PATH = "/usr/src/kernel"
> @@ -166,23 +200,48 @@ copy_initramfs() {
>         echo "Finished copy of initramfs into ./usr"
>  }
>
> -INITRAMFS_BASE_NAME = "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +INITRAMFS_BASE_NAME = "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
>  INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
>  do_bundle_initramfs () {
>         if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
>                 echo "Creating a kernel image with a bundled initramfs..."
>                 copy_initramfs
> -               if [ -e ${KERNEL_OUTPUT} ] ; then
> -                       mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
> -               fi
> +               # Backuping kernel image relies on its type(regular file or symbolic link)
> +               tmp_path=""
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       if [ -h ${KERNEL_OUTPUT}/$type ] ; then
> +                               linkpath=`readlink -n ${KERNEL_OUTPUT}/$type`
> +                               realpath=`readlink -fn ${KERNEL_OUTPUT}/$type`
> +                               mv -f $realpath $realpath.bak
> +                               tmp_path=$tmp_path" "$type"#"$linkpath"#"$realpath
> +                       elif [ -f ${KERNEL_OUTPUT}/$type ]; then
> +                               mv -f ${KERNEL_OUTPUT}/$type ${KERNEL_OUTPUT}/$type.bak
> +                               tmp_path=$tmp_path" "$type"##"
> +                       fi
> +               done
>                 use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>                 kernel_do_compile
> -               mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
> -               mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
> +               # Restoring kernel image
> +               for tp in $tmp_path ; do
> +                       type=`echo $tp|cut -d "#" -f 1`
> +                       linkpath=`echo $tp|cut -d "#" -f 2`
> +                       realpath=`echo $tp|cut -d "#" -f 3`
> +                       if [ -n "$realpath" ]; then
> +                               mv -f $realpath $realpath.initramfs
> +                               mv -f $realpath.bak $realpath
> +                               cd ${B}/$(dirname ${KERNEL_OUTPUT}/$type)
> +                               ln -sf $linkpath.initramfs
> +                       else
> +                               mv -f ${KERNEL_OUTPUT}/$type ${KERNEL_OUTPUT}/$type.initramfs
> +                               mv -f ${KERNEL_OUTPUT}/$type.bak ${KERNEL_OUTPUT}/$type
> +                       fi
> +               done
>                 # Update install area
> -               echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
> -               install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
> -               echo "${B}/${KERNEL_OUTPUT}.initramfs"
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}/$type.initramfs"
> +                       install -m 0644 ${B}/${KERNEL_OUTPUT}/$type.initramfs ${D}/boot/$type-initramfs-${MACHINE}.bin
> +                       echo "${B}/${KERNEL_OUTPUT}/$type.initramfs"
> +               done
>         fi
>  }
>
> @@ -207,10 +266,15 @@ kernel_do_compile() {
>                 copy_initramfs
>                 use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>         fi
> -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> -       if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
> -               gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
> -       fi
> +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> +       for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       if test "${typeformake}.gz" = "${type}"; then
> +                               gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT}/${type}"
> +                               break;
> +                       fi
> +               done
> +       done
>  }
>
>  do_compile_kernelmodules() {
> @@ -251,7 +315,9 @@ kernel_do_install() {
>         #
>         install -d ${D}/${KERNEL_IMAGEDEST}
>         install -d ${D}/boot
> -       install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               install -m 0644 ${KERNEL_OUTPUT}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
> +       done
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>         install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> @@ -365,12 +431,12 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>  PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
>  FILES_${PN} = ""
>  FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> +FILES_kernel-image = ""
>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>  FILES_kernel-modules = ""
>  RDEPENDS_kernel = "kernel-base"
> -# Allow machines to override this dependency if kernel image files are
> +# Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
>  RDEPENDS_kernel-base ?= "kernel-image"
>  PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> @@ -394,14 +460,6 @@ pkg_postinst_kernel-base () {
>         fi
>  }
>
> -pkg_postinst_kernel-image () {
> -       update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> -}
> -
> -pkg_postrm_kernel-image () {
> -       update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> -}
> -
>  PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>
>  python split_kernel_packages () {
> @@ -422,13 +480,13 @@ do_kernel_link_vmlinux() {
>
>  do_strip() {
>         if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> -               if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
> -                       bbwarn "image type will not be stripped (not supported): ${KERNEL_IMAGETYPE}"
> +               if ! (echo "${KERNEL_IMAGETYPES}" | grep -q "vmlinux"); then
> +                       bbwarn "image type(s) will not be stripped (not supported): ${KERNEL_IMAGETYPES}"
>                         return
>                 fi
>
>                 cd ${B}
> -               headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT} | \
> +               headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT}/vmlinux | \
>                           grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
>                           sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
>                           gawk '{print $1}'`
> @@ -438,7 +496,7 @@ do_strip() {
>                                 bbwarn "Section not found: $str";
>                         fi
>
> -                       "$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT}
> +                       "$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT}/vmlinux
>                 }; done
>
>                 bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
> @@ -457,20 +515,22 @@ do_sizecheck() {
>                 if [ -n "$invalid" ]; then
>                         die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)"
>                 fi
> -               size=`du -ks ${B}/${KERNEL_OUTPUT} | awk '{ print $1}'`
> -               if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> -                       die "This kernel (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the size of the kernel by making more of it modular."
> -               fi
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       size=`du -ks ${B}/${KERNEL_OUTPUT}/$type | awk '{print $1}'`
> +                       if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> +                               die "This kernel $type (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the size of the kernel by making more of it modular."
> +                       fi
> +               done
>         fi
>  }
>  do_sizecheck[dirs] = "${B}"
>
>  addtask sizecheck before do_install after do_strip
>
> -KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> +KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>  # Don't include the DATETIME variable in the sstate package signatures
>  KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> -KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> +KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
>  MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>  MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>  MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
> @@ -479,28 +539,37 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
>  MODULE_TARBALL_DEPLOY ?= "1"
>
>  kernel_do_deploy() {
> -       install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> +               install -m 0644 ${KERNEL_OUTPUT}/${type} ${DEPLOYDIR}/${base_name}.bin
> +       done
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>                 mkdir -p ${D}/lib
>                 tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
>                 ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>         fi
>
> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> +               symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
> +               ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
> +               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
> +       done
>
>         cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>
>         cd ${B}
>         # Update deploy directory
> -       if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
> -               echo "Copying deploy kernel-initramfs image and setting up links..."
> -               initramfs_base_name=${INITRAMFS_BASE_NAME}
> -               initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
> -               install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
> -               cd ${DEPLOYDIR}
> -               ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
> -       fi
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               if [ -e "${KERNEL_OUTPUT}/${type}.initramfs" ]; then
> +                       echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
> +                       initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
> +                       initramfs_symlink_name=${type}-initramfs-${MACHINE}
> +                       install -m 0644 ${KERNEL_OUTPUT}/${type}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
> +                       cd ${DEPLOYDIR}
> +                       ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
> +               fi
> +       done
>  }
>  do_deploy[cleandirs] = "${DEPLOYDIR}"
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 00a69da..b3969b0 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -246,6 +246,7 @@ KERNEL_CLASSES[doc] = "A list of classes defining kernel image types that kernel
>  KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line arguments the OpenEmbedded build system passes on when compiling the kernel."
>  KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kernel Git repository. The metadata you add through this variable includes config fragments and features descriptions."
>  KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
> +KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a device, usually set by the machine configuration files and defaults to KERNEL_IMAGETYPE."
>  KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
>  KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
>  KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 651a19e..74f5ef8 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -34,9 +34,12 @@ do_install_append() {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 DTB=`normalize_dtb "${DTB}"`
>                 DTB_BASE_NAME=`basename ${DTB} .dtb`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -               install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> +                       install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +               done
>         done
>  }
>
> @@ -44,31 +47,39 @@ do_deploy_append() {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 DTB=`normalize_dtb "${DTB}"`
>                 DTB_BASE_NAME=`basename ${DTB} .dtb`
> -               DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -               install -d ${DEPLOYDIR}
> -               install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
> -               ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> +                       install -d ${DEPLOYDIR}
> +                       install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
> +                       ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +               done
>         done
>  }
>
>  pkg_postinst_kernel-devicetree () {
>         cd /${KERNEL_IMAGEDEST}
> -       for DTB in ${KERNEL_DEVICETREE}
> -       do
> -               DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +               done
>         done
>  }
>
>  pkg_postrm_kernel-devicetree () {
>         cd /${KERNEL_IMAGEDEST}
> -       for DTB in ${KERNEL_DEVICETREE}
> -       do
> -               DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +               done
>         done
>  }
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

