Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 38AC5731A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 14:37:47 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e6so130708045vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nCXIF9fQCUiAHFnml7jiupmdNMxDoEl7cd0vrbGf9vg=;
	b=seEINmsHJr4OQ8dBSS2Fh7uA08zngTfdHfk+Ec14wa2UwqBvQ3I6H6yAohH4cTFm9g
	qaImDe/b0WXumlLCRP1rwRVJxmEMTVwQqbvfqjgP1S7eBoTg+a3SR3YIDBNTA6eardQR
	OJgguYdeql3uO5NQ0Ldx0x73X7gC0bGvd9jWklAjHyehkhisqZiETTa3uYpRBNB+RhfH
	sQSHGvw8rpYb1Iih9CBGa9L9zdAUeX3YlwOMZMIOY4MVjcfgF2L65Vup0o0ZOvhlSaEV
	NigaBzKRVkSE1WzcfgJhLD/jhg9IOd9W/iZVqwj1tqOgvDGQ0s2VLh/m9lCba7Oom104
	+pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nCXIF9fQCUiAHFnml7jiupmdNMxDoEl7cd0vrbGf9vg=;
	b=AETG6Mh8NVfKP6d/10DvR9itkbZOT2eUMgxKXrZlTfz6WhNZgvE+aZWZbKEPEiQ0Zp
	JUK8MRvoiOJRBiV+HLPrxf4LQQNFdvKYM9/8MYQm4dFwkQSry/+Qnj/CDtTqtaMxxQ70
	pPOLC3ncdy/69NEGd8mO7Oeu7tbK/eIRYfQRVhK1AZMnBe0Ni/kEnS6oYekE88gqD4JQ
	sGuepIW+1pfrI4r7PmiW9JrEE6IbVXpSN48xrS2s3cAmxqNVl1FquVvvYSYmlSh3xsya
	IP2rIz+84Rw0jX/jhPfVPd4h9AWMCkNk5ryrQrOOayl6vXPxx0j9td5xOIDooRe7m9Jr
	++GQ==
X-Gm-Message-State: AG10YOQrCHQkFiq3T74PhexY9RvHAfXMwxPKBaRams6zOsmewBqKWOgsVVIdsdZStNPJLhwprWbCf7yjKa5eVA==
MIME-Version: 1.0
X-Received: by 10.31.185.201 with SMTP id j192mr24400569vkf.21.1456151867942; 
	Mon, 22 Feb 2016 06:37:47 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Mon, 22 Feb 2016 06:37:47 -0800 (PST)
In-Reply-To: <56CACA39.5060201@windriver.com>
References: <cover.1455874404.git.zhe.he@windriver.com>
	<6690be7ba721ca84deeaea05f6cad6636cf8385d.1455874404.git.zhe.he@windriver.com>
	<CADkTA4PmdqDX3kWhavQ_rXOi=2w1Xt=2HEx3RC_e_ACacOsvJA@mail.gmail.com>
	<56CACA39.5060201@windriver.com>
Date: Mon, 22 Feb 2016 09:37:47 -0500
Message-ID: <CADkTA4PU6KYbom+menxGY_Esqwf0WebpuV+-4axyLA8umFrD6w@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Feb 2016 14:37:48 -0000
Content-Type: multipart/alternative; boundary=001a11436c72d3ef63052c5cc6a7

--001a11436c72d3ef63052c5cc6a7
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 22, 2016 at 3:43 AM, He Zhe <zhe.he@windriver.com> wrote:

