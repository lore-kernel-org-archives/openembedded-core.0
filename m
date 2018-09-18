Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6DF79493
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:44:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42Dykp6gW5z1qx9G;
	Tue, 18 Sep 2018 11:44:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42Dykp6HKLz1qr2Y;
	Tue, 18 Sep 2018 11:44:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id TP7ktWYHXCMS; Tue, 18 Sep 2018 11:44:31 +0200 (CEST)
X-Auth-Info: b1u9SiVOTTuqfRDUmLxJOnPTPdt5brknD5bE9Lp7S2I=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 18 Sep 2018 11:44:31 +0200 (CEST)
To: Leon Woestenberg <leon@sidebranch.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
	<4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
	<CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
	<CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d36ea830-9aa0-5e3e-140d-d0e2788175aa@denx.de>
Date: Tue, 18 Sep 2018 11:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Tue, 18 Sep 2018 09:44:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/18/2018 11:40 AM, Leon Woestenberg wrote:
> Hi Alex,

Hi,

> Adding Marek Vasut, original author of kernel-fitimage.bbclass.
> 
>> I guess the reason that the deployment happens in kernel.bbclass is so
>> you only have all the symlinking logic in one place
> 
> The deployment happens in both kernel.bbclass and
> kernel-fitimage.bbclass. That was exactly one of the bugs I wanted to
> solve. I am not sure what the intention was, though.
> 
> Marek: can you comment of the exact purpose of the deploy task in
> kernel-fitimage.bbclass?
> Which class should deploy the FIT images themselves?

It seems to have to do with deploying of the ITS files and the symlinks
for then .

It's hard to make any sense from the discussion below due to the
constant top-posting and mixing of email history, so I'll just not do
that, sorry.

What bug is it that you're seeing ?

> Whilst cleaning things up, my understanding was that
> kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the
> fitImages, along with the .its file etc.
> Maybe I was mistaken.

That's the case, yes.

