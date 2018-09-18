Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id AEAF7795E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:01:14 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a20-v6so1401668edd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+bgAsZI9ndcvxFyJepV1VSivwksnDATus4byFYMFrZ4=;
	b=kqapwK2SuvDf9mXdoe4rH+lKQClrnmeVwOOY9hQXb5xfQLR3lJcHv31KIuiL04EksS
	YxGKXjoPWlEHY3XLw+GPXCda1us0tZ3uymdG0oZAc/2+TUUp/2eVrKr/Lwfv1jj4/aUK
	9QhsqfArZ/P8Q4gOZWyy3TVObyiwi9mjftvPMfTK50t7e01MYL5BD43+rYRgK5NCsi4i
	UQ3BiLRJnEmnW/iM3Q2o2F0lnqZCqMRMWqosHLibce6fB3DnnYeJNC4k3tyGSlRWxZ6K
	4IGCmumlkG2TCrQK8cQ1awQzbzamGP9FdTG2SmFTPW5syL4+WDMjPdd1gGry/5yHsVsw
	5w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+bgAsZI9ndcvxFyJepV1VSivwksnDATus4byFYMFrZ4=;
	b=qLW5Ek9bjiPFb6rgMwiK5QhGs+7o078MjbBjSKrxJ9+O2L8zUHCflSIZeU8D/7B4HJ
	cTRGocOk66iT7B92hfAwBdYzqyL5d8DPoElsvbwc0YeGvh9vooquAIXrBa1K1SbHHSXy
	/YhnL+CC+Z4SCvqEzg2GX1tfhRnVGzgFU9Q6D7dj8luQ6hRCMc3ZfdRSY/Ooow2OaqM0
	ZeH+oYbGU2paqB9rMtpkJ73MiIpiTBQ+ALHxQOCe1n2RP1j5SMCET41D6QNz/xavZenB
	ecaMiv1xVgNK0P7o2gXTfz52v1mb0v7g9YLy8hHkYMNhs1RZQlDJ3RcOBnxBYY0Xt9aH
	3ziw==
X-Gm-Message-State: APzg51BySfe4Y1dCHk00IT+jK+LoNWBprBraaexygA1EzBh2bmBRpb84
	cR96pEVXzvAXxpk1QkILEcf1Niu2koSm55bJMmlJxA==
X-Google-Smtp-Source: ANB0VdZZJgd9y6A1F7jLbyeiieL0NwZDnM9LHpdZwKq2dQFb92ebF3JaE+cMuGNeNuRR+O04V7b2vLkc46QxcG2Ryrk=
X-Received: by 2002:a50:d619:: with SMTP id
	x25-v6mr49857786edi.178.1537264875127; 
	Tue, 18 Sep 2018 03:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
	<4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
	<CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
	<CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
	<d36ea830-9aa0-5e3e-140d-d0e2788175aa@denx.de>
In-Reply-To: <d36ea830-9aa0-5e3e-140d-d0e2788175aa@denx.de>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 18 Sep 2018 12:01:05 +0200
Message-ID: <CAMjhiJgR1xe_uikpD+07pKDjeBw7er6efV04P3ygMAPfnTUu6w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
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
X-List-Received-Date: Tue, 18 Sep 2018 10:01:15 -0000
Content-Type: multipart/alternative; boundary="000000000000ced8aa0576225e12"

--000000000000ced8aa0576225e12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

one of the issues I saw was that both kernel.bbclass and
kernel-fitImage.bbclass deployed the FIT image into the deploy/images/
subfolder.

My fix was to make the kernel.bbclass ignore "fitImage" during deployment.
This is also the fix I saw from Xilinx.

(Another fix I have pending is that bundled initramfs images (i.e that go
inside the kernel binary) where also seperately packed inside the FIT
image.)

In general, I am trying to fix all bugs and issues that match
"kernel-fitimage.bbclass" on the mailing list.

Regards,

Leon.


On Tue, Sep 18, 2018 at 11:44 AM Marek Vasut <marex@denx.de> wrote:

