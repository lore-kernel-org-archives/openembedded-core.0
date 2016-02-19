Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7BABC7728C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:46:57 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id e6so77495999vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WVF/bSbVLURqoPUNKAL+GB+xGEPrEJjA4YrecXPK08c=;
	b=g/YnHn0oEphGNEiY/GNsFrooYbrBV58TWSoFiJgUNcy7xpOqvZYV4nyA9Bh/k4yaXo
	9Q3fHohdvEMkVaSevaIbXvnuXHMHKm9tPh0un+tw0h5UESTHhOMQTDfqbYYTF1BxSf/Y
	8T6EdCbkWAdhMg6zRTcP8SkuoCaSmK50rAF7kdD/FQo/92ZoNE/vuYADW2ZYs25Co2Q0
	MYDCBnS1D2JwAb6O4k4+LQZLtDHFCfIaVGLICU3a+b9yqPjYAOFTRqnHAOOeFq4jusBx
	amyq5LuHqPRTy84PZphVSv+T4Q42oC6n4/k3vs95x06xt8hzBr/5Ym20vETs/8wCqP65
	zlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WVF/bSbVLURqoPUNKAL+GB+xGEPrEJjA4YrecXPK08c=;
	b=a0S2wwaJHmYm2W4iBzHpbnHpG8pVMUThFeeTH7NtysP5VxAPrLHYtD6c5Apw2ZY3Qp
	xdhg9IN/tJPABBg/XZNv0bGV99CRHen1n309PN3RYgEyiDPSDty5xo9zzaK6YMUCE+ay
	QM0cy8Jq7IARfT9q4qKKzRRW3Bo2cxbHiSQ7q8zt5kN7BJ/fBs2JTD/IxBRBF1KQgBeF
	FMl2VuZBTzrFGgU+BCUVxMaFlW5wMTPcWnJRIsvkt9m98ZMQCzVGHrEIanuSe6kRbNuU
	9IGtB5gRc2mBSp54LneubHrzKy5EUmWF+PxXo8YtnakBtaokORELtnuJh52kXazL12Pz
	vW4Q==
X-Gm-Message-State: AG10YOSXJ2/vda73YIVUk0TRKpRQ3CBOXKtnS5XlpzQdtD5nORTMjpM8ESTEAhhPFc3pwMZkdTT1n1fLFvwQpg==
MIME-Version: 1.0
X-Received: by 10.31.167.195 with SMTP id q186mr10967900vke.113.1455896817391; 
	Fri, 19 Feb 2016 07:46:57 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Fri, 19 Feb 2016 07:46:57 -0800 (PST)
In-Reply-To: <6690be7ba721ca84deeaea05f6cad6636cf8385d.1455874404.git.zhe.he@windriver.com>
References: <cover.1455874404.git.zhe.he@windriver.com>
	<6690be7ba721ca84deeaea05f6cad6636cf8385d.1455874404.git.zhe.he@windriver.com>
Date: Fri, 19 Feb 2016 10:46:57 -0500
Message-ID: <CADkTA4PmdqDX3kWhavQ_rXOi=2w1Xt=2HEx3RC_e_ACacOsvJA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
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
X-List-Received-Date: Fri, 19 Feb 2016 15:46:57 -0000
Content-Type: multipart/alternative; boundary=001a11425fbaa18b77052c2164a4

--001a11425fbaa18b77052c2164a4
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 19, 2016 at 4:56 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Add KERNEL_IMAGETYPES to support building packaging and installing
> multi types of kernel images, such as zImage uImage, at one time.
>
> KERNEL_IMAGETYPE works as before. All KERNEL_ALT_IMAGETYPEs are
> replaced by KERNEL_IMAGETYPES.
>


I see that you have updated layers/configs with the new variable, but
obviously you can't see all the
layers that may be using that old variable.