>
>
> On 02/19/2016 11:46 PM, Bruce Ashfield wrote:
> >
> >
> > On Fri, Feb 19, 2016 at 4:56 AM, <zhe.he@windriver.com <mailto:
> zhe.he@windriver.com>>wrote:
> >
> >     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> >
> >     Add KERNEL_IMAGETYPES to support building packaging and installing
> >     multi types of kernel images, such as zImage uImage, at one time.
> >
> >     KERNEL_IMAGETYPE works as before. All KERNEL_ALT_IMAGETYPEs are
> >     replaced by KERNEL_IMAGETYPES.
> >
> >
> >
> > I see that you have updated layers/configs with the new variable, but
> obviously you can't see all the
> > layers that may be using that old variable.
> >
> > Isn't it possible to have a python routine that detects the old
> ALT_IMAGETYPE variable and
> > assigns it to the new one (if it isn't already set) ? Sort of like how
> distro features/features backfill
> > work ?
> >
>
> Thanks for careful review.
>
> OK. I'll try to add such function.
>
> >
> >     Fixes [YOCTO #6945].
> >
> >     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:
> zhe.he@windriver.com>>
> >     ---
> >      documentation/ref-manual/ref-variables.xml         |  10 +-
> >      meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
> >      meta/classes/kernel-fitimage.bbclass               |  20 +--
> >      meta/classes/kernel-grub.bbclass                   |  44 ++++--
> >      meta/classes/kernel-uimage.bbclass                 |  22 +--
> >      meta/classes/kernel.bbclass                        | 171
> +++++++++++++++------
> >      meta/conf/documentation.conf                       |   1 +
> >      meta/conf/machine/qemumips.conf                    |   2 +-
> >      meta/conf/machine/qemumips64.conf                  |   2 +-
> >      meta/recipes-kernel/linux/linux-dtb.inc            |  49 +++---
> >      .../target/arch/mips/conf/machine/machine.conf     |   2 +-
> >      .../target/arch/mips64/conf/machine/machine.conf   |   2 +-
> >      .../target/arch/qemu/conf/machine/machine.conf     |   2 +-
> >      13 files changed, 214 insertions(+), 115 deletions(-)
> >
> >     diff --git a/documentation/ref-manual/ref-variables.xml
> b/documentation/ref-manual/ref-variables.xml
> >     index a76a8c2..a8e4fd8 100644
> >     --- a/documentation/ref-manual/ref-variables.xml
> >     +++ b/documentation/ref-manual/ref-variables.xml
> >     @@ -6417,14 +6417,14 @@
> recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
> >                  </glossdef>
> >              </glossentry>
> >
> >     -        <glossentry
> id='var-KERNEL_ALT_IMAGETYPE'><glossterm>KERNEL_ALT_IMAGETYPE</glossterm>
> >     +        <glossentry
> id='var-KERNEL_IMAGETYPES'><glossterm>KERNEL_IMAGETYPES</glossterm>
> >                  <info>
> >     -                KERNEL_ALT_IMAGETYPE[doc] = "Specifies an alternate
> kernel image type for creation."
> >     +                KERNEL_IMAGETYPES[doc] = "Specifies alternate
> kernel image types for creation."
> >                  </info>
> >                  <glossdef>
> >                      <para role="glossdeffirst">
> >      <!--                <para role="glossdeffirst"><imagedata
> fileref="figures/define-generic.png" /> -->
> >     -                    Specifies an alternate kernel image type for
> creation in
> >     +                    Specifies alternate kernel image types for
> creation in
> >                          addition to the kernel image type specified
> using the
> >                          <link
> linkend='var-KERNEL_IMAGETYPE'><filename>KERNEL_IMAGETYPE</filename></link>
> >                          variable.
> >     @@ -6612,8 +6612,8 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR
> = "${INC_PR}.3"
> >                      </para>
> >
> >                      <para>
> >     -                    If you want to build an alternate kernel image
> type, use the
> >     -                    <link
> linkend='var-KERNEL_ALT_IMAGETYPE'><filename>KERNEL_ALT_IMAGETYPE</filename></link>
> >     +                    If you want to build alternate kernel image
> types, use the
> >     +                    <link
> linkend='var-KERNEL_IMAGETYPES'><filename>KERNEL_IMAGETYPES</filename></link>
> >                          variable.
> >                      </para>
> >                  </glossdef>
> >     diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf
> b/meta-yocto-bsp/conf/machine/edgerouter.conf
> >     index 476e690..affd568 100644
> >     --- a/meta-yocto-bsp/conf/machine/edgerouter.conf
> >     +++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
> >     @@ -7,7 +7,7 @@ require conf/machine/include/tune-mips64.inc
> >      MACHINE_FEATURES = "pci ext2 ext3 serial"
> >
> >      KERNEL_IMAGETYPE = "vmlinux"
> >     -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >     +KERNEL_IMAGETYPES = "vmlinux.bin"
> >
> >
> > This now reads a bit ... odd (for back of a better description). I'm
> concerned that it will cause
> > confusion, there are two variables:
> >
> > KERNEL_IMAGETYPE and KERNEL_IMAGETYPES ..
> >
> > They are very close in name, and just reading the variable doesn't
> really tell us why
> > we'd set one and not the other. The old "ALT" made it more obvious.
> >
>
> But changing original KERNEL_ALT_IMAGETYPE to a list or using
> KERNEL_ALT_IMAGETYPES
> in addition to KERNEL_ALT_IMAGETYPE also seems not very clear. Below is
> the previous
> talk with Richard Purdie and Christopher Larson.
>


Aha. I didn't recall that previous discussion. Clearly there's no "one good
way" to name
these to avoid some confusion, so I'd defer to Richard's opinion on the
naming.

That being said, I do wish that the names conveyed why there was a variable
that
took a single image type, and then another one that took a list, and that
the lists
were non overlapping.


>
> >>>>> Question, why not add KERNEL_IMAGETYPES, and make KERNEL_IMAGETYPE
> equal to your new KERNEL_IMAGETYPE_0?(Christopher)
> >>>> Adding a new KERNEL_IMAGETYPES will also work. But it should be
> better(me)
> >>>> not to change the name of KERNEL_IMAGETYPE, so that those who have
> >>>> used it don't have to change their code.
> >>>>
> >>>> Thank you for reviewing.
> >>> I have to agree with Chris here, keeping KERNEL_IMAGETYPE as used
> today(Richard)
> >>> and equivalent to KERNEL_IMAGETYPE_0 and adding KERNEL_IMAGETYPES does
> >>> seem like a cleaner way to implement this.
> >>
> >> But it might mean we are going to check both KERNEL_IMAGETYPE and
> KERNEL_IMAGETYPES(me)
> >> to generate final image type list. Is that OK?
> >
> >Well, in some places you will use one and in some places you'll use
> the(Richard)
> >other, that is unavoidable.
> >
> >I much prefer "KERNEL_IMAGETYPE and KERNEL_IMAGETYPES" to
> >"KERNEL_IMAGETYPE_0 and KERNEL_IMAGETYPE" as variable names though.
> >
> >Cheers,
>
> > But from the patch, KERNEL_IMAGETYPE isn't used, so does it have to be
> set at
> > all in these .conf files ? .. or maybe I missed where it is still used
> other than for
> > compatibility.
> >
>
> Not every KERNEL_IMAGETYPE should be replaced by KERNEL_IMAGETYPES. Only
> one
> type of kernel image is necessary for below cases.Right?
>
> Yes, more explanations should be added to commit message and code comments.
>
> 1) boot fs image
> meta/classes/bootimg.bbclass:50:KERNEL_IMAGETYPE ??= "bzImage"
> meta/classes/bootimg.bbclass:72:        install -m 0644
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${DEST}/vmlinuz
> meta/classes/image_types.bbclass:109:ELF_KERNEL ?=
> "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
>
> 2) test fs image
> meta/lib/oeqa/controllers/masterimage.py:55:        self.kernel =
> os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
> d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) +
> '.bin')
> meta/lib/oeqa/targetcontrol.py:126:        self.kernel =
> os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
> d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) +
> '.bin')
>
>
> >      KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
> >
> >      PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> >     diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> >     index f1b409c..51df19d 100644
> >     --- a/meta/classes/kernel-fitimage.bbclass
> >     +++ b/meta/classes/kernel-fitimage.bbclass
> >     @@ -1,8 +1,8 @@
> >      inherit kernel-uboot
> >
> >      python __anonymous () {
> >     -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> >     -    if kerneltype == 'fitImage':
> >     +    kerneltypes = d.getVar('KERNEL_IMAGETYPES', True) or ""
> >     +    if 'fitImage' in kerneltypes.split():
> >              depends = d.getVar("DEPENDS", True)
> >              depends = "%s u-boot-mkimage-native dtc-native" % depends
> >              d.setVar("DEPENDS", depends)
> >     @@ -10,7 +10,9 @@ python __anonymous () {
> >             # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is
> internal
> >             # to kernel.bbclass . We have to override it, since we pack
> zImage
> >             # (at least for now) into the fitImage .
> >     -        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
> >     +        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True)
> or ""
> >     +        if 'fitImage' in typeformake.split():
> >     +            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE',
> typeformake.replace('fitImage', 'zImage'))
> >
> >              image = d.getVar('INITRAMFS_IMAGE', True)
> >              if image:
> >     @@ -154,7 +156,7 @@ EOF
> >      }
> >
> >      do_assemble_fitimage() {
> >     -       if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> >     +       if echo ${KERNEL_IMAGETYPES} | grep -Pq "\bfitImage\b"; then
> >
> >
> > Not that it really matters, but grep -w would work here as well, and
> might read bit simpler.
>
> OK. I'll replace it with "-w"
>
> >
> >
> >                     kernelcount=1
> >                     dtbcount=""
> >                     rm -f fit-image.its
> >     @@ -217,14 +219,14 @@ addtask assemble_fitimage before do_install
> after do_compile
> >
> >      kernel_do_deploy_append() {
> >             # Update deploy directory
> >     -       if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> >     +       if echo ${KERNEL_IMAGETYPES} | grep -Pq "\bfitImage\b"; then
> >                     cd ${B}
> >                     echo "Copying fit-image.its source file..."
> >     -
>  its_base_name="${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
> >     -               its_symlink_name=${KERNEL_IMAGETYPE}-its-${MACHINE}
> >     +
>  its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
> >     +               its_symlink_name=fitImage-its-${MACHINE}
> >                     install -m 0644 fit-image.its
> ${DEPLOYDIR}/${its_base_name}.its
> >     -
>  linux_bin_base_name="${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> >     -
>  linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
> >     +
>  linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
> >     +               linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
> >                     install -m 0644 linux.bin
> ${DEPLOYDIR}/${linux_bin_base_name}.bin
> >
> >                     cd ${DEPLOYDIR}
> >     diff --git a/meta/classes/kernel-grub.bbclass
> b/meta/classes/kernel-grub.bbclass
> >     index a63f482..f7dcc07 100644
> >     --- a/meta/classes/kernel-grub.bbclass
> >     +++ b/meta/classes/kernel-grub.bbclass
> >     @@ -10,41 +10,44 @@
> >      #   updates the new kernel as the boot priority.
> >      #
> >
> >     -pkg_preinst_kernel-image_append () {
> >     +python __anonymous () {
> >
> >
> > Maybe it is just the patch context making me misread this, but can you
> elaborate on
> > what is changing here ?
> >
>
> Here I change the two variables, pkg_preinst_kernel-image_append and
> pkg_postinst_kernel-image_prepend to two strings, and change all
> "${KERNEL_IMAGETYPE}"
> in the strings to "KERNEL_IMAGETYPE" to avoid being expanded in parsing
> time. So that I can
> replace KERNEL_IMAGETYPEs to every single image type in the following
> loops, in which the
> two original variables' name are constructed and their values are set.
>
> According to bitbake user manual, __anonymous functions are executed
> during parsing. It
> should be OK for the following references. I've verified this by building
> an image with
> kernel-grub.bbclass.
>


Thanks. That clarifies things, I know there have been some variable
expansion changes
recently in bitbake, and I wanted to make sure they have been taken into
account.


>
> > Is it the old preinst is being replaced by anonymous python that
> generates the preinst as
> > a string, and that this injected into the package via the python ? Are
> we guaranteed
> > to run the anonymous python at the right time ? .. I've been burned by
> that before, so
> > I wanted to check that it has been considered.
> >
> >
> >     +    import re
> >     +
> >     +    preinst = '''
> >             # Parsing confliction
> >             [ -f "$D/boot/grub/menu.list" ] &&
> grubcfg="$D/boot/grub/menu.list"
> >             [ -f "$D/boot/grub/grub.cfg" ] &&
> grubcfg="$D/boot/grub/grub.cfg"
> >             if [ -n "$grubcfg" ]; then
> >                     # Dereference symlink to avoid confliction with new
> kernel name.
> >     -               if grep -q "/${KERNEL_IMAGETYPE} \+root=" $grubcfg;
> then
> >     -                       if [ -L "$D/boot/${KERNEL_IMAGETYPE}" ]; then
> >     -                               kimage=`realpath
> $D/boot/${KERNEL_IMAGETYPE} 2>/dev/null`
> >     +               if grep -q "/KERNEL_IMAGETYPE \+root=" $grubcfg; then
> >
> >
> > It's lines like these that made me ask my question above. This looks
> like its checking the
> > grubcfg on disk. Is that same grep going to work in this anonymous
> python .. or maybe this
> > isn't being run now, and only when the package is being installed ? I'm
> most likely missing
> > something.
>
> No, it's not running, it's in the middle of the string.
>


Hmm. Indeed, the way that nested strings are valid is a bit confusing, but
that's
just my background not being in python chowing through!


>
> >
> >
> >     +                       if [ -L "$D/boot/KERNEL_IMAGETYPE" ]; then
> >     +                               kimage=`realpath
> $D/boot/KERNEL_IMAGETYPE 2>/dev/null`
> >                                     if [ -f "$D$kimage" ]; then
> >     -                                       sed -i
> "s:${KERNEL_IMAGETYPE} \+root=:${kimage##*/} root=:" $grubcfg
> >     +                                       sed -i "s:KERNEL_IMAGETYPE
> \+root=:${kimage##*/} root=:" $grubcfg
> >                                     fi
> >                             fi
> >                     fi
> >
> >                     # Rename old kernel if it conflicts with new kernel
> name.
> >     -               if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> \+root=" $grubcfg; then
> >     -                       if [ -f
> "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" ]; then
> >     +               if grep -q "/KERNEL_IMAGETYPE-${KERNEL_VERSION}
> \+root=" $grubcfg; then
> >     +                       if [ -f
> "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" ]; then
> >                                     timestamp=`date +%s`
> >     -
>  kimage="$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
> >     -                               sed -i
> "s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=:${kimage##*/} root=:"
> $grubcfg
> >     -                               mv
> "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" "$kimage"
> >     +
>  kimage="$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}-$timestamp-back"
> >     +                               sed -i
> "s:KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=:${kimage##*/} root=:" $grubcfg
> >     +                               mv
> "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" "$kimage"
> >                             fi
> >                     fi
> >             fi
> >     -}
> >     +'''
> >
> >     -pkg_postinst_kernel-image_prepend () {
> >     +    postinst = '''
> >             get_new_grub_cfg() {
> >                     grubcfg="$1"
> >                     old_image="$2"
> >     -               title="Update
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
> >     +               title="Update
> KERNEL_IMAGETYPE-${KERNEL_VERSION}-${PV}"
> >                     if [ "${grubcfg##*/}" = "grub.cfg" ]; then
> >                             rootfs=`grep " *linux \+[^ ]\+ \+root="
> $grubcfg -m 1 | \
> >     -                                sed
> "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
> >     +                                sed
> "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
> >
> >                             echo "menuentry \"$title\" {"
> >                             echo "    set root=(hd0,1)"
> >     @@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend () {
> >                             echo "}"
> >                     elif [ "${grubcfg##*/}" = "menu.list" ]; then
> >                             rootfs=`grep "kernel \+[^ ]\+ \+root="
> $grubcfg -m 1 | \
> >     -                                sed
> "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
> >     +                                sed
> "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
> >
> >                             echo "default 0"
> >                             echo "timeout 30"
> >     @@ -87,5 +90,16 @@ pkg_postinst_kernel-image_prepend () {
> >                     mv $grubcfgtmp $grubcfg
> >                     echo "Caution! Update kernel may affect
> kernel-module!"
> >             fi
> >     +'''
> >     +
> >     +    imagetypes = d.getVar('KERNEL_IMAGETYPES', True)
> >     +    imagetypes = re.sub(r'\.gz$', '', imagetypes)
> >     +
> >     +    for type in imagetypes.split():
> >     +        typelower = type.lower()
> >     +        preinst_append = preinst.replace('KERNEL_IMAGETYPE', type)
> >     +        postinst_prepend = postinst.replace('KERNEL_IMAGETYPE',
> type)
> >     +        d.setVar('pkg_preinst_kernel-image-' + typelower +
> '_append', preinst_append)
> >     +        d.setVar('pkg_postinst_kernel-image-' + typelower +
> '_prepend', postinst_prepend)
> >      }
> >
> >     diff --git a/meta/classes/kernel-uimage.bbclass
> b/meta/classes/kernel-uimage.bbclass
> >     index f73965b..a238ce4 100644
> >     --- a/meta/classes/kernel-uimage.bbclass
> >     +++ b/meta/classes/kernel-uimage.bbclass
> >     @@ -1,23 +1,25 @@
> >      inherit kernel-uboot
> >
> >      python __anonymous () {
> >     -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> >     -    if kerneltype == 'uImage':
> >     +    if "uImage" in (d.getVar('KERNEL_IMAGETYPES', True) or
> "").split():
> >              depends = d.getVar("DEPENDS", True)
> >              depends = "%s u-boot-mkimage-native" % depends
> >              d.setVar("DEPENDS", depends)
> >
> >     -       # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is
> internal
> >     -       # to kernel.bbclass . We override the variable here, since
> we need
> >     -       # to build uImage using the kernel build system if and only
> if
> >     -       # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux
> into
> >     -       # the uImage .
> >     -       if d.getVar("KEEPUIMAGE", True) != 'yes':
> >     -            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
> >     +        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is
> internal
> >     +        # to kernel.bbclass . We override the variable here, since
> we need
> >     +        # to build uImage using the kernel build system if and only
> if
> >     +        # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux
> into
> >     +        # the uImage .
> >     +        if d.getVar("KEEPUIMAGE", True) != 'yes':
> >     +            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE",
> True) or ""
> >     +            if "uImage" in typeformake.split():
> >     +                typeformake.replace('uImage', 'zImage')
> >     +            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
> >      }
> >
> >      do_uboot_mkimage() {
> >     -       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> >     +       if echo "${KERNEL_IMAGETYPES}" | grep -Pq "\buImage\b"; then
> >                     if test "x${KEEPUIMAGE}" != "xyes" ; then
> >                             uboot_prep_kimage
> >
> >     diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> >     index c3eab50..6db2e2e 100644
> >     --- a/meta/classes/kernel.bbclass
> >     +++ b/meta/classes/kernel.bbclass
> >     @@ -16,12 +16,48 @@ INITRAMFS_IMAGE ?= ""
> >      INITRAMFS_TASK ?= ""
> >      INITRAMFS_IMAGE_BUNDLE ?= ""
> >
> >     +# KERNEL_VERSION is extracted from source code. It is evaluated as
> >     +# None for the first parsing, since the code has not been fetched.
> >     +# After the code is fetched, it will be evaluated as real version
> >     +# number and cause kernel to be rebuilt. To avoid this, make
> >     +# KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
> >     +# LINUX_VERSION which is a constant.
> >     +KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION', True) or ""}"
> >     +KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
> >     +KERNEL_VERSION_PKG_NAME =
> "${@legitimize_package_name(d.getVar('KERNEL_VERSION', True))}"
> >     +KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
> >     +
> >      python __anonymous () {
> >          import re
> >
> >     -    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> >     +    type = d.getVar('KERNEL_IMAGETYPE', True) or ""
> >
> >
> > Aha. Here is that use of KERNEL_IMAGETYPE. Like I mentioned for the alt
> image type, can't
> > this existing variable be checked, and then added to KERNEL_IMAGE_TYPES
> in some
> > python code ? That would simplify the code here, and also not require
> the two variables to
> > be kept around.
>
> See above for explanation for KERNEL_IMAGETYPES.
>

True. But I still think that we could allow the old variable to be set, and
have it joined
into a single variable by python code. That would mean you'd only need to
check
one variable, and users can continue to set the existing one. Something to
think about.


>
> >
> >
> >     +    types = d.getVar('KERNEL_IMAGETYPES', True) or ""
> >     +    if type not in types.split():
> >     +        types = (type + ' ' + types).strip()
> >     +        d.setVar('KERNEL_IMAGETYPES', types)
> >     +    typeformake = re.sub(r'\.gz', '', types)
> >     +    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
> >     +
> >     +    for type in typeformake.split():
> >     +        typelower = type.lower()
> >     +
> >     +        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
> >     +
> >     +        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type
> + '*')
> >     +
> >     +        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-'
> + typelower)
> >     +
> >     +        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
> typelower + '-${KERNEL_VERSION_PKG_NAME}')
> >     +
> >     +        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
> >
> >     -    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '',
> kerneltype))
> >     +        imagedest = d.getVar('KERNEL_IMAGEDEST', True)
> >     +        priority = d.getVar('KERNEL_PRIORITY', True)
> >     +        postinst = '#!/bin/sh\n' + 'update-alternatives --install
> /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' +
> type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> >     +        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
> >     +
> >     +        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + '
> ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> >     +        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
> >
> >          image = d.getVar('INITRAMFS_IMAGE', True)
> >          if image:
> >     @@ -92,8 +128,8 @@ KERNEL_PRIORITY ?=
> "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
> >
> >      KERNEL_RELEASE ?= "${KERNEL_VERSION}"
> >
> >     -# Where built kernel lies in the kernel tree
> >     -KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> >     +# The directory where built kernel lies in the kernel tree
> >     +KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
> >      KERNEL_IMAGEDEST = "boot"
> >
> >      #
> >     @@ -119,8 +155,6 @@ KERNEL_EXTRA_ARGS ?= ""
> >      # We don't want to override kernel Makefile variables from the
> environment
> >      EXTRA_OEMAKE = ""
> >
> >     -KERNEL_ALT_IMAGETYPE ??= ""
> >     -
> >      # Define where the kernel headers are installed on the target as
> well as where
> >      # they are staged.
> >      KERNEL_SRC_PATH = "/usr/src/kernel"
> >     @@ -166,23 +200,48 @@ copy_initramfs() {
> >             echo "Finished copy of initramfs into ./usr"
> >      }
> >
> >     -INITRAMFS_BASE_NAME =
> "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
> >     +INITRAMFS_BASE_NAME = "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
> >
> >      INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
> >      do_bundle_initramfs () {
> >             if [ ! -z "${INITRAMFS_IMAGE}" -a
> x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> >                     echo "Creating a kernel image with a bundled
> initramfs..."
> >                     copy_initramfs
> >     -               if [ -e ${KERNEL_OUTPUT} ] ; then
> >     -                       mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
> >     -               fi
> >     +               # Backuping kernel image relies on its type(regular
> file or symbolic link)
> >
> >
> > s/Backuping/Backing up/
>
> I'll correct it.
>
> >
> >
> >     +               tmp_path=""
> >     +               for type in ${KERNEL_IMAGETYPES} ; do
> >     +                       if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> >     +                               linkpath=`readlink -n
> ${KERNEL_OUTPUT_DIR}/$type`
> >     +                               realpath=`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$type`
> >     +                               mv -f $realpath $realpath.bak
> >     +                               tmp_path=$tmp_path"
> "$type"#"$linkpath"#"$realpath
> >     +                       elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then
> >     +                               mv -f ${KERNEL_OUTPUT_DIR}/$type
> ${KERNEL_OUTPUT_DIR}/$type.bak
> >     +                               tmp_path=$tmp_path" "$type"##"
> >     +                       fi
> >     +               done
> >
>  use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> >                     kernel_do_compile
> >     -               mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
> >     -               mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
> >     +               # Restoring kernel image
> >     +               for tp in $tmp_path ; do
> >     +                       type=`echo $tp|cut -d "#" -f 1`
> >     +                       linkpath=`echo $tp|cut -d "#" -f 2`
> >     +                       realpath=`echo $tp|cut -d "#" -f 3`
> >     +                       if [ -n "$realpath" ]; then
> >     +                               mv -f $realpath $realpath.initramfs
> >     +                               mv -f $realpath.bak $realpath
> >     +                               cd ${B}/${KERNEL_OUTPUT_DIR}
> >     +                               ln -sf $linkpath.initramfs
> >     +                       else
> >     +                               mv -f ${KERNEL_OUTPUT_DIR}/$type
> ${KERNEL_OUTPUT_DIR}/$type.initramfs
> >     +                               mv -f ${KERNEL_OUTPUT_DIR}/$type.bak
> ${KERNEL_OUTPUT_DIR}/$type
> >     +                       fi
> >     +               done
> >                     # Update install area
> >     -               echo "There is kernel image bundled with initramfs:
> ${B}/${KERNEL_OUTPUT}.initramfs"
> >     -               install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
> >     -               echo "${B}/${KERNEL_OUTPUT}.initramfs"
> >     +               for type in ${KERNEL_IMAGETYPES} ; do
> >     +                       echo "There is kernel image bundled with
> initramfs: ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
> >     +                       install -m 0644
> ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
> ${D}/boot/$type-initramfs-${MACHINE}.bin
> >     +                       echo
> "${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
> >     +               done
> >             fi
> >      }
> >
> >     @@ -207,10 +266,15 @@ kernel_do_compile() {
> >                     copy_initramfs
> >
>  use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> >             fi
> >     -       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
> ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> >     -       if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =
> "${KERNEL_IMAGETYPE}"; then
> >     -               gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
> "${KERNEL_OUTPUT}"
> >     -       fi
> >     +       oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> >
> >
> >
> > This is probably something that is worth mentioning in the top of the
> commit message. You are
> > building multiple kernel image types, but they are all currently using
> the same configuration.
> >
> > If the make invokations were split into separate calls per image type,
> we could conceivably
> > extend this to generate and use a separate config int he future.
> >
>
> OK. Let me test if there is any side effect after putting this make in a
> type loop.
>
> >     +       for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> >     +               for type in ${KERNEL_IMAGETYPES} ; do
> >     +                       if test "${typeformake}.gz" = "${type}"; then
> >     +                               gzip -9c < "${typeformake}" >
> "${KERNEL_OUTPUT_DIR}/${type}"
> >     +                               break;
> >     +                       fi
> >     +               done
> >     +       done
> >      }
> >
> >      do_compile_kernelmodules() {
> >     @@ -251,7 +315,9 @@ kernel_do_install() {
> >             #
> >             install -d ${D}/${KERNEL_IMAGEDEST}
> >             install -d ${D}/boot
> >     -       install -m 0644 ${KERNEL_OUTPUT}
> ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> >     +       for type in ${KERNEL_IMAGETYPES} ; do
> >     +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
> ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
> >     +       done
> >             install -m 0644 System.map
> ${D}/boot/System.map-${KERNEL_VERSION}
> >             install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> >             install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> >     @@ -365,12 +431,12 @@ EXPORT_FUNCTIONS do_compile do_install
> do_configure
> >      PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image
> kernel-dev kernel-modules"
> >      FILES_${PN} = ""
> >      FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
> /lib/modules/${KERNEL_VERSION}/modules.builtin"
> >     -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> >     +FILES_kernel-image = ""
> >      FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
> /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> >      FILES_kernel-vmlinux = "/boot/vmlinux*"
> >      FILES_kernel-modules = ""
> >      RDEPENDS_kernel = "kernel-base"
> >     -# Allow machines to override this dependency if kernel image files
> are
> >     +# Allow machines to override this dependency if kernel image files
> are
> >      # not wanted in images as standard
> >      RDEPENDS_kernel-base ?= "kernel-image"
> >      PKG_kernel-image =
> "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> >     @@ -394,14 +460,6 @@ pkg_postinst_kernel-base () {
> >             fi
> >      }
> >
> >     -pkg_postinst_kernel-image () {
> >     -       update-alternatives --install
> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> ${KERNEL_PRIORITY} || true
> >     -}
> >     -
> >     -pkg_postrm_kernel-image () {
> >     -       update-alternatives --remove ${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> >     -}
> >     -
> >      PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
> >
> >      python split_kernel_packages () {
> >     @@ -422,13 +480,13 @@ do_kernel_link_vmlinux() {
> >
> >      do_strip() {
> >             if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> >     -               if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
> >     -                       bbwarn "image type will not be stripped (not
> supported): ${KERNEL_IMAGETYPE}"
> >     +               if ! (echo "${KERNEL_IMAGETYPES}" | grep -q
> "vmlinux"); then
> >
> >
> > You had used the \bfitImage\b, but here you don't .. grep -w could work
> for them all.
>
> I'll correct it.
>
> >
> >
> >     +                       bbwarn "image type(s) will not be stripped
> (not supported): ${KERNEL_IMAGETYPES}"
> >
> >
> >
> > But on another note. Is it really right to say that none of the images
> will be stripped if you
> > find vmlinux anywhere in the image type list ?
> >
>
> Not clear what you mean here.
>


Consider that there are a list of image types in KERNEL_IMAGETYPES, and
most of them
could be stripped, but that list contains vmlinux. The test above will
avoid stripping any
of them, where the intent was really to not strip vmlinux, and only vmlinux.


>
> >                             return
> >                     fi
> >
> >                     cd ${B}
> >     -               headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT}
> | \
> >     +               headers=`"$CROSS_COMPILE"readelf -S
> ${KERNEL_OUTPUT_DIR}/vmlinux | \
> >                               grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
> >                               sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
> >                               gawk '{print $1}'`
> >     @@ -438,7 +496,7 @@ do_strip() {
> >                                     bbwarn "Section not found: $str";
> >                             fi
> >
> >     -                       "$CROSS_COMPILE"strip -s -R $str
> ${KERNEL_OUTPUT}
> >     +                       "$CROSS_COMPILE"strip -s -R $str
> ${KERNEL_OUTPUT_DIR}/vmlinux
> >                     }; done
> >
> >                     bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set,
> stripping sections:" \
> >     @@ -457,20 +515,22 @@ do_sizecheck() {
> >                     if [ -n "$invalid" ]; then
> >                             die "Invalid KERNEL_IMAGE_MAXSIZE:
> ${KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)"
> >                     fi
> >     -               size=`du -ks ${B}/${KERNEL_OUTPUT} | awk '{ print
> $1}'`
> >     -               if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> >     -                       die "This kernel (size=$size(K) >
> ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the
> size of the kernel by making more of it modular."
> >     -               fi
> >     +               for type in ${KERNEL_IMAGETYPES} ; do
> >     +                       size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$type
> | awk '{print $1}'`
> >     +                       if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ];
> then
> >     +                               die "This kernel $type
> (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device.
> Please reduce the size of the kernel by making more of it modular."
> >
> >
> > Hmm. Again here. Multiple image types are being built. If one of them is
> too large for the device,
> > who's to say that that's the one that is going to be used ? Maybe this
> should be a warn, instead
> > of a die ?
> >
>
> Fair point. A warn is OK.
>
> >     +                       fi
> >     +               done
> >             fi
> >      }
> >      do_sizecheck[dirs] = "${B}"
> >
> >      addtask sizecheck before do_install after do_strip
> >
> >     -KERNEL_IMAGE_BASE_NAME ?=
> "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> >     +KERNEL_IMAGE_BASE_NAME ?=
> "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> >      # Don't include the DATETIME variable in the sstate package
> signatures
> >      KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> >     -KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> >     +KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
> >      MODULE_IMAGE_BASE_NAME ?=
> "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> >      MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> >      MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
> >     @@ -479,28 +539,37 @@ MODULE_TARBALL_SYMLINK_NAME ?=
> "modules-${MACHINE}.tgz"
> >      MODULE_TARBALL_DEPLOY ?= "1"
> >
> >      kernel_do_deploy() {
> >     -       install -m 0644 ${KERNEL_OUTPUT}
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> >     +       for type in ${KERNEL_IMAGETYPES} ; do
> >     +               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> >     +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
> ${DEPLOYDIR}/${base_name}.bin
> >     +       done
> >             if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
> '^CONFIG_MODULES=y$' .config); then
> >                     mkdir -p ${D}/lib
> >                     tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME}
> -C ${D} lib
> >                     ln -sf ${MODULE_TARBALL_BASE_NAME}
> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
> >             fi
> >
> >     -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
> >     -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
> >     +       for type in ${KERNEL_IMAGETYPES} ; do
> >     +               base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
> >     +               symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
> >     +               ln -sf ${base_name}.bin
> ${DEPLOYDIR}/${symlink_name}.bin
> >     +               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
> >     +       done
> >
> >             cp ${COREBASE}/meta/files/deploydir_readme.txt
> ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> >
> >             cd ${B}
> >             # Update deploy directory
> >     -       if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
> >     -               echo "Copying deploy kernel-initramfs image and
> setting up links..."
> >     -               initramfs_base_name=${INITRAMFS_BASE_NAME}
> >     -
>  initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
> >     -               install -m 0644 ${KERNEL_OUTPUT}.initramfs
> ${DEPLOYDIR}/${initramfs_base_name}.bin
> >     -               cd ${DEPLOYDIR}
> >     -               ln -sf ${initramfs_base_name}.bin
> ${initramfs_symlink_name}.bin
> >     -       fi
> >     +       for type in ${KERNEL_IMAGETYPES} ; do
> >     +               if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ];
> then
> >     +                       echo "Copying deploy ${type}
> kernel-initramfs image and setting up links..."
> >     +
>  initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
> >     +
>  initramfs_symlink_name=${type}-initramfs-${MACHINE}
> >     +                       install -m 0644
> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
> ${DEPLOYDIR}/${initramfs_base_name}.bin
> >     +                       cd ${DEPLOYDIR}
> >     +                       ln -sf ${initramfs_base_name}.bin
> ${initramfs_symlink_name}.bin
> >     +               fi
> >     +       done
> >      }
> >      do_deploy[cleandirs] = "${DEPLOYDIR}"
> >      do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> >     diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> >     index 00a69da..b3969b0 100644
> >     --- a/meta/conf/documentation.conf
> >     +++ b/meta/conf/documentation.conf
> >     @@ -246,6 +246,7 @@ KERNEL_CLASSES[doc] = "A list of classes
> defining kernel image types that kernel
> >      KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line
> arguments the OpenEmbedded build system passes on when compiling the
> kernel."
> >      KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto
> Project kernel Git repository. The metadata you add through this variable
> includes config fragments and features descriptions."
> >      KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
> usually set by the machine configuration files and defaults to 'zImage'."
> >     +KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for
> a device, usually set by the machine configuration files and defaults to
> KERNEL_IMAGETYPE."
> >      KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
> auto-loaded during boot"
> >      KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the
> build system expects to find module_conf_* values that specify
> configuration for each of the modules"
> >      KERNEL_PATH[doc] = "The location of the kernel sources. This
> variable is set to the value of the STAGING_KERNEL_DIR within the module
> class (module.bbclass)."
> >     diff --git a/meta/conf/machine/qemumips.conf
> b/meta/conf/machine/qemumips.conf
> >     index fbf8137..67ce161 100644
> >     --- a/meta/conf/machine/qemumips.conf
> >     +++ b/meta/conf/machine/qemumips.conf
> >     @@ -6,7 +6,7 @@ require conf/machine/include/qemu.inc
> >      require conf/machine/include/tune-mips32r2.inc
> >
> >      KERNEL_IMAGETYPE = "vmlinux"
> >     -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >     +KERNEL_IMAGETYPES = "vmlinux.bin"
> >
> >      SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
> >
> >     diff --git a/meta/conf/machine/qemumips64.conf
> b/meta/conf/machine/qemumips64.conf
> >     index 8c3f1fe..393212e 100644
> >     --- a/meta/conf/machine/qemumips64.conf
> >     +++ b/meta/conf/machine/qemumips64.conf
> >     @@ -6,7 +6,7 @@ require conf/machine/include/qemu.inc
> >      require conf/machine/include/tune-mips64.inc
> >
> >      KERNEL_IMAGETYPE = "vmlinux"
> >     -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >     +KERNEL_IMAGETYPES = "vmlinux.bin"
> >
> >      SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
> >
> >     diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> b/meta/recipes-kernel/linux/linux-dtb.inc
> >     index 651a19e..74f5ef8 100644
> >     --- a/meta/recipes-kernel/linux/linux-dtb.inc
> >     +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> >     @@ -34,9 +34,12 @@ do_install_append() {
> >             for DTB in ${KERNEL_DEVICETREE}; do
> >                     DTB=`normalize_dtb "${DTB}"`
> >                     DTB_BASE_NAME=`basename ${DTB} .dtb`
> >     -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME}
> | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> >     -               install -m 0644 ${DTB_PATH}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> >     +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> >     +
>  symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> >
> >
> > If there are multiple image types being built, is this valid for them
> all ?
>
> Add these links for convenience. If we give different configurations to
> different types of images in the future, as you pointed above, we might
> also need different dtb.
>

Sounds good.


>
> >
> >
> >     +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     +                       DTB_PATH=`get_real_dtb_path_in_kernel
> "${DTB}"`
> >     +                       install -m 0644 ${DTB_PATH}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> >     +               done
> >             done
> >      }
> >
> >     @@ -44,31 +47,39 @@ do_deploy_append() {
> >             for DTB in ${KERNEL_DEVICETREE}; do
> >                     DTB=`normalize_dtb "${DTB}"`
> >                     DTB_BASE_NAME=`basename ${DTB} .dtb`
> >     -               DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME}
> | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     -               DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> >     -               install -d ${DEPLOYDIR}
> >     -               install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.dtb
> >     -               ln -sf ${DTB_NAME}.dtb
> ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> >     +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> >     +                       base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> >     +
>  symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> >     +                       DTB_NAME=`echo ${base_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     +                       DTB_PATH=`get_real_dtb_path_in_kernel
> "${DTB}"`
> >     +                       install -d ${DEPLOYDIR}
> >     +                       install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.dtb
> >     +                       ln -sf ${DTB_NAME}.dtb
> ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> >     +               done
> >             done
> >      }
> >
> >      pkg_postinst_kernel-devicetree () {
> >             cd /${KERNEL_IMAGEDEST}
> >     -       for DTB in ${KERNEL_DEVICETREE}
> >     -       do
> >     -               DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
> $1}'`
> >     -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME}
> | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     -               update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> >     +       for DTB in ${KERNEL_DEVICETREE}; do
> >     +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> >     +
>  symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> >     +                       DTB_BASE_NAME=`basename ${DTB} | awk -F "."
> '{print $1}'`
> >     +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     +                       update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> >     +               done
> >             done
> >      }
> >
> >      pkg_postrm_kernel-devicetree () {
> >             cd /${KERNEL_IMAGEDEST}
> >     -       for DTB in ${KERNEL_DEVICETREE}
> >     -       do
> >     -               DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
> $1}'`
> >     -               DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME}
> | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     -               update-alternatives --remove ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> >     +       for DTB in ${KERNEL_DEVICETREE}; do
> >     +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> >     +
>  symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> >     +                       DTB_BASE_NAME=`basename ${DTB} | awk -F "."
> '{print $1}'`
> >     +                       DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >     +                       update-alternatives --remove
> ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb
> ${KERNEL_PRIORITY} || true
> >     +               done
> >             done
> >      }
> >     diff --git
> a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> >     index b319d62..e4a6f30 100644
> >     ---
> a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> >     +++
> b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/machine.conf
> >     @@ -9,7 +9,7 @@ require conf/machine/include/tune-mips32.inc
> >      MACHINE_FEATURES = "screen keyboard pci usbhost ext2 ext3 serial"
> >
> >      KERNEL_IMAGETYPE = "vmlinux"
> >     -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >     +KERNEL_IMAGETYPES = "vmlinux.bin"
> >      KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
> >
> >      {{ if kernel_choice == "custom": preferred_kernel =
> "linux-yocto-custom" }}
> >     diff --git
> a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> >     index 3afc5e0..2c2d8af 100644
> >     ---
> a/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> >     +++
> b/scripts/lib/bsp/substrate/target/arch/mips64/conf/machine/machine.conf
> >     @@ -9,7 +9,7 @@ require conf/machine/include/tune-mips64.inc
> >      MACHINE_FEATURES = "pci ext2 ext3 serial"
> >
> >      KERNEL_IMAGETYPE = "vmlinux"
> >     -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >     +KERNEL_IMAGETYPES = "vmlinux.bin"
> >
> >
> >
> > Again, why can't vmlinux just bein in KERNEL_IMAGETYPES ?
> >
>
> Discussed above.
>