> On 09/18/2018 11:40 AM, Leon Woestenberg wrote:
> > Hi Alex,
>
> Hi,
>
> > Adding Marek Vasut, original author of kernel-fitimage.bbclass.
> >
> >> I guess the reason that the deployment happens in kernel.bbclass is so
> >> you only have all the symlinking logic in one place
> >
> > The deployment happens in both kernel.bbclass and
> > kernel-fitimage.bbclass. That was exactly one of the bugs I wanted to
> > solve. I am not sure what the intention was, though.
> >
> > Marek: can you comment of the exact purpose of the deploy task in
> > kernel-fitimage.bbclass?
> > Which class should deploy the FIT images themselves?
>
> It seems to have to do with deploying of the ITS files and the symlinks
> for then .
>
> It's hard to make any sense from the discussion below due to the
> constant top-posting and mixing of email history, so I'll just not do
> that, sorry.
>
> What bug is it that you're seeing ?
>
> > Whilst cleaning things up, my understanding was that
> > kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the
> > fitImages, along with the .its file etc.
> > Maybe I was mistaken.
>
> That's the case, yes.
>
> > I have several other fixed piled up; for example initramfs's supposed t=
o
> > get bundled inside the kernel get also packed into the FIT; this takes
> > double the amount of space in the FIT image...
> >
> > Regards,
> >
> > Leon.
> >
> >
> >
> >
> > On Tue, Sep 18, 2018 at 8:10 AM Alex Kiernan <alex.kiernan@gmail.com
> > <mailto:alex.kiernan@gmail.com>> wrote:
> >
> >     Thanks Leon
> >
> >     I guess the reason that the deployment happens in kernel.bbclass is
> so
> >     you only have all the symlinking logic in one place.
> >
> >     Are in agreement that this change should be reverted and the
> >     "fitImage" deployed here:
> >
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n495
> >
> >     is the one which we should remove?
> >     On Mon, Sep 17, 2018 at 7:05 PM Leon Woestenberg
> >     <leon@sidebranch.com <mailto:leon@sidebranch.com>> wrote:
> >     >
> >     > Hi Alex,
> >     >
> >     > I expected it to be kernel-fitimage.bbclass=E2=80=99s responsibil=
ity to
> >     deploy the fitImage.
> >     >
> >     > Regards, Leon
> >     >
> >     >
> >     >
> >     >
> >     > On 16 Sep 2018, at 16:22, Alex Kiernan <alex.kiernan@gmail.com
> >     <mailto:alex.kiernan@gmail.com>> wrote:
> >     >
> >     > On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan
> >     <alex.kiernan@gmail.com <mailto:alex.kiernan@gmail.com>> wrote:
> >     >
> >     >
> >     > Hi Leon
> >     >
> >     >
> >     > On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg
> >     <leon@sidebranch.com <mailto:leon@sidebranch.com>> wrote:
> >     >
> >     >
> >     > Hi Alex,
> >     >
> >     >
> >     > On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com
> >     <mailto:alex.kiernan@gmail.com>> wrote:
> >     >
> >     >
> >     > On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg
> >     <leon@sidebranch.com <mailto:leon@sidebranch.com>> wrote:
> >     >
> >     >
> >     > kernel-fitimage.bbclass replaces an occurance of "fitImage" in
> >     >
> >     > KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for
> the
> >     >
> >     > architecture (such as zImage). The kernel-fitimage.bbclass packs
> that
> >     >
> >     > image as sub-image in a flattened image tree image (fitImage) and
> >     >
> >     > deploys this fitImage along with the image tree source file (.its=
).
> >     >
> >     >
> >     > kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which
> thus
> >     >
> >     > also contains "fitImage", which kernel.bbclass will also deploy
> >     >
> >     > redundantly with different naming.
> >     >
> >     >
> >     > The result is a dual deployment with slightly different naming,
> >     >
> >     > each with a set of symlinks.
> >     >
> >     >
> >     > The solution chosen is to have fitImage deployment be handled by
> >     >
> >     > kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
> >     >
> >     > types during deployment.
> >     >
> >     >
> >     > Signed-off-by: Leon Woestenberg <leon@sidebranch.com
> >     <mailto:leon@sidebranch.com>>
> >     >
> >     >
> >     > This looks completely plausible, but the two "FIT" images that ar=
e
> >     >
> >     > installed aren't identical... after this I end up with no FIT ima=
ge
> >     >
> >     > and only a bare image in the deploy dir.
> >     >
> >     >
> >     > What was in your KERNEL_IMAGETYPES? Did it at least contain
> >     =E2=80=9CfitImage=E2=80=9D??
> >     >
> >     >
> >     >
> >     > Yes, in fact only fitImage (and no initramfs).
> >     >
> >     >
> >     > Digging into it, the logic between the two classes is a bit odd..=
.
> in
> >     >
> >     > the case of a non initramfs build, the fitImage is actually
> installed
> >     >
> >     > here.
> >     >
> >     >
> >     > If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99l=
d say ALL versions of a
> >     FIT image containing AT LEAST a Linux kernel are installed by
> >     kernel-fitimage.
> >     >
> >     >
> >     > The one that's installed in kernel-fitimage is the bare
> >     >
> >     > linux.bin, but named fitImage-...
> >     >
> >     >
> >     > which is totally broken. If you want the bare kernel binary (whic=
h
> >     naming depends on architecture, so it should NOT be hard-coded to
> >     linux.bin anyway), you would need to specify that type *also* in
> >     KERNEL_IMAGETYPES, next to =E2=80=9CfitImage=E2=80=9D.
> >     >
> >     >
> >     > Totally agree...
> >     >
> >     >
> >     >
> >     > I'll send a patch reverting this and removing the other one as I'=
d
> >     >
> >     > agree that it appears to have no purpose (and if you did want it,=
 I
> >     >
> >     > guess you could list it in KERNEL_IMAGETYPES).
> >     >
> >     >
> >     > I=E2=80=99m sorry I cannot follow what this and the other one is,=
 and it.
