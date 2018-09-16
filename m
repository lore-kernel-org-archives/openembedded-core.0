Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 552F87487E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 14:22:55 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id m26-v6so9257168uap.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OxUbT1+CKOOeXUw/Zn1zWrhbKVsWJEKW+T12MxGwHbE=;
	b=GTTvBmxLQGVGztjHjKi1piVGdfI7EXwBKUmxLrJ43TOZzPPK9zlk+Bx5hgUzPLiDWY
	qnxUTIbT69M4Nxra9u5DZSn1eiNjvYE5LZO+u4RtSdu0rHNhmC3t0z06yQqPNgNrIqnm
	kVMquudBPVaSC4SjQFEMocc75Uq+sRHMS4lP8IDVCU9mwnyQC+4cGiWo9D0I3pawMDf5
	i67OPzB/Yk7jivifrw7xzCDJE71mDJZv/BBrWUA68cVJLcbqVUDhx6bGWWf7xGFmQVsE
	+uIHvSpJKVBz7f+5kVulrNTypXvOnWCM0ctRchmSgVLfMu9CKAO3jszEUeN645kv/qBs
	928A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OxUbT1+CKOOeXUw/Zn1zWrhbKVsWJEKW+T12MxGwHbE=;
	b=ofOrWgw+XVK5cixPzM/1YsrgtD5hipyzi5JmjF4t2PAhkdKQXrUSt4HDge9kCNWOs4
	MdcIDNYBYqG11IwfQtu2WkI1afG/6tZf7PWXAYBF/eG1yma7owwgX+vcLRIoEx06W2+j
	zBSZE5TxWkc7UwNzUAKW3IDnUpAzhNfql0eHBzoLta3t2vEhvMvsOFaX6zaGKzNt3qJy
	3r5UWjIxuJlqFVazNy2SZG8A0efuKLAW/Gl5884uOQyRErGlj74MBJPagryV8Gkw4vZs
	0Wzdvr8zhlQ2Q+BHD21/y4lGE7rHCqy6pgkzryYOeaO/c5HGBlxoPL9DnlUmxEr8PzB4
	Tqrw==
X-Gm-Message-State: APzg51Am06AHHSZN+EK3b3KVxVISumaMHdsj4aBW9a6lMO6Ugxov7mc0
	ea3gAcOxbkSWv1SpI4ZSPhkiH3eNpaNVaSvdm8Hk4ZxB
X-Google-Smtp-Source: ANB0VdbUDX76cn4TbdtlnnE477rXkaNccojgPnGBSmcS6z7PAi7PqT/nwCwShLL2fkjWNryUC2RGa+6BAfzW2R2S9d0=
X-Received: by 2002:ab0:59c2:: with SMTP id
	k2-v6mr6489386uad.124.1537107775946; 
	Sun, 16 Sep 2018 07:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
In-Reply-To: <CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Sep 2018 15:22:44 +0100
Message-ID: <CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
To: leon@sidebranch.com
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 16 Sep 2018 14:22:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan <alex.kiernan@gmail.com> wrot=
e:
>
> Hi Leon
>
> On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg <leon@sidebranch.com> w=
rote:
> >
> > Hi Alex,
> >
> > > On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
> > >
> > >> On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg <leon@sidebranch.c=
om> wrote:
> > >>
> > >> kernel-fitimage.bbclass replaces an occurance of "fitImage" in
> > >> KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
> > >> architecture (such as zImage). The kernel-fitimage.bbclass packs tha=
t
> > >> image as sub-image in a flattened image tree image (fitImage) and
> > >> deploys this fitImage along with the image tree source file (.its).
> > >>
> > >> kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
> > >> also contains "fitImage", which kernel.bbclass will also deploy
> > >> redundantly with different naming.
> > >>
> > >> The result is a dual deployment with slightly different naming,
> > >> each with a set of symlinks.
> > >>
> > >> The solution chosen is to have fitImage deployment be handled by
> > >> kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
> > >> types during deployment.
> > >>
> > >> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> > >
> > > This looks completely plausible, but the two "FIT" images that are
> > > installed aren't identical... after this I end up with no FIT image
> > > and only a bare image in the deploy dir.
> >
> > What was in your KERNEL_IMAGETYPES? Did it at least contain =E2=80=9Cfi=
tImage=E2=80=9D??
> >
>
> Yes, in fact only fitImage (and no initramfs).
>
> > > Digging into it, the logic between the two classes is a bit odd... in
> > > the case of a non initramfs build, the fitImage is actually installed
> > > here.
> >
> > If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99ld say =
ALL versions of a FIT image containing AT LEAST a Linux kernel are installe=
d by kernel-fitimage.
> >
> > > The one that's installed in kernel-fitimage is the bare
> > > linux.bin, but named fitImage-...
> >
> > which is totally broken. If you want the bare kernel binary (which nami=
ng depends on architecture, so it should NOT be hard-coded to linux.bin any=
way), you would need to specify that type *also* in KERNEL_IMAGETYPES, next=
 to =E2=80=9CfitImage=E2=80=9D.