Thanks for the quick follow up!

Cheers,

Bruce


>
> Thanks,
> Zhe
>
> > Bruce
> >
> >
> >      KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
> >
> >      {{ if kernel_choice == "custom": preferred_kernel =
> "linux-yocto-custom" }}
> >     diff --git
> a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> >     index 67e1cbd..7a0a4d3 100644
> >     ---
> a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> >     +++
> b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/machine.conf
> >     @@ -69,6 +69,6 @@ SERIAL_CONSOLE = "115200 ttyS0"
> >
> >      {{ if qemuarch == "mips" or qemuarch == "mips64": }}
> >      KERNEL_IMAGETYPE = "vmlinux"
> >     -KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >     +KERNEL_IMAGETYPES = "vmlinux.bin"
> >      SERIAL_CONSOLE = "115200 ttyS0"
> >      MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> >     --
> >     1.9.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org <mailto:
> Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11436c72d3ef63052c5cc6a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 22, 2016 at 3:43 AM, He Zhe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 02/19/2016 11:46 PM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Feb 19, 2016 at 4:56 AM, &lt;<a href=3D"mailto:zhe.he@windrive=
r.com">zhe.he@windriver.com</a> &lt;mailto:<a href=3D"mailto:zhe.he@windriv=
er.com">zhe.he@windriver.com</a>&gt;&gt;wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver=
.com">zhe.he@windriver.com</a> &lt;mailto:<a href=3D"mailto:zhe.he@windrive=
r.com">zhe.he@windriver.com</a>&gt;&gt;<br>
<span class=3D"">&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add KERNEL_IMAGETYPES to support building packaging=
 and installing<br>