> >     Let=E2=80=99s first understand all cases correctly.
> >     >
> >     >
> >     >
> >     > Sorry I've not described it well... the code in
> >     >
> >     > kernel-fitimage.bbclass that inserts the kernel into the its
> happens
> >     >
> >     > here
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n371
> >     >
> >     >
> >     > fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin
> >     "${linux_comp}"
> >     >
> >     >
> >     > inside fitimage_emit_section_kernel we create a kernel section
> which
> >     >
> >     > has `data =3D /incbin/("${3}");` so linux.bin is our bare image.
> >     >
> >     >
> >     > Then we have the installation of fitImage-linux-bin that happens
> here
> >     >
> >     >
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n495
> >     >
> >     >
> >     > echo "Copying linux.bin file..."
> >     >
> >     > install -m 0644 ${B}/linux.bin
> >     >
> >     > ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
> >     >
> >     > ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
> >     >
> >     > ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
> >     >
> >     >
> >     > i.e. the bare linux.bin file which we used to pack into the FIT
> image,
> >     >
> >     > not a fitImage.
> >     >
> >     >
> >     > The output FIT image from kernel-fitimage.bbclass is created here
> >     >
> >     >
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n450
> >     >
> >     >
> >     > uboot-mkimage \
> >     >
> >     > ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> >     len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> >     >
> >     >  -f ${1} \
> >     >
> >     >  arch/${ARCH}/boot/${2}
> >     >
> >     >
> >     > i.e. in arch/${ARCH}/boot/${2}
> >     >
> >     >
> >     > It's that image which is then picked up by kernel.bbclass to
> install
> >     >
> >     > into deploydir (because KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot=
"):
> >     >
> >     >
> >     > for imageType in ${KERNEL_IMAGETYPES} ; do
> >     >
> >     >  # kernel-fitimage class deploys fitImages, skip here
> >     >
> >     >  if [ "$imageType" !=3D "fitImage" ]; then
> >     >
> >     >    base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
> >     >
> >     >    install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> >     >
> >     > $deployDir/${base_name}.bin
> >     >
> >     >  fi
> >     >
> >     > done
> >     >
> >     >
> >     > Only it's doesn't because of the filter against fitImage.
> >     >
> >     >
> >     >
> >     > To check I'm not seeing some strange artefact of our BSP or
> >     > linux-ti-staging (or any other layer we're using):
> >     >
> >     > $ git clone git://git.yoctoproject.org/poky
> >     <http://git.yoctoproject.org/poky>
> >     > $ cd poky
> >     > $ . oe-init-build-env
> >     > $ cat << EOF >> conf/local.conf
> >     > MACHINE =3D "beaglebone-yocto"
> >     > KERNEL_CLASSES +=3D " kernel-fitimage"
> >     > KERNEL_IMAGETYPES =3D "fitImage"
> >     > EOF
> >     > $ bitbake linux-yocto
> >     >
> >     > The FIT images we then have:
> >     >
> >     > $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type =
f
> >     >
> >
>  tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417=
20391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
> >     >
> >     > And what is:
> >     >
> >     > $ bitbake u-boot-mkimage-native -caddto_recipe_sysroot
> >     > $ oe-run-native u-boot-mkimage-native mkimage -l
> >     >
> >
>  tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417=
20391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
> >     > Running bitbake -e u-boot-mkimage-native
> >     > GP Header: Size a0e1 LoadAddr a0e1
> >     >
> >     > Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try again:
> >     >
> >     > $ git revert c2d00e2f83cdf3d2923660448756ed29296a06a6
> >     > $ bitbake linux-yocto
> >     >
> >     > This time there's two images:
> >     >
> >     > $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type =
f
> >     >
> >
>  tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba0=
3655e8-r0-beaglebone-yocto-20180916141923.bin
> >     >
> >
>  tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417=
20391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
> >     >
> >     > And what they are:
> >     >
> >     > $ oe-run-native u-boot-mkimage-native mkimage -l
> >     >
> >
>  tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba0=
3655e8-r0-beaglebone-yocto-20180916141923.bin
> >     > Running bitbake -e u-boot-mkimage-native
> >     > FIT description: U-Boot fitImage for Poky (Yocto Project Referenc=
e
> >     > Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto
> >     > Created:         Sun Sep 16 14:14:47 2018
> >     > Image 0 (kernel@1)
> >     >  Description:  Linux kernel
> >     >  Created:      Sun Sep 16 14:14:47 2018
> >     >  Type:         Kernel Image
> >     >  Compression:  uncompressed
> >     >  Data Size:    6381368 Bytes =3D 6231.80 KiB =3D 6.09 MiB
> >     >  Architecture: ARM
> >     >  OS:           Linux
> >     >  Load Address: 0x80008000
> >     >  Entry Point:  0x80008000
> >     >  Hash algo:    sha1
> >     >  Hash value:   909137524ffd28b5b0ac51ea39c648b09902dc18
> >     > Image 1 (fdt@am335x-bone.dtb)
> >     >  Description:  Flattened Device Tree blob
> >     >  Created:      Sun Sep 16 14:14:47 2018
> >     >  Type:         Flat Device Tree
> >     >  Compression:  uncompressed
> >     >  Data Size:    33030 Bytes =3D 32.26 KiB =3D 0.03 MiB
> >     >  Architecture: ARM
> >     >  Hash algo:    sha1
> >     >  Hash value:   0fece12f15fc5ac6c452d9308cd374c2c0cfea47
> >     > Image 2 (fdt@am335x-boneblack.dtb)
> >     >  Description:  Flattened Device Tree blob
> >     >  Created:      Sun Sep 16 14:14:47 2018
> >     >  Type:         Flat Device Tree
> >     >  Compression:  uncompressed
> >     >  Data Size:    34782 Bytes =3D 33.97 KiB =3D 0.03 MiB
> >     >  Architecture: ARM
> >     >  Hash algo:    sha1
> >     >  Hash value:   337f6843020cb8fbaf119b43fd748222d32e72df
> >     > Image 3 (fdt@am335x-bonegreen.dtb)
> >     >  Description:  Flattened Device Tree blob
> >     >  Created:      Sun Sep 16 14:14:47 2018
> >     >  Type:         Flat Device Tree
> >     >  Compression:  uncompressed
> >     >  Data Size:    33286 Bytes =3D 32.51 KiB =3D 0.03 MiB
> >     >  Architecture: ARM
> >     >  Hash algo:    sha1
> >     >  Hash value:   4974e8b1656cd7f52829ac3c01f6747bece87cbc
> >     > Default Configuration: 'conf@am335x-bone.dtb'
> >     > Configuration 0 (conf@am335x-bone.dtb)
> >     >  Description:  1 Linux kernel, FDT blob
> >     >  Kernel:       kernel@1
> >     >  FDT:          fdt@am335x-bone.dtb
> >     >  Hash algo:    sha1
> >     >  Hash value:   unavailable
> >     > Configuration 1 (conf@am335x-boneblack.dtb)
> >     >  Description:  0 Linux kernel, FDT blob
> >     >  Kernel:       kernel@1
> >     >  FDT:          fdt@am335x-boneblack.dtb
> >     >  Hash algo:    sha1
> >     >  Hash value:   unavailable
> >     > Configuration 2 (conf@am335x-bonegreen.dtb)
> >     >  Description:  0 Linux kernel, FDT blob
> >     >  Kernel:       kernel@1
> >     >  FDT:          fdt@am335x-bonegreen.dtb
> >     >  Hash algo:    sha1
> >     >  Hash value:   unavailable
> >     > $ oe-run-native u-boot-mkimage-native mkimage -l
> >     >
> >
>  tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417=
20391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
> >     > Running bitbake -e u-boot-mkimage-native
> >     > GP Header: Size a0e1 LoadAddr a0e1
> >     >
> >     > --
> >     > Alex Kiernan
> >
> >
> >
> >     --
> >     Alex Kiernan
> >
> >
> >
> > --
> > Leon Woestenberg
> > leon@sidebranch.com <mailto:leon@sidebranch.com>
> > T: +31 40 711 42 76
> > M: +31 6 472 30 372
> >
> > Sidebranch
> > Embedded Systems
> > Eindhoven, The Netherlands
> > http://www.sidebranch.com <http://www.sidebranch.com/>
> >
> >
> >
> >
>
>
> --
> Best regards,
> Marek Vasut
>


--=20
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch
Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com

--000000000000ced8aa0576225e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Marek,<div><br></div><div>one of the i=
ssues I saw was that both kernel.bbclass and kernel-fitImage.bbclass deploy=
ed the FIT image into the deploy/images/ subfolder.</div><div><br></div><di=
v>My fix was to make the kernel.bbclass ignore &quot;fitImage&quot; during =
deployment. This is also the fix I saw from Xilinx.</div><div><br></div><di=
v>(Another fix I have pending is that bundled initramfs images (i.e that go=
 inside the kernel binary) where also seperately packed inside the FIT imag=
e.)<br></div><div><br></div><div>In general, I am trying to fix all bugs an=
d issues that match &quot;kernel-fitimage.bbclass&quot; on the mailing list=
.</div><div><br></div><div>Regards,</div><div><br></div><div>Leon.</div><di=
v><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Sep 18,=
 2018 at 11:44 AM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=
=3D"_blank">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 09/18/2018 11:40 AM, Leon Woestenberg wrote:<br=
>
&gt; Hi Alex,<br>
<br>
Hi,<br>
<br>
&gt; Adding Marek Vasut, original author of kernel-fitimage.bbclass.<br>
&gt; <br>
&gt;&gt; I guess the reason that the deployment happens in kernel.bbclass i=
s so<br>
&gt;&gt; you only have all the symlinking logic in one place<br>
&gt; <br>
&gt; The deployment happens in both kernel.bbclass and<br>
&gt; kernel-fitimage.bbclass. That was exactly one of the bugs I wanted to<=
br>
&gt; solve. I am not sure what the intention was, though.<br>
&gt; <br>
&gt; Marek: can you comment of the exact purpose of the deploy task in<br>
&gt; kernel-fitimage.bbclass?<br>
&gt; Which class should deploy the FIT images themselves?<br>
<br>
It seems to have to do with deploying of the ITS files and the symlinks<br>
for then .<br>
<br>
It&#39;s hard to make any sense from the discussion below due to the<br>
constant top-posting and mixing of email history, so I&#39;ll just not do<b=
r>
that, sorry.<br>
<br>
What bug is it that you&#39;re seeing ?<br>
<br>
&gt; Whilst cleaning things up, my understanding was that<br>
&gt; kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the<br>
&gt; fitImages, along with the .its file etc.<br>
&gt; Maybe I was mistaken.<br>
<br>
That&#39;s the case, yes.<br>
<br>
&gt; I have several other fixed piled up; for example initramfs&#39;s suppo=
sed to<br>
&gt; get bundled inside the kernel get also packed into the FIT; this takes=
<br>
&gt; double the amount of space in the FIT image...<br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; Leon.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Tue, Sep 18, 2018 at 8:10 AM Alex Kiernan &lt;<a href=3D"mailto:ale=
x.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank"=
>alex.kiernan@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks Leon<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I guess the reason that the deployment happens in k=
ernel.bbclass is so<br>
&gt;=C2=A0 =C2=A0 =C2=A0you only have all the symlinking logic in one place=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Are in agreement that this change should be reverte=
d and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;fitImage&quot; deployed here:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/openembedded=
-core/tree/meta/classes/kernel-fitimage.bbclass#n495" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/kernel-fitimage.bbclass#n495</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0is the one which we should remove?<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Sep 17, 2018 at 7:05 PM Leon Woestenberg<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:leon@sidebranch.com" target=
=3D"_blank">leon@sidebranch.com</a> &lt;mailto:<a href=3D"mailto:leon@sideb=
ranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Alex,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I expected it to be kernel-fitimage.bbclass=E2=
=80=99s responsibility to<br>
&gt;=C2=A0 =C2=A0 =C2=A0deploy the fitImage.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards, Leon<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 16 Sep 2018, at 16:22, Alex Kiernan &lt;<a =
href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kiernan@gmail.com=
" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.kiernan@gmail.com" targe=
t=3D"_blank">alex.kiernan@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.k=
iernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;&gt; wrot=
e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Leon<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenb=
erg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:leon@sidebranch.com" target=
=3D"_blank">leon@sidebranch.com</a> &lt;mailto:<a href=3D"mailto:leon@sideb=
ranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Alex,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 15 Sep 2018, at 19:45, Alex Kiernan &lt;<a =
href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kiernan@gmail.com=
" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenb=
erg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:leon@sidebranch.com" target=
=3D"_blank">leon@sidebranch.com</a> &lt;mailto:<a href=3D"mailto:leon@sideb=
ranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel-fitimage.bbclass replaces an occurance =
of &quot;fitImage&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; KERNEL_IMAGETYPE_FOR_MAKE by an image type tha=
t is buildable for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; architecture (such as zImage). The kernel-fiti=
mage.bbclass packs that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; image as sub-image in a flattened image tree i=
mage (fitImage) and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; deploys this fitImage along with the image tre=
e source file (.its).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel-fitimage.bbclass does not alter KERNEL_=
IMAGETYPES, which thus<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; also contains &quot;fitImage&quot;, which kern=
el.bbclass will also deploy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; redundantly with different naming.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The result is a dual deployment with slightly =
different naming,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; each with a set of symlinks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The solution chosen is to have fitImage deploy=
ment be handled by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel-fitimage.bbclass, and have kernel.bbcla=
ss ignore fitImage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; types during deployment.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Leon Woestenberg &lt;<a href=3D=
"mailto:leon@sidebranch.com" target=3D"_blank">leon@sidebranch.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:leon@sidebranch.com" t=
arget=3D"_blank">leon@sidebranch.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This looks completely plausible, but the two &=
quot;FIT&quot; images that are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; installed aren&#39;t identical... after this I=
 end up with no FIT image<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and only a bare image in the deploy dir.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; What was in your KERNEL_IMAGETYPES? Did it at =
least contain<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E2=80=9CfitImage=E2=80=9D??<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yes, in fact only fitImage (and no initramfs).=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Digging into it, the logic between the two cla=
sses is a bit odd... in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the case of a non initramfs build, the fitImag=
e is actually installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If =E2=80=98here=E2=80=99 means kernel-fitimag=
e, then I=E2=80=99ld say ALL versions of a<br>
&gt;=C2=A0 =C2=A0 =C2=A0FIT image containing AT LEAST a Linux kernel are in=
stalled by<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel-fitimage.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The one that&#39;s installed in kernel-fitimag=
e is the bare<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; linux.bin, but named fitImage-...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; which is totally broken. If you want the bare =
kernel binary (which<br>
&gt;=C2=A0 =C2=A0 =C2=A0naming depends on architecture, so it should NOT be=
 hard-coded to<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux.bin anyway), you would need to specify that t=
ype *also* in<br>
&gt;=C2=A0 =C2=A0 =C2=A0KERNEL_IMAGETYPES, next to =E2=80=9CfitImage=E2=80=
=9D.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Totally agree...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;ll send a patch reverting this and remov=
ing the other one as I&#39;d<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; agree that it appears to have no purpose (and =
if you did want it, I<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; guess you could list it in KERNEL_IMAGETYPES).=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I=E2=80=99m sorry I cannot follow what this an=
d the other one is, and it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Let=E2=80=99s first understand all cases correctly.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Sorry I&#39;ve not described it well... the co=
de in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel-fitimage.bbclass that inserts the kerne=
l into the its happens<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; here<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/openembedded=
-core/tree/meta/classes/kernel-fitimage.bbclass#n371" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/kernel-fitimage.bbclass#n371</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; fitimage_emit_section_kernel ${1} &quot;${kern=
elcount}&quot; linux.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${linux_comp}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; inside fitimage_emit_section_kernel we create =
a kernel section which<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; has `data =3D /incbin/(&quot;${3}&quot;);` so =
linux.bin is our bare image.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Then we have the installation of fitImage-linu=
x-bin that happens here<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/openembedded=
-core/tree/meta/classes/kernel-fitimage.bbclass#n495" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/kernel-fitimage.bbclass#n495</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; echo &quot;Copying linux.bin file...&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; install -m 0644 ${B}/linux.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_N=
AME}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.=
bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_L=
INK_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; i.e. the bare linux.bin file which we used to =
pack into the FIT image,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; not a fitImage.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The output FIT image from kernel-fitimage.bbcl=
ass is created here<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/openembedded=
-core/tree/meta/classes/kernel-fitimage.bbclass#n450" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/kernel-fitimage.bbclass#n450</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; uboot-mkimage \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot=
;&#39; if<br>
&gt;=C2=A0 =C2=A0 =C2=A0len(&#39;${UBOOT_MKIMAGE_DTCOPTS}&#39;) else &#39;&=
#39;} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 -f ${1} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 arch/${ARCH}/boot/${2}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; i.e. in arch/${ARCH}/boot/${2}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; It&#39;s that image which is then picked up by=
 kernel.bbclass to install<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; into deploydir (because KERNEL_OUTPUT_DIR ?=3D=
 &quot;arch/${ARCH}/boot&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; for imageType in ${KERNEL_IMAGETYPES} ; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 # kernel-fitimage class deploys fitImage=
s, skip here<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 if [ &quot;$imageType&quot; !=3D &quot;f=
itImage&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 base_name=3D${imageType}-${KERNEL=
_IMAGE_NAME}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 install -m 0644 ${KERNEL_OUTPUT_D=
IR}/${imageType}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $deployDir/${base_name}.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Only it&#39;s doesn&#39;t because of the filte=
r against fitImage.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; To check I&#39;m not seeing some strange artef=
act of our BSP or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; linux-ti-staging (or any other layer we&#39;re=
 using):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ git clone git://<a href=3D"http://git.yoctop=
roject.org/poky" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/=
poky</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.yoctoproject.org/poky" re=
l=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/poky</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ cd poky<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ . oe-init-build-env<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ cat &lt;&lt; EOF &gt;&gt; conf/local.conf<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; MACHINE =3D &quot;beaglebone-yocto&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; KERNEL_CLASSES +=3D &quot; kernel-fitimage&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; KERNEL_IMAGETYPES =3D &quot;fitImage&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ bitbake linux-yocto<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The FIT images we then have:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ find tmp/deploy/images/beaglebone-yocto -nam=
e &#39;fit*.bin&#39; -type f<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmp/deploy/images/beaglebone-yocto/fitImage-linux.b=
in--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bi=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; And what is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ bitbake u-boot-mkimage-native -caddto_recipe=
_sysroot<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ oe-run-native u-boot-mkimage-native mkimage =
-l<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmp/deploy/images/beaglebone-yocto/fitImage-linux.b=
in--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bi=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Running bitbake -e u-boot-mkimage-native<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; GP Header: Size a0e1 LoadAddr a0e1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Revert c2d00e2f83cdf3d2923660448756ed29296a06a=
6 and try again:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ git revert c2d00e2f83cdf3d2923660448756ed292=
96a06a6<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ bitbake linux-yocto<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This time there&#39;s two images:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ find tmp/deploy/images/beaglebone-yocto -nam=
e &#39;fit*.bin&#39; -type f<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3=
+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmp/deploy/images/beaglebone-yocto/fitImage-linux.b=
in--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bi=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; And what they are:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ oe-run-native u-boot-mkimage-native mkimage =
-l<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3=
+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Running bitbake -e u-boot-mkimage-native<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; FIT description: U-Boot fitImage for Poky (Yoc=
to Project Reference<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e=
8/beaglebone-yocto<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Created:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sun =
Sep 16 14:14:47 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Image 0 (kernel@1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 Linux kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 =
14:14:47 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0K=
ernel Image<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 6381368 Bytes =
=3D 6231.80 KiB =3D 6.09 MiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Load Address: 0x80008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Entry Point:=C2=A0 0x80008000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A0909137524ffd28b5=
b0ac51ea39c648b09902dc18<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Image 1 (fdt@am335x-bone.dtb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 Flattened Device Tree=
 blob<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 =
14:14:47 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F=
lat Device Tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 33030 Bytes =3D =
32.26 KiB =3D 0.03 MiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A00fece12f15fc5ac6=
c452d9308cd374c2c0cfea47<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Image 2 (fdt@am335x-boneblack.dtb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 Flattened Device Tree=
 blob<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 =
14:14:47 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F=
lat Device Tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 34782 Bytes =3D =
33.97 KiB =3D 0.03 MiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A0337f6843020cb8fb=
af119b43fd748222d32e72df<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Image 3 (fdt@am335x-bonegreen.dtb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 Flattened Device Tree=
 blob<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 =
14:14:47 2018<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F=
lat Device Tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 33286 Bytes =3D =
32.51 KiB =3D 0.03 MiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A04974e8b1656cd7f5=
2829ac3c01f6747bece87cbc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Default Configuration: &#39;conf@am335x-bone.d=
tb&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Configuration 0 (conf@am335x-bone.dtb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 1 Linux kernel, FDT b=
lob<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel=
@1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 FDT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
dt@am335x-bone.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A0unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Configuration 1 (conf@am335x-boneblack.dtb)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 0 Linux kernel, FDT b=
lob<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel=
@1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 FDT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
dt@am335x-boneblack.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A0unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Configuration 2 (conf@am335x-bonegreen.dtb)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Description:=C2=A0 0 Linux kernel, FDT b=
lob<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel=
@1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 FDT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
dt@am335x-bonegreen.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 Hash value:=C2=A0 =C2=A0unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ oe-run-native u-boot-mkimage-native mkimage =
-l<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0tmp/deploy/images/beaglebone-yocto/fitImage-linux.b=
in--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bi=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Running bitbake -e u-boot-mkimage-native<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; GP Header: Size a0e1 LoadAddr a0e1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Alex Kiernan<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Alex Kiernan<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Leon Woestenberg<br>
&gt; <a href=3D"mailto:leon@sidebranch.com" target=3D"_blank">leon@sidebran=
ch.com</a> &lt;mailto:<a href=3D"mailto:leon@sidebranch.com" target=3D"_bla=
nk">leon@sidebranch.com</a>&gt;<br>
&gt; T: +31 40 711 42 76<br>
&gt; M: +31 6 472 30 372<br>
&gt; <br>
&gt; Sidebranch<br>
&gt; Embedded Systems<br>
&gt; Eindhoven, The Netherlands<br>
&gt; <a href=3D"http://www.sidebranch.com" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.sidebranch.com</a> &lt;<a href=3D"http://www.sidebranch.com=
/" rel=3D"noreferrer" target=3D"_blank">http://www.sidebranch.com/</a>&gt;<=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Marek Vasut<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_-7318857044726254343gmail_signature"><div dir=3D"ltr"><di=
v style=3D"color:rgb(0,0,0);font-family:Helvetica">Leon Woestenberg</div><d=
iv style=3D"color:rgb(0,0,0);font-family:Helvetica"><a href=3D"mailto:leon@=
sidebranch.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">leon@sideb=
ranch.com</a></div><div style=3D"color:rgb(0,0,0);font-family:Helvetica"><d=
iv>T: +31 40 711 42 76</div><div>M: +31 6 472 30 372</div></div><div style=
=3D"color:rgb(0,0,0);font-family:Helvetica"><br></div><div style=3D"color:r=
gb(0,0,0);font-family:Helvetica">Sidebranch</div><div style=3D"color:rgb(0,=
0,0);font-family:Helvetica">Embedded Systems</div><div style=3D"color:rgb(0=
,0,0);font-family:Helvetica">Eindhoven, The Netherlands</div><a href=3D"htt=
p://www.sidebranch.com/" style=3D"color:rgb(17,85,204);font-family:Helvetic=
a" target=3D"_blank">http://www.sidebranch.com</a><div><br></div><div><img =
src=3D"http://www.sidebranch.nl/sites/default/files/images/unnamed.png" sty=
le=3D"color: rgb(0, 0, 0); font-family: Helvetica;"><br></div><div><br><div=
><br></div></div></div></div></div></div>

--000000000000ced8aa0576225e12--