>
> Totally agree...
>
> > >
> > > I'll send a patch reverting this and removing the other one as I'd
> > > agree that it appears to have no purpose (and if you did want it, I
> > > guess you could list it in KERNEL_IMAGETYPES).
> >
> > I=E2=80=99m sorry I cannot follow what this and the other one is, and i=
t. Let=E2=80=99s first understand all cases correctly.
> >
>
> Sorry I've not described it well... the code in
> kernel-fitimage.bbclass that inserts the kernel into the its happens
> here http://git.openembedded.org/openembedded-core/tree/meta/classes/kern=
el-fitimage.bbclass#n371
>
> fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_com=
p}"
>
> inside fitimage_emit_section_kernel we create a kernel section which
> has `data =3D /incbin/("${3}");` so linux.bin is our bare image.
>
> Then we have the installation of fitImage-linux-bin that happens here
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n495
>
> echo "Copying linux.bin file..."
> install -m 0644 ${B}/linux.bin
> ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
> ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
> ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
>
> i.e. the bare linux.bin file which we used to pack into the FIT image,
> not a fitImage.
>
> The output FIT image from kernel-fitimage.bbclass is created here
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n450
>
> uboot-mkimage \
> ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') els=
e ''} \
>   -f ${1} \
>   arch/${ARCH}/boot/${2}
>
> i.e. in arch/${ARCH}/boot/${2}
>
> It's that image which is then picked up by kernel.bbclass to install
> into deploydir (because KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"):
>
> for imageType in ${KERNEL_IMAGETYPES} ; do
>   # kernel-fitimage class deploys fitImages, skip here
>   if [ "$imageType" !=3D "fitImage" ]; then
>     base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
>     install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> $deployDir/${base_name}.bin
>   fi
> done
>
> Only it's doesn't because of the filter against fitImage.
>

To check I'm not seeing some strange artefact of our BSP or
linux-ti-staging (or any other layer we're using):

$ git clone git://git.yoctoproject.org/poky
$ cd poky
$ . oe-init-build-env
$ cat << EOF >> conf/local.conf
MACHINE =3D "beaglebone-yocto"
KERNEL_CLASSES +=3D " kernel-fitimage"
KERNEL_IMAGETYPES =3D "fitImage"
EOF
$ bitbake linux-yocto

The FIT images we then have:

$ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417203=
91_eba03655e8-r0-beaglebone-yocto-20180916134100.bin

And what is:

$ bitbake u-boot-mkimage-native -caddto_recipe_sysroot
$ oe-run-native u-boot-mkimage-native mkimage -l
tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417203=
91_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
Running bitbake -e u-boot-mkimage-native
GP Header: Size a0e1 LoadAddr a0e1

Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try again:

$ git revert c2d00e2f83cdf3d2923660448756ed29296a06a6
$ bitbake linux-yocto

This time there's two images:

$ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba0365=
5e8-r0-beaglebone-yocto-20180916141923.bin
tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417203=
91_eba03655e8-r0-beaglebone-yocto-20180916141923.bin

And what they are:

$ oe-run-native u-boot-mkimage-native mkimage -l
tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba0365=
5e8-r0-beaglebone-yocto-20180916141923.bin
Running bitbake -e u-boot-mkimage-native
FIT description: U-Boot fitImage for Poky (Yocto Project Reference
Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto
Created:         Sun Sep 16 14:14:47 2018
 Image 0 (kernel@1)
  Description:  Linux kernel
  Created:      Sun Sep 16 14:14:47 2018
  Type:         Kernel Image
  Compression:  uncompressed
  Data Size:    6381368 Bytes =3D 6231.80 KiB =3D 6.09 MiB
  Architecture: ARM
  OS:           Linux
  Load Address: 0x80008000
  Entry Point:  0x80008000
  Hash algo:    sha1
  Hash value:   909137524ffd28b5b0ac51ea39c648b09902dc18
 Image 1 (fdt@am335x-bone.dtb)
  Description:  Flattened Device Tree blob
  Created:      Sun Sep 16 14:14:47 2018
  Type:         Flat Device Tree
  Compression:  uncompressed
  Data Size:    33030 Bytes =3D 32.26 KiB =3D 0.03 MiB
  Architecture: ARM
  Hash algo:    sha1
  Hash value:   0fece12f15fc5ac6c452d9308cd374c2c0cfea47
 Image 2 (fdt@am335x-boneblack.dtb)
  Description:  Flattened Device Tree blob
  Created:      Sun Sep 16 14:14:47 2018
  Type:         Flat Device Tree
  Compression:  uncompressed
  Data Size:    34782 Bytes =3D 33.97 KiB =3D 0.03 MiB
  Architecture: ARM
  Hash algo:    sha1
  Hash value:   337f6843020cb8fbaf119b43fd748222d32e72df
 Image 3 (fdt@am335x-bonegreen.dtb)
  Description:  Flattened Device Tree blob
  Created:      Sun Sep 16 14:14:47 2018
  Type:         Flat Device Tree
  Compression:  uncompressed
  Data Size:    33286 Bytes =3D 32.51 KiB =3D 0.03 MiB
  Architecture: ARM
  Hash algo:    sha1
  Hash value:   4974e8b1656cd7f52829ac3c01f6747bece87cbc
 Default Configuration: 'conf@am335x-bone.dtb'
 Configuration 0 (conf@am335x-bone.dtb)
  Description:  1 Linux kernel, FDT blob
  Kernel:       kernel@1
  FDT:          fdt@am335x-bone.dtb
  Hash algo:    sha1
  Hash value:   unavailable
 Configuration 1 (conf@am335x-boneblack.dtb)
  Description:  0 Linux kernel, FDT blob
  Kernel:       kernel@1
  FDT:          fdt@am335x-boneblack.dtb
  Hash algo:    sha1
  Hash value:   unavailable
 Configuration 2 (conf@am335x-bonegreen.dtb)
  Description:  0 Linux kernel, FDT blob
  Kernel:       kernel@1
  FDT:          fdt@am335x-bonegreen.dtb
  Hash algo:    sha1
  Hash value:   unavailable
$ oe-run-native u-boot-mkimage-native mkimage -l
tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+73417203=
91_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
Running bitbake -e u-boot-mkimage-native
GP Header: Size a0e1 LoadAddr a0e1

--=20
Alex Kiernan