&gt;=C2=A0 =C2=A0 =C2=A0multi types of kernel images, such as zImage uImage=
, at one time.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0KERNEL_IMAGETYPE works as before. All KERNEL_ALT_IM=
AGETYPEs are<br>
&gt;=C2=A0 =C2=A0 =C2=A0replaced by KERNEL_IMAGETYPES.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I see that you have updated layers/configs with the new variable, but =
obviously you can&#39;t see all the<br>
&gt; layers that may be using that old variable.<br>
&gt;<br>
&gt; Isn&#39;t it possible to have a python routine that detects the old AL=
T_IMAGETYPE variable and<br>
&gt; assigns it to the new one (if it isn&#39;t already set) ? Sort of like=
 how distro features/features backfill<br>
&gt; work ?<br>
&gt;<br>
<br>
</span>Thanks for careful review.<br>
<br>
OK. I&#39;ll try to add such function.<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fixes [YOCTO #6945].<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@=
windriver.com">zhe.he@windriver.com</a> &lt;mailto:<a href=3D"mailto:zhe.he=
@windriver.com">zhe.he@windriver.com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 documentation/ref-manual/ref-variables.xml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta-yocto-bsp/conf/machine/edgerouter.conf=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 ++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 171 ++++++=
+++++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/conf/machine/qemumips.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/conf/machine/qemumips64.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 49 +++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .../target/arch/mips/conf/machine/machine.conf=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .../target/arch/mips64/conf/machine/machine.conf=
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .../target/arch/qemu/conf/machine/machine.conf=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 13 files changed, 214 insertions(+), 115 deletions=
(-)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/documentation/ref-manual/ref-variables=
.xml b/documentation/ref-manual/ref-variables.xml<br>
&gt;=C2=A0 =C2=A0 =C2=A0index a76a8c2..a8e4fd8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/documentation/ref-manual/ref-variables.xml<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/documentation/ref-manual/ref-variables.xml<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -6417,14 +6417,14 @@ recipes-graphics/xorg-font/=
font-alias_1.0.3.bb:PR =3D &quot;${INC_PR}.3&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glo=
ssdef&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glossentry&gt;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossentry id=3D&#=
39;var-KERNEL_ALT_IMAGETYPE&#39;&gt;&lt;glossterm&gt;KERNEL_ALT_IMAGETYPE&l=
t;/glossterm&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossentry id=3D&#=
39;var-KERNEL_IMAGETYPES&#39;&gt;&lt;glossterm&gt;KERNEL_IMAGETYPES&lt;/glo=
ssterm&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;info=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 KERNEL_ALT_IMAGETYPE[doc] =3D &quot;Specifies an alternate kernel im=
age type for creation.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 KERNEL_IMAGETYPES[doc] =3D &quot;Specifies alternate kernel image ty=
pes for creation.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/inf=
o&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glos=
sdef&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;para role=3D&quot;glossdeffirst&quot;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;!--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &lt;para role=3D&quot;glossdeffirst&quot;&gt;&lt;imagedata fi=
leref=3D&quot;figures/define-generic.png&quot; /&gt; --&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Specifies an alternate kernel image type for creation =
in<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Specifies alternate kernel image types for creation in=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 addition to the kernel image type specified using the<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;link linkend=3D&#39;var-KERNEL_IMAGETYPE&#39;&gt;&=
lt;filename&gt;KERNEL_IMAGETYPE&lt;/filename&gt;&lt;/link&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 variable.<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -6612,8 +6612,8 @@ recipes-graphics/xorg-font/fo=
nt-alias_1.0.3.bb:PR =3D &quot;${INC_PR}.3&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;/para&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;para&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 If you want to build an alternate kernel image type, u=
se the<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;link linkend=3D&#39;var-KERNEL_ALT_IMAGETYPE&#39;&=
gt;&lt;filename&gt;KERNEL_ALT_IMAGETYPE&lt;/filename&gt;&lt;/link&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 If you want to build alternate kernel image types, use=
 the<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;link linkend=3D&#39;var-KERNEL_IMAGETYPES&#39;&gt;=
&lt;filename&gt;KERNEL_IMAGETYPES&lt;/filename&gt;&lt;/link&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 variable.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;/para&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glo=
ssdef&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-yocto-bsp/conf/machine/edgerouter=
.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 476e690..affd568 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-yocto-bsp/conf/machine/edgerouter.conf<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -7,7 +7,7 @@ require conf/machine/include/tune-m=
ips64.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MACHINE_FEATURES =3D &quot;pci ext2 ext3 serial&qu=
ot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
&gt;<br>
&gt;<br>
&gt; This now reads a bit ... odd (for back of a better description). I&#39=
;m concerned that it will cause<br>
&gt; confusion, there are two variables:<br>
&gt;<br>
&gt; KERNEL_IMAGETYPE and KERNEL_IMAGETYPES ..<br>
&gt;<br>
&gt; They are very close in name, and just reading the variable doesn&#39;t=
 really tell us why<br>
&gt; we&#39;d set one and not the other. The old &quot;ALT&quot; made it mo=
re obvious.<br>
&gt;<br>
<br>
</div></div>But changing original KERNEL_ALT_IMAGETYPE to a list or using K=
ERNEL_ALT_IMAGETYPES<br>
in addition to KERNEL_ALT_IMAGETYPE also seems not very clear. Below is the=
 previous<br>
talk with Richard Purdie and Christopher Larson.<br></blockquote><div><br><=
/div><div><br></div><div>Aha. I didn&#39;t recall that previous discussion.=
 Clearly there&#39;s no &quot;one good way&quot; to name</div><div>these to=
 avoid some confusion, so I&#39;d defer to Richard&#39;s opinion on the nam=
ing.</div><div><br></div><div>That being said, I do wish that the names con=
veyed why there was a variable that</div><div>took a single image type, and=
 then another one that took a list, and that the lists</div><div>were non o=
verlapping.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt;&gt;&gt;&gt; Question, why not add KERNEL_IMAGETYPES, and make KERN=
EL_IMAGETYPE equal to your new KERNEL_IMAGETYPE_0?(Christopher)<br>
&gt;&gt;&gt;&gt; Adding a new KERNEL_IMAGETYPES will also work. But it shou=
ld be better(me)<br>
&gt;&gt;&gt;&gt; not to change the name of KERNEL_IMAGETYPE, so that those =
who have<br>
&gt;&gt;&gt;&gt; used it don&#39;t have to change their code.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thank you for reviewing.<br>
&gt;&gt;&gt; I have to agree with Chris here, keeping KERNEL_IMAGETYPE as u=
sed today(Richard)<br>
&gt;&gt;&gt; and equivalent to KERNEL_IMAGETYPE_0 and adding KERNEL_IMAGETY=
PES does<br>
&gt;&gt;&gt; seem like a cleaner way to implement this.<br>
&gt;&gt;<br>
&gt;&gt; But it might mean we are going to check both KERNEL_IMAGETYPE and =
KERNEL_IMAGETYPES(me)<br>
&gt;&gt; to generate final image type list. Is that OK?<br>
&gt;<br>
&gt;Well, in some places you will use one and in some places you&#39;ll use=
 the(Richard)<br>
&gt;other, that is unavoidable.<br>
&gt;<br>
&gt;I much prefer &quot;KERNEL_IMAGETYPE and KERNEL_IMAGETYPES&quot; to<br>
&gt;&quot;KERNEL_IMAGETYPE_0 and KERNEL_IMAGETYPE&quot; as variable names t=
hough.<br>
&gt;<br>
&gt;Cheers,<br>
<span class=3D""><br>
&gt; But from the patch, KERNEL_IMAGETYPE isn&#39;t used, so does it have t=
o be set at<br>
&gt; all in these .conf files ? .. or maybe I missed where it is still used=
 other than for<br>
&gt; compatibility.<br>
&gt;<br>
<br>
</span>Not every KERNEL_IMAGETYPE should be replaced by KERNEL_IMAGETYPES. =
Only one<br>
type of kernel image is necessary for below cases.Right?<br>
<br>
Yes, more explanations should be added to commit message and code comments.=
<br>
<br>
1) boot fs image<br>
meta/classes/bootimg.bbclass:50:KERNEL_IMAGETYPE ??=3D &quot;bzImage&quot;<=
br>
meta/classes/bootimg.bbclass:72:=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644=
 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${DEST}/vmlinuz<br>