> I have several other fixed piled up; for example initramfs's supposed to
> get bundled inside the kernel get also packed into the FIT; this takes
> double the amount of space in the FIT image...
> 
> Regards,
> 
> Leon.
> 
> 
> 
> 
> On Tue, Sep 18, 2018 at 8:10 AM Alex Kiernan <alex.kiernan@gmail.com
> <mailto:alex.kiernan@gmail.com>> wrote:
> 
>     Thanks Leon
> 
>     I guess the reason that the deployment happens in kernel.bbclass is so
>     you only have all the symlinking logic in one place.
> 
>     Are in agreement that this change should be reverted and the
>     "fitImage" deployed here:
> 
>     http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass#n495
> 
>     is the one which we should remove?
>     On Mon, Sep 17, 2018 at 7:05 PM Leon Woestenberg
>     <leon@sidebranch.com <mailto:leon@sidebranch.com>> wrote:
>     >
>     > Hi Alex,
>     >
>     > I expected it to be kernel-fitimage.bbclass’s responsibility to
>     deploy the fitImage.
>     >
>     > Regards, Leon
>     >
>     >
>     >
>     >
>     > On 16 Sep 2018, at 16:22, Alex Kiernan <alex.kiernan@gmail.com
>     <mailto:alex.kiernan@gmail.com>> wrote:
>     >
>     > On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan
>     <alex.kiernan@gmail.com <mailto:alex.kiernan@gmail.com>> wrote:
>     >
>     >
>     > Hi Leon
>     >
>     >
>     > On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg
>     <leon@sidebranch.com <mailto:leon@sidebranch.com>> wrote:
>     >
>     >
>     > Hi Alex,
>     >
>     >
>     > On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com
>     <mailto:alex.kiernan@gmail.com>> wrote:
>     >
>     >
>     > On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg
>     <leon@sidebranch.com <mailto:leon@sidebranch.com>> wrote:
>     >
>     >
>     > kernel-fitimage.bbclass replaces an occurance of "fitImage" in
>     >
>     > KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
>     >
>     > architecture (such as zImage). The kernel-fitimage.bbclass packs that
>     >
>     > image as sub-image in a flattened image tree image (fitImage) and
>     >
>     > deploys this fitImage along with the image tree source file (.its).
>     >
>     >
>     > kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
>     >
>     > also contains "fitImage", which kernel.bbclass will also deploy
>     >
>     > redundantly with different naming.
>     >
>     >
>     > The result is a dual deployment with slightly different naming,
>     >
>     > each with a set of symlinks.
>     >
>     >
>     > The solution chosen is to have fitImage deployment be handled by
>     >
>     > kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
>     >
>     > types during deployment.
>     >
>     >
>     > Signed-off-by: Leon Woestenberg <leon@sidebranch.com
>     <mailto:leon@sidebranch.com>>
>     >
>     >
>     > This looks completely plausible, but the two "FIT" images that are
>     >
>     > installed aren't identical... after this I end up with no FIT image
>     >
>     > and only a bare image in the deploy dir.
>     >
>     >
>     > What was in your KERNEL_IMAGETYPES? Did it at least contain
>     “fitImage”??
>     >
>     >
>     >
>     > Yes, in fact only fitImage (and no initramfs).
>     >
>     >
>     > Digging into it, the logic between the two classes is a bit odd... in
>     >
>     > the case of a non initramfs build, the fitImage is actually installed
>     >
>     > here.
>     >
>     >
>     > If ‘here’ means kernel-fitimage, then I’ld say ALL versions of a
>     FIT image containing AT LEAST a Linux kernel are installed by
>     kernel-fitimage.
>     >
>     >
>     > The one that's installed in kernel-fitimage is the bare
>     >
>     > linux.bin, but named fitImage-...
>     >
>     >
>     > which is totally broken. If you want the bare kernel binary (which
>     naming depends on architecture, so it should NOT be hard-coded to
>     linux.bin anyway), you would need to specify that type *also* in
>     KERNEL_IMAGETYPES, next to “fitImage”.
>     >
>     >
>     > Totally agree...
>     >
>     >
>     >
>     > I'll send a patch reverting this and removing the other one as I'd
>     >
>     > agree that it appears to have no purpose (and if you did want it, I
>     >
>     > guess you could list it in KERNEL_IMAGETYPES).
>     >
>     >
>     > I’m sorry I cannot follow what this and the other one is, and it.
>     Let’s first understand all cases correctly.
>     >
>     >
>     >
>     > Sorry I've not described it well... the code in
>     >
>     > kernel-fitimage.bbclass that inserts the kernel into the its happens
>     >
>     > here
>     http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass#n371
>     >
>     >
>     > fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin
>     "${linux_comp}"
>     >
>     >
>     > inside fitimage_emit_section_kernel we create a kernel section which
>     >
>     > has `data = /incbin/("${3}");` so linux.bin is our bare image.
>     >
>     >
>     > Then we have the installation of fitImage-linux-bin that happens here
>     >
>     >
>     http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass#n495
>     >
>     >
>     > echo "Copying linux.bin file..."
>     >
>     > install -m 0644 ${B}/linux.bin
>     >
>     > ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
>     >
>     > ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
>     >
>     > ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
>     >
>     >
>     > i.e. the bare linux.bin file which we used to pack into the FIT image,
>     >
>     > not a fitImage.
>     >
>     >
>     > The output FIT image from kernel-fitimage.bbclass is created here
>     >
>     >
>     http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass#n450
>     >
>     >
>     > uboot-mkimage \
>     >
>     > ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
>     len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>     >
>     >  -f ${1} \
>     >
>     >  arch/${ARCH}/boot/${2}
>     >
>     >
>     > i.e. in arch/${ARCH}/boot/${2}
>     >
>     >
>     > It's that image which is then picked up by kernel.bbclass to install
>     >
>     > into deploydir (because KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"):
>     >
>     >
>     > for imageType in ${KERNEL_IMAGETYPES} ; do
>     >
>     >  # kernel-fitimage class deploys fitImages, skip here
>     >
>     >  if [ "$imageType" != "fitImage" ]; then
>     >
>     >    base_name=${imageType}-${KERNEL_IMAGE_NAME}
>     >
>     >    install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
>     >
>     > $deployDir/${base_name}.bin
>     >
>     >  fi
>     >
>     > done
>     >
>     >
>     > Only it's doesn't because of the filter against fitImage.
>     >
>     >
>     >
>     > To check I'm not seeing some strange artefact of our BSP or
>     > linux-ti-staging (or any other layer we're using):
>     >
>     > $ git clone git://git.yoctoproject.org/poky
>     <http://git.yoctoproject.org/poky>
>     > $ cd poky
>     > $ . oe-init-build-env
>     > $ cat << EOF >> conf/local.conf
>     > MACHINE = "beaglebone-yocto"
>     > KERNEL_CLASSES += " kernel-fitimage"
>     > KERNEL_IMAGETYPES = "fitImage"
>     > EOF
>     > $ bitbake linux-yocto
>     >
>     > The FIT images we then have:
>     >
>     > $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
>     >
>     tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
>     >
>     > And what is:
>     >
>     > $ bitbake u-boot-mkimage-native -caddto_recipe_sysroot
>     > $ oe-run-native u-boot-mkimage-native mkimage -l
>     >
>     tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
>     > Running bitbake -e u-boot-mkimage-native
>     > GP Header: Size a0e1 LoadAddr a0e1
>     >
>     > Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try again:
>     >
>     > $ git revert c2d00e2f83cdf3d2923660448756ed29296a06a6
>     > $ bitbake linux-yocto
>     >
>     > This time there's two images:
>     >
>     > $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
>     >
>     tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
>     >
>     tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
>     >
>     > And what they are:
>     >
>     > $ oe-run-native u-boot-mkimage-native mkimage -l
>     >
>     tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
>     > Running bitbake -e u-boot-mkimage-native
>     > FIT description: U-Boot fitImage for Poky (Yocto Project Reference
>     > Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto
>     > Created:         Sun Sep 16 14:14:47 2018
>     > Image 0 (kernel@1)
>     >  Description:  Linux kernel
>     >  Created:      Sun Sep 16 14:14:47 2018
>     >  Type:         Kernel Image
>     >  Compression:  uncompressed
>     >  Data Size:    6381368 Bytes = 6231.80 KiB = 6.09 MiB
>     >  Architecture: ARM
>     >  OS:           Linux
>     >  Load Address: 0x80008000
>     >  Entry Point:  0x80008000
>     >  Hash algo:    sha1
>     >  Hash value:   909137524ffd28b5b0ac51ea39c648b09902dc18
>     > Image 1 (fdt@am335x-bone.dtb)
>     >  Description:  Flattened Device Tree blob
>     >  Created:      Sun Sep 16 14:14:47 2018
>     >  Type:         Flat Device Tree
>     >  Compression:  uncompressed
>     >  Data Size:    33030 Bytes = 32.26 KiB = 0.03 MiB
>     >  Architecture: ARM
>     >  Hash algo:    sha1
>     >  Hash value:   0fece12f15fc5ac6c452d9308cd374c2c0cfea47
>     > Image 2 (fdt@am335x-boneblack.dtb)
>     >  Description:  Flattened Device Tree blob
>     >  Created:      Sun Sep 16 14:14:47 2018
>     >  Type:         Flat Device Tree
>     >  Compression:  uncompressed
>     >  Data Size:    34782 Bytes = 33.97 KiB = 0.03 MiB
>     >  Architecture: ARM
>     >  Hash algo:    sha1
>     >  Hash value:   337f6843020cb8fbaf119b43fd748222d32e72df
>     > Image 3 (fdt@am335x-bonegreen.dtb)
>     >  Description:  Flattened Device Tree blob
>     >  Created:      Sun Sep 16 14:14:47 2018
>     >  Type:         Flat Device Tree
>     >  Compression:  uncompressed
>     >  Data Size:    33286 Bytes = 32.51 KiB = 0.03 MiB
>     >  Architecture: ARM
>     >  Hash algo:    sha1
>     >  Hash value:   4974e8b1656cd7f52829ac3c01f6747bece87cbc
>     > Default Configuration: 'conf@am335x-bone.dtb'
>     > Configuration 0 (conf@am335x-bone.dtb)
>     >  Description:  1 Linux kernel, FDT blob
>     >  Kernel:       kernel@1
>     >  FDT:          fdt@am335x-bone.dtb
>     >  Hash algo:    sha1
>     >  Hash value:   unavailable
>     > Configuration 1 (conf@am335x-boneblack.dtb)
>     >  Description:  0 Linux kernel, FDT blob
>     >  Kernel:       kernel@1
>     >  FDT:          fdt@am335x-boneblack.dtb
>     >  Hash algo:    sha1
>     >  Hash value:   unavailable
>     > Configuration 2 (conf@am335x-bonegreen.dtb)
>     >  Description:  0 Linux kernel, FDT blob
>     >  Kernel:       kernel@1
>     >  FDT:          fdt@am335x-bonegreen.dtb
>     >  Hash algo:    sha1
>     >  Hash value:   unavailable
>     > $ oe-run-native u-boot-mkimage-native mkimage -l
>     >
>     tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
>     > Running bitbake -e u-boot-mkimage-native
>     > GP Header: Size a0e1 LoadAddr a0e1
>     >
>     > --
>     > Alex Kiernan
> 
> 
> 
>     -- 
>     Alex Kiernan
> 
> 
> 
> -- 
> Leon Woestenberg
> leon@sidebranch.com <mailto:leon@sidebranch.com>
> T: +31 40 711 42 76
> M: +31 6 472 30 372
> 
> Sidebranch
> Embedded Systems
> Eindhoven, The Netherlands
> http://www.sidebranch.com <http://www.sidebranch.com/>
> 
> 
> 
> 


-- 
Best regards,
Marek Vasut