Isn't it possible to have a python routine that detects the old
ALT_IMAGETYPE variable and
assigns it to the new one (if it isn't already set) ? Sort of like how
distro features/features backfill
work ?


> Fixes [YOCTO #6945].
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  documentation/ref-manual/ref-variables.xml         |  10 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
>  meta/classes/kernel-fitimage.bbclass               |  20 +--
>  meta/classes/kernel-grub.bbclass                   |  44 ++++--
>  meta/classes/kernel-uimage.bbclass                 |  22 +--
>  meta/classes/kernel.bbclass                        | 171
> +++++++++++++++------
>  meta/conf/documentation.conf                       |   1 +
>  meta/conf/machine/qemumips.conf                    |   2 +-
>  meta/conf/machine/qemumips64.conf                  |   2 +-
>  meta/recipes-kernel/linux/linux-dtb.inc            |  49 +++---
>  .../target/arch/mips/conf/machine/machine.conf     |   2 +-
>  .../target/arch/mips64/conf/machine/machine.conf   |   2 +-
>  .../target/arch/qemu/conf/machine/machine.conf     |   2 +-
>  13 files changed, 214 insertions(+), 115 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-variables.xml
> b/documentation/ref-manual/ref-variables.xml
> index a76a8c2..a8e4fd8 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -6417,14 +6417,14 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR
> = "${INC_PR}.3"
>              </glossdef>
>          </glossentry>
>
> -        <glossentry
> id='var-KERNEL_ALT_IMAGETYPE'><glossterm>KERNEL_ALT_IMAGETYPE</glossterm>
> +        <glossentry
> id='var-KERNEL_IMAGETYPES'><glossterm>KERNEL_IMAGETYPES</glossterm>
>              <info>
> -                KERNEL_ALT_IMAGETYPE[doc] = "Specifies an alternate
> kernel image type for creation."
> +                KERNEL_IMAGETYPES[doc] = "Specifies alternate kernel
> image types for creation."
>              </info>
>              <glossdef>
>                  <para role="glossdeffirst">
>  <!--                <para role="glossdeffirst"><imagedata
> fileref="figures/define-generic.png" /> -->
> -                    Specifies an alternate kernel image type for creation
> in
> +                    Specifies alternate kernel image types for creation in
>                      addition to the kernel image type specified using the
>                      <link
> linkend='var-KERNEL_IMAGETYPE'><filename>KERNEL_IMAGETYPE</filename></link>
>                      variable.
> @@ -6612,8 +6612,8 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =
> "${INC_PR}.3"
>                  </para>
>
>                  <para>
> -                    If you want to build an alternate kernel image type,
> use the
> -                    <link
> linkend='var-KERNEL_ALT_IMAGETYPE'><filename>KERNEL_ALT_IMAGETYPE</filename></link>
> +                    If you want to build alternate kernel image types,
> use the
> +                    <link
> linkend='var-KERNEL_IMAGETYPES'><filename>KERNEL_IMAGETYPES</filename></link>
>                      variable.
>                  </para>
>              </glossdef>
> diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf
> b/meta-yocto-bsp/conf/machine/edgerouter.conf
> index 476e690..affd568 100644
> --- a/meta-yocto-bsp/conf/machine/edgerouter.conf
> +++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/tune-mips64.inc
>  MACHINE_FEATURES = "pci ext2 ext3 serial"
>
>  KERNEL_IMAGETYPE = "vmlinux"
> -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> +KERNEL_IMAGETYPES = "vmlinux.bin"
>

This now reads a bit ... odd (for back of a better description). I'm
concerned that it will cause
confusion, there are two variables:

KERNEL_IMAGETYPE and KERNEL_IMAGETYPES ..

They are very close in name, and just reading the variable doesn't really
tell us why
we'd set one and not the other. The old "ALT" made it more obvious.

But from the patch, KERNEL_IMAGETYPE isn't used, so does it have to be set
at
all in these .conf files ? .. or maybe I missed where it is still used
other than for
compatibility.


>  KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
>
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
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
> +            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE',
> typeformake.replace('fitImage', 'zImage'))
>
>          image = d.getVar('INITRAMFS_IMAGE', True)
>          if image:
> @@ -154,7 +156,7 @@ EOF
>  }
>
>  do_assemble_fitimage() {
> -       if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> +       if echo ${KERNEL_IMAGETYPES} | grep -Pq "\bfitImage\b"; then
>

Not that it really matters, but grep -w would work here as well, and might
read bit simpler.


>                 kernelcount=1
>                 dtbcount=""
>                 rm -f fit-image.its
> @@ -217,14 +219,14 @@ addtask assemble_fitimage before do_install after
> do_compile
>
>  kernel_do_deploy_append() {
>         # Update deploy directory
> -       if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> +       if echo ${KERNEL_IMAGETYPES} | grep -Pq "\bfitImage\b"; then
>                 cd ${B}
>                 echo "Copying fit-image.its source file..."
> -
>  its_base_name="${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -               its_symlink_name=${KERNEL_IMAGETYPE}-its-${MACHINE}
> +
>  its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +               its_symlink_name=fitImage-its-${MACHINE}
>                 install -m 0644 fit-image.its
> ${DEPLOYDIR}/${its_base_name}.its
> -
>  linux_bin_base_name="${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> -
>  linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
> +
>  linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +               linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>                 install -m 0644 linux.bin
> ${DEPLOYDIR}/${linux_bin_base_name}.bin
>
>                 cd ${DEPLOYDIR}
> diff --git a/meta/classes/kernel-grub.bbclass
> b/meta/classes/kernel-grub.bbclass
> index a63f482..f7dcc07 100644
> --- a/meta/classes/kernel-grub.bbclass
> +++ b/meta/classes/kernel-grub.bbclass
> @@ -10,41 +10,44 @@
>  #   updates the new kernel as the boot priority.
>  #
>
> -pkg_preinst_kernel-image_append () {
> +python __anonymous () {
>

Maybe it is just the patch context making me misread this, but can you
elaborate on
what is changing here ?

Is it the old preinst is being replaced by anonymous python that generates
the preinst as
a string, and that this injected into the package via the python ? Are we
guaranteed
to run the anonymous python at the right time ? .. I've been burned by that
before, so
I wanted to check that it has been considered.


> +    import re
> +
> +    preinst = '''
>         # Parsing confliction
>         [ -f "$D/boot/grub/menu.list" ] && grubcfg="$D/boot/grub/menu.list"
>         [ -f "$D/boot/grub/grub.cfg" ] && grubcfg="$D/boot/grub/grub.cfg"
>         if [ -n "$grubcfg" ]; then
>                 # Dereference symlink to avoid confliction with new kernel
> name.
> -               if grep -q "/${KERNEL_IMAGETYPE} \+root=" $grubcfg; then
> -                       if [ -L "$D/boot/${KERNEL_IMAGETYPE}" ]; then
> -                               kimage=`realpath
> $D/boot/${KERNEL_IMAGETYPE} 2>/dev/null`
> +               if grep -q "/KERNEL_IMAGETYPE \+root=" $grubcfg; then
>

It's lines like these that made me ask my question above. This looks like
its checking the
grubcfg on disk. Is that same grep going to work in this anonymous python
.. or maybe this
isn't being run now, and only when the package is being installed ? I'm
most likely missing
something.


> +                       if [ -L "$D/boot/KERNEL_IMAGETYPE" ]; then
> +                               kimage=`realpath $D/boot/KERNEL_IMAGETYPE
> 2>/dev/null`
>                                 if [ -f "$D$kimage" ]; then
> -                                       sed -i "s:${KERNEL_IMAGETYPE}
> \+root=:${kimage##*/} root=:" $grubcfg
> +                                       sed -i "s:KERNEL_IMAGETYPE
> \+root=:${kimage##*/} root=:" $grubcfg
>                                 fi
>                         fi
>                 fi
>
>                 # Rename old kernel if it conflicts with new kernel name.
> -               if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> \+root=" $grubcfg; then
> -                       if [ -f
> "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" ]; then
> +               if grep -q "/KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root="
> $grubcfg; then
> +                       if [ -f
> "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" ]; then
>                                 timestamp=`date +%s`
> -
>  kimage="$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
> -                               sed -i
> "s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=:${kimage##*/} root=:"
> $grubcfg
> -                               mv
> "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" "$kimage"
> +
>  kimage="$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}-$timestamp-back"
> +                               sed -i
> "s:KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=:${kimage##*/} root=:" $grubcfg
> +                               mv
> "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" "$kimage"
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
>                         rootfs=`grep " *linux \+[^ ]\+ \+root=" $grubcfg
> -m 1 | \
> -                                sed
> "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
> +                                sed
> "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
>
>                         echo "menuentry \"$title\" {"
>                         echo "    set root=(hd0,1)"
> @@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend () {
>                         echo "}"
>                 elif [ "${grubcfg##*/}" = "menu.list" ]; then
>                         rootfs=`grep "kernel \+[^ ]\+ \+root=" $grubcfg -m
> 1 | \
> -                                sed
> "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
> +                                sed
> "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
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
> +        d.setVar('pkg_preinst_kernel-image-' + typelower + '_append',
> preinst_append)
> +        d.setVar('pkg_postinst_kernel-image-' + typelower + '_prepend',
> postinst_prepend)
>  }
>
> diff --git a/meta/classes/kernel-uimage.bbclass
> b/meta/classes/kernel-uimage.bbclass
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
> +            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or
> ""
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
> index c3eab50..6db2e2e 100644
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
> +KERNEL_VERSION_PKG_NAME =
> "${@legitimize_package_name(d.getVar('KERNEL_VERSION', True))}"
> +KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
> +
>  python __anonymous () {
>      import re
>
> -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> +    type = d.getVar('KERNEL_IMAGETYPE', True) or ""
>

Aha. Here is that use of KERNEL_IMAGETYPE. Like I mentioned for the alt
image type, can't
this existing variable be checked, and then added to KERNEL_IMAGE_TYPES in
some
python code ? That would simplify the code here, and also not require the
two variables to
be kept around.


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
> +        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
> typelower)
> +
> +        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
> typelower + '-${KERNEL_VERSION_PKG_NAME}')
> +
> +        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>
> -    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '',
> kerneltype))
> +        imagedest = d.getVar('KERNEL_IMAGEDEST', True)
> +        priority = d.getVar('KERNEL_PRIORITY', True)
> +        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' +
> imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type +
> '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> +        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
> +
> +        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' +
> type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> +        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>
>      image = d.getVar('INITRAMFS_IMAGE', True)
>      if image:
> @@ -92,8 +128,8 @@ KERNEL_PRIORITY ?=
> "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
>
>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>
> -# Where built kernel lies in the kernel tree
> -KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> +# The directory where built kernel lies in the kernel tree
> +KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
>  KERNEL_IMAGEDEST = "boot"
>
>  #
> @@ -119,8 +155,6 @@ KERNEL_EXTRA_ARGS ?= ""
>  # We don't want to override kernel Makefile variables from the environment
>  EXTRA_OEMAKE = ""
>
> -KERNEL_ALT_IMAGETYPE ??= ""
> -
>  # Define where the kernel headers are installed on the target as well as
> where
>  # they are staged.
>  KERNEL_SRC_PATH = "/usr/src/kernel"
> @@ -166,23 +200,48 @@ copy_initramfs() {
>         echo "Finished copy of initramfs into ./usr"
>  }
>
> -INITRAMFS_BASE_NAME =
> "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +INITRAMFS_BASE_NAME = "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"

 INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
>  do_bundle_initramfs () {
>         if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =
> x1 ]; then
>                 echo "Creating a kernel image with a bundled initramfs..."
>                 copy_initramfs
> -               if [ -e ${KERNEL_OUTPUT} ] ; then
> -                       mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
> -               fi
> +               # Backuping kernel image relies on its type(regular file
> or symbolic link)
>

s/Backuping/Backing up/


> +               tmp_path=""
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> +                               linkpath=`readlink -n
> ${KERNEL_OUTPUT_DIR}/$type`
> +                               realpath=`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$type`
> +                               mv -f $realpath $realpath.bak
> +                               tmp_path=$tmp_path"
> "$type"#"$linkpath"#"$realpath
> +                       elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then
> +                               mv -f ${KERNEL_OUTPUT_DIR}/$type
> ${KERNEL_OUTPUT_DIR}/$type.bak
> +                               tmp_path=$tmp_path" "$type"##"
> +                       fi
> +               done
>
> use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
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
> +                               cd ${B}/${KERNEL_OUTPUT_DIR}
> +                               ln -sf $linkpath.initramfs
> +                       else
> +                               mv -f ${KERNEL_OUTPUT_DIR}/$type
> ${KERNEL_OUTPUT_DIR}/$type.initramfs
> +                               mv -f ${KERNEL_OUTPUT_DIR}/$type.bak
> ${KERNEL_OUTPUT_DIR}/$type
> +                       fi
> +               done
>                 # Update install area
> -               echo "There is kernel image bundled with initramfs:
> ${B}/${KERNEL_OUTPUT}.initramfs"
> -               install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
> -               echo "${B}/${KERNEL_OUTPUT}.initramfs"
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       echo "There is kernel image bundled with
> initramfs: ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
> +                       install -m 0644
> ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
> ${D}/boot/$type-initramfs-${MACHINE}.bin
> +                       echo "${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
> +               done
>         fi
>  }
>
> @@ -207,10 +266,15 @@ kernel_do_compile() {
>                 copy_initramfs
>
> use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>         fi
> -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> $use_alternate_initrd
> -       if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}";
> then
> -               gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
> "${KERNEL_OUTPUT}"
> -       fi
> +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>


This is probably something that is worth mentioning in the top of the
commit message. You are
building multiple kernel image types, but they are all currently using the
same configuration.

If the make invokations were split into separate calls per image type, we
could conceivably
extend this to generate and use a separate config int he future.


> +       for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       if test "${typeformake}.gz" = "${type}"; then
> +                               gzip -9c < "${typeformake}" >
> "${KERNEL_OUTPUT_DIR}/${type}"
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
> -       install -m 0644 ${KERNEL_OUTPUT}
> ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
> ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
> +       done
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>         install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> @@ -365,12 +431,12 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>  PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
> kernel-modules"
>  FILES_${PN} = ""
>  FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
> /lib/modules/${KERNEL_VERSION}/modules.builtin"
> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> +FILES_kernel-image = ""
>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*
> ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>  FILES_kernel-modules = ""
>  RDEPENDS_kernel = "kernel-base"
> -# Allow machines to override this dependency if kernel image files are
> +# Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
>  RDEPENDS_kernel-base ?= "kernel-image"
>  PKG_kernel-image =
> "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> @@ -394,14 +460,6 @@ pkg_postinst_kernel-base () {
>         fi
>  }
>
> -pkg_postinst_kernel-image () {
> -       update-alternatives --install
> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> ${KERNEL_PRIORITY} || true
> -}
> -
> -pkg_postrm_kernel-image () {
> -       update-alternatives --remove ${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
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
> -                       bbwarn "image type will not be stripped (not
> supported): ${KERNEL_IMAGETYPE}"
> +               if ! (echo "${KERNEL_IMAGETYPES}" | grep -q "vmlinux");
> then
>

You had used the \bfitImage\b, but here you don't .. grep -w could work for
them all.


> +                       bbwarn "image type(s) will not be stripped (not
> supported): ${KERNEL_IMAGETYPES}"
>


But on another note. Is it really right to say that none of the images will
be stripped if you
find vmlinux anywhere in the image type list ?


>                         return
>                 fi
>
>                 cd ${B}
> -               headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT} | \
> +               headers=`"$CROSS_COMPILE"readelf -S
> ${KERNEL_OUTPUT_DIR}/vmlinux | \
>                           grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
>                           sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
>                           gawk '{print $1}'`
> @@ -438,7 +496,7 @@ do_strip() {
>                                 bbwarn "Section not found: $str";
>                         fi
>
> -                       "$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT}
> +                       "$CROSS_COMPILE"strip -s -R $str
> ${KERNEL_OUTPUT_DIR}/vmlinux
>                 }; done
>
>                 bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set,
> stripping sections:" \
> @@ -457,20 +515,22 @@ do_sizecheck() {
>                 if [ -n "$invalid" ]; then
>                         die "Invalid KERNEL_IMAGE_MAXSIZE:
> ${KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)"
>                 fi
> -               size=`du -ks ${B}/${KERNEL_OUTPUT} | awk '{ print $1}'`
> -               if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> -                       die "This kernel (size=$size(K) >
> ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the
> size of the kernel by making more of it modular."
> -               fi
> +               for type in ${KERNEL_IMAGETYPES} ; do
> +                       size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$type | awk
> '{print $1}'`
> +                       if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> +                               die "This kernel $type (size=$size(K) >
> ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the
> size of the kernel by making more of it modular."
>

Hmm. Again here. Multiple image types are being built. If one of them is
too large for the device,
who's to say that that's the one that is going to be used ? Maybe this
should be a warn, instead
of a die ?


> +                       fi
> +               done
>         fi
>  }
>  do_sizecheck[dirs] = "${B}"
>
>  addtask sizecheck before do_install after do_strip
>
> -KERNEL_IMAGE_BASE_NAME ?=
> "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> +KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>  # Don't include the DATETIME variable in the sstate package signatures
>  KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> -KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> +KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
>  MODULE_IMAGE_BASE_NAME ?=
> "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
>  MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
>  MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
> @@ -479,28 +539,37 @@ MODULE_TARBALL_SYMLINK_NAME ?=
> "modules-${MACHINE}.tgz"
>  MODULE_TARBALL_DEPLOY ?= "1"
>
>  kernel_do_deploy() {
> -       install -m 0644 ${KERNEL_OUTPUT}
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
> ${DEPLOYDIR}/${base_name}.bin
> +       done
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
> '^CONFIG_MODULES=y$' .config); then
>                 mkdir -p ${D}/lib
>                 tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D}
> lib
>                 ln -sf ${MODULE_TARBALL_BASE_NAME}
> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>         fi
>
> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> +               symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
> +               ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
> +               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
> +       done
>
>         cp ${COREBASE}/meta/files/deploydir_readme.txt
> ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>
>         cd ${B}
>         # Update deploy directory
> -       if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
> -               echo "Copying deploy kernel-initramfs image and setting up
> links..."
> -               initramfs_base_name=${INITRAMFS_BASE_NAME}
> -
>  initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
> -               install -m 0644 ${KERNEL_OUTPUT}.initramfs
> ${DEPLOYDIR}/${initramfs_base_name}.bin
> -               cd ${DEPLOYDIR}
> -               ln -sf ${initramfs_base_name}.bin
> ${initramfs_symlink_name}.bin
> -       fi
> +       for type in ${KERNEL_IMAGETYPES} ; do
> +               if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
> +                       echo "Copying deploy ${type} kernel-initramfs
> image and setting up links..."
> +                       initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
> +                       initramfs_symlink_name=${type}-initramfs-${MACHINE}
> +                       install -m 0644
> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
> ${DEPLOYDIR}/${initramfs_base_name}.bin
> +                       cd ${DEPLOYDIR}
> +                       ln -sf ${initramfs_base_name}.bin
> ${initramfs_symlink_name}.bin
> +               fi
> +       done
>  }
>  do_deploy[cleandirs] = "${DEPLOYDIR}"
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 00a69da..b3969b0 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -246,6 +246,7 @@ KERNEL_CLASSES[doc] = "A list of classes defining
> kernel image types that kernel
>  KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line
> arguments the OpenEmbedded build system passes on when compiling the
> kernel."
>  KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto
> Project kernel Git repository. The metadata you add through this variable
> includes config fragments and features descriptions."
>  KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
> usually set by the machine configuration files and defaults to 'zImage'."
> +KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a
> device, usually set by the machine configuration files and defaults to
> KERNEL_IMAGETYPE."
>  KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
> auto-loaded during boot"
>  KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build
> system expects to find module_conf_* values that specify configuration for
> each of the modules"
>  KERNEL_PATH[doc] = "The location of the kernel sources. This variable is
> set to the value of the STAGING_KERNEL_DIR within the module class
> (module.bbclass)."
> diff --git a/meta/conf/machine/qemumips.conf
> b/meta/conf/machine/qemumips.conf
> index fbf8137..67ce161 100644
> --- a/meta/conf/machine/qemumips.conf
> +++ b/meta/conf/machine/qemumips.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/qemu.inc
>  require conf/machine/include/tune-mips32r2.inc
>
>  KERNEL_IMAGETYPE = "vmlinux"
> -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> +KERNEL_IMAGETYPES = "vmlinux.bin"
>
>  SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
>
> diff --git a/meta/conf/machine/qemumips64.conf
> b/meta/conf/machine/qemumips64.conf
> index 8c3f1fe..393212e 100644
> --- a/meta/conf/machine/qemumips64.conf
> +++ b/meta/conf/machine/qemumips64.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/qemu.inc
>  require conf/machine/include/tune-mips64.inc
>
>  KERNEL_IMAGETYPE = "vmlinux"
> -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> +KERNEL_IMAGETYPES = "vmlinux.bin"
>
>  SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> b/meta/recipes-kernel/linux/linux-dtb.inc
> index 651a19e..74f5ef8 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -34,9 +34,12 @@ do_install_append() {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 DTB=`normalize_dtb "${DTB}"`
>                 DTB_BASE_NAME=`basename ${DTB} .dtb`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -               install -m 0644 ${DTB_PATH}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>

If there are multiple image types being built, is this valid for them all ?


> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> +                       install -m 0644 ${DTB_PATH}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +               done
>         done
>  }
>
> @@ -44,31 +47,39 @@ do_deploy_append() {
>         for DTB in ${KERNEL_DEVICETREE}; do
>                 DTB=`normalize_dtb "${DTB}"`
>                 DTB_BASE_NAME=`basename ${DTB} .dtb`
> -               DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -               install -d ${DEPLOYDIR}
> -               install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
> -               ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_NAME=`echo ${base_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> +                       install -d ${DEPLOYDIR}
> +                       install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.dtb
> +                       ln -sf ${DTB_NAME}.dtb
> ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +               done
>         done
>  }
>
>  pkg_postinst_kernel-devicetree () {
>         cd /${KERNEL_IMAGEDEST}
> -       for DTB in ${KERNEL_DEVICETREE}
> -       do
> -               DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_BASE_NAME=`basename ${DTB} | awk -F "."
> '{print $1}'`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +               done
>         done
>  }
>
>  pkg_postrm_kernel-devicetree () {
>         cd /${KERNEL_IMAGEDEST}
> -       for DTB in ${KERNEL_DEVICETREE}
> -       do
> -               DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
> -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -               update-alternatives --remove ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +       for DTB in ${KERNEL_DEVICETREE}; do
> +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +                       symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +                       DTB_BASE_NAME=`basename ${DTB} | awk -F "."
> '{print $1}'`
> +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +                       update-alternatives --remove ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +               done
>         done
>  }
> diff --git
> a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> index b319d62..e4a6f30 100644
> --- a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> +++ b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> @@ -9,7 +9,7 @@ require conf/machine/include/tune-mips32.inc
>  MACHINE_FEATURES = "screen keyboard pci usbhost ext2 ext3 serial"
>
>  KERNEL_IMAGETYPE = "vmlinux"
> -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> +KERNEL_IMAGETYPES = "vmlinux.bin"
>  KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
>
>  {{ if kernel_choice == "custom": preferred_kernel = "linux-yocto-custom"
> }}
> diff --git
> a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> index 3afc5e0..2c2d8af 100644
> ---
> a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> +++
> b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> @@ -9,7 +9,7 @@ require conf/machine/include/tune-mips64.inc
>  MACHINE_FEATURES = "pci ext2 ext3 serial"
>
>  KERNEL_IMAGETYPE = "vmlinux"
> -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> +KERNEL_IMAGETYPES = "vmlinux.bin"
>


Again, why can't vmlinux just bein in KERNEL_IMAGETYPES ?

Bruce


>  KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
>
>  {{ if kernel_choice == "custom": preferred_kernel = "linux-yocto-custom"
> }}
> diff --git
> a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> index 67e1cbd..7a0a4d3 100644
> --- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> +++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> @@ -69,6 +69,6 @@ SERIAL_CONSOLE = "115200 ttyS0"
>
>  {{ if qemuarch == "mips" or qemuarch == "mips64": }}
>  KERNEL_IMAGETYPE = "vmlinux"
> -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> +KERNEL_IMAGETYPES = "vmlinux.bin"
>  SERIAL_CONSOLE = "115200 ttyS0"
>  MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11425fbaa18b77052c2164a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Feb 19, 2016 at 4:56 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: He Zhe &lt;<a href=3D"ma=
ilto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;<b=
r>
<br>
Add KERNEL_IMAGETYPES to support building packaging and installing<br>
multi types of kernel images, such as zImage uImage, at one time.<br>
<br>
KERNEL_IMAGETYPE works as before. All KERNEL_ALT_IMAGETYPEs are<br>
replaced by KERNEL_IMAGETYPES.<br></blockquote><div><br></div><div>=C2=A0</=
div><div>I see that you have updated layers/configs with the new variable, =
but obviously you can&#39;t see all the=C2=A0</div><div>layers that may be =
using that old variable.</div><div><br></div><div>Isn&#39;t it possible to =
have a python routine that detects the old ALT_IMAGETYPE variable and</div>=
<div>assigns it to the new one (if it isn&#39;t already set) ? Sort of like=
 how distro features/features backfill</div><div>work ?</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
Fixes [YOCTO #6945].<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/ref-variables.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 10 +-<br>
=C2=A0meta-yocto-bsp/conf/machine/edgerouter.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +--<br>
=C2=A0meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 ++++--<br>
=C2=A0meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +--<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 171 +++++++++++++++------<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/conf/machine/qemumips.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/conf/machine/qemumips64.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 49 +++---<br>
=C2=A0.../target/arch/mips/conf/machine/machine.conf=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../target/arch/mips64/conf/machine/machine.conf=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../target/arch/qemu/conf/machine/machine.conf=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A013 files changed, 214 insertions(+), 115 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref=
-manual/ref-variables.xml<br>
index a76a8c2..a8e4fd8 100644<br>
--- a/documentation/ref-manual/ref-variables.xml<br>
+++ b/documentation/ref-manual/ref-variables.xml<br>
@@ -6417,14 +6417,14 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =
=3D &quot;${INC_PR}.3&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/glossdef&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/glossentry&gt;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossentry id=3D&#39;var-KERNEL_ALT_IMAGET=
YPE&#39;&gt;&lt;glossterm&gt;KERNEL_ALT_IMAGETYPE&lt;/glossterm&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossentry id=3D&#39;var-KERNEL_IMAGETYPES=
&#39;&gt;&lt;glossterm&gt;KERNEL_IMAGETYPES&lt;/glossterm&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;info&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNEL_ALT_IMAGETY=
PE[doc] =3D &quot;Specifies an alternate kernel image type for creation.&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPES[=
doc] =3D &quot;Specifies alternate kernel image types for creation.&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/info&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;glossdef&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para role=
=3D&quot;glossdeffirst&quot;&gt;<br>
=C2=A0&lt;!--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;pa=
ra role=3D&quot;glossdeffirst&quot;&gt;&lt;imagedata fileref=3D&quot;figure=
s/define-generic.png&quot; /&gt; --&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Spec=
ifies an alternate kernel image type for creation in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Spec=
ifies alternate kernel image types for creation in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0addition to the kernel image type specified using the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;link linkend=3D&#39;var-KERNEL_IMAGETYPE&#39;&gt;&lt;filename&gt;KER=
NEL_IMAGETYPE&lt;/filename&gt;&lt;/link&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0variable.<br>
@@ -6612,8 +6612,8 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =3D=
 &quot;${INC_PR}.3&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If y=
ou want to build an alternate kernel image type, use the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
link linkend=3D&#39;var-KERNEL_ALT_IMAGETYPE&#39;&gt;&lt;filename&gt;KERNEL=
_ALT_IMAGETYPE&lt;/filename&gt;&lt;/link&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If y=
ou want to build alternate kernel image types, use the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
link linkend=3D&#39;var-KERNEL_IMAGETYPES&#39;&gt;&lt;filename&gt;KERNEL_IM=
AGETYPES&lt;/filename&gt;&lt;/link&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0variable.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/glossdef&gt;<br>
diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/c=
onf/machine/edgerouter.conf<br>
index 476e690..affd568 100644<br>
--- a/meta-yocto-bsp/conf/machine/edgerouter.conf<br>
+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf<br>
@@ -7,7 +7,7 @@ require conf/machine/include/tune-mips64.inc<br>
=C2=A0MACHINE_FEATURES =3D &quot;pci ext2 ext3 serial&quot;<br>
<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<br>
+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br></blockquote><div><br></d=
iv><div>This now reads a bit ... odd (for back of a better description). I&=
#39;m concerned that it will cause</div><div>confusion, there are two varia=
bles:</div><div><br></div><div>KERNEL_IMAGETYPE and KERNEL_IMAGETYPES ..</d=
iv><div><br></div><div>They are very close in name, and just reading the va=
riable doesn&#39;t really tell us why</div><div>we&#39;d set one and not th=
e other. The old &quot;ALT&quot; made it more obvious.</div><div><br></div>=
<div>But from the patch, KERNEL_IMAGETYPE isn&#39;t used, so does it have t=
o be set at</div><div>all in these .conf files ? .. or maybe I missed where=
 it is still used other than for</div><div>compatibility.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
=C2=A0KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=C2=A0 =3D &quot;.comment&quot;<br>
<br>
=C2=A0PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux-yocto&quot;<br>
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass<br>
index f1b409c..51df19d 100644<br>
--- a/meta/classes/kernel-fitimage.bbclass<br>
+++ b/meta/classes/kernel-fitimage.bbclass<br>
@@ -1,8 +1,8 @@<br>
=C2=A0inherit kernel-uboot<br>
<br>
=C2=A0python __anonymous () {<br>
-=C2=A0 =C2=A0 kerneltype =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;, True)<br=
>
-=C2=A0 =C2=A0 if kerneltype =3D=3D &#39;fitImage&#39;:<br>
+=C2=A0 =C2=A0 kerneltypes =3D d.getVar(&#39;KERNEL_IMAGETYPES&#39;, True) =
or &quot;&quot;<br>
+=C2=A0 =C2=A0 if &#39;fitImage&#39; in kerneltypes.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D d.getVar(&quot;DEPENDS&quot;,=
 True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D &quot;%s u-boot-mkimage-nativ=
e dtc-native&quot; % depends<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DEPENDS&quot;, depends)<br=
>
@@ -10,7 +10,9 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Override KERNEL_IMAGETYPE_FOR_MAKE variable, =
which is internal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to kernel.bbclass . We have to override it, s=
ince we pack zImage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (at least for now) into the fitImage .<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;KERNEL_IMAGETYPE_FOR_MAKE&quot;=
, &quot;zImage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeformake =3D d.getVar(&quot;KERNEL_IMAGETYP=
E_FOR_MAKE&quot;, True) or &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;fitImage&#39; in typeformake.split():<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_IMAGETYPE_F=
OR_MAKE&#39;, typeformake.replace(&#39;fitImage&#39;, &#39;zImage&#39;))<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D d.getVar(&#39;INITRAMFS_IMAGE&#=
39;, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if image:<br>
@@ -154,7 +156,7 @@ EOF<br>
=C2=A0}<br>
<br>
=C2=A0do_assemble_fitimage() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &q=
uot;xfitImage&quot; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${KERNEL_IMAGETYPES} | grep -Pq &quot;\=
bfitImage\b&quot;; then<br></blockquote><div><br></div><div>Not that it rea=
lly matters, but grep -w would work here as well, and might read bit simple=
r.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernelcount=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtbcount=3D&quot;&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f fit-image.its=
<br>
@@ -217,14 +219,14 @@ addtask assemble_fitimage before do_install after do_=
compile<br>
<br>
=C2=A0kernel_do_deploy_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update deploy directory<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &q=
uot;xfitImage&quot; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${KERNEL_IMAGETYPES} | grep -Pq &quot;\=
bfitImage\b&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Copying =
fit-image.its source file...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its_base_name=3D&qu=
ot;${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its_symlink_name=3D=
${KERNEL_IMAGETYPE}-its-${MACHINE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its_base_name=3D&qu=
ot;fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its_symlink_name=3D=
fitImage-its-${MACHINE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 fit=
-image.its ${DEPLOYDIR}/${its_base_name}.its<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_bin_base_name=
=3D&quot;${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_bin_symlink_n=
ame=3D${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_bin_base_name=
=3D&quot;fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_bin_symlink_n=
ame=3DfitImage-linux.bin-${MACHINE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 lin=
ux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOYDIR}<br>
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bb=
class<br>
index a63f482..f7dcc07 100644<br>
--- a/meta/classes/kernel-grub.bbclass<br>
+++ b/meta/classes/kernel-grub.bbclass<br>
@@ -10,41 +10,44 @@<br>
=C2=A0#=C2=A0 =C2=A0updates the new kernel as the boot priority.<br>
=C2=A0#<br>
<br>
-pkg_preinst_kernel-image_append () {<br>
+python __anonymous () {<br></blockquote><div><br></div><div>Maybe it is ju=
st the patch context making me misread this, but can you elaborate on</div>=
<div>what is changing here ?</div><div><br></div><div>Is it the old preinst=
 is being replaced by anonymous python that generates the preinst as</div><=
div>a string, and that this injected into the package via the python ? Are =
we guaranteed</div><div>to run the anonymous python at the right time ? .. =
I&#39;ve been burned by that before, so</div><div>I wanted to check that it=
 has been considered.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 import re<br>
+<br>
+=C2=A0 =C2=A0 preinst =3D &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Parsing confliction<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f &quot;$D/boot/grub/menu.list&quot; ] &amp;=
&amp; grubcfg=3D&quot;$D/boot/grub/menu.list&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f &quot;$D/boot/grub/grub.cfg&quot; ] &amp;&=
amp; grubcfg=3D&quot;$D/boot/grub/grub.cfg&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$grubcfg&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Dereference symli=
nk to avoid confliction with new kernel name.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;/$=
{KERNEL_IMAGETYPE} \+root=3D&quot; $grubcfg; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -L &quot;$D/boot/${KERNEL_IMAGETYPE}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D`realpath $D/boot/${KERNEL_I=
MAGETYPE} 2&gt;/dev/null`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;/K=
ERNEL_IMAGETYPE \+root=3D&quot; $grubcfg; then<br></blockquote><div><br></d=
iv><div>It&#39;s lines like these that made me ask my question above. This =
looks like its checking the</div><div>grubcfg on disk. Is that same grep go=
ing to work in this anonymous python .. or maybe this</div><div>isn&#39;t b=
eing run now, and only when the package is being installed ? I&#39;m most l=
ikely missing</div><div>something.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -L &quot;$D/boot/KERNEL_IMAGETYPE&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D`realpath $D/boot/KERNEL_IMA=
GETYPE 2&gt;/dev/null`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;$D$kimage&quot; ]; the=
n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &q=
uot;s:${KERNEL_IMAGETYPE} \+root=3D:${kimage##*/} root=3D:&quot; $grubcfg<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &q=
uot;s:KERNEL_IMAGETYPE \+root=3D:${kimage##*/} root=3D:&quot; $grubcfg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Rename old kernel=
 if it conflicts with new kernel name.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;/$=
{KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=3D&quot; $grubcfg; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -f &quot;$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}&quot;=
 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;/K=
ERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=3D&quot; $grubcfg; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -f &quot;$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}&quot; ];=
 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timestamp=3D`date +%s`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D&quot;$D/boot/${KERNEL_IMAGE=
TYPE}-${KERNEL_VERSION}-$timestamp-back&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s:${KERNEL_IMAGETYPE}-${=
KERNEL_VERSION} \+root=3D:${kimage##*/} root=3D:&quot; $grubcfg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$D/boot/${KERNEL_IMAGETYPE}-=
${KERNEL_VERSION}&quot; &quot;$kimage&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D&quot;$D/boot/KERNEL_IMAGETY=
PE-${KERNEL_VERSION}-$timestamp-back&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s:KERNEL_IMAGETYPE-${KER=
NEL_VERSION} \+root=3D:${kimage##*/} root=3D:&quot; $grubcfg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$D/boot/KERNEL_IMAGETYPE-${K=
ERNEL_VERSION}&quot; &quot;$kimage&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-}<br>
+&#39;&#39;&#39;<br>
<br>
-pkg_postinst_kernel-image_prepend () {<br>
+=C2=A0 =C2=A0 postinst =3D &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_new_grub_cfg() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grubcfg=3D&quot;$1&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old_image=3D&quot;$=
2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0title=3D&quot;Updat=
e ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0title=3D&quot;Updat=
e KERNEL_IMAGETYPE-${KERNEL_VERSION}-${PV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${grubcf=
g##*/}&quot; =3D &quot;grub.cfg&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rootfs=3D`grep &quot; *linux \+[^ ]\+ \+root=3D&quot; $grubcfg -=
m 1 | \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#${old_image}#${old_image=
%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#${old_image}#${old_image=
%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#&quot;`<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;menuentry \&quot;$title\&quot; {&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 set root=3D(hd0,1)&quot;<br>
@@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ &quot;${grub=
cfg##*/}&quot; =3D &quot;menu.list&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rootfs=3D`grep &quot;kernel \+[^ ]\+ \+root=3D&quot; $grubcfg -m=
 1 | \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#${old_image}#${old_image=
%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#${old_image}#${old_image=
%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#&quot;`<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;default 0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;timeout 30&quot;<br>
@@ -87,5 +90,16 @@ pkg_postinst_kernel-image_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv $grubcfgtmp $gru=
bcfg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Caution!=
 Update kernel may affect kernel-module!&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+&#39;&#39;&#39;<br>
+<br>
+=C2=A0 =C2=A0 imagetypes =3D d.getVar(&#39;KERNEL_IMAGETYPES&#39;, True)<b=
r>
+=C2=A0 =C2=A0 imagetypes =3D re.sub(r&#39;\.gz$&#39;, &#39;&#39;, imagetyp=
es)<br>
+<br>
+=C2=A0 =C2=A0 for type in imagetypes.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D type.lower()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 preinst_append =3D preinst.replace(&#39;KERNEL=
_IMAGETYPE&#39;, type)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst_prepend =3D postinst.replace(&#39;KER=
NEL_IMAGETYPE&#39;, type)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_preinst_kernel-image-&#39; +=
 typelower + &#39;_append&#39;, preinst_append)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_postinst_kernel-image-&#39; =
+ typelower + &#39;_prepend&#39;, postinst_prepend)<br>
=C2=A0}<br>
<br>
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimag=
e.bbclass<br>
index f73965b..a238ce4 100644<br>
--- a/meta/classes/kernel-uimage.bbclass<br>
+++ b/meta/classes/kernel-uimage.bbclass<br>
@@ -1,23 +1,25 @@<br>
=C2=A0inherit kernel-uboot<br>
<br>
=C2=A0python __anonymous () {<br>
-=C2=A0 =C2=A0 kerneltype =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;, True)<br=
>
-=C2=A0 =C2=A0 if kerneltype =3D=3D &#39;uImage&#39;:<br>
+=C2=A0 =C2=A0 if &quot;uImage&quot; in (d.getVar(&#39;KERNEL_IMAGETYPES&#3=
9;, True) or &quot;&quot;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D d.getVar(&quot;DEPENDS&quot;,=
 True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D &quot;%s u-boot-mkimage-nativ=
e&quot; % depends<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DEPENDS&quot;, depends)<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Override KERNEL_IMAGETYPE_FOR_MAKE variable, =
which is internal<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# to kernel.bbclass . We override the variable =
here, since we need<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# to build uImage using the kernel build system=
 if and only if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# KEEPUIMAGE =3D=3D yes. Otherwise, we pack com=
pressed vmlinux into<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# the uImage .<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;KEEPUIMAGE&quot;, True) !=3D =
&#39;yes&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;KERNEL_IMAGETYPE_=
FOR_MAKE&quot;, &quot;zImage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Override KERNEL_IMAGETYPE_FOR_MAKE variable,=
 which is internal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to kernel.bbclass . We override the variable=
 here, since we need<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to build uImage using the kernel build syste=
m if and only if<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # KEEPUIMAGE =3D=3D yes. Otherwise, we pack co=
mpressed vmlinux into<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the uImage .<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;KEEPUIMAGE&quot;, True) !=3D=
 &#39;yes&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typeformake =3D d.getVar(&quot;K=
ERNEL_IMAGETYPE_FOR_MAKE&quot;, True) or &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;uImage&quot; in typefor=
make.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typeformake.replac=
e(&#39;uImage&#39;, &#39;zImage&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_IMAGETYPE_F=
OR_MAKE&#39;, typeformake)<br>
=C2=A0}<br>
<br>
=C2=A0do_uboot_mkimage() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &q=
uot;xuImage&quot; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo &quot;${KERNEL_IMAGETYPES}&quot; | grep=
 -Pq &quot;\buImage\b&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x${KE=
EPUIMAGE}&quot; !=3D &quot;xyes&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uboot_prep_kimage<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index c3eab50..6db2e2e 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -16,12 +16,48 @@ INITRAMFS_IMAGE ?=3D &quot;&quot;<br>
=C2=A0INITRAMFS_TASK ?=3D &quot;&quot;<br>
=C2=A0INITRAMFS_IMAGE_BUNDLE ?=3D &quot;&quot;<br>
<br>
+# KERNEL_VERSION is extracted from source code. It is evaluated as<br>
+# None for the first parsing, since the code has not been fetched.<br>
+# After the code is fetched, it will be evaluated as real version<br>
+# number and cause kernel to be rebuilt. To avoid this, make<br>
+# KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on<br>
+# LINUX_VERSION which is a constant.<br>
+KERNEL_VERSION_NAME =3D &quot;${@d.getVar(&#39;KERNEL_VERSION&#39;, True) =
or &quot;&quot;}&quot;<br>
+KERNEL_VERSION_NAME[vardepvalue] =3D &quot;${LINUX_VERSION}&quot;<br>
+KERNEL_VERSION_PKG_NAME =3D &quot;${@legitimize_package_name(d.getVar(&#39=
;KERNEL_VERSION&#39;, True))}&quot;<br>
+KERNEL_VERSION_PKG_NAME[vardepvalue] =3D &quot;${LINUX_VERSION}&quot;<br>
+<br>
=C2=A0python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
<br>
-=C2=A0 =C2=A0 kerneltype =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;, True)<br=
>
+=C2=A0 =C2=A0 type =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;, True) or &quot=
;&quot;<br></blockquote><div><br></div><div>Aha. Here is that use of KERNEL=
_IMAGETYPE. Like I mentioned for the alt image type, can&#39;t</div><div>th=
is existing variable be checked, and then added to KERNEL_IMAGE_TYPES in so=
me</div><div>python code ? That would simplify the code here, and also not =
require the two variables to=C2=A0</div><div>be kept around.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 types =3D d.getVar(&#39;KERNEL_IMAGETYPES&#39;, True) or &qu=
ot;&quot;<br>
+=C2=A0 =C2=A0 if type not in types.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 types =3D (type + &#39; &#39; + types).strip()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_IMAGETYPES&#39;, types)<b=
r>
+=C2=A0 =C2=A0 typeformake =3D re.sub(r&#39;\.gz&#39;, &#39;&#39;, types)<b=
r>
+=C2=A0 =C2=A0 d.setVar(&#39;KERNEL_IMAGETYPE_FOR_MAKE&#39;, typeformake)<b=
r>
+<br>
+=C2=A0 =C2=A0 for type in typeformake.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D type.lower()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;PACKAGES&#39;, &#39; &#39; + =
&#39;kernel-image-&#39; + typelower)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_kernel-image-&#39; + typel=
ower, &#39;/boot/&#39; + type + &#39;*&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_kernel-image&#39;, &=
#39; &#39; + &#39;kernel-image-&#39; + typelower)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PKG_kernel-image-&#39; + typelow=
er, &#39;kernel-image-&#39; + typelower + &#39;-${KERNEL_VERSION_PKG_NAME}&=
#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_kernel-image-&#39; +=
 typelower, &#39;1&#39;)<br>
<br>
-=C2=A0 =C2=A0 d.setVar(&quot;KERNEL_IMAGETYPE_FOR_MAKE&quot;, re.sub(r&#39=
;\.gz$&#39;, &#39;&#39;, kerneltype))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imagedest =3D d.getVar(&#39;KERNEL_IMAGEDEST&#=
39;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priority =3D d.getVar(&#39;KERNEL_PRIORITY&#39=
;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst =3D &#39;#!/bin/sh\n&#39; + &#39;upda=
te-alternatives --install /&#39; + imagedest + &#39;/&#39; + type + &#39; &=
#39; + type + &#39; &#39; + &#39;/&#39; + imagedest + &#39;/&#39; + type + =
&#39;-${KERNEL_VERSION_NAME} &#39; + priority + &#39; || true&#39; + &#39;\=
n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_postinst_kernel-image-&#39; =
+ typelower, postinst)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postrm =3D &#39;#!/bin/sh\n&#39; + &#39;update=
-alternatives --remove&#39; + &#39; &#39; + type + &#39; &#39; + type + &#3=
9;-${KERNEL_VERSION_NAME} || true&#39; + &#39;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_postrm_kernel-image-&#39; + =
typelower, postrm)<br>
<br>
=C2=A0 =C2=A0 =C2=A0image =3D d.getVar(&#39;INITRAMFS_IMAGE&#39;, True)<br>
=C2=A0 =C2=A0 =C2=A0if image:<br>
@@ -92,8 +128,8 @@ KERNEL_PRIORITY ?=3D &quot;${@int(d.getVar(&#39;PV&#39;,=
1).split(&#39;-&#39;)[0].split(&#39;+&#39;)[0].split(&#39;.<br>
<br>
=C2=A0KERNEL_RELEASE ?=3D &quot;${KERNEL_VERSION}&quot;<br>
<br>
-# Where built kernel lies in the kernel tree<br>
-KERNEL_OUTPUT ?=3D &quot;arch/${ARCH}/boot/${KERNEL_IMAGETYPE}&quot;<br>
+# The directory where built kernel lies in the kernel tree<br>
+KERNEL_OUTPUT_DIR ?=3D &quot;arch/${ARCH}/boot&quot;<br>
=C2=A0KERNEL_IMAGEDEST =3D &quot;boot&quot;<br>
<br>
=C2=A0#<br>
@@ -119,8 +155,6 @@ KERNEL_EXTRA_ARGS ?=3D &quot;&quot;<br>
=C2=A0# We don&#39;t want to override kernel Makefile variables from the en=
vironment<br>
=C2=A0EXTRA_OEMAKE =3D &quot;&quot;<br>
<br>
-KERNEL_ALT_IMAGETYPE ??=3D &quot;&quot;<br>
-<br>
=C2=A0# Define where the kernel headers are installed on the target as well=
 as where<br>
=C2=A0# they are staged.<br>
=C2=A0KERNEL_SRC_PATH =3D &quot;/usr/src/kernel&quot;<br>
@@ -166,23 +200,48 @@ copy_initramfs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Finished copy of initramfs into ./us=
r&quot;<br>
=C2=A0}<br>
<br>
-INITRAMFS_BASE_NAME =3D &quot;${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${=
MACHINE}-${DATETIME}&quot;<br>
+INITRAMFS_BASE_NAME =3D &quot;initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}=
&quot;</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0INITRAMFS_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<br>
=C2=A0do_bundle_initramfs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -z &quot;${INITRAMFS_IMAGE}&quot; -a x&q=
uot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Creating=
 a kernel image with a bundled initramfs...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_initramfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${KERNEL_OU=
TPUT} ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Backuping kernel =
image relies on its type(regular file or symbolic link)<br></blockquote><di=
v><br></div><div>s/Backuping/Backing up/</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D&quot;&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkpath=3D`readlink -n ${KERNEL_OUTP=
UT_DIR}/$type`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpath=3D`readlink -fn ${KERNEL_OUT=
PUT_DIR}/$type`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath $realpath.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D$tmp_path&quot; &quot;$typ=
e&quot;#&quot;$linkpath&quot;#&quot;$realpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$type ${KE=
RNEL_OUTPUT_DIR}/$type.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D$tmp_path&quot; &quot;$typ=
e&quot;##&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_alternate_initr=
d=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_do_compile<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTP=
UT} ${KERNEL_OUTPUT}.initramfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTP=
UT}.bak ${KERNEL_OUTPUT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restoring kernel =
image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for tp in $tmp_path=
 ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0type=3D`echo $tp|cut -d &quot;#&quot; -f 1`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linkpath=3D`echo $tp|cut -d &quot;#&quot; -f 2`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0realpath=3D`echo $tp|cut -d &quot;#&quot; -f 3`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -n &quot;$realpath&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath $realpath.initramfs<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath.bak $realpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}/${KERNEL_OUTPUT_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $linkpath.initramfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$type ${KE=
RNEL_OUTPUT_DIR}/$type.initramfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$type.bak =
${KERNEL_OUTPUT_DIR}/$type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update install ar=
ea<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;There is=
 kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B=
}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACH=
INE}.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${B}/${K=
ERNEL_OUTPUT}.initramfs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;There is kernel image bundled with initramfs: ${B}/${K=
ERNEL_OUTPUT_DIR}/$type.initramfs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs ${D}/bo=
ot/$type-initramfs-${MACHINE}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
@@ -207,10 +266,15 @@ kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_initramfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_alternate_initr=
d=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNE=
L_ALT_IMAGETYPE} CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot=
; ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${KERNEL_IMAGETYPE_FOR_MAKE}.gz&q=
uot; =3D &quot;${KERNEL_IMAGETYPE}&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip -9c &lt; &quot=
;${KERNEL_IMAGETYPE_FOR_MAKE}&quot; &gt; &quot;${KERNEL_OUTPUT}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} CC=3D&q=
uot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; ${KERNEL_EXTRA_ARGS} $=
use_alternate_initrd<br></blockquote><div><br></div><div><br></div><div>Thi=
s is probably something that is worth mentioning in the top of the commit m=
essage. You are</div><div>building multiple kernel image types, but they ar=
e all currently using the same configuration.</div><div><br></div><div>If t=
he make invokations were split into separate calls per image type, we could=
 conceivably</div><div>extend this to generate and use a separate config in=
t he future.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE}=
 ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if test &quot;${typeformake}.gz&quot; =3D &quot;${type}&quot;; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip -9c &lt; &quot;${typeformake}&qu=
ot; &gt; &quot;${KERNEL_OUTPUT_DIR}/${type}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
=C2=A0do_compile_kernelmodules() {<br>
@@ -251,7 +315,9 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${KERNEL_IMAGEDEST}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/boot<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_=
IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${K=
ERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 System.map ${D}/boot/System.map=
-${KERNEL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 .config ${D}/boot/config-${KERN=
EL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 vmlinux ${D}/boot/vmlinux-${KER=
NEL_VERSION}<br>
@@ -365,12 +431,12 @@ EXPORT_FUNCTIONS do_compile do_install do_configure<b=
r>
=C2=A0PACKAGES =3D &quot;kernel kernel-base kernel-vmlinux kernel-image ker=
nel-dev kernel-modules&quot;<br>
=C2=A0FILES_${PN} =3D &quot;&quot;<br>
=C2=A0FILES_kernel-base =3D &quot;/lib/modules/${KERNEL_VERSION}/modules.or=
der /lib/modules/${KERNEL_VERSION}/modules.builtin&quot;<br>
-FILES_kernel-image =3D &quot;/boot/${KERNEL_IMAGETYPE}*&quot;<br>
+FILES_kernel-image =3D &quot;&quot;<br>
=C2=A0FILES_kernel-dev =3D &quot;/boot/System.map* /boot/Module.symvers* /b=
oot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build&quot;<b=
r>
=C2=A0FILES_kernel-vmlinux =3D &quot;/boot/vmlinux*&quot;<br>
=C2=A0FILES_kernel-modules =3D &quot;&quot;<br>
=C2=A0RDEPENDS_kernel =3D &quot;kernel-base&quot;<br>
-# Allow machines to override this dependency if kernel image files are<br>
+# Allow machines to override this dependency if kernel image files are<br>
=C2=A0# not wanted in images as standard<br>
=C2=A0RDEPENDS_kernel-base ?=3D &quot;kernel-image&quot;<br>
=C2=A0PKG_kernel-image =3D &quot;kernel-image-${@legitimize_package_name(&#=
39;${KERNEL_VERSION}&#39;)}&quot;<br>
@@ -394,14 +460,6 @@ pkg_postinst_kernel-base () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-pkg_postinst_kernel-image () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --install /${KERNEL_IMAGEDE=
ST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_I=
MAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true<br>
-}<br>
-<br>
-pkg_postrm_kernel-image () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --remove ${KERNEL_IMAGETYPE=
} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true<br>
-}<br>
-<br>
=C2=A0PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_packages &quot;<br>
<br>
=C2=A0python split_kernel_packages () {<br>
@@ -422,13 +480,13 @@ do_kernel_link_vmlinux() {<br>
<br>
=C2=A0do_strip() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KERNEL_IMAGE_STRIP_EXTRA_SECTIO=
NS}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${KERNEL=
_IMAGETYPE}&quot; !=3D &quot;vmlinux&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;image type will not be stripped (not supported): ${K=
ERNEL_IMAGETYPE}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! (echo &quot;${=
KERNEL_IMAGETYPES}&quot; | grep -q &quot;vmlinux&quot;); then<br></blockquo=
te><div><br></div><div>You had used the \bfitImage\b, but here you don&#39;=
t .. grep -w could work for them all.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;image type(s) will not be stripped (not supported): =
${KERNEL_IMAGETYPES}&quot;<br></blockquote><div><br></div><div><br></div><d=
iv>But on another note. Is it really right to say that none of the images w=
ill be stripped if you</div><div>find vmlinux anywhere in the image type li=
st ?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headers=3D`&quot;$C=
ROSS_COMPILE&quot;readelf -S ${KERNEL_OUTPUT} | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0headers=3D`&quot;$C=
ROSS_COMPILE&quot;readelf -S ${KERNEL_OUTPUT_DIR}/vmlinux | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 grep &quot;^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]&quot; | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sed &quot;s/^ \{1,\}\[[0-9 ]\{1,\}\] //&quot; | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 gawk &#39;{print $1}&#39;`<br>
@@ -438,7 +496,7 @@ do_strip() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Section not found: $str=
&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;$CROSS_COMPILE&quot;strip -s -R $str ${KERNEL_OUTPUT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;$CROSS_COMPILE&quot;strip -s -R $str ${KERNEL_OUTPUT_DIR}/v=
mlinux<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }; done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;KERNEL=
_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:&quot; \<br>
@@ -457,20 +515,22 @@ do_sizecheck() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$inva=
lid&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 die &quot;Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE},=
 should be an integerx (The unit is Kbytes)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=3D`du -ks ${B}=
/${KERNEL_OUTPUT} | awk &#39;{ print $1}&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $size -ge ${KE=
RNEL_IMAGE_MAXSIZE} ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0die &quot;This kernel (size=3D$size(K) &gt; ${KERNEL_IMAGE_MAXSIZ=
E}(K)) is too big for your device. Please reduce the size of the kernel by =
making more of it modular.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0size=3D`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$type | awk &#39;{print =
$1}&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;This kernel $type (size=3D$=
size(K) &gt; ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please=
 reduce the size of the kernel by making more of it modular.&quot;<br></blo=
ckquote><div><br></div><div>Hmm. Again here. Multiple image types are being=
 built. If one of them is too large for the device,</div><div>who&#39;s to =
say that that&#39;s the one that is going to be used ? Maybe this should be=
 a warn, instead</div><div>of a die ?</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
=C2=A0do_sizecheck[dirs] =3D &quot;${B}&quot;<br>
<br>
=C2=A0addtask sizecheck before do_install after do_strip<br>
<br>
-KERNEL_IMAGE_BASE_NAME ?=3D &quot;${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PK=
GR}-${MACHINE}-${DATETIME}&quot;<br>
+KERNEL_IMAGE_BASE_NAME ?=3D &quot;${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DAT=
ETIME}&quot;<br>
=C2=A0# Don&#39;t include the DATETIME variable in the sstate package signa=
tures<br>
=C2=A0KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<br>
-KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${KERNEL_IMAGETYPE}-${MACHINE}&quot;<=
br>
+KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${MACHINE}&quot;<br>
=C2=A0MODULE_IMAGE_BASE_NAME ?=3D &quot;modules-${PKGE}-${PKGV}-${PKGR}-${M=
ACHINE}-${DATETIME}&quot;<br>
=C2=A0MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<br>
=C2=A0MODULE_TARBALL_BASE_NAME ?=3D &quot;${MODULE_IMAGE_BASE_NAME}.tgz&quo=
t;<br>
@@ -479,28 +539,37 @@ MODULE_TARBALL_SYMLINK_NAME ?=3D &quot;modules-${MACH=
INE}.tgz&quot;<br>
=C2=A0MODULE_TARBALL_DEPLOY ?=3D &quot;1&quot;<br>
<br>
=C2=A0kernel_do_deploy() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/$=
{KERNEL_IMAGE_BASE_NAME}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_name=3D${type}=
-${KERNEL_IMAGE_BASE_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${K=
ERNEL_OUTPUT_DIR}/${type} ${DEPLOYDIR}/${base_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${MODULE_TARBALL_DEPLOY} =3D &quot;1&quot;=
 ] &amp;&amp; (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39; .config); then<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/lib<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar -cvzf ${DEPLOYD=
IR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${MODULE_TAR=
BALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDI=
R}/${KERNEL_IMAGE_SYMLINK_NAME}.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDI=
R}/${KERNEL_IMAGETYPE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_name=3D${type}=
-${KERNEL_IMAGE_BASE_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_name=3D${ty=
pe}-${KERNEL_IMAGE_SYMLINK_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}=
.bin ${DEPLOYDIR}/${symlink_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${base_name}=
.bin ${DEPLOYDIR}/${type}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${COREBASE}/meta/files/deploydir_readme.txt =
${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update deploy directory<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e &quot;${KERNEL_OUTPUT}.initramfs&quot; =
]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Copying =
deploy kernel-initramfs image and setting up links...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_base_name=
=3D${INITRAMFS_BASE_NAME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_symlink_n=
ame=3D${KERNEL_IMAGETYPE}-initramfs-${MACHINE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${K=
ERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${DEPLOYDIR}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${initramfs_=
base_name}.bin ${initramfs_symlink_name}.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e &quot;${KER=
NEL_OUTPUT_DIR}/${type}.initramfs&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Copying deploy ${type} kernel-initramfs image and sett=
ing up links...&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0initramfs_base_name=3D${type}-${INITRAMFS_BASE_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0initramfs_symlink_name=3D${type}-initramfs-${MACHINE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs ${DEPLOYDI=
R}/${initramfs_base_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cd ${DEPLOYDIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
=C2=A0do_deploy[cleandirs] =3D &quot;${DEPLOYDIR}&quot;<br>
=C2=A0do_deploy[dirs] =3D &quot;${DEPLOYDIR} ${B}&quot;<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index 00a69da..b3969b0 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -246,6 +246,7 @@ KERNEL_CLASSES[doc] =3D &quot;A list of classes definin=
g kernel image types that kernel<br>
=C2=A0KERNEL_EXTRA_ARGS[doc] =3D &quot;Specifies additional make command-li=
ne arguments the OpenEmbedded build system passes on when compiling the ker=
nel.&quot;<br>
=C2=A0KERNEL_FEATURES[doc] =3D &quot;Includes additional metadata from the =
Yocto Project kernel Git repository. The metadata you add through this vari=
able includes config fragments and features descriptions.&quot;<br>
=C2=A0KERNEL_IMAGETYPE[doc] =3D &quot;The type of kernel to build for a dev=
ice, usually set by the machine configuration files and defaults to &#39;zI=
mage&#39;.&quot;<br>
+KERNEL_IMAGETYPES[doc] =3D &quot;The list of types of kernel to build for =
a device, usually set by the machine configuration files and defaults to KE=
RNEL_IMAGETYPE.&quot;<br>
=C2=A0KERNEL_MODULE_AUTOLOAD[doc] =3D &quot;Lists kernel modules that need =
to be auto-loaded during boot&quot;<br>
=C2=A0KERNEL_MODULE_PROBECONF[doc] =3D &quot;Lists kernel modules for which=
 the build system expects to find module_conf_* values that specify configu=
ration for each of the modules&quot;<br>
=C2=A0KERNEL_PATH[doc] =3D &quot;The location of the kernel sources. This v=
ariable is set to the value of the STAGING_KERNEL_DIR within the module cla=
ss (module.bbclass).&quot;<br>
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.c=
onf<br>
index fbf8137..67ce161 100644<br>
--- a/meta/conf/machine/qemumips.conf<br>
+++ b/meta/conf/machine/qemumips.conf<br>
@@ -6,7 +6,7 @@ require conf/machine/include/qemu.inc<br>
=C2=A0require conf/machine/include/tune-mips32r2.inc<br>
<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<br>
+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
<br>
=C2=A0SERIAL_CONSOLES =3D &quot;115200;ttyS0 115200;ttyS1&quot;<br>
<br>
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips=
64.conf<br>
index 8c3f1fe..393212e 100644<br>
--- a/meta/conf/machine/qemumips64.conf<br>
+++ b/meta/conf/machine/qemumips64.conf<br>
@@ -6,7 +6,7 @@ require conf/machine/include/qemu.inc<br>
=C2=A0require conf/machine/include/tune-mips64.inc<br>
<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<br>
+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
<br>
=C2=A0SERIAL_CONSOLES =3D &quot;115200;ttyS0 115200;ttyS1&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/=
linux/linux-dtb.inc<br>
index 651a19e..74f5ef8 100644<br>
--- a/meta/recipes-kernel/linux/linux-dtb.inc<br>
+++ b/meta/recipes-kernel/linux/linux-dtb.inc<br>
@@ -34,9 +34,12 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for DTB in ${KERNEL_DEVICETREE}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DTB_BASE_NAME=3D`ba=
sename ${DTB} .dtb`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D=
`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/${MACHINE}/${DTB_BASE_NAME=
}/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D`get_rea=
l_dtb_path_in_kernel &quot;${DTB}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
TB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_SYMLINK_NAME}<b=
r></blockquote><div><br></div><div>If there are multiple image types being =
built, is this valid for them all ?</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &quot;${DTB}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-$=
{DTB_SYMLINK_NAME}.dtb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
@@ -44,31 +47,39 @@ do_deploy_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for DTB in ${KERNEL_DEVICETREE}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DTB=3D`normalize_dt=
b &quot;${DTB}&quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DTB_BASE_NAME=3D`ba=
sename ${DTB} .dtb`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_NAME=3D`echo ${=
KERNEL_IMAGE_BASE_NAME} | sed &quot;s/${MACHINE}/${DTB_BASE_NAME}/g&quot;`<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D=
`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/${MACHINE}/${DTB_BASE_NAME=
}/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D`get_rea=
l_dtb_path_in_kernel &quot;${DTB}&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${DEPLOY=
DIR}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
TB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DTB_NAME}.=
dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0base_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_BASE_NAME}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_SYMLINK_NAME}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_NAME=3D`echo ${base_name} | sed &quot;s/${MACHINE}/${DTB_BASE=
_NAME}/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &quot;${DTB}&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -d ${DEPLOYDIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
=C2=A0pkg_postinst_kernel-devicetree () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd /${KERNEL_IMAGEDEST}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`ba=
sename ${DTB} | awk -F &quot;.&quot; &#39;{print $1}&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D=
`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/${MACHINE}/${DTB_BASE_NAME=
}/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives=
 --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /=
boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_SYMLINK_NAME}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_BASE_NAME=3D`basename ${DTB} | awk -F &quot;.&quot; &#39;{pri=
nt $1}&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAM=
E}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERN=
EL_PRIORITY} || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
=C2=A0pkg_postrm_kernel-devicetree () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd /${KERNEL_IMAGEDEST}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`ba=
sename ${DTB} | awk -F &quot;.&quot; &#39;{print $1}&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D=
`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/${MACHINE}/${DTB_BASE_NAME=
}/g&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives=
 --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${K=
ERNEL_PRIORITY} || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEVICETREE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPE_FOR_MAKE}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_SYMLINK_NAME}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_BASE_NAME=3D`basename ${DTB} | awk -F &quot;.&quot; &#39;{pri=
nt $1}&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${MACHINE}=
/${DTB_BASE_NAME}/g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetre=
e-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machin=
e.conf b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.co=
nf<br>
index b319d62..e4a6f30 100644<br>
--- a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf<=
br>
+++ b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf<=
br>
@@ -9,7 +9,7 @@ require conf/machine/include/tune-mips32.inc<br>
=C2=A0MACHINE_FEATURES =3D &quot;screen keyboard pci usbhost ext2 ext3 seri=
al&quot;<br>
<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<br>
+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
=C2=A0KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=C2=A0 =3D &quot;.comment&quot;<br>
<br>
=C2=A0{{ if kernel_choice =3D=3D &quot;custom&quot;: preferred_kernel =3D &=
quot;linux-yocto-custom&quot; }}<br>
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/mach=
ine.conf b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machin=
e.conf<br>
index 3afc5e0..2c2d8af 100644<br>
--- a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.con=
f<br>
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.con=
f<br>
@@ -9,7 +9,7 @@ require conf/machine/include/tune-mips64.inc<br>
=C2=A0MACHINE_FEATURES =3D &quot;pci ext2 ext3 serial&quot;<br>
<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<br>
+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br></blockquote><div><br></d=
iv><div><br></div><div>Again, why can&#39;t vmlinux just bein in KERNEL_IMA=
GETYPES ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
=C2=A0KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=C2=A0 =3D &quot;.comment&quot;<br>
<br>
=C2=A0{{ if kernel_choice =3D=3D &quot;custom&quot;: preferred_kernel =3D &=
quot;linux-yocto-custom&quot; }}<br>
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machin=
e.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.co=
nf<br>
index 67e1cbd..7a0a4d3 100644<br>
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf<=
br>
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf<=
br>
@@ -69,6 +69,6 @@ SERIAL_CONSOLE =3D &quot;115200 ttyS0&quot;<br>
<br>
=C2=A0{{ if qemuarch =3D=3D &quot;mips&quot; or qemuarch =3D=3D &quot;mips6=
4&quot;: }}<br>
=C2=A0KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<br>
+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
=C2=A0SERIAL_CONSOLE =3D &quot;115200 ttyS0&quot;<br>
=C2=A0MACHINE_EXTRA_RRECOMMENDS =3D &quot; kernel-modules&quot;<br>
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div>&quot;Thou shalt not follow the NULL pointer, for chaos and madness =
await thee at its end&quot;</div>
</div></div>

--001a11425fbaa18b77052c2164a4--