meta/classes/image_types.bbclass:109:ELF_KERNEL ?=3D &quot;${STAGING_DIR_HO=
ST}/usr/src/kernel/${KERNEL_IMAGETYPE}&quot;<br>
<br>
2) test fs image<br>
meta/lib/oeqa/controllers/masterimage.py:55:=C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.kernel =3D os.path.join(d.getVar(&quot;DEPLOY_DIR_IMAGE&quot;, True), d.g=
etVar(&quot;KERNEL_IMAGETYPE&quot;, False) + &#39;-&#39; + d.getVar(&#39;MA=
CHINE&#39;, False) + &#39;.bin&#39;)<br>
meta/lib/oeqa/targetcontrol.py:126:=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kernel =
=3D os.path.join(d.getVar(&quot;DEPLOY_DIR_IMAGE&quot;, True), d.getVar(&qu=
ot;KERNEL_IMAGETYPE&quot;, False) + &#39;-&#39; + d.getVar(&#39;MACHINE&#39=
;, False) + &#39;.bin&#39;)<br>
<div><div class=3D"h5"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=C2=A0 =3D &quot;=
.comment&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux=
-yocto&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/kernel-fitimage.bbclass b=
/meta/classes/kernel-fitimage.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index f1b409c..51df19d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/kernel-fitimage.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/kernel-fitimage.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,8 +1,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 inherit kernel-uboot<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 kerneltype =3D d.getVar(&#39;KERNEL_=
IMAGETYPE&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 if kerneltype =3D=3D &#39;fitImage&#=
39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 kerneltypes =3D d.getVar(&#39;KERNEL=
_IMAGETYPES&#39;, True) or &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if &#39;fitImage&#39; in kerneltypes=
.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D d.getVar(&=
quot;DEPENDS&quot;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u=
-boot-mkimage-native dtc-native&quot; % depends<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS=
&quot;, depends)<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,7 +10,9 @@ python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Override KERNEL_IMAGE=
TYPE_FOR_MAKE variable, which is internal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# to kernel.bbclass . W=
e have to override it, since we pack zImage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# (at least for now) in=
to the fitImage .<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;KERNEL_=
IMAGETYPE_FOR_MAKE&quot;, &quot;zImage&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeformake =3D d.getV=
ar(&quot;KERNEL_IMAGETYPE_FOR_MAKE&quot;, True) or &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;fitImage&#39; =
in typeformake.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar=
(&#39;KERNEL_IMAGETYPE_FOR_MAKE&#39;, typeformake.replace(&#39;fitImage&#39=
;, &#39;zImage&#39;))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D d.getVar(&#3=
9;INITRAMFS_IMAGE&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if image:<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -154,7 +156,7 @@ EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_assemble_fitimage() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL=
_IMAGETYPE}&quot; =3D &quot;xfitImage&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${KERNEL_IMAGET=
YPES} | grep -Pq &quot;\bfitImage\b&quot;; then<br>
&gt;<br>
&gt;<br>
&gt; Not that it really matters, but grep -w would work here as well, and m=
ight read bit simpler.<br>
<br>
</div></div>OK. I&#39;ll replace it with &quot;-w&quot;<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0kernelcount=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dtbcount=3D&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rm -f fit-image.its<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -217,14 +219,14 @@ addtask assemble_fitimage bef=
ore do_install after do_compile<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel_do_deploy_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Update deploy directo=
ry<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL=
_IMAGETYPE}&quot; =3D &quot;xfitImage&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${KERNEL_IMAGET=
YPES} | grep -Pq &quot;\bfitImage\b&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cd ${B}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;Copying fit-image.its source file...&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0its_base_name=3D&quot;${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-=
${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0its_symlink_name=3D${KERNEL_IMAGETYPE}-its-${MACHINE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0its_base_name=3D&quot;fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0its_symlink_name=3DfitImage-its-${MACHINE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0linux_bin_base_name=3D&quot;${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}=
-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0linux_bin_symlink_name=3D${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0linux_bin_base_name=3D&quot;fitImage-linux.bin-${PV}-${PR}-${MACHINE}=
-${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0linux_bin_symlink_name=3DfitImage-linux.bin-${MACHINE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cd ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/kernel-grub.bbclass b/met=
a/classes/kernel-grub.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index a63f482..f7dcc07 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/kernel-grub.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/kernel-grub.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,41 +10,44 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0updates the new kernel as the boot p=
riority.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-pkg_preinst_kernel-image_append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+python __anonymous () {<br>
&gt;<br>
&gt;<br>
&gt; Maybe it is just the patch context making me misread this, but can you=
 elaborate on<br>
&gt; what is changing here ?<br>
&gt;<br>
<br>
</div></div>Here I change the two variables, pkg_preinst_kernel-image_appen=
d and<br>
pkg_postinst_kernel-image_prepend to two strings, and change all &quot;${KE=
RNEL_IMAGETYPE}&quot;<br>
in the strings to &quot;KERNEL_IMAGETYPE&quot; to avoid being expanded in p=
arsing time. So that I can<br>
replace KERNEL_IMAGETYPEs to every single image type in the following loops=
, in which the<br>
two original variables&#39; name are constructed and their values are set.<=
br>
<br>
According to bitbake user manual, __anonymous functions are executed during=
 parsing. It<br>
should be OK for the following references. I&#39;ve verified this by buildi=
ng an image with<br>
kernel-grub.bbclass.<br></blockquote><div><br></div><div><br></div><div>Tha=
nks. That clarifies things, I know there have been some variable expansion =
changes</div><div>recently in bitbake, and I wanted to make sure they have =
been taken into account.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<span class=3D""><br>
&gt; Is it the old preinst is being replaced by anonymous python that gener=
ates the preinst as<br>
&gt; a string, and that this injected into the package via the python ? Are=
 we guaranteed<br>
&gt; to run the anonymous python at the right time ? .. I&#39;ve been burne=
d by that before, so<br>
&gt; I wanted to check that it has been considered.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 preinst =3D &#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Parsing confliction<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -f &quot;$D/boot/grub=
/menu.list&quot; ] &amp;&amp; grubcfg=3D&quot;$D/boot/grub/menu.list&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -f &quot;$D/boot/grub=
/grub.cfg&quot; ] &amp;&amp; grubcfg=3D&quot;$D/boot/grub/grub.cfg&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$grubcfg&=
quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Dereference symlink to avoid confliction with new kernel name.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if grep -q &quot;/${KERNEL_IMAGETYPE} \+root=3D&quot; $grubcfg; then<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -L &quot;$D/boot/${KERNEL_IMAGETYPE}=
&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D`rea=
lpath $D/boot/${KERNEL_IMAGETYPE} 2&gt;/dev/null`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if grep -q &quot;/KERNEL_IMAGETYPE \+root=3D&quot; $grubcfg; then<br>
&gt;<br>
&gt;<br>
&gt; It&#39;s lines like these that made me ask my question above. This loo=
ks like its checking the<br>
&gt; grubcfg on disk. Is that same grep going to work in this anonymous pyt=
hon .. or maybe this<br>
&gt; isn&#39;t being run now, and only when the package is being installed =
? I&#39;m most likely missing<br>
&gt; something.<br>
<br>
</span>No, it&#39;s not running, it&#39;s in the middle of the string.<br><=
/blockquote><div><br></div><div><br></div><div>Hmm. Indeed, the way that ne=
sted strings are valid is a bit confusing, but that&#39;s</div><div>just my=
 background not being in python chowing through!</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -L &quot;$D/boot/KERNEL_IMAGETYPE&qu=
ot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D`rea=
lpath $D/boot/KERNEL_IMAGETYPE 2&gt;/dev/null`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot=
;$D$kimage&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sed -i &quot;s:${KERNEL_IMAGETYPE} \+root=3D:${kimage##*/}=
 root=3D:&quot; $grubcfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sed -i &quot;s:KERNEL_IMAGETYPE \+root=3D:${kimage##*/} ro=
ot=3D:&quot; $grubcfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Rename old kernel if it conflicts with new kernel name.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if grep -q &quot;/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=3D&quo=
t; $grubcfg; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;$D/boot/${KERNEL_IMAGETYPE}=
-${KERNEL_VERSION}&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if grep -q &quot;/KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=3D&quot; =
$grubcfg; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;$D/boot/KERNEL_IMAGETYPE-${=
KERNEL_VERSION}&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timestamp=3D`=
date +%s`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D&quo=
t;$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;=
s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=3D:${kimage##*/} root=3D:&qu=
ot; $grubcfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$D/b=
oot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}&quot; &quot;$kimage&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kimage=3D&quo=
t;$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}-$timestamp-back&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;=
s:KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root=3D:${kimage##*/} root=3D:&quot;=
 $grubcfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$D/b=
oot/KERNEL_IMAGETYPE-${KERNEL_VERSION}&quot; &quot;$kimage&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+&#39;&#39;&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-pkg_postinst_kernel-image_prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 postinst =3D &#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_new_grub_cfg() {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0grubcfg=3D&quot;$1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0old_image=3D&quot;$2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0title=3D&quot;Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0title=3D&quot;Update KERNEL_IMAGETYPE-${KERNEL_VERSION}-${PV}&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ &quot;${grubcfg##*/}&quot; =3D &quot;grub.cfg&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs=3D`grep &quot; *linux \+[^ ]\+ \+r=
oot=3D&quot; $grubcfg -m 1 | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#=
${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#&quot;`<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#=
${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#&quot;`<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;menuentry \&quot;$title\&quot;=
 {&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 =C2=A0 set root=3D(hd0,=
1)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend=
 () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0elif [ &quot;${grubcfg##*/}&quot; =3D &quot;menu.list&quot; ]; then<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs=3D`grep &quot;kernel \+[^ ]\+ \+ro=
ot=3D&quot; $grubcfg -m 1 | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#=
${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#&quot;`<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &quot;s#=
${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#&quot;`<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;default 0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;timeout 30&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -87,5 +90,16 @@ pkg_postinst_kernel-image_prepen=
d () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mv $grubcfgtmp $grubcfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;Caution! Update kernel may affect kernel-module!&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+&#39;&#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 imagetypes =3D d.getVar(&#39;KERNEL_=
IMAGETYPES&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 imagetypes =3D re.sub(r&#39;\.gz$&#3=
9;, &#39;&#39;, imagetypes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for type in imagetypes.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D type.low=
er()<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 preinst_append =3D pre=
inst.replace(&#39;KERNEL_IMAGETYPE&#39;, type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst_prepend =3D p=
ostinst.replace(&#39;KERNEL_IMAGETYPE&#39;, type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_prei=
nst_kernel-image-&#39; + typelower + &#39;_append&#39;, preinst_append)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_post=
inst_kernel-image-&#39; + typelower + &#39;_prepend&#39;, postinst_prepend)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/kernel-uimage.bbclass b/m=
eta/classes/kernel-uimage.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index f73965b..a238ce4 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/kernel-uimage.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/kernel-uimage.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,23 +1,25 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 inherit kernel-uboot<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 kerneltype =3D d.getVar(&#39;KERNEL_=
IMAGETYPE&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 if kerneltype =3D=3D &#39;uImage&#39=
;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if &quot;uImage&quot; in (d.getVar(&=
#39;KERNEL_IMAGETYPES&#39;, True) or &quot;&quot;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D d.getVar(&=
quot;DEPENDS&quot;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u=
-boot-mkimage-native&quot; % depends<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS=
&quot;, depends)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Override KERNEL_IMAGE=
TYPE_FOR_MAKE variable, which is internal<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0# to kernel.bbclass . W=
e override the variable here, since we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0# to build uImage using=
 the kernel build system if and only if<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0# KEEPUIMAGE =3D=3D yes=
. Otherwise, we pack compressed vmlinux into<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0# the uImage .<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;KEEPU=
IMAGE&quot;, True) !=3D &#39;yes&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar=
(&quot;KERNEL_IMAGETYPE_FOR_MAKE&quot;, &quot;zImage&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Override KERNEL_IMAG=
ETYPE_FOR_MAKE variable, which is internal<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to kernel.bbclass . =
We override the variable here, since we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to build uImage usin=
g the kernel build system if and only if<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # KEEPUIMAGE =3D=3D ye=
s. Otherwise, we pack compressed vmlinux into<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the uImage .<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;KEEP=
UIMAGE&quot;, True) !=3D &#39;yes&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typeform=
ake =3D d.getVar(&quot;KERNEL_IMAGETYPE_FOR_MAKE&quot;, True) or &quot;&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot=
;uImage&quot; in typeformake.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 typeformake.replace(&#39;uImage&#39;, &#39;zImage&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar=
(&#39;KERNEL_IMAGETYPE_FOR_MAKE&#39;, typeformake)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_uboot_mkimage() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL=
_IMAGETYPE}&quot; =3D &quot;xuImage&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo &quot;${KERNEL_=
IMAGETYPES}&quot; | grep -Pq &quot;\buImage\b&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if test &quot;x${KEEPUIMAGE}&quot; !=3D &quot;xyes&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uboot_prep_kimage<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/kernel.bbclass b/meta/cla=
sses/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index c3eab50..6db2e2e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -16,12 +16,48 @@ INITRAMFS_IMAGE ?=3D &quot;&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 INITRAMFS_TASK ?=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 INITRAMFS_IMAGE_BUNDLE ?=3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# KERNEL_VERSION is extracted from source code. It=
 is evaluated as<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# None for the first parsing, since the code has n=
ot been fetched.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# After the code is fetched, it will be evaluated =
as real version<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# number and cause kernel to be rebuilt. To avoid =
this, make<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME =
depend on<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# LINUX_VERSION which is a constant.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_VERSION_NAME =3D &quot;${@d.getVar(&#39;KER=
NEL_VERSION&#39;, True) or &quot;&quot;}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_VERSION_NAME[vardepvalue] =3D &quot;${LINUX=
_VERSION}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_VERSION_PKG_NAME =3D &quot;${@legitimize_pa=
ckage_name(d.getVar(&#39;KERNEL_VERSION&#39;, True))}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_VERSION_PKG_NAME[vardepvalue] =3D &quot;${L=
INUX_VERSION}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 kerneltype =3D d.getVar(&#39;KERNEL_=
IMAGETYPE&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 type =3D d.getVar(&#39;KERNEL_IMAGET=
YPE&#39;, True) or &quot;&quot;<br>
&gt;<br>
&gt;<br>
&gt; Aha. Here is that use of KERNEL_IMAGETYPE. Like I mentioned for the al=
t image type, can&#39;t<br>
&gt; this existing variable be checked, and then added to KERNEL_IMAGE_TYPE=
S in some<br>
&gt; python code ? That would simplify the code here, and also not require =
the two variables to<br>
&gt; be kept around.<br>
<br>
</div></div>See above for explanation for KERNEL_IMAGETYPES.<br></blockquot=
e><div><br></div><div>True. But I still think that we could allow the old v=
ariable to be set, and have it joined</div><div>into a single variable by p=
ython code. That would mean you&#39;d only need to check</div><div>one vari=
able, and users can continue to set the existing one. Something to think ab=
out.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 types =3D d.getVar(&#39;KERNEL_IMAGE=
TYPES&#39;, True) or &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if type not in types.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 types =3D (type + &#39=
; &#39; + types).strip()<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KERNEL_I=
MAGETYPES&#39;, types)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 typeformake =3D re.sub(r&#39;\.gz&#3=
9;, &#39;&#39;, types)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 d.setVar(&#39;KERNEL_IMAGETYPE_FOR_M=
AKE&#39;, typeformake)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for type in typeformake.split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D type.low=
er()<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;PACKA=
GES&#39;, &#39; &#39; + &#39;kernel-image-&#39; + typelower)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_ke=
rnel-image-&#39; + typelower, &#39;/boot/&#39; + type + &#39;*&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPE=
NDS_kernel-image&#39;, &#39; &#39; + &#39;kernel-image-&#39; + typelower)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PKG_kern=
el-image-&#39; + typelower, &#39;kernel-image-&#39; + typelower + &#39;-${K=
ERNEL_VERSION_PKG_NAME}&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EM=
PTY_kernel-image-&#39; + typelower, &#39;1&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 d.setVar(&quot;KERNEL_IMAGETYPE_FOR_=
MAKE&quot;, re.sub(r&#39;\.gz$&#39;, &#39;&#39;, kerneltype))<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imagedest =3D d.getVar=
(&#39;KERNEL_IMAGEDEST&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priority =3D d.getVar(=
&#39;KERNEL_PRIORITY&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst =3D &#39;#!/b=
in/sh\n&#39; + &#39;update-alternatives --install /&#39; + imagedest + &#39=
;/&#39; + type + &#39; &#39; + type + &#39; &#39; + &#39;/&#39; + imagedest=
 + &#39;/&#39; + type + &#39;-${KERNEL_VERSION_NAME} &#39; + priority + &#3=
9; || true&#39; + &#39;\n&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_post=
inst_kernel-image-&#39; + typelower, postinst)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postrm =3D &#39;#!/bin=
/sh\n&#39; + &#39;update-alternatives --remove&#39; + &#39; &#39; + type + =
&#39; &#39; + type + &#39;-${KERNEL_VERSION_NAME} || true&#39; + &#39;\n&#3=
9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_post=
rm_kernel-image-&#39; + typelower, postrm)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D d.getVar(&#39;INITRAMFS_IM=
AGE&#39;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if image:<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -92,8 +128,8 @@ KERNEL_PRIORITY ?=3D &quot;${@in=
t(d.getVar(&#39;PV&#39;,1).split(&#39;-&#39;)[0].split(&#39;+&#39;)[0].spli=
t(&#39;.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_RELEASE ?=3D &quot;${KERNEL_VERSION}&quot;<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# Where built kernel lies in the kernel tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_OUTPUT ?=3D &quot;arch/${ARCH}/boot/${KERNE=
L_IMAGETYPE}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# The directory where built kernel lies in the ker=
nel tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_OUTPUT_DIR ?=3D &quot;arch/${ARCH}/boot&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGEDEST =3D &quot;boot&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -119,8 +155,6 @@ KERNEL_EXTRA_ARGS ?=3D &quot;&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # We don&#39;t want to override kernel Makefile va=
riables from the environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EXTRA_OEMAKE =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Define where the kernel headers are installed on=
 the target as well as where<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # they are staged.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_SRC_PATH =3D &quot;/usr/src/kernel&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -166,23 +200,48 @@ copy_initramfs() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Finished cop=
y of initramfs into ./usr&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-INITRAMFS_BASE_NAME =3D &quot;${KERNEL_IMAGETYPE}-=
initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+INITRAMFS_BASE_NAME =3D &quot;initramfs-${PV}-${PR=
}-${MACHINE}-${DATETIME}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 INITRAMFS_BASE_NAME[vardepsexclude] =3D &quot;DATE=
TIME&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_bundle_initramfs () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${INITR=
AMFS_IMAGE}&quot; -a x&quot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;Creating a kernel image with a bundled initramfs...&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0copy_initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ -e ${KERNEL_OUTPUT} ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.b=
ak<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Backuping kernel image relies on its type(regular file or symbolic =
link)<br>
&gt;<br>
&gt;<br>
&gt; s/Backuping/Backing up/<br>
<br>
</div></div>I&#39;ll correct it.<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tmp_path=3D&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; th=
en<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkpath=3D`r=
eadlink -n ${KERNEL_OUTPUT_DIR}/$type`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpath=3D`r=
eadlink -fn ${KERNEL_OUTPUT_DIR}/$type`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpa=
th $realpath.bak<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D$t=
mp_path&quot; &quot;$type&quot;#&quot;$linkpath&quot;#&quot;$realpath<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; t=
hen<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNE=
L_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.bak<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D$t=
mp_path&quot; &quot;$type&quot;##&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS=
_IMAGE}-${MACHINE}.cpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0kernel_do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Restoring kernel image<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for tp in $tmp_path ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type=3D`echo $tp|cut -d &quot;#&quot; -f =
1`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkpath=3D`echo $tp|cut -d &quot;#&quot;=
 -f 2`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpath=3D`echo $tp|cut -d &quot;#&quot;=
 -f 3`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$realpath&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpa=
th $realpath.initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpa=
th.bak $realpath<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}/${KER=
NEL_OUTPUT_DIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $linkp=
ath.initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNE=
L_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNE=
L_OUTPUT_DIR}/$type.bak ${KERNEL_OUTPUT_DIR}/$type<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Update install area<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;There is kernel image bundled with initramfs: ${B}/${KERNE=
L_OUTPUT}.initramfs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IM=
AGETYPE}-initramfs-${MACHINE}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;${B}/${KERNEL_OUTPUT}.initramfs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;There is kernel image bundled =
with initramfs: ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}=
/$type.initramfs ${D}/boot/$type-initramfs-${MACHINE}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${B}/${KERNEL_OUTPUT_DIR}/$typ=
e.initramfs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -207,10 +266,15 @@ kernel_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0copy_initramfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS=
_IMAGE}-${MACHINE}.cpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMA=
GETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC=3D&quot;${KERNEL_CC}&quot; LD=
=3D&quot;${KERNEL_LD}&quot; ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${KERNEL_=
IMAGETYPE_FOR_MAKE}.gz&quot; =3D &quot;${KERNEL_IMAGETYPE}&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0gzip -9c &lt; &quot;${KERNEL_IMAGETYPE_FOR_MAKE}&quot; &gt; &quot;${K=
ERNEL_OUTPUT}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake ${KERNEL_IMA=
GETYPE_FOR_MAKE} CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot=
; ${KERNEL_EXTRA_ARGS} $use_alternate_initrd<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; This is probably something that is worth mentioning in the top of the =
commit message. You are<br>
&gt; building multiple kernel image types, but they are all currently using=
 the same configuration.<br>
&gt;<br>
&gt; If the make invokations were split into separate calls per image type,=
 we could conceivably<br>
&gt; extend this to generate and use a separate config int he future.<br>
&gt;<br>
<br>
</div></div>OK. Let me test if there is any side effect after putting this =
make in a type loop.<br>
<div><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for typeformake in ${KE=
RNEL_IMAGETYPE_FOR_MAKE} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${typeformake}.gz&quot; =3D=
 &quot;${type}&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip -9c &lt;=
 &quot;${typeformake}&quot; &gt; &quot;${KERNEL_OUTPUT_DIR}/${type}&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_compile_kernelmodules() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -251,7 +315,9 @@ kernel_do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${KERNE=
L_IMAGEDEST}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/boot<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KERNE=
L_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IM=
AGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}=
/${type}-${KERNEL_VERSION}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 System.=
map ${D}/boot/System.map-${KERNEL_VERSION}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 .config=
 ${D}/boot/config-${KERNEL_VERSION}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 vmlinux=
 ${D}/boot/vmlinux-${KERNEL_VERSION}<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -365,12 +431,12 @@ EXPORT_FUNCTIONS do_compile d=
o_install do_configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGES =3D &quot;kernel kernel-base kernel-vmlin=
ux kernel-image kernel-dev kernel-modules&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FILES_${PN} =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FILES_kernel-base =3D &quot;/lib/modules/${KERNEL_=
VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-FILES_kernel-image =3D &quot;/boot/${KERNEL_IMAGET=
YPE}*&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+FILES_kernel-image =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FILES_kernel-dev =3D &quot;/boot/System.map* /boot=
/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VER=
SION}/build&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FILES_kernel-vmlinux =3D &quot;/boot/vmlinux*&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FILES_kernel-modules =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RDEPENDS_kernel =3D &quot;kernel-base&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# Allow machines to override this dependency if ke=
rnel image files are<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# Allow machines to override this dependency if ke=
rnel image files are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # not wanted in images as standard<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RDEPENDS_kernel-base ?=3D &quot;kernel-image&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PKG_kernel-image =3D &quot;kernel-image-${@legitim=
ize_package_name(&#39;${KERNEL_VERSION}&#39;)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -394,14 +460,6 @@ pkg_postinst_kernel-base () {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-pkg_postinst_kernel-image () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --i=
nstall /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERN=
EL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || t=
rue<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-pkg_postrm_kernel-image () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --r=
emove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_p=
ackages &quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python split_kernel_packages () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -422,13 +480,13 @@ do_kernel_link_vmlinux() {<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_strip() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${KERNEL_=
IMAGE_STRIP_EXTRA_SECTIONS}&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ &quot;${KERNEL_IMAGETYPE}&quot; !=3D &quot;vmlinux&quot; ]; then=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;image type will not be strip=
ped (not supported): ${KERNEL_IMAGETYPE}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if ! (echo &quot;${KERNEL_IMAGETYPES}&quot; | grep -q &quot;vmlinux&q=
uot;); then<br>
&gt;<br>
&gt;<br>
&gt; You had used the \bfitImage\b, but here you don&#39;t .. grep -w could=
 work for them all.<br>
<br>
</div></div>I&#39;ll correct it.<br>
<span class=3D""><br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;image type(s) will not be st=
ripped (not supported): ${KERNEL_IMAGETYPES}&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; But on another note. Is it really right to say that none of the images=
 will be stripped if you<br>
&gt; find vmlinux anywhere in the image type list ?<br>
&gt;<br>
<br>
</span>Not clear what you mean here.<br></blockquote><div><br></div><div><b=
r></div><div>Consider that there are a list of image types in KERNEL_IMAGET=
YPES, and most of them</div><div>could be stripped, but that list contains =
vmlinux. The test above will avoid stripping any</div><div>of them, where t=
he intent was really to not strip vmlinux, and only vmlinux.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cd ${B}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0headers=3D`&quot;$CROSS_COMPILE&quot;readelf -S ${KERNEL_OUTPUT} | \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0headers=3D`&quot;$CROSS_COMPILE&quot;readelf -S ${KERNEL_OUTPUT_DIR}/=
vmlinux | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep &quot;^ \{1,\}\[[0-9 ]\{1,\}\=
] [^ ]&quot; | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &quot;s/^ \{1,\}\[[0-9 ]\{1,\}=
\] //&quot; | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gawk &#39;{print $1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -438,7 +496,7 @@ do_strip() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;=
Section not found: $str&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$CROSS_COMPILE&quot;strip -s -R $st=
r ${KERNEL_OUTPUT}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$CROSS_COMPILE&quot;strip -s -R $st=
r ${KERNEL_OUTPUT_DIR}/vmlinux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}; done<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bbnote &quot;KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sect=
ions:&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -457,20 +515,22 @@ do_sizecheck() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ -n &quot;$invalid&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;Invalid KERNEL_IMAGE_MAXSIZE: $=
{KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size=3D`du -ks ${B}/${KERNEL_OUTPUT} | awk &#39;{ print $1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;This kernel (size=3D$size(K) &g=
t; ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce th=
e size of the kernel by making more of it modular.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=3D`du -ks ${B}/${KERNEL_OUTPUT_DIR}/=
$type | awk &#39;{print $1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ];=
 then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;Thi=
s kernel $type (size=3D$size(K) &gt; ${KERNEL_IMAGE_MAXSIZE}(K)) is too big=
 for your device. Please reduce the size of the kernel by making more of it=
 modular.&quot;<br>
&gt;<br>
&gt;<br>
&gt; Hmm. Again here. Multiple image types are being built. If one of them =
is too large for the device,<br>
&gt; who&#39;s to say that that&#39;s the one that is going to be used ? Ma=
ybe this should be a warn, instead<br>
&gt; of a die ?<br>
&gt;<br>
<br>
</div></div>Fair point. A warn is OK.<br>
<div><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_sizecheck[dirs] =3D &quot;${B}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 addtask sizecheck before do_install after do_strip=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_IMAGE_BASE_NAME ?=3D &quot;${KERNEL_IMAGETY=
PE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGE_BASE_NAME ?=3D &quot;${PKGE}-${PKGV}-=
${PKGR}-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Don&#39;t include the DATETIME variable in the s=
state package signatures<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;D=
ATETIME&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${KERNEL_IMAG=
ETYPE}-${MACHINE}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${MACHINE}&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MODULE_IMAGE_BASE_NAME ?=3D &quot;modules-${PKGE}-=
${PKGV}-${PKGR}-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;D=
ATETIME&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MODULE_TARBALL_BASE_NAME ?=3D &quot;${MODULE_IMAGE=
_BASE_NAME}.tgz&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -479,28 +539,37 @@ MODULE_TARBALL_SYMLINK_NAME ?=
=3D &quot;modules-${MACHINE}.tgz&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MODULE_TARBALL_DEPLOY ?=3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel_do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KERNE=
L_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IM=
AGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0base_name=3D${type}-${KERNEL_IMAGE_BASE_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${DEPLOYDIR}/${base_name=
}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${MODULE_TARBALL_D=
EPLOY} =3D &quot;1&quot; ] &amp;&amp; (grep -q -i -e &#39;^CONFIG_MODULES=
=3Dy$&#39; .config); then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mkdir -p ${D}/lib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYML=
INK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${KERNEL_IMAGE_B=
ASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${KERNEL_IMAGE_B=
ASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IM=
AGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0base_name=3D${type}-${KERNEL_IMAGE_BASE_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0symlink_name=3D${type}-${KERNEL_IMAGE_SYMLINK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${COREBASE}/meta/fil=
es/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_D=
IRECTORY.txt<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Update deploy directo=
ry<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e &quot;${KERNEL_=
OUTPUT}.initramfs&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;Copying deploy kernel-initramfs image and setting up links=
...&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0initramfs_base_name=3D${INITRAMFS_BASE_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0initramfs_symlink_name=3D${KERNEL_IMAGETYPE}-initramfs-${MACHINE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_b=
ase_name}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cd ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNEL_IM=
AGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ -e &quot;${KERNEL_OUTPUT_DIR}/${type}.initramfs&quot; ]; then<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Copying deploy ${type} kernel-=
initramfs image and setting up links...&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_base_name=3D${type}-${INITRAMFS=
_BASE_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_symlink_name=3D${type}-initramf=
s-${MACHINE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${KERNEL_OUTPUT_DIR}/${ty=
pe}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${initramfs_base_name}.bin ${initr=
amfs_symlink_name}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_deploy[cleandirs] =3D &quot;${DEPLOYDIR}&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 do_deploy[dirs] =3D &quot;${DEPLOYDIR} ${B}&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/conf/documentation.conf b/meta/co=
nf/documentation.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 00a69da..b3969b0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/conf/documentation.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/conf/documentation.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -246,6 +246,7 @@ KERNEL_CLASSES[doc] =3D &quot;A=
 list of classes defining kernel image types that kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_EXTRA_ARGS[doc] =3D &quot;Specifies additio=
nal make command-line arguments the OpenEmbedded build system passes on whe=
n compiling the kernel.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_FEATURES[doc] =3D &quot;Includes additional=
 metadata from the Yocto Project kernel Git repository. The metadata you ad=
d through this variable includes config fragments and features descriptions=
.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE[doc] =3D &quot;The type of kernel=
 to build for a device, usually set by the machine configuration files and =
defaults to &#39;zImage&#39;.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES[doc] =3D &quot;The list of types=
 of kernel to build for a device, usually set by the machine configuration =
files and defaults to KERNEL_IMAGETYPE.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_MODULE_AUTOLOAD[doc] =3D &quot;Lists kernel=
 modules that need to be auto-loaded during boot&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_MODULE_PROBECONF[doc] =3D &quot;Lists kerne=
l modules for which the build system expects to find module_conf_* values t=
hat specify configuration for each of the modules&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_PATH[doc] =3D &quot;The location of the ker=
nel sources. This variable is set to the value of the STAGING_KERNEL_DIR wi=
thin the module class (module.bbclass).&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/conf/machine/qemumips.conf b/meta=
/conf/machine/qemumips.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index fbf8137..67ce161 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/conf/machine/qemumips.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/conf/machine/qemumips.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -6,7 +6,7 @@ require conf/machine/include/qemu.i=
nc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 require conf/machine/include/tune-mips32r2.inc<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SERIAL_CONSOLES =3D &quot;115200;ttyS0 115200;ttyS=
1&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/conf/machine/qemumips64.conf b/me=
ta/conf/machine/qemumips64.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 8c3f1fe..393212e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/conf/machine/qemumips64.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/conf/machine/qemumips64.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -6,7 +6,7 @@ require conf/machine/include/qemu.i=
nc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 require conf/machine/include/tune-mips64.inc<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SERIAL_CONSOLES =3D &quot;115200;ttyS0 115200;ttyS=
1&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-kernel/linux/linux-dtb.in=
c b/meta/recipes-kernel/linux/linux-dtb.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 651a19e..74f5ef8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-kernel/linux/linux-dtb.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-kernel/linux/linux-dtb.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -34,9 +34,12 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEV=
ICETREE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB=3D`normalize_dtb &quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_BASE_NAME=3D`basename ${DTB} .dtb`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/$=
{MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB=
_SYMLINK_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERN=
EL_IMAGE_SYMLINK_NAME}<br>
&gt;<br>
&gt;<br>
&gt; If there are multiple image types being built, is this valid for them =
all ?<br>
<br>
</div></div>Add these links for convenience. If we give different configura=
tions to<br>
different types of images in the future, as you pointed above, we might<br>
also need different dtb.<br></blockquote><div><br></div><div>Sounds good.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} =
| sed &quot;s/${MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &=
quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${DTB_PATH} ${D}/${KERNEL=
_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -44,31 +47,39 @@ do_deploy_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEV=
ICETREE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB=3D`normalize_dtb &quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_BASE_NAME=3D`basename ${DTB} .dtb`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed &quot;s/${MACHINE}/$=
{DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/$=
{MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -d ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_name=3D${type}&quot;-&quot;${KERNEL_=
IMAGE_BASE_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERN=
EL_IMAGE_SYMLINK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_NAME=3D`echo ${base_name} | sed &quot=
;s/${MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} =
| sed &quot;s/${MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &=
quot;${DTB}&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${DEPLOYDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/=
${DTB_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB=
_SYMLINK_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pkg_postinst_kernel-devicetree () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd /${KERNEL_IMAGEDEST}=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEV=
ICETREE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_BASE_NAME=3D`basename ${DTB} | awk -F &quot;.&quot; &#39;{print $=
1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/$=
{MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.d=
tb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_P=
RIORITY} || true<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEV=
ICETREE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERN=
EL_IMAGE_SYMLINK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`basename ${DTB} | awk -F=
 &quot;.&quot; &#39;{print $1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} =
| sed &quot;s/${MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --install /${KERNEL_I=
MAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_=
SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pkg_postrm_kernel-devicetree () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd /${KERNEL_IMAGEDEST}=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEV=
ICETREE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_BASE_NAME=3D`basename ${DTB} | awk -F &quot;.&quot; &#39;{print $=
1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed &quot;s/$=
{MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${=
DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for DTB in ${KERNEL_DEV=
ICETREE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERN=
EL_IMAGE_SYMLINK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_BASE_NAME=3D`basename ${DTB} | awk -F=
 &quot;.&quot; &#39;{print $1}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} =
| sed &quot;s/${MACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --remove ${DTB_BASE_N=
AME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || tru=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/scripts/lib/bsp/substrate/target/arch/=
mips/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/mips=
/conf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index b319d62..e4a6f30 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/scripts/lib/bsp/substrate/target/arch/mips/co=
nf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/scripts/lib/bsp/substrate/target/arch/mips/co=
nf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -9,7 +9,7 @@ require conf/machine/include/tune-m=
ips32.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MACHINE_FEATURES =3D &quot;screen keyboard pci usb=
host ext2 ext3 serial&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=C2=A0 =3D &quot;=
.comment&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {{ if kernel_choice =3D=3D &quot;custom&quot;: pre=
ferred_kernel =3D &quot;linux-yocto-custom&quot; }}<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/scripts/lib/bsp/substrate/target/arch/=
mips64/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/mi=
ps64/conf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 3afc5e0..2c2d8af 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/scripts/lib/bsp/substrate/target/arch/mips64/=
conf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/scripts/lib/bsp/substrate/target/arch/mips64/=
conf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -9,7 +9,7 @@ require conf/machine/include/tune-m=
ips64.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MACHINE_FEATURES =3D &quot;pci ext2 ext3 serial&qu=
ot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Again, why can&#39;t vmlinux just bein in KERNEL_IMAGETYPES ?<br>
&gt;<br>
<br>
</div></div>Discussed above.<br></blockquote><div><br></div><div>Thanks for=
 the quick follow up!</div><div><br></div><div>Cheers,</div><div><br></div>=
<div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Zhe<br>
<span class=3D""><br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=C2=A0 =3D &quot;=
.comment&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {{ if kernel_choice =3D=3D &quot;custom&quot;: pre=
ferred_kernel =3D &quot;linux-yocto-custom&quot; }}<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/scripts/lib/bsp/substrate/target/arch/=
qemu/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/qemu=
/conf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 67e1cbd..7a0a4d3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/scripts/lib/bsp/substrate/target/arch/qemu/co=
nf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/scripts/lib/bsp/substrate/target/arch/qemu/co=
nf/machine/machine.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -69,6 +69,6 @@ SERIAL_CONSOLE =3D &quot;115200 t=
tyS0&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {{ if qemuarch =3D=3D &quot;mips&quot; or qemuarch=
 =3D=3D &quot;mips64&quot;: }}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 KERNEL_IMAGETYPE =3D &quot;vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-KERNEL_ALT_IMAGETYPE =3D &quot;vmlinux.bin&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+KERNEL_IMAGETYPES =3D &quot;vmlinux.bin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SERIAL_CONSOLE =3D &quot;115200 ttyS0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MACHINE_EXTRA_RRECOMMENDS =3D &quot; kernel-module=
s&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A01.9.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.op=
enembedded.org">Openembedded-core@lists.openembedded.org</a> &lt;mailto:<a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@=
lists.openembedded.org</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"=
http://lists.openembedded.org/mailman/listinfo/openembedded-core" rel=3D"no=
referrer" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/=
openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end&quot;<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11436c72d3ef63052c5cc6a7--
